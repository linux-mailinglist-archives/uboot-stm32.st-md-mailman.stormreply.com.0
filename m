Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC30262F15
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 15:22:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E55BAC3FAE1
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 13:22:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05385C36B33
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 13:22:55 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 089DMeLk011347; Wed, 9 Sep 2020 15:22:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=P0vVU2pRUBH6nSc8g2Ps2IafolUt3Bpn/GAXcWX9mVs=;
 b=dSYYyVlm88FQzOoLRYnMzDArqL2csjw/QzFaLIJs4ncNRwyHz1UNht09XsRlylOJT3lL
 WcJt+Yv4ESMc7ENz5MRZXu5pchK9aAwpYgT9ERz3PKTi9oFguTqjYbL+HdkMaCw3VAw5
 Jcz95KWkueWKXO7Ieg4iiA1kn+piUJJg5LthmOPpQGYwowZ5FJvfpjYpUJZGhvj6Xj/W
 e5swry7qVMsRw6f8HJ90c7MKq5y/Ak+nM2O8O9YNcYll78+7YNDUyUWcYRRc76tsDcw6
 kyUZAkz8cKjDmD3QsJnAV9v53/qSa3ZmxFRFDxCE7DmPoV/lXfHBin5xqUqrJ7Rl3EWS Bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c0euwasj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 15:22:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1967E10002A;
 Wed,  9 Sep 2020 15:22:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E4C352AD9E9;
 Wed,  9 Sep 2020 15:22:42 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 9 Sep 2020 15:22:42 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 9 Sep 2020 15:22:36 +0200
Message-ID: <20200909152228.1.I4ae7c1ab59fed4861cde9322a8d12167c9d0187a@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-09_07:2020-09-09,
 2020-09-09 signatures=0
Cc: Peng Fan <peng.fan@nxp.com>, Mingming lee <mingming.lee@mediatek.com>,
 Simon Glass <sjg@chromium.org>, Kever Yang <kever.yang@rock-chips.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 1/4] fastboot: mmc: Add
	CONFIG_FASTBOOT_MMC_USER_SUPPORT
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

Split userdata and boot partition support for eMMC update
and correct the description (update is supported).

The new configuration CONFIG_FASTBOOT_MMC_USER_SUPPORT
allows to activate support of userdata partition update,
based on target name=CONFIG_FASTBOOT_MMC_USER_NAME

This patch also removes the unnecessary dependency with
ARCH_MEDIATEK and EFI_PARTITION.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 configs/mt8518_ap1_emmc_defconfig |  1 +
 drivers/fastboot/Kconfig          | 22 +++++++++++++++++-----
 drivers/fastboot/fb_mmc.c         |  9 ++++++---
 3 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/configs/mt8518_ap1_emmc_defconfig b/configs/mt8518_ap1_emmc_defconfig
index b95d2c683a..d5fb0ccd48 100644
--- a/configs/mt8518_ap1_emmc_defconfig
+++ b/configs/mt8518_ap1_emmc_defconfig
@@ -25,6 +25,7 @@ CONFIG_FASTBOOT_BUF_SIZE=0x1E00000
 CONFIG_FASTBOOT_FLASH=y
 CONFIG_FASTBOOT_FLASH_MMC_DEV=0
 CONFIG_FASTBOOT_MMC_BOOT1_SUPPORT=y
+CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
 CONFIG_DM_MMC=y
 CONFIG_MMC_HS200_SUPPORT=y
 CONFIG_MMC_MTK=y
diff --git a/drivers/fastboot/Kconfig b/drivers/fastboot/Kconfig
index d4436dfc91..45e07d05e0 100644
--- a/drivers/fastboot/Kconfig
+++ b/drivers/fastboot/Kconfig
@@ -124,14 +124,26 @@ config FASTBOOT_MMC_BOOT1_NAME
 	  defined here.
 	  The default target name for updating EMMC_BOOT1 is "mmc0boot0".
 
+config FASTBOOT_MMC_USER_SUPPORT
+	bool "Enable eMMC userdata partition flash/erase"
+	depends on FASTBOOT_FLASH_MMC
+	help
+	  Define this to enable the support "flash" and "erase" command on
+	  eMMC userdata. The "flash" command only update the MBR and GPT
+	  header when CONFIG_EFI_PARTITION is supported.
+	  The "erase" command erase all the userdata.
+	  This occurs when the specified "partition name" on the
+	  fastboot command line matches the value CONFIG_FASTBOOT_MMC_USER_NAME.
+
 config FASTBOOT_MMC_USER_NAME
-	string "Target name for erasing EMMC_USER"
-	depends on FASTBOOT_FLASH_MMC && EFI_PARTITION && ARCH_MEDIATEK
+	string "Target name for updating EMMC_USER"
+	depends on FASTBOOT_MMC_USER_SUPPORT
 	default "mmc0"
 	help
-	  The fastboot "erase" command supports erasing EMMC_USER. This occurs
-	  when the specified "EMMC_USER name" on the "fastboot erase" commands
-	  match the value defined here.
+	  The fastboot "flash" and "erase" command supports EMMC_USER.
+	  This occurs when the specified "EMMC_USER name" on the
+	  "fastboot flash" and the "fastboot erase" commands match the value
+	  defined here.
 	  The default target name for erasing EMMC_USER is "mmc0".
 
 config FASTBOOT_GPT_NAME
diff --git a/drivers/fastboot/fb_mmc.c b/drivers/fastboot/fb_mmc.c
index b2f8932e1c..ab6674cac2 100644
--- a/drivers/fastboot/fb_mmc.c
+++ b/drivers/fastboot/fb_mmc.c
@@ -132,7 +132,8 @@ static void write_raw_image(struct blk_desc *dev_desc,
 	fastboot_okay(NULL, response);
 }
 
-#ifdef CONFIG_FASTBOOT_MMC_BOOT1_SUPPORT
+#if defined(CONFIG_FASTBOOT_MMC_BOOT1_SUPPORT) || \
+	defined(CONFIG_FASTBOOT_MMC_USER_SUPPORT)
 static int fb_mmc_erase_mmc_hwpart(struct blk_desc *dev_desc)
 {
 	lbaint_t blks;
@@ -151,7 +152,9 @@ static int fb_mmc_erase_mmc_hwpart(struct blk_desc *dev_desc)
 
 	return 0;
 }
+#endif
 
+#ifdef CONFIG_FASTBOOT_MMC_BOOT1_SUPPORT
 static void fb_mmc_boot1_ops(struct blk_desc *dev_desc, void *buffer,
 			     u32 buff_sz, char *response)
 {
@@ -427,7 +430,7 @@ void fastboot_mmc_flash_write(const char *cmd, void *download_buffer,
 #endif
 
 #if CONFIG_IS_ENABLED(EFI_PARTITION)
-#ifndef CONFIG_FASTBOOT_MMC_USER_NAME
+#ifndef CONFIG_FASTBOOT_MMC_USER_SUPPORT
 	if (strcmp(cmd, CONFIG_FASTBOOT_GPT_NAME) == 0) {
 #else
 	if (strcmp(cmd, CONFIG_FASTBOOT_GPT_NAME) == 0 ||
@@ -551,7 +554,7 @@ void fastboot_mmc_erase(const char *cmd, char *response)
 	}
 #endif
 
-#ifdef CONFIG_FASTBOOT_MMC_USER_NAME
+#ifdef CONFIG_FASTBOOT_MMC_USER_SUPPORT
 	if (strcmp(cmd, CONFIG_FASTBOOT_MMC_USER_NAME) == 0) {
 		/* erase EMMC userdata */
 		if (fb_mmc_erase_mmc_hwpart(dev_desc))
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
