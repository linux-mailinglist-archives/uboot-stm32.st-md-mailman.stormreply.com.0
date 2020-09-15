Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CDE26A775
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Sep 2020 16:46:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17EFFC3FADE
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Sep 2020 14:46:10 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 084D2C3FAD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Sep 2020 14:45:37 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id 16so4460825qkf.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Sep 2020 07:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+KUjmRBUuvIxZ4IVihF+LIIw1UzZQt4gb9d9OUzxJm8=;
 b=V0sU3kr9jhyj+lgZWqAd6N3iQnrb/xEXcwoPNBnN3wlDE/Gb2NqObn6yJDnA/a+JPy
 lVmi7sZyWxJ/BrxXHCqHI8EwGE8Xz58U1rB5TLmZEv5H/3TEDWB57Xq4OlkJzLtLcH9Y
 qehCK7qD0/tHgVlcJXLh6cpXijwez9dUE1IDqwdRH1OtwZ/ZE1Y+eFgqKedFayYfnD1G
 TqIGJ88xmsOnh4FQIPjOPbrJ3bXIhv5z/L4nCTubJM+eZ28mRvfth2SWYmcpMN9p7+z2
 M6pu7KMnrX+2wExQD0cf5VH9FZK6GxRsB7t5BN1w1/5wZX3e76nYO8nP1fxE12DTkDgC
 Z5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+KUjmRBUuvIxZ4IVihF+LIIw1UzZQt4gb9d9OUzxJm8=;
 b=MKiKEQLuqtPbhf5FLD2oQuAqXWkB4n1MoJ6t6a+CzoVjlt1WYAXn3yihHxvgFX48h0
 dCo+uIghdl5g0Nk5pakTkJfLWicxD5n0+bzb+oQwPKdNbXUIrQmraufQbzNdJurw8EtH
 oLXp9s0JXVyp2wQVYRhzyky8lpUus1UQ3hiq8wqVf+4z5TIDnxgFJfHbhJ/Z+eapwWUl
 YgAKK0Icfd8SEPq0URXqLhNjudtsmZhPe8/EgpeNF26Uo0V/UaemSp+Eg1n4GUTPtY9b
 h96hrYlLKn6pax0oERJspZHN6/H4icuACWJTalPJYQPNLytl2gHFwpDVry+pv1UB8peG
 SNdw==
X-Gm-Message-State: AOAM531M4SdPaD61mLHtKwQ6A5Kqa2fFiQkGbGVgwdVt1N5ukDQD/DUB
 L9ykt45wm6NBnsj7PIXv/QE=
X-Google-Smtp-Source: ABdhPJxwy3GRrbSRtpdRHd2A7ztdDxgzq1i5wZZVGRDC3g8yHJT/83JgrjRvgt3NOTPFyXa+9dMizA==
X-Received: by 2002:ae9:ebd0:: with SMTP id b199mr18171279qkg.39.1600181135731; 
 Tue, 15 Sep 2020 07:45:35 -0700 (PDT)
Received: from godwin.fios-router.home
 (pool-108-51-35-162.washdc.fios.verizon.net. [108.51.35.162])
 by smtp.gmail.com with ESMTPSA id g18sm16371799qko.126.2020.09.15.07.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 07:45:35 -0700 (PDT)
From: Sean Anderson <seanga2@gmail.com>
To: u-boot@lists.denx.de
Date: Tue, 15 Sep 2020 10:44:36 -0400
Message-Id: <20200915144522.509493-1-seanga2@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Sep 2020 14:46:08 +0000
Cc: Nishanth Menon <nm@ti.com>, Peng Fan <peng.fan@nxp.com>,
 =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Patrice Chotard <patrice.chotard@st.com>, Ramon Fried <ramon.fried@gmail.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 Kever Yang <kever.yang@rock-chips.com>, Stefan Agner <stefan@agner.ch>,
 Sean Anderson <seanga2@gmail.com>, Fabien Parent <fparent@baylibre.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Chris Packham <judge.packham@gmail.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Stefan Mavrodiev <stefan@olimex.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
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
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Matthias Brugger <mbrugger@suse.com>, Scott Wood <scottwood@freescale.com>,
 Ofer Heifetz <oferh@marvell.com>, Igal Liberman <igall@marvell.com>,
 Andreas Dannenberg <dannenberg@ti.com>, Anatolij Gustschin <agust@denx.de>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 =?UTF-8?q?Andreas=20Bie=C3=9Fmann?= <andreas.devel@googlemail.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Lukasz Majewski <lukma@denx.de>, "Andrew F. Davis" <afd@ti.com>,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>,
 Josh Wu <josh.wu@atmel.com>, Faiz Abbas <faiz_abbas@ti.com>,
 Suman Anna <s-anna@ti.com>, Jun Nie <jun.nie@linaro.org>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>
Subject: [Uboot-stm32] [PATCH v2 00/46] dm: Print device name in dev_xxx
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

This series adds some additional information to dev_xxx output. This requires
the first argument to dev_xxx to be a struct udevice. The first argument has
never been used in U-Boot, so many drivers have some invalid calls. To fix these
drivers, the following strategies were generally followed

* If there is a udevice already passed to the function, use it.
* If there is a udevice contained in a struct passed to the function, use it.
  When there are multiple possible devices, I have tried to use whatever "makes
  sense" given the content of the message.
* If there is no udevice passed to the function either directly or indirectly,
  but all the callers of said function can access a udevice, modify the function
  signature to pass in a udevice and use that.
* If the driver does not use DM, convert the log statements to log_xxx.
* If the driver uses DM only some of the time, use ifdefs to select an
  appropriate log function.

I have done a little bit of cleanup beyond these strategies, but for the most
part I have tried to *only* to the minimum necessary. Many drivers could use a
follow-up patch to convert their printf()s and debug()s to an appropriate log
function.

I have tried to CC relevant maintainers/reviewers only for patches they
maintain/review. If I have left someone out, please let me know and I will add
them.

CI is passing at [1]. This does not necessarily mean that this series is free of
bugs, so I would appreciate testing on hardware. During my refactoring, I
noticed a few bugs like

	struct udevice *dev;

	if (some_condition)
		dev_err(dev, "Something went wrong\n");

	dev = some_function();

I have fixed such errors when I have encountered them, but they will not always
warn or error on build.

Removal of the duplicate definitions in <linux/compat.h> will be done in a
follow-up patch due to the already-large size of this series.

To test this series on sandbox, apply the following options in addition to
sandbox_defconfig

CONFIG_LOGLEVEL=8
CONFIG_LOG=n
CONFIG_CMD_LOG=n
CONFIG_CMD_TPM=n

Note that there is a soft dependency on [2] if you would like to test this patch
with CONFIG_LOG and a higher LOG_LEVEL than LOGL_INFO.

[1] https://dev.azure.com/seanga2/u-boot/_build/results?buildId=34&view=results
[2] https://patchwork.ozlabs.org/project/uboot/list/?series=201343

Changes in v2:
- Support logging with struct device as well as struct udevice. A lot of
  drivers, especially USB gadgets, log with devices and not udevices. There
  is no major reason why they can't use udevice, but big changes like that
  are outside the scope of this series.
- Add some comments to __dev_printk and dev_printk_emit
- Handle struct device as well as struct udevice
- Match format strings for the NULL path to the regular path. This reduces the
  amount of duplicated strings.
- Print the device name before the driver name
- Many new patches added to fix build bugs

Sean Anderson (46):
  dm: syscon: Fix calling dev_dbg with an uninitialized device
  firmware: ti_sci: Fix not calling dev_err with a device
  i2c: mxc: Fix dev_err being called on a nonexistant variable
  mtd: nand: pxa3xx: Fix not calling dev_xxx with a device
  mtd: nand: sunxi: Fix not calling dev_err with a device
  mtd: spi: Include dm.h in spi-nor-core.c
  mtd: spi: Fix logging in spi-nor-tiny
  mtd: spi-nand: Fix not calling dev_err with a device
  mmc: Add mmc_dev()
  mmc: bcm2835-host: Fix not calling dev_dbg with a device
  mmc: mtk-sd: Fix not calling dev_err with a device
  mailbox: k3: Fix not calling dev_err with a device
  nand: atmel: Fix not calling dev_xxx with a device
  nand: brcmnand: Fix not calling dev_err() with a device
  nand: vybrid: Re-introduce vf610_nfc.dev
  net: bcm6368: Fix not calling dev_info with a device
  net: mdio: Fix not calling dev_dbg with a device
  net: mvneta: Fix not always calling dev_err with a device
  net: mvneta: Convert netdev_xxx to dev_xxx
  net: mvpp2: Fix not calling dev_xxx with a device
  net: mvpp2: Convert netdev_xxx to dev_xxx
  linux/compat.h: Remove netdev_xxx functions
  net: sunxi: Fix not calling dev_xxx with a device
  net: sun8i_emac: Fix not calling dev_xxx with a device
  net: ti: cpsw: Fix not calling dev_dbg with a device
  phy: marvell: Fix not calling dev_err with a device
  phy: rockchip: Fix not calling dev_err with a device
  phy: sun4i-usb: Fix not calling dev_err with a device
  phy: ti: Fix not calling dev_err with a device
  phy: usbphyc: Fix not calling dev_err with a device
  remoteproc: Remove unused function rproc_elf_sanity_check
  remoteproc: k3-r5: Fix not calling dev_xxx with a device
  remoteproc: k3: Fix not calling dev_xxx with a device
  soc: qualcomm: Fix not calling dev_err with a device
  spi: sunxi: Fix not calling dev_err with a device
  spi: zynqmp_gqspi: Fix not calling dev_err with a device
  sysreset: ti: Fix not calling dev_err with a device
  usb: cdns3: Fix not calling dev_xxx with a device
  usb: dwc2: Fix not calling dev_xxx with a device
  usb: dwc3: Fix not calling dev_xxx with a device
  usb: dwc3: ti: Fix not calling dev_err with a device
  usb: dwc3: Don't include asm-generic/io.h
  usb: musb-new: sunxi: Fix not calling dev_err with a device
  video: stm32: Fix not calling dev_xxx with a device
  dm: Use symbolic constants for log levels in dev_xxx
  dm: Print device name in dev_xxx like Linux

 drivers/core/syscon-uclass.c              |   2 +-
 drivers/firmware/ti_sci.c                 |  23 ++--
 drivers/i2c/mxc_i2c.c                     |   7 +-
 drivers/mailbox/k3-sec-proxy.c            |   6 +-
 drivers/mmc/bcm2835_sdhost.c              |  34 +++---
 drivers/mmc/mtk-sd.c                      |  24 ++--
 drivers/mtd/nand/raw/atmel_nand.c         |  69 +++++++-----
 drivers/mtd/nand/raw/brcmnand/brcmnand.c  |  20 +---
 drivers/mtd/nand/raw/pxa3xx_nand.c        |  30 ++---
 drivers/mtd/nand/raw/sunxi_nand.c         |  45 ++++----
 drivers/mtd/nand/raw/vf610_nfc.c          |  38 ++++---
 drivers/mtd/nand/spi/core.c               |   8 +-
 drivers/mtd/spi/spi-nor-core.c            |   1 +
 drivers/mtd/spi/spi-nor-tiny.c            |  21 +++-
 drivers/net/bcm6368-eth.c                 |   3 +-
 drivers/net/mvneta.c                      |  56 +++++-----
 drivers/net/mvpp2.c                       |  87 ++++++++-------
 drivers/net/sun8i_emac.c                  |   9 +-
 drivers/net/sunxi_emac.c                  |   5 +-
 drivers/net/ti/cpsw.c                     |   6 +
 drivers/phy/allwinner/phy-sun4i-usb.c     |  12 +-
 drivers/phy/marvell/comphy_core.c         |   6 +-
 drivers/phy/phy-stm32-usbphyc.c           |   2 +-
 drivers/phy/phy-ti-am654.c                |   4 +-
 drivers/phy/rockchip/phy-rockchip-pcie.c  |  14 +--
 drivers/phy/rockchip/phy-rockchip-typec.c |   6 +-
 drivers/remoteproc/k3_system_controller.c |   9 +-
 drivers/remoteproc/rproc-elf-loader.c     |  16 ---
 drivers/remoteproc/ti_k3_r5f_rproc.c      |  24 ++--
 drivers/smem/msm_smem.c                   |   2 +-
 drivers/spi/spi-sunxi.c                   |   6 +-
 drivers/spi/zynqmp_gqspi.c                |   6 +-
 drivers/sysreset/sysreset-ti-sci.c        |   3 +-
 drivers/usb/cdns3/ep0.c                   |   5 +-
 drivers/usb/cdns3/gadget.c                |   3 +-
 drivers/usb/dwc3/core.c                   |  15 +--
 drivers/usb/dwc3/dwc3-generic.c           |   1 -
 drivers/usb/dwc3/ep0.c                    |   1 +
 drivers/usb/dwc3/gadget.c                 |  23 ++--
 drivers/usb/dwc3/ti_usb_phy.c             |   4 +-
 drivers/usb/host/dwc2.c                   |  39 ++++---
 drivers/usb/musb-new/sunxi.c              |   9 +-
 drivers/video/dw_mipi_dsi.c               |  24 ++--
 include/dm/device_compat.h                | 127 ++++++++++++++++------
 include/linux/compat.h                    |  19 ----
 include/mmc.h                             |   2 +
 include/remoteproc.h                      |  13 ---
 net/mdio-uclass.c                         |   4 +-
 48 files changed, 486 insertions(+), 407 deletions(-)

-- 
2.28.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
