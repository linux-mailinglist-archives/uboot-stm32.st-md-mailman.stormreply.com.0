Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C92E1D24
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 15:45:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61D77C36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 13:45:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E95B8C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 13:45:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9NDhG0t023207; Wed, 23 Oct 2019 15:45:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=qtA8p08vZctgSfSoOlJIs/PVI+uJWjuslp3t0JEuLx8=;
 b=DtR5QQeHY5D/HWpUowspKEKLbzEghTn/qBhZbUrIrwko0P0uNkPrM8LcbKTP7kajbP77
 MpgDw3/FP1zyJ3AtSaDCJD14oSjNu9i5q/sCRU7WepIwT4f+SBRtoi1/4Lv0nrIrdv1o
 UTF52102MdNveCl/8XQsSS9PUDkK9VikV1dOhJ4PAAR0vcP4fKCuLdIl2CdP3AM3cXzR
 9CnRQI4cxVJag/hv2T7ifvJJl8fbmptc5F5crJ4JnWH65tUETwvNpzFoUmKLE5ICbbcp
 b0UrcNp0mQctPBPiva23kjepMeKM4ig8uL2UgJz+hFsAOdG5jMhw1+EvQaZsj4fhIdXl WQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vt9s73xmg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 15:45:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CC61210003B;
 Wed, 23 Oct 2019 15:45:02 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BFE952FF5FE;
 Wed, 23 Oct 2019 15:45:02 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct
 2019 15:45:02 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct 2019 15:45:02
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 23 Oct 2019 15:44:41 +0200
Message-ID: <20191023134448.20149-7-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023134448.20149-1-patrick.delaunay@st.com>
References: <20191023134448.20149-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_03:2019-10-23,2019-10-23 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Bin Meng <bmeng.cn@gmail.com>,
 Heiko Schocher <hs@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 06/13] gpio: add support for new flags on gpio
	configuration
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

This commit manages the flags that can be used in GPIO specifiers to
indicate if a pull-up resistor or pull-down resistor should be
enabled for output GPIO and the Open Drain/Open Source configuration
for input GPIO.

It is managed in driver with a new ops in gpio uclass set_config.

These flags are already support in Linux kernel in gpiolib.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/gpio/gpio-uclass.c | 62 +++++++++++++++++++++++++++++++++++++-
 include/asm-generic/gpio.h | 56 ++++++++++++++++++++++++++++++++++
 2 files changed, 117 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
index 90fbed455b..c6c6e8b343 100644
--- a/drivers/gpio/gpio-uclass.c
+++ b/drivers/gpio/gpio-uclass.c
@@ -128,7 +128,19 @@ int gpio_xlate_offs_flags(struct udevice *dev, struct gpio_desc *desc,
 		return 0;
 
 	if (args->args[1] & GPIO_ACTIVE_LOW)
-		desc->flags = GPIOD_ACTIVE_LOW;
+		desc->flags |= GPIOD_ACTIVE_LOW;
+
+	if ((args->args[1] & GPIO_OPEN_DRAIN) == GPIO_OPEN_DRAIN)
+		desc->flags |= GPIOD_OPEN_DRAIN;
+
+	if ((args->args[1] & GPIO_OPEN_SOURCE) == GPIO_OPEN_SOURCE)
+		desc->flags |= GPIOD_OPEN_SOURCE;
+
+	if (args->args[1] & GPIO_PULL_UP)
+		desc->flags |= GPIOD_PULL_UP;
+
+	if (args->args[1] & GPIO_PULL_DOWN)
+		desc->flags |= GPIOD_PULL_DOWN;
 
 	return 0;
 }
@@ -517,12 +529,31 @@ int dm_gpio_set_open_drain(struct gpio_desc *desc, int value)
 
 	if (ops->set_open_drain)
 		ret = ops->set_open_drain(desc->dev, desc->offset, value);
+	else if (ops->set_config)
+		ret = ops->set_config(desc->dev, desc->offset,
+				      value ? GPIO_CONF_DRIVE_OPEN_DRAIN :
+					      GPIO_CONF_DRIVE_PULL_PUSH);
 	else
 		return 0; /* feature not supported -> ignore setting */
 
 	return ret;
 }
 
+int gpio_get_config(const struct gpio_desc *desc)
+{
+	struct dm_gpio_ops *ops = gpio_get_ops(desc->dev);
+	int ret;
+
+	ret = check_reserved(desc, "get_config");
+	if (ret)
+		return ret;
+
+	if (ops->set_config)
+		return ops->get_config(desc->dev, desc->offset);
+	else
+		return -ENOSYS;
+}
+
 int dm_gpio_set_dir_flags(struct gpio_desc *desc, ulong flags)
 {
 	struct udevice *dev = desc->dev;
@@ -533,14 +564,39 @@ int dm_gpio_set_dir_flags(struct gpio_desc *desc, ulong flags)
 	if (ret)
 		return ret;
 
+	/* both pull-up and pull-down enabled, invalid configuration */
+	if ((flags & GPIOD_PULL_UP) && (flags & GPIOD_PULL_DOWN))
+		return -EINVAL;
+
 	if (flags & GPIOD_IS_OUT) {
 		int value = flags & GPIOD_IS_OUT_ACTIVE ? 1 : 0;
 
+		if (ops->set_config) {
+			if (flags & GPIOD_OPEN_DRAIN)
+				ops->set_config(dev, desc->offset,
+						GPIO_CONF_DRIVE_OPEN_DRAIN);
+			else if (flags & GPIOD_OPEN_SOURCE)
+				ops->set_config(dev, desc->offset,
+						GPIO_CONF_DRIVE_OPEN_SOURCE);
+			else
+				ops->set_config(dev, desc->offset,
+						GPIO_CONF_DRIVE_PULL_PUSH);
+		}
+
 		if (flags & GPIOD_ACTIVE_LOW)
 			value = !value;
 		ret = ops->direction_output(dev, desc->offset, value);
 	} else  if (flags & GPIOD_IS_IN) {
 		ret = ops->direction_input(dev, desc->offset);
+
+		if (ops->set_config) {
+			if (flags & GPIOD_PULL_UP)
+				ops->set_config(dev, desc->offset,
+						GPIO_CONF_BIAS_PULL_UP);
+			else if (flags & GPIOD_PULL_DOWN)
+				ops->set_config(dev, desc->offset,
+						GPIO_CONF_BIAS_PULL_DOWN);
+		}
 	}
 	if (ret)
 		return ret;
@@ -1061,6 +1117,10 @@ static int gpio_post_bind(struct udevice *dev)
 			ops->get_function += gd->reloc_off;
 		if (ops->xlate)
 			ops->xlate += gd->reloc_off;
+		if (ops->set_config)
+			ops->set_config += gd->reloc_off;
+		if (ops->get_config)
+			ops->get_config += gd->reloc_off;
 
 		reloc_done++;
 	}
diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
index d6cf18744f..9441e7dccc 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -112,6 +112,17 @@ enum gpio_func_t {
 	GPIOF_COUNT,
 };
 
+enum gpio_config {
+	GPIO_CONF_NONE,
+	GPIO_CONF_DRIVE_OPEN_DRAIN,
+	GPIO_CONF_DRIVE_OPEN_SOURCE,
+	GPIO_CONF_DRIVE_PULL_PUSH,
+	GPIO_CONF_BIAS_PULL_DOWN,
+	GPIO_CONF_BIAS_PULL_UP,
+
+	GPIO_CONF_COUNT,
+};
+
 struct udevice;
 
 struct gpio_desc {
@@ -122,6 +133,10 @@ struct gpio_desc {
 #define GPIOD_IS_IN		(1 << 2)	/* GPIO is an input */
 #define GPIOD_ACTIVE_LOW	(1 << 3)	/* value has active low */
 #define GPIOD_IS_OUT_ACTIVE	(1 << 4)	/* set output active */
+#define GPIOD_OPEN_DRAIN	(1 << 5)	/* GPIO is open drain type */
+#define GPIOD_OPEN_SOURCE	(1 << 6)	/* GPIO is open source type */
+#define GPIOD_PULL_UP		(1 << 7)	/* GPIO has pull up enabled */
+#define GPIOD_PULL_DOWN		(1 << 8)	/* GPIO has pull down enabled */
 
 	uint offset;		/* GPIO offset within the device */
 	/*
@@ -290,6 +305,36 @@ struct dm_gpio_ops {
 	 */
 	int (*xlate)(struct udevice *dev, struct gpio_desc *desc,
 		     struct ofnode_phandle_args *args);
+
+	/**
+	 * set_config() - Set GPIO configuration
+	 *
+	 * This function should set up the GPIO configuration according to the
+	 * information in the arguments.
+	 *
+	 * This method is optional.
+	 *
+	 * @dev:	GPIO device
+	 * @offset:	GPIO offset within that device
+	 * @config:	GPIO configuration
+	 * @return 0 if OK, -ve on error
+	 */
+	int (*set_config)(struct udevice *dev, unsigned offset,
+			  enum gpio_config config);
+
+	/**
+	 * set_config() - Set GPIO configuration
+	 *
+	 * This function return the GPIO configuration according to the
+	 * information in the arguments.
+	 *
+	 * This method is optional.
+	 *
+	 * @dev:	GPIO device
+	 * @offset:	GPIO offset within that device
+	 * @return GPIO configuration (GPIO_CONF_) if OK, -ve on error
+	 */
+	int (*get_config)(struct udevice *dev, unsigned offset);
 };
 
 /**
@@ -657,4 +702,15 @@ int dm_gpio_set_dir_flags(struct gpio_desc *desc, ulong flags);
  */
 int gpio_get_number(const struct gpio_desc *desc);
 
+/**
+ * gpio_get_config() - get the current GPIO pin configuration
+ *
+ * Obtain the current GPIO pin configuration
+ *
+ * @desc:	GPIO description containing device, offset and flags,
+ *		previously returned by gpio_request_by_name()
+ * @return GPIO configuration (GPIO_CONF_) if OK, -ve on error
+ */
+int gpio_get_config(const struct gpio_desc *desc);
+
 #endif	/* _ASM_GENERIC_GPIO_H_ */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
