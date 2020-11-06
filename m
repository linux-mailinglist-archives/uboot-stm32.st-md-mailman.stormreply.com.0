Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 895CA2A9CAD
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 19:50:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E23AC32E90;
	Fri,  6 Nov 2020 18:50:52 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F664C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 18:50:50 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id h22so2274799wmb.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Nov 2020 10:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VSnwTiyzQ5Ccs2iHwbp3E8nPii4pTRMfb0rDUTEI7sw=;
 b=d6iv6PA7pWLPTx54B+jBGCpe38Fjvv418IhLDibBvQJ+ClK8OghZo+nwPIPA3NB9Zd
 cVXehuCujR4X1+IrirIaYGJXfLbXPGss7i4Zl/3SKYfaCGJ8+b3J4npmSp9dbgSmqgAi
 5MgQI3T+Ztd8IoT2f5TVw3MOX+IbsA+zdBJNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VSnwTiyzQ5Ccs2iHwbp3E8nPii4pTRMfb0rDUTEI7sw=;
 b=Ijbkp1K3Uf1e9xKBmT4nInFnhNXQw8O0WpNFQmNYsQL+c40VEg0GEaeEGhO5nueCAR
 fg6B9tQZspALD1H7z0nAelkyoKGiNwenbhl7wB6+G7gQOcL6afr03cHHvxVnj0JTUZeG
 bdJm6ohvtYtDxquwdED7KW7Rl1P7o1vtGu9jTkAaHNSJT3v7Ta+1BM2RkMCGJKZv4fOE
 SSKBOt/LNwA1bA+s6BZzM7dg9/07fGVXBDUpEiqEHBPUE1oAmD8J2ibNlWWn6sZy8DaD
 E7wzP3EQmdxY2Ts75atrkBxhSRN7X41kWHX4S2S1HGn9iNjAYisQ8WlI8K8dQKK2LBsh
 bM+g==
X-Gm-Message-State: AOAM5305ytnwxBdBu9AQ23jE7rrqoLxoWW5tJ0NhJJs/pMVMYOWdzYD/
 zxpfqCxwnKnbNEnWlVGCBGyd+VYIZ13ZYi1ZW/xi7A==
X-Google-Smtp-Source: ABdhPJxecx5fGSuJZw0m7rog6FA6WBOnvHLBFtzXwNkLtubaQUEOf37jPgofYH07vGsZjoCLAuVMH02OEUGzdAbpQKU=
X-Received: by 2002:a7b:c4c3:: with SMTP id g3mr983903wmk.65.1604688649280;
 Fri, 06 Nov 2020 10:50:49 -0800 (PST)
MIME-Version: 1.0
References: <20201014091646.4233-1-patrick.delaunay@st.com>
 <CAPnjgZ2Z8=hXqoWXz8nuUToWTGz3sCY8zneGA9WsaVGYPprxzQ@mail.gmail.com>
 <88a21c960cc248af9cd08e2fc5681a69@SFHDAG2NODE3.st.com>
 <CAPnjgZ3S8PzSYjJSNJ0HhYk_=jkFR4yryL-qwPZRDM4BDQOwiw@mail.gmail.com>
 <8a219eb12a6446999545b375827980d8@SFHDAG2NODE3.st.com>
 <CAPnjgZ0KpixWRivpttZf+Mc_rJGuVtQAqY2iEBV7jOA4Mn4peA@mail.gmail.com>
 <c24b590e1eaa4af7a06a863a7f3aeeb1@SFHDAG2NODE3.st.com>
In-Reply-To: <c24b590e1eaa4af7a06a863a7f3aeeb1@SFHDAG2NODE3.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 6 Nov 2020 11:50:35 -0700
Message-ID: <CAPnjgZ3-nWeSEhw2gyUp0hh5o41k-tJA_bJ5z8wVEDdyMguzFQ@mail.gmail.com>
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

On Fri, 6 Nov 2020 at 10:45, Patrick DELAUNAY <patrick.delaunay@st.com> wrote:
>
> Hi Simon,
>
> > From: Simon Glass <sjg@chromium.org>
> > Sent: vendredi 30 octobre 2020 19:16
> >
> > Hi Patrick,
> >
> > On Wed, 28 Oct 2020 at 05:52, Patrick DELAUNAY <patrick.delaunay@st.com>
> > wrote:
> > >
> > > Hi Simon,
> > >
> > > > From: Simon Glass <sjg@chromium.org>
> > > > Sent: lundi 26 octobre 2020 20:23
> > > >
> > > > Hi Patrick,
> > > >
> > > > On Thu, 15 Oct 2020 at 09:59, Patrick DELAUNAY
> > > > <patrick.delaunay@st.com>
> > > > wrote:
> > > > >
> > > > > Hi Simon,
> > > > >
> > > > > > From: Simon Glass <sjg@chromium.org>
> > > > > > Sent: jeudi 15 octobre 2020 17:06
> > > > > >
> > > > > > Hi Patrick,
> > > > > >
> > > > > > On Wed, 14 Oct 2020 at 03:16, Patrick Delaunay
> > > > > > <patrick.delaunay@st.com>
> > > > > > wrote:
> > > > > > >
> > > > > > >
> > > > > > > This patch-set migrates several stm32 drivers to API
> > > > > > > compatible with logging features (use dev_...() or log_...()
> > > > > > > function) and activate the logging features in STM32MP15 boards.
> > > > > > >
> > > > > > > The size of U-Boot increased by 19kB (933026 to 952830 on
> > > > > > > STM32MP157C-EV1 board for basic defconfig) but the boot time
> > > > > > > don't change
> > > > > > drastically.
> > > > > >
> > > > > > >
> > >
> > > (...)
> > >
> > > > > > > For information even with all trace embbeded in U-Boot but not
> > > > > > > activated, MAX_LOG_LEVEL=8 and LOG_DEFAULT_LEVEL=6
> > > > > > >
> > > > > > > Size increase by 190KB (952830 to 1147918) but boot time is
> > > > > > > stable (1,748s vs 1,696s).
> > > > > >
> > > > > > This seems pretty bad. Is this because of console output, or
> > > > > > something else? I understand the size increase, but not the boot
> > > > > > time
> > > > increase.
> > > > >
> > > > > For this last point I just execute STM32MP157C-EV1 boot with a
> > > > > patch in configs/stm32mp15_basic_defconfig
> > > > >
> > > > > +CONFIG_LOGLEVEL=8
> > > > > +CONFIG_LOG_MAX_LEVEL=8
> > > > > +CONFIG_LOG_DEFAULT_LEVEL=6
> > > > > +CONFIG_LOGF_FILE=y
> > > > > +CONFIG_LOGF_LINE=y
> > > > > +CONFIG_LOGF_FUNC=y
> > > > >
> > > > > And execute "bootstage report" after the second boot (the first
> > > > > boot is pertubated by env save)
> > > > >
> > > > > I think the delta is linked to
> > > > > 1/ size of U-Boot (SPL spent more time to load U-Boot)
> > > > >     end of SPL 987,579  => 996,117
> > > >
> > > > OK.
> > > >
> > > > >
> > > > > 2/ time to check for each debug trace: because I increase the log level
> > > > >    (gd->default_log_level = 6 < MAX_LOG_LEVEL=8)
> > > >
> > > > This might be the biggest part. If you look at _log() it always does
> > > > the vsprintf() even if in fact log_dispatch() does not dispatch it to anything.
> > >
> > > Yes, log_dispatch / log_passes_filter are called after vsnprintf
> > >
> > > > I suspect that could be refactored to move the checking to a
> > > > separate function, and then call it before doing the expensive vsprintf().
> > >
> > > Or save va_list, fmt in log_rec and call vsnprintf allow when needed
> > > in log_dispatch, just before emit
> >
> > Yes that sounds better to me.
> >
> > >
> > > > >
> > > > > 3/ treatment added in log_console_emit (some printf) and
> > > > >     log_dispatch (processing_msg / gd->loghead)
> > > >
> > > > Likely this is fast.
> > > >
> > > > >
> > > > > 4/ lower cache performancy as trace code are pesent in memory even
> > > > >     they are not used
> > > > >
> > > > > Can I do some check/experimentation on my side ?
> > > >
> > > > Yes, if you can use the bootstage_start() and bootstage_accum()
> > > > within the _log() function to measure the total time take in the run.
> > >
> > > Ok, I add it in my TODO list
> >
> > OK. We really should make logging add the least overhead possible.
> >
> > Regards,
> > Simon
>
> I rebase my patchset, tested on stm32mp15_trusted_defconfig (with TF-A load)
> and no more stm32_basic_defconfgi (with SPL load)
>
> And the cost is now more limited.... (perhaps I made some error in my last tests or
> I activate too many trace ?).

Definitely tracing adds to the time. But that's good news!

>
> But I found some improvement on the log features, I will sent booth with
> updated values next week.

Great, thanks. More people will use logging if the overhead is small.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
