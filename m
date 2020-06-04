Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C491EE470
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Jun 2020 14:30:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DA65C36B0D
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Jun 2020 12:30:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7252BC36B22
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jun 2020 12:30:43 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 054CEPLF016898; Thu, 4 Jun 2020 14:30:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=+OcoO1pd1ggISWWpf9efvVYMKNwd6eTrU7ClaRN8ixQ=;
 b=FW45+TNjZBMrHYSxVcCW6ev26LG2SNTtqUTTZJN+PEGkYnCTEJwIviOYk8goU91RkZXc
 74o1tRCN/RVmfmG5DNMTQsuazGeuwzgbQPubkDbNVz1YfFxY0W5SqOZ/u7TdSlnVMCcU
 BR8B493VbnK8gKbTSLvyOkuIh0aOJa+ZT501/DavL4U5u+frf5hCoTiVB8HQPYftORzU
 eNaJT9YzlAXDsH15jx9nnS+z6peabSx8Kq43/Z6QVjE2WEb7z2Vn7vtRDUoCwViLVd+x
 zFhvN07UPuV6WBL26NBVxNN4ijkruyLN7BgOAFdNp3+jeTXew5LSYCVShJ0iCSv7SF/Q uA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31bcy0t868-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jun 2020 14:30:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F149310002A;
 Thu,  4 Jun 2020 14:30:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E83FE2BE22C;
 Thu,  4 Jun 2020 14:30:41 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 4 Jun 2020 14:30:41 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 4 Jun 2020 14:30:31 +0200
Message-ID: <20200604143022.v2.9.I375f10587b02d30722492fc1101aaf214c8a873b@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200604123033.25499-1-patrick.delaunay@st.com>
References: <20200604123033.25499-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-04_10:2020-06-02,
 2020-06-04 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 09/11] gpio: stmfx: add ops get_dir_flags
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

Add support of ops get_dir_flags() to read dir flags from
STMFX registers.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2: None

 drivers/pinctrl/pinctrl-stmfx.c | 50 +++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index 88df9e61a7..1d326ecf17 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -108,12 +108,22 @@ static int stmfx_conf_set_pupd(struct udevice *dev, unsigned int offset,
 	return stmfx_write_reg(dev, STMFX_REG_GPIO_PUPD, offset, pupd);
 }
 
+static int stmfx_conf_get_pupd(struct udevice *dev, unsigned int offset)
+{
+	return stmfx_read_reg(dev, STMFX_REG_GPIO_PUPD, offset);
+}
+
 static int stmfx_conf_set_type(struct udevice *dev, unsigned int offset,
 			       uint type)
 {
 	return stmfx_write_reg(dev, STMFX_REG_GPIO_TYPE, offset, type);
 }
 
+static int stmfx_conf_get_type(struct udevice *dev, unsigned int offset)
+{
+	return stmfx_read_reg(dev, STMFX_REG_GPIO_TYPE, offset);
+}
+
 static int stmfx_gpio_get(struct udevice *dev, unsigned int offset)
 {
 	return stmfx_read_reg(dev, STMFX_REG_GPIO_STATE, offset);
@@ -189,6 +199,45 @@ static int stmfx_gpio_set_dir_flags(struct udevice *dev, unsigned int offset,
 	return ret;
 }
 
+static int stmfx_gpio_get_dir_flags(struct udevice *dev, unsigned int offset,
+				    ulong *flags)
+{
+	ulong dir_flags = 0;
+	int ret;
+
+	if (stmfx_gpio_get_function(dev, offset) == GPIOF_OUTPUT) {
+		dir_flags |= GPIOD_IS_OUT;
+		ret = stmfx_conf_get_type(dev, offset);
+		if (ret < 0)
+			return ret;
+		if (ret == 0)
+			dir_flags |= GPIOD_OPEN_DRAIN;
+			/* 1 = push-pull (default), open source not supported */
+		ret = stmfx_gpio_get(dev, offset);
+		if (ret < 0)
+			return ret;
+		if (ret)
+			dir_flags |= GPIOD_IS_OUT_ACTIVE;
+	} else {
+		dir_flags |= GPIOD_IS_IN;
+		ret = stmfx_conf_get_type(dev, offset);
+		if (ret < 0)
+			return ret;
+		if (ret == 1) {
+			ret = stmfx_conf_get_pupd(dev, offset);
+			if (ret < 0)
+				return ret;
+			if (ret == 1)
+				dir_flags |= GPIOD_PULL_UP;
+			else
+				dir_flags |= GPIOD_PULL_DOWN;
+		}
+	}
+	*flags = dir_flags;
+
+	return 0;
+}
+
 static int stmfx_gpio_probe(struct udevice *dev)
 {
 	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
@@ -218,6 +267,7 @@ static const struct dm_gpio_ops stmfx_gpio_ops = {
 	.direction_input = stmfx_gpio_direction_input,
 	.direction_output = stmfx_gpio_direction_output,
 	.set_dir_flags = stmfx_gpio_set_dir_flags,
+	.get_dir_flags = stmfx_gpio_get_dir_flags,
 };
 
 U_BOOT_DRIVER(stmfx_gpio) = {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
