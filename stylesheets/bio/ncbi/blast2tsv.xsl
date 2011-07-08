<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="1.0">
<!--
Author
    Pierre Lindenbaum PhD
Mail:
    plindenbaum@yahoo.fr
Motivation:
    http://biostar.stackexchange.com/questions/7313
    transforms a blast xml result to TSV
Example:
    xsltproc -\-novalid blast2tsv.xsl blast.xml

-->

<!--
Minor Edits
     Sunit Jain
Mail:
     sunitj [AT] umich [DOT] edu
Motivation:
    http://biostar.stackexchange.com/questions/7313
    transforms a blast xml result to TSV.
    I figured, a TSV file would need tabs!
Acknowledgement:
    Thanks for most of the work Pierre!
-->
 
<!-- ========================================================================= -->
  <xsl:output method="text"/>
  <xsl:template match="/">
    <xsl:apply-templates select="BlastOutput"/>
  </xsl:template>
  <xsl:template match="BlastOutput">
    <xsl:variable name="n" select="'&#13;'"/>
    <xsl:variable name="t" select="'&#9;'"/>
    <xsl:variable name="queryDef" select="BlastOutput_query-def"/>
    <xsl:variable name="queryLen" select="BlastOutput_query-len"/>
    <xsl:for-each select="BlastOutput_iterations/Iteration/Iteration_hits/Hit">
      <xsl:variable name="hitDef" select="Hit-def"/>
      <xsl:variable name="hitLen" select="Hit-len"/>
      <xsl:for-each select="Hit_hsps/Hsp">
        <xsl:value-of select="$queryDef"/>
        <xsl:value-of select="$t"/>
        <xsl:value-of select="$queryLen"/>
        <xsl:value-of select="$t"/>
        <xsl:value-of select="$hitDef"/>
        <xsl:value-of select="$t"/>
        <xsl:value-of select="$hitLen"/>
        <xsl:value-of select="$t"/>
        <xsl:value-of select="Hsp_bit-score"/>
        <xsl:value-of select="$t"/>
        <xsl:value-of select="Hsp_evalue"/>
        <xsl:value-of select="$t"/>
        <xsl:value-of select="Hsp_query-from"/>
        <xsl:value-of select="$t"/>
        <xsl:value-of select="Hsp_query-to"/>
        <xsl:value-of select="$t"/>
        <xsl:value-of select="Hsp_hit-from"/>
        <xsl:value-of select="$t"/>
        <xsl:value-of select="Hsp_hit-to"/>
        <xsl:value-of select="$t"/>
        <xsl:value-of select="Hsp_query-frame"/>
        <xsl:value-of select="$t"/>
        <xsl:value-of select="Hsp_hit-frame"/>
        <xsl:value-of select="$t"/>
        <xsl:value-of select="Hsp_identity"/>
        <xsl:value-of select="$t"/>
        <xsl:value-of select="Hsp_positive"/>
        <xsl:value-of select="$t"/>
        <xsl:value-of select="Hsp_gaps"/>
        <xsl:value-of select="$t"/>
        <xsl:value-of select="Hsp_align-len"/>
        <xsl:value-of select="$t"/>
        <xsl:value-of select="Hsp_qseq"/>
        <xsl:value-of select="$t"/>
        <xsl:value-of select="Hsp_hseq"/>
        <xsl:value-of select="$t"/>
        <xsl:value-of select="Hsp_midline"/>
        <xsl:value-of select="$n"/>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>