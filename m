Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6968917BBA7
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 12:28:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2004EC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 11:28:38 +0000 (UTC)
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B04AC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2020 11:28:36 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id n6so1297323vsc.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Mar 2020 03:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7jhubb0iYw1eKE46a+S/mhLtR0PjqLjwxc0UwH4v/SY=;
 b=EGwYLGbH0z2zQelU1uTCAdJQt4r6904eAOCqYbIkhSnck+UwpbGmijlJyGXhBHpRWt
 JcLmJoD4H01A+Wx2HyRCLvUDjYgbhZ1MrbC0e96rvvhV8MkW+LJZLq+nb2fhzo63z3Fh
 B4cBjNb/ShupdMr6v87Y38/6TUHjY+DE3M6/ipgtsH+pkUjBjmobPS6I5W3T+1vIJX48
 ZOKfE3PRA/gpB0eimmpkq96fMW4uTSRy5SAZUfJIf1Itrizs/aAcTmjyvx85zTa7UvET
 hBdHlReku4lER311PhM/Zz6IAy9zFW+MfZQ3OGN8rIkj4hyLqM3uQjwGb3X15flTOIxN
 bYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7jhubb0iYw1eKE46a+S/mhLtR0PjqLjwxc0UwH4v/SY=;
 b=MtsesuXJ/UV0XtPIwqQGts1w+YHFbK/zn7SXROighY9mw+3hHMYe63Fqyw8ded/tqX
 wlG9o63oR7x7EyKTVAf/DflkvhsYvdTax5M9nEeXhtE15cZEUsYkuBlRp+kmeu5ya09j
 IEVJALOgvxvk/CwOBCjb2u62ZgwaVAJOaoFKYNp7TYgJpfq3cYyKd5JNlh17lTgOrQnx
 e982SqlecRUuNY9PMNz7m3PEfzRCtueaWxwV68Q0RIwAkaV/bwOrgLgCSHkFeqzlf4es
 Gi3BDbrbGRF1UPMQjpoP/FdOnNtAHh5Py7YMPQX32KdC5AdmacBh6nBjeRdcJpJKK5el
 lXjQ==
X-Gm-Message-State: ANhLgQ2fMLqpAffWl6Y393AIkFr6cjuoqdm4a/rFQOutCtq7R1sHqVIa
 E0f9baGZyG+Yulz+z9zl4p/o4CTGfnBvq2awyw8=
X-Google-Smtp-Source: ADFU+vu4FsmviGoydd2O/HvuC4hkXsDv/dLj4I3A6HiYM3/xg8oBtXy+5Fwrdrl/x2E/58jtFnc/f86331F3x6IEgUY=
X-Received: by 2002:a67:6483:: with SMTP id y125mr1735540vsb.212.1583494114814; 
 Fri, 06 Mar 2020 03:28:34 -0800 (PST)
MIME-Version: 1.0
References: <20200306100140.27582-1-patrick.delaunay@st.com>
 <20200306100140.27582-2-patrick.delaunay@st.com>
In-Reply-To: <20200306100140.27582-2-patrick.delaunay@st.com>
From: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Date: Fri, 6 Mar 2020 12:28:23 +0100
Message-ID: <CAAh8qsxjEBGyDicSsEJJ0fsn=X6JDz9=N4GYkm5EgrMcrK=rOQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Peng Fan <peng.fan@nxp.com>, Simon Glass <sjg@chromium.org>,
 Sekhar Nori <nsekhar@ti.com>, Lukasz Majewski <lukma@denx.de>,
 Ley Foon Tan <ley.foon.tan@intel.com>, b.galvani@gmail.com,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v5 1/5] dm: clk: add stub when CONFIG_CLK
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

On Fri, Mar 6, 2020 at 11:01 AM Patrick Delaunay
<patrick.delaunay@st.com> wrote:
>
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
> The bulk stub set and test bulk->count to avoid error for the sequence:
>
>   clk_get_bulk(dev, &priv->bulk);
>         ....
>   if (clk_enable(&priv>bulk))
>         return -EIO;
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v5:
> - use ERR_PTR in clk_get_parent()
> - force bulk->count = 0 in clk_get_bulk to avoid issue
>   for next call of clk_enable_bulk / clk_enable_bulk

I wonder if this is correct. I think it only produces additional code. If you
always set bulk->count to 0, the enable code will never fail.

However, the enable function should never be executed as enable returns an
error. I can imagine the *disable* function could be called, but the return
value of this function is currently only handled in clk_sandbox_test.c...

Wouldn't it work to just remove all checks for bulk->count and let *all*
redefined functions return a constant (success or failure)? That would help
to keep the code small.

Looking at linux, clock disable functions have *no* return value that needs
to be checked, clock enable functions return success when compiled without
clock support.

Regards,
Simon

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
>  include/clk.h | 104 +++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 91 insertions(+), 13 deletions(-)
>
> diff --git a/include/clk.h b/include/clk.h
> index 3336301815..ca8f1cfec7 100644
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
> @@ -249,6 +250,8 @@ static inline int clk_get_by_index(struct udevice *dev, int index,
>
>  static inline int clk_get_bulk(struct udevice *dev, struct clk_bulk *bulk)
>  {
> +       if (bulk)
> +               bulk->count = 0;
>         return -ENOSYS;
>  }
>
> @@ -312,6 +315,7 @@ static inline int clk_release_bulk(struct clk_bulk *bulk)
>         return clk_release_all(bulk->clks, bulk->count);
>  }
>
> +#if CONFIG_IS_ENABLED(CLK)
>  /**
>   * clk_request - Request a clock by provider-specific ID.
>   *
> @@ -433,19 +437,6 @@ int clk_disable_bulk(struct clk_bulk *bulk);
>   */
>  bool clk_is_match(const struct clk *p, const struct clk *q);
>
> -int soc_clk_dump(void);
> -
> -/**
> - * clk_valid() - check if clk is valid
> - *
> - * @clk:       the clock to check
> - * @return true if valid, or false
> - */
> -static inline bool clk_valid(struct clk *clk)
> -{
> -       return clk && !!clk->dev;
> -}
> -
>  /**
>   * clk_get_by_id() - Get the clock by its ID
>   *
> @@ -465,6 +456,93 @@ int clk_get_by_id(ulong id, struct clk **clkp);
>   * @return true on binded, or false on no
>   */
>  bool clk_dev_binded(struct clk *clk);
> +
> +#else /* CONFIG_IS_ENABLED(CLK) */
> +
> +static inline int clk_request(struct udevice *dev, struct clk *clk)
> +{
> +       return -ENOSYS;
> +}
> +
> +static inline int clk_free(struct clk *clk)
> +{
> +       return -ENOSYS;
> +}
> +
> +static inline ulong clk_get_rate(struct clk *clk)
> +{
> +       return -ENOSYS;
> +}
> +
> +static inline struct clk *clk_get_parent(struct clk *clk)
> +{
> +       return ERR_PTR(-ENOSYS);
> +}
> +
> +static inline long long clk_get_parent_rate(struct clk *clk)
> +{
> +       return -ENOSYS;
> +}
> +
> +static inline ulong clk_set_rate(struct clk *clk, ulong rate)
> +{
> +       return -ENOSYS;
> +}
> +
> +static inline int clk_set_parent(struct clk *clk, struct clk *parent)
> +{
> +       return -ENOSYS;
> +}
> +
> +static inline int clk_enable(struct clk *clk)
> +{
> +       return -ENOSYS;
> +}
> +
> +static inline int clk_enable_bulk(struct clk_bulk *bulk)
> +{
> +       return bulk && bulk->count == 0 ? 0 : -ENOSYS;
> +}
> +
> +static inline int clk_disable(struct clk *clk)
> +{
> +       return -ENOSYS;
> +}
> +
> +static inline int clk_disable_bulk(struct clk_bulk *bulk)
> +{
> +       return bulk && bulk->count == 0 ? 0 : -ENOSYS;
> +}
> +
> +static inline bool clk_is_match(const struct clk *p, const struct clk *q)
> +{
> +       return false;
> +}
> +
> +static inline int clk_get_by_id(ulong id, struct clk **clkp)
> +{
> +       return -ENOSYS;
> +}
> +
> +static inline bool clk_dev_binded(struct clk *clk)
> +{
> +       return false;
> +}
> +#endif /* CONFIG_IS_ENABLED(CLK) */
> +
> +/**
> + * clk_valid() - check if clk is valid
> + *
> + * @clk:       the clock to check
> + * @return true if valid, or false
> + */
> +static inline bool clk_valid(struct clk *clk)
> +{
> +       return clk && !!clk->dev;
> +}
> +
> +int soc_clk_dump(void);
> +
>  #endif
>
>  #define clk_prepare_enable(clk) clk_enable(clk)
> --
> 2.17.1
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
