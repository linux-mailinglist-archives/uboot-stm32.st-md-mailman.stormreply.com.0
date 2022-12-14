Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E31C64CD62
	for <lists+uboot-stm32@lfdr.de>; Wed, 14 Dec 2022 16:51:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC269C6411C;
	Wed, 14 Dec 2022 15:51:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFDDCC63326
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Dec 2022 15:51:50 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BEBKgvp006434; Wed, 14 Dec 2022 16:51:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=ztN2tta7Ej5BGg5QO/q1kD1rofwQkDPdxHaREZXh2QU=;
 b=Vfwve3bESdCcyC6LoCFL+TG+o65NuldU6IgAQUMKNXK0iuwXsM0ebq1T29rapf4J96AU
 FkCUZGeWQ6p0GDZ3NgXZMf0XKn9lzd2HmcX80Rd5h2GFaKWWJ9THsi7JnCsMd/hD41QX
 AJNonzZYz1t0Cj/xtwq3qLjrZhxEVuId34tKh7FmIcPtmI6IF+gfg6JZc/Pe+aS63xH/
 Cv+jemZBN45NYqOp0O0IqIYQBXYb2qdFA3BbQ8GnbomUqVmP3CXifPHEYsOnDKqIWKcC
 86DOV5Gn/sKs2Cioh6fazQuQreIxIkNqwIsjikMIZMp2xP52cXxAsPpHFGhPbTS3vKi6 EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mf6us4c87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Dec 2022 16:51:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8082A10002A;
 Wed, 14 Dec 2022 16:51:42 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7187B22F7DC;
 Wed, 14 Dec 2022 16:51:42 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 14 Dec
 2022 16:51:41 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 14 Dec 2022 16:51:31 +0100
Message-ID: <20221214165126.1.I8d5c1748a43a5bba6c8470c6a3715d2c9143014a@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-14_07,2022-12-14_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>, Wolfgang Denk <wd@denx.de>
Subject: [Uboot-stm32] [PATCH 1/2] env: ubi: add support of command env erase
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

Add support of opts erase for ubi env backend, this opts is used by
command 'env erase'.

This command only zero-fill the env UBI volume CONFIG_ENV_UBI_VOLUME
and CONFIG_ENV_UBI_VOLUME_REDUND, so the saved environment becomes
invalid.

This patch introduces a local define ENV_UBI_VOLUME_REDUND
only to avoid #if in the code, as CONFIG_ENV_UBI_VOLUME_REDUND
is only defined when CONFIG_SYS_REDUNDAND_ENVIRONMENT is defined.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 env/ubi.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/env/ubi.c b/env/ubi.c
index eb21c4f38b49..445d34fedb89 100644
--- a/env/ubi.c
+++ b/env/ubi.c
@@ -28,6 +28,12 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
+#if CONFIG_SYS_REDUNDAND_ENVIRONMENT
+#define ENV_UBI_VOLUME_REDUND CONFIG_ENV_UBI_VOLUME_REDUND
+#else
+#define ENV_UBI_VOLUME_REDUND "invalid"
+#endif
+
 #ifdef CONFIG_CMD_SAVEENV
 #ifdef CONFIG_SYS_REDUNDAND_ENVIRONMENT
 static int env_ubi_save(void)
@@ -177,9 +183,43 @@ static int env_ubi_load(void)
 }
 #endif /* CONFIG_SYS_REDUNDAND_ENVIRONMENT */
 
+static int env_ubi_erase(void)
+{
+	ALLOC_CACHE_ALIGN_BUFFER(char, env_buf, CONFIG_ENV_SIZE);
+	int ret = 0;
+
+	if (ubi_part(CONFIG_ENV_UBI_PART, UBI_VID_OFFSET)) {
+		printf("\n** Cannot find mtd partition \"%s\"\n",
+		       CONFIG_ENV_UBI_PART);
+		return 1;
+	}
+
+	memset(env_buf, 0x0, CONFIG_ENV_SIZE);
+
+	if (ubi_volume_write(CONFIG_ENV_UBI_VOLUME,
+			     (void *)env_buf, CONFIG_ENV_SIZE)) {
+		printf("\n** Unable to erase env to %s:%s **\n",
+		       CONFIG_ENV_UBI_PART,
+		       CONFIG_ENV_UBI_VOLUME);
+		ret = 1;
+	}
+	if (IS_ENABLED(CONFIG_SYS_REDUNDAND_ENVIRONMENT)) {
+		if (ubi_volume_write(ENV_UBI_VOLUME_REDUND,
+				     (void *)env_buf, CONFIG_ENV_SIZE)) {
+			printf("\n** Unable to erase env to %s:%s **\n",
+			       CONFIG_ENV_UBI_PART,
+			       ENV_UBI_VOLUME_REDUND);
+			ret = 1;
+		}
+	}
+
+	return ret;
+}
+
 U_BOOT_ENV_LOCATION(ubi) = {
 	.location	= ENVL_UBI,
 	ENV_NAME("UBI")
 	.load		= env_ubi_load,
 	.save		= env_save_ptr(env_ubi_save),
+	.erase		= ENV_ERASE_PTR(env_ubi_erase),
 };
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
