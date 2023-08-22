Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C02D783C49
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Aug 2023 10:57:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25B1CC6A613;
	Tue, 22 Aug 2023 08:57:00 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04D85C6A5EF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Aug 2023 08:56:58 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37M7v9LE002583; Tue, 22 Aug 2023 10:56:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=8IcwPz/
 CLdqRkLdRNUkAkU4cpP/77kloTrdGq4FEvVI=; b=AwrZmKHofrEQdRUYvZjajRM
 6fTmWB0p6OJHuK05v5vpA8v+8wcM9tum05gR4jUgL2lsotiux6x2iy5eeA/eO7lG
 /0YgLRO9J3d8IuCSh3g04GMxAkYDMsdlUOEvWqDImYK8xjLyYWfLdaUN/qedTPX5
 01y7CAHqANf2oX0aLCxxUq2BAIownZR6ykKatfisLpEeiNTqlX3V2dXP33SrvNgl
 To54zsmj4M2+pCfEZKYekwdlkVoMQ13vPocqh7H+RYxoTdCvSeunx59ma//k97u/
 CCMR8vZz8zJ1bKnfWywqHEB74qjrIX8Z97jvmSsQhyeCUGEm2NmEIpZ8T9JpTsw=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3smbmktjsd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Aug 2023 10:56:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A710E100057;
 Tue, 22 Aug 2023 10:56:55 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 972CE231536;
 Tue, 22 Aug 2023 10:56:55 +0200 (CEST)
Received: from localhost (10.201.20.38) by EQNDAG1NODE4.st.com (10.75.129.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 22 Aug
 2023 10:56:55 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 22 Aug 2023 10:56:52 +0200
Message-ID: <20230822085653.237076-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_08,2023-08-18_01,2023-05-22_02
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>, Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32: disable SYSRAM SCMI shared
	memory in stm32mp15-scmi
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

Changes scmi node to not use a statically defined sram shared memory
buffer. This change makes SCMI OP-TEE transport to use shared memory
allocated used OP-TEE generic shared memory resources.

Removes the sram definition in the DTSI files since no more used.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp15-scmi.dtsi | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/arm/dts/stm32mp15-scmi.dtsi b/arch/arm/dts/stm32mp15-scmi.dtsi
index 543f24c2f4f..ad2584213d9 100644
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
