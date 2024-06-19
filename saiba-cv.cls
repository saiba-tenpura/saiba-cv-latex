% Saiba CV
% LaTeX Class
% Version: 0.1
%
% Authors:
% Saiba Tenpura
% Based on a template by Jan Vorisek (jan@vorisek.me)
%
% License:
% MIT License

% Class

\ProvidesClass{saiba-cv}[Saiba CV v0.1]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass{article}

% Document Config

\setlength{\topskip}{0cm}
\setlength{\parindent}{0cm}
\setlength{\parskip}{0cm}
\setlength{\fboxsep}{0cm}

% Base Packages

\usepackage{enumitem}
\usepackage{graphicx} % Allow the use of images
\usepackage{hyperref} % Add hyperlinks
\usepackage{xcolor} % Custom colors
\usepackage{xkeyval} % Add key value options for class
\usepackage{xstring} % Used for string modification

% Custom params
\define@key{saiba-cv.cls}{highlights}[59 130 246]{%
  \definecolor{highlight-color}{RGB}{#1}%
}

\define@key{saiba-cv.cls}{muted}[113 113 122]{%
  \definecolor{muted-color}{RGB}{#1}%
}

\ExecuteOptionsX{highlights,muted}

% Page Layout

\usepackage{geometry}

\geometry{
  paper=a4paper,
  margin=0cm,
}

% Fonts

\usepackage[utf8]{inputenc} % Allow international characters
\usepackage[T1]{fontenc} % Output font encoding

\usepackage[default]{raleway}
%\usepackage[defaultsans]{droidsans}
%\usepackage{cmbright}
%\usepackage{fetamont}
%\usepackage[default]{gillius}
%\usepackage{roboto}

\renewcommand*\familydefault{\sfdefault} % Force the sans-serif version of any font used

% Icons

\usepackage{fontawesome} 

% Icon command
% Params: (name)
\newcommand{\icon}[1]{% The first parameter is the FontAwesome icon name without the 'fa'
	\csname fa#1\endcsname
	\hspace{0.5em}% Whitespace
}

% Dummy text command
\newcommand{\lorem}{Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.}

% Contact details command
% Params: (email, telephone number, website, github)
% For the telephone link the whitespaces are stripped
\newcommand{\contact}[4]{
  \StrSubstitute{#2}{ }{}[\stripped]
  \begin{itemize}[leftmargin=1em]
    \item[] \href{mailto:#1}{\icon{Envelope}#1}
    \item[] \href{tel:\stripped}{\icon{Phone}#2}
    \item[] \href{https://#3}{\icon{Globe}#3}
    \item[] \href{https://#4}{\icon{Github}#4}
  \end{itemize}
}

% CV entry command
% Params: (position, company, dates, loaction, content)
\newcommand{\entry}[5]{
  \textbf{#1} \\ % Entry heading text
  {\color{highlight-color} \textbf{#2}} \\ % Company name
  {\color{muted-color} \footnotesize \icon{Calendar} \textbf{#3} \hfill \icon{MapMarker}\textbf{#4}} \\ % Subheading, Right-aligned entry qualifier text
  #5 \\ % Entry description text
  \\
}
