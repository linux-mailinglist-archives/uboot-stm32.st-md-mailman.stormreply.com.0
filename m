Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0658B48D6
	for <lists+uboot-stm32@lfdr.de>; Sun, 28 Apr 2024 00:22:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14CABC7128E;
	Sat, 27 Apr 2024 22:22:02 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FC4FC7128E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Apr 2024 22:21:54 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BF9ED88228;
 Sun, 28 Apr 2024 00:21:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1714256514;
 bh=BsmplrS8iPyfdqdkYJrc2pOOwfCwHE0+a5XfgUxyl7M=;
 h=From:To:Cc:Subject:Date:From;
 b=v+zjMoG/CFAqZxGO0Q9/irMspnGawOkVVcDkRzg3JHxCQXbDdanKBFgssDhUnv/eg
 SSoOZiZdjEYywT42PaFW0oYVHzeSh9iJYpJVyWPrIEabuudzb4RvGOlncBQR9nXK28
 2by7FRYncJ8oOryWddWznqKO3RLfv/Q9Ay7UeE0A5n0kuSvxCnzstbbtUX+hTqqGX0
 pyxf/s0CgsoY8y6gEpXUqS8wo+/IIyDfF3O4xiLo3QaSmzsex6/vo9O6kZNg0CkSI8
 4tKHMhTPsDqbo77tadnUeaaRckxlNxmRoRESAgvnBoFuvzkbGZphXgjTw+jxPa/r+C
 eAXRboMG6G6jQ==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Sun, 28 Apr 2024 00:20:37 +0200
Message-ID: <20240427222130.66693-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: [Uboot-stm32] [PATCH v2 1/2] ARM: dts: stm32: Add pinmux nodes for
	DH electronics STM32MP13xx DHCOR SoM and DHSBC board
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

Add new pinmux nodes for DH electronics STM32MP13xx DHCOR SoM and DHSBC board.
The following pinmux nodes are added:
- ADC pins
- ADC CC pins
- ETH1 pins
- ETH2 pins
- I2C5 pins
- MCAN1 pins
- MCAN2 pins
- PWM13 pins
- PWM5 pins
- QSPI pins
- SAI1 pins
- SDMMC2 D4..D7 pins
- SPI2 pins
- SPI3 pins
- UART4 pins
- UART7 pins
- USART1 pins
- USART2 pins

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: u-boot@dh-electronics.com
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
V2: Squash the pinmux patches into one megapatch
---
 arch/arm/dts/stm32mp13-pinctrl.dtsi | 483 ++++++++++++++++++++++++++++
 1 file changed, 483 insertions(+)

diff --git a/arch/arm/dts/stm32mp13-pinctrl.dtsi b/arch/arm/dts/stm32mp13-pinctrl.dtsi
index 27e0c382678..c01d39f03ea 100644
--- a/arch/arm/dts/stm32mp13-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp13-pinctrl.dtsi
@@ -6,6 +6,12 @@
 #include <dt-bindings/pinctrl/stm32-pinfunc.h>
 
 &pinctrl {
+	adc1_pins_a: adc1-pins-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 3, ANALOG)>; /* ADC1 in12 */
+		};
+	};
+
 	adc1_usb_cc_pins_a: adc1-usb-cc-pins-0 {
 		pins {
 			pinmux = <STM32_PINMUX('F', 12, ANALOG)>, /* ADC1 in6 */
@@ -13,6 +19,104 @@
 		};
 	};
 
+	adc1_usb_cc_pins_b: adc1-usb-cc-pins-1 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 5, ANALOG)>, /* ADC1_INP2 */
+				 <STM32_PINMUX('F', 13, ANALOG)>; /* ADC1_INP11 */
+		};
+	};
+
+	eth1_rgmii_pins_a: eth1-rgmii-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 13, AF11)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('G', 14, AF11)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('C', 2, AF11)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('E', 5, AF10)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('B', 11, AF11)>, /* ETH_RGMII_TX_CTL */
+				 <STM32_PINMUX('C', 1, AF11)>, /* ETH_RGMII_GTX_CLK */
+				 <STM32_PINMUX('A', 2, AF11)>, /* ETH_MDIO */
+				 <STM32_PINMUX('G', 2, AF11)>; /* ETH_MDC */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+
+		pins2 {
+			pinmux = <STM32_PINMUX('C', 4, AF11)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('C', 5, AF11)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('B', 0, AF11)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('B', 1, AF11)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('A', 7, AF11)>, /* ETH_RGMII_RX_CTL */
+				 <STM32_PINMUX('D', 7, AF10)>; /* ETH_RGMII_RX_CLK */
+			bias-disable;
+		};
+
+	};
+
+	eth1_rgmii_sleep_pins_a: eth1-rgmii-sleep-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('G', 14, ANALOG)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('C', 2, ANALOG)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('E', 5, ANALOG)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('B', 11, ANALOG)>, /* ETH_RGMII_TX_CTL */
+				 <STM32_PINMUX('C', 1, ANALOG)>, /* ETH_RGMII_GTX_CLK */
+				 <STM32_PINMUX('A', 2, ANALOG)>, /* ETH_MDIO */
+				 <STM32_PINMUX('G', 2, ANALOG)>, /* ETH_MDC */
+				 <STM32_PINMUX('C', 4, ANALOG)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('C', 5, ANALOG)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('B', 0, ANALOG)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('B', 1, ANALOG)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('A', 7, ANALOG)>, /* ETH_RGMII_RX_CTL */
+				 <STM32_PINMUX('D', 7, ANALOG)>; /* ETH_RGMII_RX_CLK */
+		};
+	};
+
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
@@ -47,6 +151,63 @@
 		};
 	};
 
+	i2c5_pins_b: i2c5-1 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 1, AF4)>, /* I2C5_SCL */
+				 <STM32_PINMUX('E', 13, AF4)>; /* I2C5_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c5_sleep_pins_b: i2c5-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 1, ANALOG)>, /* I2C5_SCL */
+				 <STM32_PINMUX('E', 13, ANALOG)>; /* I2C5_SDA */
+		};
+	};
+
+	m_can1_pins_a: m-can1-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 10, AF9)>; /* CAN1_TX */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 0, AF9)>; /* CAN1_RX */
+			bias-disable;
+		};
+	};
+
+	m_can1_sleep_pins_a: m_can1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 10, ANALOG)>, /* CAN1_TX */
+				 <STM32_PINMUX('D', 0, ANALOG)>; /* CAN1_RX */
+		};
+	};
+
+	m_can2_pins_a: m-can2-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 0, AF9)>; /* CAN2_TX */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 0, AF9)>; /* CAN2_RX */
+			bias-disable;
+		};
+	};
+
+	m_can2_sleep_pins_a: m_can2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 0, ANALOG)>, /* CAN2_TX */
+				 <STM32_PINMUX('E', 0, ANALOG)>; /* CAN2_RX */
+		};
+	};
+
 	mcp23017_pins_a: mcp23017-0 {
 		pins {
 			pinmux = <STM32_PINMUX('G', 12, GPIO)>;
@@ -84,6 +245,21 @@
 		};
 	};
 
+	pwm5_pins_a: pwm5-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 12, AF2)>; /* TIM5_CH3 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	pwm5_sleep_pins_a: pwm5-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 12, ANALOG)>; /* TIM5_CH3 */
+		};
+	};
+
 	pwm8_pins_a: pwm8-0 {
 		pins {
 			pinmux = <STM32_PINMUX('E', 5, AF3)>; /* TIM8_CH3 */
@@ -99,6 +275,21 @@
 		};
 	};
 
+	pwm13_pins_a: pwm13-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 6, AF9)>; /* TIM13_CH1 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	pwm13_sleep_pins_a: pwm13-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 6, ANALOG)>; /* TIM13_CH1 */
+		};
+	};
+
 	pwm14_pins_a: pwm14-0 {
 		pins {
 			pinmux = <STM32_PINMUX('F', 9, AF9)>; /* TIM14_CH1 */
@@ -114,6 +305,89 @@
 		};
 	};
 
+	qspi_clk_pins_a: qspi-clk-0 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 10, AF9)>; /* QSPI_CLK */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+	};
+
+	qspi_clk_sleep_pins_a: qspi-clk-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 10, ANALOG)>; /* QSPI_CLK */
+		};
+	};
+
+	qspi_bk1_pins_a: qspi-bk1-0 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 8, AF10)>, /* QSPI_BK1_IO0 */
+				 <STM32_PINMUX('F', 9, AF10)>, /* QSPI_BK1_IO1 */
+				 <STM32_PINMUX('D', 11, AF9)>, /* QSPI_BK1_IO2 */
+				 <STM32_PINMUX('H', 7, AF13)>; /* QSPI_BK1_IO3 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+	};
+
+	qspi_bk1_sleep_pins_a: qspi-bk1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 8, ANALOG)>, /* QSPI_BK1_IO0 */
+				 <STM32_PINMUX('F', 9, ANALOG)>, /* QSPI_BK1_IO1 */
+				 <STM32_PINMUX('D', 11, ANALOG)>, /* QSPI_BK1_IO2 */
+				 <STM32_PINMUX('H', 7, ANALOG)>; /* QSPI_BK1_IO3 */
+		};
+	};
+
+	qspi_cs1_pins_a: qspi-cs1-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 2, AF9)>; /* QSPI_BK1_NCS */
+			bias-pull-up;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+	};
+
+	qspi_cs1_sleep_pins_a: qspi-cs1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 2, ANALOG)>; /* QSPI_BK1_NCS */
+		};
+	};
+
+	sai1a_pins_a: sai1a-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 4, AF12)>, /* SAI1_SCK_A */
+				 <STM32_PINMUX('D', 6, AF6)>, /* SAI1_SD_A */
+				 <STM32_PINMUX('E', 11, AF6)>; /* SAI1_FS_A */
+			slew-rate = <0>;
+			drive-push-pull;
+			bias-disable;
+		};
+	};
+
+	sai1a_sleep_pins_a: sai1a-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 4, ANALOG)>, /* SAI1_SCK_A */
+				 <STM32_PINMUX('D', 6, ANALOG)>, /* SAI1_SD_A */
+				 <STM32_PINMUX('E', 11, ANALOG)>; /* SAI1_FS_A */
+		};
+	};
+
+	sai1b_pins_a: sai1b-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 0, AF6)>; /* SAI1_SD_B */
+			bias-disable;
+		};
+	};
+
+	sai1b_sleep_pins_a: sai1b-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 0, ANALOG)>; /* SAI1_SD_B */
+		};
+	};
+
 	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
 		pins {
 			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
@@ -216,6 +490,73 @@
 		};
 	};
 
+	sdmmc2_d47_pins_a: sdmmc2-d47-0 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 0, AF10)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('B', 9, AF10)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('C', 6, AF10)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('C', 7, AF10)>; /* SDMMC2_D7 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+	};
+
+	sdmmc2_d47_sleep_pins_a: sdmmc2-d47-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 0, ANALOG)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('B', 9, ANALOG)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('C', 6, ANALOG)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('C', 7, ANALOG)>; /* SDMMC2_D7 */
+		};
+	};
+
+	spi2_pins_a: spi2-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 10, AF6)>, /* SPI2_SCK */
+				 <STM32_PINMUX('H', 10, AF6)>; /* SPI2_MOSI */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 5, AF5)>; /* SPI2_MISO */
+			bias-disable;
+		};
+	};
+
+	spi2_sleep_pins_a: spi2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* SPI2_SCK */
+				 <STM32_PINMUX('B', 5, ANALOG)>, /* SPI2_MISO */
+				 <STM32_PINMUX('H', 10, ANALOG)>; /* SPI2_MOSI */
+		};
+	};
+
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
@@ -276,6 +617,77 @@
 		};
 	};
 
+	uart4_pins_b: uart4-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 9, AF8)>; /* UART4_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 8, AF8)>; /* UART4_RX */
+			bias-pull-up;
+		};
+	};
+
+	uart4_idle_pins_b: uart4-idle-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 9, ANALOG)>; /* UART4_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 8, AF8)>; /* UART4_RX */
+			bias-pull-up;
+		};
+	};
+
+	uart4_sleep_pins_b: uart4-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 9, ANALOG)>, /* UART4_TX */
+				 <STM32_PINMUX('D', 8, ANALOG)>; /* UART4_RX */
+		};
+	};
+
+	uart7_pins_a: uart7-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('H', 2, AF8)>, /* UART7_TX */
+				 <STM32_PINMUX('B', 12, AF7)>; /* UART7_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 10, AF7)>, /* UART7_RX */
+				 <STM32_PINMUX('G', 7, AF8)>; /* UART7_CTS_NSS */
+			bias-disable;
+		};
+	};
+
+	uart7_idle_pins_a: uart7-idle-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('H', 2, ANALOG)>, /* UART7_TX */
+				 <STM32_PINMUX('G', 7, ANALOG)>; /* UART7_CTS_NSS */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 12, AF7)>; /* UART7_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('E', 10, AF7)>; /* UART7_RX */
+			bias-disable;
+		};
+	};
+
+	uart7_sleep_pins_a: uart7-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 2, ANALOG)>, /* UART7_TX */
+				 <STM32_PINMUX('B', 12, ANALOG)>, /* UART7_RTS */
+				 <STM32_PINMUX('E', 10, ANALOG)>, /* UART7_RX */
+				 <STM32_PINMUX('G', 7, ANALOG)>; /* UART7_CTS_NSS */
+		};
+	};
+
 	uart8_pins_a: uart8-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('E', 1, AF8)>; /* UART8_TX */
@@ -347,6 +759,36 @@
 		};
 	};
 
+	usart1_pins_b: usart1-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('C', 0, AF7)>; /* USART1_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 14, AF7)>; /* USART1_RX */
+			bias-pull-up;
+		};
+	};
+
+	usart1_idle_pins_b: usart1-idle-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('C', 0, ANALOG)>; /* USART1_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 14, AF7)>; /* USART1_RX */
+			bias-pull-up;
+		};
+	};
+
+	usart1_sleep_pins_b: usart1-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('C', 0, ANALOG)>, /* USART1_TX */
+				 <STM32_PINMUX('D', 14, ANALOG)>; /* USART1_RX */
+		};
+	};
+
 	usart2_pins_a: usart2-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('H', 12, AF1)>, /* USART2_TX */
@@ -387,4 +829,45 @@
 				 <STM32_PINMUX('E', 11, ANALOG)>; /* USART2_CTS_NSS */
 		};
 	};
+
+	usart2_pins_b: usart2-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 11, AF1)>, /* USART2_TX */
+				 <STM32_PINMUX('A', 1, AF7)>; /* USART2_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 15, AF1)>, /* USART2_RX */
+				 <STM32_PINMUX('E', 15, AF3)>; /* USART2_CTS_NSS */
+			bias-disable;
+		};
+	};
+
+	usart2_idle_pins_b: usart2-idle-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 11, ANALOG)>, /* USART2_TX */
+				 <STM32_PINMUX('E', 15, ANALOG)>; /* USART2_CTS_NSS */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('A', 1, AF7)>; /* USART2_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('D', 15, AF1)>; /* USART2_RX */
+			bias-disable;
+		};
+	};
+
+	usart2_sleep_pins_b: usart2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 11, ANALOG)>, /* USART2_TX */
+				 <STM32_PINMUX('A', 1, ANALOG)>, /* USART2_RTS */
+				 <STM32_PINMUX('D', 15, ANALOG)>, /* USART2_RX */
+				 <STM32_PINMUX('E', 15, ANALOG)>; /* USART2_CTS_NSS */
+		};
+	};
 };
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
