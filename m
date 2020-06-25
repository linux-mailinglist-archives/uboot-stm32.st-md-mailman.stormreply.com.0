Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2529209AF2
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2020 10:01:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25199C36B16
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2020 08:01:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6463FC36B14
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2020 08:00:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05P7visC016206; Thu, 25 Jun 2020 10:00:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=grVASiqTslVmoyvNE7cUQ69Jk1KSCDpDlkRlnomTjII=;
 b=ObzQDnLprEQF78ugc5rBS4gh2xqCQkRpJ5OocbERZTB7xM3Lp4O1wD6d2ipOTpgH0r/h
 B+bhahzvTgfVbo37d70dTvezeZ3QDjKUwY1zi7NJu+5eHHkJFhrDjvQPcLYAh1WkTdL+
 W7tuP6a/QVbXQIRfRP15Ru8p96YQKcBZCrJXoOiibCnRS6x1DdqSkqnjOslSrbUI7aPS
 TCPh0KiZmzHAX9sJtlL4ZHpUlBsxQ0a9OPLsaeD8Oj0+wStHO5dUAW3N4pRKqQED+e+A
 BtsuC8bZWJuFYMBzSgeHSY3Yn687hwK6o/zGKAZjuoM/6Axx7UwxCAYCZcwDd54XgkTt Xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31uuumgmy5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 10:00:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AE4A1100034;
 Thu, 25 Jun 2020 10:00:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A2FC22A991C;
 Thu, 25 Jun 2020 10:00:31 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 25 Jun 2020 10:00:30 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 25 Jun 2020 09:59:57 +0200
Message-ID: <20200625075958.9868-14-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625075958.9868-1-patrick.delaunay@st.com>
References: <20200625075958.9868-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-25_03:2020-06-25,
 2020-06-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Simon Glass <sjg@chromium.org>,
 Wolfgang Denk <wd@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v3 13/14] env: ext4: add support of command
	env erase
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

(no changes since v2)

Changes in v2:
- use CONFIG_IS_ENABLED to set .erase (same as .save)

 env/ext4.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/env/ext4.c b/env/ext4.c
index 0a10a5e050..cc36504154 100644
--- a/env/ext4.c
+++ b/env/ext4.c
@@ -99,6 +99,23 @@ static int env_ext4_save(void)
 	return 0;
 }
 
+static int env_ext4_erase(void)
+{
+	env_t env_new;
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
+
 static int env_ext4_load(void)
 {
 	ALLOC_CACHE_ALIGN_BUFFER(char, buf, CONFIG_ENV_SIZE);
@@ -156,4 +173,6 @@ U_BOOT_ENV_LOCATION(ext4) = {
 	ENV_NAME("EXT4")
 	.load		= env_ext4_load,
 	.save		= ENV_SAVE_PTR(env_ext4_save),
+	.erase		= CONFIG_IS_ENABLED(CMD_ERASEENV) ? env_ext4_erase :
+							    NULL,
 };
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
