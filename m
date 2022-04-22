Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B3550B1BF
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Apr 2022 09:38:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 484DBC6049D;
	Fri, 22 Apr 2022 07:38:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1AECC60492
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 07:38:39 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23M1eZAV015687;
 Fri, 22 Apr 2022 09:38:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=RBDp0Kc5xSPWa5TtfI1tnusXPd+II5QPdNyz6ohD9wQ=;
 b=w9hoKkTnqvp1iQVOf06xekcxZwV5iJlMzYdvXQLqCTqnurneXwU8nRNtYsIofovZCmA5
 hmL74czI8674QhAVwKSWtUZJBOCTVZlr4ocBRotH+/efIAuJZrTLfvv5PKcw1RVl2jeA
 6+rCeAO53huh2RZutiKmxQFCetzaFffN7m95WISGrSZuBxK2we4p/kV9J7f1uWARiEsk
 +wYq03+VB4sXDPQM/A60WSQa1YyMj//0hGvw6pcwOkve0r2Nw8n5nQbfunbfwMfNcv6v
 NoyedFp4x2Hb3IP74nuxDt5MZ96wr0IwenvZODpBIFXZuM30mp/QSp82FMIXrHQfWR7w 8w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ffpqe7g98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Apr 2022 09:38:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C8594100034;
 Fri, 22 Apr 2022 09:38:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BF529216833;
 Fri, 22 Apr 2022 09:38:37 +0200 (CEST)
Received: from localhost (10.75.127.44) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 22 Apr
 2022 09:38:37 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 22 Apr 2022 09:38:31 +0200
Message-ID: <20220422073831.15538-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220422073831.15538-1-patrice.chotard@foss.st.com>
References: <20220422073831.15538-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_02,2022-04-21_01,2022-02-23_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 3/3] gpio: stm32_gpio: Rework GPIO hole
	management
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

On some STM32 SoC's package, GPIO bank may have hole in their GPIO bank
Example:
  If GPIO bank have 16 GPIO pins [0-15].
  In particular SoC's package case, some GPIO bank can have less GPIO pins:
    - [0-10] => 11 pins;
    - [2-7] => 6 pins.

Commit dbf928dd2634 ("gpio: stm32f7: Add gpio bank holes management")
proposed a first implementation by not counting GPIO "inside" hole. GPIO
are not displaying correctly using gpio or pinmux command when GPIO holes
are located at the beginning of GPIO bank.

To simplify, consider that all GPIO have 16 GPIO and use the gpio_ranges
struct to indicate if a GPIO is mapped or not. GPIO uclass offers several
GPIO functions ("input", "output", "unused", "unknown" and "func"), use
"unknown" GPIO function to indicate that a GPIO is not mapped.

stm32_offset_to_index() is no more needed and removed.

This must be reflected using the "gpio" command to indicate to user
that a particular GPIO is not mapped (marked as "unknown") as shown below:

Example for a 16 pins GPIO bank with the [2-7] mapping (only 6 pins
mapped):
GPIOI0          : unknown
GPIOI1          : unknown
GPIOI2          : analog
GPIOI3          : analog
GPIOI4          : alt function 0 push-pull pull-down
GPIOI5          : alt function 0 push-pull pull-down
GPIOI6          : alt function 0 push-pull pull-down
GPIOI7          : analog
GPIOI8          : unknown
GPIOI9          : unknown
GPIOI10         : unknown
GPIOI11         : unknown
GPIOI12         : unknown
GPIOI13         : unknown
GPIOI14         : unknown
GPIOI15         : unknown

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/gpio/stm32_gpio.c       | 103 +++++++++++---------------------
 drivers/gpio/stm32_gpio_priv.h  |   2 -
 drivers/pinctrl/pinctrl_stm32.c |   5 +-
 3 files changed, 37 insertions(+), 73 deletions(-)

diff --git a/drivers/gpio/stm32_gpio.c b/drivers/gpio/stm32_gpio.c
index 8667ed3835..7a2ca91c76 100644
--- a/drivers/gpio/stm32_gpio.c
+++ b/drivers/gpio/stm32_gpio.c
@@ -83,38 +83,22 @@ static enum stm32_gpio_pupd stm32_gpio_get_pupd(struct stm32_gpio_regs *regs,
 	return (readl(&regs->pupdr) >> PUPD_BITS(idx)) & PUPD_MASK;
 }
 
-/*
- * convert gpio offset to gpio index taking into account gpio holes
- * into gpio bank
- */
-int stm32_offset_to_index(struct udevice *dev, unsigned int offset)
+static bool stm32_gpio_is_mapped(struct udevice *dev, int offset)
 {
 	struct stm32_gpio_priv *priv = dev_get_priv(dev);
-	unsigned int idx = 0;
-	int i;
-
-	for (i = 0; i < STM32_GPIOS_PER_BANK; i++) {
-		if (priv->gpio_range & BIT(i)) {
-			if (idx == offset)
-				return idx;
-			idx++;
-		}
-	}
-	/* shouldn't happen */
-	return -EINVAL;
+
+	return !!(priv->gpio_range & BIT(offset));
 }
 
 static int stm32_gpio_direction_input(struct udevice *dev, unsigned offset)
 {
 	struct stm32_gpio_priv *priv = dev_get_priv(dev);
 	struct stm32_gpio_regs *regs = priv->regs;
-	int idx;
 
-	idx = stm32_offset_to_index(dev, offset);
-	if (idx < 0)
-		return idx;
+	if (!stm32_gpio_is_mapped(dev, offset))
+		return -ENXIO;
 
-	stm32_gpio_set_moder(regs, idx, STM32_GPIO_MODE_IN);
+	stm32_gpio_set_moder(regs, offset, STM32_GPIO_MODE_IN);
 
 	return 0;
 }
@@ -124,15 +108,13 @@ static int stm32_gpio_direction_output(struct udevice *dev, unsigned offset,
 {
 	struct stm32_gpio_priv *priv = dev_get_priv(dev);
 	struct stm32_gpio_regs *regs = priv->regs;
-	int idx;
 
-	idx = stm32_offset_to_index(dev, offset);
-	if (idx < 0)
-		return idx;
+	if (!stm32_gpio_is_mapped(dev, offset))
+		return -ENXIO;
 
-	stm32_gpio_set_moder(regs, idx, STM32_GPIO_MODE_OUT);
+	stm32_gpio_set_moder(regs, offset, STM32_GPIO_MODE_OUT);
 
-	writel(BSRR_BIT(idx, value), &regs->bsrr);
+	writel(BSRR_BIT(offset, value), &regs->bsrr);
 
 	return 0;
 }
@@ -141,26 +123,22 @@ static int stm32_gpio_get_value(struct udevice *dev, unsigned offset)
 {
 	struct stm32_gpio_priv *priv = dev_get_priv(dev);
 	struct stm32_gpio_regs *regs = priv->regs;
-	int idx;
 
-	idx = stm32_offset_to_index(dev, offset);
-	if (idx < 0)
-		return idx;
+	if (!stm32_gpio_is_mapped(dev, offset))
+		return -ENXIO;
 
-	return readl(&regs->idr) & BIT(idx) ? 1 : 0;
+	return readl(&regs->idr) & BIT(offset) ? 1 : 0;
 }
 
 static int stm32_gpio_set_value(struct udevice *dev, unsigned offset, int value)
 {
 	struct stm32_gpio_priv *priv = dev_get_priv(dev);
 	struct stm32_gpio_regs *regs = priv->regs;
-	int idx;
 
-	idx = stm32_offset_to_index(dev, offset);
-	if (idx < 0)
-		return idx;
+	if (!stm32_gpio_is_mapped(dev, offset))
+		return -ENXIO;
 
-	writel(BSRR_BIT(idx, value), &regs->bsrr);
+	writel(BSRR_BIT(offset, value), &regs->bsrr);
 
 	return 0;
 }
@@ -171,14 +149,12 @@ static int stm32_gpio_get_function(struct udevice *dev, unsigned int offset)
 	struct stm32_gpio_regs *regs = priv->regs;
 	int bits_index;
 	int mask;
-	int idx;
 	u32 mode;
 
-	idx = stm32_offset_to_index(dev, offset);
-	if (idx < 0)
-		return idx;
+	if (!stm32_gpio_is_mapped(dev, offset))
+		return GPIOF_UNKNOWN;
 
-	bits_index = MODE_BITS(idx);
+	bits_index = MODE_BITS(offset);
 	mask = MODE_BITS_MASK << bits_index;
 
 	mode = (readl(&regs->moder) & mask) >> bits_index;
@@ -197,30 +173,28 @@ static int stm32_gpio_set_flags(struct udevice *dev, unsigned int offset,
 {
 	struct stm32_gpio_priv *priv = dev_get_priv(dev);
 	struct stm32_gpio_regs *regs = priv->regs;
-	int idx;
 
-	idx = stm32_offset_to_index(dev, offset);
-	if (idx < 0)
-		return idx;
+	if (!stm32_gpio_is_mapped(dev, offset))
+		return -ENXIO;
 
 	if (flags & GPIOD_IS_OUT) {
 		bool value = flags & GPIOD_IS_OUT_ACTIVE;
 
 		if (flags & GPIOD_OPEN_DRAIN)
-			stm32_gpio_set_otype(regs, idx, STM32_GPIO_OTYPE_OD);
+			stm32_gpio_set_otype(regs, offset, STM32_GPIO_OTYPE_OD);
 		else
-			stm32_gpio_set_otype(regs, idx, STM32_GPIO_OTYPE_PP);
+			stm32_gpio_set_otype(regs, offset, STM32_GPIO_OTYPE_PP);
 
-		stm32_gpio_set_moder(regs, idx, STM32_GPIO_MODE_OUT);
-		writel(BSRR_BIT(idx, value), &regs->bsrr);
+		stm32_gpio_set_moder(regs, offset, STM32_GPIO_MODE_OUT);
+		writel(BSRR_BIT(offset, value), &regs->bsrr);
 
 	} else if (flags & GPIOD_IS_IN) {
-		stm32_gpio_set_moder(regs, idx, STM32_GPIO_MODE_IN);
+		stm32_gpio_set_moder(regs, offset, STM32_GPIO_MODE_IN);
 	}
 	if (flags & GPIOD_PULL_UP)
-		stm32_gpio_set_pupd(regs, idx, STM32_GPIO_PUPD_UP);
+		stm32_gpio_set_pupd(regs, offset, STM32_GPIO_PUPD_UP);
 	else if (flags & GPIOD_PULL_DOWN)
-		stm32_gpio_set_pupd(regs, idx, STM32_GPIO_PUPD_DOWN);
+		stm32_gpio_set_pupd(regs, offset, STM32_GPIO_PUPD_DOWN);
 
 	return 0;
 }
@@ -230,19 +204,17 @@ static int stm32_gpio_get_flags(struct udevice *dev, unsigned int offset,
 {
 	struct stm32_gpio_priv *priv = dev_get_priv(dev);
 	struct stm32_gpio_regs *regs = priv->regs;
-	int idx;
 	ulong dir_flags = 0;
 
-	idx = stm32_offset_to_index(dev, offset);
-	if (idx < 0)
-		return idx;
+	if (!stm32_gpio_is_mapped(dev, offset))
+		return -ENXIO;
 
-	switch (stm32_gpio_get_moder(regs, idx)) {
+	switch (stm32_gpio_get_moder(regs, offset)) {
 	case STM32_GPIO_MODE_OUT:
 		dir_flags |= GPIOD_IS_OUT;
-		if (stm32_gpio_get_otype(regs, idx) == STM32_GPIO_OTYPE_OD)
+		if (stm32_gpio_get_otype(regs, offset) == STM32_GPIO_OTYPE_OD)
 			dir_flags |= GPIOD_OPEN_DRAIN;
-		if (readl(&regs->idr) & BIT(idx))
+		if (readl(&regs->idr) & BIT(offset))
 			dir_flags |= GPIOD_IS_OUT_ACTIVE;
 		break;
 	case STM32_GPIO_MODE_IN:
@@ -251,7 +223,7 @@ static int stm32_gpio_get_flags(struct udevice *dev, unsigned int offset,
 	default:
 		break;
 	}
-	switch (stm32_gpio_get_pupd(regs, idx)) {
+	switch (stm32_gpio_get_pupd(regs, offset)) {
 	case STM32_GPIO_PUPD_UP:
 		dir_flags |= GPIOD_PULL_UP;
 		break;
@@ -304,17 +276,14 @@ static int gpio_stm32_probe(struct udevice *dev)
 	if (!ret && args.args_count < 3)
 		return -EINVAL;
 
-	if (ret == -ENOENT) {
-		uc_priv->gpio_count = STM32_GPIOS_PER_BANK;
+	uc_priv->gpio_count = STM32_GPIOS_PER_BANK;
+	if (ret == -ENOENT)
 		priv->gpio_range = GENMASK(STM32_GPIOS_PER_BANK - 1, 0);
-	}
 
 	while (ret != -ENOENT) {
 		priv->gpio_range |= GENMASK(args.args[2] + args.args[0] - 1,
 				    args.args[0]);
 
-		uc_priv->gpio_count += args.args[2];
-
 		ret = dev_read_phandle_with_args(dev, "gpio-ranges", NULL, 3,
 						 ++i, &args);
 		if (!ret && args.args_count < 3)
diff --git a/drivers/gpio/stm32_gpio_priv.h b/drivers/gpio/stm32_gpio_priv.h
index d3d8f2ed5d..662a000fe7 100644
--- a/drivers/gpio/stm32_gpio_priv.h
+++ b/drivers/gpio/stm32_gpio_priv.h
@@ -81,6 +81,4 @@ struct stm32_gpio_priv {
 	unsigned int gpio_range;
 };
 
-int stm32_offset_to_index(struct udevice *dev, unsigned int offset);
-
 #endif /* _STM32_GPIO_PRIV_H_ */
diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
index 373f51f046..56a20e8bd2 100644
--- a/drivers/pinctrl/pinctrl_stm32.c
+++ b/drivers/pinctrl/pinctrl_stm32.c
@@ -157,10 +157,7 @@ static struct udevice *stm32_pinctrl_get_gpio_dev(struct udevice *dev,
 			 * we found the bank, convert pin selector to
 			 * gpio bank index
 			 */
-			*idx = stm32_offset_to_index(gpio_bank->gpio_dev,
-						     selector - pin_count);
-			if (IS_ERR_VALUE(*idx))
-				return NULL;
+			*idx = selector - pin_count;
 
 			return gpio_bank->gpio_dev;
 		}
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
