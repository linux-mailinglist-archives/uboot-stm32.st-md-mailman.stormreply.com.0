Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 794861A7CF7
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 15:18:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37311C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 13:18:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC459C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 13:18:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ED3Ajs030555; Tue, 14 Apr 2020 15:18:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=TmugvrW1/vMnr+wFPqyh02uQ16NGvtW+kiVGL+QZkmI=;
 b=Aa8RIBeIwro04szf3Ek3xjBB/zPneh40RjOvp+sOzJQ5GncnC6hcgsQ5RkoYZCcu+Rs7
 JdsTFNZg9kvEL7Cx2r+/Zwj23Fbi/kbVUwhq3+QJeB1h9KGO0IoRj4O/CmSk4MlE1JRF
 mV+HBGOSvsKWDs8yB3gzgRBsWyAcKgd/PoK5zfYAhJ2o4HSKIDNL/Mgme7TjSzZh9RQY
 7l9UHLEKLzUvj4vHVx9gQSd5hHUWMZKSlO54THAc1G205rFRewVZy7fb+faYIjLB5qGA
 TOc2DsHpvy7XQPv/nD9Ulhmy3wwl06GIF/KycH6nAR73jEyAi+QZPxa9eVdqlwbELEUd uQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b5stdvfw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 15:18:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 09D5D10002A;
 Tue, 14 Apr 2020 15:18:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F0C022BC7B3;
 Tue, 14 Apr 2020 15:18:22 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Apr
 2020 15:18:22 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 15:18:22 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 3/3] configs:stm32mp1: activate env config
 in SPL
Thread-Index: AQHWEl8swrZO7Ji8cEqQ6++BdmKTZg==
Date: Tue, 14 Apr 2020 13:18:22 +0000
Message-ID: <10dcb848-fd88-69ea-9a68-62172ebc6429@st.com>
References: <20200319102114.8644-1-patrick.delaunay@st.com>
 <20200319102114.8644-2-patrick.delaunay@st.com>
In-Reply-To: <20200319102114.8644-2-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <5EB4932A025CDC4D94E7DD681CCFDBA4@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_05:2020-04-14,
 2020-04-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] configs:stm32mp1: activate env config
 in SPL
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

Hi

On 3/19/20 11:21 AM, Patrick Delaunay wrote:
> Activate env config in SPL with CONFIG_SPL_ENV_SUPPORT
> and use CONFIG_IS_ENABLED macro to test the activated
> CONFIG_$(SPL_)ENV_IS_IN_... in env_get_location.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/st/stm32mp1/stm32mp1.c      | 8 ++++----
>  configs/stm32mp15_basic_defconfig | 3 +++
>  2 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index effba41ad1..474033d640 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -785,21 +785,21 @@ enum env_location env_get_location(enum env_operation op, int prio)
>  		return ENVL_UNKNOWN;
>  
>  	switch (bootmode & TAMP_BOOT_DEVICE_MASK) {
> -#ifdef CONFIG_ENV_IS_IN_MMC
> +#if CONFIG_IS_ENABLED(ENV_IS_IN_MMC)
>  	case BOOT_FLASH_SD:
>  	case BOOT_FLASH_EMMC:
>  		return ENVL_MMC;
>  #endif
> -#ifdef CONFIG_ENV_IS_IN_EXT4
> +#if CONFIG_IS_ENABLED(ENV_IS_IN_EXT4)
>  	case BOOT_FLASH_SD:
>  	case BOOT_FLASH_EMMC:
>  		return ENVL_EXT4;
>  #endif
> -#ifdef CONFIG_ENV_IS_IN_UBI
> +#if CONFIG_IS_ENABLED(ENV_IS_IN_UBI)
>  	case BOOT_FLASH_NAND:
>  		return ENVL_UBI;
>  #endif
> -#ifdef CONFIG_ENV_IS_IN_SPI_FLASH
> +#if CONFIG_IS_ENABLED(ENV_IS_IN_SPI_FLASH)
>  	case BOOT_FLASH_NOR:
>  		return ENVL_SPI_FLASH;
>  #endif
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index dd55a8b632..c63002628c 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -16,6 +16,7 @@ CONFIG_FIT=y
>  CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
>  CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=y
>  CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=3
> +CONFIG_SPL_ENV_SUPPORT=y
>  CONFIG_SPL_I2C_SUPPORT=y
>  CONFIG_SPL_MTD_SUPPORT=y
>  CONFIG_SPL_POWER_SUPPORT=y
> @@ -63,6 +64,8 @@ CONFIG_ENV_UBI_PART="UBI"
>  CONFIG_ENV_UBI_VOLUME="uboot_config"
>  CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
>  CONFIG_SYS_RELOC_GD_ENV_ADDR=y
> +# CONFIG_SPL_ENV_IS_NOWHERE is not set
> +# CONFIG_SPL_ENV_IS_IN_SPI_FLASH is not set
>  CONFIG_STM32_ADC=y
>  CONFIG_DFU_MMC=y
>  CONFIG_DFU_RAM=y

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
