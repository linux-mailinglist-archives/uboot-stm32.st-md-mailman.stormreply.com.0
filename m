Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 029F542647C
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 08:10:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F0D7C597B2;
	Fri,  8 Oct 2021 06:10:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BC4BC32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 06:10:04 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1984ZhIt017493; 
 Fri, 8 Oct 2021 08:09:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=fbd3JfdagYCkSMxvVmakQHSGZHoFQp91yz3TOgTxGRE=;
 b=Qlaw/ONx7bXnX5o5PjNPXk+/3pbxyTD82Khd340VD7lzov/2fXpLVG3g8Ea3ZUEYcfrG
 707hBILOLopiKqjVEEwWchcnxbmNmuZgOAwqXMF8xwxWPRE0pY2dEx7ds+/Vz4LuhgRJ
 TJQToDQOldu0LXbCHB4d4YbfKPIwl/LGK2bxYfBIaWzf8sff2vnLzgcy7WRGHYS6NXaN
 HCVhLzJSxzOaLINuzMpWtjUnYAAr+CTjfh5oYzQS0wSiRuLWAKgpDkQoJwzt4xFRfN2/
 mYWWLA+g/vCAd7bHNajCrxR2bFqgTWs2x4UQj7B20BMMT8/RcNyuZeHcyA2ddpZK//kW ZQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bjdun8svt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 08:09:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4BB08100051;
 Fri,  8 Oct 2021 08:09:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F0F942128DF;
 Fri,  8 Oct 2021 08:09:48 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 8 Oct
 2021 08:09:47 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211006181004.1.I0774e750b5e88f0d91ea2273a4616b784019c1dd@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <5cadcb66-f0fe-6868-e2ad-e7528dce2d54@foss.st.com>
Date: Fri, 8 Oct 2021 08:09:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211006181004.1.I0774e750b5e88f0d91ea2273a4616b784019c1dd@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_02,2021-10-07_02,2020-04-07_01
Cc: Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Rick Chen <rick@andestech.com>, Sean Anderson <seanga2@gmail.com>, U-Boot
 STM32 <uboot-stm32@st-md-mailman.stormreply.com>, Stefan Roese <sr@denx.de>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH] stv0991: remove specific CONFIG_STV0991
 configs
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

On 10/6/21 6:10 PM, Patrick Delaunay wrote:
> Remove the following STV0991 specific configs:
> - CONFIG_STV0991 (never used, only defined in CONFIG_SYS_EXTRA_OPTIONS)
> - CONFIG_STV0991_HZ (replaced by generic CONFIG_SYS_HZ)
> - CONFIG_STV0991_HZ_CLOCK (replaced by generic CONFIG_SYS_HZ_CLOCK)
> 
> This patch allows to reduce the file config_whitelist.txt.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/cpu/armv7/stv0991/timer.c              | 6 +++---
>  arch/arm/include/asm/arch-stv0991/stv0991_gpt.h | 4 ++--
>  configs/stv0991_defconfig                       | 1 -
>  scripts/config_whitelist.txt                    | 3 ---
>  4 files changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/cpu/armv7/stv0991/timer.c b/arch/arm/cpu/armv7/stv0991/timer.c
> index 07033acb5c..67764ccf66 100644
> --- a/arch/arm/cpu/armv7/stv0991/timer.c
> +++ b/arch/arm/cpu/armv7/stv0991/timer.c
> @@ -18,7 +18,7 @@ static struct stv0991_cgu_regs *const stv0991_cgu_regs = \
>  				(struct stv0991_cgu_regs *) (CGU_BASE_ADDR);
>  
>  #define READ_TIMER()	(readl(&gpt1_regs_ptr->cnt) & GPT_FREE_RUNNING)
> -#define GPT_RESOLUTION	(CONFIG_STV0991_HZ_CLOCK / CONFIG_STV0991_HZ)
> +#define GPT_RESOLUTION	(CONFIG_SYS_HZ_CLOCK / CONFIG_SYS_HZ)
>  
>  DECLARE_GLOBAL_DATA_PTR;
>  
> @@ -67,7 +67,7 @@ void __udelay(unsigned long usec)
>  {
>  	ulong tmo;
>  	ulong start = get_timer_masked();
> -	ulong tenudelcnt = CONFIG_STV0991_HZ_CLOCK / (1000 * 100);
> +	ulong tenudelcnt = CONFIG_SYS_HZ_CLOCK / (1000 * 100);
>  	ulong rndoff;
>  
>  	rndoff = (usec % 10) ? 1 : 0;
> @@ -110,5 +110,5 @@ unsigned long long get_ticks(void)
>   */
>  ulong get_tbclk(void)
>  {
> -	return CONFIG_STV0991_HZ;
> +	return CONFIG_SYS_HZ;
>  }
> diff --git a/arch/arm/include/asm/arch-stv0991/stv0991_gpt.h b/arch/arm/include/asm/arch-stv0991/stv0991_gpt.h
> index cd27472ad7..f1d5667c32 100644
> --- a/arch/arm/include/asm/arch-stv0991/stv0991_gpt.h
> +++ b/arch/arm/include/asm/arch-stv0991/stv0991_gpt.h
> @@ -36,7 +36,7 @@ struct gpt_regs *const gpt1_regs_ptr =
>  #define GPT_FREE_RUNNING		0xFFFF
>  
>  /* Timer, HZ specific defines */
> -#define CONFIG_STV0991_HZ		1000
> -#define CONFIG_STV0991_HZ_CLOCK		(27*1000*1000)/GPT_PRESCALER_128
> +#define CONFIG_SYS_HZ			1000
> +#define CONFIG_SYS_HZ_CLOCK		((27 * 1000 * 1000) / GPT_PRESCALER_128)
>  
>  #endif
> diff --git a/configs/stv0991_defconfig b/configs/stv0991_defconfig
> index b6ec831e6d..e06664047f 100644
> --- a/configs/stv0991_defconfig
> +++ b/configs/stv0991_defconfig
> @@ -12,7 +12,6 @@ CONFIG_ENV_SECT_SIZE=0x10000
>  CONFIG_SYS_MALLOC_LEN=0x14000
>  CONFIG_DEFAULT_DEVICE_TREE="stv0991"
>  CONFIG_SYS_LOAD_ADDR=0x0
> -CONFIG_SYS_EXTRA_OPTIONS="STV0991"
>  CONFIG_BOOTDELAY=3
>  CONFIG_AUTOBOOT_KEYED=y
>  CONFIG_AUTOBOOT_PROMPT="Hit SPACE in %d seconds to stop autoboot.\n"
> diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
> index 61ae682dcd..58f4b02f60 100644
> --- a/scripts/config_whitelist.txt
> +++ b/scripts/config_whitelist.txt
> @@ -1303,9 +1303,6 @@ CONFIG_STANDALONE_LOAD_ADDR
>  CONFIG_STATIC_BOARD_REV
>  CONFIG_STD_DEVICES_SETTINGS
>  CONFIG_STM32_FLASH
> -CONFIG_STV0991
> -CONFIG_STV0991_HZ
> -CONFIG_STV0991_HZ_CLOCK
>  CONFIG_SXNI855T
>  CONFIG_SYSFS
>  CONFIG_SYSMGR_ISWGRP_HANDOFF
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
