Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A62733020
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jun 2023 13:42:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15CE6C64110;
	Fri, 16 Jun 2023 11:42:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62AB5C65E58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 11:42:03 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35GAQPuT013340; Fri, 16 Jun 2023 13:42:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=XPQKBKAdGLvYX8dVRBl0LRhVQfkgW3bD0O1omVTJl78=;
 b=hbLazj/r9VMS8ecVIGqcIm9EjTnJe7hACGNu8SjjdtkWdyGUnjCOF6AyP6055UaLqlFz
 KkJ3sTVKrhWhF80ZC7+35ewcjrt6A/RQ+BvEWPIKIvUwY/TyXwWmk4a1OSOgwWi3ALVn
 HI3OLSt/DrYadLtaVv62a5cNmkWyGVSbwj3CZtz0ZXIyRS/hQDKZfLNuuGwXgcNk2vFJ
 8xCGhjcwAJ8kzdCelhZmHmcjRf5FH63b9msfde7L+7Q2V9GyBZtdsZLCoqiLbYRhyEW2
 K0T5oF8aimSPySFnHlkjzqsrwVFsKl4Qv4UxM/mdp1yaxjCi1fG79KjbK3fKbjuE74g6 XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r8nyw8eya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jun 2023 13:42:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C03A910002A;
 Fri, 16 Jun 2023 13:42:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B7B34229A71;
 Fri, 16 Jun 2023 13:42:01 +0200 (CEST)
Received: from [10.252.4.57] (10.252.4.57) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 16 Jun
 2023 13:42:01 +0200
Message-ID: <086e6adf-c968-beed-4a97-1caf6d251738@foss.st.com>
Date: Fri, 16 Jun 2023 13:42:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230530142510.1.I6509af98dc9400619e655a9bacc41077e88f10dc@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230530142510.1.I6509af98dc9400619e655a9bacc41077e88f10dc@changeid>
X-Originating-IP: [10.252.4.57]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_08,2023-06-16_01,2023-05-22_02
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH 1/2] config: stm32mp15: remove
	CONFIG_FASTBOOT_USB_DEV
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



On 5/30/23 14:26, Patrick Delaunay wrote:
> The CONFIG_FASTBOOT_USB_DEV is used to select USB OTG controller other
> than 0 but it is not the case for STM32MP15 boards; it can be removed
> to simplify the STM32MP15 defconfig files.
> 
> On STM32MP15x boards, we have only one USB device with instance 0,
> so the device is hardcoded arch/arm/mach-stm32mp/cpu.c with
> the command "fastboot 0" and this define is not used in config files
> (include/configs/stm32mp15_st_common.h).
> 
> Fixes: 4633fd51c5d7 ("stm32mp1: activate FASTBOOT on eMMC")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  configs/stm32mp15_basic_defconfig   | 1 -
>  configs/stm32mp15_defconfig         | 1 -
>  configs/stm32mp15_trusted_defconfig | 1 -
>  3 files changed, 3 deletions(-)
> 
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 13355ebb4692..174eb42d6447 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -102,7 +102,6 @@ CONFIG_SET_DFU_ALT_INFO=y
>  CONFIG_USB_FUNCTION_FASTBOOT=y
>  CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
>  CONFIG_FASTBOOT_BUF_SIZE=0x02000000
> -CONFIG_FASTBOOT_USB_DEV=1
>  CONFIG_FASTBOOT_FLASH=y
>  CONFIG_FASTBOOT_FLASH_MMC_DEV=1
>  CONFIG_FASTBOOT_MMC_BOOT_SUPPORT=y
> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> index 2669aae0f2f4..b25477c64d03 100644
> --- a/configs/stm32mp15_defconfig
> +++ b/configs/stm32mp15_defconfig
> @@ -75,7 +75,6 @@ CONFIG_SET_DFU_ALT_INFO=y
>  CONFIG_USB_FUNCTION_FASTBOOT=y
>  CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
>  CONFIG_FASTBOOT_BUF_SIZE=0x02000000
> -CONFIG_FASTBOOT_USB_DEV=1
>  CONFIG_FASTBOOT_FLASH=y
>  CONFIG_FASTBOOT_FLASH_MMC_DEV=1
>  CONFIG_FASTBOOT_MMC_BOOT_SUPPORT=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 5f0fb4565105..e93a66f867cf 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -76,7 +76,6 @@ CONFIG_SET_DFU_ALT_INFO=y
>  CONFIG_USB_FUNCTION_FASTBOOT=y
>  CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
>  CONFIG_FASTBOOT_BUF_SIZE=0x02000000
> -CONFIG_FASTBOOT_USB_DEV=1
>  CONFIG_FASTBOOT_FLASH=y
>  CONFIG_FASTBOOT_FLASH_MMC_DEV=1
>  CONFIG_FASTBOOT_MMC_BOOT_SUPPORT=y

Applied to u-boot-stm/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
