Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E1E78B6CE
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Aug 2023 19:56:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48FF8C6A61D;
	Mon, 28 Aug 2023 17:56:19 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1DB2C6A617
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 17:56:17 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-d776e1f181bso3467265276.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 10:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693245377; x=1693850177;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mYaEHmERvHq14VdKDotQkz/ye/JDmXVAkgt/7kSqbCs=;
 b=Kec0ShwALVPHNn6XHFXnUeBo3vqQyFPAKnQLIAH/OEMF4gEiRg8p0s5rbRAXffgFPr
 NsmJJ9dmCrPuthZxBOHJMwlwbuUJI8jFEgEFLGPhTeZOmqLQO0wVpIz/T3AR9FcPyJNP
 eVecUz1/PekSTdY1t9o6NL9IPH8cezKIByh10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693245377; x=1693850177;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mYaEHmERvHq14VdKDotQkz/ye/JDmXVAkgt/7kSqbCs=;
 b=BBx+RtxdCmu74RqIOFslxmDtxE5gEGuZYRghVC0bIbc7XOEgprJ5qpAuGsJ/NVLQet
 SfQ/BA2RqktXDpPzjzIXHABy0IJDMfIqFtz1Eoa/ayJ9NmM5OuA/fHA9OFUEizYFg5+T
 VgHO8VTJENKdEuEy2u7UqC1FPM7IWHDoutVIxYiOIELEe+8zAs+/zT5doK1wnCIGkiDe
 y9zRLiag9XHsIIeV5w4sfnwA4evbE6GMlP666mm1x2MnWWdToLLyXvQ//25OGi4mr1/i
 2Qr6jOY2b2tTgoj0QnxS0Nq1QRtnfOkgTc1kD4iqOQ9jzxayFkd0RCqtJLXoSYXgqlV2
 PeCw==
X-Gm-Message-State: AOJu0YwuI+yHb43C5z6g6aduKbav+9hWVHSsiiawk0WRifElj9JAKUaI
 wzH2bRkiC9Ixr6p1YZFdY6ViLW16iFlzEQlYutYi6A==
X-Google-Smtp-Source: AGHT+IFZhHyXxU4mK58kJVS2rSppbZSRzsXWuOOwSXUfcbssaZio/mE650D3BTGWIt0GNkE5ukEPwoCBrjg+UTN5SMw=
X-Received: by 2002:a25:685:0:b0:d7b:37de:2f6e with SMTP id
 127-20020a250685000000b00d7b37de2f6emr1846047ybg.39.1693245376665; Mon, 28
 Aug 2023 10:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230824030304.1555547-1-sjg@chromium.org>
 <40d6d839-6eaf-4950-bf37-aaad0f2d5e03@gmail.com>
In-Reply-To: <40d6d839-6eaf-4950-bf37-aaad0f2d5e03@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 28 Aug 2023 11:54:55 -0600
Message-ID: <CAPnjgZ3ejchoWij6C80nVMVr5iOag3Zazf7O_g_yYcw1U_f+cQ@mail.gmail.com>
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

On Sun, 27 Aug 2023 at 13:17, Alper Nebi Yasak <alpernebiyasak@gmail.com> wrote:
>
> On 2023-08-24 06:02 +03:00, Simon Glass wrote:
> > In this early stage of using binman to produce output files, we are mostly
> > seeing people using common extensions such as '.bin' and '.rom'
> >
> > But unusual extensions appear in some places.
> >
> > We would like 'buildman -k' to keep the build outputs, but this is hard if
> > there is no consistency as to the extension used.
> >
> > This series adjusts binman to enforce just 4 extensions for output images:
> >
> >    .bin
> >    .rom
> >    .itb
> >    .img
> >
> > Other extensions will produce an error. With this rule observed, buildman
> > can keep the required files.
>
> I dislike this limitation. We know what files we will generate, they are
> listed in binman dtb, so we can add something like `binman build --ls`
> to print their names/paths for buildman to preserve them.

Yes, it would be good to have that...

But why do you dislike the limitation? Do you think extensions provide
useful information? I suppose one problem is that *.bin might pick up
private blobs that happen to be in the source directory?

>
> Regarding the output directory suggestion, I think the binman outputs
> (not temporary/intermediate files) should be in the same directory as
> make outputs

Agreed

>, and the Makefile should default to O=build to achieve the
> "output dir". I'm not sure if that's going to happen.

I would quite like the 'non-output' file (i.e. things that are not a
binman image) to appear in a 'binman-work' subdir of the output dir.
What do you think?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
