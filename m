Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 422952CC90C
	for <lists+uboot-stm32@lfdr.de>; Wed,  2 Dec 2020 22:46:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E6CEC06150;
	Wed,  2 Dec 2020 21:46:48 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BACDC424C0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Dec 2020 21:46:47 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id e25so437414wme.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 02 Dec 2020 13:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rb8zOhg/LuwNW9L/eaKYfPtP51hkXQBpD3OtvHO+B9M=;
 b=bNOJL5X8A3yml7s5e9n4YlxZtRv5U/2cqhhRWs5vCgffb5lFAmhVOHG5vNeu2jXHuI
 bnwOFN4jjnE8+OM+rjTVeG1JrPBYZKljImoMVS+RsLSZbFm+9R+T2xww4yHZnSi5NSf2
 qbCaF7vuyFGpZLqCrfx7/maeDZ/wUcoYyqUk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rb8zOhg/LuwNW9L/eaKYfPtP51hkXQBpD3OtvHO+B9M=;
 b=OD1C+ouFKUsIT/f8fIXJRUEx6P+fasV9vX8wYR9/VFP2R/REgYdk6lDZyqaCOCC3os
 cY3lJ66GoND6zsfL1BoRAoHsJMjGFdDhXzUGLv8CdETDdFWwV5//hgUt9zWHfLTgQVnt
 d8yKHvGb2wiUf41ejphWZtQMlHpsmoINTILgfCzNmnCg3kfpDgZcRdAGcze+/aluc/3n
 QEWfMwAmGnFTAI7K5NIaYn5MUJbqrTrvf6BeI/X9gI/CfINvwDnAlwDLFvrghoid8ziM
 zdd6FJHiD7/cSpOIGigezR6EmkxbcCQRYgdrVlCLoXD/Q46MGmWsplMOv9HnY9Xhpno2
 1FTw==
X-Gm-Message-State: AOAM533ZGWHY9Es/XsItVLz9P4nLaHkokFN0qPuvMkSJdtn5wpmljTcp
 Qdzu3d9+utD6p8f0yrVt8WPM36Qp4eOSMZf8vg/A7A==
X-Google-Smtp-Source: ABdhPJwV8F7ePw6sx3IQaxyDpaz+yGbYpBR2v+4Fd4Z7ZrUB3YGY8jRDH8cJq1uk21fjygBTE+EcidfwukAibbrhtd0=
X-Received: by 2002:a1c:9c4a:: with SMTP id f71mr7549wme.168.1606945606603;
 Wed, 02 Dec 2020 13:46:46 -0800 (PST)
MIME-Version: 1.0
References: <20201127102100.11721-1-patrick.delaunay@st.com>
 <20201127102100.11721-6-patrick.delaunay@st.com>
 <CAPnjgZ3F08GCMY+K4F8xVS7iFoyDZWY-MQv+OgMzYNfHXqMcQg@mail.gmail.com>
 <c9ebfd35ec6b421680d8b7e2b1a8b102@SFHDAG2NODE3.st.com>
In-Reply-To: <c9ebfd35ec6b421680d8b7e2b1a8b102@SFHDAG2NODE3.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 2 Dec 2020 14:46:35 -0700
Message-ID: <CAPnjgZ2f7kJ9PdQr072iyJhssJKxB-8jKYDiB+JkbY-LpcwCtg@mail.gmail.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Anatolij Gustschin <agust@denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 7/9] console: allow to record console
 output before ready
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

On Wed, 2 Dec 2020 at 03:55, Patrick DELAUNAY <patrick.delaunay@st.com> wrote:
>
> Hi Simon,
>
> > From: Uboot-stm32 <uboot-stm32-bounces@st-md-mailman.stormreply.com> On
> > Behalf Of Simon Glass
> >
> > Hi Patrick,
> >
> > On Fri, 27 Nov 2020 at 03:21, Patrick Delaunay <patrick.delaunay@st.com>
> > wrote:
> > >
> > > Allow to record the console output before before U-Boot has a console
> > > ready.
> > >
> > > This patch allows to test the console output in sandbox test based on
> > > console record.
> > >
> > > It is possible because GD_FLG_RECORD and GD_FLG_SERIAL_READY are 2
> > > independent flags.
> > >
> > > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > > ---
> > >
> > > Changes in v2:
> > > - Record all messages in console, even when dropped (NEW)
> > >
> > >  common/console.c | 16 ++++++++--------
> > >  1 file changed, 8 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/common/console.c b/common/console.c index
> > > 70579af042..c3d552bb3e 100644
> > > --- a/common/console.c
> > > +++ b/common/console.c
> > > @@ -519,6 +519,10 @@ void putc(const char c)  {
> > >         if (!gd)
> > >                 return;
> > > +#ifdef CONFIG_CONSOLE_RECORD
> >
> > Can we use CONFIG_IS_ENABLED() here and avoid the #ifdef? We might need to
> > add some inline functions for the case where console_out is not available. See
> > global_data.h for some examples.
> ...
> >
> > Regards,
> > Simon
>
> I see this warning when I push this patchset but I preferred sent the path as it,
> to easy the review as I just move existing line.
>
> But in parallel I prepare a other patchset to remove all (or almost all) the #if def CONFIG in console.c
>
> I don't sent it yet as I am still solving some compilation issues, but it is solved now....
>
> https://gitlab.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/5431
>
> So I will sent it I few days, after a last review / test.

OK thanks.

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
