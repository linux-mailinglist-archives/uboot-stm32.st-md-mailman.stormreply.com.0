Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D638E109A79
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 09:49:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96653C36B12
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 08:49:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9B24C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2019 08:49:21 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAQ8lHVi030849; Tue, 26 Nov 2019 09:49:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=KDilOE1jsChi543oAH66Lf1EdO+VpDurVfZvGL9rFbI=;
 b=HbQAIknmuSrEZxPBwPfwQrdJpz1FD7hGy4h/WlTo22WEEq9vmKEA/2tmpg/DXGS1TfWW
 SnXE+7egg8ey0FDIAekbOt/tEwPR4bgEJgx25cO4IfK/h288y2vW7oO/5d06/m/whB3A
 DMObxgsMT7QeVvqdt42h2NOkuLwKYeqivC3NdiOyCm0fEPEDNy/QnwStJhQh9TegbYc5
 iv+4X0Ng8q/5ZNZocvCDbo3vJGBtACBG8pT0OjWDdlXnoOpkDJLCWiAEtXfvmhdsKrPX
 XhoGpx5fVz/n7Ybuw+t2monYrzX9iNfmlJ2IwsH5fiq8zhNzU1dUsu1N99bexWLzLPFI Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wets9p7v5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 09:49:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CFCAE100034;
 Tue, 26 Nov 2019 09:49:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C47AE2ACE57;
 Tue, 26 Nov 2019 09:49:19 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 26 Nov 2019 09:49:19 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 26 Nov 2019 09:49:05 +0100
Message-ID: <20191126084911.19761-9-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191126084911.19761-1-patrick.delaunay@st.com>
References: <20191126084911.19761-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_01:2019-11-21,2019-11-26 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Bin Meng <bmeng.cn@gmail.com>,
 Heiko Schocher <hs@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 08/14] gpio: add ops for configuration with
	dir flags
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

This commit manages the dir flags that can be used in gpio specifiers
to indicate if a pull-up resistor or pull-down resistor should be
enabled for output gpio (GPIO_PULL_UP, GPIO_PULL_DOWN) and the
Open Drain/Open Source configuration for input gpio
(GPIO_OPEN_DRAIN, GPIO_OPEN_SOURCE).

These flags are already supported in Linux kernel in gpiolib;
this patch provides the same support in U-Boot.

The dir flags are managed in gpio drivers with two optional ops in gpio
uclass: set_dir_flags and get_dir_flags.

- ops set_dir_flags() set the direction and configuration of each GPIO
  with a only call to dm_gpio_set_dir_flags() / dm_gpio_set_dir()
  and respecting the configuration provided by device tree
  (saved in desc->flags).

- ops get_dir_flags() return dynamically the current gpio configuration,
  it is used by the new API dm_gpio_get_dir_flags().

When these optional ops are absent, the gpio uclass use the mandatory ops
(direction_output, direction_input, get_value) and desc->flags to manage
only the main dir flags:
- GPIOD_IS_IN
- GPIOD_IS_OUT
- GPIOD_IS_OUT_ACTIVE
- GPIOD_ACTIVE_LOW

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- change the proposed ops for pin config to set_dir_flags/get_dir_flags
- reused the existing API dm_gpio_set_dir_flags/dm_gpio_set_dir
- add a new API dm_gpio_get_dir_flags

 drivers/gpio/gpio-uclass.c | 157 +++++++++++++++++++++++++++++++------
 include/asm-generic/gpio.h |  65 +++++++++++++--
 2 files changed, 192 insertions(+), 30 deletions(-)

diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
index 0870458e96..241293f4b4 100644
--- a/drivers/gpio/gpio-uclass.c
+++ b/drivers/gpio/gpio-uclass.c
@@ -140,8 +140,27 @@ int gpio_xlate_offs_flags(struct udevice *dev, struct gpio_desc *desc,
 	if (args->args_count < 2)
 		return 0;
 
+	desc->flags = 0;
 	if (args->args[1] & GPIO_ACTIVE_LOW)
-		desc->flags = GPIOD_ACTIVE_LOW;
+		desc->flags |= GPIOD_ACTIVE_LOW;
+
+	/*
+	 * need to test 2 bits for gpio output binding:
+	 * OPEN_DRAIN (0x6) = SINGLE_ENDED (0x2) | LINE_OPEN_DRAIN (0x4)
+	 * OPEN_SOURCE (0x2) = SINGLE_ENDED (0x2) | LINE_OPEN_SOURCE (0x0)
+	 */
+	if (args->args[1] & GPIO_SINGLE_ENDED) {
+		if (args->args[1] & GPIO_LINE_OPEN_DRAIN)
+			desc->flags |= GPIOD_OPEN_DRAIN;
+		else
+			desc->flags |= GPIOD_OPEN_SOURCE;
+	}
+
+	if (args->args[1] & GPIO_PULL_UP)
+		desc->flags |= GPIOD_PULL_UP;
+
+	if (args->args[1] & GPIO_PULL_DOWN)
+		desc->flags |= GPIOD_PULL_DOWN;
 
 	return 0;
 }
@@ -476,18 +495,24 @@ int gpio_direction_output(unsigned gpio, int value)
 							desc.offset, value);
 }
 
-int dm_gpio_get_value(const struct gpio_desc *desc)
+static int _gpio_get_value(const struct gpio_desc *desc)
 {
 	int value;
+
+	value = gpio_get_ops(desc->dev)->get_value(desc->dev, desc->offset);
+
+	return desc->flags & GPIOD_ACTIVE_LOW ? !value : value;
+}
+
+int dm_gpio_get_value(const struct gpio_desc *desc)
+{
 	int ret;
 
 	ret = check_reserved(desc, "get_value");
 	if (ret)
 		return ret;
 
-	value = gpio_get_ops(desc->dev)->get_value(desc->dev, desc->offset);
-
-	return desc->flags & GPIOD_ACTIVE_LOW ? !value : value;
+	return _gpio_get_value(desc);
 }
 
 int dm_gpio_set_value(const struct gpio_desc *desc, int value)
@@ -504,39 +529,119 @@ int dm_gpio_set_value(const struct gpio_desc *desc, int value)
 	return 0;
 }
 
-int dm_gpio_set_dir_flags(struct gpio_desc *desc, ulong flags)
+/* check dir flags invalid configuration */
+static int check_dir_flags(ulong flags)
+{
+	if ((flags & GPIOD_IS_OUT) && (flags & GPIOD_IS_IN))
+		return -EINVAL;
+
+	if ((flags & GPIOD_PULL_UP) && (flags & GPIOD_PULL_DOWN))
+		return -EINVAL;
+
+	if ((flags & GPIOD_OPEN_DRAIN) && (flags & GPIOD_OPEN_SOURCE))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int _dm_gpio_set_dir_flags(struct gpio_desc *desc, ulong flags)
 {
 	struct udevice *dev = desc->dev;
 	struct dm_gpio_ops *ops = gpio_get_ops(dev);
+	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
 	int ret;
 
-	ret = check_reserved(desc, "set_dir");
-	if (ret)
-		return ret;
+	ret = check_dir_flags(flags);
+	if (ret) {
+		dev_err(dev,
+			"%s error: set_dir_flags for gpio %s%d has invalid dir flags 0x%lx\n",
+			desc->dev->name,
+			uc_priv->bank_name ? uc_priv->bank_name : "",
+			desc->offset, flags);
 
-	if (flags & GPIOD_IS_OUT) {
-		int value = flags & GPIOD_IS_OUT_ACTIVE ? 1 : 0;
+		return ret;
+	}
 
-		if (flags & GPIOD_ACTIVE_LOW)
-			value = !value;
-		ret = ops->direction_output(dev, desc->offset, value);
-	} else  if (flags & GPIOD_IS_IN) {
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
+
+	return ret;
+}
+
+int dm_gpio_set_dir_flags(struct gpio_desc *desc, ulong flags)
+{
+	int ret;
+
+	ret = check_reserved(desc, "set_dir_flags");
 	if (ret)
 		return ret;
-	/*
-	 * Update desc->flags here, so that GPIO_ACTIVE_LOW is honoured in
-	 * futures
-	 */
-	desc->flags = flags;
 
-	return 0;
+	/* combine the requested flags (for IN/OUT) and the descriptor flags */
+	flags |= desc->flags;
+	ret = _dm_gpio_set_dir_flags(desc, flags);
+
+	/* update the descriptor flags */
+	if (ret)
+		desc->flags = flags;
+
+	return ret;
 }
 
 int dm_gpio_set_dir(struct gpio_desc *desc)
 {
-	return dm_gpio_set_dir_flags(desc, desc->flags);
+	int ret;
+
+	ret = check_reserved(desc, "set_dir");
+	if (ret)
+		return ret;
+
+	return _dm_gpio_set_dir_flags(desc, desc->flags);
+}
+
+int dm_gpio_get_dir_flags(struct gpio_desc *desc, ulong *flags)
+{
+	struct udevice *dev = desc->dev;
+	struct dm_gpio_ops *ops = gpio_get_ops(dev);
+	int ret, value;
+	ulong dir_flags;
+
+	ret = check_reserved(desc, "get_dir_flags");
+	if (ret)
+		return ret;
+
+	/* GPIOD_ are directly provided by driver except GPIOD_ACTIVE_LOW*/
+	if (ops->get_dir_flags) {
+		ret = ops->get_dir_flags(dev, desc->offset, &dir_flags);
+		if (ret)
+			return ret;
+
+		/* GPIOD_ACTIVE_LOW is saved in desc->flags */
+		value = dir_flags & GPIOD_IS_OUT_ACTIVE ? 1 : 0;
+		if (desc->flags & GPIOD_ACTIVE_LOW)
+			value = !value;
+		dir_flags &= ~(GPIOD_ACTIVE_LOW | GPIOD_IS_OUT_ACTIVE);
+		dir_flags |= (desc->flags & GPIOD_ACTIVE_LOW);
+		if (value)
+			dir_flags |= GPIOD_IS_OUT_ACTIVE;
+	} else {
+		dir_flags = desc->flags;
+		/* only GPIOD_IS_OUT_ACTIVE is provided by uclass */
+		dir_flags &= ~GPIOD_IS_OUT_ACTIVE;
+		if ((desc->flags & GPIOD_IS_OUT) && _gpio_get_value(desc))
+			dir_flags |= GPIOD_IS_OUT_ACTIVE;
+	}
+	*flags = dir_flags;
+
+	return 0;
 }
 
 /**
@@ -809,7 +914,7 @@ static int gpio_request_tail(int ret, const char *nodename,
 		debug("%s: dm_gpio_requestf failed\n", __func__);
 		goto err;
 	}
-	ret = dm_gpio_set_dir_flags(desc, flags | desc->flags);
+	ret = dm_gpio_set_dir_flags(desc, flags);
 	if (ret) {
 		debug("%s: dm_gpio_set_dir failed\n", __func__);
 		goto err;
@@ -1036,6 +1141,10 @@ static int gpio_post_bind(struct udevice *dev)
 			ops->get_function += gd->reloc_off;
 		if (ops->xlate)
 			ops->xlate += gd->reloc_off;
+		if (ops->set_dir_flags)
+			ops->set_dir_flags += gd->reloc_off;
+		if (ops->get_dir_flags)
+			ops->get_dir_flags += gd->reloc_off;
 
 		reloc_done++;
 	}
diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
index 454578c8d2..c6991be1c9 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -117,10 +117,15 @@ struct udevice;
 struct gpio_desc {
 	struct udevice *dev;	/* Device, NULL for invalid GPIO */
 	unsigned long flags;
+
 #define GPIOD_IS_OUT		BIT(1)	/* GPIO is an output */
 #define GPIOD_IS_IN		BIT(2)	/* GPIO is an input */
 #define GPIOD_ACTIVE_LOW	BIT(3)	/* value has active low */
 #define GPIOD_IS_OUT_ACTIVE	BIT(4)	/* set output active */
+#define GPIOD_OPEN_DRAIN	BIT(5)	/* GPIO is open drain type */
+#define GPIOD_OPEN_SOURCE	BIT(6)	/* GPIO is open source type */
+#define GPIOD_PULL_UP		BIT(7)	/* GPIO has pull up enabled */
+#define GPIOD_PULL_DOWN		BIT(8)	/* GPIO has pull down enabled */
 
 	uint offset;		/* GPIO offset within the device */
 	/*
@@ -129,6 +134,12 @@ struct gpio_desc {
 	 */
 };
 
+/* helper to compute the value of the gpio output */
+#define GPIOD_FLAGS_OUTPUT_MASK (GPIOD_ACTIVE_LOW | GPIOD_IS_OUT_ACTIVE)
+#define GPIOD_FLAGS_OUTPUT(flags) \
+	(((((flags) & GPIOD_FLAGS_OUTPUT_MASK) == GPIOD_IS_OUT_ACTIVE) || \
+	  (((flags) & GPIOD_FLAGS_OUTPUT_MASK) == GPIOD_ACTIVE_LOW)) ? 1 : 0)
+
 /**
  * dm_gpio_is_valid() - Check if a GPIO is valid
  *
@@ -253,6 +264,7 @@ struct dm_gpio_ops {
 				int value);
 	int (*get_value)(struct udevice *dev, unsigned offset);
 	int (*set_value)(struct udevice *dev, unsigned offset, int value);
+
 	/**
 	 * get_function() Get the GPIO function
 	 *
@@ -287,6 +299,37 @@ struct dm_gpio_ops {
 	 */
 	int (*xlate)(struct udevice *dev, struct gpio_desc *desc,
 		     struct ofnode_phandle_args *args);
+
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
+	/**
+	 * get_dir_flags() - Get GPIO dir flags
+	 *
+	 * This function return the GPIO direction flags used.
+	 *
+	 * This method is optional.
+	 *
+	 * @dev:	GPIO device
+	 * @offset:	GPIO offset within that device
+	 * @flags:	place to put the used direction flags by GPIO
+	 * @return 0 if OK, -ve on error
+	 */
+	int (*get_dir_flags)(struct udevice *dev, unsigned int offset,
+			     ulong *flags);
 };
 
 /**
@@ -586,8 +629,7 @@ int dm_gpio_set_value(const struct gpio_desc *desc, int value);
 /**
  * dm_gpio_set_dir() - Set the direction for a GPIO
  *
- * This sets up the direction according tot the provided flags. It will do
- * nothing unless the direction is actually specified.
+ * This sets up the direction according to the GPIO flags: desc->flags.
  *
  * @desc:	GPIO description containing device, offset and flags,
  *		previously returned by gpio_request_by_name()
@@ -596,11 +638,10 @@ int dm_gpio_set_value(const struct gpio_desc *desc, int value);
 int dm_gpio_set_dir(struct gpio_desc *desc);
 
 /**
- * dm_gpio_set_dir_flags() - Set direction using specific flags
+ * dm_gpio_set_dir_flags() - Set direction using add flags
  *
- * This is like dm_gpio_set_dir() except that the flags value is provided
- * instead of being used from desc->flags. This is needed because in many
- * cases the GPIO description does not include direction information.
+ * This sets up the direction according tot the provided flags and the GPIO
+ * description (desc->flags) which include direction information.
  * Note that desc->flags is updated by this function.
  *
  * @desc:	GPIO description containing device, offset and flags,
@@ -610,6 +651,18 @@ int dm_gpio_set_dir(struct gpio_desc *desc);
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
