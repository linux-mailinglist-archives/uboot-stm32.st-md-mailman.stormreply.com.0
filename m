Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D3AE1D2A
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 15:45:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E263BC36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 13:45:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9D43C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 13:45:17 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9NDhbb2014339; Wed, 23 Oct 2019 15:45:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=oR8J6dxeztnOCiEf+5D4mJecQahTTFWIIwbSJN/4oGE=;
 b=DSuoXgOeESBy3im4922flQIOy+KOWqCNI5tHc0dg/MTs34f1ibv2eXMkTc5FGz3nwiOx
 fh9/zNMCXQ+BQPAWpguu6CSi/qx3c585IOIwH9FrstWppY8oeHyYQQ6Q/aQgzIc+HhbG
 ws1gaWy/HH7EqBSCqI2eLBKbbPJ96jy9DDAKwnCm69SwXgy/BeFiaTw2UzmE0dCa00lo
 kVQe6Ib3HGrEFaps2ZB0VNwQgvXQ71H+b6FGbtOQ9t/5uBMFjRjSNh4A17HW7Al2vgjn
 9Jd2Mj1gIuIieAVQ4QechmgJrEAWxDhWWVZe+jwHh6YA2wsBLkCF8ADSKN5t5ZtBKJY2 NQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vt9s1kxrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 15:45:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 03BDD100039;
 Wed, 23 Oct 2019 15:45:12 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EBE702AC9A0;
 Wed, 23 Oct 2019 15:45:11 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct
 2019 15:45:12 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct 2019 15:45:11
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 23 Oct 2019 15:44:47 +0200
Message-ID: <20191023134448.20149-13-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023134448.20149-1-patrick.delaunay@st.com>
References: <20191023134448.20149-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_03:2019-10-23,2019-10-23 signatures=0
Cc: Simon Glass <sjg@chromium.org>,
 Alex Marginean <alexandru.marginean@nxp.com>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH 12/13] test: dm: update test for pins
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

Add tests for new API gpio_get_config and gpio_set_config and associated
code in gpio uclass.

Test support for new flags GPIO_OPEN_DRAIN, GPIO_OPEN_SOURCE
GPIO_PULL_UP and GPIO_PULL_DOWN.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/sandbox/dts/test.dts | 16 +++++++++++++
 drivers/gpio/sandbox.c    | 49 +++++++++++++++++++++++++++++++++++++++
 test/dm/gpio.c            | 31 +++++++++++++++++++++----
 test/dm/test-fdt.c        |  2 +-
 4 files changed, 93 insertions(+), 5 deletions(-)

diff --git a/arch/sandbox/dts/test.dts b/arch/sandbox/dts/test.dts
index 160eaa0ff7..05f6f84fe3 100644
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
@@ -292,6 +300,14 @@
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
diff --git a/drivers/gpio/sandbox.c b/drivers/gpio/sandbox.c
index 89e4505859..7a3e9ed520 100644
--- a/drivers/gpio/sandbox.c
+++ b/drivers/gpio/sandbox.c
@@ -20,6 +20,7 @@
 struct gpio_state {
 	const char *label;	/* label given by requester */
 	u8 flags;		/* bitfield flags (GPIO_FLAG_...) */
+	u8 config;		/* config (GPIO_CONF_...) */
 };
 
 /* Access routines for GPIO state */
@@ -55,6 +56,37 @@ static int set_gpio_flag(struct udevice *dev, unsigned offset, int flag,
 	return 0;
 }
 
+/* Access routines for GPIO configs */
+static u8 *get_sb_gpio_configs(struct udevice *dev, unsigned int offset)
+{
+	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
+	struct gpio_state *state = dev_get_priv(dev);
+	static u8 invalid_configs = GPIO_CONF_NONE;
+
+	if (offset >= uc_priv->gpio_count) {
+		printf("sandbox_gpio: error: invalid gpio %u\n", offset);
+
+		return &invalid_configs;
+	}
+
+	return &state[offset].config;
+}
+
+static int get_sb_gpio_config(struct udevice *dev, unsigned int offset)
+{
+	return *get_sb_gpio_configs(dev, offset);
+}
+
+static int set_sb_gpio_config(struct udevice *dev, unsigned int offset,
+			      u8 config)
+{
+	u8 *gpio = get_sb_gpio_configs(dev, offset);
+
+	*gpio = config;
+
+	return 0;
+}
+
 /*
  * Back-channel sandbox-internal-only access to GPIO state
  */
@@ -184,6 +216,21 @@ static int sb_gpio_xlate(struct udevice *dev, struct gpio_desc *desc,
 	return 0;
 }
 
+static int sb_gpio_set_config(struct udevice *dev, unsigned int offset,
+			      enum gpio_config config)
+{
+	debug("%s: offset:%u, config = %d\n", __func__, offset, config);
+
+	return set_sb_gpio_config(dev, offset, config);
+}
+
+static int sb_gpio_get_config(struct udevice *dev, unsigned int offset)
+{
+	debug("%s: offset:%u\n", __func__, offset);
+
+	return get_sb_gpio_config(dev, offset);
+}
+
 static const struct dm_gpio_ops gpio_sandbox_ops = {
 	.direction_input	= sb_gpio_direction_input,
 	.direction_output	= sb_gpio_direction_output,
@@ -193,6 +240,8 @@ static const struct dm_gpio_ops gpio_sandbox_ops = {
 	.set_open_drain		= sb_gpio_set_open_drain,
 	.get_function		= sb_gpio_get_function,
 	.xlate			= sb_gpio_xlate,
+	.set_config		= sb_gpio_set_config,
+	.get_config		= sb_gpio_get_config,
 };
 
 static int sandbox_gpio_ofdata_to_platdata(struct udevice *dev)
diff --git a/test/dm/gpio.c b/test/dm/gpio.c
index bb4b20cea9..b1bb5c2453 100644
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
@@ -243,7 +243,30 @@ static int dm_test_gpio_phandles(struct unit_test_state *uts)
 	ut_asserteq(GPIOF_OUTPUT, gpio_get_function(gpio_b, 9, NULL));
 	ut_asserteq(1, dm_gpio_get_value(&desc_list[5]));
 
-
 	return 0;
 }
 DM_TEST(dm_test_gpio_phandles, DM_TESTF_SCAN_PDATA | DM_TESTF_SCAN_FDT);
+
+/* Check the gpio pin configuration get from device tree information */
+static int dm_test_gpio_pin_config(struct unit_test_state *uts)
+{
+	struct gpio_desc desc_list[6];
+	struct udevice *dev;
+
+	ut_assertok(uclass_get_device(UCLASS_TEST_FDT, 0, &dev));
+
+	ut_asserteq(6, gpio_request_list_by_name(dev, "test3-gpios", desc_list,
+						 ARRAY_SIZE(desc_list), 0));
+	ut_asserteq(GPIO_CONF_DRIVE_OPEN_DRAIN, gpio_get_config(&desc_list[0]));
+	ut_asserteq(GPIO_CONF_DRIVE_OPEN_SOURCE,
+		    gpio_get_config(&desc_list[1]));
+	ut_asserteq(GPIO_CONF_DRIVE_PULL_PUSH, gpio_get_config(&desc_list[2]));
+	ut_asserteq(GPIO_CONF_BIAS_PULL_UP, gpio_get_config(&desc_list[3]));
+	ut_asserteq(GPIO_CONF_BIAS_PULL_DOWN, gpio_get_config(&desc_list[4]));
+	ut_asserteq(GPIO_CONF_NONE, gpio_get_config(&desc_list[5]));
+
+	ut_assertok(gpio_free_list(dev, desc_list, 6));
+
+	return 0;
+}
+DM_TEST(dm_test_gpio_pin_config, DM_TESTF_SCAN_PDATA | DM_TESTF_SCAN_FDT);
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
