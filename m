Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A866A511675
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Apr 2022 13:55:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EE0AC60467;
	Wed, 27 Apr 2022 11:55:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85613C60466
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Apr 2022 11:55:12 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23RANchO000343;
 Wed, 27 Apr 2022 13:55:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=vrH9XPvcvTyJImi1XpngvEBgsRpybI2jusnNyzf8uFU=;
 b=P5Jmg/0pDS6tlCfmf8lHnEsKTqh72x8luOPtqY82Jepxmz7MMyTLIl9D2kIjNCh+8HOK
 z6LqcgskfSjYfySPypWeTIKfRGDnTy/Od/ZpcPlGl7FfSrlEVAFW3NJ2BGQWXu4QbbYj
 LEWtvfv+2G3Qxm8hOrmKfShbWwe9ifJPFm6C3t+5d1y+WekIdHkuuRGdBGmvom/Pg9co
 Wxe28PAN3X9pSdMnB4qDUOncsr1jU9sMR3SBKtIfKuKJBkP/tMo1txxq7jeGk4o3K9OZ
 Jty7Bz5vSa3z9AebvN+Y4+fY2sQ3fydGjkGbkTYWDNXMlnEJZecyt7iF25SQ9q9IeOHB iA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fprr9bmhn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Apr 2022 13:55:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0699E10002A;
 Wed, 27 Apr 2022 13:55:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F342021D3A1;
 Wed, 27 Apr 2022 13:55:09 +0200 (CEST)
Received: from localhost (10.75.127.44) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 27 Apr
 2022 13:55:09 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 27 Apr 2022 13:53:56 +0200
Message-ID: <20220427115401.155400-8-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427115401.155400-1-patrice.chotard@foss.st.com>
References: <20220427115401.155400-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-27_04,2022-04-27_01,2022-02-23_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Vikas Manocha <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH v2 07/12] configs: stm32f746-disco: Migrate
	SPL flags to defconfig
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

Migrate SPL flags to stm32f746-disco_spl_defconfig

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 arch/arm/mach-stm32/Kconfig           | 20 --------------------
 configs/stm32f746-disco_spl_defconfig | 24 ++++++++++++++++++++----
 2 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
index a439dbd10f..a44ebf2597 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -25,26 +25,6 @@ config STM32F7
 	select PINCTRL
 	select PINCTRL_STM32
 	select RAM
-	select SPL
-	select SPL_BOARD_INIT
-	select SPL_CLK
-	select SPL_DM
-	select SPL_DM_RESET
-	select SPL_DM_SEQ_ALIAS
-	select SPL_DRIVERS_MISC
-	select SPL_GPIO
-	select SPL_LIBCOMMON_SUPPORT
-	select SPL_LIBGENERIC_SUPPORT
-	select SPL_MTD_SUPPORT
-	select SPL_OF_CONTROL
-	select SPL_OF_LIBFDT
-	select SPL_OF_TRANSLATE
-	select SPL_PINCTRL
-	select SPL_RAM
-	select SPL_SERIAL
-	select SPL_SYS_MALLOC_SIMPLE
-	select SPL_TIMER
-	select SPL_XIP_SUPPORT
 	select STM32_RCC
 	select STM32_RESET
 	select STM32_SDRAM
diff --git a/configs/stm32f746-disco_spl_defconfig b/configs/stm32f746-disco_spl_defconfig
index 0133867942..9fef65fa7b 100644
--- a/configs/stm32f746-disco_spl_defconfig
+++ b/configs/stm32f746-disco_spl_defconfig
@@ -3,12 +3,18 @@ CONFIG_ARCH_STM32=y
 CONFIG_SYS_TEXT_BASE=0x08008000
 CONFIG_SYS_MALLOC_LEN=0x100000
 CONFIG_SYS_MALLOC_F_LEN=0xE00
+CONFIG_SPL_GPIO=y
+CONFIG_SPL_LIBCOMMON_SUPPORT=y
+CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ENV_SIZE=0x2000
 CONFIG_DEFAULT_DEVICE_TREE="stm32f746-disco"
 CONFIG_SPL_TEXT_BASE=0x8000000
+CONFIG_SPL_SERIAL=y
+CONFIG_SPL_DRIVERS_MISC=y
 CONFIG_STM32F7=y
 CONFIG_TARGET_STM32F746_DISCO=y
+CONFIG_SPL=y
 CONFIG_BUILD_TARGET="u-boot-with-spl.bin"
 CONFIG_SYS_LOAD_ADDR=0x8008000
 CONFIG_DISTRO_DEFAULTS=y
@@ -20,6 +26,11 @@ CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
 # CONFIG_DISPLAY_CPUINFO is not set
 CONFIG_BOARD_LATE_INIT=y
+CONFIG_SPL_BOARD_INIT=y
+CONFIG_SPL_SYS_MALLOC_SIMPLE=y
+CONFIG_SPL_MTD_SUPPORT=y
+CONFIG_SPL_XIP_SUPPORT=y
+CONFIG_SPL_DM_RESET=y
 CONFIG_SYS_PROMPT="U-Boot > "
 CONFIG_CMD_GPT=y
 # CONFIG_RANDOM_UUID is not set
@@ -31,15 +42,16 @@ CONFIG_CMD_LINK_LOCAL=y
 CONFIG_CMD_BMP=y
 CONFIG_CMD_CACHE=y
 CONFIG_CMD_TIMER=y
-# CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_ISO_PARTITION is not set
-# CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_OF_CONTROL=y
+CONFIG_SPL_OF_CONTROL=y
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_NETCONSOLE=y
-# CONFIG_SPL_BLK is not set
-# CONFIG_SPL_DM_MMC is not set
+CONFIG_SPL_DM=y
+CONFIG_SPL_DM_SEQ_ALIAS=y
+CONFIG_SPL_OF_TRANSLATE=y
+CONFIG_SPL_CLK=y
 CONFIG_ARM_PL180_MMCI=y
 CONFIG_MTD=y
 CONFIG_DM_MTD=y
@@ -53,9 +65,13 @@ CONFIG_DM_ETH=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
 # CONFIG_PINCTRL_FULL is not set
+CONFIG_SPL_PINCTRL=y
+CONFIG_SPL_RAM=y
+CONFIG_SPECIFY_CONSOLE_INDEX=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
 CONFIG_STM32_QSPI=y
+CONFIG_SPL_TIMER=y
 CONFIG_DM_VIDEO=y
 CONFIG_BACKLIGHT_GPIO=y
 CONFIG_VIDEO_STM32=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
