Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EACA7421F40
	for <lists+uboot-stm32@lfdr.de>; Tue,  5 Oct 2021 09:08:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EDA1C5AB7E;
	Tue,  5 Oct 2021 07:08:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8F73C5AB7B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Oct 2021 07:08:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1956dwPf032451; 
 Tue, 5 Oct 2021 09:08:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=0asxng0OTwRxJFyQ8dYu+2adywiWmeiceuoeXuZAq6s=;
 b=73YrlK83cwaxWNgj4vE33ddBCA95PrwCGLPRegcvQ4YTM8je8Fzyj3MFVyq5bO2TRIWk
 lmpcNUGmFgsMSD7qc4wxyxvay9i9xqnW6XMVSsNrEQjRgmCiisYas1L24bul3gG56oZ+
 1dlPbZabjBnYnesIBfpMuqkhxAtIY1k9v/n2fttZLyg0vZtW0VJicp080SIGXfwJvgjb
 lsK9zel9BGVPgbOOuuImb44/g3VD39DKxuDQQmiPwwhrGobWXwH7U5/9VqlRdT7zcfIQ
 JxaDqU25wKo1R7u/+jfPT9cJUaR8tnbFyzsjNyN13B3PQ1KzViEHyAEe1FVz6RV7N1P6 vA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bg8kdth35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 09:08:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2F8B0100034;
 Tue,  5 Oct 2021 09:08:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D18DC21D387;
 Tue,  5 Oct 2021 09:08:11 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 5 Oct
 2021 09:08:10 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211004110532.1.I006395ca4c0d4d1a24dac3794ac25b42ab326f9e@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <f1eb2244-9e7d-0996-fff8-ae0bf231d267@foss.st.com>
Date: Tue, 5 Oct 2021 09:08:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211004110532.1.I006395ca4c0d4d1a24dac3794ac25b42ab326f9e@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
Cc: Bin Meng <bmeng.cn@gmail.com>, Priyanka Jain <priyanka.jain@nxp.com>,
 Simon Glass <sjg@chromium.org>, Rick Chen <rick@andestech.com>,
 Sean Anderson <seanga2@gmail.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] Convert CONFIG_STM32_FLASH to Kconfig
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

On 10/4/21 11:05 AM, Patrick Delaunay wrote:
> This converts the CONFIG_STM32_FLASH to Kconfig by using
> tools/moveconfig.py
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  configs/stm32f429-discovery_defconfig  | 1 +
>  configs/stm32f429-evaluation_defconfig | 1 +
>  configs/stm32f469-discovery_defconfig  | 1 +
>  configs/stm32f746-disco_defconfig      | 1 +
>  configs/stm32f769-disco_defconfig      | 1 +
>  drivers/mtd/Kconfig                    | 7 +++++++
>  include/configs/stm32f429-discovery.h  | 2 --
>  include/configs/stm32f429-evaluation.h | 2 --
>  include/configs/stm32f469-discovery.h  | 2 --
>  include/configs/stm32f746-disco.h      | 2 --
>  scripts/config_whitelist.txt           | 1 -
>  11 files changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/configs/stm32f429-discovery_defconfig b/configs/stm32f429-discovery_defconfig
> index b6388cf00a..ed96c370d5 100644
> --- a/configs/stm32f429-discovery_defconfig
> +++ b/configs/stm32f429-discovery_defconfig
> @@ -28,3 +28,4 @@ CONFIG_ENV_ADDR=0x8040000
>  # CONFIG_NET is not set
>  # CONFIG_MMC is not set
>  CONFIG_MTD_NOR_FLASH=y
> +CONFIG_STM32_FLASH=y
> diff --git a/configs/stm32f429-evaluation_defconfig b/configs/stm32f429-evaluation_defconfig
> index a75c269d9b..9cbd56c41e 100644
> --- a/configs/stm32f429-evaluation_defconfig
> +++ b/configs/stm32f429-evaluation_defconfig
> @@ -28,3 +28,4 @@ CONFIG_SYS_RELOC_GD_ENV_ADDR=y
>  # CONFIG_NET is not set
>  CONFIG_ARM_PL180_MMCI=y
>  CONFIG_MTD_NOR_FLASH=y
> +CONFIG_STM32_FLASH=y
> diff --git a/configs/stm32f469-discovery_defconfig b/configs/stm32f469-discovery_defconfig
> index ecca110850..85639e2a48 100644
> --- a/configs/stm32f469-discovery_defconfig
> +++ b/configs/stm32f469-discovery_defconfig
> @@ -30,6 +30,7 @@ CONFIG_ARM_PL180_MMCI=y
>  CONFIG_MTD=y
>  CONFIG_DM_MTD=y
>  CONFIG_MTD_NOR_FLASH=y
> +CONFIG_STM32_FLASH=y
>  CONFIG_DM_SPI_FLASH=y
>  CONFIG_SPI_FLASH_STMICRO=y
>  # CONFIG_PINCTRL_FULL is not set
> diff --git a/configs/stm32f746-disco_defconfig b/configs/stm32f746-disco_defconfig
> index 2694a32f7d..e5e7ef798c 100644
> --- a/configs/stm32f746-disco_defconfig
> +++ b/configs/stm32f746-disco_defconfig
> @@ -45,6 +45,7 @@ CONFIG_ARM_PL180_MMCI=y
>  CONFIG_MTD=y
>  CONFIG_DM_MTD=y
>  CONFIG_MTD_NOR_FLASH=y
> +CONFIG_STM32_FLASH=y
>  CONFIG_DM_SPI_FLASH=y
>  CONFIG_SPI_FLASH_MACRONIX=y
>  CONFIG_SPI_FLASH_STMICRO=y
> diff --git a/configs/stm32f769-disco_defconfig b/configs/stm32f769-disco_defconfig
> index 10af638840..bb122d691d 100644
> --- a/configs/stm32f769-disco_defconfig
> +++ b/configs/stm32f769-disco_defconfig
> @@ -44,6 +44,7 @@ CONFIG_ARM_PL180_MMCI=y
>  CONFIG_MTD=y
>  CONFIG_DM_MTD=y
>  CONFIG_MTD_NOR_FLASH=y
> +CONFIG_STM32_FLASH=y
>  CONFIG_DM_SPI_FLASH=y
>  CONFIG_SPI_FLASH_MACRONIX=y
>  CONFIG_SPI_FLASH_STMICRO=y
> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> index b303fabe0f..ed69ea114e 100644
> --- a/drivers/mtd/Kconfig
> +++ b/drivers/mtd/Kconfig
> @@ -109,6 +109,13 @@ config HBMC_AM654
>  	 This is the driver for HyperBus controller on TI's AM65x and
>  	 other SoCs
>  
> +config STM32_FLASH
> +	bool "STM32 MCU Flash driver"
> +	depends on ARCH_STM32
> +	help
> +	 This is the driver of embedded flash for some STMicroelectronics
> +	 STM32 MCU.
> +
>  source "drivers/mtd/nand/Kconfig"
>  
>  source "drivers/mtd/spi/Kconfig"
> diff --git a/include/configs/stm32f429-discovery.h b/include/configs/stm32f429-discovery.h
> index 525a5277d8..ef9525574d 100644
> --- a/include/configs/stm32f429-discovery.h
> +++ b/include/configs/stm32f429-discovery.h
> @@ -21,8 +21,6 @@
>  #define CONFIG_RED_LED			110
>  #define CONFIG_GREEN_LED		109
>  
> -#define CONFIG_STM32_FLASH
> -
>  #define CONFIG_SYS_HZ_CLOCK		1000000	/* Timer is clocked at 1MHz */
>  
>  #define CONFIG_SYS_CBSIZE		1024
> diff --git a/include/configs/stm32f429-evaluation.h b/include/configs/stm32f429-evaluation.h
> index 609b4c2c3b..c490e2d98b 100644
> --- a/include/configs/stm32f429-evaluation.h
> +++ b/include/configs/stm32f429-evaluation.h
> @@ -23,8 +23,6 @@
>  #define CONFIG_SYS_MAX_FLASH_SECT	12
>  #define CONFIG_SYS_MAX_FLASH_BANKS	2
>  
> -#define CONFIG_STM32_FLASH
> -
>  #define CONFIG_SYS_HZ_CLOCK		1000000	/* Timer is clocked at 1MHz */
>  
>  #define CONFIG_SYS_CBSIZE		1024
> diff --git a/include/configs/stm32f469-discovery.h b/include/configs/stm32f469-discovery.h
> index a8f6fbf9cf..246dc1f9c6 100644
> --- a/include/configs/stm32f469-discovery.h
> +++ b/include/configs/stm32f469-discovery.h
> @@ -23,8 +23,6 @@
>  #define CONFIG_SYS_MAX_FLASH_SECT	12
>  #define CONFIG_SYS_MAX_FLASH_BANKS	2
>  
> -#define CONFIG_STM32_FLASH
> -
>  #define CONFIG_SYS_HZ_CLOCK		1000000	/* Timer is clocked at 1MHz */
>  
>  #define CONFIG_SYS_CBSIZE		1024
> diff --git a/include/configs/stm32f746-disco.h b/include/configs/stm32f746-disco.h
> index c76d290a57..493699e950 100644
> --- a/include/configs/stm32f746-disco.h
> +++ b/include/configs/stm32f746-disco.h
> @@ -22,8 +22,6 @@
>  #define CONFIG_SYS_MAX_FLASH_SECT	8
>  #define CONFIG_SYS_MAX_FLASH_BANKS	1
>  
> -#define CONFIG_STM32_FLASH
> -
>  #define CONFIG_DW_GMAC_DEFAULT_DMA_PBL	(8)
>  #define CONFIG_DW_ALTDESCRIPTOR
>  
> diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
> index 61ae682dcd..e1e9d65e84 100644
> --- a/scripts/config_whitelist.txt
> +++ b/scripts/config_whitelist.txt
> @@ -1302,7 +1302,6 @@ CONFIG_STACKBASE
>  CONFIG_STANDALONE_LOAD_ADDR
>  CONFIG_STATIC_BOARD_REV
>  CONFIG_STD_DEVICES_SETTINGS
> -CONFIG_STM32_FLASH
>  CONFIG_STV0991
>  CONFIG_STV0991_HZ
>  CONFIG_STV0991_HZ_CLOCK
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
