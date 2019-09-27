Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5F0BFCDA
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Sep 2019 03:49:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36F05C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Sep 2019 01:49:01 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8135C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Sep 2019 01:48:59 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id i185so3840022oif.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2019 18:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oQ1Q5iqed7PH7vUlvaBmlArvWHOIS4/yUt53JkuZFm0=;
 b=P3EJMCMfbOCYF2UYHlOZzhWm53GEs52cBss3D9oZU5s5AdkaP/C5HzRRl8D17sJZql
 8KbKOA5dVKcoLg3mBfrorOD6eRE0xpI50KDfiWm9XSORLKDOW66oC/aOk/fxLXNviAbj
 PiS9rHkLexrmHBTUe5SFI86J39bEw7BFA1Y4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oQ1Q5iqed7PH7vUlvaBmlArvWHOIS4/yUt53JkuZFm0=;
 b=anbso3ryzUCxC66hpouF2fF8TqyJKQ9OnR9FfBt6aUFvugsw8LOSFJHrFH27RA1bCV
 ywrRGwxvM0WewBmEf2JGzKKY1HUd4VAU6tskQXSL0CIzfB1RWDWcfsTWxCjfHLrc+BXX
 vOPGXHhiutUjX6YA6rL0VKuVQS0LJSMloOgbK7haIuJ43AAVmz/q97EYflz6yTGmXj5Q
 v5JM7KOHszW90WWx8v/Y0SZfvcZTnqohtviuH0As8AkEZWH2ZhqmAc1IS9qEOtqqQIoN
 +i1DlNXUgREr5A3gjqh2FriXsvfGZlOYJFbZftukrf4dfYr2oMem+1wsd0YOBpqyjmUP
 QXMA==
X-Gm-Message-State: APjAAAX00VYc7yL9OBNNUUS+LasaHMIbhXEYTE515u+hdXPF6Wd/kkT+
 ntYpWYjjws2tQ9NG16pI8a2W/AnXVAjWFEOEymXA2Q==
X-Google-Smtp-Source: APXvYqxz1acjhCzwDxiNL3RgkAoo7fleVMs398wrjNjMd4TdGf/CCMVJzHucU9tqVN4tCaTyL2y2JgPTPaiNqaZ4HLM=
X-Received: by 2002:aca:f54d:: with SMTP id t74mr5236676oih.170.1569548937958; 
 Thu, 26 Sep 2019 18:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190918092920.21435-1-patrick.delaunay@st.com>
 <20190918092920.21435-2-patrick.delaunay@st.com>
In-Reply-To: <20190918092920.21435-2-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 26 Sep 2019 18:48:46 -0700
Message-ID: <CAPnjgZ1J5u+fL6wi1ss1ETBX5_WGXFk=aJTjn4TSuLtLhYkrvA@mail.gmail.com>
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
Subject: Re: [Uboot-stm32] [PATCH v3 1/3] env: correct the check of
	env_flags_validate presence
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
> This patch corrects the check of env_flags_validate presence because
> "flags.c" is always compiled in U-Boot and CONFIG_ENV_SUPPORT
> don't exist; so the macro CONFIG_IS_ENABLED(ENV_SUPPORT) only provides
> the expected result for SPL and TPL (check activation of
> CONFIG_SPL_ENV_SUPPORT and CONFIG_TPL_ENV_SUPPORT).
>
> This patch solves the regression introduced by
> commit 7d4776545b0f ("env: solve compilation error
> in SPL"); change_ok was always NULL in U-Boot.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v3: None
> Changes in v2: None
>
>  env/common.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
