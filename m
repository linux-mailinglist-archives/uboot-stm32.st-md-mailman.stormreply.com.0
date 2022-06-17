Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C28054F3B2
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jun 2022 10:57:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34712C5F1F2;
	Fri, 17 Jun 2022 08:57:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A456C5F1EE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jun 2022 08:57:10 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25H4GZsa008247;
 Fri, 17 Jun 2022 10:57:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=GmpJ/+Wn8SxAmx+KIj5YMt015vUb8PJ4XGKe2IGKXu8=;
 b=d3ywCx37FRybC2R/r6HyVXpMW3jvIh0Rr/evjWG6mZk55oM8Ob95OlrVebuHQXdQ64Ei
 2KWSpie2eu8NJwWydREcYGeq9zinz9M/xCnpTmPTl5yPBN2i8pUtwCwW71vR7KpUiAPH
 AT0P8tKRAC96XRyF2B79PBEKil/RX2PGMLLYDvQrv4w8s5lcAvzh0Bvb7WbO/FYF+xrI
 lKJDZoYvwcRI054EJIrsYw6h1qQ1O3RY4Ab0/L5IxBgmjmCiCzG6s5AkbFtzIHdGRahr
 4ZqMj30OTYoUFbOTCfw1NQAo7QnwpjkEkrp1u4HIwwpqwYfgBytU4JoJIxPb0yFePZvj Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gqeb14rt3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jun 2022 10:57:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 24CB710002A;
 Fri, 17 Jun 2022 10:57:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1BD7D212308;
 Fri, 17 Jun 2022 10:57:08 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.118) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 17 Jun
 2022 10:57:07 +0200
Message-ID: <f8b7fc19-b25c-ee83-de30-3105a875c464@foss.st.com>
Date: Fri, 17 Jun 2022 10:57:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
 <20220506160540.8.I48a2a2211b9cf24a69030c1499ddeb0a507025d2@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220506160540.8.I48a2a2211b9cf24a69030c1499ddeb0a507025d2@changeid>
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-17_08,2022-06-16_01,2022-02-23_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 08/16] arm: stm32mp: add support of
	STM32MP13x
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

Some ad

On 5/6/22 16:06, Patrick Delaunay wrote:
> Introduce the code in mach-stm32mp and the configuration file
> stm32mp13_defconfig for the new STM32MP family.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   arch/arm/mach-stm32mp/Kconfig                 |  21 +++-
>   arch/arm/mach-stm32mp/Kconfig.13x             |  57 +++++++++
>   arch/arm/mach-stm32mp/Makefile                |   1 +
>   arch/arm/mach-stm32mp/cpu.c                   |   3 +
>   arch/arm/mach-stm32mp/fdt.c                   |   3 +
>   arch/arm/mach-stm32mp/include/mach/stm32.h    |  26 ++++
>   .../arm/mach-stm32mp/include/mach/sys_proto.h |  16 ++-
>   arch/arm/mach-stm32mp/stm32mp13x.c            | 115 ++++++++++++++++++
>   board/st/stm32mp1/Kconfig                     |  15 +++
>   board/st/stm32mp1/MAINTAINERS                 |   2 +
>   configs/stm32mp15_basic_defconfig             |   2 +-
>   configs/stm32mp15_defconfig                   |   2 +-
>   configs/stm32mp15_trusted_defconfig           |   2 +-
>   include/configs/stm32mp13_common.h            | 106 ++++++++++++++++
>   include/configs/stm32mp13_st_common.h         |  17 +++
>   include/configs/stm32mp15_common.h            |   4 +-
>   16 files changed, 385 insertions(+), 7 deletions(-)
>   create mode 100644 arch/arm/mach-stm32mp/Kconfig.13x
>   create mode 100644 arch/arm/mach-stm32mp/stm32mp13x.c
>   create mode 100644 include/configs/stm32mp13_common.h
>   create mode 100644 include/configs/stm32mp13_st_common.h
>

[...]


> diff --git a/include/configs/stm32mp13_common.h b/include/configs/stm32mp13_common.h
> new file mode 100644
> index 0000000000..799e3f053b
> --- /dev/null
> +++ b/include/configs/stm32mp13_common.h
> @@ -0,0 +1,106 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause */
> +/*
> + * Copyright (C) 2021, STMicroelectronics - All Rights Reserved
> + *
> + * Configuration settings for the STM32MP15x CPU
> + */
> +
> +#ifndef __CONFIG_STM32MP13_COMMMON_H
> +#define __CONFIG_STM32MP13_COMMMON_H
> +#include <linux/sizes.h>
> +#include <asm/arch/stm32.h>
> +
> +/*
> + * Configuration of the external SRAM memory used by U-Boot
> + */
> +#define CONFIG_SYS_SDRAM_BASE		STM32_DDR_BASE
> +#define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_TEXT_BASE + SZ_4M)


=> CONFIG_SYS_INIT_SP_ADDR remove and moved in Kconfig


> +
> +/*
> + * Console I/O buffer size
> + */
> +#define CONFIG_SYS_CBSIZE		SZ_1K


=> CONFIG_SYS_CBSIZE removed and moved in Kconfig


> +
> +/*
> + * For booting Linux, use the first 256 MB of memory, since this is
> + * the maximum mapped by the Linux kernel during initialization.
> + */
> +#define CONFIG_SYS_BOOTMAPSZ		SZ_256M
> +
> +/* Extend size of kernel image for uncompression */
> +#define CONFIG_SYS_BOOTM_LEN		SZ_32M
> +
> +/*MMC SD*/
> +#define CONFIG_SYS_MMC_MAX_DEVICE	2
> +
> +/* NAND support */
> +#define CONFIG_SYS_MAX_NAND_DEVICE	1
> +
> +/*****************************************************************************/
> +#ifdef CONFIG_DISTRO_DEFAULTS
> +/*****************************************************************************/
> +
> +#ifdef CONFIG_CMD_MMC
> +#define BOOT_TARGET_MMC0(func)	func(MMC, mmc, 0)
> +#define BOOT_TARGET_MMC1(func)	func(MMC, mmc, 1)
> +#else
> +#define BOOT_TARGET_MMC0(func)
> +#define BOOT_TARGET_MMC1(func)
> +#endif
> +
> +#define BOOT_TARGET_DEVICES(func)	\
> +	BOOT_TARGET_MMC1(func)		\
> +	BOOT_TARGET_MMC0(func)
> +
> +/*
> + * default bootcmd for stm32mp13:
> + * for mmc boot (eMMC, SD card), distro boot on the same mmc device
> + */
> +#define STM32MP_BOOTCMD "bootcmd_stm32mp=" \
> +	"echo \"Boot over ${boot_device}${boot_instance}!\";" \
> +		"run env_check;" \
> +		"if test ${boot_device} = mmc;" \
> +		"then env set boot_targets \"mmc${boot_instance}\"; fi;" \
> +		"run distro_bootcmd;" \
> +	"fi;\0"
> +
> +#define STM32MP_EXTRA \
> +	"env_check=if env info -p -d -q; then env save; fi\0" \
> +	"boot_net_usb_start=true\0"
> +
> +#ifndef STM32MP_BOARD_EXTRA_ENV
> +#define STM32MP_BOARD_EXTRA_ENV
> +#endif
> +
> +#include <config_distro_bootcmd.h>
> +
> +/*
> + * memory layout for 32M uncompressed/compressed kernel,
> + * 1M fdt, 1M script, 1M pxe and 1M for overlay
> + * and the ramdisk at the end.
> + */
> +#define __KERNEL_ADDR_R     __stringify(0xc2000000)
> +#define __FDT_ADDR_R        __stringify(0xc4000000)
> +#define __SCRIPT_ADDR_R     __stringify(0xc4100000)
> +#define __PXEFILE_ADDR_R    __stringify(0xc4200000)
> +#define __FDTOVERLAY_ADDR_R __stringify(0xc4300000)
> +#define __RAMDISK_ADDR_R    __stringify(0xc4400000)
> +
> +#define STM32MP_MEM_LAYOUT \
> +	"kernel_addr_r=" __KERNEL_ADDR_R "\0" \
> +	"fdt_addr_r=" __FDT_ADDR_R "\0" \
> +	"scriptaddr=" __SCRIPT_ADDR_R "\0" \
> +	"pxefile_addr_r=" __PXEFILE_ADDR_R "\0" \
> +	"fdtoverlay_addr_r=" __FDTOVERLAY_ADDR_R "\0" \
> +	"ramdisk_addr_r=" __RAMDISK_ADDR_R "\0"
> +
> +#define CONFIG_EXTRA_ENV_SETTINGS \
> +	STM32MP_MEM_LAYOUT \
> +	STM32MP_BOOTCMD \
> +	BOOTENV \
> +	STM32MP_EXTRA \
> +	STM32MP_BOARD_EXTRA_ENV
> +
> +#endif /* ifdef CONFIG_DISTRO_DEFAULTS*/
> +
> +#endif /* __CONFIG_STM32MP13_COMMMON_H */
> diff --git a/include/configs/stm32mp13_st_common.h b/include/configs/stm32mp13_st_common.h
> new file mode 100644
> index 0000000000..d73526f14e
> --- /dev/null
> +++ b/include/configs/stm32mp13_st_common.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause */
> +/*
> + * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
> + *
> + * Configuration settings for the STMicroelectonics STM32MP15x boards
> + */
> +
> +#ifndef __CONFIG_STM32MP13_ST_COMMON_H__
> +#define __CONFIG_STM32MP13_ST_COMMON_H__
> +
> +#define STM32MP_BOARD_EXTRA_ENV \
> +	"usb_pgood_delay=1000\0" \
> +	"console=ttySTM0\0"
> +
> +#include <configs/stm32mp13_common.h>
> +
> +#endif


[...]


Applied to u-boot-stm/next, with these modification

thanks!

Regards
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
