\def\currvers{July 21, 1998}
%
%%  This file is called genp.sty/genp.cls
%%  (The same file may be copied from genp.sty to genp.cls or vice versa
%%        depending on whether it is to be used for LaTeX2.09 or LaTeX2e)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Style File for `Small Format Journals'                               %%
%% Kluwer Academic Publishers                                           %%
%%                                                                      %%
%% Technical help:  dthelp@wkap.com                                     %%
%%                                                                      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Macros written by
%% Amy Hendrickson
%% TeXnology, Inc.
%% 57 Longwood Avenue
%% Brookline, Massachusetts  02146
%% 617 / 738-8029
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\typeout{^^J^^J
Document Style `Small Format Journals' 
for Kluwer Academic Publishers}

\typeout{^^J^^J
Written by Amy Hendrickson, TeXnology, Inc.^^J}

\typeout{Authors! Before beginning to work, please ftp the README file from}
\typeout{the directory /Kluwer/styles/journals at ftp.std.com}
\typeout{to see if you have the current version of genpjrnl.sty!}
\typeout{This version is dated \currvers}

%%
%% The following code makes a great complaint on the screen
%% if the user has not used an option for a particular
%% journal style, and stops LaTeX from continuing:

\newif\ifll

\expandafter\ifx\csname LaTeXe\endcsname\relax % LaTeX2.09 is used
\else% LaTeX2e is being used, so set ll true
\global\lltrue\fi

\ifll \let\dooptions\ProcessOptions
\else
\let\dooptions\@options\fi
\dooptions

%% For both 2e and 2.09 ===>>>

%% Special Purpose Fonts
\font\smallcaps=cmcsc10 scaled 700
\font\medcaps=cmcsc10 scaled 750 %
\font\elvrm=cmr10 scaled \magstephalf
\font\elvbf=cmbx10 scaled \magstephalf
%% Fonts to make bold in super- and sub-scripts be the right size.
\font\sevbf =cmbx7
\font\fivbf =cmbx5
\let\bit\bf
\def\baselinestretch{0}

\ifll
%% (this may not be necessary)
\expandafter\ifx\csname sqrtsign\endcsname\relax
\def\sqrtsign{\radical "270370}\fi
\expandafter\ifx\csname mathunderscore\endcsname\relax
\def\mathunderscore{\leavevmode\kern.06em\vbox{\hrule width.3em}}
\def\mathellipsis{\mbox {$\m@th{\,.\,.\,.}\,$}}\fi
\global\newdimen\phspace
\else
\gdef\@plus{plus}
\gdef\@minus{minus}
\fi

\ifll\else
\global\@maxsep 20pt
\global\@dblmaxsep 20pt
\fi

%% 2e ==>>>
\newif\if@openbib
%\@openbibtrue
\@openbibfalse
\newif\if@openright
\newif\if@mainmatter 
\@mainmattertrue
\newif\if@restonecol
\newif\if@titlepage
\newif\ifdraft

\ifll
\newcommand{\@ptsize}{}
\renewcommand{\normalsize}{%
\ifdraft
   \@setfontsize\normalsize\@xpt{17}
\else
   \@setfontsize\normalsize\@xpt{12}
\fi
\abovedisplayskip 10pt plus2pt minus5\p@
\belowdisplayskip=\abovedisplayskip
\abovedisplayshortskip \z@ plus3pt\belowdisplayshortskip 6pt plus3pt
minus3pt
\let\@listi\@listI\let\bit\tenbit}
\newcommand{\small}{%
\ifdraft
   \@setfontsize\small\@ixpt{17}%
\else
   \@setfontsize\small\@ixpt{11}%
\fi
\abovedisplayskip 8.5\p@ plus3\p@ minus4\p@
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip \z@ plus2\p@
\belowdisplayshortskip 4\p@ plus2\p@ minus2\p@
\def\@listi{\leftmargin\leftmargini
\topsep 4\p@ plus2\p@ minus2\p@\parsep 2\p@ plus\p@ minus\p@
\itemsep \parsep}
\let\bit\ninebit}
\newcommand{\footnotesize}{%
\ifdraft
   \@setfontsize\footnotesize\@viiipt{17}%
\else
   \@setfontsize\footnotesize\@viiipt{9.5}%
\fi
\abovedisplayskip 6\p@ plus2\p@ minus4\p@
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip \z@ plus\p@
\belowdisplayshortskip 3\p@ plus\p@ minus2\p@
\def\@listi{\leftmargin\leftmargini
\topsep 3\p@ plus\p@ minus\p@\parsep 2\p@ plus\p@ minus\p@
\itemsep \parsep}}
%
\newcommand{\scriptsize}{\ifdraft
\@setfontsize\scriptsize\@viipt{17}
\else
\@setfontsize\scriptsize\@viipt\@viiipt
\fi
}
\newcommand{\tiny}{\@setfontsize\tiny\@vpt\@vipt}
\newcommand{\large}{\ifdraft
\@setfontsize\large\@xiipt{17}
\else
\@setfontsize\large\@xiipt{14}
\fi
}
\newcommand{\Large}{\@setfontsize\Large\@xivpt{18}}
\newcommand{\LARGE}{\@setfontsize\LARGE\@xviipt{22}}
\newcommand{\huge}{\@setfontsize\huge\@xxpt{25}}
\newcommand{\Huge}{\@setfontsize\Huge\@xxvpt{30}}
%
\@maxdepth\maxdepth
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand{\cal}{\@fontswitch{\relax}{\mathcal}}
\DeclareRobustCommand{\mit}{\@fontswitch{\relax}{\mathnormal}}
%
\else %% LaTeX2.09
%% To get bold super and sub-scripts in the right size:
\gdef\xpt{\textfont\z@\tenrm
  \scriptfont\z@\sevrm \scriptscriptfont\z@\fivrm
\textfont\@ne\tenmi \scriptfont\@ne\sevmi \scriptscriptfont\@ne\fivmi
\textfont\tw@\tensy \scriptfont\tw@\sevsy \scriptscriptfont\tw@\fivsy
\textfont\thr@@\tenex \scriptfont\thr@@\tenex \scriptscriptfont\thr@@\tenex
\def\unboldmath{\everymath{}\everydisplay{}\@nomath\unboldmath
          \textfont\@ne\tenmi
          \textfont\tw@\tensy \textfont\lyfam\tenly
          \@boldfalse}\@boldfalse
\def\boldmath{\@ifundefined{tenmib}{\global\font\tenmib\@mbi
   \global\font\tensyb\@mbsy
   \global\font\tenlyb\@lasyb\relax\@addfontinfo\@xpt
   {\def\boldmath{\everymath{\mit}\everydisplay{\mit}\@prtct\@nomathbold
        \textfont\@ne\tenmib \textfont\tw@\tensyb
        \textfont\lyfam\tenlyb \@prtct\@boldtrue}}}{}\@xpt\boldmath}%
\def\prm{\fam\z@\tenrm}%
\def\pit{\fam\itfam\tenit}\textfont\itfam\tenit \scriptfont\itfam\sevit
    \scriptscriptfont\itfam\sevit
\def\psl{\fam\slfam\tensl}\textfont\slfam\tensl
     \scriptfont\slfam\tensl \scriptscriptfont\slfam\tensl
\def\pbf{\fam\bffam\tenbf}\textfont\bffam\tenbf
    \scriptfont\bffam\sevbf \scriptscriptfont\bffam\fivbf
\def\ptt{\fam\ttfam\tentt}\textfont\ttfam\tentt
    \scriptfont\ttfam\tentt \scriptscriptfont\ttfam\tentt
\def\psf{\fam\sffam\tensf}\textfont\sffam\tensf
    \scriptfont\sffam\tensf \scriptscriptfont\sffam\tensf
\def\psc{\@getfont\psc\scfam\@xpt{\@mcsc}}%
\def\ly{\fam\lyfam\tenly}\textfont\lyfam\tenly
   \scriptfont\lyfam\sevly \scriptscriptfont\lyfam\fivly
\@setstrut \rm}
%
\gdef\@normalsize{\ifdraft
\@setsize\normalsize{17pt}\xpt\@xpt
\else
\@setsize\normalsize{12pt}\xpt\@xpt
\fi
\scriptfont\bffam\sevbf \scriptscriptfont\bffam\fivbf %%<<==== makes
                               % \bf change sizes in sub and superscript
\abovedisplayskip 10pt plus2pt minus5pt
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip \z@ plus3pt
\belowdisplayshortskip 6pt plus3pt minus3pt
\let\@listi\@listI\let\bit\tenbit}
%
\gdef\small{\ifdraft
\@setsize\small{17pt}\ixpt\@ixpt
\else
\@setsize\small{11pt}\ixpt\@ixpt
\fi
\abovedisplayskip 8.5\p@ plus3\p@ minus4\p@
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip \z@ plus2\p@
\belowdisplayshortskip 4\p@ plus2\p@ minus2\p@
\def\@listi{\leftmargin\leftmargini
\topsep 4\p@ plus2\p@ minus2\p@\parsep 2\p@ plus\p@ minus\p@
\itemsep \parsep}
\let\bit\ninebit}
\gdef\footnotesize{\ifdraft
\@setsize\footnotesize{17pt}\viiipt\@viiipt
\else
\@setsize\footnotesize{9.5pt}\viiipt\@viiipt
\fi
\abovedisplayskip 6\p@ plus2\p@ minus4\p@
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip \z@ plus\p@
\belowdisplayshortskip 3\p@ plus\p@ minus2\p@
\def\@listi{\leftmargin\leftmargini
\topsep 3\p@ plus\p@ minus\p@\parsep 2\p@ plus\p@ minus\p@
\itemsep \parsep}}
%
\gdef\scriptsize{\@setsize\scriptsize{8pt}\viipt\@viipt}
\gdef\tiny{\ifdraft
\@setsize\tiny{17pt}\vpt\@vpt
\else
\@setsize\tiny{6pt}\vpt\@vpt
\fi
}
\gdef\large{\ifdraft
\@setsize\large{17pt}\xiipt\@xiipt
\else
\@setsize\large{14pt}\xiipt\@xiipt
\fi
}
\gdef\Large{\@setsize\Large{18pt}\xivpt\@xivpt}
\gdef\LARGE{\@setsize\LARGE{22pt}\xviipt\@xviipt}
%
\gdef\huge{\@setsize\huge{25pt}\xxxpt\@xxxpt%% for title
\gdef\Huge{\@setsize\Huge{30pt}\xxvpt\@xxvpt}
}
%
\gdef\bfseries{\bf}
\fi

\ifll\else
\gdef\@xxxpt{}
\gdef\xxxpt{\textfont\z@\twfvrm 
  \scriptfont\z@\twtyrm \scriptscriptfont\z@\svtnrm
\textfont\@ne\twtymi \scriptfont\@ne\twtymi \scriptscriptfont\@ne\svtnmi
\textfont\tw@\twtysy \scriptfont\tw@\twtysy \scriptscriptfont\tw@\svtnsy
\textfont\thr@@\tenex \scriptfont\thr@@\tenex \scriptscriptfont\thr@@\tenex
%\def\unboldmath{\everymath{}\everydisplay{}\@nomath\unboldmath
%        \textfont\@ne\twtymi \textfont\tw@\twtysy \textfont\lyfam\twtyly
%        \@boldfalse}\@boldfalse
%\def\boldmath{\@subfont\boldmath\unboldmath}%
\def\unboldmath{\everymath{}\everydisplay{}\@nomath\unboldmath 
          \textfont\@ne\tenmi \textfont\tw@\tensy 
          \textfont\lyfam\tenly \@boldfalse}\@boldfalse
\def\boldmath{\@ifundefined{thirtymib}{\global\font
        \thirtymib\@mbi\space at\space \titlesize%\@magscale5
\global\font\thirtysyb\@mbsy\space at \titlesize %\@magscale5
         \global\font\thirtylyb\@lasyb\space at \titlesize
%\@magscale5\relax
\@addfontinfo\@xxxpt
               {\def\boldmath{\everymath
                {\mit}\everydisplay{\mit}\@prtct\@nomathbold
              \textfont\@ne\thirtymib \textfont\tw@\thirtysyb 
            \textfont\lyfam\thirtylyb\@prtct\@boldtrue}}}{}\@xxxpt\boldmath}%
\def\prm{\fam\z@\twfvrm}%
\def\pit{\it\rm}%
\def\psl{\sl\rm}%
\def\pbf{\rm}%
\def\ptt{\rm}%
\def\psf{\@subfont\sf\rm}%
\def\psc{\@subfont\sc\rm}%
\def\ly{\fam\lyfam\twtyly}\textfont\lyfam\twtyly 
   \scriptfont\lyfam\twtyly \scriptscriptfont\lyfam\svtnly 
\@setstrut \bf}
\fi

\normalsize 

%% Special Purpose Fonts
\font\smallcaps=cmcsc10 scaled 700
\font\medcaps=cmcsc10 scaled 750 %
\font\elvrm=cmr10 scaled \magstephalf
\font\elvbf=cmbx10 scaled \magstephalf
% Special Fonts to make bold in super- and sub-scripts be the right size.
\font\sevbf =cmbx7
\font\fivbf =cmbx5

%% Redefining viipt, used for \scriptsize, here to make \tt use 
%% cmtt8 rather than \rm which is the default substitution. 
%% There is no cmtt7, so this is the best we can do with Computer Modern.

\ifll\else
\def\viipt{\textfont\z@\sevrm
  \scriptfont\z@\sixrm \scriptscriptfont\z@\fivrm
\textfont\@ne\sevmi \scriptfont\@ne\fivmi \scriptscriptfont\@ne\fivmi
\textfont\tw@\sevsy \scriptfont\tw@\fivsy \scriptscriptfont\tw@\fivsy
\textfont\thr@@\tenex \scriptfont\thr@@\tenex \scriptscriptfont\thr@@\tenex
\def\prm{\fam\z@\sevrm}%
\def\unboldmath{\everymath{}\everydisplay{}\@nomath
\unboldmath\@boldfalse}\@boldfalse
\def\boldmath{\@subfont\boldmath\unboldmath}%
\def\pit{\fam\itfam\sevit}\textfont\itfam\sevit
   \scriptfont\itfam\sevit \scriptscriptfont\itfam\sevit
\def\psl{\@subfont\sl\it}%
\def\pbf{\@getfont\pbf\bffam\@viipt{cmbx7}}%
\def\ptt{\@getfont\ptt\ttfam\@viipt{cmtt8}\@nohyphens\ptt\@viipt}%
\def\psf{\@subfont\sf\rm}%
\def\psc{\@subfont\sc\rm}%
\def\ly{\fam\lyfam\sevly}\textfont\lyfam\sevly
    \scriptfont\lyfam\fivly \scriptscriptfont\lyfam\fivly
\@setstrut \rm}
 
\gdef\@viipt{}
\fi

\def\titlefont{\bf}
\let\bit\bf
\let\tenbit\bf
\let\ninebit\bf
\def\bigbit{\Large\it}
\def\medbit{\large\it}
\def\issuetocfont{\LARGE\bf}
\let\sectionfont\bf
\let\subsectionfont\it
\let\subsubsectionfont\it

%%%%%%%
%% Variations on  LaTeX book.sty 

\def\@ptsize{0}               % Default is REP10.STY
\@namedef{ds@11pt}{\def\@ptsize{1}} % 11pt option reads in REP11.STY
\@namedef{ds@12pt}{\def\@ptsize{2}} % 12pt option reads in REP12.STY

\@twosidetrue     %  Defines twoside option.
\@mparswitchtrue  %  Marginpars go on outside of page.

\def\ds@draft{\overfullrule 5pt}  % Causes overfull hboxes to be marked.

\newif\ifdraft
\def\draft{\global\drafttrue
\def\@oddfoot{\vtop to 0pt{\vskip24pt\large\tt
D R A F T\hfill\today, \realtime\hfill D R A F T\global\titlefalse\vss}}
\def\@evenfoot{\@oddfoot}\ifll\normalsize
\else\normalsize\@normalsize\fi}

\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}


\def\fix{\ifcase\oldtime 0\or0\or0\or%
0\or0\or0\or0\or0\or0\or0\fi}
\def\fixtiming{\ifcase\timing 0\or0\or0\or% 
0\or0\or0\or0\or0\or0\or0\fi}
\newcount\timing 
\newcount\hourcount
\newcount\oldtime 

\def\realtime{\timing=\time \oldtime=\time
\ifnum\timing>60 \divide\timing by 60
\hourcount=\the\timing
\multiply\timing by 60
\advance\oldtime by-\timing
\ifnum\hourcount<12 \number\hourcount:\fix\number\oldtime am\fi%
\ifnum\hourcount=12 \number\hourcount:\fix\number\oldtime pm\fi%
\ifnum\hourcount>12 \advance\hourcount by-12
\number\hourcount:\fix\number\oldtime pm\fi
\else12:\fixtiming\number\timing am\fi}

\lineskip 1pt \normallineskip 1pt
\def\baselinestretch{1}


\predisplaypenalty=10000

\oddsidemargin 1in \evensidemargin 1in 
\marginparwidth .75in \marginparsep 7pt 
 \topmargin .75in \headheight 12pt \headsep 24pt \footskip .35in 

\voffset-.5in
\textheight = 45.5pc
\textwidth 30pc 

\columnsep 10pt \columnseprule 0pt 

\footnotesep 6.65pt 
\skip\footins 9pt plus 4pt minus 2pt 
\floatsep 12pt plus 2pt minus 2pt \textfloatsep 20pt plus 2pt minus 4pt
\intextsep 12pt plus 2pt minus 2pt  \dblfloatsep 12pt plus 2pt
minus 2pt \dbltextfloatsep 20pt plus 2pt minus 4pt 
\@fptop 0pt plus 1fil \@fpsep 8pt plus 2fil \@fpbot 0pt plus 1fil 
\@dblfptop 0pt plus 1fil \@dblfpsep 8pt plus 2fil \@dblfpbot 0pt plus 1fil
\marginparpush 5pt 


\parskip 0pt plus 1pt \parindent 8pt \partopsep 2pt plus 1pt minus 1pt 
\@lowpenalty 51 \@medpenalty 151 \@highpenalty 301 
\@beginparpenalty -\@lowpenalty \@endparpenalty -\@lowpenalty \@itempenalty
-\@lowpenalty 

\clubpenalty=10000
\widowpenalty=10000

%% Article commands:

\def\authorrunninghead#1{\def\theauthors{\uppercase{#1}}}
\def\titlerunninghead#1{\def\thetitle{\uppercase{#1}}}

\def\thetitle{\relax}
\def\theauthors{}

\newif\iftechnote
\def\technicalnote{\global\technotetrue}

\def\aster{\raise.4ex\hbox{*}}

\let\savefootnotetext\footnotetext

\newcount\thanksnum
\newcount\dothanks

\def\dothankssymbol{\ifcase\thanksnum\or *\or **\or $\dagger$\or
$\ddagger$\or $\mathchar "278$\or $\mathchar "27B$\or $\|$\or $\dagger\dagger$
   \or $\ddagger\ddagger$ \else\@ctrerr\fi\relax}

\def\thanks#1{\global\advance\thanksnum by1\relax 
\global\advance\dothanks by1
\raise.5ex\hbox{\normalsize\unskip\dothankssymbol}}

\newif\iftitle
\def\title#1{\global\appendonfalse
\setbox1=\hbox{\let\thanks\maketemp #1}
\refstepcounter{chapter}
\c@section=0
\c@subsection=0
\c@subsubsection=0
\c@footnote=0
\c@equation=0
\c@figure=0
\c@table=0
%%
\vspace*{10pt}
\iftechnote\global\technotefalse
\noindent {\bigbit Technical Note}\vskip4pt\fi
\global\titletrue
%%
{\def\\ {\hfill\break}%
\Large\raggedright\hyphenpenalty=10000\relax
\noindent\titlefont#1\vskip12pt
}}



\let\articletitle\title

\long\def\author#1\email#2{\emailauthor{#1}{#2}}
\long\def\authors#1\email#2{\emailauthor{#1}{#2}}

\def\eatone#1{}

\newcount\thankscounter
\def\maketemp#1{\global\advance\thankscounter by1\relax 
\expandafter\gdef\csname tempthanks\the\thankscounter\endcsname{#1}}


\long\def\emailauthor#1#2{\ifdim\lastskip=4pt \vskip-6pt\fi
\setbox1=\hbox{\let\thanks\maketemp #1}
\setbox0=\hbox{\let\thanks\eatone%
{\smallcaps\uppercase{#1}}\qquad{\footnotesize\lowercase{#2}}}
\ifdim\wd0<30pc
\hbox to30pc{{\smallcaps\uppercase{#1}}\hfill
{\footnotesize\lowercase{#2}}}
\else
\noindent{\smallcaps\uppercase{#1}}
\vskip4pt
\setbox1=\hbox{\footnotesize\lowercase{#2}}
\ifdim\wd1>30pc\message{EMAIL ADDRESS TOO WIDE! PLEASE LIST
SEPARATELY!}
! EMAIL ADDRESS TOO WIDE! PLEASE LIST SEPARATELY !

#2
\else\hbox to30pc{\hfill\footnotesize\lowercase{#2}}\fi\fi%
%
\vskip1pt}



\def\affil#1{{\def\\ {\hfill\break}
\footnotesize\it\noindent#1
\vskip8pt}}

\def\editor#1{\receivedline\vskip4pt
{\footnotesize\noindent{\bf Communicated by:} #1\vskip1sp}}

\def\editors#1{\receivedline\vskip4pt
{\footnotesize\noindent{\bf Editors:} #1\vskip1sp}}

\long\def\abstract#1{\receivedline\vskip14pt
{\footnotesize\noindent{\bf Abstract.} #1\vskip1sp}
\ifnum\thanksnum>0 \global\thanksnum=0
%
\long\def\@makefntext##1{\noindent
	   \raise.5ex\hbox to 12pt{\dothankssymbol\hfill}##1}
\loop
\ifnum\thanksnum<\thankscounter
\global\advance\thanksnum by1\relax
\savefootnotetext{\csname tempthanks\the\thanksnum\endcsname}
\repeat\global\thanksnum=0 \global\thankscounter=0
%
\fi
}

\def\makethankswork{\ifnum\thanksnum>0 \global\thanksnum=0
%
\long\def\@makefntext##1{\noindent
\raise.5ex\hbox to 12pt{\dothankssymbol\hfill}##1}%
\loop%
\ifnum\thanksnum<\thankscounter
\global\advance\thanksnum by1\relax
\savefootnotetext{\csname tempthanks\the\thanksnum\endcsname}
\repeat\global\thanksnum=0 \global\thankscounter=0
%
\fi}

\def\keywords#1{\vskip12pt
{\footnotesize\noindent{\bf Keywords:} #1\vskip4pt}}

\def\issuenumber#1{\def\currissuenumber{#1}}
\def\issuemonth#1{\def\currissuemonth{#1}}
\def\volnumber#1{\def\currvolnumber{#1}}
\def\volyear#1{\def\currvolyear{#1}}
\def\journame#1{\def\thisjourname{#1}
\ifx\thisjourname\jacojour \jaco\fi
}

\volnumber{}
\volyear{}
\issuenumber{}
\issuemonth{}
\journame{}

\newcount\articlenumber

\def\article{\clearpage
\ifodd\c@page\else\null\clearpage\fi}


\def\endarticle{\ifvoid\kluwerdatebox\else\unvbox\kluwerdatebox\fi
\notes
\def\receivedline{\relax}
\write\@auxout{\string\expandafter
\string\gdef\string\csname\space 
endpage\the\articlenumber\endcsname{\the\c@page}}
\newpage\authorrunninghead{}}

\def\kluwerline{\global\advance\articlenumber by1
\hbox to30pc{\hfill\footnotesize \thisjourname,
\currvolnumber, \the\c@page
\expandafter\ifx\csname endpage\the\articlenumber\endcsname\relax%
??\else
\ifnum\c@page=%
\expandafter\csname endpage\the\articlenumber\endcsname\else--%
\csname endpage\the\articlenumber\endcsname\fi\fi\ (\currvolyear)}
\vskip2pt%
\hbox to30pc{\hfill\footnotesize \raise1.5pt\hbox{\scriptsize\copyright}%
\ \currvolyear\ %
Kluwer Academic Publishers, Boston. Manufactured in The Netherlands.}
\vskip3pt
}

\def\jacokluwerline{\global\advance\articlenumber by1
\hbox to30pc{\hfill\footnotesize \thisjourname,
{\bf\currvolnumber}, (\currvolyear), % <== jaco
\the\c@page
\expandafter\ifx\csname endpage\the\articlenumber\endcsname\relax%
??\else
\ifnum\c@page=%
\expandafter\csname endpage\the\articlenumber\endcsname\else--%
\csname endpage\the\articlenumber\endcsname\fi\fi}
\vskip2pt
\hbox to30pc{\hfill\footnotesize \raise1.5pt\hbox{\scriptsize\copyright}%
\ \currvolyear\ %
Kluwer Academic Publishers, Boston. Manufactured in The Netherlands.}
\vskip3pt
}

\newcount\footnum
\newcount\savefootnum

\def\notes{\ifnum\footnum=0\else
\savefootnum=\footnum
\footnum=0
\section*{Notes}%
\noindent\loop\ifnum\savefootnum>\footnum%
\global\advance\footnum by1\relax%
\csname foot\the\footnum\endcsname\relax%
\expandafter\gdef\csname foot\the\footnum\endcsname{\relax}\relax%
\repeat\global\footnum=0\relax\fi}

\let\endnotes\notes

\def\footnote#1{\global\advance\footnum by 1\relax$^{\the\footnum}$%
\long\expandafter\gdef\csname foot\the\footnum\endcsname{%
\vtop{\footnotesize\hsize=30pc\leftskip=12pt\relax\parindent=-12pt
\indent\hbox to12pt{\the\footnum.\hfill}{#1\strut\vskip1sp}}\vskip1pt}}

\def\footnotetext#1{\global\advance\footnum by 1\relax
\long\expandafter\gdef\csname foot\the\footnum\endcsname{%
\vtop{\footnotesize\hsize=30pc\leftskip=12pt\relax\parindent=-12pt
\indent\hbox to12pt{\the\footnum.\hfill}{#1\strut\vskip1sp}}\vskip1pt}}

%% End Matter
\def\acknowledgments{\goodbreak\section*{Acknowledgments}}

\let\acknowledgements\acknowledgments

\def\bibliography#1{\if@filesw\immediate\write\@auxout{\string\bibdata{#1}}\fi
\notes\@input{\jobname.bbl}}

\def\thebibliography#1{\notes\section*{References}%
\bgroup\footnotesize\labelsep=6pt
\list{\arabic{enumi}.}{\settowidth\labelwidth{[99]}\leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \usecounter{enumi}}
    \def\newblock{\hskip .11em plus .33em minus .07em}
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=1000\itemsep=-1.5pt\relax}

\def\endthebibliography{\endlist\egroup\vskip\baselineskip\relax}

\def\references{\notes\goodbreak\section*{References}
\bgroup\footnotesize\labelsep=6pt 
\list{\arabic{enumi}.}{\settowidth\labelwidth{[99]}\leftmargin\labelwidth
 \advance\leftmargin\labelsep
 \usecounter{enumi}}
 \def\newblock{\hskip .11em plus .33em minus .07em}
 \sloppy\clubpenalty4000\widowpenalty4000
 \sfcode`\.=1000\relax\itemsep=-1.5pt\frenchspacing}

\def\endreferences{\endlist\egroup\vskip\baselineskip\relax
\ifvoid\kluwerdatebox\else\unvbox\kluwerdatebox\fi}


%% Alphabetical References
\def\alphareferences{\defroundbrackets\notes\goodbreak
\section*{References}
\bgroup\let\bibitem\alphabibitem\footnotesize \leftskip=6pt
 \def\newblock{\hskip .11em plus .33em minus .07em}
\parindent=-6pt \itemsep=-\parskip
\global\firstbibtrue
\indent\hskip-6pt\relax\ignorespaces}

\def\endalphareferences{\vskip1sp\egroup}

\def\bibalpharefs#1{\notes\goodbreak
\section*{References}
\bgroup\let\bibitem\bibalphabibitem\footnotesize \leftskip=6pt
\parindent=-6pt \itemsep=-\parskip
\vskip-10pt
\indent\hskip-6pt%
\def\newblock{\hskip .11em plus .33em minus .07em}%
\ignorespaces}
\def\endbibalpharefs{\vskip1sp\egroup}

\def\defroundbrackets{\write\@auxout{\string\gdef\string\lcitebracket{(}%
\string\gdef\string\rcitebracket{)}}}

\def\alphabibliography{\defroundbrackets\let\thebibliography\bibalpharefs
\let\endthebibliography\endbibalpharefs\bibliography}

\newif\iffirstbib
\def\alphabibitem{\iffirstbib\vskip-9pt
\global\firstbibfalse\fi
\@ifnextchar[{\alpha@lbibitem}{\alpha@bibitem}}
\def\bibalphabibitem{\@ifnextchar[{\alpha@lbibitem}{\alphaerror}}

\def\alpha@lbibitem[#1]#2{\vskip-\parskip%\item[\@biblabel{#1}]
\if@filesw 
      { \def\protect##1{\string ##1\space}\immediate
        \write\@auxout{\string\bibcite{#2}{#1}}}\fi\ignorespaces}

\def\alphaerror#1{\vskip-\parskip\if@filesw 
      { \def\protect##1{\string ##1\space}\immediate
        \write\@auxout{\string\bibcite{#1}{\string\typeout{<<<Please do
not use \string\string\string\cite\string\space\space when 
using \string\string\string\alphabibliography.\string\space\space
See documentation if you have questions.>>>}}}}\fi%
\ignorespaces}

\def\alpha@bibitem#1{\vskip-\parskip\relax%\item
\if@filesw \immediate\write\@auxout
       {\string\bibcite{#1}{#1}}\fi\ignorespaces}

\def\@lbibitem[#1]#2{\item\if@filesw 
      { \def\protect##1{\string ##1\space}\immediate
        \write\@auxout{\string\bibcite{#2}{\theenumi}}}\fi\ignorespaces}


\newif\ifappendon

\def\applett{}

\def\appendix#1{\gdef\applett{#1}
\ifx\applett\empty\gdef\applett{A}\fi
\goodbreak
\global\appendontrue
\c@section=0
\c@subsection=0
\c@subsubsection=0
\c@equation=0
\c@figure=0
\c@table=0
\xdef\@currentlabel{\applett}
\section*{Appendix #1}}

\def\appendixtitle#1{\vskip-8pt\vskip1sp\section*{#1}}

% \@startsection {NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE} 
%            optional * [ALTHEADING]{HEADING}
%    Generic command to start a section.  
%    NAME       : e.g., 'subsection'
%    LEVEL      : a number, denoting depth of section -- e.g., chapter=1,
%                 section = 2, etc.  A section number will be printed if
%                 and only if LEVEL < or = the value of the secnumdepth
%                 counter.
%    INDENT     : Indentation of heading from left margin
%    BEFORESKIP : Absolute value = skip to leave above the heading.  
%                 If negative, then paragraph indent of text following 
%                 heading is suppressed.
%    AFTERSKIP  : if positive, then skip to leave below heading,
%                       else - skip to leave to right of run-in heading.
%    STYLE      : commands to set style
%  If '*' missing, then increments the counter.  If it is present, then
%  there should be no [ALTHEADING] argument.  A sectioning command
%  is normally defined to \@startsection + its first six arguments.


\def\section{\@startsection {section}{1}{\z@}{-16pt plus -2pt minus 
 -1pt}{12pt plus 1pt}{\normalsize\boldmath\sectionfont}}
\def\subsection{\@startsection{subsection}{2}{\z@}{-16pt plus -2pt
minus -1pt}{12pt plus 1pt}{\normalsize\boldmath\subsectionfont}}
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{-20pt
plus -2pt minus -1pt}{-12pt}{\normalsize\subsubsectionfont\unskip\relax}}



\def\paragraph#1{\vskip1sp\noindent{\bit#1}\enspace}

\setcounter{secnumdepth}{3}

\leftmargini 16pt %24pt
\leftmarginii 18pt % 22pt 
\leftmarginiii 18pt %18.7pt 
\leftmarginiv 16pt %
\leftmarginv 10pt
\leftmarginvi 10pt
\leftmargin\leftmargini
\labelsep 6pt

\labelwidth\leftmargini\advance\labelwidth-\labelsep
\def\@listI{\leftmargin\leftmargini \parsep 4pt plus 2pt minus 1pt\topsep 8pt
plus 2pt minus 4pt}
\let\@listi\@listI
\@listi 
\def\@listii{\leftmargin\leftmarginii
 \labelwidth\leftmarginii\advance\labelwidth-\labelsep
 \topsep 4pt plus 2pt minus 1pt
 \parsep 2pt plus 1pt minus 1pt
 \itemsep \parsep}
\def\@listiii{\leftmargin\leftmarginiii
 \labelwidth\leftmarginiii\advance\labelwidth-\labelsep
 \topsep 2pt plus 1pt minus 1pt 
 \parsep \z@ \partopsep 1pt plus 0pt minus 1pt
 \itemsep \topsep}
\def\@listiv{\leftmargin\leftmarginiv
 \labelwidth\leftmarginiv\advance\labelwidth-\labelsep}
\def\@listv{\leftmargin\leftmarginv
 \labelwidth\leftmarginv\advance\labelwidth-\labelsep}
\def\@listvi{\leftmargin\leftmarginvi
 \labelwidth\leftmarginvi\advance\labelwidth-\labelsep}

%%%%% End of Bk10.sty

\def\labelenumi{\theenumi.}    
\def\theenumi{\arabic{enumi}}     
 
\def\labelenumii{(\theenumii)}
\def\theenumii{\Alph{enumii}}
\def\p@enumii{\theenumi}

\def\labelenumiii{\theenumiii.}
\def\theenumiii{\hskip5pt\hbox to5pt{\hss\roman{enumiii}}}
\def\p@enumiii{\theenumi(\theenumii)}

\def\labelenumiv{\theenumiv.}
\def\theenumiv{\Alph{enumiv}}     
\def\p@enumiv{\p@enumiii\theenumiii}

\def\labelitemi{$\bullet$}
\def\labelitemii{\bf --}
\def\labelitemiii{$\ast$}
\def\labelitemiv{$\cdot$}

\def\verse{\let\\=\@centercr  
  \list{}{\itemsep\z@ \itemindent -1.5em\listparindent \itemindent 
          \rightmargin\leftmargin\advance\leftmargin 1.5em}\item[]}
\let\endverse\endlist

\def\quotation{\list{}{\listparindent 1.5em
    \itemindent\listparindent
    \rightmargin\leftmargin\parsep 0pt plus 1pt}\item[]}
\let\endquotation=\endlist

\def\quote{\list{}{\rightmargin\leftmargin}\item[]}
\let\endquote=\endlist

\def\descriptionlabel#1{\hspace\labelsep \bf #1}
\def\description{\list{}{\labelwidth\z@ \itemindent-\leftmargin
       \let\makelabel\descriptionlabel}}

\let\enddescription\endlist

\newdimen\descriptionmargin
\descriptionmargin=3em

\arraycolsep 3pt %5pt %Half the space between columns in an array environment.
\tabcolsep 6pt     % Half the space between columns in a tabular environment.
\arrayrulewidth .4pt % Width of rules in array and tabular environment.
\doublerulesep 2pt   % Space between adjacent rules in array or tabular env.

\tabbingsep \labelsep   % Space used by the \' command.  (See LaTeX manual.)

\skip\@mpfootins = \skip\footins

\fboxsep = 3pt    % Space left between box and text by \fbox and \framebox.
\fboxrule = .4pt  % Width of rules in box made by \fbox and \framebox.

\newcounter{part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]

\def\@sect#1#2#3#4#5#6[#7]#8{\ifnum #2>\c@secnumdepth
     \def\@svsec{}\else 
     \refstepcounter{#1}\edef\@svsec{\csname the#1\endcsname.%<=== new, 7/1/93
\hskip 1em }\fi
     \@tempskipa #5\relax
      \ifdim \@tempskipa>\z@ 
        \begingroup #6\relax
          \@hangfrom{\hskip #3\relax\@svsec}{\interlinepenalty \@M #8\par}%
        \endgroup
       \csname #1mark\endcsname{#7}\addcontentsline
         {toc}{#1}{\ifnum #2>\c@secnumdepth \else
                      \protect\numberline{\csname the#1\endcsname}\fi
                    #7}\else
        \def\@svsechd{#6\hskip #3\@svsec #8\csname #1mark\endcsname
                      {#7}\addcontentsline
                           {toc}{#1}{\ifnum #2>\c@secnumdepth \else
                             \protect\numberline{\csname the#1\endcsname}\fi
                       #7}}\fi
     \@xsect{#5}}


\def\thepart          {\Roman{part}}
\def\thechapter       {}
\def\thesection       {\ifappendon \applett.\fi\arabic{section}}
\def\thesubsection    {\thesection.\arabic{subsection}}
\def\thesubsubsection {\thesubsection.\arabic{subsubsection}}

\def\@pnumwidth{1.55em}
\def\@tocrmarg {2.55em}
\def\@dotsep{4.5}
\setcounter{tocdepth}{2}


\long\def\@makefntext#1{\parindent 1em\noindent 
            \hbox to 1.8em{\hss$^{\@thefnmark}$}#1}

%  \c@topnumber            : Number of floats allowed at the top of a column.
%  \topfraction            : Fraction of column that can be devoted to floats.
%  \c@dbltopnumber, \dbltopfraction : Same as above, but for double-column
%                          floats.
%  \c@bottomnumber, \bottomfraction : Same as above for bottom of page.
%  \c@totalnumber          : Number of floats allowed in a single column, 
%                          including in-text floats.
%  \textfraction         : Minimum fraction of column that must contain text.
%  \floatpagefraction    : Minimum fraction of page that must be taken
%                          up by float page.

%% June 10, 1993, reset these to more generous values to make it easier
%% to position floats.

\setcounter{topnumber}{10}
\setcounter{bottomnumber}{10}

\def\topfraction{.99}
\def\bottomfraction{.99}
\def\textfraction{.01}
\def\floatpagefraction{.5}

\setcounter{totalnumber}{20}

\setcounter{dbltopnumber}{2}
\def\dbltopfraction{.7}
\def\dblfloatpagefraction{.5}

\newcounter{figure}[chapter]
\def\thefigure{\@arabic\c@figure}

\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{Figure\ \ifappendon\applett.\fi\thefigure\theletter}
\def\figure{\@float{figure}}
\let\endfigure\end@float
\def\endfigure{\end@float\gdef\@currentlabel{}}
\@namedef{figure*}{\@dblfloat{figure}}
\@namedef{endfigure*}{\end@dblfloat}
%\def\table{\@float{table}}
\let\endtable\end@float
\def\savetable{\@float{table}}
\let\endsavetable\end@float

\def\specialtable{\small\def\@captype{table}
\refstepcounter\@captype\@float{table}}
\def\endspecialtable{\end@float}

\newcounter{table}[chapter]
\def\thetable{\@arabic\c@table}

\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{Table \ifappendon\applett.\fi\thetable\theletter}

\mark{{}{}}   % Initializes TeX's marks

\newif\ifkluwerlogo
\def\kluwerlogo{\global\kluwerlogotrue}

\def\ps@headings{\def\@oddfoot{}\def\@evenfoot{}%       No feet.
\def\@evenhead{{\elvrm\thepage}\hfil\medcaps\theauthors}% 
                                                %       Left heading.

\def\@oddhead{\hbox{}\iftitle\global\titlefalse
\hfill\vbox to0pt{\vss
\hbox to\textwidth{\ifkluwerlogo
\vbox to0pt{\vss\hbox to0pt{%% Suzanne, 
%% you can change this dimension to reposition the graphic horizontally:
\hskip 1pt
\hspace*{2.5in}\psfig{figure=kap.eps,height=.30in}
\hss}
%% Suzanne, 
%% you can change this dimension to reposition the graphic vertically:
\vskip3pt}\fi\hfill\vbox{\kluwerline}}}
\else
{\medcaps\thetitle}\hfil{\elvrm\thepage}\fi}% Right heading.
}



\ps@headings                % `headings' page style
\pagenumbering{arabic}      % Arabic page numbers
\onecolumn                  % Single-column.


%%%%%%%%%%%%
%%% Math

\@addtoreset{equation}{chapter}   % Makes \chapter reset 'equation' counter.

\def\themathletter{\relax}

\def\mathletter#1{\gdef\themathletter{#1}}


\def\splitmath#1\\ #2\end#3{\arraycolsep=0pt
\mathindent=0pt
\begin{equation}
\begin{array}{ll}
#1\\
&#2
\end{array}
\end{equation}\aftergroup{\end{splitmath}}}
\let\endsplitmath\relax

\newif\ifinmathqed
\newif\ifqedequation

\def\theequation{\ifappendon\applett.\fi\arabic{equation}\themathletter}


%%% Variation on Fleqn.sty
% fleqn.sty 24-May-89

\linewidth=30pc

\def\[{\relax\global\inmathqedfalse\global\qedequationfalse
\ifmmode\@badmath\else\bgroup\@beginparpenalty\predisplaypenalty
 \@endparpenalty\postdisplaypenalty
 \begin{trivlist}
\vskip\abovedisplayskip
\item[]\leavevmode
 \hbox to\linewidth\bgroup$ \displaystyle
 \hskip\mathindent\bgroup\fi}

\def\]{\relax\ifmmode \egroup $\hfil%
\ifinmathqed\vrule height 6pt width6pt depth0pt\relax\fi%
\egroup%
\ifinmathqed\else\vskip\belowdisplayskip\fi%
\end{trivlist}%
\egroup\else%
\@badmath \fi\noindent\ignorespaces}

\def\xrelax{\relax}


\newif\iffirsttime
\global\firsttimetrue
\newif\ifequation
\def\equation{\global\qedequationfalse%
\global\inmathqedfalse\global\equationtrue%
\@beginparpenalty\predisplaypenalty%
\@endparpenalty\postdisplaypenalty%
\trivlist%
\vskip\abovedisplayskip%
\item[]\leavevmode%
\setbox0=\hbox\bgroup $ \displaystyle%
\hskip\mathindent\let\label\xlabel}

\def\endequation{$\egroup%
\ifx\themathletter\xrelax\global\firsttimetrue%
\refstepcounter{equation}\else%
\iffirsttime\global\firsttimefalse\refstepcounter{equation}\fi\fi%
\setbox1=\hbox{\copy0\@eqnnum}%
\ifdim\wd1>\linewidth%
\vbox{\unskip\noindent\hbox to\linewidth{\unhbox0\hss}\vskip3pt%
\noindent\hbox to\linewidth{\hfill\displaywidth\linewidth\llap{\@eqnnum}}}%
\else%
\vbox{\unskip\noindent\hbox to\linewidth{%
\unhbox0\hfil\displaywidth\linewidth\llap{\@eqnnum}}}%
\fi%
\let\@currentlabel=\theequation
\ifx\templabel\relax\else\savelabel{\templabel}\fi%
\global\let\templabel\relax
\gdef\themathletter{\relax}%
\ifinmathqed\global\inmathqedfalse\global\qedequationtrue\fi%
\vskip\belowdisplayskip%
\endtrivlist\def\themathletter{\relax}\global\equationfalse}


\def\@@eqncr{\let\@tempa\relax 
    \ifcase\@eqcnt \def\@tempa{& & &}\or \def\@tempa{& &} 
      \else \def\@tempa{&}\fi 
     \@tempa 
\ifx\themathletter\xrelax
%% Aug. 9 bug fix ==>
\if@eqnsw
\stepcounter{equation}\fi
%% <==
\else\iffirsttime\global\firsttimefalse\stepcounter{equation}
\fi\fi
\if@eqnsw\@eqnnum 
\fi
\ifx\templabel\relax\else\savelabel{\templabel}\fi%%% <<=== oct 14, make label
\global\let\templabel\relax                  % catch current number and letter
\global\let\themathletter\xrelax %% <<=== oct 4
\global\@eqnswtrue\global\@eqcnt\z@\cr}




\def\xlabel#1{\gdef\templabel{#1}}

\def\eqnarray{\global\qedequationfalse%
\global\inmathqedfalse\let\@currentlabel=\theequation
\global\@eqnswtrue
\let\label\xlabel
\global\@eqcnt\z@\tabskip\mathindent\let\\=\@eqncr 
\abovedisplayskip\topsep\ifvmode\advance\abovedisplayskip\partopsep\fi
\belowdisplayskip\abovedisplayskip
\belowdisplayshortskip\abovedisplayskip
\abovedisplayshortskip\abovedisplayskip
$$\halign to
\linewidth\bgroup\@eqnsel\hskip\@centering$\displaystyle\tabskip\z@
 {##}$&\global\@eqcnt\@ne 
 \hskip 2\arraycolsep \hfil${##}$\hfil
 &\global\@eqcnt\tw@ 
 \hskip 2\arraycolsep $\displaystyle{##}$\hfil 
 \tabskip\@centering&\llap{##}\tabskip\z@\cr}


\def\xslug{\slug}

\def\endeqnarray{\@@eqncr\egroup
\global\firsttimetrue
$$\let\@currentlabel=\theequation
\ifx\templabel\relax\else\savelabel{\templabel}\fi%
\global\let\templabel\relax 
\ifx\@eqnnum\xslug\else
\ifinmathqed\global\inmathqedfalse\global\qedequationtrue\fi\fi
\def\themathletter{\relax}\global\@ignoretrue}

\let\templabel\relax
\newdimen\mathindent 
\mathindent = 24pt

\def\wideequation{\mathindent=0pt}
\def\endwideequation{\global\mathindent=24pt\global\@ignoretrue}

\let\save@eqnnum\@eqnnum
\let\@seqncr=\@eqncr
\@namedef{eqnarray*}{\def\@eqncr{\nonumber\@seqncr}\eqnarray}
\@namedef{endeqnarray*}{\ifinmathqed%
\gdef\@eqnnum{\slug}\global\advance\c@equation -1\relax
\else\nonumber\fi\endeqnarray
\global\let\@eqnnum\save@eqnnum}

%% \bbf makes boldface math change sizes in sub and superscripts.
%% Use \[\bbf X^{\bbf Y^{\bbf Z}}\] etc. 

\def\bbf#1{%
\mathchoice{\mbox{\bf #1}}{\mbox{\bf #1}}{\mbox{\scriptsize\bf #1}}%
{\mbox{\tiny\bf #1}}}


%%% End Math

%%% Captions

\def\theletter{\relax}
\newif\ifxfirsttime
\xfirsttimetrue

\def\caption{\ifx\@captype\xtable\else%
\ifx\theletter\xrelax%
\global\xfirsttimetrue\refstepcounter\@captype\else%
\ifxfirsttime\global\xfirsttimefalse\refstepcounter\@captype\fi\fi\fi%
\edef\@currentlabel{\ifappendon\applett.\fi%
\expandafter\csname p@\@captype\endcsname%
\expandafter\csname the\@captype\endcsname\theletter}%
\xdef\currcaptype{\@captype}%
\@dblarg{\@caption\@captype}}

\def\letteredcaption#1{\gdef\theletter{#1}\caption}

\long\def\@makecaption#1#2{%
\ifx\@captype\xtable\vskip1pt\else\vskip18pt\fi
%
\noindent\iflandscape\global\landscapefalse\leftskip-11pc\fi%
\footnotesize{}{\it\relax#1.} #2\vskip1sp\par \leftskip=0pt
%
\edef\@currentlabel{\ifappendon\applett.\fi%
\expandafter\csname p@\@captype\endcsname%
\expandafter\csname the\@captype\endcsname\theletter}
%
\gdef\theletter{\relax}
\ifx\@captype\xtable\vskip6pt\fi
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Table Macros

\long\def\@caption#1[#2]#3{\par
\begingroup
    \@parboxrestore
    \normalsize
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup}

\def\catchlabel{}
\let\savelabel\label

\expandafter\let\expandafter\savestabular\csname tabular*\endcsname
\expandafter\let\expandafter\endsavestabular\csname endtabular*\endcsname


\def\table{\let\tabular\xtabular
\let\endtabular\endxtabular
\expandafter\def\csname tabular*\endcsname ##1{%
\global\setbox\savecurrtable\hbox\bgroup\footnotesize
\def\@halignto{to ##1}\@tabular}
\expandafter \let \csname endtabular*\endcsname = \endxtabular
\def\label##1{\gdef\catchlabel{##1}}%
\def\caption##1{\gdef\catchcaption{##1}}%
\footnotesize\@float{table}}


\let\saveendtable\endtable

\def\endtable{%
\ifx\catchcaption\empty\else
\ifx\theletter\xrelax
\global\xfirsttimetrue\refstepcounter\@captype\else
\ifxfirsttime\global\xfirsttimefalse\refstepcounter\@captype\fi\fi\fi
\vskip1sp
\noindent
\iflandscape\global\landscapefalse
\vspace*{6pc}
\hbox to\textwidth{\hskip-11pc
\hbox to\textheight{\hfill%
  \vtop{\ifdim\wd\savecurrtable>0pt 
   \hsize=\wd\savecurrtable\fi
   \ifx\catchcaption\empty\else\vskip1sp\savecaption{\catchcaption}\fi
   \ifdim\wd\savecurrtable>0pt\vskip1pt
   \unhbox\savecurrtable\fi%
       }%
                  \hfill}
\hss}
\else
\hbox to30pc{\hss
  \vtop{\ifdim\wd\savecurrtable>0pt 
   \hsize=\wd\savecurrtable\fi
   \ifx\catchcaption\empty\else\vskip1sp\savecaption{\catchcaption}\fi
   \ifdim\wd\savecurrtable>0pt\vskip1pt
   \unhbox\savecurrtable\fi%
       }
\hss}%
\fi
%
\ifx\catchlabel\empty\else
\xdef\@currentlabel{\ifappendon\applett.\fi\thetable\theletter}
\savelabel{\catchlabel}\fi%
\gdef\@currentlabel{}%
\gdef\catchlabel{}
\gdef\catchcaption{}
\saveendtable}

\let\savecaption\caption
\let\catchcaption\empty
\newbox\savecurrtable

\let\savetabular\tabular
\let\endsavetabular\endtabular

\def\xtabular{\global\setbox\savecurrtable\hbox\bgroup\footnotesize
\savetabular}

\def\endxtabular{\endsavetabular\egroup}

\def\xtable{table}

\def\@array[#1]#2{\setbox\@arstrutbox=\hbox{\vrule 
     height\arraystretch \ht\strutbox
     depth\arraystretch \dp\strutbox
     width\z@}\@mkpream{#2}\edef\@preamble{\halign \noexpand\@halignto
\bgroup%
\tabskip\z@\@arstrut\@preamble
\ifx\@captype\xtable\hskip-\tabcolsep\fi%% <==== Changed
\tabskip\z@ \cr}%
\let\@startpbox\@@startpbox \let\@endpbox\@@endpbox%
  \if #1t\vtop \else \if#1b\vbox \else \vcenter \fi\fi%
  \bgroup\let\par\relax%
  \let\@sharp##\let\protect\relax \lineskip\z@\baselineskip\z@\@preamble}

%% new
\def\new@tabacol{\edef\@preamble{\@preamble\hskip0pt}}

\def\@tabclassz{\ifcase \@lastchclass\@acolampacol% 
\or \@ampacol \or
   \or \or \@addamp \or \@acolampacol\or \@firstampfalse 
\ifx\@captype\xtable \new@tabacol\else\@tabacol \fi%
\fi%
\edef\@preamble{\@preamble%
  \ifcase \@chnum%
     \hfil\ignorespaces\@sharp\unskip\hfil%
     \or \ignorespaces\@sharp\unskip\hfil%
     \or \hfil\hskip\z@ \ignorespaces\@sharp\unskip\fi}}

\let\savehline\hline
\def\hline{\noalign{\vskip3pt}\savehline\noalign{\vskip3pt}}

\@namedef{table*}{\table}
\@namedef{endtable*}{\endtable}




%%%%%%%%%%% Code examples in text

%% Algorithm

\newcount\algocount
\def\looker{\ifx\next\end\else\ifx\next\lineending\vskip-4pt%
\noindent\qquad\else\vskip0pt\global\advance\algocount by1\relax%
\noindent\hskip12pt\hbox to0pt{\hss\the\algocount.}\quad\fi\fi}

\def\lineending{\parfillskip=0pt plus1fil\relax\futurelet\next\looker}

\def\thealgocount{\the\algocount}

{\obeylines
\gdef\algorithm{\medskip\global\algocount=0
\let\@currentlabel=\thealgocount
\def\note##1{\parfillskip=0pt\hfill##1}\def\ {\qquad}%
%\baselineskip=12pt
\parskip=2pt\obeylines\let^^M=\lineending}}

\def\endalgorithm{\vskip12pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Theorems, Proofs, Examples, etc.

\newif\ifperiodaftertheorem
\def\MakePeriodAfterTheorem{\global\periodaftertheoremtrue}

\def\@begintheorem#1#2{%
\let\enumerate\saveenumerate
\let\itemize\saveitemize
\let\@trivlist\save@trivlist
\it \trivlist \item[\hskip \labelsep{\bf #1\ #2}\ifperiodaftertheorem.\fi]}

\def\@opargbegintheorem#1#2#3{\it \trivlist
      \item[\hskip \labelsep{\bf #1\ #2\ (#3)}]}

\def\@xnthm#1#2[#3]{\expandafter\@ifdefinable\csname #1\endcsname
{\@definecounter{#1}\@addtoreset{#1}{#3}%
\expandafter%
\xdef\csname the#1\endcsname{\@thmcounter{#1}}%
\global\@namedef{#1}%
{\@thm{#1}{\ifjacojour\else\sc\fi#2}%%<=== \sc added 2/24/94
}\global\@namedef{end#1}{\@endtheorem}}}

\def\@endtheorem{\if@newlist\@noitemerr\fi 
   \if@inlabel\indent\fi 
   \ifhmode\unskip \par\fi 
\vskip6pt}

\def\@thmcountersep{\ifjacojour\else.\fi}

\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{corollary}{Corollary}[chapter]
\newtheorem{lemma}{Lemma}[chapter]
\newtheorem{proposition}{Proposition}[chapter]
\newtheorem{algorithms}{Algorithm}[chapter]
\newtheorem{claim}{Claim}[chapter]

\def\TheoremTypeEnv#1{
\let\enumerate\saveenumerate
\let\itemize\saveitemize
\let\@trivlist\save@trivlist
\trivlist \item[\hskip \labelsep{\bf#1\ifjacojour\else.\fi}]}

\def\ExampleTypeEnv#1{\let\enumerate\saveenumerate
\let\itemize\saveitemize
\let\@trivlist\save@trivlist
\trivlist \item[\hskip \labelsep{\ifjacojour\bf #1:\else
\sc #1:\fi}]}




\def\remark{\TheoremTypeEnv{Remark}}
\let\endremark\endtrivlist

\def\note{\TheoremTypeEnv{Note}}
\let\endnote\endtrivlist

\def\case{\TheoremTypeEnv{{\it Case}}}
\let\endcase\endtrivlist


\def\result{\global\advance\c@resultnum by1
\TheoremTypeEnv{{\it Result \the\c@resultnum}}
\xdef\@currentlabel{\the\c@resultnum}}
\let\endresult\endtrivlist


\def\example{\ExampleTypeEnv{Example}}
\def\endexample{~\qed\endtrivlist}

\def\spexample[#1]{\ExampleTypeEnv{Example #1}}
\def\endspexample{~\qed\endtrivlist}

%%%%% 

\def\demo#1{\vskip-\lastskip
\vskip12pt
\noindent{\it#1.\/} }
\def\enddemo{\vskip12pt}


\def\inmathqed{\global\inmathqedtrue}

\def\qed{\penalty-250%
\hbox to 6pt{\hfill}\hfill\llap{%
\vbox{\hrule\hbox{\vrule height6pt\hskip6pt\vrule}\hrule}}}

\def\openbox{\global\openboxtrue}
\newif\ifopenbox

\def\slug{\ifopenbox\global\openboxfalse\qed\else\penalty-250%
\hbox to 6pt{\hfill}\hfill\llap{\vrule height 6pt width 6pt depth0pt}\fi}

\def\proof{\futurelet\next\lookforbracket}

\def\lookforbracket{\ifx\next[\let\go\usespecialterm
\else\let\go\relax
\vskip1sp\noindent{\bf Proof:}\enskip\relax\ignorespaces\fi\go}



\def\usespecialterm[#1]{\vskip12pt
\noindent{\bf #1:}\enskip\relax\ignorespaces}

\def\endproof{\ifqedequation\global\qedequationfalse\vskip-6pt%
\vskip-\belowdisplayskip\slug\else%
\ifinmathqed\global\inmathqedfalse\vskip-\belowdisplayskip
\else\slug\fi\fi\ifnum\@listdepth>0\else\vskip12pt\fi}

\def\proclaim#1{\vskip12pt\bgroup\noindent{\ifjacojour\bf\else\sc\fi#1}%
\enskip\it\ignorespaces}
\def\endproclaim{\egroup\vskip6pt}

%%% Fourth level heads, 8B

\newcount\c@definitionnum
\@addtoreset{definitionnum}{chapter}   % Makes \chapter reset 'definition'
                                       % counter. 

\newcount\c@assumptionnum
\@addtoreset{assumptionnum}{chapter}   % Makes \chapter reset 'assumption'
                                       % counter. 

\newcount\c@argumentnum
\@addtoreset{argumentnum}{chapter}     % Makes \chapter reset 'argument'
                                       % counter. 

\newcount\c@conditionnum
\@addtoreset{conditionnum}{chapter}    % Makes \chapter reset 'condition'
                                       % counter. 

\newcount\c@examplenum
\@addtoreset{examplenum}{chapter}      % Makes \chapter reset 'example'
                                       % counter. 

\newcount\c@remarknum
\@addtoreset{remarknum}{chapter}       % Makes \chapter reset 'remark'
                                       % counter. 

\newcount\c@casenum
\@addtoreset{casenum}{chapter}         % Makes \chapter reset 'case'
                                       % counter. 

\newcount\c@resultnum
\@addtoreset{resultnum}{chapter}       % Makes \chapter reset 'result'
                                       % counter. 

\newskip\aboveexampskip
\aboveexampskip=12pt plus1pt

\def\definition{\futurelet\next\Dlookforbracket}

\def\Dlookforbracket{\ifx\next[\let\go\xdefinition\else
\let\go\ydefinition\fi\go}

\def\xdefinition[#1]{\ifvmode\vskip-\lastskip\fi
\vskip\aboveexampskip
\noindent{\it Definition\ \global\advance\c@definitionnum
by 1\relax\the\c@definitionnum\ \ (#1).\hskip6pt\relax}%
\xdef\@currentlabel{\the\c@definitionnum}\ignorespaces}

\def\ydefinition{\ifvmode\vskip-\lastskip\fi
\vskip\aboveexampskip
\noindent{\it Definition\ \global\advance\c@definitionnum
by 1\relax\the\c@definitionnum.\hskip6pt\relax}%
\xdef\@currentlabel{\the\c@definitionnum}\ignorespaces}




\def\remarks{\ifvmode\vskip-\lastskip\fi
\vskip\aboveexampskip
\noindent{\it Remarks\ \global\advance\c@remarknum
by 1\relax\the\c@remarknum.\hskip1em\relax}
\xdef\@currentlabel{\the\c@remarknum}}


\def\assumption{\ifvmode\vskip-\lastskip\fi
\vskip\aboveexampskip
\noindent{\it Assumption\ \global\advance\c@assumptionnum
by 1\relax\the\c@assumptionnum.\hskip1em\relax}
\xdef\@currentlabel{\the\c@assumptionnum}}



\def\argument{\ifvmode\vskip-\lastskip\fi
\vskip\aboveexampskip
\noindent{\it Argument%
\ \global\advance\c@argumentnum
by 1\relax\the\c@argumentnum.\hskip1em\relax}
\xdef\@currentlabel{\the\c@argumentnum}}

\def\condition{\ifvmode\vskip-\lastskip\fi
\vskip\aboveexampskip
\noindent{\it Condition
\ \global\advance\c@conditionnum
by 1\relax\the\c@conditionnum.\hskip1em\relax}
\xdef\@currentlabel{\the\c@conditionnum}}



\def\case{\ifvmode\vskip-\lastskip\fi
\vskip\aboveexampskip
\noindent{\it Case
\ \global\advance\c@casenum
by 1\relax\the\c@casenum.\hskip1em\relax}
\xdef\@currentlabel{\the\c@casenum}}


\def\endtrivlisty{\vskip12pt}
\let\enddefinition\endtrivlisty
\let\endassumption\endtrivlisty
\let\endargument\endtrivlisty
\let\endcondition\endtrivlisty
\let\endcase\endtrivlisty
\let\endremarks\endtrivlisty


%%% Macros for Kluwer: Issue and Volume Table of Contents

\def\volumetocline{\hbox to30pc{\hss\Large\bf Table of Contents:
Volume \currvolnumber\ (\currvolyear)\hss}}

\def\volumetoc{\clearpage\thispagestyle{empty}\bgroup
\hyphenpenalty=10000
\let\TOCarticle\volTOCarticle
\def\\ {\hfill\break}
\volumetocline}

\def\endvolumetoc{\egroup\newpage}

\def\tocnumberline#1{\vskip26pt
{\elvbf\noindent#1}\vskip8pt}


%% Changed to accept titles more than 2 lines long


\def\volTOCarticle#1#2#3{\vskip.5pt
\setbox0=\hbox{#1\hskip12pt{\it#2}}
\ifdim\wd0<27pc
   %% The simple case, it will fit on one line:
  \hbox to30pc{\strut#1\dotfill{\it#2}\hbox to36pt{\hss#3}}
\else
   %% Find out what we must do next:
   \setbox1=\hbox{#1} \setbox2=\hbox{\hskip18pt{\it #2}}
   \dimen3=\wd1
   \advance\dimen3 by \wd2
   %% Is it 2 lines long?
  \ifdim\dimen3<56pc
   %% Yes, it is 2 lines long.
   %% Is title more than one line long?
       \ifdim\wd1>28pc
   %% Title is more than 1 line long:
   \parfillskip=0pt \parindent=0pt
   \rightskip=36pt
   #1% 
\hskip3pt.%%<==new
   \dotfill\strut\hbox{{\it#2}\hbox to0pt{\hskip36pt\hbox to0pt{\hss#3}\hss}}
       \else
   %% Title is not more than 1 line long:
   \parfillskip=0pt
   \parindent=0pt
   \rightskip=36pt
   #1%
\hskip3pt.%%<==new
\dotfill\break\hbox to27pc{\dotfill\strut\hbox{{\it#2}\hbox 
   to0pt{\hskip36pt\hbox to0pt{\hss#3}\hss}}}
       \fi
   \else
   %% It is more than 2 lines long!
   %% Is title more than two lines long?
       \ifdim\wd1>56pc
   %% Title is more than 2 lines long:
   \parfillskip=0pt \parindent=0pt
   \rightskip=36pt
   #1%
\hskip3pt.%%<==new
   \dotfill\strut\hbox{{\it#2}\hbox to0pt{\hskip36pt\hbox to0pt{\hss#3}\hss}}
       \else
   %% Title is not more than 2 line long:
   \parfillskip=0pt
   \parindent=0pt
   \rightskip=36pt
   #1%
\hskip3pt.%%<==new
\dotfill\break
      \hbox to27pc{\dotfill\strut\hbox{{\it#2}\hbox 
      to0pt{\hskip36pt\hbox to0pt{\hss#3}\hss}}}
       \fi
   \fi
\fi
\vskip.5pt
}

%% Changed to cover possibility of title 2 or more lines long.
%% Changed to cover possibility of author names 2 or more lines long,
%% in which case you must separate the two lines of authors with \\ , i.e.,
%%   \TOCarticle{Distributed Multi-Level Recovery in Main-Memory Databases}
%%   {Rajeev Rastogi, Philip Bohannon, James Parker, Avi Silbershatz, 
%%   S. Seshadri\\ and S. Sudarshan}{000}

\def\lookattwo#1\\#2+{\gdef\one{#1}\gdef\two{#2}
\ifx\two\empty\global\let\go\doOne\else\global\let\go\doTwo\fi}

\def\TOCarticle#1#2#3{\let\\ \relax\def\temptwo{#2}
\def\doOne{\doTOCarticle{#1}{#2}{#3}}
\def\doTwo{\longnameTOCarticle{#1}{\one}{\two}{#3}}
\setbox0=\hbox{\expandafter\lookattwo\temptwo\\{}+}\go}

\def\doTOCarticle#1#2#3{\vskip5.2pt
\setbox0=\hbox{#1\hskip18pt{\it#2}}
\ifdim\wd0=28pt \advance\wd0 by 1pt\fi
\ifdim\wd0<28pc
   %% The simple case, it will fit on one line:
  \hbox to30pc{\strut#1\dotfill{\it#2}\hbox to24pt{\hss#3}}
\else
   %% Find out what we must do next:
   \setbox1=\hbox{#1} \setbox2=\hbox{\hskip18pt{\it #2}}
   \dimen3=\wd1
   \advance\dimen3 by \wd2
   %% Is it 2 lines long?
\ifdim\dimen3=56pc \advance\dimen3 by1sp\fi
  \ifdim\dimen3<56pc
   %% Yes, it is 2 lines long.
   %% Is title more than one line long?
       \ifdim\wd1=28pc \advance\wd1 by1pt\fi
       \ifdim\wd1>28pc
   %% Title is more than 1 line long:
   \parfillskip=0pt \parindent=0pt
   \rightskip=24pt
   #1%
\hskip3pt.%%<==new
\dotfill\strut\hbox{{\it#2}\hbox to0pt{\hskip24pt\hbox to0pt{\hss#3}\hss}}
       \else
   %% Title is not more than 1 line long:
   \parfillskip=0pt
   \parindent=0pt
   \rightskip=24pt
   #1%
\hskip3pt.%%<==new
\dotfill\break\hbox to28pc{\dotfill\strut\hbox{{\it#2}\hbox 
   to0pt{\hskip24pt\hbox to0pt{\hss#3}\hss}}}
       \fi
   \else
   %% It is more than 2 lines long!
   %% Is title more than two lines long?
\ifdim\wd1=56pc \advance\wd1 by 1sp\fi
       \ifdim\wd1>56pc
   %% Title is more than 2 lines long:
   \parfillskip=0pt \parindent=0pt
   \rightskip=24pt
   #1%
\hskip3pt.%%<==new
\dotfill\strut\hbox{{\it#2}\hbox to0pt{\hskip24pt\hbox to0pt{\hss#3}\hss}}
       \else
   %% Title is not more than 2 line long:
   \parfillskip=0pt
   \parindent=0pt
   \rightskip=24pt
   #1%
\hskip3pt.%%<==new
\dotfill\break
      \hbox to28pc{\dotfill\strut\hbox{{\it#2}\hbox 
      to0pt{\hskip24pt\hbox to0pt{\hss#3}\hss}}}
       \fi
   \fi
\fi
\vskip5.2pt\hrule width 30pc}

\def\longnameTOCarticle#1#2#3#4{\vskip5.2pt
\setbox0=\hbox{#1\hskip18pt{\it#2}}
\ifdim\wd0=28pt \advance\wd0 by 1pt\fi
\ifdim\wd0<28pc
   %% The simple case, it will fit on one line:
  \hbox to28pc{\strut#1\dotfill{\it#2}}
\vskip\lineskip
\hbox to 30pc{\dotfill{\it#3}\hbox to24pt{\hss\rm#4}}
\else
   %% Find out what we must do next:
   \setbox1=\hbox{#1} \setbox2=\hbox{\hskip18pt{\it #2}}
   \dimen3=\wd1
   \advance\dimen3 by \wd2
   %% Is it 2 lines long?
\ifdim\dimen3=56pc \advance\dimen3 by1sp\fi
  \ifdim\dimen3<56pc
   %% Yes, it is 2 lines long.
   %% Is title more than one line long?
       \ifdim\wd1=28pc \advance\wd1 by1pt\fi
       \ifdim\wd1>28pc
   %% Title is more than 1 line long:
   \parfillskip=0pt \parindent=0pt
   \rightskip=24pt
   #1%
\hskip3pt.%%<==new
\dotfill\strut\hbox{{\it#2}}
\vskip\lineskip
\strut\dotfill\hbox{{\it#3}
\hbox to0pt{\hskip24pt\hbox to0pt{\hss\rm#4}\hss}}
       \else
   %% Title is not more than 1 line long:
   \parfillskip=0pt
   \parindent=0pt
   \rightskip=24pt
   #1%
\hskip3pt.%%<==new
\dotfill\break
\hbox to28pc{\strut\dotfill\hbox{{\it#2}}}
\vskip\lineskip
\hbox to 28pc{\dotfill\it #3\hbox 
   to0pt{\hskip24pt\hbox to0pt{\hss\rm#4}\hss}}
       \fi
   \else
   %% It is more than 2 lines long!
   %% Is title more than two lines long?
\ifdim\wd1=56pc \advance\wd1 by 1sp\fi
       \ifdim\wd1>56pc
   %% Title is more than 2 lines long:
   \parfillskip=0pt \parindent=0pt
   \rightskip=24pt
   #1%
\hskip3pt%.%%<==new
\dotfill\strut\hbox{\it #2}\vskip\lineskip
\hbox to 28pc{\dotfill{\it#3}\hbox to0pt{\hskip24pt\hbox to0pt{\hss\rm#4}\hss}}
       \else
   %% Title is not more than 2 line long:
   \parfillskip=0pt
   \parindent=0pt
   \rightskip=24pt
   #1%
\hskip3pt.%%<==new
\dotfill\break
      \hbox to28pc{\dotfill\strut\hbox{{\it#2}}}
\vskip\lineskip
      \hbox to28pc{\dotfill\strut\hbox{{\it#3}\hbox 
      to0pt{\hskip24pt\hbox to0pt{\hss\rm#4}\hss}}}
       \fi
   \fi
\fi
\vskip5.2pt\hrule width 30pc}

\def\aster{*}
\newcount\linenumber
\def\findtitle#1 {\def\one{#1}%
\ifx\one\aster\let\xgo\relax\else\global\advance\linenumber by 1
\expandafter\gdef\csname line\the\linenumber\endcsname{#1}%
\let\xgo\findtitle\fi\xgo}

\def\makeissuetoc{\expandafter\ifx\csname line\the\linenumber\endcsname\relax
\let\ygo\relax\vskip8pt\else\let\ygo\makeissuetoc
\hbox to30pc{\hfill\issuetocfont 
\expandafter\csname line\the\linenumber\endcsname\vrule depth8pt
width0pt \hfill}
\fi\global\advance\linenumber by1\relax\ygo}

\newif\ifinternational
\def\international{\global\internationaltrue}

\def\lookatcurrissue#1/#2{\gdef\two{#2}}
\def\checkcurrissuenumber{\setbox0=
\hbox{\expandafter\lookatcurrissue\currissuenumber/{}}}

\def\issuetoc{\thispagestyle{empty}
\linenumber=0
\expandafter\findtitle\thisjourname{} *
\linenumber=1
\bgroup
\hyphenpenalty=10000
\def\\ {\hfill\break}
\makeissuetoc
\ifinternational\global\internationalfalse%
\vskip6pt\centerline{\bigbit An International Journal}\fi\vskip24pt
\checkcurrissuenumber
\ifx\two\empty
\TOCvolumeline{Volume \currvolnumber, No.~\currissuenumber, \currissuemonth 
\ \currvolyear}
\else
\TOCvolumeline{Volume \currvolnumber, Nos.~\currissuenumber, \currissuemonth 
\ \currvolyear}
\fi}

\def\endissuetoc{\egroup\newpage}

%% Added Jan. 25, 1994. \longtitleissuetoc takes an argument so user can 
%% hand break lines, and add font change if desired.

\def\longtitleissuetoc#1{\thispagestyle{empty}
{\issuetocfont 
\everypar={\hskip\parfillskip}\parskip=0pt \baselineskip=27pt
\def\\ {\vskip1sp}
#1
\vskip1sp}
\bgroup
\hyphenpenalty=10000
\def\\ {\hfill\break}
\vskip24pt
\TOCvolumeline{Volume \currvolnumber, No.~\currissuenumber, \currissuemonth 
\ \currvolyear}}

\let\endlongtitleissuetoc\endissuetoc

%% Added Sept. 7, 93 to allow Special Issue title

\let\thespecialissue\relax

\def\TOCvolumeline#1{\noindent{\large#1}\vskip24pt
\thespecialissue
\hrule width 30pc}

\def\specialissue#1{\def\thespecialissue{\begin{center}\Large
\medbit #1\vskip24pt
\end{center}}}

\def\footnoterule{\kern -3\p@ \hrule 
width 3pc %%<=== change this dimen to change width of footnote rule line
\kern 2.6\p@}

% Make \cite yield citation in parenthesis or square brackets.
\def\@cite#1#2{\hskip1sp\relax%<== April 5, 1995, to let it break over lines.
\lcitebracket{#1\if@tempswa , #2\fi}\rcitebracket}

\def\lcitebracket{[}\def\rcitebracket{]}

\def\@bibitem#1{\item\if@filesw 
\immediate\write\@auxout{\string\bibcite{#1}{\the \c@enumi}}\fi%
\ignorespaces}

\def\@citex[#1]#2{\if@filesw\immediate\write\@auxout{\string\citation{#2}}\fi
  \let\@citea\@empty
  \@cite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{,\penalty\@m\ }%
     \def\@tempa##1##2\@nil{\edef\@citeb{\if##1\space##2\else##1##2\fi}}%
     \expandafter\@tempa\@citeb\@nil
     \@ifundefined{b@\@citeb}{{\reset@font\bf ?}\@warning
       {Citation `\@citeb' on page \thepage \space undefined}}%
     \hbox{\csname b@\@citeb\endcsname}}}{#1}}


\def\received#1\revised#2{\def\one{#1}\def\two{#2}%
\ifx\one\empty\else
\def\receivedline{\vskip6pt
\hbox to\textwidth{\footnotesize%
\ifx\one\empty\else{\it Received #1}\ifx\two\empty\else;\fi\fi%
\ifx\two\empty\else{\it Revised #2}\fi\hfill}\def\receivedline{}}\fi
\ifx\two\empty\else
\def\receivedline{\vskip6pt
\hbox to\textwidth{\footnotesize
\ifx\one\empty\else{\it Received #1;}\fi%
\ifx\two\empty\else\ {\it Revised #2}\fi\hfill}\def\receivedline{}}\fi}

\let\receivedline\relax

%% Listing

\let\saveenumerate\enumerate
\let\saveitemize\itemize
\let\save@trivlist\@trivlist

\def\enumerate{\ifnum \@enumdepth >3 \@toodeep\else
      \advance\@enumdepth \@ne 
      \edef\@enumctr{enum\romannumeral\the\@enumdepth}\list
      {\csname label\@enumctr\endcsname}{\usecounter
        {\@enumctr}\def\makelabel##1{##1\hss}}\fi}

\def\itemize{\ifnum \@itemdepth >3 \@toodeep\else \advance\@itemdepth \@ne
\edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
\list{\csname\@itemitem\endcsname}%{\def\makelabel##1{\hss\llap{##1}}}\fi}
{\def\makelabel##1{##1\hss}}\fi}


\def\@trivlist{\ifnum\@itemdepth>1 \vskip-\topsep\fi
\@topsepadd\topsep
  \if@noskipsec \leavevmode \fi
  \ifvmode \advance\@topsepadd\partopsep \else \unskip\par\fi
  \if@inlabel \@noparitemtrue \@noparlisttrue 
    \else \@noparlistfalse \@topsep\@topsepadd \fi
    \advance\@topsep \parskip
  \leftskip\z@
\rightskip\@rightskip \parfillskip\@flushglue
  \@setpar{\if@newlist\else{\@@par}\fi}%
  \global\@newlisttrue \@outerparskip\parskip}



\def\xpt{\textfont\z@\tenrm
  \scriptfont\z@\sevrm \scriptscriptfont\z@\fivrm
\textfont\@ne\tenmi \scriptfont\@ne\sevmi \scriptscriptfont\@ne\fivmi
\textfont\tw@\tensy \scriptfont\tw@\sevsy \scriptscriptfont\tw@\fivsy
\textfont\thr@@\tenex \scriptfont\thr@@\tenex \scriptscriptfont\thr@@\tenex
\def\unboldmath{\everymath{}\everydisplay{}\@nomath\unboldmath
          \textfont\@ne\tenmi
          \textfont\tw@\tensy \textfont\lyfam\tenly
          \@boldfalse}\@boldfalse
\def\boldmath{\@ifundefined{tenmib}{\global\font\tenmib\@mbi
   \global\font\tensyb\@mbsy
   \global\font\tenlyb\@lasyb\relax\@addfontinfo\@xpt
   {\def\boldmath{\everymath{\mit}\everydisplay{\mit}\@prtct\@nomathbold
        \textfont\@ne\tenmib \textfont\tw@\tensyb
        \textfont\lyfam\tenlyb \@prtct\@boldtrue}}}{}\@xpt\boldmath}%
\def\prm{\fam\z@\tenrm}%
\def\pit{\fam\itfam\tenit}\textfont\itfam\tenit \scriptfont\itfam\sevit
    \scriptscriptfont\itfam\sevit
\def\psl{\fam\slfam\tensl}\textfont\slfam\tensl
     \scriptfont\slfam\tensl \scriptscriptfont\slfam\tensl
\def\pbf{\fam\bffam\tenbf}\textfont\bffam\tenbf
    \scriptfont\bffam\sevbf \scriptscriptfont\bffam\fivbf
\def\ptt{\fam\ttfam\tentt}\textfont\ttfam\tentt
    \scriptfont\ttfam\tentt \scriptscriptfont\ttfam\tentt
\def\psf{\fam\sffam\tensf}\textfont\sffam\tensf
    \scriptfont\sffam\tensf \scriptscriptfont\sffam\tensf
\def\psc{\@getfont\psc\scfam\@xpt{\@mcsc}}%
\def\ly{\fam\lyfam\tenly}\textfont\lyfam\tenly
   \scriptfont\lyfam\sevly \scriptscriptfont\lyfam\fivly
\@setstrut \rm}


\newif\iflandscape

\def\landscapefigure{\newpage\thispagestyle{empty}
\global\landscapetrue\figure[h]}

\def\endlandscapefigure{\endfigure\newpage}

\def\landscapetable{\newpage\thispagestyle{empty}
\global\landscapetrue\table[h]}

\def\endlandscapetable{\endtable\newpage}

\def\spTOCvolumeline#1{\hbox to\textwidth{\hss\large
#1\hss}\vskip24pt
\thespecialissue
\hrule width 30pc}

\newbox\kluwerdatebox
\def\kluwerdates{\global\setbox\kluwerdatebox\vbox\bgroup\flushleft
     \footnotesize\obeylines}

\def\endkluwerdates{\vskip1sp\endflushleft\egroup}

%%%%%%%%%%%%%%
\def\contributingauthors{\advance\articlenumber by-1
\global\titletrue
\null
\vskip24pt
\noindent{\Large\bf Contributing Authors}
\vskip48pt}
%%%%%%%%%%%%%%%% Bio for author biography
%% \bio macro will make hanging indentation for photo
%% Use:
%% \picturewidth=<dimen>
%% \picturedepth=<dimen>
%% \bio{<name>}{<biography...>}

\newdimen\picturewidth
\newdimen\picturedepth
\newcount\linenumber
\newcount\parlinenumber

\def\pickuppar#1\par#2\par#3\par#4\par%
{\gdef\lookatpar{#1}\gdef\lookatpartwo{#2}
\gdef\lookatparthree{#3}\gdef\lookatparfour{#4}}

\long\def\bio#1#2{\bigskip{\footnotesize \parskip=0pt \parindent=6pt
\linenumber=\picturedepth % change from dimension to counter because
                          % we want to end up with a number not a dimension.
\divide\linenumber by 65536 % go from scaled points to normal points
\divide\linenumber by 8 % baselineskip in footnotesize
%
% To use \pickuppar to pick up the first paragraph:
\setbox0=\vbox{\advance\hsize by-\picturewidth \pickuppar
\noindent{\bf #1\ }#2\par\vskip1sp\par\vskip1sp\par\vskip1sp\par}
%
% To see height of first paragraph:
\setbox0=\vbox{\advance\hsize by-\picturewidth \noindent\lookatpar\vskip1sp}
\setbox1=\vbox{\advance\hsize by-\picturewidth \noindent\lookatpartwo
\vskip1sp}
\setbox2=\vbox{\advance\hsize by-\picturewidth \noindent\lookatparthree
\vskip1sp}
\setbox3=\vbox{\advance\hsize by-\picturewidth \noindent\lookatparfour
\vskip1sp}
% If there are enough lines available to fit picture in first paragraph:
\ifdim\ht0>\picturedepth
\hangindent=\picturewidth
\hangafter=-\linenumber
\noindent{\bf #1\ }#2
\else
% Now we will use two paragraphs to do the wrapping:
\parlinenumber=\ht0 % To see how many lines will be indented in first par
\divide\parlinenumber by 65536 % go from scaled points to normal points
\divide\parlinenumber by 8 % baselineskip in footnotesize
\global\advance\linenumber by-\parlinenumber 
\everypar={\global\everypar={
\hangindent=\picturewidth \hangafter=-\linenumber
\global\everypar={\doboxone 
\ifnum\linenumber>0
\hangindent=\picturewidth \hangafter=-\linenumber\fi
\global\everypar={\ifnum\linenumber>0
\doboxtwo 
\ifnum\linenumber>0
\hangindent=\picturewidth \hangafter=-\linenumber\fi
\else
\hangindent=0pt \hangafter=0
\fi
\everypar={\global\everypar={\ifnum\linenumber>0
\doboxthree
\ifnum\linenumber>0
 \hangindent=\picturewidth \hangafter=-\linenumber\fi
\else
\hangindent=0pt \hangafter=0
\fi}}}}}}
\hangindent=\picturewidth
\hangafter=-\parlinenumber
\noindent{\bf #1\ }#2\fi
\vskip1sp}\global\everypar={}}

\def\doboxone{\parlinenumber=\ht1 
\divide\parlinenumber by 65536 % go from scaled points to normal points
\divide\parlinenumber by 8 % baselineskip in footnotesize
\global\advance\linenumber by-\parlinenumber\relax}

\def\doboxtwo{\parlinenumber=\ht2 
\divide\parlinenumber by 65536 % go from scaled points to normal points
\divide\parlinenumber by 8 % baselineskip in footnotesize
\global\advance\linenumber by-\parlinenumber\relax}

\def\doboxthree{\parlinenumber=\ht3 
\divide\parlinenumber by 65536 % go from scaled points to normal points
\divide\parlinenumber by 8 % baselineskip in footnotesize
\global\advance\linenumber by-\parlinenumber\relax}

%%%
\newif\ifjacojour

\def\jaco{\global\jacojourtrue
\typeout{^^J^^J\jacojour^^J^^J}
\gdef\kluwerline{\jacokluwerline}}

\def\jacojour{Journal of Algebraic Combinatorics}

%% To make alphabetical bibliography with BibTeX; default is numerical

\def\alphabibliography#1{\let\thebibliography\alphareferences
\let\endthebibliography\endalphareferences\bibliography{#1}}

\expandafter\ifx\csname reset@font\endcsname\relax
\global\let\reset@font\relax\fi

%%%% side by side
%%%% to use:
% \begin{table} 
% \sidebyside{\caption{table caption} first table}
% {\caption{table caption} second table}
% \end{table}

% or

% \begin{figure} 
% \sidebyside{\vskip<dimen>\caption{fig caption}}
% {\vskip<dimen>\caption{fig caption}}
% \end{figure}

\long\def\sidebyside#1#2{%
\let\caption\savecaption
\let\tabular\savetabular
\let\endtabular\endsavetabular
\let\endtabular\endsavetabular
\expandafter\let\csname tabular*\endcsname\savestabular
\expandafter\let\csname endtabular*\endcsname\endsavestabular
\let\label\savelabel
\hbox to\hsize{\vtop{\ifx\@captype\xtable\global\advance\c@table by 1\fi
\hsize=.5\hsize%
\advance\hsize by -.5\columnsep
\parindent=0pt
\centering
 
#1}\hskip\columnsep\vtop{\ifx\@captype\xtable\global\advance\c@table by 1\fi
\let\caption\savecaption
\let\tabular\savetabular
\let\endtabular\endsavetabular
\expandafter\let\csname tabular*\endcsname\savestabular
\expandafter\let\csname endtabular*\endcsname\endsavestabular
\let\label\savelabel
\hsize=.5\hsize%
\advance\hsize by -.5\columnsep
\parindent=0pt\centering
#2

}}}

\def\AA{A\hspace*{-5.5pt}\raise5.5pt\hbox{\tiny$^{\circ}$}\hspace{2pt}\relax}

\endinput

%% Log file:
July 21, 1998
Added [] capability to \begin{definition}

May 29, 1998
Added number to Result.

March 6, 1998
Added definition of \AA, which doesn't work otherwise.

Feb 19, 1998
Added \sidebyside for figures and tables.

Dec 7, 1997
Added Kluwer logo to oddhead to be used when \kluwerlogo
is written in file below \documentclass or \documentstyle.

October 27, 1997
Made \makethankswork command, to be used when there are
\thanks used but no abstract. This command should be
used after the last \thanks.

August 23, 1997
Made page numbers be in roman for \longnameTOCarticle.

August 22B, 1997
Made dotfill in \TOCarticle work like this
Title ....Author, Author,
.....Author, Author, Author 000

August 22, 1997
Fancied up \TOCarticle to make it accept \\ for many long names.

August 13, 1997
Added conditional to endproof so that there will not be
extra space below it when found in a listing environment.


July 15, 1997
Changed
\DeclareRobustCommand*{\cal}{\@fontswitch{\relax}{\mathcal}}
\DeclareRobustCommand*{\mit}{\@fontswitch{\relax}{\mathnormal}}
to
\DeclareRobustCommand{\cal}{\@fontswitch{\relax}{\mathcal}}
\DeclareRobustCommand{\mit}{\@fontswitch{\relax}{\mathnormal}}

May 29, 1997
Added several font sizes to draft change

March 26, 1997
Added \bf around volumn number in kluwerline in JACO.

March 4, 1997
Added
\expandafter\ifx\csname reset@font\endcsname\relax
\global\let\reset@font\relax\fi
for old versions of LaTeX.


\def\@oddhead{\hbox{}\iftitle\global\titlefalse
\vbox to0pt{\vss\kluwerline}%
\else
{\medcaps\thetitle}\hfil{\elvrm\thepage}\fi}% Right heading.
}
