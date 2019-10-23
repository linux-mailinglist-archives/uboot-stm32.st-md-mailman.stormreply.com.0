Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57539E203D
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 18:12:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21CEAC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 16:12:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE478C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 16:12:14 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9NG6dui028658; Wed, 23 Oct 2019 18:12:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=d1o5+hM19Cb7tuU23s9BBdfQXgNNzkBbdMqsTXGlth4=;
 b=GJAXTF0/bxv6fy23lqscItZHVZ0iUZuEWJSlXLrw63oPYUR0e2sAga4x05bgrBARPRxt
 ZghyOBglYIjLnfK3mWFmTgEGRb2H8wsZjRByDCqFBkcbAD737AkxKxmkwJ92n/FtQ060
 yPoWY36kpqOug898wqRTwhf0/s7rANyjiDQA/HfeOHGr5D7HqYezrNZqvSmCHyubCaXp
 DPQawuuIQp66F7Bso2BhpvG3S2FXCQTtav94w75KSqQIq5IS7C6BCaVX/o2UoLz6gKUk
 dzFSnSNt6W5SIWR7sSJTyJIcryVknmEpy7q30bZ2KNoP5Cufax37yeIbdO82BSk37Dae aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vt9s74ngd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 18:12:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 50EE110002A;
 Wed, 23 Oct 2019 18:12:13 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4917C2C2E62;
 Wed, 23 Oct 2019 18:12:13 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct
 2019 18:12:13 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct 2019 18:12:12
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 23 Oct 2019 18:12:02 +0200
Message-ID: <20191023181153.4.I41efb7f94304e2a2c1f0cc7dc1397728bc6ed91a@changeid>
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
Subject: [Uboot-stm32] [PATCH 4/5] gpio: stm32: add set_config ops
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

Manage flags for GPIO configuration:
- open_drain, open_source, push_pull
- pull_up, pull_down

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/gpio/stm32_gpio.c | 58 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/gpio/stm32_gpio.c b/drivers/gpio/stm32_gpio.c
index 302a434947..bc4c378260 100644
--- a/drivers/gpio/stm32_gpio.c
+++ b/drivers/gpio/stm32_gpio.c
@@ -19,6 +19,12 @@
 #define MODE_BITS_MASK			3
 #define BSRR_BIT(gpio_pin, value)	BIT(gpio_pin + (value ? 0 : 16))
 
+#define PUPD_BITS(gpio_pin)		(gpio_pin * 2)
+#define PUPD_MASK			3
+
+#define OTYPE_BITS(gpio_pin)		(gpio_pin)
+#define OTYPE_MSK			1
+
 #ifndef CONFIG_SPL_BUILD
 /*
  * convert gpio offset to gpio index taking into account gpio holes
@@ -139,12 +145,64 @@ static int stm32_gpio_get_function(struct udevice *dev, unsigned int offset)
 	return GPIOF_FUNC;
 }
 
+static void stm32_gpio_set_otype(struct stm32_gpio_regs *regs,
+				 int idx,
+				 enum stm32_gpio_otype otype)
+{
+	int bits;
+
+	bits = OTYPE_BITS(idx);
+	clrsetbits_le32(&regs->otyper, OTYPE_MSK << bits, otype << bits);
+}
+
+static void stm32_gpio_set_pupd(struct stm32_gpio_regs *regs,
+				int idx,
+				enum stm32_gpio_pupd pupd)
+{
+	int bits;
+
+	bits = PUPD_BITS(idx);
+	clrsetbits_le32(&regs->pupdr, PUPD_MASK << bits, pupd << bits);
+}
+
+static int stm32_gpio_set_config(struct udevice *dev, unsigned int offset,
+				 enum gpio_config config)
+{
+	struct stm32_gpio_priv *priv = dev_get_priv(dev);
+	struct stm32_gpio_regs *regs = priv->regs;
+	int idx;
+
+	idx = stm32_offset_to_index(dev, offset);
+	if (idx < 0)
+		return idx;
+
+	switch (config) {
+	default:
+		return -ENOTSUPP;
+	case GPIO_CONF_DRIVE_OPEN_DRAIN:
+		stm32_gpio_set_otype(regs, idx, STM32_GPIO_OTYPE_OD);
+		break;
+	case GPIO_CONF_DRIVE_PULL_PUSH:
+		stm32_gpio_set_otype(regs, idx, STM32_GPIO_OTYPE_PP);
+		break;
+	case GPIO_CONF_BIAS_PULL_UP:
+		stm32_gpio_set_pupd(regs, idx, STM32_GPIO_PUPD_UP);
+		break;
+	case GPIO_CONF_BIAS_PULL_DOWN:
+		stm32_gpio_set_pupd(regs, idx, STM32_GPIO_PUPD_DOWN);
+		break;
+	}
+
+	return 0;
+}
+
 static const struct dm_gpio_ops gpio_stm32_ops = {
 	.direction_input	= stm32_gpio_direction_input,
 	.direction_output	= stm32_gpio_direction_output,
 	.get_value		= stm32_gpio_get_value,
 	.set_value		= stm32_gpio_set_value,
 	.get_function		= stm32_gpio_get_function,
+	.set_config		= stm32_gpio_set_config,
 };
 #endif
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
