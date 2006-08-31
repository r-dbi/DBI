S_SRC= setup.R DBI.R Util.R zzz.R

All.R: $(S_SRC)
	cat $(S_SRC) > All.R

tags: $(S_SRC)
	rtags.py $(S_SRC) > tags

NAMESPACE: $(S_SRC)
	S4exports.py $(S_SRC) > NAMESPACE
