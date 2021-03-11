Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A62337A04
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Mar 2021 17:52:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8B28C57183;
	Thu, 11 Mar 2021 16:52:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD530C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 16:52:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12BGhYr5024355; Thu, 11 Mar 2021 17:52:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=MtrSGLDgDdFf7npEeYBsyIPP7rACDQmBt1BsgtZWPMs=;
 b=reO/pIAn03sY0XNyGnsZ/RZCH6zY4AClI5nq6KhC090878S7aBsxBRC5q+jIvkWQH6F8
 2CE1691RQwpwC/ARAXoWDLd4nbRGFOTY76rayWcz5W5htcso/04Lu/MII34Cd4MPzj2K
 wSW2jm1ln4+jEtH3Ens98hI+0M/yyw0SJOzSI5rF//pI3KB9YPytufv1D+YJxu4nY1Zi
 a8TyVCaGt0ZXqOKFUzWD1rV9diANuqOtWUy+hdJB+EIxsqAcU/+TaBWDlCcT55ynvo4u
 CQvZOgWo621I9abox3acVokEeu5oawv4eUgFXsB1gM9/7o2fH9jGKS4TdH4JhOTLnLf4 rA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3741gq02h0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 17:52:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 37F7A10002A;
 Thu, 11 Mar 2021 17:52:03 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2051225F3E1;
 Thu, 11 Mar 2021 17:52:03 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 11 Mar
 2021 17:52:02 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210301131752.1.I8cbd6f92056fa2d10bf3880746d89ee0779f8e27>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <3ac0d968-264b-b85a-7216-6ddcbaa11d37@foss.st.com>
Date: Thu, 11 Mar 2021 17:52:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210301131752.1.I8cbd6f92056fa2d10bf3880746d89ee0779f8e27>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-11_06:2021-03-10,
 2021-03-11 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] board: stm32mp1: use
 CONFIG_SYS_MMC_ENV_DEV when available
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

On 3/1/21 1:17 PM, Patrick Delaunay wrote:
> Check whether user has explicitly defined the mmc device to use
> in mmc_get_env_dev() with CONFIG_SYS_MMC_ENV_DEV.
> 
> On STMicroelectronics boards the used mmc device for environment is
> the instance of boot device provided by the ROM code; the mmc instance
> is configured by alias in device tree. The used partition is defined in
> device tree with u-boot,mmc-env-partition = "ssbl".
> 
> This patch allows to override this selection for the support of customer
> boards without alias; for example when SDMMC1 is not used and ENV in
> mmc0=SDMMC2, user can force the value: CONFIG_SYS_MMC_ENV_DEV = 0.
> 
> On STMicroelectronics boards, the current behavior is kept with
> CONFIG_SYS_MMC_ENV_DEV = -1.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  board/st/stm32mp1/stm32mp1.c        | 8 +++++++-
>  configs/stm32mp15_basic_defconfig   | 1 +
>  configs/stm32mp15_trusted_defconfig | 1 +
>  3 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index ab85d8ba68..759181fb5d 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -862,8 +862,14 @@ const char *env_ext4_get_dev_part(void)
>  
>  int mmc_get_env_dev(void)
>  {
> -	u32 bootmode = get_bootmode();
> +	u32 bootmode;
> +
> +	if (CONFIG_SYS_MMC_ENV_DEV >= 0)
> +		return CONFIG_SYS_MMC_ENV_DEV;
> +
> +	bootmode = get_bootmode();
>  
> +	/* use boot instance to select the correct mmc device identifier */
>  	return (bootmode & TAMP_BOOT_INSTANCE_MASK) - 1;
>  }
>  
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 1c680984b8..a2f745099e 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -71,6 +71,7 @@ CONFIG_ENV_UBI_PART="UBI"
>  CONFIG_ENV_UBI_VOLUME="uboot_config"
>  CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
>  CONFIG_SYS_RELOC_GD_ENV_ADDR=y
> +CONFIG_SYS_MMC_ENV_DEV=-1
>  # CONFIG_SPL_ENV_IS_NOWHERE is not set
>  # CONFIG_SPL_ENV_IS_IN_SPI_FLASH is not set
>  CONFIG_STM32_ADC=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 107041119f..f41aaa750f 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -52,6 +52,7 @@ CONFIG_ENV_UBI_PART="UBI"
>  CONFIG_ENV_UBI_VOLUME="uboot_config"
>  CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
>  CONFIG_SYS_RELOC_GD_ENV_ADDR=y
> +CONFIG_SYS_MMC_ENV_DEV=-1
>  CONFIG_STM32_ADC=y
>  CONFIG_SET_DFU_ALT_INFO=y
>  CONFIG_USB_FUNCTION_FASTBOOT=y
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
