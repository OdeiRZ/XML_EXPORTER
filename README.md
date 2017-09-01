XML Exporter
=========================================

Utilidad usada para trabajar con diferentes ficheros [XML] y permitir su exportación a distintos formatos,
habilitando la conversión de [XML] a [HTML], [XSL-FO], [JSON], [RDF], [SVG] y [PDF] entre otros. La demo 
incluye diversos ficheros convertidos como resultado de la utilización de la utilidad implementada.

## Requisitos
- Navegador Web [Chrome], [Firefox], [Opera], [Microsoft Edge], etc.. (para visualizar la página [HTML] exportada)
- [Apache FOP] para transformar ficheros [XSL-FO] a [PDF]

## Contenido
* `agenda.xml`: fichero [XML] con los datos almacenados
* `agenda.dtd`: fichero [DTD] para validar el fichero [XML]
* `agenda.xsd`: fichero [XML Schema] para validar el fichero [XML]
* `agenda.xsl`: fichero [XSLT] para convertir de [XML] a [HTML] 
* `agenda.css`: hoja de estilos [CSS] utilizada por el fichero [HTML] generado
* `agendaSVG.xsl`: fichero [XSLT] para convertir de [XML] a [SVG]
* `agendaJSON.xsl`: fichero [XSLT] para convertir de [XML] a [JSON]
* `agendaFO.xsl`: fichero [XSLT] para convertir de [XML] a [XSL-FO]
* `agendaRDF.xsl`: fichero [XSLT] para convertir de [XML] a [RDF]

## Utilización
Para comprobar que nuestro [XML] está bien formado
> xmllint agenda.xml

Para validar nuestro [XML] con [DTD]
> xmllint --dtdvalid agenda.dtd agenda.xml

Para validar nuestro [XML] con [XML Schema]
> xmllint --schema agenda.xsd --noout agenda.xml

Para convertir nuestro [XML] a [HTML] mediante [XSLT]
> xsltproc -o agenda.html agenda.xsl agenda.xml

Para convertir nuestro [XML] a [XSL-FO] mediante [XSLT]
> xsltproc -o agenda.fo agendaFO.xsl agenda.xml

Para convertir nuestro [XML] a [JSON] mediante [XSLT]
> xsltproc -o agenda.json agendaJSON.xsl agenda.xml

Para convertir nuestro [XML] a [RDF] mediante [XSLT]
> xsltproc -o agenda.rdf agendaRDF.xsl agenda.xml

Para convertir nuestro [XML] a [SVG] mediante [XSLT]
> xsltproc -o agenda.svg agendaSVG.xsl agenda.xml

Para convertir [XSL-FO] a [PDF] mediante [Apache FOP] (requiere instalación externa)
> fop agenda.fo agenda.pdf

## Licencia
Esta utilidad se ofrece bajo licencia [GPL versión 3].

[XML]: https://www.xml.com/
[HTML]: https://www.w3.org/html/
[XSL-FO]: https://www.xml.com/pub/a/2002/03/20/xsl-fo.html
[JSON]: http://www.json.org/
[RDF]: https://www.w3.org/RDF/
[SVG]: https://www.w3.org/TR/SVG/
[PDF]: https://get.adobe.com/es/reader/
[Chrome]: https://www.google.es/chrome/browser/desktop/index.html
[Firefox]: https://www.mozilla.org/es-ES/firefox/new/
[Opera]: http://www.opera.com/es
[Microsoft Edge]: https://www.microsoft.com/es-es/windows/microsoft-edge
[Apache FOP]: https://xmlgraphics.apache.org/fop/
[DTD]: https://www.w3schools.com/xml/xml_dtd_intro.asp
[XML Schema]: https://www.w3schools.com/xml/schema_intro.asp
[XSLT]: https://www.w3schools.com/xml/xsl_intro.asp
[CSS]: https://www.w3schools.com/css/
[GPL versión 3]: https://www.gnu.org/licenses/gpl-3.0.html
