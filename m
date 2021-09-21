Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E519413A22
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Sep 2021 20:39:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC866C5A4CC;
	Tue, 21 Sep 2021 18:39:12 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7F67C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Sep 2021 18:39:08 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id c20so235293qtb.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Sep 2021 11:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ytVTv1R1YAoodDepAHb3X6XkYeOiEJxlB2DbxZWyg9o=;
 b=U0MhowPB198KZVLudTXEqNsiYtC/1pyDli92MnLDdRu8bRbADnSFbQZhl+lB99CxU1
 OnhoUZm6x6fCIh9WmapYrABobQw4KHPwfCXuheWOvhIGFTAEauWzeoPBKugbMqd9Og82
 KtXX9a7EVr+IRwXyzJLiXcyt3TEt4xRPiigLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ytVTv1R1YAoodDepAHb3X6XkYeOiEJxlB2DbxZWyg9o=;
 b=ipRm/rWRhPCj+DZ1egVCMDYNqnC/DEyUkQ2R1BtmFdOYS11br2pbt6lzBMc5VpYM3G
 cyWJ3CdoYdZSrOZ9OY5fHFNNUi6AIGio7TvF+Zus5d61Q78fzG/mu3tyoFl1Af6fxiG1
 pR+dlNyx5CmD1LLi7HcxT1ILHLYs2cZda27SrELWH3fhLJak0xOihrrDluEH977C885k
 0aRzQ/71F2Nm4tR6cGqzQxdY/wl/4HW1Yk70uyUP9RUKfXcPlryVV3LRBvzTxVOzmutC
 QQK9hqEwNC/C2NTP+kHZ5rUhWSSdjZRktDKUW+1JQ+0bxzcNJiH0KOjEj7ASb4dMA7qB
 CElQ==
X-Gm-Message-State: AOAM531tUznqezo1YgGEkQvVTJRWZGMzYLG5Ejzfd5GJxX2X9x1Nfv0q
 5J14w7+8O++wewm2n+jKloql7g==
X-Google-Smtp-Source: ABdhPJxQnL0oWTBrYbjR+Gm/V0kJckOXqbMRzxBWCXT61XrNzVRNxhqfLfBaQnDRmfXo0Tgvrz/FlQ==
X-Received: by 2002:a05:622a:1aaa:: with SMTP id
 s42mr29731766qtc.122.1632249547974; 
 Tue, 21 Sep 2021 11:39:07 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-24fc-d77e-8558-6741.res6.spectrum.com.
 [2603:6081:7b01:cbda:24fc:d77e:8558:6741])
 by smtp.gmail.com with ESMTPSA id 66sm2371410qke.118.2021.09.21.11.39.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 Sep 2021 11:39:07 -0700 (PDT)
Date: Tue, 21 Sep 2021 14:39:05 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210921183905.GI8579@bill-the-cat>
References: <20210921183600.1.I82d7f080bc204e75e2f305a8056363038d3d9c0d@changeid>
MIME-Version: 1.0
In-Reply-To: <20210921183600.1.I82d7f080bc204e75e2f305a8056363038d3d9c0d@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Stefan Roese <sr@denx.de>, Priyanka Jain <priyanka.jain@nxp.com>,
 Simon Glass <sjg@chromium.org>, Rick Chen <rick@andestech.com>,
 u-boot@lists.denx.de, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: Migrate CONFIG_ST_SMI to Kconfig
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
Content-Type: multipart/mixed; boundary="===============0475444868676125422=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0475444868676125422==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="leQ0ainWKcxhm+Q3"
Content-Disposition: inline


--leQ0ainWKcxhm+Q3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 21, 2021 at 06:36:03PM +0200, Patrick Delaunay wrote:

> Use moveconfig.py script to convert the define CONFIG_ST_SMI to Kconfig
> and move this entries to defconfigs.
>=20
> Before migration, the st_smi.c driver was empty when CONFIG_MTD_NOR_FLASH
> wasn't activated; it is now managed in Kconfig by the "depends on" and
> this driver is not compiled.
>=20
> After this patch, the driver st_smic.c is no more used in U-Boot;
> it was only used in SPEAr products before commit 570c3dcfc153 ("arm:
> Remove spear600 boards and the rest of SPEAr support").
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> In the first migration process (without depends on) the config
> CONFIG_ST_SMI was added in bcm7445_defconfig and bcm7260_defconfig.
>=20
> But after adding the "depends on MTD_NOR_FLASH" and a Rsync all defconfig
> files using moveconfig.py the CONFIG_ST_SMI is also deactivated in these
> 2 last users:
> - bcm7260_defconfig
> - bcm7445_defconfig
>=20
> The U-Boot size don't change for these 2 defconfig (tested with buildman).

Thanks for doing a migration.  But, since you've found this is dead
code now, it would make more sense to just delete the driver.

--=20
Tom

--leQ0ainWKcxhm+Q3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFKJsIACgkQFHw5/5Y0
tyy3RQv8D+eJIVihB/JKxjatWhw0XOWRExPt93fSA4Cv9HPr7zZDHh9N1jprhj7T
xSTYLGzAB3nMn3iWcqRD0GlrnyJCQZQucR0dODvs7jylehr66y6uiwZERHlJLpT+
Pw4JU+5IT0XEzVSXYpcZXyJ0zOYNaVim6oMx+4so1/yiEU6L67PLb3lksAqzUt4J
HZBWt5pOboU0pVhzneEYQmE7wraxSoY9La/eMKe0421N0t1OuxUoTTUOJjjWJ5Av
/dRRyHz+aem7gXY8iEI6PE2Rbi3uiKqcapZNm6kS07JsQv0xCY+leKlwkoex0bts
YQpVyncBUx//8u85p3xyZh27ahwYAyJTd16J0xvJn2C8ZrXE/tNaqBBSd4eJMsIy
9EGa+w3LgL/PrYHDXe72i3A+KgRG3LJirhS5FWg5LWfoBAR3F9/nWVpiuMFdbRHJ
yJQVP6qAdRLc9H1BO4bTNVbYG9biebIVEwFFNJMxEoU0THn2NP2UZ9KwfLWmBSgm
wVdktnIo
=nrWw
-----END PGP SIGNATURE-----

--leQ0ainWKcxhm+Q3--

--===============0475444868676125422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0475444868676125422==--
