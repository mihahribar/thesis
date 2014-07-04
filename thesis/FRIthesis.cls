%%
%% This is file `FRIreport.cls'
%%
%% Originaly based on 'book.cls' 2005/09/16 v1.4f Standard LaTeX document class
%% generated from file(s) of the LaTeX base system.
%% --------------------------------------------------------------
%%
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3b
%% of this license or (at your option) any later version.
%%
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{FRIthesis}[2012/10/10 v0.7 FRI LaTeX thesis class]
%
% TODO:
% - translate copyright + metadata
%

\newif\if@restonecol \@twocolumnfalse
\newif\if@titlepage \@titlepagetrue
\newif\if@openright \@openrighttrue
\newif\if@mainmatter \@mainmattertrue
\newif\if@slovene \@slovenefalse
\newif\if@forreview \@forreviewfalse
\newif\if@notes \@notesfalse
\newif\if@BVSRI \@BVSRIfalse
\newif\if@BUNRI \@BUNRIfalse
\newif\if@BUNRM \@BUNRMfalse
\newif\if@BSc \@BScfalse
\newif\if@MSc \@MScfalse
\newif\if@PhD \@PhDfalse
\newif\if@PhDp \@PhDpfalse
\newif\if@Presern \@Presernfalse

\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{forreview}{\@forreviewtrue}
\DeclareOption{notes}{\@notestrue}
\DeclareOption{slovene}{\@slovenetrue}
\DeclareOption{english}{\@slovenefalse}
\DeclareOption{BVSRI}{\@BVSRItrue \@BUNRIfalse\@BUNRMfalse\@BScfalse\@MScfalse\@PhDfalse \@PhDpfalse \@Presernfalse \@titlepagetrue}
\DeclareOption{BUNRI}{\@BVSRIfalse \@BUNRItrue \@BUNRMfalse\@BScfalse\@MScfalse\@PhDfalse \@PhDpfalse \@Presernfalse \@titlepagetrue}
\DeclareOption{BUNRM}{\@BVSRIfalse\@BUNRIfalse \@BUNRMtrue \@BScfalse\@MScfalse\@PhDfalse \@PhDpfalse \@Presernfalse \@titlepagetrue}
\DeclareOption{BSc}{\@BVSRIfalse\@BUNRIfalse\@BUNRMfalse \@BSctrue \@MScfalse\@PhDfalse \@PhDpfalse \@Presernfalse \@titlepagetrue}
\DeclareOption{MSc}{\@BVSRIfalse\@BUNRIfalse\@BUNRMfalse\@BScfalse \@MSctrue \@PhDfalse \@PhDpfalse \@Presernfalse \@titlepagetrue}
\DeclareOption{PhD}{\@BVSRIfalse\@BUNRIfalse\@BUNRMfalse\@BScfalse\@MScfalse \@PhDtrue \@PhDpfalse \@Presernfalse \@titlepagetrue}
\DeclareOption{PhDp}{\@BVSRIfalse\@BUNRIfalse\@BUNRMfalse\@BScfalse\@MScfalse \@PhDfalse \@PhDptrue \@Presernfalse \@titlepagefalse \@twosidefalse \@mparswitchfalse}
\DeclareOption{Presern}{\@BVSRIfalse\@BUNRIfalse\@BUNRMfalse\@BScfalse\@MScfalse\@PhDfalse \@PhDpfalse \@Preserntrue \@titlepagetrue}
\ExecuteOptions{twoside,slovene,BSc}
\ProcessOptions

\RequirePackage{ifpdf}
\RequirePackage[utf8]{inputenc}
\if@slovene
 \RequirePackage[slovene]{babel}
\else
 \RequirePackage[english]{babel}
\fi
\ifpdf
  \RequirePackage[pdftex]{color}
\else
  \RequirePackage[dvipdfm]{color}
\fi
\RequirePackage{xcolor}
\definecolor{grey65}{cmyk}{0,0,0,.65}
\definecolor{grey50}{cmyk}{0,0,0,.5}
\definecolor{grey40}{cmyk}{0,0,0,.4}
\definecolor{grey20}{cmyk}{0,0,0,.2}
\definecolor{grey05}{cmyk}{0,0,0,.05}
\definecolor{PCG3M}{cmyk}{0.20,0.15,0.14,0}
\definecolor{PCG9M}{cmyk}{0.48,0.39,0.37,0.03}
\definecolor{P654M}{cmyk}{1,0.87,0.32,0.19}
\definecolor{P1797}{cmyk}{0,0.94,0.94,0.06}

\RequirePackage{anysize,layout,amsthm}
\RequirePackage{boxedminipage}
\RequirePackage{pdftexcmds}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{numprint}
\if@slovene
 \npdecimalsign{,}
\fi
\RequirePackage{graphicx}
\ifpdf
  \RequirePackage{epstopdf}
\fi

\setlength\overfullrule{0pt}

\input{bk10.clo}

\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}

% define makro for singlelinespacing
\newcommand{\setsinglelinespacing}{\setlength{\baselineskip}{.67\baselineskip}}

% create a sidenote with text #2 referencing #1
\newcommand{\sidecmnt}[2]{\if@notes{{\color{grey65}{#1}\normalcolor}\marginpar{\raggedright\hspace{0pt}\tiny\color{P1797}{\sf #2}\normalcolor}}\else{#1}\fi}
\newcommand{\cmnt}[1]{\if@notes{\color{grey65}{#1}\normalcolor}\else{}\fi}

% define page styles
\def\cleardoublepage{
 \clearpage
 \if@twoside
  \ifodd
   \c@page
  \else
   \hbox{}\thispagestyle{empty}
   \newpage
   \if@twocolumn
    \hbox{}
    \thispagestyle{empty}
    \newpage
   \fi
  \fi
 \fi
}
\def\ps@plain{
  \ps@empty
  \if@forreview
   \def\@oddfoot{\hfil\normalfont\scriptsize\thepage\hfil\sffamily\scriptsize\today}
  \else
   \def\@oddfoot{\hfil\normalfont\scriptsize\thepage\hfil}
  \fi
  \let\@evenfoot\@oddfoot
}

\def\ps@headings{
   \if@forreview
    \def\@oddfoot{\hfil\sffamily\scriptsize\today}
   \else
    \let\@oddfoot\@empty
   \fi
   \let\@evenfoot\@oddfoot
   \def\@evenhead{\thepage\hfil{\small\scshape\leftmark}\hfil}%
   \def\@oddhead{\hfil{\small\scshape\rightmark}\hfil\thepage}%
   \let\@mkboth\markboth
   \def\chaptermark##1{%
    \markboth {{%
     \ifnum \c@secnumdepth >\m@ne
      \thechapter \ %
     \fi
     ##1}}{}}%
   \def\sectionmark##1{%
    \markright {{%
     \ifnum \c@secnumdepth >\z@
      \thesection \ %
     \fi
     ##1}}}
}

\def\ps@proposal{
   \if@forreview
    \def\@oddfoot{\hfil\sffamily\scriptsize\today}
   \else
    \let\@oddfoot\@empty
   \fi
   \let\@evenfoot\@oddfoot
   \def\@evenhead{\thepage\hfil{\small\scshape\leftmark}\hfil}%
   \def\@oddhead{\hfil{\small\scshape\rightmark}\hfil\thepage}%
   \let\@mkboth\markboth
}

% define titlepage
\if@titlepage
\newcommand\maketitle{
 \begin{titlepage}%
	\begin{centering}
   {\Large \setsinglelinespacing
 		\if@slovene
 		 Univerza v Ljubljani
 		\else
 		 Univesity of Ljubljana
 		\fi
	  \par}
	 {\large \setsinglelinespacing
		\if@slovene
		 Fakulteta za računalništvo in informatiko
		\else
		 Faculty of Computer and Information Science
		\fi
    \par}
	 \vfill
   {\Large \@author} \\
   \vspace{5mm}
   {\LARGE\bfseries\setsinglelinespacing
    \begingroup
    \color{P1797}
    \@title
    \endgroup
    \par}
   \vspace*{10mm}
   {\scshape
    \setsinglelinespacing
    \if@slovene
     \if@BVSRI diplomsko delo \\ visokošolski strokovni študijski program prve stopnje \\ računalništvo in informatika\fi
     \if@BUNRI diplomsko delo \\ univerzitetni študijski program prve stopnje \\ računalništvo in informatika\fi
     \if@BUNRM diplomsko delo \\ univerzitetni študijski program prve stopnje \\ računalništvo in matematika\fi
     \if@BSc diplomska naloga \\ na univerzitetnem študiju\fi
     \if@MSc magistrska naloga\fi
     \if@PhD doktorska disertacija\fi
    \else
     \if@BVSRI diplomsko delo \\ visokošolski strokovni študijski program prve stopnje \\ računalništvo in informatika\fi
     \if@BUNRI diplomsko delo \\ univerzitetni študijski program prve stopnje \\ računalništvo in informatika\fi
     \if@BUNRM diplomsko delo \\ univerzitetni študijski program prve stopnje \\ računalništvo in matematika\fi
     \if@BSc diplomska naloga \\ na univerzitetnem študiju\fi
     \if@MSc magistrska naloga\fi
     \if@PhD doctoral dissertation \fi
    \fi
    \par}
   \vfill
   {\setsinglelinespacing
    \ifx\@advisor\empty
     \relax
    \else
     \@advisor\\
    	{\small \sc
    	 \if@slovene
  			mentor
 			 \else
  			advisor
 			\fi
 			}
 			\par
 		\fi
    \ifx\@coadvisor\empty
     \relax
    \else
     \vspace{3mm}
     \@coadvisor\\
    	{\small \sc
    	 \if@slovene
  			somentor
 			 \else
  			coadvisor
 			\fi
 			}
 		 \par
 		\fi
 		}
   \vspace*{10mm}
   {\setsinglelinespacing
    \@place, \oldstylenums{\number\year}
    \par}
   \end{centering}
   \cleardoublepage
  \end{titlepage}%
  \setcounter{footnote}{0}%
}
\else
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
%      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
}
\def\@maketitle{%
  \newpage
  \begin{center}%
    \let \footnote \thanks
    {\normalsize \setsinglelinespacing
		  \if@slovene
       Univerza v Ljubljani
      \else
       University of Ljubljana
      \fi
		  \par}
		 {\small \setsinglelinespacing
       \if@slovene
        Fakulteta za računalništvo in informatiko
       \else
        Faculty of Computer and Information Science
       \fi
		  \par}
		 \vspace{3mm}
		 {\setsinglelinespacing
		  \large \@author
		  \par}
     \vspace{5mm}
     {\large\sffamily\bfseries
        \setsinglelinespacing
         \color{P1797}\@title\normalcolor
        \par}
     \vspace{3mm}
%     {\large\sffamily%\itshape
 %       \setsinglelinespacing
 %        %\color{P1797}\@titleA\normalcolor
%        \@titleA
%        \par}
%     \vspace{4mm}
     \if@slovene
      {\scshape\setsinglelinespacing
       predlog teme doktorske disertacije
       \par}
     \else
      {\scshape\setsinglelinespacing
       a dissertation proposal submitted in partial fulfilment of the requirements for the degree of Doctor of Philosophy
       \par}
     \fi
     \vspace{3mm}
     {\bfseries\ttfamily \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi

% define copyright
\newcommand\makecopyright[1][-]{
		\if@openright\cleardoublepage\else\clearpage\fi
%    \edef\@copyright{\uppercase{#1}}
    \thispagestyle{plain}%
		\vspace*{\fill}
    \ifnum\pdf@strcmp{#1}{-}=\z@
     {\small
      \noindent \copyright~\sffamily \number\year, Univerza v Ljubljani, Fakulteta za računalništvo in informatiko

      Rezultati diplomskega dela so intelektualna lastnina Fakultete za računalništvo in informatiko Univerze v Ljubljani. Za objavljanje ali izkoriščanje rezultatov diplomskega dela je potrebno pisno soglasje Fakultete za računalništvo in informatiko ter mentorja.%
     \footnote{V dogovorju z mentorjem lahko kandidat diplomsko delo s pripadajočo izvorno kodo izda tudi pod katero izmed alternativnih licenc, ki ponuja določen del pravic vsem: npr. Creative Commons, GNU GPL.}
     }
    \fi
    \ifnum\pdf@strcmp{#1}{FRI}=\z@
     {\small
      \noindent \copyright~\sffamily \number\year, Univerza v Ljubljani, Fakulteta za računalništvo in informatiko

      Rezultati diplomskega dela so intelektualna lastnina Fakultete za računalništvo in informatiko Univerze v Ljubljani. Za objavljanje ali izkoriščanje rezultatov diplomskega dela je potrebno pisno soglasje Fakultete za računalništvo in informatiko ter mentorja.
     }
     \hypersetup{
      pdfcopyright={Copyright (c) \number\year, Univerza v Ljubljani, Fakulteta za računalništvo in informatiko.},
      pdflicenseurl={http://www.fri.uni-lj.si/licenses}
     }
    \fi
    \ifnum\pdf@strcmp{#1}{CC}=0
     \begin{center}
      \includegraphics*{cc/cc}
      \includegraphics*{cc/by}
      \includegraphics*{cc/sa}
     \end{center}

     {\small \sffamily
      \noindent Delo je ponujeno pod licenco Creative Commons Priznanje avtorstva--Deljenje pod enakimi pogoji 2.5 Slovenija (ali novejšo različico).
      To pomeni, da se tako besedilo, slike, grafi in druge sestavine dela kot tudi rezultati dela lahko prosto distribuirajo,
reproducirajo, uporabljajo, priobčujejo javnosti in predelujejo, pod pogojem, da se jasno in vidno navede avtorja in naslov tega
dela in da se v primeru spremembe, preoblikovanja ali uporabe tega dela v svojem delu, lahko distribuira predelava le pod
licenco, ki je enaka tej.
      Podrobnosti licence so dostopne na spletni strani \href{http://creativecommons.si}{creativecommons.si} ali na Inštitutu za
intelektualno lastnino, Streliška 1, 1000 Ljubljana.%
     }
     \hypersetup{
      pdfcopyright={This work is licensed under a Creative Commons Attribution-ShareAlike 2.5 Slovenia License.},
      pdflicenseurl={http://creativecommons.org/licenses/by-sa/2.5/si/deed.en_GB}
     }
    \fi
    \ifnum\pdf@strcmp{#1}{GNU}=0
     {\small \sffamily
      \noindent Izvorna koda dela, njeni rezultati in v ta namen razvita programska oprema je ponujena pod licenco GNU General Public License, različica 3 (ali novejša). To pomeni, da se lahko prosto distribuira in/ali predeluje pod njenimi pogoji.
      Podrobnosti licence so dostopne na spletni strani \href{http://www.gnu.org/licenses}{gnu.org/licenses}.
     }
     \hypersetup{
      pdfcopyright={This work is licensed under the GNU General Public License.},
      pdflicenseurl={http://www.gnu.org/licenses/gpl.html}
     }
    \fi


		\thispagestyle{empty}
}

% define topic
\newcommand\thesistopic{
		\if@openright\cleardoublepage\else\clearpage\fi
    \thispagestyle{plain}
    \vspace*{\fill}
    \begin{quote}
		{\itshape
     Namesto te strani se \emph{vstavi} original izdane teme diplomskega dela s podpisom mentorja in dekana ter žigom fakultete, ki ga diplomant dvigne v študentskem referatu,  preden odda izdelek v vezavo!
    }
    \end{quote}
    \vspace*{\fill}
		\thispagestyle{empty}
}

% define declaration
\newcommand\makedeclaration{
  \if@slovene
   \chapter*{Izjava o avtorstvu diplomskega dela}
  \else
   \chapter*{Declaration of Authorship}
  \fi
  \vspace{20pt}
  \noindent
	\begin{minipage}{\textwidth}
  \if@slovene
    Spodaj podpisani izjavljam, da sem avtor dela, da slednje ne vsebuje materiala, ki bi ga kdorkoli predhodno že objavil ali oddal v obravnavo za pridobitev naziva na univerzi ali drugem visokošolskem zavodu, razen v primerih kjer so navedeni viri.

    S svojim podpisom zagotavljam, da:
    \begin{itemize}
    \item sem delo izdelal samostojno pod mentorstvom \@advisorA{}\ifx\@coadvisorA\empty\relax\else{} in somentorstvom \@coadvisorA\fi,
    \item so elektronska oblika dela, naslov (slov., angl.), povzetek (slov., angl.) ter ključne besede (slov., angl.) identični s tiskano obliko in
	  \item soglašam z javno objavo elektronske oblike dela v zbirki ``Dela FRI''.
	  \end{itemize}
  \else
    I hereby declare that this thesis is my own work and that, to the best of my knowledge
and belief, it contains no material previously published or written by another person
nor material which to a substantial extent has been accepted for the award of any other
degree or diploma of the university or other institute of higher learning, except where due
acknowledgement has been made in the text.

    With my signature I confirm that:
    \begin{itemize}
    \item the work was done wholly or mainly while in candidature for a degree at this University under the advisorship of \@advisor{}\ifx\@coadvisor\empty\relax\else{} and coadvisorship of \@coadvisor\fi,
    \item the electronic and printed version of the work, the title (eng., slov.), the abstract (eng., slov.) and key words (eng., slov.) are identical and
	  \item I agree with the publication of the electronic version of the thesis in the ``Dela FRI'' collection.
	  \end{itemize}
  \fi
	\end{minipage}
  \par \null \hfill  --- \@author, \@place,
  \if@slovene
   \ifcase\month\or januar\or februar\or marec\or april\or maj\or junij\or julij\or avgust\or september\or oktober\or november\or december\fi
  \else
   \ifcase\month\or January\or February\or March\or April\or May\or June\or July\or August\or September\or October\or November\or December\fi
  \fi
  ~\number\year.
	\par
  \thispagestyle{empty}
  }

\if@PhD
 \renewcommand\makecopyright[1][-]{\empty}
 \renewcommand\thesistopic{\empty}
 \renewcommand\makedeclaration{\empty}
\fi

% define chapter\section counters
\newcommand*\chaptermark[1]{}
\setcounter {secnumdepth}{2}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]

% define chapter\section\figure names
\newcommand\chaptername{\empty}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\bibname{Bibliography}
\if@slovene
 \providecommand\biographyname{Biografija}
\else
 \providecommand\biographyname{Biography}
\fi
\if@slovene
 \providecommand\bibliographyname{Osebna bibliografija}
\else
 \providecommand\bibliographyname{Personal bibliography}
\fi
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\appendixname{Appendix}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\newcommand\definitionname{Definicija}
\if@slovene
 \renewcommand{\definitionname}{Definition}
\fi

% define chapter\section formatting
\if@PhDp
 \renewcommand \thepart {}
 \renewcommand \thechapter {}
 \renewcommand \thesection {\@arabic\c@section}
\else
 \renewcommand \thepart {\@Roman\c@part}
 \renewcommand \thechapter {\@arabic\c@chapter}
 \renewcommand \thesection {\thechapter.\@arabic\c@section}
\fi
\renewcommand \thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand \thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand \theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand \thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}

% forntmatter, mainmatter, backmatter, part styles
\newcommand\frontmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse
  \pagenumbering{roman}}
\newcommand\mainmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmattertrue
  \pagenumbering{arabic}}
\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse}
\newcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{plain}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \huge\bfseries \partname\nobreakspace\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge \bfseries #2\par}%
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries #1\par}%
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
               \if@openright
                \null
                \thispagestyle{empty}%
                \newpage
               \fi
              \fi
              \if@tempswa
                \twocolumn
              \fi}


\def\@place{Ljubljana}
\let\@author\@empty
\let\@advisor\@empty
\let\@advisorA\@empty
\let\@coadvisor\@empty
\let\@coadvisorA\@empty
\let\@title\@empty
\let\@titleA\@empty
\let\@keywords\@empty
\let\@keywordsA\@empty

\renewcommand{\author}[2]
{
 \def\@author{#1}
 \def\@enrolmentId{#2}
 \hypersetup{
  pdfinfo={
   Author={#1}
  }
 }
}
\newcommand{\advisor}[2]
{
 \hypersetup{
  pdfinfo={
   Advisor={#1}
  }
 }
 \def\@advisor{#1}
 \def\@advisorA{#2}
}
\newcommand{\coadvisor}[2]
{
 \hypersetup{
  pdfinfo={
   Coadvisor={#1}
  }
 }
 \def\@coadvisor{#1}
 \def\@coadvisorA{#2}
}
\def\title{\@ifnextchar[{\@titleopt}{\@titlenopt}}
\def\@titleopt[#1][#2]#3#4%
{%
 \hypersetup{
  pdfinfo={
   Title={\if@slovene#2\else#1\fi}
  }
 }
 \gdef\@title{#3}\gdef\@titleA{#4}
 \if@PhDp\@mkboth{#1}{#1}\fi
 \if@BVSRI \subject{BVS-RI thesis}\fi
 \if@BUNRI \subject{BUN-RI thesis}\fi
 \if@BUNRM \subject{BUN-RM thesis}\fi
 \if@BSc \subject{BSc thesis}\fi
 \if@MSc \subject{MSc thesis}\fi
 \if@PhD \subject{PhD thesis}\fi
 \if@PhDp \subject{PhD thesis proposal}\fi
}
\def\@titlenopt#1#2%
{%
 \hypersetup{
  pdfinfo={
   Title={\if@slovene#2\else#1\fi}
  }
 }
 \gdef\@title{#1}\gdef\@titleA{#2}
 \if@PhDp\@mkboth{#1}{#1}\fi
 \if@BVSRI \subject{BVS-RI thesis}\fi
 \if@BUNRI \subject{BUN-RI thesis}\fi
 \if@BUNRM \subject{BUN-RM thesis}\fi
 \if@BSc \subject{BSc thesis}\fi
 \if@MSc \subject{MSc thesis}\fi
 \if@PhD \subject{PhD thesis}\fi
 \if@PhDp \subject{PhD thesis proposal}\fi
}
\newcommand{\subject}[1]
{
 \def\@subject{#1}
 \hypersetup{
  pdfinfo={
   Subject={#1}
  }
 }

}
\newcommand{\keywords}[2]
{
 \def\@keywords{#1}\def\@keywordsA{#2}
 \hypersetup{
  pdfinfo={
   Keywords={\if@slovene#2\else#1\fi}
  }
 }
}

\newenvironment{Abstract}{\setbox0=\hbox{\begin{minipage}{\textwidth}{\begin{center}
		 {\normalsize \setsinglelinespacing
		  University of Ljubljana
		  \par}
		 {\small \setsinglelinespacing
		  Faculty of Computer and Information Science
		  \par}
		 \vspace{1mm}
		 {\setsinglelinespacing
		  \normalsize \@author
		  \par}
		 {\large\bfseries
		  \setsinglelinespacing
		  \if@slovene
		   \@titleA
		  \else
		   \@title
		  \fi
		  \par}
		 \end{center}
		}\end{minipage}}
		\cleardoublepage
	  \if@slovene
	    \hyphenrules{english}
	  \fi
	  \@xp\chapter\@xp*\@xp{Abstract}
	  \@mkboth{Abstract}{Abstract}
	 	\addcontentsline{toc}{chapter}{\protect\numberline{}Abstract}
	 	\vspace{-129pt}
	 	\copy0
	 	\vspace{-\ht0}
	 	\vspace{113pt}
	 	\vspace{10pt}}
	 {\par \vspace{10pt}
	  {{\bfseries \noindent Key words:}\hskip3.4pt\if@slovene\@keywordsA\else\@keywords\fi \par}
	  \if@slovene
	  	\hyphenrules{slovene}
	 	\fi}

\newenvironment{Povzetek}{\setbox0=\hbox{\begin{minipage}{\textwidth}{\begin{center}
		 {\normalsize \setsinglelinespacing
		  Univerza v Ljubljani
		  \par}
		 {\small \setsinglelinespacing
		  Fakulteta za računalništvo in informatiko
		  \par}
		 \vspace{1mm}
		 {\setsinglelinespacing
		  \normalsize \@author
		  \par}
		 {\large\bfseries
		  \setsinglelinespacing
		  \if@slovene
		   \@title
		  \else
		   \@titleA
		  \fi
		  \par}
		 \end{center}
		}\end{minipage}}
		\cleardoublepage
		\if@slovene
		\else
	    \hyphenrules{slovene}
	  \fi
	  \@xp\chapter\@xp*\@xp{Povzetek}
	  \@mkboth{Povzetek}{Povzetek}
	 	\addcontentsline{toc}{chapter}{\protect\numberline{}Povzetek}
	 	\vspace{-129pt}
	 	\copy0
	 	\vspace{-\ht0}
	 	\vspace{113pt}
	 	\vspace{10pt}}
	 {\par \vspace{10pt}
	  {{\bfseries \noindent Kljucne besede:}\hskip3.4pt\if@slovene\@keywords\else\@keywordsA\fi \par}
	  \if@slovene
		\else
	    \hyphenrules{english}
	  \fi}

\newenvironment{Acknowledgements}
 {\if@slovene
   \chapter*{Zahvala}
   \@mkboth{Zahvala}{Zahvala}
   \addcontentsline{toc}{chapter}{\protect\numberline{}Zahvala}
  \else
   \chapter*{Acknowledgements}
   \@mkboth{Acknowledgements}{Acknowledgements}
   \addcontentsline{toc}{chapter}{\protect\numberline{}Acknowledgements}
  \fi
  \vspace{20pt}
  \noindent
	\begin{minipage}{\textwidth}
	\itshape
	}
 {\end{minipage}
  \par \null \hfill  --- \@author, \@place,
  \if@slovene
   \ifcase\month\or januar\or februar\or marec\or april\or maj\or junij\or julij\or avgust\or september\or oktober\or november\or december\fi
  \else
   \ifcase\month\or January\or February\or March\or April\or May\or June\or July\or August\or September\or October\or November\or December\fi
  \fi
  ~\number\year.
	\par
  }

\newenvironment{Statement}
 {\cleardoublepage
  \thispagestyle{plain}
  \vspace*{138pt}

  \noindent
  \begin{minipage}{\textwidth}
  \itshape
  }
 {
	\end{minipage}
	\par \null \hfill  --- \@author, \@place,
	\if@slovene
   \ifcase\month\or januar\or februar\or marec\or april\or maj\or junij\or julij\or avgust\or september\or oktober\or november\or december\fi
  \else
   \ifcase\month\or January\or February\or March\or April\or May\or June\or July\or August\or September\or October\or November\or December\fi
  \fi
  ~\number\year.
  \par
  }

\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi
                }
\def\@makechapterhead#1{%
  \vspace*{50\p@}%
  {\setbox0 = \hbox{\fontfamily{ppl}\fontsize{36}{40}\bfseries\selectfont
		  \kern 1pt
      \begingroup\color{P1797}\expandafter\kernchapno{\thechapter}{\empty}\normalcolor\endgroup
      \kern 3pt
     }
   \vglue 0pt
   \leftline{%
%      \ifback\else
         \vtop{%
            \begingroup
            \copy0
            \vskip 6pt
            \color{grey05}\hrule width\wd0 height 2.2pc
            \endgroup
         }%
         \kern 16pt
%      \fi
      \fontfamily{ppl}\fontsize{26}{36}\bfseries\selectfont
      \chaprule
      \kern 6pt
      \vtop{%
         \def\linebreak{\hfil\break}%
         \setsinglelinespacing\raggedright {\noindent \begingroup\color{P1797}#1\endgroup}
      }
   }%
   \vskip 6pc plus.5pc minus.5pc
%   \mark{\chaptername}%
   \normalcolor
  }
}
\def\chaprule{\color{grey20}\vrule depth3\baselineskip height1.5pc width1pt}
\def\kernchapno#1#2{%
   \ifx\empty#2\else \kern-3pt \fi
   #1%
   \ifx\empty#2\else
      \if1#2%
         \kern-.1em
      \else
         \kern-.05em
      \fi
   \fi
   #2%
   \if 1#2\kern-.1em\fi
}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \centering
    {\color{P1797}\LARGE\scshape\lowercase{#1}\normalcolor\par}\nobreak
    \vskip 35\p@
  }}

\newcommand\section{\@startsection {section}{1}{\z@}%
	{-2.5ex \@plus -1ex \@minus -.2ex}%
	{2.3ex \@plus.2ex}%
	{\color{P1797}\large\if@PhDp\sffamily\else\rmfamily\fi\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
	{-2.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\color{P1797}\if@PhDp\sffamily\else\rmfamily\fi\bfseries}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
	{-2.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\color{P1797}\if@PhDp\sffamily\else\rmfamily\fi\normalsize}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
	{2.25ex \@plus1ex \@minus.2ex}%
	{-1em}%
	{\color{P1797}\if@PhDp\sffamily\else\rmfamily\fi\normalsize}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
	{2.25ex \@plus1ex \@minus .2ex}%
	{-1em}%
	{\color{P1797}\normalfont\normalsize}}

\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi  {\color{grey65}\raisebox{.05em}{\rule{.35em}{.35em}}\normalcolor}
\newcommand\labelitemii {\color{grey50}\raisebox{.1em}{\rule{.25em}{.25em}}\normalcolor}
\newcommand\labelitemiii{\color{grey40}\raisebox{.15em}{\rule{.15em}{.15em}}\normalcolor}
\newcommand\labelitemiv {\color{grey30}\raisebox{.15em}{\rule{.15em}{.15em}}\normalcolor}

\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\newenvironment{titlepage}
    {%
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \pagenumbering{alph}
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\newcommand\appendix{
  \if@PhDp
  \par
  \cleardoublepage
  \def\sectionmark##1{%
    \markright {{%
     \ifnum \c@secnumdepth >\z@
      \thesection \ %
     \fi
     ##1}}}
  \else
  \par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}
  \fi
  }
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
\newcounter{figure}[chapter]
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  {\scriptsize\sffamily \@hangfrom{{\bfseries #1}\hskip3.4pt}#2 \par}
  \vskip\belowcaptionskip
}

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}

\DeclareMathAlphabet{\mathpzc}{OT1}{pzc}{m}{it}
\DeclareMathAlphabet{\mathppl}{OT1}{ppl}{m}{it}

\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{2}
\newcommand\tableofcontents{%
	\@xp\chapter\@xp*\@xp{\contentsname \@mkboth{\contentsname}{\contentsname}}%
	\@starttoc{toc}%
	}
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
\newcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\def\bibliographystyle#1{%
    \if@filesw\immediate\write\@auxout{\string\bibstyle{#1}}\fi
    \def\@tempa{#1}%
    \def\@tempb{amsplain}%
    \def\@tempc{}%
    \ifx\@tempa\@tempb
        \def\@biblabel##1{##1.}%
        \def\bibsetup{}%
    \else
        \def\bibsetup{\labelsep6\p@}%
        \ifx\@tempa\@tempc
            \def\@biblabel##1{}%
            \def\bibsetup{\labelwidth\z@ \leftmargin24\p@
                \itemindent-24\p@
                \labelsep\z@ }%
        \fi
    \fi}
\if@PhDp
 \def\bib@heading{%
   \section{\bibname}%
 }
\fi
\newenvironment{thebibliography}[1]{%
  \if@PhDp
   \section*{\bibname}%
  \else
   \@xp\chapter\@xp*\@xp{\bibname}%
  \fi
  \@mkboth{\bibname}{\bibname}
  \vspace{18.5pt}
  \addcontentsline{toc}{chapter}{\protect\numberline{}\bibname}
  \labelsep .5em\relax
  \renewcommand\theenumiv{\arabic{enumiv}}\let\p@enumiv\@empty
  \list{\@biblabel{\theenumiv}}{\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth \advance\leftmargin\labelsep
    \usecounter{enumiv}}%
  \sloppy \clubpenalty\@M \widowpenalty\clubpenalty
  \sfcode`\.=\@m
  \if@PhD
   \normalfont\footnotesize\setsinglelinespacing
  \fi
}{%
  \def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}%
  \endlist
}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\if@PhDp
 \pagestyle{proposal}
\else
\pagestyle{headings}
\fi
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi

\RequirePackage{ragged2e}

\AtBeginDocument{%
\if@PhDp
 \setcounter{secnumdepth}{0}
\else
 \setcounter{secnumdepth}{2}
\fi
\setcounter{tocdepth}{2}
\if@PhDp
 \ps@proposal
\else
 \ps@headings
\fi
%\RaggedRight
%\sffamily
}
\AtEndDocument{
}

\if@PhDp
\RequirePackage[numbers,sort&compress,sectionbib]{natbib}
\else
\RequirePackage[numbers,sort&compress]{natbib}
\fi
\RequirePackage{hyperxmp}
\ifpdf
\RequirePackage[colorlinks,colorlinks,citecolor=P1797,linkcolor=P1797,urlcolor=P1797,plainpages=false,linktocpage=true,hyperfigures=true,unicode=true,pdfdisplaydoctitle=true,breaklinks=true]{hyperref}
\else
  \RequirePackage[dvipdfm,colorlinks,colorlinks,citecolor=P1797,linkcolor=P1797,urlcolor=P1797,plainpages=false,linktocpage=true,hyperfigures=true,unicode=true,pdfdisplaydoctitle=true,breaklinks=true]{hyperref}
\fi

\paperheight 297mm \paperwidth 210mm \textheight 54.5pc
\if@PhDp
\marginsize{37.5mm}{37.5mm}{30mm}{40mm}
\else
\marginsize{32.5mm}{42.5mm}{30mm}{40mm}
\fi
\setlength{\marginparwidth}{35mm}
\linespread{1.5}

\endinput
%%
%% End of file `FRIthesis.cls'.
