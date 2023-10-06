Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7201C7BB87D
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Oct 2023 15:03:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AF51C6C837;
	Fri,  6 Oct 2023 13:03:31 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67AABC65E4F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Oct 2023 13:03:29 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-9b29186e20aso368642366b.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Oct 2023 06:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696597409; x=1697202209;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o/JPOr2EqDUQM49u6dbgaPw7+SEsD5mpv/t+LN5fpzs=;
 b=K96LKUz9UgWbRP/OMqR0BAic+9Tvsgh5AD7P0AmM2wP2O4ljEqyFuYAEuxPhHqGbe7
 FgAYoCqAjLCDb7eKQDwFYFXDi/Ff+rDtkIP4zCYnPpW0u8MsBDOE+qXNRErQm+PaB2CM
 7VJgZdC5FubaTUCaaAK67CFxbrya9fh/5Vdmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696597409; x=1697202209;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o/JPOr2EqDUQM49u6dbgaPw7+SEsD5mpv/t+LN5fpzs=;
 b=A/faKavjOR9hvh2evEHH0SMHkwo9roLmEI2nABQ06KD3XOoYcFLuiytKcVzoACKZTR
 8DpbAlFnhzeBAAxyh55fSooWorFLkI+TYs+2x5fzNzteqxh/IeVZh6tO9i+GTBXrkmUx
 5s0c5BXYRR1xRqcB1kUBDX0Xt0H1X/d1SoB9ZzZV3B0qL+vMmorobDWaEcpxYuRxp7GY
 hKpt0POaK5K8bWTcnp8Cj/fVGQli9wtZqaAqOTvBjpwFNo06sfTTuoD6O7AzTHUjXtS8
 9YbvVB0xrv5PpZBgCoEdInzaWeCnFgaydjWcHpWUTu1ZCs+Gk2g4qC5eH6QFd+GvtEM5
 IsWw==
X-Gm-Message-State: AOJu0YxIcrfwb9/PBXGzZhX4p7JT0pgs14JzBHwe2DclsCzPh+BKUAp/
 FSj84vtaacPSB/we3+gW/Pv+Ecndi3UKs0VZ1ftSXg==
X-Google-Smtp-Source: AGHT+IGtqZu8SDbFEtGE9f1ENtOokt6WHyur7UN84zjr+6kBER+tqboUKjlTTEPU9ZNNdGywO0HwmA3ncOkiVb+YOmo=
X-Received: by 2002:a17:906:2257:b0:9a1:680e:8c54 with SMTP id
 23-20020a170906225700b009a1680e8c54mr7785984ejr.71.1696597408529; Fri, 06 Oct
 2023 06:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230924203953.1829820-1-sjg@chromium.org>
 <20230924203953.1829820-6-sjg@chromium.org>
 <20230924232658.GM305624@bill-the-cat>
 <CAPnjgZ2-ORog-+Onh1McptpMDrzccVc+BfByCMjp93wLqAms6w@mail.gmail.com>
 <20231005145350.GQ8465@bill-the-cat>
 <CAPnjgZ2Mbx9H_ve_F_gq_eqt2hvwmYF455-0PHB31fV5m9HN2A@mail.gmail.com>
 <20231006021616.GB2227687@bill-the-cat>
In-Reply-To: <20231006021616.GB2227687@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 6 Oct 2023 07:03:17 -0600
Message-ID: <CAPnjgZ3sTQNQJCpuZ4doJJH=t=mLxXaAYQR8kVXorOfqn2t5CA@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Peng Fan <peng.fan@nxp.com>, Michal Suchanek <msuchanek@suse.de>,
 Leo <ycliang@andestech.com>, Stefan Roese <sr@denx.de>,
 Rick Chen <rick@andestech.com>, uboot-stm32@st-md-mailman.stormreply.com,
 U-Boot Mailing List <u-boot@lists.denx.de>, Michael Walle <michael@walle.cc>,
 Stefano Babic <sbabic@denx.de>, "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 05/25] treewide: Correct use of long help
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

On Thu, 5 Oct 2023 at 20:16, Tom Rini <trini@konsulko.com> wrote:
>
> On Thu, Oct 05, 2023 at 07:41:49PM -0600, Simon Glass wrote:
> > Hi Tom,
> >
> > On Thu, 5 Oct 2023 at 08:53, Tom Rini <trini@konsulko.com> wrote:
> > >
> > > On Wed, Oct 04, 2023 at 07:23:47PM -0600, Simon Glass wrote:
> > > > Hi Tom,
> > > >
> > > > On Sun, 24 Sept 2023 at 17:27, Tom Rini <trini@konsulko.com> wrote:
> > > > >
> > > > > On Sun, Sep 24, 2023 at 02:39:23PM -0600, Simon Glass wrote:
> > > > > > Some commands assume that CONFIG_SYS_LONGHELP is always defined.
> > > > > > Declaration of long help should be bracketed by an #ifdef to avoid an
> > > > > > 'unused variable' warning.
> > > > > >
> > > > > > Fix this treewide.
> > > > > >
> > > > > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > > > [snip]
> > > > > > diff --git a/arch/arm/mach-imx/cmd_dek.c b/arch/arm/mach-imx/cmd_dek.c
> > > > > > index 6fa5b41fcd38..25ea7d3b37da 100644
> > > > > > --- a/arch/arm/mach-imx/cmd_dek.c
> > > > > > +++ b/arch/arm/mach-imx/cmd_dek.c
> > > > > > @@ -393,11 +393,12 @@ static int do_dek_blob(struct cmd_tbl *cmdtp, int flag, int argc,
> > > > > >       return blob_encap_dek(src_addr, dst_addr, len);
> > > > > >  }
> > > > > >
> > > > > > -/***************************************************/
> > > > > > +#if IS_ENABLED(CONFIG_SYS_LONGHELP)
> > > > > >  static char dek_blob_help_text[] =
> > > > > >       "src dst len            - Encapsulate and create blob of data\n"
> > > > > >       "                         $len bits long at address $src and\n"
> > > > > >       "                         store the result at address $dst.\n";
> > > > > > +#endif
> > > > > >
> > > > > >  U_BOOT_CMD(
> > > > > >       dek_blob, 4, 1, do_dek_blob,
> > > > >
> > > > > This really doesn't read nicely.  I would rather (globally and fix
> > > > > existing users) __maybe_unused this instead.  I think there's just one
> > > > > example today that isn't "foo_help_text".
> > > >
> > > > Hmm, what do you think about adding a __longhelp symbol to cause the
> > > > linker to discard it when not needed?
> > >
> > > Well, I don't think we need linker list magic when __maybe_unused will
> > > just have them be discarded normally.
> >
> > Yes, perhaps things are in a better state than they used to be, but
> > there is a linker discard for commands at present.
>
> Yes, but __maybe_unused means we don't get a warning about it, and it's
> literally discarded as part of --gc-sections as it done everywhere with
> maybe 3 exceptions?

Actually with this series we get a lot closer to that. The problem
with the status quo is that disabling CMDLINE doesn't disable most
commands, relying instead on discarding them at link time.

With this series, it looks like we can in fact do that, so I should
remove the discards as well.

The one proviso is that this does drop a lot of things we want...e.g.
BOOTSTD_DEFAULTS cannot be enabled due to its use of 'select', meaning
that common filesystems are dropped. So we'll need more effort after
this, to allow (for example) bootmeths that don't need commands to
work correctly. But I think this series at least provides a better
starting point for teasing things apart.

So OK I'll go with __maybe_unused for the ones that need it, which
isn't too many given that many of the strings are just included
directly in the macro. It is considerably easier than trying to be to
clever about things.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
