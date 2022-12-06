Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCF3643E22
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Dec 2022 09:11:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7D02C65E6E;
	Tue,  6 Dec 2022 08:11:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5ACCCC65E6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Dec 2022 08:11:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B63Hojr023741; Tue, 6 Dec 2022 09:11:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=xLbCVZ7iDc23pnFu632lcOd++l8xHt5/vfeKyg2lCAo=;
 b=eCKDjQ3Kh8P0pufB8lflLbyY+51hneyqwIGXvtZAPkeyNPoeV8Dj/BFpxKsSrYXEW4ps
 Xw8uNLP+0iqAggM9K8D9zyKZ6113kf3qGs8/tGvQaRmX1tjFrFq489O3xVmCyLgLcJiQ
 BPTn0i8AW927ZVJXDzNI28/OWK7OPePKJSFsWmROKtxVQjTC/fcxJeYCMkxTdXhEnlM9
 YnA5h0MslfUmA23BM8w7SoyVBw/XcN7hyFTC/0RyzmuXVIQyQ6H7NruahPwgYLc6QhgZ
 4TXCCxg3A0AplWgQFGLN8KHntbd4OOr3RIpOgY8MZtC95PtBYq7yizhUzb8ZQ3FmiT5P gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m7x7pqekx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 09:11:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E353D10002A;
 Tue,  6 Dec 2022 09:11:29 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DCB5B2132F6;
 Tue,  6 Dec 2022 09:11:29 +0100 (CET)
Received: from [10.201.20.130] (10.201.20.130) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 6 Dec
 2022 09:11:29 +0100
Message-ID: <9424d73b-3b56-613c-d79b-31fa4bfc709b@foss.st.com>
Date: Tue, 6 Dec 2022 09:11:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20221110104905.3076915-1-patrick.delaunay@foss.st.com>
 <20221110114828.4.Iaf11290be4bdcf09642f485beb2a77fbde4eaa17@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20221110114828.4.Iaf11290be4bdcf09642f485beb2a77fbde4eaa17@changeid>
X-Originating-IP: [10.201.20.130]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_05,2022-12-05_01,2022-06-22_01
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Peng Fan <peng.fan@nxp.com>,
 Wolfgang Denk <wd@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 4/8] env: mmc: add CONFIG_ENV_MMC_USE_DT
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



On 11/10/22 11:49, Patrick Delaunay wrote:
> Add a new config CONFIG_ENV_MMC_USE_DT to force configuration of the
> U-Boot environment offset with device tree config node.
> 
> This patch avoids issues when several CONFIG_ENV_IS_IN_XXX are activated,
> the defconfig file uses the same value for CONFIG_ENV_OFFSET or
> CONFIG_ENV_OFFSET_REDUND for the several ENV backends (SPI_FLASH, EEPROM
> NAND, SATA, MMC).
> 
> After this patch a bad offset value is not possible when the selected
> partition in device tree is not found.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  env/Kconfig | 16 ++++++++++++++++
>  env/mmc.c   |  7 +++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/env/Kconfig b/env/Kconfig
> index 24111dfaf47b..f8ee99052b97 100644
> --- a/env/Kconfig
> +++ b/env/Kconfig
> @@ -242,6 +242,13 @@ config ENV_IS_IN_MMC
>  	  This value is also in units of bytes, but must also be aligned to
>  	  an MMC sector boundary.
>  
> +	  CONFIG_ENV_MMC_USE_DT (optional):
> +
> +	  These define forces the configuration by the config node in device
> +	  tree with partition name: "u-boot,mmc-env-partition" or with
> +	  offset: "u-boot,mmc-env-offset", "u-boot,mmc-env-offset-redundant".
> +	  CONFIG_ENV_OFFSET and CONFIG_ENV_OFFSET_REDUND are not used.
> +
>  config ENV_IS_IN_NAND
>  	bool "Environment in a NAND device"
>  	depends on !CHAIN_OF_TRUST
> @@ -650,6 +657,15 @@ config SYS_MMC_ENV_PART
>  	  partition 0 or the first boot partition, which is 1 or some other defined
>  	  partition.
>  
> +config ENV_MMC_USE_DT
> +	bool "Read partition name and offset in DT"
> +	depends on ENV_IS_IN_MMC && OF_CONTROL
> +	help
> +	  Only use the device tree to get the environment location in MMC
> +	  device, with partition name or with offset.
> +	  The 2 defines CONFIG_ENV_OFFSET, CONFIG_ENV_OFFSET_REDUND
> +	  are not used as fallback.
> +
>  config USE_DEFAULT_ENV_FILE
>  	bool "Create default environment from file"
>  	help
> diff --git a/env/mmc.c b/env/mmc.c
> index 661a268ea07d..1894b6483220 100644
> --- a/env/mmc.c
> +++ b/env/mmc.c
> @@ -26,6 +26,12 @@
>  
>  #define ENV_MMC_INVALID_OFFSET ((s64)-1)
>  
> +#if defined(CONFIG_ENV_MMC_USE_DT)
> +/* ENV offset is invalid when not defined in Device Tree */
> +#define ENV_MMC_OFFSET		ENV_MMC_INVALID_OFFSET
> +#define ENV_MMC_OFFSET_REDUND	ENV_MMC_INVALID_OFFSET
> +
> +#else
>  /* Default ENV offset when not defined in Device Tree */
>  #define ENV_MMC_OFFSET		CONFIG_ENV_OFFSET
>  
> @@ -34,6 +40,7 @@
>  #else
>  #define ENV_MMC_OFFSET_REDUND	ENV_MMC_INVALID_OFFSET
>  #endif
> +#endif
>  
>  DECLARE_GLOBAL_DATA_PTR;
>  

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
