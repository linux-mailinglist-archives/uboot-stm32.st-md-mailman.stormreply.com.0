Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C093A1E0B94
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 May 2020 12:20:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 356BEC36B23
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 May 2020 10:20:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EC43C36B23
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 10:19:59 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04PAHlAe026084; Mon, 25 May 2020 12:19:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=856wavYBJdjo2lzWnNJzGm6bbwv0xm9DvNQ4D2RaW8g=;
 b=fFTn1gtqPnlwo6paArIXQrQvKM9OLrz1qMdhqOR2GBo5quM7gS6YpK2OV4JELRIlUubY
 6+UImSMkl/USmsblq14jdmYbUgAuiZFE42ybE1geSVlSonDnIX1lw2W4mLozXQEvGWGa
 IG72PkYyjDZ2aQigKq5fErKBp/JUdzvl1BKW9TvduTQafEepd/MwNadTvLQNSrJk4sC6
 Y8w6ODRo8FmbTvkpawX5YpvLfpU4FfTZpt2O18+4s1gM/5DchRR9GZ4RJzSU4TmhajGb
 oin40smo+tdUyZX0RyefStw8VCxp6/8+2f4tQtRPI68r78GBjxIxXvxyKIHbvmlXefZV Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 316sa1stek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 May 2020 12:19:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BF08A10002A;
 Mon, 25 May 2020 12:19:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B4EDF20B847;
 Mon, 25 May 2020 12:19:55 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 25 May 2020 12:19:55 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 25 May 2020 12:19:42 +0200
Message-ID: <20200525101949.15944-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200525101949.15944-1-patrick.delaunay@st.com>
References: <20200525101949.15944-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-25_04:2020-05-25,
 2020-05-25 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 2/9] ARM: dts: stm32: add cpufreq support
	on stm32mp15x
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
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---

Changes in v2: None

 arch/arm/dts/stm32mp151.dtsi      | 21 +++++++++++++++++++++
 arch/arm/dts/stm32mp157c-ed1.dts  |  8 ++++++++
 arch/arm/dts/stm32mp15xx-dkx.dtsi |  8 ++++++++
 3 files changed, 37 insertions(+)

diff --git a/arch/arm/dts/stm32mp151.dtsi b/arch/arm/dts/stm32mp151.dtsi
index 75d2c0d296..d5216a1831 100644
--- a/arch/arm/dts/stm32mp151.dtsi
+++ b/arch/arm/dts/stm32mp151.dtsi
@@ -20,6 +20,24 @@
 			clock-frequency = <650000000>;
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
 
@@ -1522,6 +1540,9 @@
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
index 4fb71100f5..9996704b59 100644
--- a/arch/arm/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/dts/stm32mp157c-ed1.dts
@@ -112,6 +112,14 @@
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
index 812e370ee4..906bd4282c 100644
--- a/arch/arm/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dkx.dtsi
@@ -121,6 +121,14 @@
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
