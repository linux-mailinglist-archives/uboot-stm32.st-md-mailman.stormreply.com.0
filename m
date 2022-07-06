Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEF9568EEF
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Jul 2022 18:20:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE020C03FDB;
	Wed,  6 Jul 2022 16:20:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB67DC03FC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Jul 2022 16:20:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 266DBgxA004614;
 Wed, 6 Jul 2022 18:20:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=RoQ/6xaq4RQ1iCShn84q3BgONTIToAtHjn4AxO2kb50=;
 b=1Y8ux+Zpub8mSfBYQJkQvfKCCty7ASAMOnukqshnZTirfHSprAVcVWbO/J6+4Mm/Tobw
 gbr9qSXH0k3/MH4GzekH5j9KBeGSauSbb9IVcwcrl3fyBPihD3ABmWaj8Pp8Cr+4CYye
 nq1efSplUqcCBkQHFHuWH3syZa71IDkJxNpWQOs9iZICXKI7RTvXT8uiL0sz8QVLrtvC
 iU6g/a3/h84VAazlMJJvlX4UC7fskKAwS6BeAf8f9cCnIDjYXpHqCFeYD8TpWgcTnuaE
 +LTDd+eq7Bu3ROfu4ug4poi0zypnJTqgUecF1JAVLZ3B9CYlj5VaaBSVqa6HZwWFS4ar 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h4ub3y7hv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Jul 2022 18:20:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 734AE10002A;
 Wed,  6 Jul 2022 18:20:45 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C1672291A0;
 Wed,  6 Jul 2022 18:20:45 +0200 (CEST)
Received: from localhost (10.75.127.48) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 6 Jul
 2022 18:20:33 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 6 Jul 2022 18:20:24 +0200
Message-ID: <20220706181934.1.I174d63cabaf30764ad59c73751d323a8b27fca60@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-06_09,2022-06-28_01,2022-06-22_01
Cc: Tom Rini <trini@konsulko.com>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel DEBIEVE <lionel.debieve@foss.st.com>,
 Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 Etienne CARRIERE <etienne.carriere@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/2] ARM: dts: stm32mp13: add OP-TEE nodes
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

Add the node for OP-TEE firmware with the associated reserved memory nodes

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/dts/stm32mp13-u-boot.dtsi |  4 ++++
 arch/arm/dts/stm32mp131.dtsi       |  7 +++++++
 arch/arm/dts/stm32mp135f-dk.dts    | 11 +++++++++++
 3 files changed, 22 insertions(+)

diff --git a/arch/arm/dts/stm32mp13-u-boot.dtsi b/arch/arm/dts/stm32mp13-u-boot.dtsi
index 1b5b3586905..adc7e67ee58 100644
--- a/arch/arm/dts/stm32mp13-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp13-u-boot.dtsi
@@ -82,6 +82,10 @@
 	u-boot,dm-pre-reloc;
 };
 
+&optee {
+	u-boot,dm-pre-reloc;
+};
+
 &pinctrl {
 	u-boot,dm-pre-reloc;
 };
diff --git a/arch/arm/dts/stm32mp131.dtsi b/arch/arm/dts/stm32mp131.dtsi
index 950e172e455..652743fd06e 100644
--- a/arch/arm/dts/stm32mp131.dtsi
+++ b/arch/arm/dts/stm32mp131.dtsi
@@ -27,6 +27,13 @@
 		interrupt-parent = <&intc>;
 	};
 
+	firmware {
+		optee: optee {
+			method = "smc";
+			compatible = "linaro,optee-tz";
+		};
+	};
+
 	clocks {
 		clk_axi: clk-axi {
 			#clock-cells = <0>;
diff --git a/arch/arm/dts/stm32mp135f-dk.dts b/arch/arm/dts/stm32mp135f-dk.dts
index ee100d108ea..31c510f976a 100644
--- a/arch/arm/dts/stm32mp135f-dk.dts
+++ b/arch/arm/dts/stm32mp135f-dk.dts
@@ -23,6 +23,17 @@
 		reg = <0xc0000000 0x20000000>;
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		optee@de000000 {
+			reg = <0xde000000 0x2000000>;
+			no-map;
+		};
+	};
+
 	vdd_sd: vdd-sd {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_sd";
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
