This is the repository of the source code for the text of the bachelor thesis
of Lukas Schmelzeisen. The code of the toolkit used for evaluation can be found
at: https://github.com/renepickhardt/generalized-language-modeling-toolkit

To build this execute:

    latexmk -pdf thesis

If you don't have `latexmk` you can also do:

    pdflatex thesis
    biber thesis
    pdflatex thesis  # repeat this until LaTeX no longer ask you to rebuilt.