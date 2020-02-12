Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9112615AFD6
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 19:31:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52675C36B09
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 18:31:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36BECC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 18:31:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CIE7qN031189; Wed, 12 Feb 2020 19:30:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=T49wc0rO2e6EaBeFaHoTUHy06Qx+rOGUUHUf+keKcXI=;
 b=fPtlpukBL64cpOmVPgMXWk1y6tSjCGBOTHGQPrzsGsQwgcw0SREv8ueyA/EZYUKDaEK7
 K2m59/Pqcb5OprlSKnDrpXuJQWB0sg+o7sSTJiBFxEXFLX1q+1ziMnGr893WECaUfi53
 1NMgXA9R9JABzObXVZ646cRTEfVJFwZ6gjElyxbSjACVQ+qfR+wFq1/6Zmiuy72WB2Ju
 6yUPJyr4HurxdAa0dmBkgGtxPTY8miVWm7ENmYm+L+RNHIF4BDMqYg1YP3BamqNFwYcn
 340MifB8B9iqXZIXhA1XzfpCOClDvFVUdtBl7wQhelIs4z9YnasBxqbtd/4/BeaEA2q2 Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uvdqstn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 19:30:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 527D6100044;
 Wed, 12 Feb 2020 19:30:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4684B2BF9DC;
 Wed, 12 Feb 2020 19:30:32 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 19:30:31 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 19:30:20 +0100
Message-ID: <20200212183021.4844-10-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212183021.4844-1-patrick.delaunay@st.com>
References: <20200212183021.4844-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_08:2020-02-12,
 2020-02-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Wolfgang Denk <wd@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 09/10] env: ext4: add support of command env
	erase
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

Add support of opts erase for env in ext4,
this opts is used by command 'env erase'.

This command only fill the env file (CONFIG_ENV_EXT4_FILE)
with 0, the CRC and the saved environment becomes invalid.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 env/ext4.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/env/ext4.c b/env/ext4.c
index 49ed06659f..aec2a33fad 100644
--- a/env/ext4.c
+++ b/env/ext4.c
@@ -43,7 +43,7 @@ __weak const char *env_ext4_get_dev_part(void)
 	return (const char *)CONFIG_ENV_EXT4_DEVICE_AND_PART;
 }
 
-#if defined(CONFIG_CMD_SAVEENV)
+#if defined(CONFIG_CMD_SAVEENV) || defined(CONFIG_CMD_ERASEENV)
 static int env_ext4_save_buffer(env_t *env_new)
 {
 	struct blk_desc *dev_desc = NULL;
@@ -102,6 +102,25 @@ static int env_ext4_save(void)
 }
 #endif /* CONFIG_CMD_SAVEENV */
 
+#if defined(CONFIG_CMD_ERASEENV)
+static int env_ext4_erase(void)
+{
+	env_t	env_new;
+	int err;
+
+	memset(&env_new, 0, sizeof(env_t));
+
+	err = env_ext4_save_buffer(&env_new);
+	if (err)
+		return err;
+
+	gd->env_valid = ENV_INVALID;
+	puts("done\n");
+
+	return 0;
+}
+#endif
+
 static int env_ext4_load(void)
 {
 	ALLOC_CACHE_ALIGN_BUFFER(char, buf, CONFIG_ENV_SIZE);
@@ -161,4 +180,7 @@ U_BOOT_ENV_LOCATION(ext4) = {
 #ifdef CONFIG_CMD_SAVEENV
 	.save		= env_save_ptr(env_ext4_save),
 #endif
+#if defined(CONFIG_CMD_ERASEENV)
+	.erase		= env_ext4_erase,
+#endif
 };
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
