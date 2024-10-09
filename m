Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 342FB99640D
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Oct 2024 10:54:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAAA2C7128F;
	Wed,  9 Oct 2024 08:54:31 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97BB8CFAC50
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2024 08:54:24 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5c87c7d6ad4so8789577a12.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Oct 2024 01:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728464064; x=1729068864;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hm+CFwdp92p6FnevyaHiUXikumghapUIPjJQWimmzEk=;
 b=ZgTY3L6IOeUYUKzkdvCyIzlKBKV7M76n3Zb+6L3EWRbv6B5wuslrx05LrxPPnMyJwJ
 mEjz0rirJF5+hsBJWt5n7ZshxXZ7dzHea6X4b686UYvYY+0z4yW6SyfaUzQHM5xLhAEH
 MTdm6VVpKBhfCNJmj4JeBWGQ9JLI7199SUaZ8srFz8LLgkFhK4ahxTj9mksMvr6smrfW
 fo6W1dLlb4czed3AW8o3YY/dnCJDBHRLBF6wl3Qdl6/QyU9eotNLog5trx1CwPyJXcuL
 PPRIyVfw2qJOyoEgqtAMTjSBLPKmxi6yLnISSqlH+vjm5FR7UmQOxXHb+qzwZuz2uZi8
 FRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728464064; x=1729068864;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hm+CFwdp92p6FnevyaHiUXikumghapUIPjJQWimmzEk=;
 b=dMpca+wcjxPDDSbQxce7Is+IB+hNEEq8USCAhAUMsfjGWm+rt/si6pfNYGhIQvVfO4
 XcKb7DIwpS+GW7Py4+sC4X6HtJhXVmyYO38GNiui/Mfk94GFF5vjPbTBOmUXeEOJ6m7u
 3Z9W0Uy3k23ga30ligudG5tWy4a23XKrHU08rbklsOlUUHQtsJZ/0hCgrkyJEJaoYjrC
 1ME4LLBAjDiwovzUox2i/dwb13bM/t+EPFJUIiOacJrTaEVBQdVhoqG8uANyl51jNhzi
 q+dhnY1YYTQ8HdMf4t/UxjYnIkaL5SSXlQBCD7tQkvazaSIGCsEhLhLedum94/4+Bjwp
 Z3Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXbyGDSgasvUHYHh9lLM2IIoAzuRls+3ZOTkYLRhFH0iPl1gTQB4KMo687HMixABINo7i1uaal8T+KPQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwLONds9gzWvvjpiI62kq+NduR5GzP0mKUj9WRcTj5ASnLrVD8I
 FBm7hMrCa8E2l9+Us1m565u3zPJYrCdEW1z8b3K3HiHySjPNtOst40kI2dNO9IcBQRfuNEZmfOa
 tEBslg1nsTLM+vqgtYQLZruzwYe4=
X-Google-Smtp-Source: AGHT+IHjzDSXYAeARzcOt45pZeG1Yu+a2nsX7twmPwjILJtikZBWSb5IqXqU3r6KKsrE9uEqLxHTd7eWwlMScpo/s+4=
X-Received: by 2002:a05:6402:31b4:b0:5c9:5fa:1f74 with SMTP id
 4fb4d7f45d1cf-5c91d641ebdmr1217832a12.22.1728464063570; Wed, 09 Oct 2024
 01:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20241004230756.371153-1-marex@denx.de>
In-Reply-To: <20241004230756.371153-1-marex@denx.de>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Wed, 9 Oct 2024 09:54:12 +0100
Message-ID: <CALeDE9ML6cRrNP9oCrQa2Yp_kax0KF+fH2tgNtYo_aRucGo+aA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Sumit Garg <sumit.garg@linaro.org>, u-boot@dh-electronics.com,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 AKASHI Takahiro <akashi.tkhro@gmail.com>, Sean Anderson <seanga2@gmail.com>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Tom Rini <trini@konsulko.com>, Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 1/2] Makefile: Drop SPL_FIT_SOURCE support
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

On Sat, 5 Oct 2024 at 00:08, Marek Vasut <marex@denx.de> wrote:
>
> The SPL_FIT_SOURCE is long superseded by SPL_FIT_GENERATOR which
> is long superseded by binman, drop SPL_FIT_SOURCE support as there
> are no more users.
>
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Peter Robinson <pbrobinson@gmail.com>

> ---
> Cc: AKASHI Takahiro <akashi.tkhro@gmail.com>
> Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Peter Robinson <pbrobinson@gmail.com>
> Cc: Quentin Schulz <quentin.schulz@cherry.de>
> Cc: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> Cc: Sean Anderson <seanga2@gmail.com>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Sumit Garg <sumit.garg@linaro.org>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
> NOTE: Depends on https://lore.kernel.org/u-boot/20241004225916.361000-1-marex@denx.de/
> ---
>  Makefile                |  6 ------
>  boot/Kconfig            |  8 --------
>  doc/usage/fit/howto.rst | 11 +++--------
>  3 files changed, 3 insertions(+), 22 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index af24de4165e..a70926ec2fa 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1417,18 +1417,12 @@ u-boot.ldr.hex u-boot.ldr.srec: u-boot.ldr FORCE
>  # or a generator script
>  # NOTE: Please do not use this. We are migrating away from Makefile rules to use
>  # binman instead.
> -ifneq ($(CONFIG_SPL_FIT_SOURCE),"")
> -U_BOOT_ITS := u-boot.its
> -$(U_BOOT_ITS): $(subst ",,$(CONFIG_SPL_FIT_SOURCE))
> -       $(call if_changed,copy)
> -else
>  ifneq ($(CONFIG_USE_SPL_FIT_GENERATOR),)
>  U_BOOT_ITS := u-boot.its
>  $(U_BOOT_ITS): $(U_BOOT_ITS_DEPS) FORCE
>         $(srctree)/$(CONFIG_SPL_FIT_GENERATOR) \
>         $(patsubst %,$(dt_dir)/%.dtb,$(subst ",,$(CONFIG_OF_LIST))) > $@
>  endif
> -endif
>
>  ifdef CONFIG_SPL_LOAD_FIT
>  MKIMAGEFLAGS_u-boot.img = -f auto -A $(ARCH) -T firmware -C none -O u-boot \
> diff --git a/boot/Kconfig b/boot/Kconfig
> index 925afe06a19..51e6cd6cb1d 100644
> --- a/boot/Kconfig
> +++ b/boot/Kconfig
> @@ -282,14 +282,6 @@ config SPL_FIT_IMAGE_POST_PROCESS
>           injected into the FIT creation (i.e. the blobs would have been pre-
>           processed before being added to the FIT image).
>
> -config SPL_FIT_SOURCE
> -       string ".its source file for U-Boot FIT image"
> -       depends on SPL_FIT
> -       help
> -         Specifies a (platform specific) FIT source file to generate the
> -         U-Boot FIT image. This could specify further image to load and/or
> -         execute.
> -
>  config USE_SPL_FIT_GENERATOR
>         bool "Use a script to generate the .its script"
>         depends on SPL_FIT
> diff --git a/doc/usage/fit/howto.rst b/doc/usage/fit/howto.rst
> index b5097d4460b..280eff724f6 100644
> --- a/doc/usage/fit/howto.rst
> +++ b/doc/usage/fit/howto.rst
> @@ -57,14 +57,9 @@ own subnode under the /images node, which should then be referenced from one or
>  multiple /configurations subnodes. The required images must be enumerated in
>  the "loadables" property as a list of strings.
>
> -If a platform specific image source file (.its) is shipped with the U-Boot
> -source, it can be specified using the CONFIG_SPL_FIT_SOURCE Kconfig symbol.
> -In this case it will be automatically used by U-Boot's Makefile to generate
> -the image.
> -If a static source file is not flexible enough, CONFIG_SPL_FIT_GENERATOR
> -can point to a script which generates this image source file during
> -the build process. It gets passed a list of device tree files (taken from the
> -CONFIG_OF_LIST symbol).
> +CONFIG_SPL_FIT_GENERATOR can point to a script which generates this image source
> +file during the build process. It gets passed a list of device tree files (taken
> +from the CONFIG_OF_LIST symbol).
>
>  The SPL also records to a DT all additional images (called loadables) which are
>  loaded. The information about loadables locations is passed via the DT node with
> --
> 2.45.2
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
