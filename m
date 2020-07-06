Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E1721564F
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 Jul 2020 13:26:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68FD4C36B29
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 Jul 2020 11:26:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C35FC36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2020 11:26:57 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 066BPhrM019796; Mon, 6 Jul 2020 13:26:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=y1kNdWIuSjx9MYrs8JRToJXlIQ1gFzkUJ/TLuC3vr/c=;
 b=mZUuRnNiyY9oNspjHlJHmimTBKxcnjCxt2/bDEsbHH08WgQHe+WzAMzynZXoDjyeYNtc
 bT3IhRSPKSrP5+N905qy+LVv2R+O5lz4Zcnl6bsTn6lUovU+FqY305raSTCIT2NRBO2i
 GSsrkLBbzDgw7XWgQylyOEn+lFn/KGF5XCpMLDZWvTVMpwjnK8pGtD02EJRcnDv3wdkB
 gxJfyJrgwywK+mATTXZ+jTz30MasLo87y0fCCkEvnVZtzfyimPODcR6ftOIEY271Jjh9
 09D+F7zWLYhf0jNCw0Wu65wnDtaN2Lip/piKAUYND+paT+vqpq+gFq5NN7vyVN06wzHr Zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 322gnfaqy4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 13:26:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 737A2100034;
 Mon,  6 Jul 2020 13:26:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6BA902B4D28;
 Mon,  6 Jul 2020 13:26:55 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 6 Jul 2020 13:26:54 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 6 Jul 2020 13:26:51 +0200
Message-ID: <20200706112653.18951-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-06_08:2020-07-06,
 2020-07-06 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/3] ARM: dts: rename stm32mp15xx-avenger96
	ethernet0_rgmii_pins
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

Alignment with pins name used in Linux kernel v5.8.

It is a preleminary step for device tree alignment.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp15-pinctrl.dtsi          | 4 ++--
 arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/dts/stm32mp15-pinctrl.dtsi b/arch/arm/dts/stm32mp15-pinctrl.dtsi
index c385896ebc..b0c2aa52f8 100644
--- a/arch/arm/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp15-pinctrl.dtsi
@@ -162,7 +162,7 @@
 		};
 	};
 
-	ethernet0_rgmii_pins_b: rgmii-1 {
+	ethernet0_rgmii_pins_c: rgmii-2 {
 		pins1 {
 			pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
 				 <STM32_PINMUX('G', 4, AF11)>, /* ETH_RGMII_GTX_CLK */
@@ -193,7 +193,7 @@
 		};
 	};
 
-	ethernet0_rgmii_pins_sleep_b: rgmii-sleep-1 {
+	ethernet0_rgmii_sleep_pins_c: rgmii-sleep-2 {
 		pins1 {
 			pinmux = <STM32_PINMUX('G', 5, ANALOG)>, /* ETH_RGMII_CLK125 */
 				 <STM32_PINMUX('G', 4, ANALOG)>, /* ETH_RGMII_GTX_CLK */
diff --git a/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts b/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts
index c1cc80bcf5..88f25d89b2 100644
--- a/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts
+++ b/arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts
@@ -89,8 +89,8 @@
 
 &ethernet0 {
 	status = "okay";
-	pinctrl-0 = <&ethernet0_rgmii_pins_b>;
-	pinctrl-1 = <&ethernet0_rgmii_pins_sleep_b>;
+	pinctrl-0 = <&ethernet0_rgmii_pins_c>;
+	pinctrl-1 = <&ethernet0_rgmii_sleep_pins_c>;
 	pinctrl-names = "default", "sleep";
 	phy-mode = "rgmii";
 	max-speed = <1000>;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
