Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3617FE72DD
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Oct 2019 14:49:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8501C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Oct 2019 13:49:51 +0000 (UTC)
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5114C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Oct 2019 13:49:50 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id h202so4029858ybg.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Oct 2019 06:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=D1Z0bnHFoVJPnT3uRC3PmuzBrFxAzOcQiJom2w8XZcY=;
 b=VpKW29yY1n610aVipfZ055dNhrF8KoIzF0dQS6jIfGM4+dJL1S/aiyPharkIjoRWo6
 QaCmfVEuPRIuyW82NPWOoOpyPdNsCYbGXZkGMUsF+H9QT2K7EN862hYmGfzbPnIXZXF2
 aI4atZ/7+DgJ0sG3IE8tazB5xOOrNLELVQuk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=D1Z0bnHFoVJPnT3uRC3PmuzBrFxAzOcQiJom2w8XZcY=;
 b=IFRhmeO79agSMO8eAlT1XYnbIP5V8DReZJi9lQ6iMxHK3f06g541f1gRHg2ZImyPf+
 tXQNWh7OaWoWy/HZ+zPU6zbEyzKMmn4n6RsA8koVH+6HUUb5YUaYfkxvQloAOqtPGOzF
 c6LbqHsMQWhNZaEypYCJz8/TY8N85qNL8m3nYFXFSWZK7BcZ8btibLpk112BRAD5qwyL
 lhFCYiFX7kebdLVljQpDvghF0uZmnO3u81kH/6Ig7ZXkDPVsgNXRUH6QxSV2ORM+qUyu
 xSEiH2bhZI/oLv7XERl9kzhIEeXeHcRC75jV9XeWQbBqBw+S/4arR6u1echYjWNVjpLY
 yQNw==
X-Gm-Message-State: APjAAAVVd0NG/yVkMj/wlvLv+eG4Il/c/4ivhsgKn0OG/79GR3pKXeec
 /vYZRX0hEX69tPU0u/NZLC0meg==
X-Google-Smtp-Source: APXvYqxAZ6PgMk+C7sPG7UYx7SAeOALYeeNIMtF+Yzu3XfNPBc/1cEBv3IyTeUeMy1YRDGx/lplaDg==
X-Received: by 2002:a25:e7c4:: with SMTP id
 e187mr13983639ybh.235.1572270589468; 
 Mon, 28 Oct 2019 06:49:49 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-8.ec.res.rr.com. [65.184.142.8])
 by smtp.gmail.com with ESMTPSA id q198sm6439742ywg.18.2019.10.28.06.49.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Oct 2019 06:49:48 -0700 (PDT)
Date: Mon, 28 Oct 2019 09:49:46 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@st.com>
Message-ID: <20191028134946.GH11173@bill-the-cat>
References: <20191028132319.21570-1-patrice.chotard@st.com>
MIME-Version: 1.0
In-Reply-To: <20191028132319.21570-1-patrice.chotard@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Boris Brezillon <boris.brezillon@bootlin.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>, Stefan Roese <sr@denx.de>,
 Chris Packham <judge.packham@gmail.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH] cmd: remove NET and CMD_NET
 dependency for CMD_PXE
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
Content-Type: multipart/mixed; boundary="===============6100157803086517639=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6100157803086517639==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vpVygws8pQvai3MI"
Content-Disposition: inline


--vpVygws8pQvai3MI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2019 at 02:23:19PM +0100, Patrice Chotard wrote:

> It allows to use sysboot command on board which have no NET support.
>=20
> Currently, sysboot command can't be used if CMD_NET and NET flags are
> not set, while sysboot allows to load extlinux.conf file from local
> filesystem, so it doesn't need to depend of CMD_NET and NET flags.
>=20
> One solution would be to put sysboot command's code outside pxe.c and
> create a new sysboot.c file. But sysboot command code is imbricated
> with pxe command code and as all CMD_NET relative code is already under
> CMD_NET flag, the easiest way to break sysboot dependency with CMD_NET
> and NET flags is to move CMD_PXE outside CMD_NET and NET section in
> Kconfig.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

How far did you go down the path of making cmd/sysboot.c or similar?
Since it's not obvious unless you're already in here that the
extlinux.conf stuff is inside pxe, it really would be good to split
things out.  If you even have a rough draft patch to look at that would
be great.  Also:

> ---
>=20
>  Kconfig     |  2 +-
>  cmd/Kconfig | 12 ++++++------
>  2 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/Kconfig b/Kconfig
> index 66b059f749..ce2ad16ea5 100644
> --- a/Kconfig
> +++ b/Kconfig
> @@ -87,7 +87,7 @@ config DISTRO_DEFAULTS
>  	select CMD_FS_GENERIC
>  	select CMD_PART if PARTITIONS
>  	select CMD_PING if CMD_NET
> -	select CMD_PXE if NET
> +	select CMD_PXE
>  	select ENV_VARS_UBOOT_CONFIG
>  	select HUSH_PARSER
>  	select SUPPORT_RAW_INITRD
> diff --git a/cmd/Kconfig b/cmd/Kconfig
> index 07060c63a7..2cb0935632 100644
> --- a/cmd/Kconfig
> +++ b/cmd/Kconfig
> @@ -1499,12 +1499,6 @@ config CMD_ETHSW
>  	  operations such as enabling / disabling a port and
>  	  viewing/maintaining the filtering database (FDB)
> =20
> -config CMD_PXE
> -	bool "pxe"
> -	select MENU
> -	help
> -	  Boot image via network using PXE protocol
> -
>  config CMD_WOL
>  	bool "wol"
>  	help
> @@ -1636,6 +1630,12 @@ config CMD_MISC
>  	help
>  	  Delay execution for some time
> =20
> +config CMD_PXE
> +	bool "pxe"
> +	select MENU
> +	help
> +	  Boot image via network using PXE protocol or via local extlinux.conf =
file
> +

We should expand the prompt as well to note that sysboot is in here as
well, if we cannot split.  Thanks!

--=20
Tom

--vpVygws8pQvai3MI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl228foACgkQh/n2NdMd
dlJuJA//dKIMk4j8xiAk71ZlHnYSLUDjhu8WUKSzZz5rfyriISD2+03es3aOAcfA
w5E1eFGP7DTJgkGbCJKXe74rvHqo6gJsnITDwUT4rVkBDoy1EMPnIhPZOqd+aA9c
0bc76/p+A7AKvRJ6RXUsHTZzv66IdU2x+a0Web/9cMvvRMpT1/3b8JNn7Razo1/k
VK82pRnQDbQSjjJKI5ME0WLSM+gY7/C6HKK88t/CHsKm/8oc13REkWgkMlWPQlgW
D0mIha4A/pgZSW50WsUGlLfEz2G6T8QLDjoi+ahGh8cpOmLNs2nA231oyjOgFwnI
W5XMxx6sDVPRKB1UbBwaKTwBz9Bw9AknB+Y9WMjBJoYZIrw9VQBYlrlswCeQeXWg
uGNZVCAzo6h5u22oEXIDqyeHFvQjesjxwbYUQZ5pnbES47ycPvMvCflXkSKbhXy5
3CDXoecaaLiyBmfnYvWJuHER6BJTsTXyzMEbqP8TgzYJXu+z2hd6sbHaLJJmG4fL
/Z8O1aJM+1iv2aCZ77MP65p1tNkgSRVcdty3evjQpPpmpw/NnTyrEolepfOXd0Hn
CjV+JysQOM4YsP+ztgzcF+J3nibynzhBrvbB5kNZxh3Zrj8Q/48GlFBVDu+iEpUX
B10lYof1CRnqIh5zqJduxlxOSycN9VVtI9VCOcYwRBJhJCI0jBg=
=Eo6X
-----END PGP SIGNATURE-----

--vpVygws8pQvai3MI--

--===============6100157803086517639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6100157803086517639==--
