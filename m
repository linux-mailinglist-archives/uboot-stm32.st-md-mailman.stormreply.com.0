Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8FC4208E6
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Oct 2021 12:00:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9435C5AB75;
	Mon,  4 Oct 2021 10:00:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB58CC5AB71
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Oct 2021 10:00:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1945fskd009048; 
 Mon, 4 Oct 2021 12:00:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=K5gKwAE1TklrTKnvSarXx8nxTsYsklsGXVlrYK1Sg6w=;
 b=0eE3upFA/1ISZ3vk4u6vVW4PyocQSUdyjzJsFZ5pu7khpfe8bnF12UYj/5Db8N538MVo
 JzybVPYHp9lnYsKrUAVjqv7MujB0AR62aZhpiO/ac1BaVBvFgIMIdv19zbqyMNqHbGk7
 gGsQXpwS+kuOq/K9xCKrd7aS0AWWSf53G3wjeKZSNHfT4tYvm8LNKLdcpEZy/Y944U/l
 wh8XovBs66DgcjG23fAW6GSxFvVy5NtI2VOsHeMKN3iHwNu0Ta/RcDM/qh8KB1svo5Ww
 NwbM61opfk8sKAK6l4TRHFeXNJEJt6vbvuS/dU9rE4Vt6a/gEELX/Kzy4jjmkMkMpzN6 7g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bfupph9tj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 12:00:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EECF810002A;
 Mon,  4 Oct 2021 12:00:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7033F233C6D;
 Mon,  4 Oct 2021 12:00:03 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 4 Oct 2021 12:00:02
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 4 Oct 2021 11:59:50 +0200
Message-ID: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_02,2021-10-01_02,2020-04-07_01
Cc: Stefan Roese <sr@denx.de>, Priyanka Jain <priyanka.jain@nxp.com>,
 Simon Glass <sjg@chromium.org>, Rick Chen <rick@andestech.com>,
 Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Heiko Schocher <hs@denx.de>
Subject: [Uboot-stm32] [PATCH 1/6] scripts: remove some configs in
	config_whitelist.txt
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

Remove some config finishing by _ badly added by
scripts/build-whitelist.sh when joker is used in comments.

for example:
  doc/uImage.FIT/command_syntax_extensions.txt:
     ... #ifdef CONFIG_OF_*  |	...

  cmd/nvedit.c:# error Define one of CONFIG_ENV_IS_IN_{EEPROM| \
     FLASH|MMC|FAT|EXT4|\

Remove also configs only used in comments:
- CONFIG_BOOGER in include/linux/kconfig.h
- CONFIG_COMMANDS
- CONFIG_INIT_IGNORE_ERROR
- CONFIG_REG_*
- CONFIG_HOTPLUG : drivers/watchdog/omap_wdt.c:18

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/include/asm/arch-omap5/dra7xx_iodelay.h |  8 ++++----
 include/configs/M5235EVB.h                       |  2 +-
 include/configs/dra7xx_evm.h                     |  1 -
 scripts/config_whitelist.txt                     | 14 --------------
 4 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/arch/arm/include/asm/arch-omap5/dra7xx_iodelay.h b/arch/arm/include/asm/arch-omap5/dra7xx_iodelay.h
index ea2f113f98..df392a2714 100644
--- a/arch/arm/include/asm/arch-omap5/dra7xx_iodelay.h
+++ b/arch/arm/include/asm/arch-omap5/dra7xx_iodelay.h
@@ -11,7 +11,7 @@
 
 #include <asm/arch/sys_proto.h>
 
-/* CONFIG_REG_0 */
+/* CFG REG_0 */
 #define CFG_REG_0_OFFSET		0xC
 #define CFG_REG_ROM_READ_SHIFT		1
 #define CFG_REG_ROM_READ_MASK		(1 << 1)
@@ -22,18 +22,18 @@
 #define CFG_REG_ROM_READ_START		(1 << 1)
 #define CFG_REG_ROM_READ_END		(0 << 1)
 
-/* CONFIG_REG_2 */
+/* CFG REG_2 */
 #define CFG_REG_2_OFFSET		0x14
 #define CFG_REG_REFCLK_PERIOD_SHIFT	0
 #define CFG_REG_REFCLK_PERIOD_MASK	(0xFFFF << 0)
 #define CFG_REG_REFCLK_PERIOD		0x2EF
 
-/* CONFIG_REG_8 */
+/* CFG REG_8 */
 #define CFG_REG_8_OFFSET		0x2C
 #define CFG_IODELAY_UNLOCK_KEY		0x0000AAAA
 #define CFG_IODELAY_LOCK_KEY		0x0000AAAB
 
-/* CONFIG_REG_3/4 */
+/* CFG REG_3/4 */
 #define CFG_REG_3_OFFSET	0x18
 #define CFG_REG_4_OFFSET	0x1C
 #define CFG_REG_DLY_CNT_SHIFT	16
diff --git a/include/configs/M5235EVB.h b/include/configs/M5235EVB.h
index f983281cc1..b37c915538 100644
--- a/include/configs/M5235EVB.h
+++ b/include/configs/M5235EVB.h
@@ -54,7 +54,7 @@
 #define CONFIG_SYS_I2C_PINMUX_CLR	~(GPIO_PAR_FECI2C_SCL_MASK | GPIO_PAR_FECI2C_SDA_MASK)
 #define CONFIG_SYS_I2C_PINMUX_SET	(GPIO_PAR_FECI2C_SCL_I2CSCL | GPIO_PAR_FECI2C_SDA_I2CSDA)
 
-/* this must be included AFTER the definition of CONFIG_COMMANDS (if any) */
+/* this must be included AFTER the definition of CONFIG COMMANDS (if any) */
 #define CONFIG_BOOTFILE		"u-boot.bin"
 #ifdef CONFIG_MCFFEC
 #	define CONFIG_IPADDR	192.162.1.2
diff --git a/include/configs/dra7xx_evm.h b/include/configs/dra7xx_evm.h
index 361ee9663d..16766943ab 100644
--- a/include/configs/dra7xx_evm.h
+++ b/include/configs/dra7xx_evm.h
@@ -113,7 +113,6 @@
 #define CONFIG_SYS_MAX_FLASH_SECT	512
 #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
 #define CONFIG_SYS_FLASH_SIZE		(64 * 1024 * 1024) /* 64 MB */
-/* #define CONFIG_INIT_IGNORE_ERROR */
 #define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_FLASH_BASE		(0x08000000)
 #define CONFIG_SYS_MONITOR_BASE		CONFIG_SYS_FLASH_BASE
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index 61ae682dcd..ca043b2f26 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -75,10 +75,8 @@ CONFIG_BOARD_IS_OPENRD_ULTIMATE
 CONFIG_BOARD_NAME
 CONFIG_BOARD_POSTCLK_INIT
 CONFIG_BOARD_SIZE_LIMIT
-CONFIG_BOOGER
 CONFIG_BOOTFILE
 CONFIG_BOOTMODE
-CONFIG_BOOTP_
 CONFIG_BOOTP_BOOTFILESIZE
 CONFIG_BOOTP_DHCP_REQUEST_DELAY
 CONFIG_BOOTP_ID_CACHE_SIZE
@@ -147,7 +145,6 @@ CONFIG_CM_T3X
 CONFIG_CM_T43
 CONFIG_CM_TCRAM
 CONFIG_COLDFIRE
-CONFIG_COMMANDS
 CONFIG_COMMON_BOOT
 CONFIG_COMPAT
 CONFIG_CONS_EXTC_PINSEL
@@ -227,7 +224,6 @@ CONFIG_DNET_AUTONEG_TIMEOUT
 CONFIG_DP_DDR_CTRL
 CONFIG_DP_DDR_DIMM_SLOTS_PER_CTLR
 CONFIG_DP_DDR_NUM_CTRLS
-CONFIG_DRAM_TIMINGS_
 CONFIG_DRIVER_DM9000
 CONFIG_DSP_CLUSTER_START
 CONFIG_DWCDDR21MCTL
@@ -267,7 +263,6 @@ CONFIG_ENV_CALLBACK_LIST_STATIC
 CONFIG_ENV_FLAGS_LIST_DEFAULT
 CONFIG_ENV_FLAGS_LIST_STATIC
 CONFIG_ENV_IS_EMBEDDED
-CONFIG_ENV_IS_IN_
 CONFIG_ENV_MAX_ENTRIES
 CONFIG_ENV_MIN_ENTRIES
 CONFIG_ENV_OFFSET_OOB
@@ -460,7 +455,6 @@ CONFIG_HIKEY_GPIO
 CONFIG_HITACHI_SX14
 CONFIG_HOSTNAME
 CONFIG_HOST_MAX_DEVICES
-CONFIG_HOTPLUG
 CONFIG_HPS_ALTERAGRP_DBGATCLK
 CONFIG_HPS_ALTERAGRP_MAINCLK
 CONFIG_HPS_ALTERAGRP_MPUCLK
@@ -634,7 +628,6 @@ CONFIG_IMX6_PWM_PER_CLK
 CONFIG_IMX_HDMI
 CONFIG_IMX_VIDEO_SKIP
 CONFIG_INETSPACE_V2
-CONFIG_INIT_IGNORE_ERROR
 CONFIG_INI_ALLOW_MULTILINE
 CONFIG_INI_CASE_INSENSITIVE
 CONFIG_INI_MAX_LINE
@@ -943,7 +936,6 @@ CONFIG_NUM_DSP_CPUS
 CONFIG_NUM_PAMU
 CONFIG_ODROID_REV_AIN
 CONFIG_OFF_PADCONF
-CONFIG_OF_
 CONFIG_OMAP_EHCI_PHY1_RESET_GPIO
 CONFIG_OMAP_EHCI_PHY2_RESET_GPIO
 CONFIG_OMAP_EHCI_PHY3_RESET_GPIO
@@ -1073,10 +1065,6 @@ CONFIG_RD_LVL
 CONFIG_REALMODE_DEBUG
 CONFIG_RED_LED
 CONFIG_REG
-CONFIG_REG_0
-CONFIG_REG_2
-CONFIG_REG_3
-CONFIG_REG_8
 CONFIG_REMAKE_ELF
 CONFIG_REQ
 CONFIG_RESERVED_01_BASE
@@ -1233,7 +1221,6 @@ CONFIG_SPI_FLASH_SIZE
 CONFIG_SPI_HALF_DUPLEX
 CONFIG_SPI_IDLE_VAL
 CONFIG_SPI_N25Q256A_RESET
-CONFIG_SPL_
 CONFIG_SPL_ATMEL_SIZE
 CONFIG_SPL_BOARD_LOAD_IMAGE
 CONFIG_SPL_BOOTROM_SAVE
@@ -2339,7 +2326,6 @@ CONFIG_SYS_MMC_U_BOOT_DST
 CONFIG_SYS_MMC_U_BOOT_OFFS
 CONFIG_SYS_MMC_U_BOOT_SIZE
 CONFIG_SYS_MMC_U_BOOT_START
-CONFIG_SYS_MONITOR_
 CONFIG_SYS_MONITOR_BASE
 CONFIG_SYS_MONITOR_LEN
 CONFIG_SYS_MONITOR_SEC
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
