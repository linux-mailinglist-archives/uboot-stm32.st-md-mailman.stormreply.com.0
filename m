Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AFA876EC1
	for <lists+uboot-stm32@lfdr.de>; Sat,  9 Mar 2024 03:18:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDC6BC6DD9B;
	Sat,  9 Mar 2024 02:18:58 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BD12C6DD94
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Mar 2024 02:18:58 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1B25487D3D;
 Sat,  9 Mar 2024 03:18:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1709950738;
 bh=kdsw9BFFHBew2U+NNUyq4OyNRyjKM9zRDejORgMh3H0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EQKF7Vwv3ka7l+UzoN5pw8Jjtgg/Cm6OLQjyWU1yyW0yOiDpqNXG0uRljQ/qcbRtB
 pJd9B8zLxrAZSytqj5/uJUC+M5oWMQDCuAQ8xaGUQglHuZgNuRcni1HZxSM+74CCNZ
 wsfkFKrsuG2CDMmZb10hMKuBaaK0GWBuvl58vi4OtkvGcWKOFdPI0lAaiKvMq73LJF
 AV0pns07AzsLKIl4Mmz5U6ohg5DUR3zSm5aEx59lnMbCNzD7kaWq7sDDkrNlLU4pYu
 8toPCRL87FWuwXxDVUi5UqX0v7xzgOe5X9/Je2N0PYi2PGhRtrvkGJ3EmOv0Ad5J+o
 6CKd22L3fetBg==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Sat,  9 Mar 2024 03:11:24 +0100
Message-ID: <20240309021831.264018-4-marex@denx.de>
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
Subject: [Uboot-stm32] [PATCH 03/11] net: dwc_eth_qos: Fold
	board_interface_eth_init into STM32 glue code
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

Move board_interface_eth_init() into eqos_probe_syscfg_stm32() in STM32
driver glue code. The eqos_probe_syscfg_stm32() parses STM32 specific DT
properties of this MAC and configures SYSCFG registers accordingly, there
is nothing board specific happening in this function, move it into generic
driver code instead. Drop the now unused duplicates from board files.

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
 board/dhelectronics/dh_stm32mp1/board.c | 82 -----------------------
 board/st/stm32mp1/stm32mp1.c            | 82 -----------------------
 drivers/net/dwc_eth_qos_stm32.c         | 86 ++++++++++++++++++++++++-
 3 files changed, 84 insertions(+), 166 deletions(-)

diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
index d1f662d9701..f179c857116 100644
--- a/board/dhelectronics/dh_stm32mp1/board.c
+++ b/board/dhelectronics/dh_stm32mp1/board.c
@@ -48,12 +48,10 @@
 
 /* SYSCFG registers */
 #define SYSCFG_BOOTR		0x00
-#define SYSCFG_PMCSETR		0x04
 #define SYSCFG_IOCTRLSETR	0x18
 #define SYSCFG_ICNR		0x1C
 #define SYSCFG_CMPCR		0x20
 #define SYSCFG_CMPENSETR	0x24
-#define SYSCFG_PMCCLRR		0x44
 
 #define SYSCFG_BOOTR_BOOT_MASK		GENMASK(2, 0)
 #define SYSCFG_BOOTR_BOOTPD_SHIFT	4
@@ -69,16 +67,6 @@
 
 #define SYSCFG_CMPENSETR_MPU_EN		BIT(0)
 
-#define SYSCFG_PMCSETR_ETH_CLK_SEL	BIT(16)
-#define SYSCFG_PMCSETR_ETH_REF_CLK_SEL	BIT(17)
-
-#define SYSCFG_PMCSETR_ETH_SELMII	BIT(20)
-
-#define SYSCFG_PMCSETR_ETH_SEL_MASK	GENMASK(23, 21)
-#define SYSCFG_PMCSETR_ETH_SEL_GMII_MII	0
-#define SYSCFG_PMCSETR_ETH_SEL_RGMII	BIT(21)
-#define SYSCFG_PMCSETR_ETH_SEL_RMII	BIT(23)
-
 #define KS_CCR		0x08
 #define KS_CCR_EEPROM	BIT(9)
 #define KS_BE0		BIT(12)
@@ -679,76 +667,6 @@ void board_quiesce_devices(void)
 #endif
 }
 
-/* eth init function : weak called in eqos driver */
-int board_interface_eth_init(struct udevice *dev,
-			     phy_interface_t interface_type)
-{
-	u8 *syscfg;
-	u32 value;
-	bool eth_clk_sel_reg = false;
-	bool eth_ref_clk_sel_reg = false;
-
-	/* Gigabit Ethernet 125MHz clock selection. */
-	eth_clk_sel_reg = dev_read_bool(dev, "st,eth-clk-sel");
-
-	/* Ethernet 50Mhz RMII clock selection */
-	eth_ref_clk_sel_reg =
-		dev_read_bool(dev, "st,eth-ref-clk-sel");
-
-	syscfg = (u8 *)syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
-
-	if (!syscfg)
-		return -ENODEV;
-
-	switch (interface_type) {
-	case PHY_INTERFACE_MODE_MII:
-		value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII |
-			SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
-		debug("%s: PHY_INTERFACE_MODE_MII\n", __func__);
-		break;
-	case PHY_INTERFACE_MODE_GMII:
-		if (eth_clk_sel_reg)
-			value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII |
-				SYSCFG_PMCSETR_ETH_CLK_SEL;
-		else
-			value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII;
-		debug("%s: PHY_INTERFACE_MODE_GMII\n", __func__);
-		break;
-	case PHY_INTERFACE_MODE_RMII:
-		if (eth_ref_clk_sel_reg)
-			value = SYSCFG_PMCSETR_ETH_SEL_RMII |
-				SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
-		else
-			value = SYSCFG_PMCSETR_ETH_SEL_RMII;
-		debug("%s: PHY_INTERFACE_MODE_RMII\n", __func__);
-		break;
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-		if (eth_clk_sel_reg)
-			value = SYSCFG_PMCSETR_ETH_SEL_RGMII |
-				SYSCFG_PMCSETR_ETH_CLK_SEL;
-		else
-			value = SYSCFG_PMCSETR_ETH_SEL_RGMII;
-		debug("%s: PHY_INTERFACE_MODE_RGMII\n", __func__);
-		break;
-	default:
-		debug("%s: Do not manage %d interface\n",
-		      __func__, interface_type);
-		/* Do not manage others interfaces */
-		return -EINVAL;
-	}
-
-	/* clear and set ETH configuration bits */
-	writel(SYSCFG_PMCSETR_ETH_SEL_MASK | SYSCFG_PMCSETR_ETH_SELMII |
-	       SYSCFG_PMCSETR_ETH_REF_CLK_SEL | SYSCFG_PMCSETR_ETH_CLK_SEL,
-	       syscfg + SYSCFG_PMCCLRR);
-	writel(value, syscfg + SYSCFG_PMCSETR);
-
-	return 0;
-}
-
 #if defined(CONFIG_OF_BOARD_SETUP)
 int ft_board_setup(void *blob, struct bd_info *bd)
 {
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index a17c314daeb..f284b0dfd28 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -52,12 +52,10 @@
 
 /* SYSCFG registers */
 #define SYSCFG_BOOTR		0x00
-#define SYSCFG_PMCSETR		0x04
 #define SYSCFG_IOCTRLSETR	0x18
 #define SYSCFG_ICNR		0x1C
 #define SYSCFG_CMPCR		0x20
 #define SYSCFG_CMPENSETR	0x24
-#define SYSCFG_PMCCLRR		0x44
 
 #define SYSCFG_BOOTR_BOOT_MASK		GENMASK(2, 0)
 #define SYSCFG_BOOTR_BOOTPD_SHIFT	4
@@ -73,16 +71,6 @@
 
 #define SYSCFG_CMPENSETR_MPU_EN		BIT(0)
 
-#define SYSCFG_PMCSETR_ETH_CLK_SEL	BIT(16)
-#define SYSCFG_PMCSETR_ETH_REF_CLK_SEL	BIT(17)
-
-#define SYSCFG_PMCSETR_ETH_SELMII	BIT(20)
-
-#define SYSCFG_PMCSETR_ETH_SEL_MASK	GENMASK(23, 21)
-#define SYSCFG_PMCSETR_ETH_SEL_GMII_MII	0
-#define SYSCFG_PMCSETR_ETH_SEL_RGMII	BIT(21)
-#define SYSCFG_PMCSETR_ETH_SEL_RMII	BIT(23)
-
 #define USB_LOW_THRESHOLD_UV		200000
 #define USB_WARNING_LOW_THRESHOLD_UV	660000
 #define USB_START_LOW_THRESHOLD_UV	1230000
@@ -742,76 +730,6 @@ void board_quiesce_devices(void)
 	setup_led(LEDST_OFF);
 }
 
-/* eth init function : weak called in eqos driver */
-int board_interface_eth_init(struct udevice *dev,
-			     phy_interface_t interface_type)
-{
-	u8 *syscfg;
-	u32 value;
-	bool eth_clk_sel_reg = false;
-	bool eth_ref_clk_sel_reg = false;
-
-	/* Gigabit Ethernet 125MHz clock selection. */
-	eth_clk_sel_reg = dev_read_bool(dev, "st,eth-clk-sel");
-
-	/* Ethernet 50Mhz RMII clock selection */
-	eth_ref_clk_sel_reg =
-		dev_read_bool(dev, "st,eth-ref-clk-sel");
-
-	syscfg = (u8 *)syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
-
-	if (!syscfg)
-		return -ENODEV;
-
-	switch (interface_type) {
-	case PHY_INTERFACE_MODE_MII:
-		value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII |
-			SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
-		log_debug("PHY_INTERFACE_MODE_MII\n");
-		break;
-	case PHY_INTERFACE_MODE_GMII:
-		if (eth_clk_sel_reg)
-			value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII |
-				SYSCFG_PMCSETR_ETH_CLK_SEL;
-		else
-			value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII;
-		log_debug("PHY_INTERFACE_MODE_GMII\n");
-		break;
-	case PHY_INTERFACE_MODE_RMII:
-		if (eth_ref_clk_sel_reg)
-			value = SYSCFG_PMCSETR_ETH_SEL_RMII |
-				SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
-		else
-			value = SYSCFG_PMCSETR_ETH_SEL_RMII;
-		log_debug("PHY_INTERFACE_MODE_RMII\n");
-		break;
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-		if (eth_clk_sel_reg)
-			value = SYSCFG_PMCSETR_ETH_SEL_RGMII |
-				SYSCFG_PMCSETR_ETH_CLK_SEL;
-		else
-			value = SYSCFG_PMCSETR_ETH_SEL_RGMII;
-		log_debug("PHY_INTERFACE_MODE_RGMII\n");
-		break;
-	default:
-		log_debug("Do not manage %d interface\n",
-			  interface_type);
-		/* Do not manage others interfaces */
-		return -EINVAL;
-	}
-
-	/* clear and set ETH configuration bits */
-	writel(SYSCFG_PMCSETR_ETH_SEL_MASK | SYSCFG_PMCSETR_ETH_SELMII |
-	       SYSCFG_PMCSETR_ETH_REF_CLK_SEL | SYSCFG_PMCSETR_ETH_CLK_SEL,
-	       syscfg + SYSCFG_PMCCLRR);
-	writel(value, syscfg + SYSCFG_PMCSETR);
-
-	return 0;
-}
-
 enum env_location env_get_location(enum env_operation op, int prio)
 {
 	u32 bootmode = get_bootmode();
diff --git a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c
index fd29a604987..7520a136ed0 100644
--- a/drivers/net/dwc_eth_qos_stm32.c
+++ b/drivers/net/dwc_eth_qos_stm32.c
@@ -24,11 +24,26 @@
 #include <netdev.h>
 #include <phy.h>
 #include <reset.h>
+#include <syscon.h>
 #include <wait_bit.h>
 #include <linux/delay.h>
 
 #include "dwc_eth_qos.h"
 
+/* SYSCFG registers */
+#define SYSCFG_PMCSETR		0x04
+#define SYSCFG_PMCCLRR		0x44
+
+#define SYSCFG_PMCSETR_ETH_CLK_SEL	BIT(16)
+#define SYSCFG_PMCSETR_ETH_REF_CLK_SEL	BIT(17)
+
+#define SYSCFG_PMCSETR_ETH_SELMII	BIT(20)
+
+#define SYSCFG_PMCSETR_ETH_SEL_MASK	GENMASK(23, 21)
+#define SYSCFG_PMCSETR_ETH_SEL_GMII_MII	0
+#define SYSCFG_PMCSETR_ETH_SEL_RGMII	BIT(21)
+#define SYSCFG_PMCSETR_ETH_SEL_RMII	BIT(23)
+
 static ulong eqos_get_tick_clk_rate_stm32(struct udevice *dev)
 {
 #ifdef CONFIG_CLK
@@ -108,11 +123,78 @@ static int eqos_stop_clks_stm32(struct udevice *dev)
 	return 0;
 }
 
+static int eqos_probe_syscfg_stm32(struct udevice *dev,
+				   phy_interface_t interface_type)
+{
+	bool eth_ref_clk_sel_reg = false;
+	bool eth_clk_sel_reg = false;
+	u8 *syscfg;
+	u32 value;
+
+	/* Gigabit Ethernet 125MHz clock selection. */
+	eth_clk_sel_reg = dev_read_bool(dev, "st,eth-clk-sel");
+
+	/* Ethernet 50Mhz RMII clock selection */
+	eth_ref_clk_sel_reg = dev_read_bool(dev, "st,eth-ref-clk-sel");
+
+	syscfg = (u8 *)syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
+	if (!syscfg)
+		return -ENODEV;
+
+	switch (interface_type) {
+	case PHY_INTERFACE_MODE_MII:
+		value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII |
+			SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
+		log_debug("PHY_INTERFACE_MODE_MII\n");
+		break;
+	case PHY_INTERFACE_MODE_GMII:
+		if (eth_clk_sel_reg)
+			value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII |
+				SYSCFG_PMCSETR_ETH_CLK_SEL;
+		else
+			value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII;
+		log_debug("PHY_INTERFACE_MODE_GMII\n");
+		break;
+	case PHY_INTERFACE_MODE_RMII:
+		if (eth_ref_clk_sel_reg)
+			value = SYSCFG_PMCSETR_ETH_SEL_RMII |
+				SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
+		else
+			value = SYSCFG_PMCSETR_ETH_SEL_RMII;
+		log_debug("PHY_INTERFACE_MODE_RMII\n");
+		break;
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		if (eth_clk_sel_reg)
+			value = SYSCFG_PMCSETR_ETH_SEL_RGMII |
+				SYSCFG_PMCSETR_ETH_CLK_SEL;
+		else
+			value = SYSCFG_PMCSETR_ETH_SEL_RGMII;
+		log_debug("PHY_INTERFACE_MODE_RGMII\n");
+		break;
+	default:
+		log_debug("Do not manage %d interface\n",
+			  interface_type);
+		/* Do not manage others interfaces */
+		return -EINVAL;
+	}
+
+	/* clear and set ETH configuration bits */
+	writel(SYSCFG_PMCSETR_ETH_SEL_MASK | SYSCFG_PMCSETR_ETH_SELMII |
+	       SYSCFG_PMCSETR_ETH_REF_CLK_SEL | SYSCFG_PMCSETR_ETH_CLK_SEL,
+	       syscfg + SYSCFG_PMCCLRR);
+	writel(value, syscfg + SYSCFG_PMCSETR);
+
+	return 0;
+}
+
 static int eqos_probe_resources_stm32(struct udevice *dev)
 {
 	struct eqos_priv *eqos = dev_get_priv(dev);
-	int ret;
 	phy_interface_t interface;
+	int ret;
 
 	debug("%s(dev=%p):\n", __func__, dev);
 
@@ -123,7 +205,7 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
 		return -EINVAL;
 	}
 
-	ret = board_interface_eth_init(dev, interface);
+	ret = eqos_probe_syscfg_stm32(dev, interface);
 	if (ret)
 		return -EINVAL;
 
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
