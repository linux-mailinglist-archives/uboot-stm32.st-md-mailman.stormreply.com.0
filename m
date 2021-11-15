Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DFA450891
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Nov 2021 16:32:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4765C5EC57;
	Mon, 15 Nov 2021 15:32:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D056C5EC56
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Nov 2021 15:32:58 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AFFCkoF014093;
 Mon, 15 Nov 2021 16:32:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=2QP+hkDN2dZRElD+EomZiFNS1oi5nHH6jMqoJGbldKE=;
 b=D6xp8KM8HDSQqtqDAZY2tBDEhg9AgeO50U8F8JNMjscFxWRB2EKQ4IooVl0uYK7cXRVu
 33E7If5CB2900mlFx29hNN0nW+8MRNHDVzYYYMIW+jaDCTUcgE8wBuRIZ15zC2S5My0G
 rUa92Aeh7pylvoebnPid5ZzYReeWG1HDgjC72dPAXjTmxp4eQnqCZiPHBE2aZWAepawz
 /w7k9KCej0Sjiz/gUoBWV/m4nVjIgO8EAkXLqeRgrk087UQUQ5xcn9MTbvoNvZ/GRCjT
 ip2BQd25XfdbKUoIN0OakL3lPLhL1v+R/bOTmXQzDpSQSVyzBeHbNjjmW/rgVnTQyjHd iQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cben34p6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Nov 2021 16:32:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EA884100034;
 Mon, 15 Nov 2021 16:32:36 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DF04F2A4D8E;
 Mon, 15 Nov 2021 16:32:36 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 15 Nov 2021 16:32:36
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Nov 2021 16:32:17 +0100
Message-ID: <20211115163155.1.I484cf4a475d46527cfefd4ff549a22ac23920cdc@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211115153223.563377-1-patrick.delaunay@foss.st.com>
References: <20211115153223.563377-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_10,2021-11-15_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Matthias Brugger <mbrugger@suse.com>, Joel Peshkin <joel.peshkin@broadcom.com>,
 Igor Opaniuk <igor.opaniuk@foundries.io>, Stefan Roese <sr@denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Artem Lapkin <email2tema@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Asherah Connor <ashe@kivikakk.ee>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 Thomas Huth <thuth@redhat.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Jorge Ramirez-Ortiz <jorge@foundries.io>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>, Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 1/7] Convert CONFIG_LCD_DT_SIMPLEFB to Kconfig
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

This converts the following to Kconfig:
   CONFIG_LCD_DT_SIMPLEFB

This patch also renames this config to CONFIG_FDT_SIMPLEFB as the code in
common/lcd_simplefb.c support CONFIG_LCD and CONFIG_VIDEO.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 common/Kconfig                 | 9 +++++++++
 common/Makefile                | 2 +-
 configs/rpi_0_w_defconfig      | 1 +
 configs/rpi_2_defconfig        | 1 +
 configs/rpi_3_32b_defconfig    | 1 +
 configs/rpi_3_b_plus_defconfig | 1 +
 configs/rpi_3_defconfig        | 1 +
 configs/rpi_4_32b_defconfig    | 1 +
 configs/rpi_4_defconfig        | 1 +
 configs/rpi_arm64_defconfig    | 1 +
 configs/rpi_defconfig          | 1 +
 include/configs/rpi.h          | 1 -
 scripts/config_whitelist.txt   | 1 -
 13 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/common/Kconfig b/common/Kconfig
index fdcf4536d0..c97814c6ad 100644
--- a/common/Kconfig
+++ b/common/Kconfig
@@ -766,3 +766,12 @@ config SPL_IMAGE_SIGN_INFO
 	  Enable image_sign_info helper functions in SPL.
 
 endif
+
+config FDT_SIMPLEFB
+	bool "FDT tools for simplefb support"
+	depends on OF_LIBFDT
+	help
+	  Enable the fdt tools to manage the simple fb nodes in device tree.
+	  These functions can be used by board to indicate to the OS
+	  the presence of the simple frame buffer with associated reserved
+	  memory
diff --git a/common/Makefile b/common/Makefile
index c500bcd7d8..fed7e482e6 100644
--- a/common/Makefile
+++ b/common/Makefile
@@ -40,7 +40,7 @@ ifndef CONFIG_DM_VIDEO
 obj-$(CONFIG_LCD) += lcd.o lcd_console.o
 endif
 obj-$(CONFIG_LCD_ROTATION) += lcd_console_rotation.o
-obj-$(CONFIG_LCD_DT_SIMPLEFB) += lcd_simplefb.o
+obj-$(CONFIG_FDT_SIMPLEFB) += lcd_simplefb.o
 obj-$(CONFIG_MENU) += menu.o
 obj-$(CONFIG_UPDATE_COMMON) += update.o
 obj-$(CONFIG_USB_KEYBOARD) += usb_kbd.o
diff --git a/configs/rpi_0_w_defconfig b/configs/rpi_0_w_defconfig
index 6d76d12910..195541c6e7 100644
--- a/configs/rpi_0_w_defconfig
+++ b/configs/rpi_0_w_defconfig
@@ -13,6 +13,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_DISPLAY_CPUINFO is not set
 # CONFIG_DISPLAY_BOARDINFO is not set
 CONFIG_MISC_INIT_R=y
+CONFIG_FDT_SIMPLEFB=y
 CONFIG_SYS_PROMPT="U-Boot> "
 CONFIG_CMD_GPIO=y
 CONFIG_CMD_MMC=y
diff --git a/configs/rpi_2_defconfig b/configs/rpi_2_defconfig
index 1931607132..eb63fbdd8d 100644
--- a/configs/rpi_2_defconfig
+++ b/configs/rpi_2_defconfig
@@ -14,6 +14,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_DISPLAY_CPUINFO is not set
 # CONFIG_DISPLAY_BOARDINFO is not set
 CONFIG_MISC_INIT_R=y
+CONFIG_FDT_SIMPLEFB=y
 CONFIG_SYS_PROMPT="U-Boot> "
 CONFIG_CMD_GPIO=y
 CONFIG_CMD_MMC=y
diff --git a/configs/rpi_3_32b_defconfig b/configs/rpi_3_32b_defconfig
index 060fd36da5..46102899f0 100644
--- a/configs/rpi_3_32b_defconfig
+++ b/configs/rpi_3_32b_defconfig
@@ -15,6 +15,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_DISPLAY_CPUINFO is not set
 # CONFIG_DISPLAY_BOARDINFO is not set
 CONFIG_MISC_INIT_R=y
+CONFIG_FDT_SIMPLEFB=y
 CONFIG_SYS_PROMPT="U-Boot> "
 CONFIG_CMD_GPIO=y
 CONFIG_CMD_MMC=y
diff --git a/configs/rpi_3_b_plus_defconfig b/configs/rpi_3_b_plus_defconfig
index 0a69f97342..91b63b6272 100644
--- a/configs/rpi_3_b_plus_defconfig
+++ b/configs/rpi_3_b_plus_defconfig
@@ -14,6 +14,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_DISPLAY_CPUINFO is not set
 # CONFIG_DISPLAY_BOARDINFO is not set
 CONFIG_MISC_INIT_R=y
+CONFIG_FDT_SIMPLEFB=y
 CONFIG_SYS_PROMPT="U-Boot> "
 CONFIG_CMD_GPIO=y
 CONFIG_CMD_MMC=y
diff --git a/configs/rpi_3_defconfig b/configs/rpi_3_defconfig
index 8016fe1d55..528b12ea5b 100644
--- a/configs/rpi_3_defconfig
+++ b/configs/rpi_3_defconfig
@@ -14,6 +14,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_DISPLAY_CPUINFO is not set
 # CONFIG_DISPLAY_BOARDINFO is not set
 CONFIG_MISC_INIT_R=y
+CONFIG_FDT_SIMPLEFB=y
 CONFIG_SYS_PROMPT="U-Boot> "
 CONFIG_CMD_GPIO=y
 CONFIG_CMD_MMC=y
diff --git a/configs/rpi_4_32b_defconfig b/configs/rpi_4_32b_defconfig
index 990589de64..88f7504a60 100644
--- a/configs/rpi_4_32b_defconfig
+++ b/configs/rpi_4_32b_defconfig
@@ -12,6 +12,7 @@ CONFIG_PREBOOT="pci enum; usb start;"
 # CONFIG_DISPLAY_CPUINFO is not set
 # CONFIG_DISPLAY_BOARDINFO is not set
 CONFIG_MISC_INIT_R=y
+CONFIG_FDT_SIMPLEFB=y
 CONFIG_SYS_PROMPT="U-Boot> "
 CONFIG_CMD_DFU=y
 CONFIG_CMD_GPIO=y
diff --git a/configs/rpi_4_defconfig b/configs/rpi_4_defconfig
index 0720505c6a..59a7103154 100644
--- a/configs/rpi_4_defconfig
+++ b/configs/rpi_4_defconfig
@@ -12,6 +12,7 @@ CONFIG_PREBOOT="pci enum; usb start;"
 # CONFIG_DISPLAY_CPUINFO is not set
 # CONFIG_DISPLAY_BOARDINFO is not set
 CONFIG_MISC_INIT_R=y
+CONFIG_FDT_SIMPLEFB=y
 CONFIG_SYS_PROMPT="U-Boot> "
 CONFIG_CMD_DFU=y
 CONFIG_CMD_GPIO=y
diff --git a/configs/rpi_arm64_defconfig b/configs/rpi_arm64_defconfig
index 06ae3e93b2..67dbf094ef 100644
--- a/configs/rpi_arm64_defconfig
+++ b/configs/rpi_arm64_defconfig
@@ -12,6 +12,7 @@ CONFIG_PREBOOT="pci enum; usb start;"
 # CONFIG_DISPLAY_CPUINFO is not set
 # CONFIG_DISPLAY_BOARDINFO is not set
 CONFIG_MISC_INIT_R=y
+CONFIG_FDT_SIMPLEFB=y
 CONFIG_SYS_PROMPT="U-Boot> "
 CONFIG_CMD_GPIO=y
 CONFIG_CMD_MMC=y
diff --git a/configs/rpi_defconfig b/configs/rpi_defconfig
index 8acf04d0e4..0baef3b6ab 100644
--- a/configs/rpi_defconfig
+++ b/configs/rpi_defconfig
@@ -13,6 +13,7 @@ CONFIG_USE_PREBOOT=y
 # CONFIG_DISPLAY_CPUINFO is not set
 # CONFIG_DISPLAY_BOARDINFO is not set
 CONFIG_MISC_INIT_R=y
+CONFIG_FDT_SIMPLEFB=y
 CONFIG_SYS_PROMPT="U-Boot> "
 CONFIG_CMD_GPIO=y
 CONFIG_CMD_MMC=y
diff --git a/include/configs/rpi.h b/include/configs/rpi.h
index 55768a46da..bc907acd5f 100644
--- a/include/configs/rpi.h
+++ b/include/configs/rpi.h
@@ -44,7 +44,6 @@
 /* GPIO */
 #define CONFIG_BCM2835_GPIO
 /* LCD */
-#define CONFIG_LCD_DT_SIMPLEFB
 #define CONFIG_VIDEO_BCM2835
 
 /* DFU over USB/UDC */
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index b9c1c61e13..1e1ef76175 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -699,7 +699,6 @@ CONFIG_LBA48
 CONFIG_LBDAF
 CONFIG_LCD_ALIGNMENT
 CONFIG_LCD_BMP_RLE8
-CONFIG_LCD_DT_SIMPLEFB
 CONFIG_LCD_INFO
 CONFIG_LCD_INFO_BELOW_LOGO
 CONFIG_LCD_IN_PSRAM
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
