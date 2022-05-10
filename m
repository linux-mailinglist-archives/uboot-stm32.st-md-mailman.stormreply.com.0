Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BFF520FF5
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 10:46:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EB31C0D2B9;
	Tue, 10 May 2022 08:46:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E35F8C0D2B8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 08:46:29 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A45IEm011169;
 Tue, 10 May 2022 10:46:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=0mOy5zOe0W1DH4fae9Kqs0gu6++6UcKAKKCFqNKEosE=;
 b=PafnKxbxr+NdKFOsWMNRMmPIwe9YO4FyZS/6P2d202s8Agz4ga28I2iy6uNveU07+giz
 pHpaaeoW6SuML5XBL6YUiY26mteqGOTR9EOkQ0960Ks+HYl7VtDXrp+KHi+eLgVEOZ+I
 t9tZ230SqpMZPWW3dHqB7mPhYHpeFlQo8L59FhHOsUdVMcHh+grvW+oScRfJCagyfKCU
 ermqZJT9l+G/nNhdxZ0JV8gbGCtxF8JjGsLzOoMCq6j8jw1/6iFZFBAbycHIVaK9JigU
 gSO4SwuB/J++i42Xoz36Igtk7omisBdbv0FYXukpdYsNyyX0gTV2OhbVxV5MbMF+7jrL pQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwfnggms4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 10:46:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D2BE4100038;
 Tue, 10 May 2022 10:46:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C91212138E5;
 Tue, 10 May 2022 10:46:26 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 10 May
 2022 10:46:25 +0200
Message-ID: <7778cdc5-60fd-887c-1f8c-5960e30cc44f@foss.st.com>
Date: Tue, 10 May 2022 10:46:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20220427115401.155400-1-patrice.chotard@foss.st.com>
 <20220427115401.155400-8-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220427115401.155400-8-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-09_02,2022-02-23_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 07/12] configs: stm32f746-disco:
 Migrate SPL flags to defconfig
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



On 4/27/22 13:53, Patrice Chotard wrote:
> Migrate SPL flags to stm32f746-disco_spl_defconfig
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> (no changes since v1)
> 
>  arch/arm/mach-stm32/Kconfig           | 20 --------------------
>  configs/stm32f746-disco_spl_defconfig | 24 ++++++++++++++++++++----
>  2 files changed, 20 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
> index a439dbd10f..a44ebf2597 100644
> --- a/arch/arm/mach-stm32/Kconfig
> +++ b/arch/arm/mach-stm32/Kconfig
> @@ -25,26 +25,6 @@ config STM32F7
>  	select PINCTRL
>  	select PINCTRL_STM32
>  	select RAM
> -	select SPL
> -	select SPL_BOARD_INIT
> -	select SPL_CLK
> -	select SPL_DM
> -	select SPL_DM_RESET
> -	select SPL_DM_SEQ_ALIAS
> -	select SPL_DRIVERS_MISC
> -	select SPL_GPIO
> -	select SPL_LIBCOMMON_SUPPORT
> -	select SPL_LIBGENERIC_SUPPORT
> -	select SPL_MTD_SUPPORT
> -	select SPL_OF_CONTROL
> -	select SPL_OF_LIBFDT
> -	select SPL_OF_TRANSLATE
> -	select SPL_PINCTRL
> -	select SPL_RAM
> -	select SPL_SERIAL
> -	select SPL_SYS_MALLOC_SIMPLE
> -	select SPL_TIMER
> -	select SPL_XIP_SUPPORT
>  	select STM32_RCC
>  	select STM32_RESET
>  	select STM32_SDRAM
> diff --git a/configs/stm32f746-disco_spl_defconfig b/configs/stm32f746-disco_spl_defconfig
> index 0133867942..9fef65fa7b 100644
> --- a/configs/stm32f746-disco_spl_defconfig
> +++ b/configs/stm32f746-disco_spl_defconfig
> @@ -3,12 +3,18 @@ CONFIG_ARCH_STM32=y
>  CONFIG_SYS_TEXT_BASE=0x08008000
>  CONFIG_SYS_MALLOC_LEN=0x100000
>  CONFIG_SYS_MALLOC_F_LEN=0xE00
> +CONFIG_SPL_GPIO=y
> +CONFIG_SPL_LIBCOMMON_SUPPORT=y
> +CONFIG_SPL_LIBGENERIC_SUPPORT=y
>  CONFIG_NR_DRAM_BANKS=1
>  CONFIG_ENV_SIZE=0x2000
>  CONFIG_DEFAULT_DEVICE_TREE="stm32f746-disco"
>  CONFIG_SPL_TEXT_BASE=0x8000000
> +CONFIG_SPL_SERIAL=y
> +CONFIG_SPL_DRIVERS_MISC=y
>  CONFIG_STM32F7=y
>  CONFIG_TARGET_STM32F746_DISCO=y
> +CONFIG_SPL=y
>  CONFIG_BUILD_TARGET="u-boot-with-spl.bin"
>  CONFIG_SYS_LOAD_ADDR=0x8008000
>  CONFIG_DISTRO_DEFAULTS=y
> @@ -20,6 +26,11 @@ CONFIG_USE_BOOTARGS=y
>  CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
>  # CONFIG_DISPLAY_CPUINFO is not set
>  CONFIG_BOARD_LATE_INIT=y
> +CONFIG_SPL_BOARD_INIT=y
> +CONFIG_SPL_SYS_MALLOC_SIMPLE=y
> +CONFIG_SPL_MTD_SUPPORT=y
> +CONFIG_SPL_XIP_SUPPORT=y
> +CONFIG_SPL_DM_RESET=y
>  CONFIG_SYS_PROMPT="U-Boot > "
>  CONFIG_CMD_GPT=y
>  # CONFIG_RANDOM_UUID is not set
> @@ -31,15 +42,16 @@ CONFIG_CMD_LINK_LOCAL=y
>  CONFIG_CMD_BMP=y
>  CONFIG_CMD_CACHE=y
>  CONFIG_CMD_TIMER=y
> -# CONFIG_SPL_DOS_PARTITION is not set
>  # CONFIG_ISO_PARTITION is not set
> -# CONFIG_SPL_EFI_PARTITION is not set
>  CONFIG_OF_CONTROL=y
> +CONFIG_SPL_OF_CONTROL=y
>  CONFIG_SYS_RELOC_GD_ENV_ADDR=y
>  CONFIG_NET_RANDOM_ETHADDR=y
>  CONFIG_NETCONSOLE=y
> -# CONFIG_SPL_BLK is not set
> -# CONFIG_SPL_DM_MMC is not set
> +CONFIG_SPL_DM=y
> +CONFIG_SPL_DM_SEQ_ALIAS=y
> +CONFIG_SPL_OF_TRANSLATE=y
> +CONFIG_SPL_CLK=y
>  CONFIG_ARM_PL180_MMCI=y
>  CONFIG_MTD=y
>  CONFIG_DM_MTD=y
> @@ -53,9 +65,13 @@ CONFIG_DM_ETH=y
>  CONFIG_ETH_DESIGNWARE=y
>  CONFIG_MII=y
>  # CONFIG_PINCTRL_FULL is not set
> +CONFIG_SPL_PINCTRL=y
> +CONFIG_SPL_RAM=y
> +CONFIG_SPECIFY_CONSOLE_INDEX=y
>  CONFIG_SPI=y
>  CONFIG_DM_SPI=y
>  CONFIG_STM32_QSPI=y
> +CONFIG_SPL_TIMER=y
>  CONFIG_DM_VIDEO=y
>  CONFIG_BACKLIGHT_GPIO=y
>  CONFIG_VIDEO_STM32=y
Applied to u-boot-stm32

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
