Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D18F088C19B
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Mar 2024 13:08:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92433C71281;
	Tue, 26 Mar 2024 12:08:11 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFA54C6DD96
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 12:08:10 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BB95A88076;
 Tue, 26 Mar 2024 13:08:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1711454888;
 bh=TJD8RoFe3KdjpbNT8zQpmh1o9MQkg9GKOeTWQbyZ7Ec=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CIpfhIllpXDNSnbevUV8lkbCfb7SLA8d8RFCYoPdzYb7HIU+E0kkM4QyE83TSa1BW
 STab3RgDuVA23sUCAXerA+wK5re7fkcM7tC1DGxASPp5QzWbHIWcHfRocNCZAREtY6
 jipr9x3Vb9dibzcizBoeGjk7b8yymOWt9uJ15cnATRWzzlHZ93fb1dWvSDDPSsSaxU
 k2ZxtpN0xsNujuyqOl8t7c4dZjo8mVjVQU/D4/UbiDrXWULkI8VIJUsXte+UnOdEZ8
 pH48VLFJBBgjfmRyI7biDYspMEfz/02qHuHyn05TL97tqJkCzdwL0vBfHCu4lqQsM2
 JkL9Leg837syQ==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Tue, 26 Mar 2024 13:07:26 +0100
Message-ID: <20240326120745.27581-6-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240326120745.27581-1-marex@denx.de>
References: <20240326120745.27581-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, u-boot@dh-electronics.com,
 Christophe Roullier <christophe.roullier@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 05/11] net: dwc_eth_qos: Use FIELD_PREP for
	ETH_SEL bitfield
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

Use FIELD_PREP to configure content of ETH_SEL bitfield in SYSCFG_PMCSETR
register. No functional change.

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
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
V2: Add RB from Patrice
---
 drivers/net/dwc_eth_qos_stm32.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c
index d7ec0c9be36..7545026b158 100644
--- a/drivers/net/dwc_eth_qos_stm32.c
+++ b/drivers/net/dwc_eth_qos_stm32.c
@@ -26,6 +26,7 @@
 #include <reset.h>
 #include <syscon.h>
 #include <wait_bit.h>
+#include <linux/bitfield.h>
 #include <linux/delay.h>
 
 #include "dwc_eth_qos.h"
@@ -40,9 +41,9 @@
 #define SYSCFG_PMCSETR_ETH_SELMII	BIT(20)
 
 #define SYSCFG_PMCSETR_ETH_SEL_MASK	GENMASK(23, 21)
-#define SYSCFG_PMCSETR_ETH_SEL_GMII_MII	0
-#define SYSCFG_PMCSETR_ETH_SEL_RGMII	BIT(21)
-#define SYSCFG_PMCSETR_ETH_SEL_RMII	BIT(23)
+#define SYSCFG_PMCSETR_ETH_SEL_GMII_MII	0x0
+#define SYSCFG_PMCSETR_ETH_SEL_RGMII	0x1
+#define SYSCFG_PMCSETR_ETH_SEL_RMII	0x4
 
 static ulong eqos_get_tick_clk_rate_stm32(struct udevice *dev)
 {
@@ -142,35 +143,33 @@ static int eqos_probe_syscfg_stm32(struct udevice *dev,
 
 	switch (interface_type) {
 	case PHY_INTERFACE_MODE_MII:
-		value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII |
-			SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
+		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
+				   SYSCFG_PMCSETR_ETH_SEL_GMII_MII);
+		value |= SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
 		log_debug("PHY_INTERFACE_MODE_MII\n");
 		break;
 	case PHY_INTERFACE_MODE_GMII:
+		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
+				   SYSCFG_PMCSETR_ETH_SEL_GMII_MII);
 		if (eth_clk_sel_reg)
-			value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII |
-				SYSCFG_PMCSETR_ETH_CLK_SEL;
-		else
-			value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII;
+			value |= SYSCFG_PMCSETR_ETH_CLK_SEL;
 		log_debug("PHY_INTERFACE_MODE_GMII\n");
 		break;
 	case PHY_INTERFACE_MODE_RMII:
+		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
+				   SYSCFG_PMCSETR_ETH_SEL_RMII);
 		if (eth_ref_clk_sel_reg)
-			value = SYSCFG_PMCSETR_ETH_SEL_RMII |
-				SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
-		else
-			value = SYSCFG_PMCSETR_ETH_SEL_RMII;
+			value |= SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
 		log_debug("PHY_INTERFACE_MODE_RMII\n");
 		break;
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
+		value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
+				   SYSCFG_PMCSETR_ETH_SEL_RGMII);
 		if (eth_clk_sel_reg)
-			value = SYSCFG_PMCSETR_ETH_SEL_RGMII |
-				SYSCFG_PMCSETR_ETH_CLK_SEL;
-		else
-			value = SYSCFG_PMCSETR_ETH_SEL_RGMII;
+			value |= SYSCFG_PMCSETR_ETH_CLK_SEL;
 		log_debug("PHY_INTERFACE_MODE_RGMII\n");
 		break;
 	default:
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
