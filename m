Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D9327E935
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Sep 2020 15:08:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A16ECC36B37;
	Wed, 30 Sep 2020 13:08:31 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 357EFC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Sep 2020 13:08:29 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id c2so1246018qkf.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Sep 2020 06:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=37AEv6KejEitO7J4az4BGPHWHxHZh909CC2H4fRKNqM=;
 b=csGRtbbr7vhqAVrGSaAx0x2mCSs6Equryqsyy+lnmPZfBa50XrW00j3MW5gdCHq0FG
 6JRRZCdUgmucVuOe8buq4HEwzCwhutBagYXWEIePDIRkqIOglV9yM70zhr79RYUSTcY3
 P0nEfMtsbsOTMoHe8d+JfPKhM1DI75NT9OqOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=37AEv6KejEitO7J4az4BGPHWHxHZh909CC2H4fRKNqM=;
 b=rGfk2Zv5L8kxwqfJknoxRYPQzgw4+X4G/K70wr+hdZNLSMHUUnSWicFCbD6N38AdBo
 squ+FO27v+T/JAoG38xvg7EyCVCwnJnQWbZr/Y/nYQSGGZvpqpclHatgUyLI8i/Q0Wve
 mm1PHcssrU/qnxKQ5kNMlc0ygkh5lwrrxuUFJNV/l/s3C1jEg9trBbBgRRgSD4+ZqIxb
 XgAHtCxt6gVAiE/OrRGEfvqexbqkI0law5AKuKMmcC+m9syFKTrKzOzbA8xie6Khx6F4
 KeF6421n0dYpdC6kKxUkVEFcHD5zT9d3soDBIXzqFfBttPxzDKMR/AtZ8hZveofQxvgK
 aypw==
X-Gm-Message-State: AOAM533dM9516zh+wgAK95SPEyu6zfblfq+adYrDph1IxfmBci+gxIv0
 AiLhAHIwkTeyWtZm7CBB+WcbKw==
X-Google-Smtp-Source: ABdhPJwdAmU5O1QI2UaNB85TNYIc8F3MyYyItRR1dyUV4NhsJ6U7E/cRWKKrZolSdunmDDzoDrLksA==
X-Received: by 2002:a05:620a:14b0:: with SMTP id
 x16mr2319158qkj.441.1601471307772; 
 Wed, 30 Sep 2020 06:08:27 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8ebe-2185-3192-0f2f-246c.inf6.spectrum.com.
 [2606:a000:1401:8ebe:2185:3192:f2f:246c])
 by smtp.gmail.com with ESMTPSA id v18sm2206783qtq.15.2020.09.30.06.08.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 30 Sep 2020 06:08:26 -0700 (PDT)
Date: Wed, 30 Sep 2020 09:08:21 -0400
From: Tom Rini <trini@konsulko.com>
To: Sean Anderson <seanga2@gmail.com>
Message-ID: <20200930130821.GA7180@bill-the-cat>
References: <20200915144522.509493-1-seanga2@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200915144522.509493-1-seanga2@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Nishanth Menon <nm@ti.com>, Peng Fan <peng.fan@nxp.com>,
 =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Ramon Fried <ramon.fried@gmail.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 Kever Yang <kever.yang@rock-chips.com>, Stefan Agner <stefan@agner.ch>,
 Lukasz Majewski <lukma@denx.de>, Fabien Parent <fparent@baylibre.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Chris Packham <judge.packham@gmail.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, Marek Vasut <marex@denx.de>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Stefan Mavrodiev <stefan@olimex.com>, u-boot@lists.denx.de,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Alexander Graf <agraf@suse.de>,
 Fabien Dessenne <fabien.dessenne@st.com>, Marek Behun <marek.behun@nic.cz>,
 Jaehoon Chung <jh80.chung@samsung.com>, Chen-Yu Tsai <wens@csie.org>,
 Alex Marginean <alexm.osslist@gmail.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Heiko Schocher <hs@denx.de>,
 Siva Durga Prasad Paladugu <siva.durga.paladugu@xilinx.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Mugunthan V N <mugunthanvnm@ti.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Michal Simek <michal.simek@xilinx.com>,
 William Zhang <william.zhang@broadcom.com>,
 Stefan Agner <stefan.agner@toradex.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Andreas =?iso-8859-1?Q?Bie=DFmann?= <andreas.devel@googlemail.com>,
 Matthias Brugger <mbrugger@suse.com>, Scott Wood <scottwood@freescale.com>,
 Ofer Heifetz <oferh@marvell.com>, Igal Liberman <igall@marvell.com>,
 Andreas Dannenberg <dannenberg@ti.com>, Anatolij Gustschin <agust@denx.de>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>, "Andrew F. Davis" <afd@ti.com>,
 Yannick =?iso-8859-1?Q?Fertr=E9?= <yannick.fertre@st.com>,
 Josh Wu <josh.wu@atmel.com>, Faiz Abbas <faiz_abbas@ti.com>,
 Suman Anna <s-anna@ti.com>, Jun Nie <jun.nie@linaro.org>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>
Subject: Re: [Uboot-stm32] [PATCH v2 00/46] dm: Print device name in dev_xxx
	like Linux
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
Content-Type: multipart/mixed; boundary="===============0477975333314616927=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0477975333314616927==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2020 at 10:44:36AM -0400, Sean Anderson wrote:

> This series adds some additional information to dev_xxx output. This requ=
ires
> the first argument to dev_xxx to be a struct udevice. The first argument =
has
> never been used in U-Boot, so many drivers have some invalid calls. To fi=
x these
> drivers, the following strategies were generally followed
>=20
> * If there is a udevice already passed to the function, use it.
> * If there is a udevice contained in a struct passed to the function, use=
 it.
>   When there are multiple possible devices, I have tried to use whatever =
"makes
>   sense" given the content of the message.
> * If there is no udevice passed to the function either directly or indire=
ctly,
>   but all the callers of said function can access a udevice, modify the f=
unction
>   signature to pass in a udevice and use that.
> * If the driver does not use DM, convert the log statements to log_xxx.
> * If the driver uses DM only some of the time, use ifdefs to select an
>   appropriate log function.
>=20
> I have done a little bit of cleanup beyond these strategies, but for the =
most
> part I have tried to *only* to the minimum necessary. Many drivers could =
use a
> follow-up patch to convert their printf()s and debug()s to an appropriate=
 log
> function.
>=20
> I have tried to CC relevant maintainers/reviewers only for patches they
> maintain/review. If I have left someone out, please let me know and I wil=
l add
> them.
>=20
> CI is passing at [1]. This does not necessarily mean that this series is =
free of
> bugs, so I would appreciate testing on hardware. During my refactoring, I
> noticed a few bugs like
>=20
> 	struct udevice *dev;
>=20
> 	if (some_condition)
> 		dev_err(dev, "Something went wrong\n");
>=20
> 	dev =3D some_function();
>=20
> I have fixed such errors when I have encountered them, but they will not =
always
> warn or error on build.
>=20
> Removal of the duplicate definitions in <linux/compat.h> will be done in a
> follow-up patch due to the already-large size of this series.
>=20
> To test this series on sandbox, apply the following options in addition to
> sandbox_defconfig
>=20
> CONFIG_LOGLEVEL=3D8
> CONFIG_LOG=3Dn
> CONFIG_CMD_LOG=3Dn
> CONFIG_CMD_TPM=3Dn
>=20
> Note that there is a soft dependency on [2] if you would like to test thi=
s patch
> with CONFIG_LOG and a higher LOG_LEVEL than LOGL_INFO.
>=20
> [1] https://dev.azure.com/seanga2/u-boot/_build/results?buildId=3D34&view=
=3Dresults
> [2] https://patchwork.ozlabs.org/project/uboot/list/?series=3D201343
>=20
> Changes in v2:
> - Support logging with struct device as well as struct udevice. A lot of
>   drivers, especially USB gadgets, log with devices and not udevices. The=
re
>   is no major reason why they can't use udevice, but big changes like that
>   are outside the scope of this series.
> - Add some comments to __dev_printk and dev_printk_emit
> - Handle struct device as well as struct udevice
> - Match format strings for the NULL path to the regular path. This reduce=
s the
>   amount of duplicated strings.
> - Print the device name before the driver name
> - Many new patches added to fix build bugs
>=20
> Sean Anderson (46):
>   dm: syscon: Fix calling dev_dbg with an uninitialized device
>   firmware: ti_sci: Fix not calling dev_err with a device
>   i2c: mxc: Fix dev_err being called on a nonexistant variable
>   mtd: nand: pxa3xx: Fix not calling dev_xxx with a device
>   mtd: nand: sunxi: Fix not calling dev_err with a device
>   mtd: spi: Include dm.h in spi-nor-core.c
>   mtd: spi: Fix logging in spi-nor-tiny
>   mtd: spi-nand: Fix not calling dev_err with a device
>   mmc: Add mmc_dev()
>   mmc: bcm2835-host: Fix not calling dev_dbg with a device
>   mmc: mtk-sd: Fix not calling dev_err with a device
>   mailbox: k3: Fix not calling dev_err with a device
>   nand: atmel: Fix not calling dev_xxx with a device
>   nand: brcmnand: Fix not calling dev_err() with a device
>   nand: vybrid: Re-introduce vf610_nfc.dev
>   net: bcm6368: Fix not calling dev_info with a device
>   net: mdio: Fix not calling dev_dbg with a device
>   net: mvneta: Fix not always calling dev_err with a device
>   net: mvneta: Convert netdev_xxx to dev_xxx
>   net: mvpp2: Fix not calling dev_xxx with a device
>   net: mvpp2: Convert netdev_xxx to dev_xxx
>   linux/compat.h: Remove netdev_xxx functions
>   net: sunxi: Fix not calling dev_xxx with a device
>   net: sun8i_emac: Fix not calling dev_xxx with a device
>   net: ti: cpsw: Fix not calling dev_dbg with a device
>   phy: marvell: Fix not calling dev_err with a device
>   phy: rockchip: Fix not calling dev_err with a device
>   phy: sun4i-usb: Fix not calling dev_err with a device
>   phy: ti: Fix not calling dev_err with a device
>   phy: usbphyc: Fix not calling dev_err with a device
>   remoteproc: Remove unused function rproc_elf_sanity_check
>   remoteproc: k3-r5: Fix not calling dev_xxx with a device
>   remoteproc: k3: Fix not calling dev_xxx with a device
>   soc: qualcomm: Fix not calling dev_err with a device
>   spi: sunxi: Fix not calling dev_err with a device
>   spi: zynqmp_gqspi: Fix not calling dev_err with a device
>   sysreset: ti: Fix not calling dev_err with a device
>   usb: cdns3: Fix not calling dev_xxx with a device
>   usb: dwc2: Fix not calling dev_xxx with a device
>   usb: dwc3: Fix not calling dev_xxx with a device
>   usb: dwc3: ti: Fix not calling dev_err with a device
>   usb: dwc3: Don't include asm-generic/io.h
>   usb: musb-new: sunxi: Fix not calling dev_err with a device
>   video: stm32: Fix not calling dev_xxx with a device
>   dm: Use symbolic constants for log levels in dev_xxx
>   dm: Print device name in dev_xxx like Linux
>=20
>  drivers/core/syscon-uclass.c              |   2 +-
>  drivers/firmware/ti_sci.c                 |  23 ++--
>  drivers/i2c/mxc_i2c.c                     |   7 +-
>  drivers/mailbox/k3-sec-proxy.c            |   6 +-
>  drivers/mmc/bcm2835_sdhost.c              |  34 +++---
>  drivers/mmc/mtk-sd.c                      |  24 ++--
>  drivers/mtd/nand/raw/atmel_nand.c         |  69 +++++++-----
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c  |  20 +---
>  drivers/mtd/nand/raw/pxa3xx_nand.c        |  30 ++---
>  drivers/mtd/nand/raw/sunxi_nand.c         |  45 ++++----
>  drivers/mtd/nand/raw/vf610_nfc.c          |  38 ++++---
>  drivers/mtd/nand/spi/core.c               |   8 +-
>  drivers/mtd/spi/spi-nor-core.c            |   1 +
>  drivers/mtd/spi/spi-nor-tiny.c            |  21 +++-
>  drivers/net/bcm6368-eth.c                 |   3 +-
>  drivers/net/mvneta.c                      |  56 +++++-----
>  drivers/net/mvpp2.c                       |  87 ++++++++-------
>  drivers/net/sun8i_emac.c                  |   9 +-
>  drivers/net/sunxi_emac.c                  |   5 +-
>  drivers/net/ti/cpsw.c                     |   6 +
>  drivers/phy/allwinner/phy-sun4i-usb.c     |  12 +-
>  drivers/phy/marvell/comphy_core.c         |   6 +-
>  drivers/phy/phy-stm32-usbphyc.c           |   2 +-
>  drivers/phy/phy-ti-am654.c                |   4 +-
>  drivers/phy/rockchip/phy-rockchip-pcie.c  |  14 +--
>  drivers/phy/rockchip/phy-rockchip-typec.c |   6 +-
>  drivers/remoteproc/k3_system_controller.c |   9 +-
>  drivers/remoteproc/rproc-elf-loader.c     |  16 ---
>  drivers/remoteproc/ti_k3_r5f_rproc.c      |  24 ++--
>  drivers/smem/msm_smem.c                   |   2 +-
>  drivers/spi/spi-sunxi.c                   |   6 +-
>  drivers/spi/zynqmp_gqspi.c                |   6 +-
>  drivers/sysreset/sysreset-ti-sci.c        |   3 +-
>  drivers/usb/cdns3/ep0.c                   |   5 +-
>  drivers/usb/cdns3/gadget.c                |   3 +-
>  drivers/usb/dwc3/core.c                   |  15 +--
>  drivers/usb/dwc3/dwc3-generic.c           |   1 -
>  drivers/usb/dwc3/ep0.c                    |   1 +
>  drivers/usb/dwc3/gadget.c                 |  23 ++--
>  drivers/usb/dwc3/ti_usb_phy.c             |   4 +-
>  drivers/usb/host/dwc2.c                   |  39 ++++---
>  drivers/usb/musb-new/sunxi.c              |   9 +-
>  drivers/video/dw_mipi_dsi.c               |  24 ++--
>  include/dm/device_compat.h                | 127 ++++++++++++++++------
>  include/linux/compat.h                    |  19 ----
>  include/mmc.h                             |   2 +
>  include/remoteproc.h                      |  13 ---
>  net/mdio-uclass.c                         |   4 +-
>  48 files changed, 486 insertions(+), 407 deletions(-)

For the series, applied to u-boot/next, thanks!

--=20
Tom

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl90g0UACgkQFHw5/5Y0
tyyJeAv8CYi7IzgjmbbbneKcg+Y0FdbaVZG0OIXIQ41dzpC1bg9PUV/tNB++ur8i
hX7caQjzA9PByD/fXcG/yT1FNfm0H0nJ13Y3cTC+bmNrO1uMG9lCq54kprKGS0Zf
63AQTdoAcqPWsEBXqn6ymWqzxrxXlMshY9TRoDHXuujf292m8hC/eNNFjVcL7Gcy
xYy/0SEuz14TKXCxZD8CgNqbKQC0clkZw1gBk2Y9Wwns8K6/jV2vcGSPGfYMrla/
b96NnHVlUaJbiW9OMfe6VO58bIGoIDTt5lC+EhsOxeko2bsayBAFBknXjWVxaEye
U70szicx69KgISJgBW4EZydkqZLlIQD4qSEhI72KdXyWXZ3Ixhx7exulpJvCdxP2
mOQDFDLm1YF8Bfz6mDmai9Fa5vFcea6Kp8dVaSE5IWlXnOFeAPNOrEEZrBNC7/iu
dqQfSL+7r4FO6pvluftcjtIuSFNGUT5AhqAF/e2MjC0Nn5l6Q00Xgu0w8PU7COWT
ZZMKl5yI
=ad/M
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--

--===============0477975333314616927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0477975333314616927==--
