Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFC874D079
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Jul 2023 10:44:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5503C6B44C;
	Mon, 10 Jul 2023 08:44:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BC84C6A61D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 08:44:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36A8R9P8024071; Mon, 10 Jul 2023 10:44:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=TIIiWalts8Yyw6mUQPrUD88+z2c0xsEpC+5LfjBEK8c=;
 b=wrhtwaP/uhjLewdfKEQJGv2ZavaaRjFvm1DldTt1Iij/hcXHURBXo1g9XQSP6KFQDl4A
 7hMPY2TpeGN7yoOazhRTbM8iXNBorr90TUuufSghnmtlaH/3bduFGm8/oJRdQrqW6VyO
 65vFflrNF6WpUBFOHERrJ0Z+CCh5bLdcpVht4LPcidcInPyPoRGJDvldMHA6xaNs1XRi
 848GCeY2dosKOCt1DcEqKOA6u+SJiXOpyIs4aLSLWWnafeLPMxtjS3hbHBDmPA4nu8gA
 Idu1drhqEeFk1v8+wBFmKLPCQQ+tirKMcbgmU56Ec28M9QbzcKbVyq4MewAKFS6OZX2H /Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rrcekhhsf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jul 2023 10:44:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 149C910005A;
 Mon, 10 Jul 2023 10:44:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0B45F21ED5A;
 Mon, 10 Jul 2023 10:44:13 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 10 Jul
 2023 10:44:12 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 10 Jul 2023 10:44:09 +0200
Message-ID: <20230710104406.1.Icd397b21b510ba9fc2de7cd4b69835afb131dda7@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-10_05,2023-07-06_02,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Etienne CARRIERE <etienne.carriere@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/2] ARM: dts: sm32mp15: remove shmem for
	scmi-optee
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

Since OP-TEE commit 89ba3422ee80 ("plat-stm32mp1: scmi_server: default
use OP-TEE shared memory"), integrated in OP-TEE 3.22.0-rc1
the default configuration for STM32MP15x SoCs changes,
CFG_STM32MP1_SCMI_SHM_SYSRAM is disabled by default and the OP-TEE SMCI
server uses ithe OP-TEE native shared memory registered by clients.

To be compatible by default with this configuration and the next OP-TEE
version, this patch removes the SHMEM in the SCMI configuration and the
associated reserved memory in the last 4KByte page of SRAM,
in the STM32MP15 device tree.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/dts/stm32mp15-scmi.dtsi | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/arm/dts/stm32mp15-scmi.dtsi b/arch/arm/dts/stm32mp15-scmi.dtsi
index 543f24c2f4f6..ad2584213d99 100644
--- a/arch/arm/dts/stm32mp15-scmi.dtsi
+++ b/arch/arm/dts/stm32mp15-scmi.dtsi
@@ -16,7 +16,6 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			linaro,optee-channel-id = <0>;
-			shmem = <&scmi_shm>;
 
 			scmi_clk: protocol@14 {
 				reg = <0x14>;
@@ -60,21 +59,6 @@
 			};
 		};
 	};
-
-	soc {
-		scmi_sram: sram@2ffff000 {
-			compatible = "mmio-sram";
-			reg = <0x2ffff000 0x1000>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0x2ffff000 0x1000>;
-
-			scmi_shm: scmi-sram@0 {
-				compatible = "arm,scmi-shmem";
-				reg = <0 0x80>;
-			};
-		};
-	};
 };
 
 &reg11 {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
