Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 132C8E1D29
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 15:45:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D220DC36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 13:45:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD286C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 13:45:16 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9NDh5KH001129; Wed, 23 Oct 2019 15:45:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=MwCmdPGFHfM0aX7NSFsxkwqAcZvZsF2DdJkx5tO070w=;
 b=HTap7KFKa1Ii+PsRJV3Rh8I0/icHX+WEkYIrsxYOgfk/OcF7WSWZOaUHJb3EXKwAavw9
 58x+OgFg9ir+RM1omMAqoCOlVCjC9VZG+Pkp7ctwngllY/IVzgyYEv3XHqCIbzunDYcE
 KBnSeTKL8hrpRir9XGMWoi5P///v0UwOViaiO4l6KIjUbCsl9cNInRXsCUNlYsqxflgh
 36OJawX6jGwT1vq/btr8irYD4MM6o9oXqQFNiSTPrWkkdcn3JlcSTGsZjrp9S8+jq5Xc
 pbMWVA07Lhj7NBG/A07ofNLoLzuCopcckbLn0qZT+RBImwXL5oNtqhvOEG0sl1WpJE5O sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vt9s43xm0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 15:45:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A450310002A;
 Wed, 23 Oct 2019 15:45:13 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 98D3D2AC9A0;
 Wed, 23 Oct 2019 15:45:13 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct
 2019 15:45:13 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct 2019 15:45:12
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 23 Oct 2019 15:44:48 +0200
Message-ID: <20191023134448.20149-14-patrick.delaunay@st.com>
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
 Patrice Chotard <patrice.chotard@st.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH 13/13] test: pinmux: add pincontrol-gpio for
	pin configuration
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

Add a simple pincontrol associated to the sandbox gpio driver,
that allow to check pin configuration check with the
command pinmux.

The pinux test is also updated to test behavior with 2 pincontrols.

Example to check LED pin configuration:

=> pinmux list
| Device                        | Driver                        | Parent
| pinctrl-gpio                  | sandbox_pinctrl_gpio          | root_driver
| pinctrl                       | sandbox_pinctrl               | root_driver

=> pinmux dev pinctrl-gpio

=> pinmux status

a0        : gpio input .
a1        : gpio input .
a2        : gpio input .
a3        : gpio input .
a4        : gpio input .
a5        : gpio output drive-pull-push
a6        : gpio output drive-pull-push
...

Serie-cc: Heiko Schocher <hs@denx.de>

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

---

 arch/sandbox/dts/test.dts    |  48 +++++----
 drivers/gpio/sandbox.c       | 193 +++++++++++++++++++++++++++++++++++
 test/py/tests/test_pinmux.py |  10 ++
 3 files changed, 229 insertions(+), 22 deletions(-)

diff --git a/arch/sandbox/dts/test.dts b/arch/sandbox/dts/test.dts
index 05f6f84fe3..a975b2edca 100644
--- a/arch/sandbox/dts/test.dts
+++ b/arch/sandbox/dts/test.dts
@@ -284,28 +284,32 @@
 		};
 	};
 
-	gpio_a: base-gpios {
-		compatible = "sandbox,gpio";
-		gpio-controller;
-		#gpio-cells = <1>;
-		gpio-bank-name = "a";
-		sandbox,gpio-count = <20>;
-	};
-
-	gpio_b: extra-gpios {
-		compatible = "sandbox,gpio";
-		gpio-controller;
-		#gpio-cells = <5>;
-		gpio-bank-name = "b";
-		sandbox,gpio-count = <10>;
-	};
-
-	gpio_c: extra2-gpios {
-		compatible = "sandbox,gpio";
-		gpio-controller;
-		#gpio-cells = <2>;
-		gpio-bank-name = "c";
-		sandbox,gpio-count = <10>;
+	pinctrl-gpio {
+		compatible = "sandbox,pinctrl-gpio";
+
+		gpio_a: base-gpios {
+			compatible = "sandbox,gpio";
+			gpio-controller;
+			#gpio-cells = <1>;
+			gpio-bank-name = "a";
+			sandbox,gpio-count = <20>;
+		};
+
+		gpio_b: extra-gpios {
+			compatible = "sandbox,gpio";
+			gpio-controller;
+			#gpio-cells = <5>;
+			gpio-bank-name = "b";
+			sandbox,gpio-count = <10>;
+		};
+
+		gpio_c: pinmux-gpios {
+			compatible = "sandbox,gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-bank-name = "c";
+			sandbox,gpio-count = <10>;
+		};
 	};
 
 	i2c@0 {
diff --git a/drivers/gpio/sandbox.c b/drivers/gpio/sandbox.c
index 7a3e9ed520..3ca8933e84 100644
--- a/drivers/gpio/sandbox.c
+++ b/drivers/gpio/sandbox.c
@@ -8,7 +8,9 @@
 #include <fdtdec.h>
 #include <malloc.h>
 #include <asm/gpio.h>
+#include <dm/lists.h>
 #include <dm/of.h>
+#include <dm/pinctrl.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/gpio/sandbox-gpio.h>
 
@@ -23,6 +25,15 @@ struct gpio_state {
 	u8 config;		/* config (GPIO_CONF_...) */
 };
 
+static const char * const gpio_config[GPIO_CONF_COUNT] = {
+	[GPIO_CONF_NONE] = ".",
+	[GPIO_CONF_DRIVE_OPEN_DRAIN] = "drive-open-drain",
+	[GPIO_CONF_DRIVE_OPEN_SOURCE] = "drive-push-pull",
+	[GPIO_CONF_DRIVE_PULL_PUSH] = "drive-pull-push",
+	[GPIO_CONF_BIAS_PULL_DOWN] = "bias-pull-down",
+	[GPIO_CONF_BIAS_PULL_UP] = "bias-pull-up",
+};
+
 /* Access routines for GPIO state */
 static u8 *get_gpio_flags(struct udevice *dev, unsigned offset)
 {
@@ -289,3 +300,185 @@ U_BOOT_DRIVER(gpio_sandbox) = {
 	.remove	= gpio_sandbox_remove,
 	.ops	= &gpio_sandbox_ops,
 };
+
+/* pincontrol: used only to check GPIO pin configuration (pinmux command) */
+
+struct sb_pinctrl_priv {
+	int pinctrl_ngpios;
+	struct list_head gpio_dev;
+};
+
+struct sb_gpio_bank {
+	struct udevice *gpio_dev;
+	struct list_head list;
+};
+
+static int sb_populate_gpio_dev_list(struct udevice *dev)
+{
+	struct sb_pinctrl_priv *priv = dev_get_priv(dev);
+	struct udevice *gpio_dev;
+	struct udevice *child;
+	struct sb_gpio_bank *gpio_bank;
+	int ret;
+
+	/*
+	 * parse pin-controller sub-nodes (ie gpio bank nodes) and fill
+	 * a list with all gpio device reference which belongs to the
+	 * current pin-controller. This list is used to find pin_name and
+	 * pin muxing
+	 */
+	list_for_each_entry(child, &dev->child_head, sibling_node) {
+		ret = uclass_get_device_by_name(UCLASS_GPIO, child->name,
+						&gpio_dev);
+		if (ret < 0)
+			continue;
+
+		gpio_bank = malloc(sizeof(*gpio_bank));
+		if (!gpio_bank) {
+			dev_err(dev, "Not enough memory\n");
+			return -ENOMEM;
+		}
+
+		gpio_bank->gpio_dev = gpio_dev;
+		list_add_tail(&gpio_bank->list, &priv->gpio_dev);
+	}
+
+	return 0;
+}
+
+static int sb_pinctrl_get_pins_count(struct udevice *dev)
+{
+	struct sb_pinctrl_priv *priv = dev_get_priv(dev);
+	struct gpio_dev_priv *uc_priv;
+	struct sb_gpio_bank *gpio_bank;
+
+	/*
+	 * if get_pins_count has already been executed once on this
+	 * pin-controller, no need to run it again
+	 */
+	if (priv->pinctrl_ngpios)
+		return priv->pinctrl_ngpios;
+
+	if (list_empty(&priv->gpio_dev))
+		sb_populate_gpio_dev_list(dev);
+	/*
+	 * walk through all banks to retrieve the pin-controller
+	 * pins number
+	 */
+	list_for_each_entry(gpio_bank, &priv->gpio_dev, list) {
+		uc_priv = dev_get_uclass_priv(gpio_bank->gpio_dev);
+
+		priv->pinctrl_ngpios += uc_priv->gpio_count;
+	}
+
+	return priv->pinctrl_ngpios;
+}
+
+static struct udevice *sb_pinctrl_get_gpio_dev(struct udevice *dev,
+					       unsigned int selector,
+					       unsigned int *idx)
+{
+	struct sb_pinctrl_priv *priv = dev_get_priv(dev);
+	struct sb_gpio_bank *gpio_bank;
+	struct gpio_dev_priv *uc_priv;
+	int pin_count = 0;
+
+	if (list_empty(&priv->gpio_dev))
+		sb_populate_gpio_dev_list(dev);
+
+	/* look up for the bank which owns the requested pin */
+	list_for_each_entry(gpio_bank, &priv->gpio_dev, list) {
+		uc_priv = dev_get_uclass_priv(gpio_bank->gpio_dev);
+
+		if (selector < (pin_count + uc_priv->gpio_count)) {
+			/*
+			 * we found the bank, convert pin selector to
+			 * gpio bank index
+			 */
+			*idx = selector - pin_count;
+
+			return gpio_bank->gpio_dev;
+		}
+		pin_count += uc_priv->gpio_count;
+	}
+
+	return NULL;
+}
+
+static const char *sb_pinctrl_get_pin_name(struct udevice *dev,
+					   unsigned int selector)
+{
+	struct gpio_dev_priv *uc_priv;
+	struct udevice *gpio_dev;
+	unsigned int gpio_idx;
+	static char pin_name[PINNAME_SIZE];
+
+	/* look up for the bank which owns the requested pin */
+	gpio_dev = sb_pinctrl_get_gpio_dev(dev, selector, &gpio_idx);
+	if (!gpio_dev) {
+		snprintf(pin_name, PINNAME_SIZE, "Error");
+	} else {
+		uc_priv = dev_get_uclass_priv(gpio_dev);
+
+		snprintf(pin_name, PINNAME_SIZE, "%s%d",
+			 uc_priv->bank_name,
+			 gpio_idx);
+	}
+
+	return pin_name;
+}
+
+static int sb_pinctrl_get_pin_muxing(struct udevice *dev,
+				     unsigned int selector,
+				     char *buf, int size)
+{
+	struct udevice *gpio_dev;
+	unsigned int gpio_idx;
+	u8 config;
+	int function;
+
+	/* look up for the bank which owns the requested pin */
+	gpio_dev = sb_pinctrl_get_gpio_dev(dev, selector, &gpio_idx);
+	if (!gpio_dev) {
+		snprintf(buf, size, "Error");
+	} else {
+		function = sb_gpio_get_function(gpio_dev, gpio_idx);
+		config = *get_sb_gpio_configs(gpio_dev, gpio_idx);
+
+		snprintf(buf, size, "gpio %s %s",
+			 function == GPIOF_OUTPUT ? "output" : "input",
+			 gpio_config[config]);
+	}
+
+	return 0;
+}
+
+static int sandbox_pinctrl_probe(struct udevice *dev)
+{
+	struct sb_pinctrl_priv *priv = dev_get_priv(dev);
+
+	INIT_LIST_HEAD(&priv->gpio_dev);
+
+	return 0;
+}
+
+static struct pinctrl_ops sandbox_pinctrl_gpio_ops = {
+	.get_pin_name		= sb_pinctrl_get_pin_name,
+	.get_pins_count		= sb_pinctrl_get_pins_count,
+	.get_pin_muxing		= sb_pinctrl_get_pin_muxing,
+};
+
+static const struct udevice_id sandbox_pinctrl_gpio_match[] = {
+	{ .compatible = "sandbox,pinctrl-gpio" },
+	{ /* sentinel */ }
+};
+
+U_BOOT_DRIVER(sandbox_pinctrl_gpio) = {
+	.name = "sandbox_pinctrl_gpio",
+	.id = UCLASS_PINCTRL,
+	.of_match = sandbox_pinctrl_gpio_match,
+	.ops = &sandbox_pinctrl_gpio_ops,
+	.bind = dm_scan_fdt_dev,
+	.probe = sandbox_pinctrl_probe,
+	.priv_auto_alloc_size	= sizeof(struct sb_pinctrl_priv),
+};
diff --git a/test/py/tests/test_pinmux.py b/test/py/tests/test_pinmux.py
index 5ca0b4b630..f6e6093bbf 100644
--- a/test/py/tests/test_pinmux.py
+++ b/test/py/tests/test_pinmux.py
@@ -22,6 +22,12 @@ def test_pinmux_usage_2(u_boot_console):
 def test_pinmux_status_all(u_boot_console):
     """Test that 'pinmux status -a' displays pin's muxing."""
     output = u_boot_console.run_command('pinmux status -a')
+
+    assert ('pinctrl-gpio:' in output)
+    assert ('a5        : gpio output drive-pull-push' in output)
+    assert ('a6        : gpio output drive-pull-push' in output)
+
+    assert ('pinctrl:' in output)
     assert ('SCL       : I2C SCL.' in output)
     assert ('SDA       : I2C SDA.' in output)
     assert ('TX        : Uart TX.' in output)
@@ -63,6 +69,10 @@ def test_pinmux_status(u_boot_console):
     """Test that 'pinmux status' displays selected pincontroller's pin
     muxing descriptions."""
     output = u_boot_console.run_command('pinmux status')
+
+    assert (not 'pinctrl-gpio:' in output)
+    assert (not 'pinctrl:' in output)
+
     assert ('SCL       : I2C SCL.' in output)
     assert ('SDA       : I2C SDA.' in output)
     assert ('TX        : Uart TX.' in output)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
