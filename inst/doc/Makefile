SRC = DBI.tex biblio.bib 

.PHONY: clobber clean 

DBI.pdf: DBI.ps
	distill DBI.ps || ps2pdf DBI.ps 

DBI.ps: DBI.dvi
	dvips -o DBI.ps DBI.dvi
	# need to clean up "dirty" bookmark
	sed 's/PD1OT1ptmptmmmnn//' DBI.ps > DBI-tmp.ps && mv DBI-tmp.ps DBI.ps

DBI.dvi: $(SRC)
	latex DBI  && \
	bibtex DBI && \
	latex DBI  && \
        latex DBI

clean:
	rm -rf *.aux *.log

clobber:
	rm -rf *.aux *.dvi 
