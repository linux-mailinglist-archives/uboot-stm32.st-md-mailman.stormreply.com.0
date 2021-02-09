Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CED314D72
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Feb 2021 11:49:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD29AC57B56;
	Tue,  9 Feb 2021 10:49:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1E97C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 10:49:01 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 119AeqaK032143; Tue, 9 Feb 2021 11:48:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=nioCG45t5o2xQpmyJ0ku9g5OqDi7ZF/lDUPhE7GbvTw=;
 b=AvpyX2vDNqQAt5614mEYna3tREO0kLzgessuDVpNjwCMfO8OV7RFADZ1ZNCqX6MljUVH
 L3e6bnbhNupRco6pi1NiGyF8t1sAojU8zQGTfadSeh3iJnQC+JsKpw8YOBv4KrVtVmJO
 XsNK4dkj26ESCgkBMWmrvJ0ePjIJhXNxVm6SPI/koeN2mJK6cu9oZIZv82yQmE/K3gdP
 fsKOljRGAU1TTq8UBbpeuC+Q9Kfs++Ner7j2/sXxfg8VBCXUf84LEVkXLHD0PpnNmBdv
 vzE45+3/3p01qEciXfakH0eL7NmezFEyo5IJVAZBc+8xzV5H8QORm0vA7zzCBK+mszi6 Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hr2c7ywk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 11:48:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4EFB6100034;
 Tue,  9 Feb 2021 11:48:56 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4296E226F66;
 Tue,  9 Feb 2021 11:48:56 +0100 (CET)
Received: from localhost (10.75.127.122) by GPXDAG2NODE6.st.com (10.75.127.70)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 9 Feb 2021 11:48:55 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 9 Feb 2021 11:48:50 +0100
Message-ID: <20210209114849.1.I4101043ff86264c22da77700b28bf231d66e49cb@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210209104852.1293-1-patrick.delaunay@foss.st.com>
References: <20210209104852.1293-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.122]
X-ClientProxiedBy: GPXDAG1NODE5.st.com (10.75.127.66) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_03:2021-02-09,
 2021-02-09 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wolfgang Denk <wd@denx.de>
Subject: [Uboot-stm32] [PATCH 1/3] env: add ENV_ERASE_PTR macro
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

Add ENV_ERASE_PTR macro to handle erase opts and remove the associated
ifdef.

This patch is a extension of previous commit 82b2f4135719 ("env_internal.h:
add alternative ENV_SAVE_PTR macro").

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 env/ext4.c             | 3 +--
 env/mmc.c              | 6 +-----
 include/env_internal.h | 1 +
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/env/ext4.c b/env/ext4.c
index e666f7b945..caa3e05a57 100644
--- a/env/ext4.c
+++ b/env/ext4.c
@@ -187,6 +187,5 @@ U_BOOT_ENV_LOCATION(ext4) = {
 	ENV_NAME("EXT4")
 	.load		= env_ext4_load,
 	.save		= ENV_SAVE_PTR(env_ext4_save),
-	.erase		= CONFIG_IS_ENABLED(CMD_ERASEENV) ? env_ext4_erase :
-							    NULL,
+	.erase		= ENV_ERASE_PTR(env_ext4_erase),
 };
diff --git a/env/mmc.c b/env/mmc.c
index ee376c3e0c..d959ba6d80 100644
--- a/env/mmc.c
+++ b/env/mmc.c
@@ -232,7 +232,6 @@ fini:
 	return ret;
 }
 
-#if defined(CONFIG_CMD_ERASEENV)
 static inline int erase_env(struct mmc *mmc, unsigned long size,
 			    unsigned long offset)
 {
@@ -278,7 +277,6 @@ static int env_mmc_erase(void)
 
 	return ret;
 }
-#endif /* CONFIG_CMD_ERASEENV */
 #endif /* CONFIG_CMD_SAVEENV && !CONFIG_SPL_BUILD */
 
 static inline int read_env(struct mmc *mmc, unsigned long size,
@@ -393,8 +391,6 @@ U_BOOT_ENV_LOCATION(mmc) = {
 	.load		= env_mmc_load,
 #ifndef CONFIG_SPL_BUILD
 	.save		= env_save_ptr(env_mmc_save),
-#if defined(CONFIG_CMD_ERASEENV)
-	.erase		= env_mmc_erase,
-#endif
+	.erase		= ENV_ERASE_PTR(env_mmc_erase)
 #endif
 };
diff --git a/include/env_internal.h b/include/env_internal.h
index 708c833a55..b7bddcb00d 100644
--- a/include/env_internal.h
+++ b/include/env_internal.h
@@ -211,6 +211,7 @@ struct env_driver {
 #endif
 
 #define ENV_SAVE_PTR(x) (CONFIG_IS_ENABLED(SAVEENV) ? (x) : NULL)
+#define ENV_ERASE_PTR(x) (CONFIG_IS_ENABLED(CMD_ERASEENV) ? (x) : NULL)
 
 extern struct hsearch_data env_htab;
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
