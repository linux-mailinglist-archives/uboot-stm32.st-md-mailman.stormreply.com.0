Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CD5109A76
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 09:49:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E6D1C36B0C
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 08:49:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04920C36B0E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2019 08:49:20 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAQ8lfXW029177; Tue, 26 Nov 2019 09:49:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=SyVsKbYiz11bQD7/hw0ca2ghwfM5mCs9UtWnKES3W5U=;
 b=Sbh8StPbTO6g6jTPiAIk0+pIrafa0BeXjjDncWy/U9av9tHu0nkrChGTXS5rlSNQnnei
 wc7dbt69x2LqMHT3e0eRkMxV/P24D+Am7IsUVSawXm03l6aWxgyLE9EIAL/pV8yl4X4z
 U2fGEC6uNO5dRzc9R0yH8AchJrxeksvYWcP58WJL6GieRCO3VprYTaOwfhZgjbzPAtOJ
 ruTawP+evkmh/G98X5Xk42lb9j/XR0KMzqNmKFrVfh2oLbpJqFA7gUA4iDtp2s/iXDzY
 XGN8XlWrSuzrqWVXjDOoh9m9zN11h8y8kErPKQrADtkrdfDHzRAsCbyMEfQwbuvrdBqX HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2weu42dx58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 09:49:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7206A10002A;
 Tue, 26 Nov 2019 09:49:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 65E732ACE57;
 Tue, 26 Nov 2019 09:49:18 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 26 Nov 2019 09:49:18 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 26 Nov 2019 09:49:03 +0100
Message-ID: <20191126084911.19761-7-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191126084911.19761-1-patrick.delaunay@st.com>
References: <20191126084911.19761-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_01:2019-11-21,2019-11-26 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Bin Meng <bmeng.cn@gmail.com>,
 Heiko Schocher <hs@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 06/14] gpio: remove the open_drain API and
	ops
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

This patch removes the ops get_open_drain/set_open_drain
and the API dm_gpio_get_open_drain/dm_gpio_set_open_drain.

The ops only provided in one driver (mpc8xxx gpio) and the
associated API is never called in boards.

This patch prepare a more generic set/get_dir_flags ops,
including the open drain property.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- remove the open_drain API and ops

 arch/sandbox/include/asm/gpio.h | 20 ------------------
 drivers/gpio/gpio-uclass.c      | 36 ---------------------------------
 drivers/gpio/mpc8xxx_gpio.c     | 22 --------------------
 drivers/gpio/sandbox.c          | 35 --------------------------------
 include/asm-generic/gpio.h      | 34 -------------------------------
 test/dm/gpio.c                  |  7 -------
 6 files changed, 154 deletions(-)

diff --git a/arch/sandbox/include/asm/gpio.h b/arch/sandbox/include/asm/gpio.h
index de8ac37f42..cfb803bb3b 100644
--- a/arch/sandbox/include/asm/gpio.h
+++ b/arch/sandbox/include/asm/gpio.h
@@ -42,26 +42,6 @@ int sandbox_gpio_get_value(struct udevice *dev, unsigned int offset);
  */
 int sandbox_gpio_set_value(struct udevice *dev, unsigned int offset, int value);
 
-/**
- * Set or reset the simulated open drain mode of a GPIO (used only in sandbox
- * test code)
- *
- * @param gp	GPIO number
- * @param value	value to set (0 for enabled open drain mode, non-zero for
- * 		disabled)
- * @return -1 on error, 0 if ok
- */
-int sandbox_gpio_set_open_drain(struct udevice *dev, unsigned offset, int value);
-
-/**
- * Return the state of the simulated open drain mode of a GPIO (used only in
- * sandbox test code)
- *
- * @param gp	GPIO number
- * @return -1 on error, 0 if GPIO is input, >0 if output
- */
-int sandbox_gpio_get_open_drain(struct udevice *dev, unsigned offset);
-
 /**
  * Return the simulated direction of a GPIO (used only in sandbox test code)
  *
diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
index 90fbed455b..eb599cbcfd 100644
--- a/drivers/gpio/gpio-uclass.c
+++ b/drivers/gpio/gpio-uclass.c
@@ -491,38 +491,6 @@ int dm_gpio_set_value(const struct gpio_desc *desc, int value)
 	return 0;
 }
 
-int dm_gpio_get_open_drain(struct gpio_desc *desc)
-{
-	struct dm_gpio_ops *ops = gpio_get_ops(desc->dev);
-	int ret;
-
-	ret = check_reserved(desc, "get_open_drain");
-	if (ret)
-		return ret;
-
-	if (ops->set_open_drain)
-		return ops->get_open_drain(desc->dev, desc->offset);
-	else
-		return -ENOSYS;
-}
-
-int dm_gpio_set_open_drain(struct gpio_desc *desc, int value)
-{
-	struct dm_gpio_ops *ops = gpio_get_ops(desc->dev);
-	int ret;
-
-	ret = check_reserved(desc, "set_open_drain");
-	if (ret)
-		return ret;
-
-	if (ops->set_open_drain)
-		ret = ops->set_open_drain(desc->dev, desc->offset, value);
-	else
-		return 0; /* feature not supported -> ignore setting */
-
-	return ret;
-}
-
 int dm_gpio_set_dir_flags(struct gpio_desc *desc, ulong flags)
 {
 	struct udevice *dev = desc->dev;
@@ -1053,10 +1021,6 @@ static int gpio_post_bind(struct udevice *dev)
 			ops->get_value += gd->reloc_off;
 		if (ops->set_value)
 			ops->set_value += gd->reloc_off;
-		if (ops->get_open_drain)
-			ops->get_open_drain += gd->reloc_off;
-		if (ops->set_open_drain)
-			ops->set_open_drain += gd->reloc_off;
 		if (ops->get_function)
 			ops->get_function += gd->reloc_off;
 		if (ops->xlate)
diff --git a/drivers/gpio/mpc8xxx_gpio.c b/drivers/gpio/mpc8xxx_gpio.c
index c273c2c8a4..c23f5b5227 100644
--- a/drivers/gpio/mpc8xxx_gpio.c
+++ b/drivers/gpio/mpc8xxx_gpio.c
@@ -144,26 +144,6 @@ static int mpc8xxx_gpio_get_value(struct udevice *dev, uint gpio)
 	return !!mpc8xxx_gpio_get_val(data->base, gpio_mask(gpio));
 }
 
-static int mpc8xxx_gpio_get_open_drain(struct udevice *dev, uint gpio)
-{
-	struct mpc8xxx_gpio_data *data = dev_get_priv(dev);
-
-	return !!mpc8xxx_gpio_open_drain_val(data->base, gpio_mask(gpio));
-}
-
-static int mpc8xxx_gpio_set_open_drain(struct udevice *dev, uint gpio,
-				       int value)
-{
-	struct mpc8xxx_gpio_data *data = dev_get_priv(dev);
-
-	if (value)
-		mpc8xxx_gpio_open_drain_on(data->base, gpio_mask(gpio));
-	else
-		mpc8xxx_gpio_open_drain_off(data->base, gpio_mask(gpio));
-
-	return 0;
-}
-
 static int mpc8xxx_gpio_get_function(struct udevice *dev, uint gpio)
 {
 	struct mpc8xxx_gpio_data *data = dev_get_priv(dev);
@@ -240,8 +220,6 @@ static const struct dm_gpio_ops gpio_mpc8xxx_ops = {
 	.direction_output	= mpc8xxx_gpio_direction_output,
 	.get_value		= mpc8xxx_gpio_get_value,
 	.set_value		= mpc8xxx_gpio_set_value,
-	.get_open_drain		= mpc8xxx_gpio_get_open_drain,
-	.set_open_drain		= mpc8xxx_gpio_set_open_drain,
 	.get_function		= mpc8xxx_gpio_get_function,
 };
 
diff --git a/drivers/gpio/sandbox.c b/drivers/gpio/sandbox.c
index 2ef5c67ad5..91e8e0677e 100644
--- a/drivers/gpio/sandbox.c
+++ b/drivers/gpio/sandbox.c
@@ -14,7 +14,6 @@
 /* Flags for each GPIO */
 #define GPIOF_OUTPUT	(1 << 0)	/* Currently set as an output */
 #define GPIOF_HIGH	(1 << 1)	/* Currently set high */
-#define GPIOF_ODR	(1 << 2)	/* Currently set to open drain mode */
 
 struct gpio_state {
 	const char *label;	/* label given by requester */
@@ -70,16 +69,6 @@ int sandbox_gpio_set_value(struct udevice *dev, unsigned offset, int value)
 	return set_gpio_flag(dev, offset, GPIOF_HIGH, value);
 }
 
-int sandbox_gpio_get_open_drain(struct udevice *dev, unsigned offset)
-{
-	return get_gpio_flag(dev, offset, GPIOF_ODR);
-}
-
-int sandbox_gpio_set_open_drain(struct udevice *dev, unsigned offset, int value)
-{
-	return set_gpio_flag(dev, offset, GPIOF_ODR, value);
-}
-
 int sandbox_gpio_get_direction(struct udevice *dev, unsigned offset)
 {
 	return get_gpio_flag(dev, offset, GPIOF_OUTPUT);
@@ -134,28 +123,6 @@ static int sb_gpio_set_value(struct udevice *dev, unsigned offset, int value)
 	return sandbox_gpio_set_value(dev, offset, value);
 }
 
-/* read GPIO ODR value of port 'offset' */
-static int sb_gpio_get_open_drain(struct udevice *dev, unsigned offset)
-{
-	debug("%s: offset:%u\n", __func__, offset);
-
-	return sandbox_gpio_get_open_drain(dev, offset);
-}
-
-/* write GPIO ODR value to port 'offset' */
-static int sb_gpio_set_open_drain(struct udevice *dev, unsigned offset, int value)
-{
-	debug("%s: offset:%u, value = %d\n", __func__, offset, value);
-
-	if (!sandbox_gpio_get_direction(dev, offset)) {
-		printf("sandbox_gpio: error: set_open_drain on input gpio %u\n",
-		       offset);
-		return -1;
-	}
-
-	return sandbox_gpio_set_open_drain(dev, offset, value);
-}
-
 static int sb_gpio_get_function(struct udevice *dev, unsigned offset)
 {
 	if (get_gpio_flag(dev, offset, GPIOF_OUTPUT))
@@ -186,8 +153,6 @@ static const struct dm_gpio_ops gpio_sandbox_ops = {
 	.direction_output	= sb_gpio_direction_output,
 	.get_value		= sb_gpio_get_value,
 	.set_value		= sb_gpio_set_value,
-	.get_open_drain		= sb_gpio_get_open_drain,
-	.set_open_drain		= sb_gpio_set_open_drain,
 	.get_function		= sb_gpio_get_function,
 	.xlate			= sb_gpio_xlate,
 };
diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
index 7da2015805..454578c8d2 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -253,8 +253,6 @@ struct dm_gpio_ops {
 				int value);
 	int (*get_value)(struct udevice *dev, unsigned offset);
 	int (*set_value)(struct udevice *dev, unsigned offset, int value);
-	int (*get_open_drain)(struct udevice *dev, unsigned offset);
-	int (*set_open_drain)(struct udevice *dev, unsigned offset, int value);
 	/**
 	 * get_function() Get the GPIO function
 	 *
@@ -585,38 +583,6 @@ int dm_gpio_get_value(const struct gpio_desc *desc);
 
 int dm_gpio_set_value(const struct gpio_desc *desc, int value);
 
-/**
- * dm_gpio_get_open_drain() - Check if open-drain-mode of a GPIO is active
- *
- * This checks if open-drain-mode for a GPIO is enabled or not. This method is
- * optional.
- *
- * @desc:	GPIO description containing device, offset and flags,
- *		previously returned by gpio_request_by_name()
- * @return Value of open drain mode for GPIO (0 for inactive, 1 for active) or
- *	   -ve on error
- */
-int dm_gpio_get_open_drain(struct gpio_desc *desc);
-
-/**
- * dm_gpio_set_open_drain() - Switch open-drain-mode of a GPIO on or off
- *
- * This enables or disables open-drain mode for a GPIO. This method is
- * optional; if the driver does not support it, nothing happens when the method
- * is called.
- *
- * In open-drain mode, instead of actively driving the output (Push-pull
- * output), the GPIO's pin is connected to the collector (for a NPN transistor)
- * or the drain (for a MOSFET) of a transistor, respectively. The pin then
- * either forms an open circuit or a connection to ground, depending on the
- * state of the transistor.
- *
- * @desc:	GPIO description containing device, offset and flags,
- *		previously returned by gpio_request_by_name()
- * @return 0 if OK, -ve on error
- */
-int dm_gpio_set_open_drain(struct gpio_desc *desc, int value);
-
 /**
  * dm_gpio_set_dir() - Set the direction for a GPIO
  *
diff --git a/test/dm/gpio.c b/test/dm/gpio.c
index bb4b20cea9..8abf0cd8c8 100644
--- a/test/dm/gpio.c
+++ b/test/dm/gpio.c
@@ -72,13 +72,6 @@ static int dm_test_gpio(struct unit_test_state *uts)
 	ut_assertok(ops->set_value(dev, offset, 1));
 	ut_asserteq(1, ops->get_value(dev, offset));
 
-	/* Make it an open drain output, and reset it */
-	ut_asserteq(0, sandbox_gpio_get_open_drain(dev, offset));
-	ut_assertok(ops->set_open_drain(dev, offset, 1));
-	ut_asserteq(1, sandbox_gpio_get_open_drain(dev, offset));
-	ut_assertok(ops->set_open_drain(dev, offset, 0));
-	ut_asserteq(0, sandbox_gpio_get_open_drain(dev, offset));
-
 	/* Make it an input */
 	ut_assertok(ops->direction_input(dev, offset));
 	ut_assertok(gpio_get_status(dev, offset, buf, sizeof(buf)));
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
