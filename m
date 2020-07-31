Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 303E7234096
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 09:55:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE4E1C36B35
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 07:55:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EED1C36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 07:55:14 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06V7mVT3016695; Fri, 31 Jul 2020 09:55:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=rpw2ZHJd/GoMDsVwbyfr02Adv675OTaPXOaeVy6eXsU=;
 b=u9nnLieDwDlqpS9duYdaW5DZ5UKbh4ZYcN17i2DVB/Los+BgYKxP7Emo8o6tNNYibE+F
 jjTZ/9zekqubxcCoL0pxp+WnnjhcJn9e5iHSJB6IVqf7MECNdkCSlmGAVuJsq5q2ew9n
 JyI1bNfkLCRikFYRzc6oQURjrB5qWkTRGLqOlHu6FihgbJcWhTElRbRyHi9nAMXI/kJ0
 R4AcY1T76A6tG2WggllDxcmmOY/f8aBoDke/hqAq4c+gv2tgqAXZJ9jAYn5BhdEA1mXc
 g/VuIlJQ2E5Bd+o3tbPvdmLBkjeZSwKhA+n/VKSIiKIxH3E5Y9GkbfCDw2LnvXpYFDto PA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gbmgn6xh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 09:55:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8B89410002A;
 Fri, 31 Jul 2020 09:55:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8098122109D;
 Fri, 31 Jul 2020 09:55:12 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 31 Jul 2020 09:55:12 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 31 Jul 2020 09:53:44 +0200
Message-ID: <1596182024-18181-12-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1596182024-18181-1-git-send-email-christophe.kerello@st.com>
References: <1596182024-18181-1-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_02:2020-07-31,
 2020-07-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Christophe Kerello <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 11/11] ARM: dts: stm32: add FMC2 EBI support
	for stm32mp157c
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

This patch adds FMC2 External Bus Interface support on stm32mp157c.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---

 arch/arm/dts/stm32mp151.dtsi     | 43 +++++++++++++++++++++++++++-------------
 arch/arm/dts/stm32mp157c-ev1.dts | 16 ++++++++-------
 2 files changed, 38 insertions(+), 21 deletions(-)

diff --git a/arch/arm/dts/stm32mp151.dtsi b/arch/arm/dts/stm32mp151.dtsi
index 0d97f56..39d9e54 100644
--- a/arch/arm/dts/stm32mp151.dtsi
+++ b/arch/arm/dts/stm32mp151.dtsi
@@ -1328,23 +1328,38 @@
 			dma-requests = <48>;
 		};
 
-		fmc: nand-controller@58002000 {
-			compatible = "st,stm32mp15-fmc2";
-			reg = <0x58002000 0x1000>,
-			      <0x80000000 0x1000>,
-			      <0x88010000 0x1000>,
-			      <0x88020000 0x1000>,
-			      <0x81000000 0x1000>,
-			      <0x89010000 0x1000>,
-			      <0x89020000 0x1000>;
-			interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&mdma1 20 0x10 0x12000a02 0x0 0x0>,
-			       <&mdma1 20 0x10 0x12000a08 0x0 0x0>,
-			       <&mdma1 21 0x10 0x12000a0a 0x0 0x0>;
-			dma-names = "tx", "rx", "ecc";
+		fmc: memory-controller@58002000 {
+			#address-cells = <2>;
+			#size-cells = <1>;
+			compatible = "st,stm32mp1-fmc2-ebi";
+			reg = <0x58002000 0x1000>;
 			clocks = <&rcc FMC_K>;
 			resets = <&rcc FMC_R>;
 			status = "disabled";
+
+			ranges = <0 0 0x60000000 0x04000000>, /* EBI CS 1 */
+				 <1 0 0x64000000 0x04000000>, /* EBI CS 2 */
+				 <2 0 0x68000000 0x04000000>, /* EBI CS 3 */
+				 <3 0 0x6c000000 0x04000000>, /* EBI CS 4 */
+				 <4 0 0x80000000 0x10000000>; /* NAND */
+
+			nand-controller@4,0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "st,stm32mp1-fmc2-nfc";
+				reg = <4 0x00000000 0x1000>,
+				      <4 0x08010000 0x1000>,
+				      <4 0x08020000 0x1000>,
+				      <4 0x01000000 0x1000>,
+				      <4 0x09010000 0x1000>,
+				      <4 0x09020000 0x1000>;
+				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&mdma1 20 0x2 0x12000a02 0x0 0x0>,
+				       <&mdma1 20 0x2 0x12000a08 0x0 0x0>,
+				       <&mdma1 21 0x2 0x12000a0a 0x0 0x0>;
+				dma-names = "tx", "rx", "ecc";
+				status = "disabled";
+			};
 		};
 
 		qspi: spi@58003000 {
diff --git a/arch/arm/dts/stm32mp157c-ev1.dts b/arch/arm/dts/stm32mp157c-ev1.dts
index b190565..46f81ce 100644
--- a/arch/arm/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/dts/stm32mp157c-ev1.dts
@@ -157,14 +157,16 @@
 	pinctrl-0 = <&fmc_pins_a>;
 	pinctrl-1 = <&fmc_sleep_pins_a>;
 	status = "okay";
-	#address-cells = <1>;
-	#size-cells = <0>;
 
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-		#address-cells = <1>;
-		#size-cells = <1>;
+	nand-controller@4,0 {
+		status = "okay";
+
+		nand@0 {
+			reg = <0>;
+			nand-on-flash-bbt;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
 	};
 };
 
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
