Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B1299642A
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Oct 2024 10:56:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07940C7128F;
	Wed,  9 Oct 2024 08:56:20 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F17F3CFAC50
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2024 08:56:11 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2fac63abf63so64444001fa.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Oct 2024 01:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728464171; x=1729068971;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AW3bJ3haELYF/L+9diubZ362nk+ggWnqFG8JPKUARMs=;
 b=hUzwvqAvUCaU/zSgAsJ363kczC/UMuAOUuGKBrpkyVaFRdjk35vjgAiuh87xCwRicv
 XlZDkXIRR/kxsh/L8NFlAzHVLpQ+/yE3JOUThIwZIURJfcjDaRQuX8SJvxO5+Y25Zd4S
 TPVavz2uDBwSIDTvkrnmeXQK5V4fL49FAnYU5Fi+Yu5a9Zbgz01WHR64Gq9pqwgx2tRY
 GPqrQroURluMAW1hVuWhWaO+L9GR5m81rYeASJ1iK9Xnc1Zd4AzKaR9rzXVtOSBW5QuB
 AhwR2NdLBZxO82Jgut911gHAm8CrekPIiPorvQaD7qL4YOQt/aucMYOIIr6LZARLZVEK
 M3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728464171; x=1729068971;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AW3bJ3haELYF/L+9diubZ362nk+ggWnqFG8JPKUARMs=;
 b=DYM9qDVkvhwmPCSPA0dtKDI78RnuecaKi5mWHUxo2PeLAuD5smxviTmRu/ymnaAZ0o
 oC8BoKmPUZ9JrtbfjBNE/7LO4N/vhRoJcpLBmR0dypk+297tHIDWFrf5F6rGOtcTg99v
 r2cXjv+9IJ0dgwKQg2h04l7KDFW7fwy86ggJdG+bp0W52ImiELXn/1BEpyOVDPh0mrNA
 Iyh8WBnHMt6NYP04WX2sPZAzyvp1+rfr/PZQkC5TIPl2p95gkcJizK0XmW+pNsqYFfL3
 yBAQEWYCpuCppLBK5hSD5eRPPdxXlkOdIJylEAyNXHJgxG0qUebyziGXOkLyE/sruym5
 SE9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxKBey76wOlYY38Fa1aHGI3bh1MXoLdr49QF6Nww0dr8QF6oSV+SobKqLHU8URFPfQP9jJLp+8GAyfmQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxKnHGYHL9QmsNK2DsEdiQjzRFfYlfrJ75o9N0zcW+qtqVLygkl
 VDancuZfxCFTHQcn+TtEYqkl/Xhuol4qU2tl/6KgE5oOlg8U/4wWdYi0GuCtUOrKFAZ/kVwthqk
 K99PVc1tphrgHYDF6G/gUqUywxxQ=
X-Google-Smtp-Source: AGHT+IHrzpMlu1FxbK+73Vl3MjxtqC6ECO1MnqCdeVlin2fBGV/f2RFDK1xwtqT514juzWuieH0W4kMSqapVOIj8Zr0=
X-Received: by 2002:a05:651c:b20:b0:2fa:d296:6fbf with SMTP id
 38308e7fff4ca-2fb187120b8mr11121261fa.1.1728464170842; Wed, 09 Oct 2024
 01:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20241004230756.371153-1-marex@denx.de>
 <20241004230756.371153-2-marex@denx.de>
In-Reply-To: <20241004230756.371153-2-marex@denx.de>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Wed, 9 Oct 2024 09:55:59 +0100
Message-ID: <CALeDE9N-qXAWKT4hyOMsRetW6XnWSfwFiM2Nr79u3iwymtp5mQ@mail.gmail.com>
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
Subject: Re: [Uboot-stm32] [PATCH 2/2] Makefile: Drop SPL_FIT_GENERATOR
	support
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
> The SPL_FIT_GENERATOR is long superseded by binman, drop SPL_FIT_GENERATOR
> support as there are no more users.
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
>  Makefile                | 18 ------------------
>  boot/Kconfig            | 15 ---------------
>  doc/usage/fit/howto.rst |  4 ----
>  3 files changed, 37 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index a70926ec2fa..45592eb2bac 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1139,13 +1139,6 @@ ifeq ($(CONFIG_OF_EMBED)$(CONFIG_EFI_APP),y)
>         @echo >&2 "CONFIG_OF_SEPARATE for boards in mainline."
>         @echo >&2 "See doc/develop/devicetree/control.rst for more info."
>         @echo >&2 "===================================================="
> -endif
> -ifneq ($(CONFIG_SPL_FIT_GENERATOR),)
> -       @echo >&2 "===================== WARNING ======================"
> -       @echo >&2 "This board uses CONFIG_SPL_FIT_GENERATOR. Please migrate"
> -       @echo >&2 "to binman instead, to avoid the proliferation of"
> -       @echo >&2 "arch-specific scripts with no tests."
> -       @echo >&2 "===================================================="
>  endif
>         $(call deprecated,CONFIG_WDT,DM watchdog,v2019.10,\
>                 $(CONFIG_WATCHDOG)$(CONFIG_HW_WATCHDOG))
> @@ -1413,17 +1406,6 @@ OBJCOPYFLAGS_u-boot.ldr.srec := -I binary -O srec
>  u-boot.ldr.hex u-boot.ldr.srec: u-boot.ldr FORCE
>         $(call if_changed,objcopy)
>
> -# Boards with more complex image requirements can provide an .its source file
> -# or a generator script
> -# NOTE: Please do not use this. We are migrating away from Makefile rules to use
> -# binman instead.
> -ifneq ($(CONFIG_USE_SPL_FIT_GENERATOR),)
> -U_BOOT_ITS := u-boot.its
> -$(U_BOOT_ITS): $(U_BOOT_ITS_DEPS) FORCE
> -       $(srctree)/$(CONFIG_SPL_FIT_GENERATOR) \
> -       $(patsubst %,$(dt_dir)/%.dtb,$(subst ",,$(CONFIG_OF_LIST))) > $@
> -endif
> -
>  ifdef CONFIG_SPL_LOAD_FIT
>  MKIMAGEFLAGS_u-boot.img = -f auto -A $(ARCH) -T firmware -C none -O u-boot \
>         -a $(CONFIG_TEXT_BASE) -e $(CONFIG_SYS_UBOOT_START) \
> diff --git a/boot/Kconfig b/boot/Kconfig
> index 51e6cd6cb1d..4314227d5f8 100644
> --- a/boot/Kconfig
> +++ b/boot/Kconfig
> @@ -282,21 +282,6 @@ config SPL_FIT_IMAGE_POST_PROCESS
>           injected into the FIT creation (i.e. the blobs would have been pre-
>           processed before being added to the FIT image).
>
> -config USE_SPL_FIT_GENERATOR
> -       bool "Use a script to generate the .its script"
> -       depends on SPL_FIT
> -       default y if SPL_FIT && ARCH_ZYNQMP
> -
> -config SPL_FIT_GENERATOR
> -       string ".its file generator script for U-Boot FIT image"
> -       depends on USE_SPL_FIT_GENERATOR
> -       default "arch/arm/mach-zynqmp/mkimage_fit_atf.sh" if SPL_LOAD_FIT && ARCH_ZYNQMP
> -       help
> -         Specifies a (platform specific) script file to generate the FIT
> -         source file used to build the U-Boot FIT image file. This gets
> -         passed a list of supported device tree file stub names to
> -         include in the generated image.
> -
>  if VPL
>
>  config VPL_FIT
> diff --git a/doc/usage/fit/howto.rst b/doc/usage/fit/howto.rst
> index 280eff724f6..675c9aa5bb0 100644
> --- a/doc/usage/fit/howto.rst
> +++ b/doc/usage/fit/howto.rst
> @@ -57,10 +57,6 @@ own subnode under the /images node, which should then be referenced from one or
>  multiple /configurations subnodes. The required images must be enumerated in
>  the "loadables" property as a list of strings.
>
> -CONFIG_SPL_FIT_GENERATOR can point to a script which generates this image source
> -file during the build process. It gets passed a list of device tree files (taken
> -from the CONFIG_OF_LIST symbol).
> -
>  The SPL also records to a DT all additional images (called loadables) which are
>  loaded. The information about loadables locations is passed via the DT node with
>  fit-images name.
> --
> 2.45.2
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
