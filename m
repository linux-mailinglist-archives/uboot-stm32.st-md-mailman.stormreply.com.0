Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FFC82DAE7
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jan 2024 15:06:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FFE7C6B476;
	Mon, 15 Jan 2024 14:06:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16C01C6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 14:06:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40FDrZmH008279; Mon, 15 Jan 2024 15:06:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=qeBHFpBAaW89DD5Mr5k/vHQlMWikiFq7qzgl0CGOAMA=; b=8H
 ffdZSFwkHKQaRXec0L8yRJbjg6+QQei1pNfPcrXcYQz3t2O9OcK4HnPgrzkrOY2u
 O1Hny5PQBt2UmR4q6pjzgw0eRZaHYCdxkvs2r88T/crjWADxt7FsBYcHSmaPM91w
 9K6FXN5Ad+TElT2hgfHOuLpzxiSoH09X9hKkE/PWEMHrz4dcZ3ctDdfF365j+TrA
 lA8KXAM4JE7WGC/eihm3Ec7j+I+ElFFO1qkHNU9u/P3nxAHpWU2+Nz2M24dAzfGN
 l3LJxwgxNmFiogBzE09+qjn0EbLpU3w21LIBHdWsTRoN3JuhfZFAPtnD8nUv0d37
 R85oZKEJafHvG3j+5AGA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vkmddru0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jan 2024 15:06:05 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 573B1100057;
 Mon, 15 Jan 2024 15:06:05 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5064529865C;
 Mon, 15 Jan 2024 15:06:05 +0100 (CET)
Received: from localhost (10.201.22.165) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 15 Jan
 2024 15:06:05 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Jan 2024 15:05:44 +0100
Message-ID: <20240115150451.v2.1.Iefa175618c8da1cb27702d86b19bdada62a0f01d@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240115140557.57448-1-patrick.delaunay@foss.st.com>
References: <20240115140557.57448-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Simon Glass <sjg@chromium.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 01/14] arm64: dts: st: add bsec support to
	stm32mp25
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

Add BSEC support to STM32MP25 SoC family with SoC information:
- RPN = Device part number (BSEC_OTP_DATA9)
- PKG = package data register (Bits 2:0 of BSEC_OTP_DATA122)

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
---

(no changes since v1)

 arch/arm/dts/stm32mp25-u-boot.dtsi |  4 ++++
 arch/arm/dts/stm32mp251.dtsi       | 16 ++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm/dts/stm32mp25-u-boot.dtsi b/arch/arm/dts/stm32mp25-u-boot.dtsi
index f4f26add2a41..0c8e95b34163 100644
--- a/arch/arm/dts/stm32mp25-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp25-u-boot.dtsi
@@ -37,6 +37,10 @@
 	};
 };
 
+&bsec {
+	bootph-all;
+};
+
 &gpioa {
 	bootph-all;
 };
diff --git a/arch/arm/dts/stm32mp251.dtsi b/arch/arm/dts/stm32mp251.dtsi
index cf2f28dc1582..44eb664fb510 100644
--- a/arch/arm/dts/stm32mp251.dtsi
+++ b/arch/arm/dts/stm32mp251.dtsi
@@ -127,6 +127,22 @@
 			};
 		};
 
+		bsec: efuse@44000000 {
+			compatible = "st,stm32mp25-bsec";
+			reg = <0x44000000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			part_number_otp@24 {
+				reg = <0x24 0x4>;
+			};
+
+			package_otp@1e8 {
+				reg = <0x1e8 0x1>;
+				bits = <0 3>;
+			};
+		};
+
 		syscfg: syscon@44230000 {
 			compatible = "st,stm32mp25-syscfg", "syscon";
 			reg = <0x44230000 0x10000>;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
