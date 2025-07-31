Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 984CAB16E75
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Jul 2025 11:22:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58F52C3F933;
	Thu, 31 Jul 2025 09:22:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E5C3C36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Jul 2025 09:22:00 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V8hZuA023195;
 Thu, 31 Jul 2025 11:20:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 1U095sZlW7ZL8/hER4KKVE/TT6rEYarCnaHNE2ZM3/g=; b=BL+bHeyXgmobTOJ5
 GA0L2ZCrp4F32r+T84CNynGjWjMId5PnhJYEJkNuLv1xsPgeZgeh76fNbZ0zzzd+
 SUU9OFeA24KEJuRENtIoXhAJDfZNHL4H3wQAbaZDGnSArPgeNrU6roA2vK7OxVyq
 GEzChZxgmuwnfTQQ57OOGqfWTd3y+zY/T6C5ZHdS4Pgo+SlOwQjvLqjtv+NgbEvm
 etr3es+5VVUSbuQhwUR16kG1Sx6kHaPNyCQ7iG5ITSdYGxJk1BvdiiS5mSt+X8sM
 mYCPjQdff0xgmy7rIfqUVnz24P6kC0+1FOv6e2UvfO7ToBX3CRv+IoBxko+zAYkU
 sQFE3g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484memxwrc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Jul 2025 11:20:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B1CBC40046;
 Thu, 31 Jul 2025 11:19:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 01DEF6C4998;
 Thu, 31 Jul 2025 11:19:05 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 31 Jul
 2025 11:19:04 +0200
Message-ID: <303d120a-7ff0-4e93-9cc5-ee7adad8dba4@foss.st.com>
Date: Thu, 31 Jul 2025 11:19:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20250630001053.952342-1-marek.vasut@mailbox.org>
 <20250630001053.952342-10-marek.vasut@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250630001053.952342-10-marek.vasut@mailbox.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>, u-boot@dh-electronics.com,
 Cheick Traore <cheick.traore@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2 10/10] ARM: dts: stm32: Switch
 defconfig to SPL for DH STM32MP13xx DHCOR DHSBC
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



On 6/30/25 02:10, Marek Vasut wrote:
> Update defconfig to make use of U-Boot SPL to initialize DH STM32MP13xx
> DHCOM DHSBC SoM and board. This is largely a move of SPL enablement from
> DH STM32MP15xx DHSOM defconfigs into generic DH STM32MP1xx defconfig .
> Support for SPI NOR chips which are not used on STM32MP13xx DHCOR are
> moved into STM32MP15xx DHSOM defconfigs. Changes to STM32MP13xx DHCOR
> defconfig then enable SPL support, CCF in SPL to configure clock, pin
> configuration support in SPL, and OpTee OS start support in U-Boot.
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Cheick Traore <cheick.traore@foss.st.com>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Cc: Lionel Debieve <lionel.debieve@foss.st.com>
> Cc: Pascal Zimmermann <pzimmermann@dh-electronics.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Sughosh Ganu <sughosh.ganu@linaro.org>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
> V2: Add RB from Patrice
> ---
>  configs/stm32mp13_dhcor_defconfig | 30 +++++++++++++------
>  configs/stm32mp15_dhsom.config    | 48 +++++--------------------------
>  configs/stm32mp_dhsom.config      | 35 ++++++++++++++++++++--
>  3 files changed, 60 insertions(+), 53 deletions(-)
> 
> diff --git a/configs/stm32mp13_dhcor_defconfig b/configs/stm32mp13_dhcor_defconfig
> index e5aaadd3920..c21416459e6 100644
> --- a/configs/stm32mp13_dhcor_defconfig
> +++ b/configs/stm32mp13_dhcor_defconfig
> @@ -2,7 +2,6 @@
>  
>  CONFIG_ARM=y
>  CONFIG_ARCH_STM32MP=y
> -CONFIG_TFABOOT=y
>  CONFIG_SYS_MALLOC_F_LEN=0x1c0000
>  CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0xc0400000
>  CONFIG_ENV_OFFSET=0x3E0000
> @@ -12,11 +11,16 @@ CONFIG_DDR_CACHEABLE_SIZE=0x8000000
>  CONFIG_TARGET_ST_STM32MP13X=y
>  CONFIG_ENV_OFFSET_REDUND=0x3F0000
>  CONFIG_STM32MP15_PWR=y
> -# CONFIG_ARMV7_NONSEC is not set
> +CONFIG_ARMV7_NONSEC=y
> +CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
> +CONFIG_ARMV7_PSCI_NR_CPUS=2
> +# CONFIG_ARMV7_LPAE is not set
>  CONFIG_SYS_MEMTEST_START=0xc0000000
>  CONFIG_SYS_MEMTEST_END=0xc4000000
> +CONFIG_SYS_MEM_TOP_HIDE=0x2000000
>  CONFIG_BOOTSTAGE_RECORD_COUNT=100
>  CONFIG_BOOTDELAY=3
> +CONFIG_BOOTM_OPTEE=y
>  CONFIG_SYS_CONSOLE_IS_IN_ENV=y
>  CONFIG_CMD_ASKENV=y
>  CONFIG_CMD_ERASEENV=y
> @@ -31,20 +35,28 @@ CONFIG_ENV_IS_NOWHERE=y
>  CONFIG_ENV_IS_IN_MMC=y
>  CONFIG_ENV_MMC_USE_DT=y
>  CONFIG_ENV_SPI_MAX_HZ=50000000
> -CONFIG_CLK_SCMI=y
>  CONFIG_SET_DFU_ALT_INFO=y
>  CONFIG_SYS_I2C_EEPROM_ADDR=0x50
>  CONFIG_ENV_MMC_DEVICE_INDEX=0
>  CONFIG_ENV_MMC_EMMC_HW_PARTITION=1
>  CONFIG_PHY_REALTEK=y
> -CONFIG_DM_REGULATOR_SCMI=y
> -CONFIG_RESET_SCMI=y
>  CONFIG_DM_RNG=y
>  CONFIG_RNG_STM32=y
> -CONFIG_SYSRESET_PSCI=y
> -CONFIG_TEE=y
> -CONFIG_OPTEE=y
> -# CONFIG_OPTEE_TA_AVB is not set
>  CONFIG_USB_ONBOARD_HUB=y
>  CONFIG_USB_HUB_DEBOUNCE_TIMEOUT=2000
>  CONFIG_ERRNO_STR=y
> +CONFIG_OPTEE_LIB=y
> +CONFIG_OPTEE_IMAGE=y
> +CONFIG_OPTEE_TZDRAM_SIZE=0x02000000
> +CONFIG_SPL_TEXT_BASE=0x2FFE0000
> +CONFIG_SPL_CLK_CCF=y
> +CONFIG_SPL_CLK_COMPOSITE_CCF=y
> +# CONFIG_SPL_SHA1 is not set
> +# CONFIG_SPL_SHA256 is not set
> +CONFIG_SPL_HAVE_INIT_STACK=y
> +CONFIG_SPL_SYS_MALLOC_F_LEN=0x8000
> +CONFIG_SPL_PINCTRL=y
> +CONFIG_SPL_PINCTRL_GENERIC=y
> +CONFIG_SPL_PINMUX=y
> +CONFIG_SPL_PINCONF=y
> +CONFIG_SYS_SPI_U_BOOT_OFFS=0x80000
> diff --git a/configs/stm32mp15_dhsom.config b/configs/stm32mp15_dhsom.config
> index c84116482f6..f7ff5db5943 100644
> --- a/configs/stm32mp15_dhsom.config
> +++ b/configs/stm32mp15_dhsom.config
> @@ -2,10 +2,6 @@
>  
>  # CONFIG_ARMV7_VIRT is not set
>  # CONFIG_BINMAN_FDT is not set
> -# CONFIG_SPL_DOS_PARTITION is not set
> -# CONFIG_SPL_PARTITION_UUIDS is not set
> -# CONFIG_SPL_PINCTRL_FULL is not set
> -# CONFIG_SPL_SHARES_INIT_SP_ADDR is not set
>  CONFIG_BOARD_EARLY_INIT_F=y
>  CONFIG_BOARD_SIZE_LIMIT=1441792
>  CONFIG_BOOTCOUNT_BOOTLIMIT=3
> @@ -20,9 +16,7 @@ CONFIG_CMD_STM32PROG_OTP=y
>  CONFIG_CONSOLE_MUX=y
>  CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0xc0100000
>  CONFIG_DM_HWSPINLOCK=y
> -CONFIG_DM_REGULATOR_STM32_VREFBUF=y
>  CONFIG_HAS_BOARD_SIZE_LIMIT=y
> -CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
>  CONFIG_HWSPINLOCK_STM32=y
>  CONFIG_KS8851_MLL=y
>  CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks access-controllers"
> @@ -31,42 +25,7 @@ CONFIG_PINCTRL_STMFX=y
>  CONFIG_REMOTEPROC_STM32_COPRO=y
>  CONFIG_SERVERIP="192.168.1.1"
>  CONFIG_SF_DEFAULT_SPEED=50000000
> -CONFIG_SPL=y
> -CONFIG_SPL_BLOCK_CACHE=y
> -CONFIG_SPL_BOOTCOUNT_LIMIT=y
> -CONFIG_SPL_CUSTOM_SYS_MALLOC_ADDR=0xc0300000
> -CONFIG_SPL_DFU=y
> -CONFIG_SPL_DM_REGULATOR=y
> -CONFIG_SPL_DM_REGULATOR_STPMIC1=y
> -CONFIG_SPL_DM_SPI=y
> -CONFIG_SPL_DM_SPI_FLASH=y
> -CONFIG_SPL_DM_USB_GADGET=y
> -CONFIG_SPL_ENV_IS_NOWHERE=y
> -CONFIG_SPL_ENV_SUPPORT=y
> -CONFIG_SPL_FOOTPRINT_LIMIT=y
> -CONFIG_SPL_HAS_CUSTOM_MALLOC_START=y
> -CONFIG_SPL_I2C=y
> -CONFIG_SPL_LEGACY_IMAGE_FORMAT=y
> -CONFIG_SPL_LOAD_FIT=y
> -CONFIG_SPL_LOAD_FIT_ADDRESS=0xc1000000
> -CONFIG_SPL_MAX_FOOTPRINT=0x3db00
> -CONFIG_SPL_MMC=y
> -CONFIG_SPL_MTD=y
> -CONFIG_SPL_PHY=y
> -CONFIG_SPL_POWER=y
> -CONFIG_SPL_RAM_DEVICE=y
> -CONFIG_SPL_SPI=y
> -CONFIG_SPL_SPI_FLASH_MTD=y
> -CONFIG_SPL_SPI_FLASH_SUPPORT=y
> -CONFIG_SPL_HAVE_INIT_STACK=y
> -CONFIG_SPL_STACK=0x30000000
> -CONFIG_SPL_SYS_MALLOC=y
> -CONFIG_SPL_SYS_MALLOC_SIZE=0x1d00000
> -CONFIG_SPL_SYS_MMCSD_RAW_MODE=y
> -CONFIG_SPL_TEXT_BASE=0x2FFC2500
> -CONFIG_SPL_USB_GADGET=y
>  CONFIG_STM32_ADC=y
> -CONFIG_SYSRESET_SYSCON=y
>  CONFIG_SYS_BOOTCOUNT_ADDR=0x5C00A14C
>  CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=0x3
>  CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=y
> @@ -76,3 +35,10 @@ CONFIG_PREBOOT="run dh_preboot"
>  CONFIG_SYS_SPI_U_BOOT_OFFS=0x80000
>  CONFIG_TARGET_DH_STM32MP1_PDK2=y
>  CONFIG_USE_SERVERIP=y
> +CONFIG_SPI_FLASH_MACRONIX=y
> +CONFIG_SPI_FLASH_SPANSION=y
> +CONFIG_SPI_FLASH_STMICRO=y
> +CONFIG_SPL_LEGACY_IMAGE_FORMAT=y
> +CONFIG_SPL_TEXT_BASE=0x2FFC2500
> +CONFIG_SPL_BLOCK_CACHE=y
> +CONFIG_SPL_MMC=y
> diff --git a/configs/stm32mp_dhsom.config b/configs/stm32mp_dhsom.config
> index 777a02dfe15..56a40839d28 100644
> --- a/configs/stm32mp_dhsom.config
> +++ b/configs/stm32mp_dhsom.config
> @@ -2,6 +2,10 @@
>  # CONFIG_CMD_EXPORTENV is not set
>  # CONFIG_EFI_LOADER is not set
>  # CONFIG_ISO_PARTITION is not set
> +# CONFIG_SPL_DOS_PARTITION is not set
> +# CONFIG_SPL_PARTITION_UUIDS is not set
> +# CONFIG_SPL_PINCTRL_FULL is not set
> +# CONFIG_SPL_SHARES_INIT_SP_ADDR is not set
>  CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
>  CONFIG_BOOTCOUNT_LIMIT=y
>  CONFIG_CMD_BOOTCOUNT=y
> @@ -38,6 +42,7 @@ CONFIG_DM_REGULATOR=y
>  CONFIG_DM_REGULATOR_FIXED=y
>  CONFIG_DM_REGULATOR_GPIO=y
>  CONFIG_DM_REGULATOR_STPMIC1=y
> +CONFIG_DM_REGULATOR_STM32_VREFBUF=y
>  CONFIG_DM_RTC=y
>  CONFIG_DM_SPI=y
>  CONFIG_DM_SPI_FLASH=y
> @@ -49,6 +54,7 @@ CONFIG_ENV_SIZE=0x4000
>  CONFIG_FAT_WRITE=y
>  CONFIG_FIT=y
>  CONFIG_GPIO_HOG=y
> +CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
>  CONFIG_I2C_EEPROM=y
>  CONFIG_IPV6=y
>  CONFIG_IP_DEFRAG=y
> @@ -58,6 +64,7 @@ CONFIG_MTD=y
>  CONFIG_NET_RANDOM_ETHADDR=y
>  CONFIG_OF_LIVE=y
>  CONFIG_OF_UPSTREAM=y
> +CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks"
>  CONFIG_PHY=y
>  CONFIG_PHY_STM32_USBPHYC=y
>  CONFIG_PINCONF=y
> @@ -66,17 +73,39 @@ CONFIG_PROT_TCP_SACK=y
>  CONFIG_RTC_STM32=y
>  CONFIG_SERIAL_RX_BUFFER=y
>  CONFIG_SPI=y
> -CONFIG_SPI_FLASH_MACRONIX=y
>  CONFIG_SPI_FLASH_MTD=y
>  CONFIG_SPI_FLASH_SFDP_SUPPORT=y
> -CONFIG_SPI_FLASH_SPANSION=y
> -CONFIG_SPI_FLASH_STMICRO=y
>  CONFIG_SPI_FLASH_WINBOND=y
> +CONFIG_SPL=y
> +CONFIG_SPL_BOOTCOUNT_LIMIT=y
> +CONFIG_SPL_CUSTOM_SYS_MALLOC_ADDR=0xc0300000
> +CONFIG_SPL_DFU=y
> +CONFIG_SPL_DM_SPI=y
> +CONFIG_SPL_DM_SPI_FLASH=y
> +CONFIG_SPL_ENV_IS_NOWHERE=y
> +CONFIG_SPL_ENV_SUPPORT=y
> +CONFIG_SPL_FOOTPRINT_LIMIT=y
> +CONFIG_SPL_HAS_CUSTOM_MALLOC_START=y
> +CONFIG_SPL_I2C=y
> +CONFIG_SPL_LOAD_FIT=y
> +CONFIG_SPL_LOAD_FIT_ADDRESS=0xc1000000
> +CONFIG_SPL_MAX_FOOTPRINT=0x3db00
> +CONFIG_SPL_MTD=y
> +CONFIG_SPL_PHY=y
> +CONFIG_SPL_POWER=y
> +CONFIG_SPL_RAM_DEVICE=y
> +CONFIG_SPL_SPI=y
> +CONFIG_SPL_SPI_FLASH_MTD=y
> +CONFIG_SPL_SPI_FLASH_SUPPORT=y
> +CONFIG_SPL_STACK=0x30000000
> +CONFIG_SPL_SYS_MALLOC=y
> +CONFIG_SPL_SYS_MALLOC_SIZE=0x1d00000
>  CONFIG_STM32_FMC2_EBI=y
>  CONFIG_STM32_QSPI=y
>  CONFIG_STM32_SDMMC2=y
>  CONFIG_STM32_SPI=y
>  CONFIG_SUPPORT_EMMC_BOOT=y
> +CONFIG_SYSRESET_SYSCON=y
>  CONFIG_SYS_BOOTCOUNT_MAGIC=0xB0C40000
>  CONFIG_SYS_BOOTM_LEN=0x2000000
>  CONFIG_SYS_DISABLE_AUTOLOAD=y
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
