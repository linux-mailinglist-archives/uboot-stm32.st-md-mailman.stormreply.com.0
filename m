Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A16445A00BB
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Aug 2022 19:52:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AFC4C6410D;
	Wed, 24 Aug 2022 17:52:03 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A741C6410C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Aug 2022 17:52:01 +0000 (UTC)
Received: from [192.168.192.146] (port=53226 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1oQuXl-0007yb-5Z; Wed, 24 Aug 2022 19:51:57 +0200
Date: Wed, 24 Aug 2022 19:51:55 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <YwZlOysJm4st3Mtc@nx64de-df6d00>
Mail-Followup-To: Patrice Chotard <patrice.chotard@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com
References: <20220824150659.1117510-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20220824150659.1117510-1-patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] configs: stih410-b2260: Fix SYS_HZ_CLOCK
	value
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
Content-Type: multipart/mixed; boundary="===============2247816822876607405=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2247816822876607405==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HGHB4/Ikbnm7bZy3"
Content-Disposition: inline


--HGHB4/Ikbnm7bZy3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 24, 2022 at 05:06:59PM +0200, Patrice Chotard wrote:
> SYS_HZ_CLOCK was wrongly set to 1MHz whereas it's set to 750MHz
> by default by bootrom.

s/1MHz/1GHz/, it seems. Otherwise:
Reviewed-by: Grzegorz Szymaszek <gszymaszek@short.pl>


All the best

--=20
Grzegorz

--HGHB4/Ikbnm7bZy3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZT55kPBhnB69hD4ZeE9lGUIcpz4FAmMGZTsACgkQeE9lGUIc
pz7SOhAAhT2SZb2Lf8lWXYK7KFKTEdgUtrsw2e+WaMoeS/D7FbQYn1kKBpWmMQYP
frQPx/MtDMy78xTCOTXvVmqfIuF2nU4d1jgXKeao8H2922kRH+a9BV+JkfbncPs0
71JmO42E1AlVATeyS7I1xXyBZpBBaFOfNwSMjbveCcrHOVf9c9QgwgXafjfRpHeD
OXWEOnhC9n80GmmakA3qwLk3fSsOf3hF0ehpgF2NMBjEiXTMxqTgo50fMa6L6Bix
UYjhM7GJ2G9vHKFMtbdBwp9AQxH1gPaJm4P6CY9tlmQdqMvqghvpPdBlTj6WaZ+6
yK3O100EeiEf/RnZk5w3rXBj7SVZFGK5SAROSimQ6ph6pHK1s3wntB6cNkm8OEjV
CXTmVRwHG4LASNNyJ3KKp5JdBQ8DpZC/V1c+Y4tnBsH4L+DDB3z/8ZWkMLA/42XT
bQSQiIxxAv3btMk00xpmL7YkMX8YkwXTSqAYC9oqlDbQi4wLMVAw4VafGk01c77+
0/5IAyhTgnMjyVpUu0gh+sBqmB2TiJhGUpsWQU4K2ugJU25eD78Q7rBWnur0iotn
Ilfn7Vq5wVY15Sp5h6UccdkRzV4jNMKihQU7CSDPfXUovu125cp0gUc+SByjcLXj
m1kniGAFT0Q3ewgx5ck6tb3YJ4xnypL8wnkoc7xbxOqsM+nZww8=
=+F9Y
-----END PGP SIGNATURE-----

--HGHB4/Ikbnm7bZy3--

--===============2247816822876607405==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2247816822876607405==--
