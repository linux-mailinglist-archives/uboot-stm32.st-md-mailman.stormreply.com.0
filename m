Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE233349526
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Mar 2021 16:16:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF00BC57B5E;
	Thu, 25 Mar 2021 15:16:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FF37C5662E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 15:16:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12PFCYmp011855; Thu, 25 Mar 2021 16:16:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=73L29bol2Z54bS7Vr+LYs0E3de16QkuGf3xfu+w/fYs=;
 b=QBrdaB6svNGTeW2s96+SoqFo/2M85yoduQgQ5omIQh80GFqJVWGY5tDJJCYYFxlPnK82
 UwfiaELpdeEvnsZXa4tiWogqGtlDs0pEmqaKobFUSuxCyFpkkaJPuXkdC34MnXu2p9oE
 1oY9xAiOZt9690wYM+vi37kt/w8OBJzIIGe2ReqKg8tUuWKbKZUP6sj5B/3m32lcvTi1
 kXX1gHzpHzb4PgtrhEwAy2lbb6B8foJV8E5XsGjtLVduzqt9qse/lrfq+z23UFWqBISB
 AzVKGwkrbOuveipsTe4eRYyw4JQwmgmKgIrE8saKKhI4Qp2SWOjQkAV5Ft1VPW3/cMqn Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37d8tpwcvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 16:16:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BB1E7100034;
 Thu, 25 Mar 2021 16:16:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A109B276A8A;
 Thu, 25 Mar 2021 16:16:33 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 25 Mar
 2021 16:16:32 +0100
To: <dillon.minfei@gmail.com>, <kever.yang@rock-chips.com>,
 <andre.przywara@arm.com>, <priyanka.jain@nxp.com>,
 <jagan@amarulasolutions.com>, <narmstrong@baylibre.com>,
 <marex@denx.de>, <aford173@gmail.com>, <ioana.ciornei@nxp.com>,
 <josip.kelecic@sartura.hr>, <festevam@gmail.com>, <hs@denx.de>,
 <heiko.stuebner@theobroma-systems.com>, <u-boot@lists.denx.de>,
 <patrick.delaunay@foss.st.com>, <uboot-stm32@st-md-mailman.stormreply.com>
References: <1615445040-13757-1-git-send-email-dillon.minfei@gmail.com>
 <1615445040-13757-4-git-send-email-dillon.minfei@gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <61b57b2c-df5b-8851-60b8-deb711d5bb88@foss.st.com>
Date: Thu, 25 Mar 2021 16:16:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1615445040-13757-4-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-25_04:2021-03-24,
 2021-03-25 signatures=0
Subject: Re: [Uboot-stm32] [PATCH 3/4] board: Add rt-thread art-pi board
	support
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

Hi Dillon

some remarks below

On 3/11/21 7:43 AM, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> This patch adds support for rt-thread art-pi board.
> 
> for more information about art-pi, please goto:
> https://art-pi.gitee.io/website/
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>  arch/arm/mach-stm32/stm32h7/Kconfig          |  4 ++
>  board/st/stm32h750-art-pi/Kconfig            | 19 +++++++++
>  board/st/stm32h750-art-pi/MAINTAINERS        |  7 ++++
>  board/st/stm32h750-art-pi/Makefile           |  6 +++
>  board/st/stm32h750-art-pi/stm32h750-art-pi.c | 58 ++++++++++++++++++++++++++++
>  configs/stm32h750-art-pi_defconfig           | 51 ++++++++++++++++++++++++
>  include/configs/stm32h750-art-pi.h           | 48 +++++++++++++++++++++++
>  7 files changed, 193 insertions(+)
>  create mode 100644 board/st/stm32h750-art-pi/Kconfig
>  create mode 100644 board/st/stm32h750-art-pi/MAINTAINERS
>  create mode 100644 board/st/stm32h750-art-pi/Makefile
>  create mode 100644 board/st/stm32h750-art-pi/stm32h750-art-pi.c
>  create mode 100644 configs/stm32h750-art-pi_defconfig
>  create mode 100644 include/configs/stm32h750-art-pi.h
> 
> diff --git a/arch/arm/mach-stm32/stm32h7/Kconfig b/arch/arm/mach-stm32/stm32h7/Kconfig
> index 55e6217..70233a4 100644
> --- a/arch/arm/mach-stm32/stm32h7/Kconfig
> +++ b/arch/arm/mach-stm32/stm32h7/Kconfig
> @@ -6,7 +6,11 @@ config TARGET_STM32H743_DISCO
>  config TARGET_STM32H743_EVAL
>  	bool "STM32H743 Evaluation board"
>  
> +config TARGET_STM32H750_ART_PI
> +	bool "STM32H750 ART Pi board"
> +
>  source "board/st/stm32h743-eval/Kconfig"
>  source "board/st/stm32h743-disco/Kconfig"
> +source "board/st/stm32h750-art-pi/Kconfig"
>  
>  endif
> diff --git a/board/st/stm32h750-art-pi/Kconfig b/board/st/stm32h750-art-pi/Kconfig
> new file mode 100644
> index 0000000..c31b984
> --- /dev/null
> +++ b/board/st/stm32h750-art-pi/Kconfig
> @@ -0,0 +1,19 @@
> +if TARGET_STM32H750_ART_PI
> +
> +config SYS_BOARD
> +	string
> +	default "stm32h750-art-pi"
> +
> +config SYS_VENDOR
> +	string
> +	default "st"
> +
> +config SYS_SOC
> +	string
> +	default "stm32h7"
> +
> +config SYS_CONFIG_NAME
> +	string
> +	default "stm32h750-art-pi"
> +
> +endif
> diff --git a/board/st/stm32h750-art-pi/MAINTAINERS b/board/st/stm32h750-art-pi/MAINTAINERS
> new file mode 100644
> index 0000000..9578833
> --- /dev/null
> +++ b/board/st/stm32h750-art-pi/MAINTAINERS
> @@ -0,0 +1,7 @@
> +STM32H750 ART PI BOARD
> +M:	Dillon Min <dillon.minfei@gmail.com>
> +S:	Maintained
> +F:	board/st/stm32h750-art-pi
> +F:	include/configs/stm32h750-art-pi.h
> +F:	configs/stm32h750-art-pi_defconfig
> +F:	arch/arm/dts/stm32h7*
> diff --git a/board/st/stm32h750-art-pi/Makefile b/board/st/stm32h750-art-pi/Makefile
> new file mode 100644
> index 0000000..a06de87
> --- /dev/null
> +++ b/board/st/stm32h750-art-pi/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +#
> +# Copyright (C) 2021, RT-Thread - All Rights Reserved
> +# Author(s): Dillon Min, <dillon.minfei@gmail.com> for RT-Thread.
> +
> +obj-y	:= stm32h750-art-pi.o
> diff --git a/board/st/stm32h750-art-pi/stm32h750-art-pi.c b/board/st/stm32h750-art-pi/stm32h750-art-pi.c
> new file mode 100644
> index 0000000..405836a
> --- /dev/null
> +++ b/board/st/stm32h750-art-pi/stm32h750-art-pi.c
> @@ -0,0 +1,58 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
> + * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.

Update with 2021 and with your name.

> + */
> +
> +#include <common.h>
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
> +int board_early_init_f(void)
> +{
> +	return 0;
> +}
> +
> +u32 get_board_rev(void)
> +{
> +	return 0;
> +}
> +
> +int board_late_init(void)
> +{
> +	return 0;
> +}
> +
> +int board_init(void)
> +{
> +	gd->bd->bi_boot_params = gd->bd->bi_dram[0].start + 0x100;
> +	return 0;
> +}
> diff --git a/configs/stm32h750-art-pi_defconfig b/configs/stm32h750-art-pi_defconfig
> new file mode 100644
> index 0000000..a5c4cd7
> --- /dev/null
> +++ b/configs/stm32h750-art-pi_defconfig
> @@ -0,0 +1,51 @@
> +CONFIG_ARM=y
> +CONFIG_ARCH_STM32=y
> +CONFIG_SYS_TEXT_BASE=0x90000000
> +CONFIG_SYS_MALLOC_F_LEN=0xF00
> +CONFIG_NR_DRAM_BANKS=1
> +CONFIG_ENV_SIZE=0x2000
> +CONFIG_STM32H7=y
> +CONFIG_TARGET_STM32H750_ART_PI=y
> +CONFIG_DEFAULT_DEVICE_TREE="stm32h750i-art-pi"
> +CONFIG_DISTRO_DEFAULTS=y
> +CONFIG_BOOTDELAY=3
> +CONFIG_AUTOBOOT_KEYED=y
> +CONFIG_AUTOBOOT_PROMPT="Hit SPACE in %d seconds to stop autoboot.\n"
> +CONFIG_AUTOBOOT_STOP_STR=" "
> +# CONFIG_USE_BOOTCOMMAND is not set
> +CONFIG_DEFAULT_FDT_FILE="stm32h750i-art-pi"
> +# CONFIG_DISPLAY_CPUINFO is not set
> +CONFIG_BOARD_EARLY_INIT_F=y
> +CONFIG_BOARD_LATE_INIT=y
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
> +# CONFIG_NET is not set
> +CONFIG_DM_MMC=y
> +CONFIG_STM32_SDMMC2=y
> +# CONFIG_PINCTRL_FULL is not set
> +CONFIG_OF_LIBFDT_OVERLAY=y
> +CONFIG_BAUDRATE=2000000
> +CONFIG_USE_BOOTARGS=y
> +CONFIG_BOOTARGS="console=ttySTM0,2000000 root=/dev/ram rdinit=/linuxrc loglevel=8"
> +CONFIG_BOOTCOMMAND="bootm 90080000"
> +CONFIG_REQUIRE_SERIAL_CONSOLE=y
> +CONFIG_SERIAL_PRESENT=y
> +CONFIG_DM_SERIAL=y
> +CONFIG_STM32_SERIAL=y
> +CONFIG_FIT=y
> +CONFIG_FIT_EXTERNAL_OFFSET=0x0
> +CONFIG_FIT_ENABLE_SHA256_SUPPORT=y
> +CONFIG_FIT_FULL_CHECK=y
> +CONFIG_FIT_PRINT=y
> +CONFIG_LEGACY_IMAGE_FORMAT=y
> +CONFIG_SUPPORT_RAW_INITRD=y
> +CONFIG_USE_BOOTCOMMAND=y
> +CONFIG_DM_DMA=y
> diff --git a/include/configs/stm32h750-art-pi.h b/include/configs/stm32h750-art-pi.h
> new file mode 100644
> index 0000000..55132ac
> --- /dev/null
> +++ b/include/configs/stm32h750-art-pi.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
> + * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.

ditto

> + */
> +
> +#ifndef __CONFIG_H
> +#define __CONFIG_H
> +
> +#include <config.h>
> +#include <linux/sizes.h>
> +
> +/* For booting Linux, use the first 16MB of memory */
> +#define CONFIG_SYS_BOOTMAPSZ		(SZ_16M + SZ_8M)
> +
> +#define CONFIG_SYS_FLASH_BASE		0x90000000
> +#define CONFIG_SYS_INIT_SP_ADDR		0x24040000
> +
> +/*
> + * Configuration of the external SDRAM memory
> + */
> +#define CONFIG_SYS_LOAD_ADDR		0xC1800000
> +#define CONFIG_LOADADDR			0xC1800000
> +
> +#define CONFIG_SYS_HZ_CLOCK		1000000
> +
> +#define CONFIG_CMDLINE_TAG
> +#define CONFIG_SETUP_MEMORY_TAGS
> +#define CONFIG_INITRD_TAG
> +#define CONFIG_REVISION_TAG
> +
> +#define CONFIG_SYS_MAXARGS		16
> +#define CONFIG_SYS_MALLOC_LEN		(1 * 1024 * 1024)
> +
> +#define BOOT_TARGET_DEVICES(func) \
> +	func(MMC, mmc, 0)
> +
> +#include <config_distro_bootcmd.h>
> +#define CONFIG_EXTRA_ENV_SETTINGS				\
> +			"kernel_addr_r=0xC0008000\0"		\
> +			"fdtfile=stm32h743i-disco.dtb\0"	\

"fdtfile=stm32h750i-art-pi.dtb\0"

> +			"fdt_addr_r=0xC0408000\0"		\
> +			"scriptaddr=0xC0418000\0"		\
> +			"pxefile_addr_r=0xC0428000\0" \
> +			"ramdisk_addr_r=0xC0438000\0"		\
> +			BOOTENV
> +
> +#endif /* __CONFIG_H */
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
