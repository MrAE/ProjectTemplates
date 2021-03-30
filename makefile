LATEX = pdflatex
TEX = report_w_logo
BEAMER = dailySlides_wLogo
BIBTEX = bibtex
LOGO = logo
LOGOBIG = logoBig
LOGOW = logoWhite
LATEXIT = latexit
#INDEX = makeindex

default: $(TEX).tex 
	$(LATEX) --shell-escape $(LOGO).tex;
	$(LATEX) --shell-escape $(LOGOBIG).tex;
	$(LATEX) --shell-escape $(LOGOW).tex;
	$(LATEX) --shell-escape $(LATEXIT).tex;
	$(LATEX) $(BEAMER).tex;
	$(LATEX) $(TEX); $(BIBTEX) $(TEX); $(LATEX) $(TEX); $(LATEX) $(TEX);
	#$(INDEX) $(TEX);
	$(RM) -f  *.blg *.dvi *.log *.toc *.lof *.lot *.cb *.bbl *.brf *.out *.aux *_aux $(TEX).ps 
	open $(TEX).pdf &

view: $(TEX).tex 
	$(LATEX) $(TEX); $(BIBTEX) $(TEX); $(LATEX) $(TEX); $(LATEX) $(TEX)
	open $(TEX).pdf &

clean:
	$(RM) -f *.aux *.blg *.dvi *.log *.toc *.lof *.lot *.cb *.bbl $(TEX).ps $(TEX).pdf *~ *.project.vim

check:
	@echo "Passing the check will cause make to report Error 1."
	$(LATEX) $(TEX)  | grep -i undefined
