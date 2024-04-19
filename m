Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E63BD8AAE36
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:13:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA6F3C6DD9A;
	Fri, 19 Apr 2024 12:13:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31213C6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:13:08 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43JAuoAX023460; Fri, 19 Apr 2024 14:12:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=IKyRrvmLd4y5TRlrbnRiNpuFTVPA1x+ggMbXqsyaDL8=; b=cW
 +T9gJPEW+T5xY936NhruF4zdix2JBJwpifcaD7MhT77jlEU5MpM1gbCuA6Uzzyzt
 lgLY8FYs5gbYuj8k57Yk/yOOgv/X/0j6lyb5PWjiW8N7gaouTInrL0Q8KwGe7eUg
 numpueeNX8kgADGKxff7KTF3+oz2VdfZAc75+Zu1B4GNvax4aRTRKEwpbceSTrkc
 semntWYvhOtggpfxYS5QZiC9OwQJmrKJIaQhSdq4YnoySE5bWpVHrrou4+emUtsT
 +zhGr04hzMSPFE41+lMPG7CMu+rXmz0GLdAPZds3CcpWq9n8J2yaTC5MsWRUmYA6
 O5X+CGbgS/KFnkX2NF5A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xg3m128p5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:12:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E213D40044;
 Fri, 19 Apr 2024 14:12:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F20792194E5;
 Fri, 19 Apr 2024 14:12:25 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:12:25 +0200
Message-ID: <0a1694e0-3021-4d08-a732-6d67aa8d614e@foss.st.com>
Date: Fri, 19 Apr 2024 14:12:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240414183843.146985-1-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240414183843.146985-1-marex@denx.de>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
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

Applied on u-boot-stm32/master 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
