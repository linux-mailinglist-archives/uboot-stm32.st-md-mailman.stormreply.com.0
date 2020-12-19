Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4362DF0B9
	for <lists+uboot-stm32@lfdr.de>; Sat, 19 Dec 2020 18:40:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A366AC5717E;
	Sat, 19 Dec 2020 17:40:56 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89F48C3087A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 19 Dec 2020 17:40:54 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id p5so5191324iln.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 19 Dec 2020 09:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s7Bf9oApDP/6smy13rUI1eKTUYtimpGCdOrCo8Bz0eo=;
 b=dwndfvmCuDE2u/+Xk0LNby0b6VmeqlCDUaiGZaPJvDeSl7o83Q9QVZP2saK7WO6jpM
 8nqSezcDd/BfVwUuwsrFmHYluzwMoH4AmEKfwMTvsxOKTmJ8anbLDWzKX5qq0HqYE4Xt
 /hifslVUnP8mxJXRv+8CjnhbEsXWjRuut6Mz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s7Bf9oApDP/6smy13rUI1eKTUYtimpGCdOrCo8Bz0eo=;
 b=nSgCrYYT99NGhIQ3lEhEUkUg5II4PxPMSBHeUE/vONVQuGdXtgCXd64/EIxntbPyar
 Ah1MWhrKh+1uwQ9LKqzG+r9U3bcCr1B/mApPkwrqV2o8flPnVQf7WgzN96p/BByu3rZs
 WALXYtMyV4gzhXQzwVcd+a9bz3apkFnVIGU0++Yu73mKTK1rlIBlCE7ZSI0bU/HlIoec
 C9KaSxZPNPStgpJy5/oOtYQ5O41ZENOF7SFNmnhDIq3Oq5NlQYkqMFQdc32TdFakdoH3
 Lx5YaDwrzWGMzj3XbCWpYP+ObbDKD+8KQxr/soQuYutOls7KGVdN2sPL+WRZCxNI08Qu
 VVMg==
X-Gm-Message-State: AOAM5311HxGwv2g+v99VVyMb3hDWrq7FajffK91p5U5NYdT0+iuBTkcc
 TZRqPhF3QXZdOa1p4EC03uBWhA==
X-Google-Smtp-Source: ABdhPJzsZURq4pdMJCn5i8kJD+WLvZEOP0DXmZCVk0uciqFlhLeNb4zaluPmTn4A0XjmikmnkFiAIQ==
X-Received: by 2002:a92:cb43:: with SMTP id f3mr9723576ilq.50.1608399653278;
 Sat, 19 Dec 2020 09:40:53 -0800 (PST)
Received: from localhost.localdomain (c-67-190-101-114.hsd1.co.comcast.net.
 [67.190.101.114])
 by smtp.gmail.com with ESMTPSA id n10sm9781962ila.69.2020.12.19.09.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Dec 2020 09:40:52 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sat, 19 Dec 2020 10:40:14 -0700
Message-Id: <20201219174018.1114146-21-sjg@chromium.org>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
In-Reply-To: <20201219174018.1114146-1-sjg@chromium.org>
References: <20201219174018.1114146-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: uboot-snps-arc@synopsys.com, Peng Fan <peng.fan@nxp.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 u-boot-amlogic@groups.io, Pavel Herrmann <morpheus.ibis@gmail.com>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Kever Yang <kever.yang@rock-chips.com>, Michal Simek <michal.simek@xilinx.com>,
 Stefan Bosch <stefan_b@posteo.net>, Joe Hershberger <joe.hershberger@ni.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Marek Vasut <marex@denx.de>, Ryder Lee <ryder.lee@mediatek.com>,
 Luka Perkov <luka.perkov@sartura.hr>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Masahiro Yamada <masahiroy@kernel.org>, Weijie Gao <weijie.gao@mediatek.com>,
 Lukasz Majewski <lukma@denx.de>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Suneel Garapati <sgarapati@marvell.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Madalin Bucur <madalin.bucur@oss.nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Anatolij Gustschin <agust@denx.de>,
 Siva Durga Prasad Paladugu <siva.durga.paladugu@xilinx.com>,
 Stefan Roese <sr@denx.de>, Frank Wunderlich <frank-w@public-files.de>,
 Frank Wang <frank.wang@rock-chips.com>, Eugeniy Paltsev <paltsev@synopsys.com>,
 Robert Marko <robert.marko@sartura.hr>, "hui.song" <hui.song_1@nxp.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Sean Anderson <seanga2@gmail.com>, Patrice Chotard <patrice.chotard@st.com>,
 Aaron Williams <awilliams@marvell.com>, Luka Kovacic <luka.kovacic@sartura.hr>,
 Bin Meng <bmeng.cn@gmail.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [Uboot-stm32] [PATCH 22/26] dm: core: Access device ofnode through
	functions
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

At present ofnode is present in the device even if it is never used. With
of-platdata this field is not used, so can be removed. In preparation for
this, change the access to go through inline functions.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 arch/arm/mach-stm32mp/pwr_regulator.c     |  2 +-
 board/synopsys/hsdk/clk-lib.c             |  2 +-
 drivers/ata/mtk_ahci.c                    |  3 ++-
 drivers/clk/meson/axg.c                   |  2 +-
 drivers/clk/meson/g12a.c                  |  2 +-
 drivers/clk/meson/gxbb.c                  |  2 +-
 drivers/core/device.c                     |  2 +-
 drivers/core/root.c                       |  2 +-
 drivers/gpio/mpc8xxx_gpio.c               |  4 ++--
 drivers/gpio/octeon_gpio.c                |  2 +-
 drivers/misc/swap_case.c                  |  2 +-
 drivers/mmc/octeontx_hsmmc.c              | 23 +++++++++++++----------
 drivers/mtd/nand/raw/octeontx_nand.c      |  2 +-
 drivers/mtd/nand/spi/core.c               |  2 +-
 drivers/net/fm/eth.c                      |  4 ++--
 drivers/net/fsl_enetc.c                   |  8 ++++----
 drivers/net/fsl_enetc_mdio.c              |  2 +-
 drivers/net/mdio-ipq4019.c                |  4 ++--
 drivers/net/mdio_mux_i2creg.c             |  2 +-
 drivers/net/mvmdio.c                      |  4 ++--
 drivers/net/octeontx/smi.c                |  2 +-
 drivers/net/tsec.c                        |  3 ++-
 drivers/phy/phy-ti-am654.c                |  2 +-
 drivers/power/domain/meson-ee-pwrc.c      |  4 ++--
 drivers/power/domain/meson-gx-pwrc-vpu.c  |  4 ++--
 drivers/power/regulator/pbias_regulator.c |  3 ++-
 drivers/pwm/pwm-meson.c                   |  9 ++++++---
 drivers/reset/reset-socfpga.c             |  2 +-
 drivers/spi/fsl_dspi.c                    |  6 ++++--
 drivers/tee/optee/core.c                  |  2 +-
 drivers/usb/cdns3/core.c                  |  4 ++--
 drivers/usb/dwc3/core.c                   |  2 +-
 drivers/usb/dwc3/dwc3-generic.c           |  6 +++---
 drivers/usb/dwc3/dwc3-meson-g12a.c        |  2 +-
 drivers/usb/dwc3/dwc3-meson-gxl.c         |  2 +-
 drivers/usb/gadget/dwc2_udc_otg.c         |  4 ++--
 drivers/usb/host/dwc3-octeon-glue.c       |  2 +-
 drivers/usb/host/dwc3-sti-glue.c          |  5 +++--
 drivers/usb/host/ehci-mx6.c               |  2 +-
 drivers/usb/host/xhci-dwc3.c              |  2 +-
 drivers/usb/mtu3/mtu3_core.c              |  2 +-
 drivers/usb/mtu3/mtu3_plat.c              |  4 ++--
 drivers/usb/musb-new/ti-musb.c            |  2 +-
 drivers/video/nexell_display.c            |  2 +-
 drivers/video/rockchip/rk_mipi.c          |  2 +-
 include/dm/device.h                       | 23 +++++++++++++++++++++--
 include/dm/read.h                         |  2 +-
 include/linux/mtd/mtd.h                   |  4 ++--
 net/mdio-mux-uclass.c                     |  2 +-
 net/mdio-uclass.c                         |  8 ++++----
 50 files changed, 113 insertions(+), 82 deletions(-)

diff --git a/arch/arm/mach-stm32mp/pwr_regulator.c b/arch/arm/mach-stm32mp/pwr_regulator.c
index af6ea439646..766ed95f1a6 100644
--- a/arch/arm/mach-stm32mp/pwr_regulator.c
+++ b/arch/arm/mach-stm32mp/pwr_regulator.c
@@ -81,7 +81,7 @@ static int stm32mp_pwr_bind(struct udevice *dev)
 {
 	int children;
 
-	children = pmic_bind_children(dev, dev->node, pwr_children_info);
+	children = pmic_bind_children(dev, dev_ofnode(dev), pwr_children_info);
 	if (!children)
 		dev_dbg(dev, "no child found\n");
 
diff --git a/board/synopsys/hsdk/clk-lib.c b/board/synopsys/hsdk/clk-lib.c
index 1c74bfb93a3..bd43179fc79 100644
--- a/board/synopsys/hsdk/clk-lib.c
+++ b/board/synopsys/hsdk/clk-lib.c
@@ -23,8 +23,8 @@ int soc_clk_ctl(const char *name, ulong *rate, enum clk_ctl_ops ctl)
 	/* Dummy fmeas device, just to be able to use standard clk_* api */
 	struct udevice fmeas = {
 		.name = "clk-fmeas",
-		.node = ofnode_path("/clk-fmeas"),
 	};
+	dev_set_ofnode(&fmeas, ofnode_path("/clk-fmeas"));
 
 	ret = clk_get_by_name(&fmeas, name, &clk);
 	if (ret) {
diff --git a/drivers/ata/mtk_ahci.c b/drivers/ata/mtk_ahci.c
index cd28e0cae37..46b7677783f 100644
--- a/drivers/ata/mtk_ahci.c
+++ b/drivers/ata/mtk_ahci.c
@@ -68,7 +68,8 @@ static int mtk_ahci_parse_property(struct ahci_uc_priv *hpriv,
 				   SYS_CFG_SATA_MSK, SYS_CFG_SATA_EN);
 	}
 
-	ofnode_read_u32(dev->node, "ports-implemented", &hpriv->port_map);
+	ofnode_read_u32(dev_ofnode(dev), "ports-implemented",
+			&hpriv->port_map);
 	return 0;
 }
 
diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 82068578ffb..d6da59d269b 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -289,7 +289,7 @@ static int meson_clk_probe(struct udevice *dev)
 {
 	struct meson_clk *priv = dev_get_priv(dev);
 
-	priv->map = syscon_node_to_regmap(dev_get_parent(dev)->node);
+	priv->map = syscon_node_to_regmap(dev_ofnode(dev_get_parent(dev)));
 	if (IS_ERR(priv->map))
 		return PTR_ERR(priv->map);
 
diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 01b22abc34d..5058db1a47b 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -979,7 +979,7 @@ static int meson_clk_probe(struct udevice *dev)
 {
 	struct meson_clk *priv = dev_get_priv(dev);
 
-	priv->map = syscon_node_to_regmap(dev_get_parent(dev)->node);
+	priv->map = syscon_node_to_regmap(dev_ofnode(dev_get_parent(dev)));
 	if (IS_ERR(priv->map))
 		return PTR_ERR(priv->map);
 
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 2a20541dcb4..e379540deee 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -885,7 +885,7 @@ static int meson_clk_probe(struct udevice *dev)
 {
 	struct meson_clk *priv = dev_get_priv(dev);
 
-	priv->map = syscon_node_to_regmap(dev_get_parent(dev)->node);
+	priv->map = syscon_node_to_regmap(dev_ofnode(dev_get_parent(dev)));
 	if (IS_ERR(priv->map))
 		return PTR_ERR(priv->map);
 
diff --git a/drivers/core/device.c b/drivers/core/device.c
index bd4ecc9e24d..6a9bee093d0 100644
--- a/drivers/core/device.c
+++ b/drivers/core/device.c
@@ -68,7 +68,7 @@ static int device_bind_common(struct udevice *parent, const struct driver *drv,
 	dev_set_plat(dev, plat);
 	dev->driver_data = driver_data;
 	dev->name = name;
-	dev->node = node;
+	dev_set_ofnode(dev, node);
 	dev->parent = parent;
 	dev->driver = drv;
 	dev->uclass = uc;
diff --git a/drivers/core/root.c b/drivers/core/root.c
index 9ef242979ba..fe7359433f6 100644
--- a/drivers/core/root.c
+++ b/drivers/core/root.c
@@ -148,7 +148,7 @@ int dm_init(bool of_live)
 	if (ret)
 		return ret;
 	if (CONFIG_IS_ENABLED(OF_CONTROL))
-		DM_ROOT_NON_CONST->node = ofnode_root();
+		dev_set_ofnode(DM_ROOT_NON_CONST, ofnode_root());
 	ret = device_probe(DM_ROOT_NON_CONST);
 	if (ret)
 		return ret;
diff --git a/drivers/gpio/mpc8xxx_gpio.c b/drivers/gpio/mpc8xxx_gpio.c
index 2bc1a0d5716..a964347fa32 100644
--- a/drivers/gpio/mpc8xxx_gpio.c
+++ b/drivers/gpio/mpc8xxx_gpio.c
@@ -191,7 +191,7 @@ static int mpc8xxx_gpio_of_to_plat(struct udevice *dev)
 	u32 i;
 	u32 reg[4];
 
-	if (ofnode_read_bool(dev->node, "little-endian"))
+	if (ofnode_read_bool(dev_ofnode(dev), "little-endian"))
 		data->little_endian = true;
 
 	if (data->little_endian)
@@ -257,7 +257,7 @@ static int mpc8xxx_gpio_probe(struct udevice *dev)
 	if (!str)
 		return -ENOMEM;
 
-	if (ofnode_device_is_compatible(dev->node, "fsl,qoriq-gpio")) {
+	if (ofnode_device_is_compatible(dev_ofnode(dev), "fsl,qoriq-gpio")) {
 		unsigned long gpibe = data->addr + sizeof(struct ccsr_gpio)
 			- sizeof(u32);
 
diff --git a/drivers/gpio/octeon_gpio.c b/drivers/gpio/octeon_gpio.c
index 958516d8f8e..42eae79d8c4 100644
--- a/drivers/gpio/octeon_gpio.c
+++ b/drivers/gpio/octeon_gpio.c
@@ -190,7 +190,7 @@ static int octeon_gpio_probe(struct udevice *dev)
 			GPIO_CONST_GPIOS_MASK;
 	} else {
 		priv->base = dev_remap_addr(dev);
-		uc_priv->gpio_count = ofnode_read_u32_default(dev->node,
+		uc_priv->gpio_count = ofnode_read_u32_default(dev_ofnode(dev),
 							      "nr-gpios", 32);
 	}
 
diff --git a/drivers/misc/swap_case.c b/drivers/misc/swap_case.c
index abea0e76139..3cbc8f37ec5 100644
--- a/drivers/misc/swap_case.c
+++ b/drivers/misc/swap_case.c
@@ -54,7 +54,7 @@ struct swap_case_priv {
 
 static int sandbox_swap_case_use_ea(const struct udevice *dev)
 {
-	return !!ofnode_get_property(dev->node, "use-ea", NULL);
+	return !!ofnode_get_property(dev_ofnode(dev), "use-ea", NULL);
 }
 
 /* Please keep these macros in sync with ea_regs below */
diff --git a/drivers/mmc/octeontx_hsmmc.c b/drivers/mmc/octeontx_hsmmc.c
index f3da6af9090..442ca493d76 100644
--- a/drivers/mmc/octeontx_hsmmc.c
+++ b/drivers/mmc/octeontx_hsmmc.c
@@ -3439,7 +3439,7 @@ static u32 xlate_voltage(u32 voltage)
  */
 static bool octeontx_mmc_get_valid(struct udevice *dev)
 {
-	const char *stat = ofnode_read_string(dev->node, "status");
+	const char *stat = ofnode_read_string(dev_ofnode(dev), "status");
 
 	if (!stat || !strncmp(stat, "ok", 2))
 		return true;
@@ -3461,14 +3461,15 @@ static int octeontx_mmc_get_config(struct udevice *dev)
 	uint low, high;
 	char env_name[32];
 	int err;
-	ofnode node = dev->node;
+	ofnode node = dev_ofnode(dev);
 	int bus_width = 1;
 	ulong new_max_freq;
 
 	debug("%s(%s)", __func__, dev->name);
 	slot->cfg.name = dev->name;
 
-	slot->cfg.f_max = ofnode_read_s32_default(dev->node, "max-frequency",
+	slot->cfg.f_max = ofnode_read_s32_default(dev_ofnode(dev),
+						  "max-frequency",
 						  26000000);
 	snprintf(env_name, sizeof(env_name), "mmc_max_frequency%d",
 		 slot->bus_id);
@@ -3486,25 +3487,26 @@ static int octeontx_mmc_get_config(struct udevice *dev)
 
 	if (IS_ENABLED(CONFIG_ARCH_OCTEONTX2)) {
 		slot->hs400_tuning_block =
-			ofnode_read_s32_default(dev->node,
+			ofnode_read_s32_default(dev_ofnode(dev),
 						"marvell,hs400-tuning-block",
 						-1);
 		debug("%s(%s): mmc HS400 tuning block: %d\n", __func__,
 		      dev->name, slot->hs400_tuning_block);
 
 		slot->hs200_tap_adj =
-			ofnode_read_s32_default(dev->node,
+			ofnode_read_s32_default(dev_ofnode(dev),
 						"marvell,hs200-tap-adjust", 0);
 		debug("%s(%s): hs200-tap-adjust: %d\n", __func__, dev->name,
 		      slot->hs200_tap_adj);
 		slot->hs400_tap_adj =
-			ofnode_read_s32_default(dev->node,
+			ofnode_read_s32_default(dev_ofnode(dev),
 						"marvell,hs400-tap-adjust", 0);
 		debug("%s(%s): hs400-tap-adjust: %d\n", __func__, dev->name,
 		      slot->hs400_tap_adj);
 	}
 
-	err = ofnode_read_u32_array(dev->node, "voltage-ranges", voltages, 2);
+	err = ofnode_read_u32_array(dev_ofnode(dev), "voltage-ranges",
+				    voltages, 2);
 	if (err) {
 		slot->cfg.voltages = MMC_VDD_32_33 | MMC_VDD_33_34;
 	} else {
@@ -3756,14 +3758,15 @@ static int octeontx_mmc_host_probe(struct udevice *dev)
 		pr_err("%s: No device tree information found\n", __func__);
 		return -1;
 	}
-	host->node = dev->node;
+	host->node = dev_ofnode(dev);
 	host->last_slotid = -1;
 	if (otx_is_platform(PLATFORM_ASIM))
 		host->is_asim = true;
 	if (otx_is_platform(PLATFORM_EMULATOR))
 		host->is_emul = true;
 	host->dma_wait_delay =
-		ofnode_read_u32_default(dev->node, "marvell,dma-wait-delay", 1);
+		ofnode_read_u32_default(dev_ofnode(dev),
+					"marvell,dma-wait-delay", 1);
 	/* Force reset of eMMC */
 	writeq(0, host->base_addr + MIO_EMM_CFG());
 	debug("%s: Clearing MIO_EMM_CFG\n", __func__);
@@ -3824,7 +3827,7 @@ static int octeontx_mmc_host_child_pre_probe(struct udevice *dev)
 	struct octeontx_mmc_host *host = dev_get_priv(dev_get_parent(dev));
 	struct octeontx_mmc_slot *slot;
 	struct mmc_uclass_priv *upriv;
-	ofnode node = dev->node;
+	ofnode node = dev_ofnode(dev);
 	u32 bus_id;
 	char name[16];
 	int err;
diff --git a/drivers/mtd/nand/raw/octeontx_nand.c b/drivers/mtd/nand/raw/octeontx_nand.c
index 96a5fe6592a..64433cf6ccc 100644
--- a/drivers/mtd/nand/raw/octeontx_nand.c
+++ b/drivers/mtd/nand/raw/octeontx_nand.c
@@ -1999,7 +1999,7 @@ static int octeontx_nfc_chip_init(struct octeontx_nfc *tn, struct udevice *dev,
 static int octeontx_nfc_chips_init(struct octeontx_nfc *tn)
 {
 	struct udevice *dev = tn->dev;
-	ofnode node = dev->node;
+	ofnode node = dev_ofnode(dev);
 	ofnode nand_node;
 	int nr_chips = of_get_child_count(node);
 	int ret;
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index ab9a24ed5b5..cd12376ab82 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1173,7 +1173,7 @@ static int spinand_probe(struct udevice *dev)
 		return -ENOMEM;
 	sprintf(mtd->name, "spi-nand%d", spi_nand_idx++);
 	spinand->slave = slave;
-	spinand_set_ofnode(spinand, dev->node);
+	spinand_set_ofnode(spinand, dev_ofnode(dev));
 #endif
 
 	ret = spinand_init(spinand);
diff --git a/drivers/net/fm/eth.c b/drivers/net/fm/eth.c
index a10f87eefc5..0e89e663f71 100644
--- a/drivers/net/fm/eth.c
+++ b/drivers/net/fm/eth.c
@@ -957,7 +957,7 @@ phy_interface_t fman_read_sys_if(struct udevice *dev)
 {
 	const char *if_str;
 
-	if_str = ofnode_read_string(dev->node, "phy-connection-type");
+	if_str = ofnode_read_string(dev_ofnode(dev), "phy-connection-type");
 	debug("MAC system interface mode %s\n", if_str);
 
 	return phy_get_interface_by_name(if_str);
@@ -969,7 +969,7 @@ static int fm_eth_bind(struct udevice *dev)
 	char mac_name[11];
 	u32 fm, num;
 
-	if (ofnode_read_u32(ofnode_get_parent(dev->node), "cell-index", &fm)) {
+	if (ofnode_read_u32(ofnode_get_parent(dev_ofnode(dev)), "cell-index", &fm)) {
 		printf("FMan node property cell-index missing\n");
 		return -EINVAL;
 	}
diff --git a/drivers/net/fsl_enetc.c b/drivers/net/fsl_enetc.c
index 2e684e58393..f6fc7801b95 100644
--- a/drivers/net/fsl_enetc.c
+++ b/drivers/net/fsl_enetc.c
@@ -99,7 +99,7 @@ static int enetc_bind(struct udevice *dev)
 	 * and some are not, use different naming scheme - enetc-N based on
 	 * PCI function # and enetc#N based on interface count
 	 */
-	if (ofnode_valid(dev->node))
+	if (ofnode_valid(dev_ofnode(dev)))
 		sprintf(name, "enetc-%u", PCI_FUNC(pci_get_devfn(dev)));
 	else
 		sprintf(name, "enetc#%u", eth_num_devices++);
@@ -253,12 +253,12 @@ static void enetc_start_pcs(struct udevice *dev)
 			mdio_register(&priv->imdio);
 	}
 
-	if (!ofnode_valid(dev->node)) {
+	if (!ofnode_valid(dev_ofnode(dev))) {
 		enetc_dbg(dev, "no enetc ofnode found, skipping PCS set-up\n");
 		return;
 	}
 
-	if_str = ofnode_read_string(dev->node, "phy-mode");
+	if_str = ofnode_read_string(dev_ofnode(dev), "phy-mode");
 	if (if_str)
 		priv->if_type = phy_get_interface_by_name(if_str);
 	else
@@ -306,7 +306,7 @@ static int enetc_probe(struct udevice *dev)
 {
 	struct enetc_priv *priv = dev_get_priv(dev);
 
-	if (ofnode_valid(dev->node) && !ofnode_is_available(dev->node)) {
+	if (ofnode_valid(dev_ofnode(dev)) && !ofnode_is_available(dev_ofnode(dev))) {
 		enetc_dbg(dev, "interface disabled\n");
 		return -ENODEV;
 	}
diff --git a/drivers/net/fsl_enetc_mdio.c b/drivers/net/fsl_enetc_mdio.c
index 4da97b61d17..3eb6ac9fc8f 100644
--- a/drivers/net/fsl_enetc_mdio.c
+++ b/drivers/net/fsl_enetc_mdio.c
@@ -112,7 +112,7 @@ static int enetc_mdio_bind(struct udevice *dev)
 	 * and some are not, use different naming scheme - enetc-N based on
 	 * PCI function # and enetc#N based on interface count
 	 */
-	if (ofnode_valid(dev->node))
+	if (ofnode_valid(dev_ofnode(dev)))
 		sprintf(name, "emdio-%u", PCI_FUNC(pci_get_devfn(dev)));
 	else
 		sprintf(name, "emdio#%u", eth_num_devices++);
diff --git a/drivers/net/mdio-ipq4019.c b/drivers/net/mdio-ipq4019.c
index 13a8856286a..50134b4d9b6 100644
--- a/drivers/net/mdio-ipq4019.c
+++ b/drivers/net/mdio-ipq4019.c
@@ -107,8 +107,8 @@ static const struct mdio_ops ipq4019_mdio_ops = {
 
 static int ipq4019_mdio_bind(struct udevice *dev)
 {
-	if (ofnode_valid(dev->node))
-		device_set_name(dev, ofnode_get_name(dev->node));
+	if (ofnode_valid(dev_ofnode(dev)))
+		device_set_name(dev, ofnode_get_name(dev_ofnode(dev)));
 
 	return 0;
 }
diff --git a/drivers/net/mdio_mux_i2creg.c b/drivers/net/mdio_mux_i2creg.c
index f8557dd2c49..3654230118f 100644
--- a/drivers/net/mdio_mux_i2creg.c
+++ b/drivers/net/mdio_mux_i2creg.c
@@ -61,7 +61,7 @@ static int mdio_mux_i2creg_probe(struct udevice *dev)
 	}
 
 	/* parent should be an I2C chip, grandparent should be an I2C bus */
-	chip_node = ofnode_get_parent(dev->node);
+	chip_node = ofnode_get_parent(dev_ofnode(dev));
 	bus_node = ofnode_get_parent(chip_node);
 
 	err = uclass_get_device_by_ofnode(UCLASS_I2C, bus_node, &i2c_bus);
diff --git a/drivers/net/mvmdio.c b/drivers/net/mvmdio.c
index 005f28f1b25..96f8dc62b56 100644
--- a/drivers/net/mvmdio.c
+++ b/drivers/net/mvmdio.c
@@ -197,8 +197,8 @@ static int mvmdio_write(struct udevice *dev, int addr, int devad, int reg,
  */
 static int mvmdio_bind(struct udevice *dev)
 {
-	if (ofnode_valid(dev->node))
-		device_set_name(dev, ofnode_get_name(dev->node));
+	if (ofnode_valid(dev_ofnode(dev)))
+		device_set_name(dev, ofnode_get_name(dev_ofnode(dev)));
 
 	return 0;
 }
diff --git a/drivers/net/octeontx/smi.c b/drivers/net/octeontx/smi.c
index d1582b968bf..58436419f1b 100644
--- a/drivers/net/octeontx/smi.c
+++ b/drivers/net/octeontx/smi.c
@@ -313,7 +313,7 @@ read_error:
 
 int octeontx_smi_probe(struct udevice *dev)
 {
-	int ret, subnode, cnt = 0, node = dev->node.of_offset;
+	int ret, subnode, cnt = 0, node = dev_ofnode(dev).of_offset;
 	struct mii_dev *bus;
 	struct octeontx_smi_priv *priv;
 	pci_dev_t bdf = dm_pci_get_bdf(dev);
diff --git a/drivers/net/tsec.c b/drivers/net/tsec.c
index 2d124732cf0..ec486893725 100644
--- a/drivers/net/tsec.c
+++ b/drivers/net/tsec.c
@@ -707,7 +707,8 @@ static int init_phy(struct tsec_private *priv)
 		tsec_configure_serdes(priv);
 
 #if defined(CONFIG_DM_ETH) && defined(CONFIG_DM_MDIO)
-	if (ofnode_valid(ofnode_find_subnode(priv->dev->node, "fixed-link")))
+	if (ofnode_valid(ofnode_find_subnode(dev_ofnode(priv->dev),
+					     "fixed-link")))
 		phydev = phy_connect(NULL, 0, priv->dev, priv->interface);
 	else
 		phydev = dm_eth_phy_connect(priv->dev);
diff --git a/drivers/phy/phy-ti-am654.c b/drivers/phy/phy-ti-am654.c
index 8e35ea14750..82010e7c96e 100644
--- a/drivers/phy/phy-ti-am654.c
+++ b/drivers/phy/phy-ti-am654.c
@@ -344,7 +344,7 @@ static int serdes_am654_bind(struct udevice *dev)
 
 	ret = device_bind_driver_to_node(dev->parent,
 					 "ti-serdes-am654-mux-clk",
-					 dev_read_name(dev), dev->node,
+					 dev_read_name(dev), dev_ofnode(dev),
 					 NULL);
 	if (ret) {
 		dev_err(dev, "%s: not able to bind clock driver\n", __func__);
diff --git a/drivers/power/domain/meson-ee-pwrc.c b/drivers/power/domain/meson-ee-pwrc.c
index 2e7ab671286..ef8274ce96d 100644
--- a/drivers/power/domain/meson-ee-pwrc.c
+++ b/drivers/power/domain/meson-ee-pwrc.c
@@ -397,11 +397,11 @@ static int meson_ee_pwrc_probe(struct udevice *dev)
 	if (!priv->data)
 		return -EINVAL;
 
-	priv->regmap_hhi = syscon_node_to_regmap(dev_get_parent(dev)->node);
+	priv->regmap_hhi = syscon_node_to_regmap(dev_ofnode(dev_get_parent(dev)));
 	if (IS_ERR(priv->regmap_hhi))
 		return PTR_ERR(priv->regmap_hhi);
 
-	ret = ofnode_read_u32(dev->node, "amlogic,ao-sysctrl",
+	ret = ofnode_read_u32(dev_ofnode(dev), "amlogic,ao-sysctrl",
 			      &ao_phandle);
 	if (ret)
 		return ret;
diff --git a/drivers/power/domain/meson-gx-pwrc-vpu.c b/drivers/power/domain/meson-gx-pwrc-vpu.c
index 40947c66f31..eb94af2cf83 100644
--- a/drivers/power/domain/meson-gx-pwrc-vpu.c
+++ b/drivers/power/domain/meson-gx-pwrc-vpu.c
@@ -300,11 +300,11 @@ static int meson_gx_pwrc_vpu_probe(struct udevice *dev)
 	ofnode hhi_node;
 	int ret;
 
-	priv->regmap_ao = syscon_node_to_regmap(dev_get_parent(dev)->node);
+	priv->regmap_ao = syscon_node_to_regmap(dev_ofnode(dev_get_parent(dev)));
 	if (IS_ERR(priv->regmap_ao))
 		return PTR_ERR(priv->regmap_ao);
 
-	ret = ofnode_read_u32(dev->node, "amlogic,hhi-sysctrl",
+	ret = ofnode_read_u32(dev_ofnode(dev), "amlogic,hhi-sysctrl",
 			      &hhi_phandle);
 	if (ret)
 		return ret;
diff --git a/drivers/power/regulator/pbias_regulator.c b/drivers/power/regulator/pbias_regulator.c
index 6f0d0a59ff4..5bf186e4d4c 100644
--- a/drivers/power/regulator/pbias_regulator.c
+++ b/drivers/power/regulator/pbias_regulator.c
@@ -103,7 +103,8 @@ static int pbias_bind(struct udevice *dev)
 {
 	int children;
 
-	children = pmic_bind_children(dev, dev->node, pmic_children_info);
+	children = pmic_bind_children(dev, dev_ofnode(dev),
+				      pmic_children_info);
 	if (!children)
 		debug("%s: %s - no child found\n", __func__, dev->name);
 
diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 58b7469f977..03eeacc286d 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -304,13 +304,14 @@ static int meson_pwm_probe(struct udevice *dev)
 					if (strcmp(cdev->driver->name, "fixed_rate_clock"))
 						continue;
 
-					str = ofnode_read_string(cdev->node, "clock-output-names");
+					str = ofnode_read_string(dev_ofnode(cdev),
+								 "clock-output-names");
 					if (!str)
 						continue;
 
 					if (!strcmp(str, "xtal")) {
 						err = uclass_get_device_by_ofnode(UCLASS_CLK,
-										  cdev->node,
+										  dev_ofnode(cdev),
 										  &cdev);
 						if (err) {
 							printf("%s%d: Failed to get xtal clk\n", __func__, i);
@@ -345,7 +346,9 @@ static int meson_pwm_probe(struct udevice *dev)
 					return -EINVAL;
 				}
 
-				err = uclass_get_device_by_ofnode(UCLASS_CLK, cdev->node, &cdev);
+				err = uclass_get_device_by_ofnode(UCLASS_CLK,
+								  dev_ofnode(cdev),
+								  &cdev);
 				if (err) {
 					printf("%s%d: Failed to get clk controller\n", __func__, i);
 					return err;
diff --git a/drivers/reset/reset-socfpga.c b/drivers/reset/reset-socfpga.c
index c64c9b5917c..98450db94b2 100644
--- a/drivers/reset/reset-socfpga.c
+++ b/drivers/reset/reset-socfpga.c
@@ -148,7 +148,7 @@ static int socfpga_reset_bind(struct udevice *dev)
 	 * Bind it to the node, too, so that it can get its base address.
 	 */
 	ret = device_bind_driver_to_node(dev, "socfpga_sysreset", "sysreset",
-					 dev->node, &sys_child);
+					 dev_ofnode(dev), &sys_child);
 	if (ret)
 		debug("Warning: No sysreset driver: ret=%d\n", ret);
 
diff --git a/drivers/spi/fsl_dspi.c b/drivers/spi/fsl_dspi.c
index b8c0216b39d..c17a5522bcc 100644
--- a/drivers/spi/fsl_dspi.c
+++ b/drivers/spi/fsl_dspi.c
@@ -460,8 +460,10 @@ static int fsl_dspi_child_pre_probe(struct udevice *dev)
 		return -EINVAL;
 	}
 
-	ofnode_read_u32(dev->node, "fsl,spi-cs-sck-delay", &cs_sck_delay);
-	ofnode_read_u32(dev->node, "fsl,spi-sck-cs-delay", &sck_cs_delay);
+	ofnode_read_u32(dev_ofnode(dev), "fsl,spi-cs-sck-delay",
+			&cs_sck_delay);
+	ofnode_read_u32(dev_ofnode(dev), "fsl,spi-sck-cs-delay",
+			&sck_cs_delay);
 
 	/* Set PCS to SCK delay scale values */
 	ns_delay_scale(&pcssck, &cssck, cs_sck_delay, priv->bus_clk);
diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
index 7c38d6e0527..b898c32edc0 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -592,7 +592,7 @@ static optee_invoke_fn *get_invoke_func(struct udevice *dev)
 	const char *method;
 
 	debug("optee: looking for conduit method in DT.\n");
-	method = ofnode_get_property(dev->node, "method", NULL);
+	method = ofnode_get_property(dev_ofnode(dev), "method", NULL);
 	if (!method) {
 		debug("optee: missing \"method\" property\n");
 		return ERR_PTR(-ENXIO);
diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index e861c82f7e1..798a21793f7 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -110,7 +110,7 @@ static int cdns3_core_init_role(struct cdns3 *cdns)
 	enum usb_dr_mode dr_mode;
 	int ret = 0;
 
-	dr_mode = usb_get_dr_mode(dev->node);
+	dr_mode = usb_get_dr_mode(dev_ofnode(dev));
 	cdns->role = USB_ROLE_NONE;
 
 	/*
@@ -393,7 +393,7 @@ int cdns3_bind(struct udevice *parent)
 	ofnode node;
 	int ret;
 
-	node = ofnode_by_compatible(parent->node, "cdns,usb3");
+	node = ofnode_by_compatible(dev_ofnode(parent), "cdns,usb3");
 	if (!ofnode_valid(node)) {
 		ret = -ENODEV;
 		goto fail;
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 2e003530a15..dfd7cf683f7 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -905,7 +905,7 @@ void dwc3_of_parse(struct dwc3 *dwc)
 	 */
 	hird_threshold = 12;
 
-	dwc->hsphy_mode = usb_get_phy_mode(dev->node);
+	dwc->hsphy_mode = usb_get_phy_mode(dev_ofnode(dev));
 
 	dwc->has_lpm_erratum = dev_read_bool(dev,
 				"snps,has-lpm-erratum");
diff --git a/drivers/usb/dwc3/dwc3-generic.c b/drivers/usb/dwc3/dwc3-generic.c
index 459add80c58..39e931f634d 100644
--- a/drivers/usb/dwc3/dwc3-generic.c
+++ b/drivers/usb/dwc3/dwc3-generic.c
@@ -108,7 +108,7 @@ static int dwc3_generic_remove(struct udevice *dev,
 static int dwc3_generic_of_to_plat(struct udevice *dev)
 {
 	struct dwc3_generic_plat *plat = dev_get_plat(dev);
-	ofnode node = dev->node;
+	ofnode node = dev_ofnode(dev);
 
 	plat->base = dev_read_addr(dev);
 
@@ -301,7 +301,7 @@ static int dwc3_glue_bind(struct udevice *parent)
 	ofnode node;
 	int ret;
 
-	ofnode_for_each_subnode(node, parent->node) {
+	ofnode_for_each_subnode(node, dev_ofnode(parent)) {
 		const char *name = ofnode_get_name(node);
 		enum usb_dr_mode dr_mode;
 		struct udevice *dev;
@@ -418,7 +418,7 @@ static int dwc3_glue_probe(struct udevice *dev)
 	while (child) {
 		enum usb_dr_mode dr_mode;
 
-		dr_mode = usb_get_dr_mode(child->node);
+		dr_mode = usb_get_dr_mode(dev_ofnode(child));
 		device_find_next_child(&child);
 		if (ops && ops->select_dr_mode)
 			ops->select_dr_mode(dev, index, dr_mode);
diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index acc7866b64a..6f99fb27f3f 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -395,7 +395,7 @@ static int dwc3_meson_g12a_probe(struct udevice *dev)
 	}
 #endif
 
-	priv->otg_mode = usb_get_dr_mode(dev->node);
+	priv->otg_mode = usb_get_dr_mode(dev_ofnode(dev));
 
 	ret = dwc3_meson_g12a_usb_init(priv);
 	if (ret)
diff --git a/drivers/usb/dwc3/dwc3-meson-gxl.c b/drivers/usb/dwc3/dwc3-meson-gxl.c
index b63cc235f7e..08467d6210b 100644
--- a/drivers/usb/dwc3/dwc3-meson-gxl.c
+++ b/drivers/usb/dwc3/dwc3-meson-gxl.c
@@ -338,7 +338,7 @@ static int dwc3_meson_gxl_probe(struct udevice *dev)
 	if (ret)
 		return ret;
 
-	priv->otg_mode = usb_get_dr_mode(dev->node);
+	priv->otg_mode = usb_get_dr_mode(dev_ofnode(dev));
 
 	if (priv->otg_mode == USB_DR_MODE_PERIPHERAL)
 		priv->otg_phy_mode = USB_DR_MODE_PERIPHERAL;
diff --git a/drivers/usb/gadget/dwc2_udc_otg.c b/drivers/usb/gadget/dwc2_udc_otg.c
index 4771b1e9312..e3871e381e1 100644
--- a/drivers/usb/gadget/dwc2_udc_otg.c
+++ b/drivers/usb/gadget/dwc2_udc_otg.c
@@ -987,8 +987,8 @@ static int dwc2_udc_otg_of_to_plat(struct udevice *dev)
 	void (*set_params)(struct dwc2_plat_otg_data *data);
 	int ret;
 
-	if (usb_get_dr_mode(dev->node) != USB_DR_MODE_PERIPHERAL &&
-	    usb_get_dr_mode(dev->node) != USB_DR_MODE_OTG) {
+	if (usb_get_dr_mode(dev_ofnode(dev)) != USB_DR_MODE_PERIPHERAL &&
+	    usb_get_dr_mode(dev_ofnode(dev)) != USB_DR_MODE_OTG) {
 		dev_dbg(dev, "Invalid mode\n");
 		return -ENODEV;
 	}
diff --git a/drivers/usb/host/dwc3-octeon-glue.c b/drivers/usb/host/dwc3-octeon-glue.c
index c3cac9c5abd..742e156cbb9 100644
--- a/drivers/usb/host/dwc3-octeon-glue.c
+++ b/drivers/usb/host/dwc3-octeon-glue.c
@@ -366,7 +366,7 @@ static int octeon_dwc3_glue_bind(struct udevice *dev)
 
 	/* Find snps,dwc3 node from subnode */
 	dwc3_node = ofnode_null();
-	ofnode_for_each_subnode(node, dev->node) {
+	ofnode_for_each_subnode(node, dev_ofnode(dev)) {
 		if (ofnode_device_is_compatible(node, "snps,dwc3"))
 			dwc3_node = node;
 	}
diff --git a/drivers/usb/host/dwc3-sti-glue.c b/drivers/usb/host/dwc3-sti-glue.c
index deb820a0f84..e5c6a1a67d6 100644
--- a/drivers/usb/host/dwc3-sti-glue.c
+++ b/drivers/usb/host/dwc3-sti-glue.c
@@ -108,7 +108,8 @@ static int sti_dwc3_glue_of_to_plat(struct udevice *dev)
 	int ret;
 	u32 reg[4];
 
-	ret = ofnode_read_u32_array(dev->node, "reg", reg, ARRAY_SIZE(reg));
+	ret = ofnode_read_u32_array(dev_ofnode(dev), "reg", reg,
+				    ARRAY_SIZE(reg));
 	if (ret) {
 		pr_err("unable to find st,stih407-dwc3 reg property(%d)\n", ret);
 		return ret;
@@ -154,7 +155,7 @@ static int sti_dwc3_glue_bind(struct udevice *dev)
 	ofnode node, dwc3_node;
 
 	/* Find snps,dwc3 node from subnode */
-	ofnode_for_each_subnode(node, dev->node) {
+	ofnode_for_each_subnode(node, dev_ofnode(dev)) {
 		if (ofnode_device_is_compatible(node, "snps,dwc3"))
 			dwc3_node = node;
 	}
diff --git a/drivers/usb/host/ehci-mx6.c b/drivers/usb/host/ehci-mx6.c
index d2f49cf4690..ef3a63afa44 100644
--- a/drivers/usb/host/ehci-mx6.c
+++ b/drivers/usb/host/ehci-mx6.c
@@ -523,7 +523,7 @@ static int ehci_usb_of_to_plat(struct udevice *dev)
 	struct usb_plat *plat = dev_get_plat(dev);
 	enum usb_dr_mode dr_mode;
 
-	dr_mode = usb_get_dr_mode(dev->node);
+	dr_mode = usb_get_dr_mode(dev_ofnode(dev));
 
 	switch (dr_mode) {
 	case USB_DR_MODE_HOST:
diff --git a/drivers/usb/host/xhci-dwc3.c b/drivers/usb/host/xhci-dwc3.c
index 59408e4e50e..3e0ae80cece 100644
--- a/drivers/usb/host/xhci-dwc3.c
+++ b/drivers/usb/host/xhci-dwc3.c
@@ -155,7 +155,7 @@ static int xhci_dwc3_probe(struct udevice *dev)
 
 	writel(reg, &dwc3_reg->g_usb2phycfg[0]);
 
-	dr_mode = usb_get_dr_mode(dev->node);
+	dr_mode = usb_get_dr_mode(dev_ofnode(dev));
 	if (dr_mode == USB_DR_MODE_UNKNOWN)
 		/* by default set dual role mode to HOST */
 		dr_mode = USB_DR_MODE_HOST;
diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index 28136f88f45..2f5cc9b1480 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -802,7 +802,7 @@ int ssusb_gadget_init(struct ssusb_mtk *ssusb)
 	mtu->ippc_base = ssusb->ippc_base;
 	mtu->mac_base = ssusb->mac_base;
 	mtu->ssusb = ssusb;
-	mtu->max_speed = usb_get_maximum_speed(dev->node);
+	mtu->max_speed = usb_get_maximum_speed(dev_ofnode(dev));
 	mtu->force_vbus = dev_read_bool(dev, "mediatek,force-vbus");
 
 	ret = mtu3_hw_init(mtu);
diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index c951107b201..b097471f3d4 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -173,7 +173,7 @@ static int get_ssusb_rscs(struct udevice *dev, struct ssusb_mtk *ssusb)
 		return -ENODEV;
 	}
 
-	ssusb->dr_mode = usb_get_dr_mode(child->node);
+	ssusb->dr_mode = usb_get_dr_mode(dev_ofnode(child));
 
 	if (ssusb->dr_mode == USB_DR_MODE_UNKNOWN ||
 		ssusb->dr_mode == USB_DR_MODE_OTG)
@@ -313,7 +313,7 @@ static int mtu3_glue_bind(struct udevice *parent)
 	ofnode node;
 	int ret;
 
-	node = ofnode_by_compatible(parent->node, "mediatek,ssusb");
+	node = ofnode_by_compatible(dev_ofnode(parent), "mediatek,ssusb");
 	if (!ofnode_valid(node))
 		return -ENODEV;
 
diff --git a/drivers/usb/musb-new/ti-musb.c b/drivers/usb/musb-new/ti-musb.c
index 81b12fadfc1..75cf1811f7a 100644
--- a/drivers/usb/musb-new/ti-musb.c
+++ b/drivers/usb/musb-new/ti-musb.c
@@ -289,7 +289,7 @@ static int ti_musb_wrapper_bind(struct udevice *parent)
 	ofnode node;
 	int ret;
 
-	ofnode_for_each_subnode(node, parent->node) {
+	ofnode_for_each_subnode(node, dev_ofnode(parent)) {
 		struct udevice *dev;
 		const char *name = ofnode_get_name(node);
 		enum usb_dr_mode dr_mode;
diff --git a/drivers/video/nexell_display.c b/drivers/video/nexell_display.c
index 00e2c36f376..b47bef3578f 100644
--- a/drivers/video/nexell_display.c
+++ b/drivers/video/nexell_display.c
@@ -416,7 +416,7 @@ static struct nx_display_dev *nx_display_setup(void)
 		      __func__);
 		return NULL;
 	}
-	node = dev->node.of_offset;
+	node = dev_ofnode(dev).of_offset;
 
 	if (CONFIG_IS_ENABLED(OF_CONTROL)) {
 		ret = nx_display_parse_dt(dev, dp, plat);
diff --git a/drivers/video/rockchip/rk_mipi.c b/drivers/video/rockchip/rk_mipi.c
index d125a5ba737..159201a5916 100644
--- a/drivers/video/rockchip/rk_mipi.c
+++ b/drivers/video/rockchip/rk_mipi.c
@@ -119,7 +119,7 @@ int rk_mipi_dsi_enable(struct udevice *dev,
 	rk_mipi_dsi_write(regs, VID_PKT_SIZE, 0x4b0);
 
 	/* Set dpi color coding depth 24 bit */
-	timing_node = ofnode_find_subnode(dev->node, "display-timings");
+	timing_node = ofnode_find_subnode(dev_ofnode(dev), "display-timings");
 	node = ofnode_first_subnode(timing_node);
 
 	val = ofnode_read_u32_default(node, "bits-per-pixel", -1);
diff --git a/include/dm/device.h b/include/dm/device.h
index 4a1224bcc26..1b274206ea3 100644
--- a/include/dm/device.h
+++ b/include/dm/device.h
@@ -200,7 +200,11 @@ static inline void dev_bic_flags(struct udevice *dev, u32 bic)
  */
 static inline ofnode dev_ofnode(const struct udevice *dev)
 {
+#if !CONFIG_IS_ENABLED(OF_PLATDATA)
 	return dev->node;
+#else
+	return ofnode_null();
+#endif
 }
 
 /* Returns non-zero if the device is active (probed and not removed) */
@@ -208,12 +212,27 @@ static inline ofnode dev_ofnode(const struct udevice *dev)
 
 static inline int dev_of_offset(const struct udevice *dev)
 {
-	return ofnode_to_offset(dev->node);
+#if !CONFIG_IS_ENABLED(OF_PLATDATA)
+	return ofnode_to_offset(dev_ofnode(dev));
+#else
+	return -1;
+#endif
 }
 
 static inline bool dev_has_ofnode(const struct udevice *dev)
 {
-	return ofnode_valid(dev->node);
+#if !CONFIG_IS_ENABLED(OF_PLATDATA)
+	return ofnode_valid(dev_ofnode(dev));
+#else
+	return false;
+#endif
+}
+
+static inline void dev_set_ofnode(struct udevice *dev, ofnode node)
+{
+#if !CONFIG_IS_ENABLED(OF_PLATDATA)
+	dev->node = node;
+#endif
 }
 
 static inline int dev_seq(const struct udevice *dev)
diff --git a/include/dm/read.h b/include/dm/read.h
index d5cdd87911d..fc987f77598 100644
--- a/include/dm/read.h
+++ b/include/dm/read.h
@@ -21,7 +21,7 @@ struct resource;
 #if CONFIG_IS_ENABLED(OF_LIVE)
 static inline const struct device_node *dev_np(const struct udevice *dev)
 {
-	return ofnode_to_np(dev->node);
+	return ofnode_to_np(dev_ofnode(dev));
 }
 #else
 static inline const struct device_node *dev_np(const struct udevice *dev)
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 54d03d02402..927854950a0 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -334,12 +334,12 @@ struct mtd_info {
 #if IS_ENABLED(CONFIG_DM)
 static inline void mtd_set_ofnode(struct mtd_info *mtd, ofnode node)
 {
-	mtd->dev->node = node;
+	dev_set_ofnode(mtd->dev, node);
 }
 
 static inline const ofnode mtd_get_ofnode(struct mtd_info *mtd)
 {
-	return mtd->dev->node;
+	return dev_ofnode(mtd->dev);
 }
 #else
 struct device_node;
diff --git a/net/mdio-mux-uclass.c b/net/mdio-mux-uclass.c
index 5f38f9fde41..780526c19e3 100644
--- a/net/mdio-mux-uclass.c
+++ b/net/mdio-mux-uclass.c
@@ -163,7 +163,7 @@ static int dm_mdio_mux_post_bind(struct udevice *mux)
 	ofnode ch_node;
 	int err, first_err = 0;
 
-	if (!ofnode_valid(mux->node)) {
+	if (!dev_has_ofnode(mux)) {
 		debug("%s: no mux node found, no child MDIO busses set up\n",
 		      __func__);
 		return 0;
diff --git a/net/mdio-uclass.c b/net/mdio-uclass.c
index d062382c2a9..697e5f838d9 100644
--- a/net/mdio-uclass.c
+++ b/net/mdio-uclass.c
@@ -40,8 +40,8 @@ static int dm_mdio_post_bind(struct udevice *dev)
 	const char *dt_name;
 
 	/* set a custom name for the MDIO device, if present in DT */
-	if (ofnode_valid(dev->node)) {
-		dt_name = ofnode_read_string(dev->node, "device-name");
+	if (dev_has_ofnode(dev)) {
+		dt_name = dev_read_string(dev, "device-name");
 		if (dt_name) {
 			debug("renaming dev %s to %s\n", dev->name, dt_name);
 			device_set_name(dev, dt_name);
@@ -182,14 +182,14 @@ struct phy_device *dm_eth_phy_connect(struct udevice *ethdev)
 	struct phy_device *phy;
 	int i;
 
-	if (!ofnode_valid(ethdev->node)) {
+	if (!dev_has_ofnode(ethdev)) {
 		debug("%s: supplied eth dev has no DT node!\n", ethdev->name);
 		return NULL;
 	}
 
 	interface = PHY_INTERFACE_MODE_NONE;
 	for (i = 0; i < PHY_MODE_STR_CNT; i++) {
-		if_str = ofnode_read_string(ethdev->node, phy_mode_str[i]);
+		if_str = dev_read_string(ethdev, phy_mode_str[i]);
 		if (if_str) {
 			interface = phy_get_interface_by_name(if_str);
 			break;
-- 
2.29.2.684.gfbc64c5ab5-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
