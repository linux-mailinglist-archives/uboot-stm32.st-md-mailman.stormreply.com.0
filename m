Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BD62A900E
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 08:12:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3241AC3FAD5;
	Fri,  6 Nov 2020 07:12:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2903C36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 07:12:46 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A67C8f5016667; Fri, 6 Nov 2020 08:12:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=E1fC1C3qCcT4iJr01uG0AhHFpCsxArcexH4tb5Q/52I=;
 b=frCYKu7Xq7DS9EW2sXROO6tofDIaKYNso8heYyxp5mTUkht+/fHuGCv0hyD2EEugDyHm
 +gDGEOv4DrM7BSkLa6CrdU8DAq3TPgYp4Sw36qmR3quZjoL3zHCs5urlduiXd5tU9N1B
 ClSlhwYz1fkRvfBCx1FU4ZHusBpR+JSEWLCK+YF5wxtxcHg06kpIJByg6+oRPkbUp1Tv
 4Cp3RDHutjetN1WHdiMfOYZrt9yLt1EZt5YEXp8HlDHIwm+XGIqD/VGIf9sRsKtuJPNL
 4TGHtCh+rMmX4Bf2qm9jt11lEU8q2rdbPKAIy1KH7ejaASbTCqFPwm9LdYFmWhyJEcFm IQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gyw1u61v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 08:12:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4AF42100038;
 Fri,  6 Nov 2020 08:12:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 34F5522461D;
 Fri,  6 Nov 2020 08:12:39 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 08:12:14
 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Nov 2020 08:11:59 +0100
Message-ID: <20201106071200.6933-4-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106071200.6933-1-patrice.chotard@st.com>
References: <20201106071200.6933-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_02:2020-11-05,
 2020-11-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v1 3/4] ARM: dts: stm32: Fix timer
	initialization for stm32 MCU's board
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

Commit 4b2be78ab66c ("time: Fix get_ticks being non-monotonic")
puts in evidence that get_ticks is called before timer initialization.
Fix it by initializing timer before relocation.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 arch/arm/dts/stm32429i-eval-u-boot.dtsi  |  4 ++++
 arch/arm/dts/stm32f429-disco-u-boot.dtsi |  4 ++++
 arch/arm/dts/stm32f469-disco-u-boot.dtsi | 20 ++++++++++++--------
 arch/arm/dts/stm32f746-disco-u-boot.dtsi |  4 ----
 arch/arm/dts/stm32h7-u-boot.dtsi         |  4 ++++
 5 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/arch/arm/dts/stm32429i-eval-u-boot.dtsi b/arch/arm/dts/stm32429i-eval-u-boot.dtsi
index 1e7429b2c6..e75cf99f8f 100644
--- a/arch/arm/dts/stm32429i-eval-u-boot.dtsi
+++ b/arch/arm/dts/stm32429i-eval-u-boot.dtsi
@@ -217,3 +217,7 @@
 		};
 	};
 };
+
+&timer5 {
+	u-boot,dm-pre-reloc;
+};
diff --git a/arch/arm/dts/stm32f429-disco-u-boot.dtsi b/arch/arm/dts/stm32f429-disco-u-boot.dtsi
index 77d5ea07bb..df99e01393 100644
--- a/arch/arm/dts/stm32f429-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f429-disco-u-boot.dtsi
@@ -192,3 +192,7 @@
 &rcc {
 	u-boot,dm-pre-reloc;
 };
+
+&timer5 {
+	u-boot,dm-pre-reloc;
+};
diff --git a/arch/arm/dts/stm32f469-disco-u-boot.dtsi b/arch/arm/dts/stm32f469-disco-u-boot.dtsi
index 3cf3a6aa6f..7223ba4a60 100644
--- a/arch/arm/dts/stm32f469-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f469-disco-u-boot.dtsi
@@ -235,14 +235,6 @@
 	u-boot,dm-pre-reloc;
 };
 
-&rcc {
-	u-boot,dm-pre-reloc;
-};
-
-&syscfg {
-	u-boot,dm-pre-reloc;
-};
-
 &qspi {
 	reg = <0xA0001000 0x1000>, <0x90000000 0x1000000>;
 	flash0: n25q128a@0 {
@@ -255,3 +247,15 @@
 		reg = <0>;
 	};
 };
+
+&rcc {
+	u-boot,dm-pre-reloc;
+};
+
+&syscfg {
+	u-boot,dm-pre-reloc;
+};
+
+&timer5 {
+	u-boot,dm-pre-reloc;
+};
diff --git a/arch/arm/dts/stm32f746-disco-u-boot.dtsi b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
index 860dd77668..4f34fc9a8c 100644
--- a/arch/arm/dts/stm32f746-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
@@ -239,7 +239,3 @@
 		reg = <0>;
 	};
 };
-
-&timer5 {
-	u-boot,dm-pre-reloc;
-};
diff --git a/arch/arm/dts/stm32h7-u-boot.dtsi b/arch/arm/dts/stm32h7-u-boot.dtsi
index 361c8e5d80..7182533cc9 100644
--- a/arch/arm/dts/stm32h7-u-boot.dtsi
+++ b/arch/arm/dts/stm32h7-u-boot.dtsi
@@ -218,3 +218,7 @@
 &sdmmc1 {
 	compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
 };
+
+&timer5 {
+	u-boot,dm-pre-reloc;
+};
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
