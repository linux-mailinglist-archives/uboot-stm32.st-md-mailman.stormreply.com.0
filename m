Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0136C74D07A
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Jul 2023 10:44:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF80FC6B44C;
	Mon, 10 Jul 2023 08:44:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38D26C6B44C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 08:44:18 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36A58nR3014276; Mon, 10 Jul 2023 10:44:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=65gXNZG60bhrB/PHRUm1TEX1TfktEa0TgSUYn4R1yo4=;
 b=J10opmz9PV0oCuwgy9MGDIjlB5lmTMD9Ii2uTxL99dK8b/n+2k1AtaL3HBnAgt+h9LxJ
 lLiF+L3d7KpHqMrPF+Pp4XMjBenDdW9Bw57YjK4aW8MFXtKSGSR4ZpvGiSOLQbj1VmcO
 NSXIaBJilp5ez5/8QewXkYjJ6YVdfHpLKyfBkbvxHTw2Ix06510RPkNUrtoeOQ6NwZUJ
 LRjlcToDbJWwLabgF1CH8vMfrTZUC4VxCGV9JHUb5eBnpY+SPZmCEcKRkxq7BzeFG2/f
 gAODv/I/sU2AdVBo9Hfx9L6cXWZELJfpfjZ0uAjNfKdW2OAUe67spLbPZ9a1Y9BKcE7A zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rpw7hev90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jul 2023 10:44:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CF0D610005D;
 Mon, 10 Jul 2023 10:44:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C8DFF21ED5A;
 Mon, 10 Jul 2023 10:44:13 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 10 Jul
 2023 10:44:13 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 10 Jul 2023 10:44:10 +0200
Message-ID: <20230710104406.2.Ia58005c96c892d76d149dbad1aa51eb06f60f673@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230710104406.1.Icd397b21b510ba9fc2de7cd4b69835afb131dda7@changeid>
References: <20230710104406.1.Icd397b21b510ba9fc2de7cd4b69835afb131dda7@changeid>
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
Subject: [Uboot-stm32] [PATCH 2/2] ARM: dts: sm32mp13: remove shmem for
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

CFG_STM32MP1_SCMI_SHM_SYSRAM will be disabled by default for STM32MP13x
SoCs in next OP-TEE version and the OP-TEE SMCI server uses the OP-TEE
native shared memory registered by clients.

To be compatible by default with this configuration this patch removes
the shared memory in the SCMI configuration and the associated reserved
memory in SRAM.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/dts/stm32mp13-u-boot.dtsi |  8 --------
 arch/arm/dts/stm32mp131.dtsi       | 14 --------------
 2 files changed, 22 deletions(-)

diff --git a/arch/arm/dts/stm32mp13-u-boot.dtsi b/arch/arm/dts/stm32mp13-u-boot.dtsi
index 726cd1a7e479..aa5cfc6e41d5 100644
--- a/arch/arm/dts/stm32mp13-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp13-u-boot.dtsi
@@ -108,14 +108,6 @@
 	bootph-all;
 };
 
-&scmi_shm {
-	bootph-all;
-};
-
-&scmi_sram {
-	bootph-all;
-};
-
 &syscfg {
 	bootph-all;
 };
diff --git a/arch/arm/dts/stm32mp131.dtsi b/arch/arm/dts/stm32mp131.dtsi
index d94ba2547267..f1810c9eb704 100644
--- a/arch/arm/dts/stm32mp131.dtsi
+++ b/arch/arm/dts/stm32mp131.dtsi
@@ -40,7 +40,6 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			linaro,optee-channel-id = <0>;
-			shmem = <&scmi_shm>;
 
 			scmi_clk: protocol@14 {
 				reg = <0x14>;
@@ -106,19 +105,6 @@
 		interrupt-parent = <&intc>;
 		ranges;
 
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
-
 		timers2: timer@40000000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
