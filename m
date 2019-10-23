Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4086EE203B
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 18:12:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E786C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 16:12:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E5E6C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 16:12:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9NG6duh028658; Wed, 23 Oct 2019 18:12:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=TbptqlnKlqX2BbmDEACf6ekowmpmI4argS+SrZ3GQPM=;
 b=YGyqm0FcZXqtZWQErzBU9kxIQNyN62jl60XROB1Tv1ftHi8A3vJCYYuMbKLE4Wqn5YFM
 ersrsufcn9Hs2Ktnq+SpEmjgLaIx7vUqAEuXK2AywoPsF/rUk/B28TzWzhD954a0RAj3
 WsnRS+Ii69/GHDLwEAr9eLzcLUCyxvUSuqvmSLpZx4NcG17A5QHzES7hweVmIIiCv9/l
 dwxPTr4hu0YZyNWbQh/oDuCIgw205uPwUVMUPTxKPWM+uhn9yhn1nQU5qNnIlvgvTMWs
 EiL8jNJ8gYzgySg2znrJaGFR4nbpNol9JcrVPOwF8iFkOQw6KsCQIjWRRF2kQ5No/2E9 9w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vt9s74ng5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 18:12:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2E90B10002A;
 Wed, 23 Oct 2019 18:12:10 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 239462C2E62;
 Wed, 23 Oct 2019 18:12:10 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct
 2019 18:12:10 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct 2019 18:12:09
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 23 Oct 2019 18:12:00 +0200
Message-ID: <20191023181153.2.I080300e7ec59426020b1d175aa207029ecb5e0cb@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023161203.23616-1-patrick.delaunay@st.com>
References: <20191023161203.23616-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_04:2019-10-23,2019-10-23 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/5] pinctrl: stm32: add information on pin
	configuration
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

Add information on pin configuration used for pinmux command:
- bias configuration for output (disable, pull up, pull down)
- otype for input (open drain or push pull)

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/pinctrl/pinctrl_stm32.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
index 3a235ae5a7..4511cd7a45 100644
--- a/drivers/pinctrl/pinctrl_stm32.c
+++ b/drivers/pinctrl/pinctrl_stm32.c
@@ -39,6 +39,17 @@ static const char * const pinmux_mode[PINMUX_MODE_COUNT] = {
 	"alt function",
 };
 
+static const char * const pinmux_output[] = {
+	[STM32_GPIO_PUPD_NO] = "bias-disable",
+	[STM32_GPIO_PUPD_UP] = "bias-pull-up",
+	[STM32_GPIO_PUPD_DOWN] = "bias-pull-down",
+};
+
+static const char * const pinmux_input[] = {
+	[STM32_GPIO_OTYPE_PP] = "drive-push-pull",
+	[STM32_GPIO_OTYPE_OD] = "drive-open-drain",
+};
+
 static int stm32_pinctrl_get_af(struct udevice *dev, unsigned int offset)
 {
 	struct stm32_gpio_priv *priv = dev_get_priv(dev);
@@ -176,10 +187,12 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
 					int size)
 {
 	struct udevice *gpio_dev;
+	struct stm32_gpio_priv *priv;
 	const char *label;
 	int mode;
 	int af_num;
 	unsigned int gpio_idx;
+	u32 pupd, otype;
 
 	/* look up for the bank which owns the requested pin */
 	gpio_dev = stm32_pinctrl_get_gpio_dev(dev, selector, &gpio_idx);
@@ -188,9 +201,9 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
 		return -ENODEV;
 
 	mode = gpio_get_raw_function(gpio_dev, gpio_idx, &label);
-
 	dev_dbg(dev, "selector = %d gpio_idx = %d mode = %d\n",
 		selector, gpio_idx, mode);
+	priv = dev_get_priv(gpio_dev);
 
 
 	switch (mode) {
@@ -205,9 +218,17 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
 		snprintf(buf, size, "%s %d", pinmux_mode[mode], af_num);
 		break;
 	case GPIOF_OUTPUT:
+		pupd = (readl(&priv->regs->pupdr) >> (gpio_idx * 2)) &
+		       PUPD_MASK;
+		snprintf(buf, size, "%s %s %s",
+			 pinmux_mode[mode], pinmux_output[pupd],
+			 label ? label : "");
+		break;
 	case GPIOF_INPUT:
-		snprintf(buf, size, "%s %s",
-			 pinmux_mode[mode], label ? label : "");
+		otype = (readl(&priv->regs->otyper) >> gpio_idx) & OTYPE_MSK;
+		snprintf(buf, size, "%s %s %s",
+			 pinmux_mode[mode], pinmux_input[otype],
+			 label ? label : "");
 		break;
 	}
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
