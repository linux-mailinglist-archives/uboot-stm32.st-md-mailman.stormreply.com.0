Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C82A064556C
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Dec 2022 09:27:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C58DC65E69;
	Wed,  7 Dec 2022 08:27:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56F34C65E5D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Dec 2022 08:27:58 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B73fNWe004326; Wed, 7 Dec 2022 09:27:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=SGcUeedC/k8Ud29xv1Z212GEt1p6FhVCWlT9YZgB4Bg=;
 b=SGawvaiLSG2UXaYxnAZInpJND+Qpz9TGeoindLVQ/mh15KA7OIi1d3CRlwONQaCUefHb
 /k8a627GKNoolZC8GA3yBFceZzSQajwC3mWNi3d1gSXh1alYXDtkSqXCZEkkwhJzUbhJ
 g0o0cuxVBzmmpd6wYKFDuT6sWLYYcsP4icWS7Ryx+ItFcardXG3XEhKdUTsgs4yzc9it
 KEfae7fHc7zD0G5MnlVm4gbpbkzb6tWmYWFiDY0AhvXyGC82ykqlCDa4hhkVx33lLZc9
 4phYSEEvrmMHz7nmBnM18SCg9Cu8b2DdkD7bV3v11pioqncHePNNvWBl5jAYkw5xTx0W ZA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m7vrr6cs2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 09:27:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B83DB10003A;
 Wed,  7 Dec 2022 09:27:51 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B283B2194CD;
 Wed,  7 Dec 2022 09:27:51 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 7 Dec
 2022 09:27:50 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 7 Dec 2022 09:26:44 +0100
Message-ID: <20221207092619.5.Id2bf796844f4f341c3102861ca34f074408dcb78@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221207082644.3515486-1-patrick.delaunay@foss.st.com>
References: <20221207082644.3515486-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_04,2022-12-06_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 5/5] configs: remove support of
	MTDIDS_DEFAULT/MTDPARTS_DEFAULT
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

Complete the migration of MTDPARTS_DEFAULT / MTDIDS_DEFAULT in Kconfig;
this patch removes the support of MTDIDS_DEFAULT / MTDPARTS_DEFAULT
in the configuration files (include/configs/*.h).

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 cmd/mtdparts.c          | 5 +----
 drivers/mtd/mtd_uboot.c | 4 ----
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/cmd/mtdparts.c b/cmd/mtdparts.c
index bab75a262f3a..0984158f41ea 100644
--- a/cmd/mtdparts.c
+++ b/cmd/mtdparts.c
@@ -111,20 +111,17 @@ DECLARE_GLOBAL_DATA_PTR;
 #define MTD_WRITEABLE_CMD		1
 
 /* default values for mtdids and mtdparts variables */
-#if !defined(MTDIDS_DEFAULT)
 #ifdef CONFIG_MTDIDS_DEFAULT
 #define MTDIDS_DEFAULT CONFIG_MTDIDS_DEFAULT
 #else
 #define MTDIDS_DEFAULT NULL
 #endif
-#endif
-#if !defined(MTDPARTS_DEFAULT)
 #ifdef CONFIG_MTDPARTS_DEFAULT
 #define MTDPARTS_DEFAULT CONFIG_MTDPARTS_DEFAULT
 #else
 #define MTDPARTS_DEFAULT NULL
 #endif
-#endif
+
 #if defined(CONFIG_SYS_MTDPARTS_RUNTIME)
 extern void board_mtdparts_default(const char **mtdids, const char **mtdparts);
 #endif
diff --git a/drivers/mtd/mtd_uboot.c b/drivers/mtd/mtd_uboot.c
index dd0b0242f95f..14ce726b10d8 100644
--- a/drivers/mtd/mtd_uboot.c
+++ b/drivers/mtd/mtd_uboot.c
@@ -30,8 +30,6 @@ static const char *get_mtdids(void)
 
 #if defined(CONFIG_SYS_MTDPARTS_RUNTIME)
 	board_mtdparts_default(&mtdids, &mtdparts);
-#elif defined(MTDIDS_DEFAULT)
-	mtdids = MTDIDS_DEFAULT;
 #elif defined(CONFIG_MTDIDS_DEFAULT)
 	mtdids = CONFIG_MTDIDS_DEFAULT;
 #endif
@@ -147,8 +145,6 @@ static const char *get_mtdparts(void)
 
 #if defined(CONFIG_SYS_MTDPARTS_RUNTIME)
 	board_mtdparts_default(&mtdids, &mtdparts);
-#elif defined(MTDPARTS_DEFAULT)
-	mtdparts = MTDPARTS_DEFAULT;
 #elif defined(CONFIG_MTDPARTS_DEFAULT)
 	mtdparts = CONFIG_MTDPARTS_DEFAULT;
 #endif
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
