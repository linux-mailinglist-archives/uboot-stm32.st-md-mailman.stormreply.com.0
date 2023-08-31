Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2993678F303
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Aug 2023 21:03:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1AAEC6A615;
	Thu, 31 Aug 2023 19:03:26 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23002C65E58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Aug 2023 19:03:25 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-5733bcf6eb6so689012eaf.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Aug 2023 12:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693508604; x=1694113404;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5g+bE+gNK+QLeFC3naMVOJBDEZDvsK84DKLP2VgIlpg=;
 b=PbTBddKD6LkR+9Km37hmraNXhwG4bUCuoCQ7JHk/IkWnr+35e4GvHZblDTM4eLOI8I
 wH+/Sg7NCTOn0ZgVusG/wKnJ34N8eu2JmuvU5fBj59OB/QtphWk0W/yyZxhCFbOGOanr
 U6CW14ZI6JPUXGyt/cxMlUPVVfebKlIrab0go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693508604; x=1694113404;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5g+bE+gNK+QLeFC3naMVOJBDEZDvsK84DKLP2VgIlpg=;
 b=boue48o1dIa5GjdZ2YYDqWkq+r1AIqE8A3biCFkv/O4ce4jv+ZtvIzm9GO7SfuoGlG
 8whbxF0T8V0LGl/jUOHOAzJ19kLmZMSPsfoAjah/w/c1U9m+N1asEBdT/VW3p92auhwj
 7OajjolCnnUsy7JwSDowGuQqN/M/bdSGSJQ2ow4Q/N5wWstM3qPvJuQ3HKNj2VE6t0hz
 bpQgo245YRb6lKgmoKROAVM1HvxnDxExLcwHQ2Qg3xNd5nGy5J290onblTyUc3FVrrYC
 /S7+scj7sLZcAkEcEeYyB+xq9KkFweTeU0iAX556oKcUyBsYE1evDr11RUdcQr18IoED
 XEEw==
X-Gm-Message-State: AOJu0YxRzpqiQtC97EaxNeQjBfQoUv46KNYLWGBl9XwMIQ8siCQIdCqL
 ip1+MnwlpaW1xORA+xOucjOZS3IP3iykWzJr6mrufQ==
X-Google-Smtp-Source: AGHT+IHIJ2qqBwfGZHc1Xe2a5VkaK3XhoMPIUwC2TYuFiOFGQ98AbLc98BNq2C4j6/7TAAP4ohfixayFmVPBrTUZD74=
X-Received: by 2002:a05:6358:88d:b0:133:ac7:c84b with SMTP id
 m13-20020a056358088d00b001330ac7c84bmr200995rwj.12.1693508603494; Thu, 31 Aug
 2023 12:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230824030304.1555547-1-sjg@chromium.org>
 <40d6d839-6eaf-4950-bf37-aaad0f2d5e03@gmail.com>
 <CAPnjgZ3ejchoWij6C80nVMVr5iOag3Zazf7O_g_yYcw1U_f+cQ@mail.gmail.com>
 <d4ce17ae-8b84-4c8a-acaa-287549ec23a3@gmail.com>
In-Reply-To: <d4ce17ae-8b84-4c8a-acaa-287549ec23a3@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 31 Aug 2023 13:01:59 -0600
Message-ID: <CAPnjgZ0sTAoZi5TDAaTZUNPVNQ5dqoyVENDWJr=exa5z2R8srw@mail.gmail.com>
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Peng Fan <peng.fan@nxp.com>, Philippe Reynes <philippe.reynes@softathome.com>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 Jonas Karlman <jonas@kwiboo.se>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Neha Malcom Francis <n-francis@ti.com>, Kamil Lulko <kamil.lulko@gmail.com>,
 Vikas Manocha <vikas.manocha@st.com>, Michael Walle <michael@walle.cc>,
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

Hi Alper,

On Thu, 31 Aug 2023 at 04:20, Alper Nebi Yasak <alpernebiyasak@gmail.com> wrote:
>
> On 2023-08-28 20:54 +03:00, Simon Glass wrote:
> > Hi Alper,
> >
> > On Sun, 27 Aug 2023 at 13:17, Alper Nebi Yasak <alpernebiyasak@gmail.com> wrote:
> >>
> >> On 2023-08-24 06:02 +03:00, Simon Glass wrote:
> >>> In this early stage of using binman to produce output files, we are mostly
> >>> seeing people using common extensions such as '.bin' and '.rom'
> >>>
> >>> But unusual extensions appear in some places.
> >>>
> >>> We would like 'buildman -k' to keep the build outputs, but this is hard if
> >>> there is no consistency as to the extension used.
> >>>
> >>> This series adjusts binman to enforce just 4 extensions for output images:
> >>>
> >>>    .bin
> >>>    .rom
> >>>    .itb
> >>>    .img
> >>>
> >>> Other extensions will produce an error. With this rule observed, buildman
> >>> can keep the required files.
> >>
> >> I dislike this limitation. We know what files we will generate, they are
> >> listed in binman dtb, so we can add something like `binman build --ls`
> >> to print their names/paths for buildman to preserve them.
> >
> > Yes, it would be good to have that...
> >
> > But why do you dislike the limitation? Do you think extensions provide
> > useful information? I suppose one problem is that *.bin might pick up
> > private blobs that happen to be in the source directory?
>
> I guess my strongest argument is that people already/will have workflows
> that depend on certain filenames or extensions, and shouldn't have to
> modify binman code (consider that people may be using the PyPI wheels)
> to accommodate those when we are already putting the name in the dtb.
>
> I do want some standardization to the U-Boot build outputs though, but
> more like a global binman.dts with like u-boot.rom, u-boot-sdmmc.img
> images with well-defined TPL, SPL, U-Boot sections that arch-dtsi files
> can fill in.
>
> >> Regarding the output directory suggestion, I think the binman outputs
> >> (not temporary/intermediate files) should be in the same directory as
> >> make outputs
> >
> > Agreed
> >
> >> , and the Makefile should default to O=build to achieve the
> >> "output dir". I'm not sure if that's going to happen.
> >
> > I would quite like the 'non-output' file (i.e. things that are not a
> > binman image) to appear in a 'binman-work' subdir of the output dir.
> > What do you think?
>
> I'd prefer them to go in a tempfile.TemporaryDirectory() and discarded
> at the end of a binman run, and a "--tmpdir <path>" option to use a
> given directory instead and preserve things for debugging.

Actually, that was the original purpose of the output directory in the
u_boot_pylib.tools module. But with all the files binman creates, that
has been lost. I think we should restore that purpose (with an output
dir as a temp dir) and then I think what you have written here will
work.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
