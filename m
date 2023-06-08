Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAE0728398
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Jun 2023 17:19:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14FD2C6A5FA;
	Thu,  8 Jun 2023 15:19:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BD1EC6A5E7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jun 2023 15:19:16 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 358DkHZJ001967; Thu, 8 Jun 2023 17:19:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=+NqnCdrkQuWs7Xp4E4dwaqNZb/YLnOJ0tiN1OTxWUok=;
 b=16DrKdWTtjU/+M+jEVR01teuUdGKb2GfeIplIFRJgNckO2IvIxkagjOkymDz0jELAWE8
 g9PPx0EV5dkTABSWBEhnW+wf1VV5JJSHHtvOFFbxRGNgOamZ9G6x6hYIDZvC0qX/jZos
 z2aOTZg0fAAoqcJT8hqOoSngMXwOEaO0zCwj4uQTBfvh4pHyvJRavm9MD96gGQikn/h6
 KN07b3o5dZLPyh48QjrQrhlvz+Q0KsB0M941N+EKSw1ey2yA6xsFrfy9Xzu1VW5sF2kO
 3SOO/RKLQ4O73YwsaNDgk4VCqVb9l2oU52z5IUbfAehMK7k8v/Kq/0b+1/IsuPLcFRUV Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r3c4ajbvn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jun 2023 17:19:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7EBEB10002A;
 Thu,  8 Jun 2023 17:19:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7551B21BF4D;
 Thu,  8 Jun 2023 17:19:04 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 8 Jun
 2023 17:19:04 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 8 Jun 2023 17:16:48 +0200
Message-ID: <20230608171614.12.I7d7a0b6c2347082f9b3c03a5fe72a53cad4c23ef@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
References: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_11,2023-06-08_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 12/12] arm: dts: stm32: Add partitions in
	flash0 and nand node for stm32mp15xx-dhcom/dhcor
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

Add partitions subnode in flash0 for stm32mp157xx-dhcom/dhcor boards.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi | 27 ++++++++++++++++++++++
 arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi | 27 ++++++++++++++++++++++
 configs/stm32mp15_dhcom_basic_defconfig    |  3 ---
 configs/stm32mp15_dhcor_basic_defconfig    |  3 ---
 4 files changed, 54 insertions(+), 6 deletions(-)

diff --git a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
index bc0730cf2bd0..a808620e1219 100644
--- a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
@@ -92,6 +92,33 @@
 
 &flash0 {
 	bootph-pre-ram;
+
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "fsbl1";
+			reg = <0x00000000 0x00040000>;
+		};
+		partition@40000 {
+			label = "fsbl2";
+			reg = <0x00040000 0x00040000>;
+		};
+		partition@500000 {
+			label = "uboot";
+			reg = <0x00080000 0x00160000>;
+		};
+		partition@900000 {
+			label = "env1";
+			reg = <0x001E0000 0x00010000>;
+		};
+		partition@980000 {
+			label = "env2";
+			reg = <0x001F0000 0x00010000>;
+		};
+	};
 };
 
 &qspi {
diff --git a/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
index 804c66283e08..eb905ad28201 100644
--- a/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
@@ -28,6 +28,33 @@
 
 &flash0 {
 	bootph-pre-ram;
+
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "fsbl1";
+			reg = <0x00000000 0x00040000>;
+		};
+		partition@40000 {
+			label = "fsbl2";
+			reg = <0x00040000 0x00040000>;
+		};
+		partition@500000 {
+			label = "uboot";
+			reg = <0x00080000 0x00160000>;
+		};
+		partition@900000 {
+			label = "env1";
+			reg = <0x001E0000 0x00010000>;
+		};
+		partition@980000 {
+			label = "env2";
+			reg = <0x001F0000 0x00010000>;
+		};
+	};
 };
 
 &i2c4 {
diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
index 430d0bccc9a7..77f0fafc5c71 100644
--- a/configs/stm32mp15_dhcom_basic_defconfig
+++ b/configs/stm32mp15_dhcom_basic_defconfig
@@ -85,9 +85,6 @@ CONFIG_CMD_PMIC=y
 CONFIG_CMD_REGULATOR=y
 CONFIG_CMD_BTRFS=y
 CONFIG_CMD_EXT4_WRITE=y
-CONFIG_CMD_MTDPARTS=y
-CONFIG_MTDIDS_DEFAULT="nor0=nor0"
-CONFIG_MTDPARTS_DEFAULT="mtdparts=nor0:256k(fsbl1),256k(fsbl2),1408k(uboot),64k(env1),64k(env2)"
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_ISO_PARTITION is not set
 # CONFIG_SPL_PARTITION_UUIDS is not set
diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
index f23875fb84fe..4151ad64a4be 100644
--- a/configs/stm32mp15_dhcor_basic_defconfig
+++ b/configs/stm32mp15_dhcor_basic_defconfig
@@ -83,9 +83,6 @@ CONFIG_CMD_PMIC=y
 CONFIG_CMD_REGULATOR=y
 CONFIG_CMD_BTRFS=y
 CONFIG_CMD_EXT4_WRITE=y
-CONFIG_CMD_MTDPARTS=y
-CONFIG_MTDIDS_DEFAULT="nor0=nor0"
-CONFIG_MTDPARTS_DEFAULT="mtdparts=nor0:256k(fsbl1),256k(fsbl2),1408k(uboot),64k(env1),64k(env2)"
 # CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_ISO_PARTITION is not set
 # CONFIG_SPL_PARTITION_UUIDS is not set
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
