Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1324E8D3
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:22:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69EB0C9FE9D
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:22:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18364C9FE98
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:22:13 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDGxCC004156; Fri, 21 Jun 2019 15:22:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=wD96yHuTndxqarY8s2d5QF03dbrFO/hbnpdDOANVSlU=;
 b=fPoV413tCIF4V1I700YP59ZRBbJ+xWHSfOa99vY3bFau6LaPIqysNBk4rYJvItpsDoxz
 WLv30bJXLV8z+MRK4nQFeKYJQS3vMet1spRFWCZyKxEQyb7q+Pt2wCv9KK+xh5W1WUva
 fyzs8cAiq71LGFhGB9ngqTE9I5XjiVWmuuNujFCl6Q5EhBm2k7F+9xJPniglZuTCO0uk
 jt9ZBDE/ENv0JzxC3Y3IOclj4VoeWTa0sB6YVJbBEARyI55JnNQsEX3DiahopydP+4Ho
 tiye9XgtCQHoHYARydBOXvVZH8KF5SBTHp+WifWj70CxsD3oipWjjpbZpETY3eiYsSbM 2A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t781v7nqs-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:22:12 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CE5AE34;
 Fri, 21 Jun 2019 13:22:11 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B5B122A2E;
 Fri, 21 Jun 2019 13:22:11 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun
 2019 15:22:11 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun 2019 15:22:11
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:21:43 +0200
Message-ID: <1561123314-709-6-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561123314-709-1-git-send-email-patrick.delaunay@st.com>
References: <1561123314-709-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 05/16] dt-bindings: pinctrl: stm32: add new
	entry for package information
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

Add "st,package" entry. Possibles values are:
-STM32MP_PKG_AA for LFBGA448 (18*18) package
-STM32MP_PKG_AB for LFBGA354 (16*16) package
-STM32MP_PKG_AC for TFBGA361 (12*12) package
-STM32MP_PKG_AD for TFBGA257 (10*10) package

see Linux commit 966d9b928f626a54a0c27c0fdae1e3dfe9bab416
for v5.2-rc1

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 .../pinctrl/st,stm32-pinctrl.txt                   | 101 ++++++++++++++++++---
 include/dt-bindings/pinctrl/stm32-pinfunc.h        |   6 ++
 2 files changed, 94 insertions(+), 13 deletions(-)

diff --git a/doc/device-tree-bindings/pinctrl/st,stm32-pinctrl.txt b/doc/device-tree-bindings/pinctrl/st,stm32-pinctrl.txt
index c41ae91..0016925 100644
--- a/doc/device-tree-bindings/pinctrl/st,stm32-pinctrl.txt
+++ b/doc/device-tree-bindings/pinctrl/st,stm32-pinctrl.txt
@@ -8,8 +8,13 @@ controllers onto these pads.
 Pin controller node:
 Required properies:
  - compatible: value should be one of the following:
-   (a) "st,stm32f429-pinctrl"
-   (b) "st,stm32f746-pinctrl"
+   "st,stm32f429-pinctrl"
+   "st,stm32f469-pinctrl"
+   "st,stm32f746-pinctrl"
+   "st,stm32f769-pinctrl"
+   "st,stm32h743-pinctrl"
+   "st,stm32mp157-pinctrl"
+   "st,stm32mp157-z-pinctrl"
  - #address-cells: The value of this property must be 1
  - #size-cells	: The value of this property must be 1
  - ranges	: defines mapping between pin controller node (parent) to
@@ -32,13 +37,30 @@ Required properties:
 
 Optional properties:
  - reset:	  : Reference to the reset controller
- - interrupt-parent: phandle of the interrupt parent to which the external
-   GPIO interrupts are forwarded to.
- - st,syscfg: Should be phandle/offset pair. The phandle to the syscon node
-   which includes IRQ mux selection register, and the offset of the IRQ mux
-   selection register.
+ - st,syscfg: Should be phandle/offset/mask.
+	-The phandle to the syscon node which includes IRQ mux selection register.
+	-The offset of the IRQ mux selection register
+	-The field mask of IRQ mux, needed if different of 0xf.
+ - gpio-ranges: Define a dedicated mapping between a pin-controller and
+   a gpio controller. Format is <&phandle a b c> with:
+	-(phandle): phandle of pin-controller.
+	-(a): gpio base offset in range.
+	-(b): pin base offset in range.
+	-(c): gpio count in range
+   This entry has to be used either if there are holes inside a bank:
+	GPIOB0/B1/B2/B14/B15 (see example 2)
+   or if banks are not contiguous:
+	GPIOA/B/C/E...
+   NOTE: If "gpio-ranges" is used for a gpio controller, all gpio-controller
+   have to use a "gpio-ranges" entry.
+   More details in Documentation/devicetree/bindings/gpio/gpio.txt.
+ - st,bank-ioport: should correspond to the EXTI IOport selection (EXTI line
+   used to select GPIOs as interrupts).
+ - hwlocks: reference to a phandle of a hardware spinlock provider node.
+ - st,package: Indicates the SOC package used.
+   More details in include/dt-bindings/pinctrl/stm32-pinfunc.h
 
-Example:
+Example 1:
 #include <dt-bindings/pinctrl/stm32f429-pinfunc.h>
 ...
 
@@ -60,6 +82,43 @@ Example:
 		pin-functions nodes follow...
 	};
 
+Example 2:
+#include <dt-bindings/pinctrl/stm32f429-pinfunc.h>
+...
+
+	pinctrl: pin-controller {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "st,stm32f429-pinctrl";
+		ranges = <0 0x40020000 0x3000>;
+		pins-are-numbered;
+
+		gpioa: gpio@40020000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x0 0x400>;
+			resets = <&reset_ahb1 0>;
+			st,bank-name = "GPIOA";
+			gpio-ranges = <&pinctrl 0 0 16>;
+		};
+
+		gpiob: gpio@40020400 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x0 0x400>;
+			resets = <&reset_ahb1 0>;
+			st,bank-name = "GPIOB";
+			ngpios = 4;
+			gpio-ranges = <&pinctrl 0 16 3>,
+				      <&pinctrl 14 30 2>;
+		};
+
+
+		...
+		pin-functions nodes follow...
+	};
+
+
 Contents of function subnode node:
 ----------------------------------
 Subnode format
@@ -83,14 +142,31 @@ Required properties:
     - port: The gpio port index (PA = 0, PB = 1, ..., PK = 11)
     - line: The line offset within the port (PA0 = 0, PA1 = 1, ..., PA15 = 15)
     - function: The function number, can be:
-      * 0 : GPIO IN
+      * 0 : GPIO
       * 1 : Alternate Function 0
       * 2 : Alternate Function 1
       * 3 : Alternate Function 2
       * ...
       * 16 : Alternate Function 15
       * 17 : Analog
-      * 18 : GPIO OUT
+
+  To simplify the usage, macro is available to generate "pinmux" field.
+  This macro is available here:
+    - include/dt-bindings/pinctrl/stm32-pinfunc.h
+
+  Some examples of using macro:
+    /* GPIO A9 set as alernate function 2 */
+    ... {
+		pinmux = <STM32_PINMUX('A', 9, AF2)>;
+    };
+    /* GPIO A9 set as GPIO  */
+    ... {
+		pinmux = <STM32_PINMUX('A', 9, GPIO)>;
+    };
+    /* GPIO A9 set as analog */
+    ... {
+		pinmux = <STM32_PINMUX('A', 9, ANALOG)>;
+    };
 
 Optional properties:
 - GENERIC_PINCONFIG: is the generic pinconfig options to use.
@@ -114,13 +190,13 @@ pin-controller {
 ...
 	usart1_pins_a: usart1@0 {
 		pins1 {
-			pinmux = <STM32F429_PA9_FUNC_USART1_TX>;
+			pinmux = <STM32_PINMUX('A', 9, AF7)>;
 			bias-disable;
 			drive-push-pull;
 			slew-rate = <0>;
 		};
 		pins2 {
-			pinmux = <STM32F429_PA10_FUNC_USART1_RX>;
+			pinmux = <STM32_PINMUX('A', 10, AF7)>;
 			bias-disable;
 		};
 	};
@@ -129,5 +205,4 @@ pin-controller {
 &usart1 {
 	pinctrl-0 = <&usart1_pins_a>;
 	pinctrl-names = "default";
-	status = "okay";
 };
diff --git a/include/dt-bindings/pinctrl/stm32-pinfunc.h b/include/dt-bindings/pinctrl/stm32-pinfunc.h
index b5a2174..e6fb8ad 100644
--- a/include/dt-bindings/pinctrl/stm32-pinfunc.h
+++ b/include/dt-bindings/pinctrl/stm32-pinfunc.h
@@ -32,5 +32,11 @@
 
 #define STM32_PINMUX(port, line, mode) (((PIN_NO(port, line)) << 8) | (mode))
 
+/*  package information */
+#define STM32MP_PKG_AA	0x1
+#define STM32MP_PKG_AB	0x2
+#define STM32MP_PKG_AC	0x4
+#define STM32MP_PKG_AD	0x8
+
 #endif /* _DT_BINDINGS_STM32_PINFUNC_H */
 
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
