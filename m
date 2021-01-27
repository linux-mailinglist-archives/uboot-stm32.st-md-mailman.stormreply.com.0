Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BAB305D7F
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Jan 2021 14:47:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0877DC5718C;
	Wed, 27 Jan 2021 13:47:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E6D7C5718B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Jan 2021 13:47:15 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10RDh4rL006418; Wed, 27 Jan 2021 14:46:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=RIHnknCQJ+Qg4ad0QynU3c1qkCpGSw1MzndtMBZOYR8=;
 b=iKJXyOXDmwN2b47m+PmRGV0sy33YY442TnJ/uutCCoByI4a9ug5QHZhe2ApsvQanDlrk
 pQCCcmhSGCFReJrlYaNyVMb9x7qY1TgIwKXPqz4R3ig00PeZ1YdndyC6rheVNU//8pQ/
 Pp83YF4M6jbYvo2g53Fbu4N9vRb5jVO4ltfTFgaSIPX19BeoariEsq6bYfhdBDexzETo
 1EWCWT3Qz2rGNt3KK8Jjb6lIWVTQfpiTRXw0u6W35leU3jmU/S/S6+JjFkgBLMtgQiNb
 bEfI9c4mgev8KnD5QrttkBI1WkVjYyrEaFdKXCCjj3OkJ0HlfYIXgJNkdIy53mTs6WhW NA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3689te0n8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 14:46:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C1408100039;
 Wed, 27 Jan 2021 14:46:52 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AB232243711;
 Wed, 27 Jan 2021 14:46:52 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Jan 2021 14:46:52
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 27 Jan 2021 14:46:46 +0100
Message-ID: <20210127144618.v2.1.I4ae7c1ab59fed4861cde9322a8d12167c9d0187a@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210127134649.27380-1-patrick.delaunay@foss.st.com>
References: <20210127134649.27380-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-27_05:2021-01-27,
 2021-01-27 signatures=0
Cc: Peng Fan <peng.fan@nxp.com>, Mingming lee <mingming.lee@mediatek.com>,
 Simon Glass <sjg@chromium.org>, Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Fabien Parent <fparent@baylibre.com>,
 Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>,
 Filip Brozovic <fbrozovic@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Uboot-stm32] [PATCH v2 1/4] fastboot: mmc: Add
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

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- rebase on master branch
- new impact on pumpkin_defconfig and mt8512_bm1_emmc_defconfig

 configs/mt8512_bm1_emmc_defconfig |  1 +
 configs/mt8518_ap1_emmc_defconfig |  1 +
 configs/pumpkin_defconfig         |  1 +
 drivers/fastboot/Kconfig          | 22 +++++++++++++++++-----
 drivers/fastboot/fb_mmc.c         |  9 ++++++---
 5 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/configs/mt8512_bm1_emmc_defconfig b/configs/mt8512_bm1_emmc_defconfig
index c6b3ee484b..1bda45c5d2 100644
--- a/configs/mt8512_bm1_emmc_defconfig
+++ b/configs/mt8512_bm1_emmc_defconfig
@@ -29,6 +29,7 @@ CONFIG_FASTBOOT_BUF_SIZE=0x1e00000
 CONFIG_FASTBOOT_FLASH=y
 CONFIG_FASTBOOT_FLASH_MMC_DEV=0
 CONFIG_FASTBOOT_MMC_BOOT1_SUPPORT=y
+CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
 CONFIG_DM_MMC=y
 CONFIG_MMC_HS200_SUPPORT=y
 CONFIG_MMC_MTK=y
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
diff --git a/configs/pumpkin_defconfig b/configs/pumpkin_defconfig
index cd77889eea..a9655f5abb 100644
--- a/configs/pumpkin_defconfig
+++ b/configs/pumpkin_defconfig
@@ -53,6 +53,7 @@ CONFIG_FASTBOOT_BUF_SIZE=0x4000000
 CONFIG_FASTBOOT_FLASH=y
 CONFIG_FASTBOOT_FLASH_MMC_DEV=0
 CONFIG_FASTBOOT_MMC_BOOT1_SUPPORT=y
+CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
 # CONFIG_INPUT is not set
 CONFIG_DM_MMC=y
 # CONFIG_MMC_QUIRKS is not set
diff --git a/drivers/fastboot/Kconfig b/drivers/fastboot/Kconfig
index 4352ba67a7..cb8425685f 100644
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
index 4e26cef941..b5d4c90bfc 100644
--- a/drivers/fastboot/fb_mmc.c
+++ b/drivers/fastboot/fb_mmc.c
@@ -174,7 +174,8 @@ static void write_raw_image(struct blk_desc *dev_desc,
 	fastboot_okay(NULL, response);
 }
 
-#ifdef CONFIG_FASTBOOT_MMC_BOOT1_SUPPORT
+#if defined(CONFIG_FASTBOOT_MMC_BOOT1_SUPPORT) || \
+	defined(CONFIG_FASTBOOT_MMC_USER_SUPPORT)
 static int fb_mmc_erase_mmc_hwpart(struct blk_desc *dev_desc)
 {
 	lbaint_t blks;
@@ -193,7 +194,9 @@ static int fb_mmc_erase_mmc_hwpart(struct blk_desc *dev_desc)
 
 	return 0;
 }
+#endif
 
+#ifdef CONFIG_FASTBOOT_MMC_BOOT1_SUPPORT
 static void fb_mmc_boot1_ops(struct blk_desc *dev_desc, void *buffer,
 			     u32 buff_sz, char *response)
 {
@@ -473,7 +476,7 @@ void fastboot_mmc_flash_write(const char *cmd, void *download_buffer,
 #endif
 
 #if CONFIG_IS_ENABLED(EFI_PARTITION)
-#ifndef CONFIG_FASTBOOT_MMC_USER_NAME
+#ifndef CONFIG_FASTBOOT_MMC_USER_SUPPORT
 	if (strcmp(cmd, CONFIG_FASTBOOT_GPT_NAME) == 0) {
 #else
 	if (strcmp(cmd, CONFIG_FASTBOOT_GPT_NAME) == 0 ||
@@ -603,7 +606,7 @@ void fastboot_mmc_erase(const char *cmd, char *response)
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
