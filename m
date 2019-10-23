Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6BCE1D23
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 15:45:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57914C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 13:45:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CFDCC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 13:45:10 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9NDgvlV013918; Wed, 23 Oct 2019 15:45:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=u4yO2yhZTlf5fMMXLgstvkYZtcq7N+GTtHtlhtctLKs=;
 b=TmSBa493/YagrqbjCqHw1pMZxqwbPoENXexE6geJ576cRAcrckJAjt+kw/fTv4GdZqK5
 ayUkBzHeGnytooqpa8Q5xw2nfmUzNjkB3Wc1tz8MwuDkzIB8LgVyb3ErlI+trmeB/cPp
 lOXL8CqOUB0zdglzSZC9SwuZCipu/7NDKucd43AH3w8SVOZMLe/SHXl0V+HnjahqO6Zp
 oHpL0Rh2mYr4j+Yn6STV/5R9UhNIs54EnMMHT7wZPauEr6cefghJ1zDt/Wvuqs5lFt+2
 3hRJrlbtD7nPym5aFLo3rqEHby/AhBf6VqWkBTLa6ajO08ijc8z+2epeaQOUiQQ5X6RW Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vt9s4uxe3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 15:45:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 67C5C10003E;
 Wed, 23 Oct 2019 15:45:04 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E42F2FF5FE;
 Wed, 23 Oct 2019 15:45:04 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct
 2019 15:45:04 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct 2019 15:45:04
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 23 Oct 2019 15:44:42 +0200
Message-ID: <20191023134448.20149-8-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023134448.20149-1-patrick.delaunay@st.com>
References: <20191023134448.20149-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_03:2019-10-23,2019-10-23 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 07/13] dt-bindings: gpio: alignment with
	kernel v5.3
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

Update the binding file for gpio, it is just an alignment
with kernel v5.3.
The U-Boot code example for gpio-hog (not directly linked
to binding) is moved in a new file doc/README.gpio.
[commit 21676b706e99 ("gpio: fixes for gpio-hog support")
& 'commit 4762a9988ede ("gpio: add gpio-hog support")']

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 doc/README.gpio                        |  42 ++++
 doc/device-tree-bindings/gpio/gpio.txt | 280 ++++++++++++++-----------
 2 files changed, 196 insertions(+), 126 deletions(-)
 create mode 100644 doc/README.gpio

diff --git a/doc/README.gpio b/doc/README.gpio
new file mode 100644
index 0000000000..548ff37b8c
--- /dev/null
+++ b/doc/README.gpio
@@ -0,0 +1,42 @@
+
+GPIO hog (CONFIG_GPIO_HOG)
+--------
+
+All the GPIO hog are initialized in gpio_hog_probe_all() function called in
+board_r.c just before board_late_init() but you can also acces directly to
+the gpio with gpio_hog_lookup_name().
+
+
+Example, for the device tree:
+
+        tca6416@20 {
+                compatible = "ti,tca6416";
+                reg = <0x20>;
+                #gpio-cells = <2>;
+                gpio-controller;
+
+                env_reset {
+                        gpio-hog;
+                        input;
+                        gpios = <6 GPIO_ACTIVE_LOW>;
+                };
+                boot_rescue {
+                        gpio-hog;
+                        input;
+                        line-name = "foo-bar-gpio";
+                        gpios = <7 GPIO_ACTIVE_LOW>;
+                };
+        };
+
+You can than access the gpio in your board code with:
+
+	struct gpio_desc *desc;
+	int ret;
+
+	ret = gpio_hog_lookup_name("boot_rescue", &desc);
+	if (ret)
+		return;
+	if (dm_gpio_get_value(desc) == 1)
+		printf("\nBooting into Rescue System\n");
+	else if (dm_gpio_get_value(desc) == 0)
+		printf("\nBoot normal\n");
diff --git a/doc/device-tree-bindings/gpio/gpio.txt b/doc/device-tree-bindings/gpio/gpio.txt
index e9ef0212af..1481ed607d 100644
--- a/doc/device-tree-bindings/gpio/gpio.txt
+++ b/doc/device-tree-bindings/gpio/gpio.txt
@@ -4,19 +4,12 @@ Specifying GPIO information for devices
 1) gpios property
 -----------------
 
-Nodes that makes use of GPIOs should specify them using one or more
-properties, each containing a 'gpio-list':
-
-	gpio-list ::= <single-gpio> [gpio-list]
-	single-gpio ::= <gpio-phandle> <gpio-specifier>
-	gpio-phandle : phandle to gpio controller node
-	gpio-specifier : Array of #gpio-cells specifying specific gpio
-			 (controller specific)
-
 GPIO properties should be named "[<name>-]gpios", with <name> being the purpose
 of this GPIO for the device. While a non-existent <name> is considered valid
 for compatibility reasons (resolving to the "gpios" property), it is not allowed
-for new bindings.
+for new bindings. Also, GPIO properties named "[<name>-]gpio" are valid and old
+bindings use it, but are only supported for compatibility reasons and should not
+be used for newer bindings since it has been deprecated.
 
 GPIO properties can contain one or more GPIO phandles, but only in exceptional
 cases should they contain more than one. If your device uses several GPIOs with
@@ -31,30 +24,28 @@ The following example could be used to describe GPIO pins used as device enable
 and bit-banged data signals:
 
 	gpio1: gpio1 {
-		gpio-controller
-		 #gpio-cells = <2>;
-	};
-	gpio2: gpio2 {
-		gpio-controller
-		 #gpio-cells = <1>;
+		gpio-controller;
+		#gpio-cells = <2>;
 	};
 	[...]
 
-	enable-gpios = <&gpio2 2>;
 	data-gpios = <&gpio1 12 0>,
 		     <&gpio1 13 0>,
 		     <&gpio1 14 0>,
 		     <&gpio1 15 0>;
 
-Note that gpio-specifier length is controller dependent.  In the
-above example, &gpio1 uses 2 cells to specify a gpio, while &gpio2
-only uses one.
+In the above example, &gpio1 uses 2 cells to specify a gpio. The first cell is
+a local offset to the GPIO line and the second cell represent consumer flags,
+such as if the consumer desire the line to be active low (inverted) or open
+drain. This is the recommended practice.
 
-gpio-specifier may encode: bank, pin position inside the bank,
-whether pin is open-drain and whether pin is logically inverted.
-Exact meaning of each specifier cell is controller specific, and must
-be documented in the device tree binding for the device. Use the macros
-defined in include/dt-bindings/gpio/gpio.h whenever possible:
+The exact meaning of each specifier cell is controller specific, and must be
+documented in the device tree binding for the device, but it is strongly
+recommended to use the two-cell approach.
+
+Most controllers are specifying a generic flag bitfield in the last cell, so
+for these, use the macros defined in
+include/dt-bindings/gpio/gpio.h whenever possible:
 
 Example of a node using GPIOs:
 
@@ -140,6 +131,80 @@ Every GPIO controller node must contain both an empty "gpio-controller"
 property, and a #gpio-cells integer property, which indicates the number of
 cells in a gpio-specifier.
 
+Some system-on-chips (SoCs) use the concept of GPIO banks. A GPIO bank is an
+instance of a hardware IP core on a silicon die, usually exposed to the
+programmer as a coherent range of I/O addresses. Usually each such bank is
+exposed in the device tree as an individual gpio-controller node, reflecting
+the fact that the hardware was synthesized by reusing the same IP block a
+few times over.
+
+Optionally, a GPIO controller may have a "ngpios" property. This property
+indicates the number of in-use slots of available slots for GPIOs. The
+typical example is something like this: the hardware register is 32 bits
+wide, but only 18 of the bits have a physical counterpart. The driver is
+generally written so that all 32 bits can be used, but the IP block is reused
+in a lot of designs, some using all 32 bits, some using 18 and some using
+12. In this case, setting "ngpios = <18>;" informs the driver that only the
+first 18 GPIOs, at local offset 0 .. 17, are in use.
+
+If these GPIOs do not happen to be the first N GPIOs at offset 0...N-1, an
+additional set of tuples is needed to specify which GPIOs are unusable, with
+the gpio-reserved-ranges binding. This property indicates the start and size
+of the GPIOs that can't be used.
+
+Optionally, a GPIO controller may have a "gpio-line-names" property. This is
+an array of strings defining the names of the GPIO lines going out of the
+GPIO controller. This name should be the most meaningful producer name
+for the system, such as a rail name indicating the usage. Package names
+such as pin name are discouraged: such lines have opaque names (since they
+are by definition generic purpose) and such names are usually not very
+helpful. For example "MMC-CD", "Red LED Vdd" and "ethernet reset" are
+reasonable line names as they describe what the line is used for. "GPIO0"
+is not a good name to give to a GPIO line. Placeholders are discouraged:
+rather use the "" (blank string) if the use of the GPIO line is undefined
+in your design. The names are assigned starting from line offset 0 from
+left to right from the passed array. An incomplete array (where the number
+of passed named are less than ngpios) will still be used up until the last
+provided valid line index.
+
+Example:
+
+gpio-controller@00000000 {
+	compatible = "foo";
+	reg = <0x00000000 0x1000>;
+	gpio-controller;
+	#gpio-cells = <2>;
+	ngpios = <18>;
+	gpio-reserved-ranges = <0 4>, <12 2>;
+	gpio-line-names = "MMC-CD", "MMC-WP", "VDD eth", "RST eth", "LED R",
+		"LED G", "LED B", "Col A", "Col B", "Col C", "Col D",
+		"Row A", "Row B", "Row C", "Row D", "NMI button",
+		"poweroff", "reset";
+}
+
+The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
+providing automatic GPIO request and configuration as part of the
+gpio-controller's driver probe function.
+
+Each GPIO hog definition is represented as a child node of the GPIO controller.
+Required properties:
+- gpio-hog:   A property specifying that this child node represents a GPIO hog.
+- gpios:      Store the GPIO information (id, flags, ...) for each GPIO to
+	      affect. Shall contain an integer multiple of the number of cells
+	      specified in its parent node (GPIO controller node).
+Only one of the following properties scanned in the order shown below.
+This means that when multiple properties are present they will be searched
+in the order presented below and the first match is taken as the intended
+configuration.
+- input:      A property specifying to set the GPIO direction as input.
+- output-low  A property specifying to set the GPIO direction as output with
+	      the value low.
+- output-high A property specifying to set the GPIO direction as output with
+	      the value high.
+
+Optional properties:
+- line-name:  The GPIO label name. If not present the node name is used.
+
 Example of two SOC GPIO banks defined as gpio-controller nodes:
 
 	qe_pio_a: gpio-controller@1400 {
@@ -161,46 +226,40 @@ Example of two SOC GPIO banks defined as gpio-controller nodes:
 
 Some or all of the GPIOs provided by a GPIO controller may be routed to pins
 on the package via a pin controller. This allows muxing those pins between
-GPIO and other functions.
+GPIO and other functions. It is a fairly common practice among silicon
+engineers.
+
+2.2) Ordinary (numerical) GPIO ranges
+-------------------------------------
 
 It is useful to represent which GPIOs correspond to which pins on which pin
-controllers. The gpio-ranges property described below represents this, and
-contains information structures as follows:
-
-	gpio-range-list ::= <single-gpio-range> [gpio-range-list]
-	single-gpio-range ::= <numeric-gpio-range> | <named-gpio-range>
-	numeric-gpio-range ::=
-			<pinctrl-phandle> <gpio-base> <pinctrl-base> <count>
-	named-gpio-range ::= <pinctrl-phandle> <gpio-base> '<0 0>'
-	pinctrl-phandle : phandle to pin controller node
-	gpio-base : Base GPIO ID in the GPIO controller
-	pinctrl-base : Base pinctrl pin ID in the pin controller
-	count : The number of GPIOs/pins in this range
-
-The "pin controller node" mentioned above must conform to the bindings
-described in ../pinctrl/pinctrl-bindings.txt.
-
-In case named gpio ranges are used (ranges with both <pinctrl-base> and
-<count> set to 0), the property gpio-ranges-group-names contains one string
-for every single-gpio-range in gpio-ranges:
-	gpiorange-names-list ::= <gpiorange-name> [gpiorange-names-list]
-	gpiorange-name : Name of the pingroup associated to the GPIO range in
-			the respective pin controller.
-
-Elements of gpiorange-names-list corresponding to numeric ranges contain
-the empty string. Elements of gpiorange-names-list corresponding to named
-ranges contain the name of a pin group defined in the respective pin
-controller. The number of pins/GPIOs in the range is the number of pins in
-that pin group.
+controllers. The gpio-ranges property described below represents this with
+a discrete set of ranges mapping pins from the pin controller local number space
+to pins in the GPIO controller local number space.
 
-Previous versions of this binding required all pin controller nodes that
-were referenced by any gpio-ranges property to contain a property named
-#gpio-range-cells with value <3>. This requirement is now deprecated.
-However, that property may still exist in older device trees for
-compatibility reasons, and would still be required even in new device
-trees that need to be compatible with older software.
+The format is: <[pin controller phandle], [GPIO controller offset],
+                [pin controller offset], [number of pins]>;
+
+The GPIO controller offset pertains to the GPIO controller node containing the
+range definition.
+
+The pin controller node referenced by the phandle must conform to the bindings
+described in pinctrl/pinctrl-bindings.txt.
+
+Each offset runs from 0 to N. It is perfectly fine to pile any number of
+ranges with just one pin-to-GPIO line mapping if the ranges are concocted, but
+in practice these ranges are often lumped in discrete sets.
+
+Example:
 
-Example 1:
+    gpio-ranges = <&foo 0 20 10>, <&bar 10 50 20>;
+
+This means:
+- pins 20..29 on pin controller "foo" is mapped to GPIO line 0..9 and
+- pins 50..69 on pin controller "bar" is mapped to GPIO line 10..29
+
+
+Verbose example:
 
 	qe_pio_e: gpio-controller@1460 {
 		#gpio-cells = <2>;
@@ -211,12 +270,33 @@ Example 1:
 	};
 
 Here, a single GPIO controller has GPIOs 0..9 routed to pin controller
-pinctrl1's pins 20..29, and GPIOs 10..19 routed to pin controller pinctrl2's
-pins 50..59.
+pinctrl1's pins 20..29, and GPIOs 10..29 routed to pin controller pinctrl2's
+pins 50..69.
+
+
+2.3) GPIO ranges from named pin groups
+--------------------------------------
 
-Example 2:
+It is also possible to use pin groups for gpio ranges when pin groups are the
+easiest and most convenient mapping.
 
-	gpio_pio_i: gpio-controller@14B0 {
+Both both <pinctrl-base> and <count> must set to 0 when using named pin groups
+names.
+
+The property gpio-ranges-group-names must contain exactly one string for each
+range.
+
+Elements of gpio-ranges-group-names must contain the name of a pin group
+defined in the respective pin controller. The number of pins/GPIO lines in the
+range is the number of pins in that pin group. The number of pins of that
+group is defined int the implementation and not in the device tree.
+
+If numerical and named pin groups are mixed, the string corresponding to a
+numerical pin range in gpio-ranges-group-names must be empty.
+
+Example:
+
+	gpio_pio_i: gpio-controller@14b0 {
 		#gpio-cells = <2>;
 		compatible = "fsl,qe-pario-bank-e", "fsl,qe-pario-bank";
 		reg = <0x1480 0x18>;
@@ -231,66 +311,14 @@ Example 2:
 						"bar";
 	};
 
-Here, three GPIO ranges are defined wrt. two pin controllers. pinctrl1 GPIO
-ranges are defined using pin numbers whereas the GPIO ranges wrt. pinctrl2
-are named "foo" and "bar".
-
-3) GPIO hog definitions
------------------------
-
-The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
-providing automatic GPIO request and configuration as part of the
-gpio-controller's driver probe function.
-
-Each GPIO hog definition is represented as a child node of the GPIO controller.
-Required properties:
-- gpio-hog:   A property specifying that this child node represents a GPIO hog.
-- gpios:      Store the GPIO information (id, flags) for the GPIO to
-	      affect.
-
-              ! Not yet support more than one gpio !
+Here, three GPIO ranges are defined referring to two pin controllers.
 
-Only one of the following properties scanned in the order shown below.
-- input:      A property specifying to set the GPIO direction as input.
-- output-low  A property specifying to set the GPIO direction as output with
-	      the value low.
-- output-high A property specifying to set the GPIO direction as output with
-	      the value high.
+pinctrl1 GPIO ranges are defined using pin numbers whereas the GPIO ranges
+in pinctrl2 are defined using the pin groups named "foo" and "bar".
 
-Optional properties:
-- line-name:  The GPIO label name. If not present the node name is used.
-
-Example:
-
-        tca6416@20 {
-                compatible = "ti,tca6416";
-                reg = <0x20>;
-                #gpio-cells = <2>;
-                gpio-controller;
-
-                env_reset {
-                        gpio-hog;
-                        input;
-                        gpios = <6 GPIO_ACTIVE_LOW>;
-                };
-                boot_rescue {
-                        gpio-hog;
-                        input;
-                        line-name = "foo-bar-gpio";
-                        gpios = <7 GPIO_ACTIVE_LOW>;
-                };
-        };
-
-For the above Example you can than access the gpio in your boardcode
-with:
-
-	struct gpio_desc *desc;
-	int ret;
-
-	ret = gpio_hog_lookup_name("boot_rescue", &desc);
-	if (ret)
-		return;
-	if (dm_gpio_get_value(desc) == 1)
-		printf("\nBooting into Rescue System\n");
-	else if (dm_gpio_get_value(desc) == 0)
-		printf("\nBoot normal\n");
+Previous versions of this binding required all pin controller nodes that
+were referenced by any gpio-ranges property to contain a property named
+#gpio-range-cells with value <3>. This requirement is now deprecated.
+However, that property may still exist in older device trees for
+compatibility reasons, and would still be required even in new device
+trees that need to be compatible with older software.
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
