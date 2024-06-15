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
\usepackage{graphicx}
\usepackage{hyperref}
\usepackage{xstring}

% Page Layout

\usepackage{geometry}

\geometry{
  paper=a4paper,
  margin=0cm,
}

% Fonts

\usepackage[utf8]{inputenc} % Allow international characters
\usepackage[T1]{fontenc} % Output font encoding

% Icons

\usepackage{fontawesome} 

% Icon command
\newcommand{\icon}[1]{% The first parameter is the FontAwesome icon name
	\csname fa#1\endcsname
	\hspace{0.75em}% Whitespace
}

% Dummy text command
\newcommand{\lorem}{Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.}

% Contact details command
% Params: (Email, Telephone number, Website, Github)
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

% First argument for the leftmost date(s), second is for the bold entry, third is for the bold right-aligned entry qualifier and the fourth is for the entry description
\newcommand{\entry}[5]{
  \begin{minipage}[t]{0.2\textwidth}
    #1 %Leftmost entry date(s) text
  \end{minipage}
  \begin{minipage}[t]{0.75\textwidth}
    \textbf{#2} \\ % Entry heading text
    {\footnotesize \textbf{#3} \hfill \textbf{#4}} \\ % Subheading, Right-aligned entry qualifier text
    #5 % Entry description text
  \end{minipage}
  \\\\
}
