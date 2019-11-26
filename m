Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F2E109A7E
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 09:49:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B45BC36B0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 08:49:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FADDC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2019 08:49:28 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAQ8lSRn008390; Tue, 26 Nov 2019 09:49:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=JD9m4qQQyVGL6Opnxy0svKmg0lYXm0wfs21ZnyiA0mY=;
 b=oTJ0iNBwOkkHSpnV8yTa/yE9ZZ4RN7098xVXO1tGasz7H2dWkJSBrG3ddTQ//DG2ilkA
 HI40nij+w5enEk9W6qQd1VLqlqyNfiaAW04jse8c4KhzvEoL57ycuFXu3BFkh6s7tDEw
 o6Ehw91B3yhxFaYzt1X1QsqITb1X54DogL/HcPTMC2PCh9mp3rNn9ojncVuJhea+1rCb
 LVeqyPHsx2/AdJ6hhTPfpaL8tELnNquPtMvapXre6/c9plQuAAYf/+uSdYug+2b8trCM
 Nt+KemwGoZCR8p2JvVQLtk+YCWdOu0HEKweTZt1NztNzfR5/X2EIgtbTijEOQSvxdb9r kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wevhjnxbn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 09:49:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8FE6D100039;
 Tue, 26 Nov 2019 09:49:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7DA7F2ACE59;
 Tue, 26 Nov 2019 09:49:23 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 26 Nov 2019 09:49:23 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 26 Nov 2019 09:49:10 +0100
Message-ID: <20191126084911.19761-14-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191126084911.19761-1-patrick.delaunay@st.com>
References: <20191126084911.19761-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_01:2019-11-21,2019-11-26 signatures=0
Cc: Simon Glass <sjg@chromium.org>,
 Alex Marginean <alexandru.marginean@nxp.com>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 13/14] test: dm: update test for pins
	configuration in gpio
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

Add tests for new API set_dir_flags and set_dir_flags and associated
code in gpio uclass.

Test support for new flags GPIO_OPEN_DRAIN, GPIO_OPEN_SOURCE
GPIO_PULL_UP and GPIO_PULL_DOWN.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- simplify sandbox GPIO driver: save dir_flags (GPIOD_...)
  and remove internal flags (GPIOF_...); the previous path
  "gpio: sandbox: cleanup flag support" is no more needed
- add unitary test in dm_test_gpio for set_dir_flags
- add some function check in dm_test_gpio_phandles
- dm_test_gpio_pin_config change to dm_test_gpio_get_dir_flags

 arch/sandbox/dts/test.dts       | 16 ++++++
 arch/sandbox/include/asm/gpio.h | 20 ++++++++
 drivers/gpio/sandbox.c          | 86 +++++++++++++++++++++++++--------
 test/dm/gpio.c                  | 66 ++++++++++++++++++++++---
 test/dm/test-fdt.c              |  2 +-
 5 files changed, 163 insertions(+), 27 deletions(-)

diff --git a/arch/sandbox/dts/test.dts b/arch/sandbox/dts/test.dts
index df58a0b488..8ab22c0c81 100644
--- a/arch/sandbox/dts/test.dts
+++ b/arch/sandbox/dts/test.dts
@@ -16,6 +16,7 @@
 		eth5 = &eth_5;
 		gpio1 = &gpio_a;
 		gpio2 = &gpio_b;
+		gpio3 = &gpio_c;
 		i2c0 = "/i2c@0";
 		mmc0 = "/mmc0";
 		mmc1 = "/mmc1";
@@ -97,6 +98,13 @@
 			<&gpio_b 7 GPIO_IN 3 2 1>,
 			<&gpio_b 8 GPIO_OUT 3 2 1>,
 			<&gpio_b 9 (GPIO_OUT|GPIO_OUT_ACTIVE) 3 2 1>;
+		test3-gpios =
+			<&gpio_c 0 (GPIO_OUT|GPIO_OPEN_DRAIN)>,
+			<&gpio_c 1 (GPIO_OUT|GPIO_OPEN_SOURCE)>,
+			<&gpio_c 2 GPIO_OUT>,
+			<&gpio_c 3 (GPIO_IN|GPIO_PULL_UP)>,
+			<&gpio_c 4 (GPIO_IN|GPIO_PULL_DOWN)>,
+			<&gpio_c 5 GPIO_IN>;
 		int-value = <1234>;
 		uint-value = <(-1234)>;
 	};
@@ -296,6 +304,14 @@
 		sandbox,gpio-count = <10>;
 	};
 
+	gpio_c: extra2-gpios {
+		compatible = "sandbox,gpio";
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-bank-name = "c";
+		sandbox,gpio-count = <10>;
+	};
+
 	i2c@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/sandbox/include/asm/gpio.h b/arch/sandbox/include/asm/gpio.h
index cfb803bb3b..df4ba4fb5f 100644
--- a/arch/sandbox/include/asm/gpio.h
+++ b/arch/sandbox/include/asm/gpio.h
@@ -62,4 +62,24 @@ int sandbox_gpio_get_direction(struct udevice *dev, unsigned int offset);
 int sandbox_gpio_set_direction(struct udevice *dev, unsigned int offset,
 			       int output);
 
+/**
+ * Return the simulated flags of a GPIO (used only in sandbox test code)
+ *
+ * @param dev		device to use
+ * @param offset	GPIO offset within bank
+ * @return dir_flags: bitfield accesses by GPIOD_ defines
+ */
+ulong sandbox_gpio_get_dir_flags(struct udevice *dev, unsigned int offset);
+
+/**
+ * Set the simulated flags of a GPIO (used only in sandbox test code)
+ *
+ * @param dev		device to use
+ * @param offset	GPIO offset within bank
+ * @param flags		dir_flags: bitfield accesses by GPIOD_ defines
+ * @return -1 on error, 0 if ok
+ */
+int sandbox_gpio_set_dir_flags(struct udevice *dev, unsigned int offset,
+			       ulong flags);
+
 #endif
diff --git a/drivers/gpio/sandbox.c b/drivers/gpio/sandbox.c
index c2a8adc647..a9c470ee5e 100644
--- a/drivers/gpio/sandbox.c
+++ b/drivers/gpio/sandbox.c
@@ -8,43 +8,43 @@
 #include <fdtdec.h>
 #include <malloc.h>
 #include <asm/gpio.h>
+#include <dm/lists.h>
 #include <dm/of.h>
+#include <dm/pinctrl.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/gpio/sandbox-gpio.h>
 
-/* Flags for each GPIO */
-#define GPIOF_OUTPUT	(1 << 0)	/* Currently set as an output */
-#define GPIOF_HIGH	(1 << 1)	/* Currently set high */
 
 struct gpio_state {
 	const char *label;	/* label given by requester */
-	u8 flags;		/* flags (GPIOF_...) */
+	ulong dir_flags;	/* dir_flags (GPIOD_...) */
 };
 
-/* Access routines for GPIO state */
-static u8 *get_gpio_flags(struct udevice *dev, unsigned offset)
+/* Access routines for GPIO dir flags */
+static ulong *get_gpio_dir_flags(struct udevice *dev, unsigned int offset)
 {
 	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
 	struct gpio_state *state = dev_get_priv(dev);
 
 	if (offset >= uc_priv->gpio_count) {
-		static u8 invalid_flags;
+		static ulong invalid_dir_flags;
 		printf("sandbox_gpio: error: invalid gpio %u\n", offset);
-		return &invalid_flags;
+		return &invalid_dir_flags;
 	}
 
-	return &state[offset].flags;
+	return &state[offset].dir_flags;
+
 }
 
-static int get_gpio_flag(struct udevice *dev, unsigned offset, int flag)
+static int get_gpio_flag(struct udevice *dev, unsigned int offset, ulong flag)
 {
-	return (*get_gpio_flags(dev, offset) & flag) != 0;
+	return (*get_gpio_dir_flags(dev, offset) & flag) != 0;
 }
 
-static int set_gpio_flag(struct udevice *dev, unsigned offset, int flag,
+static int set_gpio_flag(struct udevice *dev, unsigned int offset, ulong flag,
 			 int value)
 {
-	u8 *gpio = get_gpio_flags(dev, offset);
+	ulong *gpio = get_gpio_dir_flags(dev, offset);
 
 	if (value)
 		*gpio |= flag;
@@ -60,24 +60,40 @@ static int set_gpio_flag(struct udevice *dev, unsigned offset, int flag,
 
 int sandbox_gpio_get_value(struct udevice *dev, unsigned offset)
 {
-	if (get_gpio_flag(dev, offset, GPIOF_OUTPUT))
+	if (get_gpio_flag(dev, offset, GPIOD_IS_OUT))
 		debug("sandbox_gpio: get_value on output gpio %u\n", offset);
-	return get_gpio_flag(dev, offset, GPIOF_HIGH);
+	return get_gpio_flag(dev, offset, GPIOD_IS_OUT_ACTIVE);
 }
 
 int sandbox_gpio_set_value(struct udevice *dev, unsigned offset, int value)
 {
-	return set_gpio_flag(dev, offset, GPIOF_HIGH, value);
+	return set_gpio_flag(dev, offset, GPIOD_IS_OUT_ACTIVE, value);
 }
 
 int sandbox_gpio_get_direction(struct udevice *dev, unsigned offset)
 {
-	return get_gpio_flag(dev, offset, GPIOF_OUTPUT);
+	return get_gpio_flag(dev, offset, GPIOD_IS_OUT);
 }
 
 int sandbox_gpio_set_direction(struct udevice *dev, unsigned offset, int output)
 {
-	return set_gpio_flag(dev, offset, GPIOF_OUTPUT, output);
+	set_gpio_flag(dev, offset, GPIOD_IS_OUT, output);
+	set_gpio_flag(dev, offset, GPIOD_IS_IN, !(output));
+
+	return 0;
+}
+
+ulong sandbox_gpio_get_dir_flags(struct udevice *dev, unsigned int offset)
+{
+	return *get_gpio_dir_flags(dev, offset);
+}
+
+int sandbox_gpio_set_dir_flags(struct udevice *dev, unsigned int offset,
+			       ulong flags)
+{
+	*get_gpio_dir_flags(dev, offset) = flags;
+
+	return 0;
 }
 
 /*
@@ -126,9 +142,12 @@ static int sb_gpio_set_value(struct udevice *dev, unsigned offset, int value)
 
 static int sb_gpio_get_function(struct udevice *dev, unsigned offset)
 {
-	if (get_gpio_flag(dev, offset, GPIOF_OUTPUT))
+	if (get_gpio_flag(dev, offset, GPIOD_IS_OUT))
 		return GPIOF_OUTPUT;
-	return GPIOF_INPUT;
+	if (get_gpio_flag(dev, offset, GPIOD_IS_IN))
+		return GPIOF_INPUT;
+
+	return GPIOF_INPUT; /*GPIO is not configurated */
 }
 
 static int sb_gpio_xlate(struct udevice *dev, struct gpio_desc *desc,
@@ -143,14 +162,39 @@ static int sb_gpio_xlate(struct udevice *dev, struct gpio_desc *desc,
 	/* sandbox test specific, not defined in gpio.h */
 	if (args->args[1] & GPIO_IN)
 		desc->flags |= GPIOD_IS_IN;
+
 	if (args->args[1] & GPIO_OUT)
 		desc->flags |= GPIOD_IS_OUT;
+
 	if (args->args[1] & GPIO_OUT_ACTIVE)
 		desc->flags |= GPIOD_IS_OUT_ACTIVE;
 
 	return 0;
 }
 
+static int sb_gpio_set_dir_flags(struct udevice *dev, unsigned int offset,
+				 ulong flags)
+{
+	ulong *dir_flags;
+
+	debug("%s: offset:%u, dir_flags = %lx\n", __func__, offset, flags);
+
+	dir_flags = get_gpio_dir_flags(dev, offset);
+
+	*dir_flags = flags;
+
+	return 0;
+}
+
+static int sb_gpio_get_dir_flags(struct udevice *dev, unsigned int offset,
+				 ulong *flags)
+{
+	debug("%s: offset:%u\n", __func__, offset);
+	*flags = *get_gpio_dir_flags(dev, offset);
+
+	return 0;
+}
+
 static const struct dm_gpio_ops gpio_sandbox_ops = {
 	.direction_input	= sb_gpio_direction_input,
 	.direction_output	= sb_gpio_direction_output,
@@ -158,6 +202,8 @@ static const struct dm_gpio_ops gpio_sandbox_ops = {
 	.set_value		= sb_gpio_set_value,
 	.get_function		= sb_gpio_get_function,
 	.xlate			= sb_gpio_xlate,
+	.set_dir_flags		= sb_gpio_set_dir_flags,
+	.get_dir_flags		= sb_gpio_get_dir_flags,
 };
 
 static int sandbox_gpio_ofdata_to_platdata(struct udevice *dev)
diff --git a/test/dm/gpio.c b/test/dm/gpio.c
index 8abf0cd8c8..5992d938d7 100644
--- a/test/dm/gpio.c
+++ b/test/dm/gpio.c
@@ -23,9 +23,9 @@ static int dm_test_gpio(struct unit_test_state *uts)
 	char buf[80];
 
 	/*
-	 * We expect to get 3 banks. One is anonymous (just numbered) and
-	 * comes from platdata. The other two are named a (20 gpios)
-	 * and b (10 gpios) and come from the device tree. See
+	 * We expect to get 4 banks. One is anonymous (just numbered) and
+	 * comes from platdata. The other are named a (20 gpios),
+	 * b (10 gpios) and c (10 gpios) and come from the device tree. See
 	 * test/dm/test.dts.
 	 */
 	ut_assertok(gpio_lookup_name("b4", &dev, &offset, &gpio));
@@ -72,6 +72,18 @@ static int dm_test_gpio(struct unit_test_state *uts)
 	ut_assertok(ops->set_value(dev, offset, 1));
 	ut_asserteq(1, ops->get_value(dev, offset));
 
+	/* Make it an open drain output, and reset it */
+	ut_asserteq(GPIOD_IS_OUT | GPIOD_IS_OUT_ACTIVE,
+		    sandbox_gpio_get_dir_flags(dev, offset));
+	ut_assertok(ops->set_dir_flags(dev, offset,
+				       GPIOD_IS_OUT | GPIOD_OPEN_DRAIN));
+	ut_asserteq(GPIOD_IS_OUT | GPIOD_OPEN_DRAIN,
+		    sandbox_gpio_get_dir_flags(dev, offset));
+	ut_assertok(ops->set_dir_flags(dev, offset,
+				       GPIOD_IS_OUT | GPIOD_IS_OUT_ACTIVE));
+	ut_asserteq(GPIOD_IS_OUT | GPIOD_IS_OUT_ACTIVE,
+		    sandbox_gpio_get_dir_flags(dev, offset));
+
 	/* Make it an input */
 	ut_assertok(ops->direction_input(dev, offset));
 	ut_assertok(gpio_get_status(dev, offset, buf, sizeof(buf)));
@@ -207,11 +219,14 @@ static int dm_test_gpio_phandles(struct unit_test_state *uts)
 						      desc_list2,
 						      ARRAY_SIZE(desc_list2),
 						      0));
+	ut_asserteq(GPIOF_INPUT, gpio_get_function(gpio_a, 4, NULL));
 	ut_assertok(gpio_free_list(dev, desc_list, 3));
+	ut_asserteq(GPIOF_UNUSED, gpio_get_function(gpio_a, 4, NULL));
 	ut_asserteq(3, gpio_request_list_by_name(dev,  "test-gpios", desc_list,
 						 ARRAY_SIZE(desc_list),
 						 GPIOD_IS_OUT |
 						 GPIOD_IS_OUT_ACTIVE));
+	ut_asserteq(GPIOF_OUTPUT, gpio_get_function(gpio_a, 4, NULL));
 	ut_asserteq_ptr(gpio_a, desc_list[0].dev);
 	ut_asserteq(1, desc_list[0].offset);
 	ut_asserteq_ptr(gpio_a, desc_list[1].dev);
@@ -221,10 +236,14 @@ static int dm_test_gpio_phandles(struct unit_test_state *uts)
 	ut_asserteq(1, dm_gpio_get_value(desc_list));
 	ut_assertok(gpio_free_list(dev, desc_list, 3));
 
+	ut_asserteq(GPIOD_IS_OUT | GPIOD_IS_OUT_ACTIVE,
+		    sandbox_gpio_get_dir_flags(gpio_a, 1));
 	ut_asserteq(6, gpio_request_list_by_name(dev, "test2-gpios", desc_list,
 						 ARRAY_SIZE(desc_list), 0));
-	/* This was set to output previously, so still will be */
-	ut_asserteq(GPIOF_OUTPUT, gpio_get_function(gpio_a, 1, NULL));
+
+	/* This was set to output previously but flags resetted to 0 = INPUT */
+	ut_asserteq(0, sandbox_gpio_get_dir_flags(gpio_a, 1));
+	ut_asserteq(GPIOF_INPUT, gpio_get_function(gpio_a, 1, NULL));
 
 	/* Active low should invert the input value */
 	ut_asserteq(GPIOF_INPUT, gpio_get_function(gpio_b, 6, NULL));
@@ -236,7 +255,42 @@ static int dm_test_gpio_phandles(struct unit_test_state *uts)
 	ut_asserteq(GPIOF_OUTPUT, gpio_get_function(gpio_b, 9, NULL));
 	ut_asserteq(1, dm_gpio_get_value(&desc_list[5]));
 
-
 	return 0;
 }
 DM_TEST(dm_test_gpio_phandles, DM_TESTF_SCAN_PDATA | DM_TESTF_SCAN_FDT);
+
+/* Check the gpio pin configuration get from device tree information */
+static int dm_test_gpio_get_dir_flags(struct unit_test_state *uts)
+{
+	struct gpio_desc desc_list[6];
+	struct udevice *dev;
+	ulong flags;
+
+	ut_assertok(uclass_get_device(UCLASS_TEST_FDT, 0, &dev));
+
+	ut_asserteq(6, gpio_request_list_by_name(dev, "test3-gpios", desc_list,
+						 ARRAY_SIZE(desc_list), 0));
+
+	ut_assertok(dm_gpio_get_dir_flags(&desc_list[0], &flags));
+	ut_asserteq(GPIOD_IS_OUT | GPIOD_OPEN_DRAIN, flags);
+
+	ut_assertok(dm_gpio_get_dir_flags(&desc_list[1], &flags));
+	ut_asserteq(GPIOD_IS_OUT | GPIOD_OPEN_SOURCE, flags);
+
+	ut_assertok(dm_gpio_get_dir_flags(&desc_list[2], &flags));
+	ut_asserteq(GPIOD_IS_OUT, flags);
+
+	ut_assertok(dm_gpio_get_dir_flags(&desc_list[3], &flags));
+	ut_asserteq(GPIOD_IS_IN | GPIOD_PULL_UP, flags);
+
+	ut_assertok(dm_gpio_get_dir_flags(&desc_list[4], &flags));
+	ut_asserteq(GPIOD_IS_IN | GPIOD_PULL_DOWN, flags);
+
+	ut_assertok(dm_gpio_get_dir_flags(&desc_list[5], &flags));
+	ut_asserteq(GPIOD_IS_IN, flags);
+
+	ut_assertok(gpio_free_list(dev, desc_list, 6));
+
+	return 0;
+}
+DM_TEST(dm_test_gpio_get_dir_flags, DM_TESTF_SCAN_PDATA | DM_TESTF_SCAN_FDT);
diff --git a/test/dm/test-fdt.c b/test/dm/test-fdt.c
index 1fb8b5c248..3451146d04 100644
--- a/test/dm/test-fdt.c
+++ b/test/dm/test-fdt.c
@@ -227,7 +227,7 @@ static int dm_test_alias_highest_id(struct unit_test_state *uts)
 	ut_asserteq(5, ret);
 
 	ret = dev_read_alias_highest_id("gpio");
-	ut_asserteq(2, ret);
+	ut_asserteq(3, ret);
 
 	ret = dev_read_alias_highest_id("pci");
 	ut_asserteq(2, ret);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
