Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4672078F694
	for <lists+uboot-stm32@lfdr.de>; Fri,  1 Sep 2023 03:10:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD7D6C6A615;
	Fri,  1 Sep 2023 01:10:33 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B21BC6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Sep 2023 01:10:33 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-4ff8cf11b90so2758054e87.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Aug 2023 18:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693530632; x=1694135432;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9bEZ6oach9EUwqNCCdmgV9v3ZdS2I/938BHgbJ4Fn5k=;
 b=OyjQiAJaeUFYoZZ8i88MPBBFMHFrCyDLWNbxGS+CqKPbyKFSnRJd+cKptspLbx8ds8
 cTn1Mati+eWL0MHXVFf+jeWXFjeh3OYJ8Yhax+n4DyFMR35EITu+B4TS8YLU9fs/L5mD
 nidm425rZkMEZhx7kajGQw8DPqhXjoZV6E3u4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693530632; x=1694135432;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9bEZ6oach9EUwqNCCdmgV9v3ZdS2I/938BHgbJ4Fn5k=;
 b=YSUHN1mvCxzW91xjNsMYpJGV+qsowNSunJ8nj+7gwnVJu/YlLVDFRzbqzEtDxfffUu
 QcWGvxU6+5U5F3/JItsoxKbxl9FQaJJsm8Uf2Fq9eL4PGQ2Cdq9pp0Fi2sdRujp2LB62
 jv/fzbdKnAdFUDyyXvOdeicIhid3LUzAJ+Uh2Qs8DwuzE6MIHJsUjmdtikkheBt1FAqs
 waXQWPXzlzHtCJqAWZtiXoCsbNZU30HuhjVD6ENJ5Jz5rzWcrXzRhr8BqB4II71Iaj4R
 sRLyJIapNVRP2R19EaepmGH2vgNa+iAjqVP8kAqeX9ewN8v3dNLC3JDxz3pPQdl6XAf7
 Ck3g==
X-Gm-Message-State: AOJu0Ywp2ZdnL2E50TIqDJ0AumdCrREpiDmNAOaoS+2zbyOfFfJpl93N
 jkGRqNQ+nR/PacV4tYFl89xz5UpShXMstGANUrWiaQ==
X-Google-Smtp-Source: AGHT+IF/tWPMTmBgEq9kIppBhzrh8/M+y8VgNUidFdliCya57r7x8S6TXlSv0zcZgsB0BGAfPiwOvngqYJ9+8Tacfqs=
X-Received: by 2002:a05:6512:2005:b0:500:b8bc:bd9a with SMTP id
 a5-20020a056512200500b00500b8bcbd9amr486868lfb.49.1693530632259; Thu, 31 Aug
 2023 18:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230824030304.1555547-1-sjg@chromium.org>
 <40d6d839-6eaf-4950-bf37-aaad0f2d5e03@gmail.com>
 <CAPnjgZ3ejchoWij6C80nVMVr5iOag3Zazf7O_g_yYcw1U_f+cQ@mail.gmail.com>
 <d4ce17ae-8b84-4c8a-acaa-287549ec23a3@gmail.com>
 <CAPnjgZ0sTAoZi5TDAaTZUNPVNQ5dqoyVENDWJr=exa5z2R8srw@mail.gmail.com>
 <20230831190709.GO3101304@bill-the-cat>
 <CAPnjgZ0JtmKhY9t_gArwjRO2=qbZsUXDhMcra4mBqBiQmcbWBg@mail.gmail.com>
 <20230831192430.GP3101304@bill-the-cat>
In-Reply-To: <20230831192430.GP3101304@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 31 Aug 2023 19:10:20 -0600
Message-ID: <CAPnjgZ1OSu_=Wk_BtRGC+1pxcGVVED1OqCuKh9cAvWVzhyisag@mail.gmail.com>
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

On Thu, 31 Aug 2023 at 13:24, Tom Rini <trini@konsulko.com> wrote:
>
> On Thu, Aug 31, 2023 at 01:22:13PM -0600, Simon Glass wrote:
> > Hi Tom,
> >
> > On Thu, 31 Aug 2023 at 13:07, Tom Rini <trini@konsulko.com> wrote:
> > >
> > > On Thu, Aug 31, 2023 at 01:01:59PM -0600, Simon Glass wrote:
> > > > Hi Alper,
> > > >
> > > > On Thu, 31 Aug 2023 at 04:20, Alper Nebi Yasak <alpernebiyasak@gmail.com> wrote:
> > > > >
> > > > > On 2023-08-28 20:54 +03:00, Simon Glass wrote:
> > > > > > Hi Alper,
> > > > > >
> > > > > > On Sun, 27 Aug 2023 at 13:17, Alper Nebi Yasak <alpernebiyasak@gmail.com> wrote:
> > > > > >>
> > > > > >> On 2023-08-24 06:02 +03:00, Simon Glass wrote:
> > > > > >>> In this early stage of using binman to produce output files, we are mostly
> > > > > >>> seeing people using common extensions such as '.bin' and '.rom'
> > > > > >>>
> > > > > >>> But unusual extensions appear in some places.
> > > > > >>>
> > > > > >>> We would like 'buildman -k' to keep the build outputs, but this is hard if
> > > > > >>> there is no consistency as to the extension used.
> > > > > >>>
> > > > > >>> This series adjusts binman to enforce just 4 extensions for output images:
> > > > > >>>
> > > > > >>>    .bin
> > > > > >>>    .rom
> > > > > >>>    .itb
> > > > > >>>    .img
> > > > > >>>
> > > > > >>> Other extensions will produce an error. With this rule observed, buildman
> > > > > >>> can keep the required files.
> > > > > >>
> > > > > >> I dislike this limitation. We know what files we will generate, they are
> > > > > >> listed in binman dtb, so we can add something like `binman build --ls`
> > > > > >> to print their names/paths for buildman to preserve them.
> > > > > >
> > > > > > Yes, it would be good to have that...
> > > > > >
> > > > > > But why do you dislike the limitation? Do you think extensions provide
> > > > > > useful information? I suppose one problem is that *.bin might pick up
> > > > > > private blobs that happen to be in the source directory?
> > > > >
> > > > > I guess my strongest argument is that people already/will have workflows
> > > > > that depend on certain filenames or extensions, and shouldn't have to
> > > > > modify binman code (consider that people may be using the PyPI wheels)
> > > > > to accommodate those when we are already putting the name in the dtb.
> > > > >
> > > > > I do want some standardization to the U-Boot build outputs though, but
> > > > > more like a global binman.dts with like u-boot.rom, u-boot-sdmmc.img
> > > > > images with well-defined TPL, SPL, U-Boot sections that arch-dtsi files
> > > > > can fill in.
> > > > >
> > > > > >> Regarding the output directory suggestion, I think the binman outputs
> > > > > >> (not temporary/intermediate files) should be in the same directory as
> > > > > >> make outputs
> > > > > >
> > > > > > Agreed
> > > > > >
> > > > > >> , and the Makefile should default to O=build to achieve the
> > > > > >> "output dir". I'm not sure if that's going to happen.
> > > > > >
> > > > > > I would quite like the 'non-output' file (i.e. things that are not a
> > > > > > binman image) to appear in a 'binman-work' subdir of the output dir.
> > > > > > What do you think?
> > > > >
> > > > > I'd prefer them to go in a tempfile.TemporaryDirectory() and discarded
> > > > > at the end of a binman run, and a "--tmpdir <path>" option to use a
> > > > > given directory instead and preserve things for debugging.
> > > >
> > > > Actually, that was the original purpose of the output directory in the
> > > > u_boot_pylib.tools module. But with all the files binman creates, that
> > > > has been lost. I think we should restore that purpose (with an output
> > > > dir as a temp dir) and then I think what you have written here will
> > > > work.
> > >
> > > Just please note the rest of the feedback that's been given to this
> > > series too.
> >
> > Yes. It is a bit hard to know what to do. I suppose we need binman to
> > publish a list of the image files it writes, so buildman can use that
> > to save them. Or we could just add some more special cases to the rule
> > in buildman?
>
> Extend the list of files that we do keep today, so that at least more
> cases could work, set aside the "everything else is an error" notion for
> now.

OK got it, thanks.


- Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
