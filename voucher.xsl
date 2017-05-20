<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:gvl="urn:ietf:params:xml:ns:vts-lang">
	<xsl:output method="html" version="1.0" encoding="UTF-8"
		indent="yes" />
	<xsl:template match="gvl:Voucher">
		<html lang="en">
			<head>
				<title>Contract</title>
				<meta charset="utf-8" />
				<meta name="viewport" content="width=device-width, initial-scale=1" />
				<link rel="stylesheet"
					href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
				<link rel="stylesheet" href="ricardianContract.css" />
				<script
					src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"
					type="text/javascript"></script>
				<script
					src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
					type="text/javascript"></script>
				<script type="text/javascript" src="web3.js"></script>
				<script type="text/javascript" src="bignumber.js"></script>
				<script type="text/javascript" src="ricardianToken.js"></script>
				<script type="text/javascript">
				</script>
				<style>
					.navbar {
					margin-bottom: 0;
					border-radius: 0;
					}
					/* Custom, iPhone Retina */
					@media only screen and (min-width : 320px) {
					}
				</style>
				<link rel="stylesheet" type="text/css" href="cc.css" />
			</head>
			<body>
				<div class="container bg-3 text-center">
					<div class="row">
						<div class="col-sm-6"></div>
						<div class="col-sm-6">
							<h1>CONTRACT</h1>
							<h2>
								<xsl:value-of select="gvl:Title" />
							</h2>
							<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem
								accusantium doloremque laudantium, totam rem aperiam, eaque ipsa
								quae ab illo inventore veritatis et quasi architecto beatae
								vitae
								dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit
								aspernatur aut odit aut fugit, sed quia consequuntur magni
								dolores
								eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam
								est, qui dolorem ipsum quia dolor sit amet, consectetur,
								adipisci
								velit, sed quia non numquam eius modi tempora incidunt ut labore et
								dolore magnam aliquam quaerat voluptatem. Ut enim ad minima
								veniam,
								quis nostrum exercitationem ullam corporis suscipit laboriosam,
								nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure
								reprehenderit qui in ea voluptate velit esse quam nihil
								molestiae
								consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla
								pariatur? At vero eos et accusamus et iusto odio dignissimos
								ducimus qui blanditiis praesentium voluptatum deleniti atque
								corrupti quos dolores et quas molestias excepturi sint occaecati
								cupiditate non provident, similique sunt in culpa qui officia
								deserunt mollitia animi, id est laborum et dolorum fuga. Et
								harum
								quidem rerum facilis est et expedita distinctio. Nam libero
								tempore, cum soluta nobis est eligendi optio cumque nihil impedit
								quo minus id quod maxime placeat facere.
							</p>
							<h2>
								The entity
							</h2>

							<p>
								Quisque libero metus
								<strong>
									<xsl:value-of select="gvl:Issuer/gvl:name" />
								</strong>
								, condimentum nec
								<strong>
									<xsl:value-of select="gvl:Issuer/gvl:longname" />
								</strong>
								, tempor a
								<strong>
									<xsl:value-of select="gvl:Issuer/gvl:shortname" />
								</strong>

								, commodo mollisshortname, magna. Vestibulum ullamcorper mauris
								at
								ligula. Fusce fermentum. Nullam cursus lacinia erat.
								Praesent
								blandit laoreet nibh. Fusce convallis metus id felis
								luctus
								<strong>
									<xsl:value-of select="gvl:Issuer/gvl:postaddress" />
								</strong>
								adipiscing
								<strong>
									<xsl:value-of select="gvl:Issuer/gvl:country" />
								</strong>
								. Pellentesque egestas, neque sit amet
								convallis pulvinar,
								justo
								<strong>
									<xsl:value-of select="gvl:Issuer/gvl:registration" />
								</strong>
								nulla eleifend augue, ac auctor orci
								leo non est. Quisque id
								mi. Ut
								tincidunt tincidunt erat. Etiam
								feugiat lorem non metus.
								Vestibulum
								<strong>
									<xsl:value-of select="gvl:Issuer/gvl:account" />
								</strong>
								dapibus nunc ac augue.
								Curabitur vestibulum aliquam leo.
								Praesent
								egestas neque eu
								enim. In hac habitasse platea dictumst.
								Fusce a
								<strong>
									<xsl:value-of select="gvl:Issuer/gvl:Bzz" />
								</strong>
								quam. Etiam ut
								purus mattis mauris
							</p>
							<h2>
								The voucher
							</h2>
							<p>Suspendisse potenti. Pellentesque commodo eros a enim.
								Vestibulum
								turpis sem, aliquet eget, lobortis pellentesque, rutrum eu, nisl.
								Sed libero. Aliquam erat volutpat. Etiam vitae tortor. Morbi
								vestibulum volutpat enim. Aliquam eu nunc. Nunc sed turpis. Sed
								mollis, eros et ultrices tempus, mauris ipsum aliquam libero,
								non
								adipiscing dolor urna a orci. Nulla porta dolor. Class aptent
								taciti sociosqu ad litora torquent per conubia nostra, per inceptos
								hymenaeos.
							</p>
							<table>
								<tr>
									<td>currency</td>
									<td>
										<strong>
											<xsl:value-of select="gvl:Value/gvl:Fixed/gvl:currency" />
										</strong>
									</td>
								</tr>
								<tr>
									<td>voucherTokenSymbol</td>
									<td>
										<strong>
											<xsl:value-of select="gvl:Value/gvl:Fixed/gvl:voucherTokenSymbol" />
										</strong>
									</td>
								</tr>
								<tr>
									<td>voucherTokenLogoBzz</td>
									<td>
										<strong>
											<xsl:value-of select="gvl:Value/gvl:Fixed/gvl:voucherTokenLogoBzz" />
										</strong>
									</td>
								</tr>
								<tr>
									<td>amount</td>
									<td></td>
									<strong>
										<xsl:value-of select="gvl:Value/gvl:Fixed/gvl:amount" />
									</strong>
								</tr>
								<tr>
									<td>decimalPower</td>
									<td>
										<strong>
											<xsl:value-of select="gvl:Value/gvl:Fixed/gvl:decimalPower" />
										</strong>
									</td>
								</tr>
								<tr>
									<td>ETHEREUM Token Address</td>
									<td>
										<strong>0x67c846bc78f0ca5f19252d7aa24a055811b71d4a</strong>
									</td>
								</tr>
							</table>
							<h3>Valid Period</h3>
							<table>
								<tr>
									<th>Sart</th>
									<th>End</th>
								</tr>
								<tr>
									<td>
										<xsl:value-of select="gvl:ValidPeriod/@start" />
									</td>
									<td>
										<xsl:value-of select="gvl:ValidPeriod/@end" />
									</td>
								</tr>
							</table>
							<h2>Definitions</h2>
							<p>Praesent nec nisl a purus blandit viverra. Praesent ac massa
								at
								ligula laoreet iaculis. Nulla neque dolor, sagittis eget,
								iaculis
								quis, molestie non, velit. Mauris turpis nunc, blandit et,
								volutpat
								molestie, porta ut, ligula. Fusce pharetra
								convallis urna. Quisque
								ut nisi.
							</p>

							<ul>
								<xsl:for-each select="gvl:Description">
									<li>
										<i>
											<xsl:value-of select="." />
										</i>
									</li>
								</xsl:for-each>
							</ul>
							<h2>Goods, Products and Merchandises</h2>
							<p>Phasellus volutpat, metus eget egestas mollis, lacus lacus
								blandit dui, id egestas quam mauris ut lacus. Fusce vel dui. Sed
								in
								libero ut nibh placerat accumsan. Proin faucibus arcu quis ante. In
								consectetuer turpis ut velit.
							</p>

							<ul>
								<xsl:for-each select="gvl:Merchandise">
									<li>
										<i>
											<xsl:value-of select="." />
										</i>
									</li>
								</xsl:for-each>
							</ul>
							<h2>Conditions</h2>
							<p>Nulla sit amet est. Praesent metus tellus, elementum eu,
								semper
								a,
								adipiscing nec, purus. Cras risus ipsum, faucibus ut, ullamcorper
								id, varius ac, leo. Suspendisse feugiat. Suspendisse enim turpis,
								dictum sed, iaculis a, condimentum nec, nisi.
							</p>
							<ul>
								<xsl:for-each select="gvl:Condition">
									<li>
										<i>
											<xsl:value-of select="." />
										</i>
									</li>
								</xsl:for-each>
							</ul>
							<p align="right">
								signed
								<strong>
									<xsl:value-of select="gvl:Issuer/gvl:name" />
								</strong>
							</p>
							<p align="right">
								at
								<xsl:value-of select="gvl:Issuer/gvl:country" />
							</p>
						</div>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>