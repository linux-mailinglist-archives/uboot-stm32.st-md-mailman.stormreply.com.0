Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 249851149F
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 May 2019 09:57:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4702C06B9A
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 May 2019 07:57:04 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4080FC06B99
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2019 07:57:03 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id v80so737949pfa.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 May 2019 00:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=quigfaqe6tHIIcYc+9Cvv7X52eNSI2p5o4Zo7al3hcg=;
 b=Yz2aO27Cs0TjbTqbbDTRZ2QGT3qUziprI5Syhrt+UWMjiaWRUPCovvcDAHdBFYJA2T
 +kmVPmq9ESW+E/QTQlFspLya0h15Q4vU3+xyjE713Cd8+1qy667vm+laEaTeHhvXuzHc
 CgaNLNJgpVFc/NTpXhX0LWCQ2B34MG2NJzbvrPhPgw9uTPMwCpKPE7espZfLLzfqIEb9
 t0kpH3vdBxhwpUBYgY8TUcCBkFO1Ao2noyF8EABMvqwIopLXISeZG7KO4C6rEiRnSmTx
 gulapzrKIsWItxvM0QYaMQUoxwbLWmKVxvB/6T2jCIYWp1mdXgOv6ywO1LccS9QsiVl9
 007A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=quigfaqe6tHIIcYc+9Cvv7X52eNSI2p5o4Zo7al3hcg=;
 b=HnIeYQVUtdbWadCWjsrtlmfmRTzn5LJ5jZ2b61I1DsH9RjGoe5Qz539ShZ/vnxBu+m
 yN0CMwXUDUVqttgMVOpDrLRu04e9VWlHl47Hv1RsATkJQmy2NIAynRXklOFb5u9bv68A
 vTmXwERtYJxX8Kzh7lvMmXHIxmov1K95yvuZ8HFk4tTbvuFpGBbt9NjzNG0HhUu8Mom5
 Pr7f9r5BBDyUsRHHwlaBZpzOWvM0uoXxtT5j5LncP/vA4P0rWVFCYwJQkWgY5PFqMwHu
 wGyuH+e7sLiRNxbXgZ6+pxRmds6Utjxv6BjvTRlWCI0FgBdRXcYsm4EOXPnyQQFVs1nd
 p/5Q==
X-Gm-Message-State: APjAAAVXjj+Y7HLuVyk6BLWIM1bwI7FLg2u4HqWQ1YXEKfO1c8WnRntC
 jsebHdk568IqPcUWqr8DBGxX
X-Google-Smtp-Source: APXvYqy8Pl97mu/WoYPan2OkpgEzg1LZ1W9P14XffGt58jzgZq+9syF4psriq9vO+EjQxsdGLBuPTg==
X-Received: by 2002:a63:6b49:: with SMTP id g70mr2607617pgc.340.1556783821752; 
 Thu, 02 May 2019 00:57:01 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4072:6284:a261:31df:f367:f70b:ed86])
 by smtp.gmail.com with ESMTPSA id n18sm63780910pfi.48.2019.05.02.00.56.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 00:57:00 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: patrick.delaunay@st.com, christophe.kerello@st.com, patrice.chotard@st.com,
 trini@konsulko.com
Date: Thu,  2 May 2019 13:26:43 +0530
Message-Id: <20190502075645.19901-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190502075645.19901-1-manivannan.sadhasivam@linaro.org>
References: <20190502075645.19901-1-manivannan.sadhasivam@linaro.org>
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [Uboot-stm32] [PATCH v2 1/3] arm: dts: stm32mp157: Add missing
	pinctrl definitions
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Add missing pinctrl definitions for STM32MP157.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/dts/stm32mp157-pinctrl.dtsi | 63 ++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm/dts/stm32mp157-pinctrl.dtsi b/arch/arm/dts/stm32mp157-pinctrl.dtsi
index 0aae69b0a04..200d2c00c5f 100644
--- a/arch/arm/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp157-pinctrl.dtsi
@@ -220,6 +220,16 @@
 				};
 			};
 
+			i2c1_pins_b: i2c1-1 {
+				pins {
+					pinmux = <STM32_PINMUX('F', 14, AF5)>, /* I2C1_SCL */
+						 <STM32_PINMUX('F', 15, AF5)>; /* I2C1_SDA */
+					bias-disable;
+					drive-open-drain;
+					slew-rate = <0>;
+				};
+			};
+
 			i2c2_pins_a: i2c2-0 {
 				pins {
 					pinmux = <STM32_PINMUX('H', 4, AF4)>, /* I2C2_SCL */
@@ -230,6 +240,16 @@
 				};
 			};
 
+			i2c2_pins_b: i2c2-1 {
+				pins {
+					pinmux = <STM32_PINMUX('Z', 0, AF3)>, /* I2C2_SCL */
+						 <STM32_PINMUX('H', 5, AF4)>; /* I2C2_SDA */
+					bias-disable;
+					drive-open-drain;
+					slew-rate = <0>;
+				};
+			};
+
 			i2c5_pins_a: i2c5-0 {
 				pins {
 					pinmux = <STM32_PINMUX('A', 11, AF4)>, /* I2C5_SCL */
@@ -375,6 +395,21 @@
 				};
 			};
 
+			spi2_pins_a: spi2-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('B', 10, AF5)>, /* SPI2_SCK */
+						 <STM32_PINMUX('I', 0, AF5)>, /* SPI2_NSS */
+						 <STM32_PINMUX('I', 3, AF5)>; /* SPI2_MOSI */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <3>;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI2_MISO */
+					bias-disable;
+				};
+			};
+
 			stusb1600_pins_a: stusb1600-0 {
 				pins {
 					pinmux = <STM32_PINMUX('I', 11, ANALOG)>;
@@ -395,6 +430,34 @@
 				};
 			};
 
+			uart4_pins_b: uart4-1 {
+				pins1 {
+					pinmux = <STM32_PINMUX('D', 1, AF8)>; /* UART4_TX */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
+					bias-disable;
+				};
+			};
+
+			uart7_pins_a: uart7-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('E', 8, AF7)>; /* UART4_TX */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('E', 7, AF7)>, /* UART4_RX */
+						 <STM32_PINMUX('E', 10, AF7)>, /* UART4_CTS */
+						 <STM32_PINMUX('E', 9, AF7)>; /* UART4_RTS */
+					bias-disable;
+				};
+			};
+
 			usbotg_hs_pins_a: usbotg_hs-0 {
 				pins {
 					pinmux = <STM32_PINMUX('A', 10, ANALOG)>; /* OTG_ID */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
