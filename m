Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F5F1E0B9A
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 May 2020 12:20:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D6CFC36B26
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 May 2020 10:20:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8553AC36B28
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 10:20:03 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04PAH54q011693; Mon, 25 May 2020 12:20:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=M7RbZZdz/O+eNOiL/wCU1rog3vl8gNwbb3KIxHwYPzw=;
 b=RtMr2+l7qxvQ+688UdArXsVmyts/fXAqZ8BORPyL4gDg8jwJe8gIsuEFd2UDTIOfrVgQ
 dxsfVdERNJqolFoZR6hkm6iEIHh5rtzIgn6JHCh4jTc2bSfUGde65+jekqUSlq6JlE0T
 s6YY8RrSGFhBPHc9R97W0nEX3jOGE5Vj80PVduB4oMntg6s3cdrLPL9VZrA8U4Qh8K3j
 WFQH4aEV7MQ2ob2ENxPAwGWzUQBLWkar1HDLMavHjq/UXlAeH2EftuBcsG+cKIhpoqvi
 XNo1FOBDQSdHi7TYq2i/t0ky6N7keNwKTaGa/+J/AMCYptelQL5hG49oY3wDNd9JzWGp Iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 316tqgse1g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 May 2020 12:20:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9C97410002A;
 Mon, 25 May 2020 12:20:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 90CA620B84D;
 Mon, 25 May 2020 12:20:00 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 25 May 2020 12:20:00 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 25 May 2020 12:19:48 +0200
Message-ID: <20200525101949.15944-9-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200525101949.15944-1-patrick.delaunay@st.com>
References: <20200525101949.15944-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-25_04:2020-05-25,
 2020-05-25 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 8/9] ARM: dts: stm32mp1: use OPP
	information for PLL1 settings in SPL
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
ST Microelectronics board (DK1/DK2 and EV1) or dh electronics SOM
using the STM32MP15x SOC and when it is supported by the HW
(for STM32MP15xD and STM32MP15xF).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- update stm32mp15xx-dhcor and dhcom device tree

 arch/arm/dts/stm32mp15-u-boot.dtsi         | 10 ++++++++++
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi   |  9 ---------
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi   |  9 ---------
 arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi |  9 ---------
 arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi |  9 ---------
 5 files changed, 10 insertions(+), 36 deletions(-)

diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
index a0d971ad88..66be7df9ae 100644
--- a/arch/arm/dts/stm32mp15-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
@@ -88,6 +88,16 @@
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
index c52abeb1e7..69cdae6685 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -118,15 +118,6 @@
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
index 84af7fa47b..3f716306be 100644
--- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
@@ -115,15 +115,6 @@
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
diff --git a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
index 75d75266e8..f96de9e7a3 100644
--- a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
@@ -235,15 +235,6 @@
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
diff --git a/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
index ef730a8322..4059dabf1d 100644
--- a/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
@@ -105,15 +105,6 @@
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
