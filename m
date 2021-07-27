Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9833D72E4
	for <lists+uboot-stm32@lfdr.de>; Tue, 27 Jul 2021 12:15:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F8A8C58D5D;
	Tue, 27 Jul 2021 10:15:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3121C5719C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jul 2021 10:15:34 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16RACNCN010290; Tue, 27 Jul 2021 12:15:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=n1KuxE4wBU8KMDeiLN3e2HorrmiCc6NxXjz9L75Bu64=;
 b=PAQkSMlPrmbgIhNqeTgoM5r+P1uCZ/2BPV12KyAuDOBJOx4Mkv497I4X/6JZQ3seeJbf
 /YrCKz2l+UJL9NSkc/FtlvK3/odcWL783iq7E6hjrcgKPCIr7pMnYYJDRdHy34jptPP/
 aTtmIDTlsjzSpb8YPdHld3cJoO4WVrNwAj+9iKsGu7TUX6PimWOCBYXSnpkuMCTPipP9
 19lilcnmMrduacYDxfoVBhdYRmiRtU0VOJb06UFC/8t/KEYo6mb1GLwIfe1pvbx/Os/n
 oQfk51F0iVUejW9Icubyrjdc9T8Yc/OJfmAaf66ula0TxzXZXQIOa1y3vC6jpK3HhX1L WQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a235n3jyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 12:15:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 78D6310002A;
 Tue, 27 Jul 2021 12:15:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5521D21ED31;
 Tue, 27 Jul 2021 12:15:26 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 27 Jul 2021 12:15:25
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 27 Jul 2021 12:15:12 +0200
Message-ID: <20210727121500.1.Ide735d274413b7aa45e4cda9d2b4a46e976d7b08@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-27_06:2021-07-27,
 2021-07-27 signatures=0
Cc: Etienne Carriere <etienne.carriere@st.com>, Tom Rini <trini@konsulko.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] arm: dts: stm32mp15: alignment with v5.14
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

Device tree alignment with Linux kernel v5.14-rc3
- ARM: dts: stm32: move stmmac axi config in ethernet node on stm32mp15
- ARM: dts: stm32: Configure qspi's mdma transfer to block for stm32mp151
- ARM: dts: stm32: add a new DCMI pins group on stm32mp15
- ARM: dts: stm32: fix ltdc pinctrl on microdev2.0-of7

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/dts/stm32mp15-pinctrl.dtsi           | 33 +++++++++++++++++++
 arch/arm/dts/stm32mp151.dtsi                  | 16 ++++-----
 ...157a-microgea-stm32mp1-microdev2.0-of7.dts |  2 +-
 3 files changed, 42 insertions(+), 9 deletions(-)

diff --git a/arch/arm/dts/stm32mp15-pinctrl.dtsi b/arch/arm/dts/stm32mp15-pinctrl.dtsi
index 060baa8b7e..5b60ecbd71 100644
--- a/arch/arm/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp15-pinctrl.dtsi
@@ -118,6 +118,39 @@
 		};
 	};
 
+	dcmi_pins_b: dcmi-1 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 4,  AF13)>,/* DCMI_HSYNC */
+				 <STM32_PINMUX('B', 7,  AF13)>,/* DCMI_VSYNC */
+				 <STM32_PINMUX('A', 6,  AF13)>,/* DCMI_PIXCLK */
+				 <STM32_PINMUX('C', 6,  AF13)>,/* DCMI_D0 */
+				 <STM32_PINMUX('H', 10, AF13)>,/* DCMI_D1 */
+				 <STM32_PINMUX('H', 11, AF13)>,/* DCMI_D2 */
+				 <STM32_PINMUX('E', 1,  AF13)>,/* DCMI_D3 */
+				 <STM32_PINMUX('E', 11, AF13)>,/* DCMI_D4 */
+				 <STM32_PINMUX('D', 3,  AF13)>,/* DCMI_D5 */
+				 <STM32_PINMUX('E', 13, AF13)>,/* DCMI_D6 */
+				 <STM32_PINMUX('B', 9,  AF13)>;/* DCMI_D7 */
+			bias-disable;
+		};
+	};
+
+	dcmi_sleep_pins_b: dcmi-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 4,  ANALOG)>,/* DCMI_HSYNC */
+				 <STM32_PINMUX('B', 7,  ANALOG)>,/* DCMI_VSYNC */
+				 <STM32_PINMUX('A', 6,  ANALOG)>,/* DCMI_PIXCLK */
+				 <STM32_PINMUX('C', 6,  ANALOG)>,/* DCMI_D0 */
+				 <STM32_PINMUX('H', 10, ANALOG)>,/* DCMI_D1 */
+				 <STM32_PINMUX('H', 11, ANALOG)>,/* DCMI_D2 */
+				 <STM32_PINMUX('E', 1,  ANALOG)>,/* DCMI_D3 */
+				 <STM32_PINMUX('E', 11, ANALOG)>,/* DCMI_D4 */
+				 <STM32_PINMUX('D', 3,  ANALOG)>,/* DCMI_D5 */
+				 <STM32_PINMUX('E', 13, ANALOG)>,/* DCMI_D6 */
+				 <STM32_PINMUX('B', 9,  ANALOG)>;/* DCMI_D7 */
+		};
+	};
+
 	ethernet0_rgmii_pins_a: rgmii-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
diff --git a/arch/arm/dts/stm32mp151.dtsi b/arch/arm/dts/stm32mp151.dtsi
index 177927d14e..8e0a0bc1dd 100644
--- a/arch/arm/dts/stm32mp151.dtsi
+++ b/arch/arm/dts/stm32mp151.dtsi
@@ -1399,8 +1399,8 @@
 			reg = <0x58003000 0x1000>, <0x70000000 0x10000000>;
 			reg-names = "qspi", "qspi_mm";
 			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&mdma1 22 0x2 0x100002 0x0 0x0>,
-			       <&mdma1 22 0x2 0x100008 0x0 0x0>;
+			dmas = <&mdma1 22 0x2 0x10100002 0x0 0x0>,
+			       <&mdma1 22 0x2 0x10100008 0x0 0x0>;
 			dma-names = "tx", "rx";
 			clocks = <&rcc QSPI_K>;
 			resets = <&rcc QSPI_R>;
@@ -1446,12 +1446,6 @@
 			status = "disabled";
 		};
 
-		stmmac_axi_config_0: stmmac-axi-config {
-			snps,wr_osr_lmt = <0x7>;
-			snps,rd_osr_lmt = <0x7>;
-			snps,blen = <0 0 0 0 16 8 4>;
-		};
-
 		ethernet0: ethernet@5800a000 {
 			compatible = "st,stm32mp1-dwmac", "snps,dwmac-4.20a";
 			reg = <0x5800a000 0x2000>;
@@ -1477,6 +1471,12 @@
 			snps,axi-config = <&stmmac_axi_config_0>;
 			snps,tso;
 			status = "disabled";
+
+			stmmac_axi_config_0: stmmac-axi-config {
+				snps,wr_osr_lmt = <0x7>;
+				snps,rd_osr_lmt = <0x7>;
+				snps,blen = <0 0 0 0 16 8 4>;
+			};
 		};
 
 		usbh_ohci: usb@5800c000 {
diff --git a/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts b/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
index 674b2d330d..5670b23812 100644
--- a/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
+++ b/arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
@@ -89,7 +89,7 @@
 };
 
 &pinctrl {
-	ltdc_pins: ltdc {
+	ltdc_pins: ltdc-0 {
 		pins {
 			pinmux = <STM32_PINMUX('G', 10, AF14)>,	/* LTDC_B2 */
 				 <STM32_PINMUX('H', 12, AF14)>,	/* LTDC_R6 */
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
