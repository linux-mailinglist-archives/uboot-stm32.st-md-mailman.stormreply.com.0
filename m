Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA62520FF4
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 10:46:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70F51C0D2B8;
	Tue, 10 May 2022 08:46:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0FE4C5F1D3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 08:46:22 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A4jT1S028024;
 Tue, 10 May 2022 10:46:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Xw0erzlkODXPEDTPI1eBj521d2S6SnlB9q+p2aYo2dE=;
 b=f3TCw3ek3JEAW0YiY5SPD1xgXbgDhOAQlwS98qPhUGgn2p5P0vHeVf3Q/U0rUA2agjbp
 mTuYBMEth1Bcdl2idjsK1eg/3MNloMTd4SZSiiNwoX76XytfrESnGAGaHF48jdYIfj2O
 ZnFrhcnhYRGwQvZBCYu1cVm6RjlrlVCwly+FEMkWfvALlOoOwDXtob20teD1AB4A3jQM
 QgcfccfmEGkAO1jHB58Bd75tMl6ObIoSjLxsCIJJPTD8H/TxG44bslimcGA74RIltgmv
 Yng6rmwLLL67kGBoDyjHBheHOqlpgOuE4qvt8ba0aJ6XtzSzXCqJ5epJsvuNEPN5fdYh Lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwe6kq1hs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 10:46:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D1C4D10002A;
 Tue, 10 May 2022 10:46:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CAB812128B6;
 Tue, 10 May 2022 10:46:19 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.49) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 10 May
 2022 10:46:19 +0200
Message-ID: <77cfc7d6-5a29-baa4-44c2-0c793ad66581@foss.st.com>
Date: Tue, 10 May 2022 10:46:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20220427115401.155400-1-patrice.chotard@foss.st.com>
 <20220427115401.155400-7-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220427115401.155400-7-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-09_02,2022-02-23_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 06/12] configs: stm32f769-disco:
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
> Migrate SPL flags to stm32f769-disco_spl_defconfig
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> (no changes since v1)
> 
>  configs/stm32f769-disco_spl_defconfig | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/configs/stm32f769-disco_spl_defconfig b/configs/stm32f769-disco_spl_defconfig
> index f151dab04f..672c1ec065 100644
> --- a/configs/stm32f769-disco_spl_defconfig
> +++ b/configs/stm32f769-disco_spl_defconfig
> @@ -3,12 +3,19 @@ CONFIG_ARCH_STM32=y
>  CONFIG_SYS_TEXT_BASE=0x08008000
>  CONFIG_SYS_MALLOC_LEN=0x100000
>  CONFIG_SYS_MALLOC_F_LEN=0xE00
> +CONFIG_SPL_GPIO=y
> +CONFIG_SPL_LIBCOMMON_SUPPORT=y
> +CONFIG_SPL_LIBGENERIC_SUPPORT=y
>  CONFIG_NR_DRAM_BANKS=1
>  CONFIG_ENV_SIZE=0x2000
>  CONFIG_DEFAULT_DEVICE_TREE="stm32f769-disco"
>  CONFIG_SPL_TEXT_BASE=0x8000000
> +CONFIG_SPL_SERIAL=y
> +CONFIG_SPL_DRIVERS_MISC=y
>  CONFIG_STM32F7=y
>  CONFIG_TARGET_STM32F746_DISCO=y
> +CONFIG_SPL=y
> +CONFIG_BUILD_TARGET="u-boot-with-spl.bin"
>  CONFIG_SYS_LOAD_ADDR=0x8008000
>  CONFIG_DISTRO_DEFAULTS=y
>  CONFIG_BOOTDELAY=3
> @@ -18,6 +25,11 @@ CONFIG_AUTOBOOT_STOP_STR=" "
>  CONFIG_USE_BOOTARGS=y
>  CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
>  # CONFIG_DISPLAY_CPUINFO is not set
> +CONFIG_SPL_BOARD_INIT=y
> +CONFIG_SPL_SYS_MALLOC_SIMPLE=y
> +CONFIG_SPL_MTD_SUPPORT=y
> +CONFIG_SPL_XIP_SUPPORT=y
> +CONFIG_SPL_DM_RESET=y
>  CONFIG_SYS_PROMPT="U-Boot > "
>  CONFIG_CMD_GPT=y
>  # CONFIG_RANDOM_UUID is not set
> @@ -29,15 +41,16 @@ CONFIG_CMD_LINK_LOCAL=y
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
> @@ -51,9 +64,13 @@ CONFIG_DM_ETH=y
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
>  CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
Applied to u-boot-stm32

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
