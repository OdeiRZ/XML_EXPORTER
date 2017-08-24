<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title>Agenda XML</title>
				<link rel="stylesheet" href="agenda.css"/>
			</head>
			<body>
				<h2><span>(<xsl:value-of select="count(//contacto)"/>) </span>Contactos</h2>
				<table>
					<tr>
						<th></th>
						<th>Nombre</th>
						<th>F. Nacimiento</th>
						<th>Email</th>
						<th>Teléfonos</th>
						<th>Dirección</th>
					</tr>
					<xsl:for-each select="/agenda/contacto">
						<xsl:sort order="ascending" select="./nombre"/>
						<xsl:sort order="ascending" select="./apellidos"/>
						<tr>
							<td>
								<img src="img/{@id}.png" alt="{./nombre}"/>
							</td>
							<td>
								<xsl:value-of select="./nombre"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="./apellidos"/>
							</td>
							<td>
								<xsl:choose>
									<xsl:when test="not(./fnacimiento)">
										<xsl:text>Sin especificar</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="./fnacimiento"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td>
								<xsl:choose>
									<xsl:when test="not(./email)">
										<xsl:text>Sin especificar</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<a href="mailto:{./email}" rel="external" target="_blank"><xsl:value-of select="./email"/></a>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td>
								<ul>
									<xsl:for-each select="./telefonos/telefono">
										<li>
											<xsl:if test="@tipo != ''">
												<xsl:value-of select="@tipo"/>
												<xsl:text>: </xsl:text>
											</xsl:if>
											<xsl:value-of select="."/>
										</li>
									</xsl:for-each>
								</ul>
							</td>
							<td>
								<xsl:choose>
									<xsl:when test="not(./direccion)">
										<xsl:text>Sin especificar</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="./direccion/calle"/>
										<xsl:text>, </xsl:text>
										<xsl:value-of select="./direccion/bloque"/>
										<xsl:text>, </xsl:text>
										<xsl:value-of select="./direccion/letra"/>
										<br/>
										<xsl:value-of select="./direccion/ciudad"/>
										<xsl:text> </xsl:text>
										(<xsl:value-of select="./direccion/provincia"/>)
										<br/>
										<xsl:text>CP: </xsl:text>
										<xsl:value-of select="./direccion/cp"/>
										<xsl:text>, </xsl:text>
										<xsl:value-of select="./direccion/pais"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>