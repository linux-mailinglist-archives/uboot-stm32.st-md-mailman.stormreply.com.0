Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ADE1EE468
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Jun 2020 14:30:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59EC1C36B0B
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Jun 2020 12:30:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B272C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jun 2020 12:30:40 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 054CEOLH016895; Thu, 4 Jun 2020 14:30:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=6r7z7vq9DbDRyu/tSYwRon9DB5qYVsesXKQSzK16h34=;
 b=Q8i9lZxiCODP5/mzGE4ld24D/bGv/97kl2CZw1M3FloYlx/SSl2UNA40smQ6XWRNWsgs
 m6v2JipwehkumukU1+IAYZD7NmayW/4q7UiCpQZk7rkks6PShnFE+upCdDAC+CAReP6Z
 vBq2nASsgHmyE2bsY7Nn1y0eCkXW5dEHhxIRcqN5/m5UJ/Q808UKSBd0YXfjZ5duxNGi
 RgflY7aaUk9r6wWAFTTfAXLoGddMfqgaZNirODRC3O7wSvixz7KpAUGy7ps7bxgTQ0sB
 Lt3UOahpC3d5GXmviiPmAkBjpqXYgprMZ2d6PXrvcA6iG1VDgqA0E13fboeXpP8hbAc2 Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31bcy0t85y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jun 2020 14:30:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4D769100038;
 Thu,  4 Jun 2020 14:30:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 44CF22BE22C;
 Thu,  4 Jun 2020 14:30:38 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 4 Jun 2020 14:30:37 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 4 Jun 2020 14:30:26 +0200
Message-ID: <20200604143022.v2.4.I10d17ebccc888338f2b9f23a803aee50c0f8e089@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200604123033.25499-1-patrick.delaunay@st.com>
References: <20200604123033.25499-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-04_10:2020-06-02,
 2020-06-04 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 04/11] gpio: stm32: add ops get_dir_flags
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

Add ops get_dir_flags() to read dir flags from GPIO registers.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2: None

 drivers/gpio/stm32_gpio.c | 59 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/gpio/stm32_gpio.c b/drivers/gpio/stm32_gpio.c
index f120ee9808..5bff27f75b 100644
--- a/drivers/gpio/stm32_gpio.c
+++ b/drivers/gpio/stm32_gpio.c
@@ -41,6 +41,11 @@ static void stm32_gpio_set_moder(struct stm32_gpio_regs *regs,
 	clrsetbits_le32(&regs->moder, mask, mode << bits_index);
 }
 
+static int stm32_gpio_get_moder(struct stm32_gpio_regs *regs, int idx)
+{
+	return (readl(&regs->moder) >> MODE_BITS(idx)) & MODE_BITS_MASK;
+}
+
 static void stm32_gpio_set_otype(struct stm32_gpio_regs *regs,
 				 int idx,
 				 enum stm32_gpio_otype otype)
@@ -51,6 +56,12 @@ static void stm32_gpio_set_otype(struct stm32_gpio_regs *regs,
 	clrsetbits_le32(&regs->otyper, OTYPE_MSK << bits, otype << bits);
 }
 
+static enum stm32_gpio_otype stm32_gpio_get_otype(struct stm32_gpio_regs *regs,
+						  int idx)
+{
+	return (readl(&regs->otyper) >> OTYPE_BITS(idx)) & OTYPE_MSK;
+}
+
 static void stm32_gpio_set_pupd(struct stm32_gpio_regs *regs,
 				int idx,
 				enum stm32_gpio_pupd pupd)
@@ -61,6 +72,12 @@ static void stm32_gpio_set_pupd(struct stm32_gpio_regs *regs,
 	clrsetbits_le32(&regs->pupdr, PUPD_MASK << bits, pupd << bits);
 }
 
+static enum stm32_gpio_pupd stm32_gpio_get_pupd(struct stm32_gpio_regs *regs,
+						int idx)
+{
+	return (readl(&regs->pupdr) >> PUPD_BITS(idx)) & PUPD_MASK;
+}
+
 /*
  * convert gpio offset to gpio index taking into account gpio holes
  * into gpio bank
@@ -202,6 +219,47 @@ static int stm32_gpio_set_dir_flags(struct udevice *dev, unsigned int offset,
 	return 0;
 }
 
+static int stm32_gpio_get_dir_flags(struct udevice *dev, unsigned int offset,
+				    ulong *flags)
+{
+	struct stm32_gpio_priv *priv = dev_get_priv(dev);
+	struct stm32_gpio_regs *regs = priv->regs;
+	int idx;
+	ulong dir_flags = 0;
+
+	idx = stm32_offset_to_index(dev, offset);
+	if (idx < 0)
+		return idx;
+
+	switch (stm32_gpio_get_moder(regs, idx)) {
+	case STM32_GPIO_MODE_OUT:
+		dir_flags |= GPIOD_IS_OUT;
+		if (stm32_gpio_get_otype(regs, idx) == STM32_GPIO_OTYPE_OD)
+			dir_flags |= GPIOD_OPEN_DRAIN;
+		if (readl(&regs->idr) & BIT(idx))
+			dir_flags |= GPIOD_IS_OUT_ACTIVE;
+		break;
+	case STM32_GPIO_MODE_IN:
+		dir_flags |= GPIOD_IS_IN;
+		switch (stm32_gpio_get_pupd(regs, idx)) {
+		case STM32_GPIO_PUPD_UP:
+			dir_flags |= GPIOD_PULL_UP;
+			break;
+		case STM32_GPIO_PUPD_DOWN:
+			dir_flags |= GPIOD_PULL_DOWN;
+			break;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+	*flags = dir_flags;
+
+	return 0;
+}
+
 static const struct dm_gpio_ops gpio_stm32_ops = {
 	.direction_input	= stm32_gpio_direction_input,
 	.direction_output	= stm32_gpio_direction_output,
@@ -209,6 +267,7 @@ static const struct dm_gpio_ops gpio_stm32_ops = {
 	.set_value		= stm32_gpio_set_value,
 	.get_function		= stm32_gpio_get_function,
 	.set_dir_flags		= stm32_gpio_set_dir_flags,
+	.get_dir_flags		= stm32_gpio_get_dir_flags,
 };
 
 static int gpio_stm32_probe(struct udevice *dev)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
