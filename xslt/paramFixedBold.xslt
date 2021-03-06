<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns="http://www.w3.org/2000/svg"
	xmlns:svg="http://www.w3.org/2000/svg"
	xmlns:math="http://exslt.org/math">

<xsl:import href="paramDefaults.xslt"/>

<xsl:param name="thickness" select="90"/>
<xsl:param name="fontWeight" select="700"/>
<xsl:param name="fixedWidth" select="$lcWidth + $preGuard + $postGuard"/>

<!-- define a few parameters which are only used by the python script -->
<xsl:param name="enFamilyName" select="'ThanLwinFixed'"/>
<xsl:param name="enSubFamily" select="'Bold'"/>
<xsl:param name="enFullName" select="'ThanLwin Fixed Bold'"/>
<xsl:param name="localizedFamilyName" select="'သံလွင်တစ်သမတ်အကျယ်'"/>
<xsl:param name="localizedSubFamily" select="'စာလုံးမဲ'"/>
<xsl:param name="localizedFullName" select="'သံလွင်တစ်သမတ်အကျယ်စာလုံးမဲ'"/>

</xsl:stylesheet>

