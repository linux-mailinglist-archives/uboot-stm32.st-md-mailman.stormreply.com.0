Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C147B59188A
	for <lists+uboot-stm32@lfdr.de>; Sat, 13 Aug 2022 06:11:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DC73C04004;
	Sat, 13 Aug 2022 04:11:41 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16B2CC03FC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Aug 2022 04:11:40 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id n21so2180076qkk.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Aug 2022 21:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc;
 bh=/CreIji414y2RbvFJDNXK6c6JIpEpUlaLTZGehAvxmM=;
 b=OYZfWqDZnUiWyhgqsUUm0kB9/7XGe7FChtD0qipt+B+yB8FEm2u83ztYmmuKRaCgWz
 Lp1ziWaCqR+MuRjFEE/8e3HQEOBYMazK4uzQGn4DLaHVhXQFCKo/blQAer7PNAvJxmX2
 rnUT6S7pid09L2F31Tg+ZQaqHuzgLmdamn/qkZSKfu4F9x0nVcAPCiv/gZbPiJvCQlrM
 X3NxAtw215k5qL8/lyTnuIkKt/kWm+uvKRjlDa9P5ODvwdqOMAhDgYxzkSdjxY0JVexw
 g3RBzfWMDl/ok2MoWc00Um8J1b6nDjwhq3aD+iDEFVSqkKy/Q3ruMqZubZnkHT2goVMH
 LQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject
 :x-gm-message-state:from:to:cc;
 bh=/CreIji414y2RbvFJDNXK6c6JIpEpUlaLTZGehAvxmM=;
 b=fKVOwjhnDoof6vtEjeL1x2Z9caFzwfYQCnp5lmFEIeqDrCoTepSy0TRq3PUNX1WlJW
 2o6QhNTbRp/B81JHpZf2uzXERtd6seo8CqVTiuABO9sAwh1Xd0kyWfElCl8UwRbqPyQ7
 tuyAxbrlFMlXoVdHbEjrfnbvKug3wY5/G9WtnaB4JK1XUm2SvV7f+MwXrRTl5F6Pjg43
 W7PP/9oys/T61thaYN8MNyj7l3N8x+Ias0vxXublbLtK7t/ZqGu/virJQ//oFg8XRd2T
 CsoOVKXivmgvvhPxmHQutdjEtZsKziz30330nACEuakyWJzkHR8lNcCJQ9UbeVsLU3gp
 xD/Q==
X-Gm-Message-State: ACgBeo0beRRxBOjOSMCLEDjdi8ixvecxAEbDNVkHOtFvxiCL3+xeESdh
 yorPK9aycPmaYMzRvJ2zi+A2OPyybek=
X-Google-Smtp-Source: AA6agR7rMoeziC0mw89ua5aBUSmijI6kBN+eev8QeB5cZ3R+CUzBcyoveua2Bi5flVNZkJheUPKmYw==
X-Received: by 2002:a05:620a:458c:b0:6b6:1713:2b0f with SMTP id
 bp12-20020a05620a458c00b006b617132b0fmr4934498qkb.244.1660363898576; 
 Fri, 12 Aug 2022 21:11:38 -0700 (PDT)
Received: from [192.168.1.201] (pool-173-73-95-180.washdc.fios.verizon.net.
 [173.73.95.180]) by smtp.gmail.com with ESMTPSA id
 x25-20020ac85399000000b00341f912e64dsm3059401qtp.93.2022.08.12.21.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 21:11:38 -0700 (PDT)
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220712142352.RESEND.v2.1.Ifa06360115ffa3f3307372e6cdd98ec16759d6ba@changeid>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <b778f10b-7c13-e4a9-1f91-9408f39eed98@gmail.com>
Date: Sat, 13 Aug 2022 00:11:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20220712142352.RESEND.v2.1.Ifa06360115ffa3f3307372e6cdd98ec16759d6ba@changeid>
Content-Language: en-US
Cc: Sean Anderson <sean.anderson@seco.com>, Tero Kristo <t-kristo@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Tero Kristo <kristo@kernel.org>
Subject: Re: [Uboot-stm32] [RESEND PATCH v2] clk: update
 clk_clean_rate_cache to use private clk struct
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Patrick,

Sorry for the (very late) response.

On 7/12/22 8:24 AM, Patrick Delaunay wrote:
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
>   drivers/clk/clk-uclass.c | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-uclass.c b/drivers/clk/clk-uclass.c
> index b89c77bf794..5cfa022a6dc 100644
> --- a/drivers/clk/clk-uclass.c
> +++ b/drivers/clk/clk-uclass.c
> @@ -544,6 +544,19 @@ ulong clk_round_rate(struct clk *clk, ulong rate)
>   	return ops->round_rate(clk, rate);
>   }
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
>   static void clk_clean_rate_cache(struct clk *clk)
>   {
>   	struct udevice *child_dev;
> @@ -563,6 +576,7 @@ static void clk_clean_rate_cache(struct clk *clk)
>   ulong clk_set_rate(struct clk *clk, ulong rate)
>   {
>   	const struct clk_ops *ops;
> +	struct clk *clkp;
>   
>   	debug("%s(clk=%p, rate=%lu)\n", __func__, clk, rate);
>   	if (!clk_valid(clk))
> @@ -572,8 +586,10 @@ ulong clk_set_rate(struct clk *clk, ulong rate)
>   	if (!ops->set_rate)
>   		return -ENOSYS;
>   
> +	/* get private clock struct used for cache */
> +	clk_get_priv(clk, &clkp);
>   	/* Clean up cached rates for us and all child clocks */
> -	clk_clean_rate_cache(clk);
> +	clk_clean_rate_cache(clkp);
>   
>   	return ops->set_rate(clk, rate);
>   }
> 

Reviewed-by: Sean Anderson <seanga2@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
