<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"/>
	<xsl:template match="/">
		<xsl:text>{&#10; &#x9;"agenda": [</xsl:text>
		<xsl:for-each select="/agenda/contacto">
			<xsl:text>&#10; &#x9;&#x9;{</xsl:text>
			<xsl:text>&#10; &#x9;&#x9;&#x9;"id": </xsl:text><xsl:value-of select="@id"/><xsl:text>,</xsl:text>
			<xsl:text>&#10; &#x9;&#x9;&#x9;"nombre": </xsl:text>"<xsl:value-of select="./nombre"/>"<xsl:text>,</xsl:text>
			<xsl:text>&#10; &#x9;&#x9;&#x9;"apellidos": </xsl:text>"<xsl:value-of select="./apellidos"/>"<xsl:text>,</xsl:text>
			<xsl:if test="(./fnacimiento)">
				<xsl:text>&#10; &#x9;&#x9;&#x9;"fnacimiento": </xsl:text>"<xsl:value-of select="./fnacimiento"/>"<xsl:text>,</xsl:text>
			</xsl:if>
			<xsl:if test="(./email)">
				<xsl:text>&#10; &#x9;&#x9;&#x9;"email": </xsl:text>"<xsl:value-of select="./email"/>"<xsl:text>,</xsl:text>
			</xsl:if>
			<xsl:text>&#10; &#x9;&#x9;&#x9;"telefonos": [</xsl:text>
			<xsl:for-each select="./telefonos/telefono">
				<xsl:text>&#10; &#x9;&#x9;&#x9;&#x9;{</xsl:text>
				<xsl:if test="@tipo != ''">
					<xsl:text>&#10; &#x9;&#x9;&#x9;&#x9;&#x9;"tipo": </xsl:text>"<xsl:value-of select="@tipo"/>"<xsl:text>,</xsl:text>
				</xsl:if>
				<xsl:text>&#10; &#x9;&#x9;&#x9;&#x9;&#x9;"numero": </xsl:text>"<xsl:value-of select="."/>"<xsl:text></xsl:text>
				<xsl:text>&#10; &#x9;&#x9;&#x9;&#x9;}</xsl:text>
				<xsl:if test="position()!=last()">,</xsl:if>
			</xsl:for-each>
			<xsl:text>&#10; &#x9;&#x9;&#x9;]</xsl:text>
			<xsl:if test="(./direccion)">
				<xsl:text>,&#10; &#x9;&#x9;&#x9;"direccion": "</xsl:text>
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
				<xsl:text>"</xsl:text>
			</xsl:if>
			<xsl:text>&#10; &#x9;&#x9;}</xsl:text>
			<xsl:if test="position()!=last()">,</xsl:if>
		</xsl:for-each>
		<xsl:text>&#10; &#x9;]</xsl:text>
		<xsl:text>&#10;}</xsl:text>
	</xsl:template>
</xsl:stylesheet>