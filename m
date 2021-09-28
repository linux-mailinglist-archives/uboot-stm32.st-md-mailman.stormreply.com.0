Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5132941B681
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Sep 2021 20:45:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B87B1C57B6F;
	Tue, 28 Sep 2021 18:45:25 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C874FC5719E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Sep 2021 18:45:24 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id dk4so4877563qvb.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Sep 2021 11:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5bPO8yBLzkoG3y+0VD4iBeVzBL5Xe2aMxGkfEziDrmo=;
 b=Ch4gxXVfJ6JJJIcKQCPjcNn3o11TVXKRoSJ2NQdL3mLXQtlC/SjjYouqjXp5IxvNih
 zuNi1V9pW4JOBVtYjdDG/zEAuWiDEetiyKd+szQIMlF5ZeAoYlBBV/y1Cs+buKw9zU4X
 +vTO2pjRWf73YSoZQYs4k+wYu8PE8t1bzLy+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5bPO8yBLzkoG3y+0VD4iBeVzBL5Xe2aMxGkfEziDrmo=;
 b=kBeEfENAoaY4zycb9k0yoFbWd3OKb5saYBX1E3Ud+V4SdzI/Z58iEpUfp50KV4tsj+
 wqm9GUiTKAyXqjq4nUfc8aOJKCaeHHaHfX0a8C5NY/FP9LvX0su2fCZ7lZyp1HVUqI26
 DAmXzvF5RD8c73rcnxgI47oiCBdIWF+qIgGvXAwWPlpPihuJ35LiOYXHx9CXc4Tbz52y
 oCOpDr579cfIESWNgPGu8JwfNy9eAVltj9jm47WzkJ8/Yt9LwFgHtW52Fm0YWuVrIJRe
 F4h++0WaVGfW+ACe+WsRJ/I3+i5w5sy2Ng+C4UrZ99aOt+RQwYFgXFnSzpOvsBNar10R
 dmFg==
X-Gm-Message-State: AOAM530n0zcBMkeox/BL6jqFmhrQ2Q3MmKilUKBU9yQzVntnrWFRV3oc
 mU9ZzmdlItHFfpkYWINO6wmQCw==
X-Google-Smtp-Source: ABdhPJylphPeM1vhqHUrbheYYRU4Lr7algmZi/3xQdCCE6WttuChnZjpIFOuCl5KhkfjXFERaHJzew==
X-Received: by 2002:ad4:4873:: with SMTP id u19mr7365907qvy.11.1632854723842; 
 Tue, 28 Sep 2021 11:45:23 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-c022-6242-d139-1392.res6.spectrum.com.
 [2603:6081:7b01:cbda:c022:6242:d139:1392])
 by smtp.gmail.com with ESMTPSA id d24sm15211090qka.7.2021.09.28.11.45.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 28 Sep 2021 11:45:23 -0700 (PDT)
Date: Tue, 28 Sep 2021 14:45:20 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210928184520.GX31748@bill-the-cat>
References: <20210922162909.1857566-1-patrick.delaunay@foss.st.com>
 <20210922182841.v4.2.Ia461e670c7438478aa8f8939209d45c818ccd284@changeid>
MIME-Version: 1.0
In-Reply-To: <20210922182841.v4.2.Ia461e670c7438478aa8f8939209d45c818ccd284@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, Vignesh R <vigneshr@ti.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>, u-boot@lists.denx.de,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v4 2/2] mtd: spi: nor: force mtd name to
	"nor%d"
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
Content-Type: multipart/mixed; boundary="===============1947391864366635541=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1947391864366635541==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qAWpXEdoCCy57CK7"
Content-Disposition: inline


--qAWpXEdoCCy57CK7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2021 at 06:29:08PM +0200, Patrick Delaunay wrote:

> Force the mtd name of spi-nor to "nor" + the driver sequence number:
> "nor0", "nor1"... beginning after the existing nor devices.
>=20
> This patch is coherent with existing "nand" and "spi-nand"
> mtd device names.
>=20
> When CFI MTD NOR device are supported, the spi-nor index is chosen after
> the last CFI device defined by CONFIG_SYS_MAX_FLASH_BANKS.
>=20
> When CONFIG_SYS_MAX_FLASH_BANKS_DETECT is activated, this config
> is replaced by to cfi_flash_num_flash_banks in the include file
> mtd/cfi_flash.h.
>=20
> This generic name "nor%d" can be use to identify the mtd spi-nor device
> without knowing the real device name or the DT path of the device,
> used with API get_mtd_device_nm() and is used in mtdparts command.
>=20
> This patch also avoids issue when the same NOR device is present 2 times,
> for example on STM32MP15F-EV1:
>=20
> STM32MP> mtd list
> SF: Detected mx66l51235l with page size 256 Bytes, erase size 64 KiB, \
> total 64 MiB
>=20
> List of MTD devices:
> * nand0
>   - type: NAND flash
>   - block size: 0x40000 bytes
>   - min I/O: 0x1000 bytes
>   - OOB size: 224 bytes
>   - OOB available: 118 bytes
>   - ECC strength: 8 bits
>   - ECC step size: 512 bytes
>   - bitflip threshold: 6 bits
>   - 0x000000000000-0x000040000000 : "nand0"
> * mx66l51235l
>   - device: mx66l51235l@0
>   - parent: spi@58003000
>   - driver: jedec_spi_nor
>   - path: /soc/spi@58003000/mx66l51235l@0
>   - type: NOR flash
>   - block size: 0x10000 bytes
>   - min I/O: 0x1 bytes
>   - 0x000000000000-0x000004000000 : "mx66l51235l"
> * mx66l51235l
>   - device: mx66l51235l@1
>   - parent: spi@58003000
>   - driver: jedec_spi_nor
>   - path: /soc/spi@58003000/mx66l51235l@1
>   - type: NOR flash
>   - block size: 0x10000 bytes
>   - min I/O: 0x1 bytes
>   - 0x000000000000-0x000004000000 : "mx66l51235l"
>=20
> The same mtd name "mx66l51235l" identify the 2 instances
> mx66l51235l@0 and mx66l51235l@1.
>=20
> This patch fixes a ST32CubeProgrammer / stm32prog command issue
> with nor0 target on STM32MP157C-EV1 board introduced by
> commit b7f060565e31 ("mtd: spi-nor: allow registering multiple MTDs when
> DM is enabled").
>=20
> Fixes: b7f060565e31 ("mtd: spi-nor: allow registering multiple MTDs when =
DM is enabled")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--qAWpXEdoCCy57CK7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFTYsAACgkQFHw5/5Y0
tyyzjgwAi+p5jLemFm+vib5zH7fgSBi8GafsmHVV2Fso0MVfPDUL1FOR7SHPe9Mu
4K8AxDkXJYKNDjVOAhs3nA8Bjy5pHOWs/5/B/jeY08zvJ6tWl5DuwSjCPdZg331T
uAyEnKfVmrN2oDfqpQIzz+T8s3z43rrGizTMyUwE7rkmwDtaGbcCCEyZdH+9pj24
CpHEuiOiab77SOgk3HkOct1k9nj+ylNkyNMXm5DIKa1XE3GWPsJ67negOON+CJni
PWBlZtfFtS7USXu21zUSmvdrz8Xt18vgerHsNwnc6d+zbitiPF5muhDrqkJbIudu
fhumSfXXPpyXjVxMy+yZq3WgchYBWH/i5EryoDGWjP0U82eeUDcXOz1hGR/FrM/H
kEEfekfw/1Tk6D5c5+2QNYbkPma8n5mD+cyuDLCHLQBR8ry0uxlGLHg9VlowAx4j
kDB2+mdsGCRuoadUJDKocdbm9TGaiiguwsGnOKCoxv5Z6R3Kjl8/51dEpPG5NJ3m
qtaNqwaP
=rjEz
-----END PGP SIGNATURE-----

--qAWpXEdoCCy57CK7--

--===============1947391864366635541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1947391864366635541==--
