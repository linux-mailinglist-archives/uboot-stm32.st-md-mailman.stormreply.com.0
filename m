Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F123B109A7C
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 09:49:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC0DEC36B0C
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 08:49:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 144C1C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2019 08:49:26 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAQ8lHVk030849; Tue, 26 Nov 2019 09:49:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=RXBq2DotJM2XeTdwcF10KYP1kuy3zKBFcnoqgJhjUbI=;
 b=aj4ApBrYSdSXZquXLCdIEYGzF1YXqbt3PNJ66aaQ1+33zMSlxByP7czXIifjdLh15Q53
 +071GiKJFBX5eAycmvbGu7xryxwG1D8q4Z2QOtPGzQX+fV7askKPtdK0ygaxVngtJrNR
 yVamLbqZNmB8HAHhq4FO5Toxa0BboJ7bkTrfykGnNvwo+iA+EjFAXcP3eFOEBnwpovpc
 +bKHzwcBUxzdFUfBd93qQ/OpeTIfwurktuNBk+dJexQ3nkrvkK6CumAf56kArZk292Rg
 yUM6ueiUS6lPd3fdH7uF1IU0/7Ow9SEq64FSHiJ6e7tD8tYlzRrVk57/feqbCxv9nt0f dQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wets9p7w0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 09:49:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C9A4E10002A;
 Tue, 26 Nov 2019 09:49:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BA5662ACE59;
 Tue, 26 Nov 2019 09:49:22 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 26 Nov 2019 09:49:22 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 26 Nov 2019 09:49:09 +0100
Message-ID: <20191126084911.19761-13-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191126084911.19761-1-patrick.delaunay@st.com>
References: <20191126084911.19761-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_01:2019-11-21,2019-11-26 signatures=0
Cc: Simon Glass <sjg@chromium.org>,
 Alex Marginean <alexandru.marginean@nxp.com>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 12/14] gpio: sandbox: cleanup binding
	support
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

Cleanup binding support, use the generic binding by default
(test u-class gpio_xlate_offs_flags function) and add
specific binding for added value.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

Changes in v2: None

 arch/sandbox/dts/test.dts               | 14 ++++++++++----
 drivers/gpio/sandbox.c                  | 13 ++++++++-----
 include/dt-bindings/gpio/sandbox-gpio.h | 24 ++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 9 deletions(-)
 create mode 100644 include/dt-bindings/gpio/sandbox-gpio.h

diff --git a/arch/sandbox/dts/test.dts b/arch/sandbox/dts/test.dts
index b57f152fa3..df58a0b488 100644
--- a/arch/sandbox/dts/test.dts
+++ b/arch/sandbox/dts/test.dts
@@ -1,5 +1,8 @@
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/gpio/sandbox-gpio.h>
+
 / {
 	model = "sandbox";
 	compatible = "sandbox";
@@ -86,11 +89,14 @@
 		ping-expect = <0>;
 		ping-add = <0>;
 		u-boot,dm-pre-reloc;
-		test-gpios = <&gpio_a 1>, <&gpio_a 4>, <&gpio_b 5 0 3 2 1>,
+		test-gpios = <&gpio_a 1>, <&gpio_a 4>,
+			<&gpio_b 5 GPIO_ACTIVE_HIGH 3 2 1>,
 			<0>, <&gpio_a 12>;
-		test2-gpios = <&gpio_a 1>, <&gpio_a 4>, <&gpio_b 6 1 3 2 1>,
-			<&gpio_b 7 2 3 2 1>, <&gpio_b 8 4 3 2 1>,
-			<&gpio_b 9 0xc 3 2 1>;
+		test2-gpios = <&gpio_a 1>, <&gpio_a 4>,
+			<&gpio_b 6 GPIO_ACTIVE_LOW 3 2 1>,
+			<&gpio_b 7 GPIO_IN 3 2 1>,
+			<&gpio_b 8 GPIO_OUT 3 2 1>,
+			<&gpio_b 9 (GPIO_OUT|GPIO_OUT_ACTIVE) 3 2 1>;
 		int-value = <1234>;
 		uint-value = <(-1234)>;
 	};
diff --git a/drivers/gpio/sandbox.c b/drivers/gpio/sandbox.c
index 91e8e0677e..c2a8adc647 100644
--- a/drivers/gpio/sandbox.c
+++ b/drivers/gpio/sandbox.c
@@ -10,6 +10,7 @@
 #include <asm/gpio.h>
 #include <dm/of.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/gpio/sandbox-gpio.h>
 
 /* Flags for each GPIO */
 #define GPIOF_OUTPUT	(1 << 0)	/* Currently set as an output */
@@ -136,13 +137,15 @@ static int sb_gpio_xlate(struct udevice *dev, struct gpio_desc *desc,
 	desc->offset = args->args[0];
 	if (args->args_count < 2)
 		return 0;
-	if (args->args[1] & GPIO_ACTIVE_LOW)
-		desc->flags |= GPIOD_ACTIVE_LOW;
-	if (args->args[1] & 2)
+	/* treat generic binding with gpio uclass */
+	gpio_xlate_offs_flags(dev, desc, args);
+
+	/* sandbox test specific, not defined in gpio.h */
+	if (args->args[1] & GPIO_IN)
 		desc->flags |= GPIOD_IS_IN;
-	if (args->args[1] & 4)
+	if (args->args[1] & GPIO_OUT)
 		desc->flags |= GPIOD_IS_OUT;
-	if (args->args[1] & 8)
+	if (args->args[1] & GPIO_OUT_ACTIVE)
 		desc->flags |= GPIOD_IS_OUT_ACTIVE;
 
 	return 0;
diff --git a/include/dt-bindings/gpio/sandbox-gpio.h b/include/dt-bindings/gpio/sandbox-gpio.h
new file mode 100644
index 0000000000..e4bfdb3ce1
--- /dev/null
+++ b/include/dt-bindings/gpio/sandbox-gpio.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This header provides constants for binding sandbox,gpio
+ *
+ */
+#ifndef _DT_BINDINGS_GPIO_SANDBOX_GPIO_H
+#define _DT_BINDINGS_GPIO_SANDBOX_GPIO_H
+
+/*
+ * Add a specific binding for sandbox gpio.
+ * The value need to be after the generic defines of
+ * dt-bindings/gpio/gpio.h
+ */
+
+/* Bit 16 express GPIO input mode */
+#define GPIO_IN			0x10000
+
+/* Bit 17 express GPIO output mode */
+#define GPIO_OUT		0x20000
+
+/* Bit 18 express GPIO output is active */
+#define GPIO_OUT_ACTIVE		0x40000
+
+#endif
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
