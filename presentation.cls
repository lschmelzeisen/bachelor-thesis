\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{presentation}[2015/07/21 v1.0 Presentation]

\LoadClass[
  compress,
  xcolor=svgnames,
]{beamer}

% Packages =====================================================================

\newcommand*\RequireOptionsPackage[2][]{
  \PassOptionsToPackage{#1}{#2}
  \RequirePackage{#2}
}

% Input enconding
\RequirePackage{inputenc}

% Output encoding
\RequirePackage{fontenc}

% Latest LaTeX fixes
\RequirePackage{fixltx2e}

% Fix warnings with missing font shapes
\RequirePackage{textcomp}

% Internationalization
\RequirePackage{babel}

% Command helper library
\RequirePackage{xparse}

% Math
\RequirePackage{thesismath}

% Allow arbitrary font sizes
% http://tex.stackexchange.com/questions/58087/how-to-remove-the-warnings-font-shape-ot1-cmss-m-n-in-size-4-not-available
\RequirePackage{lmodern}

% Typographical enhancements
\RequirePackage{microtype}

% Palatino Font
\RequireOptionsPackage[
  osf, % old style efigures
  sc, % small caps
]{mathpazo}

% Eular Font for math
\RequireOptionsPackage[
  euler-digits
]{eulervm}

% Quotations
\RequirePackage[
  strict % Turn warnings into errors
]{csquotes}

% Style figure captions
\RequirePackage[bf]{caption}
\captionsetup{
  format = plain, % no hanging indent for captions
}

% Enable sub figures
\RequirePackage{subcaption}

% Pseudocode
\RequireOptionsPackage[
  noend % Omits end statements in algorithms
]{algpseudocode}
\RequirePackage{algorithm}

% Source Code Listings Listings
\RequirePackage{listings}

% References
\RequireOptionsPackage[
  backend = biber, % use biber as backend
  style = authoryear-comp,
  %style = alphabetic,
  maxbibnames = 10, % max number of names in bibliography
  maxcitenames = 2, % max number of names in text cite
  uniquelist = minyear, % only add more authors if year is not unique
  backref = true, % bibliography contains links to cite occurence
  backrefstyle = three+,
  doi = false, % do not show doi
  isbn = false, % do not show isbn
  url = false, % do not show url
  urldate = long, % format of urldate field
]{biblatex}

% PDF ==========================================================================

\pdfcompresslevel=9
\pdfadjustspacing=1

% Style ========================================================================

% Fonts
\usefonttheme{professionalfonts,serif,structuresmallcapsserif}
\linespread{1.05}

\usecolortheme[named=Maroon]{structure} % General theme color
\setbeamercolor{subtitle}{fg=black} % Make subtitle in titlepage-frame black
%\setbeamercolor{section in toc}{fg=black} % Make toc entries black
\hypersetup{ % color for links
  colorlinks,
  urlcolor = Maroon,
  linkcolor = Maroon,
  citecolor = Maroon,
}

% Number sections in toc
\setbeamertemplate{section in toc}[sections numbered]

% Use circles as itemize list items
\setbeamertemplate{itemize items}[circle]

% Disable navigation symbols in the bottom left
\beamertemplatenavigationsymbolsempty

% Add navigation bar on top, and author/title footline on the bottom
\useoutertheme[footline=authortitle, subsection=false]{miniframes}
\setbeamercolor{mini frame}{fg=Maroon!75} % Color of bullets in navigation bar
\addtobeamertemplate{headline}{}{ % Rule under navigation bar
  \hspace{0.02\paperwidth}\textcolor{black!75}{\rule{0.96\paperwidth}{0.2pt}}
}
\addtobeamertemplate{footline}{ % Rule above footline
  \hspace{0.02\paperwidth}\textcolor{black!75}{\rule{0.96\paperwidth}{0.2pt}}
}{}

% Show section title frame at the start of each section
\AtBeginSection{
  \begin{frame}[plain]
    \sectionpage
  \end{frame}}

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
  basicstyle = \small\ttfamily,
  %keywordstyle = \color{RoyalBlue},
  mathescape,
}
\renewcommand*{\thelstnumber}{\arabic{lstnumber}:}
\DeclareCaptionFormat{listing}{\hrule#1#2#3}
\captionsetup[lstlisting]{
  format = listing,
  labelfont = bf,
  singlelinecheck = off,
  labelsep = space,
}

% References ===================================================================

% last names before first names
% http://tex.stackexchange.com/questions/113573/biblatex-order-last-first-for-the-names-of-multiple-editors
\DeclareNameAlias{sortname}{last-first}
\DeclareNameAlias{default}{last-first}

\setlength\bibitemsep{0.8em} % vertical space between bibliography entries
\setlength\bibhang{1em} % indent after first line on bibliography entries

% Change bibliography heading to references
\DefineBibliographyStrings{american}{
  bibliography = {References},
}
