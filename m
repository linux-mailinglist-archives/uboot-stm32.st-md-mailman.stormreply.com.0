Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 301F3876EC3
	for <lists+uboot-stm32@lfdr.de>; Sat,  9 Mar 2024 03:19:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBA3EC6DD96;
	Sat,  9 Mar 2024 02:19:01 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 556A9C6DD94
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Mar 2024 02:19:01 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8CDEF87D59;
 Sat,  9 Mar 2024 03:18:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1709950738;
 bh=Wy2KNESXhb1rHvASW1TC5zyW1frhmxDROjC7UPeF5RE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vxlxtWDZZtHXSdjvyfvH4YYsIvb3g4zZodCcfWI+pYtGtaR47Mpc1aXPT1s9nJ8RS
 JB6vswt9AKFVOd2qXI6XbrTm8g1PW2MtNhC2SY6cInmRQSn3QqfVLlC6mz31yw9k05
 5E4VHuEVsvHx28boURf5qhBwFBPSHjQtId/zx1AncHSBPEaDA4DF52ulb3tL+EwfRh
 UOxOmntZZ+zYwt6WfrK+c+lA8fmfO0yG8sx9cvOju6IBSOQoodcF3e5RQDUliByR9L
 8rZo+GhKf2AP7cx6FSP+q8oovoNyx0glMN1BVfYnOwSuD3ZVHJFM7tNnxPMOub5M+l
 qJK92XEWPF3iQ==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Sat,  9 Mar 2024 03:11:26 +0100
Message-ID: <20240309021831.264018-6-marex@denx.de>
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
Subject: [Uboot-stm32] [PATCH 05/11] net: dwc_eth_qos: Use FIELD_PREP for
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
