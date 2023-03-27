Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 287036C9CAC
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Mar 2023 09:47:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5609C6A5F6;
	Mon, 27 Mar 2023 07:47:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44E4CC03FC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 07:47:21 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32R5Z1PA011572; Mon, 27 Mar 2023 09:47:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=bxmqjFoq8tJXNllrSe9lVedbsmJ3NcWQ9BZzjnkDPcQ=;
 b=ZGPw1nMToUbJe7Tu/WcfRCxFwM3VZvNhkbS2WiRScegc057m2BX/m41xWJPZXBuaDmtv
 8DIKQ6JOiKzIOrp/0pLJcpwCFQDW6w6ymEtfjQY7cDxaDQyDCHG/8ZSNq2SLWI4O6eQ+
 T4JtyNtPbvuhsDmsSucscD+LDbLkB2udvyhUazaceCBax7YoTxAi+K9zGOPgyXVEekwG
 JIdgObUKKG4nYq5cEsLRR+9PVxeNds3rVOwgjckwd4x55W89JtPS4CB16wcnaE/OVwv7
 fIpl/gsjH3tpc3XiVeWm8eXv/nKnn/3bHbQs9hTzJATeacllJIeEAgUWp5tYL0CTi6pq 2g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3phsn2rva1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 09:47:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 056401000AF;
 Mon, 27 Mar 2023 09:47:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EB96421161A;
 Mon, 27 Mar 2023 09:46:43 +0200 (CEST)
Received: from localhost (10.252.19.203) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 27 Mar
 2023 09:46:43 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 27 Mar 2023 09:46:41 +0200
Message-ID: <20230327074641.44900-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.19.203]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] pinctrl: pinctrl_stm32: Add slew rate support
	for stm32_pinctrl_get_pin_muxing()
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

For debug purpose, it should be useful to indicate the slew rate for
each pins.
Add ospeed register information for pins which are configured in
either alternate function or gpio output.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/pinctrl/pinctrl_stm32.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
index b755fa42b4f..b06da50b2cd 100644
--- a/drivers/pinctrl/pinctrl_stm32.c
+++ b/drivers/pinctrl/pinctrl_stm32.c
@@ -61,6 +61,13 @@ static const char * const pinmux_otype[] = {
 	[STM32_GPIO_OTYPE_OD] = "open-drain",
 };
 
+static const char * const pinmux_speed[] = {
+	[STM32_GPIO_SPEED_2M] = "Low speed",
+	[STM32_GPIO_SPEED_25M] = "Medium speed",
+	[STM32_GPIO_SPEED_50M] = "High speed",
+	[STM32_GPIO_SPEED_100M] = "Very-high speed",
+};
+
 static int stm32_pinctrl_get_af(struct udevice *dev, unsigned int offset)
 {
 	struct stm32_gpio_priv *priv = dev_get_priv(dev);
@@ -201,6 +208,7 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
 	int af_num;
 	unsigned int gpio_idx;
 	u32 pupd, otype;
+	u8 speed;
 
 	/* look up for the bank which owns the requested pin */
 	gpio_dev = stm32_pinctrl_get_gpio_dev(dev, selector, &gpio_idx);
@@ -214,6 +222,7 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
 	priv = dev_get_priv(gpio_dev);
 	pupd = (readl(&priv->regs->pupdr) >> (gpio_idx * 2)) & PUPD_MASK;
 	otype = (readl(&priv->regs->otyper) >> gpio_idx) & OTYPE_MSK;
+	speed = (readl(&priv->regs->ospeedr) >> gpio_idx * 2) & OSPEED_MASK;
 
 	switch (mode) {
 	case GPIOF_UNKNOWN:
@@ -222,13 +231,15 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
 		break;
 	case GPIOF_FUNC:
 		af_num = stm32_pinctrl_get_af(gpio_dev, gpio_idx);
-		snprintf(buf, size, "%s %d %s %s", pinmux_mode[mode], af_num,
-			 pinmux_otype[otype], pinmux_bias[pupd]);
+		snprintf(buf, size, "%s %d %s %s %s", pinmux_mode[mode], af_num,
+			 pinmux_otype[otype], pinmux_bias[pupd],
+			 pinmux_speed[speed]);
 		break;
 	case GPIOF_OUTPUT:
-		snprintf(buf, size, "%s %s %s %s",
+		snprintf(buf, size, "%s %s %s %s %s",
 			 pinmux_mode[mode], pinmux_otype[otype],
-			 pinmux_bias[pupd], label ? label : "");
+			 pinmux_bias[pupd], label ? label : "",
+			 pinmux_speed[speed]);
 		break;
 	case GPIOF_INPUT:
 		snprintf(buf, size, "%s %s %s", pinmux_mode[mode],
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
