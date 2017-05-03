<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:gvl="urn:ietf:params:xml:ns:vts-lang">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="gvl:Wallet">
		<html>
			<head>
			
				<link rel="stylesheet" type="text/css" href="cc.css"/>

			</head>
			<body>
			<h1>Libro de Cuentas</h1>
			Usuario <b><xsl:value-of select="gvl:username"/></b>
			
				<hr/>
				<h2>Totales</h2>
				<table class="gtable" width="300px">
					<tr>
						<td><strong><font color="green">Activo</font></strong></td>
						<td align="right"><strong><font color="green"><xsl:value-of select='format-number(sum(gvl:Voucher[gvl:Holder/gvl:name = ../gvl:username]/gvl:Value/gvl:Fixed/@amount),"#.00")'/></font></strong></td>
						<td>Horas BdT</td>
					</tr>
					<tr>
						<td><strong><font color="red">Pasivo</font></strong></td>
						<td align="right"><strong><font color="red"><xsl:value-of select='format-number(sum(gvl:Voucher[gvl:Issuer/gvl:name = ../gvl:username]/gvl:Value/gvl:Fixed/@amount),"#.00")'/></font></strong></td>
						<td>Horas BdT</td>
					</tr>
					<tr>
						<td><strong><font color="black">Neto</font></strong></td>
						<td align="right"><strong><xsl:value-of select='format-number(sum(gvl:Voucher[gvl:Holder/gvl:name = ../gvl:username]/gvl:Value/gvl:Fixed/@amount) - sum(gvl:Voucher[gvl:Issuer/gvl:name = ../gvl:username]/gvl:Value/gvl:Fixed/@amount),"#.00")'/></strong></td>

						<td>Horas BdT</td>
					</tr>
				</table>
				<hr/>
				<h2>Activo</h2>		
	<table class="gtable">
	<tr>
		<th >Emisor</th>		
		<th >Propietario</th>		
		<th >Servicios</th>		
		<th >Validez</th>		

		<th >HORAS BdT</th>			
		<th >Status</th>	
	</tr>
	<xsl:for-each select="gvl:Voucher[gvl:Holder/gvl:name = ../gvl:username]">
	<tr>
		<td  valign="top"><font color="red"><xsl:value-of select="gvl:Issuer/gvl:name"/></font></td>
		<td  valign="top"><strong><font color="green"><xsl:value-of select="gvl:Holder/gvl:name"/></font></strong></td>
		<td  valign="top">
		<font size="1">
		<table style="border:1px solid black;border-collapse:collapse;" width="600">
		<tr>
		<th  width="60%">servicio</th>		
		<th >horas</th>		
		<th >tarifa</th>		
		<th >precio</th>	
		</tr>
		<xsl:for-each select="gvl:Merchandise">
		<tr>
		<td ><xsl:value-of select="gvl:name"/></td>
		<td  align="right"><xsl:value-of select='format-number(gvl:quantity,"#.00")'/></td>
		<td  align="right"><xsl:value-of select='format-number(gvl:rate,"#.00")'/></td>
		<td  align="right"><xsl:value-of select='format-number(gvl:price,"#.00")'/></td>
		</tr>
		</xsl:for-each>
		</table>
		</font>
		
		</td>
		
		<td  valign="top">
		<font size="1" color="green">
		<strong><xsl:value-of select="gvl:ValidPeriod/@start"/></strong>
		</font>
		<br/>
		<font size="1" color="red">
		<xsl:value-of select="gvl:ValidPeriod/@end"/>
		</font>
		</td>
		
		<td  valign="top" align="right"><strong><font color="green"><xsl:value-of select='format-number(gvl:Value/gvl:Fixed/@amount,"#.00")'/></font></strong></td>
		<td  valign="top">
		<font size="1">
		registrado <b><xsl:value-of select="gvl:registered" /></b><br/>
		enviado <b><xsl:value-of select="gvl:sent" /></b>
		</font>
		</td>
	</tr>
	</xsl:for-each>
	</table>
				<hr/>
				<h2>Pasivo</h2>
	<table class="gtable">
	<tr>
		<th >Emisor</th>		
		<th >Propietario</th>		
		<th >Servicios</th>		
		<th >Validez</th>		

		<th >HORAS BdT</th>			
		<th >Status</th>	
	</tr>
	<xsl:for-each select="gvl:Voucher[gvl:Issuer/gvl:name = ../gvl:username]">
	<tr>
		<td  valign="top"><strong><font color="red"><xsl:value-of select="gvl:Issuer/gvl:name"/></font></strong></td>
		<td  valign="top"><font color="green"><xsl:value-of select="gvl:Holder/gvl:name"/></font></td>
		<td  valign="top">
		<font size="1">
		<table style="border:1px solid black;border-collapse:collapse;" width="600">
		<tr>
		<th  width="60%">servicio</th>		
		<th >horas</th>		
		<th >tarifa</th>		
		<th >precio</th>	
		</tr>
		<xsl:for-each select="gvl:Merchandise">
		<tr>
		<td ><xsl:value-of select="gvl:name"/></td>
		<td  align="right"><xsl:value-of select='format-number(gvl:quantity,"#.00")'/></td>
		<td  align="right"><xsl:value-of select='format-number(gvl:rate,"#.00")'/></td>
		<td  align="right"><xsl:value-of select='format-number(gvl:price,"#.00")'/></td>
		</tr>
		</xsl:for-each>
		</table>
		</font>
		
		</td>
		
		<td  valign="top">
		<font size="1" color="green">
		<strong><xsl:value-of select="gvl:ValidPeriod/@start"/></strong>
		</font>
		<br/>
		<font size="1" color="red">
		<xsl:value-of select="gvl:ValidPeriod/@end"/>
		</font>
		</td>
		
		<td  valign="top" align="right"><strong><font color="red"><xsl:value-of select='format-number(gvl:Value/gvl:Fixed/@amount,"#.00")'/></font></strong></td>
		<td  valign="top">
		<font size="1">
		registrado <b><xsl:value-of select="gvl:registered" /></b><br/>
		enviado <b><xsl:value-of select="gvl:sent" /></b>
		</font>
		</td>
	</tr>
	</xsl:for-each>
</table>
		
				


				
				
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>