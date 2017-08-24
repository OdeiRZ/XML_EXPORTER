<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:p="http://productos.org#">
	<xsl:output method="text"/>
	<xsl:template match="/">
		<xsl:text><![CDATA[
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix : <https://github.com/OdeiRZ/XML_EXPORTER> . ]]>
		</xsl:text>
		<xsl:for-each select="/agenda/contacto">
			<xsl:text>&#10;:</xsl:text><xsl:value-of select="@id"/><xsl:text> :nombre: </xsl:text><xsl:value-of select="./nombre"/>
			<xsl:text> .&#10;:</xsl:text><xsl:value-of select="@id"/><xsl:text> :apellidos: </xsl:text><xsl:value-of select="./apellidos"/>
			<xsl:if test="(./fnacimiento)">
				<xsl:text> .&#10;:</xsl:text><xsl:value-of select="@id"/><xsl:text> :fnacimiento: </xsl:text><xsl:value-of select="./fnacimiento"/>
			</xsl:if>
			<xsl:if test="(./email)">
				<xsl:text> .&#10;:</xsl:text><xsl:value-of select="@id"/><xsl:text> :email: </xsl:text><xsl:value-of select="./email"/>
			</xsl:if>
			<xsl:for-each select="./telefonos/telefono">
				<xsl:text> .&#10;:</xsl:text><xsl:value-of select="/agenda/contacto/@id"/>
				<xsl:if test="@tipo != ''">
					<xsl:text> :tipo: </xsl:text><xsl:value-of select="@tipo"/>
					<xsl:text> -</xsl:text>
				</xsl:if>
				<xsl:text> :telefono: </xsl:text><xsl:value-of select="."/>
			</xsl:for-each>
			<xsl:if test="(./direccion)">
				<xsl:text> .&#10;:</xsl:text><xsl:value-of select="@id"/><xsl:text> :direccion: </xsl:text>
				<xsl:value-of select="./direccion/calle"/>
				<xsl:text>, </xsl:text>
				<xsl:value-of select="./direccion/bloque"/>
				<xsl:text>, </xsl:text>
				<xsl:value-of select="./direccion/letra"/>
				<xsl:text>. </xsl:text>
				<xsl:value-of select="./direccion/ciudad"/>
				<xsl:text>, (</xsl:text>
				<xsl:value-of select="./direccion/provincia"/>
				<xsl:text>). CP: </xsl:text>
				<xsl:value-of select="./direccion/cp"/>
				<xsl:text>, </xsl:text>
				<xsl:value-of select="./direccion/pais"/>
			</xsl:if>
			<xsl:text> .&#10;</xsl:text>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>