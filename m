Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E58572D9D2
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Jun 2023 08:23:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50BF4C6A615;
	Tue, 13 Jun 2023 06:23:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DD4BC6A60F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 06:23:58 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35D6G9Sw014680; Tue, 13 Jun 2023 08:23:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=IopfAVyV3X/Sq4mOauZ2Vb/kDuZliO+46rgE7twSPzY=;
 b=69OyIszSaNAUfhCjMqpuGHFfi1WMM8kS8/bldpQZm7k20xbWFPhgUpDwUyM8ynNmZRvJ
 MY4VQKOsfql0a17fICou97Q3TXuoallwH5tNFh7HuhBNceC2a3kpusRK3UKvgvFwr25h
 QckiUxi8QGvIEsx9pOzjg3pYWk5bN5TcEAyee9GfVhSRnNcK6uX56IxiJOnVqUrA4oLn
 kuWbN5ESKzXC1nnzfiftcwlN2toztf2jtq1n0rny6o+L31j70FVF4fOJWmAQLJ7CIRp/
 CTzOR2o1DgQrzsRjKfhRcj4pMStn2NiYPZezy17G3DUSVA/OaGxVJxr/fnuWhyb1XFfN NA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r6k1sg1ay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 08:23:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1C78610002A;
 Tue, 13 Jun 2023 08:23:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1524C2128D3;
 Tue, 13 Jun 2023 08:23:56 +0200 (CEST)
Received: from [10.201.20.56] (10.201.20.56) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 13 Jun
 2023 08:23:55 +0200
Message-ID: <70c50692-8276-cc6f-658b-ff323dc7f623@foss.st.com>
Date: Tue, 13 Jun 2023 08:23:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
 <20230608171614.8.I7bf81c0580c1c801def7453d5d05c323a1b8d620@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230608171614.8.I7bf81c0580c1c801def7453d5d05c323a1b8d620@changeid>
X-Originating-IP: [10.201.20.56]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_03,2023-06-12_02,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 08/12] board: stm32mp1: use
	fdt_copy_fixed_partitions
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



On 6/8/23 17:16, Patrick Delaunay wrote:
> Copy the fixed partition nodes from U-Boot device tree to Linux kernel
> device tree to dynamically configure the MTD partitions.
> 
> fdt_copy_fixed_partitions is only based on device tree
> and replace the function fdt_fixup_mtdparts based on mtdparts variable;
> the variable mtdid and mtdparts are not more required.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  board/st/stm32mp1/stm32mp1.c        | 16 +---------------
>  configs/stm32mp13_defconfig         |  1 -
>  configs/stm32mp15_basic_defconfig   |  1 -
>  configs/stm32mp15_defconfig         |  1 -
>  configs/stm32mp15_trusted_defconfig |  1 -
>  5 files changed, 1 insertion(+), 19 deletions(-)
> 
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 1a1b1844c8c0..be850151e5fc 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -25,7 +25,6 @@
>  #include <log.h>
>  #include <malloc.h>
>  #include <misc.h>
> -#include <mtd_node.h>
>  #include <net.h>
>  #include <netdev.h>
>  #include <phy.h>
> @@ -915,20 +914,7 @@ int mmc_get_env_dev(void)
>  #if defined(CONFIG_OF_BOARD_SETUP)
>  int ft_board_setup(void *blob, struct bd_info *bd)
>  {
> -	static const struct node_info nodes[] = {
> -		{ "jedec,spi-nor",		MTD_DEV_TYPE_NOR,  },
> -		{ "spi-nand",			MTD_DEV_TYPE_SPINAND},
> -		{ "st,stm32mp15-fmc2",		MTD_DEV_TYPE_NAND, },
> -		{ "st,stm32mp1-fmc2-nfc",	MTD_DEV_TYPE_NAND, },
> -	};
> -	char *boot_device;
> -
> -	/* Check the boot-source and don't update MTD for serial or usb boot */
> -	boot_device = env_get("boot_device");
> -	if (!boot_device ||
> -	    (strcmp(boot_device, "serial") && strcmp(boot_device, "usb")))
> -		if (IS_ENABLED(CONFIG_FDT_FIXUP_PARTITIONS))
> -			fdt_fixup_mtdparts(blob, nodes, ARRAY_SIZE(nodes));
> +	fdt_copy_fixed_partitions(blob);
>  
>  	if (IS_ENABLED(CONFIG_FDT_SIMPLEFB))
>  		fdt_simplefb_enable_and_mem_rsv(blob);
> diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
> index 02a29cd9f03a..a9cc7e4d0353 100644
> --- a/configs/stm32mp13_defconfig
> +++ b/configs/stm32mp13_defconfig
> @@ -74,7 +74,6 @@ CONFIG_TEE=y
>  CONFIG_OPTEE=y
>  # CONFIG_OPTEE_TA_AVB is not set
>  CONFIG_ERRNO_STR=y
> -CONFIG_FDT_FIXUP_PARTITIONS=y
>  # CONFIG_LMB_USE_MAX_REGIONS is not set
>  CONFIG_LMB_MEMORY_REGIONS=2
>  CONFIG_LMB_RESERVED_REGIONS=16
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 273b72fdaf0a..7661159110e5 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -188,7 +188,6 @@ CONFIG_WDT=y
>  CONFIG_WDT_STM32MP=y
>  # CONFIG_BINMAN_FDT is not set
>  CONFIG_ERRNO_STR=y
> -CONFIG_FDT_FIXUP_PARTITIONS=y
>  # CONFIG_LMB_USE_MAX_REGIONS is not set
>  CONFIG_LMB_MEMORY_REGIONS=2
>  CONFIG_LMB_RESERVED_REGIONS=16
> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> index b1f0f2f7c784..1ff9f73730d3 100644
> --- a/configs/stm32mp15_defconfig
> +++ b/configs/stm32mp15_defconfig
> @@ -164,7 +164,6 @@ CONFIG_WDT=y
>  CONFIG_WDT_STM32MP=y
>  # CONFIG_BINMAN_FDT is not set
>  CONFIG_ERRNO_STR=y
> -CONFIG_FDT_FIXUP_PARTITIONS=y
>  # CONFIG_LMB_USE_MAX_REGIONS is not set
>  CONFIG_LMB_MEMORY_REGIONS=2
>  CONFIG_LMB_RESERVED_REGIONS=16
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index bcfd60e5a85a..e7bf2e171ace 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -164,7 +164,6 @@ CONFIG_WDT=y
>  CONFIG_WDT_STM32MP=y
>  # CONFIG_BINMAN_FDT is not set
>  CONFIG_ERRNO_STR=y
> -CONFIG_FDT_FIXUP_PARTITIONS=y
>  # CONFIG_LMB_USE_MAX_REGIONS is not set
>  CONFIG_LMB_MEMORY_REGIONS=2
>  CONFIG_LMB_RESERVED_REGIONS=16
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
