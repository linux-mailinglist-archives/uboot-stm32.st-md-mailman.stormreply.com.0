Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA04497ECF
	for <lists+uboot-stm32@lfdr.de>; Mon, 24 Jan 2022 13:14:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E128DC5F1D3;
	Mon, 24 Jan 2022 12:14:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE3E4C57B6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jan 2022 12:14:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20O8b1CU016957;
 Mon, 24 Jan 2022 13:14:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=2sEK8jqUhcq8IAbuLUIPTe+FApsGdvz87j7KNhzUwTE=;
 b=C/EmyFwOQWC+Nmes6m7FEBcWVv/e7ZFJ+5iogSDCLbTO9uqWR0roMcDyXRK7Ien/qa6H
 AS0SYYg3HRui0GTF2/EQFi71w/UKEEYwih7nfKj4HSxlPa0aSqgaPyEt1vweceSZaDzA
 76EfvMO344TSAl2sjRxQ+GgPfCPH9scuoaMRUjIzKtryTrYYQMGJuHQAxcIWAWt2kmP3
 kjn8NECTE0uBq676jEBtiqrxUZn3dTBGzTnsbcThPy9y9nv4r1CCJ3B69GeHn/kYBqfJ
 EMc7cDCvM1kKCd7C2Iph6MRHCEsrOtyqxrWZeN0JVXBc1x8c/9D7vk+IRgRiLLHwS2PB QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dsrru13ye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 13:14:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A34DC10002A;
 Mon, 24 Jan 2022 13:14:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9AB5F214D1A;
 Mon, 24 Jan 2022 13:14:35 +0100 (CET)
Received: from [10.201.21.201] (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 24 Jan
 2022 13:14:34 +0100
Message-ID: <1159f907-d232-d8fa-68c5-6573af4ef1c5@foss.st.com>
Date: Mon, 24 Jan 2022 13:14:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211207100549.1.Iafe36c0d5ba0a3fbd8016d9ae07ef5db77c553c7@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20211207100549.1.Iafe36c0d5ba0a3fbd8016d9ae07ef5db77c553c7@changeid>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_06,2022-01-24_01,2021-12-02_01
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] stm32mp: remove the bootcount
	activation
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

On 12/7/21 10:05, Patrick Delaunay wrote:
> Today the bootcount is not managed by the Linux kernel for STM32MP15 as
> we don't have driver to update the used backup register in TAMP and the
> recovery command still executes the normal bootcmd with
> 'altbootcmd=run bootcmd'.
> 
> So the bootcount feature is never used, the config CONFIG_BOOTCOUNT_LIMIT
> and the associated environment variable 'altbootcmd' can be removed to
> reduce the U-Boot size.
> 
> Each boards can re-enable this feature later in their defconfig, if it is
> needed, with the expected backend, for example CONFIG_BOOTCOUNT_GENERIC
> or CONFIG_BOOTCOUNT_ENV.
> 
> CC: Marek Vasut <marex@denx.de>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/Kconfig      | 8 --------
>  include/configs/stm32mp15_common.h | 1 -
>  2 files changed, 9 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index a6c7fc5bfd..2fa4ea4d5c 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -68,9 +68,7 @@ choice
>  config TARGET_ST_STM32MP15x
>  	bool "STMicroelectronics STM32MP15x boards"
>  	select STM32MP15x
> -	imply BOOTCOUNT_LIMIT
>  	imply BOOTSTAGE
> -	imply CMD_BOOTCOUNT
>  	imply CMD_BOOTSTAGE
>  	imply CMD_CLS if CMD_BMP
>  	imply DISABLE_CONSOLE
> @@ -85,9 +83,7 @@ config TARGET_ST_STM32MP15x
>  config TARGET_MICROGEA_STM32MP1
>  	bool "Engicam MicroGEA STM32MP1 SOM"
>  	select STM32MP15x
> -	imply BOOTCOUNT_LIMIT
>  	imply BOOTSTAGE
> -	imply CMD_BOOTCOUNT
>  	imply CMD_BOOTSTAGE
>  	imply CMD_CLS if CMD_BMP
>  	imply DISABLE_CONSOLE
> @@ -112,9 +108,7 @@ config TARGET_MICROGEA_STM32MP1
>  config TARGET_ICORE_STM32MP1
>  	bool "Engicam i.Core STM32MP1 SOM"
>  	select STM32MP15x
> -	imply BOOTCOUNT_LIMIT
>  	imply BOOTSTAGE
> -	imply CMD_BOOTCOUNT
>  	imply CMD_BOOTSTAGE
>  	imply CMD_CLS if CMD_BMP
>  	imply DISABLE_CONSOLE
> @@ -136,8 +130,6 @@ config TARGET_ICORE_STM32MP1
>  config TARGET_DH_STM32MP1_PDK2
>  	bool "DH STM32MP1 PDK2"
>  	select STM32MP15x
> -	imply BOOTCOUNT_LIMIT
> -	imply CMD_BOOTCOUNT
>  	help
>  		Target the DH PDK2 development kit with STM32MP15x SoM.
>  
> diff --git a/include/configs/stm32mp15_common.h b/include/configs/stm32mp15_common.h
> index dab679f71e..8cf97d73ad 100644
> --- a/include/configs/stm32mp15_common.h
> +++ b/include/configs/stm32mp15_common.h
> @@ -138,7 +138,6 @@
>  #endif
>  
>  #define STM32MP_EXTRA \
> -	"altbootcmd=run bootcmd\0" \
>  	"env_check=if env info -p -d -q; then env save; fi\0" \
>  	"boot_net_usb_start=true\0"
>  
Applied to u-boot-stm/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
