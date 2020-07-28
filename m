Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 481F42306FB
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 11:51:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1109AC36B27
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 09:51:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4D08C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 09:51:48 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06S9oNFa005913; Tue, 28 Jul 2020 11:51:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=P0w0rXNgnmDfwIYljnX646tRCaDd//h41GAQgi9X8UM=;
 b=iEPsJpUAXuB4X+K/zBAW3iynYUWDjyPqc4k9298PQOgPejTDi+g3j2knh1p4dbWtAp3G
 t0VouB3Ht+2zBZ9ZaNsnCtRbN4/Elw0CMVdPPjPqlPV5zYup7Ii/tKnTzD5cy4m6Y2Gn
 6K8n9gbzlrX/queKFoo6f8Zp/o8okezqPzeEoNfyI/3eY1Wo9Gqfuf2HZGfgr+SeDwjH
 2+3fW5eZdhKTF8O0MReG6ulm+UcSFBd1BoqqDlz1239tYztvbq5R2WcOqtpzLxv+qU07
 AWWVGFiOEgL97fQiwQziIIjpfnikoktOl5hIN17j5P+g/QeWr5Fi2Tv25uffSvzOJ36J 0w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32ga71wkh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 11:51:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AD0E4100034;
 Tue, 28 Jul 2020 11:51:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A0D9E2A70DB;
 Tue, 28 Jul 2020 11:51:44 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Jul 2020 11:51:44 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 28 Jul 2020 11:51:25 +0200
Message-ID: <20200728095128.2363-13-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200728095128.2363-1-patrick.delaunay@st.com>
References: <20200728095128.2363-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_07:2020-07-28,
 2020-07-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Simon Glass <sjg@chromium.org>,
 Wolfgang Denk <wd@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v4 12/14] env: ext4: introduce new function
	env_ext4_save_buffer
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

Split the function env_ext4_save to prepare the erase support.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

(no changes since v1)

 env/ext4.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/env/ext4.c b/env/ext4.c
index ac9f126bec..0a10a5e050 100644
--- a/env/ext4.c
+++ b/env/ext4.c
@@ -44,9 +44,8 @@ __weak const char *env_ext4_get_dev_part(void)
 	return (const char *)CONFIG_ENV_EXT4_DEVICE_AND_PART;
 }
 
-static int env_ext4_save(void)
+static int env_ext4_save_buffer(env_t *env_new)
 {
-	env_t	env_new;
 	struct blk_desc *dev_desc = NULL;
 	struct disk_partition info;
 	int dev, part;
@@ -54,10 +53,6 @@ static int env_ext4_save(void)
 	const char *ifname = env_ext4_get_intf();
 	const char *dev_and_part = env_ext4_get_dev_part();
 
-	err = env_export(&env_new);
-	if (err)
-		return err;
-
 	part = blk_get_device_part_str(ifname, dev_and_part,
 				       &dev_desc, &info, 1);
 	if (part < 0)
@@ -72,7 +67,7 @@ static int env_ext4_save(void)
 		return 1;
 	}
 
-	err = ext4fs_write(CONFIG_ENV_EXT4_FILE, (void *)&env_new,
+	err = ext4fs_write(CONFIG_ENV_EXT4_FILE, (void *)env_new,
 			   sizeof(env_t), FILETYPE_REG);
 	ext4fs_close();
 
@@ -81,9 +76,26 @@ static int env_ext4_save(void)
 			CONFIG_ENV_EXT4_FILE, ifname, dev, part);
 		return 1;
 	}
-	gd->env_valid = ENV_VALID;
 
+	return 0;
+}
+
+static int env_ext4_save(void)
+{
+	env_t env_new;
+	int err;
+
+	err = env_export(&env_new);
+	if (err)
+		return err;
+
+	err = env_ext4_save_buffer(&env_new);
+	if (err)
+		return err;
+
+	gd->env_valid = ENV_VALID;
 	puts("done\n");
+
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
