Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C87278F33F
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Aug 2023 21:22:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0DB8C6A615;
	Thu, 31 Aug 2023 19:22:37 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82699C65E58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Aug 2023 19:22:36 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-3a7f4f7a8easo453125b6e.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Aug 2023 12:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693509755; x=1694114555;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UvLfMTBucLdet7oQiR81Xb2Fls8plPgDgKEB2tWL1bY=;
 b=eO8FgGl2KZ83E6HL3QwsZomADhta+HLZbQsyeZ2ngASS6r41NstnLxdgfUMLhu2nLJ
 MM/OR0PwldErcEa8YgKpwvZm1T8ffUqukmWwG1gdhEbotJvO5nDSdQhD1LurPYb/+zZo
 pPaDUTg0KhydUACeScIycQGfiASyA9XA7/VEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693509755; x=1694114555;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UvLfMTBucLdet7oQiR81Xb2Fls8plPgDgKEB2tWL1bY=;
 b=QdGUGpenzFxhWDE43xCCHKs9YWw/RUes36kEPHui6SyulLM9cCFcL07TQHn7gp8k0G
 zDK6Bt5nIZgsFF/3J0HzJ2fhfLqsHRDopeppjeXgJC3I2+7QVbifz5sIyKNq6WCqNGUt
 3f/kzksZnbXJivEcFTyL6R1vf51v6U4fb2u+08g5Nd70VTa5hT2NIXYR6iUXAlgjD1mQ
 EhIW5sb907ZXf3nz6NpPupNfWGq0yHrRKOA6ycJbD3tJwQ2JLZM51mgsJmhyqNj2Hdqo
 HONy71yKol8excIIwNgWTF+Sg09nAcMbZrtGFP5ORqmC9Us6tVfOZrU2EAYirZwerj3Q
 SFIw==
X-Gm-Message-State: AOJu0YyX5kvlDlsqGHCboW98MH6XCoaR8c+pZ63EKTIekhMRt/za3EkJ
 n3clC0LTOi1H24c9bcSoMB+qGHsHqSPQK/WWai4NXQ==
X-Google-Smtp-Source: AGHT+IEcHA3uxkVdxS3kX5Q9Os0211/CVMcYLkoSpztA54Zr6d3y+m3G4j8WM0WQa4BNAS4i6qWLLFjG0HlsV7pi+yo=
X-Received: by 2002:aca:1a12:0:b0:3a7:b1de:bb70 with SMTP id
 a18-20020aca1a12000000b003a7b1debb70mr512693oia.6.1693509755084; Thu, 31 Aug
 2023 12:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230824030304.1555547-1-sjg@chromium.org>
 <40d6d839-6eaf-4950-bf37-aaad0f2d5e03@gmail.com>
 <CAPnjgZ3ejchoWij6C80nVMVr5iOag3Zazf7O_g_yYcw1U_f+cQ@mail.gmail.com>
 <d4ce17ae-8b84-4c8a-acaa-287549ec23a3@gmail.com>
 <CAPnjgZ0sTAoZi5TDAaTZUNPVNQ5dqoyVENDWJr=exa5z2R8srw@mail.gmail.com>
 <20230831190709.GO3101304@bill-the-cat>
In-Reply-To: <20230831190709.GO3101304@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 31 Aug 2023 13:22:13 -0600
Message-ID: <CAPnjgZ0JtmKhY9t_gArwjRO2=qbZsUXDhMcra4mBqBiQmcbWBg@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 Jonas Karlman <jonas@kwiboo.se>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Neha Malcom Francis <n-francis@ti.com>, Michael Walle <michael@walle.cc>,
 Kamil Lulko <kamil.lulko@gmail.com>, Vikas Manocha <vikas.manocha@st.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@dh-electronics.com,
 uboot-stm32@st-md-mailman.stormreply.com, Ivan Mikhaylov <fr0st61te@gmail.com>,
 Dillon Min <dillon.minfei@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 0/6] Attempt to enforce standard
	extensions for build output
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

On Thu, 31 Aug 2023 at 13:07, Tom Rini <trini@konsulko.com> wrote:
>
> On Thu, Aug 31, 2023 at 01:01:59PM -0600, Simon Glass wrote:
> > Hi Alper,
> >
> > On Thu, 31 Aug 2023 at 04:20, Alper Nebi Yasak <alpernebiyasak@gmail.com> wrote:
> > >
> > > On 2023-08-28 20:54 +03:00, Simon Glass wrote:
> > > > Hi Alper,
> > > >
> > > > On Sun, 27 Aug 2023 at 13:17, Alper Nebi Yasak <alpernebiyasak@gmail.com> wrote:
> > > >>
> > > >> On 2023-08-24 06:02 +03:00, Simon Glass wrote:
> > > >>> In this early stage of using binman to produce output files, we are mostly
> > > >>> seeing people using common extensions such as '.bin' and '.rom'
> > > >>>
> > > >>> But unusual extensions appear in some places.
> > > >>>
> > > >>> We would like 'buildman -k' to keep the build outputs, but this is hard if
> > > >>> there is no consistency as to the extension used.
> > > >>>
> > > >>> This series adjusts binman to enforce just 4 extensions for output images:
> > > >>>
> > > >>>    .bin
> > > >>>    .rom
> > > >>>    .itb
> > > >>>    .img
> > > >>>
> > > >>> Other extensions will produce an error. With this rule observed, buildman
> > > >>> can keep the required files.
> > > >>
> > > >> I dislike this limitation. We know what files we will generate, they are
> > > >> listed in binman dtb, so we can add something like `binman build --ls`
> > > >> to print their names/paths for buildman to preserve them.
> > > >
> > > > Yes, it would be good to have that...
> > > >
> > > > But why do you dislike the limitation? Do you think extensions provide
> > > > useful information? I suppose one problem is that *.bin might pick up
> > > > private blobs that happen to be in the source directory?
> > >
> > > I guess my strongest argument is that people already/will have workflows
> > > that depend on certain filenames or extensions, and shouldn't have to
> > > modify binman code (consider that people may be using the PyPI wheels)
> > > to accommodate those when we are already putting the name in the dtb.
> > >
> > > I do want some standardization to the U-Boot build outputs though, but
> > > more like a global binman.dts with like u-boot.rom, u-boot-sdmmc.img
> > > images with well-defined TPL, SPL, U-Boot sections that arch-dtsi files
> > > can fill in.
> > >
> > > >> Regarding the output directory suggestion, I think the binman outputs
> > > >> (not temporary/intermediate files) should be in the same directory as
> > > >> make outputs
> > > >
> > > > Agreed
> > > >
> > > >> , and the Makefile should default to O=build to achieve the
> > > >> "output dir". I'm not sure if that's going to happen.
> > > >
> > > > I would quite like the 'non-output' file (i.e. things that are not a
> > > > binman image) to appear in a 'binman-work' subdir of the output dir.
> > > > What do you think?
> > >
> > > I'd prefer them to go in a tempfile.TemporaryDirectory() and discarded
> > > at the end of a binman run, and a "--tmpdir <path>" option to use a
> > > given directory instead and preserve things for debugging.
> >
> > Actually, that was the original purpose of the output directory in the
> > u_boot_pylib.tools module. But with all the files binman creates, that
> > has been lost. I think we should restore that purpose (with an output
> > dir as a temp dir) and then I think what you have written here will
> > work.
>
> Just please note the rest of the feedback that's been given to this
> series too.

Yes. It is a bit hard to know what to do. I suppose we need binman to
publish a list of the image files it writes, so buildman can use that
to save them. Or we could just add some more special cases to the rule
in buildman?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
