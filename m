Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6B38AC211
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Apr 2024 01:19:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA784C7129A;
	Sun, 21 Apr 2024 23:19:13 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB27BC71293
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Apr 2024 23:19:12 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8A8AA88334;
 Mon, 22 Apr 2024 01:19:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713741551;
 bh=/orHB0b6JD2P2Id/oQtkXMIiitXNLIDePnz8w8X2EOg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I+IKisk3k88PLflUnsZBDcTRYJnkkL/auoT5XSHtcgkpcixwxQRwVZOv/JG3l53Gf
 MNDRZFZtce/dpQ7dItDfRKFvt7jfyBQamgaX5bpiYWrdVsrcFXG25+F2xNEOeQfixh
 z96hwtMcDm2vJv9+pb/jrASpHjH634XAEVKb3asHuIDuvCdDF6sDI7fVi+eH7ybpUJ
 fdbnbcbN8/h/8k8x9tVyWXD1L/aex2EMGxAL6lk/7Ij7lG1Xkn1HI6ajbyC02P0mRo
 8STZkMAJGffHwJOU70tbrScRNGz1rQpUZqlBh+MHxps3SIdOSZV/olaMLcBuxXdr3m
 wKp2Btwn5SK7A==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Mon, 22 Apr 2024 01:17:00 +0200
Message-ID: <20240421231849.194648-14-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240421231849.194648-1-marex@denx.de>
References: <20240421231849.194648-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: [Uboot-stm32] [PATCH 14/19] ARM: dts: stm32: Add alternate pinmux
	for MP13 SPI3 pins
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

Add another mux option for SPI3 pins, this is used on
DH electronics STM32MP13xx DHCOR DHSBC board.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: u-boot@dh-electronics.com
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/dts/stm32mp13-pinctrl.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/dts/stm32mp13-pinctrl.dtsi b/arch/arm/dts/stm32mp13-pinctrl.dtsi
index 17acd2850d3..7abd227e69f 100644
--- a/arch/arm/dts/stm32mp13-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp13-pinctrl.dtsi
@@ -534,6 +534,29 @@
 		};
 	};
 
+	spi3_pins_a: spi3-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('H', 13, AF6)>, /* SPI3_SCK */
+				 <STM32_PINMUX('F', 1, AF5)>; /* SPI3_MOSI */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 4, AF5)>; /* SPI3_MISO */
+			bias-disable;
+		};
+	};
+
+	spi3_sleep_pins_a: spi3-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 13, ANALOG)>, /* SPI3_SCK */
+				 <STM32_PINMUX('D', 4, ANALOG)>, /* SPI3_MISO */
+				 <STM32_PINMUX('F', 1, ANALOG)>; /* SPI3_MOSI */
+		};
+	};
+
 	spi5_pins_a: spi5-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('H', 7, AF6)>, /* SPI5_SCK */
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
