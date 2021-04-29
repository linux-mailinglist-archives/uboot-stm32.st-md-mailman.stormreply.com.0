Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9651536EDEC
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Apr 2021 18:11:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C891C58D5A;
	Thu, 29 Apr 2021 16:11:40 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF409C58D59
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 16:11:38 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 e9-20020a4ada090000b02901f91091e5acso2718071oou.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 09:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dHj8BE1plNo7/flKAIqzUNVQ+IoVZ8m/cMU+143hs4M=;
 b=JfLbf+e8ggo+ijJh9upl0M5zYKFR+QEvZ3O9tu4vEhsyNmRr3tlL22IfsxrXUpjJZy
 MD8IGAVu5OgRvB+PYq8+RkVmva4urpHVqfxoPTbpVw923RhWOOdiz5GlCx+SFZ3vTa+K
 yscUX8/SFK64wEGh15+Sr7IeZRlIUfEdXOgYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dHj8BE1plNo7/flKAIqzUNVQ+IoVZ8m/cMU+143hs4M=;
 b=KLxIzeFyECL4FwQt2ZOEjNxGJh4Ul50hqDWMGIyxfNegIGlWPEVzHuSJNGF4N4hoPl
 vXgvWs5ZUg99D5r+6zisN5/M8hW+tOmLDW4sDvUE+AmOz7F8eLUPKVYpRdJ1YEax4i5Z
 DFKQVc/D6WLH73kSxdMppXZX21CPZmCQxqRhjkLPwrvocfV3KH4/puVb4+MfGOcmRFqm
 F0W00rOqj46qjDAxpXlWJa4o4JZC/pBDAX6atDqRQOaONuWXmsKfT4uEXgSPARyGGbrm
 e0EZWsPNTJ+KGLwr5F5TCfugm9+7jH/4BhSa84dJFa+bh1w7/SRnqYqxCRkvdFd9AEio
 XNew==
X-Gm-Message-State: AOAM530bMgDlAJe0mH6WKAB+YaDaYveqFQ8i2GoiJuSKX9PTugzpcq9T
 AAhgAt767zXcmIc/dC/+ZCrHwipUZyBWHozgVwCPyQ==
X-Google-Smtp-Source: ABdhPJxbiy/V6wgsuMpzEBjByp4kvf/CH+lOC/UxNQ9ORy+BdxV64/0LMhl4hxZRc5zUW8zjSOn9Mf3Y0bObd2VAzmg=
X-Received: by 2002:a05:6820:455:: with SMTP id
 p21mr616256oou.56.1619712697376; 
 Thu, 29 Apr 2021 09:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210428102345.3192-1-patrick.delaunay@foss.st.com>
 <20210428122109.v3.1.Iac36d9d9036edd54d2574d712ca21283bf7c73d0@changeid>
In-Reply-To: <20210428122109.v3.1.Iac36d9d9036edd54d2574d712ca21283bf7c73d0@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 29 Apr 2021 09:10:40 -0700
Message-ID: <CAPnjgZ2wiokTgJau4MD5A3vJ-ZrPV=r0saiR1-dyi7Z8Oc86SA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Bin Meng <bmeng.cn@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Tero Kristo <t-kristo@ti.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Marek Bykowski <marek.bykowski@gmail.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v3 1/7] lmb: Add support of flags for
	no-map properties
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
> Add "flags" in lmb_property to save the "no-map" property of
> reserved region and a new function lmb_reserve_flags() to check
> this flag.
>
> The default allocation use flags = LMB_NONE.
>
> The adjacent reserved memory region are merged only when they have
> the same flags value.
>
> This patch is partially based on flags support done in Linux kernel
> mm/memblock .c (previously lmb.c); it is why LMB_NOMAP = 0x4, it is
> aligned with MEMBLOCK_NOMAP value.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - remove unnecessary comments in lmb.h
> - rebase on latest lmb patches
>
>  include/lmb.h | 20 ++++++++++++++++++++
>  lib/lmb.c     | 52 ++++++++++++++++++++++++++++++++++++++++++---------
>  2 files changed, 63 insertions(+), 9 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

>
> diff --git a/include/lmb.h b/include/lmb.h
> index 541e17093c..aa196c63bf 100644
> --- a/include/lmb.h
> +++ b/include/lmb.h
> @@ -12,6 +12,16 @@
>   * Copyright (C) 2001 Peter Bergner, IBM Corp.
>   */
>
> +/**
> + * enum lmb_flags - definition of memory region attributes
> + * @LMB_NONE: no special request
> + * @LMB_NOMAP: don't add to mmu configuration
> + */
> +enum lmb_flags {
> +       LMB_NONE                = 0x0,
> +       LMB_NOMAP               = 0x4,
> +};
> +
>  /**
>   * struct lmb_property - Description of one region.
>   *
> @@ -21,6 +31,7 @@
>  struct lmb_property {
>         phys_addr_t base;
>         phys_size_t size;
> +       enum lmb_flags flags;
>  };
>
>  /**
> @@ -69,6 +80,8 @@ extern void lmb_init_and_reserve_range(struct lmb *lmb, phys_addr_t base,
>                                        phys_size_t size, void *fdt_blob);
>  extern long lmb_add(struct lmb *lmb, phys_addr_t base, phys_size_t size);
>  extern long lmb_reserve(struct lmb *lmb, phys_addr_t base, phys_size_t size);
> +extern long lmb_reserve_flags(struct lmb *lmb, phys_addr_t base,
> +                             phys_size_t size, enum lmb_flags flags);

Needs a comment

[..]

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
