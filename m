Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A987427AABF
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Sep 2020 11:30:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66A2EC36B37;
	Mon, 28 Sep 2020 09:30:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51BA6C36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Sep 2020 09:30:36 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08S9MGIe014167; Mon, 28 Sep 2020 11:30:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=pX2AbuUU6pTruuNrl3J1nkpmNzeWE+Al+sbs+xTiG2A=;
 b=b4KlxsL4dzZnJjRTyGCAowphNom4BSJKzqHMM8qyErjSzG6aLwn7zB6bOUYgZt5oI2Eu
 Z57pNMb8DoeK8JT0B1yr/k1bJV7XrYCyx8Fe3AmSMTa60EUu4aF+jsCuuq2xRfMb5eaN
 vIE3XBuOToDM0vnmnSmfZohgmwxCib/N6ElzEoe4btMSk4UFIwlBuEjsQCuXjiMYHyJY
 yYW1GGPGhPTKHuhZCratV2K/vkPXesJoYd+ppVGFm44z3kITL6kXb841/WUx5ImbxTJK
 HPyqTpUMTOZaoTiWtu9lAq/Jo5W4aF9jDAqA1PyOO08k1/ZkgbWvqD5M1S/JrbqVNauK Aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33sts7j408-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Sep 2020 11:30:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 007FC10002A;
 Mon, 28 Sep 2020 11:30:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC6AA2AD2B3;
 Mon, 28 Sep 2020 11:30:18 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 28 Sep 2020 11:30:18 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 28 Sep 2020 11:30:14 +0200
Message-ID: <20200928093017.19053-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-28_07:2020-09-24,
 2020-09-28 signatures=0
Cc: Marek Vasut <marex@denx.de>, Stefan Roese <sr@denx.de>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Troy Kisky <troy.kisky@boundarydevices.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Holger Brunck <holger.brunck@ch.abb.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Thomas Hebb <tommyhebb@gmail.com>, Ramon Fried <rfried.dev@gmail.com>,
 Fabio Estevam <fabio.estevam@nxp.com>, Anatolij Gustschin <agust@denx.de>,
 Adam Ford <aford173@gmail.com>, Olaf Mandel <o.mandel@menlosystems.com>
Subject: [Uboot-stm32] [PATCH 1/3] configs: migrate CONFIG_VIDEO_BMP_GZIP to
	defconfigs
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

Done with:
./tools/moveconfig.py VIDEO_BMP_GZIP

The 3 suspicious migration because CMD_BMP and SPLASH_SCREEN
are not activated in these defconfigs:
- trats_defconfig
- s5pc210_universal_defconfig
- trats2_defconfig

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 README                                  | 6 ------
 configs/m53menlo_defconfig              | 1 +
 configs/mx23evk_defconfig               | 1 +
 configs/mx28evk_auart_console_defconfig | 1 +
 configs/mx28evk_defconfig               | 1 +
 configs/mx28evk_nand_defconfig          | 1 +
 configs/mx28evk_spi_defconfig           | 1 +
 configs/mx6qsabrelite_defconfig         | 1 +
 configs/nitrogen6dl2g_defconfig         | 1 +
 configs/nitrogen6dl_defconfig           | 1 +
 configs/nitrogen6q2g_defconfig          | 1 +
 configs/nitrogen6q_defconfig            | 1 +
 configs/nitrogen6s1g_defconfig          | 1 +
 configs/nitrogen6s_defconfig            | 1 +
 drivers/video/Kconfig                   | 8 ++++++++
 include/configs/m53menlo.h              | 1 -
 include/configs/mx23evk.h               | 1 -
 include/configs/mx28evk.h               | 1 -
 include/configs/nitrogen6x.h            | 1 -
 include/configs/s5pc210_universal.h     | 1 -
 include/configs/trats.h                 | 1 -
 include/configs/trats2.h                | 1 -
 scripts/config_whitelist.txt            | 1 -
 23 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/README b/README
index 6cb0567ba6..5104245082 100644
--- a/README
+++ b/README
@@ -1250,12 +1250,6 @@ The following options need to be configured:
 		Enables an 'i2c edid' command which can read EDID
 		information over I2C from an attached LCD display.
 
-- Gzip compressed BMP image support: CONFIG_VIDEO_BMP_GZIP
-
-		If this option is set, additionally to standard BMP
-		images, gzipped BMP images can be displayed via the
-		splashscreen support or the bmp command.
-
 - Run length encoded BMP image (RLE8) support: CONFIG_VIDEO_BMP_RLE8
 
 		If this option is set, 8-bit RLE compressed BMP images
diff --git a/configs/m53menlo_defconfig b/configs/m53menlo_defconfig
index db3a739af1..26e4a885b3 100644
--- a/configs/m53menlo_defconfig
+++ b/configs/m53menlo_defconfig
@@ -104,5 +104,6 @@ CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASHIMAGE_GUARD=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_SPLASH_SOURCE=y
+CONFIG_VIDEO_BMP_GZIP=y
 CONFIG_WATCHDOG_TIMEOUT_MSECS=8000
 CONFIG_IMX_WATCHDOG=y
diff --git a/configs/mx23evk_defconfig b/configs/mx23evk_defconfig
index 51f4a0fb73..67d8f6754d 100644
--- a/configs/mx23evk_defconfig
+++ b/configs/mx23evk_defconfig
@@ -39,4 +39,5 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_VIDEO=y
 CONFIG_SPLASH_SCREEN=y
+CONFIG_VIDEO_BMP_GZIP=y
 CONFIG_OF_LIBFDT=y
diff --git a/configs/mx28evk_auart_console_defconfig b/configs/mx28evk_auart_console_defconfig
index 6e0a237751..bf81a8c624 100644
--- a/configs/mx28evk_auart_console_defconfig
+++ b/configs/mx28evk_auart_console_defconfig
@@ -58,4 +58,5 @@ CONFIG_USB_ETHER_ASIX=y
 CONFIG_USB_ETHER_SMSC95XX=y
 CONFIG_VIDEO=y
 CONFIG_SPLASH_SCREEN=y
+CONFIG_VIDEO_BMP_GZIP=y
 CONFIG_OF_LIBFDT=y
diff --git a/configs/mx28evk_defconfig b/configs/mx28evk_defconfig
index abfdb26b2d..1c3db124b9 100644
--- a/configs/mx28evk_defconfig
+++ b/configs/mx28evk_defconfig
@@ -58,4 +58,5 @@ CONFIG_USB_ETHER_ASIX=y
 CONFIG_USB_ETHER_SMSC95XX=y
 CONFIG_VIDEO=y
 CONFIG_SPLASH_SCREEN=y
+CONFIG_VIDEO_BMP_GZIP=y
 CONFIG_OF_LIBFDT=y
diff --git a/configs/mx28evk_nand_defconfig b/configs/mx28evk_nand_defconfig
index 8aecb8bd44..ae1d02ae81 100644
--- a/configs/mx28evk_nand_defconfig
+++ b/configs/mx28evk_nand_defconfig
@@ -59,4 +59,5 @@ CONFIG_USB_ETHER_ASIX=y
 CONFIG_USB_ETHER_SMSC95XX=y
 CONFIG_VIDEO=y
 CONFIG_SPLASH_SCREEN=y
+CONFIG_VIDEO_BMP_GZIP=y
 CONFIG_OF_LIBFDT=y
diff --git a/configs/mx28evk_spi_defconfig b/configs/mx28evk_spi_defconfig
index c4cba183bf..85d328de66 100644
--- a/configs/mx28evk_spi_defconfig
+++ b/configs/mx28evk_spi_defconfig
@@ -55,4 +55,5 @@ CONFIG_USB_ETHER_ASIX=y
 CONFIG_USB_ETHER_SMSC95XX=y
 CONFIG_VIDEO=y
 CONFIG_SPLASH_SCREEN=y
+CONFIG_VIDEO_BMP_GZIP=y
 CONFIG_OF_LIBFDT=y
diff --git a/configs/mx6qsabrelite_defconfig b/configs/mx6qsabrelite_defconfig
index 6e7193e411..9bdafe2372 100644
--- a/configs/mx6qsabrelite_defconfig
+++ b/configs/mx6qsabrelite_defconfig
@@ -82,3 +82,4 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_GZIP=y
diff --git a/configs/nitrogen6dl2g_defconfig b/configs/nitrogen6dl2g_defconfig
index 9615e1f506..fda334173b 100644
--- a/configs/nitrogen6dl2g_defconfig
+++ b/configs/nitrogen6dl2g_defconfig
@@ -83,3 +83,4 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_GZIP=y
diff --git a/configs/nitrogen6dl_defconfig b/configs/nitrogen6dl_defconfig
index 695f9be326..2d85352e88 100644
--- a/configs/nitrogen6dl_defconfig
+++ b/configs/nitrogen6dl_defconfig
@@ -83,3 +83,4 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_GZIP=y
diff --git a/configs/nitrogen6q2g_defconfig b/configs/nitrogen6q2g_defconfig
index 2d72847d38..8e78e376c0 100644
--- a/configs/nitrogen6q2g_defconfig
+++ b/configs/nitrogen6q2g_defconfig
@@ -85,3 +85,4 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_GZIP=y
diff --git a/configs/nitrogen6q_defconfig b/configs/nitrogen6q_defconfig
index 4f4d6f8547..e8daecb719 100644
--- a/configs/nitrogen6q_defconfig
+++ b/configs/nitrogen6q_defconfig
@@ -85,3 +85,4 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_GZIP=y
diff --git a/configs/nitrogen6s1g_defconfig b/configs/nitrogen6s1g_defconfig
index 8508206ea8..3ccb1bdef8 100644
--- a/configs/nitrogen6s1g_defconfig
+++ b/configs/nitrogen6s1g_defconfig
@@ -83,3 +83,4 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_GZIP=y
diff --git a/configs/nitrogen6s_defconfig b/configs/nitrogen6s_defconfig
index 1ee429a948..3a47d5c3fb 100644
--- a/configs/nitrogen6s_defconfig
+++ b/configs/nitrogen6s_defconfig
@@ -83,3 +83,4 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_GZIP=y
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index e2e1f9c476..63638074ca 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -939,4 +939,12 @@ config SPLASH_SOURCE
 	  In case the environment variable "splashfile" is not defined the
 	  default name 'splash.bmp' will be used.
 
+config VIDEO_BMP_GZIP
+	bool "Gzip compressed BMP image support"
+	depends on CMD_BMP || SPLASH_SCREEN
+	help
+	  If this option is set, additionally to standard BMP
+	  images, gzipped BMP images can be displayed via the
+	  splashscreen support or the bmp command.
+
 endmenu
diff --git a/include/configs/m53menlo.h b/include/configs/m53menlo.h
index c15e7d22bc..f274b96f20 100644
--- a/include/configs/m53menlo.h
+++ b/include/configs/m53menlo.h
@@ -127,7 +127,6 @@
  * LCD
  */
 #define CONFIG_VIDEO_BMP_RLE8
-#define CONFIG_VIDEO_BMP_GZIP
 #define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_SYS_VIDEO_LOGO_MAX_SIZE	(2 << 20)
diff --git a/include/configs/mx23evk.h b/include/configs/mx23evk.h
index 8f170b2529..bebaf5a868 100644
--- a/include/configs/mx23evk.h
+++ b/include/configs/mx23evk.h
@@ -33,7 +33,6 @@
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_BMP_RLE8
-#define CONFIG_VIDEO_BMP_GZIP
 #define CONFIG_SYS_VIDEO_LOGO_MAX_SIZE	(512 << 10)
 #endif
 
diff --git a/include/configs/mx28evk.h b/include/configs/mx28evk.h
index d65f6a900f..0b71debc73 100644
--- a/include/configs/mx28evk.h
+++ b/include/configs/mx28evk.h
@@ -54,7 +54,6 @@
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_BMP_RLE8
-#define CONFIG_VIDEO_BMP_GZIP
 #define CONFIG_SYS_VIDEO_LOGO_MAX_SIZE	(512 << 10)
 #endif
 
diff --git a/include/configs/nitrogen6x.h b/include/configs/nitrogen6x.h
index f1780b2391..ed43963bf4 100644
--- a/include/configs/nitrogen6x.h
+++ b/include/configs/nitrogen6x.h
@@ -57,7 +57,6 @@
 
 /* Framebuffer and LCD */
 #define CONFIG_VIDEO_BMP_RLE8
-#define CONFIG_VIDEO_BMP_GZIP
 #define CONFIG_SYS_VIDEO_LOGO_MAX_SIZE (6 * 1024 * 1024)
 #define CONFIG_BMP_16BPP
 #define CONFIG_IMX_HDMI
diff --git a/include/configs/s5pc210_universal.h b/include/configs/s5pc210_universal.h
index da6ed975c3..673797ea01 100644
--- a/include/configs/s5pc210_universal.h
+++ b/include/configs/s5pc210_universal.h
@@ -160,7 +160,6 @@ int universal_spi_read(void);
  */
 #define CONFIG_BMP_16BPP
 #define CONFIG_LD9040
-#define CONFIG_VIDEO_BMP_GZIP
 #define CONFIG_SYS_VIDEO_LOGO_MAX_SIZE ((500 * 160 * 4) + 54)
 
 #endif	/* __CONFIG_H */
diff --git a/include/configs/trats.h b/include/configs/trats.h
index 3202627a7d..acfa9fe7d9 100644
--- a/include/configs/trats.h
+++ b/include/configs/trats.h
@@ -181,7 +181,6 @@
 #define CONFIG_BMP_16BPP
 #define CONFIG_FB_ADDR		0x52504000
 #define CONFIG_EXYNOS_MIPI_DSIM
-#define CONFIG_VIDEO_BMP_GZIP
 #define CONFIG_SYS_VIDEO_LOGO_MAX_SIZE  ((500 * 160 * 4) + 54)
 
 #endif	/* __CONFIG_H */
diff --git a/include/configs/trats2.h b/include/configs/trats2.h
index 14549dd1a0..06d80ce698 100644
--- a/include/configs/trats2.h
+++ b/include/configs/trats2.h
@@ -164,7 +164,6 @@
 #define CONFIG_BMP_16BPP
 #define CONFIG_FB_ADDR		0x52504000
 #define CONFIG_EXYNOS_MIPI_DSIM
-#define CONFIG_VIDEO_BMP_GZIP
 #define CONFIG_SYS_VIDEO_LOGO_MAX_SIZE ((500 * 160 * 4) + 54)
 
 #endif	/* __CONFIG_H */
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index 093e432efc..c13a366a56 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -4068,7 +4068,6 @@ CONFIG_VEXPRESS_EXTENDED_MEMORY_MAP
 CONFIG_VEXPRESS_ORIGINAL_MEMORY_MAP
 CONFIG_VID
 CONFIG_VIDEO_BCM2835
-CONFIG_VIDEO_BMP_GZIP
 CONFIG_VIDEO_BMP_LOGO
 CONFIG_VIDEO_BMP_RLE8
 CONFIG_VIDEO_CORALP
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
