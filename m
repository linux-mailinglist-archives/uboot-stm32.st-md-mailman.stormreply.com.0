Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5421EE46D
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Jun 2020 14:30:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C1CFC36B0D
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Jun 2020 12:30:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94D58C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jun 2020 12:30:42 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 054CESx6017012; Thu, 4 Jun 2020 14:30:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=4cl2SIHhi6piHYrwIJfrP/OkSDMEkpZeKA4IQWHeylE=;
 b=EOii/DkjM9Pr+Z0/bZj7b7utn/AaeTX7xK8sL5Bcl5jlDtEQeJamesfr7N847brM0QLI
 bUXxQNIDph2XIz+gTVknrLAhwTTzuw0Tem//NbRNyjqw2sNS3oA/5gK9HGJhZs+/fq/P
 xtB+RnW/jGpHGAFzGm4F2fdeaARcwtIS7ewpY4FXMv6dbxvd2WWsZoEyz5LwbZUen48E
 aOjtGKsL5gnCjNoAWlj08y2cSR5aZq/EI0aAmqkEy3oLLkEwIiq8fgZFpH//FE5XghIK
 kJHG9MAq++lQIgHOU3qGaIexlDqDyRiqbQ8ZMpmZwsyjwdJc4UBQAlPQwm37FbNE3M06 Xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31bcy0t864-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jun 2020 14:30:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3F6B510002A;
 Thu,  4 Jun 2020 14:30:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 35D982BE22C;
 Thu,  4 Jun 2020 14:30:41 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 4 Jun 2020 14:30:40 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 4 Jun 2020 14:30:30 +0200
Message-ID: <20200604123033.25499-6-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200604123033.25499-1-patrick.delaunay@st.com>
References: <20200604123033.25499-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-04_10:2020-06-02,
 2020-06-04 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 08/11] gpio: stmfx: add ops set_dir_flag
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

Changes in v2: None

 drivers/pinctrl/pinctrl-stmfx.c | 37 +++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index 5d15424b84..88df9e61a7 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -153,6 +153,42 @@ static int stmfx_gpio_direction_output(struct udevice *dev,
 	return stmfx_write_reg(dev, STMFX_REG_GPIO_DIR, offset, 1);
 }
 
+static int stmfx_gpio_set_dir_flags(struct udevice *dev, unsigned int offset,
+				    ulong flags)
+{
+	int ret = -ENOTSUPP;
+
+	if (flags & GPIOD_IS_OUT) {
+		if (flags & GPIOD_OPEN_SOURCE)
+			return -ENOTSUPP;
+		if (flags & GPIOD_OPEN_DRAIN)
+			ret = stmfx_conf_set_type(dev, offset, 0);
+		else /* PUSH-PULL */
+			ret = stmfx_conf_set_type(dev, offset, 1);
+		if (ret)
+			return ret;
+		ret = stmfx_gpio_direction_output(dev, offset,
+						  GPIOD_FLAGS_OUTPUT(flags));
+	} else if (flags & GPIOD_IS_IN) {
+		ret = stmfx_gpio_direction_input(dev, offset);
+		if (ret)
+			return ret;
+		if (flags & GPIOD_PULL_UP) {
+			ret = stmfx_conf_set_type(dev, offset, 1);
+			if (ret)
+				return ret;
+			ret = stmfx_conf_set_pupd(dev, offset, 1);
+		} else if (flags & GPIOD_PULL_DOWN) {
+			ret = stmfx_conf_set_type(dev, offset, 1);
+			if (ret)
+				return ret;
+			ret = stmfx_conf_set_pupd(dev, offset, 0);
+		}
+	}
+
+	return ret;
+}
+
 static int stmfx_gpio_probe(struct udevice *dev)
 {
 	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
@@ -181,6 +217,7 @@ static const struct dm_gpio_ops stmfx_gpio_ops = {
 	.get_function = stmfx_gpio_get_function,
 	.direction_input = stmfx_gpio_direction_input,
 	.direction_output = stmfx_gpio_direction_output,
+	.set_dir_flags = stmfx_gpio_set_dir_flags,
 };
 
 U_BOOT_DRIVER(stmfx_gpio) = {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
