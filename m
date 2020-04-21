Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC09E1B2AC0
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 17:11:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 842BDC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 15:11:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECFCCC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 15:11:55 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LF8D2L010796; Tue, 21 Apr 2020 17:11:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=tNHgQxGJV45utkhAIvL6TymMYiLwxjtwXcHC8oCJ0nw=;
 b=yKcVXex3nI19kdEKMRIm6o/9qxAqy4fC5Ax7XQ59KVhvTR1F6UJV7mqxh2UuSY85RVsg
 euVeYA8wvoYixVcp1pgiP/hB5CF6Jcc2J5kHlNahfXHib4ig1qCcbShhHr+hGqI0QBoS
 5YXC7k4ZXD6ZxPUn1Vxbg5D06dcMHOWx9tJxnliOpXI5njW2WhqiSuGrQWNJxbdCYcSp
 fCV5iAh0HXZRZC2DewtbosFK3C5i2DVqKQHxymtmQEXXTupK1yDhTd38wwm/xVSYVqgB
 S/8Go65Gd4NZMYAnhP/XETBjRGB+tXM5ePy522WdxThnwvHds5v3c7gE+pHXrh1Ke676 PQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fq11gwkp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Apr 2020 17:11:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D0C5010002A;
 Tue, 21 Apr 2020 17:11:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C6ECF2BA162;
 Tue, 21 Apr 2020 17:11:46 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 21 Apr 2020 17:11:46 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 21 Apr 2020 17:11:21 +0200
Message-ID: <20200421171123.2.Id3620aec4deb419f1c1a5876b865556e86d3aba1@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421151128.18072-1-patrick.delaunay@st.com>
References: <20200421151128.18072-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_05:2020-04-20,
 2020-04-21 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/9] ARM: dts: stm32: add cpufreq support on
	stm32mp15x
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

This commit adds cpufreq support on stm32mp15x SOC. STM32 cpufreq uses
operating points V2 bindings (no legacy). Nvmem cells have to be used to
know the chip version and then which OPPs are available. Note that STM32
cpufreq driver is mainly based on "cpufreq-dt" driver.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp151.dtsi      | 21 +++++++++++++++++++++
 arch/arm/dts/stm32mp157c-ed1.dts  |  8 ++++++++
 arch/arm/dts/stm32mp15xx-dkx.dtsi |  8 ++++++++
 3 files changed, 37 insertions(+)

diff --git a/arch/arm/dts/stm32mp151.dtsi b/arch/arm/dts/stm32mp151.dtsi
index f185639a46..1d465c3064 100644
--- a/arch/arm/dts/stm32mp151.dtsi
+++ b/arch/arm/dts/stm32mp151.dtsi
@@ -19,6 +19,24 @@
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <0>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			nvmem-cells = <&part_number_otp>;
+			nvmem-cell-names = "part_number";
+		};
+	};
+
+	cpu0_opp_table: cpu0-opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+		opp-650000000 {
+			opp-hz = /bits/ 64 <650000000>;
+			opp-microvolt = <1200000>;
+			opp-supported-hw = <0x1>;
+		};
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <1350000>;
+			opp-supported-hw = <0x2>;
 		};
 	};
 
@@ -1512,6 +1530,9 @@
 			reg = <0x5c005000 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			part_number_otp: part_number_otp@4 {
+				reg = <0x4 0x1>;
+			};
 			ts_cal1: calib@5c {
 				reg = <0x5c 0x2>;
 			};
diff --git a/arch/arm/dts/stm32mp157c-ed1.dts b/arch/arm/dts/stm32mp157c-ed1.dts
index 54af7c97b3..7215eb4768 100644
--- a/arch/arm/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/dts/stm32mp157c-ed1.dts
@@ -107,6 +107,14 @@
 	};
 };
 
+&cpu0{
+	cpu-supply = <&vddcore>;
+};
+
+&cpu1{
+	cpu-supply = <&vddcore>;
+};
+
 &dac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&dac_ch1_pins_a &dac_ch2_pins_a>;
diff --git a/arch/arm/dts/stm32mp15xx-dkx.dtsi b/arch/arm/dts/stm32mp15xx-dkx.dtsi
index 42d3f0cb2d..861280afe8 100644
--- a/arch/arm/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dkx.dtsi
@@ -116,6 +116,14 @@
 	status = "okay";
 };
 
+&cpu0{
+	cpu-supply = <&vddcore>;
+};
+
+&cpu1{
+	cpu-supply = <&vddcore>;
+};
+
 &ethernet0 {
 	status = "okay";
 	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
