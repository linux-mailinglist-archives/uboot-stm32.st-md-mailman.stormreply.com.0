Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E6248EBA2
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jan 2022 15:25:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80F41C5E2C1;
	Fri, 14 Jan 2022 14:25:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A581BC5C842
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jan 2022 14:25:32 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20EB2DQ5006973;
 Fri, 14 Jan 2022 15:25:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=i69jbr02g0TNfvss0t5qteerp4ybzatMW4CX1G08kqI=;
 b=fOeUK14F92JeriSLcdwWgAI30IcjFW64Rl3wlLHCMEbk6MlnPlNiV/dNzlwyubTpNIfD
 hFz2oXcpgGQOiBgLKhp+OkwFKPawz+giaEx0cGCk0jD2ip/BeGrSZ7UeVhsm5s7vbDe7
 unR79ys+BASj4ZYsbp6VdLe2rKL5n975AK87Pk/BT774aOw0fPFZYeb9nWqCJ7hwZOWx
 VC801couBsGth/JrRPIteRJmMsyUBu5Ll473s+psVL9UM62K7l6TyNwW9FYbQ47oTUcW
 N0JQwudKckRJFAGyixEV4m06zFeOq+wbp1v3Irbqz/9y+W5A6x6+pveO8Sl3spLaAkur aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dk3vyjjre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 15:25:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8FA0610002A;
 Fri, 14 Jan 2022 15:25:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 373B2214D2D;
 Fri, 14 Jan 2022 15:25:30 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 14 Jan
 2022 15:25:29 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211207100549.1.Iafe36c0d5ba0a3fbd8016d9ae07ef5db77c553c7@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <6e47968f-32c4-d5b4-8e89-b3ce23b656f1@foss.st.com>
Date: Fri, 14 Jan 2022 15:25:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211207100549.1.Iafe36c0d5ba0a3fbd8016d9ae07ef5db77c553c7@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_05,2022-01-14_01,2021-12-02_01
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

On 12/7/21 10:05 AM, Patrick Delaunay wrote:
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
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
