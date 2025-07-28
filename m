Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A995DB13B05
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Jul 2025 15:09:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54ED0C36B2E;
	Mon, 28 Jul 2025 13:09:29 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3A51C36B2C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jul 2025 13:09:27 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SD6Rtu015064;
 Mon, 28 Jul 2025 15:09:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=1bvzEDZALde7/atIq8Rd0/
 +2lOjz/IZ7zWLcEPwEl2o=; b=tjS33sHFyR4tHnZpvtuiD88GQTyv161DqCFus7
 TVoUMllRFoSW5NeKC8mQKmlKqrakdlrUKDhP2CfqXLTYm5TWIC3Aumt2gbArZSpO
 6zHGxoE2PAo4xOMYpn4gA7ZJQHblv935EC+XVqGswer3P3QwAsN6FBJ0102RTBef
 hUgipzwCzjRDXGubmu77F2wy/pxPo1bhvN0fH9/B0TZp81HlfGB98hdsGi06iJe9
 dTLrwHpeBDjknXWfZmo/Hb9w6iQjvsFLOUSDx5lnlmCwtgLL9q4MdTRpJ/7L2k/8
 iPGbR5Rc5p0NasAFxW/F+ZN7OtVbSThM9hg3ooyFQAETITAQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4859ynde7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jul 2025 15:09:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 073AD4004F;
 Mon, 28 Jul 2025 15:08:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EFE4577E1F4;
 Mon, 28 Jul 2025 15:08:33 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 15:08:33 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 28 Jul 2025 15:08:31 +0200
Message-ID: <20250728130832.25954-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH] treewide: Fix STMicroelectronics spelling
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

Fix STMicroelectronics spelling in comments.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/include/asm/arch-am33xx/mem.h | 2 +-
 arch/arm/include/asm/arch-omap5/mem.h  | 2 +-
 include/configs/stm32mp25_st_common.h  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/arch-am33xx/mem.h b/arch/arm/include/asm/arch-am33xx/mem.h
index 0fd52f82f59..316ec09318a 100644
--- a/arch/arm/include/asm/arch-am33xx/mem.h
+++ b/arch/arm/include/asm/arch-am33xx/mem.h
@@ -29,7 +29,7 @@
  *
  * Currently valid part Names are (PART):
  * M_NAND - Micron NAND
- * STNOR - STMicrolelctronics M29W128GL
+ * STNOR - STMicroelectronics M29W128GL
  */
 #define GPMC_SIZE_256M		0x0
 #define GPMC_SIZE_128M		0x8
diff --git a/arch/arm/include/asm/arch-omap5/mem.h b/arch/arm/include/asm/arch-omap5/mem.h
index bd72fb611d1..4f26daf1c43 100644
--- a/arch/arm/include/asm/arch-omap5/mem.h
+++ b/arch/arm/include/asm/arch-omap5/mem.h
@@ -29,7 +29,7 @@
  *
  * Currently valid part Names are (PART):
  * M_NAND - Micron NAND
- * STNOR - STMicrolelctronics M29W128GL
+ * STNOR - STMicroelectronics M29W128GL
  */
 #define GPMC_SIZE_256M		0x0
 #define GPMC_SIZE_128M		0x8
diff --git a/include/configs/stm32mp25_st_common.h b/include/configs/stm32mp25_st_common.h
index ab5a4a91644..cb679eb1be2 100644
--- a/include/configs/stm32mp25_st_common.h
+++ b/include/configs/stm32mp25_st_common.h
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
  *
- * Configuration settings for the STMicroelectonics STM32MP25x boards
+ * Configuration settings for the STMicroelectronics STM32MP25x boards
  */
 
 #ifndef __CONFIG_STM32MP25_ST_COMMON_H__
-- 
2.25.1

base-commit: 15368cb1164cdd9273dd3791f8af206da525c4a6
branch: Fix_STMicroelectronics_spelling
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
