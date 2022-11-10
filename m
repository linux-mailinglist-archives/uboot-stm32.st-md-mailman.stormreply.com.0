Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DEF624040
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Nov 2022 11:49:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5206C65056;
	Thu, 10 Nov 2022 10:49:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6EF6C64115
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Nov 2022 10:49:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AAAlnjc004897; Thu, 10 Nov 2022 11:49:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=TVryLKDAj3iBtxXjfqwZJunvbXyqy6gCDcdgZEiNt/g=;
 b=X+uk0OBya6cafyX23PVv8NfMBXIurADhC+WuIRlWAZx4ciDSPQcnxV7gtYfPN8VE9lQT
 Q/rP0B9cSEjYB+wzlJsNBJk3sqjF2p2xROHC1jCOSb7J1Q2kQyZ04OSncL94VsVms/5/
 gH7RlnnX32xJpdvNOnWlHHwxh3nr5IQTKpwA9Fv+p/juCiTvLUZf3IGMTJC17C2pcBMp
 KkUfEN2jWCGRXcrfCemwfRBd9eQ0svehwsOB2UA6twRp6Q59Sk2rUNKTJAdh7ostgkq+
 xWq+wImtQRfqiss166wL9Hzc2cpQVLxrkPizkaF2CPtVrQkwlteHa8z9GZMzRiXtqg5X YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kryv4g0bj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Nov 2022 11:49:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 07477100040;
 Thu, 10 Nov 2022 11:49:19 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 01F52218622;
 Thu, 10 Nov 2022 11:49:19 +0100 (CET)
Received: from localhost (10.252.15.206) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Thu, 10 Nov
 2022 11:49:16 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 10 Nov 2022 11:49:00 +0100
Message-ID: <20221110114828.3.I84d2d6b84d16b3f89fad9af6bc0386252bcab206@changeid>
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
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wolfgang Denk <wd@denx.de>
Subject: [Uboot-stm32] [PATCH 3/8] env: mcc: fix compilation error with
	ENV_IS_EMBEDDED
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

When ENV_IS_EMBEDDED is enabled, ret is not defined but is used as a
return value in env_mmc_load().
This patch correct this issue and simplify the existing code, test only
one time #if defined(ENV_IS_EMBEDDED) and not in the function.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 env/mmc.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/env/mmc.c b/env/mmc.c
index b36bd9ad77ee..661a268ea07d 100644
--- a/env/mmc.c
+++ b/env/mmc.c
@@ -353,10 +353,14 @@ static inline int read_env(struct mmc *mmc, unsigned long size,
 	return (n == blk_cnt) ? 0 : -1;
 }
 
-#if defined(CONFIG_SYS_REDUNDAND_ENVIRONMENT)
+#if defined(ENV_IS_EMBEDDED)
+static int env_mmc_load(void)
+{
+	return 0;
+}
+#elif defined(CONFIG_SYS_REDUNDAND_ENVIRONMENT)
 static int env_mmc_load(void)
 {
-#if !defined(ENV_IS_EMBEDDED)
 	struct mmc *mmc;
 	u32 offset1, offset2;
 	int read1_fail = 0, read2_fail = 0;
@@ -408,13 +412,11 @@ err:
 	if (ret)
 		env_set_default(errmsg, 0);
 
-#endif
 	return ret;
 }
 #else /* ! CONFIG_SYS_REDUNDAND_ENVIRONMENT */
 static int env_mmc_load(void)
 {
-#if !defined(ENV_IS_EMBEDDED)
 	ALLOC_CACHE_ALIGN_BUFFER(char, buf, CONFIG_ENV_SIZE);
 	struct mmc *mmc;
 	u32 offset;
@@ -453,7 +455,7 @@ fini:
 err:
 	if (ret)
 		env_set_default(errmsg, 0);
-#endif
+
 	return ret;
 }
 #endif /* CONFIG_SYS_REDUNDAND_ENVIRONMENT */
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
