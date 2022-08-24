Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C4459FDDC
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Aug 2022 17:07:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE199C6410C;
	Wed, 24 Aug 2022 15:07:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 780D4C640FA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Aug 2022 15:07:06 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27OEDwkZ002155;
 Wed, 24 Aug 2022 17:07:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=cyXTzbZUNkABBP5XJlsP/WTPVJXO8PR8MiyAswdTTU0=;
 b=4qZ8AHAx/gAGxIF4ZoXwdbvC7pVBWaQO9f2sOaQyAnPgvp1hPfLcmXDCY2kAPeOI/Jb1
 wwWscgsrWqX7v7iJPdlkLTcA3Ublo0e8z7JqjjDXu+2pNwg5veC4xTiVHEA/RJRul3jm
 QmXlDyHNgwgFjok5iwLttxnoi+w91tq/RrA+4A+Gd5njK7+M0RnitzhD2bkaaxiWOout
 55PrTwKxM59K+H8+c4ezKAY6qh/4CJyeMUantHtawTusn4g8+gjQSwPxOfq5zoN8YONS
 HqaawOrakBSP/G7XTjK845nBn/LppxzpttPcqdTflIxZLYH5bce//MC/chjgB6H9653I oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j5h4wa5qn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Aug 2022 17:07:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C211910002A;
 Wed, 24 Aug 2022 17:07:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B1A6A235F17;
 Wed, 24 Aug 2022 17:07:04 +0200 (CEST)
Received: from localhost (10.75.127.116) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 24 Aug
 2022 17:07:04 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 24 Aug 2022 17:06:59 +0200
Message-ID: <20220824150659.1117510-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.116]
X-ClientProxiedBy: GPXDAG2NODE6.st.com (10.75.127.70) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-24_08,2022-08-22_02,2022-06-22_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] configs: stih410-b2260: Fix SYS_HZ_CLOCK value
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

SYS_HZ_CLOCK was wrongly set to 1MHz whereas it's set to 750MHz
by default by bootrom.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 include/configs/stih410-b2260.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/configs/stih410-b2260.h b/include/configs/stih410-b2260.h
index b1a011bacb..1e966a2322 100644
--- a/include/configs/stih410-b2260.h
+++ b/include/configs/stih410-b2260.h
@@ -14,7 +14,7 @@
 #define CONFIG_SYS_SDRAM_BASE		PHYS_SDRAM_1
 #define PHYS_SDRAM_1_SIZE		0x3E000000
 
-#define CONFIG_SYS_HZ_CLOCK		1000000000	/* 1 GHz */
+#define CONFIG_SYS_HZ_CLOCK		750000000	/* 750 MHz */
 
 /* Environment */
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
