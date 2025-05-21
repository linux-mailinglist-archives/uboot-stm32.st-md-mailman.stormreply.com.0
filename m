Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6B7ABF668
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 May 2025 15:43:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4FD6C78F6B;
	Wed, 21 May 2025 13:43:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB6D0C7128A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 May 2025 13:43:11 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LCf5G7004858;
 Wed, 21 May 2025 15:43:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 VcmMGEW79/eQf4TngFF56ib9i0ImK627lCo711zfGbc=; b=AwHdmt0/bIROIWnC
 LtOrjgv74YsGuhwXJp149QbazBeza8YjCkd6Fo/q5u3jwUHfCfA4O2rKfFqlUwBl
 LTGUh+hnotQC5YzJYajd0ApD5SudMgce/5xkrs3uRSUL/tampJhTIQTUBeTmFeZ4
 qOKG3EbXouySYjxw7cLyQbrBDQczfQLn830YrWkeAWIGqemKtS+HzQBD3hrnzITe
 ieR9v6LrnwMIzwDHnDAQfno8xk1grDmvudlgW+zLgVj+2nvHvX3atAwPvJZPyAqE
 1vFoKNEYtAq4TDlz7OXU9hm+sh04rHUoAI24TJ/HwTwB2Ri1H8M426ROKYTnS+Fh
 7ot/ZA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwff4dqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 May 2025 15:43:08 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 941444006A;
 Wed, 21 May 2025 15:42:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B8195B2CB78;
 Wed, 21 May 2025 15:41:40 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 15:41:40 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 21 May 2025 15:41:16 +0200
Message-ID: <20250521134117.2828335-13-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250521134117.2828335-1-patrice.chotard@foss.st.com>
References: <20250521134117.2828335-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v1 12/13] ARM: dts: stm32: switch from fixed
	to scmi clocks for stm32mp257f-ev1
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

SCMI clocks are now available, switch from fixed to SCMI clocks.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp25-u-boot.dtsi       |  8 +++
 arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi | 74 ------------------------
 2 files changed, 8 insertions(+), 74 deletions(-)

diff --git a/arch/arm/dts/stm32mp25-u-boot.dtsi b/arch/arm/dts/stm32mp25-u-boot.dtsi
index 0c8e95b3416..d9aeeb6d510 100644
--- a/arch/arm/dts/stm32mp25-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp25-u-boot.dtsi
@@ -25,6 +25,10 @@
 		optee {
 			bootph-all;
 		};
+
+		scmi {
+			bootph-all;
+		};
 	};
 
 	/* need PSCI for sysreset during board_f */
@@ -93,6 +97,10 @@
 	bootph-all;
 };
 
+&rcc {
+	bootph-all;
+};
+
 &rifsc {
 	bootph-all;
 };
diff --git a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
index d778b8d8d05..9a566e18d3f 100644
--- a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
@@ -10,84 +10,10 @@
 		u-boot,boot-led = "led-blue";
 		u-boot,mmc-env-partition = "u-boot-env";
 	};
-
-	clocks {
-		ck_flexgen_08: ck-flexgen-08 {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <64000000>;
-		};
-
-		ck_flexgen_51: ck-flexgen-51 {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <200000000>;
-		};
-
-		ck_icn_ls_mcu: ck-icn-ls-mcu {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <200000000>;
-		};
-	};
-};
-
-&gpioa {
-	clocks = <&ck_icn_ls_mcu>;
-};
-
-&gpiob {
-	clocks = <&ck_icn_ls_mcu>;
-};
-
-&gpioc {
-	clocks = <&ck_icn_ls_mcu>;
-};
-
-&gpiod {
-	clocks = <&ck_icn_ls_mcu>;
-};
-
-&gpioe {
-	clocks = <&ck_icn_ls_mcu>;
-};
-
-&gpiof {
-	clocks = <&ck_icn_ls_mcu>;
-};
-
-&gpiog {
-	clocks = <&ck_icn_ls_mcu>;
-};
-
-&gpioh {
-	clocks = <&ck_icn_ls_mcu>;
-};
-
-&gpioi {
-	clocks = <&ck_icn_ls_mcu>;
-};
-
-&gpioj {
-	clocks = <&ck_icn_ls_mcu>;
-};
-
-&gpiok {
-	clocks = <&ck_icn_ls_mcu>;
-};
-
-&gpioz {
-	clocks = <&ck_icn_ls_mcu>;
-};
-
-&sdmmc1 {
-	clocks = <&ck_flexgen_51>;
-	/delete-property/resets;
 };
 
 &usart2 {
 	bootph-all;
-	clocks = <&ck_flexgen_08>;
 };
 
 &usart2_pins_a {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
