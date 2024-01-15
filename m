Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FCF82D96C
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jan 2024 14:06:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A64CC6B457;
	Mon, 15 Jan 2024 13:06:16 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37C87C6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 13:06:15 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40F8jNFn001862; Mon, 15 Jan 2024 14:06:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=wX558xlL6wFqa9j1mkxa+0W/hqusShM8an6hUNjrkBA=; b=u6
 EoW7Z4V276b/SQG4dP7yRC1by/TAEFFsF3VQ1ZDu0GI8Q3G5IC162MK+bVAdfPOi
 3CoD6F4vdskosY22MMdkD0FJxiB7sIsVsU4Shdf3j+C5fYYq7SxhYeqRC1bR/+UK
 fTAm+krugrJsBjGW/c5fXdlmAMRoku0aASxrm+qmbKLBGBQDDKUvJxHgWL43C/9T
 61ALNWAk/JCEDcmOgLPCZWNujUaSA8R4Uy1/3sQja92DMhBPei9t/I5Ox26w7Opa
 yLzcrX0pQ8DTsDfOuvL6gmTP7uOeNRg8L5p75B0ub7PgupAFz9pUScptHJcOxa99
 /b+Yuag3SIvG2ZWQ59Gw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vm6bnx1x5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jan 2024 14:06:11 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 63F6210002A;
 Mon, 15 Jan 2024 14:06:11 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5CF392815D8;
 Mon, 15 Jan 2024 14:06:11 +0100 (CET)
Received: from [10.201.20.205] (10.201.20.205) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 15 Jan
 2024 14:06:10 +0100
Message-ID: <e7e358a0-8f5c-47dc-86f0-b1b8fd3c69a5@foss.st.com>
Date: Mon, 15 Jan 2024 14:06:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240115124657.39109-1-patrick.delaunay@foss.st.com>
 <20240115134642.4.I81fedd3d2ff9635b3738dd1ef349c936bc9b433d@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240115134642.4.I81fedd3d2ff9635b3738dd1ef349c936bc9b433d@changeid>
X-Originating-IP: [10.201.20.205]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Simon Glass <sjg@chromium.org>, Igor Opaniuk <igor.opaniuk@foundries.io>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 04/12] stm32mp: bsec: add support of
	stm32mp25
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



On 1/15/24 13:46, Patrick Delaunay wrote:
> Add support of BSEC for STM32MP25x family to access OTP.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/bsec.c               | 7 +++++++
>  arch/arm/mach-stm32mp/include/mach/stm32.h | 3 ++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
> index 705c994d9307..5b869017ec1a 100644
> --- a/arch/arm/mach-stm32mp/bsec.c
> +++ b/arch/arm/mach-stm32mp/bsec.c
> @@ -784,9 +784,16 @@ static const struct stm32mp_bsec_drvdata stm32mp15_data = {
>  	.size = 96,
>  	.ta = false,
>  };
> +
> +static const struct stm32mp_bsec_drvdata stm32mp25_data = {
> +	.size = 368, /* 384 but no access to HWKEY and STM32PRVKEY */
> +	.ta = true,
> +};
> +
>  static const struct udevice_id stm32mp_bsec_ids[] = {
>  	{ .compatible = "st,stm32mp13-bsec", .data = (ulong)&stm32mp13_data},
>  	{ .compatible = "st,stm32mp15-bsec", .data = (ulong)&stm32mp15_data},
> +	{ .compatible = "st,stm32mp25-bsec", .data = (ulong)&stm32mp25_data},
>  	{}
>  };
>  
> diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
> index 46d469881b32..45c929aa605d 100644
> --- a/arch/arm/mach-stm32mp/include/mach/stm32.h
> +++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
> @@ -197,7 +197,8 @@ enum forced_boot_mode {
>  #ifdef CONFIG_STM32MP25X
>  #define BSEC_OTP_SERIAL	5
>  #define BSEC_OTP_RPN	9
> -#define BSEC_OTP_PKG	246
> +#define BSEC_OTP_PKG	122
> +#define BSEC_OTP_MAC	247
>  #endif
>  
>  #ifndef __ASSEMBLY__
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
