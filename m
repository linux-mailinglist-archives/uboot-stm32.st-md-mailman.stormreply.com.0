Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C33BB7BC244
	for <lists+uboot-stm32@lfdr.de>; Sat,  7 Oct 2023 00:42:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72FABC6C837;
	Fri,  6 Oct 2023 22:42:57 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37D3AC6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Oct 2023 22:42:56 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-9ae75ece209so495819366b.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Oct 2023 15:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696632175; x=1697236975;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gyR5sV5GMYvjytTrl0n0bTviimCSK3SbnVT9yfcYBjQ=;
 b=W9c4FbuB4mSTLsRV4YLwjHYtYnqFdf9k0+4UwkxEMMPblGUJbEr0vg0qn9X8x87VCu
 kboE4ZlPfD7iu3eDtH0OSqnOY9mj9iLWf53g+WHIFwI5IR8ita+B6NXoKyljBVPrqss9
 qjhZA94CWKddOWZ5PwucbdIHu/UTlYVZCl+74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696632175; x=1697236975;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gyR5sV5GMYvjytTrl0n0bTviimCSK3SbnVT9yfcYBjQ=;
 b=lvtPYFEg3m2zqIaAgVeHTgDslBYMNItW4LS0UvmZde6Hj7ZapoaytmOOhhV44sMtOg
 DP2iew3s+uvj2NiC/FgKortEjE8j7j+MADqgd9lxHWiXa/HpVI6kGF76mWf7kYAQtmtF
 rHcrsAInT164nNjPhhuHcGodsbBx2yLjuFca47UhVdoStzvR+UqhdYxjrbSa705+qDZm
 rk9KP8nZpaAErmzmKgAX9e27jC9d8a62h1ZIZAen28ZYvNCuh4Fqu9TDcGLEXy+7jg3v
 Pf9wJNKBCAPpoVMsujsz69iePmFuhl8fsjIS2C+HiwcLO8uNn8hYIi/45hQCZHava9Tw
 1adw==
X-Gm-Message-State: AOJu0YxePTwuaCKHrSSMuqi2yptUJQgBjraklOF4QadNP5UGvUiV46Av
 F74sVExIUPrq6+LAzJFBMzj04SPbM6Pq4vh6Mqag4g==
X-Google-Smtp-Source: AGHT+IG6z2Qgpv5CAIdZTG0sTKtGt1xIeTIEfnKCDdbQPNQ36Na6n5QJJRusE8Ys4KcsTz/ZY8F4R5P9621Fzh5yf/8=
X-Received: by 2002:a17:906:1097:b0:9ad:7890:b4c0 with SMTP id
 u23-20020a170906109700b009ad7890b4c0mr7445670eju.56.1696632175274; Fri, 06
 Oct 2023 15:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230924203953.1829820-1-sjg@chromium.org>
 <20230924203953.1829820-6-sjg@chromium.org>
 <20230924232658.GM305624@bill-the-cat>
 <CAPnjgZ2-ORog-+Onh1McptpMDrzccVc+BfByCMjp93wLqAms6w@mail.gmail.com>
 <20231005145350.GQ8465@bill-the-cat>
 <CAPnjgZ2Mbx9H_ve_F_gq_eqt2hvwmYF455-0PHB31fV5m9HN2A@mail.gmail.com>
 <20231006021616.GB2227687@bill-the-cat>
 <CAPnjgZ3sTQNQJCpuZ4doJJH=t=mLxXaAYQR8kVXorOfqn2t5CA@mail.gmail.com>
 <20231006165504.GC2227687@bill-the-cat>
In-Reply-To: <20231006165504.GC2227687@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 6 Oct 2023 16:42:44 -0600
Message-ID: <CAPnjgZ1GZ+Ryt2=_Sf0Z+XM+V58Ty4UmdrAo2bW-Ubs9s19=Ww@mail.gmail.com>
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

On Fri, 6 Oct 2023 at 10:55, Tom Rini <trini@konsulko.com> wrote:
>
> On Fri, Oct 06, 2023 at 07:03:17AM -0600, Simon Glass wrote:
> > Hi Tom,
> >
> > On Thu, 5 Oct 2023 at 20:16, Tom Rini <trini@konsulko.com> wrote:
> > >
> > > On Thu, Oct 05, 2023 at 07:41:49PM -0600, Simon Glass wrote:
> > > > Hi Tom,
> > > >
> > > > On Thu, 5 Oct 2023 at 08:53, Tom Rini <trini@konsulko.com> wrote:
> > > > >
> > > > > On Wed, Oct 04, 2023 at 07:23:47PM -0600, Simon Glass wrote:
> > > > > > Hi Tom,
> > > > > >
> > > > > > On Sun, 24 Sept 2023 at 17:27, Tom Rini <trini@konsulko.com> wrote:
> > > > > > >
> > > > > > > On Sun, Sep 24, 2023 at 02:39:23PM -0600, Simon Glass wrote:
> > > > > > > > Some commands assume that CONFIG_SYS_LONGHELP is always defined.
> > > > > > > > Declaration of long help should be bracketed by an #ifdef to avoid an
> > > > > > > > 'unused variable' warning.
> > > > > > > >
> > > > > > > > Fix this treewide.
> > > > > > > >
> > > > > > > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > > > > > [snip]
> > > > > > > > diff --git a/arch/arm/mach-imx/cmd_dek.c b/arch/arm/mach-imx/cmd_dek.c
> > > > > > > > index 6fa5b41fcd38..25ea7d3b37da 100644
> > > > > > > > --- a/arch/arm/mach-imx/cmd_dek.c
> > > > > > > > +++ b/arch/arm/mach-imx/cmd_dek.c
> > > > > > > > @@ -393,11 +393,12 @@ static int do_dek_blob(struct cmd_tbl *cmdtp, int flag, int argc,
> > > > > > > >       return blob_encap_dek(src_addr, dst_addr, len);
> > > > > > > >  }
> > > > > > > >
> > > > > > > > -/***************************************************/
> > > > > > > > +#if IS_ENABLED(CONFIG_SYS_LONGHELP)
> > > > > > > >  static char dek_blob_help_text[] =
> > > > > > > >       "src dst len            - Encapsulate and create blob of data\n"
> > > > > > > >       "                         $len bits long at address $src and\n"
> > > > > > > >       "                         store the result at address $dst.\n";
> > > > > > > > +#endif
> > > > > > > >
> > > > > > > >  U_BOOT_CMD(
> > > > > > > >       dek_blob, 4, 1, do_dek_blob,
> > > > > > >
> > > > > > > This really doesn't read nicely.  I would rather (globally and fix
> > > > > > > existing users) __maybe_unused this instead.  I think there's just one
> > > > > > > example today that isn't "foo_help_text".
> > > > > >
> > > > > > Hmm, what do you think about adding a __longhelp symbol to cause the
> > > > > > linker to discard it when not needed?
> > > > >
> > > > > Well, I don't think we need linker list magic when __maybe_unused will
> > > > > just have them be discarded normally.
> > > >
> > > > Yes, perhaps things are in a better state than they used to be, but
> > > > there is a linker discard for commands at present.
> > >
> > > Yes, but __maybe_unused means we don't get a warning about it, and it's
> > > literally discarded as part of --gc-sections as it done everywhere with
> > > maybe 3 exceptions?
> >
> > Actually with this series we get a lot closer to that. The problem
> > with the status quo is that disabling CMDLINE doesn't disable most
> > commands, relying instead on discarding them at link time.
>
> I don't follow you here.  We're talking only about the long help.

I was actually talking about how the command code is removed. This
series allows that to happen via Kconfig rather than needing a
linker-script discard rule, something I only just fully appreciated.

> There's already an option to enable/disable it.  When disabled all of
> the long help text should be discarded, because we reference it via
> U_BOOT_CMD macro which in turn cares about it, or not.  What's missing
> is a U_BOOT_LONGHELP macro so that instead of:
> #ifdef CONFIG_SYS_LONGHELP
> static char cat_help_text[] =
>         "<interface> <dev[:part]> <file>\n"
>         "  - Print file from 'dev' on 'interface' to standard output\n";
> #endif
>
> We do:
> U_BOOT_LONGHELP(cat,
>         "<interface> <dev[:part]> <file>\n"
>         "  - Print file from 'dev' on 'interface' to standard output\n"
> );
>
> Which then does:
> static __maybe_unused char cat_help_text[] =
> ...
> ;
>
> And we discard the text automatically due to --gc-sections.  We possibly
> haven't already been doing this since back when we first started using
> --gc-sections there was a bug in binutils that caused text like the
> above to still get combined in to other objects and not discarded.
> That's been fixed for ages.
>
> And the above macro would also let us clean up U_BOOT_CMD macro slightly
> to just omit the longhelp option and instead always do _CMD_HELP(_name)
> inside the macros.  It'll also make it harder to add new commands
> without a long help by accident.

Gosh this is complicated.

At present the U_BOOT_CMD() macro just drops the strings...the problem
with the unused var only happens in a small number of cases where an
explicit var is used. I don't see why creating a var (when none is
there today) helps anything? It doesn't detect missing longhelp, since
this is already an error (missing argument). Sure,  "" can be
provided, but your macro doesn't stop that either.

If you are suggesting a new U_BOOT_LONGHELP() macro, bear in mind that
we already have quite a lot...each new 'top-level' macro results in
more combinations.

>
> > With this series, it looks like we can in fact do that, so I should
> > remove the discards as well.
> >
> > The one proviso is that this does drop a lot of things we want...e.g.
> > BOOTSTD_DEFAULTS cannot be enabled due to its use of 'select', meaning
> > that common filesystems are dropped. So we'll need more effort after
> > this, to allow (for example) bootmeths that don't need commands to
> > work correctly. But I think this series at least provides a better
> > starting point for teasing things apart.
> >
> > So OK I'll go with __maybe_unused for the ones that need it, which
> > isn't too many given that many of the strings are just included
> > directly in the macro. It is considerably easier than trying to be to
> > clever about things.
>
> Yes, this series itself has a lot of problems that need to be addressed
> before reposting because I don't like "hiding" that network stuff no
> longer works, and I also saw that DFU also silently failing.

Yes I saw your other comments. But I think this patch is the big area
of confusion.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
