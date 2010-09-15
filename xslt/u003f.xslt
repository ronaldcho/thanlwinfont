<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:svg="http://www.w3.org/2000/svg"
	xmlns="http://www.w3.org/2000/svg"
	xmlns:math="http://exslt.org/math">

<xsl:include href="param.xslt"/>
<xsl:include href="path.xslt"/>
<xsl:variable name="advance" select="$narrowConsWidth"/>
<xsl:variable name="overlap" select="0"/>


<xsl:template match="svg:g">
	<xsl:copy use-attribute-sets="gAttribs">
	<xsl:call-template name="u101b"/>
	</xsl:copy>
</xsl:template>


<xsl:variable name="loopInnerDiameter" select="$waXInnerRadius * math:sqrt(2) - 2 * $thickness"/>
<xsl:variable name="loopInnerDelta" select="$loopInnerDiameter div math:sqrt(2)"/>

<!-- TODO use more arcs than corners, this is currently ugly -->

<xsl:template name="u101b">
	<xsl:param name="xOffset" select="0"/>
	<xsl:param name="yOffset" select="0"/>

    <xsl:element name="path" use-attribute-sets="pathAttribs">
    <xsl:attribute name="d">
    <xsl:call-template name="Move">
        <xsl:with-param name="x" select="$xOffset + $preGuard"/>
        <xsl:with-param name="y" select="$yOffset + $latinAscent - $waYOuterRadius"/>
    </xsl:call-template>
    <xsl:call-template name="arc">
        <xsl:with-param name="rx" select="$waXOuterRadius"/>
        <xsl:with-param name="ry" select="$waYOuterRadius"/>
        <xsl:with-param name="axisRotation" select="0"/>
        <xsl:with-param name="large" select="1"/>
        <xsl:with-param name="clockwise" select="0"/>
        <xsl:with-param name="x" select="2 * $waXOuterRadius"/>
        <xsl:with-param name="y" select="0"/>
    </xsl:call-template>
    <xsl:variable name="ellipseOuterRadius" select="$latinAscent - $waYOuterRadius - $thickness"/>
    <xsl:variable name="ellipseInnerRadius" select="$ellipseOuterRadius - $thickness"/>
    <xsl:call-template name="arc">
        <xsl:with-param name="rx" select="$ellipseOuterRadius"/>
        <xsl:with-param name="ry" select="$ellipseOuterRadius"/>
        <xsl:with-param name="axisRotation" select="0"/>
        <xsl:with-param name="large" select="0"/>
        <xsl:with-param name="clockwise" select="0"/>
        <xsl:with-param name="x" select="-.5 * $waXOuterRadius"/>
        <xsl:with-param name="y" select="-.5 * $ellipseOuterRadius"/>
    </xsl:call-template>
    <xsl:call-template name="arc">
        <xsl:with-param name="rx" select="$ellipseInnerRadius"/>
        <xsl:with-param name="ry" select="$ellipseInnerRadius"/>
        <xsl:with-param name="axisRotation" select="0"/>
        <xsl:with-param name="large" select="0"/>
        <xsl:with-param name="clockwise" select="1"/>
        <xsl:with-param name="x" select="-.5 * $waXInnerRadius"/>
        <xsl:with-param name="y" select="-.5 * $ellipseInnerRadius"/>
    </xsl:call-template>
   
    
    
	<xsl:text>l</xsl:text><xsl:value-of select="-$thickness"/><xsl:text>,0</xsl:text>
    
	<xsl:call-template name="arc">
        <xsl:with-param name="rx" select="$ellipseOuterRadius"/>
        <xsl:with-param name="ry" select="$ellipseOuterRadius"/>
        <xsl:with-param name="axisRotation" select="0"/>
        <xsl:with-param name="large" select="0"/>
        <xsl:with-param name="clockwise" select="0"/>
        <xsl:with-param name="x" select=".5 * $waXOuterRadius"/>
        <xsl:with-param name="y" select=".5 * $ellipseOuterRadius"/>
    </xsl:call-template>
    <xsl:call-template name="arc">
        <xsl:with-param name="rx" select="$ellipseInnerRadius"/>
        <xsl:with-param name="ry" select="$ellipseInnerRadius"/>
        <xsl:with-param name="axisRotation" select="0"/>
        <xsl:with-param name="large" select="0"/>
        <xsl:with-param name="clockwise" select="1"/>
        <xsl:with-param name="x" select=".5 * $waXInnerRadius"/>
        <xsl:with-param name="y" select=".5 * $ellipseInnerRadius"/>
    </xsl:call-template>
	 
    <xsl:call-template name="arc">
        <xsl:with-param name="rx" select="$waXInnerRadius"/>
        <xsl:with-param name="ry" select="$waYInnerRadius"/>
        <xsl:with-param name="axisRotation" select="0"/>
        <xsl:with-param name="large" select="1"/>
        <xsl:with-param name="clockwise" select="1"/>
        <xsl:with-param name="x" select="-2 * $waXInnerRadius"/>
        <xsl:with-param name="y" select="0"/>
    </xsl:call-template>
    <xsl:call-template name="end"/>
    
    <xsl:call-template name="Move">
        <xsl:with-param name="x" select="$xOffset + $preGuard + $waXOuterRadius"/>
        <xsl:with-param name="y" select="$yOffset"/>
    </xsl:call-template>
	<xsl:call-template name="arc">
        <xsl:with-param name="rx" select=".5 * $thickness"/>
        <xsl:with-param name="ry" select=".5 * $thickness"/>
        <xsl:with-param name="axisRotation" select="0"/>
        <xsl:with-param name="large" select="1"/>
        <xsl:with-param name="clockwise" select="1"/>
        <xsl:with-param name="x" select="-1"/>
        <xsl:with-param name="y" select="0"/>
    </xsl:call-template>
    <xsl:call-template name="end"/>
    </xsl:attribute>
    </xsl:element>
</xsl:template>

</xsl:stylesheet>
