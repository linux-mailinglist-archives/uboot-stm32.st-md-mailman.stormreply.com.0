Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AFF54D034
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Jun 2022 19:41:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCF34C5E2CC;
	Wed, 15 Jun 2022 17:41:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1421C5E2C6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jun 2022 17:41:51 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FGenEX025415;
 Wed, 15 Jun 2022 19:41:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=QzWfCZlnvK0xvrYNFxDgnPBvEJlOhFggO/4NFrZQd5I=;
 b=2vESoB44U8BCrXHXEWWhK4Mou9iqhCAOgRPTvvKmScpdVOcwHQh5Ep4aAY7bgv/BeLND
 QRKZrY7n39cH8cZYFqiSgBs+iePLGdPYdPQEjiFD3il6B+e2iveth0nujqLXAVdut69d
 gBOD4dLrqR1BgUHOJcSMcnMV8+vymWASgFtSjkv7MnPmd+NdOUc9yvX/e0ii/byUNlx2
 4RR5YTf+XnQjcrDgOGS8qTX52vq4rpwGUlur28uqeK1d7bmUFXxRaqp61RQMIlnffNiC
 450iApow282YxrA0RJ26NG0ySt6hB3C61Yy094lC1pEwypbhCEo1Hl6/zkAf8ih3sHOM hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gp2tyt0w0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jun 2022 19:41:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6256810002A;
 Wed, 15 Jun 2022 19:41:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E65E21ED59;
 Wed, 15 Jun 2022 19:41:50 +0200 (CEST)
Received: from localhost (10.48.0.213) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 15 Jun
 2022 19:41:49 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 15 Jun 2022 19:41:48 +0200
Message-ID: <20220615194135.v2.1.I9cc1b8d493af70f2d448bea518372ab7c29afc50@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.213]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-15_14,2022-06-15_01,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2] configs: stm32mp: cleanup the stm32mp15
	file
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

Remove STM32_SYSRAM_END and clean the comments in stm32mp15_common.h file
after moving some CONFIG to Kconfig: CONFIG_SYS_CBSIZE,
CONFIG_SPL_MAX_FOOTPRINT, CONFIG_SYS_SPL_MALLOC_START and
CONFIG_SYS_SPL_MALLOC_SIZE.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- remove the define STM32_SYSRAM_END, no more used

 include/configs/stm32mp15_common.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/include/configs/stm32mp15_common.h b/include/configs/stm32mp15_common.h
index 08a72483bf..fc636beb3f 100644
--- a/include/configs/stm32mp15_common.h
+++ b/include/configs/stm32mp15_common.h
@@ -15,10 +15,6 @@
  */
 #define CONFIG_SYS_SDRAM_BASE			STM32_DDR_BASE
 
-/*
- * Console I/O buffer size
- */
-
 /*
  * For booting Linux, use the first 256 MB of memory, since this is
  * the maximum mapped by the Linux kernel during initialization.
@@ -28,13 +24,6 @@
 /* Extend size of kernel image for uncompression */
 #define CONFIG_SYS_BOOTM_LEN		SZ_32M
 
-/* SPL support */
-#ifdef CONFIG_SPL
-/* SPL use DDR */
-
-/* Restrict SPL to fit within SYSRAM */
-#define STM32_SYSRAM_END		(STM32_SYSRAM_BASE + STM32_SYSRAM_SIZE)
-#endif /* #ifdef CONFIG_SPL */
 /*MMC SD*/
 #define CONFIG_SYS_MMC_MAX_DEVICE	3
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
