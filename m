Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F3E1B2ABF
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 17:11:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AA22C36B13
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 15:11:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FC3AC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 15:11:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LF8COD014130; Tue, 21 Apr 2020 17:11:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=CfMX6WCzSc9LdaI6grk38hLQkaM5ySJliZ+zhhQ9jIc=;
 b=ph2V+UUAJjp2epEKvPbhMnW/3mfTH5wkPSH9Kjn53s8MxQtSOFCQ5j/dHkYjZFzKQB8u
 CDsIu3Clr6rkeK/yehjl5a916rEFwJAORMzOmKxIwiRYUI6SqLgtN68j3jqX3s+lVOUY
 RbyGrZH2m5asevwPhKnY3jtgcEs6XW2Rm16hwEFcZcLhusLZUPwWE2lqm+YwIEKXvNuE
 BUo2C/CaXvUDibS8bya7PzrIkc6ISlU9hkzrJddm7zoO2xtwUEqYnsb3kqEybIwwx0gr
 Fy7QVUAP0chP60gg2ByUXw8gqexNgLDlyljdChYsATuGpGupUb8+AQN2zDH9AGvHKRxy eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fpp8s680-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Apr 2020 17:11:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 61D3E10002A;
 Tue, 21 Apr 2020 17:11:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 57E902BE249;
 Tue, 21 Apr 2020 17:11:53 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 21 Apr 2020 17:11:52 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 21 Apr 2020 17:11:28 +0200
Message-ID: <20200421171123.9.I6fbccaae99254e6b1baf41a29257b5927df5f3f8@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421151128.18072-1-patrick.delaunay@st.com>
References: <20200421151128.18072-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_05:2020-04-20,
 2020-04-21 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 9/9] ARM: dts: stm32mp1: use OPP information
	for PLL1 settings in SPL
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

This patch allows to switch the CPU frequency to 800MHz on the
ST Microelectronics board (DK1/DK2 and EV1) when it supported by the HW
(for STM32MP15xD and STM32MP15xF).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp15-u-boot.dtsi       | 10 ++++++++++
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi |  9 ---------
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi |  9 ---------
 3 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
index e0b1223de8..497c1a01ec 100644
--- a/arch/arm/dts/stm32mp15-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
@@ -63,6 +63,16 @@
 	u-boot,dm-pre-reloc;
 };
 
+&cpu0_opp_table {
+	u-boot,dm-spl;
+	opp-650000000 {
+		u-boot,dm-spl;
+	};
+	opp-800000000 {
+		u-boot,dm-spl;
+	};
+};
+
 &gpioa {
 	u-boot,dm-pre-reloc;
 };
diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index 5844d41c53..97d5ea43c3 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -122,15 +122,6 @@
 		CLK_LPTIM45_LSE
 	>;
 
-	/* VCO = 1300.0 MHz => P = 650 (CPU) */
-	pll1: st,pll@0 {
-		compatible = "st,stm32mp1-pll";
-		reg = <0>;
-		cfg = < 2 80 0 0 0 PQR(1,0,0) >;
-		frac = < 0x800 >;
-		u-boot,dm-pre-reloc;
-	};
-
 	/* VCO = 1066.0 MHz => P = 266 (AXI), Q = 533 (GPU), R = 533 (DDR) */
 	pll2: st,pll@1 {
 		compatible = "st,stm32mp1-pll";
diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
index ed2f024be9..9f9aa4ac65 100644
--- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
@@ -119,15 +119,6 @@
 		CLK_LPTIM45_LSE
 	>;
 
-	/* VCO = 1300.0 MHz => P = 650 (CPU) */
-	pll1: st,pll@0 {
-		compatible = "st,stm32mp1-pll";
-		reg = <0>;
-		cfg = < 2 80 0 0 0 PQR(1,0,0) >;
-		frac = < 0x800 >;
-		u-boot,dm-pre-reloc;
-	};
-
 	/* VCO = 1066.0 MHz => P = 266 (AXI), Q = 533 (GPU), R = 533 (DDR) */
 	pll2: st,pll@1 {
 		compatible = "st,stm32mp1-pll";
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
