#include <string>
#include <vector>

struct QuoteSpec {
	char startChar;
	char endChar;
	char escapeChar;
	bool doubleEscape;

	QuoteSpec(char startChar, char endChar, char escapeChar, char doubleEscape);
};

struct CommentSpec {
	std::string startStr;
	std::string endStr;
	bool endStrRequired;

	CommentSpec(const std::string& startStr, const std::string& endStr, bool endStrRequired);
};

struct Region {
	int startOffset;
	int length;
};

typedef std::vector<QuoteSpec> QuoteSpecs;
typedef std::vector<CommentSpec> CommentSpecs;
typedef std::vector<Region> Regions;

struct ParseResult {
	bool success;
	Regions regions;
	std::string errorMessage;
	size_t errorOffset;

	ParseResult(const std::string& error, size_t pos) :
		success(false), errorMessage(error), errorOffset(pos) {
	}

	ParseResult(const Regions& regions) :
		success(true), regions(regions) {
	}
};

ParseResult parseQuery(const std::string& query, const QuoteSpecs& quoteSpecs);
