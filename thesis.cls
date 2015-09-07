\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2015/07/21 v1.0 Thesis]

% Options ======================================================================

\RequirePackage{ifthen}

\newcommand*\NewOption[2]{
  \newboolean{#2}
  \DeclareOption{#1}{\setboolean{#2}{true}}
}

\NewOption{m}{@gendermale}
\NewOption{f}{@genderfemale}
\DeclareOption{fm}{\setboolean{@gendermale}{true}
                   \setboolean{@genderfemale}{true}}
\NewOption{seminar}{@typeseminar}
\NewOption{bachelor}{@typebachelor}
\NewOption{master}{@typemaster}
\NewOption{date}{@date}
\NewOption{classicthesis}{@styleclassicthesis}
\NewOption{classicthesistitle}{@styleclassicthesistitle}

\DeclareOption*{
  \ClassWarning{thesis}{Unknown option '\CurrentOption'}
}

\ProcessOptions\relax

% Data =========================================================================

\newcommand*\authormail[1]{\def\@authormail{#1}}
\newcommand*\degreecourse[1]{\def\@degreecourse{#1}}
\newcommand*\firstreviewer[1]{\def\@firstreviewer{#1}}
\newcommand*\firstreviewerinfo[1]{\def\@firstreviewerinfo{#1}}
\newcommand*\secondreviewer[1]{\def\@secondreviewer{#1}}
\newcommand*\secondreviewerinfo[1]{\def\@secondreviewerinfo{#1}}

% Document Class ===============================================================

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
  ngerman, american,
]{scrreprt}

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

% Fix warnings when using KOMA with listings package
\RequirePackage{scrhack}

% Get marginpar right
\RequirePackage{mparhack}

% Internationalization
\RequirePackage{babel}

% Command helper library
\RequirePackage{xparse}

% Provides KOMA-Script headers and footers
\RequirePackage{scrpage2}

% Math
\RequireOptionsPackage[fleqn]{amsmath}
\RequirePackage{thesismath}

% Color
\RequireOptionsPackage[dvipsnames, svgnames, x11names]{xcolor}

% In paragraph enumerations
\RequirePackage{paralist}

% Table styling
\RequirePackage{booktabs}

% Change page layout
\RequirePackage[
  pass
]{geometry}

% Quotations
\RequirePackage[
  strict % Turn warnings into errors
]{csquotes}

% Style figure captions
\RequirePackage[bf]{caption}
\captionsetup{
  format = plain, % No hanging indent for captions
}

% Enable sub figures
\RequireOptionsPackage[
  labelfont = bf, % make (a) bold for subcaption
]{subcaption}

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
  pdftitle = {\@title},
  pdfauthor = {\@author},
  % try out what this does:
  pdfhighlight = /O,
}

% (load even after hyperref)
\RequireOptionsPackage[
  nameinlink, % link complete name, not just number
  noabbrev, % do not use abbreviations
]{cleveref}
% Add reference names for source code listings
\crefname{lstlisting}{listing}{listings}
\Crefname{lstlisting}{Listing}{Listings}
% Capitalize all references, regardless of command used.
% We use different commands, to allow easy switching.
\renewcommand*\cref{\Cref}

% PDF ==========================================================================

\pdfcompresslevel=9
\pdfadjustspacing=1

% Classicthesis style ==========================================================

\ifthenelse{\boolean{@styleclassicthesis}}{
  \RequireOptionsPackage[
    eulerchapternumbers, % use euler font for chapter numbers
    pdfspacing, % use pdftex letter spacing
    beramono, % use beramono font as typewriter font
    eulermath, % use euler font for math
    floatperchapter, % number floats per chapter not globally
    %dottedtoc, % align toc page numbers on the left (allows longer chapter titles)
  ]{classicthesis}
  \let\marginpar\oldmarginpar % fix todo boxes in margin

  \hypersetup{
    % colors for classicthesis
    %urlcolor = webbrown,
    %linkcolor = RoyalBlue,
    %citecolor = webgreen,
    urlcolor = Maroon,
    linkcolor = Maroon,
    citecolor = Maroon,
  }
}\relax

% Title ========================================================================

\newcommand*\monthword{%
  \ifcase\month%
    \or Januar%
    \or Februar%
    \or M{\"a}rz%
    \or April%
    \or Mai%
    \or Juni%
    \or Juli%
    \or August%
    \or September%
    \or Oktober%
    \or November%
    \or Dezember%
  \fi%
}

\newcommand*\@authormaillinked{%
  \texttt{\href{mailto:\@authormail}{\nolinkurl{\@authormail}}}%
}

\newcommand*\@thesislogos{%
  \begin{center}%
    %\renewcommand*\arraystretch{0.8}%
    \footnotesize%
    \begin{tabular}{c p{2.25cm} c}%
        \includegraphics[height=.9cm]{figures/uni-logo-color}%
      &&%
        \includegraphics[height=.9cm]{figures/institute-logo-color}%
      \\%
        \hspace{.71cm}%
        Fachbereich 4: Informatik%
      &&%
        Institute for Web Science%
      \\%
      &&%
        and Technologies%
    \end{tabular}%
    %\renewcommand*\arraystretch{1.0}% reset arraystretch to default
  \end{center}
}

\newcommand*\@thesistype[1][]{%
  \ifthenelse{\boolean{@typeseminar}}%
    {#1{Seminararbeit}}{%
  \ifthenelse{\boolean{@typebachelor}}%
    {#1{Bachelorarbeit}}{%
  \ifthenelse{\boolean{@typemaster}}%
    {#1{Masterarbeit}}%
    {>>SET TYPE (seminar, bachelor, or master) IN DOCUMENTCLASS OPTIONS <<}%
  }}%
}

\newcommand*\@thesispurpose{%
  \ifthenelse{\boolean{@typeseminar}}\relax{%
    zur Erlangung des Grades
    \ifthenelse{\boolean{@genderfemale} \and \boolean{@gendermale}}%
     {einer/eines}{%
    \ifthenelse{\boolean{@genderfemale}}%
      {einer}{%
    \ifthenelse{\boolean{@gendermale}}%
      {eines}%
      {>>SET GENDER (fm, f, or m) IN DOCUMENT CLASS OPTIONS <<}%
    }}
    \ifthenelse{\boolean{@typebachelor}}%
      {Bachelor of Science (B.~Sc.)}%
      {Master of Science (M.~Sc.)}%
    \\%
    im Studiengang \@degreecourse%
  }
}

\newcommand*\@thesisreviewertable{%
  \begin{tabular}{@{}ll@{}}%
  \ifthenelse{\boolean{@typeseminar}}{%
    Betreuer: & \@firstreviewer\\%
              & \@firstreviewerinfo\\[2.5mm]%
              & \@secondreviewer\\%
              & \@secondreviewerinfo%
  }{%
    Erstgutachter:  & \@firstreviewer\\%
                    & \@firstreviewerinfo\\[2.5mm]%
    Zweitgutachter: & \@secondreviewer\\%
                    & \@secondreviewerinfo%
  }%
  \end{tabular}%
}

\newcommand*\@thesisdateplace{%
  Koblenz,
  \ifthenelse{\boolean{@date}}%
    {\today}%
    {im \monthword\ \the\year}%
}

\ifthenelse{\boolean{@styleclassicthesis} \and \boolean{@styleclassicthesistitle}} {
  \renewcommand*\maketitle{
    \begin{titlepage}
      \begin{addmargin}[-1cm]{-3cm}
        \@thesislogos

        \vfill

        \begin{addmargin}{1cm}
          \begin{center}
            \fontsize{17}{19}\selectfont\textcolor{Maroon}{\spacedallcaps{\@title}}
          \end{center}
        \end{addmargin}

        \vfill

        \begin{center}
          \Large\@thesistype[\spacedallcaps]

          \ifthenelse{\boolean{@typeseminar}}\relax{
            \vspace{-0.35cm}\rule{5cm}{0.4pt}\\
            \normalsize\@thesispurpose
          }

          \vspace{0.75cm}

          \large{}vorgelegt von\\
          \Large\spacedlowsmallcaps{\@author}\\
          \normalsize\@authormaillinked
        \end{center}

        \vfill

        \@thesisreviewertable

        \vspace{2cm}

        \@thesisdateplace
      \end{addmargin}
    \end{titlepage}
  }
}{
  \renewcommand*\maketitle{
    \begin{titlepage}
      \ifthenelse{\boolean{@styleclassicthesis}}{
        \begin{addmargin}[-0.3cm]{-2.3cm}
        \vspace*{0.7cm}
      }\relax

      \@thesislogos

      \vspace*{1.75cm}

      \begin{center}
        \huge\textbf{\@title}

        \vspace{1.75cm}

        \huge\@thesistype

        \vspace{0.2cm}

        \normalsize\@thesispurpose

        \vspace{0.75cm}

        \large{}vorgelegt von\\
        \Large\@author\\
        \normalsize\@authormaillinked

        \ifthenelse{\boolean{@styleclassicthesis}}
          {\vspace{3.79cm}}
          {\vspace{2.89cm}}
      \end{center}

      \@thesisreviewertable

      \vspace{2cm}

      \@thesisdateplace
    \ifthenelse{\boolean{@styleclassicthesis}}{
      \end{addmargin}
    }\relax
    \end{titlepage}
  }
}

% Statement ====================================================================

\newcommand*\makestatement{
% \begin{titlepage}
%   \begin{flushleft}
%   \begin{addmargin}[-1cm]{-3cm}
%     \begin{Large}
%       \noindent
%       Erkl{\"a}rung\\[5mm]
%     \end{Large}
    \chapter*{Erkl{\"a}rung}

    \noindent
    Hiermit best\"atige ich, dass die vorliegende Arbeit von mir selbstst\"andig
    verfasst wurde und ich keine anderen als die angegebenen Hilfsmittel --
    insbesondere keine im Quellenverzeichnis nicht benannten Internet-Quellen --
    benutzt habe und die Arbeit von mir vorher nicht in einem anderen
    Pr\"ufungsverfahren eingereicht wurde. Die eingereichte schriftliche Fassung
    entspricht der auf dem elektronischen Speichermedium (CD-Rom).

    \begin{center}
      \begin{tabular}{l p{0.5cm} cc}
                                                            & {} & Ja & Nein\\[.5cm]
        Mit der Einstellung dieser Arbeit in die Bibliothek & {} & {} & {}\\
        bin ich einverstanden.                              & {} & $\square$ & $\square$\\[.5cm]
        Der Ver\"offentlichung dieser Arbeit im Internet    & {} & {} & {}\\
        stimme ich zu.                                      & {} & $\square$ & $\square$\\[.5cm]
        Der Text dieser Arbeit ist unter einer Creative     & {} & {} & {}\\
        Commons Lizenz (CC BY-SA 3.0) verf\"ugbar.          & {} & $\square$ & $\square$\\[.5cm]
        Der Quellcode ist unter einer Creative Commons      & {} & {} & {}\\
        Lizenz (CC BY-SA 3.0) verf\"ugbar.                  & {} & $\square$ & $\square$\\[.5cm]
        Die erhobenen Daten sind unter einer Creative       & {} & {} & {}\\
        Commons Lizenz (CC BY-SA 3.0) verf\"ugbar.          & {} & $\square$ & $\square$\\
      \end{tabular}
    \end{center}

    \vspace{1.5cm}

    \begin{small}
      \noindent
      \dotfill\\
      \hspace*{0.1cm}(Ort, Datum)\hfill(Unterschrift)%
    \end{small}
%     \end{addmargin}
%   \end{flushleft}
% \end{titlepage}
}

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
% Align chapters with and without number
\ifthenelse{\boolean{@styleclassicthesis}}{
  \renewcommand*\tocEntry[1]{%
    \hspace{1.45em}%
    \oldtocEntry{#1}%
  }
}{
  \renewcommand*\tocEntry[1]{%
    \hspace{1.0em}%
    \oldtocEntry{#1}%
  }
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
