<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:svg="http://www.w3.org/2000/svg"
	xmlns:math="http://exslt.org/math">

<xsl:import href="u1010.xslt"/>
<xsl:import href="u1031.xslt"/>

<xsl:output method="xml" indent="yes"/>

<xsl:include href="param.xslt"/>
<xsl:include href="path.xslt"/>

<xsl:variable name="advance" select="$wideConsWidth + $narrowConsWidth"/>
<xsl:variable name="overlap" select="0"/>

<xsl:template match="svg:g">
	<xsl:copy use-attribute-sets="gAttribs">
	<xsl:call-template name="u1031">
		<xsl:with-param name="xOffset" select="0"/>
		<xsl:with-param name="yOffset" select="0"/>
	</xsl:call-template>
	<xsl:call-template name="u1010">
		<xsl:with-param name="xOffset" select="$narrowConsWidth"/>
		<xsl:with-param name="yOffset" select="0"/>
	</xsl:call-template>
	</xsl:copy>
	<xsl:element name="svg:g">
		<xsl:attribute name="transform">
			<xsl:text>matrix(</xsl:text><xsl:value-of select="$medialScale"/>
			<xsl:text> 0 0 </xsl:text>
			<xsl:value-of select="-$medialScale"/><xsl:text> </xsl:text>
			<xsl:value-of select="0"/><xsl:text> </xsl:text>
			<xsl:value-of select="$fontAscent"/><xsl:text>)</xsl:text>
		</xsl:attribute>
		<xsl:call-template name="u1010">
			<xsl:with-param name="xOffset" select="(2 * $waXOuterRadius - $thickness) *(1 div $medialScale - 1) + $narrowConsWidth div $medialScale"/>
			<xsl:with-param name="yOffset" select="-2 * $waYOuterRadius  - $medialPad div $medialScale"/>
		</xsl:call-template>
	</xsl:element>
</xsl:template>

</xsl:stylesheet>
