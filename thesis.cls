\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2014/06/18 Imperial College London Dissertation Template]
\RequirePackage{etoolbox}

\newtoggle{@tocaligned} % the left column of the toc will be aligned (no indention)
\newtoggle{@eulerchapternumbers} % use AMS Euler for chapter font (otherwise Palatino)
\newtoggle{@drafting} % print version information on pages
\newtoggle{@beramono} % toggle nice monospaced font (w/ bold) + pre-installed 
\newtoggle{@eulermath} % use awesome Euler fonts for math
\newtoggle{@minionpro} % setup for minion pro font
\newtoggle{@subfig} % setup for preloaded @subfig package
\newtoggle{@a5paper} % use those tiny DIN A5 pages
\newtoggle{@dottedtoc} % page numbers in ToC flushed right
\newtoggle{@floatperchapter} % numbering per chapter for all floats (i.e., Figure 1.1)

%
% Options
%
\DeclareOption{tocaligned}{\settoggle{@tocaligned}{true}}
\DeclareOption{eulerchapternumbers}{\settoggle{@eulerchapternumbers}{true}}
\DeclareOption{drafting}{\settoggle{@drafting}{true}}
\DeclareOption{subfig}{\settoggle{@subfig}{true}}
\DeclareOption{beramono}{\settoggle{@beramono}{true}} 
\DeclareOption{eulermath}{\settoggle{@eulermath}{true}} 
\DeclareOption{a5paper}{\settoggle{@a5paper}{true}}
\DeclareOption{minionpro}{\settoggle{@minionpro}{true}} 
\DeclareOption{dottedtoc}{\settoggle{@dottedtoc}{true}} 
\DeclareOption{floatperchapter}{\settoggle{@floatperchapter}{true}}

%% Report options
\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{report}}
\DeclareOption{a4paper}{\PassOptionsToClass{\CurrentOption}{report}}
\DeclareOption{twoside}{\PassOptionsToClass{\CurrentOption}{report}}
\DeclareOption{oneside}{\PassOptionsToClass{\CurrentOption}{report}}

%% Custom options
\DeclareOption{doublespacing}{\AtBeginDocument{\doublespacing}}
\DeclareOption{onehalfspacing}{\AtBeginDocument{\onehalfspacing}}
\DeclareOption{titlepagenumber=off}{\AtEndOfClass{\renewcommand{\titlepagestyle}{empty}}}
\DeclareOption{titlepagenumber=on}{\AtEndOfClass{\renewcommand{\titlepagestyle}{plain}}}

\ExecuteOptions{12pt,a4paper,oneside}

\ProcessOptions\relax
\LoadClass{report}

% Listings
\RequirePackage{listings}
%\RequirePackage{minted}

%
% Colors
%
\PassOptionsToPackage{dvipsnames}{xcolor}
\RequirePackage{xcolor}
\definecolor{halfgray}{gray}{0.45} % chapter numbers will be semi transparent .5 .55 .6 .0
\definecolor{webgreen}{rgb}{0,.5,0}
\definecolor{webbrown}{rgb}{.6,0,0}

\definecolor{icdarkblue}{cmyk}{1.0,0.61,0.0,0.45}
\definecolor{iclightblue}{cmyk}{0.50,0.30,0.0,0.22}

\definecolor{pantone186}{cmyk}{0.04,0.96,0.67,0.0}
\definecolor{pantone485}{cmyk}{0.01,0.96,0.96,0.0}
\definecolor{pantone334}{cmyk}{0.81,0.13,0.61,0.0}
\definecolor{pantone349}{cmyk}{0.88,0.36,0.93,0.29}
\definecolor{pantone293}{cmyk}{0.93,0.71,0.0,0.0}
\definecolor{pantone280}{cmyk}{1.0,0.90,0.14,0.05}
\definecolor{pantone143}{cmyk}{0.0,0.40,0.95,0.0}
\definecolor{pantone160}{cmyk}{0.27,0.75,0.98,0.20}
\definecolor{pantone527}{cmyk}{0.73,0.94,0.0,0.0}
\definecolor{pantone525}{cmyk}{0.82,1.0,0.33,0.25}

\definecolor{iccswRed}{rgb}{0.7,0.05,0}
\definecolor{iccswBlue}{rgb}{0.0,0.05,0.7}

\RequirePackage{ifluatex}

%
% Fonts
%
\RequirePackage{microtype} % character protruding and other micro-typography stuff
\ifluatex
  \microtypesetup{activate={true,nocompatibility},final,expansion=false,tracking=false}
\else
  \microtypesetup{activate={true,nocompatibility},final,kerning=true,spacing=true,expansion=false}
\fi
\microtypecontext{spacing=nonfrench}

% Consider using Bitstream Charter and Bitstream Vera Sans

\RequirePackage{graphicx}
\RequirePackage{tikz}

\RequirePackage{amsthm}

\ifluatex
  \RequirePackage{polyglossia}
  \setdefaultlanguage{english}
  %\setdefaultlanguage[variant=british]{english}
  \RequirePackage{csquotes}
  \RequirePackage{fontspec}
  \defaultfontfeatures{Ligatures=TeX, Scale=MatchLowercase}
  \RequirePackage{unicode-math}
\else
  \RequirePackage[british]{babel}
  \RequirePackage[T1]{fontenc}
  %\RequirePackage{lmodern}
  \RequirePackage[utf8]{inputenc}
\fi


\ifluatex
  \newfontfeature{Microtype}{protrusion=default;expansion=default;}
  \setmainfont[Microtype, Renderer=Basic, Numbers=OldStyle]{Minion Pro}
  \setsansfont[Microtype, Numbers=OldStyle]{Myriad Pro}
  %\setmainfont[Renderer=Basic, SmallCapsFeatures={LetterSpace=6}, Numbers={Proportional,OldStyle}]{Minion Pro}
  %\setsansfont[LetterSpace=3, Numbers={Proportional,OldStyle}]{Myriad Pro}
  \setmonofont[BoldFont={Inconsolata Bold}]{Inconsolata}
  \setmathfont{Asana Math}
  %\setmathfont[range=\mathup]{Minion Pro}
  %\setmathfont[range=\mathbfup]{Minion Pro Bold}
  %\setmathfont[range=\mathbfit]{Minion Pro Bold Italic}
  %\setmathfont[range=\mathit]{Minion Pro Italic}
  \newfontface{\chapterNumber}[Scale=5]{Minion Pro Bold}
\else
  \RequirePackage{MyriadPro}
  \iftoggle{@eulermath}%
  {%
    \PassOptionsToPackage{minionint,mathlf,onlytext}{MinionPro}%
    \RequirePackage{MinionPro}
  }{%
    \PassOptionsToPackage{minionint,mathlf}{MinionPro}%
    \RequirePackage{MinionPro}
  }%
  \PassOptionsToPackage{scaled=0.85}{beramono}
  \RequirePackage{beramono}

  \iftoggle{@eulermath}%
  {\PassOptionsToPackage{euler-digits}{eulervm}%
  \RequirePackage{eulervm}} % Euler math fonts
  {\relax}

  \iftoggle{@eulerchapternumbers}% font for the chapter numbers
  {\newfont{\chapterNumber}{eurb10 scaled 7000}}%
  {\newfont{\chapterNumber}{pplr9d scaled 7000}}          
  % Euler eurb10 / Palatino OSF pplr9d / Palatino SC pplrc9d
  % Latin Modern cork-lmr10 / Minion MinionPro-Regular-osf-t1
  % (MinionPro-SemiboldCapt-osf-t1 MinionPro-SemiboldDisp-osf-t1)
\fi

\ifluatex
  \DeclareRobustCommand{\spacedallcaps}[1]{\textls[160]{\MakeTextUppercase{#1}}}%
  \DeclareRobustCommand{\spacedlowsmallcaps}[1]{\textls[80]{\scshape\MakeTextLowercase{#1}}}%
\else
  \DeclareRobustCommand{\spacedallcaps}[1]{\textssc{\MakeTextUppercase{#1}}}%
  \DeclareRobustCommand{\spacedlowsmallcaps}[1]{\textssc{\MakeTextLowercase{#1}}}%
\fi

\RequirePackage{setspace}
\RequirePackage{titling}

\RequirePackage{subcaption}

%
% Custom
%
\clubpenalty = 10000
\widowpenalty = 10000 
\displaywidowpenalty = 10000 % formulas

%
% Fancy
%
\RequirePackage{booktabs}
\RequirePackage{textcase}

\newcommand*{\@supervisor}{}
\newcommand*{\@university}{Imperial College London}
\newcommand*{\@department}{}
\newcommand*{\@field}{Computing}
\newcommand*{\@degree}{Doctor of Philosophy}
\newcommand*{\@diploma}{}
\newcommand*{\@declaration}{}
\newcommand*{\@dedication}{}
\newcommand*{\@submitdate}{}

\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}}
\newcommand*{\university}[1]{\gdef\@university{#1}}
\newcommand*{\department}[1]{\gdef\@department{#1}}
\newcommand*{\field}[1]{\gdef\@field{#1}}
\newcommand*{\declaration}[1]{\gdef\@declaration{#1}}
\newcommand*{\dedication}[1]{\gdef\@dedication{#1}}
\newcommand*{\submitdate}[1]{\gdef\@submitdate{#1}}

\newcommand*{\titlefont}{\fontfamily{\sfdefault}\fontsize{20}{24}\selectfont}

\pagestyle{empty}

\setlength{\parskip}{2ex plus 0.5ex minus 0.2ex}
\setlength{\parindent}{0pt}

%\makeatletter  %to avoid error messages generated by "\@". Makes Latex treat "@" like a letter

\renewcommand{\maketitle}{
\begin{titlepage}
 \par
 \clearpage
 \thispagestyle{plain}
 \noindent\begin{minipage}[t]{\textwidth}
  \centering\large
  \@university
  \ifx\@department\@empty \else \par \@department\fi
 \end{minipage}
 \null\vfill
 \begin{center}
  {\titlefont\huge \@title\par}
  \vskip 3em
  {\Large \lineskip 0.75em
  \begin{tabular}[t]{c}
   \@author
  \end{tabular}\par}
  \vskip 1.5em
  {\Large \@date \par}
  \vskip \z@ \@plus3fill
  \ifx\@supervisor\@empty \else
  {\Large Supervised by \@supervisor \par}
  \fi
  \vskip 3em
 \end{center}\par
 \noindent\begin{minipage}[b]{\textwidth}
  \centering
  Submitted in part fulfilment of the requirements for the degree of\\
  \@degree\ in \ifx\empty\@field{\@department}\else{\@field}\fi\ of
  the \@university, \@submitdate
 \end{minipage}
 \ifx\@declaration\@empty\else{
 \cleardoublepage
 \chapter*{Declaration}
 \thispagestyle{plain}
 \@declaration
 \par\vspace{3cm}
 \hfill\@author
 \cleardoublepage
 }\fi
\end{titlepage}
}

\newcommand{\preface}{
  \pagenumbering{roman}
  \pagestyle{plain}
  %\doublespacing
  \onehalfspacing
}

\newcommand{\body}{
  %\cleardoublepage    
  %\pagestyle{headings}
  %\tableofcontents
  %\pagestyle{plain}
  %\cleardoublepage
  %\pagestyle{headings}
  %\listoftables
  %\pagestyle{plain}
  %\cleardoublepage
  %\pagestyle{headings}
  %\listoffigures
  %\pagestyle{plain}
  %\cleardoublepage
  %\pagestyle{headings}
  \pagenumbering{arabic}
  %\doublespacing
  \onehalfspacing
}

\newcommand{\makededication}{
 \ifx\@dedication\@empty \else
 \clearpage
 \thispagestyle{plain}
 \null\vfill
 {\centering \Large \@dedication \par}
 \vskip \z@ \@plus3fill
 \cleardoublepage
 \fi
}

\renewenvironment{abstract}{%
\chapter*{Abstract}\thispagestyle{plain}}{\cleardoublepage}

\newenvironment{acknowledgments}{%
\chapter*{Acknowledgments}\thispagestyle{plain}}{\cleardoublepage}

\newcommand\chapterdescriptionlabel[1]{\hspace*{\labelsep}\normalfont{#1}}
\newenvironment{chapterdescription}{%
   \let\descriptionlabel\chapterdescriptionlabel
   \description
}{%
   \enddescription
}

%
% Layout
%
\RequirePackage{titlesec}

% chapters
% \usefont{OT1}{cmr}{m}{it}\selectfont
\titleformat{\chapter}[display]%
    {\relax}{\chapterNumber\thechapter}{0pt}%
    {\vspace*{1.0\baselineskip}\huge\itshape\color{halfgray}}[\normalsize\vspace*{.5\baselineskip}\titlerule]% 
    %{\huge\vspace*{1.0\baselineskip}\itshape\color{halfgray}}[\normalsize\vspace*{.5\baselineskip}\titlerule]% 

% sections \FloatBarrier
\titleformat{\section}
    {\relax}{\textsc{\MakeTextLowercase{\thesection}}}{1em}{\spacedlowsmallcaps}

% subsections
\titleformat{\subsection}
    {\relax}{\textsc{\MakeTextLowercase{\thesubsection}}}{1em}{\normalsize\itshape}

% subsubsections
\titleformat{\subsubsection}
    {\relax}{\textsc{\MakeTextLowercase{\thesubsubsection}}}{1em}{\normalsize\itshape}        

% paragraphs
\titleformat{\paragraph}[runin]
    {\normalfont\normalsize}{\theparagraph}{0pt}{\spacedlowsmallcaps}    

% descriptionlabels
\renewcommand{\descriptionlabel}[1]{\hspace*{\labelsep}\spacedlowsmallcaps{#1}}   % spacedlowsmallcaps textit textsc                  

% spacing
\titlespacing*{\chapter}{0pt}{1\baselineskip}{1.2\baselineskip}
\titlespacing*{\section}{0pt}{1.25\baselineskip}{1\baselineskip} 
\titlespacing*{\subsection}{0pt}{1.25\baselineskip}{1\baselineskip}
\titlespacing*{\paragraph}{0pt}{1\baselineskip}{1\baselineskip}

%
% TOC, LOF and LOT
%
\PassOptionsToPackage{titles}{tocloft}
\RequirePackage{tocloft}

% avoid page numbers being right-aligned in fixed-size box              
\newlength{\newnumberwidth}
\settowidth{\newnumberwidth}{999} % yields overfull hbox warnings for pages > 999
\cftsetpnumwidth{\newnumberwidth}

% have the bib neatly positioned after the rest
\newlength{\beforebibskip}  
\setlength{\beforebibskip}{0em}
    
% chapters
\renewcommand{\cftchappresnum}{\scshape\MakeTextLowercase}%
\renewcommand{\cftchapfont}{\normalfont}%
\renewcommand{\cftchappagefont}{\normalfont}%
\iftoggle{@dottedtoc}{\relax}%
{%
  \renewcommand{\cftchapleader}{\hspace{1.5em}}% 
  \renewcommand{\cftchapafterpnum}{\cftparfillskip}% 
}
%\setlength{\cftbeforechapskip}{.1em}%           

% sections
\renewcommand{\cftsecpresnum}{\scshape\MakeTextLowercase}%
\renewcommand{\cftsecfont}{\normalfont}%
\renewcommand{\cftsecpagefont}{\normalfont}%
\iftoggle{@dottedtoc}{\relax}%
{%        
  \renewcommand{\cftsecleader}{\hspace{1.5em}}% 
  \renewcommand{\cftsecafterpnum}{\cftparfillskip}%
}
\iftoggle{@tocaligned}{\renewcommand{\cftsecindent}{0em}}{\relax}

% subsections
\renewcommand{\cftsubsecpresnum}{\scshape\MakeTextLowercase}%
\renewcommand{\cftsubsecfont}{\normalfont}%
\iftoggle{@dottedtoc}{\relax}%
{%      
  \renewcommand{\cftsubsecleader}{\hspace{1.5em}}% 
  \renewcommand{\cftsubsecafterpnum}{\cftparfillskip}%   
}             
\iftoggle{@tocaligned}{\renewcommand{\cftsubsecindent}{0em}}{\relax}

% subsubsections
\renewcommand{\cftsubsubsecpresnum}{\scshape\MakeTextLowercase}%
\renewcommand{\cftsubsubsecfont}{\normalfont}%
\iftoggle{@dottedtoc}{\relax}%
{%      
  \renewcommand{\cftsubsubsecleader}{\hspace{1.5em}}% 
  \renewcommand{\cftsubsubsecafterpnum}{\cftparfillskip}%   
}             
\iftoggle{@tocaligned}{\renewcommand{\cftsubsubsecindent}{0em}}{\relax}

% figures     
\renewcommand{\cftfigpresnum}{\scshape\MakeTextLowercase}% 
\renewcommand{\cftfigfont}{\normalfont}%                 
\iftoggle{@dottedtoc}{\relax}%
{%
  \renewcommand{\cftfigleader}{\hspace{1.5em}}% 
  \renewcommand{\cftfigafterpnum}{\cftparfillskip}%
}
\renewcommand{\cftfigpresnum}{\figurename~}%Fig.~}
\newlength{\figurelabelwidth}
\settowidth{\figurelabelwidth}{\cftfigpresnum~999}
\addtolength{\figurelabelwidth}{2.5em}
\cftsetindents{figure}{0em}{\figurelabelwidth}

% tables
\renewcommand{\cfttabpresnum}{\scshape\MakeTextLowercase}%
\renewcommand{\cfttabfont}{\normalfont}%
\iftoggle{@dottedtoc}{\relax}%
{%
  \renewcommand{\cfttableader}{\hspace{1.5em}}% 
  \renewcommand{\cfttabafterpnum}{\cftparfillskip}%   
} 
\renewcommand{\cfttabpresnum}{\tablename~}%Tab.~}
\newlength{\tablelabelwidth}
\settowidth{\tablelabelwidth}{\cfttabpresnum~999}
\addtolength{\tablelabelwidth}{2.5em}
%\cftsetindents{table}{0em}{\tablelabelwidth}
\cftsetindents{table}{0em}{\figurelabelwidth}

% listings
\newlistof{listings}{lol}{\lstlistlistingname}%
\renewcommand{\cftlistingspresnum}{\scshape\MakeTextLowercase}%
\renewcommand{\cftlistingsfont}{\normalfont}%
\renewcommand{\cftlistingspresnum}{\lstlistingname~}%
\renewcommand{\cftlistingspagefont}{\normalfont}%
\iftoggle{@dottedtoc}{\relax}%
{%  
  \renewcommand{\cftlistingsleader}{\hspace{1.5em}}%
  \renewcommand{\cftlistingsafterpnum}{\cftparfillskip}%
}
\newlength{\listingslabelwidth}%
\settowidth{\listingslabelwidth}{\cftlistingspresnum~999}%
\addtolength{\listingslabelwidth}{2.5em}%
%\cftsetindents{listings}{0em}{\listingslabelwidth}%
\cftsetindents{listings}{0em}{\figurelabelwidth}%
\let\l@lstlisting\l@listings%
\let\lstlistoflistings\listoflistings%

% dirty work-around to get the spacing after the toc/lot/lof-titles right    
\AtBeginDocument{\addtocontents{toc}{\protect\vspace{-\cftbeforechapskip}}}
                                    
% another dirty work-around to get the spaced low small caps into the toc ;-(
%% use modified \chapter (thanks to Hinrich Harms)
\let\oldchap=\chapter
\renewcommand*{\chapter}{%
  \secdef{\Chap}{\ChapS}%
}
\newcommand\ChapS[1]{\oldchap*{#1}}%
\newcommand\Chap[2][]{%
  \ifpdf\oldchap[\texorpdfstring{\spacedlowsmallcaps{#1}}{#1}]{#2}%
  \else\oldchap[\spacedlowsmallcaps{#1}]{#2}%
  \fi%
}%
\ifxetex % thanks to Joerg Weber
\renewcommand\Chap[2][]{%
  \ifxetex\oldchap[\texorpdfstring{\spacedlowsmallcaps{#1}}{#1}]{#2}%
  \else\oldchap[\spacedlowsmallcaps{#1}]{#2}%
  \fi%
}%
\fi%
          
\newcommand{\tocEntry}[1]{% for bib, etc.
  \ifpdf\texorpdfstring{\spacedlowsmallcaps{#1}}{#1}%
    \else{#1}\fi%
}
\ifxetex% thanks to Joerg Weber
  \renewcommand{\tocEntry}[1]{% for bib, etc.
    \ifxetex\texorpdfstring{\spacedlowsmallcaps{#1}}{#1}%
    \else{#1}\fi%
} \fi

\DeclareRobustCommand*{\deactivateaddvspace}{\let\addvspace\@gobble}% 
\AtBeginDocument{%      
    \addtocontents{lof}{\deactivateaddvspace}% 
    \addtocontents{lot}{\deactivateaddvspace}%
    \addtocontents{lol}{\deactivateaddvspace}%
}%

%
% PDF
%
\RequirePackage{ifpdf}
\ifpdf
%  \RequirePackage{hyperref}
%  \hypersetup{
%    unicode=true,
%    bookmarksopen=true,
%    bookmarksnumbered=true,
%    linktoc=page,
%    colorlinks=true,
%    linkcolor=pantone186,
%    citecolor=pantone334,
%    urlcolor=pantone527
%  }
\fi

\endinput
