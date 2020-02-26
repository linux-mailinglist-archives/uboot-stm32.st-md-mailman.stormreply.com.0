Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8EB16FAB6
	for <lists+uboot-stm32@lfdr.de>; Wed, 26 Feb 2020 10:29:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E16C2C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 26 Feb 2020 09:29:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20331C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2020 09:29:12 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01Q9ERHM031343; Wed, 26 Feb 2020 10:28:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Dy8+ywLBJB64ZEDcwQGuqJIW19S9e3I59aMGo6VIcNw=;
 b=sxHe8RGMyeI6MkUxkNocrGu/MiJbxyma0yJ2wvftlx8VxoKSeY049uXTPSxkOelsJ93u
 ht0TmJBw7Uc2Rdo/+B+YesEQvcQcuI1MuGegTbredWarbkETBfstbaj7xk71qAANE2ZV
 t4n5Eykt2o7OLwd9rUqArYTef5LqykchWskrLNmCR+EMpsnnN3fm8d6IwmGM1Rj1bg/1
 1pa6gkPJZgV9HlWNflPREOO891u5t56vQ3ROnKhkqfTCeQx6Xx2nM6Hn36TJYrboTTMR
 t2SW+ITA4CHKtW0cJbYb53jMDYrB/1hvesz0J7uK05jRP6pz5Ucwvu0vprovxi6ml4pD cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ydcnm2uca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 10:28:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A3E2310003D;
 Wed, 26 Feb 2020 10:28:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 85B722AEC5D;
 Wed, 26 Feb 2020 10:28:45 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 26 Feb 2020 10:28:44 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 26 Feb 2020 10:28:41 +0100
Message-ID: <20200226092842.5413-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-26_02:2020-02-25,
 2020-02-26 signatures=0
Cc: Marek Vasut <marex@denx.de>, Pascal Linder <pascal.linder@edu.hefr.ch>,
 Simon Glass <sjg@chromium.org>, Kever Yang <kever.yang@rock-chips.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Lukasz Majewski <lukma@denx.de>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Holger Brunck <holger.brunck@ch.abb.com>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>
Subject: [Uboot-stm32] [PATCH 1/2] configs: migrate CONFIG_SET_DFU_ALT_INFO
	to defconfigs
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

Move CONFIG_SET_DFU_ALT_INFO into Kconfig done by moveconfig.py.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 configs/odroid-xu3_defconfig            | 1 +
 configs/odroid_defconfig                | 1 +
 configs/stm32mp15_basic_defconfig       | 1 +
 configs/stm32mp15_dhcom_basic_defconfig | 1 +
 configs/stm32mp15_optee_defconfig       | 1 +
 configs/stm32mp15_trusted_defconfig     | 1 +
 drivers/dfu/Kconfig                     | 5 +++++
 include/configs/odroid.h                | 1 -
 include/configs/odroid_xu3.h            | 1 -
 include/configs/stm32mp1.h              | 2 --
 scripts/config_whitelist.txt            | 1 -
 11 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/configs/odroid-xu3_defconfig b/configs/odroid-xu3_defconfig
index 2e982e1b53..1a2183ce19 100644
--- a/configs/odroid-xu3_defconfig
+++ b/configs/odroid-xu3_defconfig
@@ -39,6 +39,7 @@ CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
 CONFIG_ADC=y
 CONFIG_ADC_EXYNOS=y
 CONFIG_DFU_MMC=y
+CONFIG_SET_DFU_ALT_INFO=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_MMC_DW=y
 CONFIG_MTD=y
diff --git a/configs/odroid_defconfig b/configs/odroid_defconfig
index e4392e477e..345cc3b940 100644
--- a/configs/odroid_defconfig
+++ b/configs/odroid_defconfig
@@ -40,6 +40,7 @@ CONFIG_DEFAULT_DEVICE_TREE="exynos4412-odroid"
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
 CONFIG_DFU_MMC=y
+CONFIG_SET_DFU_ALT_INFO=y
 CONFIG_SYS_I2C_S3C24X0=y
 CONFIG_MMC_DW=y
 CONFIG_MMC_SDHCI=y
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index f691306800..4efb1bf9c2 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -71,6 +71,7 @@ CONFIG_DFU_MMC=y
 CONFIG_DFU_RAM=y
 CONFIG_DFU_MTD=y
 CONFIG_DFU_VIRT=y
+CONFIG_SET_DFU_ALT_INFO=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
 CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
 CONFIG_FASTBOOT_BUF_SIZE=0x02000000
diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
index 921dea242a..9b5e54748d 100644
--- a/configs/stm32mp15_dhcom_basic_defconfig
+++ b/configs/stm32mp15_dhcom_basic_defconfig
@@ -70,6 +70,7 @@ CONFIG_SPL_BLOCK_CACHE=y
 CONFIG_DFU_MMC=y
 CONFIG_DFU_RAM=y
 CONFIG_DFU_VIRT=y
+CONFIG_SET_DFU_ALT_INFO=y
 CONFIG_DM_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_STM32=y
 CONFIG_DM_I2C=y
diff --git a/configs/stm32mp15_optee_defconfig b/configs/stm32mp15_optee_defconfig
index 521b24e2cb..54135b28aa 100644
--- a/configs/stm32mp15_optee_defconfig
+++ b/configs/stm32mp15_optee_defconfig
@@ -58,6 +58,7 @@ CONFIG_DFU_MMC=y
 CONFIG_DFU_RAM=y
 CONFIG_DFU_MTD=y
 CONFIG_DFU_VIRT=y
+CONFIG_SET_DFU_ALT_INFO=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
 CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
 CONFIG_FASTBOOT_BUF_SIZE=0x02000000
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index c8b328d01a..d7d0b6c296 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -57,6 +57,7 @@ CONFIG_DFU_MMC=y
 CONFIG_DFU_RAM=y
 CONFIG_DFU_MTD=y
 CONFIG_DFU_VIRT=y
+CONFIG_SET_DFU_ALT_INFO=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
 CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
 CONFIG_FASTBOOT_BUF_SIZE=0x02000000
diff --git a/drivers/dfu/Kconfig b/drivers/dfu/Kconfig
index 174fb588a6..5d45d7d7c2 100644
--- a/drivers/dfu/Kconfig
+++ b/drivers/dfu/Kconfig
@@ -81,5 +81,10 @@ config DFU_VIRT
 	  used at board level to manage specific behavior
 	  (OTP update for example).
 
+config SET_DFU_ALT_INFO
+	bool "Dynamic set of DFU alternate information"
+	help
+	  This option allows to call the function set_dfu_alt_info to
+	  dynamically build dfu_alt_info in board.
 endif
 endmenu
diff --git a/include/configs/odroid.h b/include/configs/odroid.h
index a7e2a3d9a2..4044365328 100644
--- a/include/configs/odroid.h
+++ b/include/configs/odroid.h
@@ -64,7 +64,6 @@
 	""PARTS_BOOT" part 0 1;" \
 	""PARTS_ROOT" part 0 2\0" \
 
-#define CONFIG_SET_DFU_ALT_INFO
 #define CONFIG_SET_DFU_ALT_BUF_LEN	(SZ_1K)
 
 #define CONFIG_DFU_ALT_BOOT_EMMC \
diff --git a/include/configs/odroid_xu3.h b/include/configs/odroid_xu3.h
index 47c30543f8..564319c231 100644
--- a/include/configs/odroid_xu3.h
+++ b/include/configs/odroid_xu3.h
@@ -76,7 +76,6 @@
 
 /* Enable: board/samsung/common/misc.c to use set_dfu_alt_info() */
 #define CONFIG_MISC_COMMON
-#define CONFIG_SET_DFU_ALT_INFO
 #define CONFIG_SET_DFU_ALT_BUF_LEN	(SZ_1K)
 
 /* Set soc_rev, soc_id, board_rev, board_name, fdtfile */
diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index 42717c167e..592638072a 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -90,8 +90,6 @@
 #define CONFIG_SYS_MTDPARTS_RUNTIME
 #endif
 
-#define CONFIG_SET_DFU_ALT_INFO
-
 #ifdef CONFIG_DM_VIDEO
 #define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_BMP_16BPP
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index 405c62e9be..85d55b182e 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -1529,7 +1529,6 @@ CONFIG_SETUP_MEMORY_TAGS
 CONFIG_SET_BIST
 CONFIG_SET_BOOTARGS
 CONFIG_SET_DFU_ALT_BUF_LEN
-CONFIG_SET_DFU_ALT_INFO
 CONFIG_SFIO
 CONFIG_SF_DATAFLASH
 CONFIG_SGI_IP28
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
