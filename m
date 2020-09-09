Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF77262F18
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 15:23:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F185C424B9
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 13:23:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E18D8C3FAE4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 13:22:58 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 089DHMZu023669; Wed, 9 Sep 2020 15:22:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=qLdIk13TVyLxVo4aPuPy4pDUfcitIiqvMMcoF1ucHDk=;
 b=aTLDadZ9oYtsHfkMRKexsgoSy4b1jYA6l6brEPRJNOoIKphbIP15ywp+i9taIMnW2uck
 4w9cDoiDVdjC+O3TsvPrCQ8ub7i0lqHHPoejNhPx3mgTO9w3OlmreSm8RsgLsaVhdvTQ
 TdL6IloaE1IUM9ILZ8oHO9KPVb42d29ZsqCc18jlq16IhK9iKGU/LNWci3B5AcRoMRQr
 mFyhl/zCJ/SPj12trbYewpWe35Io6kcBFXtCYlEKUYUxA1P9cEVIjKx1NO+OF81QcR3I
 iH1VCXCPw71G5ByOwJoodYAQ8hat8o+Vhuy9fVEduW1MZw9kjeCWPY8ED1yFAPAt2gxb /Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c1jf5m1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 15:22:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E63EB100034;
 Wed,  9 Sep 2020 15:22:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D97762AD9E9;
 Wed,  9 Sep 2020 15:22:43 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 9 Sep 2020 15:22:43 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 9 Sep 2020 15:22:37 +0200
Message-ID: <20200909152228.2.Icb31b968f623dbbdccd58b5e83ffe247c5797b01@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200909152228.1.I4ae7c1ab59fed4861cde9322a8d12167c9d0187a@changeid>
References: <20200909152228.1.I4ae7c1ab59fed4861cde9322a8d12167c9d0187a@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-09_07:2020-09-09,
 2020-09-09 signatures=0
Cc: Peng Fan <peng.fan@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Mingming lee <mingming.lee@mediatek.com>, Simon Glass <sjg@chromium.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 2/4] fastboot: mmc: extend flash/erase for
	both emmc hwpart 1 and 2
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

Update the code and the configs for eMMC boot and userdata
partitions acces
- FASTBOOT_MMC_BOOT_SUPPORT: boot partition 1 and 2 (erase/write)
- FASTBOOT_MMC_BOOT1_NAME: boot partition 1, default name="mmc0boot0"
- FASTBOOT_MMC_BOOT2_NAME: boot partition 2, default name="mmc0boot1"

This patch also removes the unnecessary dependency with
ARCH_MEDIATEK and EFI_PARTITION.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 configs/mt8518_ap1_emmc_defconfig |  2 +-
 drivers/fastboot/Kconfig          | 26 ++++++++++++-----
 drivers/fastboot/fb_mmc.c         | 47 ++++++++++++++++++++-----------
 3 files changed, 50 insertions(+), 25 deletions(-)

diff --git a/configs/mt8518_ap1_emmc_defconfig b/configs/mt8518_ap1_emmc_defconfig
index d5fb0ccd48..2c760c1591 100644
--- a/configs/mt8518_ap1_emmc_defconfig
+++ b/configs/mt8518_ap1_emmc_defconfig
@@ -24,7 +24,7 @@ CONFIG_FASTBOOT_BUF_ADDR=0x56000000
 CONFIG_FASTBOOT_BUF_SIZE=0x1E00000
 CONFIG_FASTBOOT_FLASH=y
 CONFIG_FASTBOOT_FLASH_MMC_DEV=0
-CONFIG_FASTBOOT_MMC_BOOT1_SUPPORT=y
+CONFIG_FASTBOOT_MMC_BOOT_SUPPORT=y
 CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
 CONFIG_DM_MMC=y
 CONFIG_MMC_HS200_SUPPORT=y
diff --git a/drivers/fastboot/Kconfig b/drivers/fastboot/Kconfig
index 45e07d05e0..8a92e75007 100644
--- a/drivers/fastboot/Kconfig
+++ b/drivers/fastboot/Kconfig
@@ -104,18 +104,19 @@ config FASTBOOT_FLASH_NAND_TRIMFFS
 	  When flashing NAND enable the DROP_FFS flag to drop trailing all-0xff
 	  pages.
 
-config FASTBOOT_MMC_BOOT1_SUPPORT
-	bool "Enable EMMC_BOOT1 flash/erase"
-	depends on FASTBOOT_FLASH_MMC && EFI_PARTITION && ARCH_MEDIATEK
+config FASTBOOT_MMC_BOOT_SUPPORT
+	bool "Enable EMMC_BOOT flash/erase"
+	depends on FASTBOOT_FLASH_MMC
 	help
 	  The fastboot "flash" and "erase" commands normally does operations
-	  on EMMC userdata. Define this to enable the special commands to
-	  flash/erase EMMC_BOOT1.
-	  The default target name for updating EMMC_BOOT1 is "mmc0boot0".
+	  on eMMC userdata. Define this to enable the special commands to
+	  flash/erase eMMC boot partition.
+	  The default target name for updating eMMC boot partition 1/2 is
+	  CONFIG_FASTBOOT_MMC_BOOT1_NAME/CONFIG_FASTBOOT_MMC_BOOT2_NAME.
 
 config FASTBOOT_MMC_BOOT1_NAME
 	string "Target name for updating EMMC_BOOT1"
-	depends on FASTBOOT_MMC_BOOT1_SUPPORT
+	depends on FASTBOOT_MMC_BOOT_SUPPORT
 	default "mmc0boot0"
 	help
 	  The fastboot "flash" and "erase" commands support operations on
@@ -124,6 +125,17 @@ config FASTBOOT_MMC_BOOT1_NAME
 	  defined here.
 	  The default target name for updating EMMC_BOOT1 is "mmc0boot0".
 
+config FASTBOOT_MMC_BOOT2_NAME
+	string "Target name for updating EMMC_BOOT2"
+	depends on FASTBOOT_MMC_BOOT_SUPPORT
+	default "mmc0boot1"
+	help
+	  The fastboot "flash" and "erase" commands support operations on
+	  EMMC_BOOT2. This occurs when the specified "EMMC_BOOT2 name" on
+	  the "fastboot flash" and "fastboot erase" commands match the value
+	  defined here.
+	  The default target name for updating EMMC_BOOT2 is "mmc0boot1".
+
 config FASTBOOT_MMC_USER_SUPPORT
 	bool "Enable eMMC userdata partition flash/erase"
 	depends on FASTBOOT_FLASH_MMC
diff --git a/drivers/fastboot/fb_mmc.c b/drivers/fastboot/fb_mmc.c
index ab6674cac2..3dd02ee9a8 100644
--- a/drivers/fastboot/fb_mmc.c
+++ b/drivers/fastboot/fb_mmc.c
@@ -132,7 +132,7 @@ static void write_raw_image(struct blk_desc *dev_desc,
 	fastboot_okay(NULL, response);
 }
 
-#if defined(CONFIG_FASTBOOT_MMC_BOOT1_SUPPORT) || \
+#if defined(CONFIG_FASTBOOT_MMC_BOOT_SUPPORT) || \
 	defined(CONFIG_FASTBOOT_MMC_USER_SUPPORT)
 static int fb_mmc_erase_mmc_hwpart(struct blk_desc *dev_desc)
 {
@@ -154,16 +154,16 @@ static int fb_mmc_erase_mmc_hwpart(struct blk_desc *dev_desc)
 }
 #endif
 
-#ifdef CONFIG_FASTBOOT_MMC_BOOT1_SUPPORT
-static void fb_mmc_boot1_ops(struct blk_desc *dev_desc, void *buffer,
-			     u32 buff_sz, char *response)
+#ifdef CONFIG_FASTBOOT_MMC_BOOT_SUPPORT
+static void fb_mmc_boot_ops(struct blk_desc *dev_desc, void *buffer,
+			    int hwpart, u32 buff_sz, char *response)
 {
 	lbaint_t blkcnt;
 	lbaint_t blks;
 	unsigned long blksz;
 
-	// To operate on EMMC_BOOT1 (mmc0boot0), we first change the hwpart
-	if (blk_dselect_hwpart(dev_desc, 1)) {
+	// To operate on EMMC_BOOT1/2 (mmc0boot0/1) we first change the hwpart
+	if (blk_dselect_hwpart(dev_desc, hwpart)) {
 		pr_err("Failed to select hwpart\n");
 		fastboot_fail("Failed to select hwpart", response);
 		return;
@@ -182,21 +182,24 @@ static void fb_mmc_boot1_ops(struct blk_desc *dev_desc, void *buffer,
 			return;
 		}
 
-		debug("Start Flashing Image to EMMC_BOOT1...\n");
+		debug("Start Flashing Image to EMMC_BOOT%d...\n", hwpart);
 
 		blks = fb_mmc_blk_write(dev_desc, 0, blkcnt, buffer);
 
 		if (blks != blkcnt) {
-			pr_err("Failed to write EMMC_BOOT1\n");
-			fastboot_fail("Failed to write EMMC_BOOT1", response);
+			pr_err("Failed to write EMMC_BOOT%d\n", hwpart);
+			fastboot_fail("Failed to write EMMC_BOOT part",
+				      response);
 			return;
 		}
 
-		printf("........ wrote %lu bytes to EMMC_BOOT1\n",
-		       blkcnt * blksz);
+		printf("........ wrote %lu bytes to EMMC_BOOT%d\n",
+		       blkcnt * blksz, hwpart);
 	} else { /* erase */
 		if (fb_mmc_erase_mmc_hwpart(dev_desc)) {
-			fastboot_fail("Failed to erase EMMC_BOOT1", response);
+			pr_err("Failed to erase EMMC_BOOT%d\n", hwpart);
+			fastboot_fail("Failed to erase EMMC_BOOT part",
+				      response);
 			return;
 		}
 	}
@@ -421,10 +424,15 @@ void fastboot_mmc_flash_write(const char *cmd, void *download_buffer,
 		return;
 	}
 
-#ifdef CONFIG_FASTBOOT_MMC_BOOT1_SUPPORT
+#ifdef CONFIG_FASTBOOT_MMC_BOOT_SUPPORT
 	if (strcmp(cmd, CONFIG_FASTBOOT_MMC_BOOT1_NAME) == 0) {
-		fb_mmc_boot1_ops(dev_desc, download_buffer,
-				 download_bytes, response);
+		fb_mmc_boot_ops(dev_desc, download_buffer, 1,
+				download_bytes, response);
+		return;
+	}
+	if (strcmp(cmd, CONFIG_FASTBOOT_MMC_BOOT2_NAME) == 0) {
+		fb_mmc_boot_ops(dev_desc, download_buffer, 2,
+				download_bytes, response);
 		return;
 	}
 #endif
@@ -546,10 +554,15 @@ void fastboot_mmc_erase(const char *cmd, char *response)
 		return;
 	}
 
-#ifdef CONFIG_FASTBOOT_MMC_BOOT1_SUPPORT
+#ifdef CONFIG_FASTBOOT_MMC_BOOT_SUPPORT
 	if (strcmp(cmd, CONFIG_FASTBOOT_MMC_BOOT1_NAME) == 0) {
 		/* erase EMMC boot1 */
-		fb_mmc_boot1_ops(dev_desc, NULL, 0, response);
+		fb_mmc_boot_ops(dev_desc, NULL, 1, 0, response);
+		return;
+	}
+	if (strcmp(cmd, CONFIG_FASTBOOT_MMC_BOOT2_NAME) == 0) {
+		/* erase EMMC boot2 */
+		fb_mmc_boot_ops(dev_desc, NULL, 2, 0, response);
 		return;
 	}
 #endif
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
