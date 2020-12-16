Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4FB2DC52C
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Dec 2020 18:18:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DDDAC36B36;
	Wed, 16 Dec 2020 17:18:39 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68B7DC36B35
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Dec 2020 15:25:40 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id u12so22826500ilv.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Dec 2020 07:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NzlpbL0i+xETyhTYDexrR1IIcG/tnDvlKXtI6djLX3A=;
 b=QPMRzf0+qhvIBhcnss0PhKdneIBNA9I+knJ9p/ft6M0h2LNKqY4gccy0qV0l9XCDcy
 c751NtQ3KyaxJkZs6reUycuvN8+nh0GSpiEqLMPVLDkaBeeUEieOxfYlheEjh88NnADs
 4sXsmKOQuDyam5yMawNHqd8iltriItVrOZpQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NzlpbL0i+xETyhTYDexrR1IIcG/tnDvlKXtI6djLX3A=;
 b=dV0C2xsjJ0UX6yrZYM7mR9nojrWVWrBTKMT2tJGWtruxzPyN8xr6XNTl/l46T2I8GJ
 nV253NR6O6uZKbo/b0IsTwDmG8Uyih5N7vNWDV3+YxssfET9ipt6UVPTkFzAth+XXcaf
 I7eiuHdwoPbGEbIaexztcAPas7Hd0ImRAFost4NSfIZp6foPyQ6zEdSucPONI/SG4Qc3
 Rq+JOLvrCb7W1JsiIjSp+tfR5jFnhUajK9ec1NmH1C9u79lz9f8y3zoUA7pApC0RU7QL
 ANTqVj8LEECI91wv4mkSevNxOFeiFPFgmSNy7EK40qleN6S4oIgT7BbaD7TCSIXqOVrP
 tr6Q==
X-Gm-Message-State: AOAM533JCZKYcENFZ5i1TGwwulA5IYDyJUpB+bVOY/Q2SUf6u68Zyszq
 GVZTUIgrmNeIDUlcg9+LfdcHUA==
X-Google-Smtp-Source: ABdhPJwYM0haRHAhAGy15qAh01fFC5oIldzlqSfxqYC6R5sCU3McmTZdrT4Vy/xueGLrwxsl1oYuow==
X-Received: by 2002:a92:9a42:: with SMTP id t63mr46680126ili.176.1608132338722; 
 Wed, 16 Dec 2020 07:25:38 -0800 (PST)
Received: from localhost.localdomain (c-67-190-101-114.hsd1.co.comcast.net.
 [67.190.101.114])
 by smtp.gmail.com with ESMTPSA id l6sm1479077ili.78.2020.12.16.07.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 07:25:37 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Wed, 16 Dec 2020 08:25:04 -0700
Message-Id: <20201216082429.16.I5196895f8bbae1068965f8e3b6db19b2bb56e908@changeid>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
In-Reply-To: <20201216152506.119900-1-sjg@chromium.org>
References: <20201216152506.119900-1-sjg@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 16 Dec 2020 17:18:36 +0000
Cc: Peng Fan <peng.fan@nxp.com>, Liviu Dudau <liviu.dudau@foss.arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Pavel Herrmann <morpheus.ibis@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Chaitanya Sakinam <chaitanya.sakinam@nxp.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Marek Vasut <marex@denx.de>, Tien Fong Chee <tien.fong.chee@intel.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Lukasz Majewski <lukma@denx.de>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Suneel Garapati <sgarapati@marvell.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Martin Fuzzey <martin.fuzzey@flowbird.group>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Heiko Schocher <hs@denx.de>,
 Stefan Roese <sr@denx.de>, Icenowy Zheng <icenowy@aosc.io>,
 Ye Li <ye.li@nxp.com>, "Park, Aiden" <aiden.park@intel.com>,
 u-boot-amlogic@groups.io, Madalin Bucur <madalin.bucur@oss.nxp.com>,
 Anji J <anji.jagarlmudi@nxp.com>, Rick Chen <rick@andestech.com>,
 Alexander Graf <agraf@csgraf.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Thor Thayer <thor.thayer@linux.intel.com>,
 Angelo Durgehello <angelo.dureghello@timesys.com>,
 Walter Lozano <walter.lozano@collabora.com>,
 Robert Beckett <bob.beckett@collabora.com>, Michal Simek <monstr@monstr.eu>,
 Anatolij Gustschin <agust@denx.de>, Priyanka Jain <priyanka.jain@nxp.com>,
 Simon Glass <sjg@chromium.org>,
 =?UTF-8?q?Patrik=20Dahlstr=C3=B6m?= <risca@dalakolonin.se>,
 Patrice Chotard <patrice.chotard@st.com>, Pratyush Yadav <p.yadav@ti.com>,
 Michael Walle <michael@walle.cc>,
 Wolfgang Wallner <wolfgang.wallner@br-automation.com>,
 Mario Six <mario.six@gdsys.cc>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Pragnesh Patel <Pragnesh.patel@sifive.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Subject: [Uboot-stm32] [PATCH 16/18] dm: Use access methods for dev/uclass
	private data
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

Most drivers use these access methods but a few do not. Update them.

In some cases the access is not permitted, so mark those with a FIXME tag
for the maintainer to check.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 arch/arm/cpu/armv7/ls102xa/fdt.c          |  4 ++
 arch/arm/mach-stm32mp/pwr_regulator.c     |  3 +-
 arch/x86/cpu/apollolake/uart.c            |  3 +-
 arch/x86/cpu/slimbootloader/serial.c      |  2 +-
 drivers/clk/clk.c                         |  2 +-
 drivers/clk/clk_fixed_rate.c              |  4 +-
 drivers/clk/rockchip/clk_px30.c           |  3 +-
 drivers/clk/rockchip/clk_rk3036.c         |  3 +-
 drivers/clk/rockchip/clk_rk3128.c         |  3 +-
 drivers/clk/rockchip/clk_rk3188.c         |  2 +-
 drivers/clk/rockchip/clk_rk322x.c         |  3 +-
 drivers/clk/rockchip/clk_rk3288.c         |  2 +-
 drivers/clk/rockchip/clk_rk3308.c         |  3 +-
 drivers/clk/rockchip/clk_rk3328.c         |  3 +-
 drivers/clk/rockchip/clk_rk3368.c         |  3 +-
 drivers/clk/rockchip/clk_rk3399.c         |  3 +-
 drivers/clk/rockchip/clk_rv1108.c         |  3 +-
 drivers/core/device-remove.c              | 16 ++++----
 drivers/ddr/altera/sdram_agilex.c         |  2 +-
 drivers/ddr/altera/sdram_gen5.c           |  4 +-
 drivers/ddr/altera/sdram_s10.c            |  2 +-
 drivers/ddr/altera/sdram_soc64.c          |  2 +-
 drivers/gpio/dwapb_gpio.c                 |  2 +-
 drivers/gpio/gpio-uclass.c                |  2 +-
 drivers/gpio/hi6220_gpio.c                |  2 +-
 drivers/gpio/imx_rgpio2p.c                |  5 ++-
 drivers/gpio/lpc32xx_gpio.c               |  2 +-
 drivers/gpio/mt7621_gpio.c                |  2 +-
 drivers/gpio/mxs_gpio.c                   |  2 +-
 drivers/gpio/omap_gpio.c                  |  3 +-
 drivers/gpio/s5p_gpio.c                   |  6 +--
 drivers/gpio/sandbox.c                    |  6 ++-
 drivers/gpio/sunxi_gpio.c                 |  2 +-
 drivers/gpio/tegra186_gpio.c              |  6 +--
 drivers/gpio/tegra_gpio.c                 |  6 +--
 drivers/i2c/i2c-uclass.c                  |  4 +-
 drivers/misc/altera_sysid.c               |  2 +-
 drivers/misc/cros_ec_sandbox.c            |  4 +-
 drivers/misc/fs_loader.c                  |  6 +--
 drivers/misc/vexpress_config.c            |  2 +-
 drivers/mmc/arm_pl180_mmci.c              |  6 +--
 drivers/mmc/mxsmmc.c                      |  2 +-
 drivers/mmc/octeontx_hsmmc.c              | 17 ++++++---
 drivers/mux/mmio.c                        |  3 +-
 drivers/net/eth-phy-uclass.c              |  4 +-
 drivers/net/fm/eth.c                      | 22 +++++++++--
 drivers/net/fsl_mcdmafec.c                | 10 ++---
 drivers/net/mcffec.c                      | 12 +++---
 drivers/net/mcfmii.c                      |  8 ++++
 drivers/net/pfe_eth/pfe_eth.c             |  2 +-
 drivers/net/sunxi_emac.c                  |  2 +-
 drivers/net/tsec.c                        | 46 +++++++++++++++++------
 drivers/net/xilinx_emaclite.c             |  2 +-
 drivers/pci/pci-emul-uclass.c             |  4 +-
 drivers/pci/pci-uclass.c                  |  8 ++--
 drivers/pinctrl/pinctrl-qe-io.c           |  4 +-
 drivers/pinctrl/pinctrl-single.c          |  6 +--
 drivers/power/regulator/da9063.c          | 24 ++++++------
 drivers/power/regulator/pbias_regulator.c |  3 +-
 drivers/remoteproc/rproc-uclass.c         |  4 +-
 drivers/reset/reset-mediatek.c            |  3 +-
 drivers/reset/reset-rockchip.c            |  3 +-
 drivers/reset/reset-sifive.c              |  3 +-
 drivers/reset/reset-sunxi.c               |  3 +-
 drivers/serial/altera_jtag_uart.c         |  8 ++--
 drivers/serial/altera_uart.c              |  8 ++--
 drivers/serial/atmel_usart.c              |  2 +-
 drivers/serial/ns16550.c                  |  4 +-
 drivers/serial/sandbox.c                  |  6 +--
 drivers/serial/serial_arc.c               |  8 ++--
 drivers/serial/serial_linflexuart.c       |  2 +-
 drivers/serial/serial_lpuart.c            | 10 ++---
 drivers/serial/serial_mcf.c               | 10 ++---
 drivers/serial/serial_meson.c             | 12 +++---
 drivers/serial/serial_mxc.c               | 12 +++---
 drivers/serial/serial_omap.c              |  2 +-
 drivers/serial/serial_pxa.c               | 10 ++---
 drivers/serial/serial_rockchip.c          |  3 +-
 drivers/serial/serial_s5p.c               | 12 +++---
 drivers/spi/cadence_qspi.c                | 12 +++---
 drivers/spi/cf_spi.c                      |  2 +-
 drivers/spi/davinci_spi.c                 |  4 +-
 drivers/spi/designware_spi.c              |  4 +-
 drivers/spi/exynos_spi.c                  |  4 +-
 drivers/spi/fsl_dspi.c                    |  4 +-
 drivers/spi/fsl_espi.c                    |  2 +-
 drivers/spi/fsl_qspi.c                    |  2 +-
 drivers/spi/mxs_spi.c                     |  2 +-
 drivers/spi/pl022_spi.c                   |  2 +-
 drivers/spi/rk_spi.c                      |  6 +--
 drivers/spi/soft_spi.c                    |  4 +-
 drivers/spi/tegra114_spi.c                |  4 +-
 drivers/spi/tegra20_sflash.c              |  4 +-
 drivers/spi/tegra20_slink.c               |  4 +-
 drivers/spi/tegra210_qspi.c               |  4 +-
 drivers/spi/uniphier_spi.c                |  8 ++--
 drivers/spi/zynq_qspi.c                   |  4 +-
 drivers/spi/zynq_spi.c                    |  8 ++--
 drivers/spi/zynqmp_gqspi.c                |  6 +--
 drivers/timer/ag101p_timer.c              |  4 +-
 drivers/timer/altera_timer.c              |  4 +-
 drivers/timer/andes_plmt_timer.c          |  7 ++--
 drivers/timer/mpc83xx_timer.c             |  2 +-
 drivers/timer/sifive_clint_timer.c        |  7 ++--
 drivers/timer/timer-uclass.c              |  2 +-
 drivers/usb/gadget/ether.c                | 16 ++++++--
 drivers/usb/host/usb-uclass.c             |  6 +--
 drivers/video/video-uclass.c              |  2 +-
 lib/efi_loader/efi_device_path.c          |  2 +-
 net/eth-uclass.c                          | 22 +++++------
 test/dm/core.c                            | 24 ++++++------
 test/dm/test-driver.c                     |  7 ++--
 test/dm/test-fdt.c                        |  4 +-
 test/dm/test-uclass.c                     |  4 +-
 114 files changed, 372 insertions(+), 280 deletions(-)

diff --git a/arch/arm/cpu/armv7/ls102xa/fdt.c b/arch/arm/cpu/armv7/ls102xa/fdt.c
index d8cb78ecc67..2556980cde6 100644
--- a/arch/arm/cpu/armv7/ls102xa/fdt.c
+++ b/arch/arm/cpu/armv7/ls102xa/fdt.c
@@ -52,7 +52,11 @@ void ft_fixup_enet_phy_connect_type(void *fdt)
 			continue;
 		}
 
+#ifdef CONFIG_DM_ETH
+		priv = dev_get_priv(dev);
+#else
 		priv = dev->priv;
+#endif
 		if (priv->flags & TSEC_SGMII)
 			continue;
 
diff --git a/arch/arm/mach-stm32mp/pwr_regulator.c b/arch/arm/mach-stm32mp/pwr_regulator.c
index 74a5df59487..af6ea439646 100644
--- a/arch/arm/mach-stm32mp/pwr_regulator.c
+++ b/arch/arm/mach-stm32mp/pwr_regulator.c
@@ -9,6 +9,7 @@
 #include <syscon.h>
 #include <asm/io.h>
 #include <dm/device_compat.h>
+#include <dm/device-internal.h>
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <power/pmic.h>
@@ -165,7 +166,7 @@ static int stm32mp_pwr_regulator_probe(struct udevice *dev)
 	}
 
 	uc_pdata->type = REGULATOR_TYPE_FIXED;
-	dev->priv = (void *)*p;
+	dev_set_priv(dev, (void *)*p);
 
 	return 0;
 }
diff --git a/arch/x86/cpu/apollolake/uart.c b/arch/x86/cpu/apollolake/uart.c
index 8e6dfdb6309..e523d85b1b4 100644
--- a/arch/x86/cpu/apollolake/uart.c
+++ b/arch/x86/cpu/apollolake/uart.c
@@ -16,6 +16,7 @@
 #include <asm/io.h>
 #include <asm/pci.h>
 #include <asm/lpss.h>
+#include <dm/device-internal.h>
 
 /* Low-power Subsystem (LPSS) clock register */
 enum {
@@ -105,7 +106,7 @@ static int apl_ns16550_of_to_plat(struct udevice *dev)
 	plat->clock = dtplat->clock_frequency;
 	plat->fcr = UART_FCR_DEFVAL;
 	plat->bdf = pci_ofplat_get_devfn(dtplat->reg[0]);
-	dev->plat = plat;
+	dev_set_plat(dev, plat);
 #else
 	int ret;
 
diff --git a/arch/x86/cpu/slimbootloader/serial.c b/arch/x86/cpu/slimbootloader/serial.c
index ebbd2c552ff..772a94c31cb 100644
--- a/arch/x86/cpu/slimbootloader/serial.c
+++ b/arch/x86/cpu/slimbootloader/serial.c
@@ -18,7 +18,7 @@ static int slimbootloader_serial_of_to_plat(struct udevice *dev)
 {
 	const efi_guid_t guid = SBL_SERIAL_PORT_INFO_GUID;
 	struct sbl_serial_port_info *data;
-	struct ns16550_plat *plat = dev->plat;
+	struct ns16550_plat *plat = dev_get_plat(dev);
 
 	if (!gd->arch.hob_list)
 		panic("hob list not found!");
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 928ad13641a..c7feb421c2b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -45,7 +45,7 @@ int clk_register(struct clk *clk, const char *drv_name,
 
 	clk->enable_count = 0;
 	/* Store back pointer to clk from udevice */
-	clk->dev->uclass_priv = clk;
+	dev_set_uclass_priv(clk->dev, clk);
 
 	return 0;
 }
diff --git a/drivers/clk/clk_fixed_rate.c b/drivers/clk/clk_fixed_rate.c
index 12d81a7ff7a..3c5a83c523c 100644
--- a/drivers/clk/clk_fixed_rate.c
+++ b/drivers/clk/clk_fixed_rate.c
@@ -6,6 +6,7 @@
 #include <common.h>
 #include <clk-uclass.h>
 #include <dm.h>
+#include <dm/device-internal.h>
 #include <linux/clk-provider.h>
 
 static ulong clk_fixed_rate_get_rate(struct clk *clk)
@@ -32,7 +33,8 @@ static int clk_fixed_rate_of_to_plat(struct udevice *dev)
 		dev_read_u32_default(dev, "clock-frequency", 0);
 #endif
 	/* Make fixed rate clock accessible from higher level struct clk */
-	dev->uclass_priv = clk;
+	/* FIXME: This is not allowed */
+	dev_set_uclass_priv(dev, clk);
 	clk->dev = dev;
 	clk->enable_count = 0;
 
diff --git a/drivers/clk/rockchip/clk_px30.c b/drivers/clk/rockchip/clk_px30.c
index 355362dd678..a2a5939d4b1 100644
--- a/drivers/clk/rockchip/clk_px30.c
+++ b/drivers/clk/rockchip/clk_px30.c
@@ -15,6 +15,7 @@
 #include <asm/arch-rockchip/cru_px30.h>
 #include <asm/arch-rockchip/hardware.h>
 #include <asm/io.h>
+#include <dm/device-internal.h>
 #include <dm/lists.h>
 #include <dt-bindings/clock/px30-cru.h>
 #include <linux/bitops.h>
@@ -1458,7 +1459,7 @@ static int px30_clk_bind(struct udevice *dev)
 						    glb_srst_fst);
 		priv->glb_srst_snd_value = offsetof(struct px30_cru,
 						    glb_srst_snd);
-		sys_child->priv = priv;
+		dev_set_priv(sys_child, priv);
 	}
 
 #if CONFIG_IS_ENABLED(RESET_ROCKCHIP)
diff --git a/drivers/clk/rockchip/clk_rk3036.c b/drivers/clk/rockchip/clk_rk3036.c
index 07ef6133f29..026858459e3 100644
--- a/drivers/clk/rockchip/clk_rk3036.c
+++ b/drivers/clk/rockchip/clk_rk3036.c
@@ -14,6 +14,7 @@
 #include <asm/arch-rockchip/clock.h>
 #include <asm/arch-rockchip/cru_rk3036.h>
 #include <asm/arch-rockchip/hardware.h>
+#include <dm/device-internal.h>
 #include <dm/lists.h>
 #include <dt-bindings/clock/rk3036-cru.h>
 #include <linux/delay.h>
@@ -353,7 +354,7 @@ static int rk3036_clk_bind(struct udevice *dev)
 						    cru_glb_srst_fst_value);
 		priv->glb_srst_snd_value = offsetof(struct rk3036_cru,
 						    cru_glb_srst_snd_value);
-		sys_child->priv = priv;
+		dev_set_priv(sys_child, priv);
 	}
 
 #if CONFIG_IS_ENABLED(RESET_ROCKCHIP)
diff --git a/drivers/clk/rockchip/clk_rk3128.c b/drivers/clk/rockchip/clk_rk3128.c
index 9349e14830e..d5b2b63dd79 100644
--- a/drivers/clk/rockchip/clk_rk3128.c
+++ b/drivers/clk/rockchip/clk_rk3128.c
@@ -15,6 +15,7 @@
 #include <asm/arch-rockchip/cru_rk3128.h>
 #include <asm/arch-rockchip/hardware.h>
 #include <bitfield.h>
+#include <dm/device-internal.h>
 #include <dm/lists.h>
 #include <dt-bindings/clock/rk3128-cru.h>
 #include <linux/delay.h>
@@ -581,7 +582,7 @@ static int rk3128_clk_bind(struct udevice *dev)
 						    cru_glb_srst_fst_value);
 		priv->glb_srst_snd_value = offsetof(struct rk3128_cru,
 						    cru_glb_srst_snd_value);
-		sys_child->priv = priv;
+		dev_set_priv(sys_child, priv);
 	}
 
 	return 0;
diff --git a/drivers/clk/rockchip/clk_rk3188.c b/drivers/clk/rockchip/clk_rk3188.c
index 48bfe09b11f..1b62d8d2898 100644
--- a/drivers/clk/rockchip/clk_rk3188.c
+++ b/drivers/clk/rockchip/clk_rk3188.c
@@ -593,7 +593,7 @@ static int rk3188_clk_bind(struct udevice *dev)
 						    cru_glb_srst_fst_value);
 		priv->glb_srst_snd_value = offsetof(struct rk3188_cru,
 						    cru_glb_srst_snd_value);
-		sys_child->priv = priv;
+		dev_set_priv(sys_child, priv);
 	}
 
 #if CONFIG_IS_ENABLED(RESET_ROCKCHIP)
diff --git a/drivers/clk/rockchip/clk_rk322x.c b/drivers/clk/rockchip/clk_rk322x.c
index c2f5fc0fd75..dbef606d887 100644
--- a/drivers/clk/rockchip/clk_rk322x.c
+++ b/drivers/clk/rockchip/clk_rk322x.c
@@ -14,6 +14,7 @@
 #include <asm/arch-rockchip/clock.h>
 #include <asm/arch-rockchip/cru_rk322x.h>
 #include <asm/arch-rockchip/hardware.h>
+#include <dm/device-internal.h>
 #include <dm/lists.h>
 #include <dt-bindings/clock/rk3228-cru.h>
 #include <linux/bitops.h>
@@ -510,7 +511,7 @@ static int rk322x_clk_bind(struct udevice *dev)
 						    cru_glb_srst_fst_value);
 		priv->glb_srst_snd_value = offsetof(struct rk322x_cru,
 						    cru_glb_srst_snd_value);
-		sys_child->priv = priv;
+		dev_set_priv(sys_child, priv);
 	}
 
 #if CONFIG_IS_ENABLED(RESET_ROCKCHIP)
diff --git a/drivers/clk/rockchip/clk_rk3288.c b/drivers/clk/rockchip/clk_rk3288.c
index e87fdfc54dd..6226d55658e 100644
--- a/drivers/clk/rockchip/clk_rk3288.c
+++ b/drivers/clk/rockchip/clk_rk3288.c
@@ -1018,7 +1018,7 @@ static int rk3288_clk_bind(struct udevice *dev)
 						    cru_glb_srst_fst_value);
 		priv->glb_srst_snd_value = offsetof(struct rockchip_cru,
 						    cru_glb_srst_snd_value);
-		sys_child->priv = priv;
+		dev_set_priv(sys_child, priv);
 	}
 
 #if CONFIG_IS_ENABLED(RESET_ROCKCHIP)
diff --git a/drivers/clk/rockchip/clk_rk3308.c b/drivers/clk/rockchip/clk_rk3308.c
index 30589512ecc..a05efcfbaba 100644
--- a/drivers/clk/rockchip/clk_rk3308.c
+++ b/drivers/clk/rockchip/clk_rk3308.c
@@ -15,6 +15,7 @@
 #include <asm/arch/cru_rk3308.h>
 #include <asm/arch-rockchip/clock.h>
 #include <asm/arch-rockchip/hardware.h>
+#include <dm/device-internal.h>
 #include <dm/lists.h>
 #include <dt-bindings/clock/rk3308-cru.h>
 #include <linux/bitops.h>
@@ -1045,7 +1046,7 @@ static int rk3308_clk_bind(struct udevice *dev)
 						    glb_srst_fst);
 		priv->glb_srst_snd_value = offsetof(struct rk3308_cru,
 						    glb_srst_snd);
-		sys_child->priv = priv;
+		dev_set_priv(sys_child, priv);
 	}
 
 #if CONFIG_IS_ENABLED(RESET_ROCKCHIP)
diff --git a/drivers/clk/rockchip/clk_rk3328.c b/drivers/clk/rockchip/clk_rk3328.c
index e2df71290f4..b825ff4cf83 100644
--- a/drivers/clk/rockchip/clk_rk3328.c
+++ b/drivers/clk/rockchip/clk_rk3328.c
@@ -16,6 +16,7 @@
 #include <asm/arch-rockchip/hardware.h>
 #include <asm/arch-rockchip/grf_rk3328.h>
 #include <asm/io.h>
+#include <dm/device-internal.h>
 #include <dm/lists.h>
 #include <dt-bindings/clock/rk3328-cru.h>
 #include <linux/bitops.h>
@@ -823,7 +824,7 @@ static int rk3328_clk_bind(struct udevice *dev)
 						    glb_srst_fst_value);
 		priv->glb_srst_snd_value = offsetof(struct rk3328_cru,
 						    glb_srst_snd_value);
-		sys_child->priv = priv;
+		dev_set_priv(sys_child, priv);
 	}
 
 #if CONFIG_IS_ENABLED(RESET_ROCKCHIP)
diff --git a/drivers/clk/rockchip/clk_rk3368.c b/drivers/clk/rockchip/clk_rk3368.c
index 9267cac6bcd..780b49ccd89 100644
--- a/drivers/clk/rockchip/clk_rk3368.c
+++ b/drivers/clk/rockchip/clk_rk3368.c
@@ -19,6 +19,7 @@
 #include <asm/arch-rockchip/cru_rk3368.h>
 #include <asm/arch-rockchip/hardware.h>
 #include <asm/io.h>
+#include <dm/device-internal.h>
 #include <dm/lists.h>
 #include <dt-bindings/clock/rk3368-cru.h>
 #include <linux/delay.h>
@@ -621,7 +622,7 @@ static int rk3368_clk_bind(struct udevice *dev)
 						    glb_srst_fst_val);
 		priv->glb_srst_snd_value = offsetof(struct rk3368_cru,
 						    glb_srst_snd_val);
-		sys_child->priv = priv;
+		dev_set_priv(sys_child, priv);
 	}
 
 #if CONFIG_IS_ENABLED(RESET_ROCKCHIP)
diff --git a/drivers/clk/rockchip/clk_rk3399.c b/drivers/clk/rockchip/clk_rk3399.c
index 68d5dbb581c..55ebac7057d 100644
--- a/drivers/clk/rockchip/clk_rk3399.c
+++ b/drivers/clk/rockchip/clk_rk3399.c
@@ -18,6 +18,7 @@
 #include <asm/arch-rockchip/clock.h>
 #include <asm/arch-rockchip/cru.h>
 #include <asm/arch-rockchip/hardware.h>
+#include <dm/device-internal.h>
 #include <dm/lists.h>
 #include <dt-bindings/clock/rk3399-cru.h>
 #include <linux/bitops.h>
@@ -1425,7 +1426,7 @@ static int rk3399_clk_bind(struct udevice *dev)
 						    glb_srst_fst_value);
 		priv->glb_srst_snd_value = offsetof(struct rockchip_cru,
 						    glb_srst_snd_value);
-		sys_child->priv = priv;
+		dev_set_priv(sys_child, priv);
 	}
 
 #if CONFIG_IS_ENABLED(RESET_ROCKCHIP)
diff --git a/drivers/clk/rockchip/clk_rv1108.c b/drivers/clk/rockchip/clk_rv1108.c
index 62bcf5a2ab3..1e22db0cb71 100644
--- a/drivers/clk/rockchip/clk_rv1108.c
+++ b/drivers/clk/rockchip/clk_rv1108.c
@@ -16,6 +16,7 @@
 #include <asm/arch-rockchip/clock.h>
 #include <asm/arch-rockchip/cru_rv1108.h>
 #include <asm/arch-rockchip/hardware.h>
+#include <dm/device-internal.h>
 #include <dm/lists.h>
 #include <dt-bindings/clock/rv1108-cru.h>
 #include <linux/delay.h>
@@ -697,7 +698,7 @@ static int rv1108_clk_bind(struct udevice *dev)
 						    glb_srst_fst_val);
 		priv->glb_srst_snd_value = offsetof(struct rv1108_cru,
 						    glb_srst_snd_val);
-		sys_child->priv = priv;
+		dev_set_priv(sys_child, priv);
 	}
 
 #if CONFIG_IS_ENABLED(RESET_ROCKCHIP)
diff --git a/drivers/core/device-remove.c b/drivers/core/device-remove.c
index 289220b98e8..8c121697711 100644
--- a/drivers/core/device-remove.c
+++ b/drivers/core/device-remove.c
@@ -89,15 +89,15 @@ int device_unbind(struct udevice *dev)
 		return log_msg_ret("child unbind", ret);
 
 	if (dev->flags & DM_FLAG_ALLOC_PDATA) {
-		free(dev->plat);
-		dev->plat = NULL;
+		free(dev_get_plat(dev));
+		dev_set_plat(dev, NULL);
 	}
 	if (dev->flags & DM_FLAG_ALLOC_UCLASS_PDATA) {
-		free(dev->uclass_plat);
+		free(dev_get_uclass_plat(dev));
 		dev->uclass_plat = NULL;
 	}
 	if (dev->flags & DM_FLAG_ALLOC_PARENT_PDATA) {
-		free(dev->parent_plat);
+		free(dev_get_parent_plat(dev));
 		dev->parent_plat = NULL;
 	}
 	ret = uclass_unbind_device(dev);
@@ -125,12 +125,12 @@ void device_free(struct udevice *dev)
 	int size;
 
 	if (dev->driver->priv_auto) {
-		free(dev->priv);
-		dev->priv = NULL;
+		free(dev_get_priv(dev));
+		dev_set_priv(dev, NULL);
 	}
 	size = dev->uclass->uc_drv->per_device_auto;
 	if (size) {
-		free(dev->uclass_priv);
+		free(dev_get_uclass_priv(dev));
 		dev->uclass_priv = NULL;
 	}
 	if (dev->parent) {
@@ -140,7 +140,7 @@ void device_free(struct udevice *dev)
 					per_child_auto;
 		}
 		if (size) {
-			free(dev->parent_priv);
+			free(dev_get_parent_priv(dev));
 			dev->parent_priv = NULL;
 		}
 	}
diff --git a/drivers/ddr/altera/sdram_agilex.c b/drivers/ddr/altera/sdram_agilex.c
index 868bf142b4d..a4ceb36461d 100644
--- a/drivers/ddr/altera/sdram_agilex.c
+++ b/drivers/ddr/altera/sdram_agilex.c
@@ -25,7 +25,7 @@ DECLARE_GLOBAL_DATA_PTR;
 
 int sdram_mmr_init_full(struct udevice *dev)
 {
-	struct altera_sdram_plat *plat = dev->plat;
+	struct altera_sdram_plat *plat = dev_get_plat(dev);
 	struct altera_sdram_priv *priv = dev_get_priv(dev);
 	u32 i;
 	int ret;
diff --git a/drivers/ddr/altera/sdram_gen5.c b/drivers/ddr/altera/sdram_gen5.c
index 3ffe057543f..8d3ce495dea 100644
--- a/drivers/ddr/altera/sdram_gen5.c
+++ b/drivers/ddr/altera/sdram_gen5.c
@@ -565,7 +565,7 @@ static unsigned long sdram_calculate_size(struct socfpga_sdr_ctrl *sdr_ctrl)
 
 static int altera_gen5_sdram_of_to_plat(struct udevice *dev)
 {
-	struct altera_gen5_sdram_plat *plat = dev->plat;
+	struct altera_gen5_sdram_plat *plat = dev_get_plat(dev);
 
 	plat->sdr = (struct socfpga_sdr *)devfdt_get_addr_index(dev, 0);
 	if (!plat->sdr)
@@ -578,7 +578,7 @@ static int altera_gen5_sdram_probe(struct udevice *dev)
 {
 	int ret;
 	unsigned long sdram_size;
-	struct altera_gen5_sdram_plat *plat = dev->plat;
+	struct altera_gen5_sdram_plat *plat = dev_get_plat(dev);
 	struct altera_gen5_sdram_priv *priv = dev_get_priv(dev);
 	struct socfpga_sdr_ctrl *sdr_ctrl = &plat->sdr->sdr_ctrl;
 	struct reset_ctl_bulk resets;
diff --git a/drivers/ddr/altera/sdram_s10.c b/drivers/ddr/altera/sdram_s10.c
index 984dc32442d..03a270f2639 100644
--- a/drivers/ddr/altera/sdram_s10.c
+++ b/drivers/ddr/altera/sdram_s10.c
@@ -70,7 +70,7 @@ int match_ddr_conf(u32 ddr_conf)
  */
 int sdram_mmr_init_full(struct udevice *dev)
 {
-	struct altera_sdram_plat *plat = dev->plat;
+	struct altera_sdram_plat *plat = dev_get_plat(dev);
 	struct altera_sdram_priv *priv = dev_get_priv(dev);
 	u32 update_value, io48_value, ddrioctl;
 	u32 i;
diff --git a/drivers/ddr/altera/sdram_soc64.c b/drivers/ddr/altera/sdram_soc64.c
index 7e77c7b0733..5aba655e5f1 100644
--- a/drivers/ddr/altera/sdram_soc64.c
+++ b/drivers/ddr/altera/sdram_soc64.c
@@ -232,7 +232,7 @@ phys_size_t sdram_calculate_size(struct altera_sdram_plat *plat)
 
 static int altera_sdram_of_to_plat(struct udevice *dev)
 {
-	struct altera_sdram_plat *plat = dev->plat;
+	struct altera_sdram_plat *plat = dev_get_plat(dev);
 	fdt_addr_t addr;
 
 	addr = dev_read_addr_index(dev, 0);
diff --git a/drivers/gpio/dwapb_gpio.c b/drivers/gpio/dwapb_gpio.c
index acd77b6892e..e6e919444f5 100644
--- a/drivers/gpio/dwapb_gpio.c
+++ b/drivers/gpio/dwapb_gpio.c
@@ -141,7 +141,7 @@ static int gpio_dwapb_reset(struct udevice *dev)
 static int gpio_dwapb_probe(struct udevice *dev)
 {
 	struct gpio_dev_priv *priv = dev_get_uclass_priv(dev);
-	struct gpio_dwapb_plat *plat = dev->plat;
+	struct gpio_dwapb_plat *plat = dev_get_plat(dev);
 
 	if (!plat) {
 		/* Reset on parent device only */
diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
index 65b18ce6c81..952c111b087 100644
--- a/drivers/gpio/gpio-uclass.c
+++ b/drivers/gpio/gpio-uclass.c
@@ -1165,7 +1165,7 @@ int gpio_get_number(const struct gpio_desc *desc)
 
 	if (!dev)
 		return -1;
-	uc_priv = dev->uclass_priv;
+	uc_priv = dev_get_uclass_priv(dev);
 
 	return uc_priv->gpio_base + desc->offset;
 }
diff --git a/drivers/gpio/hi6220_gpio.c b/drivers/gpio/hi6220_gpio.c
index f5e5fc6e48a..04f8d904a2f 100644
--- a/drivers/gpio/hi6220_gpio.c
+++ b/drivers/gpio/hi6220_gpio.c
@@ -67,7 +67,7 @@ static int hi6220_gpio_probe(struct udevice *dev)
 {
 	struct gpio_bank *bank = dev_get_priv(dev);
 	struct hikey_gpio_plat *plat = dev_get_plat(dev);
-	struct gpio_dev_priv *uc_priv = dev->uclass_priv;
+	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
 	char name[18], *str;
 
 	sprintf(name, "GPIO%d_", plat->bank_index);
diff --git a/drivers/gpio/imx_rgpio2p.c b/drivers/gpio/imx_rgpio2p.c
index 17edd40c5c5..a5a290a00ce 100644
--- a/drivers/gpio/imx_rgpio2p.c
+++ b/drivers/gpio/imx_rgpio2p.c
@@ -11,6 +11,7 @@
 #include <fdtdec.h>
 #include <asm/gpio.h>
 #include <asm/io.h>
+#include <dm/device-internal.h>
 #include <malloc.h>
 
 enum imx_rgpio2p_direction {
@@ -151,7 +152,7 @@ static int imx_rgpio2p_probe(struct udevice *dev)
 
 static int imx_rgpio2p_bind(struct udevice *dev)
 {
-	struct imx_rgpio2p_plat *plat = dev->plat;
+	struct imx_rgpio2p_plat *plat = dev_get_plat(dev);
 	fdt_addr_t addr;
 
 	/*
@@ -184,7 +185,7 @@ static int imx_rgpio2p_bind(struct udevice *dev)
 
 	plat->regs = (struct gpio_regs *)addr;
 	plat->bank_index = dev_seq(dev);
-	dev->plat = plat;
+	dev_set_plat(dev, plat);
 
 	return 0;
 }
diff --git a/drivers/gpio/lpc32xx_gpio.c b/drivers/gpio/lpc32xx_gpio.c
index ffaec32ac2b..de66c765d11 100644
--- a/drivers/gpio/lpc32xx_gpio.c
+++ b/drivers/gpio/lpc32xx_gpio.c
@@ -295,7 +295,7 @@ static const struct dm_gpio_ops gpio_lpc32xx_ops = {
 static int lpc32xx_gpio_probe(struct udevice *dev)
 {
 	struct lpc32xx_gpio_priv *gpio_priv = dev_get_priv(dev);
-	struct gpio_dev_priv *uc_priv = dev->uclass_priv;
+	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
 
 	if (dev_of_offset(dev) == -1) {
 		/* Tell the uclass how many GPIOs we have */
diff --git a/drivers/gpio/mt7621_gpio.c b/drivers/gpio/mt7621_gpio.c
index 65b4cbf61b9..43bb4df4da7 100644
--- a/drivers/gpio/mt7621_gpio.c
+++ b/drivers/gpio/mt7621_gpio.c
@@ -130,7 +130,7 @@ static int gpio_mediatek_probe(struct udevice *dev)
  */
 static int gpio_mediatek_bind(struct udevice *parent)
 {
-	struct mediatek_gpio_plat *plat = parent->plat;
+	struct mediatek_gpio_plat *plat = dev_get_plat(parent);
 	ofnode node;
 	int bank = 0;
 	int ret;
diff --git a/drivers/gpio/mxs_gpio.c b/drivers/gpio/mxs_gpio.c
index 5ad65e4ee0b..fd5e0ea5c25 100644
--- a/drivers/gpio/mxs_gpio.c
+++ b/drivers/gpio/mxs_gpio.c
@@ -264,7 +264,7 @@ static int mxs_gpio_probe(struct udevice *dev)
 #if CONFIG_IS_ENABLED(OF_CONTROL) && !CONFIG_IS_ENABLED(OF_PLATDATA)
 static int mxs_of_to_plat(struct udevice *dev)
 {
-	struct mxs_gpio_plat *plat = dev->plat;
+	struct mxs_gpio_plat *plat = dev_get_plat(dev);
 	struct fdtdec_phandle_args args;
 	int node = dev_of_offset(dev);
 	int ret;
diff --git a/drivers/gpio/omap_gpio.c b/drivers/gpio/omap_gpio.c
index 400c6ca4724..336ece47785 100644
--- a/drivers/gpio/omap_gpio.c
+++ b/drivers/gpio/omap_gpio.c
@@ -22,6 +22,7 @@
 #include <fdtdec.h>
 #include <asm/gpio.h>
 #include <asm/io.h>
+#include <dm/device-internal.h>
 #include <linux/errno.h>
 #include <malloc.h>
 
@@ -328,7 +329,7 @@ static int omap_gpio_bind(struct udevice *dev)
 
 	plat->base = base_addr;
 	plat->port_name = fdt_get_name(gd->fdt_blob, dev_of_offset(dev), NULL);
-	dev->plat = plat;
+	dev_set_plat(dev, plat);
 
 	return 0;
 }
diff --git a/drivers/gpio/s5p_gpio.c b/drivers/gpio/s5p_gpio.c
index 9de9541c875..796fe3e1104 100644
--- a/drivers/gpio/s5p_gpio.c
+++ b/drivers/gpio/s5p_gpio.c
@@ -286,8 +286,8 @@ static const struct dm_gpio_ops gpio_exynos_ops = {
 static int gpio_exynos_probe(struct udevice *dev)
 {
 	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
-	struct exynos_bank_info *priv = dev->priv;
-	struct exynos_gpio_plat *plat = dev->plat;
+	struct exynos_bank_info *priv = dev_get_priv(dev);
+	struct exynos_gpio_plat *plat = dev_get_plat(dev);
 
 	/* Only child devices have ports */
 	if (!plat)
@@ -307,7 +307,7 @@ static int gpio_exynos_probe(struct udevice *dev)
  */
 static int gpio_exynos_bind(struct udevice *parent)
 {
-	struct exynos_gpio_plat *plat = parent->plat;
+	struct exynos_gpio_plat *plat = dev_get_plat(parent);
 	struct s5p_gpio_bank *bank, *base;
 	const void *blob = gd->fdt_blob;
 	int node;
diff --git a/drivers/gpio/sandbox.c b/drivers/gpio/sandbox.c
index 2708838adf6..489271b560e 100644
--- a/drivers/gpio/sandbox.c
+++ b/drivers/gpio/sandbox.c
@@ -11,6 +11,7 @@
 #include <acpi/acpi_device.h>
 #include <asm/gpio.h>
 #include <dm/acpi.h>
+#include <dm/device-internal.h>
 #include <dm/device_compat.h>
 #include <dm/lists.h>
 #include <dm/of.h>
@@ -297,14 +298,15 @@ static int gpio_sandbox_probe(struct udevice *dev)
 		/* Tell the uclass how many GPIOs we have */
 		uc_priv->gpio_count = CONFIG_SANDBOX_GPIO_COUNT;
 
-	dev->priv = calloc(sizeof(struct gpio_state), uc_priv->gpio_count);
+	dev_set_priv(dev,
+		     calloc(sizeof(struct gpio_state), uc_priv->gpio_count));
 
 	return 0;
 }
 
 static int gpio_sandbox_remove(struct udevice *dev)
 {
-	free(dev->priv);
+	free(dev_get_priv(dev));
 
 	return 0;
 }
diff --git a/drivers/gpio/sunxi_gpio.c b/drivers/gpio/sunxi_gpio.c
index 75494c78283..7633422b0bb 100644
--- a/drivers/gpio/sunxi_gpio.c
+++ b/drivers/gpio/sunxi_gpio.c
@@ -285,7 +285,7 @@ static int gpio_sunxi_bind(struct udevice *parent)
 {
 	struct sunxi_gpio_soc_data *soc_data =
 		(struct sunxi_gpio_soc_data *)dev_get_driver_data(parent);
-	struct sunxi_gpio_plat *plat = parent->plat;
+	struct sunxi_gpio_plat *plat = dev_get_plat(parent);
 	struct sunxi_gpio_reg *ctlr;
 	int bank, ret;
 
diff --git a/drivers/gpio/tegra186_gpio.c b/drivers/gpio/tegra186_gpio.c
index cd1fb65a55c..82dcaf96312 100644
--- a/drivers/gpio/tegra186_gpio.c
+++ b/drivers/gpio/tegra186_gpio.c
@@ -34,7 +34,7 @@ struct tegra186_gpio_plat {
 static uint32_t *tegra186_gpio_reg(struct udevice *dev, uint32_t reg,
 				   uint32_t gpio)
 {
-	struct tegra186_gpio_plat *plat = dev->plat;
+	struct tegra186_gpio_plat *plat = dev_get_plat(dev);
 	uint32_t index = (reg + (gpio * TEGRA186_GPIO_PER_GPIO_STRIDE)) / 4;
 
 	return &(plat->regs[index]);
@@ -166,7 +166,7 @@ static const struct dm_gpio_ops tegra186_gpio_ops = {
  */
 static int tegra186_gpio_bind(struct udevice *parent)
 {
-	struct tegra186_gpio_plat *parent_plat = parent->plat;
+	struct tegra186_gpio_plat *parent_plat = dev_get_plat(parent);
 	struct tegra186_gpio_ctlr_data *ctlr_data =
 		(struct tegra186_gpio_ctlr_data *)dev_get_driver_data(parent);
 	uint32_t *regs;
@@ -201,7 +201,7 @@ static int tegra186_gpio_bind(struct udevice *parent)
 
 static int tegra186_gpio_probe(struct udevice *dev)
 {
-	struct tegra186_gpio_plat *plat = dev->plat;
+	struct tegra186_gpio_plat *plat = dev_get_plat(dev);
 	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
 
 	/* Only child devices have ports */
diff --git a/drivers/gpio/tegra_gpio.c b/drivers/gpio/tegra_gpio.c
index c489796f77c..5d3af8a016d 100644
--- a/drivers/gpio/tegra_gpio.c
+++ b/drivers/gpio/tegra_gpio.c
@@ -291,8 +291,8 @@ static const struct udevice_id tegra_gpio_ids[] = {
 static int gpio_tegra_probe(struct udevice *dev)
 {
 	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
-	struct tegra_port_info *priv = dev->priv;
-	struct tegra_gpio_plat *plat = dev->plat;
+	struct tegra_port_info *priv = dev_get_priv(dev);
+	struct tegra_gpio_plat *plat = dev_get_plat(dev);
 
 	/* Only child devices have ports */
 	if (!plat)
@@ -313,7 +313,7 @@ static int gpio_tegra_probe(struct udevice *dev)
  */
 static int gpio_tegra_bind(struct udevice *parent)
 {
-	struct tegra_gpio_plat *plat = parent->plat;
+	struct tegra_gpio_plat *plat = dev_get_plat(parent);
 	struct gpio_ctlr *ctlr;
 	int bank_count;
 	int bank;
diff --git a/drivers/i2c/i2c-uclass.c b/drivers/i2c/i2c-uclass.c
index 5930c6bea34..e3fabd84a0f 100644
--- a/drivers/i2c/i2c-uclass.c
+++ b/drivers/i2c/i2c-uclass.c
@@ -693,7 +693,7 @@ struct i2c_priv {
 static int i2c_post_bind(struct udevice *dev)
 {
 	struct uclass *class = dev->uclass;
-	struct i2c_priv *priv = class->priv;
+	struct i2c_priv *priv = uclass_get_priv(class);
 	int ret = 0;
 
 	/* Just for sure */
@@ -710,7 +710,7 @@ static int i2c_post_bind(struct udevice *dev)
 
 int i2c_uclass_init(struct uclass *class)
 {
-	struct i2c_priv *priv = class->priv;
+	struct i2c_priv *priv = uclass_get_priv(class);
 
 	/* Just for sure */
 	if (!priv)
diff --git a/drivers/misc/altera_sysid.c b/drivers/misc/altera_sysid.c
index 057b431c254..878df12771c 100644
--- a/drivers/misc/altera_sysid.c
+++ b/drivers/misc/altera_sysid.c
@@ -59,7 +59,7 @@ U_BOOT_CMD(
 static int altera_sysid_read(struct udevice *dev,
 			     int offset, void *buf, int size)
 {
-	struct altera_sysid_plat *plat = dev->plat;
+	struct altera_sysid_plat *plat = dev_get_plat(dev);
 	struct altera_sysid_regs *const regs = plat->regs;
 	u32 *sysid = buf;
 
diff --git a/drivers/misc/cros_ec_sandbox.c b/drivers/misc/cros_ec_sandbox.c
index cb7229ae96f..64186b9a3eb 100644
--- a/drivers/misc/cros_ec_sandbox.c
+++ b/drivers/misc/cros_ec_sandbox.c
@@ -522,8 +522,8 @@ void cros_ec_check_keyboard(struct udevice *dev)
 
 int cros_ec_probe(struct udevice *dev)
 {
-	struct ec_state *ec = dev->priv;
-	struct cros_ec_dev *cdev = dev->uclass_priv;
+	struct ec_state *ec = dev_get_priv(dev);
+	struct cros_ec_dev *cdev = dev_get_uclass_priv(dev);
 	struct udevice *keyb_dev;
 	ofnode node;
 	int err;
diff --git a/drivers/misc/fs_loader.c b/drivers/misc/fs_loader.c
index 5ed8ab6530f..f460b1a64c8 100644
--- a/drivers/misc/fs_loader.c
+++ b/drivers/misc/fs_loader.c
@@ -161,7 +161,7 @@ static int fw_get_filesystem_firmware(struct udevice *dev)
 		else
 			ret = -ENODEV;
 	} else {
-		ret = select_fs_dev(dev->plat);
+		ret = select_fs_dev(dev_get_plat(dev));
 	}
 
 	if (ret)
@@ -228,7 +228,7 @@ static int fs_loader_of_to_plat(struct udevice *dev)
 	if (ofnode_valid(fs_loader_node)) {
 		struct device_plat *plat;
 
-		plat = dev->plat;
+		plat = dev_get_plat(dev);
 		if (!ofnode_read_u32_array(fs_loader_node,
 					  "phandlepart",
 					  phandlepart, 2)) {
@@ -250,7 +250,7 @@ static int fs_loader_probe(struct udevice *dev)
 {
 #if CONFIG_IS_ENABLED(DM) && CONFIG_IS_ENABLED(BLK)
 	int ret;
-	struct device_plat *plat = dev->plat;
+	struct device_plat *plat = dev_get_plat(dev);
 
 	if (plat->phandlepart.phandle) {
 		ofnode node = ofnode_get_by_phandle(plat->phandlepart.phandle);
diff --git a/drivers/misc/vexpress_config.c b/drivers/misc/vexpress_config.c
index 02e5b586e29..2baca48109f 100644
--- a/drivers/misc/vexpress_config.c
+++ b/drivers/misc/vexpress_config.c
@@ -109,7 +109,7 @@ static int vexpress_config_probe(struct udevice *dev)
 	if (!priv)
 		return -ENOMEM;
 
-	dev->uclass_priv = priv;
+	dev_get_uclass_priv(dev) = priv;
 	priv->addr = ofnode_get_addr(args.node);
 
 	return dev_read_u32(dev, "arm,vexpress,site", &priv->site);
diff --git a/drivers/mmc/arm_pl180_mmci.c b/drivers/mmc/arm_pl180_mmci.c
index fe406fe4ad7..b2d1b4f9aa9 100644
--- a/drivers/mmc/arm_pl180_mmci.c
+++ b/drivers/mmc/arm_pl180_mmci.c
@@ -421,7 +421,7 @@ static int arm_pl180_mmc_probe(struct udevice *dev)
 	struct arm_pl180_mmc_plat *pdata = dev_get_plat(dev);
 	struct mmc_uclass_priv *upriv = dev_get_uclass_priv(dev);
 	struct mmc *mmc = &pdata->mmc;
-	struct pl180_mmc_host *host = dev->priv;
+	struct pl180_mmc_host *host = dev_get_priv(dev);
 	struct mmc_config *cfg = &pdata->cfg;
 	struct clk clk;
 	u32 bus_width;
@@ -508,7 +508,7 @@ static int dm_host_set_ios(struct udevice *dev)
 
 static int dm_mmc_getcd(struct udevice *dev)
 {
-	struct pl180_mmc_host *host = dev->priv;
+	struct pl180_mmc_host *host = dev_get_priv(dev);
 	int value = 1;
 
 	if (dm_gpio_is_valid(&host->cd_gpio))
@@ -525,7 +525,7 @@ static const struct dm_mmc_ops arm_pl180_dm_mmc_ops = {
 
 static int arm_pl180_mmc_of_to_plat(struct udevice *dev)
 {
-	struct pl180_mmc_host *host = dev->priv;
+	struct pl180_mmc_host *host = dev_get_priv(dev);
 	fdt_addr_t addr;
 
 	addr = dev_read_addr(dev);
diff --git a/drivers/mmc/mxsmmc.c b/drivers/mmc/mxsmmc.c
index 143818d4018..b3fb559a677 100644
--- a/drivers/mmc/mxsmmc.c
+++ b/drivers/mmc/mxsmmc.c
@@ -668,7 +668,7 @@ static const struct dm_mmc_ops mxsmmc_ops = {
 #if CONFIG_IS_ENABLED(OF_CONTROL) && !CONFIG_IS_ENABLED(OF_PLATDATA)
 static int mxsmmc_of_to_plat(struct udevice *bus)
 {
-	struct mxsmmc_plat *plat = bus->plat;
+	struct mxsmmc_plat *plat = dev_get_plat(bus);
 	u32 prop[2];
 	int ret;
 
diff --git a/drivers/mmc/octeontx_hsmmc.c b/drivers/mmc/octeontx_hsmmc.c
index 5552342f8d9..57d107aac32 100644
--- a/drivers/mmc/octeontx_hsmmc.c
+++ b/drivers/mmc/octeontx_hsmmc.c
@@ -30,6 +30,7 @@
 #include <asm/arch/clock.h>
 #include <asm/arch/csrs/csrs-mio_emm.h>
 #include <asm/io.h>
+#include <dm/device-internal.h>
 
 #include <power/regulator.h>
 
@@ -3841,7 +3842,7 @@ static int octeontx_mmc_host_child_pre_probe(struct udevice *dev)
 	}
 
 	slot = &host->slots[bus_id];
-	dev->priv = slot;
+	dev_set_priv(dev, slot);
 	slot->host = host;
 	slot->bus_id = bus_id;
 	slot->dev = dev;
@@ -3852,16 +3853,21 @@ static int octeontx_mmc_host_child_pre_probe(struct udevice *dev)
 	snprintf(name, sizeof(name), "octeontx-mmc%d", bus_id);
 	err = device_set_name(dev, name);
 
-	if (!dev->uclass_priv) {
+	/* FIXME: This code should not be needed */
+	if (!dev_get_uclass_priv(dev)) {
 		debug("%s(%s): Allocating uclass priv\n", __func__,
 		      dev->name);
 		upriv = calloc(1, sizeof(struct mmc_uclass_priv));
 		if (!upriv)
 			return -ENOMEM;
-		dev->uclass_priv = upriv;
-		dev->uclass->priv = upriv;
+
+		/*
+		 * FIXME: This is not allowed
+		 * dev_set_uclass_priv(dev, upriv);
+		 * uclass_set_priv(dev->uclass, upriv);
+		 */
 	} else {
-		upriv = dev->uclass_priv;
+		upriv = dev_get_uclass_priv(dev);
 	}
 
 	upriv->mmc = &slot->mmc;
@@ -3878,6 +3884,7 @@ static const struct udevice_id octeontx_hsmmc_host_ids[] = {
 
 U_BOOT_DRIVER(octeontx_hsmmc_host) = {
 	.name	= "octeontx_hsmmc_host",
+	/* FIXME: Why is this not UCLASS_MMC? */
 	.id	= UCLASS_MISC,
 	.of_match = of_match_ptr(octeontx_hsmmc_host_ids),
 	.probe	= octeontx_mmc_host_probe,
diff --git a/drivers/mux/mmio.c b/drivers/mux/mmio.c
index b9868505a3b..00e0282dcc0 100644
--- a/drivers/mux/mmio.c
+++ b/drivers/mux/mmio.c
@@ -12,6 +12,7 @@
 #include <regmap.h>
 #include <syscon.h>
 #include <dm/device.h>
+#include <dm/device-internal.h>
 #include <dm/device_compat.h>
 #include <dm/read.h>
 #include <dm/devres.h>
@@ -68,7 +69,7 @@ static int mmio_mux_probe(struct udevice *dev)
 	fields = devm_kmalloc(dev, num_fields * sizeof(*fields), __GFP_ZERO);
 	if (!fields)
 		return -ENOMEM;
-	dev->priv = fields;
+	dev_set_priv(dev, fields);
 
 	mux_reg_masks = devm_kmalloc(dev, num_fields * 2 * sizeof(u32),
 				     __GFP_ZERO);
diff --git a/drivers/net/eth-phy-uclass.c b/drivers/net/eth-phy-uclass.c
index 65615f13103..07aebd935e6 100644
--- a/drivers/net/eth-phy-uclass.c
+++ b/drivers/net/eth-phy-uclass.c
@@ -54,7 +54,7 @@ int eth_phy_set_mdio_bus(struct udevice *eth_dev, struct mii_dev *mdio_bus)
 	for (uclass_first_device(UCLASS_ETH_PHY, &dev); dev;
 	     uclass_next_device(&dev)) {
 		if (dev->parent == eth_dev) {
-			uc_priv = (struct eth_phy_device_priv *)(dev->uclass_priv);
+			uc_priv = (struct eth_phy_device_priv *)(dev_get_uclass_priv(dev));
 
 			if (!uc_priv->mdio_bus)
 				uc_priv->mdio_bus = mdio_bus;
@@ -79,7 +79,7 @@ struct mii_dev *eth_phy_get_mdio_bus(struct udevice *eth_dev)
 			 * phy_dev is shared and controlled by
 			 * other eth controller
 			 */
-			uc_priv = (struct eth_phy_device_priv *)(phy_dev->uclass_priv);
+			uc_priv = (struct eth_phy_device_priv *)(dev_get_uclass_priv(phy_dev));
 			if (uc_priv->mdio_bus)
 				printf("Get shared mii bus on %s\n", eth_dev->name);
 			else
diff --git a/drivers/net/fm/eth.c b/drivers/net/fm/eth.c
index 02ccf1efc3b..a10f87eefc5 100644
--- a/drivers/net/fm/eth.c
+++ b/drivers/net/fm/eth.c
@@ -547,7 +547,11 @@ static void fm_eth_halt(struct udevice *dev)
 	struct fm_eth *fm_eth;
 	struct fsl_enet_mac *mac;
 
+#ifndef CONFIG_DM_ETH
 	fm_eth = (struct fm_eth *)dev->priv;
+#else
+	fm_eth = dev_get_priv(dev);
+#endif
 	mac = fm_eth->mac;
 
 	/* graceful stop the transmission of frames */
@@ -577,7 +581,11 @@ static int fm_eth_send(struct udevice *dev, void *buf, int len)
 	u16 offset_in;
 	int i;
 
+#ifndef CONFIG_DM_ETH
 	fm_eth = (struct fm_eth *)dev->priv;
+#else
+	fm_eth = dev_get_priv(dev);
+#endif
 	pram = fm_eth->tx_pram;
 	txbd = fm_eth->cur_txbd;
 
@@ -664,13 +672,19 @@ static int fm_eth_recv(struct eth_device *dev)
 static int fm_eth_recv(struct udevice *dev, int flags, uchar **packetp)
 #endif
 {
-	struct fm_eth *fm_eth = (struct fm_eth *)dev->priv;
-	struct fm_port_bd *rxbd = fm_eth->cur_rxbd;
+	struct fm_eth *fm_eth;
+	struct fm_port_bd *rxbd;
 	u32 buf_lo, buf_hi;
 	u16 status, len;
 	int ret = -1;
 	u8 *data;
 
+#ifndef CONFIG_DM_ETH
+	fm_eth = (struct fm_eth *)dev->priv;
+#else
+	fm_eth = dev_get_priv(dev);
+#endif
+	rxbd = fm_eth->cur_rxbd;
 	status = muram_readw(&rxbd->status);
 
 	while (!(status & RxBD_EMPTY)) {
@@ -704,7 +718,7 @@ static int fm_eth_recv(struct udevice *dev, int flags, uchar **packetp)
 #ifdef CONFIG_DM_ETH
 static int fm_eth_free_pkt(struct udevice *dev, uchar *packet, int length)
 {
-	struct fm_eth *fm_eth = (struct fm_eth *)dev->priv;
+	struct fm_eth *fm_eth = (struct fm_eth *)dev_get_priv(dev);
 
 	fm_eth->cur_rxbd = fm_eth_free_one(fm_eth, fm_eth->cur_rxbd);
 
@@ -1004,7 +1018,7 @@ static struct udevice *fm_get_internal_mdio(struct udevice *dev)
 
 static int fm_eth_probe(struct udevice *dev)
 {
-	struct fm_eth *fm_eth = (struct fm_eth *)dev->priv;
+	struct fm_eth *fm_eth = (struct fm_eth *)dev_get_priv(dev);
 	struct ofnode_phandle_args args;
 	void *reg;
 	int ret, index;
diff --git a/drivers/net/fsl_mcdmafec.c b/drivers/net/fsl_mcdmafec.c
index 0196462beb4..c36d40c9111 100644
--- a/drivers/net/fsl_mcdmafec.c
+++ b/drivers/net/fsl_mcdmafec.c
@@ -79,7 +79,7 @@ static void init_eth_info(struct fec_info_dma *info)
 
 static void fec_halt(struct udevice *dev)
 {
-	struct fec_info_dma *info = dev->priv;
+	struct fec_info_dma *info = dev_get_priv(dev);
 	volatile fecdma_t *fecp = (fecdma_t *)info->iobase;
 	int counter = 0xffff;
 
@@ -230,7 +230,7 @@ static void fec_set_hwaddr(volatile fecdma_t *fecp, u8 *mac)
 
 static int fec_init(struct udevice *dev)
 {
-	struct fec_info_dma *info = dev->priv;
+	struct fec_info_dma *info = dev_get_priv(dev);
 	volatile fecdma_t *fecp = (fecdma_t *)info->iobase;
 	int rval, i;
 	uchar enetaddr[6];
@@ -352,7 +352,7 @@ static int mcdmafec_init(struct udevice *dev)
 
 static int mcdmafec_send(struct udevice *dev, void *packet, int length)
 {
-	struct fec_info_dma *info = dev->priv;
+	struct fec_info_dma *info = dev_get_priv(dev);
 	cbd_t *p_tbd, *p_used_tbd;
 	u16 phy_status;
 
@@ -412,7 +412,7 @@ static int mcdmafec_send(struct udevice *dev, void *packet, int length)
 
 static int mcdmafec_recv(struct udevice *dev, int flags, uchar **packetp)
 {
-	struct fec_info_dma *info = dev->priv;
+	struct fec_info_dma *info = dev_get_priv(dev);
 	volatile fecdma_t *fecp = (fecdma_t *)info->iobase;
 
 	cbd_t *prbd = &info->rxbd[info->rx_idx];
@@ -496,7 +496,7 @@ static const struct eth_ops mcdmafec_ops = {
  */
 static int mcdmafec_probe(struct udevice *dev)
 {
-	struct fec_info_dma *info = dev->priv;
+	struct fec_info_dma *info = dev_get_priv(dev);
 	struct eth_pdata *pdata = dev_get_plat(dev);
 	int node = dev_of_offset(dev);
 	int retval;
diff --git a/drivers/net/mcffec.c b/drivers/net/mcffec.c
index 4fa71360cf4..cb343b446f5 100644
--- a/drivers/net/mcffec.c
+++ b/drivers/net/mcffec.c
@@ -125,7 +125,7 @@ static void set_fec_duplex_speed(volatile fec_t *fecp, int dup_spd)
 #ifdef ET_DEBUG
 static void dbg_fec_regs(struct udevice *dev)
 {
-	struct fec_info_s *info = dev->priv;
+	struct fec_info_s *info = dev_get_priv(dev);
 	volatile fec_t *fecp = (fec_t *)(info->iobase);
 
 	printf("=====\n");
@@ -275,7 +275,7 @@ static void dbg_fec_regs(struct udevice *dev)
 
 int mcffec_init(struct udevice *dev)
 {
-	struct fec_info_s *info = dev->priv;
+	struct fec_info_s *info = dev_get_priv(dev);
 	volatile fec_t *fecp = (fec_t *) (info->iobase);
 	int rval, i;
 	uchar ea[6];
@@ -374,7 +374,7 @@ int mcffec_init(struct udevice *dev)
 
 static int mcffec_send(struct udevice *dev, void *packet, int length)
 {
-	struct fec_info_s *info = dev->priv;
+	struct fec_info_s *info = dev_get_priv(dev);
 	volatile fec_t *fecp = (fec_t *)info->iobase;
 	int j, rc;
 	u16 phy_status;
@@ -440,7 +440,7 @@ static int mcffec_send(struct udevice *dev, void *packet, int length)
 
 static int mcffec_recv(struct udevice *dev, int flags, uchar **packetp)
 {
-	struct fec_info_s *info = dev->priv;
+	struct fec_info_s *info = dev_get_priv(dev);
 	volatile fec_t *fecp = (fec_t *)info->iobase;
 	int length = -1;
 
@@ -492,7 +492,7 @@ static int mcffec_recv(struct udevice *dev, int flags, uchar **packetp)
 
 static void mcffec_halt(struct udevice *dev)
 {
-	struct fec_info_s *info = dev->priv;
+	struct fec_info_s *info = dev_get_priv(dev);
 
 	fec_reset(info);
 	fecpin_setclear(info, 0);
@@ -519,7 +519,7 @@ static const struct eth_ops mcffec_ops = {
 static int mcffec_probe(struct udevice *dev)
 {
 	struct eth_pdata *pdata = dev_get_plat(dev);
-	struct fec_info_s *info = dev->priv;
+	struct fec_info_s *info = dev_get_priv(dev);
 	int node = dev_of_offset(dev);
 	int retval, fec_idx;
 	const u32 *val;
diff --git a/drivers/net/mcfmii.c b/drivers/net/mcfmii.c
index 393605512d9..ec81320a86d 100644
--- a/drivers/net/mcfmii.c
+++ b/drivers/net/mcfmii.c
@@ -100,7 +100,11 @@ uint mii_send(uint mii_cmd)
 
 	/* retrieve from register structure */
 	dev = eth_get_dev();
+#ifdef CONFIG_DM_ETH
+	info = dev_get_priv(dev);
+#else
 	info = dev->priv;
+#endif
 
 	ep = (FEC_T *) info->miibase;
 
@@ -216,7 +220,11 @@ void __mii_init(void)
 
 	/* retrieve from register structure */
 	dev = eth_get_dev();
+#ifdef CONFIG_DM_ETH
+	info = dev_get_priv(dev);
+#else
 	info = dev->priv;
+#endif
 
 	fecp = (FEC_T *) info->miibase;
 
diff --git a/drivers/net/pfe_eth/pfe_eth.c b/drivers/net/pfe_eth/pfe_eth.c
index 3d145711147..0c27a668b59 100644
--- a/drivers/net/pfe_eth/pfe_eth.c
+++ b/drivers/net/pfe_eth/pfe_eth.c
@@ -157,7 +157,7 @@ static int pfe_eth_start(struct udevice *dev)
 
 static int pfe_eth_send(struct udevice *dev, void *packet, int length)
 {
-	struct pfe_eth_dev *priv = (struct pfe_eth_dev *)dev->priv;
+	struct pfe_eth_dev *priv = (struct pfe_eth_dev *)dev_get_priv(dev);
 
 	int rc;
 	int i = 0;
diff --git a/drivers/net/sunxi_emac.c b/drivers/net/sunxi_emac.c
index 7c6ae3cb814..17ad88e732e 100644
--- a/drivers/net/sunxi_emac.c
+++ b/drivers/net/sunxi_emac.c
@@ -537,7 +537,7 @@ static int sunxi_emac_eth_start(struct udevice *dev)
 {
 	struct eth_pdata *pdata = dev_get_plat(dev);
 
-	return _sunxi_emac_eth_init(dev->priv, pdata->enetaddr);
+	return _sunxi_emac_eth_init(dev_get_priv(dev), pdata->enetaddr);
 }
 
 static int sunxi_emac_eth_send(struct udevice *dev, void *packet, int length)
diff --git a/drivers/net/tsec.c b/drivers/net/tsec.c
index 2271eb82516..2d124732cf0 100644
--- a/drivers/net/tsec.c
+++ b/drivers/net/tsec.c
@@ -131,11 +131,17 @@ static int tsec_mcast_addr(struct eth_device *dev, const u8 *mcast_mac,
 static int tsec_mcast_addr(struct udevice *dev, const u8 *mcast_mac, int join)
 #endif
 {
-	struct tsec_private *priv = (struct tsec_private *)dev->priv;
-	struct tsec __iomem *regs = priv->regs;
+	struct tsec_private *priv;
+	struct tsec __iomem *regs;
 	u32 result, value;
 	u8 whichbit, whichreg;
 
+#ifndef CONFIG_DM_ETH
+	priv = (struct tsec_private *)dev->priv;
+#else
+	priv = dev_get_priv(dev);
+#endif
+	regs = priv->regs;
 	result = ether_crc(MAC_ADDR_LEN, mcast_mac);
 	whichbit = (result >> 24) & 0x1f; /* the 5 LSB = which bit to set */
 	whichreg = result >> 29; /* the 3 MSB = which reg to set it in */
@@ -260,12 +266,18 @@ static int tsec_send(struct eth_device *dev, void *packet, int length)
 static int tsec_send(struct udevice *dev, void *packet, int length)
 #endif
 {
-	struct tsec_private *priv = (struct tsec_private *)dev->priv;
-	struct tsec __iomem *regs = priv->regs;
+	struct tsec_private *priv;
+	struct tsec __iomem *regs;
 	int result = 0;
 	u16 status;
 	int i;
 
+#ifndef CONFIG_DM_ETH
+	priv = (struct tsec_private *)dev->priv;
+#else
+	priv = dev_get_priv(dev);
+#endif
+	regs = priv->regs;
 	/* Find an empty buffer descriptor */
 	for (i = 0;
 	     in_be16(&priv->txbd[priv->tx_idx].status) & TXBD_READY;
@@ -339,7 +351,7 @@ static int tsec_recv(struct eth_device *dev)
 #else
 static int tsec_recv(struct udevice *dev, int flags, uchar **packetp)
 {
-	struct tsec_private *priv = (struct tsec_private *)dev->priv;
+	struct tsec_private *priv = (struct tsec_private *)dev_get_priv(dev);
 	struct tsec __iomem *regs = priv->regs;
 	int ret = -1;
 
@@ -368,7 +380,7 @@ static int tsec_recv(struct udevice *dev, int flags, uchar **packetp)
 
 static int tsec_free_pkt(struct udevice *dev, uchar *packet, int length)
 {
-	struct tsec_private *priv = (struct tsec_private *)dev->priv;
+	struct tsec_private *priv = (struct tsec_private *)dev_get_priv(dev);
 	u16 status;
 
 	out_be16(&priv->rxbd[priv->rx_idx].length, 0);
@@ -392,8 +404,14 @@ static void tsec_halt(struct eth_device *dev)
 static void tsec_halt(struct udevice *dev)
 #endif
 {
-	struct tsec_private *priv = (struct tsec_private *)dev->priv;
-	struct tsec __iomem *regs = priv->regs;
+	struct tsec_private *priv;
+	struct tsec __iomem *regs;
+#ifndef CONFIG_DM_ETH
+	priv = (struct tsec_private *)dev->priv;
+#else
+	priv = dev_get_priv(dev);
+#endif
+	regs = priv->regs;
 
 	clrbits_be32(&regs->dmactrl, DMACTRL_GRS | DMACTRL_GTS);
 	setbits_be32(&regs->dmactrl, DMACTRL_GRS | DMACTRL_GTS);
@@ -560,16 +578,22 @@ static int tsec_init(struct eth_device *dev, struct bd_info *bd)
 static int tsec_init(struct udevice *dev)
 #endif
 {
-	struct tsec_private *priv = (struct tsec_private *)dev->priv;
+	struct tsec_private *priv;
+	struct tsec __iomem *regs;
 #ifdef CONFIG_DM_ETH
 	struct eth_pdata *pdata = dev_get_plat(dev);
 #else
 	struct eth_device *pdata = dev;
 #endif
-	struct tsec __iomem *regs = priv->regs;
 	u32 tempval;
 	int ret;
 
+#ifndef CONFIG_DM_ETH
+	priv = (struct tsec_private *)dev->priv;
+#else
+	priv = dev_get_priv(dev);
+#endif
+	regs = priv->regs;
 	/* Make sure the controller is stopped */
 	tsec_halt(dev);
 
@@ -865,7 +889,7 @@ int tsec_probe(struct udevice *dev)
 
 int tsec_remove(struct udevice *dev)
 {
-	struct tsec_private *priv = dev->priv;
+	struct tsec_private *priv = dev_get_priv(dev);
 
 	free(priv->phydev);
 	mdio_unregister(priv->bus);
diff --git a/drivers/net/xilinx_emaclite.c b/drivers/net/xilinx_emaclite.c
index 5c768875199..6b447537f66 100644
--- a/drivers/net/xilinx_emaclite.c
+++ b/drivers/net/xilinx_emaclite.c
@@ -457,7 +457,7 @@ static int emaclite_recv(struct udevice *dev, int flags, uchar **packetp)
 {
 	u32 length, first_read, reg, attempt = 0;
 	void *addr, *ack;
-	struct xemaclite *emaclite = dev->priv;
+	struct xemaclite *emaclite = dev_get_priv(dev);
 	struct emaclite_regs *regs = emaclite->regs;
 	struct ethernet_hdr *eth;
 	struct ip_udp_hdr *ip;
diff --git a/drivers/pci/pci-emul-uclass.c b/drivers/pci/pci-emul-uclass.c
index 756d8ad7449..a0b8afb87a0 100644
--- a/drivers/pci/pci-emul-uclass.c
+++ b/drivers/pci/pci-emul-uclass.c
@@ -82,7 +82,7 @@ uint sandbox_pci_read_bar(u32 barval, int type, uint size)
 
 static int sandbox_pci_emul_post_probe(struct udevice *dev)
 {
-	struct sandbox_pci_emul_priv *priv = dev->uclass->priv;
+	struct sandbox_pci_emul_priv *priv = uclass_get_priv(dev->uclass);
 
 	priv->dev_count++;
 	sandbox_set_enable_pci_map(true);
@@ -92,7 +92,7 @@ static int sandbox_pci_emul_post_probe(struct udevice *dev)
 
 static int sandbox_pci_emul_pre_remove(struct udevice *dev)
 {
-	struct sandbox_pci_emul_priv *priv = dev->uclass->priv;
+	struct sandbox_pci_emul_priv *priv = uclass_get_priv(dev->uclass);
 
 	priv->dev_count--;
 	sandbox_set_enable_pci_map(priv->dev_count > 0);
diff --git a/drivers/pci/pci-uclass.c b/drivers/pci/pci-uclass.c
index bb26e2a6d42..6cabf01561e 100644
--- a/drivers/pci/pci-uclass.c
+++ b/drivers/pci/pci-uclass.c
@@ -524,7 +524,7 @@ static void set_vga_bridge_bits(struct udevice *dev)
 
 int pci_auto_config_devices(struct udevice *bus)
 {
-	struct pci_controller *hose = bus->uclass_priv;
+	struct pci_controller *hose = dev_get_uclass_priv(bus);
 	struct pci_child_plat *pplat;
 	unsigned int sub_bus;
 	struct udevice *dev;
@@ -1007,7 +1007,7 @@ static int pci_uclass_pre_probe(struct udevice *bus)
 
 	debug("%s, bus=%d/%s, parent=%s\n", __func__, dev_seq(bus), bus->name,
 	      bus->parent->name);
-	hose = bus->uclass_priv;
+	hose = dev_get_uclass_priv(bus);
 
 	/*
 	 * Set the sequence number, if device_bind() doesn't. We want control
@@ -1109,7 +1109,7 @@ static int pci_bridge_read_config(const struct udevice *bus, pci_dev_t bdf,
 				  uint offset, ulong *valuep,
 				  enum pci_size_t size)
 {
-	struct pci_controller *hose = bus->uclass_priv;
+	struct pci_controller *hose = dev_get_uclass_priv(bus);
 
 	return pci_bus_read_config(hose->ctlr, bdf, offset, valuep, size);
 }
@@ -1118,7 +1118,7 @@ static int pci_bridge_write_config(struct udevice *bus, pci_dev_t bdf,
 				   uint offset, ulong value,
 				   enum pci_size_t size)
 {
-	struct pci_controller *hose = bus->uclass_priv;
+	struct pci_controller *hose = dev_get_uclass_priv(bus);
 
 	return pci_bus_write_config(hose->ctlr, bdf, offset, value, size);
 }
diff --git a/drivers/pinctrl/pinctrl-qe-io.c b/drivers/pinctrl/pinctrl-qe-io.c
index 690e5c77062..e129ab2f831 100644
--- a/drivers/pinctrl/pinctrl-qe-io.c
+++ b/drivers/pinctrl/pinctrl-qe-io.c
@@ -122,7 +122,7 @@ void qe_config_iopin(u8 port, u8 pin, int dir, int open_drain, int assign)
 #else
 static int qe_io_of_to_plat(struct udevice *dev)
 {
-	struct qe_io_plat *plat = dev->plat;
+	struct qe_io_plat *plat = dev_get_plat(dev);
 	fdt_addr_t addr;
 
 	addr = dev_read_addr(dev);
@@ -143,7 +143,7 @@ static int qe_io_of_to_plat(struct udevice *dev)
  */
 static int par_io_of_config_node(struct udevice *dev, ofnode pio)
 {
-	struct qe_io_plat *plat = dev->plat;
+	struct qe_io_plat *plat = dev_get_plat(dev);
 	qepio83xx_t *par_io = plat->base;
 	const unsigned int *pio_map;
 	int pio_map_len;
diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 25d646a26f7..20c3c82aa98 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -47,7 +47,7 @@ static int single_configure_pins(struct udevice *dev,
 				 const struct single_fdt_pin_cfg *pins,
 				 int size)
 {
-	struct single_pdata *pdata = dev->plat;
+	struct single_pdata *pdata = dev_get_plat(dev);
 	int count = size / sizeof(struct single_fdt_pin_cfg);
 	phys_addr_t n, reg;
 	u32 val;
@@ -81,7 +81,7 @@ static int single_configure_bits(struct udevice *dev,
 				 const struct single_fdt_bits_cfg *pins,
 				 int size)
 {
-	struct single_pdata *pdata = dev->plat;
+	struct single_pdata *pdata = dev_get_plat(dev);
 	int count = size / sizeof(struct single_fdt_bits_cfg);
 	phys_addr_t n, reg;
 	u32 val, mask;
@@ -153,7 +153,7 @@ static int single_of_to_plat(struct udevice *dev)
 	fdt_addr_t addr;
 	u32 of_reg[2];
 	int res;
-	struct single_pdata *pdata = dev->plat;
+	struct single_pdata *pdata = dev_get_plat(dev);
 
 	pdata->width =
 		dev_read_u32_default(dev, "pinctrl-single,register-width", 0);
diff --git a/drivers/power/regulator/da9063.c b/drivers/power/regulator/da9063.c
index 32be59e49e9..8df1abcf788 100644
--- a/drivers/power/regulator/da9063.c
+++ b/drivers/power/regulator/da9063.c
@@ -135,7 +135,7 @@ static const struct da9063_reg_info da9063_buck_info[] = {
 
 static int da9063_get_enable(struct udevice *dev)
 {
-	const struct da9063_priv *priv = dev->priv;
+	const struct da9063_priv *priv = dev_get_priv(dev);
 	const struct da9063_reg_info *info = priv->reg_info;
 	int ret;
 
@@ -148,7 +148,7 @@ static int da9063_get_enable(struct udevice *dev)
 
 static int da9063_set_enable(struct udevice *dev, bool enable)
 {
-	const struct da9063_priv *priv = dev->priv;
+	const struct da9063_priv *priv = dev_get_priv(dev);
 	const struct da9063_reg_info *info = priv->reg_info;
 
 	return pmic_clrsetbits(dev->parent, info->en_reg,
@@ -157,7 +157,7 @@ static int da9063_set_enable(struct udevice *dev, bool enable)
 
 static int da9063_get_voltage(struct udevice *dev)
 {
-	const struct da9063_priv *priv = dev->priv;
+	const struct da9063_priv *priv = dev_get_priv(dev);
 	const struct da9063_reg_info *info = priv->reg_info;
 	int ret;
 
@@ -170,7 +170,7 @@ static int da9063_get_voltage(struct udevice *dev)
 
 static int da9063_set_voltage(struct udevice *dev, int uV)
 {
-	const struct da9063_priv *priv = dev->priv;
+	const struct da9063_priv *priv = dev_get_priv(dev);
 	const struct da9063_reg_info *info = priv->reg_info;
 	uint sel;
 
@@ -198,7 +198,7 @@ static const struct dm_regulator_mode
 
 static int ldo_get_mode(struct udevice *dev)
 {
-	const struct da9063_priv *priv = dev->priv;
+	const struct da9063_priv *priv = dev_get_priv(dev);
 	const struct da9063_reg_info *info = priv->reg_info;
 	int val;
 
@@ -214,7 +214,7 @@ static int ldo_get_mode(struct udevice *dev)
 
 static int ldo_set_mode(struct udevice *dev, int mode_id)
 {
-	const struct da9063_priv *priv = dev->priv;
+	const struct da9063_priv *priv = dev_get_priv(dev);
 	const struct da9063_reg_info *info = priv->reg_info;
 	const struct dm_regulator_mode *mode;
 
@@ -230,7 +230,7 @@ static int ldo_set_mode(struct udevice *dev, int mode_id)
 
 static int buck_get_mode(struct udevice *dev)
 {
-	const struct da9063_priv *priv = dev->priv;
+	const struct da9063_priv *priv = dev_get_priv(dev);
 	const struct da9063_reg_info *info = priv->reg_info;
 	int i;
 	int val;
@@ -261,7 +261,7 @@ static int buck_get_mode(struct udevice *dev)
 
 static int buck_set_mode(struct udevice *dev, int mode_id)
 {
-	const struct da9063_priv *priv = dev->priv;
+	const struct da9063_priv *priv = dev_get_priv(dev);
 	const struct da9063_reg_info *info = priv->reg_info;
 	const struct dm_regulator_mode *mode;
 
@@ -277,7 +277,7 @@ static int buck_set_mode(struct udevice *dev, int mode_id)
 
 static int buck_get_current_limit(struct udevice *dev)
 {
-	const struct da9063_priv *priv = dev->priv;
+	const struct da9063_priv *priv = dev_get_priv(dev);
 	const struct da9063_reg_info *info = priv->reg_info;
 	int val;
 
@@ -293,7 +293,7 @@ static int buck_get_current_limit(struct udevice *dev)
 
 static int buck_set_current_limit(struct udevice *dev, int uA)
 {
-	const struct da9063_priv *priv = dev->priv;
+	const struct da9063_priv *priv = dev_get_priv(dev);
 	const struct da9063_reg_info *info = priv->reg_info;
 	int val;
 
@@ -310,7 +310,7 @@ static int buck_set_current_limit(struct udevice *dev, int uA)
 static int da9063_ldo_probe(struct udevice *dev)
 {
 	struct dm_regulator_uclass_plat *uc_pdata;
-	struct da9063_priv *priv = dev->priv;
+	struct da9063_priv *priv = dev_get_priv(dev);
 
 	/* LDOs are named numerically in DT so can directly index */
 	if (dev->driver_data < 1 ||
@@ -329,7 +329,7 @@ static int da9063_ldo_probe(struct udevice *dev)
 static int da9063_buck_probe(struct udevice *dev)
 {
 	struct dm_regulator_uclass_plat *uc_pdata;
-	struct da9063_priv *priv = dev->priv;
+	struct da9063_priv *priv = dev_get_priv(dev);
 	int i;
 
 	/* Bucks have names rather than numbers so need to match with DT */
diff --git a/drivers/power/regulator/pbias_regulator.c b/drivers/power/regulator/pbias_regulator.c
index c3df156749f..6f0d0a59ff4 100644
--- a/drivers/power/regulator/pbias_regulator.c
+++ b/drivers/power/regulator/pbias_regulator.c
@@ -16,6 +16,7 @@
 #include <syscon.h>
 #include <linux/bitops.h>
 #include <linux/ioport.h>
+#include <dm/device-internal.h>
 #include <dm/read.h>
 #ifdef CONFIG_MMC_OMAP36XX_PINS
 #include <asm/arch/sys_proto.h>
@@ -208,7 +209,7 @@ static int pbias_regulator_probe(struct udevice *dev)
 	}
 
 	uc_pdata->type = REGULATOR_TYPE_OTHER;
-	dev->priv = (void *)*p;
+	dev_set_priv(dev, (void *)*p);
 
 	return 0;
 }
diff --git a/drivers/remoteproc/rproc-uclass.c b/drivers/remoteproc/rproc-uclass.c
index ccc910e7c74..773b8119f4f 100644
--- a/drivers/remoteproc/rproc-uclass.c
+++ b/drivers/remoteproc/rproc-uclass.c
@@ -115,7 +115,7 @@ static int rproc_pre_probe(struct udevice *dev)
 
 	/* See if we need to populate via fdt */
 
-	if (!dev->plat) {
+	if (!dev_get_plat(dev)) {
 #if CONFIG_IS_ENABLED(OF_CONTROL)
 		int node = dev_of_offset(dev);
 		const void *blob = gd->fdt_blob;
@@ -140,7 +140,7 @@ static int rproc_pre_probe(struct udevice *dev)
 #endif
 
 	} else {
-		struct dm_rproc_uclass_pdata *pdata = dev->plat;
+		struct dm_rproc_uclass_pdata *pdata = dev_get_plat(dev);
 
 		debug("'%s': using legacy data\n", dev->name);
 		if (pdata->name)
diff --git a/drivers/reset/reset-mediatek.c b/drivers/reset/reset-mediatek.c
index b97a21f6717..7427013ab60 100644
--- a/drivers/reset/reset-mediatek.c
+++ b/drivers/reset/reset-mediatek.c
@@ -14,6 +14,7 @@
 #include <regmap.h>
 #include <reset-uclass.h>
 #include <syscon.h>
+#include <dm/device-internal.h>
 #include <linux/bitops.h>
 #include <linux/err.h>
 
@@ -92,7 +93,7 @@ int mediatek_reset_bind(struct udevice *pdev, u32 regofs, u32 num_regs)
 	priv = malloc(sizeof(struct mediatek_reset_priv));
 	priv->regofs = regofs;
 	priv->nr_resets = num_regs * 32;
-	rst_dev->priv = priv;
+	dev_set_priv(rst_dev, priv);
 
 	return 0;
 }
diff --git a/drivers/reset/reset-rockchip.c b/drivers/reset/reset-rockchip.c
index e5e9918c0c1..eeb3d2eea77 100644
--- a/drivers/reset/reset-rockchip.c
+++ b/drivers/reset/reset-rockchip.c
@@ -11,6 +11,7 @@
 #include <linux/bitops.h>
 #include <linux/io.h>
 #include <asm/arch-rockchip/hardware.h>
+#include <dm/device-internal.h>
 #include <dm/lists.h>
 /*
  * Each reg has 16 bits reset signal for devices
@@ -121,7 +122,7 @@ int rockchip_reset_bind(struct udevice *pdev, u32 reg_offset, u32 reg_number)
 	priv = malloc(sizeof(struct rockchip_reset_priv));
 	priv->reset_reg_offset = reg_offset;
 	priv->reset_reg_num = reg_number;
-	rst_dev->priv = priv;
+	dev_set_priv(rst_dev, priv);
 
 	return 0;
 }
diff --git a/drivers/reset/reset-sifive.c b/drivers/reset/reset-sifive.c
index f6110d85f9f..eec840d677f 100644
--- a/drivers/reset/reset-sifive.c
+++ b/drivers/reset/reset-sifive.c
@@ -9,6 +9,7 @@
 #include <reset-uclass.h>
 #include <asm/io.h>
 #include <dm/device_compat.h>
+#include <dm/device-internal.h>
 #include <dm/lists.h>
 #include <linux/bitops.h>
 
@@ -97,7 +98,7 @@ int sifive_reset_bind(struct udevice *dev, ulong count)
 	}
 	priv = malloc(sizeof(struct sifive_reset_priv));
 	priv->nr_reset = count;
-	rst_dev->priv = priv;
+	dev_set_priv(rst_dev, priv);
 
 	return 0;
 }
diff --git a/drivers/reset/reset-sunxi.c b/drivers/reset/reset-sunxi.c
index 1db321ce1fd..264337ed803 100644
--- a/drivers/reset/reset-sunxi.c
+++ b/drivers/reset/reset-sunxi.c
@@ -11,6 +11,7 @@
 #include <malloc.h>
 #include <reset-uclass.h>
 #include <asm/io.h>
+#include <dm/device-internal.h>
 #include <dm/lists.h>
 #include <linux/bitops.h>
 #include <linux/log2.h>
@@ -113,7 +114,7 @@ int sunxi_reset_bind(struct udevice *dev, ulong count)
 	priv = malloc(sizeof(struct sunxi_reset_priv));
 	priv->count = count;
 	priv->desc = (const struct ccu_desc *)dev_get_driver_data(dev);
-	rst_dev->priv = priv;
+	dev_set_priv(rst_dev, priv);
 
 	return 0;
 }
diff --git a/drivers/serial/altera_jtag_uart.c b/drivers/serial/altera_jtag_uart.c
index 0d3ccd880ca..4435fcf56b9 100644
--- a/drivers/serial/altera_jtag_uart.c
+++ b/drivers/serial/altera_jtag_uart.c
@@ -37,7 +37,7 @@ static int altera_jtaguart_setbrg(struct udevice *dev, int baudrate)
 
 static int altera_jtaguart_putc(struct udevice *dev, const char ch)
 {
-	struct altera_jtaguart_plat *plat = dev->plat;
+	struct altera_jtaguart_plat *plat = dev_get_plat(dev);
 	struct altera_jtaguart_regs *const regs = plat->regs;
 	u32 st = readl(&regs->control);
 
@@ -56,7 +56,7 @@ static int altera_jtaguart_putc(struct udevice *dev, const char ch)
 
 static int altera_jtaguart_pending(struct udevice *dev, bool input)
 {
-	struct altera_jtaguart_plat *plat = dev->plat;
+	struct altera_jtaguart_plat *plat = dev_get_plat(dev);
 	struct altera_jtaguart_regs *const regs = plat->regs;
 	u32 st = readl(&regs->control);
 
@@ -68,7 +68,7 @@ static int altera_jtaguart_pending(struct udevice *dev, bool input)
 
 static int altera_jtaguart_getc(struct udevice *dev)
 {
-	struct altera_jtaguart_plat *plat = dev->plat;
+	struct altera_jtaguart_plat *plat = dev_get_plat(dev);
 	struct altera_jtaguart_regs *const regs = plat->regs;
 	u32 val;
 
@@ -83,7 +83,7 @@ static int altera_jtaguart_getc(struct udevice *dev)
 static int altera_jtaguart_probe(struct udevice *dev)
 {
 #ifdef CONFIG_ALTERA_JTAG_UART_BYPASS
-	struct altera_jtaguart_plat *plat = dev->plat;
+	struct altera_jtaguart_plat *plat = dev_get_plat(dev);
 	struct altera_jtaguart_regs *const regs = plat->regs;
 
 	writel(ALTERA_JTAG_AC, &regs->control); /* clear AC flag */
diff --git a/drivers/serial/altera_uart.c b/drivers/serial/altera_uart.c
index a3efa1ee1b5..b18be6e2454 100644
--- a/drivers/serial/altera_uart.c
+++ b/drivers/serial/altera_uart.c
@@ -32,7 +32,7 @@ struct altera_uart_plat {
 
 static int altera_uart_setbrg(struct udevice *dev, int baudrate)
 {
-	struct altera_uart_plat *plat = dev->plat;
+	struct altera_uart_plat *plat = dev_get_plat(dev);
 	struct altera_uart_regs *const regs = plat->regs;
 	u32 div;
 
@@ -44,7 +44,7 @@ static int altera_uart_setbrg(struct udevice *dev, int baudrate)
 
 static int altera_uart_putc(struct udevice *dev, const char ch)
 {
-	struct altera_uart_plat *plat = dev->plat;
+	struct altera_uart_plat *plat = dev_get_plat(dev);
 	struct altera_uart_regs *const regs = plat->regs;
 
 	if (!(readl(&regs->status) & ALTERA_UART_TRDY))
@@ -57,7 +57,7 @@ static int altera_uart_putc(struct udevice *dev, const char ch)
 
 static int altera_uart_pending(struct udevice *dev, bool input)
 {
-	struct altera_uart_plat *plat = dev->plat;
+	struct altera_uart_plat *plat = dev_get_plat(dev);
 	struct altera_uart_regs *const regs = plat->regs;
 	u32 st = readl(&regs->status);
 
@@ -69,7 +69,7 @@ static int altera_uart_pending(struct udevice *dev, bool input)
 
 static int altera_uart_getc(struct udevice *dev)
 {
-	struct altera_uart_plat *plat = dev->plat;
+	struct altera_uart_plat *plat = dev_get_plat(dev);
 	struct altera_uart_regs *const regs = plat->regs;
 
 	if (!(readl(&regs->status) & ALTERA_UART_RRDY))
diff --git a/drivers/serial/atmel_usart.c b/drivers/serial/atmel_usart.c
index 7eabf76d92e..7edec23e648 100644
--- a/drivers/serial/atmel_usart.c
+++ b/drivers/serial/atmel_usart.c
@@ -262,7 +262,7 @@ static int atmel_serial_enable_clk(struct udevice *dev)
 
 static int atmel_serial_probe(struct udevice *dev)
 {
-	struct atmel_serial_plat *plat = dev->plat;
+	struct atmel_serial_plat *plat = dev_get_plat(dev);
 	struct atmel_serial_priv *priv = dev_get_priv(dev);
 	int ret;
 #if CONFIG_IS_ENABLED(OF_CONTROL)
diff --git a/drivers/serial/ns16550.c b/drivers/serial/ns16550.c
index 17808fb70a5..508c134b94f 100644
--- a/drivers/serial/ns16550.c
+++ b/drivers/serial/ns16550.c
@@ -498,7 +498,7 @@ static int ns16550_serial_assign_base(struct ns16550_plat *plat, ulong base)
 
 int ns16550_serial_probe(struct udevice *dev)
 {
-	struct ns16550_plat *plat = dev->plat;
+	struct ns16550_plat *plat = dev_get_plat(dev);
 	struct ns16550 *const com_port = dev_get_priv(dev);
 	struct reset_ctl_bulk reset_bulk;
 	fdt_addr_t addr;
@@ -535,7 +535,7 @@ enum {
 #if CONFIG_IS_ENABLED(OF_CONTROL) && !CONFIG_IS_ENABLED(OF_PLATDATA)
 int ns16550_serial_of_to_plat(struct udevice *dev)
 {
-	struct ns16550_plat *plat = dev->plat;
+	struct ns16550_plat *plat = dev_get_plat(dev);
 	const u32 port_type = dev_get_driver_data(dev);
 	fdt_addr_t addr;
 	struct clk clk;
diff --git a/drivers/serial/sandbox.c b/drivers/serial/sandbox.c
index c7d5390b435..a05c56458b0 100644
--- a/drivers/serial/sandbox.c
+++ b/drivers/serial/sandbox.c
@@ -72,7 +72,7 @@ static int sandbox_serial_probe(struct udevice *dev)
 
 static int sandbox_serial_remove(struct udevice *dev)
 {
-	struct sandbox_serial_plat *plat = dev->plat;
+	struct sandbox_serial_plat *plat = dev_get_plat(dev);
 
 	if (plat->colour != -1)
 		output_ansi_reset();
@@ -83,7 +83,7 @@ static int sandbox_serial_remove(struct udevice *dev)
 static int sandbox_serial_putc(struct udevice *dev, const char ch)
 {
 	struct sandbox_serial_priv *priv = dev_get_priv(dev);
-	struct sandbox_serial_plat *plat = dev->plat;
+	struct sandbox_serial_plat *plat = dev_get_plat(dev);
 
 	/* With of-platdata we don't real the colour correctly, so disable it */
 	if (!CONFIG_IS_ENABLED(OF_PLATDATA) && priv->start_of_line &&
@@ -203,7 +203,7 @@ static const char * const ansi_colour[] = {
 
 static int sandbox_serial_of_to_plat(struct udevice *dev)
 {
-	struct sandbox_serial_plat *plat = dev->plat;
+	struct sandbox_serial_plat *plat = dev_get_plat(dev);
 	const char *colour;
 	int i;
 
diff --git a/drivers/serial/serial_arc.c b/drivers/serial/serial_arc.c
index 022e37748c8..445eacc8aac 100644
--- a/drivers/serial/serial_arc.c
+++ b/drivers/serial/serial_arc.c
@@ -37,7 +37,7 @@ struct arc_serial_plat {
 
 static int arc_serial_setbrg(struct udevice *dev, int baudrate)
 {
-	struct arc_serial_plat *plat = dev->plat;
+	struct arc_serial_plat *plat = dev_get_plat(dev);
 	struct arc_serial_regs *const regs = plat->reg;
 	int arc_console_baud = gd->cpu_clk / (baudrate * 4) - 1;
 
@@ -49,7 +49,7 @@ static int arc_serial_setbrg(struct udevice *dev, int baudrate)
 
 static int arc_serial_putc(struct udevice *dev, const char c)
 {
-	struct arc_serial_plat *plat = dev->plat;
+	struct arc_serial_plat *plat = dev_get_plat(dev);
 	struct arc_serial_regs *const regs = plat->reg;
 
 	while (!(readb(&regs->status) & UART_TXEMPTY))
@@ -67,7 +67,7 @@ static int arc_serial_tstc(struct arc_serial_regs *const regs)
 
 static int arc_serial_pending(struct udevice *dev, bool input)
 {
-	struct arc_serial_plat *plat = dev->plat;
+	struct arc_serial_plat *plat = dev_get_plat(dev);
 	struct arc_serial_regs *const regs = plat->reg;
 	uint32_t status = readb(&regs->status);
 
@@ -79,7 +79,7 @@ static int arc_serial_pending(struct udevice *dev, bool input)
 
 static int arc_serial_getc(struct udevice *dev)
 {
-	struct arc_serial_plat *plat = dev->plat;
+	struct arc_serial_plat *plat = dev_get_plat(dev);
 	struct arc_serial_regs *const regs = plat->reg;
 
 	while (!arc_serial_tstc(regs))
diff --git a/drivers/serial/serial_linflexuart.c b/drivers/serial/serial_linflexuart.c
index ced005706ae..c3714e1e1ec 100644
--- a/drivers/serial/serial_linflexuart.c
+++ b/drivers/serial/serial_linflexuart.c
@@ -168,7 +168,7 @@ static void linflex_serial_init_internal(struct linflex_fsl *lfuart)
 
 static int linflex_serial_probe(struct udevice *dev)
 {
-	struct linflex_serial_plat *plat = dev->plat;
+	struct linflex_serial_plat *plat = dev_get_plat(dev);
 	struct linflex_serial_priv *priv = dev_get_priv(dev);
 
 	priv->lfuart = (struct linflex_fsl *)plat->base_addr;
diff --git a/drivers/serial/serial_lpuart.c b/drivers/serial/serial_lpuart.c
index 5beb5f2ce64..a35e5be303f 100644
--- a/drivers/serial/serial_lpuart.c
+++ b/drivers/serial/serial_lpuart.c
@@ -138,7 +138,7 @@ static inline int get_lpuart_clk_rate(struct udevice *dev, u32 *clk)
 
 static bool is_lpuart32(struct udevice *dev)
 {
-	struct lpuart_serial_plat *plat = dev->plat;
+	struct lpuart_serial_plat *plat = dev_get_plat(dev);
 
 	return plat->flags & LPUART_FLAG_REGMAP_32BIT_REG;
 }
@@ -445,7 +445,7 @@ static int lpuart_serial_setbrg(struct udevice *dev, int baudrate)
 
 static int lpuart_serial_getc(struct udevice *dev)
 {
-	struct lpuart_serial_plat *plat = dev->plat;
+	struct lpuart_serial_plat *plat = dev_get_plat(dev);
 
 	if (is_lpuart32(dev))
 		return _lpuart32_serial_getc(plat);
@@ -455,7 +455,7 @@ static int lpuart_serial_getc(struct udevice *dev)
 
 static int lpuart_serial_putc(struct udevice *dev, const char c)
 {
-	struct lpuart_serial_plat *plat = dev->plat;
+	struct lpuart_serial_plat *plat = dev_get_plat(dev);
 
 	if (is_lpuart32(dev))
 		_lpuart32_serial_putc(plat, c);
@@ -467,7 +467,7 @@ static int lpuart_serial_putc(struct udevice *dev, const char c)
 
 static int lpuart_serial_pending(struct udevice *dev, bool input)
 {
-	struct lpuart_serial_plat *plat = dev->plat;
+	struct lpuart_serial_plat *plat = dev_get_plat(dev);
 	struct lpuart_fsl *reg = plat->reg;
 	struct lpuart_fsl_reg32 *reg32 = plat->reg;
 	u32 stat;
@@ -513,7 +513,7 @@ static int lpuart_serial_probe(struct udevice *dev)
 
 static int lpuart_serial_of_to_plat(struct udevice *dev)
 {
-	struct lpuart_serial_plat *plat = dev->plat;
+	struct lpuart_serial_plat *plat = dev_get_plat(dev);
 	const void *blob = gd->fdt_blob;
 	int node = dev_of_offset(dev);
 	fdt_addr_t addr;
diff --git a/drivers/serial/serial_mcf.c b/drivers/serial/serial_mcf.c
index 4ba6dc32f92..e6e21b2ce8c 100644
--- a/drivers/serial/serial_mcf.c
+++ b/drivers/serial/serial_mcf.c
@@ -83,7 +83,7 @@ static void mcf_serial_setbrg_common(uart_t *uart, int baudrate)
 
 static int coldfire_serial_probe(struct udevice *dev)
 {
-	struct coldfire_serial_plat *plat = dev->plat;
+	struct coldfire_serial_plat *plat = dev_get_plat(dev);
 
 	plat->port = dev_seq(dev);
 
@@ -93,7 +93,7 @@ static int coldfire_serial_probe(struct udevice *dev)
 
 static int coldfire_serial_putc(struct udevice *dev, const char ch)
 {
-	struct coldfire_serial_plat *plat = dev->plat;
+	struct coldfire_serial_plat *plat = dev_get_plat(dev);
 	uart_t *uart = (uart_t *)plat->base;
 
 	/* Wait for last character to go. */
@@ -107,7 +107,7 @@ static int coldfire_serial_putc(struct udevice *dev, const char ch)
 
 static int coldfire_serial_getc(struct udevice *dev)
 {
-	struct coldfire_serial_plat *plat = dev->plat;
+	struct coldfire_serial_plat *plat = dev_get_plat(dev);
 	uart_t *uart = (uart_t *)(plat->base);
 
 	/* Wait for a character to arrive. */
@@ -119,7 +119,7 @@ static int coldfire_serial_getc(struct udevice *dev)
 
 int coldfire_serial_setbrg(struct udevice *dev, int baudrate)
 {
-	struct coldfire_serial_plat *plat = dev->plat;
+	struct coldfire_serial_plat *plat = dev_get_plat(dev);
 	uart_t *uart = (uart_t *)(plat->base);
 
 	mcf_serial_setbrg_common(uart, baudrate);
@@ -129,7 +129,7 @@ int coldfire_serial_setbrg(struct udevice *dev, int baudrate)
 
 static int coldfire_serial_pending(struct udevice *dev, bool input)
 {
-	struct coldfire_serial_plat *plat = dev->plat;
+	struct coldfire_serial_plat *plat = dev_get_plat(dev);
 	uart_t *uart = (uart_t *)(plat->base);
 
 	if (input)
diff --git a/drivers/serial/serial_meson.c b/drivers/serial/serial_meson.c
index 40d9bfe7c6f..d69ec221e45 100644
--- a/drivers/serial/serial_meson.c
+++ b/drivers/serial/serial_meson.c
@@ -57,7 +57,7 @@ static void meson_serial_init(struct meson_uart *uart)
 
 static int meson_serial_probe(struct udevice *dev)
 {
-	struct meson_serial_plat *plat = dev->plat;
+	struct meson_serial_plat *plat = dev_get_plat(dev);
 	struct meson_uart *const uart = plat->reg;
 
 	meson_serial_init(uart);
@@ -67,7 +67,7 @@ static int meson_serial_probe(struct udevice *dev)
 
 static void meson_serial_rx_error(struct udevice *dev)
 {
-	struct meson_serial_plat *plat = dev->plat;
+	struct meson_serial_plat *plat = dev_get_plat(dev);
 	struct meson_uart *const uart = plat->reg;
 	u32 val = readl(&uart->control);
 
@@ -83,7 +83,7 @@ static void meson_serial_rx_error(struct udevice *dev)
 
 static int meson_serial_getc(struct udevice *dev)
 {
-	struct meson_serial_plat *plat = dev->plat;
+	struct meson_serial_plat *plat = dev_get_plat(dev);
 	struct meson_uart *const uart = plat->reg;
 	uint32_t status = readl(&uart->status);
 
@@ -100,7 +100,7 @@ static int meson_serial_getc(struct udevice *dev)
 
 static int meson_serial_putc(struct udevice *dev, const char ch)
 {
-	struct meson_serial_plat *plat = dev->plat;
+	struct meson_serial_plat *plat = dev_get_plat(dev);
 	struct meson_uart *const uart = plat->reg;
 
 	if (readl(&uart->status) & AML_UART_TX_FULL)
@@ -113,7 +113,7 @@ static int meson_serial_putc(struct udevice *dev, const char ch)
 
 static int meson_serial_pending(struct udevice *dev, bool input)
 {
-	struct meson_serial_plat *plat = dev->plat;
+	struct meson_serial_plat *plat = dev_get_plat(dev);
 	struct meson_uart *const uart = plat->reg;
 	uint32_t status = readl(&uart->status);
 
@@ -138,7 +138,7 @@ static int meson_serial_pending(struct udevice *dev, bool input)
 
 static int meson_serial_of_to_plat(struct udevice *dev)
 {
-	struct meson_serial_plat *plat = dev->plat;
+	struct meson_serial_plat *plat = dev_get_plat(dev);
 	fdt_addr_t addr;
 
 	addr = dev_read_addr(dev);
diff --git a/drivers/serial/serial_mxc.c b/drivers/serial/serial_mxc.c
index 2603fa8611a..e5795da99d9 100644
--- a/drivers/serial/serial_mxc.c
+++ b/drivers/serial/serial_mxc.c
@@ -264,7 +264,7 @@ __weak struct serial_device *default_serial_console(void)
 
 int mxc_serial_setbrg(struct udevice *dev, int baudrate)
 {
-	struct mxc_serial_plat *plat = dev->plat;
+	struct mxc_serial_plat *plat = dev_get_plat(dev);
 	u32 clk = imx_get_uartclk();
 
 	_mxc_serial_setbrg(plat->reg, clk, baudrate, plat->use_dte);
@@ -274,7 +274,7 @@ int mxc_serial_setbrg(struct udevice *dev, int baudrate)
 
 static int mxc_serial_probe(struct udevice *dev)
 {
-	struct mxc_serial_plat *plat = dev->plat;
+	struct mxc_serial_plat *plat = dev_get_plat(dev);
 
 	_mxc_serial_init(plat->reg, plat->use_dte);
 
@@ -283,7 +283,7 @@ static int mxc_serial_probe(struct udevice *dev)
 
 static int mxc_serial_getc(struct udevice *dev)
 {
-	struct mxc_serial_plat *plat = dev->plat;
+	struct mxc_serial_plat *plat = dev_get_plat(dev);
 	struct mxc_uart *const uart = plat->reg;
 
 	if (readl(&uart->ts) & UTS_RXEMPTY)
@@ -294,7 +294,7 @@ static int mxc_serial_getc(struct udevice *dev)
 
 static int mxc_serial_putc(struct udevice *dev, const char ch)
 {
-	struct mxc_serial_plat *plat = dev->plat;
+	struct mxc_serial_plat *plat = dev_get_plat(dev);
 	struct mxc_uart *const uart = plat->reg;
 
 	if (!(readl(&uart->ts) & UTS_TXEMPTY))
@@ -307,7 +307,7 @@ static int mxc_serial_putc(struct udevice *dev, const char ch)
 
 static int mxc_serial_pending(struct udevice *dev, bool input)
 {
-	struct mxc_serial_plat *plat = dev->plat;
+	struct mxc_serial_plat *plat = dev_get_plat(dev);
 	struct mxc_uart *const uart = plat->reg;
 	uint32_t sr2 = readl(&uart->sr2);
 
@@ -327,7 +327,7 @@ static const struct dm_serial_ops mxc_serial_ops = {
 #if CONFIG_IS_ENABLED(OF_CONTROL)
 static int mxc_serial_of_to_plat(struct udevice *dev)
 {
-	struct mxc_serial_plat *plat = dev->plat;
+	struct mxc_serial_plat *plat = dev_get_plat(dev);
 	fdt_addr_t addr;
 
 	addr = dev_read_addr(dev);
diff --git a/drivers/serial/serial_omap.c b/drivers/serial/serial_omap.c
index c2352155413..2b23ece442e 100644
--- a/drivers/serial/serial_omap.c
+++ b/drivers/serial/serial_omap.c
@@ -101,7 +101,7 @@ DEBUG_UART_FUNCS
 #if CONFIG_IS_ENABLED(OF_CONTROL) && !CONFIG_IS_ENABLED(OF_PLATDATA)
 static int omap_serial_of_to_plat(struct udevice *dev)
 {
-	struct ns16550_plat *plat = dev->plat;
+	struct ns16550_plat *plat = dev_get_plat(dev);
 	fdt_addr_t addr;
 	struct clk clk;
 	int err;
diff --git a/drivers/serial/serial_pxa.c b/drivers/serial/serial_pxa.c
index d82f3b97529..669841ede4d 100644
--- a/drivers/serial/serial_pxa.c
+++ b/drivers/serial/serial_pxa.c
@@ -268,7 +268,7 @@ void pxa_serial_initialize(void)
 #ifdef CONFIG_DM_SERIAL
 static int pxa_serial_probe(struct udevice *dev)
 {
-	struct pxa_serial_plat *plat = dev->plat;
+	struct pxa_serial_plat *plat = dev_get_plat(dev);
 
 	pxa_setbrg_common((struct pxa_uart_regs *)plat->base, plat->port,
 			  plat->baudrate);
@@ -277,7 +277,7 @@ static int pxa_serial_probe(struct udevice *dev)
 
 static int pxa_serial_putc(struct udevice *dev, const char ch)
 {
-	struct pxa_serial_plat *plat = dev->plat;
+	struct pxa_serial_plat *plat = dev_get_plat(dev);
 	struct pxa_uart_regs *uart_regs = (struct pxa_uart_regs *)plat->base;
 
 	/* Wait for last character to go. */
@@ -291,7 +291,7 @@ static int pxa_serial_putc(struct udevice *dev, const char ch)
 
 static int pxa_serial_getc(struct udevice *dev)
 {
-	struct pxa_serial_plat *plat = dev->plat;
+	struct pxa_serial_plat *plat = dev_get_plat(dev);
 	struct pxa_uart_regs *uart_regs = (struct pxa_uart_regs *)plat->base;
 
 	/* Wait for a character to arrive. */
@@ -303,7 +303,7 @@ static int pxa_serial_getc(struct udevice *dev)
 
 int pxa_serial_setbrg(struct udevice *dev, int baudrate)
 {
-	struct pxa_serial_plat *plat = dev->plat;
+	struct pxa_serial_plat *plat = dev_get_plat(dev);
 	struct pxa_uart_regs *uart_regs = (struct pxa_uart_regs *)plat->base;
 	int port = plat->port;
 
@@ -314,7 +314,7 @@ int pxa_serial_setbrg(struct udevice *dev, int baudrate)
 
 static int pxa_serial_pending(struct udevice *dev, bool input)
 {
-	struct pxa_serial_plat *plat = dev->plat;
+	struct pxa_serial_plat *plat = dev_get_plat(dev);
 	struct pxa_uart_regs *uart_regs = (struct pxa_uart_regs *)plat->base;
 
 	if (input)
diff --git a/drivers/serial/serial_rockchip.c b/drivers/serial/serial_rockchip.c
index 036c07262be..97d40869a2a 100644
--- a/drivers/serial/serial_rockchip.c
+++ b/drivers/serial/serial_rockchip.c
@@ -10,6 +10,7 @@
 #include <ns16550.h>
 #include <serial.h>
 #include <asm/arch-rockchip/clock.h>
+#include <dm/device-internal.h>
 
 #if defined(CONFIG_ROCKCHIP_RK3188)
 struct rockchip_uart_plat {
@@ -34,7 +35,7 @@ static int rockchip_serial_probe(struct udevice *dev)
 	plat->plat.reg_shift = plat->dtplat.reg_shift;
 	plat->plat.clock = plat->dtplat.clock_frequency;
 	plat->plat.fcr = UART_FCR_DEFVAL;
-	dev->plat = &plat->plat;
+	dev_set_plat(dev, &plat->plat);
 
 	return ns16550_serial_probe(dev);
 }
diff --git a/drivers/serial/serial_s5p.c b/drivers/serial/serial_s5p.c
index 120df835dbd..0eac0d53a50 100644
--- a/drivers/serial/serial_s5p.c
+++ b/drivers/serial/serial_s5p.c
@@ -88,7 +88,7 @@ static void __maybe_unused s5p_serial_baud(struct s5p_uart *uart, uint uclk,
 #ifndef CONFIG_SPL_BUILD
 int s5p_serial_setbrg(struct udevice *dev, int baudrate)
 {
-	struct s5p_serial_plat *plat = dev->plat;
+	struct s5p_serial_plat *plat = dev_get_plat(dev);
 	struct s5p_uart *const uart = plat->reg;
 	u32 uclk;
 
@@ -111,7 +111,7 @@ int s5p_serial_setbrg(struct udevice *dev, int baudrate)
 
 static int s5p_serial_probe(struct udevice *dev)
 {
-	struct s5p_serial_plat *plat = dev->plat;
+	struct s5p_serial_plat *plat = dev_get_plat(dev);
 	struct s5p_uart *const uart = plat->reg;
 
 	s5p_serial_init(uart);
@@ -140,7 +140,7 @@ static int serial_err_check(const struct s5p_uart *const uart, int op)
 
 static int s5p_serial_getc(struct udevice *dev)
 {
-	struct s5p_serial_plat *plat = dev->plat;
+	struct s5p_serial_plat *plat = dev_get_plat(dev);
 	struct s5p_uart *const uart = plat->reg;
 
 	if (!(readl(&uart->ufstat) & RX_FIFO_COUNT_MASK))
@@ -152,7 +152,7 @@ static int s5p_serial_getc(struct udevice *dev)
 
 static int s5p_serial_putc(struct udevice *dev, const char ch)
 {
-	struct s5p_serial_plat *plat = dev->plat;
+	struct s5p_serial_plat *plat = dev_get_plat(dev);
 	struct s5p_uart *const uart = plat->reg;
 
 	if (readl(&uart->ufstat) & TX_FIFO_FULL)
@@ -166,7 +166,7 @@ static int s5p_serial_putc(struct udevice *dev, const char ch)
 
 static int s5p_serial_pending(struct udevice *dev, bool input)
 {
-	struct s5p_serial_plat *plat = dev->plat;
+	struct s5p_serial_plat *plat = dev_get_plat(dev);
 	struct s5p_uart *const uart = plat->reg;
 	uint32_t ufstat = readl(&uart->ufstat);
 
@@ -178,7 +178,7 @@ static int s5p_serial_pending(struct udevice *dev, bool input)
 
 static int s5p_serial_of_to_plat(struct udevice *dev)
 {
-	struct s5p_serial_plat *plat = dev->plat;
+	struct s5p_serial_plat *plat = dev_get_plat(dev);
 	fdt_addr_t addr;
 
 	addr = dev_read_addr(dev);
diff --git a/drivers/spi/cadence_qspi.c b/drivers/spi/cadence_qspi.c
index b746501f5ff..67980431ba0 100644
--- a/drivers/spi/cadence_qspi.c
+++ b/drivers/spi/cadence_qspi.c
@@ -27,7 +27,7 @@
 
 static int cadence_spi_write_speed(struct udevice *bus, uint hz)
 {
-	struct cadence_spi_plat *plat = bus->plat;
+	struct cadence_spi_plat *plat = dev_get_plat(bus);
 	struct cadence_spi_priv *priv = dev_get_priv(bus);
 
 	cadence_qspi_apb_config_baudrate_div(priv->regbase,
@@ -130,7 +130,7 @@ static int spi_calibration(struct udevice *bus, uint hz)
 
 static int cadence_spi_set_speed(struct udevice *bus, uint hz)
 {
-	struct cadence_spi_plat *plat = bus->plat;
+	struct cadence_spi_plat *plat = dev_get_plat(bus);
 	struct cadence_spi_priv *priv = dev_get_priv(bus);
 	int err;
 
@@ -165,7 +165,7 @@ static int cadence_spi_set_speed(struct udevice *bus, uint hz)
 
 static int cadence_spi_probe(struct udevice *bus)
 {
-	struct cadence_spi_plat *plat = bus->plat;
+	struct cadence_spi_plat *plat = dev_get_plat(bus);
 	struct cadence_spi_priv *priv = dev_get_priv(bus);
 	struct clk clk;
 	int ret;
@@ -212,7 +212,7 @@ static int cadence_spi_remove(struct udevice *dev)
 
 static int cadence_spi_set_mode(struct udevice *bus, uint mode)
 {
-	struct cadence_spi_plat *plat = bus->plat;
+	struct cadence_spi_plat *plat = dev_get_plat(bus);
 	struct cadence_spi_priv *priv = dev_get_priv(bus);
 
 	/* Disable QSPI */
@@ -235,7 +235,7 @@ static int cadence_spi_mem_exec_op(struct spi_slave *spi,
 				   const struct spi_mem_op *op)
 {
 	struct udevice *bus = spi->dev->parent;
-	struct cadence_spi_plat *plat = bus->plat;
+	struct cadence_spi_plat *plat = dev_get_plat(bus);
 	struct cadence_spi_priv *priv = dev_get_priv(bus);
 	void *base = priv->regbase;
 	int err = 0;
@@ -284,7 +284,7 @@ static int cadence_spi_mem_exec_op(struct spi_slave *spi,
 
 static int cadence_spi_of_to_plat(struct udevice *bus)
 {
-	struct cadence_spi_plat *plat = bus->plat;
+	struct cadence_spi_plat *plat = dev_get_plat(bus);
 	ofnode subnode;
 
 	plat->regbase = (void *)devfdt_get_addr_index(bus, 0);
diff --git a/drivers/spi/cf_spi.c b/drivers/spi/cf_spi.c
index 8adff63edc6..298f350ef39 100644
--- a/drivers/spi/cf_spi.c
+++ b/drivers/spi/cf_spi.c
@@ -387,7 +387,7 @@ static int coldfire_spi_probe(struct udevice *bus)
 static int coldfire_dspi_of_to_plat(struct udevice *bus)
 {
 	fdt_addr_t addr;
-	struct coldfire_spi_plat *plat = bus->plat;
+	struct coldfire_spi_plat *plat = dev_get_plat(bus);
 	const void *blob = gd->fdt_blob;
 	int node = dev_of_offset(bus);
 	int *ctar, len;
diff --git a/drivers/spi/davinci_spi.c b/drivers/spi/davinci_spi.c
index ea088ebd2cb..53a791ea292 100644
--- a/drivers/spi/davinci_spi.c
+++ b/drivers/spi/davinci_spi.c
@@ -383,7 +383,7 @@ static const struct dm_spi_ops davinci_spi_ops = {
 static int davinci_spi_probe(struct udevice *bus)
 {
 	struct davinci_spi_slave *ds = dev_get_priv(bus);
-	struct davinci_spi_plat *plat = bus->plat;
+	struct davinci_spi_plat *plat = dev_get_plat(bus);
 	ds->regs = plat->regs;
 	ds->num_cs = plat->num_cs;
 
@@ -393,7 +393,7 @@ static int davinci_spi_probe(struct udevice *bus)
 #if CONFIG_IS_ENABLED(OF_CONTROL) && !CONFIG_IS_ENABLED(OF_PLATDATA)
 static int davinci_ofdata_to_platadata(struct udevice *bus)
 {
-	struct davinci_spi_plat *plat = bus->plat;
+	struct davinci_spi_plat *plat = dev_get_plat(bus);
 	fdt_addr_t addr;
 
 	addr = dev_read_addr(bus);
diff --git a/drivers/spi/designware_spi.c b/drivers/spi/designware_spi.c
index 4fa4585fc35..5ede00d080b 100644
--- a/drivers/spi/designware_spi.c
+++ b/drivers/spi/designware_spi.c
@@ -155,7 +155,7 @@ static int request_gpio_cs(struct udevice *bus)
 
 static int dw_spi_of_to_plat(struct udevice *bus)
 {
-	struct dw_spi_plat *plat = bus->plat;
+	struct dw_spi_plat *plat = dev_get_plat(bus);
 
 	plat->regs = dev_read_addr_ptr(bus);
 
@@ -478,7 +478,7 @@ static int dw_spi_xfer(struct udevice *dev, unsigned int bitlen,
 
 static int dw_spi_set_speed(struct udevice *bus, uint speed)
 {
-	struct dw_spi_plat *plat = bus->plat;
+	struct dw_spi_plat *plat = dev_get_plat(bus);
 	struct dw_spi_priv *priv = dev_get_priv(bus);
 	u16 clk_div;
 
diff --git a/drivers/spi/exynos_spi.c b/drivers/spi/exynos_spi.c
index e4d2bade0f0..30b1a77a732 100644
--- a/drivers/spi/exynos_spi.c
+++ b/drivers/spi/exynos_spi.c
@@ -253,7 +253,7 @@ static void spi_cs_deactivate(struct udevice *dev)
 
 static int exynos_spi_of_to_plat(struct udevice *bus)
 {
-	struct exynos_spi_plat *plat = bus->plat;
+	struct exynos_spi_plat *plat = dev_get_plat(bus);
 	const void *blob = gd->fdt_blob;
 	int node = dev_of_offset(bus);
 
@@ -368,7 +368,7 @@ static int exynos_spi_xfer(struct udevice *dev, unsigned int bitlen,
 
 static int exynos_spi_set_speed(struct udevice *bus, uint speed)
 {
-	struct exynos_spi_plat *plat = bus->plat;
+	struct exynos_spi_plat *plat = dev_get_plat(bus);
 	struct exynos_spi_priv *priv = dev_get_priv(bus);
 	int ret;
 
diff --git a/drivers/spi/fsl_dspi.c b/drivers/spi/fsl_dspi.c
index ddf4a9e413f..b8c0216b39d 100644
--- a/drivers/spi/fsl_dspi.c
+++ b/drivers/spi/fsl_dspi.c
@@ -486,7 +486,7 @@ static int fsl_dspi_probe(struct udevice *bus)
 	struct dm_spi_bus *dm_spi_bus;
 	uint mcr_cfg_val;
 
-	dm_spi_bus = bus->uclass_priv;
+	dm_spi_bus = dev_get_uclass_priv(bus);
 
 	/* cpu speical pin muxing configure */
 	cpu_dspi_port_conf();
@@ -576,7 +576,7 @@ static int fsl_dspi_bind(struct udevice *bus)
 static int fsl_dspi_of_to_plat(struct udevice *bus)
 {
 	fdt_addr_t addr;
-	struct fsl_dspi_plat *plat = bus->plat;
+	struct fsl_dspi_plat *plat = dev_get_plat(bus);
 	const void *blob = gd->fdt_blob;
 	int node = dev_of_offset(bus);
 
diff --git a/drivers/spi/fsl_espi.c b/drivers/spi/fsl_espi.c
index e9e7ffd6b53..abc28e37d2a 100644
--- a/drivers/spi/fsl_espi.c
+++ b/drivers/spi/fsl_espi.c
@@ -544,7 +544,7 @@ static const struct dm_spi_ops fsl_espi_ops = {
 static int fsl_espi_of_to_plat(struct udevice *bus)
 {
 	fdt_addr_t addr;
-	struct fsl_espi_plat   *plat = bus->plat;
+	struct fsl_espi_plat   *plat = dev_get_plat(bus);
 	const void *blob = gd->fdt_blob;
 	int node = dev_of_offset(bus);
 
diff --git a/drivers/spi/fsl_qspi.c b/drivers/spi/fsl_qspi.c
index fc3b844370c..8bc7038a82a 100644
--- a/drivers/spi/fsl_qspi.c
+++ b/drivers/spi/fsl_qspi.c
@@ -795,7 +795,7 @@ static const struct spi_controller_mem_ops fsl_qspi_mem_ops = {
 
 static int fsl_qspi_probe(struct udevice *bus)
 {
-	struct dm_spi_bus *dm_bus = bus->uclass_priv;
+	struct dm_spi_bus *dm_bus = dev_get_uclass_priv(bus);
 	struct fsl_qspi *q = dev_get_priv(bus);
 	const void *blob = gd->fdt_blob;
 	int node = dev_of_offset(bus);
diff --git a/drivers/spi/mxs_spi.c b/drivers/spi/mxs_spi.c
index 4fafe33af57..7f632d98bb6 100644
--- a/drivers/spi/mxs_spi.c
+++ b/drivers/spi/mxs_spi.c
@@ -443,7 +443,7 @@ static const struct dm_spi_ops mxs_spi_ops = {
 #if CONFIG_IS_ENABLED(OF_CONTROL) && !CONFIG_IS_ENABLED(OF_PLATDATA)
 static int mxs_of_to_plat(struct udevice *bus)
 {
-	struct mxs_spi_plat *plat = bus->plat;
+	struct mxs_spi_plat *plat = dev_get_plat(bus);
 	u32 prop[2];
 	int ret;
 
diff --git a/drivers/spi/pl022_spi.c b/drivers/spi/pl022_spi.c
index 179582cad7d..133363ea7d9 100644
--- a/drivers/spi/pl022_spi.c
+++ b/drivers/spi/pl022_spi.c
@@ -288,7 +288,7 @@ static const struct dm_spi_ops pl022_spi_ops = {
 #if !CONFIG_IS_ENABLED(OF_PLATDATA)
 static int pl022_spi_of_to_plat(struct udevice *bus)
 {
-	struct pl022_spi_pdata *plat = bus->plat;
+	struct pl022_spi_pdata *plat = dev_get_plat(bus);
 	const void *fdt = gd->fdt_blob;
 	int node = dev_of_offset(bus);
 	struct clk clkdev;
diff --git a/drivers/spi/rk_spi.c b/drivers/spi/rk_spi.c
index 44ac475c11d..51abebb9478 100644
--- a/drivers/spi/rk_spi.c
+++ b/drivers/spi/rk_spi.c
@@ -135,7 +135,7 @@ static int rkspi_wait_till_not_busy(struct rockchip_spi *regs)
 static void spi_cs_activate(struct udevice *dev, uint cs)
 {
 	struct udevice *bus = dev->parent;
-	struct rockchip_spi_plat *plat = bus->plat;
+	struct rockchip_spi_plat *plat = dev_get_plat(bus);
 	struct rockchip_spi_priv *priv = dev_get_priv(bus);
 	struct rockchip_spi *regs = priv->regs;
 
@@ -161,7 +161,7 @@ static void spi_cs_activate(struct udevice *dev, uint cs)
 static void spi_cs_deactivate(struct udevice *dev, uint cs)
 {
 	struct udevice *bus = dev->parent;
-	struct rockchip_spi_plat *plat = bus->plat;
+	struct rockchip_spi_plat *plat = dev_get_plat(bus);
 	struct rockchip_spi_priv *priv = dev_get_priv(bus);
 	struct rockchip_spi *regs = priv->regs;
 
@@ -176,7 +176,7 @@ static void spi_cs_deactivate(struct udevice *dev, uint cs)
 #if CONFIG_IS_ENABLED(OF_PLATDATA)
 static int conv_of_plat(struct udevice *dev)
 {
-	struct rockchip_spi_plat *plat = dev->plat;
+	struct rockchip_spi_plat *plat = dev_get_plat(dev);
 	struct dtd_rockchip_rk3288_spi *dtplat = &plat->of_plat;
 	struct rockchip_spi_priv *priv = dev_get_priv(dev);
 	int ret;
diff --git a/drivers/spi/soft_spi.c b/drivers/spi/soft_spi.c
index afc98bfb663..3425d9950a8 100644
--- a/drivers/spi/soft_spi.c
+++ b/drivers/spi/soft_spi.c
@@ -228,7 +228,7 @@ static const struct dm_spi_ops soft_spi_ops = {
 
 static int soft_spi_of_to_plat(struct udevice *dev)
 {
-	struct soft_spi_plat *plat = dev->plat;
+	struct soft_spi_plat *plat = dev_get_plat(dev);
 	const void *blob = gd->fdt_blob;
 	int node = dev_of_offset(dev);
 
@@ -240,7 +240,7 @@ static int soft_spi_of_to_plat(struct udevice *dev)
 static int soft_spi_probe(struct udevice *dev)
 {
 	struct spi_slave *slave = dev_get_parent_priv(dev);
-	struct soft_spi_plat *plat = dev->plat;
+	struct soft_spi_plat *plat = dev_get_plat(dev);
 	int cs_flags, clk_flags;
 	int ret;
 
diff --git a/drivers/spi/tegra114_spi.c b/drivers/spi/tegra114_spi.c
index e1fd82bdfa3..f0256d8e664 100644
--- a/drivers/spi/tegra114_spi.c
+++ b/drivers/spi/tegra114_spi.c
@@ -99,7 +99,7 @@ struct tegra114_spi_priv {
 
 static int tegra114_spi_of_to_plat(struct udevice *bus)
 {
-	struct tegra_spi_plat *plat = bus->plat;
+	struct tegra_spi_plat *plat = dev_get_plat(bus);
 
 	plat->base = dev_read_addr(bus);
 	plat->periph_id = clock_decode_periph_id(bus);
@@ -352,7 +352,7 @@ static int tegra114_spi_xfer(struct udevice *dev, unsigned int bitlen,
 
 static int tegra114_spi_set_speed(struct udevice *bus, uint speed)
 {
-	struct tegra_spi_plat *plat = bus->plat;
+	struct tegra_spi_plat *plat = dev_get_plat(bus);
 	struct tegra114_spi_priv *priv = dev_get_priv(bus);
 
 	if (speed > plat->frequency)
diff --git a/drivers/spi/tegra20_sflash.c b/drivers/spi/tegra20_sflash.c
index d38606100d0..4384a48ec84 100644
--- a/drivers/spi/tegra20_sflash.c
+++ b/drivers/spi/tegra20_sflash.c
@@ -89,7 +89,7 @@ int tegra20_sflash_cs_info(struct udevice *bus, unsigned int cs,
 
 static int tegra20_sflash_of_to_plat(struct udevice *bus)
 {
-	struct tegra_spi_plat *plat = bus->plat;
+	struct tegra_spi_plat *plat = dev_get_plat(bus);
 	const void *blob = gd->fdt_blob;
 	int node = dev_of_offset(bus);
 
@@ -314,7 +314,7 @@ static int tegra20_sflash_xfer(struct udevice *dev, unsigned int bitlen,
 
 static int tegra20_sflash_set_speed(struct udevice *bus, uint speed)
 {
-	struct tegra_spi_plat *plat = bus->plat;
+	struct tegra_spi_plat *plat = dev_get_plat(bus);
 	struct tegra20_sflash_priv *priv = dev_get_priv(bus);
 
 	if (speed > plat->frequency)
diff --git a/drivers/spi/tegra20_slink.c b/drivers/spi/tegra20_slink.c
index b99ef38a143..3057fe1a222 100644
--- a/drivers/spi/tegra20_slink.c
+++ b/drivers/spi/tegra20_slink.c
@@ -95,7 +95,7 @@ struct tegra_spi_slave {
 
 static int tegra30_spi_of_to_plat(struct udevice *bus)
 {
-	struct tegra_spi_plat *plat = bus->plat;
+	struct tegra_spi_plat *plat = dev_get_plat(bus);
 	const void *blob = gd->fdt_blob;
 	int node = dev_of_offset(bus);
 
@@ -314,7 +314,7 @@ static int tegra30_spi_xfer(struct udevice *dev, unsigned int bitlen,
 
 static int tegra30_spi_set_speed(struct udevice *bus, uint speed)
 {
-	struct tegra_spi_plat *plat = bus->plat;
+	struct tegra_spi_plat *plat = dev_get_plat(bus);
 	struct tegra30_spi_priv *priv = dev_get_priv(bus);
 
 	if (speed > plat->frequency)
diff --git a/drivers/spi/tegra210_qspi.c b/drivers/spi/tegra210_qspi.c
index a2a7f4614cb..b464b9ccb0e 100644
--- a/drivers/spi/tegra210_qspi.c
+++ b/drivers/spi/tegra210_qspi.c
@@ -99,7 +99,7 @@ struct tegra210_qspi_priv {
 
 static int tegra210_qspi_of_to_plat(struct udevice *bus)
 {
-	struct tegra_spi_plat *plat = bus->plat;
+	struct tegra_spi_plat *plat = dev_get_plat(bus);
 
 	plat->base = dev_read_addr(bus);
 	plat->periph_id = clock_decode_periph_id(bus);
@@ -380,7 +380,7 @@ static int tegra210_qspi_xfer(struct udevice *dev, unsigned int bitlen,
 
 static int tegra210_qspi_set_speed(struct udevice *bus, uint speed)
 {
-	struct tegra_spi_plat *plat = bus->plat;
+	struct tegra_spi_plat *plat = dev_get_plat(bus);
 	struct tegra210_qspi_priv *priv = dev_get_priv(bus);
 
 	if (speed > plat->frequency)
diff --git a/drivers/spi/uniphier_spi.c b/drivers/spi/uniphier_spi.c
index 48b8430d3d8..e47ed5b221b 100644
--- a/drivers/spi/uniphier_spi.c
+++ b/drivers/spi/uniphier_spi.c
@@ -113,7 +113,7 @@ static void uniphier_spi_regdump(struct uniphier_spi_priv *priv)
 static void spi_cs_activate(struct udevice *dev)
 {
 	struct udevice *bus = dev->parent;
-	struct uniphier_spi_plat *plat = bus->plat;
+	struct uniphier_spi_plat *plat = dev_get_plat(bus);
 	struct uniphier_spi_priv *priv = dev_get_priv(bus);
 	ulong delay_us;		/* The delay completed so far */
 	u32 val;
@@ -139,7 +139,7 @@ static void spi_cs_activate(struct udevice *dev)
 static void spi_cs_deactivate(struct udevice *dev)
 {
 	struct udevice *bus = dev->parent;
-	struct uniphier_spi_plat *plat = bus->plat;
+	struct uniphier_spi_plat *plat = dev_get_plat(bus);
 	struct uniphier_spi_priv *priv = dev_get_priv(bus);
 	u32 val;
 
@@ -279,7 +279,7 @@ static int uniphier_spi_xfer(struct udevice *dev, unsigned int bitlen,
 
 static int uniphier_spi_set_speed(struct udevice *bus, uint speed)
 {
-	struct uniphier_spi_plat *plat = bus->plat;
+	struct uniphier_spi_plat *plat = dev_get_plat(bus);
 	struct uniphier_spi_priv *priv = dev_get_priv(bus);
 	u32 val, ckdiv;
 
@@ -364,7 +364,7 @@ static int uniphier_spi_set_mode(struct udevice *bus, uint mode)
 
 static int uniphier_spi_of_to_plat(struct udevice *bus)
 {
-	struct uniphier_spi_plat *plat = bus->plat;
+	struct uniphier_spi_plat *plat = dev_get_plat(bus);
 	const void *blob = gd->fdt_blob;
 	int node = dev_of_offset(bus);
 
diff --git a/drivers/spi/zynq_qspi.c b/drivers/spi/zynq_qspi.c
index 2fc28b6bee2..845f2d2f5f4 100644
--- a/drivers/spi/zynq_qspi.c
+++ b/drivers/spi/zynq_qspi.c
@@ -100,7 +100,7 @@ struct zynq_qspi_priv {
 
 static int zynq_qspi_of_to_plat(struct udevice *bus)
 {
-	struct zynq_qspi_plat *plat = bus->plat;
+	struct zynq_qspi_plat *plat = dev_get_plat(bus);
 	const void *blob = gd->fdt_blob;
 	int node = dev_of_offset(bus);
 
@@ -592,7 +592,7 @@ static int zynq_qspi_xfer(struct udevice *dev, unsigned int bitlen,
 
 static int zynq_qspi_set_speed(struct udevice *bus, uint speed)
 {
-	struct zynq_qspi_plat *plat = bus->plat;
+	struct zynq_qspi_plat *plat = dev_get_plat(bus);
 	struct zynq_qspi_priv *priv = dev_get_priv(bus);
 	struct zynq_qspi_regs *regs = priv->regs;
 	uint32_t confr;
diff --git a/drivers/spi/zynq_spi.c b/drivers/spi/zynq_spi.c
index a6efa4a1c83..2971e55f41b 100644
--- a/drivers/spi/zynq_spi.c
+++ b/drivers/spi/zynq_spi.c
@@ -75,7 +75,7 @@ struct zynq_spi_priv {
 
 static int zynq_spi_of_to_plat(struct udevice *bus)
 {
-	struct zynq_spi_plat *plat = bus->plat;
+	struct zynq_spi_plat *plat = dev_get_plat(bus);
 	const void *blob = gd->fdt_blob;
 	int node = dev_of_offset(bus);
 
@@ -162,7 +162,7 @@ static int zynq_spi_probe(struct udevice *bus)
 static void spi_cs_activate(struct udevice *dev)
 {
 	struct udevice *bus = dev->parent;
-	struct zynq_spi_plat *plat = bus->plat;
+	struct zynq_spi_plat *plat = dev_get_plat(bus);
 	struct zynq_spi_priv *priv = dev_get_priv(bus);
 	struct zynq_spi_regs *regs = priv->regs;
 	u32 cr;
@@ -193,7 +193,7 @@ static void spi_cs_activate(struct udevice *dev)
 static void spi_cs_deactivate(struct udevice *dev)
 {
 	struct udevice *bus = dev->parent;
-	struct zynq_spi_plat *plat = bus->plat;
+	struct zynq_spi_plat *plat = dev_get_plat(bus);
 	struct zynq_spi_priv *priv = dev_get_priv(bus);
 	struct zynq_spi_regs *regs = priv->regs;
 
@@ -296,7 +296,7 @@ static int zynq_spi_xfer(struct udevice *dev, unsigned int bitlen,
 
 static int zynq_spi_set_speed(struct udevice *bus, uint speed)
 {
-	struct zynq_spi_plat *plat = bus->plat;
+	struct zynq_spi_plat *plat = dev_get_plat(bus);
 	struct zynq_spi_priv *priv = dev_get_priv(bus);
 	struct zynq_spi_regs *regs = priv->regs;
 	uint32_t confr;
diff --git a/drivers/spi/zynqmp_gqspi.c b/drivers/spi/zynqmp_gqspi.c
index f09c50757d4..c9e476eefac 100644
--- a/drivers/spi/zynqmp_gqspi.c
+++ b/drivers/spi/zynqmp_gqspi.c
@@ -177,7 +177,7 @@ struct zynqmp_qspi_priv {
 
 static int zynqmp_qspi_of_to_plat(struct udevice *bus)
 {
-	struct zynqmp_qspi_plat *plat = bus->plat;
+	struct zynqmp_qspi_plat *plat = dev_get_plat(bus);
 
 	debug("%s\n", __func__);
 
@@ -255,7 +255,7 @@ static void zynqmp_qspi_chipselect(struct zynqmp_qspi_priv *priv, int is_on)
 
 void zynqmp_qspi_set_tapdelay(struct udevice *bus, u32 baudrateval)
 {
-	struct zynqmp_qspi_plat *plat = bus->plat;
+	struct zynqmp_qspi_plat *plat = dev_get_plat(bus);
 	struct zynqmp_qspi_priv *priv = dev_get_priv(bus);
 	struct zynqmp_qspi_regs *regs = priv->regs;
 	u32 tapdlybypass = 0, lpbkdlyadj = 0, datadlyadj = 0, clk_rate;
@@ -295,7 +295,7 @@ void zynqmp_qspi_set_tapdelay(struct udevice *bus, u32 baudrateval)
 
 static int zynqmp_qspi_set_speed(struct udevice *bus, uint speed)
 {
-	struct zynqmp_qspi_plat *plat = bus->plat;
+	struct zynqmp_qspi_plat *plat = dev_get_plat(bus);
 	struct zynqmp_qspi_priv *priv = dev_get_priv(bus);
 	struct zynqmp_qspi_regs *regs = priv->regs;
 	u32 confr;
diff --git a/drivers/timer/ag101p_timer.c b/drivers/timer/ag101p_timer.c
index 17174345e36..27cf9b02471 100644
--- a/drivers/timer/ag101p_timer.c
+++ b/drivers/timer/ag101p_timer.c
@@ -64,7 +64,7 @@ struct atftmr_timer_plat {
 
 static u64 atftmr_timer_get_count(struct udevice *dev)
 {
-	struct atftmr_timer_plat *plat = dev->plat;
+	struct atftmr_timer_plat *plat = dev_get_plat(dev);
 	struct atftmr_timer_regs *const regs = plat->regs;
 	u32 val;
 	val = readl(&regs->t3_counter);
@@ -73,7 +73,7 @@ static u64 atftmr_timer_get_count(struct udevice *dev)
 
 static int atftmr_timer_probe(struct udevice *dev)
 {
-	struct atftmr_timer_plat *plat = dev->plat;
+	struct atftmr_timer_plat *plat = dev_get_plat(dev);
 	struct atftmr_timer_regs *const regs = plat->regs;
 	u32 cr;
 	writel(0, &regs->t3_load);
diff --git a/drivers/timer/altera_timer.c b/drivers/timer/altera_timer.c
index 7e9abee0efc..040dc65f48a 100644
--- a/drivers/timer/altera_timer.c
+++ b/drivers/timer/altera_timer.c
@@ -34,7 +34,7 @@ struct altera_timer_plat {
 
 static u64 altera_timer_get_count(struct udevice *dev)
 {
-	struct altera_timer_plat *plat = dev->plat;
+	struct altera_timer_plat *plat = dev_get_plat(dev);
 	struct altera_timer_regs *const regs = plat->regs;
 	u32 val;
 
@@ -49,7 +49,7 @@ static u64 altera_timer_get_count(struct udevice *dev)
 
 static int altera_timer_probe(struct udevice *dev)
 {
-	struct altera_timer_plat *plat = dev->plat;
+	struct altera_timer_plat *plat = dev_get_plat(dev);
 	struct altera_timer_regs *const regs = plat->regs;
 
 	writel(0, &regs->status);
diff --git a/drivers/timer/andes_plmt_timer.c b/drivers/timer/andes_plmt_timer.c
index cec86718c7f..db2cf86f638 100644
--- a/drivers/timer/andes_plmt_timer.c
+++ b/drivers/timer/andes_plmt_timer.c
@@ -12,6 +12,7 @@
 #include <dm.h>
 #include <timer.h>
 #include <asm/io.h>
+#include <dm/device-internal.h>
 #include <linux/err.h>
 
 /* mtime register */
@@ -19,7 +20,7 @@
 
 static u64 andes_plmt_get_count(struct udevice *dev)
 {
-	return readq((void __iomem *)MTIME_REG(dev->priv));
+	return readq((void __iomem *)MTIME_REG(dev_get_priv(dev)));
 }
 
 static const struct timer_ops andes_plmt_ops = {
@@ -28,8 +29,8 @@ static const struct timer_ops andes_plmt_ops = {
 
 static int andes_plmt_probe(struct udevice *dev)
 {
-	dev->priv = dev_read_addr_ptr(dev);
-	if (!dev->priv)
+	dev_set_priv(dev, dev_read_addr_ptr(dev));
+	if (!dev_get_priv(dev))
 		return -EINVAL;
 
 	return timer_timebase_fallback(dev);
diff --git a/drivers/timer/mpc83xx_timer.c b/drivers/timer/mpc83xx_timer.c
index 9b1daaadebf..2f2b8be3dca 100644
--- a/drivers/timer/mpc83xx_timer.c
+++ b/drivers/timer/mpc83xx_timer.c
@@ -206,7 +206,7 @@ static u64 mpc83xx_timer_get_count(struct udevice *dev)
 
 static int mpc83xx_timer_probe(struct udevice *dev)
 {
-	struct timer_dev_priv *uc_priv = dev->uclass_priv;
+	struct timer_dev_priv *uc_priv = dev_get_uclass_priv(dev);
 	struct clk clock;
 	int ret;
 
diff --git a/drivers/timer/sifive_clint_timer.c b/drivers/timer/sifive_clint_timer.c
index 00ce0f08d6e..de23b85404b 100644
--- a/drivers/timer/sifive_clint_timer.c
+++ b/drivers/timer/sifive_clint_timer.c
@@ -9,6 +9,7 @@
 #include <dm.h>
 #include <timer.h>
 #include <asm/io.h>
+#include <dm/device-internal.h>
 #include <linux/err.h>
 
 /* mtime register */
@@ -16,7 +17,7 @@
 
 static u64 sifive_clint_get_count(struct udevice *dev)
 {
-	return readq((void __iomem *)MTIME_REG(dev->priv));
+	return readq((void __iomem *)MTIME_REG(dev_get_priv(dev)));
 }
 
 static const struct timer_ops sifive_clint_ops = {
@@ -25,8 +26,8 @@ static const struct timer_ops sifive_clint_ops = {
 
 static int sifive_clint_probe(struct udevice *dev)
 {
-	dev->priv = dev_read_addr_ptr(dev);
-	if (!dev->priv)
+	dev_set_priv(dev, dev_read_addr_ptr(dev));
+	if (!dev_get_priv(dev))
 		return -EINVAL;
 
 	return timer_timebase_fallback(dev);
diff --git a/drivers/timer/timer-uclass.c b/drivers/timer/timer-uclass.c
index ab535553273..8e63c17e9f3 100644
--- a/drivers/timer/timer-uclass.c
+++ b/drivers/timer/timer-uclass.c
@@ -40,7 +40,7 @@ int notrace timer_get_count(struct udevice *dev, u64 *count)
 
 unsigned long notrace timer_get_rate(struct udevice *dev)
 {
-	struct timer_dev_priv *uc_priv = dev->uclass_priv;
+	struct timer_dev_priv *uc_priv = dev_get_uclass_priv(dev);
 
 	return uc_priv->clock_rate;
 }
diff --git a/drivers/usb/gadget/ether.c b/drivers/usb/gadget/ether.c
index 7830a4aee94..16922ff15c6 100644
--- a/drivers/usb/gadget/ether.c
+++ b/drivers/usb/gadget/ether.c
@@ -1860,10 +1860,18 @@ static int rndis_control_ack(struct eth_device *net)
 static int rndis_control_ack(struct udevice *net)
 #endif
 {
-	struct ether_priv	*priv = (struct ether_priv *)net->priv;
-	struct eth_dev		*dev = &priv->ethdev;
-	int                     length;
-	struct usb_request      *resp = dev->stat_req;
+	struct ether_priv *priv;
+	struct eth_dev *dev;
+	int length;
+	struct usb_request *resp;
+
+#ifndef CONFIG_DM_ETH
+	priv = (struct ether_priv *)net->priv;
+#else
+	priv = dev_get_priv(net);
+#endif
+	dev = &priv->ethdev;
+	resp = dev->stat_req;
 
 	/* in case RNDIS calls this after disconnect */
 	if (!dev->status) {
diff --git a/drivers/usb/host/usb-uclass.c b/drivers/usb/host/usb-uclass.c
index a2bd7436f42..17db5eb0609 100644
--- a/drivers/usb/host/usb-uclass.c
+++ b/drivers/usb/host/usb-uclass.c
@@ -60,7 +60,7 @@ int submit_control_msg(struct usb_device *udev, unsigned long pipe,
 {
 	struct udevice *bus = udev->controller_dev;
 	struct dm_usb_ops *ops = usb_get_ops(bus);
-	struct usb_uclass_priv *uc_priv = bus->uclass->priv;
+	struct usb_uclass_priv *uc_priv = uclass_get_priv(bus->uclass);
 	int err;
 
 	if (!ops->control)
@@ -184,7 +184,7 @@ int usb_stop(void)
 	if (ret)
 		return ret;
 
-	uc_priv = uc->priv;
+	uc_priv = uclass_get_priv(uc);
 
 	uclass_foreach_dev(bus, uc) {
 		ret = device_remove(bus, DM_REMOVE_NORMAL);
@@ -263,7 +263,7 @@ int usb_init(void)
 	if (ret)
 		return ret;
 
-	uc_priv = uc->priv;
+	uc_priv = uclass_get_priv(uc);
 
 	uclass_foreach_dev(bus, uc) {
 		/* init low_level USB */
diff --git a/drivers/video/video-uclass.c b/drivers/video/video-uclass.c
index 20f6973b4b6..8883e290357 100644
--- a/drivers/video/video-uclass.c
+++ b/drivers/video/video-uclass.c
@@ -378,7 +378,7 @@ static int video_post_bind(struct udevice *dev)
 		return 0;
 
 	/* Set up the video pointer, if this is the first device */
-	uc_priv = dev->uclass->priv;
+	uc_priv = uclass_get_priv(dev->uclass);
 	if (!uc_priv->video_ptr)
 		uc_priv->video_ptr = gd->video_top;
 
diff --git a/lib/efi_loader/efi_device_path.c b/lib/efi_loader/efi_device_path.c
index 99b50780063..c9315dd4585 100644
--- a/lib/efi_loader/efi_device_path.c
+++ b/lib/efi_loader/efi_device_path.c
@@ -531,7 +531,7 @@ __maybe_unused static void *dp_fill(void *buf, struct udevice *dev)
 	case UCLASS_ETH: {
 		struct efi_device_path_mac_addr *dp =
 			dp_fill(buf, dev->parent);
-		struct eth_pdata *pdata = dev->plat;
+		struct eth_pdata *pdata = dev_get_plat(dev);
 
 		dp->dp.type = DEVICE_PATH_TYPE_MESSAGING_DEVICE;
 		dp->dp.sub_type = DEVICE_PATH_SUB_TYPE_MSG_MAC_ADDR;
diff --git a/net/eth-uclass.c b/net/eth-uclass.c
index e2d6731975a..0156324032b 100644
--- a/net/eth-uclass.c
+++ b/net/eth-uclass.c
@@ -50,7 +50,7 @@ static struct eth_uclass_priv *eth_get_uclass_priv(void)
 		return NULL;
 
 	assert(uc);
-	return uc->priv;
+	return uclass_get_priv(uc);
 }
 
 void eth_set_current_to_next(void)
@@ -146,7 +146,7 @@ unsigned char *eth_get_ethaddr(void)
 	struct eth_pdata *pdata;
 
 	if (eth_get_dev()) {
-		pdata = eth_get_dev()->plat;
+		pdata = dev_get_plat(eth_get_dev());
 		return pdata->enetaddr;
 	}
 
@@ -163,7 +163,7 @@ int eth_init_state_only(void)
 	if (!current || !device_active(current))
 		return -EINVAL;
 
-	priv = current->uclass_priv;
+	priv = dev_get_uclass_priv(current);
 	priv->state = ETH_STATE_ACTIVE;
 
 	return 0;
@@ -179,7 +179,7 @@ void eth_halt_state_only(void)
 	if (!current || !device_active(current))
 		return;
 
-	priv = current->uclass_priv;
+	priv = dev_get_uclass_priv(current);
 	priv->state = ETH_STATE_PASSIVE;
 }
 
@@ -200,7 +200,7 @@ static int eth_write_hwaddr(struct udevice *dev)
 
 	/* seq is valid since the device is active */
 	if (eth_get_ops(dev)->write_hwaddr && !eth_mac_skip(dev_seq(dev))) {
-		pdata = dev->plat;
+		pdata = dev_get_plat(dev);
 		if (!is_valid_ethaddr(pdata->enetaddr)) {
 			printf("\nError: %s address %pM illegal value\n",
 			       dev->name, pdata->enetaddr);
@@ -234,7 +234,7 @@ static int on_ethaddr(const char *name, const char *value, enum env_op op,
 
 	retval = uclass_find_device_by_seq(UCLASS_ETH, index, &dev);
 	if (!retval) {
-		struct eth_pdata *pdata = dev->plat;
+		struct eth_pdata *pdata = dev_get_plat(dev);
 		switch (op) {
 		case env_op_create:
 		case env_op_overwrite:
@@ -287,7 +287,7 @@ int eth_init(void)
 				ret = eth_get_ops(current)->start(current);
 				if (ret >= 0) {
 					struct eth_device_priv *priv =
-						current->uclass_priv;
+						dev_get_uclass_priv(current);
 
 					priv->state = ETH_STATE_ACTIVE;
 					return 0;
@@ -323,7 +323,7 @@ void eth_halt(void)
 		return;
 
 	eth_get_ops(current)->stop(current);
-	priv = current->uclass_priv;
+	priv = dev_get_uclass_priv(current);
 	if (priv)
 		priv->state = ETH_STATE_PASSIVE;
 }
@@ -502,8 +502,8 @@ static bool eth_dev_get_mac_address(struct udevice *dev, u8 mac[ARP_HLEN])
 
 static int eth_post_probe(struct udevice *dev)
 {
-	struct eth_device_priv *priv = dev->uclass_priv;
-	struct eth_pdata *pdata = dev->plat;
+	struct eth_device_priv *priv = dev_get_uclass_priv(dev);
+	struct eth_pdata *pdata = dev_get_plat(dev);
 	unsigned char env_enetaddr[ARP_HLEN];
 	char *source = "DT";
 
@@ -581,7 +581,7 @@ static int eth_post_probe(struct udevice *dev)
 
 static int eth_pre_remove(struct udevice *dev)
 {
-	struct eth_pdata *pdata = dev->plat;
+	struct eth_pdata *pdata = dev_get_plat(dev);
 
 	eth_get_ops(dev)->stop(dev);
 
diff --git a/test/dm/core.c b/test/dm/core.c
index a7c0f40b775..cf66e27db4e 100644
--- a/test/dm/core.c
+++ b/test/dm/core.c
@@ -255,7 +255,7 @@ static int dm_test_autoprobe(struct unit_test_state *uts)
 		ut_assert(priv);
 		ut_asserteq(expected_base_add, priv->base_add);
 
-		pdata = dev->plat;
+		pdata = dev_get_plat(dev);
 		expected_base_add += pdata->ping_add;
 	}
 
@@ -273,7 +273,7 @@ static int dm_test_plat(struct unit_test_state *uts)
 	for (i = 0; i < 3; i++) {
 		ut_assertok(uclass_find_device(UCLASS_TEST, i, &dev));
 		ut_assert(dev);
-		pdata = dev->plat;
+		pdata = dev_get_plat(dev);
 		ut_assert(pdata->ping_add == test_pdata[i].ping_add);
 	}
 
@@ -297,7 +297,7 @@ static int dm_test_lifecycle(struct unit_test_state *uts)
 	ut_assert(dev);
 	ut_assert(dm_testdrv_op_count[DM_TEST_OP_BIND]
 			== op_count[DM_TEST_OP_BIND] + 1);
-	ut_assert(!dev->priv);
+	ut_assert(!dev_get_priv(dev));
 
 	/* Probe the device - it should fail allocating private data */
 	dms->force_fail_alloc = 1;
@@ -305,14 +305,14 @@ static int dm_test_lifecycle(struct unit_test_state *uts)
 	ut_assert(ret == -ENOMEM);
 	ut_assert(dm_testdrv_op_count[DM_TEST_OP_PROBE]
 			== op_count[DM_TEST_OP_PROBE] + 1);
-	ut_assert(!dev->priv);
+	ut_assert(!dev_get_priv(dev));
 
 	/* Try again without the alloc failure */
 	dms->force_fail_alloc = 0;
 	ut_assertok(device_probe(dev));
 	ut_assert(dm_testdrv_op_count[DM_TEST_OP_PROBE]
 			== op_count[DM_TEST_OP_PROBE] + 2);
-	ut_assert(dev->priv);
+	ut_assert(dev_get_priv(dev));
 
 	/* This should be device 3 in the uclass */
 	ut_assertok(uclass_find_device(UCLASS_TEST, 3, &test_dev));
@@ -402,8 +402,8 @@ int dm_check_operations(struct unit_test_state *uts, struct udevice *dev,
 
 	/* Getting the child device should allocate plat / priv */
 	ut_assertok(testfdt_ping(dev, 10, &pingret));
-	ut_assert(dev->priv);
-	ut_assert(dev->plat);
+	ut_assert(dev_get_priv(dev));
+	ut_assert(dev_get_plat(dev));
 
 	expected = 10 + base;
 	ut_asserteq(expected, pingret);
@@ -414,7 +414,7 @@ int dm_check_operations(struct unit_test_state *uts, struct udevice *dev,
 	ut_asserteq(expected, pingret);
 
 	/* Now check the ping_total */
-	priv = dev->priv;
+	priv = dev_get_priv(dev);
 	ut_asserteq(DM_TEST_START_TOTAL + 10 + 20 + base * 2,
 		    priv->ping_total);
 
@@ -444,7 +444,7 @@ static int dm_test_operations(struct unit_test_state *uts)
 		base = test_pdata[i].ping_add;
 		debug("dev=%d, base=%d\n", i, base);
 
-		ut_assert(!dm_check_operations(uts, dev, base, dev->priv));
+		ut_assert(!dm_check_operations(uts, dev, base, dev_get_priv(dev)));
 	}
 
 	return 0;
@@ -466,7 +466,7 @@ static int dm_test_remove(struct unit_test_state *uts)
 		ut_assertf(!(dev->flags & DM_FLAG_ACTIVATED),
 			   "Driver %d/%s should have deactivated", i,
 			   dev->name);
-		ut_assert(!dev->priv);
+		ut_assert(!dev_get_priv(dev));
 	}
 
 	return 0;
@@ -512,7 +512,7 @@ static int dm_test_uclass(struct unit_test_state *uts)
 	ut_assertok(uclass_get(UCLASS_TEST, &uc));
 	ut_asserteq(1, dm_testdrv_op_count[DM_TEST_OP_INIT]);
 	ut_asserteq(0, dm_testdrv_op_count[DM_TEST_OP_DESTROY]);
-	ut_assert(uc->priv);
+	ut_assert(uclass_get_priv(uc));
 
 	ut_assertok(uclass_destroy(uc));
 	ut_asserteq(1, dm_testdrv_op_count[DM_TEST_OP_INIT]);
@@ -547,7 +547,7 @@ static int create_children(struct unit_test_state *uts, struct udevice *parent,
 						&driver_info_manual, &dev));
 		pdata = calloc(1, sizeof(*pdata));
 		pdata->ping_add = key + i;
-		dev->plat = pdata;
+		dev_set_plat(dev, pdata);
 		if (child)
 			child[i] = dev;
 	}
diff --git a/test/dm/test-driver.c b/test/dm/test-driver.c
index b9f49de10a6..a67f5d3f982 100644
--- a/test/dm/test-driver.c
+++ b/test/dm/test-driver.c
@@ -12,6 +12,7 @@
 #include <log.h>
 #include <malloc.h>
 #include <asm/io.h>
+#include <dm/device-internal.h>
 #include <dm/test.h>
 #include <test/test.h>
 #include <test/ut.h>
@@ -67,7 +68,7 @@ static int test_remove(struct udevice *dev)
 static int test_unbind(struct udevice *dev)
 {
 	/* Private data should not be allocated */
-	ut_assert(!dev->priv);
+	ut_assert(!dev_get_priv(dev));
 
 	dm_testdrv_op_count[DM_TEST_OP_UNBIND]++;
 	return 0;
@@ -119,8 +120,8 @@ static int test_manual_probe(struct udevice *dev)
 
 	dm_testdrv_op_count[DM_TEST_OP_PROBE]++;
 	if (!dms->force_fail_alloc)
-		dev->priv = calloc(1, sizeof(struct dm_test_priv));
-	if (!dev->priv)
+		dev_set_priv(dev, calloc(1, sizeof(struct dm_test_priv)));
+	if (!dev_get_priv(dev))
 		return -ENOMEM;
 
 	return 0;
diff --git a/test/dm/test-fdt.c b/test/dm/test-fdt.c
index 3354012fccb..e4478e7d2c5 100644
--- a/test/dm/test-fdt.c
+++ b/test/dm/test-fdt.c
@@ -25,7 +25,7 @@ DECLARE_GLOBAL_DATA_PTR;
 
 static int testfdt_drv_ping(struct udevice *dev, int pingval, int *pingret)
 {
-	const struct dm_test_pdata *pdata = dev->plat;
+	const struct dm_test_pdata *pdata = dev_get_plat(dev);
 	struct dm_test_priv *priv = dev_get_priv(dev);
 
 	*pingret = pingval + pdata->ping_add;
@@ -271,7 +271,7 @@ static int dm_test_fdt(struct unit_test_state *uts)
 		ret = uclass_find_device(UCLASS_TEST_FDT, i, &dev);
 		ut_assert(!ret);
 		ut_assert(!dev_get_priv(dev));
-		ut_assert(dev->plat);
+		ut_assert(dev_get_plat(dev));
 	}
 
 	ut_assertok(dm_check_devices(uts, num_devices));
diff --git a/test/dm/test-uclass.c b/test/dm/test-uclass.c
index 3ab4a23649e..f1b7aaa727f 100644
--- a/test/dm/test-uclass.c
+++ b/test/dm/test-uclass.c
@@ -82,7 +82,7 @@ static int test_post_probe(struct udevice *dev)
 	if (&prev->uclass_node != &uc->dev_head) {
 		struct dm_test_uclass_perdev_priv *prev_uc_priv
 				= dev_get_uclass_priv(prev);
-		struct dm_test_pdata *pdata = prev->plat;
+		struct dm_test_pdata *pdata = dev_get_plat(prev);
 
 		ut_assert(pdata);
 		ut_assert(prev_uc_priv);
@@ -102,7 +102,7 @@ static int test_pre_remove(struct udevice *dev)
 static int test_init(struct uclass *uc)
 {
 	dm_testdrv_op_count[DM_TEST_OP_INIT]++;
-	ut_assert(uc->priv);
+	ut_assert(uclass_get_priv(uc));
 
 	return 0;
 }
-- 
2.29.2.684.gfbc64c5ab5-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
