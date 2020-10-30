Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 970202A0D34
	for <lists+uboot-stm32@lfdr.de>; Fri, 30 Oct 2020 19:15:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C285C3FADA;
	Fri, 30 Oct 2020 18:15:57 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05E40C3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 18:15:55 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id c16so3778838wmd.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 11:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hola6HnywyOR4XVwF+67st3NN59m44H4W4uxl1o2/hk=;
 b=jcOM7xlBHRsKL+ozytghmRm/Cis/iNLyraOaapR+TyDQzdq2whnUr3vay9+WWo30U0
 N5YnCK2Kq+Hjf2qQC4EUpshjIbCvxhMevciciDSMx/NuLBycpoQyMbfrHTTR+Z1lLv7f
 9ldZJGVuJWnDZKJ0BO4LQdofl9iI/bNKqYTr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hola6HnywyOR4XVwF+67st3NN59m44H4W4uxl1o2/hk=;
 b=Wq5jtSYzHxxW3PjXntBDPS+SucHtAhmVOImLxrfXzL9b7mbj8BFqXfBtq5RYfsQJOc
 QlZ5woqi/8isAkdFI0rWB43LHO7n5LXjfLKznIuCRACZcFgri71kNUrGT7+U8zslNmH5
 FQLcmJcLNXBx9iferDrsd7DYqCN5XyMfZkTCmrSLRFqxFP5iCOLQlnzBmZP+G3vr7iLV
 01F6UpPp/akuZmJSHnckUX87c35qwIvsOiWN5XaGUVm3GZ4mtihbk2Z7LNRFelvugurY
 WRoNhV77OqxK1btxmuwHeoRudCvL3yr5DmkZEwa+nW24xgqf6hoxuRp8vAZAdD19XH0E
 dLtg==
X-Gm-Message-State: AOAM5316Zm9pg9TREjMjiXJpbTumfXD+CJE+dpYD8uiDTQ5cBje2SNNO
 QSFkT3zZGjrS4MkUnOCo1lvIJcTRWSBXnIqZDvK+JQ==
X-Google-Smtp-Source: ABdhPJxyUg24Zbw8pwDAtg1isL+W4HGmxTRKXPv5ouZin6Qy/kPh2bkvcIdVSRbCmv7YW2FadYFd1SJvsRWpqYL7pek=
X-Received: by 2002:a1c:68c1:: with SMTP id d184mr4046167wmc.74.1604081755156; 
 Fri, 30 Oct 2020 11:15:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201014091646.4233-1-patrick.delaunay@st.com>
 <CAPnjgZ2Z8=hXqoWXz8nuUToWTGz3sCY8zneGA9WsaVGYPprxzQ@mail.gmail.com>
 <88a21c960cc248af9cd08e2fc5681a69@SFHDAG2NODE3.st.com>
 <CAPnjgZ3S8PzSYjJSNJ0HhYk_=jkFR4yryL-qwPZRDM4BDQOwiw@mail.gmail.com>
 <8a219eb12a6446999545b375827980d8@SFHDAG2NODE3.st.com>
In-Reply-To: <8a219eb12a6446999545b375827980d8@SFHDAG2NODE3.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2020 12:15:43 -0600
Message-ID: <CAPnjgZ0KpixWRivpttZf+Mc_rJGuVtQAqY2iEBV7jOA4Mn4peA@mail.gmail.com>
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

On Wed, 28 Oct 2020 at 05:52, Patrick DELAUNAY <patrick.delaunay@st.com> wrote:
>
> Hi Simon,
>
> > From: Simon Glass <sjg@chromium.org>
> > Sent: lundi 26 octobre 2020 20:23
> >
> > Hi Patrick,
> >
> > On Thu, 15 Oct 2020 at 09:59, Patrick DELAUNAY <patrick.delaunay@st.com>
> > wrote:
> > >
> > > Hi Simon,
> > >
> > > > From: Simon Glass <sjg@chromium.org>
> > > > Sent: jeudi 15 octobre 2020 17:06
> > > >
> > > > Hi Patrick,
> > > >
> > > > On Wed, 14 Oct 2020 at 03:16, Patrick Delaunay
> > > > <patrick.delaunay@st.com>
> > > > wrote:
> > > > >
> > > > >
> > > > > This patch-set migrates several stm32 drivers to API compatible
> > > > > with logging features (use dev_...() or log_...() function) and
> > > > > activate the logging features in STM32MP15 boards.
> > > > >
> > > > > The size of U-Boot increased by 19kB (933026 to 952830 on
> > > > > STM32MP157C-EV1 board for basic defconfig) but the boot time don't
> > > > > change
> > > > drastically.
> > > >
> > > > >
>
> (...)
>
> > > > > For information even with all trace embbeded in U-Boot but not
> > > > > activated, MAX_LOG_LEVEL=8 and LOG_DEFAULT_LEVEL=6
> > > > >
> > > > > Size increase by 190KB (952830 to 1147918) but boot time is stable
> > > > > (1,748s vs 1,696s).
> > > >
> > > > This seems pretty bad. Is this because of console output, or
> > > > something else? I understand the size increase, but not the boot time
> > increase.
> > >
> > > For this last point I just execute STM32MP157C-EV1 boot with a patch
> > > in configs/stm32mp15_basic_defconfig
> > >
> > > +CONFIG_LOGLEVEL=8
> > > +CONFIG_LOG_MAX_LEVEL=8
> > > +CONFIG_LOG_DEFAULT_LEVEL=6
> > > +CONFIG_LOGF_FILE=y
> > > +CONFIG_LOGF_LINE=y
> > > +CONFIG_LOGF_FUNC=y
> > >
> > > And execute "bootstage report" after the second boot (the first boot
> > > is pertubated by env save)
> > >
> > > I think the delta is linked to
> > > 1/ size of U-Boot (SPL spent more time to load U-Boot)
> > >     end of SPL 987,579  => 996,117
> >
> > OK.
> >
> > >
> > > 2/ time to check for each debug trace: because I increase the log level
> > >    (gd->default_log_level = 6 < MAX_LOG_LEVEL=8)
> >
> > This might be the biggest part. If you look at _log() it always does the vsprintf()
> > even if in fact log_dispatch() does not dispatch it to anything.
>
> Yes, log_dispatch / log_passes_filter are called after vsnprintf
>
> > I suspect that could be refactored to move the checking to a separate function,
> > and then call it before doing the expensive vsprintf().
>
> Or save va_list, fmt in log_rec and call vsnprintf allow when needed in log_dispatch, just before emit

Yes that sounds better to me.

>
> > >
> > > 3/ treatment added in log_console_emit (some printf) and
> > >     log_dispatch (processing_msg / gd->loghead)
> >
> > Likely this is fast.
> >
> > >
> > > 4/ lower cache performancy as trace code are pesent in memory even
> > >     they are not used
> > >
> > > Can I do some check/experimentation on my side ?
> >
> > Yes, if you can use the bootstage_start() and bootstage_accum() within the _log()
> > function to measure the total time take in the run.
>
> Ok, I add it in my TODO list

OK. We really should make logging add the least overhead possible.

Regards,
SImon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
