Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3CE230DCD
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 17:29:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9614C36B25
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 15:29:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25D49C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 15:29:03 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SFCIDU004490; Tue, 28 Jul 2020 17:29:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=17H4u/rGLuy6mp0MfqHxWzGepRPVZyi7s+mw9nKUPMo=;
 b=a9skevJKz0VuZ2mlDU3UdXqKI8Z/OYw8a6ZJUpFPqw9IVqnP+KLfAhKzFmeDiQ+gsKZw
 iFRkihuRSysTdCeQY6rz8KR2ahkSDunbSTCGo0iT9uxwilDM8/166qV9ClGz0zKVtP1z
 1BPCqIHviJUJNSpiiQQOzLectrU1wpkKwnQroblQqHy3dWRk4nSNj9GWM2BCiB6K1gFw
 WnUd1HxGD+hxmE0vG/oeTWq3FBt13LcO8JovtfM7mRW2oR2c/dflFCyphR1WZjZ1WET3
 Vc1srTwo9MtZcgZUMSeIclY9jMV2H9il6zQDrpB3Oxxd7fndCebK0CfPwDCRywmEJCXI Nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32ga71xxkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 17:29:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AE59810002A;
 Tue, 28 Jul 2020 17:28:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A2A002B8A3D;
 Tue, 28 Jul 2020 17:28:59 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 17:28:59 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 28 Jul 2020 17:28:59 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH v2 3/3] configs:stm32mp1: activate env
 config in SPL
Thread-Index: AQHWZPPQbmuH3LWSbUmzm9fjX30elw==
Date: Tue, 28 Jul 2020 15:28:59 +0000
Message-ID: <5b85230f-09a8-32ad-422b-88d2b0550fee@st.com>
References: <20200615091824.3022-1-patrick.delaunay@st.com>
 <20200615091824.3022-3-patrick.delaunay@st.com>
In-Reply-To: <20200615091824.3022-3-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <E21C4F105AE1AA499E9BC4A72BB7D6AE@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_13:2020-07-28,
 2020-07-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v2 3/3] configs:stm32mp1: activate env
 config in SPL
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


On 6/15/20 11:18 AM, Patrick Delaunay wrote:
> Activate env config in SPL with CONFIG_SPL_ENV_SUPPORT
> and use CONFIG_IS_ENABLED macro to test the activated
> CONFIG_$(SPL_)ENV_IS_IN_... in env_get_location.
>
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> (no changes since v1)
>
>  board/st/stm32mp1/stm32mp1.c      | 8 ++++----
>  configs/stm32mp15_basic_defconfig | 3 +++
>  2 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index b695e8bc6b..7abb90d1d4 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -833,22 +833,22 @@ enum env_location env_get_location(enum env_operation op, int prio)
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
>  	case BOOT_FLASH_SPINAND:
>  		return ENVL_UBI;
>  #endif
> -#ifdef CONFIG_ENV_IS_IN_SPI_FLASH
> +#if CONFIG_IS_ENABLED(ENV_IS_IN_SPI_FLASH)
>  	case BOOT_FLASH_NOR:
>  		return ENVL_SPI_FLASH;
>  #endif
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index acf9331b4b..31597dbc40 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -18,6 +18,7 @@ CONFIG_FIT=y
>  CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
>  CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=y
>  CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=3
> +CONFIG_SPL_ENV_SUPPORT=y
>  CONFIG_SPL_I2C_SUPPORT=y
>  CONFIG_SPL_MTD_SUPPORT=y
>  CONFIG_SPL_POWER_SUPPORT=y
> @@ -61,6 +62,8 @@ CONFIG_ENV_UBI_PART="UBI"
>  CONFIG_ENV_UBI_VOLUME="uboot_config"
>  CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
>  CONFIG_SYS_RELOC_GD_ENV_ADDR=y
> +# CONFIG_SPL_ENV_IS_NOWHERE is not set
> +# CONFIG_SPL_ENV_IS_IN_SPI_FLASH is not set
>  CONFIG_STM32_ADC=y
>  CONFIG_SET_DFU_ALT_INFO=y
>  CONFIG_USB_FUNCTION_FASTBOOT=y
Applied to u-boot-stm/master

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
