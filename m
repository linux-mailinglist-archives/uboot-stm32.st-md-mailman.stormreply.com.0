Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 597715BF7D1
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Sep 2022 09:37:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09A77C0D2BF;
	Wed, 21 Sep 2022 07:37:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E520DC03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Sep 2022 07:37:18 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28L3Ua93008297;
 Wed, 21 Sep 2022 09:37:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=ieneNCDZogmkKrAqneRwgmTmzEjF49f2j6uwTHvlcoE=;
 b=F1YWdcoxQkeczMuSjzHPmy8jYyHl0GsgCZpNIM7eddIrulleZcaaL8o6cTrSFarpyUVN
 G+T7l6MTg7i0NvxPuw4o1+qX3aMhKwS38jxhbvHrGbEBkNO/AcxRi4j9GRoFPkF9BbF0
 hrds8lp/L489iUSXnoEf9k4fK7l8Z6Q3KG+WyZG8tAiHpROKEu97/99UCMMtCRItG/j3
 ipR1vInQY9+7I7XPfda++LqzQrEul9DtYPgpVdHIFNZSFIi0H/S6OZI8LYEoIUdQ36y3
 YgxaT/SnmE6LUggpTiXwlcDRpKQ2unaRqRiC0SpEnBIsR05WCDtk8NHrADz1ciGygK7i jQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jn6g5ej78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Sep 2022 09:37:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0717E10002A;
 Wed, 21 Sep 2022 09:37:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E65D92171F0;
 Wed, 21 Sep 2022 09:37:16 +0200 (CEST)
Received: from localhost (10.75.127.121) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Wed, 21 Sep
 2022 09:37:16 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 21 Sep 2022 09:37:13 +0200
Message-ID: <20220921093711.1.I1dd8baddc1f804ccab03ffa99bb5b33c924ab07a@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.121]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_04,2022-09-20_02,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32mp15: update DDR node
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

Remove the unnecessary nodes for TFABOOT and keep the mandatory part
in SOC dtsi, only the DDRCTRL and DDRPHY addresses.
This patch allows to manage the DDR configuration setting in U-Boot
device tree only if it is needed, when CONFIG_SPL is defined.

With TFABOOT, the DDR configuration is done in TF-A BL2 and the DDR size
is dynamically computed in U-Boot since commit d72e7bbe7c28 ("ram:
stm32mp1: compute DDR size from DDRCTL registers").

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/dts/stm32mp15-ddr.dtsi               | 16 ++++++++++++++++
 arch/arm/dts/stm32mp15-u-boot.dtsi            | 14 --------------
 arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi |  1 -
 arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi |  1 -
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm/dts/stm32mp15-ddr.dtsi b/arch/arm/dts/stm32mp15-ddr.dtsi
index 0aac9131a60..d02f79dac66 100644
--- a/arch/arm/dts/stm32mp15-ddr.dtsi
+++ b/arch/arm/dts/stm32mp15-ddr.dtsi
@@ -4,7 +4,22 @@
  */
 #include <linux/stringify.h>
 
+#ifdef CONFIG_SPL
 &ddr {
+	clocks = <&rcc AXIDCG>,
+		 <&rcc DDRC1>,
+		 <&rcc DDRC2>,
+		 <&rcc DDRPHYC>,
+		 <&rcc DDRCAPB>,
+		 <&rcc DDRPHYCAPB>;
+
+	clock-names = "axidcg",
+		      "ddrc1",
+		      "ddrc2",
+		      "ddrphyc",
+		      "ddrcapb",
+		      "ddrphycapb";
+
 	config-DDR_MEM_COMPATIBLE {
 		u-boot,dm-pre-reloc;
 
@@ -119,6 +134,7 @@
 		status = "okay";
 	};
 };
+#endif
 
 #undef DDR_MEM_COMPATIBLE
 #undef DDR_MEM_NAME
diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
index d9d04743ac8..d5c87d29d88 100644
--- a/arch/arm/dts/stm32mp15-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
@@ -53,20 +53,6 @@
 			reg = <0x5a003000 0x550
 			       0x5a004000 0x234>;
 
-			clocks = <&rcc AXIDCG>,
-				 <&rcc DDRC1>,
-				 <&rcc DDRC2>,
-				 <&rcc DDRPHYC>,
-				 <&rcc DDRCAPB>,
-				 <&rcc DDRPHYCAPB>;
-
-			clock-names = "axidcg",
-				      "ddrc1",
-				      "ddrc2",
-				      "ddrphyc",
-				      "ddrcapb",
-				      "ddrphycapb";
-
 			status = "okay";
 		};
 	};
diff --git a/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
index 2db045e7cec..1209dfe009c 100644
--- a/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
@@ -5,7 +5,6 @@
 
 #include <dt-bindings/clock/stm32mp1-clksrc.h>
 #include "stm32mp15-scmi-u-boot.dtsi"
-#include "stm32mp15-ddr3-1x4Gb-1066-binG.dtsi"
 
 / {
 	aliases {
diff --git a/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
index 54662f7e290..c265745ff10 100644
--- a/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
@@ -5,7 +5,6 @@
 
 #include <dt-bindings/clock/stm32mp1-clksrc.h>
 #include "stm32mp15-scmi-u-boot.dtsi"
-#include "stm32mp15-ddr3-2x4Gb-1066-binG.dtsi"
 
 / {
 	aliases {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
