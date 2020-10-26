Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B902996C1
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Oct 2020 20:22:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6801BC36B0B;
	Mon, 26 Oct 2020 19:22:57 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69751C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Oct 2020 19:22:55 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v5so12807462wmh.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Oct 2020 12:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tppMN3jktTXk0CzIWyuHCrXdu6QjxJQLVC48oV4KRjs=;
 b=S3IsUaDjVT22/ypYUGWdRwN47JAkAZDg4qrVR07lKXHObwmi/7u61nbWFIKtjiBLX0
 /4XGnYTiXJQfCoH0gWDFgTlrj6uqijsA3zmDd3bWq6iM0jBJDJwA4KpkeKC46WNOKnaX
 PCDkEIy6guKrLfhFvtl4gffVfZV3huJqWABRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tppMN3jktTXk0CzIWyuHCrXdu6QjxJQLVC48oV4KRjs=;
 b=kIiefXfj4Oo5nUYmwd4D5C9ywMKfj7OyUCj2WU50+wpI7QEeQ00+86apVU3P2BW4/c
 kfQSIiSA0yDR2FHdk1NaIv42Jj/gfAXlVTvMXtr09IT6QUkYmDFjQlz+xGkwGXH8TgfZ
 n7ikfzvJaC3w48uX4QTzOoBJW9K/IQEXQ2sVE+n9vb+fv6B+6gLn21AnKkwhTD/fY2Ff
 pQn7Y0cWGjVr9cnGos1NYL4illeYKax9t8OeS9PRs6sJKJvlcO65Zm79xmhvVsRWkhc5
 I/EyDXgH/VIN+MtwCQ6EkQ1PIV0SJI/djg0Obm5otBSo+rJ/LPT3w3hgbfA7Eb3ojdrO
 5DSg==
X-Gm-Message-State: AOAM532a0i7FD7UHdLbHM12sYqtrJa4BbN0CdRPMUjK+vnajCLYzsgww
 LvGTG9Ag9xIbsbEHUV97tP+tmBwuXJpNJGAxwCZB4g==
X-Google-Smtp-Source: ABdhPJxlmB5JTbAyqhSgOVIeLRnfi8cOL3eDVu9PM7IiFRoWKwrTftC47BYbRnqYkK/C9cXWA7xwhhY0EuKwhKOzeEw=
X-Received: by 2002:a7b:c18d:: with SMTP id y13mr17351187wmi.120.1603740174645; 
 Mon, 26 Oct 2020 12:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <20201014091646.4233-1-patrick.delaunay@st.com>
 <CAPnjgZ2Z8=hXqoWXz8nuUToWTGz3sCY8zneGA9WsaVGYPprxzQ@mail.gmail.com>
 <88a21c960cc248af9cd08e2fc5681a69@SFHDAG2NODE3.st.com>
In-Reply-To: <88a21c960cc248af9cd08e2fc5681a69@SFHDAG2NODE3.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 26 Oct 2020 13:22:43 -0600
Message-ID: <CAPnjgZ3S8PzSYjJSNJ0HhYk_=jkFR4yryL-qwPZRDM4BDQOwiw@mail.gmail.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Heiko Schocher <hs@denx.de>, Christophe KERELLO <christophe.kerello@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Lukasz Majewski <lukma@denx.de>,
 Bin Meng <bmeng.cn@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Anatolij Gustschin <agust@denx.de>,
 Yannick FERTRE <yannick.fertre@st.com>
Subject: Re: [Uboot-stm32] [PATCH 00/33] stm32: enable logging features
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

On Thu, 15 Oct 2020 at 09:59, Patrick DELAUNAY <patrick.delaunay@st.com> wrote:
>
> Hi Simon,
>
> > From: Simon Glass <sjg@chromium.org>
> > Sent: jeudi 15 octobre 2020 17:06
> >
> > Hi Patrick,
> >
> > On Wed, 14 Oct 2020 at 03:16, Patrick Delaunay <patrick.delaunay@st.com>
> > wrote:
> > >
> > >
> > > This patch-set migrates several stm32 drivers to API compatible with
> > > logging features (use dev_...() or log_...() function) and activate
> > > the logging features in STM32MP15 boards.
> > >
> > > The size of U-Boot increased by 19kB (933026 to 952830 on
> > > STM32MP157C-EV1 board for basic defconfig) but the boot time don't change
> > drastically.
> >
> > >
> > > For example on STM32MP157C-EV1 board:
> > >
> > > 1/ Before LOG patchset
> > >
> > > Timer summary in microseconds (12 records):
> > >        Mark    Elapsed  Stage
> > >           0          0  reset
> > >     224,514    224,514  SPL
> > >     961,170    736,656  end SPL
> > >     964,006      2,836  board_init_f
> > >   1,186,986    222,980  board_init_r
> > >   1,651,379    464,393  id=64
> > >   1,674,463     23,084  id=65
> > >   1,675,164        701  main_loop
> > >   4,025,806  2,350,642  id=175
> > >
> > > Accumulated time:
> > >                 55,064  dm_f
> > >                 66,749  dm_r
> > >                 88,796  dm_spl
> > >
> > > 2/ With LOG activated (after this patchset)
> > >
> > > Timer summary in microseconds (12 records):
> > >        Mark    Elapsed  Stage
> > >           0          0  reset
> > >     227,142    227,142  SPL
> > >     984,585    757,443  end SPL
> > >     987,579      2,994  board_init_f
> > >   1,210,091    222,512  board_init_r
> > >   1,673,354    463,263  id=64
> > >   1,696,073     22,719  id=65
> > >   1,696,775        702  main_loop
> > >   5,443,104  3,746,329  id=175
> > >
> > > Accumulated time:
> > >                 62,154  dm_f
> > >                 66,264  dm_r
> > >                 89,376  dm_spl
> > >
> > > For information even with all trace embbeded in U-Boot but not
> > > activated, MAX_LOG_LEVEL=8 and LOG_DEFAULT_LEVEL=6
> > >
> > > Size increase by 190KB (952830 to 1147918) but boot time is stable
> > > (1,748s vs 1,696s).
> >
> > This seems pretty bad. Is this because of console output, or something else? I
> > understand the size increase, but not the boot time increase.
>
> For this last point I just execute STM32MP157C-EV1 boot
> with a patch in configs/stm32mp15_basic_defconfig
>
> +CONFIG_LOGLEVEL=8
> +CONFIG_LOG_MAX_LEVEL=8
> +CONFIG_LOG_DEFAULT_LEVEL=6
> +CONFIG_LOGF_FILE=y
> +CONFIG_LOGF_LINE=y
> +CONFIG_LOGF_FUNC=y
>
> And execute "bootstage report" after the second boot
> (the first boot is pertubated by env save)
>
> I think the delta is linked to
> 1/ size of U-Boot (SPL spent more time to load U-Boot)
>     end of SPL 987,579  => 996,117

OK.

>
> 2/ time to check for each debug trace: because I increase the log level
>    (gd->default_log_level = 6 < MAX_LOG_LEVEL=8)

This might be the biggest part. If you look at _log() it always does
the vsprintf() even if in fact log_dispatch() does not dispatch it to
anything.

I suspect that could be refactored to move the checking to a separate
function, and then call it before doing the expensive vsprintf().

>
> 3/ treatment added in log_console_emit (some printf) and
>     log_dispatch (processing_msg / gd->loghead)

Likely this is fast.

>
> 4/ lower cache performancy as trace code are pesent in memory even
>     they are not used
>
> Can I do some check/experimentation on my side ?

Yes, if you can use the bootstage_start() and bootstage_accum() within
the _log() function to measure the total time take in the run.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
