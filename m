Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 413D6876EC6
	for <lists+uboot-stm32@lfdr.de>; Sat,  9 Mar 2024 03:19:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A7CAC6DD9C;
	Sat,  9 Mar 2024 02:19:06 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CABFC6DD9B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Mar 2024 02:19:05 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DFE5E87DB3;
 Sat,  9 Mar 2024 03:18:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1709950740;
 bh=whLBEAFKgj/dlX4hKcH1iZevhKb+HMs7TxnUuNLM2H4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lAdFDy1awNPP5/SEcxahXIdRtgcHIHIK6a0m2lj4qx1XfxTIydpD6+HTvigdQA/wk
 MI3uAIfKwzhfbudkBiQqdnyJxA8oJRUvzXywwp2f/Eg1EogUmoCZbd4LrxPpIttEKk
 LYdx03jRBuO7NYr90VzLRkdguNXjNednNLNCgI4qZcO48cLPXN+spJ3xgN40wJs6HS
 HT+tIL6f826Nr8NwHM+PaYjOBt/C01RUOMjN+DTRRw1lLtZgHrT3AJi8wz9zuIZQOf
 0CGwtI7O6kmtEY0mwK7NDQpRo+NxgleK7775z0EpsdWIbe1XJh9DFTy/VknGrIwZKr
 gCw2FaWyPdmdA==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Sat,  9 Mar 2024 03:11:29 +0100
Message-ID: <20240309021831.264018-9-marex@denx.de>
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
Subject: [Uboot-stm32] [PATCH 08/11] net: dwc_eth_qos: Constify st,
	eth-* values parsed out of DT
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

Use const bool for the values parsed out of DT. Drop the duplicate
assignment of false into those bool variables, assign them directly
with the content parsed out of DT. Abbreviate the variable name too.

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
 drivers/net/dwc_eth_qos_stm32.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c
index 72f65f80540..33477925ff1 100644
--- a/drivers/net/dwc_eth_qos_stm32.c
+++ b/drivers/net/dwc_eth_qos_stm32.c
@@ -128,17 +128,13 @@ static int eqos_stop_clks_stm32(struct udevice *dev)
 static int eqos_probe_syscfg_stm32(struct udevice *dev,
 				   phy_interface_t interface_type)
 {
-	bool eth_ref_clk_sel_reg = false;
-	bool eth_clk_sel_reg = false;
+	/* Ethernet 50MHz RMII clock selection */
+	const bool eth_ref_clk_sel = dev_read_bool(dev, "st,eth-ref-clk-sel");
+	/* Gigabit Ethernet 125MHz clock selection. */
+	const bool eth_clk_sel = dev_read_bool(dev, "st,eth-clk-sel");
 	u8 *syscfg;
 	u32 value;
 
-	/* Gigabit Ethernet 125MHz clock selection. */
-	eth_clk_sel_reg = dev_read_bool(dev, "st,eth-clk-sel");
-
-	/* Ethernet 50Mhz RMII clock selection */
-	eth_ref_clk_sel_reg = dev_read_bool(dev, "st,eth-ref-clk-sel");
-
 	syscfg = (u8 *)syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
 	if (!syscfg)
 		return -ENODEV;
@@ -154,14 +150,14 @@ static int eqos_probe_syscfg_stm32(struct udevice *dev,
 		dev_dbg(dev, "PHY_INTERFACE_MODE_GMII\n");
 		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
 				   SYSCFG_PMCSETR_ETH_SEL_GMII_MII);
-		if (eth_clk_sel_reg)
+		if (eth_clk_sel)
 			value |= SYSCFG_PMCSETR_ETH_CLK_SEL;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
 		dev_dbg(dev, "PHY_INTERFACE_MODE_RMII\n");
 		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
 				   SYSCFG_PMCSETR_ETH_SEL_RMII);
-		if (eth_ref_clk_sel_reg)
+		if (eth_ref_clk_sel)
 			value |= SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
 		break;
 	case PHY_INTERFACE_MODE_RGMII:
@@ -171,7 +167,7 @@ static int eqos_probe_syscfg_stm32(struct udevice *dev,
 		dev_dbg(dev, "PHY_INTERFACE_MODE_RGMII\n");
 		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
 				   SYSCFG_PMCSETR_ETH_SEL_RGMII);
-		if (eth_clk_sel_reg)
+		if (eth_clk_sel)
 			value |= SYSCFG_PMCSETR_ETH_CLK_SEL;
 		break;
 	default:
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
