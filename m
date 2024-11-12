Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B5E9C5657
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2024 12:24:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9102C78F81;
	Tue, 12 Nov 2024 11:24:53 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F989C78F80
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 11:24:46 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC858QS017020;
 Tue, 12 Nov 2024 12:24:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 SAc05PaArjdYqoSpdn3C9NLASHipb2y894wGuf+IsYw=; b=O9CjedB5Wdum0mLd
 SN7qVP8LlgWX7NcWJ8gD1GnwsSo8N9j7vpWcthmMV/lDtWPV2oVeoIniU/5cK4ny
 RO5FVkfRxSvUHMxMSYAfVgwc5KNWNnU0ztliKu4wMDsdUDEYak37tJJrdTwt35Tb
 9MMpfHkJmbF6k+cnSRWTbgaea9ej/SzxaqEtsxhOtqi56Tu4Ztypt2Rbw/R/+Ary
 NaNrdTs2LxZbMae1pk/Bz8knM0NMr/j+4KozXsn5qaPnmVfhEgVctxpWcqhqul68
 cxVrRCl50M54QQGlqubVEksnKbfEZf441q6V7OtY/fNAtD0KW289S+A2guXrnF7T
 VoXiew==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42tkjnh5xm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2024 12:24:33 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BF52440044;
 Tue, 12 Nov 2024 12:23:32 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D94E628A88A;
 Tue, 12 Nov 2024 12:23:03 +0100 (CET)
Received: from [10.48.86.243] (10.48.86.243) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 12 Nov
 2024 12:23:03 +0100
Message-ID: <8b1b3d45-217d-486c-a52c-98e459f160a0@foss.st.com>
Date: Tue, 12 Nov 2024 12:23:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20241106190516.224197-1-marex@denx.de>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20241106190516.224197-1-marex@denx.de>
X-Originating-IP: [10.48.86.243]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Add optional manufacturing
 environment to DH STM32MP15xx DHSOM
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 11/6/24 20:04, Marek Vasut wrote:
> Add manufacturing environment into STM32MP15xx DH electronics DHSOM
> configuration. This environment is part of every board build, but only
> takes effect on systems booted with the dh,stm32mp15xx-dhcor-testbench
> device tree, i.e. systems populated with factory build of U-Boot.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Sean Anderson <seanga2@gmail.com>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>   configs/stm32mp15_dhsom.config       |  1 +
>   include/configs/stm32mp15_dh_dhsom.h | 17 ++++++++++++++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/configs/stm32mp15_dhsom.config b/configs/stm32mp15_dhsom.config
> index 4f8e98beec6..efc149577ea 100644
> --- a/configs/stm32mp15_dhsom.config
> +++ b/configs/stm32mp15_dhsom.config
> @@ -64,6 +64,7 @@ CONFIG_SYSRESET_SYSCON=y
>   CONFIG_SYS_BOOTCOUNT_ADDR=0x5C00A14C
>   CONFIG_SYS_MALLOC_F_LEN=0x3000
>   CONFIG_SYS_PBSIZE=1050
> +CONFIG_PREBOOT="run dh_preboot"
>   CONFIG_SYS_SPI_U_BOOT_OFFS=0x80000
>   CONFIG_TARGET_DH_STM32MP1_PDK2=y
>   CONFIG_USE_SERVERIP=y
> diff --git a/include/configs/stm32mp15_dh_dhsom.h b/include/configs/stm32mp15_dh_dhsom.h
> index 2797fc61d17..c004a8cec82 100644
> --- a/include/configs/stm32mp15_dh_dhsom.h
> +++ b/include/configs/stm32mp15_dh_dhsom.h
> @@ -18,6 +18,8 @@
>   #endif
>   
>   #define STM32MP_BOARD_EXTRA_ENV						\
> +	"dh_preboot="							\
> +		"run dh_testbench_backward_compat\0"			\
>   	"dh_update_sd_to_emmc=" /* Install U-Boot from SD to eMMC */	\
>   		"setexpr loadaddr1 ${loadaddr} + 0x1000000 && "		\
>   		"load mmc 0:4 ${loadaddr1} boot/u-boot-spl.stm32 && "	\
> @@ -61,7 +63,20 @@
>   	"stdout=serial\0"						\
>   	"stderr=serial\0"						\
>   	"update_sf=run dh_update_sd_to_sf\0"				\
> -	"usb_pgood_delay=1000\0"
> +	"usb_pgood_delay=1000\0"					\
> +	/* Old testbench-only backward compatibility environment */	\
> +	"dh_testbench_backward_compat="					\
> +		"test ${board_name} = \"dh,stm32mp15xx-dhcor-testbench\" && " \
> +		"run load_bootenv importbootenv\0"			\
> +	"importbootenv="						\
> +		"echo Importing environment from DHupdate.ini...;"	\
> +		"env import -t ${loadaddr} ${filesize}\0"		\
> +	"load_bootenv="							\
> +		"usb reset && "						\
> +		"load usb ${usbdev}:${usbpart} ${loadaddr} DHupdate.ini && " \
> +		"echo \"--> Update: found DHupdate.ini (${filesize} bytes)\"\0" \
> +	"usbdev=0\0"							\
> +	"usbpart=1\0"
>   
>   #include <configs/stm32mp15_common.h>



Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


>   
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
