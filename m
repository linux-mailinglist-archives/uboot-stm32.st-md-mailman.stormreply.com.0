Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C18A7E987B
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Nov 2023 10:02:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F0C6C6C83A;
	Mon, 13 Nov 2023 09:02:43 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDB03C6B47D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Nov 2023 09:02:42 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AD0SqKg023699; Mon, 13 Nov 2023 10:02:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=QoqGGfz1yMWpSA7M38DUtCYQmguWiDd/FxbsA2dhxtQ=; b=nl
 FcclMsonbXrPLl3N62FW+ov7tZG8WtabCbRu8NLTOr74GQv1ZeCUs7gIrgnGuN3s
 MWp8nyq2bArAvv2r3pp/QPD7YBus6co4k7GLDmRWNJRSPsDLG1Mk4o1MpmveC+29
 Q/C3vLvPKd9GPDJOfVMFnVRLTkQNBdw0xg+pI05S7h5g6GqtID2Qt107mLSstxI6
 6040EiMB2A3mKUAX7s+TC6ZcLpcz7CRvD3lLabzFXeU94o5bn+XGZfVFUtgz5RIx
 UZr2GbUweVVisJR911a7e8XIqLrYaSk3SxT9GFwrrP97yYuJ3w20+YJTgq6ArK+K
 wuIE+D+6DRZUvyMpCEKg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uanenkqqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Nov 2023 10:02:38 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3F9FF10005B;
 Mon, 13 Nov 2023 10:02:38 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3588420C8FB;
 Mon, 13 Nov 2023 10:02:38 +0100 (CET)
Received: from [10.201.20.54] (10.201.20.54) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 13 Nov
 2023 10:02:37 +0100
Message-ID: <2297f9d7-5c5c-48a7-bd83-58123f4e5e29@foss.st.com>
Date: Mon, 13 Nov 2023 10:02:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20231111104625.137511-1-dario.binacchi@amarulasolutions.com>
 <20231111104625.137511-2-dario.binacchi@amarulasolutions.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20231111104625.137511-2-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.201.20.54]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-12_24,2023-11-09_01,2023-05-22_02
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

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
