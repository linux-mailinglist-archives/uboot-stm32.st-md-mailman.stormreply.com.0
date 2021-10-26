Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A99643AABE
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Oct 2021 05:29:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B10FCC57182;
	Tue, 26 Oct 2021 03:29:45 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FEDCC0614D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Oct 2021 03:29:43 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id e2so26388151uax.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Oct 2021 20:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+b0T5ASV9OMNfMo2u0lTyoXTEe5rqUyrHqevBvBiJVI=;
 b=n6crB90y7GgfWqpx2DNmcQAJSzOEJH1c0gjyzOaiG1JaWRIHZdZaZMbHODuPIM/fST
 8te4XvK7WME2zH7VjYw91LnVqhPOwnfZWyMvPyjkyfwbL5zDYDkDH6guTUEB7lmcMplw
 VefLyq5+Hi006ktjM8T/wp67Bxq1n9/KoTQ/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+b0T5ASV9OMNfMo2u0lTyoXTEe5rqUyrHqevBvBiJVI=;
 b=x3y5nuzEJ/PeuHLW6vpvKU4o0fr5mVAVNXSv/8FM2uP+Z+4XkJ9oefaG0eAPrmEMV9
 Rak2VoL0izJHT9g+R2mFvspHc6c+EYpGyEE9/oVxWreys0adL9htyT0qpAe9Xra5A6dM
 XZ7jESarqbVPx+SekCnworPHIGwqA8OyhzhHNIESN3A6aCU0Zjf6l42sizr1JH+on0Oz
 uoqp+7ag21LGIWz4H6siKF9QoGJnYphMo1EFEW5eIVwtMs40m+Z2A+pRJE9Y2wlubzsF
 xd85O68UM+rtzi7hAHYB3S5DTonrAcvszlJ9Saj4EaMo8t0Qvy8YYDH92vM3l+OIBDPw
 Q7Lw==
X-Gm-Message-State: AOAM531VtS7bMEQzTFh4uL9iK2Ot3IIhE/5qrVNKgN5cJr95DIgUAApj
 M4vhgrEdHF6lK8IyMd+4pAoUFS+WBAIZiOqU8Xr/nQ==
X-Google-Smtp-Source: ABdhPJzYDndtgqoTqAQ7r1qIn62s7R3cyjMXVMCt7Lp0wDayF7qoKNYZ17GEHKruU/vK6QM+Z6elrgFjnykEeMjfb9Q=
X-Received: by 2002:a67:f909:: with SMTP id t9mr923621vsq.8.1635218981800;
 Mon, 25 Oct 2021 20:29:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
 <20211004115942.6.Ia3825658ff431b2f6ff143ee01c2d44d24219558@changeid>
 <CAPnjgZ1CEK4QUVTEZ9YP7wKs5RrdVLLmyhpkwFz=exvaaMUHKA@mail.gmail.com>
 <dedad256-8e72-6e70-f5ba-88fd7e27fa3a@foss.st.com>
In-Reply-To: <dedad256-8e72-6e70-f5ba-88fd7e27fa3a@foss.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 25 Oct 2021 21:29:29 -0600
Message-ID: <CAPnjgZ0sBtm63+bWAywEQaLAR2rkjMfYf2SnBikkr43cz+6R4A@mail.gmail.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Stefan Roese <sr@denx.de>,
 Priyanka Jain <priyanka.jain@nxp.com>
Subject: Re: [Uboot-stm32] [PATCH 6/6] scripts: remove CONFIG_IS_ENABLED in
	config_whitelist.txt
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

On Fri, 22 Oct 2021 at 11:13, Patrick DELAUNAY
<patrick.delaunay@foss.st.com> wrote:
>
> Hi Simon
>
> On 10/14/21 5:09 PM, Simon Glass wrote:
> > Hi Patrick,
> >
> > On Mon, 4 Oct 2021 at 04:00, Patrick Delaunay
> > <patrick.delaunay@foss.st.com> wrote:
> >> Redefine the macro CONFIG_IS_ENABLED is not allowed,
> >> so this entry can be removed in whitelist file.
> >>
> >> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> >> ---
> >>
> >>   scripts/config_whitelist.txt | 1 -
> >>   1 file changed, 1 deletion(-)
> >>
> >> diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
> >> index b3ebd20c57..41a0952c97 100644
> >> --- a/scripts/config_whitelist.txt
> >> +++ b/scripts/config_whitelist.txt
> >> @@ -649,7 +649,6 @@ CONFIG_IRAM_SIZE
> >>   CONFIG_IRAM_STACK
> >>   CONFIG_IRAM_TOP
> >>   CONFIG_IRDA_BASE
> >> -CONFIG_IS_ENABLED
> >>   CONFIG_JFFS2_DEV
> >>   CONFIG_JFFS2_LZO
> >>   CONFIG_JFFS2_NAND
> >> --
> >> 2.25.1
> >>
> > For this to work you need to actually remove it from the source tree
> > (which we can't), otherwise you get:
> >
> > Error: You must add new CONFIG options using Kconfig
> > The following new ad-hoc CONFIG options were detected:
> > CONFIG_IS_ENABLED
> >
> > I don't think this is worth it though, so I suggest dropping this patch.
> >
> > Regards,
> > Simon
>
>
> Yes ! sorry
>
> CONFIG_IS_ENABLED is present in u-boot.cfg,
>
> as CONFIG_VAL
>
>
> even if it is strange for these macro defined in "linux/kconfig.h"
>
> but agree to drop this tentative.
>
>
> Do you think I can remove the CONFIG_IS_ENABLED and CONFIG_VAL
>
> in u-boot.cfg when the file is generated ?

If you like.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
