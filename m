Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 026C877E275
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Aug 2023 15:23:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B872BC6B45E;
	Wed, 16 Aug 2023 13:23:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEBDEC6907A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 13:23:43 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37GDKTsp002367; Wed, 16 Aug 2023 15:23:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=VXwEMDub7QUzURVXtk2Y1UF2uVpPONA9jMkhfuoSg7o=; b=ZZ
 WGrNTzGuX06sucPnRjWV9EDb98bzqt+xyViOEVkcomNe8m1eLOliTJMOI7QSpw7X
 KFSFn3UVKQo78ERmcU0bwlr/dFW7oUx0mD75xHhpqr5iUOunGayqGUWk65jMMW66
 hQ2S7PXvV/Q/4JhXfaZvYn86TOSLjF/FjeQG5eK6Rv8t26AyNvH+3aRvL1PBwOdx
 LQAU3Z5bhS5whZYBpANvIRfVFyW3pMAW17df3Tjm3JHfMYBcJhBUi7GYte8Gkpcb
 98Y8WKFWPmkDwU/IW1SkyWX3vn7dLL2ZT44aWH50xfWMSSV4zw276ATQePvzrZrv
 x5vf3km8Ax4oLeHNChZQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sgth61xu1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Aug 2023 15:23:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 51DF710005D;
 Wed, 16 Aug 2023 15:23:41 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4ABA123D419;
 Wed, 16 Aug 2023 15:23:41 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 16 Aug
 2023 15:23:40 +0200
Message-ID: <4de67859-8088-0d24-1aa1-5b1c78a226ed@foss.st.com>
Date: Wed, 16 Aug 2023 15:23:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230623150449.1.I2f1f79c3a6283502490ee63fc158237bd43efa2f@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230623150449.1.I2f1f79c3a6283502490ee63fc158237bd43efa2f@changeid>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_12,2023-08-15_02,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] clk: stm32mp1: remove error for disabled
 clock in stm32mp1_clk_get_parent
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



On 6/23/23 15:05, Patrick Delaunay wrote:
> To disabled a clock in clock tree initialization for a mux of STM32MP15,
> the selected clock source index is set with the latest possible index for
> the number of bit used. Today this valid configuration cause a error
> in U-Boot messages, for example with CLK_ETH_DISABLED, when this clock
> is not needed for the used ETH PHY without crystal:
> 
>    no parents defined for clk id 123
> 
> This patch change the level of this message to avoid this trace for
> valid clock tree.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/clk/stm32/clk-stm32mp1.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/stm32/clk-stm32mp1.c b/drivers/clk/stm32/clk-stm32mp1.c
> index 4f4524fcb2c6..615028769495 100644
> --- a/drivers/clk/stm32/clk-stm32mp1.c
> +++ b/drivers/clk/stm32/clk-stm32mp1.c
> @@ -881,7 +881,8 @@ static int stm32mp1_clk_get_parent(struct stm32mp1_clk_priv *priv,
>  		return sel[s].parent[p];
>  	}
>  
> -	log_err("no parents defined for clk id %d\n", (u32)id);
> +	/* clock is DISABLED when the clock src is not in clk_parent[] range */
> +	log_debug("no parents defined for clk id %d\n", (u32)id);
>  
>  	return -EINVAL;
>  }

applied on stm32-master

Thanka
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
