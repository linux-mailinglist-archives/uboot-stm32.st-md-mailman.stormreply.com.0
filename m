Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3D67AFB77
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Sep 2023 08:57:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14753C6B462;
	Wed, 27 Sep 2023 06:57:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24B08C6A60C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Sep 2023 06:57:01 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38QJ9k9C007893; Wed, 27 Sep 2023 08:57:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=VLHXNH7OZHg7GPy720Mx0Qwozr6r8VbKA1EM5n1fhhQ=; b=Tf
 16Wo+4AQUJyTvrnKMYLaHWP9D+jQ99hxUvgzyjXCws5majlm/MMdwGTdTQ9V7ZaK
 3Y8eJrMvBzaoUgp+0H1CoYBKZnE2VYQNaN3oYuorSqAbLfhsizwgzSXnPyDeqtck
 OciYyy3jpc1/7cm055hTcBcXRe5MmvCpJ+DubhQAxiUgGe11L++w2o2lW9P4l72b
 v18l0k9Lz/D0xXM/9myaGHo3vHX79jlAbuF2fM8Q0Ofdn+PhRiqTSBpvV/h3trNn
 jctUNm6mYrVPUa1A6wZj5BODicol0ilWhprhrGrBCBuFUvt8Vsd1r81Jb6RX5F92
 0IZ/tR2gQwYmnKn914cw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t9qbwypxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Sep 2023 08:56:59 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7AD1C100066;
 Wed, 27 Sep 2023 08:56:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 74C92212FAA;
 Wed, 27 Sep 2023 08:56:59 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 27 Sep
 2023 08:56:58 +0200
Message-ID: <b67dae97-67e7-22c3-4e21-2f8a5fd2d386@foss.st.com>
Date: Wed, 27 Sep 2023 08:56:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, <u-boot@lists.denx.de>
References: <20230919152759.327420-1-gatien.chevallier@foss.st.com>
 <20230919152759.327420-5-gatien.chevallier@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230919152759.327420-5-gatien.chevallier@foss.st.com>
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
Subject: Re: [Uboot-stm32] [PATCH v3 4/7] rng: stm32: add RNG clock
	frequency restraint
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
> In order to ensure a good RNG quality and compatibility with
> certified RNG configuration, add RNG clock frequency restraint.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> Changes in V2:
> 	- Added Patrick's tag
> 
>  drivers/rng/stm32_rng.c | 43 ++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 38 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/rng/stm32_rng.c b/drivers/rng/stm32_rng.c
> index ada5d92214..f943acd7d2 100644
> --- a/drivers/rng/stm32_rng.c
> +++ b/drivers/rng/stm32_rng.c
> @@ -18,10 +18,11 @@
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  
> -#define RNG_CR		0x00
> -#define RNG_CR_RNGEN	BIT(2)
> -#define RNG_CR_CED	BIT(5)
> -#define RNG_CR_CONDRST	BIT(30)
> +#define RNG_CR			0x00
> +#define RNG_CR_RNGEN		BIT(2)
> +#define RNG_CR_CED		BIT(5)
> +#define RNG_CR_CLKDIV_SHIFT	16
> +#define RNG_CR_CONDRST		BIT(30)
>  
>  #define RNG_SR		0x04
>  #define RNG_SR_SEIS	BIT(6)
> @@ -31,7 +32,15 @@
>  
>  #define RNG_DR		0x08
>  
> +/*
> + * struct stm32_rng_data - RNG compat data
> + *
> + * @max_clock_rate:	Max RNG clock frequency, in Hertz
> + * @has_cond_reset:	True if conditionnal reset is supported
> + *
> + */
>  struct stm32_rng_data {
> +	uint max_clock_rate;
>  	bool has_cond_reset;
>  };
>  
> @@ -87,6 +96,26 @@ static int stm32_rng_read(struct udevice *dev, void *data, size_t len)
>  	return 0;
>  }
>  
> +static uint stm32_rng_clock_freq_restrain(struct stm32_rng_plat *pdata)
> +{
> +	ulong clock_rate = 0;
> +	uint clock_div = 0;
> +
> +	clock_rate = clk_get_rate(&pdata->clk);
> +
> +	/*
> +	 * Get the exponent to apply on the CLKDIV field in RNG_CR register.
> +	 * No need to handle the case when clock-div > 0xF as it is physically
> +	 * impossible.
> +	 */
> +	while ((clock_rate >> clock_div) > pdata->data->max_clock_rate)
> +		clock_div++;
> +
> +	log_debug("RNG clk rate : %lu\n", clk_get_rate(&pdata->clk) >> clock_div);
> +
> +	return clock_div;
> +}
> +
>  static int stm32_rng_init(struct stm32_rng_plat *pdata)
>  {
>  	int err;
> @@ -99,7 +128,9 @@ static int stm32_rng_init(struct stm32_rng_plat *pdata)
>  	cr = readl(pdata->base + RNG_CR);
>  
>  	if (pdata->data->has_cond_reset) {
> -		cr |= RNG_CR_CONDRST;
> +		uint clock_div = stm32_rng_clock_freq_restrain(pdata);
> +
> +		cr |= RNG_CR_CONDRST | (clock_div << RNG_CR_CLKDIV_SHIFT);
>  		if (pdata->ced)
>  			cr &= ~RNG_CR_CED;
>  		else
> @@ -186,10 +217,12 @@ static const struct dm_rng_ops stm32_rng_ops = {
>  
>  static const struct stm32_rng_data stm32mp13_rng_data = {
>  	.has_cond_reset = true,
> +	.max_clock_rate = 48000000,
>  };
>  
>  static const struct stm32_rng_data stm32_rng_data = {
>  	.has_cond_reset = false,
> +	.max_clock_rate = 3000000,
>  };
>  
>  static const struct udevice_id stm32_rng_match[] = {

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
