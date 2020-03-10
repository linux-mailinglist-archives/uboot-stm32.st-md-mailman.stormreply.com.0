Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5595C180914
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Mar 2020 21:23:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19F03C36B0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Mar 2020 20:23:55 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DD5BC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2020 20:23:53 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id a25so13765620wrd.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2020 13:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1NCb7M9i98aDFgUG7Vy+4z4jrlDLwhhYzmJLSmD3IuA=;
 b=jGGOt22LgjitDOpj+yAahajnZBr30IWoBYTbAMqor6FO+q4KMBBXeKVueGq1BSrrVl
 27mH18yXRRCOenVJcvrnUE20T8t5Z2GLJxs/VHUNcdIawWo5+KXfMZYcgdkf6+Z7rmJg
 Tgc9JhJN1grHkMRswLQGJURyujoZjteTNid9EXvLSXBfTTa/ApRmVCi2yHzERzzH7Hav
 pVN+mONTRbXao0OsTGxLFjH+xhY9cy0JTeaX6lyFOnsU0pQNTB4rMBReCrfOQy4tuLGP
 Db9GKm3ScPQu44xwGxEJGe0sds/jXcW2KXpMIO3IkSXtdup9AgHQItRfK2VS9UznB5O0
 fjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1NCb7M9i98aDFgUG7Vy+4z4jrlDLwhhYzmJLSmD3IuA=;
 b=bQTQxa/VWMC5sCOBzFCVKryYifTSGXegdkOdSDLFrLpFnKdt2UujbTn040VjFealgA
 9nD6dZlQKrKoh1MZwBS7lvXUOskE+0a9tHGFzOJd/mm/f4Fkv1YTNoMA2a7FEX6t6FDy
 2UeHQZRSQ+Xs1q3dh6eBWUYpyGzX+cJEuQ6h75i9cWxM3b0hClawc6etbSYcYsZljpqp
 II3cUJhzb4Czq6EwRXERXaJ2cCa4mGYWGOIq8BpgmEqapem8n/Gp8MZn/upjtGxObX4f
 M2qhCMdb9El1JNKtQTb/cbYDC6yhyYwoy1OJN4QVzhqQSkQaAFPQqQKgaOa4BOuFvwbl
 V1CQ==
X-Gm-Message-State: ANhLgQ0le4Gj2OYYnTUcxecYZHZijLxQFy9Lc9DOsHe73EHaPQI9IXag
 JRsFB8YFdMZIaON5rWDR5uuPaZPg
X-Google-Smtp-Source: ADFU+vu7IxjLA2xJNG853fwXvpxx+Ds6pSsdyJ2gwOE7PnVoOsFeu7i2HW5tF86hWAsK22T76AU2pA==
X-Received: by 2002:adf:82ac:: with SMTP id 41mr21510565wrc.180.1583871832184; 
 Tue, 10 Mar 2020 13:23:52 -0700 (PDT)
Received: from ?IPv6:2a02:8071:6cd:f600:3dff:b879:b41b:fa13?
 ([2a02:8071:6cd:f600:3dff:b879:b41b:fa13])
 by smtp.gmail.com with ESMTPSA id d1sm4805831wrw.52.2020.03.10.13.23.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2020 13:23:51 -0700 (PDT)
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20200310100912.28129-1-patrick.delaunay@st.com>
 <20200310100912.28129-2-patrick.delaunay@st.com>
From: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Message-ID: <294afb20-69c5-50aa-0978-3e60dd2a623c@gmail.com>
Date: Tue, 10 Mar 2020 21:22:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310100912.28129-2-patrick.delaunay@st.com>
Content-Language: en-US
Cc: Peng Fan <peng.fan@nxp.com>, Simon Glass <sjg@chromium.org>,
 Lukasz Majewski <lukma@denx.de>, ley.foon.tan@intel.com, b.galvani@gmail.com,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v6 1/5] dm: clk: add stub when CONFIG_CLK
	is deactivated
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

Am 10.03.2020 um 11:09 schrieb Patrick Delaunay:
> Add stub for functions clk_...() when CONFIG_CLK is deactivated.
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

Reviewed-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>

> ---
> 
> Changes in v6:
> - return success in stub for clk_free/clk_enable/clk_disable/
>   clk_enable_bulk/clk_disable_bulk
> 
> Changes in v5:
> - use ERR_PTR in clk_get_parent()
> - force bulk->count = 0 in clk_get_bulk to avoid issue
>   for next call of clk_enable_bulk / clk_enable_bulk
> - update commit message
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
>  include/clk.h | 102 +++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 89 insertions(+), 13 deletions(-)
> 
> diff --git a/include/clk.h b/include/clk.h
> index 3336301815..60c4b7d075 100644
> --- a/include/clk.h
> +++ b/include/clk.h
> @@ -9,6 +9,7 @@
>  #define _CLK_H_
>  
>  #include <dm/ofnode.h>
> +#include <linux/err.h>
>  #include <linux/errno.h>
>  #include <linux/types.h>
>  
> @@ -312,6 +313,7 @@ static inline int clk_release_bulk(struct clk_bulk *bulk)
>  	return clk_release_all(bulk->clks, bulk->count);
>  }
>  
> +#if CONFIG_IS_ENABLED(CLK)
>  /**
>   * clk_request - Request a clock by provider-specific ID.
>   *
> @@ -433,19 +435,6 @@ int clk_disable_bulk(struct clk_bulk *bulk);
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
> @@ -465,6 +454,93 @@ int clk_get_by_id(ulong id, struct clk **clkp);
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
> +	return 0;
> +}
> +
> +static inline ulong clk_get_rate(struct clk *clk)
> +{
> +	return -ENOSYS;
> +}
> +
> +static inline struct clk *clk_get_parent(struct clk *clk)
> +{
> +	return ERR_PTR(-ENOSYS);
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
> +	return 0;
> +}
> +
> +static inline int clk_enable_bulk(struct clk_bulk *bulk)
> +{
> +	return 0;
> +}
> +
> +static inline int clk_disable(struct clk *clk)
> +{
> +	return 0;
> +}
> +
> +static inline int clk_disable_bulk(struct clk_bulk *bulk)
> +{
> +	return 0;
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
