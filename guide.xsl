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
        %documentlatex pour production du guide de l'étudiant
        %préambule
        \documentclass [12 pt]{report}
        %encodage unicode
        \usepackage [utf8]{inputenc}
        %typographie française
        \usepackage [french]{babel} 
        %pour pouvoir utiliser des images
        \usepackage {graphicx} 
        %chemin vers le répertoire 'images' qui contient les images -- conflit
        \graphicspath { {images/} } 
        %police de base extended computer modern avec encodage de Cork
        \usepackage [T1]{fontenc} 
        \usepackage{blindtext}
        %fin du préambule
        %début du document
        \begin{document}
        
        <xsl:apply-templates/>
        \end{document}
    </xsl:template>
    
    <!-- page de titre -->
    <xsl:template match="page[1]/titre">
    \begin{titlepage}
    \includegraphics [scale=1] {nom_fichier_image}
    \vskip3cm
    
    {\bfseries\Large
    \centering
    Guide de l'étudiant du 1er cycle
    2016-2017 %page[1]/titre
    }
    \vfill
    \end{titlepage}
    </xsl:template>
    
   
        
</xsl:stylesheet>