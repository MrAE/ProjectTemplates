
xelatex template_background.beamer.tex & \ 
	convert -density 300 template_background.pdf template_background.png

xelatex background001.beamer.tex & \ 
	convert -density 1200 background001.beamer.pdf background001.png

xelatex background002.beamer.tex & \ 
	convert -density 1200 background002.beamer.pdf background002.png
