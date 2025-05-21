Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CD8ABF683
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 May 2025 15:46:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C84BC78F6B;
	Wed, 21 May 2025 13:46:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 091DCC7128A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 May 2025 13:46:18 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LC0fN9017098;
 Wed, 21 May 2025 15:45:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 NCKSyKzz0QC8QbQggr/AFEcJuku37Etkrw6QR2/+wBM=; b=bpzO24D4J7fee/Ad
 MhM6apFmvJfnGOnKHKV2PkVcnPgArL3Sk3MUf9n4+6OW10gb1wTzqaykbbcHNo0X
 Muz21qzbhB0Z+tW2hCY2fbcX8PvCRL62SlZrzFS9omHpvQg5AAncUStcU9Vm+iAO
 d/Y9oY4whQvvsgBNvsYP1dPULho0z0Q1+EmRtore+d9NwCcccozr8q0BKTgKR8Nb
 T4NiugS0am6Pp99KV3tCP53mcIW06Mw39ovVvAyBDoEy+7HnD3QX2BZWyIId9AG7
 apeRzK81oawFPdeKsCL8C6rQVijrCyY9okmd7MMWqx6O/fb7Xtwo/txNpU6rjNlF
 404zOQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwfc4ag9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 May 2025 15:45:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 072DE4004A;
 Wed, 21 May 2025 15:43:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CEBF6B2CB7E;
 Wed, 21 May 2025 15:41:39 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 15:41:39 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 21 May 2025 15:41:15 +0200
Message-ID: <20250521134117.2828335-12-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250521134117.2828335-1-patrice.chotard@foss.st.com>
References: <20250521134117.2828335-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Joseph Chen <chenjh@rock-chips.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Huan Zhou <me@per1cycle.org>, Elaine Zhang <zhangqing@rock-chips.com>,
 Sumit Garg <sumit.garg@kernel.org>, Igor Opaniuk <igor.opaniuk@gmail.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Leo Yu-Chi Liang <ycliang@andestech.com>, Greg Malysa <malysagreg@gmail.com>,
 Simon Glass <sjg@chromium.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>
Subject: [Uboot-stm32] [PATCH v1 11/13] reset: stm32mp25: add stm32mp25
	reset driver
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

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

Implement STM32MP25 reset drivers using stm32-core-reset API.
This reset stm32-reset-core API and will be able to use DT binding
index started from 0.

This patch also moves legacy reset into stm32 directory reset.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 MAINTAINERS                            |   3 +-
 drivers/misc/stm32_rcc.c               |  66 +++++-----
 drivers/reset/Kconfig                  |   9 +-
 drivers/reset/Makefile                 |   4 +-
 drivers/reset/stm32-reset.c            |  97 ---------------
 drivers/reset/stm32/Kconfig            |  23 ++++
 drivers/reset/stm32/Makefile           |   9 ++
 drivers/reset/stm32/stm32-reset-core.c |  92 ++++++++++++++
 drivers/reset/stm32/stm32-reset-core.h |  31 +++++
 drivers/reset/stm32/stm32-reset-mp1.c  |  55 +++++++++
 drivers/reset/stm32/stm32-reset-mp25.c | 159 +++++++++++++++++++++++++
 drivers/reset/stm32/stm32-reset.c      |  43 +++++++
 include/stm32_rcc.h                    |   7 +-
 13 files changed, 460 insertions(+), 138 deletions(-)
 delete mode 100644 drivers/reset/stm32-reset.c
 create mode 100644 drivers/reset/stm32/Kconfig
 create mode 100644 drivers/reset/stm32/Makefile
 create mode 100644 drivers/reset/stm32/stm32-reset-core.c
 create mode 100644 drivers/reset/stm32/stm32-reset-core.h
 create mode 100644 drivers/reset/stm32/stm32-reset-mp1.c
 create mode 100644 drivers/reset/stm32/stm32-reset-mp25.c
 create mode 100644 drivers/reset/stm32/stm32-reset.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d62dd35a385..fc7b6ff2cd6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -718,7 +718,7 @@ F:	drivers/power/regulator/stm32-vrefbuf.c
 F:	drivers/power/regulator/stpmic1.c
 F:	drivers/ram/stm32mp1/
 F:	drivers/remoteproc/stm32_copro.c
-F:	drivers/reset/stm32-reset.c
+F:	drivers/reset/stm32/
 F:	drivers/rng/optee_rng.c
 F:	drivers/rng/stm32_rng.c
 F:	drivers/rtc/stm32_rtc.c
@@ -731,6 +731,7 @@ F:	include/dt-bindings/clock/stm32fx-clock.h
 F:	include/dt-bindings/clock/stm32mp*
 F:	include/dt-bindings/pinctrl/stm32-pinfunc.h
 F:	include/dt-bindings/reset/stm32mp*
+F:	include/stm32-reset-core.h
 F:	include/stm32_rcc.h
 F:	tools/logos/st.bmp
 F:	tools/stm32image.c
diff --git a/drivers/misc/stm32_rcc.c b/drivers/misc/stm32_rcc.c
index 5a6f979f91b..15bf69f7d57 100644
--- a/drivers/misc/stm32_rcc.c
+++ b/drivers/misc/stm32_rcc.c
@@ -14,47 +14,56 @@
 #include <dm/device_compat.h>
 #include <dm/lists.h>
 
-struct stm32_rcc_clk stm32_rcc_clk_f42x = {
-	.drv_name = "stm32fx_rcc_clock",
+static const struct stm32_rcc stm32_rcc_f42x = {
+	.drv_name_clk = "stm32fx_rcc_clock",
+	.drv_name_rst = "stm32_rcc_reset",
 	.soc = STM32F42X,
 };
 
-struct stm32_rcc_clk stm32_rcc_clk_f469 = {
-	.drv_name = "stm32fx_rcc_clock",
+static const struct stm32_rcc stm32_rcc_f469 = {
+	.drv_name_clk = "stm32fx_rcc_clock",
+	.drv_name_rst = "stm32_rcc_reset",
 	.soc = STM32F469,
 };
 
-struct stm32_rcc_clk stm32_rcc_clk_f7 = {
-	.drv_name = "stm32fx_rcc_clock",
+static const struct stm32_rcc stm32_rcc_f7 = {
+	.drv_name_clk = "stm32fx_rcc_clock",
+	.drv_name_rst = "stm32_rcc_reset",
 	.soc = STM32F7,
 };
 
-struct stm32_rcc_clk stm32_rcc_clk_h7 = {
-	.drv_name = "stm32h7_rcc_clock",
+static const struct stm32_rcc stm32_rcc_h7 = {
+	.drv_name_clk = "stm32h7_rcc_clock",
+	.drv_name_rst = "stm32_rcc_reset",
 };
 
-struct stm32_rcc_clk stm32_rcc_clk_mp1 = {
-	.drv_name = "stm32mp1_clk",
-	.soc = STM32MP1,
+static const struct stm32_rcc stm32_rcc_mp15 = {
+	.drv_name_clk = "stm32mp1_clk",
+	.drv_name_rst = "stm32mp1_reset",
 };
 
-struct stm32_rcc_clk stm32_rcc_clk_mp13 = {
-	.drv_name = "stm32mp13_clk",
-	.soc = STM32MP1,
+static const struct stm32_rcc stm32_rcc_mp13 = {
+	.drv_name_clk = "stm32mp13_clk",
+	.drv_name_rst = "stm32mp1_reset",
+};
+
+static const struct stm32_rcc stm32_rcc_mp25 = {
+	.drv_name_clk = "stm32mp25_clk",
+	.drv_name_rst = "stm32mp25_reset",
 };
 
 static int stm32_rcc_bind(struct udevice *dev)
 {
 	struct udevice *child;
 	struct driver *drv;
-	struct stm32_rcc_clk *rcc_clk =
-		(struct stm32_rcc_clk *)dev_get_driver_data(dev);
+	struct stm32_rcc *rcc_clk =
+		(struct stm32_rcc *)dev_get_driver_data(dev);
 	int ret;
 
 	dev_dbg(dev, "RCC bind\n");
-	drv = lists_driver_lookup_name(rcc_clk->drv_name);
+	drv = lists_driver_lookup_name(rcc_clk->drv_name_clk);
 	if (!drv) {
-		dev_err(dev, "Cannot find driver '%s'\n", rcc_clk->drv_name);
+		dev_err(dev, "Cannot find driver '%s'\n", rcc_clk->drv_name_clk);
 		return -ENOENT;
 	}
 
@@ -65,25 +74,24 @@ static int stm32_rcc_bind(struct udevice *dev)
 	if (ret)
 		return ret;
 
-	drv = lists_driver_lookup_name("stm32_rcc_reset");
+	drv = lists_driver_lookup_name(rcc_clk->drv_name_rst);
 	if (!drv) {
 		dev_err(dev, "Cannot find driver stm32_rcc_reset'\n");
 		return -ENOENT;
 	}
 
-	return device_bind_with_driver_data(dev, drv, dev->name,
-					    rcc_clk->soc,
-					    dev_ofnode(dev), &child);
+	return device_bind(dev, drv, dev->name, NULL, dev_ofnode(dev), &child);
 }
 
 static const struct udevice_id stm32_rcc_ids[] = {
-	{.compatible = "st,stm32f42xx-rcc", .data = (ulong)&stm32_rcc_clk_f42x },
-	{.compatible = "st,stm32f469-rcc", .data = (ulong)&stm32_rcc_clk_f469 },
-	{.compatible = "st,stm32f746-rcc", .data = (ulong)&stm32_rcc_clk_f7 },
-	{.compatible = "st,stm32h743-rcc", .data = (ulong)&stm32_rcc_clk_h7 },
-	{.compatible = "st,stm32mp1-rcc", .data = (ulong)&stm32_rcc_clk_mp1 },
-	{.compatible = "st,stm32mp1-rcc-secure", .data = (ulong)&stm32_rcc_clk_mp1 },
-	{.compatible = "st,stm32mp13-rcc", .data = (ulong)&stm32_rcc_clk_mp13 },
+	{.compatible = "st,stm32f42xx-rcc", .data = (ulong)&stm32_rcc_f42x },
+	{.compatible = "st,stm32f469-rcc", .data = (ulong)&stm32_rcc_f469 },
+	{.compatible = "st,stm32f746-rcc", .data = (ulong)&stm32_rcc_f7 },
+	{.compatible = "st,stm32h743-rcc", .data = (ulong)&stm32_rcc_h7 },
+	{.compatible = "st,stm32mp1-rcc", .data = (ulong)&stm32_rcc_mp15 },
+	{.compatible = "st,stm32mp1-rcc-secure", .data = (ulong)&stm32_rcc_mp15 },
+	{.compatible = "st,stm32mp13-rcc", .data = (ulong)&stm32_rcc_mp13 },
+	{.compatible = "st,stm32mp25-rcc", .data = (ulong)&stm32_rcc_mp25 },
 	{ }
 };
 
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index a0d079c4555..e92bb8a7c39 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -28,13 +28,6 @@ config STI_RESET
 	  Say Y if you want to control reset signals provided by system config
 	  block.
 
-config STM32_RESET
-	bool "Enable the STM32 reset"
-	depends on ARCH_STM32 || ARCH_STM32MP
-	help
-	  Support for reset controllers on STMicroelectronics STM32 family SoCs.
-	  This reset driver is compatible with STM32 F4/F7 and H7 SoCs.
-
 config TEGRA_CAR_RESET
 	bool "Enable Tegra CAR-based reset driver"
 	depends on TEGRA_CAR
@@ -258,4 +251,6 @@ config RESET_SPACEMIT_K1
 	help
 	  Support for SPACEMIT's K1 Reset system. Basic Assert/Deassert
 	  is supported.
+
+source "drivers/reset/stm32/Kconfig"
 endmenu
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 1dd3cd99a14..ee5b009d134 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -7,7 +7,6 @@ obj-$(CONFIG_DM_RESET) += reset-uclass.o
 obj-$(CONFIG_SANDBOX_MBOX) += sandbox-reset.o
 obj-$(CONFIG_SANDBOX_MBOX) += sandbox-reset-test.o
 obj-$(CONFIG_STI_RESET) += sti-reset.o
-obj-$(CONFIG_STM32_RESET) += stm32-reset.o
 obj-$(CONFIG_TEGRA_CAR_RESET) += tegra-car-reset.o
 obj-$(CONFIG_TEGRA186_RESET) += tegra186-reset.o
 obj-$(CONFIG_RESET_AIROHA) += reset-airoha.o
@@ -36,3 +35,6 @@ obj-$(CONFIG_RESET_AT91) += reset-at91.o
 obj-$(CONFIG_$(PHASE_)RESET_JH7110) += reset-jh7110.o
 obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) += reset-rzg2l-usbphy-ctrl.o
 obj-$(CONFIG_RESET_SPACEMIT_K1) += reset-spacemit-k1.o
+
+obj-$(CONFIG_ARCH_STM32) += stm32/
+obj-$(CONFIG_ARCH_STM32MP) += stm32/
diff --git a/drivers/reset/stm32-reset.c b/drivers/reset/stm32-reset.c
deleted file mode 100644
index 9d4f361b251..00000000000
--- a/drivers/reset/stm32-reset.c
+++ /dev/null
@@ -1,97 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
- */
-
-#define LOG_CATEGORY UCLASS_RESET
-
-#include <dm.h>
-#include <errno.h>
-#include <log.h>
-#include <malloc.h>
-#include <reset-uclass.h>
-#include <stm32_rcc.h>
-#include <asm/io.h>
-#include <dm/device_compat.h>
-#include <linux/bitops.h>
-
-/* offset of register without set/clear management */
-#define RCC_MP_GCR_OFFSET 0x10C
-
-/* reset clear offset for STM32MP RCC */
-#define RCC_CL 0x4
-
-struct stm32_reset_priv {
-	fdt_addr_t base;
-};
-
-static int stm32_reset_assert(struct reset_ctl *reset_ctl)
-{
-	struct stm32_reset_priv *priv = dev_get_priv(reset_ctl->dev);
-	int bank = (reset_ctl->id / (sizeof(u32) * BITS_PER_BYTE)) * 4;
-	int offset = reset_ctl->id % (sizeof(u32) * BITS_PER_BYTE);
-
-	dev_dbg(reset_ctl->dev, "reset id = %ld bank = %d offset = %d)\n",
-		reset_ctl->id, bank, offset);
-
-	if (dev_get_driver_data(reset_ctl->dev) == STM32MP1)
-		if (bank != RCC_MP_GCR_OFFSET)
-			/* reset assert is done in rcc set register */
-			writel(BIT(offset), priv->base + bank);
-		else
-			clrbits_le32(priv->base + bank, BIT(offset));
-	else
-		setbits_le32(priv->base + bank, BIT(offset));
-
-	return 0;
-}
-
-static int stm32_reset_deassert(struct reset_ctl *reset_ctl)
-{
-	struct stm32_reset_priv *priv = dev_get_priv(reset_ctl->dev);
-	int bank = (reset_ctl->id / (sizeof(u32) * BITS_PER_BYTE)) * 4;
-	int offset = reset_ctl->id % (sizeof(u32) * BITS_PER_BYTE);
-
-	dev_dbg(reset_ctl->dev, "reset id = %ld bank = %d offset = %d)\n",
-		reset_ctl->id, bank, offset);
-
-	if (dev_get_driver_data(reset_ctl->dev) == STM32MP1)
-		if (bank != RCC_MP_GCR_OFFSET)
-			/* reset deassert is done in rcc clr register */
-			writel(BIT(offset), priv->base + bank + RCC_CL);
-		else
-			setbits_le32(priv->base + bank, BIT(offset));
-	else
-		clrbits_le32(priv->base + bank, BIT(offset));
-
-	return 0;
-}
-
-static const struct reset_ops stm32_reset_ops = {
-	.rst_assert	= stm32_reset_assert,
-	.rst_deassert	= stm32_reset_deassert,
-};
-
-static int stm32_reset_probe(struct udevice *dev)
-{
-	struct stm32_reset_priv *priv = dev_get_priv(dev);
-
-	priv->base = dev_read_addr(dev);
-	if (priv->base == FDT_ADDR_T_NONE) {
-		/* for MFD, get address of parent */
-		priv->base = dev_read_addr(dev->parent);
-		if (priv->base == FDT_ADDR_T_NONE)
-			return -EINVAL;
-	}
-
-	return 0;
-}
-
-U_BOOT_DRIVER(stm32_rcc_reset) = {
-	.name			= "stm32_rcc_reset",
-	.id			= UCLASS_RESET,
-	.probe			= stm32_reset_probe,
-	.priv_auto	= sizeof(struct stm32_reset_priv),
-	.ops			= &stm32_reset_ops,
-};
diff --git a/drivers/reset/stm32/Kconfig b/drivers/reset/stm32/Kconfig
new file mode 100644
index 00000000000..39dcfa0a9ca
--- /dev/null
+++ b/drivers/reset/stm32/Kconfig
@@ -0,0 +1,23 @@
+config RESET_STM32
+	bool "Enable the STM32 reset"
+	depends on ARCH_STM32
+	default y
+	help
+	  Support for reset controllers on STMicroelectronics STM32 family SoCs.
+	  This reset driver is compatible with STM32 F4/F7 and H7 SoCs.
+
+config RESET_STM32MP1
+	bool "Enable the STM32MP1 reset"
+	depends on STM32MP13X || STM32MP15X
+	default y
+	help
+	  Support for reset controllers on STMicroelectronics STM32MP1 family SoCs.
+	  This reset driver is compatible with STM32MP13 and STM32MP15 SoCs.
+
+config RESET_STM32MP25
+	bool "Enable the STM32MP25 reset"
+	depends on STM32MP25X
+	default y
+	help
+	  Support for reset controllers on STMicroelectronics STM32MP2 family SoCs.
+	  This reset driver is compatible with STM32MP25 SoCs.
diff --git a/drivers/reset/stm32/Makefile b/drivers/reset/stm32/Makefile
new file mode 100644
index 00000000000..c31ae524ba1
--- /dev/null
+++ b/drivers/reset/stm32/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Copyright (C) 2024, STMicroelectronics - All Rights Reserved
+
+obj-y += stm32-reset-core.o
+
+obj-$(CONFIG_RESET_STM32) += stm32-reset.o
+obj-$(CONFIG_RESET_STM32MP1) += stm32-reset-mp1.o
+obj-$(CONFIG_RESET_STM32MP25) += stm32-reset-mp25.o
diff --git a/drivers/reset/stm32/stm32-reset-core.c b/drivers/reset/stm32/stm32-reset-core.c
new file mode 100644
index 00000000000..7dd92e07e1a
--- /dev/null
+++ b/drivers/reset/stm32/stm32-reset-core.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) 2024, STMicroelectronics - All Rights Reserved
+ * Author(s): Gabriel Fernandez, <gabriel.fernandez@foss.st.com> for STMicroelectronics.
+ */
+
+#include <dm.h>
+#include <reset-uclass.h>
+#include <stm32-reset-core.h>
+#include <stm32_rcc.h>
+#include <dm/device_compat.h>
+#include <linux/iopoll.h>
+
+static int stm32_reset_update(struct reset_ctl *reset_ctl, bool status)
+{
+	struct stm32_reset_priv *priv = dev_get_priv(reset_ctl->dev);
+	const struct stm32_reset_data *data = priv->data;
+	const struct stm32_reset_cfg *ptr_line;
+	fdt_addr_t addr;
+
+	assert(priv->data->get_reset_line);
+
+	ptr_line = priv->data->get_reset_line(reset_ctl);
+	if (!ptr_line)
+		return -EPERM;
+
+	addr = priv->base + ptr_line->offset;
+
+	dev_dbg(reset_ctl->dev, "reset id=%ld offset=0x%x bit=%d status=%d\n",
+		reset_ctl->id, ptr_line->offset, ptr_line->bit_idx, status);
+
+	status = ptr_line->inverted ^ status;
+
+	if (ptr_line->set_clr) {
+		if (!status)
+			addr += data->clear_offset;
+
+		writel(BIT(ptr_line->bit_idx), addr);
+
+	} else {
+		if (status)
+			setbits_le32(addr, BIT(ptr_line->bit_idx));
+		else
+			clrbits_le32(addr, BIT(ptr_line->bit_idx));
+	}
+
+	/* Check deassert */
+	if (!status) {
+		u32 reg;
+
+		return readl_poll_timeout(addr, reg,
+					  !(reg & BIT(ptr_line->bit_idx)),
+					  data->reset_us);
+	}
+
+	return 0;
+}
+
+static int stm32_reset_assert(struct reset_ctl *reset_ctl)
+{
+	return stm32_reset_update(reset_ctl, true);
+}
+
+static int stm32_reset_deassert(struct reset_ctl *reset_ctl)
+{
+	return stm32_reset_update(reset_ctl, false);
+}
+
+const struct reset_ops stm32_reset_ops = {
+	.rst_assert	= stm32_reset_assert,
+	.rst_deassert	= stm32_reset_deassert,
+};
+
+int stm32_reset_core_probe(struct udevice *dev,
+			   const struct stm32_reset_data *data)
+{
+	struct stm32_reset_priv *priv = dev_get_priv(dev);
+
+	priv->base = dev_read_addr(dev);
+	if (priv->base == FDT_ADDR_T_NONE) {
+		/* for MFD, get address of parent */
+		priv->base = dev_read_addr(dev->parent);
+		if (priv->base == FDT_ADDR_T_NONE)
+			return -EINVAL;
+	}
+
+	priv->data = data;
+
+	assert(priv->data);
+
+	return 0;
+}
diff --git a/drivers/reset/stm32/stm32-reset-core.h b/drivers/reset/stm32/stm32-reset-core.h
new file mode 100644
index 00000000000..25a1aa152cb
--- /dev/null
+++ b/drivers/reset/stm32/stm32-reset-core.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause */
+/*
+ * Copyright (C) 2025, STMicroelectronics - All Rights Reserved
+ * Author(s): Gabriel Fernandez, <gabriel.fernandez@foss.st.com> for STMicroelectronics.
+ */
+
+#include <reset-uclass.h>
+
+struct stm32_reset_cfg {
+	u16 offset;
+	u8 bit_idx;
+	bool set_clr;
+	bool inverted;
+};
+
+struct stm32_reset_data {
+	const struct stm32_reset_cfg * (*get_reset_line)(struct reset_ctl *reset_ctl);
+	u32 clear_offset;
+	u32 reset_us;
+};
+
+struct stm32_reset_priv {
+	fdt_addr_t base;
+	struct stm32_reset_cfg reset_line;
+	const struct stm32_reset_data *data;
+};
+
+extern const struct reset_ops stm32_reset_ops;
+
+int stm32_reset_core_probe(struct udevice *dev,
+			   const struct stm32_reset_data *data);
diff --git a/drivers/reset/stm32/stm32-reset-mp1.c b/drivers/reset/stm32/stm32-reset-mp1.c
new file mode 100644
index 00000000000..6863f6e64b7
--- /dev/null
+++ b/drivers/reset/stm32/stm32-reset-mp1.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
+ */
+
+#include <dm.h>
+#include <stm32-reset-core.h>
+
+/* Reset clear offset for STM32MP RCC */
+#define RCC_CLR_OFFSET			0x4
+
+/* Offset of register without set/clear management */
+#define RCC_MP_GCR_OFFSET		0x10C
+
+/* Timeout for deassert */
+#define STM32_DEASSERT_TIMEOUT_US	10000
+
+static const struct stm32_reset_cfg *stm32_get_reset_line(struct reset_ctl *reset_ctl)
+{
+	struct stm32_reset_priv *priv = dev_get_priv(reset_ctl->dev);
+	struct stm32_reset_cfg *ptr_line = &priv->reset_line;
+	int bank = (reset_ctl->id / (sizeof(u32) * BITS_PER_BYTE)) * 4;
+	int offset = reset_ctl->id % (sizeof(u32) * BITS_PER_BYTE);
+
+	ptr_line->offset = bank;
+	ptr_line->bit_idx = offset;
+	ptr_line->set_clr = true;
+
+	if (ptr_line->offset == RCC_MP_GCR_OFFSET) {
+		ptr_line->set_clr = false;
+		ptr_line->inverted = true;
+	}
+
+	return ptr_line;
+}
+
+static const struct stm32_reset_data stm32mp1_reset_data = {
+	.get_reset_line	= stm32_get_reset_line,
+	.clear_offset	= RCC_CLR_OFFSET,
+	.reset_us	= STM32_DEASSERT_TIMEOUT_US,
+};
+
+static int stm32_reset_probe(struct udevice *dev)
+{
+	return stm32_reset_core_probe(dev, &stm32mp1_reset_data);
+}
+
+U_BOOT_DRIVER(stm32mp25_rcc_reset) = {
+	.name		= "stm32mp1_reset",
+	.id		= UCLASS_RESET,
+	.probe		= stm32_reset_probe,
+	.priv_auto	= sizeof(struct stm32_reset_priv),
+	.ops		= &stm32_reset_ops,
+};
diff --git a/drivers/reset/stm32/stm32-reset-mp25.c b/drivers/reset/stm32/stm32-reset-mp25.c
new file mode 100644
index 00000000000..5e154f286d2
--- /dev/null
+++ b/drivers/reset/stm32/stm32-reset-mp25.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) 2024, STMicroelectronics - All Rights Reserved
+ * Author(s): Gabriel Fernandez, <gabriel.fernandez@foss.st.com> for STMicroelectronics.
+ */
+
+#include <dm.h>
+#include <stm32-reset-core.h>
+#include <stm32mp25_rcc.h>
+#include <dt-bindings/reset/st,stm32mp25-rcc.h>
+
+/* Reset clear offset for STM32MP RCC */
+#define RCC_CLR_OFFSET			0x4
+
+/* Timeout for deassert */
+#define STM32_DEASSERT_TIMEOUT_US	10000
+
+#define RESET(id, _offset, _bit_idx, _set_clr)		\
+	[id] = &(struct stm32_reset_cfg){		\
+		.offset		= (_offset),		\
+		.bit_idx	= (_bit_idx),		\
+		.set_clr	= (_set_clr),		\
+	}
+
+static const struct stm32_reset_cfg *stm32mp25_reset[STM32MP25_LAST_RESET] = {
+	RESET(TIM1_R,		RCC_TIM1CFGR,		0,	0),
+	RESET(TIM2_R,		RCC_TIM2CFGR,		0,	0),
+	RESET(TIM3_R,		RCC_TIM3CFGR,		0,	0),
+	RESET(TIM4_R,		RCC_TIM4CFGR,		0,	0),
+	RESET(TIM5_R,		RCC_TIM5CFGR,		0,	0),
+	RESET(TIM6_R,		RCC_TIM6CFGR,		0,	0),
+	RESET(TIM7_R,		RCC_TIM7CFGR,		0,	0),
+	RESET(TIM8_R,		RCC_TIM8CFGR,		0,	0),
+	RESET(TIM10_R,		RCC_TIM10CFGR,		0,	0),
+	RESET(TIM11_R,		RCC_TIM11CFGR,		0,	0),
+	RESET(TIM12_R,		RCC_TIM12CFGR,		0,	0),
+	RESET(TIM13_R,		RCC_TIM13CFGR,		0,	0),
+	RESET(TIM14_R,		RCC_TIM14CFGR,		0,	0),
+	RESET(TIM15_R,		RCC_TIM15CFGR,		0,	0),
+	RESET(TIM16_R,		RCC_TIM16CFGR,		0,	0),
+	RESET(TIM17_R,		RCC_TIM17CFGR,		0,	0),
+	RESET(TIM20_R,		RCC_TIM20CFGR,		0,	0),
+	RESET(LPTIM1_R,		RCC_LPTIM1CFGR,		0,	0),
+	RESET(LPTIM2_R,		RCC_LPTIM2CFGR,		0,	0),
+	RESET(LPTIM3_R,		RCC_LPTIM3CFGR,		0,	0),
+	RESET(LPTIM4_R,		RCC_LPTIM4CFGR,		0,	0),
+	RESET(LPTIM5_R,		RCC_LPTIM5CFGR,		0,	0),
+	RESET(SPI1_R,		RCC_SPI1CFGR,		0,	0),
+	RESET(SPI2_R,		RCC_SPI2CFGR,		0,	0),
+	RESET(SPI3_R,		RCC_SPI3CFGR,		0,	0),
+	RESET(SPI4_R,		RCC_SPI4CFGR,		0,	0),
+	RESET(SPI5_R,		RCC_SPI5CFGR,		0,	0),
+	RESET(SPI6_R,		RCC_SPI6CFGR,		0,	0),
+	RESET(SPI7_R,		RCC_SPI7CFGR,		0,	0),
+	RESET(SPI8_R,		RCC_SPI8CFGR,		0,	0),
+	RESET(SPDIFRX_R,	RCC_SPDIFRXCFGR,	0,	0),
+	RESET(USART1_R,		RCC_USART1CFGR,		0,	0),
+	RESET(USART2_R,		RCC_USART2CFGR,		0,	0),
+	RESET(USART3_R,		RCC_USART3CFGR,		0,	0),
+	RESET(UART4_R,		RCC_UART4CFGR,		0,	0),
+	RESET(UART5_R,		RCC_UART5CFGR,		0,	0),
+	RESET(USART6_R,		RCC_USART6CFGR,		0,	0),
+	RESET(UART7_R,		RCC_UART7CFGR,		0,	0),
+	RESET(UART8_R,		RCC_UART8CFGR,		0,	0),
+	RESET(UART9_R,		RCC_UART9CFGR,		0,	0),
+	RESET(LPUART1_R,	RCC_LPUART1CFGR,	0,	0),
+	RESET(IS2M_R,		RCC_IS2MCFGR,		0,	0),
+	RESET(I2C1_R,		RCC_I2C1CFGR,		0,	0),
+	RESET(I2C2_R,		RCC_I2C2CFGR,		0,	0),
+	RESET(I2C3_R,		RCC_I2C3CFGR,		0,	0),
+	RESET(I2C4_R,		RCC_I2C4CFGR,		0,	0),
+	RESET(I2C5_R,		RCC_I2C5CFGR,		0,	0),
+	RESET(I2C6_R,		RCC_I2C6CFGR,		0,	0),
+	RESET(I2C7_R,		RCC_I2C7CFGR,		0,	0),
+	RESET(I2C8_R,		RCC_I2C8CFGR,		0,	0),
+	RESET(SAI1_R,		RCC_SAI1CFGR,		0,	0),
+	RESET(SAI2_R,		RCC_SAI2CFGR,		0,	0),
+	RESET(SAI3_R,		RCC_SAI3CFGR,		0,	0),
+	RESET(SAI4_R,		RCC_SAI4CFGR,		0,	0),
+	RESET(MDF1_R,		RCC_MDF1CFGR,		0,	0),
+	RESET(MDF2_R,		RCC_ADF1CFGR,		0,	0),
+	RESET(FDCAN_R,		RCC_FDCANCFGR,		0,	0),
+	RESET(HDP_R,		RCC_HDPCFGR,		0,	0),
+	RESET(ADC12_R,		RCC_ADC12CFGR,		0,	0),
+	RESET(ADC3_R,		RCC_ADC3CFGR,		0,	0),
+	RESET(ETH1_R,		RCC_ETH1CFGR,		0,	0),
+	RESET(ETH2_R,		RCC_ETH2CFGR,		0,	0),
+	RESET(USBH_R,		RCC_USB2CFGR,		0,	0),
+	RESET(USB2PHY1_R,	RCC_USB2PHY1CFGR,	0,	0),
+	RESET(USB2PHY2_R,	RCC_USB2PHY2CFGR,	0,	0),
+	RESET(USB3DR_R,		RCC_USB3DRCFGR,		0,	0),
+	RESET(USB3PCIEPHY_R,	RCC_USB3PCIEPHYCFGR,	0,	0),
+	RESET(USBTC_R,		RCC_UCPDCFGR,		0,	0),
+	RESET(ETHSW_R,		RCC_ETHSWCFGR,		0,	0),
+	RESET(SDMMC1_R,		RCC_SDMMC1CFGR,		0,	0),
+	RESET(SDMMC1DLL_R,	RCC_SDMMC1CFGR,		16,	0),
+	RESET(SDMMC2_R,		RCC_SDMMC2CFGR,		0,	0),
+	RESET(SDMMC2DLL_R,	RCC_SDMMC2CFGR,		16,	0),
+	RESET(SDMMC3_R,		RCC_SDMMC3CFGR,		0,	0),
+	RESET(SDMMC3DLL_R,	RCC_SDMMC3CFGR,		16,	0),
+	RESET(GPU_R,		RCC_GPUCFGR,		0,	0),
+	RESET(LTDC_R,		RCC_LTDCCFGR,		0,	0),
+	RESET(DSI_R,		RCC_DSICFGR,		0,	0),
+	RESET(LVDS_R,		RCC_LVDSCFGR,		0,	0),
+	RESET(CSI_R,		RCC_CSICFGR,		0,	0),
+	RESET(DCMIPP_R,		RCC_DCMIPPCFGR,		0,	0),
+	RESET(CCI_R,		RCC_CCICFGR,		0,	0),
+	RESET(VDEC_R,		RCC_VDECCFGR,		0,	0),
+	RESET(VENC_R,		RCC_VENCCFGR,		0,	0),
+	RESET(WWDG1_R,		RCC_WWDG1CFGR,		0,	0),
+	RESET(WWDG2_R,		RCC_WWDG2CFGR,		0,	0),
+	RESET(VREF_R,		RCC_VREFCFGR,		0,	0),
+	RESET(DTS_R,		RCC_DTSCFGR,		0,	0),
+	RESET(CRC_R,		RCC_CRCCFGR,		0,	0),
+	RESET(SERC_R,		RCC_SERCCFGR,		0,	0),
+	RESET(OSPIIOM_R,	RCC_OSPIIOMCFGR,	0,	0),
+	RESET(I3C1_R,		RCC_I3C1CFGR,		0,	0),
+	RESET(I3C2_R,		RCC_I3C2CFGR,		0,	0),
+	RESET(I3C3_R,		RCC_I3C3CFGR,		0,	0),
+	RESET(I3C4_R,		RCC_I3C4CFGR,		0,	0),
+	RESET(IWDG2_KER_R,	RCC_IWDGC1CFGSETR,	18,	1),
+	RESET(IWDG4_KER_R,	RCC_IWDGC2CFGSETR,	18,	1),
+	RESET(RNG_R,		RCC_RNGCFGR,		0,	0),
+	RESET(PKA_R,		RCC_PKACFGR,		0,	0),
+	RESET(SAES_R,		RCC_SAESCFGR,		0,	0),
+	RESET(HASH_R,		RCC_HASHCFGR,		0,	0),
+	RESET(CRYP1_R,		RCC_CRYP1CFGR,		0,	0),
+	RESET(CRYP2_R,		RCC_CRYP2CFGR,		0,	0),
+	RESET(PCIE_R,		RCC_PCIECFGR,		0,	0),
+};
+
+static const struct stm32_reset_cfg *stm32_get_reset_line(struct reset_ctl *reset_ctl)
+{
+	unsigned long id = reset_ctl->id;
+
+	if (id < STM32MP25_LAST_RESET)
+		return stm32mp25_reset[id];
+
+	return NULL;
+}
+
+static const struct stm32_reset_data stm32mp25_reset_data = {
+	.get_reset_line	= stm32_get_reset_line,
+	.clear_offset	= RCC_CLR_OFFSET,
+	.reset_us	= STM32_DEASSERT_TIMEOUT_US,
+};
+
+static int stm32_reset_probe(struct udevice *dev)
+{
+	return stm32_reset_core_probe(dev, &stm32mp25_reset_data);
+}
+
+U_BOOT_DRIVER(stm32mp25_rcc_reset) = {
+	.name		= "stm32mp25_reset",
+	.id		= UCLASS_RESET,
+	.probe		= stm32_reset_probe,
+	.priv_auto	= sizeof(struct stm32_reset_priv),
+	.ops		= &stm32_reset_ops,
+};
diff --git a/drivers/reset/stm32/stm32-reset.c b/drivers/reset/stm32/stm32-reset.c
new file mode 100644
index 00000000000..975f67f712a
--- /dev/null
+++ b/drivers/reset/stm32/stm32-reset.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
+ * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
+ */
+
+#include <dm.h>
+#include <stm32-reset-core.h>
+
+/* Timeout for deassert */
+#define STM32_DEASSERT_TIMEOUT_US	10000
+
+static const struct stm32_reset_cfg *stm32_get_reset_line(struct reset_ctl *reset_ctl)
+{
+	struct stm32_reset_priv *priv = dev_get_priv(reset_ctl->dev);
+	struct stm32_reset_cfg *ptr_line = &priv->reset_line;
+	int bank = (reset_ctl->id / (sizeof(u32) * BITS_PER_BYTE)) * 4;
+	int offset = reset_ctl->id % (sizeof(u32) * BITS_PER_BYTE);
+
+	ptr_line->offset = bank;
+	ptr_line->bit_idx = offset;
+	ptr_line->set_clr = true;
+
+	return ptr_line;
+}
+
+static const struct stm32_reset_data stm32_reset_data = {
+	.get_reset_line	= stm32_get_reset_line,
+	.reset_us	= STM32_DEASSERT_TIMEOUT_US,
+};
+
+static int stm32_reset_probe(struct udevice *dev)
+{
+	return stm32_reset_core_probe(dev, &stm32_reset_data);
+}
+
+U_BOOT_DRIVER(stm32_rcc_reset) = {
+	.name		= "stm32_rcc_reset",
+	.id		= UCLASS_RESET,
+	.probe		= stm32_reset_probe,
+	.priv_auto	= sizeof(struct stm32_reset_priv),
+	.ops		= &stm32_reset_ops,
+};
diff --git a/include/stm32_rcc.h b/include/stm32_rcc.h
index b559ea77281..447a555dcf5 100644
--- a/include/stm32_rcc.h
+++ b/include/stm32_rcc.h
@@ -39,11 +39,11 @@ struct stm32_clk_info {
 	bool v2;
 };
 
+/* platdata used for clk-stm32f.c driver */
 enum soc_family {
 	STM32F42X,
 	STM32F469,
 	STM32F7,
-	STM32MP1,
 };
 
 enum apb {
@@ -51,8 +51,9 @@ enum apb {
 	APB2,
 };
 
-struct stm32_rcc_clk {
-	char *drv_name;
+struct stm32_rcc {
+	char *drv_name_clk;
+	char *drv_name_rst;
 	enum soc_family soc;
 };
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
