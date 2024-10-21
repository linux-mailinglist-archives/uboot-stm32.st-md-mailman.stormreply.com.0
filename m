Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E3B9A907D
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Oct 2024 22:00:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1AA8C78012;
	Mon, 21 Oct 2024 20:00:54 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B339C6C855
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 20:00:47 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7A14488D97;
 Mon, 21 Oct 2024 22:00:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1729540846;
 bh=ZJGpKdrQ4MMzy72B9MvrsgA+HNrWhuQw8MDzqBB2hIE=;
 h=From:To:Cc:Subject:Date:From;
 b=Kn89l0AJlc7XFBteNzV2gCAE7CegYBUSnJycgflxqgZQkgC1zChjXuRAMcUQS/IZH
 AMJxbPLm55HhMMzIJ5fcRNYKGkKF5KIguYEOpWpWEDLjqbLZxpdND4ATfxlBJMYl18
 X1EElQRZJzweoO0jgH/rz5RFb7ohkDjXMYvh5fAz4SrHOLouANCTuvjOBLo3DHZpeW
 hsc1LQmWC+2itoLwLxsCs//8PX9oYz8lAyOhnPoSfNAd9vWYRBhMZPtne38Ad8cv/z
 1JMGdPs787IS1xHXMqtrXUQQJsRYytCT5sImiuxqU0oJb5SwLabiEzTvGEOixjPKLx
 S4WxWTarrCY1g==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Mon, 21 Oct 2024 22:00:21 +0200
Message-ID: <20241021200034.204305-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32: Sort DH STM32 DHCOM DTSI
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

Sort the DTSI alphabetically. No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi | 50 +++++++++++-----------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
index 0d9b2201e90..4c334e4cd7a 100644
--- a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
@@ -12,6 +12,7 @@
 
 / {
 	aliases {
+		eeprom0 = &eeprom0;
 		i2c1 = &i2c2;
 		i2c3 = &i2c4;
 		i2c4 = &i2c5;
@@ -19,15 +20,14 @@
 		mmc1 = &sdmmc2;
 		spi0 = &qspi;
 		usb0 = &usbotg_hs;
-		eeprom0 = &eeprom0;
 	};
 
 	config {
-		u-boot,boot-led = "heartbeat";
-		u-boot,error-led = "error";
-		dh,som-coding-gpios = <&gpiof 12 0>, <&gpiof 13 0>, <&gpiof 15 0>;
 		dh,ddr3-coding-gpios = <&gpioz 6 0>, <&gpioz 7 0>;
 		dh,mac-coding-gpios = <&gpioc 3 0>;
+		dh,som-coding-gpios = <&gpiof 12 0>, <&gpiof 13 0>, <&gpiof 15 0>;
+		u-boot,boot-led = "heartbeat";
+		u-boot,error-led = "error";
 	};
 };
 
@@ -51,19 +51,6 @@
 	};
 };
 
-&phy0 {
-	/delete-property/ reset-gpios;
-};
-
-&pmic {
-	bootph-all;
-	bootph-pre-ram;
-
-	regulators {
-		bootph-pre-ram;
-	};
-};
-
 &flash0 {
 	bootph-pre-ram;
 
@@ -95,6 +82,19 @@
 	};
 };
 
+&phy0 {
+	/delete-property/ reset-gpios;
+};
+
+&pmic {
+	bootph-all;
+	bootph-pre-ram;
+
+	regulators {
+		bootph-pre-ram;
+	};
+};
+
 &qspi {
 	bootph-pre-ram;
 };
@@ -241,6 +241,14 @@
 	};
 };
 
+&reg11 {
+	bootph-pre-ram;
+};
+
+&reg18 {
+	bootph-pre-ram;
+};
+
 &sdmmc1 {
 	bootph-pre-ram;
 	st,use-ckin;
@@ -303,14 +311,6 @@
 	};
 };
 
-&reg11 {
-	bootph-pre-ram;
-};
-
-&reg18 {
-	bootph-pre-ram;
-};
-
 &usb33 {
 	bootph-pre-ram;
 };
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
