Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11370F19B7
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Nov 2019 16:16:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA1A3C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Nov 2019 15:16:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3560C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 15:16:51 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA6F2d7Z024644; Wed, 6 Nov 2019 16:16:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Yz20wI14HDX1EceOwuSmvf4ncysE5UjAZGlTwI7xUyk=;
 b=z6S77tJvm723lLLIEemh6LnXYmxnaUyik9sLMrk0gjd4gOV4pwFjvhts4qTnXqHsGLMJ
 YM9C1/K3pYypijPdG3yCaMGF6GPkathBgRQVLKKPHQunfLxylLb2n0tYp3lUR/wNaZKo
 YvaA93JjkQyLf/ikkjgIflkg7bDTTTShDygSGRbjnnqBHjl/UP+5wJPylE3LGr1UQomZ
 62bpoqxsicErYPB2Yi8eIb2Z44CiAMYfduE2/5NhthQOZCAvwrF9lNfkP8333NJHbmgZ
 5xF+dHS83iACiyUZoalCI3CqaqvM5l0GbPa4Lms/WmRqqK9qrCgtFlNr6H3OwrZvntMn 4g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w10f1p5u4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Nov 2019 16:16:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3677B10002A;
 Wed,  6 Nov 2019 16:16:50 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 28D6D2BF9C6;
 Wed,  6 Nov 2019 16:16:50 +0100 (CET)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 6 Nov 2019
 16:16:50 +0100
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 6 Nov 2019 16:16:47
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 6 Nov 2019 16:16:34 +0100
Message-ID: <20191106151634.7834-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191106151634.7834-1-patrick.delaunay@st.com>
References: <20191106151634.7834-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-06_04:2019-11-06,2019-11-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 3/3] ARM: dts: stm32: update eMMC
	configuration for stm32mp157c-ev1
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

Update the sdmmc2 node for eMMC support on eval board stm32mp157c-ev1.
- update slew-rate for pin configuration
- update "vqmmc-supply"
- remove "st,sig-dir"
- add mandatory "pinctrl-names"
- add "mmc-ddr-3_3v"

This patch solve the eMMC detection issue for command "mmc dev 1".

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp157-pinctrl.dtsi          | 57 +++++++++++++++++--
 .../arm/dts/stm32mp157a-avenger96-u-boot.dtsi |  5 +-
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi      |  5 +-
 arch/arm/dts/stm32mp157c-ed1.dts              |  7 ++-
 4 files changed, 66 insertions(+), 8 deletions(-)

diff --git a/arch/arm/dts/stm32mp157-pinctrl.dtsi b/arch/arm/dts/stm32mp157-pinctrl.dtsi
index 2d73d502d9..0d53396119 100644
--- a/arch/arm/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp157-pinctrl.dtsi
@@ -812,31 +812,80 @@
 			};
 
 			sdmmc2_b4_pins_a: sdmmc2-b4-0 {
-				pins {
+				pins1 {
 					pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
 						 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC2_D1 */
 						 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC2_D2 */
 						 <STM32_PINMUX('B', 4, AF9)>, /* SDMMC2_D3 */
-						 <STM32_PINMUX('E', 3, AF9)>, /* SDMMC2_CK */
 						 <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
-					slew-rate = <3>;
+					slew-rate = <1>;
+					drive-push-pull;
+					bias-pull-up;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('E', 3, AF9)>; /* SDMMC2_CK */
+					slew-rate = <2>;
 					drive-push-pull;
 					bias-pull-up;
 				};
 			};
 
+			sdmmc2_b4_od_pins_a: sdmmc2-b4-od-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
+						 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC2_D1 */
+						 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC2_D2 */
+						 <STM32_PINMUX('B', 4, AF9)>; /* SDMMC2_D3 */
+					slew-rate = <1>;
+					drive-push-pull;
+					bias-pull-up;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('E', 3, AF9)>; /* SDMMC2_CK */
+					slew-rate = <2>;
+					drive-push-pull;
+					bias-pull-up;
+				};
+				pins3 {
+					pinmux = <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
+					slew-rate = <1>;
+					drive-open-drain;
+					bias-pull-up;
+				};
+			};
+
+			sdmmc2_b4_sleep_pins_a: sdmmc2-b4-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('B', 14, ANALOG)>, /* SDMMC2_D0 */
+						 <STM32_PINMUX('B', 15, ANALOG)>, /* SDMMC2_D1 */
+						 <STM32_PINMUX('B', 3, ANALOG)>, /* SDMMC2_D2 */
+						 <STM32_PINMUX('B', 4, ANALOG)>, /* SDMMC2_D3 */
+						 <STM32_PINMUX('E', 3, ANALOG)>, /* SDMMC2_CK */
+						 <STM32_PINMUX('G', 6, ANALOG)>; /* SDMMC2_CMD */
+				};
+			};
+
 			sdmmc2_d47_pins_a: sdmmc2-d47-0 {
 				pins {
 					pinmux = <STM32_PINMUX('A', 8, AF9)>, /* SDMMC2_D4 */
 						 <STM32_PINMUX('A', 9, AF10)>, /* SDMMC2_D5 */
 						 <STM32_PINMUX('E', 5, AF9)>, /* SDMMC2_D6 */
 						 <STM32_PINMUX('D', 3, AF9)>; /* SDMMC2_D7 */
-					slew-rate = <3>;
+					slew-rate = <1>;
 					drive-push-pull;
 					bias-pull-up;
 				};
 			};
 
+			sdmmc2_d47_sleep_pins_a: sdmmc2-d47-sleep-0 {
+				pins {
+					pinmux = <STM32_PINMUX('A', 8, ANALOG)>, /* SDMMC2_D4 */
+						 <STM32_PINMUX('A', 9, ANALOG)>, /* SDMMC2_D5 */
+						 <STM32_PINMUX('E', 5, ANALOG)>, /* SDMMC2_D6 */
+						 <STM32_PINMUX('D', 3, ANALOG)>; /* SDMMC2_D7 */
+				};
+			};
+
 			spdifrx_pins_a: spdifrx-0 {
 				pins {
 					pinmux = <STM32_PINMUX('G', 12, AF8)>; /* SPDIF_IN1 */
diff --git a/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi b/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
index 1ff681afb8..1104a70a65 100644
--- a/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
@@ -155,7 +155,10 @@
 
 &sdmmc2_b4_pins_a {
 	u-boot,dm-spl;
-	pins {
+	pins1 {
+		u-boot,dm-spl;
+	};
+	pins2 {
 		u-boot,dm-spl;
 	};
 };
diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
index 4953a0db55..b2ac49472a 100644
--- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
@@ -174,7 +174,10 @@
 
 &sdmmc2_b4_pins_a {
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
index 73d07cf42f..bc4d7e1ab5 100644
--- a/arch/arm/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/dts/stm32mp157c-ed1.dts
@@ -294,15 +294,18 @@
 };
 
 &sdmmc2 {
+	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
+	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
 	non-removable;
 	no-sd;
 	no-sdio;
-	st,sig-dir;
 	st,neg-edge;
 	bus-width = <8>;
 	vmmc-supply = <&v3v3>;
-	vqmmc-supply = <&vdd>;
+	vqmmc-supply = <&v3v3>;
+	mmc-ddr-3_3v;
 	status = "okay";
 };
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
