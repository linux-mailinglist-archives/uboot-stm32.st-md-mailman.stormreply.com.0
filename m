Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B332C5614BB
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jun 2022 10:20:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 769EDC60466;
	Thu, 30 Jun 2022 08:20:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17C51C6046D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jun 2022 08:20:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25U5lWW0017982;
 Thu, 30 Jun 2022 10:20:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=rbkmDHBDwhJuHSDLpnVTuHi4Kx7rnJq6fjc0ygiWFns=;
 b=frAI6dGfBGLy4LTVkkE4TR5ku+hNM20v7jICnUG2BcRkik5S5Q56oFbsIVDcjzGQ1AN1
 IKD9DzV68Dfa79U4TmIxvsnMA93mwpUSIQXyuOediA/4hf84S3MTW3mKa/dse4QWG+ad
 HplgtOKiM8vJ5DtYaRW6sDSFQ5egTyEY5KAGDNtahrgshIqSN1+KcLrbOhexVy9M55o+
 Z7RgGCyUE4aaU50h3lZh/WBkcHmv+pxLrKLVUf80oFyMciVeJ2I5fdfXbAfxpKyVJ6/U
 M6s359Z+zlJXXOd+9/PY/frTIfs1NWkdOH/oc0VkK1qQVusysyFquHdjkoewmBEkFCGm Jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h0kbxqfvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jun 2022 10:20:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1CE11100039;
 Thu, 30 Jun 2022 10:20:44 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 166672132C9;
 Thu, 30 Jun 2022 10:20:44 +0200 (CEST)
Received: from localhost (10.75.127.47) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 30 Jun
 2022 10:20:28 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 30 Jun 2022 10:20:17 +0200
Message-ID: <20220630101930.v2.4.Ib74d333801972878b95f6e10ed81a8160e1a121d@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630101930.v2.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
References: <20220630101930.v2.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-30_04,2022-06-28_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH v2 04/10] ARM: dts: stm32mp13: alignment with
	v5.19
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

Device tree alignment with Linux kernel v5.19-rc1 with:
- ARM: dts: stm32: add UserPA13 button on stm32mp135f-dk
- ARM: dts: stm32: add blue led (Linux heartbeat) on stm32mp135f-dk
- ARM: dts: stm32: add EXTI interrupt-parent to pinctrl node on stm32mp131
- ARM: dts: stm32: enable RTC support on stm32mp135f-dk
- ARM: dts: stm32: add RTC node on stm32mp131
- ARM: dts: stm32: fix pinctrl node name warnings (MPU soc)

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 arch/arm/dts/stm32mp131.dtsi    | 19 ++++++++++++++++++-
 arch/arm/dts/stm32mp135f-dk.dts | 29 +++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/arch/arm/dts/stm32mp131.dtsi b/arch/arm/dts/stm32mp131.dtsi
index 950e172e455..a30989f287e 100644
--- a/arch/arm/dts/stm32mp131.dtsi
+++ b/arch/arm/dts/stm32mp131.dtsi
@@ -75,6 +75,12 @@
 			compatible = "fixed-clock";
 			clock-frequency = <99000000>;
 		};
+
+		clk_rtc_k: clk-rtc-k {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <32768>;
+		};
 	};
 
 	intc: interrupt-controller@a0021000 {
@@ -218,6 +224,15 @@
 			status = "disabled";
 		};
 
+		rtc: rtc@5c004000 {
+			compatible = "st,stm32mp1-rtc";
+			reg = <0x5c004000 0x400>;
+			interrupts-extended = <&exti 19 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_pclk4>, <&clk_rtc_k>;
+			clock-names = "pclk", "rtc_ck";
+			status = "disabled";
+		};
+
 		bsec: efuse@5c005000 {
 			compatible = "st,stm32mp13-bsec";
 			reg = <0x5c005000 0x400>;
@@ -239,11 +254,13 @@
 		 * Break node order to solve dependency probe issue between
 		 * pinctrl and exti.
 		 */
-		pinctrl: pin-controller@50002000 {
+		pinctrl: pinctrl@50002000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "st,stm32mp135-pinctrl";
 			ranges = <0 0x50002000 0x8400>;
+			interrupt-parent = <&exti>;
+			st,syscfg = <&exti 0x60 0xff>;
 			pins-are-numbered;
 
 			gpioa: gpio@50002000 {
diff --git a/arch/arm/dts/stm32mp135f-dk.dts b/arch/arm/dts/stm32mp135f-dk.dts
index ee100d108ea..09d6226d598 100644
--- a/arch/arm/dts/stm32mp135f-dk.dts
+++ b/arch/arm/dts/stm32mp135f-dk.dts
@@ -6,6 +6,9 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include "stm32mp135.dtsi"
 #include "stm32mp13xf.dtsi"
 #include "stm32mp13-pinctrl.dtsi"
@@ -23,6 +26,28 @@
 		reg = <0xc0000000 0x20000000>;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		user-pa13 {
+			label = "User-PA13";
+			linux,code = <BTN_1>;
+			gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-blue {
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+			default-state = "off";
+		};
+	};
+
 	vdd_sd: vdd-sd {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_sd";
@@ -37,6 +62,10 @@
 	status = "okay";
 };
 
+&rtc {
+	status = "okay";
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_clk_pins_a>;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
