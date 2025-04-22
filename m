Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1019FA96C3C
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Apr 2025 15:14:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA264C78F67;
	Tue, 22 Apr 2025 13:14:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7F92C78034
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 13:14:07 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MAq2Nc005794;
 Tue, 22 Apr 2025 15:14:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Kw5QHzAYA7m+XgfYEJedN0RxbXPK230gcDiBViXhyVM=; b=JKGXOVvQRkcYeOdp
 ovFIuluXAnTyTuhXRZOHQ1nNuNo7svBqH3v1RE3wBVSrNZ61KCpFn1fF+eI/ZVdk
 T6Lr8VFcAlVwkT9MuediZA4N+kP/Q7M4aFQd9tulY/n14s79EjnXBPIrOCcov4w2
 PXG8+MsZL1S0tjIuSW6iQnXtkKb/h13JewaN9558/8fRGCkubG/yPpveW/6KTewx
 OEW0ZGOyNl7w/lwDLdJDu4xcpj+XF1R4iI3x/hhTINFSW3PVBCpVjTHgcqwbHEze
 lCZXkWeWGOCnqFATuu5mmimIxUF3mhlaLiDeThAKyPuq3TCRRMT22Orkv2RXtp5h
 6uaC3g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 464362agxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Apr 2025 15:14:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7FA2140053;
 Tue, 22 Apr 2025 15:13:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3B9505A0B77;
 Tue, 22 Apr 2025 15:12:40 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 15:12:39 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 22 Apr 2025 15:12:23 +0200
Message-ID: <20250422131229.415020-8-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250422131229.415020-1-patrice.chotard@foss.st.com>
References: <20250422131229.415020-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_06,2025-04-21_02,2024-11-22_01
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 07/13] configs: stm32: introduce
	stm32mp15-odyssey_defconfig
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

U-Boot DT for stm32mp157c-odyssey is richer than the kernel DT one.
None of the stm32mp157c-odyssey's contributors answered to my request
to update kernel DT and i didn't have this board to test.
The simpler is to add a dedicated stm32mp15-odyssey_defconfig with
OF_UPSTREAM flag unset.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 board/st/stm32mp1/MAINTAINERS       |   2 +
 configs/stm32mp15-odyssey_defconfig | 172 ++++++++++++++++++++++++++++
 2 files changed, 174 insertions(+)
 create mode 100644 configs/stm32mp15-odyssey_defconfig

diff --git a/board/st/stm32mp1/MAINTAINERS b/board/st/stm32mp1/MAINTAINERS
index d5a09cdc39f..f924e61b3c0 100644
--- a/board/st/stm32mp1/MAINTAINERS
+++ b/board/st/stm32mp1/MAINTAINERS
@@ -1,5 +1,6 @@
 STM32MP1 BOARD
 M:	Patrick Delaunay <patrick.delaunay@foss.st.com>
+M:	Patrice Chotard <patrice.chotard@foss.st.com>
 L:	uboot-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
 T:	git https://source.denx.de/u-boot/custodians/u-boot-stm.git
 S:	Maintained
@@ -10,6 +11,7 @@ F:	configs/stm32mp13_defconfig
 F:	configs/stm32mp15_defconfig
 F:	configs/stm32mp15_basic_defconfig
 F:	configs/stm32mp15_trusted_defconfig
+F:	configs/stm32mp15-odyssey_defconfig
 F:	include/configs/stm32mp13_common.h
 F:	include/configs/stm32mp13_st_common.h
 F:	include/configs/stm32mp15_common.h
diff --git a/configs/stm32mp15-odyssey_defconfig b/configs/stm32mp15-odyssey_defconfig
new file mode 100644
index 00000000000..be8d9ae2abe
--- /dev/null
+++ b/configs/stm32mp15-odyssey_defconfig
@@ -0,0 +1,172 @@
+CONFIG_ARM=y
+CONFIG_ARCH_STM32MP=y
+CONFIG_TFABOOT=y
+CONFIG_SYS_MALLOC_F_LEN=0x80000
+CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0xc0100000
+CONFIG_ENV_OFFSET=0x900000
+CONFIG_ENV_SECT_SIZE=0x40000
+CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-odyssey"
+CONFIG_DDR_CACHEABLE_SIZE=0x8000000
+CONFIG_CMD_STM32KEY=y
+CONFIG_TYPEC_STUSB160X=y
+CONFIG_TARGET_ST_STM32MP15X=y
+CONFIG_ENV_OFFSET_REDUND=0x940000
+CONFIG_CMD_STM32PROG=y
+# CONFIG_ARMV7_NONSEC is not set
+CONFIG_SYS_LOAD_ADDR=0xc2000000
+CONFIG_SYS_MEMTEST_START=0xc0000000
+CONFIG_SYS_MEMTEST_END=0xc4000000
+CONFIG_FIT=y
+CONFIG_SYS_BOOTM_LEN=0x2000000
+CONFIG_DISTRO_DEFAULTS=y
+CONFIG_BOOTDELAY=1
+CONFIG_FDT_SIMPLEFB=y
+CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
+CONFIG_SYS_PBSIZE=1050
+CONFIG_SYS_PROMPT="STM32MP> "
+CONFIG_CMD_ADTIMG=y
+CONFIG_CMD_ERASEENV=y
+CONFIG_CMD_NVEDIT_EFI=y
+CONFIG_CMD_MEMINFO=y
+CONFIG_CMD_MEMTEST=y
+CONFIG_CMD_UNZIP=y
+CONFIG_CMD_ADC=y
+CONFIG_CMD_CLK=y
+CONFIG_CMD_DFU=y
+CONFIG_CMD_FUSE=y
+CONFIG_CMD_GPIO=y
+CONFIG_CMD_I2C=y
+CONFIG_CMD_MMC=y
+CONFIG_CMD_REMOTEPROC=y
+CONFIG_CMD_SPI=y
+CONFIG_CMD_USB=y
+CONFIG_CMD_USB_MASS_STORAGE=y
+CONFIG_SYS_DISABLE_AUTOLOAD=y
+CONFIG_CMD_BMP=y
+CONFIG_CMD_CACHE=y
+CONFIG_CMD_EFIDEBUG=y
+CONFIG_CMD_TIME=y
+CONFIG_CMD_RNG=y
+CONFIG_CMD_TIMER=y
+CONFIG_CMD_PMIC=y
+CONFIG_CMD_REGULATOR=y
+CONFIG_CMD_EXT4_WRITE=y
+CONFIG_CMD_LOG=y
+CONFIG_CMD_UBI=y
+CONFIG_OF_LIVE=y
+# CONFIG_OF_UPSTREAM is not set
+CONFIG_ENV_IS_NOWHERE=y
+CONFIG_ENV_IS_IN_MMC=y
+CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_IS_IN_UBI=y
+CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_UBI_PART="UBI"
+CONFIG_ENV_UBI_VOLUME="uboot_config"
+CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
+CONFIG_SYS_RELOC_GD_ENV_ADDR=y
+CONFIG_SYS_MMC_ENV_DEV=-1
+CONFIG_ENV_MMC_USE_DT=y
+CONFIG_TFTP_TSIZE=y
+CONFIG_USE_SERVERIP=y
+CONFIG_SERVERIP="192.168.1.1"
+CONFIG_STM32_ADC=y
+CONFIG_BUTTON=y
+CONFIG_BUTTON_GPIO=y
+CONFIG_CLK_SCMI=y
+CONFIG_SET_DFU_ALT_INFO=y
+CONFIG_USB_FUNCTION_FASTBOOT=y
+CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
+CONFIG_FASTBOOT_BUF_SIZE=0x02000000
+CONFIG_FASTBOOT_FLASH=y
+CONFIG_FASTBOOT_FLASH_MMC_DEV=1
+CONFIG_FASTBOOT_MMC_BOOT_SUPPORT=y
+CONFIG_FASTBOOT_MMC_BOOT1_NAME="mmc1boot0"
+CONFIG_FASTBOOT_MMC_BOOT2_NAME="mmc1boot1"
+CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
+CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
+CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
+CONFIG_FASTBOOT_CMD_OEM_BOOTBUS=y
+CONFIG_GPIO_HOG=y
+CONFIG_DM_HWSPINLOCK=y
+CONFIG_HWSPINLOCK_STM32=y
+CONFIG_DM_I2C=y
+CONFIG_SYS_I2C_STM32F7=y
+CONFIG_LED=y
+CONFIG_LED_GPIO=y
+CONFIG_STM32_FMC2_EBI=y
+CONFIG_SUPPORT_EMMC_BOOT=y
+CONFIG_STM32_SDMMC2=y
+CONFIG_MTD=y
+CONFIG_DM_MTD=y
+CONFIG_MTD_RAW_NAND=y
+CONFIG_NAND_STM32_FMC2=y
+CONFIG_SYS_NAND_ONFI_DETECTION=y
+CONFIG_MTD_SPI_NAND=y
+CONFIG_DM_SPI_FLASH=y
+CONFIG_SPI_FLASH_MACRONIX=y
+CONFIG_SPI_FLASH_SPANSION=y
+CONFIG_SPI_FLASH_STMICRO=y
+CONFIG_SPI_FLASH_WINBOND=y
+# CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
+CONFIG_SPI_FLASH_MTD=y
+CONFIG_PHY_REALTEK=y
+CONFIG_DWC_ETH_QOS=y
+CONFIG_PHY=y
+CONFIG_PHY_STM32_USBPHYC=y
+CONFIG_PINCONF=y
+CONFIG_PINCTRL_STMFX=y
+CONFIG_DM_PMIC=y
+CONFIG_PMIC_STPMIC1=y
+CONFIG_DM_REGULATOR=y
+CONFIG_DM_REGULATOR_FIXED=y
+CONFIG_DM_REGULATOR_GPIO=y
+CONFIG_DM_REGULATOR_STM32_VREFBUF=y
+CONFIG_DM_REGULATOR_STPMIC1=y
+CONFIG_DM_REGULATOR_SCMI=y
+CONFIG_REMOTEPROC_STM32_COPRO=y
+CONFIG_RESET_SCMI=y
+CONFIG_DM_RNG=y
+CONFIG_RNG_STM32=y
+CONFIG_DM_RTC=y
+CONFIG_RTC_STM32=y
+CONFIG_SERIAL_RX_BUFFER=y
+CONFIG_SPI=y
+CONFIG_DM_SPI=y
+CONFIG_STM32_QSPI=y
+CONFIG_STM32_SPI=y
+CONFIG_SYSRESET_PSCI=y
+CONFIG_TEE=y
+CONFIG_OPTEE=y
+# CONFIG_OPTEE_TA_AVB is not set
+CONFIG_USB=y
+CONFIG_DM_USB_GADGET=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_GENERIC=y
+CONFIG_USB_ONBOARD_HUB=y
+CONFIG_USB_HUB_DEBOUNCE_TIMEOUT=2000
+CONFIG_USB_GADGET=y
+CONFIG_USB_GADGET_MANUFACTURER="STMicroelectronics"
+CONFIG_USB_GADGET_VENDOR_NUM=0x0483
+CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
+CONFIG_USB_GADGET_DWC2_OTG=y
+CONFIG_VIDEO=y
+CONFIG_VIDEO_LOGO=y
+CONFIG_BACKLIGHT_GPIO=y
+CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
+CONFIG_VIDEO_LCD_RAYDIUM_RM68200=y
+CONFIG_VIDEO_STM32=y
+CONFIG_VIDEO_STM32_DSI=y
+CONFIG_VIDEO_STM32_MAX_XRES=1280
+CONFIG_VIDEO_STM32_MAX_YRES=800
+CONFIG_SPLASH_SCREEN=y
+CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
+CONFIG_WDT=y
+CONFIG_WDT_STM32MP=y
+# CONFIG_BINMAN_FDT is not set
+CONFIG_ERRNO_STR=y
+# CONFIG_LMB_USE_MAX_REGIONS is not set
+CONFIG_LMB_MEMORY_REGIONS=2
+CONFIG_LMB_RESERVED_REGIONS=16
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
