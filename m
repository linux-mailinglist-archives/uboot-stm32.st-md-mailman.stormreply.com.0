Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BC0569BCC
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Jul 2022 09:40:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C45E9C640F5;
	Thu,  7 Jul 2022 07:40:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77541C640ED
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Jul 2022 07:40:48 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2670t2Hg025690;
 Thu, 7 Jul 2022 09:40:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=yrhm2HfPqwsX8Lt3lTMvvzu0InA4+TfC8/+a8gnh6Y8=;
 b=1FQCMdoIGAP/P9y+UJ5O9+2nQi4cDgSvA4Gs6kPQqI0tci12/92ZAEv3U4NPXhbw7N4K
 Jc+Nvy9IIE8JQw69s5lO71YVbD+tCZKBbzlmHbPbUTwgVd0o6wwBjZbo7h0Ioxa07/07
 1YvHYkATsCuAMctIokq4/r9fx56kDyFM67z35qle19aM3pLTVpk9QnSg9jUFK6vK9qdw
 9U4CjXdR8vwqRn3nHu3R+vIZVyEHuYGlwsu3aLKWSnjmjAP3KOX8OQuHJcDZ/pJwVchv
 vvveXIBnuYA6YOR9XzcfTwEBK9bcxZoVGTFJU5vjQJjTEMwPNpurZkDSIJRTTAlNZLsU Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h58bp6y1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jul 2022 09:40:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2D916100034;
 Thu,  7 Jul 2022 09:40:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 26E60210F87;
 Thu,  7 Jul 2022 09:40:47 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 7 Jul
 2022 09:40:46 +0200
Message-ID: <d1ca3bdd-477d-8c12-1fd9-b0d14cecbe73@foss.st.com>
Date: Thu, 7 Jul 2022 09:40:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220630101930.v2.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
 <20220630101930.v2.10.Ib030c4ab9d5c65698a8194766fb53406e909122e@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220630101930.v2.10.Ib030c4ab9d5c65698a8194766fb53406e909122e@changeid>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_06,2022-06-28_01,2022-06-22_01
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v2 10/10] configs: stm32mp13: activate
	some command
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

On 6/30/22 10:20, Patrick Delaunay wrote:
> Activate useful commands in STM32MP13x config, already activated in
> stm32mp15_defconfig.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> (no changes since v1)
> 
>  configs/stm32mp13_defconfig | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
> index f58c73b7c79..f94798a9ff8 100644
> --- a/configs/stm32mp13_defconfig
> +++ b/configs/stm32mp13_defconfig
> @@ -20,17 +20,25 @@ CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
>  CONFIG_SYS_PROMPT="STM32MP> "
>  CONFIG_CMD_ADTIMG=y
>  CONFIG_CMD_ERASEENV=y
> +CONFIG_CMD_NVEDIT_EFI=y
>  CONFIG_CMD_MEMINFO=y
>  CONFIG_CMD_MEMTEST=y
> +CONFIG_CMD_UNZIP=y
>  CONFIG_CMD_CLK=y
>  CONFIG_CMD_GPIO=y
>  CONFIG_CMD_I2C=y
> +CONFIG_CMD_LSBLK=y
>  CONFIG_CMD_MMC=y
>  CONFIG_CMD_CACHE=y
> +CONFIG_CMD_EFIDEBUG=y
>  CONFIG_CMD_TIME=y
>  CONFIG_CMD_RNG=y
>  CONFIG_CMD_TIMER=y
> +CONFIG_CMD_REGULATOR=y
> +CONFIG_CMD_EXT4_WRITE=y
> +CONFIG_CMD_MTDPARTS=y
>  CONFIG_CMD_LOG=y
> +CONFIG_CMD_UBI=y
>  CONFIG_OF_LIVE=y
>  CONFIG_ENV_IS_NOWHERE=y
>  CONFIG_ENV_IS_IN_MMC=y
> @@ -38,9 +46,16 @@ CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
>  CONFIG_SYS_RELOC_GD_ENV_ADDR=y
>  CONFIG_SYS_MMC_ENV_DEV=-1
>  CONFIG_CLK_SCMI=y
> +CONFIG_GPIO_HOG=y
>  CONFIG_DM_I2C=y
>  CONFIG_SYS_I2C_STM32F7=y
> +CONFIG_LED=y
> +CONFIG_LED_GPIO=y
> +CONFIG_SUPPORT_EMMC_BOOT=y
>  CONFIG_STM32_SDMMC2=y
> +CONFIG_MTD=y
> +CONFIG_DM_MTD=y
> +CONFIG_SYS_MTDPARTS_RUNTIME=y
>  CONFIG_DM_ETH=y
>  CONFIG_PINCONF=y
>  CONFIG_DM_REGULATOR=y
> @@ -58,6 +73,7 @@ CONFIG_TEE=y
>  CONFIG_OPTEE=y
>  # CONFIG_OPTEE_TA_AVB is not set
>  CONFIG_ERRNO_STR=y
> +CONFIG_FDT_FIXUP_PARTITIONS=y
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
