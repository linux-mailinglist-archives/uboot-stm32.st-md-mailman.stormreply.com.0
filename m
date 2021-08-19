Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A263F187E
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Aug 2021 13:47:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B2F1C58D7A;
	Thu, 19 Aug 2021 11:47:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86686C58D58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Aug 2021 11:47:55 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17JBkEkn021181; Thu, 19 Aug 2021 13:47:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=aLxVh3baXw/EwC3yiIRiQDu2yt6AnXB4PUJKbKwxpRw=;
 b=21HVxUCZzWKZqRIjV7NFr8UaQpkBV6lvvAiexEUq5WU1kD3yKXv8Va6wjrdZ8SU5rUNc
 ClqWr4lEhs7D/felK4/OJjAbra/Dr2EDKLxmHImBCjAZP6iCiWdfAtaw/P0H7rXRs+Jk
 pYmyzmnP86/5952RP+HQW5LTjgOWRVFNmvSHfas5kNJsxQixiaCCA+kmb5OtQNFtQw+l
 +bolccmWUC83Frh9XhO/XhpDh4L7UJd1FdXnggHmotjRH1Yg1lB0c2mZgbnkAVu4jpL4
 X+e4t+8oo0BlaSoXjhgxd1YvFGELaVrCwl9p4FPB0o5tIlqigAIU6SntYeHNfz69/USe 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3ah8re47cm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 13:47:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CE32810002A;
 Thu, 19 Aug 2021 13:47:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C3B4F231475;
 Thu, 19 Aug 2021 13:47:53 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 19 Aug
 2021 13:47:53 +0200
To: <u-boot@lists.denx.de>
References: <20210803100515.29383-1-patrice.chotard@foss.st.com>
 <20210803100515.29383-8-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <b13f1efd-7639-ba52-c90e-566d75d653e7@foss.st.com>
Date: Thu, 19 Aug 2021 13:47:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803100515.29383-8-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-19_04:2021-08-17,
 2021-08-19 signatures=0
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v1 7/7] i2c: stm32f7: compute i2cclk only
	one time
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

HI Patrick

On 8/3/21 12:05 PM, Patrice Chotard wrote:
> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
> 
> Compute i2cclk only one time in stm32_i2c_compute_timing()
> and remove setup parameter (accessible in i2c_priv).
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
>  drivers/i2c/stm32f7_i2c.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
> index 2b2dae67a3..c6ae65badb 100644
> --- a/drivers/i2c/stm32f7_i2c.c
> +++ b/drivers/i2c/stm32f7_i2c.c
> @@ -507,14 +507,13 @@ static int stm32_i2c_xfer(struct udevice *bus, struct i2c_msg *msg,
>  	return 0;
>  }
>  
> -static int stm32_i2c_compute_solutions(struct stm32_i2c_setup *setup,
> +static int stm32_i2c_compute_solutions(u32 i2cclk,
> +				       struct stm32_i2c_setup *setup,
>  				       const struct stm32_i2c_spec *specs,
>  				       struct list_head *solutions)
>  {
>  	struct stm32_i2c_timings *v;
>  	u32 p_prev = STM32_PRESC_MAX;
> -	u32 i2cclk = DIV_ROUND_CLOSEST(STM32_NSEC_PER_SEC,
> -				       setup->clock_src);
>  	u32 af_delay_min, af_delay_max;
>  	u16 p, l, a;
>  	int sdadel_min, sdadel_max, scldel_min;
> @@ -582,7 +581,8 @@ static int stm32_i2c_compute_solutions(struct stm32_i2c_setup *setup,
>  	return ret;
>  }
>  
> -static int stm32_i2c_choose_solution(struct stm32_i2c_setup *setup,
> +static int stm32_i2c_choose_solution(u32 i2cclk,
> +				     struct stm32_i2c_setup *setup,
>  				     const struct stm32_i2c_spec *specs,
>  				     struct list_head *solutions,
>  				     struct stm32_i2c_timings *s)
> @@ -591,8 +591,6 @@ static int stm32_i2c_choose_solution(struct stm32_i2c_setup *setup,
>  	u32 i2cbus = DIV_ROUND_CLOSEST(STM32_NSEC_PER_SEC,
>  				       setup->speed_freq);
>  	u32 clk_error_prev = i2cbus;
> -	u32 i2cclk = DIV_ROUND_CLOSEST(STM32_NSEC_PER_SEC,
> -				       setup->clock_src);
>  	u32 clk_min, clk_max;
>  	u32 af_delay_min;
>  	u32 dnf_delay;
> @@ -679,9 +677,9 @@ static const struct stm32_i2c_spec *get_specs(u32 rate)
>  }
>  
>  static int stm32_i2c_compute_timing(struct stm32_i2c_priv *i2c_priv,
> -				    struct stm32_i2c_setup *setup,
>  				    struct stm32_i2c_timings *output)
>  {
> +	struct stm32_i2c_setup *setup = &i2c_priv->setup;
>  	const struct stm32_i2c_spec *specs;
>  	struct stm32_i2c_timings *v, *_v;
>  	struct list_head solutions;
> @@ -712,11 +710,11 @@ static int stm32_i2c_compute_timing(struct stm32_i2c_priv *i2c_priv,
>  	}
>  
>  	INIT_LIST_HEAD(&solutions);
> -	ret = stm32_i2c_compute_solutions(setup, specs, &solutions);
> +	ret = stm32_i2c_compute_solutions(i2cclk, setup, specs, &solutions);
>  	if (ret)
>  		goto exit;
>  
> -	ret = stm32_i2c_choose_solution(setup, specs, &solutions, output);
> +	ret = stm32_i2c_choose_solution(i2cclk, setup, specs, &solutions, output);
>  	if (ret)
>  		goto exit;
>  
> @@ -761,7 +759,7 @@ static int stm32_i2c_setup_timing(struct stm32_i2c_priv *i2c_priv,
>  	}
>  
>  	do {
> -		ret = stm32_i2c_compute_timing(i2c_priv, setup, timing);
> +		ret = stm32_i2c_compute_timing(i2c_priv, timing);
>  		if (ret) {
>  			log_debug("failed to compute I2C timings.\n");
>  			if (setup->speed_freq > I2C_SPEED_STANDARD_RATE) {
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
