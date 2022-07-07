Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D55569AC2
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Jul 2022 08:53:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9E88C0D2BF;
	Thu,  7 Jul 2022 06:53:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 720A4C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Jul 2022 06:53:05 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2675lq63030886
 for <uboot-stm32@st-md-mailman.stormreply.com>; Thu, 7 Jul 2022 08:53:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=akbth9JB2m/GxZuSSAHpmABkfk2rLtZfxFz/mpI6uoo=;
 b=YZVJYOZQxx2VLwX17+Q6JPI478vQXWz9VyDT20zzTXIUuc93LfVCyU1DgC5lRs8TmzVx
 XXVaFa9D14fvd3E0NgJ6XN8MN0u35Cm1oxC/bxuRfNFeQZdG1iqol/veKZxdbFxAVJFJ
 hxNHVHnnaT32/FNx3tA6nDxz3DZDIotBFDlDnXU6av2v81DFIrKKm3WnIUBj0J/tZN4U
 35AlqOlYYrhsbYtpzU5ELEavNUVuHEHIfv+GCo36KGGjgfdT8HP7uS6taqXHdQ3McIOC
 sYVEfKPJ1u79XfiMM2gIjYFCqT+1vApxi3wG0/Zf81BZUhHq69t6amXRx125G0lMPkGs MA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h4uadjnf7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Thu, 07 Jul 2022 08:53:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 81A7E100034
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Jul 2022 08:53:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7DE4120F577
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Jul 2022 08:53:04 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 7 Jul
 2022 08:53:04 +0200
Message-ID: <1bffadbd-b7ba-4fb6-3227-a7b7ce4f7926@foss.st.com>
Date: Thu, 7 Jul 2022 08:53:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: <uboot-stm32@st-md-mailman.stormreply.com>
References: <20220620153717.v2.1.Ifa06360115ffa3f3307372e6cdd98ec16759d6ba@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220620153717.v2.1.Ifa06360115ffa3f3307372e6cdd98ec16759d6ba@changeid>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_04,2022-06-28_01,2022-06-22_01
Subject: Re: [Uboot-stm32] [PATCH v2] clk: update clk_clean_rate_cache to
 use private clk struct
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

On 6/20/22 15:37, Patrick Delaunay wrote:
> In clk_clean_rate_cache, clk->rate should update the private clock
> struct, in particular when CCF is activated, to save the cached
> rate value.
> 
> When clk_get_parent_rate is called, the cached information
> is read from pclk->rate, with pclk = clk_get_parent(clk).
> 
> As the cached is read from private clk data, the update should
> be done also on it.
> 
> Fixes: 6b7fd3128f7 ("clk: fix set_rate to clean up cached rates for the hierarchy")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> Changes in v2:
> - set *clkp = clk when CCF is not activated and when the clock is not found
> 
>  drivers/clk/clk-uclass.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-uclass.c b/drivers/clk/clk-uclass.c
> index b89c77bf794..5cfa022a6dc 100644
> --- a/drivers/clk/clk-uclass.c
> +++ b/drivers/clk/clk-uclass.c
> @@ -544,6 +544,19 @@ ulong clk_round_rate(struct clk *clk, ulong rate)
>  	return ops->round_rate(clk, rate);
>  }
>  
> +static void clk_get_priv(struct clk *clk, struct clk **clkp)
> +{
> +	*clkp = clk;
> +
> +	/* get private clock struct associated to the provided clock */
> +	if (CONFIG_IS_ENABLED(CLK_CCF)) {
> +		/* Take id 0 as a non-valid clk, such as dummy */
> +		if (clk->id)
> +			clk_get_by_id(clk->id, clkp);
> +	}
> +}
> +
> +/* clean cache, called with private clock struct */
>  static void clk_clean_rate_cache(struct clk *clk)
>  {
>  	struct udevice *child_dev;
> @@ -563,6 +576,7 @@ static void clk_clean_rate_cache(struct clk *clk)
>  ulong clk_set_rate(struct clk *clk, ulong rate)
>  {
>  	const struct clk_ops *ops;
> +	struct clk *clkp;
>  
>  	debug("%s(clk=%p, rate=%lu)\n", __func__, clk, rate);
>  	if (!clk_valid(clk))
> @@ -572,8 +586,10 @@ ulong clk_set_rate(struct clk *clk, ulong rate)
>  	if (!ops->set_rate)
>  		return -ENOSYS;
>  
> +	/* get private clock struct used for cache */
> +	clk_get_priv(clk, &clkp);
>  	/* Clean up cached rates for us and all child clocks */
> -	clk_clean_rate_cache(clk);
> +	clk_clean_rate_cache(clkp);
>  
>  	return ops->set_rate(clk, rate);
>  }

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
