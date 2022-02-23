Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DB84C0D68
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Feb 2022 08:41:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C72CC5C829;
	Wed, 23 Feb 2022 07:41:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50372C57B6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Feb 2022 07:41:13 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21N75tha026142;
 Wed, 23 Feb 2022 08:41:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=XGN5fvnMw+Sc87hzEm01a4tMRZKIjZpNjLUAGsYWfMI=;
 b=n9MIjW3DyXSikThzCb7C/a3xMrKae+k53BNHU2aRUPsdXBL3kdOJZCvt/ys5wVdZ1Rw6
 9oX4CZ1mxf9pn3jaU0LXvCvH+0QNhs9e7XK/oFlJms6cQPqOneWPAdqRrcFgb1Ec/AGF
 LLdSG8aTPlcj7ANBBxCg0iNVLg7GxvhhiB1rKMvP6s6pa2Iot47y9xaH7ngPlkZ2cNmz
 NmfRV/N8WdUaUPCVxTO0TNtEUetAc7OUODN7tDPOA+vLbzgqLJAXlf3X+dYjSHE5NUFg
 q2DX+2GQBSlip2P55D8pEdP4fSL25JwzRok1B4LNENSSau10wzKVWpwnJFWf81jQbOOs OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3edg84g5p0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 08:41:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0A4E4100034;
 Wed, 23 Feb 2022 08:41:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ED2F32138E3;
 Wed, 23 Feb 2022 08:41:10 +0100 (CET)
Received: from [10.201.21.201] (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 23 Feb
 2022 08:41:10 +0100
Message-ID: <5d761c58-dada-9ef2-b2e5-fe3d4b6d2eb0@foss.st.com>
Date: Wed, 23 Feb 2022 08:41:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220201140211.1.I6a1d7cbbdc7d1b209e4fa704fa7dd6524b4cec9f@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220201140211.1.I6a1d7cbbdc7d1b209e4fa704fa7dd6524b4cec9f@changeid>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-23_02,2022-02-21_02,2021-12-02_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>,
 =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>, Gabriel
 Fernandez <gabriel.fernandez@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] video: stm32: stm32_ltdc: fix the check
 of return value of clk_set_rate()
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

On 2/1/22 14:02, Patrick Delaunay wrote:
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> The clk_set_rate() function returns rate as an 'ulong' not
> an 'int' and rate > 0 by default.
> 
> This patch avoids to display the associated warning when
> the set rate function returns the new frequency.
> 
> Fixes: aeaf330649e8 ("video: stm32: stm32_ltdc: add bridge to display controller")
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/video/stm32/stm32_ltdc.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/video/stm32/stm32_ltdc.c b/drivers/video/stm32/stm32_ltdc.c
> index 87e5fd54d9..e741e74739 100644
> --- a/drivers/video/stm32/stm32_ltdc.c
> +++ b/drivers/video/stm32/stm32_ltdc.c
> @@ -338,6 +338,7 @@ static int stm32_ltdc_probe(struct udevice *dev)
>  	struct display_timing timings;
>  	struct clk pclk;
>  	struct reset_ctl rst;
> +	ulong rate;
>  	int ret;
>  
>  	priv->regs = (void *)dev_read_addr(dev);
> @@ -375,13 +376,13 @@ static int stm32_ltdc_probe(struct udevice *dev)
>  		}
>  	}
>  
> -	ret = clk_set_rate(&pclk, timings.pixelclock.typ);
> -	if (ret)
> -		dev_warn(dev, "fail to set pixel clock %d hz\n",
> -			 timings.pixelclock.typ);
> +	rate = clk_set_rate(&pclk, timings.pixelclock.typ);
> +	if (IS_ERR_VALUE(rate))
> +		dev_warn(dev, "fail to set pixel clock %d hz, ret=%ld\n",
> +			 timings.pixelclock.typ, rate);
>  
>  	dev_dbg(dev, "Set pixel clock req %d hz get %ld hz\n",
> -		timings.pixelclock.typ, clk_get_rate(&pclk));
> +		timings.pixelclock.typ, rate);
>  
>  	ret = reset_get_by_index(dev, 0, &rst);
>  	if (ret) {

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
