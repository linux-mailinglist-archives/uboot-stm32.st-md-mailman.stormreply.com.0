Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8320641B680
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Sep 2021 20:45:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD61EC57B6F;
	Tue, 28 Sep 2021 18:45:20 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C086C5719E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Sep 2021 18:45:19 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id a13so20853838qtw.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Sep 2021 11:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9sfA5aEaLqPEDqduiDaprCWpUXBQt9/SYQAwo0r8lRQ=;
 b=cghghXXWypn+tS7mnrYhu9cS3uFF8D85fxk0HTCuy4nvpzcmAqAoNZS3GfnbCnK72I
 X2CXKS0C8+lfJfab/izdAZECNEU61Rcpv/SplrPqPJO737W7O+cW1km4LK7dRUYcD1zz
 PANs7Q5KVXBx+oQ/QYKTszzq4t/JqrI1oOZT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9sfA5aEaLqPEDqduiDaprCWpUXBQt9/SYQAwo0r8lRQ=;
 b=D8/2xy8IeoDCnegpc+UlHTMOUEpZZyj6hGjC5e868Ncaqq3sJPhmKmqrexYJpvc33f
 PpuVwpr9NBHhaEWE74gKa17fQgUo4a1Tz78jqrTbsbKsOr6qI15rs+Avl2yk+/KI9HIL
 GyIvsFQDKzeg7RtG8TixSU30iSMPi/KkKZn6i7JW0Pn9yFaO/WzaUGRWar356kdUeNyO
 fH9CRKzwYfl9j4xtj4f9pUIGGI/vy3P/xHzPhTSgx1lQmo4jpinfmYLda94C3ChCwgqf
 2c7r2LRlylGoZMG6Cnopx7fjNwYusBgvzGvmrsiiJhZphidAc2PKZtlxE9IQ65NCS30X
 M0OA==
X-Gm-Message-State: AOAM531ya4Dn1I8Uo5FND7M1E0ua+k+Ue74bL+7td4VRBU0FHw3suYKo
 IEjsRNZVFkUGlcDCSyeF6Pykfg==
X-Google-Smtp-Source: ABdhPJxfJiqVRbqTtI4ikhl2YTpfPzQwAUAhymSzmZtBpoy3VGnPK3IHhqp44RXcXY8zzsjcUD/EzA==
X-Received: by 2002:ac8:1090:: with SMTP id a16mr7345131qtj.297.1632854718062; 
 Tue, 28 Sep 2021 11:45:18 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-c022-6242-d139-1392.res6.spectrum.com.
 [2603:6081:7b01:cbda:c022:6242:d139:1392])
 by smtp.gmail.com with ESMTPSA id s185sm8421959qke.93.2021.09.28.11.45.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 28 Sep 2021 11:45:17 -0700 (PDT)
Date: Tue, 28 Sep 2021 14:45:15 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210928184515.GW31748@bill-the-cat>
References: <20210922162909.1857566-1-patrick.delaunay@foss.st.com>
 <20210922182841.v4.1.I81b4f1edfe925b001299e3b7ba0cf602d9268d59@changeid>
MIME-Version: 1.0
In-Reply-To: <20210922182841.v4.1.I81b4f1edfe925b001299e3b7ba0cf602d9268d59@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, u-boot@lists.denx.de,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v4 1/2] mtd: cfi_flash: use
 cfi_flash_num_flash_banks only when supported
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
Content-Type: multipart/mixed; boundary="===============0974629199339493756=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0974629199339493756==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MhDS85o8hQkNlKhq"
Content-Disposition: inline


--MhDS85o8hQkNlKhq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2021 at 06:29:07PM +0200, Patrick Delaunay wrote:

> When CONFIG_SYS_MAX_FLASH_BANKS_DETECT is activated,
> CONFIG_SYS_MAX_FLASH_BANKS is replaced by cfi_flash_num_flash_banks,
> but this variable is defined in drivers/mtd/cfi_flash.c, which is
> compiled only when CONFIG_FLASH_CFI_DRIVER is activated, in U-Boot
> or in SPL when CONFIG_SPL_MTD_SUPPORT is activated.
>=20
> This patch deactivates this feature CONFIG_SYS_MAX_FLASH_BANKS_DETECT
> when flash cfi driver is not activated to avoid compilation issue in
> the next patch, when CONFIG_SYS_MAX_FLASH_BANKS is used in spi_nor_scan().
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--MhDS85o8hQkNlKhq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFTYrsACgkQFHw5/5Y0
tyxs5Qv+Ps2vswliBe5on4gI/RecCQ4MEiMrj+bbpO0BiSSqyQTgPXHV2rkPnXMy
bErvuq8QHSqbOEBujD54/il93uG1Y0S6tEOcevDaFeADvp8hl4SR1aP/sdB/3/EA
vCSd770hcttO5kT0FAHIaXcd+X+hR5QD3txcuaXzZel1ff3pWTHgY+s8jNc9XMpm
AsifE5ZhtApR9pdY4F+xB4n0zoj5JJzftllYQ9haa3ULJXzSKumQdFUGypSvUA1X
wrlXeK7ih+CPG5wJNLkwp+JVmrHWz7hLWmoRt8pcDr9QupIAqpFyOKVxI3Nl7sXl
/KxL6RgbIMpctMJajH4EBd40O7CZ+TrurcH2ZqL1+V85ughCICh6Q76z4045zjbK
pmOz7p9m+Rv2mhBHluu2U+pKzPllHQgF08fFg5eFQmiHO5g/EiDkUzxzE0FXYTUk
wBadiO/8G//KkSTNf9giuqCaVajSYWZtwF5BCU9iA3nfXMBdgBpLQ+keG9Vo3/Wd
f3MoBCw1
=2qDz
-----END PGP SIGNATURE-----

--MhDS85o8hQkNlKhq--

--===============0974629199339493756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0974629199339493756==--
