Hi


This is an automated email to let you know about the upcoming release of {{{my_package}}} (version {{{my_version}}}), which will be submitted to CRAN on {{{ date }}}. To check for potential problems, I ran `R CMD check` on your package {{{your_package}}} (version {{{your_version}}}).

I found: {{{your_summary}}}{{#you_have_problems}}, see detailed results at the end of the message{{/you_have_problems}}.

{{#you_cant_install}}My apologies: I couldn't install your package. Please run the checks on {{{your_package}}} with the development version of {{{my_package}}}.

{{/you_cant_install}}
{{^you_cant_install}}Regardless of the results, chances are great the the DBI update doesn't break {{{your_package}}}: I ran the checks with both the current CRAN version of {{{ my_package }}} and the release candidate, and the results were identical.

{{/you_cant_install}}

To get the development version of {{{ my_package }}} so you can run the checks yourself, you can run:

    # install.packages("devtools")
    devtools::install_github("{{my_github}}")

To see what's changed, visit <https://github.com/{{{my_github}}}/blob/master/NEWS.md>.

If you have any questions about this email, please feel free to respond directly.


Regards

{{{ me }}}
{{#you_have_problems}}




{{{your_results}}}
{{/you_have_problems}}
