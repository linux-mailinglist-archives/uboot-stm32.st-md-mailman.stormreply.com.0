Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC8A1A7824
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 12:08:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1271FC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 10:08:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8DF1C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 10:08:56 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03EA7FMR015755; Tue, 14 Apr 2020 12:08:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=CVtA4g/XJAjMzIZvXyfzH+0RcGcJCEH/luBKaUWiM4c=;
 b=U61CalgS4Tkv1f5FX769CRmtHkWI+XktuZLPoVbJy+nounvrJZAM//oelcEAwIs2XfjW
 UvpK6MCzsDfTv5mRu9kCNrByUyZV4AVJTQh1LU/OsUho6DJ5/rB0Pp1vxj7/jVTWEScQ
 pJVNyA1HeJLJ8N9FuYfZNKqq1Er2uw9O4uakvaHllpze0uNirTnB3CMjx/2e7j4GokF8
 REaKxSp9sFuQwhnR5DzzoWQW24PIeZ8Dc3e+NU3zCQoWmrCHRdhCL9FtawKcwhDyurhk
 DmQ2zvpyxPiBFegeGmrszPU6YcuGsvUQAKUgldUJsgPr27oeMMA4kprmugcHdZTVq3x/ og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b5stcy44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 12:08:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7634C10003E;
 Tue, 14 Apr 2020 12:08:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 57D602AE6A5;
 Tue, 14 Apr 2020 12:08:35 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 14 Apr
 2020 12:08:34 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 12:08:34 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 2/2] configs: migrate
 CONFIG_SYS_MTDPARTS_RUNTIME to defconfigs
Thread-Index: AQHWEkSony/5jfrmwkO1ij1zzn6pug==
Date: Tue, 14 Apr 2020 10:08:34 +0000
Message-ID: <ab7cd581-a9b0-11bc-cef3-ffd8ca84e34f@st.com>
References: <20200226092842.5413-1-patrick.delaunay@st.com>
 <20200226092842.5413-2-patrick.delaunay@st.com>
In-Reply-To: <20200226092842.5413-2-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <3D49A83AE8632D459E28D531F2DF83AF@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_02:2020-04-13,
 2020-04-14 signatures=0
Cc: Marek Vasut <marex@denx.de>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pascal Linder <pascal.linder@edu.hefr.ch>,
 Enric Balletbo i Serra <eballetbo@gmail.com>, Simon Glass <sjg@chromium.org>,
 Boris
 Brezillon <bbrezillon@kernel.org>, Kever Yang <kever.yang@rock-chips.com>, Ley
 Foon Tan <ley.foon.tan@intel.com>, Holger Brunck <holger.brunck@ch.abb.com>,
 Mario Six <mario.six@gdsys.cc>, Miquel Raynal <miquel.raynal@bootlin.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 2/2] configs: migrate
 CONFIG_SYS_MTDPARTS_RUNTIME to defconfigs
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

HI

On 2/26/20 10:28 AM, Patrick Delaunay wrote:
> Move CONFIG_SYS_MTDPARTS_RUNTIME into Kconfig done by moveconfig.py.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  configs/igep00x0_defconfig              | 1 +
>  configs/stm32mp15_basic_defconfig       | 1 +
>  configs/stm32mp15_dhcom_basic_defconfig | 1 +
>  configs/stm32mp15_optee_defconfig       | 1 +
>  configs/stm32mp15_trusted_defconfig     | 1 +
>  drivers/mtd/Kconfig                     | 7 +++++++
>  include/configs/omap3_igep00x0.h        | 2 --
>  include/configs/stm32mp1.h              | 5 -----
>  scripts/config_whitelist.txt            | 1 -
>  9 files changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/configs/igep00x0_defconfig b/configs/igep00x0_defconfig
> index e273f35e84..a5c301dbdb 100644
> --- a/configs/igep00x0_defconfig
> +++ b/configs/igep00x0_defconfig
> @@ -52,6 +52,7 @@ CONFIG_NET_RANDOM_ETHADDR=y
>  CONFIG_DM_MMC=y
>  CONFIG_MMC_OMAP_HS=y
>  CONFIG_MTD=y
> +CONFIG_SYS_MTDPARTS_RUNTIME=y
>  CONFIG_MTD_RAW_NAND=y
>  CONFIG_SYS_NAND_BUSWIDTH_16BIT=y
>  CONFIG_SPL_NAND_SIMPLE=y
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 4efb1bf9c2..85d0cd2b69 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -91,6 +91,7 @@ CONFIG_SUPPORT_EMMC_BOOT=y
>  CONFIG_STM32_SDMMC2=y
>  CONFIG_MTD=y
>  CONFIG_DM_MTD=y
> +CONFIG_SYS_MTDPARTS_RUNTIME=y
>  CONFIG_MTD_RAW_NAND=y
>  CONFIG_NAND_STM32_FMC2=y
>  CONFIG_MTD_SPI_NAND=y
> diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
> index 9b5e54748d..3b955cb8e6 100644
> --- a/configs/stm32mp15_dhcom_basic_defconfig
> +++ b/configs/stm32mp15_dhcom_basic_defconfig
> @@ -84,6 +84,7 @@ CONFIG_DM_MMC=y
>  CONFIG_SUPPORT_EMMC_BOOT=y
>  CONFIG_STM32_SDMMC2=y
>  CONFIG_MTD=y
> +CONFIG_SYS_MTDPARTS_RUNTIME=y
>  CONFIG_DM_SPI_FLASH=y
>  CONFIG_SPI_FLASH_MACRONIX=y
>  CONFIG_SPI_FLASH_SPANSION=y
> diff --git a/configs/stm32mp15_optee_defconfig b/configs/stm32mp15_optee_defconfig
> index 54135b28aa..771381a7ad 100644
> --- a/configs/stm32mp15_optee_defconfig
> +++ b/configs/stm32mp15_optee_defconfig
> @@ -78,6 +78,7 @@ CONFIG_SUPPORT_EMMC_BOOT=y
>  CONFIG_STM32_SDMMC2=y
>  CONFIG_MTD=y
>  CONFIG_DM_MTD=y
> +CONFIG_SYS_MTDPARTS_RUNTIME=y
>  CONFIG_MTD_RAW_NAND=y
>  CONFIG_NAND_STM32_FMC2=y
>  CONFIG_MTD_SPI_NAND=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index d7d0b6c296..d777978197 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -77,6 +77,7 @@ CONFIG_SUPPORT_EMMC_BOOT=y
>  CONFIG_STM32_SDMMC2=y
>  CONFIG_MTD=y
>  CONFIG_DM_MTD=y
> +CONFIG_SYS_MTDPARTS_RUNTIME=y
>  CONFIG_MTD_RAW_NAND=y
>  CONFIG_NAND_STM32_FMC2=y
>  CONFIG_MTD_SPI_NAND=y
> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> index 5e7571cf3d..348b43e653 100644
> --- a/drivers/mtd/Kconfig
> +++ b/drivers/mtd/Kconfig
> @@ -22,6 +22,13 @@ config MTD_NOR_FLASH
>  	help
>  	  Enable support for parallel NOR flash.
>  
> +config SYS_MTDPARTS_RUNTIME
> +	bool "Allow MTDPARTS to be configured at runtime"
> +	depends on MTD
> +	help
> +	  This option allows to call the function board_mtdparts_default to
> +	  dynamically build the variables mtdids and mtdparts at runtime.
> +
>  config FLASH_CFI_DRIVER
>  	bool "Enable CFI Flash driver"
>  	help
> diff --git a/include/configs/omap3_igep00x0.h b/include/configs/omap3_igep00x0.h
> index 4ad7dc18b1..8dc30be8b7 100644
> --- a/include/configs/omap3_igep00x0.h
> +++ b/include/configs/omap3_igep00x0.h
> @@ -71,8 +71,6 @@
>  
>  #endif
>  
> -#define CONFIG_SYS_MTDPARTS_RUNTIME
> -
>  /* OneNAND config */
>  #define CONFIG_USE_ONENAND_BOARD_INIT
>  #define CONFIG_SYS_ONENAND_BASE		ONENAND_MAP
> diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
> index 592638072a..f451edad36 100644
> --- a/include/configs/stm32mp1.h
> +++ b/include/configs/stm32mp1.h
> @@ -85,11 +85,6 @@
>  #define CONFIG_SYS_AUTOLOAD		"no"
>  #endif
>  
> -/* Dynamic MTD partition support */
> -#if defined(CONFIG_STM32_QSPI) || defined(CONFIG_NAND_STM32_FMC2)
> -#define CONFIG_SYS_MTDPARTS_RUNTIME
> -#endif
> -
>  #ifdef CONFIG_DM_VIDEO
>  #define CONFIG_VIDEO_BMP_RLE8
>  #define CONFIG_BMP_16BPP
> diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
> index 85d55b182e..7c282cc976 100644
> --- a/scripts/config_whitelist.txt
> +++ b/scripts/config_whitelist.txt
> @@ -3198,7 +3198,6 @@ CONFIG_SYS_MRAM_SIZE
>  CONFIG_SYS_MSC0_VAL
>  CONFIG_SYS_MSC1_VAL
>  CONFIG_SYS_MSC2_VAL
> -CONFIG_SYS_MTDPARTS_RUNTIME
>  CONFIG_SYS_MX5_CLK32
>  CONFIG_SYS_MX5_HCLK
>  CONFIG_SYS_MX6_CLK32

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
