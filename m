Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB39138F3D
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 11:35:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24FB9C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 10:35:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 377B9C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 10:35:34 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DASZ1w005620; Mon, 13 Jan 2020 11:35:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=hUfzQ63jxGr3OgeZenndvI16luim5IFA7UsyAGBkjgQ=;
 b=0oFDaQbrXD1UTxLsLbTzzvWSXYgyu60WCc+qSDyfySHNET4kOEn9eDg6WUbWwUWUxIqG
 711Rgf2LWGHfXd0LqFfB+JaFiyAOXpEcALOz0zjpfS0SnxjNTGmUGh9UYZgTtzg2hyPY
 RsMqcYUwyrIVwFzZMXLbLJmDEVYDIjPD9zIGio7oX5dKHS1VsPxP4hpnQvfifQZ4EqWK
 vOdGQuGYsCmta/AzLpHwuMhJxt29U/yj6vXNPDjLs0vaeJnkicted4bLfE3FEJrDcJe/
 AP9AgjqV7rwLtWncG9dTxkc9nV0h04uI7QEpnf481Vl9dys8pdukyllOqNoT4Pz+kUA1 yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf77aqqk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 11:35:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8143110003B;
 Mon, 13 Jan 2020 11:35:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7771F2A96E8;
 Mon, 13 Jan 2020 11:35:28 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 13 Jan 2020 11:35:27 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 13 Jan 2020 11:35:09 +0100
Message-ID: <20200113103515.20879-16-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113103515.20879-1-patrick.delaunay@st.com>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_02:2020-01-13,
 2020-01-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Heiko Schocher <hs@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 15/21] gpio: add ops to set dir flags
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

Add the ops for GPIO driver set_dir_flags() to set the dir flags.
The user can update the direction and configuration
of each GPIO with a only call to dm_gpio_set_dir_flags() or
dm_gpio_set_dir() and respecting the configuration provided by
device tree (saved in desc->flags).

When these optional ops are absent, the gpio uclass use the mandatory
ops (direction_output, direction_input, get_value) and desc->flags
to manage only the main dir flags:
- GPIOD_IS_IN
- GPIOD_IS_OUT
- GPIOD_IS_OUT_ACTIVE
- GPIOD_ACTIVE_LOW

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

This patch was part of v2 08/14
= gpio: add ops for configuration with dir flags


Changes in v3:
- Split the previous patch [PATCH v2 08/14] to help review

Changes in v2:
- change the proposed ops for pin config to set_dir_flags/get_dir_flags
- reused the existing API dm_gpio_set_dir_flags/dm_gpio_set_dir
- add a new API dm_gpio_get_dir_flags

 drivers/gpio/gpio-uclass.c | 17 ++++++++++++-----
 include/asm-generic/gpio.h | 16 ++++++++++++++++
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
index 89af37a4ea..5da28e6ed9 100644
--- a/drivers/gpio/gpio-uclass.c
+++ b/drivers/gpio/gpio-uclass.c
@@ -571,11 +571,16 @@ static int _dm_gpio_set_dir_flags(struct gpio_desc *desc, ulong flags)
 		return ret;
 	}
 
-	if (flags & GPIOD_IS_OUT) {
-		ret = ops->direction_output(dev, desc->offset,
-					    GPIOD_FLAGS_OUTPUT(flags));
-	} else if (flags & GPIOD_IS_IN) {
-		ret = ops->direction_input(dev, desc->offset);
+	/* GPIOD_ are directly managed by driver in set_dir_flags*/
+	if (ops->set_dir_flags) {
+		ret = ops->set_dir_flags(dev, desc->offset, flags);
+	} else {
+		if (flags & GPIOD_IS_OUT) {
+			ret = ops->direction_output(dev, desc->offset,
+						    GPIOD_FLAGS_OUTPUT(flags));
+		} else if (flags & GPIOD_IS_IN) {
+			ret = ops->direction_input(dev, desc->offset);
+		}
 	}
 
 	return ret;
@@ -1145,6 +1150,8 @@ static int gpio_post_bind(struct udevice *dev)
 			ops->get_function += gd->reloc_off;
 		if (ops->xlate)
 			ops->xlate += gd->reloc_off;
+		if (ops->set_dir_flags)
+			ops->set_dir_flags += gd->reloc_off;
 		if (ops->get_dir_flags)
 			ops->get_dir_flags += gd->reloc_off;
 
diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
index ac30c3ee4e..ec4877037a 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -298,6 +298,22 @@ struct dm_gpio_ops {
 	int (*xlate)(struct udevice *dev, struct gpio_desc *desc,
 		     struct ofnode_phandle_args *args);
 
+	/**
+	 * set_dir_flags() - Set GPIO dir flags
+	 *
+	 * This function should set up the GPIO configuration according to the
+	 * information provide by the direction flags bitfield.
+	 *
+	 * This method is optional.
+	 *
+	 * @dev:	GPIO device
+	 * @offset:	GPIO offset within that device
+	 * @flags:	GPIO configuration to use
+	 * @return 0 if OK, -ve on error
+	 */
+	int (*set_dir_flags)(struct udevice *dev, unsigned int offset,
+			     ulong flags);
+
 	/**
 	 * get_dir_flags() - Get GPIO dir flags
 	 *
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
