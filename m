Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD63B3BE3B6
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Jul 2021 09:37:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 701DCC57B53;
	Wed,  7 Jul 2021 07:37:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3410C5718D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jul 2021 07:37:17 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1677anRP028118; Wed, 7 Jul 2021 09:37:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=TMul1aSq7wgYvB5vvsYJQFj1fmtZVOrE5nYv3X5HNSY=;
 b=qnOQShw2xpkW06FuMqpiWnqLT/92iUmh/nCnzY08fm4EDtlfKIDEY/Oprgt9Ae+Nzi1X
 48B3vrrY9Pi5GcPUZ72xs/CjmuSaD1l4/FgZGkNc3rcrz4W5Po2riDEwnyvosDIITKrd
 fNHpL6UTmURg4hliDsoA7zbQz0xOmDs63+VsNVbKQpmynJ3ePhRNcjxJBpkH3CO8xOQq
 sGodmYv3qhrKmaZ5djNrSdad/J2vJuvSQ3fKrSpTD9NThmd/3NwjHt77oPeCuE0NgU5s
 XnU1mdQmWbVeAGVQ8Ur6D/1o/WfAfMT5VNd55aGy6UuJ0p9Js9eBEOqx6ABwJ5qmqld1 ZA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39mnebd04q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 09:37:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9A21E100034;
 Wed,  7 Jul 2021 09:37:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8F4AE2138CD;
 Wed,  7 Jul 2021 09:37:16 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 7 Jul
 2021 09:37:16 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210706171943.1.Ie853cf4b81d27d0393e45bb183368c1318a5712e@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <d227f92f-67b9-035f-14c2-c8c55395bd0c@foss.st.com>
Date: Wed, 7 Jul 2021 09:37:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706171943.1.Ie853cf4b81d27d0393e45bb183368c1318a5712e@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-07_02:2021-07-06,
 2021-07-07 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] stm32mp: use device sequence number
 in boot_instance variable
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

On 7/6/21 5:19 PM, Patrick Delaunay wrote:
> Use the device sequence number in boot_instance variable
> and no more the SDMMC instance provided by ROM code/TF-A.
> 
> After this patch we don't need to define the mmc alias in
> device tree, for example:
>   mmc0 = &sdmmc1;
>   mmc1 = &sdmmc2;
>   mmc2 = &sdmmc3;
> to have a correct mapping between the ROM code boot device =
> "${boot_device}${boot_instance}" and the MMC device in U-Boot.
> 
> With this patch the 'mmc0' device (used in mmc commands) is
> always used when only one instance sdmmc is activated in device
> tree, even if it is only the sdmmc2 or sdmmc3.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> Dependancy with [1] to have correct 'mmc' node name (sdmmc@ => mmc@)
> from kernel "ARM: dts: stm32: Rename mmc controller nodes to mmc@"
> 
> [1] "arm: dts: stm32mp15: alignment with v5.13"
>     http://patchwork.ozlabs.org/project/uboot/list/?series=251100&state=*
> 
> 
>  arch/arm/mach-stm32mp/cpu.c                | 16 +++++++++-
>  arch/arm/mach-stm32mp/include/mach/stm32.h |  4 +++
>  board/st/stm32mp1/stm32mp1.c               | 35 +++++++++++++++++-----
>  3 files changed, 46 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> index 592bfd413d..f6ed2ce0e4 100644
> --- a/arch/arm/mach-stm32mp/cpu.c
> +++ b/arch/arm/mach-stm32mp/cpu.c
> @@ -483,6 +483,11 @@ static void setup_boot_mode(void)
>  		STM32_UART7_BASE,
>  		STM32_UART8_BASE
>  	};
> +	const u32 sdmmc_addr[] = {
> +		STM32_SDMMC1_BASE,
> +		STM32_SDMMC2_BASE,
> +		STM32_SDMMC3_BASE
> +	};
>  	char cmd[60];
>  	u32 boot_ctx = readl(TAMP_BOOT_CONTEXT);
>  	u32 boot_mode =
> @@ -525,7 +530,16 @@ static void setup_boot_mode(void)
>  		break;
>  	case BOOT_FLASH_SD:
>  	case BOOT_FLASH_EMMC:
> -		sprintf(cmd, "%d", instance);
> +		if (instance > ARRAY_SIZE(sdmmc_addr))
> +			break;
> +		/* search associated sdmmc node in devicetree */
> +		sprintf(cmd, "mmc@%x", sdmmc_addr[instance]);
> +		if (uclass_get_device_by_name(UCLASS_MMC, cmd, &dev)) {
> +			printf("mmc%d = %s not found in device tree!\n",
> +			       instance, cmd);
> +			break;
> +		}
> +		sprintf(cmd, "%d", dev_seq(dev));
>  		env_set("boot_device", "mmc");
>  		env_set("boot_instance", cmd);
>  		break;
> diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
> index 5fdb893b0e..c11a9903f2 100644
> --- a/arch/arm/mach-stm32mp/include/mach/stm32.h
> +++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
> @@ -32,6 +32,10 @@
>  #define STM32_UART7_BASE		0x40018000
>  #define STM32_UART8_BASE		0x40019000
>  
> +#define STM32_SDMMC1_BASE		0x58005000
> +#define STM32_SDMMC2_BASE		0x58007000
> +#define STM32_SDMMC3_BASE		0x48004000
> +
>  #define STM32_SYSRAM_BASE		0x2FFC0000
>  #define STM32_SYSRAM_SIZE		SZ_256K
>  
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 18b8870269..2faf5c81b4 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -841,6 +841,31 @@ const char *env_ext4_get_intf(void)
>  	}
>  }
>  
> +int mmc_get_boot(void)
> +{
> +	struct udevice *dev;
> +	u32 boot_mode = get_bootmode();
> +	unsigned int instance = (boot_mode & TAMP_BOOT_INSTANCE_MASK) - 1;
> +	char cmd[20];
> +	const u32 sdmmc_addr[] = {
> +		STM32_SDMMC1_BASE,
> +		STM32_SDMMC2_BASE,
> +		STM32_SDMMC3_BASE
> +	};
> +
> +	if (instance > ARRAY_SIZE(sdmmc_addr))
> +		return 0;
> +
> +	/* search associated sdmmc node in devicetree */
> +	snprintf(cmd, sizeof(cmd), "mmc@%x", sdmmc_addr[instance]);
> +	if (uclass_get_device_by_name(UCLASS_MMC, cmd, &dev)) {
> +		log_err("mmc%d = %s not found in device tree!\n", instance, cmd);
> +		return 0;
> +	}
> +
> +	return dev_seq(dev);
> +};
> +
>  const char *env_ext4_get_dev_part(void)
>  {
>  	static char *const env_dev_part =
> @@ -854,22 +879,16 @@ const char *env_ext4_get_dev_part(void)
>  	if (strlen(env_dev_part) > 0)
>  		return env_dev_part;
>  
> -	u32 bootmode = get_bootmode();
> -
> -	return dev_part[(bootmode & TAMP_BOOT_INSTANCE_MASK) - 1];
> +	return dev_part[mmc_get_boot()];
>  }
>  
>  int mmc_get_env_dev(void)
>  {
> -	u32 bootmode;
> -
>  	if (CONFIG_SYS_MMC_ENV_DEV >= 0)
>  		return CONFIG_SYS_MMC_ENV_DEV;
>  
> -	bootmode = get_bootmode();
> -
>  	/* use boot instance to select the correct mmc device identifier */
> -	return (bootmode & TAMP_BOOT_INSTANCE_MASK) - 1;
> +	return mmc_get_boot();
>  }
>  
>  #if defined(CONFIG_OF_BOARD_SETUP)
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
