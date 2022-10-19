Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BD5604DE3
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Oct 2022 18:56:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E106C64101;
	Wed, 19 Oct 2022 16:56:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B25FC63326
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Oct 2022 16:56:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4CC3161932;
 Wed, 19 Oct 2022 16:56:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB92C433C1;
 Wed, 19 Oct 2022 16:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666198575;
 bh=u2Kl+DunR/CbPCAgm/JJPQWOlbO9iEpQTCCLPwgF0Bk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QtmGfQPUiNpw/I1XUu2C118P9edwvZ8Uv9T1SYXErzDi7KRerAz/hB3VvN92n0ENH
 qMreBlFt0dzA9twKqfMSllyRQv8NIi4mDVLycl5rmyV/5LZ9CTbp7uNLdx0dpiqBPz
 HQCcnVVpf7tEty6adEN4Lud8azBHmhrAYoO4rXJBn4JI8VriPU9QjdUR6CddsvW+AR
 b3IjZqHlJUndd9PtW/nJzPWSUDFuFldfwsBAeHNmZnryRJ1jWbxlrJCLCKwcUOcjEC
 5XwpSE5L1aSjY+K5yRUtwagL9QrNPTEYf3xr1wST46S4AHMdXWLrCiVSjdYRw4ETZ3
 KsfasDXpmGjQQ==
Received: by pali.im (Postfix)
 id 710AA3AC; Wed, 19 Oct 2022 18:56:12 +0200 (CEST)
Date: Wed, 19 Oct 2022 18:56:12 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Max Krummenacher <max.oss.09@gmail.com>
Message-ID: <20221019165612.nilrbyqi5zudjpup@pali>
References: <20221018174827.1393211-1-max.oss.09@gmail.com>
 <20221018175726.GO2020586@bill-the-cat>
 <CAEHkU3WyAvVb3Bqu6KrmrrhD9frXszFipWbsdxKoMkz=bNSmzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEHkU3WyAvVb3Bqu6KrmrrhD9frXszFipWbsdxKoMkz=bNSmzQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
 Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Adam Ford <aford173@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] Makefile: fix u-boot-initial-env target
	if lto is enabled
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

On Wednesday 19 October 2022 14:59:49 Max Krummenacher wrote:
> Hi Tom
> 
> On Tue, Oct 18, 2022 at 7:57 PM Tom Rini <trini@konsulko.com> wrote:
> >
> > On Tue, Oct 18, 2022 at 07:48:27PM +0200, Max Krummenacher wrote:
> > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > >
> > > With LTO enabled the U-Boot initial environment is no longer stored
> > > in an easy accessible section in env/common.o. I.e. the section name
> > > changes from build to build, its content maybe compressed and it is
> > > annotated with additional data.
> > >
> > > For GCC adding the option '-ffat-lto-objects' when compiling common.o
> > > adds additionally the traditional sections in the object file and
> > > 'make u-boot-initial-env' would work also for the LTO enabled case.
> > > However clang doesn't have that option.
> > >
> > > Fix this by recompiling common.o into a object file only used for
> > > the creation of u-boot-initial-env if LTO is enabled.
> > >
> > > See also:
> > > https://lore.kernel.org/all/927b122e-1f62-e790-f5ca-30bae4332c77@foss.st.com/
> > >
> > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > >
> > > ---
> > >
> > >  Makefile | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 3866cc62f9a..cd45c720d23 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -2451,9 +2451,17 @@ endif
> > >       $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
> > >
> > >  quiet_cmd_genenv = GENENV  $@
> > > +ifeq ($(LTO_ENABLE),y)
> > > +cmd_genenv = $(CC) $(filter-out $(LTO_CFLAGS),$(c_flags)) -c -o env/initial_env.o env/common.c; \
> > > +     $(OBJCOPY) --dump-section .rodata.default_environment=$@ env/initial_env.o; \
> > > +     sed --in-place -e 's/\x00/\x0A/g' $@; sed --in-place -e '/^\s*$$/d' $@; \
> > > +     sort --field-separator== -k1,1 --stable $@ -o $@; \
> > > +     rm -f env/initial_env.o env/initial_env.su
> > > +else
> > >  cmd_genenv = $(OBJCOPY) --dump-section .rodata.default_environment=$@ env/common.o; \
> > >       sed --in-place -e 's/\x00/\x0A/g' $@; sed --in-place -e '/^\s*$$/d' $@; \
> > >       sort --field-separator== -k1,1 --stable $@ -o $@
> > > +endif
> > >
> > >  u-boot-initial-env: u-boot.bin
> > >       $(call if_changed,genenv)
> >
> > Can we pipe the output instead of making a new object file? Maybe not,
> > in a portable way it seems. But, I'm not sure the above respects using
> > O= as well so that does need to be checked and fixed if so.
> 
> While I didn't test it seems that objcopy doesn't allow to pipe data in and out
> of it.

I think it should be easier to compile a new application which includes
header file with env data and prints it to stdout. There are already
host tools like mkimage which are run during u-boot build process, so
adding a new simple host tool should not be a problem -- instead of
trying to hack objcopy, or try to find a way how to play with its
input/output redirection and symbol names to achieve same thing.

> Max
> >
> > --
> > Tom
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
