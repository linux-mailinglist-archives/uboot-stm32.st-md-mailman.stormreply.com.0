Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9932D8755
	for <lists+uboot-stm32@lfdr.de>; Sat, 12 Dec 2020 16:39:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23DC3C3FADA;
	Sat, 12 Dec 2020 15:39:39 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5DABC36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Dec 2020 15:39:36 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id i6so11242669otr.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Dec 2020 07:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N5dpncXXRn/0gIrGvQkFos2fjDkVU/m0NJWY1swiJVA=;
 b=Xep6eOZDgyhxvEX0YyQ/A1q49RsXIKTvZkAWKhvPfJ3Lr+iSEhwAAkhDBTMV/kFY4i
 1+1Ry3goC+VbK7h1LjEr9c/NQzpAB849UCaq0FwG3xB9bhMIki88TCp1a1OTfgo8+c1o
 qEEGhbAFOEK3N9Mgn8ffv6cpFUJHrQH0EP5z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N5dpncXXRn/0gIrGvQkFos2fjDkVU/m0NJWY1swiJVA=;
 b=dxbvr3krcWGfvNadRKQLI0B8AKgnZltyfjtOgGHB2z6bvWT2Q2B1XxrVQI83lVHjDf
 zxuI6JU5OIu6zP+fCZjieMLcvKnJoFwyI1TzbxTsUQwFPt8nJTWyCEPkascQIovZowrx
 V+7+8115cnUZwoDNG/MRIxhBNbB8CjwGv15o9O3vju7WKhLX3xNe/T1pocXQRkHnJjaY
 2kWb8odYUvL0/iJQc3zPVygzadgBWtsGoGPnedhjGh9J/dYt3oDk2kHh6DaWTXfuDkwx
 Knbi5uAFxiFa1Y9VgtSKMVstNQH61JzZmXi+5Fq5rVLiQXAhGM43GxR0QWMpw+iXL0bX
 1IQg==
X-Gm-Message-State: AOAM530a7Af6lx4/dbYR5RwBIQb7SASnicXBVpVRLj+0MRFr4IZFWjBi
 bHxH58wwyWG24LGq9ECtYZX4/Jilo4wP5r6MzreNbfCfgrGVQA==
X-Google-Smtp-Source: ABdhPJxIfeu0KkEa6JaPcj+IubHmB7rkbZ8+H/Bx+YHN3t8g27idteEHfpWzewGcQVzNp7zb3WV7sduFXwWpQ8vzKCw=
X-Received: by 2002:a9d:6414:: with SMTP id h20mr13591213otl.28.1607787575289; 
 Sat, 12 Dec 2020 07:39:35 -0800 (PST)
MIME-Version: 1.0
References: <20201127104930.32692-1-patrick.delaunay@st.com>
 <20201127114927.2.Ida70f4fb1524187703e9240d63e436f8ae5adaab@changeid>
 <CAPnjgZ10epegATj3mBvjh0uLchyt9jGzAPt0KaF=NJ2FVNQHBQ@mail.gmail.com>
 <1606917178506.76711@st.com>
In-Reply-To: <1606917178506.76711@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 12 Dec 2020 08:39:21 -0700
Message-ID: <CAPnjgZ0O_jY2K5XsU+i3sgwn_P0NM41HfTbv6jLF3JBOeQTW_Q@mail.gmail.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Anatolij Gustschin <agust@denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] console: sandbox: remove unnecessary
	sandbox code
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

On Wed, 2 Dec 2020 at 07:08, Patrick DELAUNAY <patrick.delaunay@st.com> wrote:
>
> Hi Simon,
>
> > From: Simon Glass <sjg@chromium.org>
> > Sent: lundi 30 novembre 2020 21:12
> >
> > Hi Patrick,
> >
> > On Fri, 27 Nov 2020 at 03:49, Patrick Delaunay <patrick.delaunay@st.com>
> > wrote:
> > >
> > > Remove the specific sandbox code in console.c, as the config
> > > CONFIG_DEBUG_UART is already supported in drivers/serial/sandbox.c and
> > > activated by default in all sandbox defconfig
> > > (CONFIG_DEBUG_UART_SANDBOX=y and CONFIG_DEBUG_UART=y).
> > >
> > > This patch allows to test the console code under DEBUG_UART in sandbox
> > > and avoids to include the file <os.h> in this u-boot generic code.
> > >
> > > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > > ---
> > >
> > >  common/console.c | 15 ---------------
> > >  1 file changed, 15 deletions(-)
> >
> > Please see this commit as to why I put that code back, after removing it myself.
> >
> > 64e9b4f346f Revert "sandbox: Drop special case console code for sandbox"
> >
> > Regards,
> > Simon
>
> Thanks to point it, I miss this old commit.
>
> I don't understood the issue in the commit message:
>
>     Revert "sandbox: Drop special case console code for sandbox"
>
>     While sandbox works OK without the special-case code, it does result in
>     console output being stored in the pre-console buffer while sandbox starts
>     up. If there is a crash or a problem then there is no indication of what
>     is going on.
>
>     For ease of debugging it seems better to revert this change also.
>
> the existing code (here for putc, but it is the same for puts)  is:
>
> #ifdef CONFIG_SANDBOX
>         /* sandbox can send characters to stdout before it has a console */
>         if (!(gd->flags & GD_FLG_SERIAL_READY)) {
>                 os_putc(c);
>                 return;
>         }
> #endif
> #ifdef CONFIG_DEBUG_UART
>         /* if we don't have a console yet, use the debug UART */
>         if (!(gd->flags & GD_FLG_SERIAL_READY)) {
>                 printch(c);
>                 return;
>         }
> #endif
>
> For sandbox, when CONFIG_DEBUG_UART is activated
>     printch => _printch => _debug_uart_putc => os_putc
>
> For me these 2 code block are identical for sandbox when CONFIG_DEBUG_UART
>
> And the  issue described is also solved by CONFIG_DEBUG_UART=y
> (consle no use preconsole buffer when serial driver s not ready).
>
> Your concern  is when sandbox is compiled without CONFIG_DEBUG_UART ?
>
> Because it is no more the case with my previous patch (I activate it in sandbox*defconfig)
>
> but to avoid issue in futur (new sandbox*defconfig) it should be better to select (or imply)
> his feature for sandbox  arch in Kconfig and not more activate it in sandbox*defconfig ?
>
> PS: with this sandox code, I don't see how to test the pre console buffer in sandbox...
>        I think that the pre console buffer is alway empty for sandbox
>

OK maybe things have changed. Previously I noticed that the banner did
not output until later. I will take another look.

But I don't want to rely on the debug UART for sandbox to work.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
