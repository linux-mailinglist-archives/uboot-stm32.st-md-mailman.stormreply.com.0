Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF9517994B
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Mar 2020 20:50:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44F0FC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Mar 2020 19:50:05 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37040C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Mar 2020 19:50:01 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r17so3983847wrj.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Mar 2020 11:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ygBm8t6DheKdK5poVouimQ9NSram/IfFAEcpNpyOh3k=;
 b=D0tJmwpAnyTDtxsK7YEA2wk1+rs3ppEOGCDg1/gHI9XgGXskHm1KQZvJzIIJLvOEwu
 yXLN3hO6ZmSpCNEQyvboOwa+TOExq0xp7HVsbmD/1VgwxWCJSAwy7AoBDY7WAcIpUtOr
 xEGew6Pr2xlfV1wCRee3gFQVqBrz1uI2Y/WyyK2I5OSLea4SRD4pNlTHbRYRu8/lYpXB
 L/ZRu2HiBWtbU95dhfJnQpUHNKmq53eeuj52lDYKQaAf0pLsP6Bn5mXTxNoha1hju72J
 ZhS67aD7zHbHtD7IyegOf11MIZVAeUP9L+JqsV+OQCDOxj/NQrU8OxUz3lImCtJQvTia
 59jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ygBm8t6DheKdK5poVouimQ9NSram/IfFAEcpNpyOh3k=;
 b=l9xzozPfd1QUjRf2OT2P2cv9KT0VsHl+KB/5OsiZh7zywUmJZ228WrgjxiJ5JMws+q
 ucFti3itvkG+Ss4gb6MjU34AE32gKAeQ+6mU0vGnZZxbHOzoUYYp18PTZOQJtso3LgAx
 1FgEG1rVWsK94LBPckawV1KO0MOOEohixraoz8sy/06mkOj1ZIRfP2MEH2q1Jec+y2y4
 SYidDVmFmftxZlMKDE+uwc8tDy1G/XvQj1kqrf5rNlC/3okiPVwjvx4IFJGozeR/tYyP
 XOHoZvSmyKhjDTLkSs09y1TWthG0PPT/PQpL5lhfpfDnJnAr4OrMsN5NajCIeo2Qx1EB
 VSIg==
X-Gm-Message-State: ANhLgQ0Y9jG9D7esFWhjXjeNO0tzizKJpeVopRYV8uYIEKOAmz/DpEEQ
 7v6sYLfvsof++MAcD2XJ/6TCPh9F
X-Google-Smtp-Source: ADFU+vsU120vGWlQsEoH02XzXc/VWq/N32yBS1ZSmBvcpS0i2HyE7p5fRK+lgIe8W7RuoODjmOVxcQ==
X-Received: by 2002:adf:f745:: with SMTP id z5mr5714394wrp.54.1583351400608;
 Wed, 04 Mar 2020 11:50:00 -0800 (PST)
Received: from ?IPv6:2a02:8071:6cd:f600:3dff:b879:b41b:fa13?
 ([2a02:8071:6cd:f600:3dff:b879:b41b:fa13])
 by smtp.gmail.com with ESMTPSA id o16sm26217518wrj.5.2020.03.04.11.49.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 11:49:59 -0800 (PST)
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20200218083503.5468-1-patrick.delaunay@st.com>
 <20200218083503.5468-2-patrick.delaunay@st.com>
From: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Message-ID: <6981022d-792b-7776-ac9f-00af6acb1d0e@gmail.com>
Date: Wed, 4 Mar 2020 20:48:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200218083503.5468-2-patrick.delaunay@st.com>
Content-Language: en-US
Cc: Peng Fan <peng.fan@nxp.com>, Simon Glass <sjg@chromium.org>,
 Sekhar Nori <nsekhar@ti.com>, Lukasz Majewski <lukma@denx.de>,
 ley.foon.tan@intel.com, b.galvani@gmail.com,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v4 1/5] dm: clk: add stub when CONFIG_CLK
	is desactivated
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

Am 18.02.2020 um 09:34 schrieb Patrick Delaunay:
> Add stub for functions clk_...() when CONFIG_CLK is desactivated.
> 
> This patch avoids compilation issues for driver using these API
> without protection (#if CONFIG_IS_ENABLED(CLK))
> 
> For example, before this patch we have undefined reference to
> `clk_disable_bulk') for code:
>   clk_disable_bulk(&priv->clks);
>   clk_release_bulk(&priv->clks);
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
> Changes in v4:
> - Add stub for all functions using 'struct clk' or 'struct clk_bulk'
>   after remarks on v3
> 
> Changes in v3:
> - Add stub for clk_disable_bulk
> 
> Changes in v2: None
> 
>  include/clk.h | 101 +++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 88 insertions(+), 13 deletions(-)
> 
> diff --git a/include/clk.h b/include/clk.h
> index 3336301815..1fb415ddc8 100644
> --- a/include/clk.h
> +++ b/include/clk.h
> @@ -312,6 +312,7 @@ static inline int clk_release_bulk(struct clk_bulk *bulk)
>  	return clk_release_all(bulk->clks, bulk->count);
>  }
>  
> +#if CONFIG_IS_ENABLED(CLK)
>  /**
>   * clk_request - Request a clock by provider-specific ID.
>   *
> @@ -433,19 +434,6 @@ int clk_disable_bulk(struct clk_bulk *bulk);
>   */
>  bool clk_is_match(const struct clk *p, const struct clk *q);
>  
> -int soc_clk_dump(void);
> -
> -/**
> - * clk_valid() - check if clk is valid
> - *
> - * @clk:	the clock to check
> - * @return true if valid, or false
> - */
> -static inline bool clk_valid(struct clk *clk)
> -{
> -	return clk && !!clk->dev;
> -}
> -
>  /**
>   * clk_get_by_id() - Get the clock by its ID
>   *
> @@ -465,6 +453,93 @@ int clk_get_by_id(ulong id, struct clk **clkp);
>   * @return true on binded, or false on no
>   */
>  bool clk_dev_binded(struct clk *clk);
> +
> +#else /* CONFIG_IS_ENABLED(CLK) */
> +
> +static inline int clk_request(struct udevice *dev, struct clk *clk)
> +{
> +	return -ENOSYS;
> +}
> +
> +static inline int clk_free(struct clk *clk)
> +{
> +	return -ENOSYS;
> +}
> +
> +static inline ulong clk_get_rate(struct clk *clk)
> +{
> +	return -ENOSYS;
> +}
> +
> +static inline struct clk *clk_get_parent(struct clk *clk)
> +{
> +	return (struct clk *)-ENOSYS;

This should use ERR_PTR() to care for platforms defining
CONFIG_ERR_PTR_OFFSET.

> +}
> +
> +static inline long long clk_get_parent_rate(struct clk *clk)
> +{
> +	return -ENOSYS;
> +}
> +
> +static inline ulong clk_set_rate(struct clk *clk, ulong rate)
> +{
> +	return -ENOSYS;
> +}
> +
> +static inline int clk_set_parent(struct clk *clk, struct clk *parent)
> +{
> +	return -ENOSYS;
> +}
> +
> +static inline int clk_enable(struct clk *clk)
> +{
> +	return -ENOSYS;
> +}
> +
> +static inline int clk_enable_bulk(struct clk_bulk *bulk)
> +{
> +	return bulk && bulk->count == 0 ? 0 : -ENOSYS;

For this test to work, someone would need to set bulk->count to 0. This
is normally done by clk_get_bulk(), but you defined it to only return an
error.

I guess it works for you because all clk_bulk objects you use are from
the heap (which is currently zeroed out in U-Boot) or if they are on the
stack, you have if/else code that doesn't bring you here. Still it seems
wrong.

Regards,
Simon

> +}
> +
> +static inline int clk_disable(struct clk *clk)
> +{
> +	return -ENOSYS;
> +}
> +
> +static inline int clk_disable_bulk(struct clk_bulk *bulk)
> +{
> +	return bulk && bulk->count == 0 ? 0 : -ENOSYS;
> +}
> +
> +static inline bool clk_is_match(const struct clk *p, const struct clk *q)
> +{
> +	return false;
> +}
> +
> +static inline int clk_get_by_id(ulong id, struct clk **clkp)
> +{
> +	return -ENOSYS;
> +}
> +
> +static inline bool clk_dev_binded(struct clk *clk)
> +{
> +	return false;
> +}
> +#endif /* CONFIG_IS_ENABLED(CLK) */
> +
> +/**
> + * clk_valid() - check if clk is valid
> + *
> + * @clk:	the clock to check
> + * @return true if valid, or false
> + */
> +static inline bool clk_valid(struct clk *clk)
> +{
> +	return clk && !!clk->dev;
> +}
> +
> +int soc_clk_dump(void);
> +
>  #endif
>  
>  #define clk_prepare_enable(clk) clk_enable(clk)
> 

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
