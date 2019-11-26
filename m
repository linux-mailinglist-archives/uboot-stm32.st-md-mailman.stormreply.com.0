Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D8D109A7D
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 09:49:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2B67C36B0E
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 08:49:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55D10C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2019 08:49:27 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAQ8lHVm030849; Tue, 26 Nov 2019 09:49:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=qLDnIeZuJ1yaAktkE5jzhS5MiAIdVj3twqBhx5Ps550=;
 b=LU5TGY+TqtY6Q3hMJrSMwF7dBx+zdt6anLtKZ4gcUE7Yo6bUTFwmx45UUHI4MjUFvgtx
 8havjY93kGcIjTSX+cHLODfWjQ+BHLAspvLnIZd2ArjDV+/0pydxGTtYa0K84VIL+TIU
 inqR6gDYz47/AfHNrMKmrv9VYSpLYrzxcx3fjQjqrXB9UbuEwinvYwotI+EC/enYjr8r
 b1gH6gkCqSxfrfsl7tRJYRcH0q2TczZNEPuHV9dLz+4IMmXdNMpKMT93yNmBunqGEZds
 KCKq/7KWbiiDdfHQ0PS16JuOvaUi+Y+T17xDMvmi9A3oSWTmO1zn4YDdA/scxvUAS0sI PQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wets9p7w5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 09:49:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5950B10002A;
 Tue, 26 Nov 2019 09:49:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 442B32ACE5A;
 Tue, 26 Nov 2019 09:49:24 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 26 Nov 2019 09:49:23 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 26 Nov 2019 09:49:11 +0100
Message-ID: <20191126084911.19761-15-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191126084911.19761-1-patrick.delaunay@st.com>
References: <20191126084911.19761-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_01:2019-11-21,2019-11-26 signatures=0
Cc: Simon Glass <sjg@chromium.org>,
 Alex Marginean <alexandru.marginean@nxp.com>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 14/14] test: pinmux: add pincontrol-gpio
	for pin configuration
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
that allows to check pin configuration with the command pinmux.

The pmux test is also updated to test behavior with 2 pincontrols.

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
a5        : gpio output .
a6        : gpio output .
...

Serie-cc: Heiko Schocher <hs@denx.de>
Serie-cc: Simon Glass <sjg@chromium.org>

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

---

Changes in v2:
- Adapt sandbox_pinctrl_gpio driver with the saved dir_flags in
  sandbox gpio driver
- rebase on v2020.01-rc3

 arch/sandbox/dts/test.dts    |  48 +++++----
 drivers/gpio/sandbox.c       | 195 +++++++++++++++++++++++++++++++++++
 test/py/tests/test_pinmux.py |  10 ++
 3 files changed, 231 insertions(+), 22 deletions(-)

diff --git a/arch/sandbox/dts/test.dts b/arch/sandbox/dts/test.dts
index 8ab22c0c81..b69f0da871 100644
--- a/arch/sandbox/dts/test.dts
+++ b/arch/sandbox/dts/test.dts
@@ -288,28 +288,32 @@
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
index a9c470ee5e..bf6287f029 100644
--- a/drivers/gpio/sandbox.c
+++ b/drivers/gpio/sandbox.c
@@ -251,3 +251,198 @@ U_BOOT_DRIVER(gpio_sandbox) = {
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
+static char *get_dir_flags_string(ulong flags)
+{
+	if (flags & GPIOD_OPEN_DRAIN)
+		return "drive-open-drain";
+	if (flags & GPIOD_OPEN_SOURCE)
+		return "drive-open-source";
+	if (flags & GPIOD_PULL_UP)
+		return "bias-pull-up";
+	if (flags & GPIOD_PULL_DOWN)
+		return "bias-pull-down";
+	return ".";
+}
+
+static int sb_pinctrl_get_pin_muxing(struct udevice *dev,
+				     unsigned int selector,
+				     char *buf, int size)
+{
+	struct udevice *gpio_dev;
+	unsigned int gpio_idx;
+	ulong dir_flags;
+	int function;
+
+	/* look up for the bank which owns the requested pin */
+	gpio_dev = sb_pinctrl_get_gpio_dev(dev, selector, &gpio_idx);
+	if (!gpio_dev) {
+		snprintf(buf, size, "Error");
+	} else {
+		function = sb_gpio_get_function(gpio_dev, gpio_idx);
+		dir_flags = *get_gpio_dir_flags(gpio_dev, gpio_idx);
+
+		snprintf(buf, size, "gpio %s %s",
+			 function == GPIOF_OUTPUT ? "output" : "input",
+			 get_dir_flags_string(dir_flags));
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
index 5ca0b4b630..4e6df992a4 100644
--- a/test/py/tests/test_pinmux.py
+++ b/test/py/tests/test_pinmux.py
@@ -22,6 +22,12 @@ def test_pinmux_usage_2(u_boot_console):
 def test_pinmux_status_all(u_boot_console):
     """Test that 'pinmux status -a' displays pin's muxing."""
     output = u_boot_console.run_command('pinmux status -a')
+
+    assert ('pinctrl-gpio:' in output)
+    assert ('a5        : gpio output .' in output)
+    assert ('a6        : gpio output .' in output)
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
