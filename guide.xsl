<?xml version="1.0" encoding="UTF-8"?>

<!--    Transformation XSL guide-wiki-ebsi
        version: 1.0
        date de modification: 2017-01-18
        auteur: Isabelle Bastien
        
        Ce script transforme le document 'content.xml', créé par Arnaud, qui extrait du contenu des url du wiki de l'EBSI en document LaTeX, pour archivage
        -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"
        encoding="UTF-8"
        omit-xml-declaration="yes"
        indent="no"/>
    
    <!-- Gabarit général -->   
    
    <xsl:template match="/">
        %documentlatex pour production du guide de l'étudiant version 1.0
        %%préambule
        \documentclass [12 pt]{article}
        
        %typographie française
        \usepackage [utf8]{inputenc}
        \usepackage [french]{babel} 
        \usepackage [T1]{fontenc} 
       
        
        %mise en page améliorée
        \usepackage [margin=3cm,includefoot]{geometry}
        \usepackage{fancyhdr}
        \pagestyle{fancy}
        \fancyhead[R]{EBSI-Guide de l'étudiant 2016-2017}
        \fancyfoot{}
        \fancyfoot[R]{\thepage\ }
        \renewcommand{\footrulewidth}{1pt}
      
        
        %utilisation d'images
        \usepackage {graphicx} 
        \graphicspath { {/images} }
        
        %préservation des hyperliens (possibilités de renvois internes avec ce package aussi)
        %liens pdf déréférençables avec pdflatex
        \usepackage {hyperref}
        
        %pour test : génération de texte automatique
        \usepackage{blindtext}
        
        %%fin du préambule
        
        \begin{document}
        
        <xsl:apply-templates/>
        \end{document}
    </xsl:template>
    
    <!-- page de titre -->
    <xsl:template match="page[1]/titre">
        %page titre
        \begin{titlepage}
        \begin{center}
        %\includegraphic
        \line(1,0){350}\\
        \huge{\bfseries 
        <xsl:value-of select="."/>
        }
        \line(1,0){350}
        \vskip10cm
        
        
        \end{center}
        \end{titlepage}
    </xsl:template>
    
    <!-- sections de profondeur 1-->
    <!--@todo: pour l'instant l'extrant xml ne permat pas de traiter les différents niveaux de section-->
    <xsl:template match="page">
        \newpage
        \section {
        <xsl:value-of select="./titre"/>
        }
        <xsl:apply-templates/>
    </xsl:template>
    
    <!--traitement des H2 en gras (test)-->
    <xsl:template match="h2">
        \textbf{
        <xsl:value-of select="."/>
        }
    </xsl:template>
    
    <!-- traitement du fil d'ariane du document source -->
    <xsl:template match="title">
        \textit{
        <xsl:value-of select="."/>
        }
    </xsl:template>
    
    <!--traitement des url -->
    <xsl:template match="url"/>
        
    <!-- traitement des paragraphes -->
    <xsl:template match="p | h3 | h4">
        <xsl:apply-templates/>
    </xsl:template>
    
   <!-- traitement des listes -->
    <xsl:template match="ul">
        \begin{itemize}
        <xsl:apply-templates/>
        \end{itemize}
    </xsl:template>
    
    <xsl:template match="li">
        \item <xsl:value-of select="."/>
    </xsl:template>
   
   <!-- traitement des hyperliens -->
    <xsl:template match="a">
        \href{
        <xsl:value-of select="./@href"/>
        } {
        <xsl:value-of select="."/>
        }
    </xsl:template>
   <!--traitement des exposants (superscript) -->
    <xsl:template match="sup">
        \textsuperscript{
        <xsl:value-of select="."/>
        }
    </xsl:template>
    <!-- traitement des lignes horizontales-->
    <xsl:template match="hr">
        \noindent\makebox[\linewidth]{\rule{\paperwidth}{0.4pt}}
    </xsl:template>
       <!-- retrait des images -->
    <xsl:template match="img"/>
        <!-- le cas de span-->
    <!-- Plusieurs cas possibles. A discuter avec Arnaud s'il est possible de nettoyer certaines balises vides-->
       
    
</xsl:stylesheet>