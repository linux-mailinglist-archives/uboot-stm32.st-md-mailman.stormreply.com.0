Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 450A345070C
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Nov 2021 15:32:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00D6AC5EC57;
	Mon, 15 Nov 2021 14:32:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DBFBC5E2CC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Nov 2021 14:32:40 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AFC4H4S010463;
 Mon, 15 Nov 2021 15:32:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=m3pIpiQjoYnp3XhBmDQ0iG0wuVZzPf5l7n2xfSGU3cY=;
 b=Oe2pQ2APcp/5/jKUn8DLC+Gdi/9qfIhGmL1Tt5npc6/NdKGFJDkhZt1YWrPeKUhOGhJZ
 zFla5NgALRQneGH7uLHJyy73utoxHAdTBsxzBqEwtX9GDWT5+1QDL24SKv43tlL5p+Nl
 SN6oyBZDCV1X/qpP5WsnuoW8IvS+bN5EX28cJZTeGAysV4SSDaOGHvR1svfUKlbVmIGE
 PBCX+5MG6R+U53B0CQjEW94EQ8N+jqJ0MxVDsDNy3xu2k/3s7ilIOFb54E9ZzXECF4ty
 92khrBVotBDzyyRiq0BIR55ZXaHLhxB6xP+Hco3Y4lO1I7mQNzw0yvoYpZcSpeKFMQts Nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cbk8j2fa3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Nov 2021 15:32:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 390F310002A;
 Mon, 15 Nov 2021 15:32:37 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 078AE21C782;
 Mon, 15 Nov 2021 15:32:37 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 15 Nov 2021 15:32:36
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Nov 2021 15:32:29 +0100
Message-ID: <20211115153214.2.Ia98f9adf88d8183fa061a16ed9af4219f875bda5@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211115153214.1.I1a0a5850a0ac39ae33620ed14822892c394b1a98@changeid>
References: <20211115153214.1.I1a0a5850a0ac39ae33620ed14822892c394b1a98@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_10,2021-11-15_01,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Matteo Lisi <matteo.lisi@engicam.com>
Subject: [Uboot-stm32] [PATCH 2/3] stm32mp1: ram: remove the support of
	calibration result
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

The support of a predefined DDR PHY tuning result is removed for
STM32MP1 driver because it is not needed at the supported frequency
when built-in calibration is executed.

The calibration parameters were provided in the device tree by the
optional node "st,phy-cal", activated in ddr helper file by the
compilation flag DDR_PHY_CAL_SKIP and filled with values generated
by the CubeMX DDR utilities.

This patch
- updates the binding file to remove "st,phy-cal" support
- updates the device trees and remove the associated defines
- simplifies the STM32MP1 DDR driver and remove the support of
  the optional parameter "st,phy-cal"

After this patch, the built-in calibration is always executed
and the calibration registers are moved in the phy dynamic part;
that allows manual tests.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/dts/stm32mp15-ddr.dtsi               | 30 ---------
 .../dts/stm32mp15-ddr3-1x4Gb-1066-binG.dtsi   | 12 ----
 .../dts/stm32mp15-ddr3-2x4Gb-1066-binG.dtsi   | 12 ----
 .../stm32mp15-ddr3-dhsom-2x1Gb-1066-binG.dtsi | 12 ----
 .../stm32mp15-ddr3-dhsom-2x2Gb-1066-binG.dtsi | 12 ----
 .../stm32mp15-ddr3-dhsom-2x4Gb-1066-binG.dtsi | 12 ----
 .../stm32mp15-ddr3-icore-1x4Gb-1066-binG.dtsi | 12 ----
 .../memory-controllers/st,stm32mp1-ddr.txt    | 32 ---------
 drivers/ram/stm32mp1/stm32mp1_ddr.c           | 65 +++++++------------
 drivers/ram/stm32mp1/stm32mp1_ddr.h           | 17 -----
 drivers/ram/stm32mp1/stm32mp1_interactive.c   | 15 +----
 drivers/ram/stm32mp1/stm32mp1_ram.c           | 22 +------
 12 files changed, 27 insertions(+), 226 deletions(-)

diff --git a/arch/arm/dts/stm32mp15-ddr.dtsi b/arch/arm/dts/stm32mp15-ddr.dtsi
index 2a139c54e9..0aac9131a6 100644
--- a/arch/arm/dts/stm32mp15-ddr.dtsi
+++ b/arch/arm/dts/stm32mp15-ddr.dtsi
@@ -116,24 +116,6 @@
 			DDR_MR3
 		>;
 
-#ifdef DDR_PHY_CAL_SKIP
-		st,phy-cal = <
-			DDR_DX0DLLCR
-			DDR_DX0DQTR
-			DDR_DX0DQSTR
-			DDR_DX1DLLCR
-			DDR_DX1DQTR
-			DDR_DX1DQSTR
-			DDR_DX2DLLCR
-			DDR_DX2DQTR
-			DDR_DX2DQSTR
-			DDR_DX3DLLCR
-			DDR_DX3DQTR
-			DDR_DX3DQSTR
-		>;
-
-#endif
-
 		status = "okay";
 	};
 };
@@ -224,18 +206,6 @@
 #undef DDR_ODTCR
 #undef DDR_ZQ0CR1
 #undef DDR_DX0GCR
-#undef DDR_DX0DLLCR
-#undef DDR_DX0DQTR
-#undef DDR_DX0DQSTR
 #undef DDR_DX1GCR
-#undef DDR_DX1DLLCR
-#undef DDR_DX1DQTR
-#undef DDR_DX1DQSTR
 #undef DDR_DX2GCR
-#undef DDR_DX2DLLCR
-#undef DDR_DX2DQTR
-#undef DDR_DX2DQSTR
 #undef DDR_DX3GCR
-#undef DDR_DX3DLLCR
-#undef DDR_DX3DQTR
-#undef DDR_DX3DQSTR
diff --git a/arch/arm/dts/stm32mp15-ddr3-1x4Gb-1066-binG.dtsi b/arch/arm/dts/stm32mp15-ddr3-1x4Gb-1066-binG.dtsi
index 978331b279..e60d0ae606 100644
--- a/arch/arm/dts/stm32mp15-ddr3-1x4Gb-1066-binG.dtsi
+++ b/arch/arm/dts/stm32mp15-ddr3-1x4Gb-1066-binG.dtsi
@@ -100,20 +100,8 @@
 #define DDR_ODTCR 0x00010000
 #define DDR_ZQ0CR1 0x00000038
 #define DDR_DX0GCR 0x0000CE81
-#define DDR_DX0DLLCR 0x40000000
-#define DDR_DX0DQTR 0xFFFFFFFF
-#define DDR_DX0DQSTR 0x3DB02000
 #define DDR_DX1GCR 0x0000CE81
-#define DDR_DX1DLLCR 0x40000000
-#define DDR_DX1DQTR 0xFFFFFFFF
-#define DDR_DX1DQSTR 0x3DB02000
 #define DDR_DX2GCR 0x0000CE80
-#define DDR_DX2DLLCR 0x40000000
-#define DDR_DX2DQTR 0xFFFFFFFF
-#define DDR_DX2DQSTR 0x3DB02000
 #define DDR_DX3GCR 0x0000CE80
-#define DDR_DX3DLLCR 0x40000000
-#define DDR_DX3DQTR 0xFFFFFFFF
-#define DDR_DX3DQSTR 0x3DB02000
 
 #include "stm32mp15-ddr.dtsi"
diff --git a/arch/arm/dts/stm32mp15-ddr3-2x4Gb-1066-binG.dtsi b/arch/arm/dts/stm32mp15-ddr3-2x4Gb-1066-binG.dtsi
index 426be21f42..1a6fa80edf 100644
--- a/arch/arm/dts/stm32mp15-ddr3-2x4Gb-1066-binG.dtsi
+++ b/arch/arm/dts/stm32mp15-ddr3-2x4Gb-1066-binG.dtsi
@@ -100,20 +100,8 @@
 #define DDR_ODTCR 0x00010000
 #define DDR_ZQ0CR1 0x00000038
 #define DDR_DX0GCR 0x0000CE81
-#define DDR_DX0DLLCR 0x40000000
-#define DDR_DX0DQTR 0xFFFFFFFF
-#define DDR_DX0DQSTR 0x3DB02000
 #define DDR_DX1GCR 0x0000CE81
-#define DDR_DX1DLLCR 0x40000000
-#define DDR_DX1DQTR 0xFFFFFFFF
-#define DDR_DX1DQSTR 0x3DB02000
 #define DDR_DX2GCR 0x0000CE81
-#define DDR_DX2DLLCR 0x40000000
-#define DDR_DX2DQTR 0xFFFFFFFF
-#define DDR_DX2DQSTR 0x3DB02000
 #define DDR_DX3GCR 0x0000CE81
-#define DDR_DX3DLLCR 0x40000000
-#define DDR_DX3DQTR 0xFFFFFFFF
-#define DDR_DX3DQSTR 0x3DB02000
 
 #include "stm32mp15-ddr.dtsi"
diff --git a/arch/arm/dts/stm32mp15-ddr3-dhsom-2x1Gb-1066-binG.dtsi b/arch/arm/dts/stm32mp15-ddr3-dhsom-2x1Gb-1066-binG.dtsi
index b3eb280f96..0a277cd675 100644
--- a/arch/arm/dts/stm32mp15-ddr3-dhsom-2x1Gb-1066-binG.dtsi
+++ b/arch/arm/dts/stm32mp15-ddr3-dhsom-2x1Gb-1066-binG.dtsi
@@ -101,20 +101,8 @@
 #define DDR_ODTCR 0x00010000
 #define DDR_ZQ0CR1 0x00000038
 #define DDR_DX0GCR 0x0000CE81
-#define DDR_DX0DLLCR 0x40000000
-#define DDR_DX0DQTR 0xFFFFFFFF
-#define DDR_DX0DQSTR 0x3DB02000
 #define DDR_DX1GCR 0x0000CE81
-#define DDR_DX1DLLCR 0x40000000
-#define DDR_DX1DQTR 0xFFFFFFFF
-#define DDR_DX1DQSTR 0x3DB02000
 #define DDR_DX2GCR 0x0000CE81
-#define DDR_DX2DLLCR 0x40000000
-#define DDR_DX2DQTR 0xFFFFFFFF
-#define DDR_DX2DQSTR 0x3DB02000
 #define DDR_DX3GCR 0x0000CE81
-#define DDR_DX3DLLCR 0x40000000
-#define DDR_DX3DQTR 0xFFFFFFFF
-#define DDR_DX3DQSTR 0x3DB02000
 
 #include "stm32mp15-ddr.dtsi"
diff --git a/arch/arm/dts/stm32mp15-ddr3-dhsom-2x2Gb-1066-binG.dtsi b/arch/arm/dts/stm32mp15-ddr3-dhsom-2x2Gb-1066-binG.dtsi
index ed3a5248f8..92774fffb9 100644
--- a/arch/arm/dts/stm32mp15-ddr3-dhsom-2x2Gb-1066-binG.dtsi
+++ b/arch/arm/dts/stm32mp15-ddr3-dhsom-2x2Gb-1066-binG.dtsi
@@ -101,20 +101,8 @@
 #define DDR_ODTCR 0x00010000
 #define DDR_ZQ0CR1 0x00000038
 #define DDR_DX0GCR 0x0000CE81
-#define DDR_DX0DLLCR 0x40000000
-#define DDR_DX0DQTR 0xFFFFFFFF
-#define DDR_DX0DQSTR 0x3DB02000
 #define DDR_DX1GCR 0x0000CE81
-#define DDR_DX1DLLCR 0x40000000
-#define DDR_DX1DQTR 0xFFFFFFFF
-#define DDR_DX1DQSTR 0x3DB02000
 #define DDR_DX2GCR 0x0000CE81
-#define DDR_DX2DLLCR 0x40000000
-#define DDR_DX2DQTR 0xFFFFFFFF
-#define DDR_DX2DQSTR 0x3DB02000
 #define DDR_DX3GCR 0x0000CE81
-#define DDR_DX3DLLCR 0x40000000
-#define DDR_DX3DQTR 0xFFFFFFFF
-#define DDR_DX3DQSTR 0x3DB02000
 
 #include "stm32mp15-ddr.dtsi"
diff --git a/arch/arm/dts/stm32mp15-ddr3-dhsom-2x4Gb-1066-binG.dtsi b/arch/arm/dts/stm32mp15-ddr3-dhsom-2x4Gb-1066-binG.dtsi
index d5813d64b0..e53ab18a69 100644
--- a/arch/arm/dts/stm32mp15-ddr3-dhsom-2x4Gb-1066-binG.dtsi
+++ b/arch/arm/dts/stm32mp15-ddr3-dhsom-2x4Gb-1066-binG.dtsi
@@ -101,20 +101,8 @@
 #define DDR_ODTCR 0x00010000
 #define DDR_ZQ0CR1 0x00000038
 #define DDR_DX0GCR 0x0000CE81
-#define DDR_DX0DLLCR 0x40000000
-#define DDR_DX0DQTR 0xFFFFFFFF
-#define DDR_DX0DQSTR 0x3DB02000
 #define DDR_DX1GCR 0x0000CE81
-#define DDR_DX1DLLCR 0x40000000
-#define DDR_DX1DQTR 0xFFFFFFFF
-#define DDR_DX1DQSTR 0x3DB02000
 #define DDR_DX2GCR 0x0000CE81
-#define DDR_DX2DLLCR 0x40000000
-#define DDR_DX2DQTR 0xFFFFFFFF
-#define DDR_DX2DQSTR 0x3DB02000
 #define DDR_DX3GCR 0x0000CE81
-#define DDR_DX3DLLCR 0x40000000
-#define DDR_DX3DQTR 0xFFFFFFFF
-#define DDR_DX3DQSTR 0x3DB02000
 
 #include "stm32mp15-ddr.dtsi"
diff --git a/arch/arm/dts/stm32mp15-ddr3-icore-1x4Gb-1066-binG.dtsi b/arch/arm/dts/stm32mp15-ddr3-icore-1x4Gb-1066-binG.dtsi
index 24c81269b0..ff582ac6af 100644
--- a/arch/arm/dts/stm32mp15-ddr3-icore-1x4Gb-1066-binG.dtsi
+++ b/arch/arm/dts/stm32mp15-ddr3-icore-1x4Gb-1066-binG.dtsi
@@ -100,20 +100,8 @@
 #define DDR_ODTCR 0x00010000
 #define DDR_ZQ0CR1 0x00000038
 #define DDR_DX0GCR 0x0000CE81
-#define DDR_DX0DLLCR 0x40000000
-#define DDR_DX0DQTR 0xFFFFFFFF
-#define DDR_DX0DQSTR 0x3DB02000
 #define DDR_DX1GCR 0x0000CE81
-#define DDR_DX1DLLCR 0x40000000
-#define DDR_DX1DQTR 0xFFFFFFFF
-#define DDR_DX1DQSTR 0x3DB02000
 #define DDR_DX2GCR 0x0000CE81
-#define DDR_DX2DLLCR 0x40000000
-#define DDR_DX2DQTR 0xFFFFFFFF
-#define DDR_DX2DQSTR 0x3DB02000
 #define DDR_DX3GCR 0x0000CE81
-#define DDR_DX3DLLCR 0x40000000
-#define DDR_DX3DQTR 0xFFFFFFFF
-#define DDR_DX3DQSTR 0x3DB02000
 
 #include "stm32mp15-ddr.dtsi"
diff --git a/doc/device-tree-bindings/memory-controllers/st,stm32mp1-ddr.txt b/doc/device-tree-bindings/memory-controllers/st,stm32mp1-ddr.txt
index ac6a7df432..926e3e83b3 100644
--- a/doc/device-tree-bindings/memory-controllers/st,stm32mp1-ddr.txt
+++ b/doc/device-tree-bindings/memory-controllers/st,stm32mp1-ddr.txt
@@ -128,23 +128,6 @@ phyc attributes:
 		MR2
 		MR3
 
-- st,phy-cal	: phy cal depending of calibration or tuning of DDR
-	This parameter is optional; when it is absent the built-in PHY
-	calibration is done.
-	for STM32MP15x: 12 values are requested in this order
-		DX0DLLCR
-		DX0DQTR
-		DX0DQSTR
-		DX1DLLCR
-		DX1DQTR
-		DX1DQSTR
-		DX2DLLCR
-		DX2DQTR
-		DX2DQSTR
-		DX3DLLCR
-		DX3DQTR
-		DX3DQSTR
-
 Example:
 
 / {
@@ -280,21 +263,6 @@ Example:
 				0x00000000 /*MR3*/
 			>;
 
-			st,phy-cal = <
-				0x40000000 /*DX0DLLCR*/
-				0xFFFFFFFF /*DX0DQTR*/
-				0x3DB02000 /*DX0DQSTR*/
-				0x40000000 /*DX1DLLCR*/
-				0xFFFFFFFF /*DX1DQTR*/
-				0x3DB02000 /*DX1DQSTR*/
-				0x40000000 /*DX2DLLCR*/
-				0xFFFFFFFF /*DX2DQTR*/
-				0x3DB02000 /*DX2DQSTR*/
-				0x40000000 /*DX3DLLCR*/
-				0xFFFFFFFF /*DX3DQTR*/
-				0x3DB02000 /*DX3DQSTR*/
-			>;
-
 			status = "okay";
 		};
 	};
diff --git a/drivers/ram/stm32mp1/stm32mp1_ddr.c b/drivers/ram/stm32mp1/stm32mp1_ddr.c
index 1f8422518b..9d086601a4 100644
--- a/drivers/ram/stm32mp1/stm32mp1_ddr.c
+++ b/drivers/ram/stm32mp1/stm32mp1_ddr.c
@@ -68,7 +68,6 @@ struct reg_desc {
 
 #define DDRPHY_REG_REG_SIZE	11	/* st,phy-reg */
 #define	DDRPHY_REG_TIMING_SIZE	10	/* st,phy-timing */
-#define	DDRPHY_REG_CAL_SIZE	12	/* st,phy-cal */
 
 #define DDRCTL_REG_REG(x)	DDRCTL_REG(x, stm32mp1_ddrctrl_reg)
 static const struct reg_desc ddr_reg[DDRCTL_REG_REG_SIZE] = {
@@ -178,22 +177,6 @@ static const struct reg_desc ddrphy_timing[DDRPHY_REG_TIMING_SIZE] = {
 	DDRPHY_REG_TIMING(mr3),
 };
 
-#define DDRPHY_REG_CAL(x)	DDRPHY_REG(x, stm32mp1_ddrphy_cal)
-static const struct reg_desc ddrphy_cal[DDRPHY_REG_CAL_SIZE] = {
-	DDRPHY_REG_CAL(dx0dllcr),
-	DDRPHY_REG_CAL(dx0dqtr),
-	DDRPHY_REG_CAL(dx0dqstr),
-	DDRPHY_REG_CAL(dx1dllcr),
-	DDRPHY_REG_CAL(dx1dqtr),
-	DDRPHY_REG_CAL(dx1dqstr),
-	DDRPHY_REG_CAL(dx2dllcr),
-	DDRPHY_REG_CAL(dx2dqtr),
-	DDRPHY_REG_CAL(dx2dqstr),
-	DDRPHY_REG_CAL(dx3dllcr),
-	DDRPHY_REG_CAL(dx3dqtr),
-	DDRPHY_REG_CAL(dx3dqstr),
-};
-
 /**************************************************************
  * DYNAMIC REGISTERS: only used for debug purpose (read/modify)
  **************************************************************/
@@ -218,12 +201,24 @@ static const struct reg_desc ddrphy_dyn[] = {
 	DDRPHY_REG_DYN(zq0sr1),
 	DDRPHY_REG_DYN(dx0gsr0),
 	DDRPHY_REG_DYN(dx0gsr1),
+	DDRPHY_REG_DYN(dx0dllcr),
+	DDRPHY_REG_DYN(dx0dqtr),
+	DDRPHY_REG_DYN(dx0dqstr),
 	DDRPHY_REG_DYN(dx1gsr0),
 	DDRPHY_REG_DYN(dx1gsr1),
+	DDRPHY_REG_DYN(dx1dllcr),
+	DDRPHY_REG_DYN(dx1dqtr),
+	DDRPHY_REG_DYN(dx1dqstr),
 	DDRPHY_REG_DYN(dx2gsr0),
 	DDRPHY_REG_DYN(dx2gsr1),
+	DDRPHY_REG_DYN(dx2dllcr),
+	DDRPHY_REG_DYN(dx2dqtr),
+	DDRPHY_REG_DYN(dx2dqstr),
 	DDRPHY_REG_DYN(dx3gsr0),
 	DDRPHY_REG_DYN(dx3gsr1),
+	DDRPHY_REG_DYN(dx3dllcr),
+	DDRPHY_REG_DYN(dx3dqtr),
+	DDRPHY_REG_DYN(dx3dqstr),
 };
 
 #define DDRPHY_REG_DYN_SIZE	ARRAY_SIZE(ddrphy_dyn)
@@ -240,7 +235,6 @@ enum reg_type {
 	REG_MAP,
 	REGPHY_REG,
 	REGPHY_TIMING,
-	REGPHY_CAL,
 #ifdef CONFIG_STM32MP1_DDR_INTERACTIVE
 /* dynamic registers => managed in driver or not changed,
  * can be dumped in interactive mode
@@ -264,8 +258,6 @@ struct ddr_reg_info {
 	enum base_type base;
 };
 
-#define DDRPHY_REG_CAL(x)	DDRPHY_REG(x, stm32mp1_ddrphy_cal)
-
 const struct ddr_reg_info ddr_registers[REG_TYPE_NB] = {
 [REG_REG] = {
 	"static", ddr_reg, DDRCTL_REG_REG_SIZE, DDR_BASE},
@@ -279,8 +271,6 @@ const struct ddr_reg_info ddr_registers[REG_TYPE_NB] = {
 	"static", ddrphy_reg, DDRPHY_REG_REG_SIZE, DDRPHY_BASE},
 [REGPHY_TIMING] = {
 	"timing", ddrphy_timing, DDRPHY_REG_TIMING_SIZE, DDRPHY_BASE},
-[REGPHY_CAL] = {
-	"cal", ddrphy_cal, DDRPHY_REG_CAL_SIZE, DDRPHY_BASE},
 #ifdef CONFIG_STM32MP1_DDR_INTERACTIVE
 [REG_DYN] = {
 	"dyn", ddr_dyn, DDR_REG_DYN_SIZE, DDR_BASE},
@@ -456,9 +446,6 @@ static u32 get_par_addr(const struct stm32mp1_ddr_config *config,
 	case REGPHY_TIMING:
 		par_addr = (u32)&config->p_timing;
 		break;
-	case REGPHY_CAL:
-		par_addr = (u32)&config->p_cal;
-		break;
 	case REG_DYN:
 	case REGPHY_DYN:
 	case REG_TYPE_NB:
@@ -774,8 +761,6 @@ start:
  */
 	set_reg(priv, REGPHY_REG, &config->p_reg);
 	set_reg(priv, REGPHY_TIMING, &config->p_timing);
-	if (config->p_cal_present)
-		set_reg(priv, REGPHY_CAL, &config->p_cal);
 
 	if (INTERACTIVE(STEP_PHY_INIT))
 		goto start;
@@ -810,36 +795,32 @@ start:
 
 	wait_operating_mode(priv, DDRCTRL_STAT_OPERATING_MODE_NORMAL);
 
-	if (config->p_cal_present) {
-		log_debug("DDR DQS training skipped.\n");
-	} else {
-		log_debug("DDR DQS training : ");
+	log_debug("DDR DQS training : ");
 /*  8. Disable Auto refresh and power down by setting
  *    - RFSHCTL3.dis_au_refresh = 1
  *    - PWRCTL.powerdown_en = 0
  *    - DFIMISC.dfiinit_complete_en = 0
  */
-		stm32mp1_refresh_disable(priv->ctl);
+	stm32mp1_refresh_disable(priv->ctl);
 
 /*  9. Program PUBL PGCR to enable refresh during training and rank to train
  *     not done => keep the programed value in PGCR
  */
 
 /* 10. configure PUBL PIR register to specify which training step to run */
-		/* RVTRN is excuted only on LPDDR2/LPDDR3 */
-		if (config->c_reg.mstr & DDRCTRL_MSTR_DDR3)
-			pir = DDRPHYC_PIR_QSTRN;
-		else
-			pir = DDRPHYC_PIR_QSTRN | DDRPHYC_PIR_RVTRN;
-		stm32mp1_ddrphy_init(priv->phy, pir);
+	/* RVTRN is excuted only on LPDDR2/LPDDR3 */
+	if (config->c_reg.mstr & DDRCTRL_MSTR_DDR3)
+		pir = DDRPHYC_PIR_QSTRN;
+	else
+		pir = DDRPHYC_PIR_QSTRN | DDRPHYC_PIR_RVTRN;
+	stm32mp1_ddrphy_init(priv->phy, pir);
 
 /* 11. monitor PUB PGSR.IDONE to poll cpmpletion of training sequence */
-		ddrphy_idone_wait(priv->phy);
+	ddrphy_idone_wait(priv->phy);
 
 /* 12. set back registers in step 8 to the orginal values if desidered */
-		stm32mp1_refresh_restore(priv->ctl, config->c_reg.rfshctl3,
-					 config->c_reg.pwrctl);
-	} /* if (config->p_cal_present) */
+	stm32mp1_refresh_restore(priv->ctl, config->c_reg.rfshctl3,
+				 config->c_reg.pwrctl);
 
 	/* enable uMCTL2 AXI port 0 and 1 */
 	setbits_le32(&priv->ctl->pctrl_0, DDRCTRL_PCTRL_N_PORT_EN);
diff --git a/drivers/ram/stm32mp1/stm32mp1_ddr.h b/drivers/ram/stm32mp1/stm32mp1_ddr.h
index 4998f04439..3bfcb85a8f 100644
--- a/drivers/ram/stm32mp1/stm32mp1_ddr.h
+++ b/drivers/ram/stm32mp1/stm32mp1_ddr.h
@@ -140,21 +140,6 @@ struct stm32mp1_ddrphy_timing {
 	u32 mr3;
 };
 
-struct stm32mp1_ddrphy_cal {
-	u32 dx0dllcr;
-	u32 dx0dqtr;
-	u32 dx0dqstr;
-	u32 dx1dllcr;
-	u32 dx1dqtr;
-	u32 dx1dqstr;
-	u32 dx2dllcr;
-	u32 dx2dqtr;
-	u32 dx2dqstr;
-	u32 dx3dllcr;
-	u32 dx3dqtr;
-	u32 dx3dqstr;
-};
-
 struct stm32mp1_ddr_info {
 	const char *name;
 	u32 speed; /* in kHZ */
@@ -169,8 +154,6 @@ struct stm32mp1_ddr_config {
 	struct stm32mp1_ddrctrl_perf c_perf;
 	struct stm32mp1_ddrphy_reg p_reg;
 	struct stm32mp1_ddrphy_timing p_timing;
-	struct stm32mp1_ddrphy_cal p_cal;
-	bool p_cal_present;
 };
 
 int stm32mp1_ddr_clk_enable(struct ddr_info *priv, u32 mem_speed);
diff --git a/drivers/ram/stm32mp1/stm32mp1_interactive.c b/drivers/ram/stm32mp1/stm32mp1_interactive.c
index 8c2310ac90..a667d49cff 100644
--- a/drivers/ram/stm32mp1/stm32mp1_interactive.c
+++ b/drivers/ram/stm32mp1/stm32mp1_interactive.c
@@ -111,7 +111,7 @@ static void stm32mp1_do_usage(void)
 		"help                       displays help\n"
 		"info                       displays DDR information\n"
 		"info  <param> <val>        changes DDR information\n"
-		"      with <param> = step, name, size, speed or cal\n"
+		"      with <param> = step, name, size or speed\n"
 		"freq                       displays the DDR PHY frequency in kHz\n"
 		"freq  <freq>               changes the DDR PHY frequency\n"
 		"param [type|reg]           prints input parameters\n"
@@ -132,7 +132,7 @@ static void stm32mp1_do_usage(void)
 		"\nwith for [type|reg]:\n"
 		"  all registers if absent\n"
 		"  <type> = ctl, phy\n"
-		"           or one category (static, timing, map, perf, cal, dyn)\n"
+		"           or one category (static, timing, map, perf, dyn)\n"
 		"  <reg> = name of the register\n"
 	};
 
@@ -165,7 +165,6 @@ static void stm32mp1_do_info(struct ddr_info *priv,
 		printf("name = %s\n", config->info.name);
 		printf("size = 0x%x\n", config->info.size);
 		printf("speed = %d kHz\n", config->info.speed);
-		printf("cal = %d\n", config->p_cal_present);
 		return;
 	}
 
@@ -214,16 +213,6 @@ static void stm32mp1_do_info(struct ddr_info *priv,
 		}
 		return;
 	}
-	if (!strcmp(argv[1], "cal")) {
-		if (strict_strtoul(argv[2], 10, &value) < 0 ||
-		    (value != 0 && value != 1)) {
-			printf("invalid value %s\n", argv[2]);
-		} else {
-			config->p_cal_present = value;
-			printf("cal = %d\n", config->p_cal_present);
-		}
-		return;
-	}
 	printf("argument %s invalid\n", argv[1]);
 }
 
diff --git a/drivers/ram/stm32mp1/stm32mp1_ram.c b/drivers/ram/stm32mp1/stm32mp1_ram.c
index 98fa1f4f11..3b65269b98 100644
--- a/drivers/ram/stm32mp1/stm32mp1_ram.c
+++ b/drivers/ram/stm32mp1/stm32mp1_ram.c
@@ -95,26 +95,22 @@ static __maybe_unused int stm32mp1_ddr_setup(struct udevice *dev)
 	{	.name = x,						\
 		.offset = offsetof(struct stm32mp1_ddr_config, y),	\
 		.size = sizeof(config.y) / sizeof(u32),			\
-		.present = z,						\
 	}
 
 #define CTL_PARAM(x) PARAM("st,ctl-"#x, c_##x, NULL)
 #define PHY_PARAM(x) PARAM("st,phy-"#x, p_##x, NULL)
-#define PHY_PARAM_OPT(x) PARAM("st,phy-"#x, p_##x, &config.p_##x##_present)
 
 	const struct {
 		const char *name; /* name in DT */
 		const u32 offset; /* offset in config struct */
 		const u32 size;   /* size of parameters */
-		bool * const present;  /* presence indication for opt */
 	} param[] = {
 		CTL_PARAM(reg),
 		CTL_PARAM(timing),
 		CTL_PARAM(map),
 		CTL_PARAM(perf),
 		PHY_PARAM(reg),
-		PHY_PARAM(timing),
-		PHY_PARAM_OPT(cal)
+		PHY_PARAM(timing)
 	};
 
 	config.info.speed = ofnode_read_u32_default(node, "st,mem-speed", 0);
@@ -133,25 +129,11 @@ static __maybe_unused int stm32mp1_ddr_setup(struct udevice *dev)
 					 param[idx].size);
 		dev_dbg(dev, "%s: %s[0x%x] = %d\n", __func__,
 			param[idx].name, param[idx].size, ret);
-		if (ret &&
-		    (ret != -FDT_ERR_NOTFOUND || !param[idx].present)) {
+		if (ret) {
 			dev_err(dev, "Cannot read %s, error=%d\n",
 				param[idx].name, ret);
 			return -EINVAL;
 		}
-		if (param[idx].present) {
-			/* save presence of optional parameters */
-			*param[idx].present = true;
-			if (ret == -FDT_ERR_NOTFOUND) {
-				*param[idx].present = false;
-#ifdef CONFIG_STM32MP1_DDR_INTERACTIVE
-				/* reset values if used later */
-				memset((void *)((u32)&config +
-						param[idx].offset),
-					0, param[idx].size * sizeof(u32));
-#endif
-			}
-		}
 	}
 
 	ret = clk_get_by_name(dev, "axidcg", &axidcg);
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
