Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC6265C81F
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Jan 2023 21:35:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CB70C65E73;
	Tue,  3 Jan 2023 20:35:09 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1ED2FC65048
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 20:35:08 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id q10so22193806qvt.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Jan 2023 12:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KRG0t3C2GRWLS5M8Y2zqSCSGET7ZZXO1SZPO+IvNzds=;
 b=gzLzTTFW2CBjZYaUTDtWpyuDW93adNMsD7Mrc5k76yfPKl4Gcg+fOgZiTraAM2xoCA
 6eqBZg2iIEqr+iRFra2wzLlAFHUQxatbJmLE3o0MFSF4q4jy6jbV9B15CuGwELstB13y
 pcEI9e85ZTb23xubTzoPqOV/YY8Nu6Zk2p8PI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KRG0t3C2GRWLS5M8Y2zqSCSGET7ZZXO1SZPO+IvNzds=;
 b=svi595efFfa7DPNGP7UsJPE9jkD2AuE4LbnaBgvYuNW+YmwWbtciWs1o0GPuClaQcp
 snrlyNjyekuFuRub2scpGqJVnW/ftziz9pRocMeCydCz9M1kebMjE9ehxD1Px83GdZlk
 pe3ABLP+YsuSiA04I2P2m+szWjSKc11DCjgXjkoyqjtT/BMActCn151F2a8G7QspTIJ2
 87K/Q/SAriw6GZ9Bg1k9IpzRsCLwoqY8STAT2yCfgUp63UQsHKkSEQwQ1x2zaA+mMYCo
 ex7ku8I+Rm4cUb1wOS8DNoGLblCw63MeeK7eUircsGD+kXuW+eAAEPT3xnhzmLdoRRU/
 J8qA==
X-Gm-Message-State: AFqh2krD4aQGBu5+kME2krnooGTlTfHcnmpohemio7Y1VtkGuO09dY2e
 2rFdy6ytkFNNSrSbcxVtknZxgg==
X-Google-Smtp-Source: AMrXdXvgSp/hChM7KpvRpVlsmxxtDVivWOpw+ta5DPv979LEC8xnWwYrYh3XAWJsQ+uy8+FDALPY4Q==
X-Received: by 2002:a05:6214:5e09:b0:4f1:2bc5:de14 with SMTP id
 li9-20020a0562145e0900b004f12bc5de14mr84306822qvb.9.1672778106999; 
 Tue, 03 Jan 2023 12:35:06 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-f40a-aab8-e211-5b44.res6.spectrum.com.
 [2603:6081:7b00:6400:f40a:aab8:e211:5b44])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a05620a2a4c00b006fef61300fesm23095970qkp.16.2023.01.03.12.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 12:35:06 -0800 (PST)
Date: Tue, 3 Jan 2023 15:35:04 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20230103203504.GM3787616@bill-the-cat>
References: <20221215101547.1.Ic4654626494193d6dd4788d14fda0aae447783a5@changeid>
MIME-Version: 1.0
In-Reply-To: <20221215101547.1.Ic4654626494193d6dd4788d14fda0aae447783a5@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Simon Glass <sjg@chromium.org>,
 Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] fastboot: remove #ifdef CONFIG when it is
	possible
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
Content-Type: multipart/mixed; boundary="===============3267025224372673126=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3267025224372673126==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pgw/fgLwMA5bWWfh"
Content-Disposition: inline


--pgw/fgLwMA5bWWfh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 15, 2022 at 10:15:50AM +0100, Patrick Delaunay wrote:
> Much of the fastboot code predates the introduction of Kconfig and
> has quite a few #ifdefs in it which is unnecessary now that we can use
> IS_ENABLED() et al.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>=20
>  cmd/fastboot.c                  |  35 +++++------
>  drivers/fastboot/fb_command.c   | 104 ++++++++++++--------------------
>  drivers/fastboot/fb_common.c    |  11 ++--
>  drivers/fastboot/fb_getvar.c    |  49 ++++++---------
>  drivers/usb/gadget/f_fastboot.c |   7 +--
>  include/fastboot.h              |  13 ----
>  net/fastboot.c                  |   8 +--
>  7 files changed, 82 insertions(+), 145 deletions(-)
>=20
> diff --git a/cmd/fastboot.c b/cmd/fastboot.c
> index b498e4b22bb3..b94dbd548843 100644
> --- a/cmd/fastboot.c
> +++ b/cmd/fastboot.c
> @@ -19,8 +19,14 @@
>  static int do_fastboot_udp(int argc, char *const argv[],
>  			   uintptr_t buf_addr, size_t buf_size)
>  {
> -#if CONFIG_IS_ENABLED(UDP_FUNCTION_FASTBOOT)
> -	int err =3D net_loop(FASTBOOT);
> +	int err;
> +
> +	if (!CONFIG_IS_ENABLED(UDP_FUNCTION_FASTBOOT)) {
> +		pr_err("Fastboot UDP not enabled\n");
> +		return CMD_RET_FAILURE;
> +	}
> +
> +	err =3D net_loop(FASTBOOT);
> =20
>  	if (err < 0) {
>  		printf("fastboot udp error: %d\n", err);
> @@ -28,21 +34,21 @@ static int do_fastboot_udp(int argc, char *const argv=
[],
>  	}
> =20
>  	return CMD_RET_SUCCESS;
> -#else
> -	pr_err("Fastboot UDP not enabled\n");
> -	return CMD_RET_FAILURE;
> -#endif
>  }

This probably needs to become an if (CONFIG_IS_ENABLED(...)) { ... }
else { ... } in order to remain size-neutral.

--=20
Tom

--pgw/fgLwMA5bWWfh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmO0kXQACgkQFHw5/5Y0
tyxDxQv+KRQL0UkdUwuxq7A4fWA7+PAvgLLs4abINCBR4Fu6NbTSGd3kNP/8lMDk
nKaEMyza3brSM0S1tctMqibfD8QwMV1QcHaJkdis4yTMQX25ndi1vaIOwHOwePGE
LEWdujbodE5RO/vn5opcroAG6wANuT7cWWID57clpCnLucd/IqLXyey357J2hlZN
HqKkoRKxUL+eI8t/tNKgEi+ufToNt1OGdMFK49yF+m/y1mP+uJIhWfMncla8F0GK
UawSt2V1rzBna03lsnAc5ICKNreeGble5Lm+8JlgBBL+XVlOpAHCWJxUcRrGi4dU
M3P1B0YfBgB5N7rKwTJf+ZWbYCWisVIB8XYtA0o/0IsbhP1ChBk+mjNpzDuPP3/O
sl+F5ag9GdiPftpv6v6c9H1rjmB+isjONiD+cun2fo3dDKTpeqQV+kuAeQuZCIE+
8G5sY2KeG5EqeAol0CkpZd1yUCEoMs2yMDn5lO88Obn6Xuwh7y8QBTHYSrQQRI9Z
N/N4gYFn
=8dLn
-----END PGP SIGNATURE-----

--pgw/fgLwMA5bWWfh--

--===============3267025224372673126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3267025224372673126==--
