Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F1BE057D
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Oct 2019 15:50:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 478A1C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Oct 2019 13:50:49 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA035C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2019 13:50:47 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id b25so2593011oib.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2019 06:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QNhXFptNwv1MXnRKGvWldnbR7XIsjJ79jXoQ9Z9Q70s=;
 b=Cvoosy7ht1QEbSsGfRF9OO1jQofZyx9oWqPcUMmLhxh8ML0KWupUzQYrMLTdEK3ybP
 jNtcUkkOQ4BneQKLchngdR37yUjtJY89so3AW8dE1RvNf5Cg/PDanOCWGLc3cVg3sFBI
 rSjJYr35dbDq6w2Fqht2e2SJSKhlr13/dj/i8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QNhXFptNwv1MXnRKGvWldnbR7XIsjJ79jXoQ9Z9Q70s=;
 b=SBMCaoR5SHlvEYYTNHsAEqrusi5TuIHxZaun/gq/9eihCt3d9URWVVkNNDWWimoV63
 EY4RIEJfcNzFNb1o6UYDhKlqDaxNTraU3/irkT3pihJhBY98xcyv04jWgbED4VwTh/Kh
 hO4vt8BywCtlruO1eWAGqlP73P7gdhrNy97T73tlPeAQKQqw9IxIlMjpuVBzqmtIY+Qb
 NOPYSUV3gf6uo5nxIh1xNsqtCD/BWIz7nMv+yDlaR1x226C46fpR+x4r+c4DSvzJcqvN
 Zcmwbv+0IIjuo4r/CwfXmMRKNnwV2uS2mejkd4YueTb1sKw8lT7Wxve+cZ8HwByBWR3A
 Cm0g==
X-Gm-Message-State: APjAAAXULkTuRCSz2VU/tpaqNAKFHpP79LYWbgXymvPkyZUpVbeqLjXJ
 FrqcN6g2ONRlZ9zeyKvkc5s89dQ5OKmGE8oPWBtdmQ==
X-Google-Smtp-Source: APXvYqxXUsXHvlgDt3s6EB0/EhyeRU8G5PYUFmumC+HLg7GapCZQQx3sFTtxDIR8LKr+mHd77x9B4U92DEEw+hNaanw=
X-Received: by 2002:aca:f1d7:: with SMTP id p206mr3114807oih.97.1571752245855; 
 Tue, 22 Oct 2019 06:50:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190918092920.21435-1-patrick.delaunay@st.com>
 <20190918092920.21435-3-patrick.delaunay@st.com>
 <CAPnjgZ2xTrD10Bc+ZFQxTqCx5Dnx05bbagaKTdRh=gg1RJsFNg@mail.gmail.com>
 <c6c9d7f550f84529b1289822a518468f@SFHDAG6NODE3.st.com>
In-Reply-To: <c6c9d7f550f84529b1289822a518468f@SFHDAG6NODE3.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 22 Oct 2019 07:50:26 -0600
Message-ID: <CAPnjgZ1KMkNW=ctfiLJWfN6wxdnkLs_jYuf8k6zqc3KaosZRkQ@mail.gmail.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
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

Hi Patrick,

On Mon, 30 Sep 2019 at 03:30, Patrick DELAUNAY <patrick.delaunay@st.com> wrote:
>
> Hi Simon,
>
> > From: Simon Glass <sjg@chromium.org>
> > Sent: vendredi 27 septembre 2019 03:49
> >
> > On Wed, 18 Sep 2019 at 03:30, Patrick Delaunay <patrick.delaunay@st.com>
> > wrote:
> > >
> > > This patch introduce a macro ENV_IS_IN_SOMEWHERE to check if the the
> > > environment can be saved somewhere, in a device or in a file system,
> > > without assumption on CONFIG$(SPL_TPL_)ENV_IS_NOWHERE.
> > >
> > > Since the commit 208bd2b85ecc ("env: allow ENV_IS_NOWHERE with other
> > > storage target"), is is allowed to activated ENV_IS_NOWHERE with other
> > > CONFIG_IS_IN...
> > > It is only the case for U-Boot but the restriction in Kconfig could
> > > also removed for SPL and TPL (depends on !SPL_ENV_IS_NOWHERE /
> > depends
> > > on !TPL_ENV_IS_NOWHERE).
> > >
> > > This macro ENV_IS_IN_DEVICE can be used in code to check if the
> > > environment for U-Boot / SPL / TPL is really managed (at least one
> > > CONFIG$(SPL_TPL_)ENV_IS_IN_.. is activated).
> > >
> > > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > > ---
> > >
> > > Changes in v3: None
> > > Changes in v2: None
> > >
> > >  cmd/nvedit.c  | 29 +++++++----------------------  include/env.h | 13
> > > +++++++++++++
> > >  2 files changed, 20 insertions(+), 22 deletions(-)
> >
> > I feel this is a bit confusion as we have ENV_IS_NOWHERE and
> > ENV_IS_IN_SOMEWHERE which are opposites. Can they both be true?
>
> I am not completely satisfied by the name " ENV_IS_IN_SOMEWHERE ".
>
> Perhaps other name will be less confusing:
>  "ENV_IS_IN_XXX", "ENV_IS_IN_DEVICE",  "ENV_IS_IN_STORAGE_MEDIUM",  "ENV_SAVE_SUPPORT" ...
>
> But I don't found a perfect solution...

Actually I think 'save' is good.

Perhaps ENV_IS_STORED?

>
> It is not really the opposite:  ENV_IS_IN_SOMEWHERE  means at least one of the config  "ENV_IS_IN...." is activated.
> => at leats one not volatile TARGET (= a strorage medium) is supported to load and save the environment
>
> Yes, then can both be true: ENV can support several target in U-Boot
> (but it is not the case today in SPL due to dependency in Kconfig):
> - CONFIG_ENV_IS_IN_EXT4
> - CONFIG_ENV_IS_IN_FAT
> - CONFIG_ENV_IS_IN_NAND
> ....
>
> The arrays env_locations[] to defined the location supported
> => env_get_location = weak function select the location (can ENVL_NOWHERE)
>
> For me, U-Boot have no reason to refuse ENV_IS_NOWHERE when the other ENV_IS_IN_XXX are activated , as it I supported in env code.
> => ENVL_NOWHERE can be see as a fallback (no error) when no other ENV location is available (each init failed / not supported in device tree)...
>
> I plan to use this feature in stm32mp1 platform: U-Boot select the ENV location according the boot device
>
> Boot from
> - SD Card : eMMC => env in a file in ext4 file
> - NAND =>  env in a UBI file
> - NOR => env in SPI flash parttion (RAW)
> - other case (boot form USB/serial for STM32CubeProgrammer):
>    U-Boot don't known where found the environment , use default environment => fallback with NOWHERE returned by env_get_location()
>
> board/st/stm32mp1/stm32mp1.c:757
>
> enum env_location env_get_location(enum env_operation op, int prio)
> {
>         u32 bootmode = get_bootmode();
>
>         if (prio)
>                 return ENVL_UNKNOWN;
>
>         switch (bootmode & TAMP_BOOT_DEVICE_MASK) {
> #ifdef CONFIG_ENV_IS_IN_EXT4
>         case BOOT_FLASH_SD:
>         case BOOT_FLASH_EMMC:
>                 return ENVL_EXT4;
> #endif
> #ifdef CONFIG_ENV_IS_IN_UBI
>         case BOOT_FLASH_NAND:
>                 return ENVL_UBI;
> #endif
> #ifdef CONFIG_ENV_IS_IN_SPI_FLASH
>         case BOOT_FLASH_NOR:
>                 return ENVL_SPI_FLASH;
> #endif
>         default:
>                 return ENVL_NOWHERE;
>         }
> }
>
> > So how about adding a comment as to what your new ENV_IS_NOWHERE
> > means?
>
> I don't think I change the meaning of ENV_IS_NOWHERE
>
> In env/Kconfig
>
>           Define this if you don't want to or can't have an environment stored
>           on a storage medium. In this case the environment will still exist
>           while U-Boot is running, but once U-Boot exits it will not be
>           stored. U-Boot will therefore always start up with a default
>           environment.
>
> I only change the dependency
>
> > Also, how about ENV_IS_SOMEWHERE?
>
> Yes I need to add comment on the added macro

[..]

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
