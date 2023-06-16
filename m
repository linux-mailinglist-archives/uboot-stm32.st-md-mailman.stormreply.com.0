Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EBA73302F
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jun 2023 13:42:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2600CC6A610;
	Fri, 16 Jun 2023 11:42:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5905EC64110
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 11:42:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35GAQPud013340; Fri, 16 Jun 2023 13:42:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=0caKvx3651Q1Ad33KucWl4Q+niEOf2x3S+wsyKn68xQ=;
 b=mM8s3yUlOkFfwW0kll7fGFbEh1wOhHPuZUWKKx/7aNiWzody3bv1erkMA3GWMRsRlwQX
 AJwd5RHZKPJtJ/crOY8uIXRap3d1T8bHvLdWmMbO8lCbOfURZhy1Z1zE5CKIVugKU0F6
 O5Qv5Wo3BtmWXXlrwLo8Q5viytv2IzPIvLsNysCYqUMdcMz7ZLnGX99KBltTaoRsJpL1
 iP7UNg2a8YcO3dBk1TA9wVwTIc2mrjSyDWrvfRHqDesFSUMJcux7wk1OUDja9ZuN4C1o
 qxRY1+cQf9FoIqboopww5OaSA0d6tH6SfwP0lLjci2oUqImZUwR9R/34bEyRm5fuTNNN pQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r8nyw8f2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jun 2023 13:42:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2AFBF10002A;
 Fri, 16 Jun 2023 13:42:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 232E921230D;
 Fri, 16 Jun 2023 13:42:27 +0200 (CEST)
Received: from [10.252.4.57] (10.252.4.57) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 16 Jun
 2023 13:42:26 +0200
Message-ID: <c859407a-e362-5d92-f970-3c38098827c8@foss.st.com>
Date: Fri, 16 Jun 2023 13:42:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230530142510.1.I6509af98dc9400619e655a9bacc41077e88f10dc@changeid>
 <20230530142510.2.If0f78a4bb06e47f761e29a9901e37c8c0241fb0c@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230530142510.2.If0f78a4bb06e47f761e29a9901e37c8c0241fb0c@changeid>
X-Originating-IP: [10.252.4.57]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_08,2023-06-16_01,2023-05-22_02
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH 2/2] config: stm32mp15: remove
 CONFIG_FASTBOOT_CMD_OEM_FORMAT
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
> Remove the support of the fastboot "oem format" command for STM32MP15x
> boards and removed the associated env variable "partitions".
> This command is not required; with fastboot tool, the GPT partition can
> be handle with "flash" command in "gpt" target (=CONFIG_FASTBOOT_GPT_NAME),
> for example: fastboot flash gpt gpt.bin
> 
> This patch avoids to define the GPT partitioning in U-Boot environment,
> which is incompatible with planned modifications, for example to
> support TF-A firmware update.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  configs/stm32mp15_basic_defconfig     |  1 -
>  configs/stm32mp15_defconfig           |  1 -
>  configs/stm32mp15_trusted_defconfig   |  1 -
>  include/configs/stm32mp15_common.h    | 14 --------------
>  include/configs/stm32mp15_st_common.h |  1 -
>  5 files changed, 18 deletions(-)
> 
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 174eb42d6447..dc67873d3934 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -109,7 +109,6 @@ CONFIG_FASTBOOT_MMC_BOOT1_NAME="mmc1boot0"
>  CONFIG_FASTBOOT_MMC_BOOT2_NAME="mmc1boot1"
>  CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
>  CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
> -CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
>  CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
>  CONFIG_FASTBOOT_CMD_OEM_BOOTBUS=y
>  CONFIG_GPIO_HOG=y
> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> index b25477c64d03..fd8c9121762e 100644
> --- a/configs/stm32mp15_defconfig
> +++ b/configs/stm32mp15_defconfig
> @@ -82,7 +82,6 @@ CONFIG_FASTBOOT_MMC_BOOT1_NAME="mmc1boot0"
>  CONFIG_FASTBOOT_MMC_BOOT2_NAME="mmc1boot1"
>  CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
>  CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
> -CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
>  CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
>  CONFIG_FASTBOOT_CMD_OEM_BOOTBUS=y
>  CONFIG_GPIO_HOG=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index e93a66f867cf..ec6298a0cb4a 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -83,7 +83,6 @@ CONFIG_FASTBOOT_MMC_BOOT1_NAME="mmc1boot0"
>  CONFIG_FASTBOOT_MMC_BOOT2_NAME="mmc1boot1"
>  CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
>  CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
> -CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
>  CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
>  CONFIG_FASTBOOT_CMD_OEM_BOOTBUS=y
>  CONFIG_GPIO_HOG=y
> diff --git a/include/configs/stm32mp15_common.h b/include/configs/stm32mp15_common.h
> index 7db72a19ed95..29a1197b5ae2 100644
> --- a/include/configs/stm32mp15_common.h
> +++ b/include/configs/stm32mp15_common.h
> @@ -92,19 +92,6 @@
>  		"run distro_bootcmd;" \
>  	"fi;\0"
>  
> -#ifdef CONFIG_FASTBOOT_CMD_OEM_FORMAT
> -/* eMMC default partitions for fastboot command: oem format */
> -#define STM32MP_PARTS_DEFAULT \
> -	"partitions=" \
> -	"name=ssbl,size=2M;" \
> -	"name=bootfs,size=64MB,bootable;" \
> -	"name=vendorfs,size=16M;" \
> -	"name=rootfs,size=746M;" \
> -	"name=userfs,size=-\0"
> -#else
> -#define STM32MP_PARTS_DEFAULT
> -#endif
> -
>  #define STM32MP_EXTRA \
>  	"env_check=if env info -p -d -q; then env save; fi\0" \
>  	"boot_net_usb_start=true\0"
> @@ -138,7 +125,6 @@
>  #define CFG_EXTRA_ENV_SETTINGS \
>  	STM32MP_MEM_LAYOUT \
>  	STM32MP_BOOTCMD \
> -	STM32MP_PARTS_DEFAULT \
>  	BOOTENV \
>  	STM32MP_EXTRA \
>  	STM32MP_BOARD_EXTRA_ENV
> diff --git a/include/configs/stm32mp15_st_common.h b/include/configs/stm32mp15_st_common.h
> index 866cd7a719f8..b45982a35b8c 100644
> --- a/include/configs/stm32mp15_st_common.h
> +++ b/include/configs/stm32mp15_st_common.h
> @@ -47,7 +47,6 @@
>  #define CFG_EXTRA_ENV_SETTINGS \
>  	STM32MP_MEM_LAYOUT \
>  	ST_STM32MP1_BOOTCMD \
> -	STM32MP_PARTS_DEFAULT \
>  	BOOTENV \
>  	STM32MP_EXTRA \
>  	STM32MP_BOARD_EXTRA_ENV

Applied to u-boot-stm/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
