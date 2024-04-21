Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9F58AC207
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Apr 2024 01:19:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60C70C7128A;
	Sun, 21 Apr 2024 23:19:11 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B27E0C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Apr 2024 23:19:08 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3AC8D8830D;
 Mon, 22 Apr 2024 01:19:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713741548;
 bh=aMuG9tdoVV/rqf2ShuJT3uJSbfvsDRksu5YcVwrRTmQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cQDXcSTDRkbLHGaQJT78qjCRa3dsJStpKtrx++b6hzxKO9x5xecu1+503Kw4fVCzp
 X7sOjbSJvb9Dm4hhuag171cL94odtrE1I1Z1TOmYuh8Q0LS2lusp7lcFF4BheAEtjR
 jmY68pyFJ0Ftal8CrX7ZElFjsORmcbmJr1YVu6LlPZlTO4JiheIkri0qqaXlagGrxO
 IzmQAX0Sv8/tOQjPEEwvK6CBQQRA/z2CY3ec5v7tmOH5WrwMJS6GIsjky8ui0yf66w
 AeRXJ+s7TXu1jfSWSuneG3NeE0Nb1T9M9IaN5oTGQBCESaWaHsraJgLEnltjkCO1vY
 FgiSDM60ykzug==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Mon, 22 Apr 2024 01:16:50 +0200
Message-ID: <20240421231849.194648-4-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240421231849.194648-1-marex@denx.de>
References: <20240421231849.194648-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: [Uboot-stm32] [PATCH 04/19] ARM: dts: stm32: Add alternate pinmux
	for MP13 ETH2 pins
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

Add another mux option for ETH2 pins, this is used on
DH electronics STM32MP13xx DHCOR DHSBC board.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: u-boot@dh-electronics.com
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/dts/stm32mp13-pinctrl.dtsi | 45 +++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/dts/stm32mp13-pinctrl.dtsi b/arch/arm/dts/stm32mp13-pinctrl.dtsi
index c709d64edcc..899f0f98e1a 100644
--- a/arch/arm/dts/stm32mp13-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp13-pinctrl.dtsi
@@ -72,6 +72,51 @@
 		};
 	};
 
+	eth2_rgmii_pins_a: eth2-rgmii-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 7, AF11)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('G', 11, AF10)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('G', 1, AF10)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('E', 6, AF11)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('F', 6, AF11)>, /* ETH_RGMII_TX_CTL */
+				 <STM32_PINMUX('G', 3, AF10)>, /* ETH_RGMII_GTX_CLK */
+				 <STM32_PINMUX('B', 6, AF11)>, /* ETH_MDIO */
+				 <STM32_PINMUX('G', 5, AF10)>; /* ETH_MDC */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 4, AF11)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('E', 2, AF10)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('H', 6, AF12)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('A', 8, AF11)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('A', 12, AF11)>, /* ETH_RGMII_RX_CTL */
+				 <STM32_PINMUX('H', 11, AF11)>; /* ETH_RGMII_RX_CLK */
+			bias-disable;
+		};
+	};
+
+	eth2_rgmii_sleep_pins_a: eth2-rgmii-sleep-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 7, ANALOG)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('G', 11, ANALOG)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('G', 11, ANALOG)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('G', 11, ANALOG)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('G', 8, ANALOG)>, /* ETH_RGMII_TX_CTL */
+				 <STM32_PINMUX('F', 6, ANALOG)>, /* ETH_RGMII_GTX_CLK */
+				 <STM32_PINMUX('B', 2, ANALOG)>, /* ETH_MDIO */
+				 <STM32_PINMUX('G', 5, ANALOG)>, /* ETH_MDC */
+				 <STM32_PINMUX('F', 4, ANALOG)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('A', 12, ANALOG)>, /* ETH_RGMII_RX_CTL */
+				 <STM32_PINMUX('H', 11, ANALOG)>; /* ETH_RGMII_RX_CLK */
+		};
+	};
+
 	i2c1_pins_a: i2c1-0 {
 		pins {
 			pinmux = <STM32_PINMUX('D', 12, AF5)>, /* I2C1_SCL */
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
