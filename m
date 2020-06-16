Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D20F11FAA1E
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 09:41:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8DB1FC36B24
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 07:41:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE7A9C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 07:41:03 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05G7e7v0028803; Tue, 16 Jun 2020 09:40:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=T1NoD+hMRpAWoMGRu6q5H4AbgS2dmwlKZMsggdTYuwg=;
 b=l6T2f59wgrtb1f6P7BPtB1wXwS1wduO3w/VyKuPKqmGrOJ7zYduNMUgXXvpIrWa5/Vah
 YE8CyQer7eoAXR4v21fuj9di7IpUjuq+7/JVjvA694uoxGxcBG57vtcUNZwJ13GGa9FR
 ZQB9D7ZwDmiwjbfp/uCoc6srvbaOmLzmd5f+p4WcQDS/qZ4qkKoE037uS7bhbeFn40Z9
 8zgcY+BoxalBWBZCT0HuvY9qkFoFzNdtoBlwuvsaaqUUBhywaQpbcHo11+FzZXI8lg4O
 uui2jEnB2qEO6gCTfKfL5v+ZL/z07bE8Q3DJ9f5zpDquqosI9gk622HwBB0NFbpAKqe1 NQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mnph5mqx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 09:40:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 738E210002A;
 Tue, 16 Jun 2020 09:40:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6AA2C2AEF93;
 Tue, 16 Jun 2020 09:40:56 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 16 Jun 2020 09:40:56 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 16 Jun 2020 09:40:47 +0200
Message-ID: <20200616074048.7898-9-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616074048.7898-1-patrick.delaunay@st.com>
References: <20200616074048.7898-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_02:2020-06-15,
 2020-06-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Wolfgang Denk <wd@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 8/9] env: ext4: add support of command env
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

Changes in v2:
- use CONFIG_IS_ENABLED to set .erase (same as .save)

 env/ext4.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/env/ext4.c b/env/ext4.c
index 027a721b69..7a104c1615 100644
--- a/env/ext4.c
+++ b/env/ext4.c
@@ -99,6 +99,23 @@ static int env_ext4_save(void)
 	return 0;
 }
 
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
