Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE4A1A145
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 18:20:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9680CA8E73
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 16:20:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67F41CA8E6B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 16:20:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AG6dFU020397; Fri, 10 May 2019 18:20:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=CTA1DfLAvaRrxl4DLtizcsX/++xc6a+yWkraPSu1AWo=;
 b=cEKjVR2GOIR1RNBVtTrQmDjq05JUNq1Qmbp+zpPm4I7r+9WHo0y66t1js+k/XGw5DcTT
 zjiaefZluTe0vhyuLKyzehTYGWJ6s46sY9blUxebCZg8P9R+he6rQJhXbvv6hGaH7kd2
 z1+upSb2/4T0Y/g1e4GRXZ76Ir3Uypx0vWGkd7jQXT+YM/JiSaetedpoHJfV0dwlIsXW
 ctwYmY4mLeoKxH/Nl7LHNN3X9Vl7J4iCY3Qf+nzoB0gc7euyRRZe69VnE6QZCNs0VwhI
 XTcVzw8ky7IG86Vp9g5lqweu3TbEJaGhzeT37vKVmv2pV56V95QYb6mMCZzbDpO/+c2+ ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2scfv2sr2n-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 18:20:15 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4AB6431;
 Fri, 10 May 2019 16:20:14 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E9297E74;
 Fri, 10 May 2019 16:20:12 +0000 (GMT)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 10 May 2019 18:20:12 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 May 2019 18:19:04 +0200
Message-ID: <1557505154-3856-4-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557505154-3856-1-git-send-email-patrice.chotard@st.com>
References: <1557505154-3856-1-git-send-email-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
Cc: Christophe KERELLO <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Igor Grinberg <grinberg@compulab.co.il>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>,
 Yaniv Levinsky <yaniv.levinsky@compulab.co.il>
Subject: [Uboot-stm32] [PATCH 03/13] env: ext4: Allow overriding interface,
	device and partition
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

For platform which can boot on different device, this allows
to override interface, device and partition from board code.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 env/ext4.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/env/ext4.c b/env/ext4.c
index 388474a..9947381 100644
--- a/env/ext4.c
+++ b/env/ext4.c
@@ -30,6 +30,16 @@
 #include <ext4fs.h>
 #include <mmc.h>
 
+__weak const char *env_ext4_get_intf(void)
+{
+	return (const char *)CONFIG_ENV_EXT4_INTERFACE;
+}
+
+__weak const char *env_ext4_get_dev_part(void)
+{
+	return (const char *)CONFIG_ENV_EXT4_DEVICE_AND_PART;
+}
+
 #ifdef CONFIG_CMD_SAVEENV
 static int env_ext4_save(void)
 {
@@ -38,13 +48,14 @@ static int env_ext4_save(void)
 	disk_partition_t info;
 	int dev, part;
 	int err;
+	const char *ifname = env_ext4_get_intf();
+	const char *dev_and_part = env_ext4_get_dev_part();
 
 	err = env_export(&env_new);
 	if (err)
 		return err;
 
-	part = blk_get_device_part_str(CONFIG_ENV_EXT4_INTERFACE,
-				       CONFIG_ENV_EXT4_DEVICE_AND_PART,
+	part = blk_get_device_part_str(ifname, dev_and_part,
 				       &dev_desc, &info, 1);
 	if (part < 0)
 		return 1;
@@ -54,8 +65,7 @@ static int env_ext4_save(void)
 
 	if (!ext4fs_mount(info.size)) {
 		printf("\n** Unable to use %s %s for saveenv **\n",
-		       CONFIG_ENV_EXT4_INTERFACE,
-		       CONFIG_ENV_EXT4_DEVICE_AND_PART);
+		       ifname, dev_and_part);
 		return 1;
 	}
 
@@ -65,8 +75,7 @@ static int env_ext4_save(void)
 
 	if (err == -1) {
 		printf("\n** Unable to write \"%s\" from %s%d:%d **\n",
-			CONFIG_ENV_EXT4_FILE, CONFIG_ENV_EXT4_INTERFACE, dev,
-			part);
+			CONFIG_ENV_EXT4_FILE, ifname, dev, part);
 		return 1;
 	}
 
@@ -83,14 +92,15 @@ static int env_ext4_load(void)
 	int dev, part;
 	int err;
 	loff_t off;
+	const char *ifname = env_ext4_get_intf();
+	const char *dev_and_part = env_ext4_get_dev_part();
 
 #ifdef CONFIG_MMC
-	if (!strcmp(CONFIG_ENV_EXT4_INTERFACE, "mmc"))
+	if (!strcmp(ifname, "mmc"))
 		mmc_initialize(NULL);
 #endif
 
-	part = blk_get_device_part_str(CONFIG_ENV_EXT4_INTERFACE,
-				       CONFIG_ENV_EXT4_DEVICE_AND_PART,
+	part = blk_get_device_part_str(ifname, dev_and_part,
 				       &dev_desc, &info, 1);
 	if (part < 0)
 		goto err_env_relocate;
@@ -100,8 +110,7 @@ static int env_ext4_load(void)
 
 	if (!ext4fs_mount(info.size)) {
 		printf("\n** Unable to use %s %s for loading the env **\n",
-		       CONFIG_ENV_EXT4_INTERFACE,
-		       CONFIG_ENV_EXT4_DEVICE_AND_PART);
+		       ifname, dev_and_part);
 		goto err_env_relocate;
 	}
 
@@ -111,8 +120,7 @@ static int env_ext4_load(void)
 
 	if (err == -1) {
 		printf("\n** Unable to read \"%s\" from %s%d:%d **\n",
-			CONFIG_ENV_EXT4_FILE, CONFIG_ENV_EXT4_INTERFACE, dev,
-			part);
+			CONFIG_ENV_EXT4_FILE, ifname, dev, part);
 		goto err_env_relocate;
 	}
 
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
