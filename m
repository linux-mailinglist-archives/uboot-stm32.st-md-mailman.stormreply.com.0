Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C321B16E7F
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Jul 2025 11:23:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1614C3F933;
	Thu, 31 Jul 2025 09:23:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0109CC36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Jul 2025 09:23:31 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V89Y27010749;
 Thu, 31 Jul 2025 11:23:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 SRaiXlTjAPQR1pPNgJifYlRjjYp8SUh8jChN+FLmFgk=; b=n+EuZUclHAY/uW3a
 RRgqpMoQ05NsiF7SSCU6wAtX2mQxIeiJDZDtKFbIQJckkjHYXCJz8EyBTeJdEFxk
 yBqrNDwqFVaswrLFxf4jJt2trx9mkUlMUPi2UcM6yPIz25eRf3lST0uyr7SnEanc
 aFr4whbOpMadabmj5tuO99hLTha1mVQS/jkgR6/M/2gVpcDdqYsjRVlNe8G8uwqV
 RLqaLInWm1Iy28TjSSluDsvEejGTcV5z8NNQ4hRcF+10xYTizfrhEFIWdJaD9fJa
 GDeKZhPAFEzzuWIckyOCkC3jPR1QGbXrAQHhM19B3ccaqbaLxWDZoFM9qqFIdaoS
 iyJ5+A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484pc2peev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Jul 2025 11:23:29 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9708040046;
 Thu, 31 Jul 2025 11:22:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E6AAC75E839;
 Thu, 31 Jul 2025 11:22:37 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 31 Jul
 2025 11:22:37 +0200
Message-ID: <125d6ba6-8db4-447c-aced-b7487c8b814a@foss.st.com>
Date: Thu, 31 Jul 2025 11:22:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <u-boot@lists.denx.de>
References: <20250728091930.1.I9c06b505bca54ae2c983f3bf54112e7f91a00940@changeid>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250728091930.1.I9c06b505bca54ae2c983f3bf54112e7f91a00940@changeid>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: fix PRE_CON_BUF_ADDR on
	STM32MP13
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



On 7/28/25 09:19, Patrice Chotard wrote:
> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
> 
> Since SYS_MALLOC_F_LEN increasing to 0x2100000 on STM32MP13, the
> pre-console buffer is overlapped by stack (0xC0400000 + 0x2100000),
> so the this buffer must be moved just before the bootstage to avoid issue.
> 
> After this patch the pre-relocation memory mapping for STM32MP13x is:
> 
> C3000000	= Bootstage	CONFIG_BOOTSTAGE_STASH_ADDR
> C2FFF000	= PreConsole	CONFIG_PRE_CON_BUF_ADDR
>            with size CONFIG_PRE_CON_BUF_SZ = 4096
> C0400000	= start for stack	with CONFIG_CUSTOM_SYS_INIT_SP_ADDR
>            including CONFIG_SYS_MALLOC_F_LEN
> C0000000	= Load Address of U-Boot	with CONFIG_TEXT_BASE
> 
> Fixes: 93c962c7af7e ("configs: stm32mp13: increase SYS_MALLOC_F_LEN to 0x210000")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/Kconfig.13x | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-stm32mp/Kconfig.13x b/arch/arm/mach-stm32mp/Kconfig.13x
> index bc8b3f8cf77..fe323307e47 100644
> --- a/arch/arm/mach-stm32mp/Kconfig.13x
> +++ b/arch/arm/mach-stm32mp/Kconfig.13x
> @@ -23,7 +23,7 @@ config TEXT_BASE
>  	default 0xC0000000
>  
>  config PRE_CON_BUF_ADDR
> -	default 0xC0800000
> +	default 0xC2FFF000
>  
>  config PRE_CON_BUF_SZ
>  	default 4096
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
