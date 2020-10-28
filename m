Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEC129CF4D
	for <lists+uboot-stm32@lfdr.de>; Wed, 28 Oct 2020 10:49:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0316DC3FAD5;
	Wed, 28 Oct 2020 09:49:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60737C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Oct 2020 09:49:14 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09S9kvRj006065; Wed, 28 Oct 2020 10:49:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=lw5eqcIgvxNAa2njJoK1lodZQn5rB5jwJSp+pwz0w4c=;
 b=o86/J4utkHrA9Ar7saL1C4tHv61QWaaaoV9uve91M0m78Cg2EWD+Rzb7y0LkY6UaAEfF
 SL1COcZj/oSnKtkRukBhvE44AyNzKTBPmgucmZiuYBoGkl3hdSrKchj7xvTXxM/gc0Ym
 iVIRqJIkV+aNMYQPeVgwU+HpszOy8wKoSis6UvDjzgscqPa4B6hHe0yo26r6fWCP5uay
 9PmnYkkhbpM/3u61ii3QGQTTyLIhO6lvmh6KpAV5WXcVeknrz1oANaF5MR2O8LboWlsl
 kq5PWufyD55BtdMYMnA0NvOJH78AQazdWmQDzyKHT+oJSFfPViXVGxeExNMNZnbpgqgm Sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccj20a7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 10:49:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8068D10003A;
 Wed, 28 Oct 2020 10:49:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 611002A4D60;
 Wed, 28 Oct 2020 10:49:11 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 28 Oct 2020 10:49:10
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 28 Oct 2020 10:49:07 +0100
Message-ID: <20201028094908.11031-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_04:2020-10-26,
 2020-10-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/2] pinctrl: stm32: display bias information
	for all pins
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

Display the bias information for input gpios or AF configuration,
and not only for output pin, as described in Reference manual
(Table 81. Port bit configuration table).

Fixes: da7a0bb1f279 ("pinctrl: stm32: add information on pin configuration")
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/pinctrl/pinctrl_stm32.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
index dbea99532c..262b2c3d7e 100644
--- a/drivers/pinctrl/pinctrl_stm32.c
+++ b/drivers/pinctrl/pinctrl_stm32.c
@@ -48,15 +48,15 @@ static const char * const pinmux_mode[PINMUX_MODE_COUNT] = {
 	"alt function",
 };
 
-static const char * const pinmux_output[] = {
-	[STM32_GPIO_PUPD_NO] = "bias-disable",
-	[STM32_GPIO_PUPD_UP] = "bias-pull-up",
-	[STM32_GPIO_PUPD_DOWN] = "bias-pull-down",
+static const char * const pinmux_bias[] = {
+	[STM32_GPIO_PUPD_NO] = "",
+	[STM32_GPIO_PUPD_UP] = "pull-up",
+	[STM32_GPIO_PUPD_DOWN] = "pull-down",
 };
 
 static const char * const pinmux_input[] = {
-	[STM32_GPIO_OTYPE_PP] = "drive-push-pull",
-	[STM32_GPIO_OTYPE_OD] = "drive-open-drain",
+	[STM32_GPIO_OTYPE_PP] = "push-pull",
+	[STM32_GPIO_OTYPE_OD] = "open-drain",
 };
 
 static int stm32_pinctrl_get_af(struct udevice *dev, unsigned int offset)
@@ -213,6 +213,7 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
 	dev_dbg(dev, "selector = %d gpio_idx = %d mode = %d\n",
 		selector, gpio_idx, mode);
 	priv = dev_get_priv(gpio_dev);
+	pupd = (readl(&priv->regs->pupdr) >> (gpio_idx * 2)) & PUPD_MASK;
 
 
 	switch (mode) {
@@ -224,20 +225,19 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
 		break;
 	case GPIOF_FUNC:
 		af_num = stm32_pinctrl_get_af(gpio_dev, gpio_idx);
-		snprintf(buf, size, "%s %d", pinmux_mode[mode], af_num);
+		snprintf(buf, size, "%s %d %s", pinmux_mode[mode], af_num,
+			 pinmux_bias[pupd]);
 		break;
 	case GPIOF_OUTPUT:
-		pupd = (readl(&priv->regs->pupdr) >> (gpio_idx * 2)) &
-		       PUPD_MASK;
 		snprintf(buf, size, "%s %s %s",
-			 pinmux_mode[mode], pinmux_output[pupd],
+			 pinmux_mode[mode], pinmux_bias[pupd],
 			 label ? label : "");
 		break;
 	case GPIOF_INPUT:
 		otype = (readl(&priv->regs->otyper) >> gpio_idx) & OTYPE_MSK;
-		snprintf(buf, size, "%s %s %s",
+		snprintf(buf, size, "%s %s %s %s",
 			 pinmux_mode[mode], pinmux_input[otype],
-			 label ? label : "");
+			 pinmux_bias[pupd], label ? label : "");
 		break;
 	}
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
