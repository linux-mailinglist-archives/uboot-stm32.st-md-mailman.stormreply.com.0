Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4CD728376
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Jun 2023 17:16:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21938C65E58;
	Thu,  8 Jun 2023 15:16:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88E2FC65E70
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jun 2023 15:16:57 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 358BIteA013526; Thu, 8 Jun 2023 17:16:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=Al7KWB2Ba8wm9Np5nS+4Cxx1tUNrvHcc0/0AE1r8e+E=;
 b=6HkY993C5+GxvJyWtkivYn3+fviZfJqpwmWnOeMzdTMLRhyntbYwKS8/SDq5LCPqol61
 KshEuZy+VAOf1NejKXsomF8mmPi+OGPkIox61zvaCdA9aY4wnG0sDl8DzOLmc1WN/ZCc
 xjHLyigDuc53opNRI00Oisbzbr2qKn1+4u5Nt2Wiv3ziZMVpUZ64xn5M2zBfD7Ex82lH
 jx4/iODx6ngSa8RtSQ5Tb+2XqbA++f6qz1LkLS8DWO/2hGzOO6l+qc+Pgg6tcvd1v4yb
 2oyd9pfh7y+SX5y5qJqdwdj5j1al8Fj9veQLKGLgKD+Avq+uiLq6SIWlDSRCUkC3QUy5 VQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r3atmb3j3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jun 2023 17:16:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C680010003B;
 Thu,  8 Jun 2023 17:16:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C09F221A231;
 Thu,  8 Jun 2023 17:16:55 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 8 Jun
 2023 17:16:55 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 8 Jun 2023 17:16:39 +0200
Message-ID: <20230608171614.3.I620daeba9c6dbeed0f0164229d65403d36291bb1@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
References: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_11,2023-06-08_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: [Uboot-stm32] [PATCH 03/12] dfu: mtd: remove direct call of
	mtdparts_init function
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

With MTD support in driver model, the direct call of mtdparts_init
should be avoided and replaced by mtd_probe_devices.

With the modificaton when MTDIDS/MTDPARTS are empty the OF fallback
with partition describe in device tree is correctly performed,
introduced by commit dc339bf784f0 ("mtd: add support for parsing
partitions defined in OF").
With this patch the dependency with CONFIG_CMD_MTDPARTS is removed.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/dfu/Kconfig   |  1 -
 drivers/dfu/dfu_mtd.c | 34 +++++++++++++++++++---------------
 2 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/dfu/Kconfig b/drivers/dfu/Kconfig
index 8d7f13dcb0b5..c3a0b93b25e0 100644
--- a/drivers/dfu/Kconfig
+++ b/drivers/dfu/Kconfig
@@ -41,7 +41,6 @@ config DFU_MMC
 config DFU_MTD
 	bool "MTD back end for DFU"
 	depends on DM_MTD
-	depends on CMD_MTDPARTS
 	help
 	  This option enables using DFU to read and write to on any MTD device.
 
diff --git a/drivers/dfu/dfu_mtd.c b/drivers/dfu/dfu_mtd.c
index c7075f12eca9..75e2f6a42151 100644
--- a/drivers/dfu/dfu_mtd.c
+++ b/drivers/dfu/dfu_mtd.c
@@ -10,7 +10,6 @@
 #include <common.h>
 #include <dfu.h>
 #include <mtd.h>
-#include <jffs2/load_kernel.h>
 #include <linux/err.h>
 #include <linux/ctype.h>
 
@@ -275,7 +274,7 @@ int dfu_fill_entity_mtd(struct dfu_entity *dfu, char *devstr, char **argv, int a
 {
 	char *s;
 	struct mtd_info *mtd;
-	int ret, part;
+	int part;
 
 	mtd = get_mtd_device_nm(devstr);
 	if (IS_ERR_OR_NULL(mtd))
@@ -299,10 +298,9 @@ int dfu_fill_entity_mtd(struct dfu_entity *dfu, char *devstr, char **argv, int a
 		if (*s)
 			return -EINVAL;
 	} else if ((!strcmp(argv[0], "part")) || (!strcmp(argv[0], "partubi"))) {
-		char mtd_id[32];
-		struct mtd_device *mtd_dev;
-		u8 part_num;
-		struct part_info *pi;
+		struct mtd_info *partition;
+		int partnum = 0;
+		bool part_found = false;
 
 		if (argc != 2)
 			return -EINVAL;
@@ -313,19 +311,25 @@ int dfu_fill_entity_mtd(struct dfu_entity *dfu, char *devstr, char **argv, int a
 		if (*s)
 			return -EINVAL;
 
-		sprintf(mtd_id, "%s,%d", devstr, part - 1);
-		printf("using id '%s'\n", mtd_id);
+		/* register partitions with MTDIDS/MTDPARTS or OF fallback */
+		mtd_probe_devices();
 
-		mtdparts_init();
-
-		ret = find_dev_and_part(mtd_id, &mtd_dev, &part_num, &pi);
-		if (ret != 0) {
-			printf("Could not locate '%s'\n", mtd_id);
+		partnum = 0;
+		list_for_each_entry(partition, &mtd->partitions, node) {
+			partnum++;
+			if (partnum == part) {
+				part_found = true;
+				break;
+			}
+		}
+		if (!part_found) {
+			printf("No partition %d in %s\n", part, mtd->name);
 			return -1;
 		}
+		log_debug("partition %d:%s in %s\n", partnum, partition->name, mtd->name);
 
-		dfu->data.mtd.start = pi->offset;
-		dfu->data.mtd.size = pi->size;
+		dfu->data.mtd.start = partition->offset;
+		dfu->data.mtd.size = partition->size;
 		if (!strcmp(argv[0], "partubi"))
 			dfu->data.mtd.ubi = 1;
 	} else {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
