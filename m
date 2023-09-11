Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6F679A602
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Sep 2023 10:27:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EE40C6B46E;
	Mon, 11 Sep 2023 08:27:46 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33461C65E4F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Sep 2023 08:27:45 +0000 (UTC)
Received: from [192.168.192.146] (port=40768 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1qfcGf-0001ov-Vu; Mon, 11 Sep 2023 10:27:38 +0200
Date: Mon, 11 Sep 2023 10:27:36 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <ZP7PeFpJzneU2h9k@nx64de-df6d00>
Mail-Followup-To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com
References: <20230907162200.205602-1-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230907162200.205602-1-gatien.chevallier@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Sughosh Ganu <sughosh.ganu@linaro.org>, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH 1/7] rng: stm32: rename STM32 RNG driver
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
Content-Type: multipart/mixed; boundary="===============1024843899930129718=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1024843899930129718==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U+/2MNMhGgq+YarA"
Content-Disposition: inline


--U+/2MNMhGgq+YarA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 07, 2023 at 06:21:54PM +0200, Gatien Chevallier wrote:
> diff --git a/drivers/rng/Kconfig b/drivers/rng/Kconfig
> -%<-
> -config RNG_STM32MP1
> -	bool "Enable random number generator for STM32MP1"
> +config RNG_STM32
> +	bool "Enable random number generator for STM32"
>  	depends on ARCH_STM32MP

Shouldn't the "depends on" be updated as well?
("depends on ARCH_STM32 || ARCH_STM32MP", like in STM32_RESET.)


All the best

--=20
Grzegorz Szymaszek

--U+/2MNMhGgq+YarA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZT55kPBhnB69hD4ZeE9lGUIcpz4FAmT+z3cACgkQeE9lGUIc
pz68SQ//VFui3En7zRyXmQrUSY9PDk3nwEPAZwCAy3hmAfDmnCVOSXAgQ1o1pHz1
g596Jmn+k0kOeDd4lAv9WWWy7NBtmCwNTORQ+iHIz/xesA+dBslmewzqNX9dZeAL
NVUySeRm0Sqijv7vpw5aWlDnWJMUcaiREDK7ZLwayg6HMjcOoGWAKwlIIUqYBjS+
DlTvrlCTJpr5I976vyvbAVdNItW0YFc9uYRbJ31IMnhQec+7fDfepifZHQgVa4i7
5KK3zHn/KgaAzHxmdibcm013FhaiNw6V4Q0bV3N2lXdqk3NQHn7Y/EF6pNkTkorr
ze4zANwDWQRaIMXoWzmRP4f+ON8ikrw/8Z8ui29sh7h63e8DJ1xFu0G9GlYOwVu4
pZpbEPSZtb8bOv18i2NahizT6j3msGZk9Cy01wO13nZxfz/bTccnASOiKCEPY7VI
E+R95PuTEU6X5+Hbz4ktKRtGY14ztuTBmQFg6n7ctcaf/kDy6405sd6BFSUVJIwk
sL5lbZ6M1dcUn8D6NYlEIKMPGGYuV71+Ro1nnK+T5p70Fojg+Dj6UwNTEAmOJIXr
hDCfx9b0u98FQU1v+rLEAr6kI9OVeryfDK1b/qaAb39egmx/Mx0yEG00buL0XNgx
DeCj8snz7rWLs6bQbdFL9efU9Jp+o7jaE/L8YiacFbTTRTWkNWE=
=9V0N
-----END PGP SIGNATURE-----

--U+/2MNMhGgq+YarA--

--===============1024843899930129718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1024843899930129718==--
