Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D88BFCDB
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Sep 2019 03:49:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CA30C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Sep 2019 01:49:05 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51567C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Sep 2019 01:49:01 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id m16so3873101oic.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2019 18:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sTL1782R4jzERgR3M5JaT6Yj4j0Y/EwYx4VCbuqPj2Q=;
 b=l4gUdZutgHc/7nRVwuwUI/TAWn6JYRNNCCPCSp58jmAzXhw4NSjZtrNQAEhGq+5CDf
 GYv0TCIV3LuQKcBj+SUleUKG08cOkAEieHWOIWEEVO5b6d2d00oCTTNGZILkr6Tfnd11
 WObL2PDXPsCag15MVhR8UxK/5/jwjJx6Zbbus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sTL1782R4jzERgR3M5JaT6Yj4j0Y/EwYx4VCbuqPj2Q=;
 b=P3qnQcKP1OAFfDwUidkNkIIc8EFPc1hmLAOv6vIDoozdBoaYsqVTbvl7j9chrYsMW4
 K3X4SEvMXoubEwyFtOVR+WNB0GzGCIj1K4/E1dPVztjG5Xm9wrAIT0pWA/1cZEfU2+n3
 /XH6wa+tBAsDn8Sd6QriCs4enUW3QztyDqftGA0Rh+m8VIUWT7c3nS36+VgwFB0emgVg
 jGjr8Qn38bNkUChe4C/R2fLZqc6VaeHf04tAa6x5yFf1bUgvc70uTkANvfFZGHBDe5Kz
 cdEY+B5e8si1NMkiQZlclOgcLxqbC9vcmVB2fVdmeyYHbT5C6E6+7W6N+qw97ypX5uSt
 lPIw==
X-Gm-Message-State: APjAAAU1w1H9E7U6QB1+dVNvJDOl+RqK8T+elTSIRc8/qIwYrZS0Qttg
 UIfpV8XosHLcv6QHMCcubcZmI8fnmLq2+evc8cDezA==
X-Google-Smtp-Source: APXvYqyywBYZh1Qmn79qoHw+R5d85XI5E43NEWXh2e4zdAv1iqNI+c+An8ucALxymMdTkJ0M2SkvQac+sbtFbdd5abc=
X-Received: by 2002:a05:6808:a9c:: with SMTP id
 q28mr4875146oij.130.1569548939484; 
 Thu, 26 Sep 2019 18:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190918092920.21435-1-patrick.delaunay@st.com>
 <20190918092920.21435-3-patrick.delaunay@st.com>
In-Reply-To: <20190918092920.21435-3-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 26 Sep 2019 18:48:47 -0700
Message-ID: <CAPnjgZ2xTrD10Bc+ZFQxTqCx5Dnx05bbagaKTdRh=gg1RJsFNg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Markus Klotzbuecher <markus.klotzbuecher@kistler.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Hamish Guthrie <hamish.guthrie@kistler.com>,
 Marek Vasut <marek.vasut@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Heiko Schocher <hs@denx.de>,
 Ash Charles <ash@gumstix.com>, Wolfgang Denk <wd@denx.de>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>, Adam Ford <aford173@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Anup Patel <Anup.Patel@wdc.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v3 2/3] env: introduce macro
	ENV_IS_IN_SOMEWHERE
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

On Wed, 18 Sep 2019 at 03:30, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> This patch introduce a macro ENV_IS_IN_SOMEWHERE to check if the
> the environment can be saved somewhere, in a device or in a file system,
> without assumption on CONFIG$(SPL_TPL_)ENV_IS_NOWHERE.
>
> Since the commit 208bd2b85ecc ("env: allow ENV_IS_NOWHERE with
> other storage target"), is is allowed to activated ENV_IS_NOWHERE with
> other CONFIG_IS_IN...
> It is only the case for U-Boot but the restriction in Kconfig
> could also removed for SPL and TPL
> (depends on !SPL_ENV_IS_NOWHERE / depends on !TPL_ENV_IS_NOWHERE).
>
> This macro ENV_IS_IN_DEVICE can be used in code to check if the
> environment for U-Boot / SPL / TPL is really managed (at least one
> CONFIG$(SPL_TPL_)ENV_IS_IN_.. is activated).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v3: None
> Changes in v2: None
>
>  cmd/nvedit.c  | 29 +++++++----------------------
>  include/env.h | 13 +++++++++++++
>  2 files changed, 20 insertions(+), 22 deletions(-)

I feel this is a bit confusion as we have ENV_IS_NOWHERE and
ENV_IS_IN_SOMEWHERE which are opposites. Can they both be true?

So how about adding a comment as to what your new ENV_IS_NOWHERE means?

Also, how about ENV_IS_SOMEWHERE?


>
> diff --git a/cmd/nvedit.c b/cmd/nvedit.c
> index 1cb0bc1460..7a6ec5ae30 100644
> --- a/cmd/nvedit.c
> +++ b/cmd/nvedit.c
> @@ -40,28 +40,13 @@
>
>  DECLARE_GLOBAL_DATA_PTR;
>
> -#if    defined(CONFIG_ENV_IS_IN_EEPROM)        || \
> -       defined(CONFIG_ENV_IS_IN_FLASH)         || \
> -       defined(CONFIG_ENV_IS_IN_MMC)           || \
> -       defined(CONFIG_ENV_IS_IN_FAT)           || \
> -       defined(CONFIG_ENV_IS_IN_EXT4)          || \
> -       defined(CONFIG_ENV_IS_IN_NAND)          || \
> -       defined(CONFIG_ENV_IS_IN_NVRAM)         || \
> -       defined(CONFIG_ENV_IS_IN_ONENAND)       || \
> -       defined(CONFIG_ENV_IS_IN_SATA)          || \
> -       defined(CONFIG_ENV_IS_IN_SPI_FLASH)     || \
> -       defined(CONFIG_ENV_IS_IN_REMOTE)        || \
> -       defined(CONFIG_ENV_IS_IN_UBI)
> -
> -#define ENV_IS_IN_DEVICE
> -
> -#endif
> -
> -#if    !defined(ENV_IS_IN_DEVICE)              && \
> -       !defined(CONFIG_ENV_IS_NOWHERE)
> +#if !defined(CONFIG_SPL_BUILD) || CONFIG_IS_ENABLED(ENV_SUPPORT)
> +#if    !ENV_IS_IN_SOMEWHERE            && \
> +       !CONFIG_IS_ENABLED(ENV_IS_NOWHERE)
>  # error Define one of CONFIG_ENV_IS_IN_{EEPROM|FLASH|MMC|FAT|EXT4|\
>  NAND|NVRAM|ONENAND|SATA|SPI_FLASH|REMOTE|UBI} or CONFIG_ENV_IS_NOWHERE
>  #endif
> +#endif
>
>  /*
>   * Maximum expected input data size for import command
> @@ -744,7 +729,7 @@ ulong env_get_ulong(const char *name, int base, ulong default_val)
>  }
>
>  #ifndef CONFIG_SPL_BUILD
> -#if defined(CONFIG_CMD_SAVEENV) && defined(ENV_IS_IN_DEVICE)
> +#if defined(CONFIG_CMD_SAVEENV) && ENV_IS_IN_SOMEWHERE
>  static int do_env_save(cmd_tbl_t *cmdtp, int flag, int argc,
>                        char * const argv[])
>  {
> @@ -1309,7 +1294,7 @@ static cmd_tbl_t cmd_env_sub[] = {
>  #if defined(CONFIG_CMD_RUN)
>         U_BOOT_CMD_MKENT(run, CONFIG_SYS_MAXARGS, 1, do_run, "", ""),
>  #endif
> -#if defined(CONFIG_CMD_SAVEENV) && defined(ENV_IS_IN_DEVICE)
> +#if defined(CONFIG_CMD_SAVEENV) && ENV_IS_IN_SOMEWHERE
>         U_BOOT_CMD_MKENT(save, 1, 0, do_env_save, "", ""),
>  #if defined(CONFIG_CMD_ERASEENV)
>         U_BOOT_CMD_MKENT(erase, 1, 0, do_env_erase, "", ""),
> @@ -1392,7 +1377,7 @@ static char env_help_text[] =
>  #if defined(CONFIG_CMD_RUN)
>         "env run var [...] - run commands in an environment variable\n"
>  #endif
> -#if defined(CONFIG_CMD_SAVEENV) && defined(ENV_IS_IN_DEVICE)
> +#if defined(CONFIG_CMD_SAVEENV) && ENV_IS_IN_SOMEWHERE
>         "env save - save environment\n"
>  #if defined(CONFIG_CMD_ERASEENV)
>         "env erase - erase environment\n"
> diff --git a/include/env.h b/include/env.h
> index a74a261337..0088d3b1e8 100644
> --- a/include/env.h
> +++ b/include/env.h
> @@ -35,6 +35,19 @@ struct env_clbk_tbl {
>                         int flags);
>  };
>
> +#define ENV_IS_IN_SOMEWHERE \
> +               (CONFIG_IS_ENABLED(ENV_IS_IN_EEPROM) || \
> +                CONFIG_IS_ENABLED(ENV_IS_IN_EXT4) || \
> +                CONFIG_IS_ENABLED(ENV_IS_IN_FAT) || \
> +                CONFIG_IS_ENABLED(ENV_IS_IN_FLASH) || \
> +                CONFIG_IS_ENABLED(ENV_IS_IN_MMC) || \
> +                CONFIG_IS_ENABLED(ENV_IS_IN_NAND) || \
> +                CONFIG_IS_ENABLED(ENV_IS_IN_NVRAM) || \
> +                CONFIG_IS_ENABLED(ENV_IS_IN_ONENAND) || \
> +                CONFIG_IS_ENABLED(ENV_IS_IN_REMOTE) || \
> +                CONFIG_IS_ENABLED(ENV_IS_IN_SPI_FLASH) || \
> +                CONFIG_IS_ENABLED(ENV_IS_IN_UBI))
> +
>  /*
>   * Define a callback that can be associated with variables.
>   * when associated through the ".callbacks" environment variable, the callback
> --
> 2.17.1
>

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
