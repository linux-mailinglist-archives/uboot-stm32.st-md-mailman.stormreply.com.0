Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7F152E521
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 08:41:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A41F6C56630;
	Fri, 20 May 2022 06:41:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCFB7C5662F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 06:41:05 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K2POiM020075;
 Fri, 20 May 2022 08:41:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=j9Rf+lX9Uas9S7oP7+QfrBtIW8XxeF8UgVblci9zJ4w=;
 b=J44lsfWLBELUNyGvIj8A8LvgzQKLkWJl3aIXbeMT6ocBQYVJNOtzkaUT3pd6PS8og05t
 aUWoWvtj9V9GLyhwpycSDXptWeFHD0GwKLcrczop05RsZ8e0js3HB1Xb3Nucvua+93v5
 07uujHyfNnr8Wa/LjOUG+YsVsKxSu6No3yUMgaQTwv+DWlqqqWt3PNCBG1soVDLIriaN
 gdSyfspbLP8LNZE4bWq+urcrPXbKh1PaUpsuu7HRgPSfTqYMSyaivi11OURhI1XdYEbr
 0JlTthC/InJs/a0mjevk1ak8kGoUcZ0kYsmnF2MIw1dj1mUP8vDe81e1TSgQ+gQ2aykT aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21umak4h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 08:41:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C38AE100034;
 Fri, 20 May 2022 08:41:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BB66B2122E1;
 Fri, 20 May 2022 08:41:02 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.50) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 08:41:02 +0200
Message-ID: <d5817c57-112d-c333-876c-681453f20ddc@foss.st.com>
Date: Fri, 20 May 2022 08:41:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
 <20220506160540.7.Ifb968953516a3d73a38718892a7c58726bf641ae@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220506160540.7.Ifb968953516a3d73a38718892a7c58726bf641ae@changeid>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_02,2022-05-19_03,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 07/16] arm: stm32mp: add
	CONFIG_STM32MP15_PWR
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

On 5/6/22 16:06, Patrick Delaunay wrote:
> Add config CONFIG_STM32MP15_PWR to handle the
> access on regulators managed by the PWR driver defined in

s/the access on/the access to

> pwr_regulator.c
> 
> This driver is only used in U-Boot by STM32MP15x family.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/Kconfig.15x | 16 ++++++++++++++++
>  arch/arm/mach-stm32mp/Makefile    |  2 +-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-stm32mp/Kconfig.15x b/arch/arm/mach-stm32mp/Kconfig.15x
> index 19f161cf5c..d516270292 100644
> --- a/arch/arm/mach-stm32mp/Kconfig.15x
> +++ b/arch/arm/mach-stm32mp/Kconfig.15x
> @@ -77,6 +77,22 @@ config TARGET_ICORE_STM32MP1
>  
>  endchoice
>  
> +config STM32MP15_PWR
> +	bool "Enable driver for STM32MP15x PWR"
> +	depends on DM_REGULATOR && DM_PMIC
> +	default y
> +	help
> +		This config enables implementation of driver-model pmic and
> +		regulator uclass features for access to STM32MP15x PWR.
> +
> +config SPL_STM32MP15_PWR
> +	bool "Enable driver for STM32MP15x PWR in SPL"
> +	depends on SPL && SPL_DM_REGULATOR && SPL_DM_PMIC
> +	default y
> +	help
> +		This config enables implementation of driver-model pmic and
> +		regulator uclass features for access to STM32MP15x PWR in SPL.
> +
>  config SYS_TEXT_BASE
>  	default 0xC0100000
>  
> diff --git a/arch/arm/mach-stm32mp/Makefile b/arch/arm/mach-stm32mp/Makefile
> index d362104fee..0ffec6e02f 100644
> --- a/arch/arm/mach-stm32mp/Makefile
> +++ b/arch/arm/mach-stm32mp/Makefile
> @@ -21,5 +21,5 @@ obj-$(CONFIG_ARMV7_PSCI) += psci.o
>  obj-$(CONFIG_TFABOOT) += boot_params.o
>  endif
>  
> -obj-$(CONFIG_$(SPL_)DM_REGULATOR) += pwr_regulator.o
> +obj-$(CONFIG_$(SPL_)STM32MP15_PWR) += pwr_regulator.o
>  obj-$(CONFIG_OF_SYSTEM_SETUP) += fdt.o
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
