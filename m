Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D8EE221
	for <lists+uboot-stm32@lfdr.de>; Mon, 29 Apr 2019 14:21:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 959AEC35E08
	for <lists+uboot-stm32@lfdr.de>; Mon, 29 Apr 2019 12:21:22 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0A1AC35E04
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2019 12:04:20 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id y13so5199159pfm.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2019 05:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=quigfaqe6tHIIcYc+9Cvv7X52eNSI2p5o4Zo7al3hcg=;
 b=DKA2DBC+HyvR3zSaMgE3wicTHUb2yphqYikdNQTEFEJod6xrG4cxqHdegoTYnp7F8s
 ipFm8zb/h7b+nZAk2eyxEujHTEQeyt+IW3/sCsZj6YgGBoH449CybiJkp9TfQ4neJBGL
 3VYnB8iRQF3jroVbV9EsyuYTX6WaV1r0yTpLez6NZenSQ1V8bUXLD9KRUWq9vN7ybhU1
 NW+1K6LGmSHDxm4MxftZrScQVd1MnrCMhoVZPp/iqu7Jm65KT8CzhlSoaOBSvn8NIWio
 ontWbCBnijgp60b8aUzX5WBEMBpJgA8OpbcvEdOA+ZJNrfTx6Oii+305AfTD8iEsnQP9
 MVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=quigfaqe6tHIIcYc+9Cvv7X52eNSI2p5o4Zo7al3hcg=;
 b=AqckvIro2jySkH+Ey5JADZO1YeA1QrXdBi6a4jDtzZNfNsitU/u2mFR2a7dpBQ6TCR
 d4eQNf69nsDvsc3/GC5+ALOc+2/47anlaqpcp4oJ/B+lH2ZBDfyWRr3lRenhet3WbDZI
 YuYwZV/Z1MM0EjrCoUrGCT3p10V9hL9zFxF6khpfsMA/fHZCRjMz1s9EgFT9XIfio4n0
 1g5IgJiTEVNwlxThD5271xg6xZNauCD06ztvN6CV5zJr7SKQnzMo5cq4BX5mR5DMR4A0
 cZBGocapWBkbXXbLrRYGla17WS//K/Z5kgeuN9Gxot6V0fwUZGX3aSqsV0bQm2E+hXum
 Y6DQ==
X-Gm-Message-State: APjAAAVxZPeiVCSPoR9dJpR2IbOrrvg91ljfz42aJmcRGXiES4bbvvDf
 Q/Th1Axm+rFLWUy0IuDTfBBl
X-Google-Smtp-Source: APXvYqyMScm1HzurYLcQqna3bX8yibD+shsaECP839z9m+zZ0DcYjqV0Jlh7+1Q0u1VYb0wbXyjLkg==
X-Received: by 2002:a62:70c6:: with SMTP id
 l189mr62776090pfc.139.1556539459432; 
 Mon, 29 Apr 2019 05:04:19 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:7241:e9f8:e0e7:64d9:38a4:57a4])
 by smtp.gmail.com with ESMTPSA id u66sm3098277pfb.76.2019.04.29.05.04.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Apr 2019 05:04:18 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: patrick.delaunay@st.com, christophe.kerello@st.com, patrice.chotard@st.com,
 trini@konsulko.com
Date: Mon, 29 Apr 2019 17:33:57 +0530
Message-Id: <20190429120359.23332-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190429120359.23332-1-manivannan.sadhasivam@linaro.org>
References: <20190429120359.23332-1-manivannan.sadhasivam@linaro.org>
X-Mailman-Approved-At: Mon, 29 Apr 2019 12:21:21 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [Uboot-stm32] [PATCH 1/3] arm: dts: stm32mp157: Add missing pinctrl
	definitions
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
