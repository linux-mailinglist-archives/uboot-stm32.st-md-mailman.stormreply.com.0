Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DC126BEB2
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Sep 2020 10:01:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BD25C3FAD6
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Sep 2020 08:01:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BFA1C3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Sep 2020 08:01:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08G7uWdB032457; Wed, 16 Sep 2020 10:01:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=SqO22h7fom/jqQRbq0dXztkWqGRfrArbaYu/SDDmfjY=;
 b=K2R+HnAdGCO8A00KrgcQ1LuWpMEKwh45baADLAWW8d75YagwvaTYgeP/GTmOy6VI2TYQ
 ZE6macjLntbeuoTBcurggCEfMf/QxmVy6fdY//ODMRjTZnSey5QhVYHy6EeUnVht/hWg
 zgT+4taqVT03Ugsx1OQPv2uGh+WcBT2yv1fo8t+FwttzZiQ8ZebzPWzwPlvTa/H/Ry6C
 FTe37lSd23ANNcj27RMZCuMpS/jy1CaXUrk29jlJgnXHWBcDJLVnhE1K76wJZOLCwXuX
 Q66uhDC78C/ycdHXAeWceFnlO6kjpz222/0vFlMrxCJgNfMRcoP+G/xXkNg9ZaB+x7Jb PA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33k679jd22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 10:01:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 08B43100034;
 Wed, 16 Sep 2020 10:01:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E7A3520D80E;
 Wed, 16 Sep 2020 10:01:34 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 16 Sep 2020 10:01:34 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 16 Sep 2020 10:01:32 +0200
Message-ID: <20200916080132.10369-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-16_02:2020-09-15,
 2020-09-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32mp1: DT alignment with Linux
	kernel v5.9-rc4
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

DT alignment with Linux kernel v5.9-rc4 for the STM32MP15x soc
device tree files and the STMicroelectronics boards device tree files.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp15-pinctrl.dtsi | 263 ++++++++++++++++++++++++++--
 arch/arm/dts/stm32mp151.dtsi        |   4 +-
 arch/arm/dts/stm32mp157a-dk1.dts    |   2 +
 arch/arm/dts/stm32mp157c-dk2.dts    |  11 ++
 arch/arm/dts/stm32mp157c-ed1.dts    |   4 +-
 arch/arm/dts/stm32mp157c-ev1.dts    |  15 ++
 arch/arm/dts/stm32mp15xx-dkx.dtsi   |  38 +++-
 7 files changed, 318 insertions(+), 19 deletions(-)

diff --git a/arch/arm/dts/stm32mp15-pinctrl.dtsi b/arch/arm/dts/stm32mp15-pinctrl.dtsi
index e9525b5d06..154832983c 100644
--- a/arch/arm/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp15-pinctrl.dtsi
@@ -1573,6 +1573,20 @@
 		};
 	};
 
+	spi4_pins_a: spi4-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 12, AF5)>, /* SPI4_SCK */
+				 <STM32_PINMUX('E', 6, AF5)>;  /* SPI4_MOSI */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 13, AF5)>; /* SPI4_MISO */
+			bias-disable;
+		};
+	};
+
 	stusb1600_pins_a: stusb1600-0 {
 			pins {
 				pinmux = <STM32_PINMUX('I', 11, ANALOG)>;
@@ -1580,6 +1594,133 @@
 		};
 	};
 
+	uart4_pins_a: uart4-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
+			bias-disable;
+		};
+	};
+
+	uart4_idle_pins_a: uart4-idle-0 {
+		   pins1 {
+			 pinmux = <STM32_PINMUX('G', 11, ANALOG)>; /* UART4_TX */
+		   };
+		   pins2 {
+			 pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
+			 bias-disable;
+		   };
+	};
+
+	uart4_sleep_pins_a: uart4-sleep-0 {
+		   pins {
+			pinmux = <STM32_PINMUX('G', 11, ANALOG)>, /* UART4_TX */
+				 <STM32_PINMUX('B', 2, ANALOG)>; /* UART4_RX */
+		    };
+	};
+
+	uart4_pins_b: uart4-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('D', 1, AF8)>; /* UART4_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
+			bias-disable;
+		};
+	};
+
+	uart4_pins_c: uart4-2 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
+			bias-disable;
+		};
+	};
+
+	uart7_pins_a: uart7-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 8, AF7)>; /* UART7_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 7, AF7)>, /* UART7_RX */
+				 <STM32_PINMUX('E', 10, AF7)>, /* UART7_CTS */
+				 <STM32_PINMUX('E', 9, AF7)>; /* UART7_RTS */
+			bias-disable;
+		};
+	};
+
+	uart7_pins_b: uart7-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 7, AF7)>; /* UART7_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 6, AF7)>; /* UART7_RX */
+			bias-disable;
+		};
+	};
+
+	uart7_pins_c: uart7-2 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 8, AF7)>; /* UART7_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 7, AF7)>; /* UART7_RX */
+			bias-disable;
+		};
+	};
+
+	uart7_idle_pins_c: uart7-idle-2 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 8, ANALOG)>; /* UART7_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 7, AF7)>; /* UART7_RX */
+			bias-disable;
+		};
+	};
+
+	uart7_sleep_pins_c: uart7-sleep-2 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 8, ANALOG)>, /* UART7_TX */
+				 <STM32_PINMUX('E', 7, ANALOG)>; /* UART7_RX */
+		};
+	};
+
+	uart8_pins_a: uart8-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 1, AF8)>; /* UART8_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 0, AF8)>; /* UART8_RX */
+			bias-disable;
+		};
+	};
+
 	usart2_pins_a: usart2-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('F', 5, AF7)>, /* USART2_TX */
@@ -1628,6 +1769,42 @@
 		};
 	};
 
+	usart2_pins_c: usart2-2 {
+		pins1 {
+			pinmux = <STM32_PINMUX('D', 5, AF7)>, /* USART2_TX */
+				 <STM32_PINMUX('D', 4, AF7)>; /* USART2_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 6, AF7)>, /* USART2_RX */
+				 <STM32_PINMUX('D', 3, AF7)>; /* USART2_CTS_NSS */
+			bias-disable;
+		};
+	};
+
+	usart2_idle_pins_c: usart2-idle-2 {
+		pins1 {
+			pinmux = <STM32_PINMUX('D', 5, ANALOG)>, /* USART2_TX */
+				 <STM32_PINMUX('D', 4, ANALOG)>, /* USART2_RTS */
+				 <STM32_PINMUX('D', 3, ANALOG)>; /* USART2_CTS_NSS */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 6, AF7)>; /* USART2_RX */
+			bias-disable;
+		};
+	};
+
+	usart2_sleep_pins_c: usart2-sleep-2 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 5, ANALOG)>, /* USART2_TX */
+				 <STM32_PINMUX('D', 4, ANALOG)>, /* USART2_RTS */
+				 <STM32_PINMUX('D', 6, ANALOG)>, /* USART2_RX */
+				 <STM32_PINMUX('D', 3, ANALOG)>; /* USART2_CTS_NSS */
+		};
+	};
+
 	usart3_pins_a: usart3-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('B', 10, AF7)>; /* USART3_TX */
@@ -1641,6 +1818,78 @@
 		};
 	};
 
+	usart3_pins_b: usart3-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 10, AF7)>, /* USART3_TX */
+				 <STM32_PINMUX('G', 8, AF8)>; /* USART3_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 12, AF8)>, /* USART3_RX */
+				 <STM32_PINMUX('I', 10, AF8)>; /* USART3_CTS_NSS */
+			bias-disable;
+		};
+	};
+
+	usart3_idle_pins_b: usart3-idle-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* USART3_TX */
+				 <STM32_PINMUX('G', 8, ANALOG)>, /* USART3_RTS */
+				 <STM32_PINMUX('I', 10, ANALOG)>; /* USART3_CTS_NSS */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
+			bias-disable;
+		};
+	};
+
+	usart3_sleep_pins_b: usart3-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* USART3_TX */
+				 <STM32_PINMUX('G', 8, ANALOG)>, /* USART3_RTS */
+				 <STM32_PINMUX('I', 10, ANALOG)>, /* USART3_CTS_NSS */
+				 <STM32_PINMUX('B', 12, ANALOG)>; /* USART3_RX */
+		};
+	};
+
+	usart3_pins_c: usart3-2 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 10, AF7)>, /* USART3_TX */
+				 <STM32_PINMUX('G', 8, AF8)>; /* USART3_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 12, AF8)>, /* USART3_RX */
+				 <STM32_PINMUX('B', 13, AF7)>; /* USART3_CTS_NSS */
+			bias-disable;
+		};
+	};
+
+	usart3_idle_pins_c: usart3-idle-2 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* USART3_TX */
+				 <STM32_PINMUX('G', 8, ANALOG)>, /* USART3_RTS */
+				 <STM32_PINMUX('B', 13, ANALOG)>; /* USART3_CTS_NSS */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
+			bias-disable;
+		};
+	};
+
+	usart3_sleep_pins_c: usart3-sleep-2 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 10, ANALOG)>, /* USART3_TX */
+				 <STM32_PINMUX('G', 8, ANALOG)>, /* USART3_RTS */
+				 <STM32_PINMUX('B', 13, ANALOG)>, /* USART3_CTS_NSS */
+				 <STM32_PINMUX('B', 12, ANALOG)>; /* USART3_RX */
+		};
+	};
+
 	uart4_pins_a: uart4-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
@@ -1782,18 +2031,4 @@
 			bias-disable;
 		};
 	};
-
-	spi4_pins_a: spi4-0 {
-		pins {
-			pinmux = <STM32_PINMUX('E', 12, AF5)>, /* SPI4_SCK */
-				 <STM32_PINMUX('E', 6, AF5)>;  /* SPI4_MOSI */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <1>;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('E', 13, AF5)>; /* SPI4_MISO */
-			bias-disable;
-		};
-	};
 };
diff --git a/arch/arm/dts/stm32mp151.dtsi b/arch/arm/dts/stm32mp151.dtsi
index 39d9e545ed..206d3d3c78 100644
--- a/arch/arm/dts/stm32mp151.dtsi
+++ b/arch/arm/dts/stm32mp151.dtsi
@@ -1153,7 +1153,7 @@
 		};
 
 		pwr_mcu: pwr_mcu@50001014 {
-			compatible = "syscon";
+			compatible = "st,stm32mp151-pwr-mcu", "syscon";
 			reg = <0x50001014 0x4>;
 		};
 
@@ -1372,6 +1372,8 @@
 			dma-names = "tx", "rx";
 			clocks = <&rcc QSPI_K>;
 			resets = <&rcc QSPI_R>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm/dts/stm32mp157a-dk1.dts b/arch/arm/dts/stm32mp157a-dk1.dts
index d03d4cd260..4c8be9c8eb 100644
--- a/arch/arm/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/dts/stm32mp157a-dk1.dts
@@ -18,6 +18,8 @@
 	aliases {
 		ethernet0 = &ethernet0;
 		serial0 = &uart4;
+		serial1 = &usart3;
+		serial2 = &uart7;
 	};
 
 	chosen {
diff --git a/arch/arm/dts/stm32mp157c-dk2.dts b/arch/arm/dts/stm32mp157c-dk2.dts
index 9a8a26710a..045636555d 100644
--- a/arch/arm/dts/stm32mp157c-dk2.dts
+++ b/arch/arm/dts/stm32mp157c-dk2.dts
@@ -19,6 +19,9 @@
 	aliases {
 		ethernet0 = &ethernet0;
 		serial0 = &uart4;
+		serial1 = &usart3;
+		serial2 = &uart7;
+		serial3 = &usart2;
 	};
 
 	chosen {
@@ -84,3 +87,11 @@
 		};
 	};
 };
+
+&usart2 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&usart2_pins_c>;
+	pinctrl-1 = <&usart2_sleep_pins_c>;
+	pinctrl-2 = <&usart2_idle_pins_c>;
+	status = "disabled";
+};
diff --git a/arch/arm/dts/stm32mp157c-ed1.dts b/arch/arm/dts/stm32mp157c-ed1.dts
index 072d646379..dd911c9932 100644
--- a/arch/arm/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/dts/stm32mp157c-ed1.dts
@@ -361,8 +361,10 @@
 };
 
 &uart4 {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&uart4_pins_a>;
+	pinctrl-1 = <&uart4_sleep_pins_a>;
+	pinctrl-2 = <&uart4_idle_pins_a>;
 	status = "okay";
 };
 
diff --git a/arch/arm/dts/stm32mp157c-ev1.dts b/arch/arm/dts/stm32mp157c-ev1.dts
index 46f81ce92e..a55e80ce26 100644
--- a/arch/arm/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/dts/stm32mp157c-ev1.dts
@@ -19,6 +19,7 @@
 
 	aliases {
 		serial0 = &uart4;
+		serial1 = &usart3;
 		ethernet0 = &ethernet0;
 	};
 
@@ -343,6 +344,20 @@
 	};
 };
 
+&usart3 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&usart3_pins_b>;
+	pinctrl-1 = <&usart3_sleep_pins_b>;
+	pinctrl-2 = <&usart3_idle_pins_b>;
+	/*
+	 * HW flow control USART3_RTS is optional, and isn't default wired to
+	 * the connector. SB23 needs to be soldered in order to use it, and R77
+	 * (ETH_CLK) should be removed.
+	 */
+	uart-has-rtscts;
+	status = "disabled";
+};
+
 &usbh_ehci {
 	phys = <&usbphyc_port0>;
 	status = "okay";
diff --git a/arch/arm/dts/stm32mp15xx-dkx.dtsi b/arch/arm/dts/stm32mp15xx-dkx.dtsi
index d660dfb74e..aa4aa83e05 100644
--- a/arch/arm/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dkx.dtsi
@@ -62,7 +62,7 @@
 
 	led {
 		compatible = "gpio-leds";
-		blue {
+		led-blue {
 			label = "heartbeat";
 			gpios = <&gpiod 11 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
@@ -391,6 +391,19 @@
 	};
 };
 
+&i2c5 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c5_pins_a>;
+	pinctrl-1 = <&i2c5_sleep_pins_a>;
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+	clock-frequency = <400000>;
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "disabled";
+};
+
 &i2s2 {
 	clocks = <&rcc SPI2>, <&rcc SPI2_K>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
 	clock-names = "pclk", "i2sclk", "x8k", "x11k";
@@ -610,20 +623,39 @@
 };
 
 &uart4 {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&uart4_pins_a>;
+	pinctrl-1 = <&uart4_sleep_pins_a>;
+	pinctrl-2 = <&uart4_idle_pins_a>;
 	status = "okay";
 };
 
+&uart7 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&uart7_pins_c>;
+	pinctrl-1 = <&uart7_sleep_pins_c>;
+	pinctrl-2 = <&uart7_idle_pins_c>;
+	status = "disabled";
+};
+
+&usart3 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&usart3_pins_c>;
+	pinctrl-1 = <&usart3_sleep_pins_c>;
+	pinctrl-2 = <&usart3_idle_pins_c>;
+	uart-has-rtscts;
+	status = "disabled";
+};
+
 &usbh_ehci {
 	phys = <&usbphyc_port0>;
 	status = "okay";
 };
 
 &usbotg_hs {
-	dr_mode = "peripheral";
 	phys = <&usbphyc_port1 0>;
 	phy-names = "usb2-phy";
+	usb-role-switch;
 	status = "okay";
 };
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
