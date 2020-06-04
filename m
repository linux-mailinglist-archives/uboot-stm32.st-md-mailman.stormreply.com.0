Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E80E31EE46C
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Jun 2020 14:30:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A82FBC36B25
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Jun 2020 12:30:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB3FBC36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jun 2020 12:30:41 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 054CCO6R007272; Thu, 4 Jun 2020 14:30:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=w6zER34v+z39cZnxVb3WN+8o1Widt1b0BzYyPOmIUNo=;
 b=vsprqxuleMK8vRfOAb2N8rEgrW2KV8+XAqoSCN1oTPgaXcIkuDuqT6mpv7gR8FZCCmBC
 YSSj0B/w8WBTSOKjQr9K2O7L7MK9z4CiRlOEriaTyL1/sagkZIbp8K3KpvParXJLvgap
 ZM0azr28fvN5z+QqLSGH2w6mkk4PqgpXBz2GbOflbRvibpkfewmIcDTWJ3tt+wEKazUK
 2/FnXlXyK3KqvSDj2C7tBNihO/2aladPKmui7YpfovV9xw3Jn3dY6IdxJXY6jDMlq98L
 8PFho2E+BxqMmQUEua4iFyZsZinqNQZZpkUjHF8qhLVx9rpVgQ9e+uLM1oMGwlucMFk9 VA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31ejxautcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jun 2020 14:30:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 80404100034;
 Thu,  4 Jun 2020 14:30:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 760882BE22C;
 Thu,  4 Jun 2020 14:30:40 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 4 Jun 2020 14:30:39 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 4 Jun 2020 14:30:29 +0200
Message-ID: <20200604123033.25499-5-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200604123033.25499-1-patrick.delaunay@st.com>
References: <20200604123033.25499-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-04_10:2020-06-02,
 2020-06-04 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 07/11] gpio: stmfx: add function
	stmfx_read_reg and stmfx_write_reg
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

Add the helper functions stmfx_read_reg() and stmfx_write_reg() to avoid
duplicated code for access to stmfx's register with mask.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- NEW: split previous patch [5/5] gpio: stmfx: add set_config ops

 drivers/pinctrl/pinctrl-stmfx.c | 68 +++++++++++++--------------------
 1 file changed, 26 insertions(+), 42 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index 657ca2e240..5d15424b84 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -74,43 +74,49 @@ static int stmfx_write(struct udevice *dev, uint offset, unsigned int val)
 	return dm_i2c_reg_write(dev_get_parent(dev), offset, val);
 }
 
-static int stmfx_conf_set_pupd(struct udevice *dev, unsigned int pin, u32 pupd)
+static int stmfx_read_reg(struct udevice *dev, u8 reg_base, uint offset)
 {
-	u8 reg = STMFX_REG_GPIO_PUPD + get_reg(pin);
-	u32 mask = get_mask(pin);
+	u8 reg = reg_base + get_reg(offset);
+	u32 mask = get_mask(offset);
 	int ret;
 
 	ret = stmfx_read(dev, reg);
 	if (ret < 0)
 		return ret;
-	ret = (ret & ~mask) | (pupd ? mask : 0);
 
-	return stmfx_write(dev, reg, ret);
+	return ret < 0 ? ret : !!(ret & mask);
 }
 
-static int stmfx_conf_set_type(struct udevice *dev, unsigned int pin, u32 type)
+static int stmfx_write_reg(struct udevice *dev, u8 reg_base, uint offset,
+			   uint val)
 {
-	u8 reg = STMFX_REG_GPIO_TYPE + get_reg(pin);
-	u32 mask = get_mask(pin);
+	u8 reg = reg_base + get_reg(offset);
+	u32 mask = get_mask(offset);
 	int ret;
 
 	ret = stmfx_read(dev, reg);
 	if (ret < 0)
 		return ret;
-	ret = (ret & ~mask) | (type ? mask : 0);
+	ret = (ret & ~mask) | (val ? mask : 0);
 
 	return stmfx_write(dev, reg, ret);
 }
 
-static int stmfx_gpio_get(struct udevice *dev, unsigned int offset)
+static int stmfx_conf_set_pupd(struct udevice *dev, unsigned int offset,
+			       uint pupd)
 {
-	u32 reg = STMFX_REG_GPIO_STATE + get_reg(offset);
-	u32 mask = get_mask(offset);
-	int ret;
+	return stmfx_write_reg(dev, STMFX_REG_GPIO_PUPD, offset, pupd);
+}
 
-	ret = stmfx_read(dev, reg);
+static int stmfx_conf_set_type(struct udevice *dev, unsigned int offset,
+			       uint type)
+{
+	return stmfx_write_reg(dev, STMFX_REG_GPIO_TYPE, offset, type);
+}
 
-	return ret < 0 ? ret : !!(ret & mask);
+static int stmfx_gpio_get(struct udevice *dev, unsigned int offset)
+{
+	return stmfx_read_reg(dev, STMFX_REG_GPIO_STATE, offset);
 }
 
 static int stmfx_gpio_set(struct udevice *dev, unsigned int offset, int value)
@@ -123,50 +129,28 @@ static int stmfx_gpio_set(struct udevice *dev, unsigned int offset, int value)
 
 static int stmfx_gpio_get_function(struct udevice *dev, unsigned int offset)
 {
-	u32 reg = STMFX_REG_GPIO_DIR + get_reg(offset);
-	u32 mask = get_mask(offset);
-	int ret;
-
-	ret = stmfx_read(dev, reg);
+	int ret = stmfx_read_reg(dev, STMFX_REG_GPIO_DIR, offset);
 
 	if (ret < 0)
 		return ret;
 	/* On stmfx, gpio pins direction is (0)input, (1)output. */
 
-	return ret & mask ? GPIOF_OUTPUT : GPIOF_INPUT;
+	return ret ? GPIOF_OUTPUT : GPIOF_INPUT;
 }
 
 static int stmfx_gpio_direction_input(struct udevice *dev, unsigned int offset)
 {
-	u32 reg = STMFX_REG_GPIO_DIR + get_reg(offset);
-	u32 mask = get_mask(offset);
-	int ret;
-
-	ret = stmfx_read(dev, reg);
-	if (ret < 0)
-		return ret;
-
-	ret &= ~mask;
-
-	return stmfx_write(dev, reg, ret & ~mask);
+	return stmfx_write_reg(dev, STMFX_REG_GPIO_DIR, offset, 0);
 }
 
 static int stmfx_gpio_direction_output(struct udevice *dev,
 				       unsigned int offset, int value)
 {
-	u32 reg = STMFX_REG_GPIO_DIR + get_reg(offset);
-	u32 mask = get_mask(offset);
-	int ret;
-
-	ret = stmfx_gpio_set(dev, offset, value);
-	if (ret < 0)
-		return ret;
-
-	ret = stmfx_read(dev, reg);
+	int ret = stmfx_gpio_set(dev, offset, value);
 	if (ret < 0)
 		return ret;
 
-	return stmfx_write(dev, reg, ret | mask);
+	return stmfx_write_reg(dev, STMFX_REG_GPIO_DIR, offset, 1);
 }
 
 static int stmfx_gpio_probe(struct udevice *dev)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
