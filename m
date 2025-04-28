Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AE7A9F220
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Apr 2025 15:24:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84DD6C78034;
	Mon, 28 Apr 2025 13:24:05 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A52EC78F63
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 13:24:04 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9ZKIf010153;
 Mon, 28 Apr 2025 15:24:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 eOdsl2sa4gc81Va1UUlR++HMR7REbKcvG+z2zA/JBHw=; b=hc3Be32cGvS6lFuG
 qSYyqY+41a0OHPwMjh7R3TNxXMZLlTXSuVbQQxYpY6jxo2ggZQHBN66d8JWZ6PE6
 UMly0uXZsfu1Z7cyNwTAefp1RmIn63Ly+4hfad1xRCGoM6PxkwaqJHwfttnk5wsR
 26dlrpIKkxI3c0vUTPtMfai/vsOLkL2vItyaVeRqrQT/xlx7jjN2ba1/8bWX/hzb
 /ISgL9ZO3qAaTz1Cf1rV/v/hEgdqAybhMTd/oz34+1ZldRHI/5O4xa8Lurktx70w
 wtJbuOZ9irJUUntoqy4SfBTCLyXbPyxVZsBhCFdwxB7yCOGeOk3HZEXBXion4R4j
 9ro3wA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 469aencfsj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Apr 2025 15:24:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 36ED840060;
 Mon, 28 Apr 2025 15:23:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B5FC2A60158;
 Mon, 28 Apr 2025 15:22:55 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 15:22:55 +0200
Message-ID: <6ee6e0b3-3a2a-460b-aef1-332b1706d519@foss.st.com>
Date: Mon, 28 Apr 2025 15:22:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <u-boot@lists.denx.de>
References: <20250425131533.392747-1-patrice.chotard@foss.st.com>
 <20250425131533.392747-5-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250425131533.392747-5-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_05,2025-04-24_02,2025-02-21_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v2 04/22] board: st: stm32mp2: add
	env_get_location()
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



On 4/25/25 15:15, Patrice Chotard wrote:
> In case of several environment location support, env_get_location
> is needed to select the correct location depending of the boot
> device .
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
> (no changes since v1)
> 
>  board/st/stm32mp2/stm32mp2.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/board/st/stm32mp2/stm32mp2.c b/board/st/stm32mp2/stm32mp2.c
> index aa7dd31996e..c70ffaf5dbd 100644
> --- a/board/st/stm32mp2/stm32mp2.c
> +++ b/board/st/stm32mp2/stm32mp2.c
> @@ -6,7 +6,7 @@
>  #define LOG_CATEGORY LOGC_BOARD
>  
>  #include <config.h>
> -#include <env.h>
> +#include <env_internal.h>
>  #include <fdt_support.h>
>  #include <log.h>
>  #include <misc.h>
> @@ -59,6 +59,25 @@ int board_init(void)
>  	return 0;
>  }
>  
> +enum env_location env_get_location(enum env_operation op, int prio)
> +{
> +	u32 bootmode = get_bootmode();
> +
> +	if (prio)
> +		return ENVL_UNKNOWN;
> +
> +	switch (bootmode & TAMP_BOOT_DEVICE_MASK) {
> +	case BOOT_FLASH_SD:
> +	case BOOT_FLASH_EMMC:
> +		if (CONFIG_IS_ENABLED(ENV_IS_IN_MMC))
> +			return ENVL_MMC;
> +		else
> +			return ENVL_NOWHERE;
> +	default:
> +		return ENVL_NOWHERE;
> +	}
> +}
> +
>  int board_late_init(void)
>  {
>  	const void *fdt_compat;
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
