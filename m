Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E896BAD197E
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Jun 2025 10:00:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A90C7C32E8E;
	Mon,  9 Jun 2025 08:00:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C16CC32E8D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jun 2025 08:00:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5597m3oB016958;
 Mon, 9 Jun 2025 10:00:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 YmS7FThwYPO4bMvsoBv1pT15zRFQAjEmzl9dhN9UZXg=; b=6OrZ9jpX8/3TdDfV
 AyCHweRQqpjerJuWK5SEL9akUKsYcuu4tD2JVTHsiora5dIBCFfYy1j6ctOhwLEm
 Ze7x/UWRjZofseaHIFjYpbiMMYM2VLisDh3BN4d/J/zRj35yh6wWY5FvZaSRPzUB
 Qr7hWvbvnbbh2SNFnfAWgvH4sE5jxncmoXIrJ3lQZzYQHnLW9O00v9irvt7LJc+r
 ck6gcFjfg4wr3dJIWn3TS122OTzlwPlvKBOJB4uewFQQ+0l7wv4gm7CErUDAszHW
 00Icppu1csd3g23WtRIrXGvcDqHeJL5vxOnsz5+QLu9hFkHYZU1F5BQTmcGvvn5K
 4qERoA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cahdxqm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 10:00:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 91B3F40044;
 Mon,  9 Jun 2025 09:59:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B69F6B729EB;
 Mon,  9 Jun 2025 09:58:42 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 09:58:42 +0200
Message-ID: <316dd0c7-c7b8-407d-b34a-b5b90f056b94@foss.st.com>
Date: Mon, 9 Jun 2025 09:58:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
 <20250607093730.2249536-10-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250607093730.2249536-10-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_03,2025-06-05_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH 9/9] board: stm32: add stm32h747-discovery
	board support
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



On 6/7/25 11:37, Dario Binacchi wrote:
> The board includes an STM32H747XI SoC with the following resources:
>  - 2 Mbytes Flash
>  - 1 Mbyte SRAM
>  - LCD-TFT controller
>  - MIPI-DSI interface
>  - FD-CAN
>  - USB 2.0 high-speed/full-speed
>  - Ethernet MAC
>  - camera interface
> 
> Detailed information can be found at:
> https://www.st.com/en/evaluation-tools/stm32h747i-disco.html
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
>  arch/arm/mach-stm32/stm32h7/Kconfig        |  4 +++
>  board/st/stm32h747-disco/Kconfig           | 15 ++++++++
>  board/st/stm32h747-disco/MAINTAINERS       |  7 ++++
>  board/st/stm32h747-disco/Makefile          |  6 ++++
>  board/st/stm32h747-disco/stm32h747-disco.c | 42 ++++++++++++++++++++++
>  configs/stm32h747-disco_defconfig          | 35 ++++++++++++++++++
>  drivers/clk/stm32/clk-stm32h7.c            |  5 +++
>  include/configs/stm32h747-disco.h          | 32 +++++++++++++++++
>  8 files changed, 146 insertions(+)
>  create mode 100644 board/st/stm32h747-disco/Kconfig
>  create mode 100644 board/st/stm32h747-disco/MAINTAINERS
>  create mode 100644 board/st/stm32h747-disco/Makefile
>  create mode 100644 board/st/stm32h747-disco/stm32h747-disco.c
>  create mode 100644 configs/stm32h747-disco_defconfig
>  create mode 100644 include/configs/stm32h747-disco.h
> 
> diff --git a/arch/arm/mach-stm32/stm32h7/Kconfig b/arch/arm/mach-stm32/stm32h7/Kconfig
> index 70233a4b23cd..72f20c477d04 100644
> --- a/arch/arm/mach-stm32/stm32h7/Kconfig
> +++ b/arch/arm/mach-stm32/stm32h7/Kconfig
> @@ -6,11 +6,15 @@ config TARGET_STM32H743_DISCO
>  config TARGET_STM32H743_EVAL
>  	bool "STM32H743 Evaluation board"
>  
> +config TARGET_STM32H747_DISCO
> +	bool "STM32H747 Discovery board"
> +
>  config TARGET_STM32H750_ART_PI
>  	bool "STM32H750 ART Pi board"
>  
>  source "board/st/stm32h743-eval/Kconfig"
>  source "board/st/stm32h743-disco/Kconfig"
> +source "board/st/stm32h747-disco/Kconfig"
>  source "board/st/stm32h750-art-pi/Kconfig"
>  
>  endif
> diff --git a/board/st/stm32h747-disco/Kconfig b/board/st/stm32h747-disco/Kconfig
> new file mode 100644
> index 000000000000..a7b2c09a327f
> --- /dev/null
> +++ b/board/st/stm32h747-disco/Kconfig
> @@ -0,0 +1,15 @@
> +if TARGET_STM32H747_DISCO
> +
> +config SYS_BOARD
> +	default "stm32h747-disco"
> +
> +config SYS_VENDOR
> +	default "st"
> +
> +config SYS_SOC
> +	default "stm32h7"
> +
> +config SYS_CONFIG_NAME
> +	default "stm32h747-disco"
> +
> +endif
> diff --git a/board/st/stm32h747-disco/MAINTAINERS b/board/st/stm32h747-disco/MAINTAINERS
> new file mode 100644
> index 000000000000..d48649f773f3
> --- /dev/null
> +++ b/board/st/stm32h747-disco/MAINTAINERS
> @@ -0,0 +1,7 @@
> +STM32H747 DISCOVERY BOARD
> +M:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +S:	Maintained
> +F:	board/st/stm32h747-disco
> +F:	include/configs/stm32h747-disco.h
> +F:	configs/stm32h747-disco_defconfig
> +F:	arch/arm/dts/stm32h747*
> diff --git a/board/st/stm32h747-disco/Makefile b/board/st/stm32h747-disco/Makefile
> new file mode 100644
> index 000000000000..e11f052cc88f
> --- /dev/null
> +++ b/board/st/stm32h747-disco/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +#
> +# Copyright (c) 2025 Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +#
> +
> +obj-y	:= stm32h747-disco.o
> diff --git a/board/st/stm32h747-disco/stm32h747-disco.c b/board/st/stm32h747-disco/stm32h747-disco.c
> new file mode 100644
> index 000000000000..be0884bdeb4d
> --- /dev/null
> +++ b/board/st/stm32h747-disco/stm32h747-disco.c
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * stm32h747i-disco support
> + *
> + * Copyright (C) 2025 Dario Binacchi <dario.binacchi@amarulasolutions.com>
> + */
> +
> +#include <dm.h>
> +#include <init.h>
> +#include <log.h>
> +#include <asm/global_data.h>
> +
> +DECLARE_GLOBAL_DATA_PTR;
> +
> +int dram_init(void)
> +{
> +	struct udevice *dev;
> +	int ret;
> +
> +	ret = uclass_get_device(UCLASS_RAM, 0, &dev);
> +	if (ret) {
> +		debug("DRAM init failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (fdtdec_setup_mem_size_base() != 0)
> +		ret = -EINVAL;
> +
> +	return ret;
> +}
> +
> +int dram_init_banksize(void)
> +{
> +	fdtdec_setup_memory_banksize();
> +
> +	return 0;
> +}
> +
> +int board_init(void)
> +{
> +	return 0;
> +}
> diff --git a/configs/stm32h747-disco_defconfig b/configs/stm32h747-disco_defconfig
> new file mode 100644
> index 000000000000..8a0c72450d1e
> --- /dev/null
> +++ b/configs/stm32h747-disco_defconfig
> @@ -0,0 +1,35 @@
> +CONFIG_ARM=y
> +CONFIG_ARCH_STM32=y
> +CONFIG_TEXT_BASE=0x08000000
> +CONFIG_SYS_MALLOC_LEN=0x100000
> +CONFIG_NR_DRAM_BANKS=1
> +CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
> +CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x24040000
> +CONFIG_ENV_SIZE=0x2000
> +CONFIG_DEFAULT_DEVICE_TREE="st/stm32h747i-disco"
> +CONFIG_OF_LIBFDT_OVERLAY=y
> +CONFIG_SYS_LOAD_ADDR=0xd0400000
> +CONFIG_STM32H7=y
> +CONFIG_TARGET_STM32H747_DISCO=y
> +CONFIG_DISTRO_DEFAULTS=y
> +CONFIG_BOOTDELAY=3
> +CONFIG_AUTOBOOT_KEYED=y
> +CONFIG_AUTOBOOT_PROMPT="Hit SPACE in %d seconds to stop autoboot.\n"
> +CONFIG_AUTOBOOT_STOP_STR=" "
> +CONFIG_DEFAULT_FDT_FILE="stm32h747i-disco"
> +CONFIG_SYS_CBSIZE=256
> +CONFIG_SYS_PBSIZE=282
> +# CONFIG_DISPLAY_CPUINFO is not set
> +CONFIG_SYS_PROMPT="U-Boot > "
> +CONFIG_CMD_GPT=y
> +CONFIG_CMD_MMC=y
> +# CONFIG_CMD_SETEXPR is not set
> +CONFIG_CMD_CACHE=y
> +CONFIG_CMD_TIMER=y
> +CONFIG_CMD_EXT4_WRITE=y
> +# CONFIG_ISO_PARTITION is not set
> +CONFIG_OF_CONTROL=y
> +CONFIG_SYS_RELOC_GD_ENV_ADDR=y
> +CONFIG_NO_NET=y
> +CONFIG_STM32_SDMMC2=y
> +# CONFIG_PINCTRL_FULL is not set
> diff --git a/drivers/clk/stm32/clk-stm32h7.c b/drivers/clk/stm32/clk-stm32h7.c
> index 6acf2ff0a8fb..aa3be414a29f 100644
> --- a/drivers/clk/stm32/clk-stm32h7.c
> +++ b/drivers/clk/stm32/clk-stm32h7.c
> @@ -114,6 +114,7 @@
>  #define		QSPISRC_PER_CK		3
>  
>  #define PWR_CR3				0x0c
> +#define PWR_CR3_LDOEN			BIT(1)
>  #define PWR_CR3_SCUEN			BIT(2)
>  #define PWR_D3CR			0x18
>  #define PWR_D3CR_VOS_MASK		GENMASK(15, 14)
> @@ -375,7 +376,11 @@ int configure_clocks(struct udevice *dev)
>  	clrsetbits_le32(pwr_base + PWR_D3CR, PWR_D3CR_VOS_MASK,
>  			VOS_SCALE_1 << PWR_D3CR_VOS_SHIFT);
>  	/* Lock supply configuration update */
> +#if IS_ENABLED(CONFIG_TARGET_STM32H747_DISCO)
> +	clrbits_le32(pwr_base + PWR_CR3, PWR_CR3_LDOEN);
> +#else
>  	clrbits_le32(pwr_base + PWR_CR3, PWR_CR3_SCUEN);
> +#endif
>  	while (!(readl(pwr_base + PWR_D3CR) & PWR_D3CR_VOSREADY))
>  		;
>  
> diff --git a/include/configs/stm32h747-disco.h b/include/configs/stm32h747-disco.h
> new file mode 100644
> index 000000000000..393445a8ae1f
> --- /dev/null
> +++ b/include/configs/stm32h747-disco.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2025 Dario Binacchi <dario.binacchi@amarulasolutions.com>
> + */
> +
> +#ifndef __CONFIG_H
> +#define __CONFIG_H
> +
> +#include <config.h>
> +#include <linux/sizes.h>
> +
> +/* For booting Linux, use the first 16MB of memory */
> +#define CFG_SYS_BOOTMAPSZ		SZ_16M
> +
> +#define CFG_SYS_FLASH_BASE		0x08000000
> +
> +#define CFG_SYS_HZ_CLOCK		1000000
> +
> +#define BOOT_TARGET_DEVICES(func) \
> +	func(MMC, mmc, 0)
> +
> +#include <config_distro_bootcmd.h>
> +#define CFG_EXTRA_ENV_SETTINGS				\
> +			"kernel_addr_r=0xD0008000\0"		\
> +			"fdtfile=stm32h747i-disco.dtb\0"	\
> +			"fdt_addr_r=0xD0408000\0"		\
> +			"scriptaddr=0xD0418000\0"		\
> +			"pxefile_addr_r=0xD0428000\0" \
> +			"ramdisk_addr_r=0xD0438000\0"		\
> +			BOOTENV
> +
> +#endif /* __CONFIG_H */
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
