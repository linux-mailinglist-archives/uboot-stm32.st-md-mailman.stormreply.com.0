Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B871152E520
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 08:39:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 800D8C56630;
	Fri, 20 May 2022 06:39:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0DFBC5662F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 06:39:03 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K1bYeI020575;
 Fri, 20 May 2022 08:39:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=G1JBUeuCc3zBXTIR0BSSUvfALxbAOzeRn1a98ZDYZGE=;
 b=TL6LHDwQbXE9gxeneItG81yE0yLsnJhlsuL76Mx9W8TiegXpJIT2ESS6eyN+wtOfmelI
 cYP2DotvE6yvFr9DbtIVe3EwUqbc9AqL/Tr/dT/rChwj7xKNtgks57L8+yOLtfww6lBk
 b+JHsrd3q7KjOWZNuXiSn9ELg0nmn+AngQg5zIbmrDqkY3mbqtqKS2qcygwon5hNw+IC
 wTgaxAiK2Ro24I7yAZoWF+UIqY3a1p/ePMjIgWc1/tYQQhc6Hluq0RGyn15LaNM/BoPn
 /NVjQe8vQEsZI41nceNw2bopJBC9yOy4dqvNmPWTM8HPHzRl726MCDg6NVDMCGqefjmm 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23aj668q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 08:39:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 37F00100038;
 Fri, 20 May 2022 08:39:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2F69E211F3E;
 Fri, 20 May 2022 08:39:01 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.49) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 08:39:00 +0200
Message-ID: <c6e4742e-6f39-ee09-eba2-ece4b57b02ce@foss.st.com>
Date: Fri, 20 May 2022 08:39:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
 <20220506160540.6.I90e6955a55b1eea31e8a17d216eb9bdd76332f5d@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220506160540.6.I90e6955a55b1eea31e8a17d216eb9bdd76332f5d@changeid>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_02,2022-05-19_03,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 06/16] arm: stm32mp: add sub config
	Kconfig.15x
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

Hi Patrick

On 5/6/22 16:06, Patrick Delaunay wrote:
> Add sub Kconfig for each SOC in the STM32 CPU family.
> 
> It is a preliminary step to introduce a new SOC in the STM32MP family.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/Kconfig       | 119 +---------------------------
>  arch/arm/mach-stm32mp/Kconfig.15x   | 119 ++++++++++++++++++++++++++++
>  configs/stm32mp15_basic_defconfig   |   2 +-
>  configs/stm32mp15_defconfig         |   4 +-
>  configs/stm32mp15_trusted_defconfig |   4 +-
>  5 files changed, 125 insertions(+), 123 deletions(-)
>  create mode 100644 arch/arm/mach-stm32mp/Kconfig.15x
> 
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index 446d3258c9..3b4936c326 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -60,93 +60,6 @@ config STM32MP15x
>  		dual core A7 for STM32MP157/3, monocore for STM32MP151
>  endchoice
>  
> -if STM32MP15x
> -
> -config STM32MP15x_STM32IMAGE
> -	bool "Support STM32 image for generated U-Boot image"
> -	depends on TFABOOT
> -	help
> -		Support of STM32 image generation for SOC STM32MP15x
> -		for TF-A boot when FIP container is not used
> -
> -choice
> -	prompt "STM32MP15x board select"
> -	optional
> -
> -config TARGET_ST_STM32MP15x
> -	bool "STMicroelectronics STM32MP15x boards"
> -	imply BOOTSTAGE
> -	imply CMD_BOOTSTAGE
> -	imply CMD_CLS if CMD_BMP
> -	imply DISABLE_CONSOLE
> -	imply PRE_CONSOLE_BUFFER
> -	imply SILENT_CONSOLE
> -	help
> -		target the STMicroelectronics board with SOC STM32MP15x
> -		managed by board/st/stm32mp1:
> -		Evalulation board (EV1) or Discovery board (DK1 and DK2).
> -		The difference between board are managed with devicetree
> -
> -config TARGET_MICROGEA_STM32MP1
> -	bool "Engicam MicroGEA STM32MP1 SOM"
> -	imply BOOTSTAGE
> -	imply CMD_BOOTSTAGE
> -	imply CMD_CLS if CMD_BMP
> -	imply DISABLE_CONSOLE
> -	imply PRE_CONSOLE_BUFFER
> -	imply SILENT_CONSOLE
> -	help
> -	  MicroGEA STM32MP1 is a STM32MP157A based Micro SOM.
> -
> -	  MicroGEA STM32MP1 MicroDev 2.0:
> -	  * MicroDev 2.0 is a general purpose miniature carrier board with CAN,
> -	    LTE and LVDS panel interfaces.
> -	  * MicroGEA STM32MP1 needs to mount on top of this MicroDev 2.0 board
> -	    for creating complete MicroGEA STM32MP1 MicroDev 2.0 Carrier board.
> -
> -	  MicroGEA STM32MP1 MicroDev 2.0 7" OF:
> -	  * 7" OF is a capacitive touch 7" Open Frame panel solutions with LVDS
> -	    panel and toucscreen.
> -	  * MicroGEA STM32MP1 needs to mount on top of MicroDev 2.0 board with
> -	    pluged 7" OF for creating complete MicroGEA STM32MP1 MicroDev 2.0 7"
> -	    Open Frame Solution board.
> -
> -config TARGET_ICORE_STM32MP1
> -	bool "Engicam i.Core STM32MP1 SOM"
> -	imply BOOTSTAGE
> -	imply CMD_BOOTSTAGE
> -	imply CMD_CLS if CMD_BMP
> -	imply DISABLE_CONSOLE
> -	imply PRE_CONSOLE_BUFFER
> -	imply SILENT_CONSOLE
> -	help
> -	  i.Core STM32MP1 is an EDIMM SOM based on STM32MP157A.
> -
> -	  i.Core STM32MP1 EDIMM2.2:
> -	  * EDIMM2.2 is a Form Factor Capacitive Evaluation Board.
> -	  * i.Core STM32MP1 needs to mount on top of EDIMM2.2 for
> -	    creating complete i.Core STM32MP1 EDIMM2.2 Starter Kit.
> -
> -	  i.Core STM32MP1 C.TOUCH 2.0
> -	  * C.TOUCH 2.0 is a general purpose Carrier board.
> -	  * i.Core STM32MP1 needs to mount on top of this Carrier board
> -	    for creating complete i.Core STM32MP1 C.TOUCH 2.0 board.
> -
> -config TARGET_DH_STM32MP1_PDK2
> -	bool "DH STM32MP1 PDK2"
> -	help
> -		Target the DH PDK2 development kit with STM32MP15x SoM.
> -
> -endchoice
> -
> -source "board/st/stm32mp1/Kconfig"
> -source "board/dhelectronics/dh_stm32mp1/Kconfig"
> -source "board/engicam/stm32mp1/Kconfig"
> -endif
> -
> -config SYS_TEXT_BASE
> -	default 0xC0100000
> -
>  config NR_DRAM_BANKS
>  	default 1
>  
> @@ -195,37 +108,7 @@ config CMD_STM32KEY
>  		This command is used to evaluate the secure boot on stm32mp SOC,
>  		it is deactivated by default in real products.
>  
> -config PRE_CON_BUF_ADDR
> -	default 0xC02FF000
> -
> -config PRE_CON_BUF_SZ
> -	default 4096
> -
> -config BOOTSTAGE_STASH_ADDR
> -	default 0xC3000000
> -
> -if BOOTCOUNT_GENERIC
> -config SYS_BOOTCOUNT_SINGLEWORD
> -	default y
> -
> -# TAMP_BOOTCOUNT = TAMP_BACKUP_REGISTER(21)
> -config SYS_BOOTCOUNT_ADDR
> -	default 0x5C00A154
> -endif
> -
> -if DEBUG_UART
> -
> -config DEBUG_UART_BOARD_INIT
> -	default y
> -
> -# debug on UART4 by default
> -config DEBUG_UART_BASE
> -	default 0x40010000
> -
> -# clock source is HSI on reset
> -config DEBUG_UART_CLOCK
> -	default 64000000
> -endif
> +source "arch/arm/mach-stm32mp/Kconfig.15x"
>  
>  source "arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig"
>  endif
> diff --git a/arch/arm/mach-stm32mp/Kconfig.15x b/arch/arm/mach-stm32mp/Kconfig.15x
> new file mode 100644
> index 0000000000..19f161cf5c
> --- /dev/null
> +++ b/arch/arm/mach-stm32mp/Kconfig.15x
> @@ -0,0 +1,119 @@
> +if STM32MP15x
> +
> +config STM32MP15x_STM32IMAGE
> +	bool "Support STM32 image for generated U-Boot image"
> +	depends on TFABOOT
> +	help
> +		Support of STM32 image generation for SOC STM32MP15x
> +		for TF-A boot when FIP container is not used
> +
> +choice
> +	prompt "STM32MP15x board select"
> +	optional
> +
> +config TARGET_ST_STM32MP15x
> +	bool "STMicroelectronics STM32MP15x boards"
> +	imply BOOTSTAGE
> +	imply CMD_BOOTSTAGE
> +	imply CMD_CLS if CMD_BMP
> +	imply DISABLE_CONSOLE
> +	imply PRE_CONSOLE_BUFFER
> +	imply SILENT_CONSOLE
> +	help
> +		target the STMicroelectronics board with SOC STM32MP15x
> +		managed by board/st/stm32mp1:
> +		Evalulation board (EV1) or Discovery board (DK1 and DK2).
> +		The difference between board are managed with devicetree
> +
> +config TARGET_DH_STM32MP1_PDK2
> +	bool "DH STM32MP1 PDK2"
> +	help
> +		Target the DH PDK2 development kit with STM32MP15x SoM.
> +
> +config TARGET_MICROGEA_STM32MP1
> +	bool "Engicam MicroGEA STM32MP1 SOM"
> +	imply BOOTSTAGE
> +	imply CMD_BOOTSTAGE
> +	imply CMD_CLS if CMD_BMP
> +	imply DISABLE_CONSOLE
> +	imply PRE_CONSOLE_BUFFER
> +	imply SILENT_CONSOLE
> +	help
> +	  MicroGEA STM32MP1 is a STM32MP157A based Micro SOM.
> +
> +	  MicroGEA STM32MP1 MicroDev 2.0:
> +	  * MicroDev 2.0 is a general purpose miniature carrier board with CAN,
> +	    LTE and LVDS panel interfaces.
> +	  * MicroGEA STM32MP1 needs to mount on top of this MicroDev 2.0 board
> +	    for creating complete MicroGEA STM32MP1 MicroDev 2.0 Carrier board.
> +
> +	  MicroGEA STM32MP1 MicroDev 2.0 7" OF:
> +	  * 7" OF is a capacitive touch 7" Open Frame panel solutions with LVDS
> +	    panel and toucscreen.
> +	  * MicroGEA STM32MP1 needs to mount on top of MicroDev 2.0 board with
> +	    pluged 7" OF for creating complete MicroGEA STM32MP1 MicroDev 2.0 7"
> +	    Open Frame Solution board.
> +
> +config TARGET_ICORE_STM32MP1
> +	bool "Engicam i.Core STM32MP1 SOM"
> +	imply BOOTSTAGE
> +	imply CMD_BOOTSTAGE
> +	imply CMD_CLS if CMD_BMP
> +	imply DISABLE_CONSOLE
> +	imply PRE_CONSOLE_BUFFER
> +	imply SILENT_CONSOLE
> +	help
> +	  i.Core STM32MP1 is an EDIMM SOM based on STM32MP157A.
> +
> +	  i.Core STM32MP1 EDIMM2.2:
> +	  * EDIMM2.2 is a Form Factor Capacitive Evaluation Board.
> +	  * i.Core STM32MP1 needs to mount on top of EDIMM2.2 for
> +	    creating complete i.Core STM32MP1 EDIMM2.2 Starter Kit.
> +
> +	  i.Core STM32MP1 C.TOUCH 2.0
> +	  * C.TOUCH 2.0 is a general purpose Carrier board.
> +	  * i.Core STM32MP1 needs to mount on top of this Carrier board
> +	    for creating complete i.Core STM32MP1 C.TOUCH 2.0 board.
> +
> +endchoice
> +
> +config SYS_TEXT_BASE
> +	default 0xC0100000
> +
> +config PRE_CON_BUF_ADDR
> +	default 0xC02FF000
> +
> +config PRE_CON_BUF_SZ
> +	default 4096
> +
> +config BOOTSTAGE_STASH_ADDR
> +	default 0xC3000000
> +
> +if BOOTCOUNT_GENERIC
> +config SYS_BOOTCOUNT_SINGLEWORD
> +	default y
> +
> +# TAMP_BOOTCOUNT = TAMP_BACKUP_REGISTER(21)
> +config SYS_BOOTCOUNT_ADDR
> +	default 0x5C00A154
> +endif
> +
> +if DEBUG_UART
> +
> +config DEBUG_UART_BOARD_INIT
> +	default y
> +
> +# debug on UART4 by default
> +config DEBUG_UART_BASE
> +	default 0x40010000
> +
> +# clock source is HSI on reset
> +config DEBUG_UART_CLOCK
> +	default 64000000
> +endif
> +
> +source "board/st/stm32mp1/Kconfig"
> +source "board/dhelectronics/dh_stm32mp1/Kconfig"
> +source "board/engicam/stm32mp1/Kconfig"
> +
> +endif
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 46b1cee5e7..998947fe3d 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -8,10 +8,10 @@ CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
>  CONFIG_SPL_TEXT_BASE=0x2FFC2500
>  CONFIG_SPL_MMC=y
>  CONFIG_SPL=y
> +CONFIG_CMD_STM32KEY=y
>  CONFIG_TARGET_ST_STM32MP15x=y
>  CONFIG_TYPEC_STUSB160X=y
>  CONFIG_ENV_OFFSET_REDUND=0x2C0000
> -CONFIG_CMD_STM32KEY=y
>  CONFIG_CMD_STM32PROG=y
>  CONFIG_SPL_SPI_FLASH_SUPPORT=y
>  CONFIG_SPL_SPI=y
> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> index 8bb8e4624d..c4f06af732 100644
> --- a/configs/stm32mp15_defconfig
> +++ b/configs/stm32mp15_defconfig
> @@ -5,11 +5,11 @@ CONFIG_SYS_MALLOC_F_LEN=0x3000
>  CONFIG_ENV_OFFSET=0x480000
>  CONFIG_ENV_SECT_SIZE=0x40000
>  CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
> +CONFIG_DDR_CACHEABLE_SIZE=0x10000000
> +CONFIG_CMD_STM32KEY=y
>  CONFIG_TARGET_ST_STM32MP15x=y
>  CONFIG_TYPEC_STUSB160X=y
>  CONFIG_ENV_OFFSET_REDUND=0x4C0000
> -CONFIG_DDR_CACHEABLE_SIZE=0x10000000
> -CONFIG_CMD_STM32KEY=y
>  CONFIG_CMD_STM32PROG=y
>  # CONFIG_ARMV7_NONSEC is not set
>  CONFIG_SYS_LOAD_ADDR=0xc2000000
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 4f73930924..7c2adb3eb0 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -5,12 +5,12 @@ CONFIG_SYS_MALLOC_F_LEN=0x3000
>  CONFIG_ENV_OFFSET=0x280000
>  CONFIG_ENV_SECT_SIZE=0x40000
>  CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
> +CONFIG_DDR_CACHEABLE_SIZE=0x10000000
> +CONFIG_CMD_STM32KEY=y
>  CONFIG_STM32MP15x_STM32IMAGE=y
>  CONFIG_TARGET_ST_STM32MP15x=y
>  CONFIG_TYPEC_STUSB160X=y
>  CONFIG_ENV_OFFSET_REDUND=0x2C0000
> -CONFIG_DDR_CACHEABLE_SIZE=0x10000000
> -CONFIG_CMD_STM32KEY=y
>  CONFIG_CMD_STM32PROG=y
>  # CONFIG_ARMV7_NONSEC is not set
>  CONFIG_SYS_LOAD_ADDR=0xc2000000
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
