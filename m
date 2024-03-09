Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9D4876EC4
	for <lists+uboot-stm32@lfdr.de>; Sat,  9 Mar 2024 03:19:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 049F8C6DD9A;
	Sat,  9 Mar 2024 02:19:05 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14B40C6DD94
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Mar 2024 02:19:04 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7406E87DA5;
 Sat,  9 Mar 2024 03:18:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1709950739;
 bh=r7N7m1mL4wi1n85P7C4DDQjUnm5i7J9O/r1UUiXvkUg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HqhkHQdRNYfT9zp/6Gw3otlSk1NI03MOC+hGWhg8HFVtLc2ZlUoL9u+4XP5rlDKtS
 g5WiQa0zji98tUbPKZNU8NIinMUb9mdMt6zly+FRA763HDWFLkZ6QSu+ntlDYBgjs7
 K5nW9FJzGRHlK/jG+xwwx3kYogZE7g9WTiOdGFgTPPQThvMU7cI0V3WZ9oj2sg0+lg
 wnmjJKhejbg/k+upNLR4xWT61Soc7wYYSHJgpmoKf1rLTvKx31RbNNsXBAd9yD1Pzv
 GexBBJVnNn11fMSE0JIvOACuokgETcuuZ88MNK13j8Or2dCUe8bNMPOfMJ6FGTZQU1
 IliG8g6+w5GMA==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Sat,  9 Mar 2024 03:11:28 +0100
Message-ID: <20240309021831.264018-8-marex@denx.de>
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
Subject: [Uboot-stm32] [PATCH 07/11] net: dwc_eth_qos: Use consistent
	logging prints
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

Use dev_*() only to print all the logs from this glue code,
instead of mixing dev_*(), log_*(), pr_*() all in one code.

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
 drivers/net/dwc_eth_qos_stm32.c | 52 ++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c
index 38037c47954..72f65f80540 100644
--- a/drivers/net/dwc_eth_qos_stm32.c
+++ b/drivers/net/dwc_eth_qos_stm32.c
@@ -63,36 +63,36 @@ static int eqos_start_clks_stm32(struct udevice *dev)
 	if (!CONFIG_IS_ENABLED(CLK))
 		return 0;
 
-	debug("%s(dev=%p):\n", __func__, dev);
+	dev_dbg(dev, "%s:\n", __func__);
 
 	ret = clk_enable(&eqos->clk_master_bus);
 	if (ret < 0) {
-		pr_err("clk_enable(clk_master_bus) failed: %d", ret);
+		dev_err(dev, "clk_enable(clk_master_bus) failed: %d\n", ret);
 		goto err;
 	}
 
 	ret = clk_enable(&eqos->clk_rx);
 	if (ret < 0) {
-		pr_err("clk_enable(clk_rx) failed: %d", ret);
+		dev_err(dev, "clk_enable(clk_rx) failed: %d\n", ret);
 		goto err_disable_clk_master_bus;
 	}
 
 	ret = clk_enable(&eqos->clk_tx);
 	if (ret < 0) {
-		pr_err("clk_enable(clk_tx) failed: %d", ret);
+		dev_err(dev, "clk_enable(clk_tx) failed: %d\n", ret);
 		goto err_disable_clk_rx;
 	}
 
 	if (clk_valid(&eqos->clk_ck) && !eqos->clk_ck_enabled) {
 		ret = clk_enable(&eqos->clk_ck);
 		if (ret < 0) {
-			pr_err("clk_enable(clk_ck) failed: %d", ret);
+			dev_err(dev, "clk_enable(clk_ck) failed: %d\n", ret);
 			goto err_disable_clk_tx;
 		}
 		eqos->clk_ck_enabled = true;
 	}
 
-	debug("%s: OK\n", __func__);
+	dev_dbg(dev, "%s: OK\n", __func__);
 	return 0;
 
 err_disable_clk_tx:
@@ -102,7 +102,8 @@ err_disable_clk_rx:
 err_disable_clk_master_bus:
 	clk_disable(&eqos->clk_master_bus);
 err:
-	debug("%s: FAILED: %d\n", __func__, ret);
+	dev_dbg(dev, "%s: FAILED: %d\n", __func__, ret);
+
 	return ret;
 }
 
@@ -113,13 +114,14 @@ static int eqos_stop_clks_stm32(struct udevice *dev)
 	if (!CONFIG_IS_ENABLED(CLK))
 		return 0;
 
-	debug("%s(dev=%p):\n", __func__, dev);
+	dev_dbg(dev, "%s:\n", __func__);
 
 	clk_disable(&eqos->clk_tx);
 	clk_disable(&eqos->clk_rx);
 	clk_disable(&eqos->clk_master_bus);
 
-	debug("%s: OK\n", __func__);
+	dev_dbg(dev, "%s: OK\n", __func__);
+
 	return 0;
 }
 
@@ -143,20 +145,20 @@ static int eqos_probe_syscfg_stm32(struct udevice *dev,
 
 	switch (interface_type) {
 	case PHY_INTERFACE_MODE_MII:
-		log_debug("PHY_INTERFACE_MODE_MII\n");
+		dev_dbg(dev, "PHY_INTERFACE_MODE_MII\n");
 		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
 				   SYSCFG_PMCSETR_ETH_SEL_GMII_MII);
 		value |= SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
 		break;
 	case PHY_INTERFACE_MODE_GMII:
-		log_debug("PHY_INTERFACE_MODE_GMII\n");
+		dev_dbg(dev, "PHY_INTERFACE_MODE_GMII\n");
 		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
 				   SYSCFG_PMCSETR_ETH_SEL_GMII_MII);
 		if (eth_clk_sel_reg)
 			value |= SYSCFG_PMCSETR_ETH_CLK_SEL;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		log_debug("PHY_INTERFACE_MODE_RMII\n");
+		dev_dbg(dev, "PHY_INTERFACE_MODE_RMII\n");
 		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
 				   SYSCFG_PMCSETR_ETH_SEL_RMII);
 		if (eth_ref_clk_sel_reg)
@@ -166,15 +168,15 @@ static int eqos_probe_syscfg_stm32(struct udevice *dev,
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		log_debug("PHY_INTERFACE_MODE_RGMII\n");
+		dev_dbg(dev, "PHY_INTERFACE_MODE_RGMII\n");
 		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
 				   SYSCFG_PMCSETR_ETH_SEL_RGMII);
 		if (eth_clk_sel_reg)
 			value |= SYSCFG_PMCSETR_ETH_CLK_SEL;
 		break;
 	default:
-		log_debug("Do not manage %d interface\n",
-			  interface_type);
+		dev_dbg(dev, "Do not manage %d interface\n",
+			interface_type);
 		/* Do not manage others interfaces */
 		return -EINVAL;
 	}
@@ -194,12 +196,12 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
 	phy_interface_t interface;
 	int ret;
 
-	debug("%s(dev=%p):\n", __func__, dev);
+	dev_dbg(dev, "%s:\n", __func__);
 
 	interface = eqos->config->interface(dev);
 
 	if (interface == PHY_INTERFACE_MODE_NA) {
-		pr_err("Invalid PHY interface\n");
+		dev_err(dev, "Invalid PHY interface\n");
 		return -EINVAL;
 	}
 
@@ -209,39 +211,41 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
 
 	ret = clk_get_by_name(dev, "stmmaceth", &eqos->clk_master_bus);
 	if (ret) {
-		pr_err("clk_get_by_name(master_bus) failed: %d", ret);
+		dev_err(dev, "clk_get_by_name(master_bus) failed: %d\n", ret);
 		goto err_probe;
 	}
 
 	ret = clk_get_by_name(dev, "mac-clk-rx", &eqos->clk_rx);
 	if (ret) {
-		pr_err("clk_get_by_name(rx) failed: %d", ret);
+		dev_err(dev, "clk_get_by_name(rx) failed: %d\n", ret);
 		goto err_probe;
 	}
 
 	ret = clk_get_by_name(dev, "mac-clk-tx", &eqos->clk_tx);
 	if (ret) {
-		pr_err("clk_get_by_name(tx) failed: %d", ret);
+		dev_err(dev, "clk_get_by_name(tx) failed: %d\n", ret);
 		goto err_probe;
 	}
 
 	/*  Get ETH_CLK clocks (optional) */
 	ret = clk_get_by_name(dev, "eth-ck", &eqos->clk_ck);
 	if (ret)
-		pr_warn("No phy clock provided %d", ret);
+		dev_warn(dev, "No phy clock provided %d\n", ret);
+
+	dev_dbg(dev, "%s: OK\n", __func__);
 
-	debug("%s: OK\n", __func__);
 	return 0;
 
 err_probe:
 
-	debug("%s: returns %d\n", __func__, ret);
+	dev_dbg(dev, "%s: returns %d\n", __func__, ret);
+
 	return ret;
 }
 
 static int eqos_remove_resources_stm32(struct udevice *dev)
 {
-	debug("%s(dev=%p):\n", __func__, dev);
+	dev_dbg(dev, "%s:\n", __func__);
 
 	return 0;
 }
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
