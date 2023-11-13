Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D3B7E9875
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Nov 2023 09:59:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E62A1C6C83A;
	Mon, 13 Nov 2023 08:59:47 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12933C6B47D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Nov 2023 08:59:45 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3ACMmvXT024583; Mon, 13 Nov 2023 09:59:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=YDRBUVh5czqdlzt0iPof0mEXonIMuegi9oYt0DbxH5M=; b=Pb
 r3gbIKPJV2/pmJ8HkJ747eZSqrUdyrpc6LaOJwNdmYAqaGTGzHYjvhrCY2/RlQan
 R65PfyAZC8+HwLS2d5xbUNikZTXK+/yFERcrskVQkfMBfqj3fXEqnIMumAiNJz0D
 TpJyQs0RP2yDvJHXsYhDJoYeRvuoXdMKl1xorkrkQhl4VxeER4gBM99SCU1x90HT
 zXheY3Y2pBQWFCKP0Ns3FtpQQ34rhLAk8HVvtYRj7sPXRweF1ow2Nl4wKW4qG3Vs
 EB6Y7Ds3BQhrc8vBz1fiOeDN3XQSC2bT+/Mz4dYwF2ukVyF2rKV8XpawgPt6iCv8
 8CYXzvwfZZ19fockaBQQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uanenkqa0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Nov 2023 09:59:42 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8858F10005B;
 Mon, 13 Nov 2023 09:59:41 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D16020BE6D;
 Mon, 13 Nov 2023 09:59:41 +0100 (CET)
Received: from [10.201.20.54] (10.201.20.54) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 13 Nov
 2023 09:59:40 +0100
Message-ID: <354a98b2-9e6a-4d55-97b5-40a7feb24055@foss.st.com>
Date: Mon, 13 Nov 2023 09:59:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20231111104625.137511-1-dario.binacchi@amarulasolutions.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20231111104625.137511-1-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.201.20.54]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-12_24,2023-11-09_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, linux-amarula@amarulasolutions.com,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] clk: stm32f: fix setting of division
 factor for LCD_CLK
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
> The value to be written to the register must be appropriately shifted,
> as is correctly done in other parts of the code.
> 
> Fixes: 5e993508cb25 ("clk: clk_stm32f: Add set_rate for LTDC clock")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  drivers/clk/stm32/clk-stm32f.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/stm32/clk-stm32f.c b/drivers/clk/stm32/clk-stm32f.c
> index ed7660196ef0..4c1864193357 100644
> --- a/drivers/clk/stm32/clk-stm32f.c
> +++ b/drivers/clk/stm32/clk-stm32f.c
> @@ -530,7 +530,8 @@ static ulong stm32_set_rate(struct clk *clk, ulong rate)
>  			/* set pll_saidivr with found value */
>  			clrsetbits_le32(&regs->dckcfgr,
>  					RCC_DCKCFGR_PLLSAIDIVR_MASK,
> -					pllsaidivr_table[i]);
> +					pllsaidivr_table[i] <<
> +					RCC_DCKCFGR_PLLSAIDIVR_SHIFT);
>  			return rate;
>  		}
>  

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks 
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
