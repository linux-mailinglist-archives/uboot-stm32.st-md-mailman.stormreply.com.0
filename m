Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC3D876EBE
	for <lists+uboot-stm32@lfdr.de>; Sat,  9 Mar 2024 03:18:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1D61C6DD96;
	Sat,  9 Mar 2024 02:18:55 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CB63C6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Mar 2024 02:18:55 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2C3BA87D42;
 Sat,  9 Mar 2024 03:18:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1709950734;
 bh=IDoQdJVWruZjjrBdiYGYbt9qzuiFC9ASwFEEWj1AsK8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UngVwqSDuQ9YW4AKKUBDtVZIlOd3oUe2JYqdd2V9Teb4Z95fIyILKE+OlP6hTGjDV
 CaakLM7NlNIFnWc3e+yn45tydMvGL+GDhp5Wo1qmGj+wBinLrjX7k9RO3hQvuZfbll
 4aA1Ei6gmyyRhiFHzi1wbaXnzNgS43a6po0rly622JdhkY3XfO/CjAwobRElzMiBJL
 t0IxxTCPfBP4yTnf4u81lKI8Ru8jEzDSmcx3cDfbNxgzXpphY9kjMXtaQap7iYuPz6
 fHMw8kBWG9x6RJmosbrJCcVvA5dLEe71fRAKiPMifLkUhk1e4GYfucxHNyQ0GOLr4E
 xJcJQi+3pbqvA==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Sat,  9 Mar 2024 03:11:22 +0100
Message-ID: <20240309021831.264018-2-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240309021831.264018-1-marex@denx.de>
References: <20240309021831.264018-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, u-boot@dh-electronics.com,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Christophe Roullier <christophe.roullier@st.com>
Subject: [Uboot-stm32] [PATCH 01/11] net: dwc_eth_qos: Split STM32 glue into
	separate file
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

Move STM32 glue code into separate file to contain the STM32 specific
code outside of the DWMAC core code. No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Christophe Roullier <christophe.roullier@st.com>
Cc: Joe Hershberger <joe.hershberger@ni.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Ramon Fried <rfried.dev@gmail.com>
Cc: u-boot@dh-electronics.com
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 drivers/net/Makefile            |   1 +
 drivers/net/dwc_eth_qos.c       | 165 ---------------------------
 drivers/net/dwc_eth_qos.h       |   1 +
 drivers/net/dwc_eth_qos_stm32.c | 196 ++++++++++++++++++++++++++++++++
 4 files changed, 198 insertions(+), 165 deletions(-)
 create mode 100644 drivers/net/dwc_eth_qos_stm32.c

diff --git a/drivers/net/Makefile b/drivers/net/Makefile
index 6677366ebd6..dc3404519d6 100644
--- a/drivers/net/Makefile
+++ b/drivers/net/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_DWC_ETH_QOS_IMX) += dwc_eth_qos_imx.o
 obj-$(CONFIG_DWC_ETH_QOS_ROCKCHIP) += dwc_eth_qos_rockchip.o
 obj-$(CONFIG_DWC_ETH_QOS_QCOM) += dwc_eth_qos_qcom.o
 obj-$(CONFIG_DWC_ETH_QOS_STARFIVE) += dwc_eth_qos_starfive.o
+obj-$(CONFIG_DWC_ETH_QOS_STM32) += dwc_eth_qos_stm32.o
 obj-$(CONFIG_E1000) += e1000.o
 obj-$(CONFIG_E1000_SPI) += e1000_spi.o
 obj-$(CONFIG_EEPRO100) += eepro100.o
diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
index 9b3bce1dc87..533c2bf070b 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -295,58 +295,6 @@ err:
 #endif
 }
 
-static int eqos_start_clks_stm32(struct udevice *dev)
-{
-#ifdef CONFIG_CLK
-	struct eqos_priv *eqos = dev_get_priv(dev);
-	int ret;
-
-	debug("%s(dev=%p):\n", __func__, dev);
-
-	ret = clk_enable(&eqos->clk_master_bus);
-	if (ret < 0) {
-		pr_err("clk_enable(clk_master_bus) failed: %d", ret);
-		goto err;
-	}
-
-	ret = clk_enable(&eqos->clk_rx);
-	if (ret < 0) {
-		pr_err("clk_enable(clk_rx) failed: %d", ret);
-		goto err_disable_clk_master_bus;
-	}
-
-	ret = clk_enable(&eqos->clk_tx);
-	if (ret < 0) {
-		pr_err("clk_enable(clk_tx) failed: %d", ret);
-		goto err_disable_clk_rx;
-	}
-
-	if (clk_valid(&eqos->clk_ck) && !eqos->clk_ck_enabled) {
-		ret = clk_enable(&eqos->clk_ck);
-		if (ret < 0) {
-			pr_err("clk_enable(clk_ck) failed: %d", ret);
-			goto err_disable_clk_tx;
-		}
-		eqos->clk_ck_enabled = true;
-	}
-#endif
-
-	debug("%s: OK\n", __func__);
-	return 0;
-
-#ifdef CONFIG_CLK
-err_disable_clk_tx:
-	clk_disable(&eqos->clk_tx);
-err_disable_clk_rx:
-	clk_disable(&eqos->clk_rx);
-err_disable_clk_master_bus:
-	clk_disable(&eqos->clk_master_bus);
-err:
-	debug("%s: FAILED: %d\n", __func__, ret);
-	return ret;
-#endif
-}
-
 static int eqos_stop_clks_tegra186(struct udevice *dev)
 {
 #ifdef CONFIG_CLK
@@ -365,22 +313,6 @@ static int eqos_stop_clks_tegra186(struct udevice *dev)
 	return 0;
 }
 
-static int eqos_stop_clks_stm32(struct udevice *dev)
-{
-#ifdef CONFIG_CLK
-	struct eqos_priv *eqos = dev_get_priv(dev);
-
-	debug("%s(dev=%p):\n", __func__, dev);
-
-	clk_disable(&eqos->clk_tx);
-	clk_disable(&eqos->clk_rx);
-	clk_disable(&eqos->clk_master_bus);
-#endif
-
-	debug("%s: OK\n", __func__);
-	return 0;
-}
-
 static int eqos_start_resets_tegra186(struct udevice *dev)
 {
 	struct eqos_priv *eqos = dev_get_priv(dev);
@@ -493,17 +425,6 @@ static ulong eqos_get_tick_clk_rate_tegra186(struct udevice *dev)
 #endif
 }
 
-static ulong eqos_get_tick_clk_rate_stm32(struct udevice *dev)
-{
-#ifdef CONFIG_CLK
-	struct eqos_priv *eqos = dev_get_priv(dev);
-
-	return clk_get_rate(&eqos->clk_master_bus);
-#else
-	return 0;
-#endif
-}
-
 static int eqos_set_full_duplex(struct udevice *dev)
 {
 	struct eqos_priv *eqos = dev_get_priv(dev);
@@ -1415,57 +1336,6 @@ err_free_reset_eqos:
 	return ret;
 }
 
-static int eqos_probe_resources_stm32(struct udevice *dev)
-{
-	struct eqos_priv *eqos = dev_get_priv(dev);
-	int ret;
-	phy_interface_t interface;
-
-	debug("%s(dev=%p):\n", __func__, dev);
-
-	interface = eqos->config->interface(dev);
-
-	if (interface == PHY_INTERFACE_MODE_NA) {
-		pr_err("Invalid PHY interface\n");
-		return -EINVAL;
-	}
-
-	ret = board_interface_eth_init(dev, interface);
-	if (ret)
-		return -EINVAL;
-
-	ret = clk_get_by_name(dev, "stmmaceth", &eqos->clk_master_bus);
-	if (ret) {
-		pr_err("clk_get_by_name(master_bus) failed: %d", ret);
-		goto err_probe;
-	}
-
-	ret = clk_get_by_name(dev, "mac-clk-rx", &eqos->clk_rx);
-	if (ret) {
-		pr_err("clk_get_by_name(rx) failed: %d", ret);
-		goto err_probe;
-	}
-
-	ret = clk_get_by_name(dev, "mac-clk-tx", &eqos->clk_tx);
-	if (ret) {
-		pr_err("clk_get_by_name(tx) failed: %d", ret);
-		goto err_probe;
-	}
-
-	/*  Get ETH_CLK clocks (optional) */
-	ret = clk_get_by_name(dev, "eth-ck", &eqos->clk_ck);
-	if (ret)
-		pr_warn("No phy clock provided %d", ret);
-
-	debug("%s: OK\n", __func__);
-	return 0;
-
-err_probe:
-
-	debug("%s: returns %d\n", __func__, ret);
-	return ret;
-}
-
 static phy_interface_t eqos_get_interface_tegra186(const struct udevice *dev)
 {
 	return PHY_INTERFACE_MODE_MII;
@@ -1484,12 +1354,6 @@ static int eqos_remove_resources_tegra186(struct udevice *dev)
 	return 0;
 }
 
-static int eqos_remove_resources_stm32(struct udevice *dev)
-{
-	debug("%s(dev=%p):\n", __func__, dev);
-	return 0;
-}
-
 static int eqos_probe(struct udevice *dev)
 {
 	struct eqos_priv *eqos = dev_get_priv(dev);
@@ -1633,35 +1497,6 @@ static const struct eqos_config __maybe_unused eqos_tegra186_config = {
 	.ops = &eqos_tegra186_ops
 };
 
-static struct eqos_ops eqos_stm32_ops = {
-	.eqos_inval_desc = eqos_inval_desc_generic,
-	.eqos_flush_desc = eqos_flush_desc_generic,
-	.eqos_inval_buffer = eqos_inval_buffer_generic,
-	.eqos_flush_buffer = eqos_flush_buffer_generic,
-	.eqos_probe_resources = eqos_probe_resources_stm32,
-	.eqos_remove_resources = eqos_remove_resources_stm32,
-	.eqos_stop_resets = eqos_null_ops,
-	.eqos_start_resets = eqos_null_ops,
-	.eqos_stop_clks = eqos_stop_clks_stm32,
-	.eqos_start_clks = eqos_start_clks_stm32,
-	.eqos_calibrate_pads = eqos_null_ops,
-	.eqos_disable_calibration = eqos_null_ops,
-	.eqos_set_tx_clk_speed = eqos_null_ops,
-	.eqos_get_enetaddr = eqos_null_ops,
-	.eqos_get_tick_clk_rate = eqos_get_tick_clk_rate_stm32
-};
-
-static const struct eqos_config __maybe_unused eqos_stm32_config = {
-	.reg_access_always_ok = false,
-	.mdio_wait = 10000,
-	.swr_wait = 50,
-	.config_mac = EQOS_MAC_RXQ_CTRL0_RXQ0EN_ENABLED_AV,
-	.config_mac_mdio = EQOS_MAC_MDIO_ADDRESS_CR_250_300,
-	.axi_bus_width = EQOS_AXI_WIDTH_64,
-	.interface = dev_read_phy_mode,
-	.ops = &eqos_stm32_ops
-};
-
 static const struct udevice_id eqos_ids[] = {
 #if IS_ENABLED(CONFIG_DWC_ETH_QOS_TEGRA186)
 	{
diff --git a/drivers/net/dwc_eth_qos.h b/drivers/net/dwc_eth_qos.h
index e3222e1e17e..a6087f191ab 100644
--- a/drivers/net/dwc_eth_qos.h
+++ b/drivers/net/dwc_eth_qos.h
@@ -290,4 +290,5 @@ int eqos_null_ops(struct udevice *dev);
 extern struct eqos_config eqos_imx_config;
 extern struct eqos_config eqos_rockchip_config;
 extern struct eqos_config eqos_qcom_config;
+extern struct eqos_config eqos_stm32_config;
 extern struct eqos_config eqos_jh7110_config;
diff --git a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c
new file mode 100644
index 00000000000..cfda757133e
--- /dev/null
+++ b/drivers/net/dwc_eth_qos_stm32.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024, Marek Vasut <marex@denx.de>
+ *
+ * This is code moved from drivers/net/dwc_eth_qos.c , which is:
+ * Copyright (c) 2016, NVIDIA CORPORATION.
+ */
+
+#include <common.h>
+#include <asm/cache.h>
+#include <asm/gpio.h>
+#include <asm/io.h>
+#include <clk.h>
+#include <cpu_func.h>
+#include <dm.h>
+#include <dm/device_compat.h>
+#include <errno.h>
+#include <eth_phy.h>
+#include <log.h>
+#include <malloc.h>
+#include <memalign.h>
+#include <miiphy.h>
+#include <net.h>
+#include <netdev.h>
+#include <phy.h>
+#include <reset.h>
+#include <wait_bit.h>
+#include <linux/delay.h>
+
+#include "dwc_eth_qos.h"
+
+static ulong eqos_get_tick_clk_rate_stm32(struct udevice *dev)
+{
+#ifdef CONFIG_CLK
+	struct eqos_priv *eqos = dev_get_priv(dev);
+
+	return clk_get_rate(&eqos->clk_master_bus);
+#else
+	return 0;
+#endif
+}
+
+static int eqos_start_clks_stm32(struct udevice *dev)
+{
+#ifdef CONFIG_CLK
+	struct eqos_priv *eqos = dev_get_priv(dev);
+	int ret;
+
+	debug("%s(dev=%p):\n", __func__, dev);
+
+	ret = clk_enable(&eqos->clk_master_bus);
+	if (ret < 0) {
+		pr_err("clk_enable(clk_master_bus) failed: %d", ret);
+		goto err;
+	}
+
+	ret = clk_enable(&eqos->clk_rx);
+	if (ret < 0) {
+		pr_err("clk_enable(clk_rx) failed: %d", ret);
+		goto err_disable_clk_master_bus;
+	}
+
+	ret = clk_enable(&eqos->clk_tx);
+	if (ret < 0) {
+		pr_err("clk_enable(clk_tx) failed: %d", ret);
+		goto err_disable_clk_rx;
+	}
+
+	if (clk_valid(&eqos->clk_ck) && !eqos->clk_ck_enabled) {
+		ret = clk_enable(&eqos->clk_ck);
+		if (ret < 0) {
+			pr_err("clk_enable(clk_ck) failed: %d", ret);
+			goto err_disable_clk_tx;
+		}
+		eqos->clk_ck_enabled = true;
+	}
+#endif
+
+	debug("%s: OK\n", __func__);
+	return 0;
+
+#ifdef CONFIG_CLK
+err_disable_clk_tx:
+	clk_disable(&eqos->clk_tx);
+err_disable_clk_rx:
+	clk_disable(&eqos->clk_rx);
+err_disable_clk_master_bus:
+	clk_disable(&eqos->clk_master_bus);
+err:
+	debug("%s: FAILED: %d\n", __func__, ret);
+	return ret;
+#endif
+}
+
+static int eqos_stop_clks_stm32(struct udevice *dev)
+{
+#ifdef CONFIG_CLK
+	struct eqos_priv *eqos = dev_get_priv(dev);
+
+	debug("%s(dev=%p):\n", __func__, dev);
+
+	clk_disable(&eqos->clk_tx);
+	clk_disable(&eqos->clk_rx);
+	clk_disable(&eqos->clk_master_bus);
+#endif
+
+	debug("%s: OK\n", __func__);
+	return 0;
+}
+
+static int eqos_probe_resources_stm32(struct udevice *dev)
+{
+	struct eqos_priv *eqos = dev_get_priv(dev);
+	int ret;
+	phy_interface_t interface;
+
+	debug("%s(dev=%p):\n", __func__, dev);
+
+	interface = eqos->config->interface(dev);
+
+	if (interface == PHY_INTERFACE_MODE_NA) {
+		pr_err("Invalid PHY interface\n");
+		return -EINVAL;
+	}
+
+	ret = board_interface_eth_init(dev, interface);
+	if (ret)
+		return -EINVAL;
+
+	ret = clk_get_by_name(dev, "stmmaceth", &eqos->clk_master_bus);
+	if (ret) {
+		pr_err("clk_get_by_name(master_bus) failed: %d", ret);
+		goto err_probe;
+	}
+
+	ret = clk_get_by_name(dev, "mac-clk-rx", &eqos->clk_rx);
+	if (ret) {
+		pr_err("clk_get_by_name(rx) failed: %d", ret);
+		goto err_probe;
+	}
+
+	ret = clk_get_by_name(dev, "mac-clk-tx", &eqos->clk_tx);
+	if (ret) {
+		pr_err("clk_get_by_name(tx) failed: %d", ret);
+		goto err_probe;
+	}
+
+	/*  Get ETH_CLK clocks (optional) */
+	ret = clk_get_by_name(dev, "eth-ck", &eqos->clk_ck);
+	if (ret)
+		pr_warn("No phy clock provided %d", ret);
+
+	debug("%s: OK\n", __func__);
+	return 0;
+
+err_probe:
+
+	debug("%s: returns %d\n", __func__, ret);
+	return ret;
+}
+
+static int eqos_remove_resources_stm32(struct udevice *dev)
+{
+	debug("%s(dev=%p):\n", __func__, dev);
+
+	return 0;
+}
+
+static struct eqos_ops eqos_stm32_ops = {
+	.eqos_inval_desc = eqos_inval_desc_generic,
+	.eqos_flush_desc = eqos_flush_desc_generic,
+	.eqos_inval_buffer = eqos_inval_buffer_generic,
+	.eqos_flush_buffer = eqos_flush_buffer_generic,
+	.eqos_probe_resources = eqos_probe_resources_stm32,
+	.eqos_remove_resources = eqos_remove_resources_stm32,
+	.eqos_stop_resets = eqos_null_ops,
+	.eqos_start_resets = eqos_null_ops,
+	.eqos_stop_clks = eqos_stop_clks_stm32,
+	.eqos_start_clks = eqos_start_clks_stm32,
+	.eqos_calibrate_pads = eqos_null_ops,
+	.eqos_disable_calibration = eqos_null_ops,
+	.eqos_set_tx_clk_speed = eqos_null_ops,
+	.eqos_get_enetaddr = eqos_null_ops,
+	.eqos_get_tick_clk_rate = eqos_get_tick_clk_rate_stm32
+};
+
+struct eqos_config __maybe_unused eqos_stm32_config = {
+	.reg_access_always_ok = false,
+	.mdio_wait = 10000,
+	.swr_wait = 50,
+	.config_mac = EQOS_MAC_RXQ_CTRL0_RXQ0EN_ENABLED_AV,
+	.config_mac_mdio = EQOS_MAC_MDIO_ADDRESS_CR_250_300,
+	.axi_bus_width = EQOS_AXI_WIDTH_64,
+	.interface = dev_read_phy_mode,
+	.ops = &eqos_stm32_ops
+};
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
