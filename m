Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEB6138F3B
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 11:35:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E291C36B09
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 10:35:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1628C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 10:35:32 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DASPE4006813; Mon, 13 Jan 2020 11:35:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=uYd0KFyRsSCVoQLVgH9IZnde27Zk19nEWADK+tVbb3U=;
 b=ouxSPfrZ2GrCdfNES+SloeoHYXg+y9hC7hlJhk4xVT6WET5Rh5vRutPaVSUOqMipDoy0
 Elt6SFt1WLkYKFxxVgdu2ZD+S0CQBJQDbmOoJZVzA22wIjjrOGpAVxyIhCRwVbvhIc0h
 YRaKEOw880nasORywXONqstpjFyWFUG9d3fNbpGVS2TtJn6QAw0VEnbONSv0wlw6LAdK
 ao93xM5sbcb4jo0yKN1Fexl/L6P6mV5+Uwr4lc1IYIlmKy0SJQp11NL/dpwrlxQd8E58
 LB+JS8dayTXZPZK3x28bwYA1oE9pGSZar4vTfTgzc0zdQYefDYHh3vOWvkxnnrmESCPo wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf7jp7hvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 11:35:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4BBFF100034;
 Mon, 13 Jan 2020 11:35:26 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 40AFB2A96E8;
 Mon, 13 Jan 2020 11:35:26 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 13 Jan 2020 11:35:25 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 13 Jan 2020 11:35:06 +0100
Message-ID: <20200113103515.20879-13-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113103515.20879-1-patrick.delaunay@st.com>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_02:2020-01-13,
 2020-01-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Heiko Schocher <hs@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 12/21] gpio: update dir_flags management
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

Update the flag management in GPIO uclass: the desc->flags is always
combined with the requested flags and the GPIO descriptor is updated
for further call.

Add a function dm_gpio_get_dir_flags to get dynamically
the current dir_flags (configuration and value).

This patch prepare introduction of the dir flags support with new ops.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

This patch was part of v2 08/14
= gpio: add ops for configuration with dir flags


Changes in v3:
- Split the previous patch [PATCH v2 08/14] to help review

Changes in v2: None

 drivers/gpio/gpio-uclass.c | 27 +++++++++++++++++++++++++--
 include/asm-generic/gpio.h | 22 ++++++++++++++++------
 2 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
index 1d16d4acf9..85f0b03f81 100644
--- a/drivers/gpio/gpio-uclass.c
+++ b/drivers/gpio/gpio-uclass.c
@@ -140,8 +140,9 @@ int gpio_xlate_offs_flags(struct udevice *dev, struct gpio_desc *desc,
 	if (args->args_count < 2)
 		return 0;
 
+	desc->flags = 0;
 	if (args->args[1] & GPIO_ACTIVE_LOW)
-		desc->flags = GPIOD_ACTIVE_LOW;
+		desc->flags |= GPIOD_ACTIVE_LOW;
 
 	return 0;
 }
@@ -558,6 +559,8 @@ int dm_gpio_set_dir_flags(struct gpio_desc *desc, ulong flags)
 	if (ret)
 		return ret;
 
+	/* combine the requested flags (for IN/OUT) and the descriptor flags */
+	flags |= desc->flags;
 	ret = _dm_gpio_set_dir_flags(desc, flags);
 
 	/* update the descriptor flags */
@@ -578,6 +581,26 @@ int dm_gpio_set_dir(struct gpio_desc *desc)
 	return _dm_gpio_set_dir_flags(desc, desc->flags);
 }
 
+int dm_gpio_get_dir_flags(struct gpio_desc *desc, ulong *flags)
+{
+	int ret;
+	ulong dir_flags;
+
+	ret = check_reserved(desc, "get_dir_flags");
+	if (ret)
+		return ret;
+
+	dir_flags = desc->flags;
+	/* only GPIOD_IS_OUT_ACTIVE is provided by uclass */
+	dir_flags &= ~GPIOD_IS_OUT_ACTIVE;
+	if ((desc->flags & GPIOD_IS_OUT) && _gpio_get_value(desc))
+		dir_flags |= GPIOD_IS_OUT_ACTIVE;
+
+	*flags = dir_flags;
+
+	return 0;
+}
+
 /**
  * gpio_get_value() - [COMPAT] Sample GPIO pin and return it's value
  * gpio:	GPIO number
@@ -848,7 +871,7 @@ static int gpio_request_tail(int ret, const char *nodename,
 		debug("%s: dm_gpio_requestf failed\n", __func__);
 		goto err;
 	}
-	ret = dm_gpio_set_dir_flags(desc, flags | desc->flags);
+	ret = dm_gpio_set_dir_flags(desc, flags);
 	if (ret) {
 		debug("%s: dm_gpio_set_dir failed\n", __func__);
 		goto err;
diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
index 111319f41f..3dd0002b0b 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -592,8 +592,7 @@ int dm_gpio_set_value(const struct gpio_desc *desc, int value);
 /**
  * dm_gpio_set_dir() - Set the direction for a GPIO
  *
- * This sets up the direction according tot the provided flags. It will do
- * nothing unless the direction is actually specified.
+ * This sets up the direction according to the GPIO flags: desc->flags.
  *
  * @desc:	GPIO description containing device, offset and flags,
  *		previously returned by gpio_request_by_name()
@@ -602,11 +601,10 @@ int dm_gpio_set_value(const struct gpio_desc *desc, int value);
 int dm_gpio_set_dir(struct gpio_desc *desc);
 
 /**
- * dm_gpio_set_dir_flags() - Set direction using specific flags
+ * dm_gpio_set_dir_flags() - Set direction using description and added flags
  *
- * This is like dm_gpio_set_dir() except that the flags value is provided
- * instead of being used from desc->flags. This is needed because in many
- * cases the GPIO description does not include direction information.
+ * This sets up the direction according to the provided flags and the GPIO
+ * description (desc->flags) which include direction information.
  * Note that desc->flags is updated by this function.
  *
  * @desc:	GPIO description containing device, offset and flags,
@@ -616,6 +614,18 @@ int dm_gpio_set_dir(struct gpio_desc *desc);
  */
 int dm_gpio_set_dir_flags(struct gpio_desc *desc, ulong flags);
 
+/**
+ * dm_gpio_get_dir_flags() - Get direction flags
+ *
+ * read the current direction flags
+ *
+ * @desc:	GPIO description containing device, offset and flags,
+ *		previously returned by gpio_request_by_name()
+ * @flags:	place to put the used flags
+ * @return 0 if OK, -ve on error, in which case desc->flags is not updated
+ */
+int dm_gpio_get_dir_flags(struct gpio_desc *desc, ulong *flags);
+
 /**
  * gpio_get_number() - Get the global GPIO number of a GPIO
  *
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
