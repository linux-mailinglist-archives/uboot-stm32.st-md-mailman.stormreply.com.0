Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F09BE1A7760
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 11:31:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBAD4C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 09:31:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBDF5C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 09:31:49 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03E9REtd004550; Tue, 14 Apr 2020 11:31:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=j7Mk1fXeqoyVuzvA0oHD2lsEpYsJriRy74KCRt4u0ps=;
 b=UFsXVguHakBnY4V3GB78e/7x+BVahS3SEZWs/j1I+67E1/IulkeZ5YQU+249BEUUqWg3
 Yu+3huxkEVC45hijaX4M+9hBtvDNJo+f+8T9pV1Td4O3FQ/IYFhAHxc0dyuBW0+iwopt
 2YldaWoih+O5yqQfzEruUsGj/hlhU1XWodG1hzSyEtX2cKhiPKIud2jQfcSjae9KAMm5
 atj+2AeC3DOfFHRypThM8vxkNEzw6gaKyLWIbM/Mh9j2oF4QTYcNqziiua3oxxJjHNIX
 xdY9nU7eM5ShQvg/G53+lMQR4luqrGda/XgYy+hJ4Wf4RWrWTNGDpaM1uhx8kZAR4RcN ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b5stcs7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 11:31:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CB54A100034;
 Tue, 14 Apr 2020 11:31:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B2A512AC2E7;
 Tue, 14 Apr 2020 11:31:40 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Apr
 2020 11:31:40 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 11:31:40 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 06/11] stm32mp1: dynamically detect op-tee presence
Thread-Index: AQHV/P5xwCZN2JCWH0euXPJGzZCoEKh4Y3uA
Date: Tue, 14 Apr 2020 09:31:40 +0000
Message-ID: <cc169831-06b0-7d5d-cb7c-610284e2a1e3@st.com>
References: <20200318082254.7522-1-patrick.delaunay@st.com>
 <20200318092245.6.I546d9b8b998328eacc805b3da6bf6e0b0e799fda@changeid>
In-Reply-To: <20200318092245.6.I546d9b8b998328eacc805b3da6bf6e0b0e799fda@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <B9E959FEAD31334A900F43B5936FC886@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_02:2020-04-13,
 2020-04-14 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH 06/11] stm32mp1: dynamically detect op-tee
	presence
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

On 3/18/20 9:22 AM, Patrick Delaunay wrote:
> Activate OP-TEE driver for trusted and optee defconfig.
>
> This driver allows detection of TEE presence for boot from flash;
> CONFIG_STM32MP1_OPTEE is also removed.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/Kconfig           | 10 ----------
>  arch/arm/mach-stm32mp/fdt.c             |  4 +++-
>  board/dhelectronics/dh_stm32mp1/board.c |  4 +---
>  board/st/common/stm32mp_mtdparts.c      |  6 ++++--
>  board/st/stm32mp1/stm32mp1.c            |  4 +---
>  configs/stm32mp15_optee_defconfig       |  4 +++-
>  configs/stm32mp15_trusted_defconfig     |  3 +++
>  7 files changed, 15 insertions(+), 20 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index 96153693a7..1a5545b98d 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -93,16 +93,6 @@ config STM32MP1_TRUSTED
>  		BootRom => TF-A.stm32 (clock & DDR) => U-Boot.stm32
>  		TF-A monitor provides proprietary SMC to manage secure devices
>  
> -config STM32MP1_OPTEE
> -	bool "Support trusted boot with TF-A and OP-TEE"
> -	depends on STM32MP1_TRUSTED
> -	default n
> -	help
> -		Say Y here to enable boot with TF-A and OP-TEE
> -		Trusted boot chain is :
> -		BootRom => TF-A.stm32 (clock & DDR) => OP-TEE => U-Boot.stm32
> -		OP-TEE monitor provides ST SMC to access to secure resources
> -
>  config SYS_TEXT_BASE
>  	default 0xC0100000
>  
> diff --git a/arch/arm/mach-stm32mp/fdt.c b/arch/arm/mach-stm32mp/fdt.c
> index ae82270e42..21b5f09728 100644
> --- a/arch/arm/mach-stm32mp/fdt.c
> +++ b/arch/arm/mach-stm32mp/fdt.c
> @@ -5,6 +5,7 @@
>  
>  #include <common.h>
>  #include <fdt_support.h>
> +#include <tee.h>
>  #include <asm/arch/sys_proto.h>
>  #include <dt-bindings/pinctrl/stm32-pinfunc.h>
>  #include <linux/io.h>
> @@ -322,7 +323,8 @@ int ft_system_setup(void *blob, bd_t *bd)
>  				       "st,package", pkg, false);
>  	}
>  
> -	if (!CONFIG_IS_ENABLED(STM32MP1_OPTEE))
> +	if (!CONFIG_IS_ENABLED(OPTEE) ||
> +	    !tee_find_device(NULL, NULL, NULL, NULL))
>  		stm32_fdt_disable_optee(blob);
>  
>  	return ret;
> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
> index bd6540a2aa..ea51b92282 100644
> --- a/board/dhelectronics/dh_stm32mp1/board.c
> +++ b/board/dhelectronics/dh_stm32mp1/board.c
> @@ -117,9 +117,7 @@ int checkboard(void)
>  	const char *fdt_compat;
>  	int fdt_compat_len;
>  
> -	if (IS_ENABLED(CONFIG_STM32MP1_OPTEE))
> -		mode = "trusted with OP-TEE";
> -	else if (IS_ENABLED(CONFIG_STM32MP1_TRUSTED))
> +	if (IS_ENABLED(CONFIG_STM32MP1_TRUSTED))
>  		mode = "trusted";
>  	else
>  		mode = "basic";
> diff --git a/board/st/common/stm32mp_mtdparts.c b/board/st/common/stm32mp_mtdparts.c
> index d4c0a7db9f..2b6413be16 100644
> --- a/board/st/common/stm32mp_mtdparts.c
> +++ b/board/st/common/stm32mp_mtdparts.c
> @@ -9,6 +9,7 @@
>  #include <env_internal.h>
>  #include <mtd.h>
>  #include <mtd_node.h>
> +#include <tee.h>
>  
>  #define MTDPARTS_LEN		256
>  #define MTDIDS_LEN		128
> @@ -49,7 +50,7 @@ static void board_get_mtdparts(const char *dev,
>  		strncat(mtdparts, ",", MTDPARTS_LEN);
>  	}
>  
> -	if (CONFIG_IS_ENABLED(STM32MP1_OPTEE) && tee) {
> +	if (tee) {
>  		strncat(mtdparts, tee, MTDPARTS_LEN);
>  		strncat(mtdparts, ",", MTDPARTS_LEN);
>  	}
> @@ -72,7 +73,8 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
>  		return;
>  	}
>  
> -	if (CONFIG_IS_ENABLED(STM32MP1_OPTEE))
> +	if (CONFIG_IS_ENABLED(OPTEE) &&
> +	    tee_find_device(NULL, NULL, NULL, NULL))
>  		tee = true;
>  
>  	memset(parts, 0, sizeof(parts));
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 2ab3b5cc9a..14c56a0f24 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -87,9 +87,7 @@ int checkboard(void)
>  	const char *fdt_compat;
>  	int fdt_compat_len;
>  
> -	if (IS_ENABLED(CONFIG_STM32MP1_OPTEE))
> -		mode = "trusted with OP-TEE";
> -	else if (IS_ENABLED(CONFIG_STM32MP1_TRUSTED))
> +	if (CONFIG_IS_ENABLED(STM32MP1_TRUSTED))
>  		mode = "trusted";
>  	else
>  		mode = "basic";
> diff --git a/configs/stm32mp15_optee_defconfig b/configs/stm32mp15_optee_defconfig
> index 317cd55862..f0d524d344 100644
> --- a/configs/stm32mp15_optee_defconfig
> +++ b/configs/stm32mp15_optee_defconfig
> @@ -4,7 +4,6 @@ CONFIG_SYS_MALLOC_F_LEN=0x3000
>  CONFIG_ENV_SECT_SIZE=0x40000
>  CONFIG_ENV_OFFSET=0x280000
>  CONFIG_TARGET_ST_STM32MP15x=y
> -CONFIG_STM32MP1_OPTEE=y
>  CONFIG_ENV_OFFSET_REDUND=0x2C0000
>  CONFIG_DISTRO_DEFAULTS=y
>  CONFIG_FIT=y
> @@ -111,6 +110,9 @@ CONFIG_SPI=y
>  CONFIG_DM_SPI=y
>  CONFIG_STM32_QSPI=y
>  CONFIG_STM32_SPI=y
> +CONFIG_TEE=y
> +CONFIG_OPTEE=y
> +# CONFIG_OPTEE_TA_AVB is not set
>  CONFIG_USB=y
>  CONFIG_DM_USB=y
>  CONFIG_DM_USB_GADGET=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 73cbe6c7d6..f0d524d344 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -110,6 +110,9 @@ CONFIG_SPI=y
>  CONFIG_DM_SPI=y
>  CONFIG_STM32_QSPI=y
>  CONFIG_STM32_SPI=y
> +CONFIG_TEE=y
> +CONFIG_OPTEE=y
> +# CONFIG_OPTEE_TA_AVB is not set
>  CONFIG_USB=y
>  CONFIG_DM_USB=y
>  CONFIG_DM_USB_GADGET=y


Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
