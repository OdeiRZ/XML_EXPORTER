<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="/">
		<fo:root>
			<fo:layout-master-set>
				<fo:simple-page-master master-name="A4">
					<fo:region-body margin="2cm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="A4">
				<fo:flow flow-name="xsl-region-body">
					<xsl:apply-templates />
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
	<xsl:template match="/">
		<xsl:for-each select="/agenda/contacto">
			<fo:contacto>
				<xsl:text>&#10; &#x9;</xsl:text>
				<fo:id>
					<xsl:value-of select="@id" />
				</fo:id>
				<xsl:text>&#10; &#x9;</xsl:text>
				<fo:nombre>
					<xsl:value-of select="./nombre"/>
				</fo:nombre>
				<xsl:text>&#10; &#x9;</xsl:text>
				<fo:apellidos>
					<xsl:value-of select="./apellidos"/>
				</fo:apellidos>
				<xsl:text>&#10; &#x9;</xsl:text>
				<xsl:if test="(./fnacimiento)">
					<fo:fnacimiento>
						<xsl:value-of select="./fnacimiento"/>
					</fo:fnacimiento>
					<xsl:text>&#10; &#x9;</xsl:text>
				</xsl:if>
				<xsl:if test="(./email)">
					<fo:email>
						<xsl:value-of select="./email"/>
					</fo:email>
					<xsl:text>&#10; &#x9;</xsl:text>
				</xsl:if>
				<xsl:for-each select="./telefonos/telefono">
					<fo:telefono>
						<xsl:if test="@tipo != ''">
							<xsl:value-of select="@tipo"/>
							<xsl:text>: </xsl:text>
						</xsl:if>
						<xsl:value-of select="."/>
					</fo:telefono>
					<xsl:text>&#10; &#x9;</xsl:text>
				</xsl:for-each>
				<xsl:if test="(./direccion)">
					<fo:direccion>
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
					</fo:direccion>
					<xsl:text>&#10;</xsl:text>
				</xsl:if>
			</fo:contacto>
			<xsl:text>&#10;</xsl:text>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>