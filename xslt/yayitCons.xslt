<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:svg="http://www.w3.org/2000/svg"
	xmlns:axsl="http://www.w3.org/1999/XSL/TransformAlias"
	xmlns:math="http://exslt.org/math">

<xsl:namespace-alias stylesheet-prefix="axsl" result-prefix="xsl"/>
<xsl:output method="xml" indent="yes"/>

<xsl:param name="base"/>
<xsl:param name="baseTemplate" select="$base"/>
<xsl:param name="yayit"/>

<xsl:template match="/">
<axsl:stylesheet version="1.0" >
<axsl:import href="{concat('../xslt/',$baseTemplate,'.xslt')}"/>
<axsl:import href="{concat('../xslt/',$yayit,'.xslt')}"/>

<axsl:variable name="widthOffset" >
	<axsl:choose>
		<axsl:when test="'{$base}' = 'u100f'">
			<axsl:value-of select="$wideConsWidth + $waXInnerRadius"/>
		</axsl:when>
		<axsl:when test="$isWide"><axsl:value-of select="$wideConsWidth"/>
		</axsl:when>
		<axsl:otherwise><axsl:value-of select="$narrowConsWidth"/></axsl:otherwise>
	</axsl:choose>
</axsl:variable>
<axsl:variable name="overlap" select="0"/>
<axsl:variable name="advance" select="$widthOffset + $preGuard + $thickness + $postGuard"/>

<axsl:include href="../xslt/param.xslt"/>
<axsl:include href="../xslt/path.xslt"/>

<axsl:template match="svg:g">
	<axsl:copy use-attribute-sets="gAttribs">
		<axsl:call-template name="{concat($base, '_u103c')}"/>
	</axsl:copy>
</axsl:template>

<axsl:template name="{concat($base, '_u103c')}">
	<axsl:param name="xOffset" select="0"/>
	<axsl:param name="yOffset" select="0"/>
	<axsl:call-template name="{$yayit}">
		<axsl:with-param name="xOffset" select="$xOffset"/>
		<axsl:with-param name="yOffset" select="$yOffset"/>
	</axsl:call-template>
	<axsl:call-template name="{$baseTemplate}">
		<axsl:with-param name="xOffset" select="$xOffset + $preGuard + $thickness + $postGuard"/>
		<axsl:with-param name="yOffset" select="$yOffset"/>
	</axsl:call-template>
</axsl:template>

</axsl:stylesheet>
</xsl:template>

</xsl:stylesheet>
