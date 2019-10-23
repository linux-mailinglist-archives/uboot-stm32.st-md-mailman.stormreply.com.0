Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62973E203E
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 18:12:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D775C36B09
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 16:12:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF578C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 16:12:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9NG6dI1028664; Wed, 23 Oct 2019 18:12:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=nlw7jw2C/QeK5FOgQXCRsqyI02euaP5jKzrRg+WMK2I=;
 b=vQZs0bQ20we1LMKd97Af1U41rVP+SmwoNqSL4wwuMK2qtg58E6NVtfEjOvY/pmid6FuO
 7EiyBeAjh5pf51VgVLnEKY/6VBwr27csHNMtoLo7EwojAcKN8MIMVB93Zh8fORkDnX2n
 iUwV/jo+ZkrIupgb5lsoDevjSExvSj5REb+19NmTDnhTbHwTd/lMm7Z+eqOFW9rQ23bO
 qlNSvQoYYthhkEqsOYBuOLYaWUcIj4n+sSKrO+8ZAzBaC2aXB8DS+il+XG5rG/4FjjvK
 pZj0jRFqG3CnnrP385s50O4Q1nbPOeI7xANzH116OHL+c8dysH0X/xRG4G8m9SnHN0FB yA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vt9s74ngf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 18:12:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CB57A10002A;
 Wed, 23 Oct 2019 18:12:14 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C32B72C2E64;
 Wed, 23 Oct 2019 18:12:14 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct
 2019 18:12:14 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct 2019 18:12:14
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 23 Oct 2019 18:12:03 +0200
Message-ID: <20191023181153.5.I22160a764c0a6f8d963e9278bb2d361575e2769a@changeid>
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
Subject: [Uboot-stm32] [PATCH 5/5] gpio: stmfx: add set_config ops
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

Manage the flags for GPIO configuration:
- open_drain, push_pull
- pull_up, pull_down

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/pinctrl/pinctrl-stmfx.c | 105 +++++++++++++++++++++-----------
 1 file changed, 69 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index 0cd371fefa..d90e6fb57c 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -71,6 +71,36 @@ static int stmfx_write(struct udevice *dev, uint offset, unsigned int val)
 	return dm_i2c_reg_write(dev_get_parent(dev), offset, val);
 }
 
+static int stmfx_conf_set_pupd(struct udevice *dev,
+			       unsigned int pin, u32 pupd)
+{
+	u8 reg = STMFX_REG_GPIO_PUPD + get_reg(pin);
+	u32 mask = get_mask(pin);
+	int ret;
+
+	ret = stmfx_read(dev, reg);
+	if (ret < 0)
+		return ret;
+	ret = (ret & ~mask) | (pupd ? mask : 0);
+
+	return stmfx_write(dev, reg, ret);
+}
+
+static int stmfx_conf_set_type(struct udevice *dev,
+			       unsigned int pin, u32 type)
+{
+	u8 reg = STMFX_REG_GPIO_TYPE + get_reg(pin);
+	u32 mask = get_mask(pin);
+	int ret;
+
+	ret = stmfx_read(dev, reg);
+	if (ret < 0)
+		return ret;
+	ret = (ret & ~mask) | (type ? mask : 0);
+
+	return stmfx_write(dev, reg, ret);
+}
+
 static int stmfx_gpio_get(struct udevice *dev, unsigned int offset)
 {
 	u32 reg = STMFX_REG_GPIO_STATE + get_reg(offset);
@@ -138,6 +168,38 @@ static int stmfx_gpio_direction_output(struct udevice *dev,
 	return stmfx_write(dev, reg, ret | mask);
 }
 
+static int stmfx_gpio_set_config(struct udevice *dev, unsigned int offset,
+				 enum gpio_config config)
+{
+	int ret;
+
+	switch (config) {
+	case GPIO_CONF_DRIVE_OPEN_DRAIN:
+		ret = stmfx_conf_set_type(dev, offset, 0);
+		break;
+	case GPIO_CONF_DRIVE_PULL_PUSH:
+		ret = stmfx_conf_set_type(dev, offset, 1);
+		break;
+	case GPIO_CONF_BIAS_PULL_UP:
+		ret = stmfx_conf_set_type(dev, offset, 1);
+		if (ret)
+			return ret;
+		ret = stmfx_conf_set_pupd(dev, offset, 1);
+		break;
+	case GPIO_CONF_BIAS_PULL_DOWN:
+		ret = stmfx_conf_set_type(dev, offset, 1);
+		if (ret)
+			return ret;
+		ret = stmfx_conf_set_pupd(dev, offset, 0);
+		break;
+	case GPIO_CONF_DRIVE_OPEN_SOURCE:
+	default:
+		return -ENOTSUPP;
+	}
+
+	return ret;
+}
+
 static int stmfx_gpio_probe(struct udevice *dev)
 {
 	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
@@ -166,6 +228,7 @@ static const struct dm_gpio_ops stmfx_gpio_ops = {
 	.get_function = stmfx_gpio_get_function,
 	.direction_input = stmfx_gpio_direction_input,
 	.direction_output = stmfx_gpio_direction_output,
+	.set_config = stmfx_gpio_set_config,
 };
 
 U_BOOT_DRIVER(stmfx_gpio) = {
@@ -187,36 +250,6 @@ static const struct pinconf_param stmfx_pinctrl_conf_params[] = {
 	{ "output-low", PIN_CONFIG_OUTPUT, 0 },
 };
 
-static int stmfx_pinctrl_set_pupd(struct udevice *dev,
-				  unsigned int pin, u32 pupd)
-{
-	u8 reg = STMFX_REG_GPIO_PUPD + get_reg(pin);
-	u32 mask = get_mask(pin);
-	int ret;
-
-	ret = stmfx_read(dev, reg);
-	if (ret < 0)
-		return ret;
-	ret = (ret & ~mask) | (pupd ? mask : 0);
-
-	return stmfx_write(dev, reg, ret);
-}
-
-static int stmfx_pinctrl_set_type(struct udevice *dev,
-				  unsigned int pin, u32 type)
-{
-	u8 reg = STMFX_REG_GPIO_TYPE + get_reg(pin);
-	u32 mask = get_mask(pin);
-	int ret;
-
-	ret = stmfx_read(dev, reg);
-	if (ret < 0)
-		return ret;
-	ret = (ret & ~mask) | (type ? mask : 0);
-
-	return stmfx_write(dev, reg, ret);
-}
-
 static int stmfx_pinctrl_conf_set(struct udevice *dev, unsigned int pin,
 				  unsigned int param, unsigned int arg)
 {
@@ -232,22 +265,22 @@ static int stmfx_pinctrl_conf_set(struct udevice *dev, unsigned int pin,
 	case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
 	case PIN_CONFIG_BIAS_DISABLE:
 	case PIN_CONFIG_DRIVE_PUSH_PULL:
-		ret = stmfx_pinctrl_set_type(dev, pin, 0);
+		ret = stmfx_conf_set_type(dev, pin, 0);
 		break;
 	case PIN_CONFIG_BIAS_PULL_DOWN:
-		ret = stmfx_pinctrl_set_type(dev, pin, 1);
+		ret = stmfx_conf_set_type(dev, pin, 1);
 		if (ret)
 			return ret;
-		ret = stmfx_pinctrl_set_pupd(dev, pin, 0);
+		ret = stmfx_conf_set_pupd(dev, pin, 0);
 		break;
 	case PIN_CONFIG_BIAS_PULL_UP:
-		ret = stmfx_pinctrl_set_type(dev, pin, 1);
+		ret = stmfx_conf_set_type(dev, pin, 1);
 		if (ret)
 			return ret;
-		ret = stmfx_pinctrl_set_pupd(dev, pin, 1);
+		ret = stmfx_conf_set_pupd(dev, pin, 1);
 		break;
 	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
-		ret = stmfx_pinctrl_set_type(dev, pin, 1);
+		ret = stmfx_conf_set_type(dev, pin, 1);
 		break;
 	case PIN_CONFIG_OUTPUT:
 		ret = stmfx_gpio_direction_output(plat->gpio, pin, arg);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
