Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA35BFCD1
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Apr 2019 17:26:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 908F8C35E07
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Apr 2019 15:26:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0EA6C35E07
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2019 15:26:35 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3UFNEYf003609; Tue, 30 Apr 2019 17:26:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=uUO16O3QDVb923/3VxlwqTQGvxg3LdRD6flIrdLZ4Uw=;
 b=QwYLeB/qBS7BklfTlEb9fSTMhLr+MWjIGfzOpfHxy6jhSQMrdFBPLi1M60CZl4c/hHne
 FaIxmOwNk/y1i1i6y+bcnYlITLMoDkoDo/gbP9/snMJ72pz4CHS0Xw7uvYJjCV7aOt3y
 oE9e05b+NtGN/QXlKZM53Cnbx+Tt3m4BFOB7eGRopQcUsXQuTtZTTmHEgA2XwnY3WUee
 12XfN4KoTIKM5eDOtwmmgimp1e1zyMETQXhhnGtP+psq+NfhU82H1rkZiYVgCC8NjjeE
 yezgtJiixgM7IPWVmuo176dZzG+bM4RbIZdYsCZXk8Kyo/6EIW01BABeNr+PikcAFdTQ ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2s6rs8g27t-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Apr 2019 17:26:32 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5191A34;
 Tue, 30 Apr 2019 15:26:32 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 339C128B8;
 Tue, 30 Apr 2019 15:26:32 +0000 (GMT)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Tue, 30 Apr 2019 17:26:31 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: Simon Glass <sjg@chromium.org>, <michal.simek@xilinx.com>, <sr@denx.de>,
 <u-boot@lists.denx.de>
Date: Tue, 30 Apr 2019 17:26:22 +0200
Message-ID: <1556637983-5654-4-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556637983-5654-1-git-send-email-patrice.chotard@st.com>
References: <1556637983-5654-1-git-send-email-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2 3/4] watchdog: stm32mp: Add watchdog driver
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

This patch adds IWDG (Independent WatchDoG) support for
STM32MP platform.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

Changes in v2:
   - Rename timeout variable in timeout_ms in stm32mp_wdt_start()

 MAINTAINERS                    |   1 +
 arch/arm/mach-stm32mp/Kconfig  |   1 +
 drivers/watchdog/Kconfig       |   8 +++
 drivers/watchdog/Makefile      |   1 +
 drivers/watchdog/stm32mp_wdt.c | 135 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 146 insertions(+)
 create mode 100644 drivers/watchdog/stm32mp_wdt.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 09f31cd..eec2603 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -311,6 +311,7 @@ F:	drivers/ram/stm32mp1/
 F:	drivers/misc/stm32_rcc.c
 F:	drivers/reset/stm32-reset.c
 F:	drivers/spi/stm32_qspi.c
+F:	drivers/watchdog/stm32mp_wdt.c
 
 ARM STM STV0991
 M:	Vikas Manocha <vikas.manocha@st.com>
diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 73aa382..4e7cc2e 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -17,6 +17,7 @@ config SPL
 	select SPL_DM_RESET
 	select SPL_SERIAL_SUPPORT
 	select SPL_SYSCON
+	select SPL_WATCHDOG_SUPPORT
 	imply SPL_DISPLAY_PRINT
 	imply SPL_LIBDISK_SUPPORT
 
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 4a3ff7a..d582abe 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -147,6 +147,14 @@ config WDT_SANDBOX
 	  can be probed and supports all of the methods of WDT, but does not
 	  really do anything.
 
+config WDT_STM32MP
+	bool "IWDG watchdog driver for STM32 MP's family"
+	depends on WDT
+	imply WATCHDOG
+	help
+	  Enable the STM32 watchdog (IWDG) driver. Enable support to
+	  configure STM32's on-SoC watchdog.
+
 config XILINX_TB_WATCHDOG
 	bool "Xilinx Axi watchdog timer support"
 	depends on WDT
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 40b2f4b..a3ebff8 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -27,3 +27,4 @@ obj-$(CONFIG_WDT_CDNS) += cdns_wdt.o
 obj-$(CONFIG_WDT_MPC8xx) += mpc8xx_wdt.o
 obj-$(CONFIG_WDT_MT7621) += mt7621_wdt.o
 obj-$(CONFIG_WDT_MTK) += mtk_wdt.o
+obj-$(CONFIG_WDT_STM32MP) += stm32mp_wdt.o
diff --git a/drivers/watchdog/stm32mp_wdt.c b/drivers/watchdog/stm32mp_wdt.c
new file mode 100644
index 0000000..8093d0a
--- /dev/null
+++ b/drivers/watchdog/stm32mp_wdt.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+/*
+ * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
+ */
+
+#include <common.h>
+#include <clk.h>
+#include <dm.h>
+#include <syscon.h>
+#include <wdt.h>
+#include <asm/io.h>
+#include <linux/iopoll.h>
+
+/* IWDG registers */
+#define IWDG_KR		0x00	/* Key register */
+#define IWDG_PR		0x04	/* Prescaler Register */
+#define IWDG_RLR	0x08	/* ReLoad Register */
+#define IWDG_SR		0x0C	/* Status Register */
+
+/* IWDG_KR register bit mask */
+#define KR_KEY_RELOAD	0xAAAA	/* Reload counter enable */
+#define KR_KEY_ENABLE	0xCCCC	/* Peripheral enable */
+#define KR_KEY_EWA	0x5555	/* Write access enable */
+
+/* IWDG_PR register bit values */
+#define PR_256		0x06	/* Prescaler set to 256 */
+
+/* IWDG_RLR register values */
+#define RLR_MAX		0xFFF	/* Max value supported by reload register */
+
+/* IWDG_SR register bit values */
+#define SR_PVU		BIT(0)	/* Watchdog prescaler value update */
+#define SR_RVU		BIT(1)	/* Watchdog counter reload value update */
+
+struct stm32mp_wdt_priv {
+	fdt_addr_t base;		/* registers addr in physical memory */
+	unsigned long wdt_clk_rate;	/* Watchdog dedicated clock rate */
+};
+
+static int stm32mp_wdt_reset(struct udevice *dev)
+{
+	struct stm32mp_wdt_priv *priv = dev_get_priv(dev);
+
+	writel(KR_KEY_RELOAD, priv->base + IWDG_KR);
+
+	return 0;
+}
+
+static int stm32mp_wdt_start(struct udevice *dev, u64 timeout_ms, ulong flags)
+{
+	struct stm32mp_wdt_priv *priv = dev_get_priv(dev);
+	int reload;
+	u32 val;
+	int ret;
+
+	/* Prescaler fixed to 256 */
+	reload = timeout_ms * priv->wdt_clk_rate / 256;
+	if (reload > RLR_MAX + 1)
+		/* Force to max watchdog counter reload value */
+		reload = RLR_MAX + 1;
+	else if (!reload)
+		/* Force to min watchdog counter reload value */
+		reload = priv->wdt_clk_rate / 256;
+
+	/* Set prescaler & reload registers */
+	writel(KR_KEY_EWA, priv->base + IWDG_KR);
+	writel(PR_256, priv->base + IWDG_PR);
+	writel(reload - 1, priv->base + IWDG_RLR);
+
+	/* Enable watchdog */
+	writel(KR_KEY_ENABLE, priv->base + IWDG_KR);
+
+	/* Wait for the registers to be updated */
+	ret = readl_poll_timeout(priv->base + IWDG_SR, val,
+				 val & (SR_PVU | SR_RVU), CONFIG_SYS_HZ);
+
+	if (ret < 0) {
+		pr_err("Updating IWDG registers timeout");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int stm32mp_wdt_probe(struct udevice *dev)
+{
+	struct stm32mp_wdt_priv *priv = dev_get_priv(dev);
+	struct clk clk;
+	int ret;
+
+	debug("IWDG init\n");
+
+	priv->base = devfdt_get_addr(dev);
+	if (priv->base == FDT_ADDR_T_NONE)
+		return -EINVAL;
+
+	/* Enable clock */
+	ret = clk_get_by_name(dev, "pclk", &clk);
+	if (ret)
+		return ret;
+
+	ret = clk_enable(&clk);
+	if (ret)
+		return ret;
+
+	/* Get LSI clock */
+	ret = clk_get_by_name(dev, "lsi", &clk);
+	if (ret)
+		return ret;
+
+	priv->wdt_clk_rate = clk_get_rate(&clk);
+
+	debug("IWDG init done\n");
+
+	return 0;
+}
+
+static const struct wdt_ops stm32mp_wdt_ops = {
+	.start = stm32mp_wdt_start,
+	.reset = stm32mp_wdt_reset,
+};
+
+static const struct udevice_id stm32mp_wdt_match[] = {
+	{ .compatible = "st,stm32mp1-iwdg" },
+	{ /* sentinel */ }
+};
+
+U_BOOT_DRIVER(stm32mp_wdt) = {
+	.name = "stm32mp-wdt",
+	.id = UCLASS_WDT,
+	.of_match = stm32mp_wdt_match,
+	.priv_auto_alloc_size = sizeof(struct stm32mp_wdt_priv),
+	.probe = stm32mp_wdt_probe,
+	.ops = &stm32mp_wdt_ops,
+};
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
