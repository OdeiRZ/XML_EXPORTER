<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:svg="http://www.w3.org/2000/svg" xmlns:ex="http://exslt.org/dates-and-times" extension-element-prefixes="ex">
	<xsl:template match="/">
		<svg:svg><xsl:apply-templates /></svg:svg>
	</xsl:template>
	<xsl:template match="contacto">
		<svg:text y="{position()*20}" x="10" font-size="20">
			<xsl:text>Edad de </xsl:text>
			<xsl:value-of select="./nombre"/> 
			<xsl:text> </xsl:text>
			<xsl:value-of select="./apellidos"/>
		</svg:text>
		<svg:text y="{position()*20}" x="340" font-size="20">
			<xsl:text>(~</xsl:text>
			<xsl:value-of select="ex:year(ex:date()) - substring(./fnacimiento, string-length(./fnacimiento) - 3, string-length(./fnacimiento))"/> 
			<xsl:text>)</xsl:text>
		</svg:text>
		<!-- Obtenemos el año actual y lo restamos al año de nacimiento del contacto (obtenido al sustraer los 4 últimos digitos de su fecha de nacimiento) -->
		<svg:rect y="{position()*20-10}" x="400" width="{(ex:year(ex:date()) - substring(./fnacimiento, string-length(./fnacimiento) - 3, string-length(./fnacimiento))) * 10}" height="10"/>
	</xsl:template>
</xsl:stylesheet>