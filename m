Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9299216FC57
	for <lists+uboot-stm32@lfdr.de>; Wed, 26 Feb 2020 11:35:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 547AEC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 26 Feb 2020 10:35:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69DC2C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2020 10:31:45 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01QAMlqe014521; Wed, 26 Feb 2020 11:31:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=fZIxngG/tKDgJjge4seQZe7wNNfQKqykvfJAJeOP8U8=;
 b=ZBN+VQvKAUrkLsR+xwTF2KN4HYHYVDmtSBxvBcCRpEZkLqmzvp50DaBDnKke0q24aFTF
 19jakzAjihcnQtvwJVqW67YbExTAmpA/AVGiYPzy+qS8SZ3Twh+W2lnU//Y0+PGRIbXh
 SQDA5ln+c/fTvUvzo2Nq1ofIbfi6TQ+n4Ciy4PLiJfvJo3DlILYzNWIgXsxE8MS1SFMV
 tm13CTq2pVcOEaMU0rzAZRf3iCRE5zvbbnVuwAtFa85gvujrL/qyCRpkzgX/kxtGey2N
 5HjZ9J0YvGskpiC+btJdLAQTw/A/8r0isSA/rg8OOH7HBR6LfXuKqrf8o+W2oEvRu9rR 9w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ydcnj36ck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 11:31:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 66D18100034;
 Wed, 26 Feb 2020 11:31:36 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5BE9D2B3891;
 Wed, 26 Feb 2020 11:31:36 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 26 Feb 2020 11:31:35 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 26 Feb 2020 11:31:33 +0100
Message-ID: <20200226103133.12013-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-26_02:2020-02-26,
 2020-02-26 signatures=0
X-Mailman-Approved-At: Wed, 26 Feb 2020 10:35:32 +0000
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32mp1: DT alignment with Linux
	5.6-rc1
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

This commit manages diversity for STM32M15x SOCs with:
- dedicated files to support all STM32MP15 SOCs family.
  The differences between those SOCs are:
  -STM32MP151 [1]: common file.
  -STM32MP153 [2]: STM32MP151 + CANs + a second CortexA7-CPU.
  -STM32MP157 [3]: STM32MP153 + DSI + GPU.
- new files to manage security diversity on STM32MP15x SOCs.
  On STM32MP15xY, "Y" gives information:
  -Y = A means no cryp IP and no secure boot.
  -Y = C means cryp IP + secure boot.
- stm32mp157 pinctrl files to better manage package diversity.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp15-pinctrl.dtsi           | 1114 +++++++++++++++++
 .../dts/{stm32mp157c.dtsi => stm32mp151.dtsi} |  274 ++--
 arch/arm/dts/stm32mp153.dtsi                  |   45 +
 arch/arm/dts/stm32mp157-pinctrl.dtsi          | 1057 ----------------
 arch/arm/dts/stm32mp157.dtsi                  |   31 +
 .../arm/dts/stm32mp157a-avenger96-u-boot.dtsi |    9 +-
 arch/arm/dts/stm32mp157a-avenger96.dts        |    5 +-
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi      |    5 +-
 arch/arm/dts/stm32mp157a-dk1.dts              |  541 +-------
 arch/arm/dts/stm32mp157c-dk2-u-boot.dtsi      |    6 -
 arch/arm/dts/stm32mp157c-dk2.dts              |   15 +-
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi      |    5 +-
 arch/arm/dts/stm32mp157c-ed1.dts              |   22 +-
 arch/arm/dts/stm32mp157c-ev1.dts              |   30 +-
 arch/arm/dts/stm32mp157xaa-pinctrl.dtsi       |   90 --
 arch/arm/dts/stm32mp157xab-pinctrl.dtsi       |   62 -
 arch/arm/dts/stm32mp157xac-pinctrl.dtsi       |   78 --
 arch/arm/dts/stm32mp157xad-pinctrl.dtsi       |   62 -
 arch/arm/dts/stm32mp15xc.dtsi                 |   18 +
 arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi    |    5 +-
 arch/arm/dts/stm32mp15xx-dhcom.dtsi           |    6 +-
 arch/arm/dts/stm32mp15xx-dkx.dtsi             |  639 ++++++++++
 arch/arm/dts/stm32mp15xxaa-pinctrl.dtsi       |   85 ++
 arch/arm/dts/stm32mp15xxab-pinctrl.dtsi       |   57 +
 arch/arm/dts/stm32mp15xxac-pinctrl.dtsi       |   73 ++
 arch/arm/dts/stm32mp15xxad-pinctrl.dtsi       |   57 +
 26 files changed, 2402 insertions(+), 1989 deletions(-)
 create mode 100644 arch/arm/dts/stm32mp15-pinctrl.dtsi
 rename arch/arm/dts/{stm32mp157c.dtsi => stm32mp151.dtsi} (89%)
 create mode 100644 arch/arm/dts/stm32mp153.dtsi
 delete mode 100644 arch/arm/dts/stm32mp157-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32mp157.dtsi
 delete mode 100644 arch/arm/dts/stm32mp157xaa-pinctrl.dtsi
 delete mode 100644 arch/arm/dts/stm32mp157xab-pinctrl.dtsi
 delete mode 100644 arch/arm/dts/stm32mp157xac-pinctrl.dtsi
 delete mode 100644 arch/arm/dts/stm32mp157xad-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32mp15xc.dtsi
 create mode 100644 arch/arm/dts/stm32mp15xx-dkx.dtsi
 create mode 100644 arch/arm/dts/stm32mp15xxaa-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32mp15xxab-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32mp15xxac-pinctrl.dtsi
 create mode 100644 arch/arm/dts/stm32mp15xxad-pinctrl.dtsi

diff --git a/arch/arm/dts/stm32mp15-pinctrl.dtsi b/arch/arm/dts/stm32mp15-pinctrl.dtsi
new file mode 100644
index 0000000000..53df840f85
--- /dev/null
+++ b/arch/arm/dts/stm32mp15-pinctrl.dtsi
@@ -0,0 +1,1114 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2017 - All Rights Reserved
+ * Author: Ludovic Barre <ludovic.barre@st.com> for STMicroelectronics.
+ */
+#include <dt-bindings/pinctrl/stm32-pinfunc.h>
+
+&pinctrl {
+	adc1_in6_pins_a: adc1-in6 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 12, ANALOG)>;
+		};
+	};
+
+	adc12_ain_pins_a: adc12-ain-0 {
+		pins {
+			pinmux = <STM32_PINMUX('C', 3, ANALOG)>, /* ADC1 in13 */
+				 <STM32_PINMUX('F', 12, ANALOG)>, /* ADC1 in6 */
+				 <STM32_PINMUX('F', 13, ANALOG)>, /* ADC2 in2 */
+				 <STM32_PINMUX('F', 14, ANALOG)>; /* ADC2 in6 */
+		};
+	};
+
+	adc12_usb_cc_pins_a: adc12-usb-cc-pins-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 4, ANALOG)>, /* ADC12 in18 */
+				 <STM32_PINMUX('A', 5, ANALOG)>; /* ADC12 in19 */
+		};
+	};
+
+	cec_pins_a: cec-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 15, AF4)>;
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	cec_pins_sleep_a: cec-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 15, ANALOG)>; /* HDMI_CEC */
+		};
+	};
+
+	cec_pins_b: cec-1 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 6, AF5)>;
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	cec_pins_sleep_b: cec-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 6, ANALOG)>; /* HDMI_CEC */
+		};
+	};
+
+	dac_ch1_pins_a: dac-ch1 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 4, ANALOG)>;
+		};
+	};
+
+	dac_ch2_pins_a: dac-ch2 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 5, ANALOG)>;
+		};
+	};
+
+	dcmi_pins_a: dcmi-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 8,  AF13)>,/* DCMI_HSYNC */
+				 <STM32_PINMUX('B', 7,  AF13)>,/* DCMI_VSYNC */
+				 <STM32_PINMUX('A', 6,  AF13)>,/* DCMI_PIXCLK */
+				 <STM32_PINMUX('H', 9,  AF13)>,/* DCMI_D0 */
+				 <STM32_PINMUX('H', 10, AF13)>,/* DCMI_D1 */
+				 <STM32_PINMUX('H', 11, AF13)>,/* DCMI_D2 */
+				 <STM32_PINMUX('H', 12, AF13)>,/* DCMI_D3 */
+				 <STM32_PINMUX('H', 14, AF13)>,/* DCMI_D4 */
+				 <STM32_PINMUX('I', 4,  AF13)>,/* DCMI_D5 */
+				 <STM32_PINMUX('B', 8,  AF13)>,/* DCMI_D6 */
+				 <STM32_PINMUX('E', 6,  AF13)>,/* DCMI_D7 */
+				 <STM32_PINMUX('I', 1,  AF13)>,/* DCMI_D8 */
+				 <STM32_PINMUX('H', 7,  AF13)>,/* DCMI_D9 */
+				 <STM32_PINMUX('I', 3,  AF13)>,/* DCMI_D10 */
+				 <STM32_PINMUX('H', 15, AF13)>;/* DCMI_D11 */
+			bias-disable;
+		};
+	};
+
+	dcmi_sleep_pins_a: dcmi-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 8,  ANALOG)>,/* DCMI_HSYNC */
+				 <STM32_PINMUX('B', 7,  ANALOG)>,/* DCMI_VSYNC */
+				 <STM32_PINMUX('A', 6,  ANALOG)>,/* DCMI_PIXCLK */
+				 <STM32_PINMUX('H', 9,  ANALOG)>,/* DCMI_D0 */
+				 <STM32_PINMUX('H', 10, ANALOG)>,/* DCMI_D1 */
+				 <STM32_PINMUX('H', 11, ANALOG)>,/* DCMI_D2 */
+				 <STM32_PINMUX('H', 12, ANALOG)>,/* DCMI_D3 */
+				 <STM32_PINMUX('H', 14, ANALOG)>,/* DCMI_D4 */
+				 <STM32_PINMUX('I', 4,  ANALOG)>,/* DCMI_D5 */
+				 <STM32_PINMUX('B', 8,  ANALOG)>,/* DCMI_D6 */
+				 <STM32_PINMUX('E', 6,  ANALOG)>,/* DCMI_D7 */
+				 <STM32_PINMUX('I', 1,  ANALOG)>,/* DCMI_D8 */
+				 <STM32_PINMUX('H', 7,  ANALOG)>,/* DCMI_D9 */
+				 <STM32_PINMUX('I', 3,  ANALOG)>,/* DCMI_D10 */
+				 <STM32_PINMUX('H', 15, ANALOG)>;/* DCMI_D11 */
+		};
+	};
+
+	ethernet0_rgmii_pins_a: rgmii-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
+				 <STM32_PINMUX('G', 4, AF11)>, /* ETH_RGMII_GTX_CLK */
+				 <STM32_PINMUX('G', 13, AF11)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('G', 14, AF11)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('C', 2, AF11)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('E', 2, AF11)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('B', 11, AF11)>, /* ETH_RGMII_TX_CTL */
+				 <STM32_PINMUX('C', 1, AF11)>; /* ETH_MDC */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('A', 2, AF11)>; /* ETH_MDIO */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('C', 4, AF11)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('C', 5, AF11)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('B', 0, AF11)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('B', 1, AF11)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('A', 1, AF11)>, /* ETH_RGMII_RX_CLK */
+				 <STM32_PINMUX('A', 7, AF11)>; /* ETH_RGMII_RX_CTL */
+			bias-disable;
+		};
+	};
+
+	ethernet0_rgmii_pins_sleep_a: rgmii-sleep-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 5, ANALOG)>, /* ETH_RGMII_CLK125 */
+				 <STM32_PINMUX('G', 4, ANALOG)>, /* ETH_RGMII_GTX_CLK */
+				 <STM32_PINMUX('G', 13, ANALOG)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('G', 14, ANALOG)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('C', 2, ANALOG)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('B', 11, ANALOG)>, /* ETH_RGMII_TX_CTL */
+				 <STM32_PINMUX('A', 2, ANALOG)>, /* ETH_MDIO */
+				 <STM32_PINMUX('C', 1, ANALOG)>, /* ETH_MDC */
+				 <STM32_PINMUX('C', 4, ANALOG)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('C', 5, ANALOG)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('B', 0, ANALOG)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('B', 1, ANALOG)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('A', 1, ANALOG)>, /* ETH_RGMII_RX_CLK */
+				 <STM32_PINMUX('A', 7, ANALOG)>; /* ETH_RGMII_RX_CTL */
+		};
+	};
+
+	fmc_pins_a: fmc-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('D', 4, AF12)>, /* FMC_NOE */
+				 <STM32_PINMUX('D', 5, AF12)>, /* FMC_NWE */
+				 <STM32_PINMUX('D', 11, AF12)>, /* FMC_A16_FMC_CLE */
+				 <STM32_PINMUX('D', 12, AF12)>, /* FMC_A17_FMC_ALE */
+				 <STM32_PINMUX('D', 14, AF12)>, /* FMC_D0 */
+				 <STM32_PINMUX('D', 15, AF12)>, /* FMC_D1 */
+				 <STM32_PINMUX('D', 0, AF12)>, /* FMC_D2 */
+				 <STM32_PINMUX('D', 1, AF12)>, /* FMC_D3 */
+				 <STM32_PINMUX('E', 7, AF12)>, /* FMC_D4 */
+				 <STM32_PINMUX('E', 8, AF12)>, /* FMC_D5 */
+				 <STM32_PINMUX('E', 9, AF12)>, /* FMC_D6 */
+				 <STM32_PINMUX('E', 10, AF12)>, /* FMC_D7 */
+				 <STM32_PINMUX('G', 9, AF12)>; /* FMC_NE2_FMC_NCE */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 6, AF12)>; /* FMC_NWAIT */
+			bias-pull-up;
+		};
+	};
+
+	fmc_sleep_pins_a: fmc-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, ANALOG)>, /* FMC_NOE */
+				 <STM32_PINMUX('D', 5, ANALOG)>, /* FMC_NWE */
+				 <STM32_PINMUX('D', 11, ANALOG)>, /* FMC_A16_FMC_CLE */
+				 <STM32_PINMUX('D', 12, ANALOG)>, /* FMC_A17_FMC_ALE */
+				 <STM32_PINMUX('D', 14, ANALOG)>, /* FMC_D0 */
+				 <STM32_PINMUX('D', 15, ANALOG)>, /* FMC_D1 */
+				 <STM32_PINMUX('D', 0, ANALOG)>, /* FMC_D2 */
+				 <STM32_PINMUX('D', 1, ANALOG)>, /* FMC_D3 */
+				 <STM32_PINMUX('E', 7, ANALOG)>, /* FMC_D4 */
+				 <STM32_PINMUX('E', 8, ANALOG)>, /* FMC_D5 */
+				 <STM32_PINMUX('E', 9, ANALOG)>, /* FMC_D6 */
+				 <STM32_PINMUX('E', 10, ANALOG)>, /* FMC_D7 */
+				 <STM32_PINMUX('D', 6, ANALOG)>, /* FMC_NWAIT */
+				 <STM32_PINMUX('G', 9, ANALOG)>; /* FMC_NE2_FMC_NCE */
+		};
+	};
+
+	i2c1_pins_a: i2c1-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 12, AF5)>, /* I2C1_SCL */
+				 <STM32_PINMUX('F', 15, AF5)>; /* I2C1_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c1_pins_sleep_a: i2c1-1 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 12, ANALOG)>, /* I2C1_SCL */
+				 <STM32_PINMUX('F', 15, ANALOG)>; /* I2C1_SDA */
+		};
+	};
+
+	i2c1_pins_b: i2c1-2 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 14, AF5)>, /* I2C1_SCL */
+				 <STM32_PINMUX('F', 15, AF5)>; /* I2C1_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c1_pins_sleep_b: i2c1-3 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 14, ANALOG)>, /* I2C1_SCL */
+				 <STM32_PINMUX('F', 15, ANALOG)>; /* I2C1_SDA */
+		};
+	};
+
+	i2c2_pins_a: i2c2-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 4, AF4)>, /* I2C2_SCL */
+				 <STM32_PINMUX('H', 5, AF4)>; /* I2C2_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c2_pins_sleep_a: i2c2-1 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 4, ANALOG)>, /* I2C2_SCL */
+				 <STM32_PINMUX('H', 5, ANALOG)>; /* I2C2_SDA */
+		};
+	};
+
+	i2c2_pins_b1: i2c2-2 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 5, AF4)>; /* I2C2_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c2_pins_sleep_b1: i2c2-3 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 5, ANALOG)>; /* I2C2_SDA */
+		};
+	};
+
+	i2c5_pins_a: i2c5-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 11, AF4)>, /* I2C5_SCL */
+				 <STM32_PINMUX('A', 12, AF4)>; /* I2C5_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c5_pins_sleep_a: i2c5-1 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 11, ANALOG)>, /* I2C5_SCL */
+				 <STM32_PINMUX('A', 12, ANALOG)>; /* I2C5_SDA */
+
+		};
+	};
+
+	i2s2_pins_a: i2s2-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 3, AF5)>, /* I2S2_SDO */
+				 <STM32_PINMUX('B', 9, AF5)>, /* I2S2_WS */
+				 <STM32_PINMUX('A', 9, AF5)>; /* I2S2_CK */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+	};
+
+	i2s2_pins_sleep_a: i2s2-1 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 3, ANALOG)>, /* I2S2_SDO */
+				 <STM32_PINMUX('B', 9, ANALOG)>, /* I2S2_WS */
+				 <STM32_PINMUX('A', 9, ANALOG)>; /* I2S2_CK */
+		};
+	};
+
+	ltdc_pins_a: ltdc-a-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G',  7, AF14)>, /* LCD_CLK */
+				 <STM32_PINMUX('I', 10, AF14)>, /* LCD_HSYNC */
+				 <STM32_PINMUX('I',  9, AF14)>, /* LCD_VSYNC */
+				 <STM32_PINMUX('F', 10, AF14)>, /* LCD_DE */
+				 <STM32_PINMUX('H',  2, AF14)>, /* LCD_R0 */
+				 <STM32_PINMUX('H',  3, AF14)>, /* LCD_R1 */
+				 <STM32_PINMUX('H',  8, AF14)>, /* LCD_R2 */
+				 <STM32_PINMUX('H',  9, AF14)>, /* LCD_R3 */
+				 <STM32_PINMUX('H', 10, AF14)>, /* LCD_R4 */
+				 <STM32_PINMUX('C',  0, AF14)>, /* LCD_R5 */
+				 <STM32_PINMUX('H', 12, AF14)>, /* LCD_R6 */
+				 <STM32_PINMUX('E', 15, AF14)>, /* LCD_R7 */
+				 <STM32_PINMUX('E',  5, AF14)>, /* LCD_G0 */
+				 <STM32_PINMUX('E',  6, AF14)>, /* LCD_G1 */
+				 <STM32_PINMUX('H', 13, AF14)>, /* LCD_G2 */
+				 <STM32_PINMUX('H', 14, AF14)>, /* LCD_G3 */
+				 <STM32_PINMUX('H', 15, AF14)>, /* LCD_G4 */
+				 <STM32_PINMUX('I',  0, AF14)>, /* LCD_G5 */
+				 <STM32_PINMUX('I',  1, AF14)>, /* LCD_G6 */
+				 <STM32_PINMUX('I',  2, AF14)>, /* LCD_G7 */
+				 <STM32_PINMUX('D',  9, AF14)>, /* LCD_B0 */
+				 <STM32_PINMUX('G', 12, AF14)>, /* LCD_B1 */
+				 <STM32_PINMUX('G', 10, AF14)>, /* LCD_B2 */
+				 <STM32_PINMUX('D', 10, AF14)>, /* LCD_B3 */
+				 <STM32_PINMUX('I',  4, AF14)>, /* LCD_B4 */
+				 <STM32_PINMUX('A',  3, AF14)>, /* LCD_B5 */
+				 <STM32_PINMUX('B',  8, AF14)>, /* LCD_B6 */
+				 <STM32_PINMUX('D',  8, AF14)>; /* LCD_B7 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+	};
+
+	ltdc_pins_sleep_a: ltdc-a-1 {
+		pins {
+			pinmux = <STM32_PINMUX('G',  7, ANALOG)>, /* LCD_CLK */
+				 <STM32_PINMUX('I', 10, ANALOG)>, /* LCD_HSYNC */
+				 <STM32_PINMUX('I',  9, ANALOG)>, /* LCD_VSYNC */
+				 <STM32_PINMUX('F', 10, ANALOG)>, /* LCD_DE */
+				 <STM32_PINMUX('H',  2, ANALOG)>, /* LCD_R0 */
+				 <STM32_PINMUX('H',  3, ANALOG)>, /* LCD_R1 */
+				 <STM32_PINMUX('H',  8, ANALOG)>, /* LCD_R2 */
+				 <STM32_PINMUX('H',  9, ANALOG)>, /* LCD_R3 */
+				 <STM32_PINMUX('H', 10, ANALOG)>, /* LCD_R4 */
+				 <STM32_PINMUX('C',  0, ANALOG)>, /* LCD_R5 */
+				 <STM32_PINMUX('H', 12, ANALOG)>, /* LCD_R6 */
+				 <STM32_PINMUX('E', 15, ANALOG)>, /* LCD_R7 */
+				 <STM32_PINMUX('E',  5, ANALOG)>, /* LCD_G0 */
+				 <STM32_PINMUX('E',  6, ANALOG)>, /* LCD_G1 */
+				 <STM32_PINMUX('H', 13, ANALOG)>, /* LCD_G2 */
+				 <STM32_PINMUX('H', 14, ANALOG)>, /* LCD_G3 */
+				 <STM32_PINMUX('H', 15, ANALOG)>, /* LCD_G4 */
+				 <STM32_PINMUX('I',  0, ANALOG)>, /* LCD_G5 */
+				 <STM32_PINMUX('I',  1, ANALOG)>, /* LCD_G6 */
+				 <STM32_PINMUX('I',  2, ANALOG)>, /* LCD_G7 */
+				 <STM32_PINMUX('D',  9, ANALOG)>, /* LCD_B0 */
+				 <STM32_PINMUX('G', 12, ANALOG)>, /* LCD_B1 */
+				 <STM32_PINMUX('G', 10, ANALOG)>, /* LCD_B2 */
+				 <STM32_PINMUX('D', 10, ANALOG)>, /* LCD_B3 */
+				 <STM32_PINMUX('I',  4, ANALOG)>, /* LCD_B4 */
+				 <STM32_PINMUX('A',  3, ANALOG)>, /* LCD_B5 */
+				 <STM32_PINMUX('B',  8, ANALOG)>, /* LCD_B6 */
+				 <STM32_PINMUX('D',  8, ANALOG)>; /* LCD_B7 */
+		};
+	};
+
+	ltdc_pins_b: ltdc-b-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 14, AF14)>, /* LCD_CLK */
+				 <STM32_PINMUX('I', 12, AF14)>, /* LCD_HSYNC */
+				 <STM32_PINMUX('I', 13, AF14)>, /* LCD_VSYNC */
+				 <STM32_PINMUX('K',  7, AF14)>, /* LCD_DE */
+				 <STM32_PINMUX('I', 15, AF14)>, /* LCD_R0 */
+				 <STM32_PINMUX('J',  0, AF14)>, /* LCD_R1 */
+				 <STM32_PINMUX('J',  1, AF14)>, /* LCD_R2 */
+				 <STM32_PINMUX('J',  2, AF14)>, /* LCD_R3 */
+				 <STM32_PINMUX('J',  3, AF14)>, /* LCD_R4 */
+				 <STM32_PINMUX('J',  4, AF14)>, /* LCD_R5 */
+				 <STM32_PINMUX('J',  5, AF14)>, /* LCD_R6 */
+				 <STM32_PINMUX('J',  6, AF14)>, /* LCD_R7 */
+				 <STM32_PINMUX('J',  7, AF14)>, /* LCD_G0 */
+				 <STM32_PINMUX('J',  8, AF14)>, /* LCD_G1 */
+				 <STM32_PINMUX('J',  9, AF14)>, /* LCD_G2 */
+				 <STM32_PINMUX('J', 10, AF14)>, /* LCD_G3 */
+				 <STM32_PINMUX('J', 11, AF14)>, /* LCD_G4 */
+				 <STM32_PINMUX('K',  0, AF14)>, /* LCD_G5 */
+				 <STM32_PINMUX('K',  1, AF14)>, /* LCD_G6 */
+				 <STM32_PINMUX('K',  2, AF14)>, /* LCD_G7 */
+				 <STM32_PINMUX('J', 12, AF14)>, /* LCD_B0 */
+				 <STM32_PINMUX('J', 13, AF14)>, /* LCD_B1 */
+				 <STM32_PINMUX('J', 14, AF14)>, /* LCD_B2 */
+				 <STM32_PINMUX('J', 15, AF14)>, /* LCD_B3 */
+				 <STM32_PINMUX('K',  3, AF14)>, /* LCD_B4 */
+				 <STM32_PINMUX('K',  4, AF14)>, /* LCD_B5 */
+				 <STM32_PINMUX('K',  5, AF14)>, /* LCD_B6 */
+				 <STM32_PINMUX('K',  6, AF14)>; /* LCD_B7 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+	};
+
+	ltdc_pins_sleep_b: ltdc-b-1 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 14, ANALOG)>, /* LCD_CLK */
+				 <STM32_PINMUX('I', 12, ANALOG)>, /* LCD_HSYNC */
+				 <STM32_PINMUX('I', 13, ANALOG)>, /* LCD_VSYNC */
+				 <STM32_PINMUX('K',  7, ANALOG)>, /* LCD_DE */
+				 <STM32_PINMUX('I', 15, ANALOG)>, /* LCD_R0 */
+				 <STM32_PINMUX('J',  0, ANALOG)>, /* LCD_R1 */
+				 <STM32_PINMUX('J',  1, ANALOG)>, /* LCD_R2 */
+				 <STM32_PINMUX('J',  2, ANALOG)>, /* LCD_R3 */
+				 <STM32_PINMUX('J',  3, ANALOG)>, /* LCD_R4 */
+				 <STM32_PINMUX('J',  4, ANALOG)>, /* LCD_R5 */
+				 <STM32_PINMUX('J',  5, ANALOG)>, /* LCD_R6 */
+				 <STM32_PINMUX('J',  6, ANALOG)>, /* LCD_R7 */
+				 <STM32_PINMUX('J',  7, ANALOG)>, /* LCD_G0 */
+				 <STM32_PINMUX('J',  8, ANALOG)>, /* LCD_G1 */
+				 <STM32_PINMUX('J',  9, ANALOG)>, /* LCD_G2 */
+				 <STM32_PINMUX('J', 10, ANALOG)>, /* LCD_G3 */
+				 <STM32_PINMUX('J', 11, ANALOG)>, /* LCD_G4 */
+				 <STM32_PINMUX('K',  0, ANALOG)>, /* LCD_G5 */
+				 <STM32_PINMUX('K',  1, ANALOG)>, /* LCD_G6 */
+				 <STM32_PINMUX('K',  2, ANALOG)>, /* LCD_G7 */
+				 <STM32_PINMUX('J', 12, ANALOG)>, /* LCD_B0 */
+				 <STM32_PINMUX('J', 13, ANALOG)>, /* LCD_B1 */
+				 <STM32_PINMUX('J', 14, ANALOG)>, /* LCD_B2 */
+				 <STM32_PINMUX('J', 15, ANALOG)>, /* LCD_B3 */
+				 <STM32_PINMUX('K',  3, ANALOG)>, /* LCD_B4 */
+				 <STM32_PINMUX('K',  4, ANALOG)>, /* LCD_B5 */
+				 <STM32_PINMUX('K',  5, ANALOG)>, /* LCD_B6 */
+				 <STM32_PINMUX('K',  6, ANALOG)>; /* LCD_B7 */
+		};
+	};
+
+	m_can1_pins_a: m-can1-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('H', 13, AF9)>; /* CAN1_TX */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('I', 9, AF9)>; /* CAN1_RX */
+			bias-disable;
+		};
+	};
+
+	m_can1_sleep_pins_a: m_can1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 13, ANALOG)>, /* CAN1_TX */
+				 <STM32_PINMUX('I', 9, ANALOG)>; /* CAN1_RX */
+		};
+	};
+
+	pwm1_pins_a: pwm1-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 9, AF1)>, /* TIM1_CH1 */
+				 <STM32_PINMUX('E', 11, AF1)>, /* TIM1_CH2 */
+				 <STM32_PINMUX('E', 14, AF1)>; /* TIM1_CH4 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	pwm1_sleep_pins_a: pwm1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 9, ANALOG)>, /* TIM1_CH1 */
+				 <STM32_PINMUX('E', 11, ANALOG)>, /* TIM1_CH2 */
+				 <STM32_PINMUX('E', 14, ANALOG)>; /* TIM1_CH4 */
+		};
+	};
+
+	pwm2_pins_a: pwm2-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 3, AF1)>; /* TIM2_CH4 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	pwm2_sleep_pins_a: pwm2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 3, ANALOG)>; /* TIM2_CH4 */
+		};
+	};
+
+	pwm3_pins_a: pwm3-0 {
+		pins {
+			pinmux = <STM32_PINMUX('C', 7, AF2)>; /* TIM3_CH2 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	pwm3_sleep_pins_a: pwm3-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('C', 7, ANALOG)>; /* TIM3_CH2 */
+		};
+	};
+
+	pwm4_pins_a: pwm4-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 14, AF2)>, /* TIM4_CH3 */
+				 <STM32_PINMUX('D', 15, AF2)>; /* TIM4_CH4 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	pwm4_sleep_pins_a: pwm4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 14, ANALOG)>, /* TIM4_CH3 */
+				 <STM32_PINMUX('D', 15, ANALOG)>; /* TIM4_CH4 */
+		};
+	};
+
+	pwm4_pins_b: pwm4-1 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 13, AF2)>; /* TIM4_CH2 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	pwm4_sleep_pins_b: pwm4-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 13, ANALOG)>; /* TIM4_CH2 */
+		};
+	};
+
+	pwm5_pins_a: pwm5-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 11, AF2)>; /* TIM5_CH2 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	pwm5_sleep_pins_a: pwm5-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 11, ANALOG)>; /* TIM5_CH2 */
+		};
+	};
+
+	pwm8_pins_a: pwm8-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 2, AF3)>; /* TIM8_CH4 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	pwm8_sleep_pins_a: pwm8-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 2, ANALOG)>; /* TIM8_CH4 */
+		};
+	};
+
+	pwm12_pins_a: pwm12-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 6, AF2)>; /* TIM12_CH1 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	pwm12_sleep_pins_a: pwm12-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 6, ANALOG)>; /* TIM12_CH1 */
+		};
+	};
+
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
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 8, AF10)>, /* QSPI_BK1_IO0 */
+				 <STM32_PINMUX('F', 9, AF10)>, /* QSPI_BK1_IO1 */
+				 <STM32_PINMUX('F', 7, AF9)>, /* QSPI_BK1_IO2 */
+				 <STM32_PINMUX('F', 6, AF9)>; /* QSPI_BK1_IO3 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 6, AF10)>; /* QSPI_BK1_NCS */
+			bias-pull-up;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+	};
+
+	qspi_bk1_sleep_pins_a: qspi-bk1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 8, ANALOG)>, /* QSPI_BK1_IO0 */
+				 <STM32_PINMUX('F', 9, ANALOG)>, /* QSPI_BK1_IO1 */
+				 <STM32_PINMUX('F', 7, ANALOG)>, /* QSPI_BK1_IO2 */
+				 <STM32_PINMUX('F', 6, ANALOG)>, /* QSPI_BK1_IO3 */
+				 <STM32_PINMUX('B', 6, ANALOG)>; /* QSPI_BK1_NCS */
+		};
+	};
+
+	qspi_bk2_pins_a: qspi-bk2-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('H', 2, AF9)>, /* QSPI_BK2_IO0 */
+				 <STM32_PINMUX('H', 3, AF9)>, /* QSPI_BK2_IO1 */
+				 <STM32_PINMUX('G', 10, AF11)>, /* QSPI_BK2_IO2 */
+				 <STM32_PINMUX('G', 7, AF11)>; /* QSPI_BK2_IO3 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('C', 0, AF10)>; /* QSPI_BK2_NCS */
+			bias-pull-up;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+	};
+
+	qspi_bk2_sleep_pins_a: qspi-bk2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 2, ANALOG)>, /* QSPI_BK2_IO0 */
+				 <STM32_PINMUX('H', 3, ANALOG)>, /* QSPI_BK2_IO1 */
+				 <STM32_PINMUX('G', 10, ANALOG)>, /* QSPI_BK2_IO2 */
+				 <STM32_PINMUX('G', 7, ANALOG)>, /* QSPI_BK2_IO3 */
+				 <STM32_PINMUX('C', 0, ANALOG)>; /* QSPI_BK2_NCS */
+		};
+	};
+
+	sai2a_pins_a: sai2a-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 5, AF10)>, /* SAI2_SCK_A */
+				 <STM32_PINMUX('I', 6, AF10)>, /* SAI2_SD_A */
+				 <STM32_PINMUX('I', 7, AF10)>, /* SAI2_FS_A */
+				 <STM32_PINMUX('E', 0, AF10)>; /* SAI2_MCLK_A */
+			slew-rate = <0>;
+			drive-push-pull;
+			bias-disable;
+		};
+	};
+
+	sai2a_sleep_pins_a: sai2a-1 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 5, ANALOG)>, /* SAI2_SCK_A */
+				 <STM32_PINMUX('I', 6, ANALOG)>, /* SAI2_SD_A */
+				 <STM32_PINMUX('I', 7, ANALOG)>, /* SAI2_FS_A */
+				 <STM32_PINMUX('E', 0, ANALOG)>; /* SAI2_MCLK_A */
+		};
+	};
+
+	sai2b_pins_a: sai2b-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 12, AF10)>, /* SAI2_SCK_B */
+				 <STM32_PINMUX('E', 13, AF10)>, /* SAI2_FS_B */
+				 <STM32_PINMUX('E', 14, AF10)>; /* SAI2_MCLK_B */
+			slew-rate = <0>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 11, AF10)>; /* SAI2_SD_B */
+			bias-disable;
+		};
+	};
+
+	sai2b_sleep_pins_a: sai2b-1 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 11, ANALOG)>, /* SAI2_SD_B */
+				 <STM32_PINMUX('E', 12, ANALOG)>, /* SAI2_SCK_B */
+				 <STM32_PINMUX('E', 13, ANALOG)>, /* SAI2_FS_B */
+				 <STM32_PINMUX('E', 14, ANALOG)>; /* SAI2_MCLK_B */
+		};
+	};
+
+	sai2b_pins_b: sai2b-2 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 11, AF10)>; /* SAI2_SD_B */
+			bias-disable;
+		};
+	};
+
+	sai2b_sleep_pins_b: sai2b-3 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 11, ANALOG)>; /* SAI2_SD_B */
+		};
+	};
+
+	sai4a_pins_a: sai4a-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 5, AF10)>; /* SAI4_SD_A */
+			slew-rate = <0>;
+			drive-push-pull;
+			bias-disable;
+		};
+	};
+
+	sai4a_sleep_pins_a: sai4a-1 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 5, ANALOG)>; /* SAI4_SD_A */
+		};
+	};
+
+	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
+				 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
+				 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
+				 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
+				 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-disable;
+		};
+	};
+
+	sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
+				 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
+				 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
+				 <STM32_PINMUX('C', 11, AF12)>; /* SDMMC1_D3 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
+			slew-rate = <1>;
+			drive-open-drain;
+			bias-disable;
+		};
+	};
+
+	sdmmc1_b4_sleep_pins_a: sdmmc1-b4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('C', 8, ANALOG)>, /* SDMMC1_D0 */
+				 <STM32_PINMUX('C', 9, ANALOG)>, /* SDMMC1_D1 */
+				 <STM32_PINMUX('C', 10, ANALOG)>, /* SDMMC1_D2 */
+				 <STM32_PINMUX('C', 11, ANALOG)>, /* SDMMC1_D3 */
+				 <STM32_PINMUX('C', 12, ANALOG)>, /* SDMMC1_CK */
+				 <STM32_PINMUX('D', 2, ANALOG)>; /* SDMMC1_CMD */
+		};
+	};
+
+	sdmmc1_dir_pins_a: sdmmc1-dir-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 2, AF11)>, /* SDMMC1_D0DIR */
+				 <STM32_PINMUX('C', 7, AF8)>, /* SDMMC1_D123DIR */
+				 <STM32_PINMUX('B', 9, AF11)>; /* SDMMC1_CDIR */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2{
+			pinmux = <STM32_PINMUX('E', 4, AF8)>; /* SDMMC1_CKIN */
+			bias-pull-up;
+		};
+	};
+
+	sdmmc1_dir_sleep_pins_a: sdmmc1-dir-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 2, ANALOG)>, /* SDMMC1_D0DIR */
+				 <STM32_PINMUX('C', 7, ANALOG)>, /* SDMMC1_D123DIR */
+				 <STM32_PINMUX('B', 9, ANALOG)>, /* SDMMC1_CDIR */
+				 <STM32_PINMUX('E', 4, ANALOG)>; /* SDMMC1_CKIN */
+		};
+	};
+
+	sdmmc2_b4_pins_a: sdmmc2-b4-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('B', 4, AF9)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 3, AF9)>; /* SDMMC2_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+	};
+
+	sdmmc2_b4_od_pins_a: sdmmc2-b4-od-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('B', 4, AF9)>; /* SDMMC2_D3 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 3, AF9)>; /* SDMMC2_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
+			slew-rate = <1>;
+			drive-open-drain;
+			bias-pull-up;
+		};
+	};
+
+	sdmmc2_b4_sleep_pins_a: sdmmc2-b4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 14, ANALOG)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('B', 15, ANALOG)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('B', 3, ANALOG)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('B', 4, ANALOG)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('E', 3, ANALOG)>, /* SDMMC2_CK */
+				 <STM32_PINMUX('G', 6, ANALOG)>; /* SDMMC2_CMD */
+		};
+	};
+
+	sdmmc2_b4_pins_b: sdmmc2-b4-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('B', 4, AF9)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 3, AF9)>; /* SDMMC2_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-disable;
+		};
+	};
+
+	sdmmc2_b4_od_pins_b: sdmmc2-b4-od-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('B', 4, AF9)>; /* SDMMC2_D3 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 3, AF9)>; /* SDMMC2_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
+			slew-rate = <1>;
+			drive-open-drain;
+			bias-disable;
+		};
+	};
+
+	sdmmc2_d47_pins_a: sdmmc2-d47-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 8, AF9)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('A', 9, AF10)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 5, AF9)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('D', 3, AF9)>; /* SDMMC2_D7 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+	};
+
+	sdmmc2_d47_sleep_pins_a: sdmmc2-d47-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 8, ANALOG)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('A', 9, ANALOG)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 5, ANALOG)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('D', 3, ANALOG)>; /* SDMMC2_D7 */
+		};
+	};
+
+	sdmmc3_b4_pins_a: sdmmc3-b4-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 0, AF9)>, /* SDMMC3_D0 */
+				 <STM32_PINMUX('F', 4, AF9)>, /* SDMMC3_D1 */
+				 <STM32_PINMUX('F', 5, AF9)>, /* SDMMC3_D2 */
+				 <STM32_PINMUX('D', 7, AF10)>, /* SDMMC3_D3 */
+				 <STM32_PINMUX('F', 1, AF9)>; /* SDMMC3_CMD */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('G', 15, AF10)>; /* SDMMC3_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+	};
+
+	sdmmc3_b4_od_pins_a: sdmmc3-b4-od-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 0, AF9)>, /* SDMMC3_D0 */
+				 <STM32_PINMUX('F', 4, AF9)>, /* SDMMC3_D1 */
+				 <STM32_PINMUX('F', 5, AF9)>, /* SDMMC3_D2 */
+				 <STM32_PINMUX('D', 7, AF10)>; /* SDMMC3_D3 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('G', 15, AF10)>; /* SDMMC3_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('F', 1, AF9)>; /* SDMMC2_CMD */
+			slew-rate = <1>;
+			drive-open-drain;
+			bias-pull-up;
+		};
+	};
+
+	sdmmc3_b4_sleep_pins_a: sdmmc3-b4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 0, ANALOG)>, /* SDMMC3_D0 */
+				 <STM32_PINMUX('F', 4, ANALOG)>, /* SDMMC3_D1 */
+				 <STM32_PINMUX('F', 5, ANALOG)>, /* SDMMC3_D2 */
+				 <STM32_PINMUX('D', 7, ANALOG)>, /* SDMMC3_D3 */
+				 <STM32_PINMUX('G', 15, ANALOG)>, /* SDMMC3_CK */
+				 <STM32_PINMUX('F', 1, ANALOG)>; /* SDMMC3_CMD */
+		};
+	};
+
+	spdifrx_pins_a: spdifrx-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 12, AF8)>; /* SPDIF_IN1 */
+			bias-disable;
+		};
+	};
+
+	spdifrx_sleep_pins_a: spdifrx-1 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 12, ANALOG)>; /* SPDIF_IN1 */
+		};
+	};
+
+	spi2_pins_a: spi2-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 10, AF5)>, /* SPI2_SCK */
+				 <STM32_PINMUX('I', 0, AF5)>, /* SPI2_NSS */
+				 <STM32_PINMUX('I', 3, AF5)>; /* SPI2_MOSI */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI2_MISO */
+			bias-disable;
+		};
+	};
+
+	stusb1600_pins_a: stusb1600-0 {
+			pins {
+				pinmux = <STM32_PINMUX('I', 11, ANALOG)>;
+				bias-pull-up;
+		};
+	};
+
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
+	uart7_pins_a: uart7-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 8, AF7)>; /* UART4_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 7, AF7)>, /* UART4_RX */
+				 <STM32_PINMUX('E', 10, AF7)>, /* UART4_CTS */
+				 <STM32_PINMUX('E', 9, AF7)>; /* UART4_RTS */
+			bias-disable;
+		};
+	};
+};
+
+&pinctrl_z {
+	i2c2_pins_b2: i2c2-0 {
+		pins {
+			pinmux = <STM32_PINMUX('Z', 0, AF3)>; /* I2C2_SCL */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c2_pins_sleep_b2: i2c2-1 {
+		pins {
+			pinmux = <STM32_PINMUX('Z', 0, ANALOG)>; /* I2C2_SCL */
+		};
+	};
+
+	i2c4_pins_a: i2c4-0 {
+		pins {
+			pinmux = <STM32_PINMUX('Z', 4, AF6)>, /* I2C4_SCL */
+				 <STM32_PINMUX('Z', 5, AF6)>; /* I2C4_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c4_pins_sleep_a: i2c4-1 {
+		pins {
+			pinmux = <STM32_PINMUX('Z', 4, ANALOG)>, /* I2C4_SCL */
+				 <STM32_PINMUX('Z', 5, ANALOG)>; /* I2C4_SDA */
+		};
+	};
+
+	spi1_pins_a: spi1-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('Z', 0, AF5)>, /* SPI1_SCK */
+				 <STM32_PINMUX('Z', 2, AF5)>; /* SPI1_MOSI */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+
+		pins2 {
+			pinmux = <STM32_PINMUX('Z', 1, AF5)>; /* SPI1_MISO */
+			bias-disable;
+		};
+	};
+};
diff --git a/arch/arm/dts/stm32mp157c.dtsi b/arch/arm/dts/stm32mp151.dtsi
similarity index 89%
rename from arch/arm/dts/stm32mp157c.dtsi
rename to arch/arm/dts/stm32mp151.dtsi
index 22a9386248..f185639a46 100644
--- a/arch/arm/dts/stm32mp157c.dtsi
+++ b/arch/arm/dts/stm32mp151.dtsi
@@ -20,12 +20,6 @@
 			device_type = "cpu";
 			reg = <0>;
 		};
-
-		cpu1: cpu@1 {
-			compatible = "arm,cortex-a7";
-			device_type = "cpu";
-			reg = <1>;
-		};
 	};
 
 	psci {
@@ -155,6 +149,11 @@
 				reg = <1>;
 				status = "disabled";
 			};
+
+			counter {
+				compatible = "st,stm32-timer-counter";
+				status = "disabled";
+			};
 		};
 
 		timers3: timer@40001000 {
@@ -184,6 +183,11 @@
 				reg = <2>;
 				status = "disabled";
 			};
+
+			counter {
+				compatible = "st,stm32-timer-counter";
+				status = "disabled";
+			};
 		};
 
 		timers4: timer@40002000 {
@@ -211,6 +215,11 @@
 				reg = <3>;
 				status = "disabled";
 			};
+
+			counter {
+				compatible = "st,stm32-timer-counter";
+				status = "disabled";
+			};
 		};
 
 		timers5: timer@40003000 {
@@ -240,6 +249,11 @@
 				reg = <4>;
 				status = "disabled";
 			};
+
+			counter {
+				compatible = "st,stm32-timer-counter";
+				status = "disabled";
+			};
 		};
 
 		timers6: timer@40004000 {
@@ -596,6 +610,11 @@
 				reg = <0>;
 				status = "disabled";
 			};
+
+			counter {
+				compatible = "st,stm32-timer-counter";
+				status = "disabled";
+			};
 		};
 
 		timers8: timer@44001000 {
@@ -627,6 +646,11 @@
 				reg = <7>;
 				status = "disabled";
 			};
+
+			counter {
+				compatible = "st,stm32-timer-counter";
+				status = "disabled";
+			};
 		};
 
 		usart6: serial@44003000 {
@@ -930,33 +954,7 @@
 			};
 		};
 
-		m_can1: can@4400e000 {
-			compatible = "bosch,m_can";
-			reg = <0x4400e000 0x400>, <0x44011000 0x1400>;
-			reg-names = "m_can", "message_ram";
-			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "int0", "int1";
-			clocks = <&rcc CK_HSE>, <&rcc FDCAN_K>;
-			clock-names = "hclk", "cclk";
-			bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
-			status = "disabled";
-		};
-
-		m_can2: can@4400f000 {
-			compatible = "bosch,m_can";
-			reg = <0x4400f000 0x400>, <0x44011000 0x2800>;
-			reg-names = "m_can", "message_ram";
-			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "int0", "int1";
-			clocks = <&rcc CK_HSE>, <&rcc FDCAN_K>;
-			clock-names = "hclk", "cclk";
-			bosch,mram-cfg = <0x1400 0 0 32 0 0 2 2>;
-			status = "disabled";
-		};
-
-		dma1: dma@48000000 {
+		dma1: dma-controller@48000000 {
 			compatible = "st,stm32-dma";
 			reg = <0x48000000 0x400>;
 			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
@@ -973,7 +971,7 @@
 			dma-requests = <8>;
 		};
 
-		dma2: dma@48001000 {
+		dma2: dma-controller@48001000 {
 			compatible = "st,stm32-dma";
 			reg = <0x48001000 0x400>;
 			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
@@ -1041,8 +1039,8 @@
 			compatible = "arm,pl18x", "arm,primecell";
 			arm,primecell-periphid = <0x10153180>;
 			reg = <0x48004000 0x400>;
-			reg-names = "sdmmc";
-			interrupts = <GIC_SPI 137 IRQ_TYPE_NONE>;
+			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "cmd_irq";
 			clocks = <&rcc SDMMC3_K>;
 			clock-names = "apb_pclk";
 			resets = <&rcc SDMMC3_R>;
@@ -1273,15 +1271,6 @@
 			status = "disabled";
 		};
 
-		cryp1: cryp@54001000 {
-			compatible = "st,stm32mp1-cryp";
-			reg = <0x54001000 0x400>;
-			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc CRYP1>;
-			resets = <&rcc CRYP1_R>;
-			status = "disabled";
-		};
-
 		hash1: hash@54002000 {
 			compatible = "st,stm32f756-hash";
 			reg = <0x54002000 0x400>;
@@ -1302,7 +1291,7 @@
 			status = "disabled";
 		};
 
-		mdma1: dma@58000000 {
+		mdma1: dma-controller@58000000 {
 			compatible = "st,stm32h7-mdma";
 			reg = <0x58000000 0x1000>;
 			interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
@@ -1349,20 +1338,22 @@
 			arm,primecell-periphid = <0x10153180>;
 			reg = <0x58005000 0x1000>;
 			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names	= "cmd_irq";
+			interrupt-names = "cmd_irq";
 			clocks = <&rcc SDMMC1_K>;
 			clock-names = "apb_pclk";
 			resets = <&rcc SDMMC1_R>;
 			cap-sd-highspeed;
 			cap-mmc-highspeed;
 			max-frequency = <120000000>;
+			status = "disabled";
 		};
 
 		sdmmc2: sdmmc@58007000 {
 			compatible = "arm,pl18x", "arm,primecell";
 			arm,primecell-periphid = <0x10153180>;
 			reg = <0x58007000 0x1000>;
-			interrupts = <GIC_SPI 124 IRQ_TYPE_NONE>;
+			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "cmd_irq";
 			clocks = <&rcc SDMMC2_K>;
 			clock-names = "apb_pclk";
 			resets = <&rcc SDMMC2_R>;
@@ -1406,6 +1397,7 @@
 			st,syscon = <&syscfg 0x4>;
 			snps,mixed-burst;
 			snps,pbl = <2>;
+			snps,en-tx-lpi-clockgating;
 			snps,axi-config = <&stmmac_axi_config_0>;
 			snps,tso;
 			status = "disabled";
@@ -1430,26 +1422,6 @@
 			status = "disabled";
 		};
 
-		gpu: gpu@59000000 {
-			compatible = "vivante,gc";
-			reg = <0x59000000 0x800>;
-			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc GPU>, <&rcc GPU_K>;
-			clock-names = "bus" ,"core";
-			resets = <&rcc GPU_R>;
-			status = "disabled";
-		};
-
-		dsi: dsi@5a000000 {
-			compatible = "st,stm32-dsi";
-			reg = <0x5a000000 0x800>;
-			clocks = <&rcc DSI_K>, <&clk_hse>, <&rcc DSI_PX>;
-			clock-names = "pclk", "ref", "px_clk";
-			resets = <&rcc DSI_R>;
-			reset-names = "apb";
-			status = "disabled";
-		};
-
 		ltdc: display-controller@5a001000 {
 			compatible = "st,stm32-ltdc";
 			reg = <0x5a001000 0x400>;
@@ -1535,7 +1507,7 @@
 			status = "disabled";
 		};
 
-		bsec: nvmem@5c005000 {
+		bsec: efuse@5c005000 {
 			compatible = "st,stm32mp15-bsec";
 			reg = <0x5c005000 0x400>;
 			#address-cells = <1>;
@@ -1560,12 +1532,172 @@
 			#size-cells = <0>;
 			status = "disabled";
 		};
+
+		/*
+		 * Break node order to solve dependency probe issue between
+		 * pinctrl and exti.
+		 */
+		pinctrl: pin-controller@50002000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "st,stm32mp157-pinctrl";
+			ranges = <0 0x50002000 0xa400>;
+			interrupt-parent = <&exti>;
+			st,syscfg = <&exti 0x60 0xff>;
+			hwlocks = <&hwspinlock 0>;
+			pins-are-numbered;
+
+			gpioa: gpio@50002000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x0 0x400>;
+				clocks = <&rcc GPIOA>;
+				st,bank-name = "GPIOA";
+				status = "disabled";
+			};
+
+			gpiob: gpio@50003000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x1000 0x400>;
+				clocks = <&rcc GPIOB>;
+				st,bank-name = "GPIOB";
+				status = "disabled";
+			};
+
+			gpioc: gpio@50004000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x2000 0x400>;
+				clocks = <&rcc GPIOC>;
+				st,bank-name = "GPIOC";
+				status = "disabled";
+			};
+
+			gpiod: gpio@50005000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x3000 0x400>;
+				clocks = <&rcc GPIOD>;
+				st,bank-name = "GPIOD";
+				status = "disabled";
+			};
+
+			gpioe: gpio@50006000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x4000 0x400>;
+				clocks = <&rcc GPIOE>;
+				st,bank-name = "GPIOE";
+				status = "disabled";
+			};
+
+			gpiof: gpio@50007000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x5000 0x400>;
+				clocks = <&rcc GPIOF>;
+				st,bank-name = "GPIOF";
+				status = "disabled";
+			};
+
+			gpiog: gpio@50008000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x6000 0x400>;
+				clocks = <&rcc GPIOG>;
+				st,bank-name = "GPIOG";
+				status = "disabled";
+			};
+
+			gpioh: gpio@50009000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x7000 0x400>;
+				clocks = <&rcc GPIOH>;
+				st,bank-name = "GPIOH";
+				status = "disabled";
+			};
+
+			gpioi: gpio@5000a000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x8000 0x400>;
+				clocks = <&rcc GPIOI>;
+				st,bank-name = "GPIOI";
+				status = "disabled";
+			};
+
+			gpioj: gpio@5000b000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0x9000 0x400>;
+				clocks = <&rcc GPIOJ>;
+				st,bank-name = "GPIOJ";
+				status = "disabled";
+			};
+
+			gpiok: gpio@5000c000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0xa000 0x400>;
+				clocks = <&rcc GPIOK>;
+				st,bank-name = "GPIOK";
+				status = "disabled";
+			};
+		};
+
+		pinctrl_z: pin-controller-z@54004000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "st,stm32mp157-z-pinctrl";
+			ranges = <0 0x54004000 0x400>;
+			pins-are-numbered;
+			interrupt-parent = <&exti>;
+			st,syscfg = <&exti 0x60 0xff>;
+			hwlocks = <&hwspinlock 0>;
+
+			gpioz: gpio@54004000 {
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				reg = <0 0x400>;
+				clocks = <&rcc GPIOZ>;
+				st,bank-name = "GPIOZ";
+				st,bank-ioport = <11>;
+				status = "disabled";
+			};
+		};
 	};
 
-	mlahb {
-		compatible = "simple-bus";
+	mlahb: ahb {
+		compatible = "st,mlahb", "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
+		ranges;
 		dma-ranges = <0x00000000 0x38000000 0x10000>,
 			     <0x10000000 0x10000000 0x60000>,
 			     <0x30000000 0x30000000 0x60000>;
diff --git a/arch/arm/dts/stm32mp153.dtsi b/arch/arm/dts/stm32mp153.dtsi
new file mode 100644
index 0000000000..2d759fc601
--- /dev/null
+++ b/arch/arm/dts/stm32mp153.dtsi
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@st.com> for STMicroelectronics.
+ */
+
+#include "stm32mp151.dtsi"
+
+/ {
+	cpus {
+		cpu1: cpu@1 {
+			compatible = "arm,cortex-a7";
+			device_type = "cpu";
+			reg = <1>;
+		};
+	};
+
+	soc {
+		m_can1: can@4400e000 {
+			compatible = "bosch,m_can";
+			reg = <0x4400e000 0x400>, <0x44011000 0x1400>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&rcc CK_HSE>, <&rcc FDCAN_K>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
+			status = "disabled";
+		};
+
+		m_can2: can@4400f000 {
+			compatible = "bosch,m_can";
+			reg = <0x4400f000 0x400>, <0x44011000 0x2800>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&rcc CK_HSE>, <&rcc FDCAN_K>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x1400 0 0 32 0 0 2 2>;
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/arm/dts/stm32mp157-pinctrl.dtsi b/arch/arm/dts/stm32mp157-pinctrl.dtsi
deleted file mode 100644
index 81a363d93d..0000000000
--- a/arch/arm/dts/stm32mp157-pinctrl.dtsi
+++ /dev/null
@@ -1,1057 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2017 - All Rights Reserved
- * Author: Ludovic Barre <ludovic.barre@st.com> for STMicroelectronics.
- */
-#include <dt-bindings/pinctrl/stm32-pinfunc.h>
-
-/ {
-	soc {
-		pinctrl: pin-controller@50002000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "st,stm32mp157-pinctrl";
-			ranges = <0 0x50002000 0xa400>;
-			interrupt-parent = <&exti>;
-			st,syscfg = <&exti 0x60 0xff>;
-			hwlocks = <&hwspinlock 0>;
-			pins-are-numbered;
-
-			gpioa: gpio@50002000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x0 0x400>;
-				clocks = <&rcc GPIOA>;
-				st,bank-name = "GPIOA";
-				status = "disabled";
-			};
-
-			gpiob: gpio@50003000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x1000 0x400>;
-				clocks = <&rcc GPIOB>;
-				st,bank-name = "GPIOB";
-				status = "disabled";
-			};
-
-			gpioc: gpio@50004000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x2000 0x400>;
-				clocks = <&rcc GPIOC>;
-				st,bank-name = "GPIOC";
-				status = "disabled";
-			};
-
-			gpiod: gpio@50005000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x3000 0x400>;
-				clocks = <&rcc GPIOD>;
-				st,bank-name = "GPIOD";
-				status = "disabled";
-			};
-
-			gpioe: gpio@50006000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x4000 0x400>;
-				clocks = <&rcc GPIOE>;
-				st,bank-name = "GPIOE";
-				status = "disabled";
-			};
-
-			gpiof: gpio@50007000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x5000 0x400>;
-				clocks = <&rcc GPIOF>;
-				st,bank-name = "GPIOF";
-				status = "disabled";
-			};
-
-			gpiog: gpio@50008000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x6000 0x400>;
-				clocks = <&rcc GPIOG>;
-				st,bank-name = "GPIOG";
-				status = "disabled";
-			};
-
-			gpioh: gpio@50009000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x7000 0x400>;
-				clocks = <&rcc GPIOH>;
-				st,bank-name = "GPIOH";
-				status = "disabled";
-			};
-
-			gpioi: gpio@5000a000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x8000 0x400>;
-				clocks = <&rcc GPIOI>;
-				st,bank-name = "GPIOI";
-				status = "disabled";
-			};
-
-			gpioj: gpio@5000b000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0x9000 0x400>;
-				clocks = <&rcc GPIOJ>;
-				st,bank-name = "GPIOJ";
-				status = "disabled";
-			};
-
-			gpiok: gpio@5000c000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0xa000 0x400>;
-				clocks = <&rcc GPIOK>;
-				st,bank-name = "GPIOK";
-				status = "disabled";
-			};
-
-			adc12_ain_pins_a: adc12-ain-0 {
-				pins {
-					pinmux = <STM32_PINMUX('C', 3, ANALOG)>, /* ADC1 in13 */
-						 <STM32_PINMUX('F', 12, ANALOG)>, /* ADC1 in6 */
-						 <STM32_PINMUX('F', 13, ANALOG)>, /* ADC2 in2 */
-						 <STM32_PINMUX('F', 14, ANALOG)>; /* ADC2 in6 */
-				};
-			};
-
-			adc12_usb_cc_pins_a: adc12-usb-cc-pins-0 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 4, ANALOG)>, /* ADC12 in18 */
-						 <STM32_PINMUX('A', 5, ANALOG)>; /* ADC12 in19 */
-				};
-			};
-
-			cec_pins_a: cec-0 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 15, AF4)>;
-					bias-disable;
-					drive-open-drain;
-					slew-rate = <0>;
-				};
-			};
-
-			cec_pins_sleep_a: cec-sleep-0 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 15, ANALOG)>; /* HDMI_CEC */
-				};
-			};
-
-			cec_pins_b: cec-1 {
-				pins {
-					pinmux = <STM32_PINMUX('B', 6, AF5)>;
-					bias-disable;
-					drive-open-drain;
-					slew-rate = <0>;
-				};
-			};
-
-			cec_pins_sleep_b: cec-sleep-1 {
-				pins {
-					pinmux = <STM32_PINMUX('B', 6, ANALOG)>; /* HDMI_CEC */
-				};
-			};
-
-			dac_ch1_pins_a: dac-ch1 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 4, ANALOG)>;
-				};
-			};
-
-			dac_ch2_pins_a: dac-ch2 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 5, ANALOG)>;
-				};
-			};
-
-			dcmi_pins_a: dcmi-0 {
-				pins {
-					pinmux = <STM32_PINMUX('H', 8,  AF13)>,/* DCMI_HSYNC */
-						 <STM32_PINMUX('B', 7,  AF13)>,/* DCMI_VSYNC */
-						 <STM32_PINMUX('A', 6,  AF13)>,/* DCMI_PIXCLK */
-						 <STM32_PINMUX('H', 9,  AF13)>,/* DCMI_D0 */
-						 <STM32_PINMUX('H', 10, AF13)>,/* DCMI_D1 */
-						 <STM32_PINMUX('H', 11, AF13)>,/* DCMI_D2 */
-						 <STM32_PINMUX('H', 12, AF13)>,/* DCMI_D3 */
-						 <STM32_PINMUX('H', 14, AF13)>,/* DCMI_D4 */
-						 <STM32_PINMUX('I', 4,  AF13)>,/* DCMI_D5 */
-						 <STM32_PINMUX('B', 8,  AF13)>,/* DCMI_D6 */
-						 <STM32_PINMUX('E', 6,  AF13)>,/* DCMI_D7 */
-						 <STM32_PINMUX('I', 1,  AF13)>,/* DCMI_D8 */
-						 <STM32_PINMUX('H', 7,  AF13)>,/* DCMI_D9 */
-						 <STM32_PINMUX('I', 3,  AF13)>,/* DCMI_D10 */
-						 <STM32_PINMUX('H', 15, AF13)>;/* DCMI_D11 */
-					bias-disable;
-				};
-			};
-
-			dcmi_sleep_pins_a: dcmi-sleep-0 {
-				pins {
-					pinmux = <STM32_PINMUX('H', 8,  ANALOG)>,/* DCMI_HSYNC */
-						 <STM32_PINMUX('B', 7,  ANALOG)>,/* DCMI_VSYNC */
-						 <STM32_PINMUX('A', 6,  ANALOG)>,/* DCMI_PIXCLK */
-						 <STM32_PINMUX('H', 9,  ANALOG)>,/* DCMI_D0 */
-						 <STM32_PINMUX('H', 10, ANALOG)>,/* DCMI_D1 */
-						 <STM32_PINMUX('H', 11, ANALOG)>,/* DCMI_D2 */
-						 <STM32_PINMUX('H', 12, ANALOG)>,/* DCMI_D3 */
-						 <STM32_PINMUX('H', 14, ANALOG)>,/* DCMI_D4 */
-						 <STM32_PINMUX('I', 4,  ANALOG)>,/* DCMI_D5 */
-						 <STM32_PINMUX('B', 8,  ANALOG)>,/* DCMI_D6 */
-						 <STM32_PINMUX('E', 6,  ANALOG)>,/* DCMI_D7 */
-						 <STM32_PINMUX('I', 1,  ANALOG)>,/* DCMI_D8 */
-						 <STM32_PINMUX('H', 7,  ANALOG)>,/* DCMI_D9 */
-						 <STM32_PINMUX('I', 3,  ANALOG)>,/* DCMI_D10 */
-						 <STM32_PINMUX('H', 15, ANALOG)>;/* DCMI_D11 */
-				};
-			};
-
-			ethernet0_rgmii_pins_a: rgmii-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
-						 <STM32_PINMUX('G', 4, AF11)>, /* ETH_RGMII_GTX_CLK */
-						 <STM32_PINMUX('G', 13, AF11)>, /* ETH_RGMII_TXD0 */
-						 <STM32_PINMUX('G', 14, AF11)>, /* ETH_RGMII_TXD1 */
-						 <STM32_PINMUX('C', 2, AF11)>, /* ETH_RGMII_TXD2 */
-						 <STM32_PINMUX('E', 2, AF11)>, /* ETH_RGMII_TXD3 */
-						 <STM32_PINMUX('B', 11, AF11)>, /* ETH_RGMII_TX_CTL */
-						 <STM32_PINMUX('C', 1, AF11)>; /* ETH_MDC */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <2>;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('A', 2, AF11)>; /* ETH_MDIO */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <0>;
-				};
-				pins3 {
-					pinmux = <STM32_PINMUX('C', 4, AF11)>, /* ETH_RGMII_RXD0 */
-						 <STM32_PINMUX('C', 5, AF11)>, /* ETH_RGMII_RXD1 */
-						 <STM32_PINMUX('B', 0, AF11)>, /* ETH_RGMII_RXD2 */
-						 <STM32_PINMUX('B', 1, AF11)>, /* ETH_RGMII_RXD3 */
-						 <STM32_PINMUX('A', 1, AF11)>, /* ETH_RGMII_RX_CLK */
-						 <STM32_PINMUX('A', 7, AF11)>; /* ETH_RGMII_RX_CTL */
-					bias-disable;
-				};
-			};
-
-			ethernet0_rgmii_pins_sleep_a: rgmii-sleep-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('G', 5, ANALOG)>, /* ETH_RGMII_CLK125 */
-						 <STM32_PINMUX('G', 4, ANALOG)>, /* ETH_RGMII_GTX_CLK */
-						 <STM32_PINMUX('G', 13, ANALOG)>, /* ETH_RGMII_TXD0 */
-						 <STM32_PINMUX('G', 14, ANALOG)>, /* ETH_RGMII_TXD1 */
-						 <STM32_PINMUX('C', 2, ANALOG)>, /* ETH_RGMII_TXD2 */
-						 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RGMII_TXD3 */
-						 <STM32_PINMUX('B', 11, ANALOG)>, /* ETH_RGMII_TX_CTL */
-						 <STM32_PINMUX('A', 2, ANALOG)>, /* ETH_MDIO */
-						 <STM32_PINMUX('C', 1, ANALOG)>, /* ETH_MDC */
-						 <STM32_PINMUX('C', 4, ANALOG)>, /* ETH_RGMII_RXD0 */
-						 <STM32_PINMUX('C', 5, ANALOG)>, /* ETH_RGMII_RXD1 */
-						 <STM32_PINMUX('B', 0, ANALOG)>, /* ETH_RGMII_RXD2 */
-						 <STM32_PINMUX('B', 1, ANALOG)>, /* ETH_RGMII_RXD3 */
-						 <STM32_PINMUX('A', 1, ANALOG)>, /* ETH_RGMII_RX_CLK */
-						 <STM32_PINMUX('A', 7, ANALOG)>; /* ETH_RGMII_RX_CTL */
-				};
-			};
-
-			fmc_pins_a: fmc-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('D', 4, AF12)>, /* FMC_NOE */
-						 <STM32_PINMUX('D', 5, AF12)>, /* FMC_NWE */
-						 <STM32_PINMUX('D', 11, AF12)>, /* FMC_A16_FMC_CLE */
-						 <STM32_PINMUX('D', 12, AF12)>, /* FMC_A17_FMC_ALE */
-						 <STM32_PINMUX('D', 14, AF12)>, /* FMC_D0 */
-						 <STM32_PINMUX('D', 15, AF12)>, /* FMC_D1 */
-						 <STM32_PINMUX('D', 0, AF12)>, /* FMC_D2 */
-						 <STM32_PINMUX('D', 1, AF12)>, /* FMC_D3 */
-						 <STM32_PINMUX('E', 7, AF12)>, /* FMC_D4 */
-						 <STM32_PINMUX('E', 8, AF12)>, /* FMC_D5 */
-						 <STM32_PINMUX('E', 9, AF12)>, /* FMC_D6 */
-						 <STM32_PINMUX('E', 10, AF12)>, /* FMC_D7 */
-						 <STM32_PINMUX('G', 9, AF12)>; /* FMC_NE2_FMC_NCE */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <1>;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('D', 6, AF12)>; /* FMC_NWAIT */
-					bias-pull-up;
-				};
-			};
-
-			fmc_sleep_pins_a: fmc-sleep-0 {
-				pins {
-					pinmux = <STM32_PINMUX('D', 4, ANALOG)>, /* FMC_NOE */
-						 <STM32_PINMUX('D', 5, ANALOG)>, /* FMC_NWE */
-						 <STM32_PINMUX('D', 11, ANALOG)>, /* FMC_A16_FMC_CLE */
-						 <STM32_PINMUX('D', 12, ANALOG)>, /* FMC_A17_FMC_ALE */
-						 <STM32_PINMUX('D', 14, ANALOG)>, /* FMC_D0 */
-						 <STM32_PINMUX('D', 15, ANALOG)>, /* FMC_D1 */
-						 <STM32_PINMUX('D', 0, ANALOG)>, /* FMC_D2 */
-						 <STM32_PINMUX('D', 1, ANALOG)>, /* FMC_D3 */
-						 <STM32_PINMUX('E', 7, ANALOG)>, /* FMC_D4 */
-						 <STM32_PINMUX('E', 8, ANALOG)>, /* FMC_D5 */
-						 <STM32_PINMUX('E', 9, ANALOG)>, /* FMC_D6 */
-						 <STM32_PINMUX('E', 10, ANALOG)>, /* FMC_D7 */
-						 <STM32_PINMUX('D', 6, ANALOG)>, /* FMC_NWAIT */
-						 <STM32_PINMUX('G', 9, ANALOG)>; /* FMC_NE2_FMC_NCE */
-				};
-			};
-
-			i2c1_pins_a: i2c1-0 {
-				pins {
-					pinmux = <STM32_PINMUX('D', 12, AF5)>, /* I2C1_SCL */
-						 <STM32_PINMUX('F', 15, AF5)>; /* I2C1_SDA */
-					bias-disable;
-					drive-open-drain;
-					slew-rate = <0>;
-				};
-			};
-
-			i2c1_pins_sleep_a: i2c1-1 {
-				pins {
-					pinmux = <STM32_PINMUX('D', 12, ANALOG)>, /* I2C1_SCL */
-						 <STM32_PINMUX('F', 15, ANALOG)>; /* I2C1_SDA */
-				};
-			};
-
-			i2c1_pins_b: i2c1-2 {
-				pins {
-					pinmux = <STM32_PINMUX('F', 14, AF5)>, /* I2C1_SCL */
-						 <STM32_PINMUX('F', 15, AF5)>; /* I2C1_SDA */
-					bias-disable;
-					drive-open-drain;
-					slew-rate = <0>;
-				};
-			};
-
-			i2c1_pins_sleep_b: i2c1-3 {
-				pins {
-					pinmux = <STM32_PINMUX('F', 14, ANALOG)>, /* I2C1_SCL */
-						 <STM32_PINMUX('F', 15, ANALOG)>; /* I2C1_SDA */
-				};
-			};
-
-			i2c2_pins_a: i2c2-0 {
-				pins {
-					pinmux = <STM32_PINMUX('H', 4, AF4)>, /* I2C2_SCL */
-						 <STM32_PINMUX('H', 5, AF4)>; /* I2C2_SDA */
-					bias-disable;
-					drive-open-drain;
-					slew-rate = <0>;
-				};
-			};
-
-			i2c2_pins_sleep_a: i2c2-1 {
-				pins {
-					pinmux = <STM32_PINMUX('H', 4, ANALOG)>, /* I2C2_SCL */
-						 <STM32_PINMUX('H', 5, ANALOG)>; /* I2C2_SDA */
-				};
-			};
-
-			i2c2_pins_b1: i2c2-2 {
-				pins {
-					pinmux = <STM32_PINMUX('H', 5, AF4)>; /* I2C2_SDA */
-					bias-disable;
-					drive-open-drain;
-					slew-rate = <0>;
-				};
-			};
-
-			i2c2_pins_sleep_b1: i2c2-3 {
-				pins {
-					pinmux = <STM32_PINMUX('H', 5, ANALOG)>; /* I2C2_SDA */
-				};
-			};
-
-			i2c5_pins_a: i2c5-0 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 11, AF4)>, /* I2C5_SCL */
-						 <STM32_PINMUX('A', 12, AF4)>; /* I2C5_SDA */
-					bias-disable;
-					drive-open-drain;
-					slew-rate = <0>;
-				};
-			};
-
-			i2c5_pins_sleep_a: i2c5-1 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 11, ANALOG)>, /* I2C5_SCL */
-						 <STM32_PINMUX('A', 12, ANALOG)>; /* I2C5_SDA */
-
-				};
-			};
-
-			i2s2_pins_a: i2s2-0 {
-				pins {
-					pinmux = <STM32_PINMUX('I', 3, AF5)>, /* I2S2_SDO */
-						 <STM32_PINMUX('B', 9, AF5)>, /* I2S2_WS */
-						 <STM32_PINMUX('A', 9, AF5)>; /* I2S2_CK */
-					slew-rate = <1>;
-					drive-push-pull;
-					bias-disable;
-				};
-			};
-
-			i2s2_pins_sleep_a: i2s2-1 {
-				pins {
-					pinmux = <STM32_PINMUX('I', 3, ANALOG)>, /* I2S2_SDO */
-						 <STM32_PINMUX('B', 9, ANALOG)>, /* I2S2_WS */
-						 <STM32_PINMUX('A', 9, ANALOG)>; /* I2S2_CK */
-				};
-			};
-
-			ltdc_pins_a: ltdc-a-0 {
-				pins {
-					pinmux = <STM32_PINMUX('G',  7, AF14)>, /* LCD_CLK */
-						 <STM32_PINMUX('I', 10, AF14)>, /* LCD_HSYNC */
-						 <STM32_PINMUX('I',  9, AF14)>, /* LCD_VSYNC */
-						 <STM32_PINMUX('F', 10, AF14)>, /* LCD_DE */
-						 <STM32_PINMUX('H',  2, AF14)>, /* LCD_R0 */
-						 <STM32_PINMUX('H',  3, AF14)>, /* LCD_R1 */
-						 <STM32_PINMUX('H',  8, AF14)>, /* LCD_R2 */
-						 <STM32_PINMUX('H',  9, AF14)>, /* LCD_R3 */
-						 <STM32_PINMUX('H', 10, AF14)>, /* LCD_R4 */
-						 <STM32_PINMUX('C',  0, AF14)>, /* LCD_R5 */
-						 <STM32_PINMUX('H', 12, AF14)>, /* LCD_R6 */
-						 <STM32_PINMUX('E', 15, AF14)>, /* LCD_R7 */
-						 <STM32_PINMUX('E',  5, AF14)>, /* LCD_G0 */
-						 <STM32_PINMUX('E',  6, AF14)>, /* LCD_G1 */
-						 <STM32_PINMUX('H', 13, AF14)>, /* LCD_G2 */
-						 <STM32_PINMUX('H', 14, AF14)>, /* LCD_G3 */
-						 <STM32_PINMUX('H', 15, AF14)>, /* LCD_G4 */
-						 <STM32_PINMUX('I',  0, AF14)>, /* LCD_G5 */
-						 <STM32_PINMUX('I',  1, AF14)>, /* LCD_G6 */
-						 <STM32_PINMUX('I',  2, AF14)>, /* LCD_G7 */
-						 <STM32_PINMUX('D',  9, AF14)>, /* LCD_B0 */
-						 <STM32_PINMUX('G', 12, AF14)>, /* LCD_B1 */
-						 <STM32_PINMUX('G', 10, AF14)>, /* LCD_B2 */
-						 <STM32_PINMUX('D', 10, AF14)>, /* LCD_B3 */
-						 <STM32_PINMUX('I',  4, AF14)>, /* LCD_B4 */
-						 <STM32_PINMUX('A',  3, AF14)>, /* LCD_B5 */
-						 <STM32_PINMUX('B',  8, AF14)>, /* LCD_B6 */
-						 <STM32_PINMUX('D',  8, AF14)>; /* LCD_B7 */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <1>;
-				};
-			};
-
-			ltdc_pins_sleep_a: ltdc-a-1 {
-				pins {
-					pinmux = <STM32_PINMUX('G',  7, ANALOG)>, /* LCD_CLK */
-						 <STM32_PINMUX('I', 10, ANALOG)>, /* LCD_HSYNC */
-						 <STM32_PINMUX('I',  9, ANALOG)>, /* LCD_VSYNC */
-						 <STM32_PINMUX('F', 10, ANALOG)>, /* LCD_DE */
-						 <STM32_PINMUX('H',  2, ANALOG)>, /* LCD_R0 */
-						 <STM32_PINMUX('H',  3, ANALOG)>, /* LCD_R1 */
-						 <STM32_PINMUX('H',  8, ANALOG)>, /* LCD_R2 */
-						 <STM32_PINMUX('H',  9, ANALOG)>, /* LCD_R3 */
-						 <STM32_PINMUX('H', 10, ANALOG)>, /* LCD_R4 */
-						 <STM32_PINMUX('C',  0, ANALOG)>, /* LCD_R5 */
-						 <STM32_PINMUX('H', 12, ANALOG)>, /* LCD_R6 */
-						 <STM32_PINMUX('E', 15, ANALOG)>, /* LCD_R7 */
-						 <STM32_PINMUX('E',  5, ANALOG)>, /* LCD_G0 */
-						 <STM32_PINMUX('E',  6, ANALOG)>, /* LCD_G1 */
-						 <STM32_PINMUX('H', 13, ANALOG)>, /* LCD_G2 */
-						 <STM32_PINMUX('H', 14, ANALOG)>, /* LCD_G3 */
-						 <STM32_PINMUX('H', 15, ANALOG)>, /* LCD_G4 */
-						 <STM32_PINMUX('I',  0, ANALOG)>, /* LCD_G5 */
-						 <STM32_PINMUX('I',  1, ANALOG)>, /* LCD_G6 */
-						 <STM32_PINMUX('I',  2, ANALOG)>, /* LCD_G7 */
-						 <STM32_PINMUX('D',  9, ANALOG)>, /* LCD_B0 */
-						 <STM32_PINMUX('G', 12, ANALOG)>, /* LCD_B1 */
-						 <STM32_PINMUX('G', 10, ANALOG)>, /* LCD_B2 */
-						 <STM32_PINMUX('D', 10, ANALOG)>, /* LCD_B3 */
-						 <STM32_PINMUX('I',  4, ANALOG)>, /* LCD_B4 */
-						 <STM32_PINMUX('A',  3, ANALOG)>, /* LCD_B5 */
-						 <STM32_PINMUX('B',  8, ANALOG)>, /* LCD_B6 */
-						 <STM32_PINMUX('D',  8, ANALOG)>; /* LCD_B7 */
-				};
-			};
-
-			ltdc_pins_b: ltdc-b-0 {
-				pins {
-					pinmux = <STM32_PINMUX('I', 14, AF14)>, /* LCD_CLK */
-						 <STM32_PINMUX('I', 12, AF14)>, /* LCD_HSYNC */
-						 <STM32_PINMUX('I', 13, AF14)>, /* LCD_VSYNC */
-						 <STM32_PINMUX('K',  7, AF14)>, /* LCD_DE */
-						 <STM32_PINMUX('I', 15, AF14)>, /* LCD_R0 */
-						 <STM32_PINMUX('J',  0, AF14)>, /* LCD_R1 */
-						 <STM32_PINMUX('J',  1, AF14)>, /* LCD_R2 */
-						 <STM32_PINMUX('J',  2, AF14)>, /* LCD_R3 */
-						 <STM32_PINMUX('J',  3, AF14)>, /* LCD_R4 */
-						 <STM32_PINMUX('J',  4, AF14)>, /* LCD_R5 */
-						 <STM32_PINMUX('J',  5, AF14)>, /* LCD_R6 */
-						 <STM32_PINMUX('J',  6, AF14)>, /* LCD_R7 */
-						 <STM32_PINMUX('J',  7, AF14)>, /* LCD_G0 */
-						 <STM32_PINMUX('J',  8, AF14)>, /* LCD_G1 */
-						 <STM32_PINMUX('J',  9, AF14)>, /* LCD_G2 */
-						 <STM32_PINMUX('J', 10, AF14)>, /* LCD_G3 */
-						 <STM32_PINMUX('J', 11, AF14)>, /* LCD_G4 */
-						 <STM32_PINMUX('K',  0, AF14)>, /* LCD_G5 */
-						 <STM32_PINMUX('K',  1, AF14)>, /* LCD_G6 */
-						 <STM32_PINMUX('K',  2, AF14)>, /* LCD_G7 */
-						 <STM32_PINMUX('J', 12, AF14)>, /* LCD_B0 */
-						 <STM32_PINMUX('J', 13, AF14)>, /* LCD_B1 */
-						 <STM32_PINMUX('J', 14, AF14)>, /* LCD_B2 */
-						 <STM32_PINMUX('J', 15, AF14)>, /* LCD_B3 */
-						 <STM32_PINMUX('K',  3, AF14)>, /* LCD_B4 */
-						 <STM32_PINMUX('K',  4, AF14)>, /* LCD_B5 */
-						 <STM32_PINMUX('K',  5, AF14)>, /* LCD_B6 */
-						 <STM32_PINMUX('K',  6, AF14)>; /* LCD_B7 */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <1>;
-				};
-			};
-
-			ltdc_pins_sleep_b: ltdc-b-1 {
-				pins {
-					pinmux = <STM32_PINMUX('I', 14, ANALOG)>, /* LCD_CLK */
-						 <STM32_PINMUX('I', 12, ANALOG)>, /* LCD_HSYNC */
-						 <STM32_PINMUX('I', 13, ANALOG)>, /* LCD_VSYNC */
-						 <STM32_PINMUX('K',  7, ANALOG)>, /* LCD_DE */
-						 <STM32_PINMUX('I', 15, ANALOG)>, /* LCD_R0 */
-						 <STM32_PINMUX('J',  0, ANALOG)>, /* LCD_R1 */
-						 <STM32_PINMUX('J',  1, ANALOG)>, /* LCD_R2 */
-						 <STM32_PINMUX('J',  2, ANALOG)>, /* LCD_R3 */
-						 <STM32_PINMUX('J',  3, ANALOG)>, /* LCD_R4 */
-						 <STM32_PINMUX('J',  4, ANALOG)>, /* LCD_R5 */
-						 <STM32_PINMUX('J',  5, ANALOG)>, /* LCD_R6 */
-						 <STM32_PINMUX('J',  6, ANALOG)>, /* LCD_R7 */
-						 <STM32_PINMUX('J',  7, ANALOG)>, /* LCD_G0 */
-						 <STM32_PINMUX('J',  8, ANALOG)>, /* LCD_G1 */
-						 <STM32_PINMUX('J',  9, ANALOG)>, /* LCD_G2 */
-						 <STM32_PINMUX('J', 10, ANALOG)>, /* LCD_G3 */
-						 <STM32_PINMUX('J', 11, ANALOG)>, /* LCD_G4 */
-						 <STM32_PINMUX('K',  0, ANALOG)>, /* LCD_G5 */
-						 <STM32_PINMUX('K',  1, ANALOG)>, /* LCD_G6 */
-						 <STM32_PINMUX('K',  2, ANALOG)>, /* LCD_G7 */
-						 <STM32_PINMUX('J', 12, ANALOG)>, /* LCD_B0 */
-						 <STM32_PINMUX('J', 13, ANALOG)>, /* LCD_B1 */
-						 <STM32_PINMUX('J', 14, ANALOG)>, /* LCD_B2 */
-						 <STM32_PINMUX('J', 15, ANALOG)>, /* LCD_B3 */
-						 <STM32_PINMUX('K',  3, ANALOG)>, /* LCD_B4 */
-						 <STM32_PINMUX('K',  4, ANALOG)>, /* LCD_B5 */
-						 <STM32_PINMUX('K',  5, ANALOG)>, /* LCD_B6 */
-						 <STM32_PINMUX('K',  6, ANALOG)>; /* LCD_B7 */
-				};
-			};
-
-			m_can1_pins_a: m-can1-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('H', 13, AF9)>; /* CAN1_TX */
-					slew-rate = <1>;
-					drive-push-pull;
-					bias-disable;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('I', 9, AF9)>; /* CAN1_RX */
-					bias-disable;
-				};
-			};
-
-			m_can1_sleep_pins_a: m_can1-sleep-0 {
-				pins {
-					pinmux = <STM32_PINMUX('H', 13, ANALOG)>, /* CAN1_TX */
-						 <STM32_PINMUX('I', 9, ANALOG)>; /* CAN1_RX */
-				};
-			};
-
-			pwm2_pins_a: pwm2-0 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 3, AF1)>; /* TIM2_CH4 */
-					bias-pull-down;
-					drive-push-pull;
-					slew-rate = <0>;
-				};
-			};
-
-			pwm8_pins_a: pwm8-0 {
-				pins {
-					pinmux = <STM32_PINMUX('I', 2, AF3)>; /* TIM8_CH4 */
-					bias-pull-down;
-					drive-push-pull;
-					slew-rate = <0>;
-				};
-			};
-
-			pwm12_pins_a: pwm12-0 {
-				pins {
-					pinmux = <STM32_PINMUX('H', 6, AF2)>; /* TIM12_CH1 */
-					bias-pull-down;
-					drive-push-pull;
-					slew-rate = <0>;
-				};
-			};
-
-			qspi_clk_pins_a: qspi-clk-0 {
-				pins {
-					pinmux = <STM32_PINMUX('F', 10, AF9)>; /* QSPI_CLK */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <3>;
-				};
-			};
-
-			qspi_clk_sleep_pins_a: qspi-clk-sleep-0 {
-				pins {
-					pinmux = <STM32_PINMUX('F', 10, ANALOG)>; /* QSPI_CLK */
-				};
-			};
-
-			qspi_bk1_pins_a: qspi-bk1-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('F', 8, AF10)>, /* QSPI_BK1_IO0 */
-						 <STM32_PINMUX('F', 9, AF10)>, /* QSPI_BK1_IO1 */
-						 <STM32_PINMUX('F', 7, AF9)>, /* QSPI_BK1_IO2 */
-						 <STM32_PINMUX('F', 6, AF9)>; /* QSPI_BK1_IO3 */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <1>;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('B', 6, AF10)>; /* QSPI_BK1_NCS */
-					bias-pull-up;
-					drive-push-pull;
-					slew-rate = <1>;
-				};
-			};
-
-			qspi_bk1_sleep_pins_a: qspi-bk1-sleep-0 {
-				pins {
-					pinmux = <STM32_PINMUX('F', 8, ANALOG)>, /* QSPI_BK1_IO0 */
-						 <STM32_PINMUX('F', 9, ANALOG)>, /* QSPI_BK1_IO1 */
-						 <STM32_PINMUX('F', 7, ANALOG)>, /* QSPI_BK1_IO2 */
-						 <STM32_PINMUX('F', 6, ANALOG)>, /* QSPI_BK1_IO3 */
-						 <STM32_PINMUX('B', 6, ANALOG)>; /* QSPI_BK1_NCS */
-				};
-			};
-
-			qspi_bk2_pins_a: qspi-bk2-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('H', 2, AF9)>, /* QSPI_BK2_IO0 */
-						 <STM32_PINMUX('H', 3, AF9)>, /* QSPI_BK2_IO1 */
-						 <STM32_PINMUX('G', 10, AF11)>, /* QSPI_BK2_IO2 */
-						 <STM32_PINMUX('G', 7, AF11)>; /* QSPI_BK2_IO3 */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <1>;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('C', 0, AF10)>; /* QSPI_BK2_NCS */
-					bias-pull-up;
-					drive-push-pull;
-					slew-rate = <1>;
-				};
-			};
-
-			qspi_bk2_sleep_pins_a: qspi-bk2-sleep-0 {
-				pins {
-					pinmux = <STM32_PINMUX('H', 2, ANALOG)>, /* QSPI_BK2_IO0 */
-						 <STM32_PINMUX('H', 3, ANALOG)>, /* QSPI_BK2_IO1 */
-						 <STM32_PINMUX('G', 10, ANALOG)>, /* QSPI_BK2_IO2 */
-						 <STM32_PINMUX('G', 7, ANALOG)>, /* QSPI_BK2_IO3 */
-						 <STM32_PINMUX('C', 0, ANALOG)>; /* QSPI_BK2_NCS */
-				};
-			};
-
-			sai2a_pins_a: sai2a-0 {
-				pins {
-					pinmux = <STM32_PINMUX('I', 5, AF10)>, /* SAI2_SCK_A */
-						 <STM32_PINMUX('I', 6, AF10)>, /* SAI2_SD_A */
-						 <STM32_PINMUX('I', 7, AF10)>, /* SAI2_FS_A */
-						 <STM32_PINMUX('E', 0, AF10)>; /* SAI2_MCLK_A */
-					slew-rate = <0>;
-					drive-push-pull;
-					bias-disable;
-				};
-			};
-
-			sai2a_sleep_pins_a: sai2a-1 {
-				pins {
-					pinmux = <STM32_PINMUX('I', 5, ANALOG)>, /* SAI2_SCK_A */
-						 <STM32_PINMUX('I', 6, ANALOG)>, /* SAI2_SD_A */
-						 <STM32_PINMUX('I', 7, ANALOG)>, /* SAI2_FS_A */
-						 <STM32_PINMUX('E', 0, ANALOG)>; /* SAI2_MCLK_A */
-				};
-			};
-
-			sai2b_pins_a: sai2b-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('E', 12, AF10)>, /* SAI2_SCK_B */
-						 <STM32_PINMUX('E', 13, AF10)>, /* SAI2_FS_B */
-						 <STM32_PINMUX('E', 14, AF10)>; /* SAI2_MCLK_B */
-					slew-rate = <0>;
-					drive-push-pull;
-					bias-disable;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('F', 11, AF10)>; /* SAI2_SD_B */
-					bias-disable;
-				};
-			};
-
-			sai2b_sleep_pins_a: sai2b-1 {
-				pins {
-					pinmux = <STM32_PINMUX('F', 11, ANALOG)>, /* SAI2_SD_B */
-						 <STM32_PINMUX('E', 12, ANALOG)>, /* SAI2_SCK_B */
-						 <STM32_PINMUX('E', 13, ANALOG)>, /* SAI2_FS_B */
-						 <STM32_PINMUX('E', 14, ANALOG)>; /* SAI2_MCLK_B */
-				};
-			};
-
-			sai2b_pins_b: sai2b-2 {
-				pins {
-					pinmux = <STM32_PINMUX('F', 11, AF10)>; /* SAI2_SD_B */
-					bias-disable;
-				};
-			};
-
-			sai2b_sleep_pins_b: sai2b-3 {
-				pins {
-					pinmux = <STM32_PINMUX('F', 11, ANALOG)>; /* SAI2_SD_B */
-				};
-			};
-
-			sai4a_pins_a: sai4a-0 {
-				pins {
-					pinmux = <STM32_PINMUX('B', 5, AF10)>; /* SAI4_SD_A */
-					slew-rate = <0>;
-					drive-push-pull;
-					bias-disable;
-				};
-			};
-
-			sai4a_sleep_pins_a: sai4a-1 {
-				pins {
-					pinmux = <STM32_PINMUX('B', 5, ANALOG)>; /* SAI4_SD_A */
-				};
-			};
-
-			sdmmc1_b4_pins_a: sdmmc1-b4-0 {
-				pins {
-					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
-						 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
-						 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
-						 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
-						 <STM32_PINMUX('C', 12, AF12)>, /* SDMMC1_CK */
-						 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
-					slew-rate = <3>;
-					drive-push-pull;
-					bias-disable;
-				};
-			};
-
-			sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
-						 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
-						 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
-						 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
-						 <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
-					slew-rate = <3>;
-					drive-push-pull;
-					bias-disable;
-				};
-				pins2{
-					pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
-					slew-rate = <3>;
-					drive-open-drain;
-					bias-disable;
-				};
-			};
-
-			sdmmc1_b4_sleep_pins_a: sdmmc1-b4-sleep-0 {
-				pins {
-					pinmux = <STM32_PINMUX('C', 8, ANALOG)>, /* SDMMC1_D0 */
-						 <STM32_PINMUX('C', 9, ANALOG)>, /* SDMMC1_D1 */
-						 <STM32_PINMUX('C', 10, ANALOG)>, /* SDMMC1_D2 */
-						 <STM32_PINMUX('C', 11, ANALOG)>, /* SDMMC1_D3 */
-						 <STM32_PINMUX('C', 12, ANALOG)>, /* SDMMC1_CK */
-						 <STM32_PINMUX('D', 2, ANALOG)>; /* SDMMC1_CMD */
-				};
-			};
-
-			sdmmc1_dir_pins_a: sdmmc1-dir-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('F', 2, AF11)>, /* SDMMC1_D0DIR */
-						 <STM32_PINMUX('C', 7, AF8)>, /* SDMMC1_D123DIR */
-						 <STM32_PINMUX('B', 9, AF11)>; /* SDMMC1_CDIR */
-					slew-rate = <3>;
-					drive-push-pull;
-					bias-pull-up;
-				};
-				pins2{
-					pinmux = <STM32_PINMUX('E', 4, AF8)>; /* SDMMC1_CKIN */
-					bias-pull-up;
-				};
-			};
-
-			sdmmc1_dir_sleep_pins_a: sdmmc1-dir-sleep-0 {
-				pins {
-					pinmux = <STM32_PINMUX('F', 2, ANALOG)>, /* SDMMC1_D0DIR */
-						 <STM32_PINMUX('C', 7, ANALOG)>, /* SDMMC1_D123DIR */
-						 <STM32_PINMUX('B', 9, ANALOG)>, /* SDMMC1_CDIR */
-						 <STM32_PINMUX('E', 4, ANALOG)>; /* SDMMC1_CKIN */
-				};
-			};
-
-			sdmmc2_b4_pins_a: sdmmc2-b4-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
-						 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC2_D1 */
-						 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC2_D2 */
-						 <STM32_PINMUX('B', 4, AF9)>, /* SDMMC2_D3 */
-						 <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
-					slew-rate = <1>;
-					drive-push-pull;
-					bias-pull-up;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('E', 3, AF9)>; /* SDMMC2_CK */
-					slew-rate = <2>;
-					drive-push-pull;
-					bias-pull-up;
-				};
-			};
-
-			sdmmc2_b4_od_pins_a: sdmmc2-b4-od-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
-						 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC2_D1 */
-						 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC2_D2 */
-						 <STM32_PINMUX('B', 4, AF9)>; /* SDMMC2_D3 */
-					slew-rate = <1>;
-					drive-push-pull;
-					bias-pull-up;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('E', 3, AF9)>; /* SDMMC2_CK */
-					slew-rate = <2>;
-					drive-push-pull;
-					bias-pull-up;
-				};
-				pins3 {
-					pinmux = <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
-					slew-rate = <1>;
-					drive-open-drain;
-					bias-pull-up;
-				};
-			};
-
-			sdmmc2_b4_sleep_pins_a: sdmmc2-b4-sleep-0 {
-				pins {
-					pinmux = <STM32_PINMUX('B', 14, ANALOG)>, /* SDMMC2_D0 */
-						 <STM32_PINMUX('B', 15, ANALOG)>, /* SDMMC2_D1 */
-						 <STM32_PINMUX('B', 3, ANALOG)>, /* SDMMC2_D2 */
-						 <STM32_PINMUX('B', 4, ANALOG)>, /* SDMMC2_D3 */
-						 <STM32_PINMUX('E', 3, ANALOG)>, /* SDMMC2_CK */
-						 <STM32_PINMUX('G', 6, ANALOG)>; /* SDMMC2_CMD */
-				};
-			};
-
-			sdmmc2_d47_pins_a: sdmmc2-d47-0 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 8, AF9)>, /* SDMMC2_D4 */
-						 <STM32_PINMUX('A', 9, AF10)>, /* SDMMC2_D5 */
-						 <STM32_PINMUX('E', 5, AF9)>, /* SDMMC2_D6 */
-						 <STM32_PINMUX('D', 3, AF9)>; /* SDMMC2_D7 */
-					slew-rate = <1>;
-					drive-push-pull;
-					bias-pull-up;
-				};
-			};
-
-			sdmmc2_d47_sleep_pins_a: sdmmc2-d47-sleep-0 {
-				pins {
-					pinmux = <STM32_PINMUX('A', 8, ANALOG)>, /* SDMMC2_D4 */
-						 <STM32_PINMUX('A', 9, ANALOG)>, /* SDMMC2_D5 */
-						 <STM32_PINMUX('E', 5, ANALOG)>, /* SDMMC2_D6 */
-						 <STM32_PINMUX('D', 3, ANALOG)>; /* SDMMC2_D7 */
-				};
-			};
-
-			spdifrx_pins_a: spdifrx-0 {
-				pins {
-					pinmux = <STM32_PINMUX('G', 12, AF8)>; /* SPDIF_IN1 */
-					bias-disable;
-				};
-			};
-
-			spdifrx_sleep_pins_a: spdifrx-1 {
-				pins {
-					pinmux = <STM32_PINMUX('G', 12, ANALOG)>; /* SPDIF_IN1 */
-				};
-			};
-
-			spi2_pins_a: spi2-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('B', 10, AF5)>, /* SPI2_SCK */
-						 <STM32_PINMUX('I', 0, AF5)>, /* SPI2_NSS */
-						 <STM32_PINMUX('I', 3, AF5)>; /* SPI2_MOSI */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <3>;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI2_MISO */
-					bias-disable;
-				};
-			};
-
-			stusb1600_pins_a: stusb1600-0 {
-				pins {
-					pinmux = <STM32_PINMUX('I', 11, ANALOG)>;
-					bias-pull-up;
-				};
-			};
-
-			uart4_pins_a: uart4-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <0>;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
-					bias-disable;
-				};
-			};
-
-			uart4_pins_b: uart4-1 {
-				pins1 {
-					pinmux = <STM32_PINMUX('D', 1, AF8)>; /* UART4_TX */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <0>;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
-					bias-disable;
-				};
-			};
-
-			uart7_pins_a: uart7-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('E', 8, AF7)>; /* UART4_TX */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <0>;
-				};
-				pins2 {
-					pinmux = <STM32_PINMUX('E', 7, AF7)>, /* UART4_RX */
-						 <STM32_PINMUX('E', 10, AF7)>, /* UART4_CTS */
-						 <STM32_PINMUX('E', 9, AF7)>; /* UART4_RTS */
-					bias-disable;
-				};
-			};
-		};
-
-		pinctrl_z: pin-controller-z@54004000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "st,stm32mp157-z-pinctrl";
-			ranges = <0 0x54004000 0x400>;
-			pins-are-numbered;
-			interrupt-parent = <&exti>;
-			st,syscfg = <&exti 0x60 0xff>;
-			hwlocks = <&hwspinlock 0>;
-
-			gpioz: gpio@54004000 {
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				reg = <0 0x400>;
-				clocks = <&rcc GPIOZ>;
-				st,bank-name = "GPIOZ";
-				st,bank-ioport = <11>;
-				status = "disabled";
-			};
-
-			i2c2_pins_b2: i2c2-0 {
-				pins {
-					pinmux = <STM32_PINMUX('Z', 0, AF3)>; /* I2C2_SCL */
-					bias-disable;
-					drive-open-drain;
-					slew-rate = <0>;
-				};
-			};
-
-			i2c2_pins_sleep_b2: i2c2-1 {
-				pins {
-					pinmux = <STM32_PINMUX('Z', 0, ANALOG)>; /* I2C2_SCL */
-				};
-			};
-
-			i2c4_pins_a: i2c4-0 {
-				pins {
-					pinmux = <STM32_PINMUX('Z', 4, AF6)>, /* I2C4_SCL */
-						 <STM32_PINMUX('Z', 5, AF6)>; /* I2C4_SDA */
-					bias-disable;
-					drive-open-drain;
-					slew-rate = <0>;
-				};
-			};
-
-			i2c4_pins_sleep_a: i2c4-1 {
-				pins {
-					pinmux = <STM32_PINMUX('Z', 4, ANALOG)>, /* I2C4_SCL */
-						 <STM32_PINMUX('Z', 5, ANALOG)>; /* I2C4_SDA */
-				};
-			};
-
-			spi1_pins_a: spi1-0 {
-				pins1 {
-					pinmux = <STM32_PINMUX('Z', 0, AF5)>, /* SPI1_SCK */
-						 <STM32_PINMUX('Z', 2, AF5)>; /* SPI1_MOSI */
-					bias-disable;
-					drive-push-pull;
-					slew-rate = <1>;
-				};
-
-				pins2 {
-					pinmux = <STM32_PINMUX('Z', 1, AF5)>; /* SPI1_MISO */
-					bias-disable;
-				};
-			};
-		};
-	};
-};
diff --git a/arch/arm/dts/stm32mp157.dtsi b/arch/arm/dts/stm32mp157.dtsi
new file mode 100644
index 0000000000..3f0a4a91cc
--- /dev/null
+++ b/arch/arm/dts/stm32mp157.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@st.com> for STMicroelectronics.
+ */
+
+#include "stm32mp153.dtsi"
+
+/ {
+	soc {
+		gpu: gpu@59000000 {
+			compatible = "vivante,gc";
+			reg = <0x59000000 0x800>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc GPU>, <&rcc GPU_K>;
+			clock-names = "bus" ,"core";
+			resets = <&rcc GPU_R>;
+			status = "disabled";
+		};
+
+		dsi: dsi@5a000000 {
+			compatible = "st,stm32-dsi";
+			reg = <0x5a000000 0x800>;
+			clocks = <&rcc DSI_K>, <&clk_hse>, <&rcc DSI_PX>;
+			clock-names = "pclk", "ref", "px_clk";
+			resets = <&rcc DSI_R>;
+			reset-names = "apb";
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi b/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
index d6dc746365..1a7470914e 100644
--- a/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
@@ -145,7 +145,10 @@
 
 &sdmmc1_b4_pins_a {
 	u-boot,dm-spl;
-	pins {
+	pins1 {
+		u-boot,dm-spl;
+	};
+	pins2 {
 		u-boot,dm-spl;
 	};
 };
@@ -196,7 +199,3 @@
 	u-boot,force-b-session-valid;
 	hnp-srp-disable;
 };
-
-&v3v3 {
-	regulator-always-on;
-};
diff --git a/arch/arm/dts/stm32mp157a-avenger96.dts b/arch/arm/dts/stm32mp157a-avenger96.dts
index 3065593bf2..5bc377d5e3 100644
--- a/arch/arm/dts/stm32mp157a-avenger96.dts
+++ b/arch/arm/dts/stm32mp157a-avenger96.dts
@@ -6,8 +6,9 @@
 
 /dts-v1/;
 
-#include "stm32mp157c.dtsi"
-#include "stm32mp157xac-pinctrl.dtsi"
+#include "stm32mp157.dtsi"
+#include "stm32mp15-pinctrl.dtsi"
+#include "stm32mp15xxac-pinctrl.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/mfd/st,stpmic1.h>
 
diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index a5cc01dd19..99142c57fe 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -164,7 +164,10 @@
 
 &sdmmc1_b4_pins_a {
 	u-boot,dm-spl;
-	pins {
+	pins1 {
+		u-boot,dm-spl;
+	};
+	pins2 {
 		u-boot,dm-spl;
 	};
 };
diff --git a/arch/arm/dts/stm32mp157a-dk1.dts b/arch/arm/dts/stm32mp157a-dk1.dts
index 624bf6954b..d03d4cd260 100644
--- a/arch/arm/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/dts/stm32mp157a-dk1.dts
@@ -6,10 +6,10 @@
 
 /dts-v1/;
 
-#include "stm32mp157c.dtsi"
-#include "stm32mp157xac-pinctrl.dtsi"
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/mfd/st,stpmic1.h>
+#include "stm32mp157.dtsi"
+#include "stm32mp15-pinctrl.dtsi"
+#include "stm32mp15xxac-pinctrl.dtsi"
+#include "stm32mp15xx-dkx.dtsi"
 
 / {
 	model = "STMicroelectronics STM32MP157A-DK1 Discovery Board";
@@ -23,537 +23,4 @@
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
-
-	memory@c0000000 {
-		device_type = "memory";
-		reg = <0xc0000000 0x20000000>;
-	};
-
-	reserved-memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		mcuram2: mcuram2@10000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x10000000 0x40000>;
-			no-map;
-		};
-
-		vdev0vring0: vdev0vring0@10040000 {
-			compatible = "shared-dma-pool";
-			reg = <0x10040000 0x1000>;
-			no-map;
-		};
-
-		vdev0vring1: vdev0vring1@10041000 {
-			compatible = "shared-dma-pool";
-			reg = <0x10041000 0x1000>;
-			no-map;
-		};
-
-		vdev0buffer: vdev0buffer@10042000 {
-			compatible = "shared-dma-pool";
-			reg = <0x10042000 0x4000>;
-			no-map;
-		};
-
-		mcuram: mcuram@30000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x30000000 0x40000>;
-			no-map;
-		};
-
-		retram: retram@38000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x38000000 0x10000>;
-			no-map;
-		};
-
-		gpu_reserved: gpu@d4000000 {
-			reg = <0xd4000000 0x4000000>;
-			no-map;
-		};
-	};
-
-	led {
-		compatible = "gpio-leds";
-		blue {
-			label = "heartbeat";
-			gpios = <&gpiod 11 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "heartbeat";
-			default-state = "off";
-		};
-	};
-
-	sound {
-		compatible = "audio-graph-card";
-		label = "STM32MP1-DK";
-		routing =
-			"Playback" , "MCLK",
-			"Capture" , "MCLK",
-			"MICL" , "Mic Bias";
-		dais = <&sai2a_port &sai2b_port &i2s2_port>;
-		status = "okay";
-	};
-};
-
-&adc {
-	pinctrl-names = "default";
-	pinctrl-0 = <&adc12_ain_pins_a>, <&adc12_usb_cc_pins_a>;
-	vdd-supply = <&vdd>;
-	vdda-supply = <&vdd>;
-	vref-supply = <&vrefbuf>;
-	status = "disabled";
-	adc1: adc@0 {
-		/*
-		 * Type-C USB_PWR_CC1 & USB_PWR_CC2 on in18 & in19.
-		 * Use at least 5 * RC time, e.g. 5 * (Rp + Rd) * C:
-		 * 5 * (56 + 47kOhms) * 5pF => 2.5us.
-		 * Use arbitrary margin here (e.g. 5us).
-		 */
-		st,min-sample-time-nsecs = <5000>;
-		/* AIN connector, USB Type-C CC1 & CC2 */
-		st,adc-channels = <0 1 6 13 18 19>;
-		status = "okay";
-	};
-	adc2: adc@100 {
-		/* AIN connector, USB Type-C CC1 & CC2 */
-		st,adc-channels = <0 1 2 6 18 19>;
-		st,min-sample-time-nsecs = <5000>;
-		status = "okay";
-	};
-};
-
-&cec {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&cec_pins_b>;
-	pinctrl-1 = <&cec_pins_sleep_b>;
-	status = "okay";
-};
-
-&ethernet0 {
-	status = "okay";
-	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
-	pinctrl-1 = <&ethernet0_rgmii_pins_sleep_a>;
-	pinctrl-names = "default", "sleep";
-	phy-mode = "rgmii-id";
-	max-speed = <1000>;
-	phy-handle = <&phy0>;
-
-	mdio0 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "snps,dwmac-mdio";
-		phy0: ethernet-phy@0 {
-			reg = <0>;
-		};
-	};
-};
-
-&gpu {
-	contiguous-area = <&gpu_reserved>;
-	status = "okay";
-};
-
-&i2c1 {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&i2c1_pins_a>;
-	pinctrl-1 = <&i2c1_pins_sleep_a>;
-	i2c-scl-rising-time-ns = <100>;
-	i2c-scl-falling-time-ns = <7>;
-	status = "okay";
-	/delete-property/dmas;
-	/delete-property/dma-names;
-
-	hdmi-transmitter@39 {
-		compatible = "sil,sii9022";
-		reg = <0x39>;
-		iovcc-supply = <&v3v3_hdmi>;
-		cvcc12-supply = <&v1v2_hdmi>;
-		reset-gpios = <&gpioa 10 GPIO_ACTIVE_LOW>;
-		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
-		interrupt-parent = <&gpiog>;
-		#sound-dai-cells = <0>;
-		status = "okay";
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				sii9022_in: endpoint {
-					remote-endpoint = <&ltdc_ep0_out>;
-				};
-			};
-
-			port@3 {
-				reg = <3>;
-				sii9022_tx_endpoint: endpoint {
-					remote-endpoint = <&i2s2_endpoint>;
-				};
-			};
-		};
-	};
-
-	cs42l51: cs42l51@4a {
-		compatible = "cirrus,cs42l51";
-		reg = <0x4a>;
-		#sound-dai-cells = <0>;
-		VL-supply = <&v3v3>;
-		VD-supply = <&v1v8_audio>;
-		VA-supply = <&v1v8_audio>;
-		VAHP-supply = <&v1v8_audio>;
-		reset-gpios = <&gpiog 9 GPIO_ACTIVE_LOW>;
-		clocks = <&sai2a>;
-		clock-names = "MCLK";
-		status = "okay";
-
-		cs42l51_port: port {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			cs42l51_tx_endpoint: endpoint@0 {
-				reg = <0>;
-				remote-endpoint = <&sai2a_endpoint>;
-				frame-master;
-				bitclock-master;
-			};
-
-			cs42l51_rx_endpoint: endpoint@1 {
-				reg = <1>;
-				remote-endpoint = <&sai2b_endpoint>;
-				frame-master;
-				bitclock-master;
-			};
-		};
-	};
-};
-
-&i2c4 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c4_pins_a>;
-	i2c-scl-rising-time-ns = <185>;
-	i2c-scl-falling-time-ns = <20>;
-	status = "okay";
-	/* spare dmas for other usage */
-	/delete-property/dmas;
-	/delete-property/dma-names;
-
-	typec: stusb1600@28 {
-		compatible = "st,stusb1600";
-		reg = <0x28>;
-		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
-		interrupt-parent = <&gpioi>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&stusb1600_pins_a>;
-
-		status = "okay";
-
-		typec_con: connector {
-			compatible = "usb-c-connector";
-			label = "USB-C";
-			power-role = "sink";
-			power-opmode = "default";
-		};
-	};
-
-	pmic: stpmic@33 {
-		compatible = "st,stpmic1";
-		reg = <0x33>;
-		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		status = "okay";
-
-		regulators {
-			compatible = "st,stpmic1-regulators";
-			ldo1-supply = <&v3v3>;
-			ldo3-supply = <&vdd_ddr>;
-			ldo6-supply = <&v3v3>;
-			pwr_sw1-supply = <&bst_out>;
-			pwr_sw2-supply = <&bst_out>;
-
-			vddcore: buck1 {
-				regulator-name = "vddcore";
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-always-on;
-				regulator-initial-mode = <0>;
-				regulator-over-current-protection;
-			};
-
-			vdd_ddr: buck2 {
-				regulator-name = "vdd_ddr";
-				regulator-min-microvolt = <1350000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-always-on;
-				regulator-initial-mode = <0>;
-				regulator-over-current-protection;
-			};
-
-			vdd: buck3 {
-				regulator-name = "vdd";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-always-on;
-				st,mask-reset;
-				regulator-initial-mode = <0>;
-				regulator-over-current-protection;
-			};
-
-			v3v3: buck4 {
-				regulator-name = "v3v3";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-always-on;
-				regulator-over-current-protection;
-				regulator-initial-mode = <0>;
-			};
-
-			v1v8_audio: ldo1 {
-				regulator-name = "v1v8_audio";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-always-on;
-				interrupts = <IT_CURLIM_LDO1 0>;
-			};
-
-			v3v3_hdmi: ldo2 {
-				regulator-name = "v3v3_hdmi";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-always-on;
-				interrupts = <IT_CURLIM_LDO2 0>;
-			};
-
-			vtt_ddr: ldo3 {
-				regulator-name = "vtt_ddr";
-				regulator-min-microvolt = <500000>;
-				regulator-max-microvolt = <750000>;
-				regulator-always-on;
-				regulator-over-current-protection;
-			};
-
-			vdd_usb: ldo4 {
-				regulator-name = "vdd_usb";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-				interrupts = <IT_CURLIM_LDO4 0>;
-			};
-
-			vdda: ldo5 {
-				regulator-name = "vdda";
-				regulator-min-microvolt = <2900000>;
-				regulator-max-microvolt = <2900000>;
-				interrupts = <IT_CURLIM_LDO5 0>;
-				regulator-boot-on;
-			};
-
-			v1v2_hdmi: ldo6 {
-				regulator-name = "v1v2_hdmi";
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <1200000>;
-				regulator-always-on;
-				interrupts = <IT_CURLIM_LDO6 0>;
-			};
-
-			vref_ddr: vref_ddr {
-				regulator-name = "vref_ddr";
-				regulator-always-on;
-				regulator-over-current-protection;
-			};
-
-			 bst_out: boost {
-				regulator-name = "bst_out";
-				interrupts = <IT_OCP_BOOST 0>;
-			 };
-
-			vbus_otg: pwr_sw1 {
-				regulator-name = "vbus_otg";
-				interrupts = <IT_OCP_OTG 0>;
-			 };
-
-			 vbus_sw: pwr_sw2 {
-				regulator-name = "vbus_sw";
-				interrupts = <IT_OCP_SWOUT 0>;
-				regulator-active-discharge = <1>;
-			 };
-		};
-
-		onkey {
-			compatible = "st,stpmic1-onkey";
-			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 0>;
-			interrupt-names = "onkey-falling", "onkey-rising";
-			power-off-time-sec = <10>;
-			status = "okay";
-		};
-
-		watchdog {
-			compatible = "st,stpmic1-wdt";
-			status = "disabled";
-		};
-	};
-};
-
-&i2s2 {
-	clocks = <&rcc SPI2>, <&rcc SPI2_K>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
-	clock-names = "pclk", "i2sclk", "x8k", "x11k";
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&i2s2_pins_a>;
-	pinctrl-1 = <&i2s2_pins_sleep_a>;
-	status = "okay";
-
-	i2s2_port: port {
-		i2s2_endpoint: endpoint {
-			remote-endpoint = <&sii9022_tx_endpoint>;
-			format = "i2s";
-			mclk-fs = <256>;
-		};
-	};
-};
-
-&ipcc {
-	status = "okay";
-};
-
-&iwdg2 {
-	timeout-sec = <32>;
-	status = "okay";
-};
-
-&ltdc {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&ltdc_pins_a>;
-	pinctrl-1 = <&ltdc_pins_sleep_a>;
-	status = "okay";
-
-	port {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		ltdc_ep0_out: endpoint@0 {
-			reg = <0>;
-			remote-endpoint = <&sii9022_in>;
-		};
-	};
-};
-
-&m4_rproc {
-	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
-			<&vdev0vring1>, <&vdev0buffer>;
-	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
-	mbox-names = "vq0", "vq1", "shutdown";
-	interrupt-parent = <&exti>;
-	interrupts = <68 1>;
-	status = "okay";
-};
-
-&pwr_regulators {
-	vdd-supply = <&vdd>;
-	vdd_3v3_usbfs-supply = <&vdd_usb>;
-};
-
-&rng1 {
-	status = "okay";
-};
-
-&rtc {
-	status = "okay";
-};
-
-&sai2 {
-	clocks = <&rcc SAI2>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
-	clock-names = "pclk", "x8k", "x11k";
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&sai2a_pins_a>, <&sai2b_pins_b>;
-	pinctrl-1 = <&sai2a_sleep_pins_a>, <&sai2b_sleep_pins_b>;
-	status = "okay";
-
-	sai2a: audio-controller@4400b004 {
-		#clock-cells = <0>;
-		dma-names = "tx";
-		clocks = <&rcc SAI2_K>;
-		clock-names = "sai_ck";
-		status = "okay";
-
-		sai2a_port: port {
-			sai2a_endpoint: endpoint {
-				remote-endpoint = <&cs42l51_tx_endpoint>;
-				format = "i2s";
-				mclk-fs = <256>;
-				dai-tdm-slot-num = <2>;
-				dai-tdm-slot-width = <32>;
-			};
-		};
-	};
-
-	sai2b: audio-controller@4400b024 {
-		dma-names = "rx";
-		st,sync = <&sai2a 2>;
-		clocks = <&rcc SAI2_K>, <&sai2a>;
-		clock-names = "sai_ck", "MCLK";
-		status = "okay";
-
-		sai2b_port: port {
-			sai2b_endpoint: endpoint {
-				remote-endpoint = <&cs42l51_rx_endpoint>;
-				format = "i2s";
-				mclk-fs = <256>;
-				dai-tdm-slot-num = <2>;
-				dai-tdm-slot-width = <32>;
-			};
-		};
-	};
-};
-
-&sdmmc1 {
-	pinctrl-names = "default", "opendrain", "sleep";
-	pinctrl-0 = <&sdmmc1_b4_pins_a>;
-	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
-	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
-	broken-cd;
-	st,neg-edge;
-	bus-width = <4>;
-	vmmc-supply = <&v3v3>;
-	status = "okay";
-};
-
-&uart4 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart4_pins_a>;
-	status = "okay";
-};
-
-&usbh_ehci {
-	phys = <&usbphyc_port0>;
-	phy-names = "usb";
-	status = "okay";
-};
-
-&usbotg_hs {
-	dr_mode = "peripheral";
-	phys = <&usbphyc_port1 0>;
-	phy-names = "usb2-phy";
-	status = "okay";
-};
-
-&usbphyc {
-	status = "okay";
-};
-
-&usbphyc_port0 {
-	phy-supply = <&vdd_usb>;
-};
-
-&usbphyc_port1 {
-	phy-supply = <&vdd_usb>;
-};
-
-&vrefbuf {
-	regulator-min-microvolt = <2500000>;
-	regulator-max-microvolt = <2500000>;
-	vdda-supply = <&vdd>;
-	status = "okay";
 };
diff --git a/arch/arm/dts/stm32mp157c-dk2-u-boot.dtsi b/arch/arm/dts/stm32mp157c-dk2-u-boot.dtsi
index 18ac1e3cb2..06ef3a4095 100644
--- a/arch/arm/dts/stm32mp157c-dk2-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-dk2-u-boot.dtsi
@@ -4,9 +4,3 @@
  */
 
 #include "stm32mp157a-dk1-u-boot.dtsi"
-
-&i2c1 {
-	hdmi-transmitter@39 {
-		reset-gpios = <&gpioa 10 GPIO_ACTIVE_LOW>;
-	};
-};
diff --git a/arch/arm/dts/stm32mp157c-dk2.dts b/arch/arm/dts/stm32mp157c-dk2.dts
index d26adcbeba..7985b80967 100644
--- a/arch/arm/dts/stm32mp157c-dk2.dts
+++ b/arch/arm/dts/stm32mp157c-dk2.dts
@@ -6,11 +6,24 @@
 
 /dts-v1/;
 
-#include "stm32mp157a-dk1.dts"
+#include "stm32mp157.dtsi"
+#include "stm32mp15xc.dtsi"
+#include "stm32mp15-pinctrl.dtsi"
+#include "stm32mp15xxac-pinctrl.dtsi"
+#include "stm32mp15xx-dkx.dtsi"
 
 / {
 	model = "STMicroelectronics STM32MP157C-DK2 Discovery Board";
 	compatible = "st,stm32mp157c-dk2", "st,stm32mp157";
+
+	aliases {
+		ethernet0 = &ethernet0;
+		serial0 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
 };
 
 &dsi {
diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
index 347edf7e58..08b2884c86 100644
--- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
@@ -161,7 +161,10 @@
 
 &sdmmc1_b4_pins_a {
 	u-boot,dm-spl;
-	pins {
+	pins1 {
+		u-boot,dm-spl;
+	};
+	pins2 {
 		u-boot,dm-spl;
 	};
 };
diff --git a/arch/arm/dts/stm32mp157c-ed1.dts b/arch/arm/dts/stm32mp157c-ed1.dts
index ae4da39ce8..54af7c97b3 100644
--- a/arch/arm/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/dts/stm32mp157c-ed1.dts
@@ -5,8 +5,10 @@
  */
 /dts-v1/;
 
-#include "stm32mp157c.dtsi"
-#include "stm32mp157xaa-pinctrl.dtsi"
+#include "stm32mp157.dtsi"
+#include "stm32mp15xc.dtsi"
+#include "stm32mp15-pinctrl.dtsi"
+#include "stm32mp15xxaa-pinctrl.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/mfd/st,stpmic1.h>
 
@@ -89,6 +91,22 @@
 	};
 };
 
+&adc {
+	/* ANA0, ANA1 are dedicated pins and don't need pinctrl: only in6. */
+	pinctrl-0 = <&adc1_in6_pins_a>;
+	pinctrl-names = "default";
+	vdd-supply = <&vdd>;
+	vdda-supply = <&vdda>;
+	vref-supply = <&vdda>;
+	status = "disabled";
+	adc1: adc@0 {
+		st,adc-channels = <0 1 6>;
+		/* 16.5 ck_cycles sampling time */
+		st,min-sample-time-nsecs = <400>;
+		status = "okay";
+	};
+};
+
 &dac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&dac_ch1_pins_a &dac_ch2_pins_a>;
diff --git a/arch/arm/dts/stm32mp157c-ev1.dts b/arch/arm/dts/stm32mp157c-ev1.dts
index bd8ffc185f..228e35e168 100644
--- a/arch/arm/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/dts/stm32mp157c-ev1.dts
@@ -182,8 +182,6 @@
 
 	ov5640: camera@3c {
 		compatible = "ovti,ov5640";
-		pinctrl-names = "default";
-		pinctrl-0 = <&ov5640_pins>;
 		reg = <0x3c>;
 		clocks = <&clk_ext_camera>;
 		clock-names = "xclk";
@@ -224,12 +222,6 @@
 				pins = "gpio0", "gpio1", "gpio2", "gpio3", "gpio4";
 				bias-pull-down;
 			};
-
-			ov5640_pins: camera {
-				pins = "agpio2", "agpio3"; /* stmfx pins 18 & 19 */
-				drive-push-pull;
-				output-low;
-			};
 		};
 	};
 };
@@ -291,6 +283,18 @@
 	};
 };
 
+&sdmmc3 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc3_b4_pins_a>;
+	pinctrl-1 = <&sdmmc3_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc3_b4_sleep_pins_a>;
+	broken-cd;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&v3v3>;
+	status = "disabled";
+};
+
 &spi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi1_pins_a>;
@@ -304,7 +308,8 @@
 	status = "disabled";
 	pwm {
 		pinctrl-0 = <&pwm2_pins_a>;
-		pinctrl-names = "default";
+		pinctrl-1 = <&pwm2_sleep_pins_a>;
+		pinctrl-names = "default", "sleep";
 		status = "okay";
 	};
 	timer@1 {
@@ -318,7 +323,8 @@
 	status = "disabled";
 	pwm {
 		pinctrl-0 = <&pwm8_pins_a>;
-		pinctrl-names = "default";
+		pinctrl-1 = <&pwm8_sleep_pins_a>;
+		pinctrl-names = "default", "sleep";
 		status = "okay";
 	};
 	timer@7 {
@@ -332,7 +338,8 @@
 	status = "disabled";
 	pwm {
 		pinctrl-0 = <&pwm12_pins_a>;
-		pinctrl-names = "default";
+		pinctrl-1 = <&pwm12_sleep_pins_a>;
+		pinctrl-names = "default", "sleep";
 		status = "okay";
 	};
 	timer@11 {
@@ -348,6 +355,7 @@
 &usbotg_hs {
 	dr_mode = "peripheral";
 	phys = <&usbphyc_port1 0>;
+	phy-names = "usb2-phy";
 	status = "okay";
 };
 
diff --git a/arch/arm/dts/stm32mp157xaa-pinctrl.dtsi b/arch/arm/dts/stm32mp157xaa-pinctrl.dtsi
deleted file mode 100644
index 875adf5e1e..0000000000
--- a/arch/arm/dts/stm32mp157xaa-pinctrl.dtsi
+++ /dev/null
@@ -1,90 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@st.com>
- */
-
-#include "stm32mp157-pinctrl.dtsi"
-/ {
-	soc {
-		pinctrl: pin-controller@50002000 {
-			st,package = <STM32MP_PKG_AA>;
-
-			gpioa: gpio@50002000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 0 16>;
-			};
-
-			gpiob: gpio@50003000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 16 16>;
-			};
-
-			gpioc: gpio@50004000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 32 16>;
-			};
-
-			gpiod: gpio@50005000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 48 16>;
-			};
-
-			gpioe: gpio@50006000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 64 16>;
-			};
-
-			gpiof: gpio@50007000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 80 16>;
-			};
-
-			gpiog: gpio@50008000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 96 16>;
-			};
-
-			gpioh: gpio@50009000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 112 16>;
-			};
-
-			gpioi: gpio@5000a000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 128 16>;
-			};
-
-			gpioj: gpio@5000b000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 144 16>;
-			};
-
-			gpiok: gpio@5000c000 {
-				status = "okay";
-				ngpios = <8>;
-				gpio-ranges = <&pinctrl 0 160 8>;
-			};
-		};
-
-		pinctrl_z: pin-controller-z@54004000 {
-			st,package = <STM32MP_PKG_AA>;
-
-			gpioz: gpio@54004000 {
-				status = "okay";
-				ngpios = <8>;
-				gpio-ranges = <&pinctrl_z 0 400 8>;
-			};
-		};
-	};
-};
diff --git a/arch/arm/dts/stm32mp157xab-pinctrl.dtsi b/arch/arm/dts/stm32mp157xab-pinctrl.dtsi
deleted file mode 100644
index 961fa12a59..0000000000
--- a/arch/arm/dts/stm32mp157xab-pinctrl.dtsi
+++ /dev/null
@@ -1,62 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@st.com>
- */
-
-#include "stm32mp157-pinctrl.dtsi"
-/ {
-	soc {
-		pinctrl: pin-controller@50002000 {
-			st,package = <STM32MP_PKG_AB>;
-
-			gpioa: gpio@50002000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 0 16>;
-			};
-
-			gpiob: gpio@50003000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 16 16>;
-			};
-
-			gpioc: gpio@50004000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 32 16>;
-			};
-
-			gpiod: gpio@50005000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 48 16>;
-			};
-
-			gpioe: gpio@50006000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 64 16>;
-			};
-
-			gpiof: gpio@50007000 {
-				status = "okay";
-				ngpios = <6>;
-				gpio-ranges = <&pinctrl 6 86 6>;
-			};
-
-			gpiog: gpio@50008000 {
-				status = "okay";
-				ngpios = <10>;
-				gpio-ranges = <&pinctrl 6 102 10>;
-			};
-
-			gpioh: gpio@50009000 {
-				status = "okay";
-				ngpios = <2>;
-				gpio-ranges = <&pinctrl 0 112 2>;
-			};
-		};
-	};
-};
diff --git a/arch/arm/dts/stm32mp157xac-pinctrl.dtsi b/arch/arm/dts/stm32mp157xac-pinctrl.dtsi
deleted file mode 100644
index 26600f188d..0000000000
--- a/arch/arm/dts/stm32mp157xac-pinctrl.dtsi
+++ /dev/null
@@ -1,78 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@st.com>
- */
-
-#include "stm32mp157-pinctrl.dtsi"
-/ {
-	soc {
-		pinctrl: pin-controller@50002000 {
-			st,package = <STM32MP_PKG_AC>;
-
-			gpioa: gpio@50002000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 0 16>;
-			};
-
-			gpiob: gpio@50003000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 16 16>;
-			};
-
-			gpioc: gpio@50004000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 32 16>;
-			};
-
-			gpiod: gpio@50005000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 48 16>;
-			};
-
-			gpioe: gpio@50006000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 64 16>;
-			};
-
-			gpiof: gpio@50007000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 80 16>;
-			};
-
-			gpiog: gpio@50008000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 96 16>;
-			};
-
-			gpioh: gpio@50009000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 112 16>;
-			};
-
-			gpioi: gpio@5000a000 {
-				status = "okay";
-				ngpios = <12>;
-				gpio-ranges = <&pinctrl 0 128 12>;
-			};
-		};
-
-		pinctrl_z: pin-controller-z@54004000 {
-			st,package = <STM32MP_PKG_AC>;
-
-			gpioz: gpio@54004000 {
-				status = "okay";
-				ngpios = <8>;
-				gpio-ranges = <&pinctrl_z 0 400 8>;
-			};
-		};
-	};
-};
diff --git a/arch/arm/dts/stm32mp157xad-pinctrl.dtsi b/arch/arm/dts/stm32mp157xad-pinctrl.dtsi
deleted file mode 100644
index 910113f3e6..0000000000
--- a/arch/arm/dts/stm32mp157xad-pinctrl.dtsi
+++ /dev/null
@@ -1,62 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@st.com>
- */
-
-#include "stm32mp157-pinctrl.dtsi"
-/ {
-	soc {
-		pinctrl: pin-controller@50002000 {
-			st,package = <STM32MP_PKG_AD>;
-
-			gpioa: gpio@50002000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 0 16>;
-			};
-
-			gpiob: gpio@50003000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 16 16>;
-			};
-
-			gpioc: gpio@50004000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 32 16>;
-			};
-
-			gpiod: gpio@50005000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 48 16>;
-			};
-
-			gpioe: gpio@50006000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 64 16>;
-			};
-
-			gpiof: gpio@50007000 {
-				status = "okay";
-				ngpios = <6>;
-				gpio-ranges = <&pinctrl 6 86 6>;
-			};
-
-			gpiog: gpio@50008000 {
-				status = "okay";
-				ngpios = <10>;
-				gpio-ranges = <&pinctrl 6 102 10>;
-			};
-
-			gpioh: gpio@50009000 {
-				status = "okay";
-				ngpios = <2>;
-				gpio-ranges = <&pinctrl 0 112 2>;
-			};
-		};
-	};
-};
diff --git a/arch/arm/dts/stm32mp15xc.dtsi b/arch/arm/dts/stm32mp15xc.dtsi
new file mode 100644
index 0000000000..b06a55a2fa
--- /dev/null
+++ b/arch/arm/dts/stm32mp15xc.dtsi
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@st.com> for STMicroelectronics.
+ */
+
+/ {
+	soc {
+		cryp1: cryp@54001000 {
+			compatible = "st,stm32mp1-cryp";
+			reg = <0x54001000 0x400>;
+			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc CRYP1>;
+			resets = <&rcc CRYP1_R>;
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
index 6c952a57ee..daa061e8b0 100644
--- a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
@@ -196,7 +196,10 @@
 
 &sdmmc1_b4_pins_a {
 	u-boot,dm-spl;
-	pins {
+	pins1 {
+		u-boot,dm-spl;
+	};
+	pins2 {
 		u-boot,dm-spl;
 	};
 };
diff --git a/arch/arm/dts/stm32mp15xx-dhcom.dtsi b/arch/arm/dts/stm32mp15xx-dhcom.dtsi
index bed69c97b6..31da41bfca 100644
--- a/arch/arm/dts/stm32mp15xx-dhcom.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcom.dtsi
@@ -4,8 +4,10 @@
  */
 /dts-v1/;
 
-#include "stm32mp157c.dtsi"
-#include "stm32mp157xaa-pinctrl.dtsi"
+#include "stm32mp157.dtsi"
+#include "stm32mp15xc.dtsi"
+#include "stm32mp15-pinctrl.dtsi"
+#include "stm32mp15xxaa-pinctrl.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/mfd/st,stpmic1.h>
 
diff --git a/arch/arm/dts/stm32mp15xx-dkx.dtsi b/arch/arm/dts/stm32mp15xx-dkx.dtsi
new file mode 100644
index 0000000000..42d3f0cb2d
--- /dev/null
+++ b/arch/arm/dts/stm32mp15xx-dkx.dtsi
@@ -0,0 +1,639 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@st.com> for STMicroelectronics.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/mfd/st,stpmic1.h>
+
+/ {
+	memory@c0000000 {
+		device_type = "memory";
+		reg = <0xc0000000 0x20000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		mcuram2: mcuram2@10000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10000000 0x40000>;
+			no-map;
+		};
+
+		vdev0vring0: vdev0vring0@10040000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10040000 0x1000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@10041000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10041000 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@10042000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10042000 0x4000>;
+			no-map;
+		};
+
+		mcuram: mcuram@30000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x30000000 0x40000>;
+			no-map;
+		};
+
+		retram: retram@38000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x38000000 0x10000>;
+			no-map;
+		};
+
+		gpu_reserved: gpu@d4000000 {
+			reg = <0xd4000000 0x4000000>;
+			no-map;
+		};
+	};
+
+	led {
+		compatible = "gpio-leds";
+		blue {
+			label = "heartbeat";
+			gpios = <&gpiod 11 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			default-state = "off";
+		};
+	};
+
+	sound {
+		compatible = "audio-graph-card";
+		label = "STM32MP1-DK";
+		routing =
+			"Playback" , "MCLK",
+			"Capture" , "MCLK",
+			"MICL" , "Mic Bias";
+		dais = <&sai2a_port &sai2b_port &i2s2_port>;
+		status = "okay";
+	};
+};
+
+&adc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&adc12_ain_pins_a>, <&adc12_usb_cc_pins_a>;
+	vdd-supply = <&vdd>;
+	vdda-supply = <&vdd>;
+	vref-supply = <&vrefbuf>;
+	status = "disabled";
+	adc1: adc@0 {
+		/*
+		 * Type-C USB_PWR_CC1 & USB_PWR_CC2 on in18 & in19.
+		 * Use at least 5 * RC time, e.g. 5 * (Rp + Rd) * C:
+		 * 5 * (56 + 47kOhms) * 5pF => 2.5us.
+		 * Use arbitrary margin here (e.g. 5us).
+		 */
+		st,min-sample-time-nsecs = <5000>;
+		/* AIN connector, USB Type-C CC1 & CC2 */
+		st,adc-channels = <0 1 6 13 18 19>;
+		status = "okay";
+	};
+	adc2: adc@100 {
+		/* AIN connector, USB Type-C CC1 & CC2 */
+		st,adc-channels = <0 1 2 6 18 19>;
+		st,min-sample-time-nsecs = <5000>;
+		status = "okay";
+	};
+};
+
+&cec {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&cec_pins_b>;
+	pinctrl-1 = <&cec_pins_sleep_b>;
+	status = "okay";
+};
+
+&ethernet0 {
+	status = "okay";
+	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
+	pinctrl-1 = <&ethernet0_rgmii_pins_sleep_a>;
+	pinctrl-names = "default", "sleep";
+	phy-mode = "rgmii-id";
+	max-speed = <1000>;
+	phy-handle = <&phy0>;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
+&gpu {
+	contiguous-area = <&gpu_reserved>;
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c1_pins_a>;
+	pinctrl-1 = <&i2c1_pins_sleep_a>;
+	i2c-scl-rising-time-ns = <100>;
+	i2c-scl-falling-time-ns = <7>;
+	status = "okay";
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	hdmi-transmitter@39 {
+		compatible = "sil,sii9022";
+		reg = <0x39>;
+		iovcc-supply = <&v3v3_hdmi>;
+		cvcc12-supply = <&v1v2_hdmi>;
+		reset-gpios = <&gpioa 10 GPIO_ACTIVE_LOW>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-parent = <&gpiog>;
+		#sound-dai-cells = <0>;
+		status = "okay";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				sii9022_in: endpoint {
+					remote-endpoint = <&ltdc_ep0_out>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				sii9022_tx_endpoint: endpoint {
+					remote-endpoint = <&i2s2_endpoint>;
+				};
+			};
+		};
+	};
+
+	cs42l51: cs42l51@4a {
+		compatible = "cirrus,cs42l51";
+		reg = <0x4a>;
+		#sound-dai-cells = <0>;
+		VL-supply = <&v3v3>;
+		VD-supply = <&v1v8_audio>;
+		VA-supply = <&v1v8_audio>;
+		VAHP-supply = <&v1v8_audio>;
+		reset-gpios = <&gpiog 9 GPIO_ACTIVE_LOW>;
+		clocks = <&sai2a>;
+		clock-names = "MCLK";
+		status = "okay";
+
+		cs42l51_port: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cs42l51_tx_endpoint: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&sai2a_endpoint>;
+				frame-master;
+				bitclock-master;
+			};
+
+			cs42l51_rx_endpoint: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&sai2b_endpoint>;
+				frame-master;
+				bitclock-master;
+			};
+		};
+	};
+};
+
+&i2c4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4_pins_a>;
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	typec: stusb1600@28 {
+		compatible = "st,stusb1600";
+		reg = <0x28>;
+		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-parent = <&gpioi>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&stusb1600_pins_a>;
+
+		status = "okay";
+
+		typec_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "sink";
+			power-opmode = "default";
+		};
+	};
+
+	pmic: stpmic@33 {
+		compatible = "st,stpmic1";
+		reg = <0x33>;
+		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		status = "okay";
+
+		regulators {
+			compatible = "st,stpmic1-regulators";
+			ldo1-supply = <&v3v3>;
+			ldo3-supply = <&vdd_ddr>;
+			ldo6-supply = <&v3v3>;
+			pwr_sw1-supply = <&bst_out>;
+			pwr_sw2-supply = <&bst_out>;
+
+			vddcore: buck1 {
+				regulator-name = "vddcore";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-always-on;
+				regulator-initial-mode = <0>;
+				regulator-over-current-protection;
+			};
+
+			vdd_ddr: buck2 {
+				regulator-name = "vdd_ddr";
+				regulator-min-microvolt = <1350000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-always-on;
+				regulator-initial-mode = <0>;
+				regulator-over-current-protection;
+			};
+
+			vdd: buck3 {
+				regulator-name = "vdd";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				st,mask-reset;
+				regulator-initial-mode = <0>;
+				regulator-over-current-protection;
+			};
+
+			v3v3: buck4 {
+				regulator-name = "v3v3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-over-current-protection;
+				regulator-initial-mode = <0>;
+			};
+
+			v1v8_audio: ldo1 {
+				regulator-name = "v1v8_audio";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				interrupts = <IT_CURLIM_LDO1 0>;
+			};
+
+			v3v3_hdmi: ldo2 {
+				regulator-name = "v3v3_hdmi";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				interrupts = <IT_CURLIM_LDO2 0>;
+			};
+
+			vtt_ddr: ldo3 {
+				regulator-name = "vtt_ddr";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <750000>;
+				regulator-always-on;
+				regulator-over-current-protection;
+			};
+
+			vdd_usb: ldo4 {
+				regulator-name = "vdd_usb";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				interrupts = <IT_CURLIM_LDO4 0>;
+			};
+
+			vdda: ldo5 {
+				regulator-name = "vdda";
+				regulator-min-microvolt = <2900000>;
+				regulator-max-microvolt = <2900000>;
+				interrupts = <IT_CURLIM_LDO5 0>;
+				regulator-boot-on;
+			};
+
+			v1v2_hdmi: ldo6 {
+				regulator-name = "v1v2_hdmi";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+				interrupts = <IT_CURLIM_LDO6 0>;
+			};
+
+			vref_ddr: vref_ddr {
+				regulator-name = "vref_ddr";
+				regulator-always-on;
+				regulator-over-current-protection;
+			};
+
+			 bst_out: boost {
+				regulator-name = "bst_out";
+				interrupts = <IT_OCP_BOOST 0>;
+			 };
+
+			vbus_otg: pwr_sw1 {
+				regulator-name = "vbus_otg";
+				interrupts = <IT_OCP_OTG 0>;
+			 };
+
+			 vbus_sw: pwr_sw2 {
+				regulator-name = "vbus_sw";
+				interrupts = <IT_OCP_SWOUT 0>;
+				regulator-active-discharge = <1>;
+			 };
+		};
+
+		onkey {
+			compatible = "st,stpmic1-onkey";
+			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 0>;
+			interrupt-names = "onkey-falling", "onkey-rising";
+			power-off-time-sec = <10>;
+			status = "okay";
+		};
+
+		watchdog {
+			compatible = "st,stpmic1-wdt";
+			status = "disabled";
+		};
+	};
+};
+
+&i2s2 {
+	clocks = <&rcc SPI2>, <&rcc SPI2_K>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
+	clock-names = "pclk", "i2sclk", "x8k", "x11k";
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2s2_pins_a>;
+	pinctrl-1 = <&i2s2_pins_sleep_a>;
+	status = "okay";
+
+	i2s2_port: port {
+		i2s2_endpoint: endpoint {
+			remote-endpoint = <&sii9022_tx_endpoint>;
+			format = "i2s";
+			mclk-fs = <256>;
+		};
+	};
+};
+
+&ipcc {
+	status = "okay";
+};
+
+&iwdg2 {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
+&ltdc {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&ltdc_pins_a>;
+	pinctrl-1 = <&ltdc_pins_sleep_a>;
+	status = "okay";
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ltdc_ep0_out: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&sii9022_in>;
+		};
+	};
+};
+
+&m4_rproc {
+	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
+			<&vdev0vring1>, <&vdev0buffer>;
+	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
+	mbox-names = "vq0", "vq1", "shutdown";
+	interrupt-parent = <&exti>;
+	interrupts = <68 1>;
+	status = "okay";
+};
+
+&pwr_regulators {
+	vdd-supply = <&vdd>;
+	vdd_3v3_usbfs-supply = <&vdd_usb>;
+};
+
+&rng1 {
+	status = "okay";
+};
+
+&rtc {
+	status = "okay";
+};
+
+&sai2 {
+	clocks = <&rcc SAI2>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
+	clock-names = "pclk", "x8k", "x11k";
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sai2a_pins_a>, <&sai2b_pins_b>;
+	pinctrl-1 = <&sai2a_sleep_pins_a>, <&sai2b_sleep_pins_b>;
+	status = "okay";
+
+	sai2a: audio-controller@4400b004 {
+		#clock-cells = <0>;
+		dma-names = "tx";
+		clocks = <&rcc SAI2_K>;
+		clock-names = "sai_ck";
+		status = "okay";
+
+		sai2a_port: port {
+			sai2a_endpoint: endpoint {
+				remote-endpoint = <&cs42l51_tx_endpoint>;
+				format = "i2s";
+				mclk-fs = <256>;
+				dai-tdm-slot-num = <2>;
+				dai-tdm-slot-width = <32>;
+			};
+		};
+	};
+
+	sai2b: audio-controller@4400b024 {
+		dma-names = "rx";
+		st,sync = <&sai2a 2>;
+		clocks = <&rcc SAI2_K>, <&sai2a>;
+		clock-names = "sai_ck", "MCLK";
+		status = "okay";
+
+		sai2b_port: port {
+			sai2b_endpoint: endpoint {
+				remote-endpoint = <&cs42l51_rx_endpoint>;
+				format = "i2s";
+				mclk-fs = <256>;
+				dai-tdm-slot-num = <2>;
+				dai-tdm-slot-width = <32>;
+			};
+		};
+	};
+};
+
+&sdmmc1 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
+	broken-cd;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&v3v3>;
+	status = "okay";
+};
+
+&sdmmc3 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc3_b4_pins_a>;
+	pinctrl-1 = <&sdmmc3_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc3_b4_sleep_pins_a>;
+	broken-cd;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&v3v3>;
+	status = "disabled";
+};
+
+&timers1 {
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "disabled";
+	pwm {
+		pinctrl-0 = <&pwm1_pins_a>;
+		pinctrl-1 = <&pwm1_sleep_pins_a>;
+		pinctrl-names = "default", "sleep";
+		status = "okay";
+	};
+	timer@0 {
+		status = "okay";
+	};
+};
+
+&timers3 {
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "disabled";
+	pwm {
+		pinctrl-0 = <&pwm3_pins_a>;
+		pinctrl-1 = <&pwm3_sleep_pins_a>;
+		pinctrl-names = "default", "sleep";
+		status = "okay";
+	};
+	timer@2 {
+		status = "okay";
+	};
+};
+
+&timers4 {
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "disabled";
+	pwm {
+		pinctrl-0 = <&pwm4_pins_a &pwm4_pins_b>;
+		pinctrl-1 = <&pwm4_sleep_pins_a &pwm4_sleep_pins_b>;
+		pinctrl-names = "default", "sleep";
+		status = "okay";
+	};
+	timer@3 {
+		status = "okay";
+	};
+};
+
+&timers5 {
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "disabled";
+	pwm {
+		pinctrl-0 = <&pwm5_pins_a>;
+		pinctrl-1 = <&pwm5_sleep_pins_a>;
+		pinctrl-names = "default", "sleep";
+		status = "okay";
+	};
+	timer@4 {
+		status = "okay";
+	};
+};
+
+&timers6 {
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "disabled";
+	timer@5 {
+		status = "okay";
+	};
+};
+
+&timers12 {
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "disabled";
+	pwm {
+		pinctrl-0 = <&pwm12_pins_a>;
+		pinctrl-1 = <&pwm12_sleep_pins_a>;
+		pinctrl-names = "default", "sleep";
+		status = "okay";
+	};
+	timer@11 {
+		status = "okay";
+	};
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_pins_a>;
+	status = "okay";
+};
+
+&usbh_ehci {
+	phys = <&usbphyc_port0>;
+	status = "okay";
+};
+
+&usbotg_hs {
+	dr_mode = "peripheral";
+	phys = <&usbphyc_port1 0>;
+	phy-names = "usb2-phy";
+	status = "okay";
+};
+
+&usbphyc {
+	status = "okay";
+};
+
+&usbphyc_port0 {
+	phy-supply = <&vdd_usb>;
+};
+
+&usbphyc_port1 {
+	phy-supply = <&vdd_usb>;
+};
+
+&vrefbuf {
+	regulator-min-microvolt = <2500000>;
+	regulator-max-microvolt = <2500000>;
+	vdda-supply = <&vdd>;
+	status = "okay";
+};
diff --git a/arch/arm/dts/stm32mp15xxaa-pinctrl.dtsi b/arch/arm/dts/stm32mp15xxaa-pinctrl.dtsi
new file mode 100644
index 0000000000..04f7a43ad6
--- /dev/null
+++ b/arch/arm/dts/stm32mp15xxaa-pinctrl.dtsi
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@st.com> for STMicroelectronics.
+ */
+
+&pinctrl {
+	st,package = <STM32MP_PKG_AA>;
+
+	gpioa: gpio@50002000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 0 16>;
+	};
+
+	gpiob: gpio@50003000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 16 16>;
+	};
+
+	gpioc: gpio@50004000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 32 16>;
+	};
+
+	gpiod: gpio@50005000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 48 16>;
+	};
+
+	gpioe: gpio@50006000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 64 16>;
+	};
+
+	gpiof: gpio@50007000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 80 16>;
+	};
+
+	gpiog: gpio@50008000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 96 16>;
+	};
+
+	gpioh: gpio@50009000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 112 16>;
+	};
+
+	gpioi: gpio@5000a000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 128 16>;
+	};
+
+	gpioj: gpio@5000b000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 144 16>;
+	};
+
+	gpiok: gpio@5000c000 {
+		status = "okay";
+		ngpios = <8>;
+		gpio-ranges = <&pinctrl 0 160 8>;
+	};
+};
+
+&pinctrl_z {
+	st,package = <STM32MP_PKG_AA>;
+
+	gpioz: gpio@54004000 {
+		status = "okay";
+		ngpios = <8>;
+		gpio-ranges = <&pinctrl_z 0 400 8>;
+	};
+};
diff --git a/arch/arm/dts/stm32mp15xxab-pinctrl.dtsi b/arch/arm/dts/stm32mp15xxab-pinctrl.dtsi
new file mode 100644
index 0000000000..328dad140e
--- /dev/null
+++ b/arch/arm/dts/stm32mp15xxab-pinctrl.dtsi
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@st.com> for STMicroelectronics.
+ */
+
+&pinctrl {
+	st,package = <STM32MP_PKG_AB>;
+
+	gpioa: gpio@50002000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 0 16>;
+	};
+
+	gpiob: gpio@50003000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 16 16>;
+	};
+
+	gpioc: gpio@50004000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 32 16>;
+	};
+
+	gpiod: gpio@50005000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 48 16>;
+	};
+
+	gpioe: gpio@50006000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 64 16>;
+	};
+
+	gpiof: gpio@50007000 {
+		status = "okay";
+		ngpios = <6>;
+		gpio-ranges = <&pinctrl 6 86 6>;
+	};
+
+	gpiog: gpio@50008000 {
+		status = "okay";
+		ngpios = <10>;
+		gpio-ranges = <&pinctrl 6 102 10>;
+	};
+
+	gpioh: gpio@50009000 {
+		status = "okay";
+		ngpios = <2>;
+		gpio-ranges = <&pinctrl 0 112 2>;
+	};
+};
diff --git a/arch/arm/dts/stm32mp15xxac-pinctrl.dtsi b/arch/arm/dts/stm32mp15xxac-pinctrl.dtsi
new file mode 100644
index 0000000000..7eaa245f44
--- /dev/null
+++ b/arch/arm/dts/stm32mp15xxac-pinctrl.dtsi
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@st.com> for STMicroelectronics.
+ */
+
+&pinctrl {
+	st,package = <STM32MP_PKG_AC>;
+
+	gpioa: gpio@50002000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 0 16>;
+	};
+
+	gpiob: gpio@50003000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 16 16>;
+	};
+
+	gpioc: gpio@50004000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 32 16>;
+	};
+
+	gpiod: gpio@50005000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 48 16>;
+	};
+
+	gpioe: gpio@50006000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 64 16>;
+	};
+
+	gpiof: gpio@50007000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 80 16>;
+	};
+
+	gpiog: gpio@50008000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 96 16>;
+	};
+
+	gpioh: gpio@50009000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 112 16>;
+	};
+
+	gpioi: gpio@5000a000 {
+		status = "okay";
+		ngpios = <12>;
+		gpio-ranges = <&pinctrl 0 128 12>;
+	};
+};
+
+&pinctrl_z {
+	st,package = <STM32MP_PKG_AC>;
+
+	gpioz: gpio@54004000 {
+		status = "okay";
+		ngpios = <8>;
+		gpio-ranges = <&pinctrl_z 0 400 8>;
+	};
+};
diff --git a/arch/arm/dts/stm32mp15xxad-pinctrl.dtsi b/arch/arm/dts/stm32mp15xxad-pinctrl.dtsi
new file mode 100644
index 0000000000..b63e207de2
--- /dev/null
+++ b/arch/arm/dts/stm32mp15xxad-pinctrl.dtsi
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@st.com> for STMicroelectronics.
+ */
+
+&pinctrl {
+	st,package = <STM32MP_PKG_AD>;
+
+	gpioa: gpio@50002000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 0 16>;
+	};
+
+	gpiob: gpio@50003000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 16 16>;
+	};
+
+	gpioc: gpio@50004000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 32 16>;
+	};
+
+	gpiod: gpio@50005000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 48 16>;
+	};
+
+	gpioe: gpio@50006000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 64 16>;
+	};
+
+	gpiof: gpio@50007000 {
+		status = "okay";
+		ngpios = <6>;
+		gpio-ranges = <&pinctrl 6 86 6>;
+	};
+
+	gpiog: gpio@50008000 {
+		status = "okay";
+		ngpios = <10>;
+		gpio-ranges = <&pinctrl 6 102 10>;
+	};
+
+	gpioh: gpio@50009000 {
+		status = "okay";
+		ngpios = <2>;
+		gpio-ranges = <&pinctrl 0 112 2>;
+	};
+};
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
