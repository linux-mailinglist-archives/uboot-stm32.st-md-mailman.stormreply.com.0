Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3C374780A
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Jul 2023 19:50:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D37D1C6B45A;
	Tue,  4 Jul 2023 17:50:00 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B67CCC03FC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jul 2023 17:49:59 +0000 (UTC)
Received: from [192.168.192.146] (port=35054 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1qGk9y-0000OA-Bj; Tue, 04 Jul 2023 19:49:54 +0200
Date: Tue, 4 Jul 2023 19:49:53 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZKRbwQqxl43XMThB@nx64de-df6d00>
Mail-Followup-To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com
References: <20230704173121.589620-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <20230704173121.589620-1-dario.binacchi@amarulasolutions.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v2] board: stm32mp1: add splash screen on
	dk2
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0244885290608138992=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0244885290608138992==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yuwUI+k0RE8ZbWw2"
Content-Disposition: inline


--yuwUI+k0RE8ZbWw2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 04, 2023 at 07:31:21PM +0200, Dario Binacchi wrote:
> Display the STMicroelectronics logo.
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Reviewed-by: Grzegorz Szymaszek <gszymaszek@short.pl>

--yuwUI+k0RE8ZbWw2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZT55kPBhnB69hD4ZeE9lGUIcpz4FAmSkW8AACgkQeE9lGUIc
pz7aoQ//TQgkjydAeiZ83GDoGEBlVrFfXR1JUqju6per4mTI7HPSLGYhBp99V40J
/WfGIThzsqboKcjMveFwborXfi3NFK80dXNQyvQ6tP61ouZ6kfHjjL3yjMXuZ/61
KYoRLdrFEqQs4+cjnPWvHt2gOZjlftLeabvqLoa9BCP1R7esG5FuuGzrm1IfcaS5
LnPphB/re/gwyK/fxiuUtPx9LG5YE7lkkELZv4k0vXYJ1J1vSPg+dGqjUIQrnqZR
66QcQWwhegj9dS+FHBZ88BYIwrspd3DntOyULT8/6SNniRIXSecdTfgu6cexm3el
AYy9JudhBJOUtXLVIrqflHBoQipBhc1vyjW8Q7n7KT8oE4+2+F8k9lByYJ05Mq5R
mec/+gD7gWjQJdpjcj16OXvO59zXsbpLDd1D7jv7uyrL4PwG7xi+fdHKN4tLON4U
4yTI+YG7iqVQ71Ya4G+TGif2qFeKVQ+YFL0bzW+zGeWol66t7Oot57Tm08cXEjAk
EVKkn+iezP0oYymuh19+LGbSzqPA12PbqmG3dRWyMRRm25CxzyQA1ViCjcGsB2Dk
KzKTAm2jcsa8UkdP+SwknMVsObpgcyj3f/P6AwTNnFh8bO1FzTP+w7Q4QcTZl4JA
3k8bNHm5OMogfm/9yUdxAu2c/SqptO7/W7eOuAk7voyRnRTedrk=
=9IRT
-----END PGP SIGNATURE-----

--yuwUI+k0RE8ZbWw2--

--===============0244885290608138992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0244885290608138992==--
