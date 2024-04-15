Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB0A8A4A88
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Apr 2024 10:40:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC3C5C6B444;
	Mon, 15 Apr 2024 08:40:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33FA5C69066
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 08:40:49 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43F7oB84024860; Mon, 15 Apr 2024 10:40:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=97g4++A4Dk34NRiujTlWOzHb+Nlx1GwZRlxpy8Rnfgo=; b=mk
 Bx+c/KRRUzT5ScbnxJFkwtkgshVVuQ05sHenCp0X0cBi620uk0QC9wvMtY3QXaoz
 Ku9b3/xisa+a8m+0mBZLZz8DLwn8bLlSTi129IkhpFt3N/d45HfnfZROgOmoa07Z
 HUpL4A0dkGIFa84ohanWILfSonYK9yCUIlvzfZrUOmhhVrbNt0gGsTA5sB6poW3c
 j8pg2PYLy8QAQIu6qbxxftka1oUoz+hsYixFvu5JtC5jMKfa3zHDKEYV2W5PIYTR
 3UR5d/IhkcYdN9eQPtcIw4typpwF9cbGcV3rOB+mpMhwfKf5DEtxVZbHls4TQEUW
 pdDyoifz9sBM1Mye9PAw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xff646gcn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Apr 2024 10:40:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8121340047;
 Mon, 15 Apr 2024 10:40:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7C354210595;
 Mon, 15 Apr 2024 10:40:04 +0200 (CEST)
Received: from [10.48.86.98] (10.48.86.98) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 15 Apr
 2024 10:40:03 +0200
Message-ID: <36598078-5f72-415b-81c8-71c928b35c94@foss.st.com>
Date: Mon, 15 Apr 2024 10:40:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240414183843.146985-1-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240414183843.146985-1-marex@denx.de>
X-Originating-IP: [10.48.86.98]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-15_08,2024-04-09_01,2023-05-22_02
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Igor Opaniuk <igor.opaniuk@foundries.io>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Drop superfluous Makefile
 entry for ecdsa_romapi.o
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

On 4/14/24 20:38, Marek Vasut wrote:
> The source file is in arch/arm/mach-stm32mp/ecdsa_romapi.c and not
> in arch/arm/mach-stm32mp/stm32mp1/ecdsa_romapi.c . There are two
> Makefile entries in each subdirectory. Drop the bogus one and keep
> only the correct one, the one in arch/arm/mach-stm32mp/Makefile .
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Igor Opaniuk <igor.opaniuk@foundries.io>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Simon Glass <sjg@chromium.org
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/mach-stm32mp/stm32mp1/Makefile | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/mach-stm32mp/stm32mp1/Makefile b/arch/arm/mach-stm32mp/stm32mp1/Makefile
> index 857148747ef..ebae50f66c9 100644
> --- a/arch/arm/mach-stm32mp/stm32mp1/Makefile
> +++ b/arch/arm/mach-stm32mp/stm32mp1/Makefile
> @@ -8,7 +8,6 @@ obj-y += cpu.o
>  obj-$(CONFIG_STM32MP13X) += stm32mp13x.o
>  obj-$(CONFIG_STM32MP15X) += stm32mp15x.o
>  
> -obj-$(CONFIG_STM32_ECDSA_VERIFY) += ecdsa_romapi.o
>  ifdef CONFIG_SPL_BUILD
>  obj-y += spl.o
>  obj-y += tzc400.o


Hi Marek

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
