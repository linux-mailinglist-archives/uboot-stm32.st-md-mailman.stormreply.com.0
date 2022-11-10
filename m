Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED44B624041
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Nov 2022 11:49:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0561C65053;
	Thu, 10 Nov 2022 10:49:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07BF2C65057
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Nov 2022 10:49:29 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AAAlWlP012823; Thu, 10 Nov 2022 11:49:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=Ve/7l2uOdXz4YcBi/PYX4KnP/CZc3/iLLtlltyVJ6jE=;
 b=xsRRHMPPtfKjUxLtFzi+WxnoVLNlTFQTxTIVTupU7PTIPaZE5GNFiZOZk/5Yv0bbcjW4
 lkro9vMIy0Ok8YRZ8U0YUFic6bwEWiQCH5hIgnKmV8Fx5KxzW8918cxk7jhodMKz8h7K
 8qfMvwDcUAcLeMxo0nlEiAA3CHx7la6wiv+wsPLYKUT4Veh0oV9UBw2d7g6c4VQNtET2
 U1cGVjHrMZG0nM7BEROsjReLtv7kXp6Jx3hgBTa5bt2CYnL0ECipGx0AK8HOPw+fiJWz
 AuYU8bL25CWZSZetWgSnApsU3CNtBA9k24DQE8kliN3XysHJr2VuGmyYVAgA7xcUK+P4 dQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kryux80c7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Nov 2022 11:49:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7D0B810002A;
 Thu, 10 Nov 2022 11:49:15 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 52C14218622;
 Thu, 10 Nov 2022 11:49:15 +0100 (CET)
Received: from localhost (10.252.15.206) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Thu, 10 Nov
 2022 11:49:14 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 10 Nov 2022 11:48:58 +0100
Message-ID: <20221110114828.1.Id1b34c2a5cfbd6b1fbc2f49e4d542c3954c1e9f2@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110104905.3076915-1-patrick.delaunay@foss.st.com>
References: <20221110104905.3076915-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.15.206]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_08,2022-11-09_01,2022-06-22_01
Cc: Peng Fan <peng.fan@nxp.com>, Wolfgang Denk <wd@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/8] env: mmc: introduced ENV_MMC_OFFSET
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

Introduce ENV_MMC_OFFSET defines.
It is a preliminary step to the next patches to simplify the code.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 env/mmc.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/env/mmc.c b/env/mmc.c
index c28f4c6c6dc0..42bcf7e775cc 100644
--- a/env/mmc.c
+++ b/env/mmc.c
@@ -24,6 +24,17 @@
 #define __STR(X) #X
 #define STR(X) __STR(X)
 
+#define ENV_MMC_INVALID_OFFSET ((s64)-1)
+
+/* Default ENV offset when not defined in Device Tree */
+#define ENV_MMC_OFFSET		CONFIG_ENV_OFFSET
+
+#if defined(CONFIG_ENV_OFFSET_REDUND)
+#define ENV_MMC_OFFSET_REDUND	CONFIG_ENV_OFFSET_REDUND
+#else
+#define ENV_MMC_OFFSET_REDUND	ENV_MMC_INVALID_OFFSET
+#endif
+
 DECLARE_GLOBAL_DATA_PTR;
 
 /*
@@ -94,12 +105,12 @@ static inline s64 mmc_offset(int copy)
 			return val;
 	}
 
-	defvalue = CONFIG_ENV_OFFSET;
+	defvalue = ENV_MMC_OFFSET;
 	propname = dt_prop.offset;
 
 #if defined(CONFIG_ENV_OFFSET_REDUND)
 	if (copy) {
-		defvalue = CONFIG_ENV_OFFSET_REDUND;
+		defvalue = ENV_MMC_OFFSET_REDUND;
 		propname = dt_prop.offset_redund;
 	}
 #endif
@@ -108,11 +119,11 @@ static inline s64 mmc_offset(int copy)
 #else
 static inline s64 mmc_offset(int copy)
 {
-	s64 offset = CONFIG_ENV_OFFSET;
+	s64 offset = ENV_MMC_OFFSET;
 
 #if defined(CONFIG_ENV_OFFSET_REDUND)
 	if (copy)
-		offset = CONFIG_ENV_OFFSET_REDUND;
+		offset = ENV_MMC_OFFSET_REDUND;
 #endif
 	return offset;
 }
@@ -122,6 +133,11 @@ __weak int mmc_get_env_addr(struct mmc *mmc, int copy, u32 *env_addr)
 {
 	s64 offset = mmc_offset(copy);
 
+	if (offset == ENV_MMC_INVALID_OFFSET) {
+		printf("Invalid ENV offset in MMC, copy=%d\n", copy);
+		return -ENOENT;
+	}
+
 	if (offset < 0)
 		offset += mmc->capacity;
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
