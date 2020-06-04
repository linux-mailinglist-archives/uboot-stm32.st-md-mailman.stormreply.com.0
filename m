Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4EC1EE46E
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Jun 2020 14:30:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6641BC36B25
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Jun 2020 12:30:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64B74C36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jun 2020 12:30:44 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 054CEPLH016898; Thu, 4 Jun 2020 14:30:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=NSORwk2vVcZ49JyJ01zv3RWgMj0l3v/otX4kNf0uGm8=;
 b=Fq7r9McGoj+CrbxZ+fl0cW+FGvsTCCqRyaXbCSqugSJWtSskebTW+sOGrGyJu5r2a26t
 K/+p9R82vO7LRTxqoB/Wufvkc6687ScHuPSMoB1fkghQi7BE5ETJEcLhfWZv8xFMGIBA
 J+zFwoOuLjYgkdS/C6bWzuK+nLeOy+FsgfnSSVdc1YgUQkdwGoijyNME9JJ6KTi9ONZH
 X7zVbnvoGO77ivjWn0NyvNCzo4P2XVpjH5D2j5OdXQgBjjaMxACfLWie9Ob9iWG4xsv/
 /T0NuYyX/WE4Rnrtd5247dh2ELjG9gMISLSN9fQ0JM1OZQs8viIvQAinwEs6Y2MYzGfJ 0A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31bcy0t86d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jun 2020 14:30:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5E7A3100034;
 Thu,  4 Jun 2020 14:30:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5533E2BE22C;
 Thu,  4 Jun 2020 14:30:43 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 4 Jun 2020 14:30:42 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 4 Jun 2020 14:30:33 +0200
Message-ID: <20200604143022.v2.11.I080300e7ec59426020b1d175aa207029ecb5e0cb@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200604123033.25499-1-patrick.delaunay@st.com>
References: <20200604123033.25499-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-04_10:2020-06-02,
 2020-06-04 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 11/11] pinctrl: stm32: add information on
	pin configuration
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

Changes in v2: None

 drivers/pinctrl/pinctrl_stm32.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
index fc241fdcde..71fa29a389 100644
--- a/drivers/pinctrl/pinctrl_stm32.c
+++ b/drivers/pinctrl/pinctrl_stm32.c
@@ -45,6 +45,17 @@ static const char * const pinmux_mode[PINMUX_MODE_COUNT] = {
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
@@ -182,10 +193,12 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
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
@@ -194,9 +207,9 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
 		return -ENODEV;
 
 	mode = gpio_get_raw_function(gpio_dev, gpio_idx, &label);
-
 	dev_dbg(dev, "selector = %d gpio_idx = %d mode = %d\n",
 		selector, gpio_idx, mode);
+	priv = dev_get_priv(gpio_dev);
 
 
 	switch (mode) {
@@ -211,9 +224,17 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
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
