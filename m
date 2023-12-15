Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 924228149F0
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Dec 2023 15:04:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AABFC6DD6D;
	Fri, 15 Dec 2023 14:04:41 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49ED0C6DD6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 14:04:40 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BF9Wx5x016099; Fri, 15 Dec 2023 15:04:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=mT3VVtOVUw1PkeMpvz+BT9S92obtqBFwTJA7KnFPvAA=; b=ft
 Y3OL0XR5a/d3BciM4IAykeMJy8TUg6r34MgtrT8CT8LEdBIMXvRR70WRopwovF5T
 fImrQLMDd0FoPU/+sYFLhSzUdGvQxpFRsN0nTTc1DYJz75GXVwLPwDxzzGB2b1Qj
 FB4Kwsuz3ioMBcoTjtBsUS5P9WRlR6O5CHZ/jc+TIBFvz6pO6DGClQaAGm8rgiMh
 3mZGq7lOf2vdKR7b66mF3M8Ltkz1HjlhcB2D2RYXT1WWTXF3gfeEKSDzBwx/KIp/
 D8j/W2EjhRcMmVTSbPKZH1TZEK59jtRcUXvz3W5c9xhsTfGv8zWmEgWD/AmlLxCC
 kLhgBykn7y2yWULNzqHA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uw42nytjq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Dec 2023 15:04:35 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 307C5100052;
 Fri, 15 Dec 2023 15:04:35 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 28057226FC9;
 Fri, 15 Dec 2023 15:04:35 +0100 (CET)
Received: from [10.252.23.141] (10.252.23.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Dec
 2023 15:04:34 +0100
Message-ID: <73272cef-b129-425c-991c-d7c86a8abded@foss.st.com>
Date: Fri, 15 Dec 2023 15:04:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20231111104625.137511-1-dario.binacchi@amarulasolutions.com>
 <20231111104625.137511-2-dario.binacchi@amarulasolutions.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20231111104625.137511-2-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.252.23.141]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-15_08,2023-12-14_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, linux-amarula@amarulasolutions.com,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] clk: stm32f: fix setting of LCD clock
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



On 11/11/23 11:46, Dario Binacchi wrote:
> Set pllsaidivr only if the PLLSAIR output frequency is an exact multiple
> of the pixel clock rate. Otherwise, we search through all combinations
> of pllsaidivr * pllsair and use the one which gives the rate closest to
> requested one.
> 
> Fixes: 5e993508cb25 ("clk: clk_stm32f: Add set_rate for LTDC clock")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
>  drivers/clk/stm32/clk-stm32f.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/clk/stm32/clk-stm32f.c b/drivers/clk/stm32/clk-stm32f.c
> index 4c1864193357..d68c75ed2013 100644
> --- a/drivers/clk/stm32/clk-stm32f.c
> +++ b/drivers/clk/stm32/clk-stm32f.c
> @@ -522,18 +522,20 @@ static ulong stm32_set_rate(struct clk *clk, ulong rate)
>  
>  	/* get the current PLLSAIR output freq */
>  	pllsair_rate = stm32_clk_get_pllsai_rate(priv, PLLSAIR);
> -	best_div = pllsair_rate / rate;
> -
> -	/* look into pllsaidivr_table if this divider is available*/
> -	for (i = 0 ; i < sizeof(pllsaidivr_table); i++)
> -		if (best_div == pllsaidivr_table[i]) {
> -			/* set pll_saidivr with found value */
> -			clrsetbits_le32(&regs->dckcfgr,
> -					RCC_DCKCFGR_PLLSAIDIVR_MASK,
> -					pllsaidivr_table[i] <<
> -					RCC_DCKCFGR_PLLSAIDIVR_SHIFT);
> -			return rate;
> -		}
> +	if ((pllsair_rate % rate) == 0) {
> +		best_div = pllsair_rate / rate;
> +
> +		/* look into pllsaidivr_table if this divider is available */
> +		for (i = 0 ; i < sizeof(pllsaidivr_table); i++)
> +			if (best_div == pllsaidivr_table[i]) {
> +				/* set pll_saidivr with found value */
> +				clrsetbits_le32(&regs->dckcfgr,
> +						RCC_DCKCFGR_PLLSAIDIVR_MASK,
> +						pllsaidivr_table[i] <<
> +						RCC_DCKCFGR_PLLSAIDIVR_SHIFT);
> +				return rate;
> +			}
> +	}
>  
>  	/*
>  	 * As no pllsaidivr value is suitable to obtain requested freq,
Applied to u-boot-stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
