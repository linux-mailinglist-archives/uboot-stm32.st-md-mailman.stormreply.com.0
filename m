Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC97693B05
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Feb 2023 00:14:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C3B7C69067;
	Sun, 12 Feb 2023 23:14:23 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 242BDC69066
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Feb 2023 23:14:22 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id sa10so27807207ejc.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Feb 2023 15:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8n3BFwsko4Vvfd3UgtpeEme6Tg3aXwb3qLd9waldE9w=;
 b=KadPwlmLW7oKF5JM340iPBziHT+4Z/c2jGbtLWUk/0B1svxS8LP63KrCGZHT03nbSR
 nknOeUDcCdzA9+WUF1JGHPiuy5uRAI6l5Y9EH7qdE1If92KqGF4UjZCFWy64Bi4ds7Bm
 4OepyCzwRW1gaiVzvcTynsQmhelhPB5l9wxbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8n3BFwsko4Vvfd3UgtpeEme6Tg3aXwb3qLd9waldE9w=;
 b=n57v89YmfnysJUavjkkJ4V84sdwouHNEWH4zZLRUN3tEsTyqMMV36GJtMWZNtMNnBR
 tf5cMfzbbkbNvRwOyRtfcLc/vnjhAhP6ILlzLyTfv99bhtJsR/LB0dYGOhzSVKbLNwXA
 pFvC4hYfV1nCGqOiV28k45a2wYLyY5RhUqWmADUjHsWVqz3gbPLoYq5011QqTLCP0CFf
 eBnOct0TxnTdI4gjZ1Q8FnZH1+9MxJu6ENTVzOP4vcrp8n5ycKqooEhyHdOWqMvjuvBa
 +rKUs4fTDdaK4McZeSVIxhyY+RulFpT0MCIXJlgValOrRgO64wubp8bqpFiIzaP0jF4M
 m1xQ==
X-Gm-Message-State: AO0yUKUDcbngYnOEIC7b+X213yTCeBO8p64jkiwqFfVeV/VgMzVl/Z37
 5hlJipR7YugkLDC724thOiCSbqJFxSHF39zlpDjEyqzERmDMHXq9
X-Google-Smtp-Source: AK7set8ZqmR7jC6qwsfRwwdlu0ZIDSdbGfdfe1PDenhwrG02t4q+mbnIpyTIzW9r4oQm5OGH1fwFgkqMyPZqTvOnQQ4=
X-Received: by 2002:a17:906:393:b0:8ae:1078:722f with SMTP id
 b19-20020a170906039300b008ae1078722fmr3867616eja.9.1676243661449; Sun, 12 Feb
 2023 15:14:21 -0800 (PST)
MIME-Version: 1.0
References: <20230205224118.233425-63-sjg@chromium.org>
 <20230205224118.233425-65-sjg@chromium.org>
 <Y+UyRnQI9TS4MLiP@bill-the-cat>
In-Reply-To: <Y+UyRnQI9TS4MLiP@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 12 Feb 2023 16:14:10 -0700
Message-ID: <CAPnjgZ374vg50pzgWhDGBULa4qZyANtpoJSt6t3bDUJ9-fp-rQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v2 064/169] Correct SPL uses of DFU_VIRT
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

Hi Tom,

On Thu, 9 Feb 2023 at 10:50, Tom Rini <trini@konsulko.com> wrote:
>
> On Sun, Feb 05, 2023 at 03:39:33PM -0700, Simon Glass wrote:
> > This converts 3 usages of this option to the non-SPL form, since there is
> > no SPL_DFU_VIRT defined in Kconfig
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> > (no changes since v1)
> >
> >  board/st/common/stm32mp_dfu.c | 2 +-
> >  drivers/dfu/Makefile          | 2 +-
> >  include/dfu.h                 | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/board/st/common/stm32mp_dfu.c b/board/st/common/stm32mp_dfu.c
> > index 0096f71dfc1..19e9c3b2402 100644
> > --- a/board/st/common/stm32mp_dfu.c
> > +++ b/board/st/common/stm32mp_dfu.c
> > @@ -159,7 +159,7 @@ void set_dfu_alt_info(char *interface, char *devstr)
> >       puts("DFU alt info setting: done\n");
> >  }
> >
> > -#if CONFIG_IS_ENABLED(DFU_VIRT)
> > +#if IS_ENABLED(CONFIG_DFU_VIRT)
> >  #include <dfu.h>
> >  #include <power/stpmic1.h>
> >
> > diff --git a/drivers/dfu/Makefile b/drivers/dfu/Makefile
> > index dfbf64da667..df88f4be59a 100644
> > --- a/drivers/dfu/Makefile
> > +++ b/drivers/dfu/Makefile
> > @@ -10,4 +10,4 @@ obj-$(CONFIG_$(SPL_)DFU_NAND) += dfu_nand.o
> >  obj-$(CONFIG_$(SPL_)DFU_RAM) += dfu_ram.o
> >  obj-$(CONFIG_$(SPL_)DFU_SF) += dfu_sf.o
> >  obj-$(CONFIG_$(SPL_)DFU_WRITE_ALT) += dfu_alt.o
> > -obj-$(CONFIG_$(SPL_)DFU_VIRT) += dfu_virt.o
> > +obj-$(CONFIG_DFU_VIRT) += dfu_virt.o
> > diff --git a/include/dfu.h b/include/dfu.h
> > index 07922224ef1..06efbf4b208 100644
> > --- a/include/dfu.h
> > +++ b/include/dfu.h
> > @@ -495,7 +495,7 @@ static inline int dfu_fill_entity_mtd(struct dfu_entity *dfu, char *devstr,
> >  }
> >  #endif
> >
> > -#if CONFIG_IS_ENABLED(DFU_VIRT)
> > +#if IS_ENABLED(CONFIG_DFU_VIRT)
> >  int dfu_fill_entity_virt(struct dfu_entity *dfu, char *devstr,
> >                        char **argv, int argc);
> >  int dfu_write_medium_virt(struct dfu_entity *dfu, u64 offset,
>
> This is I believe an intentional usage.

I'll add this to config_nospl

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
