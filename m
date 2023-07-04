Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A0B746B98
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Jul 2023 10:11:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74EBDC6B45A;
	Tue,  4 Jul 2023 08:11:26 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3868C03FC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jul 2023 08:11:24 +0000 (UTC)
Received: from [192.168.192.146] (port=40148 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1qGb83-00033A-HD; Tue, 04 Jul 2023 10:11:19 +0200
Date: Tue, 4 Jul 2023 10:11:18 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZKPUJpRdRG7fH79S@nx64de-df6d00>
Mail-Followup-To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com
References: <20230703162754.2341117-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <20230703162754.2341117-1-dario.binacchi@amarulasolutions.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] board: stm32mp1: add splash screen on dk2
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
Content-Type: multipart/mixed; boundary="===============2583660983254498699=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2583660983254498699==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5S8hfHZVgtj+FZ61"
Content-Disposition: inline


--5S8hfHZVgtj+FZ61
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 03, 2023 at 06:27:54PM +0200, Dario Binacchi wrote:
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> -%<-
>  #include <syscon.h>
> +#include <splash.h>
> +#include <st_logo_data.h>
>  #include <usb.h>

These two should be put above syscon.h if you want to keep the includes
sorted alphabetically.

> +			ulong logo =3D
> +				(ulong)stmicroelectronics_uboot_logo_8bit_rle;
> +			bmp_display(logo, BMP_ALIGN_CENTER, BMP_ALIGN_CENTER);

Technically logo is const.


All the best

--=20
Grzegorz

--5S8hfHZVgtj+FZ61
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZT55kPBhnB69hD4ZeE9lGUIcpz4FAmSj1CUACgkQeE9lGUIc
pz6Img//fC+ATawijPSakshb/Xraqz1m6YvRFpcPhJ6hUaWXUYl9UMLiuDOwY/qq
kYXi2qIcRPf9SkRh8AzgCTShbiSdHqE6kdA08JnrDPexit6RTCycYwoH7Cuk5jgz
tSOQ1XG+vDkuijHx/9gG4TIDZV+3aCBKTWFIPfLmd99cPvJrVXqquxdlCkRiRr7/
QmhkUWogMbwt8d/E9gtCSTCLmMc8bEPZ7xCbL9OoYRZvPoTyYRTw5ix2O/g6FDX9
TooBP8Pa0+xt1Il/9bri4wBwz/vLFbJyQl3Mow27XoLr3/6CqK3R3iPgzfPb0pU0
xl/rxUWcfh6JLXFo9yQzfrrnjIt8c32bMbwafpKMd8DMkrnW6WI4RT97c7bKF7Lk
UoZ64Aq/j6oucu+8h01IzlBYSsXFWTFevFCaUBab7/VB+mkAfW2v4WRqFMaZSySd
5g0CS6EmszLZuUMZ4VOU61NgLdGsoY8+dZYwthvVoteUabR2vT9bYcD78coR5jxI
KDmIYMTI/qR3XzozSHzYhsDZ5hHmh2nZCR0WZ64i2lpCMI1LMUpV+9ZOzl4J+fkC
nvGJe+uILz9eakH+l1NcqxmC2W5xMlBAREMnNDBKFcCGin52nPIIrCYUY7cYEx0q
I01a5FXoALMZn3503e//3nB3cV2IyROl9wHqiCTMedw16UAh640=
=DX6+
-----END PGP SIGNATURE-----

--5S8hfHZVgtj+FZ61--

--===============2583660983254498699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2583660983254498699==--
