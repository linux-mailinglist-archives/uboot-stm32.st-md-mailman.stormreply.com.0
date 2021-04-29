Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C1B36EDED
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Apr 2021 18:11:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCED4C58D5A;
	Thu, 29 Apr 2021 16:11:43 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2580CC58D59
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 16:11:42 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 92-20020a9d02e50000b029028fcc3d2c9eso39339128otl.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 09:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y6fuVt9WL6/NZVvPoHhUuVuWKJndNWCdFgbJkE+fwho=;
 b=gj/l8Y6zNU52sQ/1IiwrtOLZCyuf929eMkIqBcePHasRoPvATxLwlAiGuMZt2nqQx/
 A64ypK2+6mH8xEH33ZQCjAe+E995Ml5QLJNqPIUm8E6rgDZ5t9fObWJE1h1GiPfUcHey
 wSv1SS1nIRZeqO0GzVkAwU4tFcKpsazf2u8XU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y6fuVt9WL6/NZVvPoHhUuVuWKJndNWCdFgbJkE+fwho=;
 b=VH14vYanT7JUJ0mcz+gvI0D2XI/70KSk7L92a957W0pASCxhXOI+38uQKaMCwYa0Z2
 KBYf8NJTBGR62mhd+OHlsKGuLuRyd6fRew8Lkgc7M+0pgQ23asBjNNCcgTFwEEQvF0FJ
 tqeHH0FbYz3KkxqUjZ/mxvjWAG1jXUjDhUuFw4bmxb+qiPob57/JwtzuX8z2sncoKA6q
 u61206ruIBl323W+FZqnT9lPTKCAmdDtLvveue1scPkEqexyVMxfo9zBagUIKg77FXIN
 1R1r6ONxEOGXwoZkSbALmKLe2LAFaFdBA/TNjlt+SdryVHfrgXJlD3/GH8mT2aAFQbFJ
 +taA==
X-Gm-Message-State: AOAM532xM3cSsNpSD3OnFspjzXdtZR3DGU16NY9wDQhGKi5SFDdyn6/c
 ofNX3YUju+8WL0ny9dGhjCR6nqRQ0zVNva6xKcTV5w==
X-Google-Smtp-Source: ABdhPJwvhfBQc5dUijZIUY4z6Dwz+tbI57zwsP2WwB6PX9vLRLz7zTPWH28z/GBA4yWtIC0XJ+8XvhgeBg4uokd9vec=
X-Received: by 2002:a9d:7401:: with SMTP id n1mr160700otk.28.1619712700674;
 Thu, 29 Apr 2021 09:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210428102345.3192-1-patrick.delaunay@foss.st.com>
 <20210428122109.v3.2.I22712a112842c336b2934d240f18dc64f12919db@changeid>
In-Reply-To: <20210428122109.v3.2.I22712a112842c336b2934d240f18dc64f12919db@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 29 Apr 2021 09:10:43 -0700
Message-ID: <CAPnjgZ2OecZEktCN6i8TKpVmGFQFCZLFcQ37s7-+9FVg6Vi+9Q@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Bin Meng <bmeng.cn@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Tero Kristo <t-kristo@ti.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Marek Bykowski <marek.bykowski@gmail.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v3 2/7] lmb: add lmb_is_reserved_flags
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

Hi Patrick,

On Wed, 28 Apr 2021 at 03:23, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Add a new function lmb_is_reserved_flags to check is a
> address is reserved with a specific flags.
>
> This function can be used to check if an address was
> reserved with no-map flags with:
>
> lmb_is_reserved_flags(lmb, addr, LMB_NOMAP);
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> (no changes since v1)
>
>  include/lmb.h |  1 +
>  lib/lmb.c     | 10 ++++++++--
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/include/lmb.h b/include/lmb.h
> index aa196c63bf..6537d56e18 100644
> --- a/include/lmb.h
> +++ b/include/lmb.h
> @@ -91,6 +91,7 @@ extern phys_addr_t lmb_alloc_addr(struct lmb *lmb, phys_addr_t base,
>                                   phys_size_t size);
>  extern phys_size_t lmb_get_free_size(struct lmb *lmb, phys_addr_t addr);
>  extern int lmb_is_reserved(struct lmb *lmb, phys_addr_t addr);
> +extern int lmb_is_reserved_flags(struct lmb *lmb, phys_addr_t addr, int flags);

drop extern and please add a function comment

>  extern long lmb_free(struct lmb *lmb, phys_addr_t base, phys_size_t size);
>
>  extern void lmb_dump_all(struct lmb *lmb);
> diff --git a/lib/lmb.c b/lib/lmb.c
> index 69700bf9ba..e270e86186 100644
> --- a/lib/lmb.c
> +++ b/lib/lmb.c
> @@ -443,7 +443,7 @@ phys_size_t lmb_get_free_size(struct lmb *lmb, phys_addr_t addr)
>         return 0;
>  }
>
> -int lmb_is_reserved(struct lmb *lmb, phys_addr_t addr)
> +int lmb_is_reserved_flags(struct lmb *lmb, phys_addr_t addr, int flags)
>  {
>         int i;
>
> @@ -451,11 +451,17 @@ int lmb_is_reserved(struct lmb *lmb, phys_addr_t addr)
>                 phys_addr_t upper = lmb->reserved.region[i].base +
>                         lmb->reserved.region[i].size - 1;
>                 if ((addr >= lmb->reserved.region[i].base) && (addr <= upper))
> -                       return 1;
> +                       return !!((lmb->reserved.region[i].flags & flags)
> +                                  == flags);

I don't know what flags is since there is no comment, but it seems
that you should drop the !!()

>         }
>         return 0;
>  }
>
> +int lmb_is_reserved(struct lmb *lmb, phys_addr_t addr)
> +{
> +       return lmb_is_reserved_flags(lmb, addr, LMB_NONE);
> +}
> +
>  __weak void board_lmb_reserve(struct lmb *lmb)
>  {
>         /* please define platform specific board_lmb_reserve() */
> --
> 2.17.1
>

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
