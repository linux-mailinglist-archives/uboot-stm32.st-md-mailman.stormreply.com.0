Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EC515AFD3
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 19:31:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F093C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 18:31:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F5FDC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 18:31:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CICjiJ001364; Wed, 12 Feb 2020 19:30:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=+jtj3CmL0QgqRvRjC8/K9G0x5M7BSfr3Zac8Pe5cKVM=;
 b=SDZ3ev1Q2bUCKdt//8bKCXTDdZBmSkW8c0/vDVQcrn2rhAzV39ARX4VzNqPUXDrbinxZ
 e6LMIsqckjai0eMilvsExs+bTWcM5yOALzi9XBBHJ6AqKRtxLRd6QQGIft+AScIHqNxo
 Jvu6sRn0klHC4gdURuKF7jGjFH0QX1+mJr5289JkH1XMGWt39bO/PjeKvsRfpujyuhwl
 oRu6yGofl5hAZt7XpFvfk3zoddCp4bUkxj0ti79OHOjt/AgZjpx5hET1MiiA9afLTt2V
 2QTK3X90PsYfq+N4qUyaVJnyIoJG4BykkZDZXwBKaAoNPbepuPiQOkIBLvKewGvIAoPa Jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uda026w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 19:30:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1A6C9100042;
 Wed, 12 Feb 2020 19:30:31 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 11C8A2BF9D1;
 Wed, 12 Feb 2020 19:30:31 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 19:30:30 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 19:30:19 +0100
Message-ID: <20200212183021.4844-9-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212183021.4844-1-patrick.delaunay@st.com>
References: <20200212183021.4844-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_08:2020-02-12,
 2020-02-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Wolfgang Denk <wd@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 08/10] env: ext4: introduce new function
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

Split the function env_ext4_save to prepare the erase support

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 env/ext4.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/env/ext4.c b/env/ext4.c
index aa77261649..49ed06659f 100644
--- a/env/ext4.c
+++ b/env/ext4.c
@@ -43,10 +43,9 @@ __weak const char *env_ext4_get_dev_part(void)
 	return (const char *)CONFIG_ENV_EXT4_DEVICE_AND_PART;
 }
 
-#ifdef CONFIG_CMD_SAVEENV
-static int env_ext4_save(void)
+#if defined(CONFIG_CMD_SAVEENV)
+static int env_ext4_save_buffer(env_t *env_new)
 {
-	env_t	env_new;
 	struct blk_desc *dev_desc = NULL;
 	disk_partition_t info;
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
 
@@ -81,9 +76,28 @@ static int env_ext4_save(void)
 			CONFIG_ENV_EXT4_FILE, ifname, dev, part);
 		return 1;
 	}
-	gd->env_valid = ENV_VALID;
 
+	return 0;
+}
+#endif
+
+#ifdef CONFIG_CMD_SAVEENV
+static int env_ext4_save(void)
+{
+	env_t	env_new;
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
 #endif /* CONFIG_CMD_SAVEENV */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
