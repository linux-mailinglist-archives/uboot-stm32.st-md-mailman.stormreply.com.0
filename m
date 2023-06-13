Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C92972D9D1
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Jun 2023 08:23:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45EAFC6A615;
	Tue, 13 Jun 2023 06:23:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45DB4C6A60F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 06:23:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35D0LSf8030794; Tue, 13 Jun 2023 08:23:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=neR7M1eoNEXXjBeccTyBIw4u4VfBQ0DU+CYFLMHr6Gk=;
 b=N8gQSvFJU42uZEFfNpX/HdJizDMhKgv3LnpZmpM6JAMGiSP804eU331w+J/rFAnsOvij
 J88mqLYZ9LB8Og11wL6GXgxzJTYsu9duxbtPh1ILimU0LJB8G3jHjh386NhXmXTXx5ZE
 jvTucMjpweL4ngB1jFE7vui8Ln062QrclR9F5P/ElJo0LNlMTgqnw6vjcFOJ37mK6F3s
 6TRMGtf7z/JQmF40o1DOw2Y5EWldfVT9VdnjDblO/vPkYcKJb9CexMre5g2HRZcJ6m0I
 kSLZhcFGy25PsVaQ+1QJv38XYY5w5MpfhWELXxKa+F+lYZZBTC+E+PtcsdJGgFH0CXwx 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r652tupnf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 08:23:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6F1C110002A;
 Tue, 13 Jun 2023 08:23:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 664FD2128D3;
 Tue, 13 Jun 2023 08:23:50 +0200 (CEST)
Received: from [10.201.20.56] (10.201.20.56) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 13 Jun
 2023 08:23:50 +0200
Message-ID: <d4098c0a-d6d2-3ad1-e14c-fbbb001c9c30@foss.st.com>
Date: Tue, 13 Jun 2023 08:23:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
 <20230608171614.7.I26c6ed678ca158380032e3a31fc6b3a77ef6a33f@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230608171614.7.I26c6ed678ca158380032e3a31fc6b3a77ef6a33f@changeid>
X-Originating-IP: [10.201.20.56]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_03,2023-06-12_02,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 07/12] configs: stm32mp: Disable
 SYS_MTDPARTS_RUNTIME for stm32mp15 and stm32mp13
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
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> As we don't use anymore MTDPARTS_xx Kconfig variables
> (MTDPARTS_NAND0_BOOT, MTDPARTS_NOR0_BOOT...),
> disable SYS_MTDPARTS_RUNTIME.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  configs/stm32mp13_defconfig         | 1 -
>  configs/stm32mp15_basic_defconfig   | 1 -
>  configs/stm32mp15_defconfig         | 1 -
>  configs/stm32mp15_trusted_defconfig | 1 -
>  4 files changed, 4 deletions(-)
> 
> diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
> index b076573c450f..02a29cd9f03a 100644
> --- a/configs/stm32mp13_defconfig
> +++ b/configs/stm32mp13_defconfig
> @@ -59,7 +59,6 @@ CONFIG_SUPPORT_EMMC_BOOT=y
>  CONFIG_STM32_SDMMC2=y
>  CONFIG_MTD=y
>  CONFIG_DM_MTD=y
> -CONFIG_SYS_MTDPARTS_RUNTIME=y
>  CONFIG_PINCONF=y
>  CONFIG_DM_REGULATOR=y
>  CONFIG_DM_REGULATOR_FIXED=y
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 13355ebb4692..273b72fdaf0a 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -125,7 +125,6 @@ CONFIG_SUPPORT_EMMC_BOOT=y
>  CONFIG_STM32_SDMMC2=y
>  CONFIG_MTD=y
>  CONFIG_DM_MTD=y
> -CONFIG_SYS_MTDPARTS_RUNTIME=y
>  CONFIG_MTD_RAW_NAND=y
>  CONFIG_NAND_STM32_FMC2=y
>  CONFIG_SYS_NAND_ONFI_DETECTION=y
> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> index bad5c32ef808..b1f0f2f7c784 100644
> --- a/configs/stm32mp15_defconfig
> +++ b/configs/stm32mp15_defconfig
> @@ -98,7 +98,6 @@ CONFIG_SUPPORT_EMMC_BOOT=y
>  CONFIG_STM32_SDMMC2=y
>  CONFIG_MTD=y
>  CONFIG_DM_MTD=y
> -CONFIG_SYS_MTDPARTS_RUNTIME=y
>  CONFIG_MTD_RAW_NAND=y
>  CONFIG_NAND_STM32_FMC2=y
>  CONFIG_SYS_NAND_ONFI_DETECTION=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 5f0fb4565105..bcfd60e5a85a 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -99,7 +99,6 @@ CONFIG_SUPPORT_EMMC_BOOT=y
>  CONFIG_STM32_SDMMC2=y
>  CONFIG_MTD=y
>  CONFIG_DM_MTD=y
> -CONFIG_SYS_MTDPARTS_RUNTIME=y
>  CONFIG_MTD_RAW_NAND=y
>  CONFIG_NAND_STM32_FMC2=y
>  CONFIG_SYS_NAND_ONFI_DETECTION=y
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
