\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2005/05/31 v1.0 Thesis]

% ==============================================================================
\LoadClass[
  twoside,
  openright,
  titlepage,
  numbers = noenddot,
  headsepline,
  cleardoublepage = empty,
  BCOR = 5mm,
  a4paper, paper = a4,
  11pt, fontsize = 11pt,
  ngerman,
  american,
]{scrreprt}

\newcommand*\RequireOptionsPackage[2][]{
  \PassOptionsToPackage{#1}{#2}
  \RequirePackage{#2}
}

% ==============================================================================

% Input enconding
\RequirePackage{inputenc}

% Output encoding
\RequirePackage{fontenc}

% Latest LaTeX fixes
\RequirePackage{fixltx2e}

% Command helper library
\RequirePackage{xparse}

% to get spacing after macros right
\RequirePackage{xspace}

% Provides KOMA-Script headers and footers
\RequirePackage{scrpage2}

% Add many text symbols
\RequirePackage{textcomp}

% Math
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{thesismath}

% Color
\RequireOptionsPackage[dvipsnames,svgnames,x11names]{xcolor}

% Quotations
\RequirePackage{csquotes}

% Style figure captions
\RequirePackage{caption}

% Pseudocode
\RequireOptionsPackage[
  noend % Omits end statements in algorithms
]{algpseudocode}
\RequireOptionsPackage[
  chapter % Have algorithm numbering per chapter
]{algorithm}

% Source Code Listings Listings
\RequirePackage{listings}

% References
\RequireOptionsPackage[
  backend = biber, % use biber as backend
  style = authoryear-comp,
  %style = alphatic,
  maxbibnames = 10, % max number of names in bibliography
  maxcitenames = 2, % max number of names in text cite
  backref = true, % bibliography contains links to cite occurence
  backrefstyle = three+,
  doi = false, % do not show doi
  isbn = false, % do not show isbn
  url = false, % do not show url
]{biblatex}

% Appendix
\RequireOptionsPackage[
  toc % show appendix entry in toc
]{appendix}

% (include last as it redefines a lot of commands)
\RequireOptionsPackage[pdftex]{hyperref}
\hypersetup{
  unicode = true, % enable unicode
  colorlinks = true, % color links, not box around the link
  linktocpage = true, % in toc link page numbers, not text
  breaklinks = true, % links across line boundaries
  pdftitle = {\ThesisTitle},
  pdfauthor = {\ThesisName},
  % try out what this does:
  pdfhighlight = /O,
  % colors for classicthesis
  urlcolor = webbrown,
  linkcolor = RoyalBlue,
  citecolor = webgreen,
}

% (load even after hyperref)
\RequireOptionsPackage[
  nameinlink, % link complete name, not just number
  noabbrev, % do not use abbreviations
]{cleveref}
% Add reference names for listings
\crefname{lstlisting}{listing}{listings}
\Crefname{lstlisting}{Listing}{Listings}
% Capitalize all reference, regardless of command used.
% We use different commands, to allow easy switching.
\renewcommand*\cref{\Cref}

% PDF ==========================================================================

\pdfcompresslevel=9
\pdfadjustspacing=1

% Classicthesis style ==========================================================

\RequireOptionsPackage[
  eulerchapternumbers, % use euler font for chapter numbers
  pdfspacing, % use pdftex letter spacing
  beramono, % use beramono font as typewriter font
  eulermath, % use euler font for math
  floatperchapter, % number floats per chapter not globally
  %dottedtoc, % align toc page numbers on the left (allows longer chapter titles)
]{classicthesis}
\let\marginpar\oldmarginpar % fix todo boxes in margin

% incase classisthesis is absent
\definecolor{webgreen}{rgb}{0.0, 0.5, 0.0}
\definecolor{webbrown}{rgb}{0.6, 0.0, 0.0}

% Maketitle ====================================================================

%\renewcommand*\maketitle{
%  \begin{titlepage}
%    \@title
%
%    \@author
%  \end{titlepage}
%  \cleardoublepage
%}

% Abstract =====================================================================

\newenvironment*{abstractpage}{
  \cleardoublepage
  \let\clearpage\relax
  \let\cleardoublepage\relax
}{
}
\renewenvironment*{abstract}{
  \chapter*{\abstractname}
}{
  \vfill
}

% Table of Contents ============================================================

\providecommand*\tocEntry[1]{#1}
\let\oldtocEntry\tocEntry
\renewcommand*\tocEntry{%
  \hspace{1.5em}% Align chapters with and without number
  \oldtocEntry%
}

% Pseudocode ===================================================================

\renewcommand{\algorithmicrequire}{\textbf{Input:}} % change "Require" to "Input"
\renewcommand{\algorithmicensure}{\textbf{Output:}} % change "Ensure" to "Output'

% Make comments gray
\definecolor{comment}{rgb}{0.4, 0.4, 0.4}
\algrenewcomment[1]{
  \hfill\textcolor{comment}{\(\triangleright\) #1}
}

% Add single line comment
% http://tex.stackexchange.com/questions/74880/algorithmicx-package-comments-on-a-single-line
\algnewcommand{\LineComment}[1]{
  \State \textcolor{comment}{\(\triangleright\) #1}
}

% Source Code Listings =========================================================

% Make listings look like algorithms
% http://tex.stackexchange.com/questions/73392/how-to-make-lstlisting-look-exactly-like-the-algorithm-environment
\lstset{
  numbers = left,
  numbersep = 5pt,
  xleftmargin = 20pt,
  frame = tb,
  framexleftmargin = 20pt,
  basicstyle = \small,
  mathescape,
}
\renewcommand*{\thelstnumber}{\arabic{lstnumber}:}

% needs package "caption"
\DeclareCaptionFormat{listing}{\hrule#1#2#3}
\captionsetup[lstlisting]{
  format = listing,
  labelfont = bf,
  singlelinecheck = off,
  labelsep = space,
}

% References ===================================================================

\setlength\bibitemsep{0.8em} % vertical space between bibliography entries
\setlength\bibhang{1em} % indent after first line on bibliography entries

% Change bibliography heading to references
\DefineBibliographyStrings{american}{
  bibliography = {References},
}

% Apply classicthesis style to toc entry ofbilbiography
\defbibheading{bibintoc}[\bibname]{%
  \chapter*{#1}%
  \addcontentsline{toc}{chapter}{\tocEntry{#1}}%
  \markboth{\MakeUppercase{#1}}{\MakeUppercase{#1}}%
}

\let\oldprintbibliography\printbibliography
\renewcommand*\printbibliography{%
  \oldprintbibliography[heading = bibintoc]% add entry in toc
}

% Appendix =====================================================================

% Apply classicthesis style to toc entry of appendix
\renewcommand*\appendixtocname{\tocEntry{Appendix}}

% Define new cref type for appendix-chapters
\crefname{appchapter}{appendix}{appendices}

\let\oldappendices\appendices
\renewcommand\appendices{%
  \oldappendices%
  %
  % To get references to appendix-chapters right
  \crefalias{chapter}{appchapter}%
}
