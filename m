Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DC67AFB73
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Sep 2023 08:56:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2EF3C6B462;
	Wed, 27 Sep 2023 06:56:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82D9CC6A60C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Sep 2023 06:56:12 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38R6NEe3015600; Wed, 27 Sep 2023 08:56:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=tQ/pE7CVYYtB0oSN9uHPDXhn0sa+tWru6tNGkcra0io=; b=nw
 TB1qXz8HuqDs6fAF/gMUkTv9KEuyRD6tt7Z/pnL++hHA7UoZvFi6YIaBshOYb+2R
 OBbIdklmF3iQAupm7qXWbNVMYBWjLavuIDl4ZMaj/KQ94ZehXCYuZiCHDrBy0JSF
 26ql+COPbIR0z+pOks8ekox27sKv3CmSaUEcPBLtlTZS+DiFEakHiMHdDUbs2qAq
 NO3NRo+Awa7/raW8MkQgxN6TmEiWqgjL+C81DJqViajMyizJBef5lyGnhxB1AGX7
 m4DUwAFbct9orf4vzkfyNSgYeb4CLlzHkQMZehNtbssyEU1fZKwjrehrojwI1yYW
 uemJl3AleQOvdsxJoXEg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ta9k0dk3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Sep 2023 08:56:11 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A02B6100062;
 Wed, 27 Sep 2023 08:56:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9AA99212FA2;
 Wed, 27 Sep 2023 08:56:10 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 27 Sep
 2023 08:56:10 +0200
Message-ID: <d030d44d-71f4-976e-da73-2515d628be21@foss.st.com>
Date: Wed, 27 Sep 2023 08:56:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, <u-boot@lists.denx.de>
References: <20230919152759.327420-1-gatien.chevallier@foss.st.com>
 <20230919152759.327420-4-gatien.chevallier@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230919152759.327420-4-gatien.chevallier@foss.st.com>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_03,2023-09-26_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Sughosh Ganu <sughosh.ganu@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v3 3/7] rng: stm32: Implement configurable
 RNG clock error detection
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



On 9/19/23 17:27, Gatien Chevallier wrote:
> RNG clock error detection is now enabled if the "clock-error-detect"
> property is set in the device tree.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> Changes in V2:
> 	- Added Patrick's tag
> 
>  drivers/rng/stm32_rng.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/rng/stm32_rng.c b/drivers/rng/stm32_rng.c
> index 89da78c6c8..ada5d92214 100644
> --- a/drivers/rng/stm32_rng.c
> +++ b/drivers/rng/stm32_rng.c
> @@ -40,6 +40,7 @@ struct stm32_rng_plat {
>  	struct clk clk;
>  	struct reset_ctl rst;
>  	const struct stm32_rng_data *data;
> +	bool ced;
>  };
>  
>  static int stm32_rng_read(struct udevice *dev, void *data, size_t len)
> @@ -97,25 +98,34 @@ static int stm32_rng_init(struct stm32_rng_plat *pdata)
>  
>  	cr = readl(pdata->base + RNG_CR);
>  
> -	/* Disable CED */
> -	cr |= RNG_CR_CED;
>  	if (pdata->data->has_cond_reset) {
>  		cr |= RNG_CR_CONDRST;
> +		if (pdata->ced)
> +			cr &= ~RNG_CR_CED;
> +		else
> +			cr |= RNG_CR_CED;
>  		writel(cr, pdata->base + RNG_CR);
>  		cr &= ~RNG_CR_CONDRST;
> +		cr |= RNG_CR_RNGEN;
>  		writel(cr, pdata->base + RNG_CR);
>  		err = readl_poll_timeout(pdata->base + RNG_CR, cr,
>  					 (!(cr & RNG_CR_CONDRST)), 10000);
>  		if (err)
>  			return err;
> +	} else {
> +		if (pdata->ced)
> +			cr &= ~RNG_CR_CED;
> +		else
> +			cr |= RNG_CR_CED;
> +
> +		cr |= RNG_CR_RNGEN;
> +
> +		writel(cr, pdata->base + RNG_CR);
>  	}
>  
>  	/* clear error indicators */
>  	writel(0, pdata->base + RNG_SR);
>  
> -	cr |= RNG_CR_RNGEN;
> -	writel(cr, pdata->base + RNG_CR);
> -
>  	err = readl_poll_timeout(pdata->base + RNG_SR, sr,
>  				 sr & RNG_SR_DRDY, 10000);
>  	return err;
> @@ -165,6 +175,8 @@ static int stm32_rng_of_to_plat(struct udevice *dev)
>  	if (err)
>  		return err;
>  
> +	pdata->ced = dev_read_bool(dev, "clock-error-detect");
> +
>  	return 0;
>  }
>  
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
