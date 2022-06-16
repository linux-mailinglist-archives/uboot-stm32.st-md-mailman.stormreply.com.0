Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EE354DB2C
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 Jun 2022 09:02:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEF3EC035BF;
	Thu, 16 Jun 2022 07:02:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD18DC32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jun 2022 07:02:47 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25G6GdsY015307;
 Thu, 16 Jun 2022 09:02:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=3CJzBB9CW/kNJBqMQv4lO6uldKWElNL7xJXFlIMKfRk=;
 b=qYBe+a5RnWLCjMSp5rnLi92F/VuOZxiUrvnoIQeedqRcj9hG3ZpvVKShg034gnaHbPg6
 mYejQ6/T6c7yGWjv9yn9+HaTpSWxCF0iU/CrwpCt0+gMRIZlrB62YQktGbfnEwc+7HEm
 Mr5ZlQtFFE1k7OLaSbFfxoZ6aRLY4l42kCwcYq23GBbpfYIbDnlC81J5fX0JzIj+x88Q
 hvqwYth82DWpqjJIV2CeCMOmWCrgohrUuzoADIF5FVenNntTW6QA5GpY/ldKEIQoThSy
 y03wZMB10Amww73x4xYXqbMuzF2rJI56a4JSpKTfpn7cQqrBvdCD+H/IyUpQxQNK65PL 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gmjd27ysv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jun 2022 09:02:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7BF47100080;
 Thu, 16 Jun 2022 09:02:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C8E120FA2C;
 Thu, 16 Jun 2022 09:02:04 +0200 (CEST)
Received: from [10.201.20.162] (10.201.20.162) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 16 Jun
 2022 09:02:00 +0200
Message-ID: <547c028c-a82c-050e-5650-59af18e77048@foss.st.com>
Date: Thu, 16 Jun 2022 09:01:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220520183718.1.I3ee35f18672107aad869bbd4b3e53957b16cb304@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220520183718.1.I3ee35f18672107aad869bbd4b3e53957b16cb304@changeid>
X-Originating-IP: [10.201.20.162]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-16_02,2022-06-15_01,2022-02-23_01
Cc: Vignesh R <vigneshr@ti.com>, vipin.kumar@st.com,
 Joe Hershberger <joe.hershberger@ni.com>, U-Boot
 STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Dylan Hung <dylan_hung@aspeedtech.com>, Marek Vasut <marex@denx.de>,
 Mark Kettenis <kettenis@openbsd.org>, Samuel Holland <samuel@sholland.org>,
 Lukasz Majewski <lukma@denx.de>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Ramon Fried <rfried.dev@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Heiko Schocher <hs@denx.de>, Vikas Manocha <vikas.manocha@st.com>,
 Bharat Gooty <bharat.gooty@broadcom.com>, armando.visconti@st.com,
 Andre Przywara <andre.przywara@arm.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 Yuan Fang <fangyuanseu@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp1: fix reference for
	STMicroelectronics
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

On 5/20/22 18:38, Patrick Delaunay wrote:
> Replace reference to the correct name STMicroelectronics
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/Kconfig                      | 2 +-
>  arch/arm/cpu/armv7/stv0991/lowlevel.S | 2 +-
>  arch/arm/mach-sti/Kconfig             | 2 +-
>  drivers/i2c/designware_i2c.c          | 2 +-
>  drivers/i2c/designware_i2c.h          | 2 +-
>  drivers/i2c/designware_i2c_pci.c      | 2 +-
>  drivers/mtd/nand/raw/fsmc_nand.c      | 4 ++--
>  drivers/mtd/spi/spi-nor-ids.c         | 2 +-
>  drivers/net/designware.c              | 2 +-
>  drivers/net/designware.h              | 2 +-
>  drivers/pinctrl/Kconfig               | 2 +-
>  drivers/spi/pl022_spi.c               | 2 +-
>  drivers/usb/gadget/designware_udc.c   | 2 +-
>  include/configs/stm32mp15_st_common.h | 2 +-
>  include/elf.h                         | 4 ++--
>  include/linux/mtd/fsmc_nand.h         | 2 +-
>  include/usb/designware_udc.h          | 2 +-
>  17 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 5f24ffc0f3..53679b084c 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1923,7 +1923,7 @@ config ARCH_STM32
>  	imply CMD_DM
>  
>  config ARCH_STI
> -	bool "Support STMicrolectronics SoCs"
> +	bool "Support STMicroelectronics SoCs"
>  	select BLK
>  	select CPU_V7A
>  	select DM
> diff --git a/arch/arm/cpu/armv7/stv0991/lowlevel.S b/arch/arm/cpu/armv7/stv0991/lowlevel.S
> index 218ac70f32..5733eaa15c 100644
> --- a/arch/arm/cpu/armv7/stv0991/lowlevel.S
> +++ b/arch/arm/cpu/armv7/stv0991/lowlevel.S
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0+ */
>  /*
> - * (C) Copyright 2014 stmicroelectronics
> + * (C) Copyright 2014 STMicroelectronics
>   */
>  
>  #include <config.h>
> diff --git a/arch/arm/mach-sti/Kconfig b/arch/arm/mach-sti/Kconfig
> index f9a583af8d..d9e264024c 100644
> --- a/arch/arm/mach-sti/Kconfig
> +++ b/arch/arm/mach-sti/Kconfig
> @@ -9,7 +9,7 @@ choice
>  config TARGET_STIH410_B2260
>  	bool "96Boards STiH410-B2260"
>  	help
> -	  Support for 96Board STiH410-B2260 based on STMicrolectronics
> +	  Support for 96Board STiH410-B2260 based on STMicroelectronics
>  	  STiH410 soc. This board complies with 96Board Open Platform
>  	  Specifications. Features:
>  	  - 1GB DDR
> diff --git a/drivers/i2c/designware_i2c.c b/drivers/i2c/designware_i2c.c
> index 1aae6b64ba..e54de42abc 100644
> --- a/drivers/i2c/designware_i2c.c
> +++ b/drivers/i2c/designware_i2c.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
>   * (C) Copyright 2009
> - * Vipin Kumar, ST Micoelectronics, vipin.kumar@st.com.
> + * Vipin Kumar, STMicroelectronics, vipin.kumar@st.com.
>   */
>  
>  #include <common.h>
> diff --git a/drivers/i2c/designware_i2c.h b/drivers/i2c/designware_i2c.h
> index a9c50c90ac..049976e8a2 100644
> --- a/drivers/i2c/designware_i2c.h
> +++ b/drivers/i2c/designware_i2c.h
> @@ -1,7 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0+ */
>  /*
>   * (C) Copyright 2009
> - * Vipin Kumar, ST Micoelectronics, vipin.kumar@st.com.
> + * Vipin Kumar, STMicroelectronics, vipin.kumar@st.com.
>   */
>  
>  #ifndef __DW_I2C_H_
> diff --git a/drivers/i2c/designware_i2c_pci.c b/drivers/i2c/designware_i2c_pci.c
> index 1572c2c6bc..46c2545f21 100644
> --- a/drivers/i2c/designware_i2c_pci.c
> +++ b/drivers/i2c/designware_i2c_pci.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
>   * (C) Copyright 2009
> - * Vipin Kumar, ST Micoelectronics, vipin.kumar@st.com.
> + * Vipin Kumar, STMicroelectronics, vipin.kumar@st.com.
>   * Copyright 2019 Google Inc
>   */
>  
> diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
> index 5d197ce0c5..a92c6252a5 100644
> --- a/drivers/mtd/nand/raw/fsmc_nand.c
> +++ b/drivers/mtd/nand/raw/fsmc_nand.c
> @@ -1,10 +1,10 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
>   * (C) Copyright 2010
> - * Vipin Kumar, ST Microelectronics, vipin.kumar@st.com.
> + * Vipin Kumar, STMicroelectronics, vipin.kumar@st.com.
>   *
>   * (C) Copyright 2012
> - * Amit Virdi, ST Microelectronics, amit.virdi@st.com.
> + * Amit Virdi, STMicroelectronics, amit.virdi@st.com.
>   */
>  
>  #include <common.h>
> diff --git a/drivers/mtd/spi/spi-nor-ids.c b/drivers/mtd/spi/spi-nor-ids.c
> index 7050ddc397..20cd4d7fc9 100644
> --- a/drivers/mtd/spi/spi-nor-ids.c
> +++ b/drivers/mtd/spi/spi-nor-ids.c
> @@ -280,7 +280,7 @@ const struct flash_info spi_nor_ids[] = {
>  	{ INFO("sst26wf064",  0xbf2643, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_HAS_SST26LOCK) },
>  #endif
>  #ifdef CONFIG_SPI_FLASH_STMICRO		/* STMICRO */
> -	/* ST Microelectronics -- newer production may have feature updates */
> +	/* STMicroelectronics -- newer production may have feature updates */
>  	{ INFO("m25p10",  0x202011,  0,  32 * 1024,   4, 0) },
>  	{ INFO("m25p20",  0x202012,  0,  64 * 1024,   4, 0) },
>  	{ INFO("m25p40",  0x202013,  0,  64 * 1024,   8, 0) },
> diff --git a/drivers/net/designware.c b/drivers/net/designware.c
> index 1584b9eac1..0e63f70934 100644
> --- a/drivers/net/designware.c
> +++ b/drivers/net/designware.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
>   * (C) Copyright 2010
> - * Vipin Kumar, ST Micoelectronics, vipin.kumar@st.com.
> + * Vipin Kumar, STMicroelectronics, vipin.kumar@st.com.
>   */
>  
>  /*
> diff --git a/drivers/net/designware.h b/drivers/net/designware.h
> index a82afb99ca..ddc3d4f150 100644
> --- a/drivers/net/designware.h
> +++ b/drivers/net/designware.h
> @@ -1,7 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0+ */
>  /*
>   * (C) Copyright 2010
> - * Vipin Kumar, ST Micoelectronics, vipin.kumar@st.com.
> + * Vipin Kumar, STMicroelectronics, vipin.kumar@st.com.
>   */
>  
>  #ifndef _DW_ETH_H
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 563d96d4f5..8a83f7e57f 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -272,7 +272,7 @@ config PINCTRL_STI
>  	depends on DM && ARCH_STI
>  	default y
>  	help
> -	  Support pin multiplexing control on STMicrolectronics STi SoCs.
> +	  Support pin multiplexing control on STMicroelectronics STi SoCs.
>  
>  	  The driver is controlled by a device tree node which contains both
>  	  the GPIO definitions and pin control functions for each available
> diff --git a/drivers/spi/pl022_spi.c b/drivers/spi/pl022_spi.c
> index ea1691438b..828eab3d34 100644
> --- a/drivers/spi/pl022_spi.c
> +++ b/drivers/spi/pl022_spi.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
>   * (C) Copyright 2012
> - * Armando Visconti, ST Microelectronics, armando.visconti@st.com.
> + * Armando Visconti, STMicroelectronics, armando.visconti@st.com.
>   *
>   * (C) Copyright 2018
>   * Quentin Schulz, Bootlin, quentin.schulz@bootlin.com
> diff --git a/drivers/usb/gadget/designware_udc.c b/drivers/usb/gadget/designware_udc.c
> index 7fc5d27d43..41a6e8cb7d 100644
> --- a/drivers/usb/gadget/designware_udc.c
> +++ b/drivers/usb/gadget/designware_udc.c
> @@ -4,7 +4,7 @@
>   * TI OMAP1510 USB bus interface driver
>   *
>   * (C) Copyright 2009
> - * Vipin Kumar, ST Micoelectronics, vipin.kumar@st.com.
> + * Vipin Kumar, STMicroelectronics, vipin.kumar@st.com.
>   */
>  
>  #include <common.h>
> diff --git a/include/configs/stm32mp15_st_common.h b/include/configs/stm32mp15_st_common.h
> index 3c0ffb8f56..37b216e6e9 100644
> --- a/include/configs/stm32mp15_st_common.h
> +++ b/include/configs/stm32mp15_st_common.h
> @@ -2,7 +2,7 @@
>  /*
>   * Copyright (C) 2021, STMicroelectronics - All Rights Reserved
>   *
> - * Configuration settings for the STMicroelectonics STM32MP15x boards
> + * Configuration settings for the STMicroelectronics STM32MP15x boards
>   */
>  
>  #ifndef __CONFIG_STM32MP15_ST_COMMON_H__
> diff --git a/include/elf.h b/include/elf.h
> index b04e746d61..aeda159f0c 100644
> --- a/include/elf.h
> +++ b/include/elf.h
> @@ -188,14 +188,14 @@ typedef struct {
>  #define EM_NDR1		57		/* Denso NDR1 microprocessor */
>  #define EM_STARCORE	58		/* Motorola Start*Core processor */
>  #define EM_ME16		59		/* Toyota ME16 processor */
> -#define EM_ST100	60		/* STMicroelectronic ST100 processor */
> +#define EM_ST100	60		/* STMicroelectronics ST100 processor */
>  #define EM_TINYJ	61		/* Advanced Logic Corp. Tinyj emb.fam*/
>  #define EM_X86_64	62		/* AMD x86-64 */
>  #define EM_PDSP		63		/* Sony DSP Processor */
>  /* RESERVED 64,65 for future use */
>  #define EM_FX66		66		/* Siemens FX66 microcontroller */
>  #define EM_ST9PLUS	67		/* STMicroelectronics ST9+ 8/16 mc */
> -#define EM_ST7		68		/* STmicroelectronics ST7 8 bit mc */
> +#define EM_ST7		68		/* STMicroelectronics ST7 8 bit mc */
>  #define EM_68HC16	69		/* Motorola MC68HC16 microcontroller */
>  #define EM_68HC11	70		/* Motorola MC68HC11 microcontroller */
>  #define EM_68HC08	71		/* Motorola MC68HC08 microcontroller */
> diff --git a/include/linux/mtd/fsmc_nand.h b/include/linux/mtd/fsmc_nand.h
> index 6079f9e260..1d8a067f17 100644
> --- a/include/linux/mtd/fsmc_nand.h
> +++ b/include/linux/mtd/fsmc_nand.h
> @@ -1,7 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0+ */
>  /*
>   * (C) Copyright 2010
> - * Vipin Kumar, ST Micoelectronics, vipin.kumar@st.com.
> + * Vipin Kumar, STMicroelectronics, vipin.kumar@st.com.
>   */
>  
>  #ifndef __FSMC_NAND_H__
> diff --git a/include/usb/designware_udc.h b/include/usb/designware_udc.h
> index f874e5c35c..f716f07dd0 100644
> --- a/include/usb/designware_udc.h
> +++ b/include/usb/designware_udc.h
> @@ -1,7 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0+ */
>  /*
>   * (C) Copyright 2009
> - * Vipin Kumar, ST Micoelectronics, vipin.kumar@st.com.
> + * Vipin Kumar, STMicroelectronics, vipin.kumar@st.com.
>   */
>  
>  #ifndef __DW_UDC_H

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
