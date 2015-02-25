#include <Rcpp.h>
using namespace Rcpp;

#include "sqldelim.h"
#include <assert.h>
#include <ctype.h>
#include <iostream>

QuoteSpec::QuoteSpec(char startChar, char endChar, char escapeChar, char doubleEscape) :
	startChar(startChar), endChar(endChar), escapeChar(escapeChar), doubleEscape(doubleEscape) {
}

CommentSpec::CommentSpec(const std::string& startStr, const std::string& endStr, bool endStrRequired) :
	startStr(startStr), endStr(endStr), endStrRequired(endStrRequired) {
}


namespace {
	template <class T>
	bool hasPrefix(T begin, T end, const std::string& prefix) {
		if (prefix.size() == 0) {
			return false;
		}

		if (end - begin < prefix.size()) {
			return false;
		}
		for (size_t i = 0; i < prefix.size(); i++) {
			if (*(begin + i) != prefix[i]) {
				return false;
			}
		}
		return true;
	}

	template <class T>
	bool findQuoteEnd(T begin, T end, const QuoteSpec& quoteSpec, T *regionEnd) {
		T pos = begin;

		// Assert that the quoted region starts with the character we
		// expect. If not, we were called in error.
		assert(*pos == quoteSpec.startChar);
		pos++;

		const int STATE_NORMAL = 0;
		const int STATE_ESCAPE = 1;
		const int STATE_DOUBLE = 2;
		int state = STATE_NORMAL;

		for (; pos != end; pos++) {
			switch (state) {
			case STATE_NORMAL:
				if (*pos == quoteSpec.endChar) {
					if (quoteSpec.doubleEscape) {
						state = STATE_DOUBLE;
					} else {
						*regionEnd = pos + 1;
						return true;
					}
				} else if (*pos == quoteSpec.escapeChar) {
					state = STATE_ESCAPE;
				}
				break;
			case STATE_ESCAPE:
				state = STATE_NORMAL;
				break;
			case STATE_DOUBLE:
				if (*pos == quoteSpec.endChar) {
					state = STATE_NORMAL;
				} else {
					*regionEnd = pos;
					return true;
				}
				break;
			default:
				assert(false);
				return false;
			}
		}

		if (state == STATE_DOUBLE) {
			*regionEnd = end;
			return true;
		}

		return false;
	}

	template <class T>
	bool findCommentEnd(T begin, T end, const CommentSpec& commentSpec, T *regionEnd) {
		for (; begin != end; begin++) {
			if (hasPrefix(begin, end, commentSpec.endStr)) {
				*regionEnd = begin + commentSpec.endStr.size();
				return true;
			}
		}

		if (commentSpec.endStrRequired) {
			return false;
		} else {
			*regionEnd = end;
			return true;
		}
	}

	size_t whichQuote(char c, const QuoteSpecs& quoteSpecs) {
		for (size_t i = 0; i < quoteSpecs.size(); i++) {
			if (c == quoteSpecs[i].startChar) {
				return i;
			}
		}
		return -1;
	}

	template <class T>
	size_t whichComment(T begin, T end, const CommentSpecs& commentSpecs) {
		for (size_t i = 0; i < commentSpecs.size(); i++) {
			if (hasPrefix(begin, end, commentSpecs[i].startStr)) {
				return i;
			}
		}
		return -1;
	}
}

ParseResult parseQuery(const std::string& query, const QuoteSpecs& quoteSpecs,
	const CommentSpecs& commentSpecs) {

	Regions regions;

	for (std::string::const_iterator it = query.begin();
	     it != query.end();
	     it++) {

		// Check each character to see if it starts a quoted region
		size_t qi = whichQuote(*it, quoteSpecs);
		if (qi != -1) {
			// It's a quoted region! Find where it ends
			std::string::const_iterator regionEnd;
			if (!findQuoteEnd(it, query.end(), quoteSpecs[qi], &regionEnd)) {
				// Report error and exit
				return ParseResult("Unterminated literal", it - query.begin());
			} else {
			  it = regionEnd; it--;
			  continue;
			}
		}

		size_t ci = whichComment(it, query.end(), commentSpecs);
		if (ci != -1) {
			// It's a comment; find where it ends
			std::string::const_iterator regionEnd;
			if (!findCommentEnd(it, query.end(), commentSpecs[ci], &regionEnd)) {
				// Report error and exit
				return ParseResult("Unterminated comment", it - query.begin());
			} else {
				it = regionEnd; it--;
			  continue;
			}
		}

		// Is this a variable?
		if (*it == '?') {
		  if (it + 1 == query.end())
		    return ParseResult("Length 0 variable", it - query.begin());

		  size_t start = it - query.begin();

		  it++;
		  while (it != query.end() && (isalnum(*it) || *it == '_' || *it == '.'))
		    it++;

		  it--;
		  Region region;
		  region.startOffset = start;
		  region.length = (it - query.begin()) - start + 1;
		  regions.push_back(region);

		  continue;
		}
	}

	return ParseResult(regions);
}

//' @export
//' @rdname sqlParseVariables
//' @param sql SQL to parse (a character vector of length 1)
//' @param quotes A list of \code{QuoteSpec} calls defining the quoting
//'   specification.
//' @param comments A list of \code{CommentSpec} calls defining the commenting
//'   specification.
// [[Rcpp::export]]
List sqlParseVariablesImpl(std::string sql, ListOf<List> quotes, ListOf<List> comments) {
  if (sql.size() == 0) {
    return List::create(
      _["start"] = IntegerVector(0),
      _["end"] = IntegerVector(0)
    );
  }

  QuoteSpecs quoteSpecs;
  for (int i = 0; i < quotes.size(); ++i) {
    List quote = quotes[i];

    quoteSpecs.push_back(QuoteSpec(
        as<std::string>(quote[0])[0],
        as<std::string>(quote[1])[0],
        as<std::string>(quote[2])[0],
        as<bool>(quote[3])
    ));
  }

  CommentSpecs commentSpecs;
  for (int i = 0; i < comments.size(); ++i) {
    List comment = comments[i];

    commentSpecs.push_back(CommentSpec(
        as<std::string>(comment[0]),
        as<std::string>(comment[1]),
        as<bool>(comment[2])
    ));
  }

  ParseResult result = parseQuery(sql, quoteSpecs, commentSpecs);

  if (!result.success) {
    std::stringstream err;
    err << result.errorMessage << " (pos: " << result.errorOffset << ")";
    stop(err.str());
  }

  // Convert result into list
  Regions regions = result.regions;
  int n = regions.size();
  IntegerVector start(n), end(n);

  for (int i = 0; i < n; ++i) {
    Region reg = regions[i];

    start[i] = reg.startOffset + 1;
    end[i] = reg.startOffset + 1 + reg.length - 1; // -1 because string indexing is inclusive in R
  }
  return List::create(
    _["start"] = start,
    _["end"] = end
  );
}

