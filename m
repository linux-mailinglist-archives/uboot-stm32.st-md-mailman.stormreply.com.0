Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D110626C359
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Sep 2020 15:44:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45517C3FADF
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Sep 2020 13:44:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F57CC3FADE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Sep 2020 13:44:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08GDgYXc013285; Wed, 16 Sep 2020 15:43:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=f/o5zpBkd7e9AxYVAxs9vDJbTSlRtdPceQX5yy3dlrQ=;
 b=bER5z5HsBqYjy36G/edagsOscl4U+Ji3cWXlZ3Iur6KB6Aa4i8QRpwfuqjTL+H+6EKhA
 useZacBPFOnEbGJAYepOvIINmuSm252a2OBKSwbIqtBg90LI9NBgKj8uxcHiFUEGey5l
 58/qB0gHgrgYAE7TCG3pW4gjnVwTvQFG4X0OCPLX+tYrQz3BvhlryP0s0rJYQenwjZqp
 F6+xIgWxrnXyyJwutwgkO637NpwEy9pJ8bb4tOGOTJ1Zmj+ay4seQVuXBk1RRceUnl9h
 IcRz6Y0Wu3HqkVGEh95oyhDs6mm/VtXf8/E67GohjHF9S58cAr4XFJUwsCJg4wRGGmld Jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33k67bmnbw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 15:43:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7E6D310002A;
 Wed, 16 Sep 2020 15:43:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 12CDC2B0EB5;
 Wed, 16 Sep 2020 15:43:11 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 16 Sep
 2020 15:43:10 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 16 Sep 2020 15:43:10 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Sean Anderson <seanga2@gmail.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 00/46] dm: Print device name in dev_xxx like Linux
Thread-Index: AQHWi27gBN2f5cIhhUic436SYAPgwqlrRU3g
Date: Wed, 16 Sep 2020 13:43:10 +0000
Message-ID: <bf5ff3c9162544d09878bcf1b40b8b12@SFHDAG6NODE3.st.com>
References: <20200915144522.509493-1-seanga2@gmail.com>
In-Reply-To: <20200915144522.509493-1-seanga2@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-16_10:2020-09-16,
 2020-09-16 signatures=0
Cc: Nishanth Menon <nm@ti.com>, Peng Fan <peng.fan@nxp.com>,
 =?utf-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Ramon Fried <ramon.fried@gmail.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 Kever Yang <kever.yang@rock-chips.com>, Stefan Agner <stefan@agner.ch>,
 Lukasz Majewski <lukma@denx.de>, Fabien Parent <fparent@baylibre.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Stefan
 Roese <sr@denx.de>, Chris Packham <judge.packham@gmail.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Stefan Mavrodiev <stefan@olimex.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Alexander Graf <agraf@suse.de>,
 Fabien DESSENNE <fabien.dessenne@st.com>, Marek Behun <marek.behun@nic.cz>,
 Jaehoon Chung <jh80.chung@samsung.com>, Chen-Yu Tsai <wens@csie.org>,
 Alex Marginean <alexm.osslist@gmail.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Heiko Schocher <hs@denx.de>,
 Siva Durga Prasad Paladugu <siva.durga.paladugu@xilinx.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Mugunthan V N <mugunthanvnm@ti.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Michal Simek <michal.simek@xilinx.com>,
 William Zhang <william.zhang@broadcom.com>,
 Stefan Agner <stefan.agner@toradex.com>, Frank
 Wang <frank.wang@rock-chips.com>, Andre Przywara <andre.przywara@arm.com>,
 Boris
 Brezillon <boris.brezillon@bootlin.com>, Matthias Brugger <mbrugger@suse.com>,
 Scott Wood <scottwood@freescale.com>, Ofer Heifetz <oferh@marvell.com>, Igal
 Liberman <igall@marvell.com>, Andreas
 Dannenberg <dannenberg@ti.com>, Anatolij Gustschin <agust@denx.de>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 =?utf-8?B?QW5kcmVhcyBCaWXDn21hbm4=?= <andreas.devel@googlemail.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon
 Glass <sjg@chromium.org>, Patrice CHOTARD <patrice.chotard@st.com>,
 "Andrew F. Davis" <afd@ti.com>, Yannick FERTRE <yannick.fertre@st.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Sean,

> From: Sean Anderson <seanga2@gmail.com>
> Sent: mardi 15 septembre 2020 16:45
> 
> This series adds some additional information to dev_xxx output. This requires the
> first argument to dev_xxx to be a struct udevice. The first argument has never
> been used in U-Boot, so many drivers have some invalid calls. To fix these drivers,
> the following strategies were generally followed
> 
> * If there is a udevice already passed to the function, use it.
> * If there is a udevice contained in a struct passed to the function, use it.
>   When there are multiple possible devices, I have tried to use whatever "makes
>   sense" given the content of the message.
> * If there is no udevice passed to the function either directly or indirectly,
>   but all the callers of said function can access a udevice, modify the function
>   signature to pass in a udevice and use that.
> * If the driver does not use DM, convert the log statements to log_xxx.
> * If the driver uses DM only some of the time, use ifdefs to select an
>   appropriate log function.
> 
> I have done a little bit of cleanup beyond these strategies, but for the most part I
> have tried to *only* to the minimum necessary. Many drivers could use a follow-up
> patch to convert their printf()s and debug()s to an appropriate log function.
> 
> I have tried to CC relevant maintainers/reviewers only for patches they
> maintain/review. If I have left someone out, please let me know and I will add them.
> 
> CI is passing at [1]. This does not necessarily mean that this series is free of bugs,
> so I would appreciate testing on hardware. During my refactoring, I noticed a few
> bugs like
> 
> 	struct udevice *dev;
> 
> 	if (some_condition)
> 		dev_err(dev, "Something went wrong\n");
> 
> 	dev = some_function();
> 
> I have fixed such errors when I have encountered them, but they will not always
> warn or error on build.
> 
> Removal of the duplicate definitions in <linux/compat.h> will be done in a follow-
> up patch due to the already-large size of this series.
> 
> To test this series on sandbox, apply the following options in addition to
> sandbox_defconfig
> 
> CONFIG_LOGLEVEL=8
> CONFIG_LOG=n
> CONFIG_CMD_LOG=n
> CONFIG_CMD_TPM=n
> 
> Note that there is a soft dependency on [2] if you would like to test this patch with
> CONFIG_LOG and a higher LOG_LEVEL than LOGL_INFO.
> 
> [1] https://dev.azure.com/seanga2/u-boot/_build/results?buildId=34&view=results
> [2] https://patchwork.ozlabs.org/project/uboot/list/?series=201343
> 
> Changes in v2:
> - Support logging with struct device as well as struct udevice. A lot of
>   drivers, especially USB gadgets, log with devices and not udevices. There
>   is no major reason why they can't use udevice, but big changes like that
>   are outside the scope of this series.
> - Add some comments to __dev_printk and dev_printk_emit
> - Handle struct device as well as struct udevice
> - Match format strings for the NULL path to the regular path. This reduces the
>   amount of duplicated strings.
> - Print the device name before the driver name
> - Many new patches added to fix build bugs
> 
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
> 
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
> 
> --
> 2.28.0


For the serie, tested on STM32MP157C-DK2

This target se the modified files:
drivers/core/syscon-uclass.c
drivers/phy/phy-stm32-usbphyc.c
drivers/usb/host/dwc2.c
drivers/video/dw_mipi_dsi.c

I execute compilation and boot with
CONFIG_LOGLEVEL=8
CONFIG_LOG_MAX_LEVEL=8

For stm32mp15_basic_defconfig 

Tested-by: Patrick Delaunay <patrick.delaunay@st.com>

Thanks, I can now enable CONFIG_LOG now for stm32mp15x targets.
even if stm32 drivers still need update for full "log" migration.

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
