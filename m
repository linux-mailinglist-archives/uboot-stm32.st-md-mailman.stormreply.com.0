Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BEB15B01A
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 19:45:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCF1CC36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 18:45:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CE51C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 18:45:32 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CIgmr7006915; Wed, 12 Feb 2020 19:45:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=T49wc0rO2e6EaBeFaHoTUHy06Qx+rOGUUHUf+keKcXI=;
 b=XszC712keeWijFZ3j4jLB+gcx4LU3L0WW/Rqr10wU61hwQe6ubgwAnnC03x4030R0Wra
 N5SApRcuJvI/KvQf/P8lHcq4AyxUGEc/xrnVt9j/v0xn6xXEmv+M9hWjczD1E/vsRWq1
 pXh9HheWlaQdeUTYF4BgylPwlTRNxt1oZwUnXcqKEU8a4tAfih5kZXAnkZlqbvRL+f98
 53r/gGx5/faQgkksnnrBmF8v6T3O0lQu0LgwdLHSXXcFUoLpklUgBPqJyf2rZT1fkEvB
 tUb9GvVuNN6kv92YwX4Impxlqy52HOqEDX3A4g0OI9MR91ZQQDAi9/++HA3rwVXOw7kB 5Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1urhg7pw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 19:45:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F0D80100034;
 Wed, 12 Feb 2020 19:45:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E82982C60B1;
 Wed, 12 Feb 2020 19:45:10 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 19:45:10 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 19:45:00 +0100
Message-ID: <20200212184501.5911-10-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212184501.5911-1-patrick.delaunay@st.com>
References: <20200212184501.5911-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_08:2020-02-12,
 2020-02-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Wolfgang Denk <wd@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [RESEND PATCH 09/10] env: ext4: add support of
	command env erase
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
