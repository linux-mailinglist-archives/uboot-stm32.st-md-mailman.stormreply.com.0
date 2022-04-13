Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ECC4FF9B4
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 Apr 2022 17:06:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E835C628AC;
	Wed, 13 Apr 2022 15:06:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9013C628A0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Apr 2022 15:06:20 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23DEuRXG013631;
 Wed, 13 Apr 2022 17:06:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=neJ6t4pBM/CuXyXSHad6j+BV3UzAbXOVquWbB9jFdk4=;
 b=XNRzyk3VyegAgg7laLLt/lFUYvthHIOIEFS5A7CC28878dnxEhz+aQ1Xcu/jW2MhwmTT
 Tt58cOizMxdphMOrGuFgoOUil31bGs1p1mQ1uifVr8VvWQeDZF6jecs0FMVDLl4YnPDk
 8IukEllVz42GaFsjB2XUhxIZOlJ5g8hz2N/kV37KMok+6aDDr0fWs3W1v4Xona2y+5Rs
 V5usFHARm6HmDfdQIstpOi1X9U3JTGQKfrqfStOTdmXEk7E/Mif7snIuFm48/tlhGlCL
 mAUN9y+giodpAGvfkxun3q7Lg2sJKNAqwF6P3LgS7um2Ky4epATd+BE2TLao+Yfh8S/H 8A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fb7gpf8q4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Apr 2022 17:06:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B4193100034;
 Wed, 13 Apr 2022 17:06:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AE48A221788;
 Wed, 13 Apr 2022 17:06:19 +0200 (CEST)
Received: from localhost (10.75.127.46) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 13 Apr
 2022 17:06:19 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 13 Apr 2022 17:04:54 +0200
Message-ID: <20220413150500.23883-7-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220413150500.23883-1-patrice.chotard@foss.st.com>
References: <20220413150500.23883-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-13_02,2022-04-13_01,2022-02-23_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH v1 06/12] configs: stm32f769-disco: Migrate
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

Migrate SPL flags to stm32f769-disco_spl_defconfig

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 configs/stm32f769-disco_spl_defconfig | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/configs/stm32f769-disco_spl_defconfig b/configs/stm32f769-disco_spl_defconfig
index 0ba0184359..4e8a72ed0e 100644
--- a/configs/stm32f769-disco_spl_defconfig
+++ b/configs/stm32f769-disco_spl_defconfig
@@ -3,12 +3,19 @@ CONFIG_ARCH_STM32=y
 CONFIG_SYS_TEXT_BASE=0x08008000
 CONFIG_SYS_MALLOC_LEN=0x100000
 CONFIG_SYS_MALLOC_F_LEN=0xE00
+CONFIG_SPL_GPIO=y
+CONFIG_SPL_LIBCOMMON_SUPPORT=y
+CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ENV_SIZE=0x2000
 CONFIG_DEFAULT_DEVICE_TREE="stm32f769-disco"
 CONFIG_SPL_TEXT_BASE=0x8000000
+CONFIG_SPL_SERIAL=y
+CONFIG_SPL_DRIVERS_MISC=y
 CONFIG_STM32F7=y
 CONFIG_TARGET_STM32F746_DISCO=y
+CONFIG_SPL=y
+CONFIG_BUILD_TARGET="u-boot-with-spl.bin"
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SYS_LOAD_ADDR=0x8008000
 CONFIG_BOOTDELAY=3
@@ -18,6 +25,11 @@ CONFIG_AUTOBOOT_STOP_STR=" "
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
 # CONFIG_DISPLAY_CPUINFO is not set
+CONFIG_SPL_BOARD_INIT=y
+CONFIG_SPL_SYS_MALLOC_SIMPLE=y
+CONFIG_SPL_MTD_SUPPORT=y
+CONFIG_SPL_XIP_SUPPORT=y
+CONFIG_SPL_DM_RESET=y
 CONFIG_SYS_PROMPT="U-Boot > "
 CONFIG_CMD_GPT=y
 # CONFIG_RANDOM_UUID is not set
@@ -29,15 +41,16 @@ CONFIG_CMD_LINK_LOCAL=y
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
@@ -51,9 +64,13 @@ CONFIG_DM_ETH=y
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
 CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
