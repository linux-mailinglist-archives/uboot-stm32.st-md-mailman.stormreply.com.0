Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB17044C4C1
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Nov 2021 17:01:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78300C5EC71;
	Wed, 10 Nov 2021 16:01:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 279F9C5EC70
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Nov 2021 16:01:18 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AAECS6s018591;
 Wed, 10 Nov 2021 17:00:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=j+24EpihvouzXlw6YS3Dblvd27FblpXC/ed0IFXaiCo=;
 b=NuXewxJXs2M+JOoKesTJAdKKW9gYCErFCrUoIJhQ2XWqB+ET+3HkwLPdoLK7zgQuwG3Z
 fnWdBtdhapLEJj5U9H1f7qD76ZdVpx76oy/8Ijlfw1/u+G1WOVvuz356fOwpBTMEzsob
 0Bo8bmS9AeBHi9Xj2xZCGK3cACIdICUwvwlWkkrUsIxURTO2JuHNP+sLXJlsc3Kq+hLy
 hRY6nBev4yFgbAfLAA3DLvQZZ23qEi8KplKydWs8/mntGEUL1mXQSFklqxHilccE0nWg
 z6aHoMauTCYC+jBmtJtosemBUy2tEH/PWQeisUYkSx3pOSCVWOAuV86EQFLyESVbkzh/ Hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c8brmjf3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 17:00:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B875710002A;
 Wed, 10 Nov 2021 17:00:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 812B420A774;
 Wed, 10 Nov 2021 17:00:45 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 10 Nov
 2021 17:00:44 +0100
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211022101915.1.I92213ff1dee3962016055fd447781cc3c9a8cb2c@changeid>
 <66ecbb65-4d3e-3580-c471-b212383d2d2b@foss.st.com>
Message-ID: <0e6794c8-8da6-5530-b6d4-e3c70e5aa7cf@foss.st.com>
Date: Wed, 10 Nov 2021 17:00:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <66ecbb65-4d3e-3580-c471-b212383d2d2b@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-10_05,2021-11-08_02,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>,
 Jean-Philippe ROMAIN <jean-philippe.romain@st.com>,
 Rick Chen <rick@andestech.com>, Jagan Teki <jagan@amarulasolutions.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Alexandru
 Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] board: stmp32mp1: split board and SOC
 STM32MP15 configuration
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

On 10/25/21 9:06 AM, Patrice CHOTARD wrote:
> Hi Patrick
> 
> On 10/22/21 10:19 AM, Patrick Delaunay wrote:
>> Add a configuration file "stm32mp15_st_common.h" to handle the
>> STMicroelectronics boards configuration and rename stm32mp1.h to
>> "stm32mp15_common.h" to handle the generic STM32MP15x series configuration.
>>
>> The configuration file "dh_stm32mp1.h" is also renamed to
>> "stm32mp15_dh_dhcom" for the configuration of board based on the
>> dhelectronics STM32MP15x SOM.
>>
>> In the STMicroelectronics board configuration the default bootcmd
>> "bootcmd_stm32mp" is updated to only select the extlinux file found on
>> SD-Card on STM32MP15x EV1 for boot from NOR device.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  board/dhelectronics/dh_stm32mp1/Kconfig       |  2 +-
>>  board/dhelectronics/dh_stm32mp1/MAINTAINERS   |  2 +-
>>  board/engicam/stm32mp1/Kconfig                |  2 +-
>>  board/st/stm32mp1/Kconfig                     |  2 +-
>>  board/st/stm32mp1/MAINTAINERS                 |  3 +-
>>  .../{stm32mp1.h => stm32mp15_common.h}        | 51 ++++++++++++-------
>>  .../{dh_stm32mp1.h => stm32mp15_dh_dhsom.h}   |  6 +--
>>  include/configs/stm32mp15_st_common.h         | 46 +++++++++++++++++
>>  8 files changed, 87 insertions(+), 27 deletions(-)
>>  rename include/configs/{stm32mp1.h => stm32mp15_common.h} (78%)
>>  rename include/configs/{dh_stm32mp1.h => stm32mp15_dh_dhsom.h} (65%)
>>  create mode 100644 include/configs/stm32mp15_st_common.h
>>
>> diff --git a/board/dhelectronics/dh_stm32mp1/Kconfig b/board/dhelectronics/dh_stm32mp1/Kconfig
>> index 1fc792c9d1..dc707c2753 100644
>> --- a/board/dhelectronics/dh_stm32mp1/Kconfig
>> +++ b/board/dhelectronics/dh_stm32mp1/Kconfig
>> @@ -7,7 +7,7 @@ config SYS_VENDOR
>>  	default "dhelectronics"
>>  
>>  config SYS_CONFIG_NAME
>> -	default "dh_stm32mp1"
>> +	default "stm32mp15_dh_dhsom"
>>  
>>  config ENV_SECT_SIZE
>>  	default 0x10000 if ENV_IS_IN_SPI_FLASH
>> diff --git a/board/dhelectronics/dh_stm32mp1/MAINTAINERS b/board/dhelectronics/dh_stm32mp1/MAINTAINERS
>> index 9ce21c3ab2..865588f5b8 100644
>> --- a/board/dhelectronics/dh_stm32mp1/MAINTAINERS
>> +++ b/board/dhelectronics/dh_stm32mp1/MAINTAINERS
>> @@ -6,4 +6,4 @@ F:	arch/arm/dts/stm32mp15xx-dhcom*
>>  F:	board/dhelectronics/dh_stm32mp1/
>>  F:	configs/stm32mp15_dhcom_basic_defconfig
>>  F:	configs/stm32mp15_dhcor_basic_defconfig
>> -F:	include/configs/stm32mp1.h
>> +F:	include/configs/stm32mp15_dh_dhsom.h
>> diff --git a/board/engicam/stm32mp1/Kconfig b/board/engicam/stm32mp1/Kconfig
>> index c800fd4e60..3802d44cef 100644
>> --- a/board/engicam/stm32mp1/Kconfig
>> +++ b/board/engicam/stm32mp1/Kconfig
>> @@ -7,6 +7,6 @@ config SYS_VENDOR
>>  	default "engicam"
>>  
>>  config SYS_CONFIG_NAME
>> -	default "stm32mp1"
>> +	default "stm32mp15_common"
>>  
>>  endif
>> diff --git a/board/st/stm32mp1/Kconfig b/board/st/stm32mp1/Kconfig
>> index c5ab7553d4..89e97aec2b 100644
>> --- a/board/st/stm32mp1/Kconfig
>> +++ b/board/st/stm32mp1/Kconfig
>> @@ -7,7 +7,7 @@ config SYS_VENDOR
>>  	default "st"
>>  
>>  config SYS_CONFIG_NAME
>> -	default "stm32mp1"
>> +	default "stm32mp15_st_common"
>>  
>>  source "board/st/common/Kconfig"
>>  endif
>> diff --git a/board/st/stm32mp1/MAINTAINERS b/board/st/stm32mp1/MAINTAINERS
>> index 0e6d80fb45..6451195269 100644
>> --- a/board/st/stm32mp1/MAINTAINERS
>> +++ b/board/st/stm32mp1/MAINTAINERS
>> @@ -8,4 +8,5 @@ F:	board/st/stm32mp1/
>>  F:	configs/stm32mp15_defconfig
>>  F:	configs/stm32mp15_basic_defconfig
>>  F:	configs/stm32mp15_trusted_defconfig
>> -F:	include/configs/stm32mp1.h
>> +F:	include/configs/stm32mp15_common.h
>> +F:	include/configs/stm32mp15_st_common.h
>> diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp15_common.h
>> similarity index 78%
>> rename from include/configs/stm32mp1.h
>> rename to include/configs/stm32mp15_common.h
>> index 30d4e8ff1f..46a92a06e5 100644
>> --- a/include/configs/stm32mp1.h
>> +++ b/include/configs/stm32mp15_common.h
>> @@ -5,8 +5,8 @@
>>   * Configuration settings for the STM32MP15x CPU
>>   */
>>  
>> -#ifndef __CONFIG_H
>> -#define __CONFIG_H
>> +#ifndef __CONFIG_STM32MP15_COMMMON_H
>> +#define __CONFIG_STM32MP15_COMMMON_H
>>  #include <linux/sizes.h>
>>  #include <asm/arch/stm32.h>
>>  
>> @@ -104,11 +104,11 @@
>>  	BOOT_TARGET_PXE(func)
>>  
>>  /*
>> - * bootcmd for stm32mp1:
>> + * default bootcmd for stm32mp1:
>>   * for serial/usb: execute the stm32prog command
>> - * for mmc boot (eMMC, SD card), boot only on the same device
>> - * for nand or spi-nand boot, boot with on ubifs partition on UBI partition
>> - * for nor boot, use the default order
>> + * for mmc boot (eMMC, SD card), distro boot on the same mmc device
>> + * for nand or spi-nand boot, distro boot with ubifs on UBI partition
>> + * for nor boot, use the default distro order in ${boot_targets}
>>   */
>>  #define STM32MP_BOOTCMD "bootcmd_stm32mp=" \
>>  	"echo \"Boot over ${boot_device}${boot_instance}!\";" \
>> @@ -126,7 +126,7 @@
>>  
>>  #ifdef CONFIG_FASTBOOT_CMD_OEM_FORMAT
>>  /* eMMC default partitions for fastboot command: oem format */
>> -#define PARTS_DEFAULT \
>> +#define STM32MP_PARTS_DEFAULT \
>>  	"partitions=" \
>>  	"name=ssbl,size=2M;" \
>>  	"name=bootfs,size=64MB,bootable;" \
>> @@ -134,9 +134,14 @@
>>  	"name=rootfs,size=746M;" \
>>  	"name=userfs,size=-\0"
>>  #else
>> -#define PARTS_DEFAULT
>> +#define STM32MP_PARTS_DEFAULT
>>  #endif
>>  
>> +#define STM32MP_EXTRA \
>> +	"altbootcmd=run bootcmd\0" \
>> +	"env_check=if env info -p -d -q; then env save; fi\0" \
>> +	"boot_net_usb_start=true\0"
>> +
>>  #include <config_distro_bootcmd.h>
>>  
>>  /*
>> @@ -144,21 +149,29 @@
>>   * 1M fdt, 1M script, 1M pxe and 1M for overlay
>>   * and the ramdisk at the end.
>>   */
>> +#define __KERNEL_ADDR_R     __stringify(0xc2000000)
>> +#define __FDT_ADDR_R        __stringify(0xc4000000)
>> +#define __SCRIPT_ADDR_R     __stringify(0xc4100000)
>> +#define __PXEFILE_ADDR_R    __stringify(0xc4200000)
>> +#define __FDTOVERLAY_ADDR_R __stringify(0xc4300000)
>> +#define __RAMDISK_ADDR_R    __stringify(0xc4400000)
>> +
>> +#define STM32MP_MEM_LAYOUT \
>> +	"kernel_addr_r=" __KERNEL_ADDR_R "\0" \
>> +	"fdt_addr_r=" __FDT_ADDR_R "\0" \
>> +	"scriptaddr=" __SCRIPT_ADDR_R "\0" \
>> +	"pxefile_addr_r=" __PXEFILE_ADDR_R "\0" \
>> +	"fdtoverlay_addr_r=" __FDTOVERLAY_ADDR_R "\0" \
>> +	"ramdisk_addr_r=" __RAMDISK_ADDR_R "\0"
>> +
>>  #define CONFIG_EXTRA_ENV_SETTINGS \
>> -	"kernel_addr_r=0xc2000000\0" \
>> -	"fdt_addr_r=0xc4000000\0" \
>> -	"scriptaddr=0xc4100000\0" \
>> -	"pxefile_addr_r=0xc4200000\0" \
>> -	"fdtoverlay_addr_r=0xc4300000\0" \
>> -	"ramdisk_addr_r=0xc4400000\0" \
>> -	"altbootcmd=run bootcmd\0" \
>> -	"env_check=if env info -p -d -q; then env save; fi\0" \
>> +	STM32MP_MEM_LAYOUT \
>>  	STM32MP_BOOTCMD \
>> -	PARTS_DEFAULT \
>> +	STM32MP_PARTS_DEFAULT \
>>  	BOOTENV \
>> -	"boot_net_usb_start=true\0"
>> +	STM32MP_EXTRA
>>  
>>  #endif /* ifndef CONFIG_SPL_BUILD */
>>  #endif /* ifdef CONFIG_DISTRO_DEFAULTS*/
>>  
>> -#endif /* __CONFIG_H */
>> +#endif /* __CONFIG_STM32MP15_COMMMON_H */
>> diff --git a/include/configs/dh_stm32mp1.h b/include/configs/stm32mp15_dh_dhsom.h
>> similarity index 65%
>> rename from include/configs/dh_stm32mp1.h
>> rename to include/configs/stm32mp15_dh_dhsom.h
>> index 89d317ba2b..c559cd72da 100644
>> --- a/include/configs/dh_stm32mp1.h
>> +++ b/include/configs/stm32mp15_dh_dhsom.h
>> @@ -5,10 +5,10 @@
>>   * Configuration settings for the DH STM32MP15x SoMs
>>   */
>>  
>> -#ifndef __CONFIG_DH_STM32MP1_H__
>> -#define __CONFIG_DH_STM32MP1_H__
>> +#ifndef __CONFIG_STM32MP15_DH_DHSOM_H__
>> +#define __CONFIG_STM32MP15_DH_DHSOM_H__
>>  
>> -#include <configs/stm32mp1.h>
>> +#include <configs/stm32mp15_common.h>
>>  
>>  #define CONFIG_SPL_TARGET		"u-boot.itb"
>>  
>> diff --git a/include/configs/stm32mp15_st_common.h b/include/configs/stm32mp15_st_common.h
>> new file mode 100644
>> index 0000000000..10248bffc1
>> --- /dev/null
>> +++ b/include/configs/stm32mp15_st_common.h
>> @@ -0,0 +1,46 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause */
>> +/*
>> + * Copyright (C) 2021, STMicroelectronics - All Rights Reserved
>> + *
>> + * Configuration settings for the STMicroelectonics STM32MP15x boards
>> + */
>> +
>> +#ifndef __CONFIG_STM32MP15_ST_COMMON_H__
>> +#define __CONFIG_STM32MP15_ST_COMMON_H__
>> +
>> +#include <configs/stm32mp15_common.h>
>> +
>> +#ifdef CONFIG_EXTRA_ENV_SETTINGS
>> +/*
>> + * default bootcmd for stm32mp1 STMicroelectronics boards:
>> + * for serial/usb: execute the stm32prog command
>> + * for mmc boot (eMMC, SD card), distro boot on the same mmc device
>> + * for nand or spi-nand boot, distro boot with ubifs on UBI partition
>> + * for nor boot, distro boot on SD card = mmc0 ONLY !
>> + */
>> +#define ST_STM32MP1_BOOTCMD "bootcmd_stm32mp=" \
>> +	"echo \"Boot over ${boot_device}${boot_instance}!\";" \
>> +	"if test ${boot_device} = serial || test ${boot_device} = usb;" \
>> +	"then stm32prog ${boot_device} ${boot_instance}; " \
>> +	"else " \
>> +		"run env_check;" \
>> +		"if test ${boot_device} = mmc;" \
>> +		"then env set boot_targets \"mmc${boot_instance}\"; fi;" \
>> +		"if test ${boot_device} = nand ||" \
>> +		  " test ${boot_device} = spi-nand ;" \
>> +		"then env set boot_targets ubifs0; fi;" \
>> +		"if test ${boot_device} = nor;" \
>> +		"then env set boot_targets mmc0; fi;" \
>> +		"run distro_bootcmd;" \
>> +	"fi;\0"
>> +
>> +#undef CONFIG_EXTRA_ENV_SETTINGS
>> +#define CONFIG_EXTRA_ENV_SETTINGS \
>> +	STM32MP_MEM_LAYOUT \
>> +	ST_STM32MP1_BOOTCMD \
>> +	STM32MP_PARTS_DEFAULT \
>> +	BOOTENV \
>> +	STM32MP_EXTRA
>> +
>> +#endif
>> +#endif
>>
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Thanks
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
> 
Applied on u-boot-stm/master 
Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
