Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1287218DF
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 May 2019 15:08:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E1E6C05842
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 May 2019 13:08:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A52E2C05842
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 May 2019 13:08:54 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4HD72Ov003556; Fri, 17 May 2019 15:08:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=9TGIkOEFBf1ETMzP8LZIdaAUz47V3IIMWkcBNSzMGU4=;
 b=F6IY/yEswNwE3ztcLC0c9WkDhfLzki1tdJyKR0o814I8haQi8KE57YBlemaCsq+PXLjA
 vhWM9ueusq+V32MO6Dd33ymxe+3RGLJ9CvGMyuKqq4bX9V/WJ0HvVuzL58yfExjs2hhY
 s69uxsHiK6aqoeILtHYTAO3V2hVPbiTa8oRCFXnOGIkuZ0qvf/T75JCaZzaRsOGI/x4+
 PuDEvkn7zpcSQ3LXrE2VK5dGSeCuYHiyxZiV2mTwxkA/5fM4WMC+HL9rrQuMeCUdQuVN
 PKUl398IuUEj6dq6HHO9GZfhLh6VKg5UnN73qHW7epdFd96HqTkb8ODyB6fS0x7Gxwfz dA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sdkv0dv3e-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 17 May 2019 15:08:54 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 30D1638;
 Fri, 17 May 2019 13:08:53 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1B4932B19;
 Fri, 17 May 2019 13:08:53 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 17 May
 2019 15:08:53 +0200
Received: from localhost (10.201.22.222) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 17 May 2019 15:08:52
 +0200
From: Christophe Roullier <christophe.roullier@st.com>
To: Christophe Roullier <christophe.roullier@st.com>, <u-boot@lists.denx.de>
Date: Fri, 17 May 2019 15:08:43 +0200
Message-ID: <20190517130847.13144-3-christophe.roullier@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517130847.13144-1-christophe.roullier@st.com>
References: <20190517130847.13144-1-christophe.roullier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.222]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-17_07:, , signatures=0
Cc: Christophe KERELLO <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas MANOCHA <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH v2 2/6] board: stm32mp1: Add
	board_interface_eth_init
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

Called to configure Ethernet PHY interface selection and
configure clock selection in RCC Ethernet clock tree.

Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
---

Changes in v2: None

 board/st/stm32mp1/stm32mp1.c | 68 ++++++++++++++++++++++++++++++++++--
 1 file changed, 65 insertions(+), 3 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 76917b022ed..e120fc57223 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -51,9 +51,9 @@
 #define SYSCFG_PMCSETR_ETH_SELMII	BIT(20)
 
 #define SYSCFG_PMCSETR_ETH_SEL_MASK	GENMASK(23, 21)
-#define SYSCFG_PMCSETR_ETH_SEL_GMII_MII	(0 << 21)
-#define SYSCFG_PMCSETR_ETH_SEL_RGMII	(1 << 21)
-#define SYSCFG_PMCSETR_ETH_SEL_RMII	(4 << 21)
+#define SYSCFG_PMCSETR_ETH_SEL_GMII_MII	0
+#define SYSCFG_PMCSETR_ETH_SEL_RGMII	BIT(21)
+#define SYSCFG_PMCSETR_ETH_SEL_RMII	BIT(23)
 
 /*
  * Get a global data pointer
@@ -504,3 +504,65 @@ void board_quiesce_devices(void)
 {
 	setup_led(LEDST_OFF);
 }
+
+/* board interface eth init */
+/* this is a weak define that we are overriding */
+int board_interface_eth_init(phy_interface_t interface_type,
+			     bool eth_clk_sel_reg, bool eth_ref_clk_sel_reg)
+{
+	u8 *syscfg;
+	u32 value;
+
+	syscfg = (u8 *)syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
+
+	if (!syscfg)
+		return -ENODEV;
+
+	switch (interface_type) {
+	case PHY_INTERFACE_MODE_MII:
+		value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII |
+			SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
+		debug("%s: PHY_INTERFACE_MODE_MII\n", __func__);
+		break;
+	case PHY_INTERFACE_MODE_GMII:
+		if (eth_clk_sel_reg)
+			value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII |
+				SYSCFG_PMCSETR_ETH_CLK_SEL;
+		else
+			value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII;
+		debug("%s: PHY_INTERFACE_MODE_GMII\n", __func__);
+		break;
+	case PHY_INTERFACE_MODE_RMII:
+		if (eth_ref_clk_sel_reg)
+			value = SYSCFG_PMCSETR_ETH_SEL_RMII |
+				SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
+		else
+			value = SYSCFG_PMCSETR_ETH_SEL_RMII;
+		debug("%s: PHY_INTERFACE_MODE_RMII\n", __func__);
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
+		debug("%s: PHY_INTERFACE_MODE_RGMII\n", __func__);
+		break;
+	default:
+		debug("%s: Do not manage %d interface\n",
+		      __func__, interface_type);
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
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
