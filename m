Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5C55BAFA0
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Sep 2022 16:53:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EA75C640F1;
	Fri, 16 Sep 2022 14:53:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD52BC640F0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Sep 2022 14:53:01 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28G9xc7t023384;
 Fri, 16 Sep 2022 16:53:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=NdDtlDgllclexEwTH1LlN69FJqkfk0Q7hFDRDWWSZ+8=;
 b=4McKGdnQxx7YklSAv26Q7mfQ15pL6/6udNg1Q5jKgPk2C5jfm8/HCkVRDCnk3XsDDIO9
 YTINFKLU9mvwr6YOdXs+LSNVDOlgkfcFXkUYvQMm1ZjUR1EegCNgfuCC4ZzinouIMENf
 BnlPLxkNBy1PCdxk1fuWztLPR/50mglVX2eNa4oZNmdVU8ngvfq4JAQ/THJX/i2AvenP
 h1aBGB0GDEy+De6Lo57vuMXRbnaBs0FFgTu4QBPfS8XSy2R0Q6O7bOC1ZEppVS3hJs4e
 Yzr5/U/oS2YPYmCFCxU2gnTHOY6hDPuzFCmKGrPgDOSZ2tjcNtf76n/DeBuvjesEGomN hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jm8ybnpwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Sep 2022 16:53:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BBBB410002A;
 Fri, 16 Sep 2022 16:52:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A5C80235F0F;
 Fri, 16 Sep 2022 16:52:59 +0200 (CEST)
Received: from localhost (10.75.127.45) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 16 Sep
 2022 16:52:58 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 16 Sep 2022 16:52:57 +0200
Message-ID: <20220916165244.1.I22e7aeac596c03aca2236b69fd3cdf41a1f11339@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_09,2022-09-16_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] configs: stm32mp1: cleanup config file
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

Remove the unnecessary comment after the CONFIG_SYS_BOOTM_LEN
migration to Kconfig.

Fixes: c45568cc4e51 ("Convert CONFIG_SYS_BOOTM_LEN to Kconfig")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 include/configs/stm32mp13_common.h | 2 --
 include/configs/stm32mp15_common.h | 2 --
 2 files changed, 4 deletions(-)

diff --git a/include/configs/stm32mp13_common.h b/include/configs/stm32mp13_common.h
index 3ca65ea2a37..78089b965ae 100644
--- a/include/configs/stm32mp13_common.h
+++ b/include/configs/stm32mp13_common.h
@@ -21,8 +21,6 @@
  */
 #define CONFIG_SYS_BOOTMAPSZ		SZ_256M
 
-/* Extend size of kernel image for uncompression */
-
 /*MMC SD*/
 #define CONFIG_SYS_MMC_MAX_DEVICE	2
 
diff --git a/include/configs/stm32mp15_common.h b/include/configs/stm32mp15_common.h
index c5412ffeb31..bd8e16bc1b9 100644
--- a/include/configs/stm32mp15_common.h
+++ b/include/configs/stm32mp15_common.h
@@ -21,8 +21,6 @@
  */
 #define CONFIG_SYS_BOOTMAPSZ		SZ_256M
 
-/* Extend size of kernel image for uncompression */
-
 /*MMC SD*/
 #define CONFIG_SYS_MMC_MAX_DEVICE	3
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
