Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EB6604626
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Oct 2022 15:00:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8062C64101;
	Wed, 19 Oct 2022 13:00:03 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9198FC63326
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Oct 2022 13:00:02 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id l4so17163769plb.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Oct 2022 06:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GUmJYIeBij9aJ6ZNACjKa8PJW8wLh62kab6fQwHXg6o=;
 b=W5QPFwkFUlj5/p1ugZ6jJwYEr94Fi2jROb8ExsKsUPvGH2NQiJJAqA9UuoNSQHRb4o
 J4rOlGQADRyMhT4pW7wrQhoRQyi0zQOY3TIOIUQzPtj7UOb/bu0zsUQV8SGEuWE7Azrc
 bkJBJdJzGbguyPyVfr2yCxSsDVJAGVkSN7p1yJ3bVwow66PlIqaa+QefzAnyXGHvkHRW
 6dJytuBzcFPyQDWal7M6CNCTZSdTjDrHw3+C5zCwzdY3srp/KaCyWXnmeMiftd0FwHyk
 YBvIRc3Ffkk/XZVuI/1gEJOOcDKTqBssMTTFtRR+IVN3Jo/pxLP/jT+J67QWilRU9Gim
 PpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GUmJYIeBij9aJ6ZNACjKa8PJW8wLh62kab6fQwHXg6o=;
 b=2gVL+zv0JQDqTn2eam332K2E383+/VCm2paqsRf6dCTZ/2JmO2IIji6n1qGaSJ9mSJ
 kkfwRcDoDGFNc66PoxwyB14xaSColNInBTBIQwxBzrzawfT/qzzm9VmhYfZYUllZXvEJ
 uTy6mnj0gWnUe46c18jg09mMUpcPJDtPpiZWBdVMqteQeaYocRR9gUi5ZOzUHTo+QO5w
 uXpE1nFrDUOVA8/sVt1tCaLM7w9NUZDcMhRwmp/NhgiRY9X1ME8x8WrzNsDLKHsqeA80
 5ktMsNaoDev4a84ebSxMdbe/e5EaGTxd2RE/xsm2g6JJjvl1DXotlyu8X1Pt29bnYpc8
 md/A==
X-Gm-Message-State: ACrzQf2GmGBSRUOhrXSBzuY8+nNv8wylOKaRNRCMQkDe4EE26WTGvFBu
 nT/xK/n1cSqA0iUHwA5czbXeytHLEVsMax6NDiQ=
X-Google-Smtp-Source: AMsMyM48UVeXTeBBH/QBotLylX49XLFQVPUZ5yCNJw24A1G8gYvuzKOBjrwq0fv+sMw0TMPT7AhdkXOEAaJYGw6DlYY=
X-Received: by 2002:a17:90b:3a90:b0:20d:a54c:e5cb with SMTP id
 om16-20020a17090b3a9000b0020da54ce5cbmr9839231pjb.109.1666184401195; Wed, 19
 Oct 2022 06:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20221018174827.1393211-1-max.oss.09@gmail.com>
 <20221018175726.GO2020586@bill-the-cat>
In-Reply-To: <20221018175726.GO2020586@bill-the-cat>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Wed, 19 Oct 2022 14:59:49 +0200
Message-ID: <CAEHkU3WyAvVb3Bqu6KrmrrhD9frXszFipWbsdxKoMkz=bNSmzQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, u-boot@lists.denx.de,
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

Hi Tom

On Tue, Oct 18, 2022 at 7:57 PM Tom Rini <trini@konsulko.com> wrote:
>
> On Tue, Oct 18, 2022 at 07:48:27PM +0200, Max Krummenacher wrote:
> > From: Max Krummenacher <max.krummenacher@toradex.com>
> >
> > With LTO enabled the U-Boot initial environment is no longer stored
> > in an easy accessible section in env/common.o. I.e. the section name
> > changes from build to build, its content maybe compressed and it is
> > annotated with additional data.
> >
> > For GCC adding the option '-ffat-lto-objects' when compiling common.o
> > adds additionally the traditional sections in the object file and
> > 'make u-boot-initial-env' would work also for the LTO enabled case.
> > However clang doesn't have that option.
> >
> > Fix this by recompiling common.o into a object file only used for
> > the creation of u-boot-initial-env if LTO is enabled.
> >
> > See also:
> > https://lore.kernel.org/all/927b122e-1f62-e790-f5ca-30bae4332c77@foss.st.com/
> >
> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> >
> > ---
> >
> >  Makefile | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Makefile b/Makefile
> > index 3866cc62f9a..cd45c720d23 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -2451,9 +2451,17 @@ endif
> >       $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
> >
> >  quiet_cmd_genenv = GENENV  $@
> > +ifeq ($(LTO_ENABLE),y)
> > +cmd_genenv = $(CC) $(filter-out $(LTO_CFLAGS),$(c_flags)) -c -o env/initial_env.o env/common.c; \
> > +     $(OBJCOPY) --dump-section .rodata.default_environment=$@ env/initial_env.o; \
> > +     sed --in-place -e 's/\x00/\x0A/g' $@; sed --in-place -e '/^\s*$$/d' $@; \
> > +     sort --field-separator== -k1,1 --stable $@ -o $@; \
> > +     rm -f env/initial_env.o env/initial_env.su
> > +else
> >  cmd_genenv = $(OBJCOPY) --dump-section .rodata.default_environment=$@ env/common.o; \
> >       sed --in-place -e 's/\x00/\x0A/g' $@; sed --in-place -e '/^\s*$$/d' $@; \
> >       sort --field-separator== -k1,1 --stable $@ -o $@
> > +endif
> >
> >  u-boot-initial-env: u-boot.bin
> >       $(call if_changed,genenv)
>
> Can we pipe the output instead of making a new object file? Maybe not,
> in a portable way it seems. But, I'm not sure the above respects using
> O= as well so that does need to be checked and fixed if so.

While I didn't test it seems that objcopy doesn't allow to pipe data in and out
of it.

Max
>
> --
> Tom
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
