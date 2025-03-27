Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2064A7336C
	for <lists+uboot-stm32@lfdr.de>; Thu, 27 Mar 2025 14:33:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53B39C78F72;
	Thu, 27 Mar 2025 13:33:14 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CD1CCFAC4C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Mar 2025 13:33:13 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ac3b12e8518so189356466b.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Mar 2025 06:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1743082393; x=1743687193;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=80l8bjMsmRffl6OVXm6A0mXSoLZ2i4gFpN1LMNvuOiU=;
 b=hlBeA1MkcTKNPtZk0eZJDWDP5MRvRIE8FAnT3iLSgYtQ9PyWye0m7F2vdE6hRjFLYt
 6sf5aoxhdDKipBCz5VGK5tilqPmG85hifKOoJCFJpJBqM+jyucqdJTbpzibFumBgo5HT
 CsWFP1/A6hZ/tKYbh+qR6I1LigEb2NQlA31xk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743082393; x=1743687193;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=80l8bjMsmRffl6OVXm6A0mXSoLZ2i4gFpN1LMNvuOiU=;
 b=T7ncOiS62LyPRQUcdKQfN+lxoqIQO1UJjAxhYFkPi6uyx9rHRzD+k1i7C468/shEZH
 WgTUStRnH/XUwRj2DF3lN4S+8yl6qwDVK+75bu2rOP7WbcJJs4anGQlfSN6boAkCqREX
 so8YMCFBQ7YOSV0GdbDFEidtsIva09WeG6gH1qn54CApG5IUX3Od9weH/RaG9e42Hpp3
 TuCekRLmsI++uWlXyBOezg/6DajQZ5szullFskqkoYL0MIRCp9pFZYi0HxOmqjimkB2j
 dsU9Naqr2UUshGDtAiyf0eyG3VvRLrS+baZcQpYs+Q1b/NxyJoiIBA8EmlbRwQRY2nLs
 zAiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU0J0c8ymCauWCsdli5WGxOuxu0qgCjjcR8sqyaAIJ2zu8WPjV8wR2NrNm40ngCwIhZqMWATk+YJqiew==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwJao7XgKn+nefAjL6k645nTK/EO4+HvnAUbzTrEBGTqTEGEwOp
 wifrFMA2wZiHu024h4IVFb3Ofn5YrFat8KtGiXM4lLq63IDHKRMvZXRqntyCYQ2fVyp0y81twIZ
 XhDXX1mc9gLlsx8dz2MwPtDeDmOVl4re5iFOd
X-Gm-Gg: ASbGncvRawE6+dJ1Us3Ulo2WphsSaI7D6E9ZUyr1s8S05wbEnQ99j9559Rk+q98xHqV
 yz5Iw0Mb4VC1QAAbt+8lE14YylMgbk88SvoXEbDfpr8AAJ3C3A5lMYWSjOUmqKZKhF2vvnvJ5+3
 5FUHXBa3r57NefJkOSO7foYxDKCxg=
X-Google-Smtp-Source: AGHT+IHvZpe8R9Oj977ZPnxHAJEiaw53yrZvBdkYM+CyD3OGIUwHJHMy+qsSqvpXQo+Oemn0vQwOkXhIGfDJwHV6PHI=
X-Received: by 2002:a17:907:1c0c:b0:ac6:b639:5a1b with SMTP id
 a640c23a62f3a-ac6fb14ec02mr315007766b.45.1743082392835; Thu, 27 Mar 2025
 06:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250317133845.138061-1-ilias.apalodimas@linaro.org>
 <380f1f2c-59cd-4c52-a598-5e6f1ed1dcad@gmx.de>
 <CAC_iWj+DazCNrMktmwJQxt7bVPbu-qWCfjW4bgcv0cngiH03gw@mail.gmail.com>
In-Reply-To: <CAC_iWj+DazCNrMktmwJQxt7bVPbu-qWCfjW4bgcv0cngiH03gw@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 27 Mar 2025 07:33:01 -0600
X-Gm-Features: AQ5f1JoIaUtS4OUivQs5fFZmEULB8BgMcajPppp5U1BBcMt9EVq3_10n3wCf_Mw
Message-ID: <CAFLszTgq25-E-n+UaJ_wRdimCLcAta-fetWpOW++NCOfN_eL5w@mail.gmail.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>,
 =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>, u-boot@lists.denx.de,
 Wei Ming Chen <jj251510319013@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Rudolph <patrick.rudolph@9elements.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>, Tom Rini <trini@konsulko.com>,
 Udit Agarwal <udit.agarwal@nxp.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Manish Tomar <Manish.Tomar@nxp.com>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, Wasim Khan <wasim.khan@nxp.com>,
 Mathew McBride <matt@traverse.com.au>,
 =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 Tien Fong Chee <tien.fong.chee@altera.com>, e@freeshell.de,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Adriano Cordova <adrianox@gmail.com>, Ashish Kumar <Ashish.Kumar@nxp.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, Sumit Garg <sumit.garg@kernel.org>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Alif Zakuan Yuslaimi <alif.zakuan.yuslaimi@intel.com>,
 Lukas Funke <lukas.funke@weidmueller.com>,
 Robert Marko <robert.marko@sartura.hr>, Michal Simek <michal.simek@amd.com>,
 Mingkai Hu <mingkai.hu@nxp.com>, Raymond Mao <raymond.mao@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tang Yuantian <andy.tang@nxp.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Maks Mishin <maks.mishinfz@gmail.com>,
 Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] efi_loader: remove EFI_BOUNCE_BUFFER
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

Hi Ilias,

On Wed, 26 Mar 2025 at 02:37, Ilias Apalodimas
<ilias.apalodimas@linaro.org> wrote:
>
> Hi Heinrich,
>
> On Mon, 24 Mar 2025 at 19:50, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> >
> > On 17.03.25 14:38, Ilias Apalodimas wrote:
> >
> > %s/EFI_BOUNCE_BUFFER/CONFIG_EFI_LOADER_BOUNCE_BUFFER/
> >
> > > The EFI subsystem defines its own bounce buffer for devices that
> > > can't transfer data > 4GB. U-Boot already has a generic BOUNCE_BUFFER
> > > which can be reused instead of defining another symbol.
> > > The only limitation for EFI is that we don't know how big the file a user
> > > chooses to transfer is and as a result we can't depend on allocating the
> > > memory from the malloc area, which can prove too small.
> > >
> > > So allocate an EFI buffer of the correct size and pass it to the DM,
> > > which already supports bounce buffering via bounce_buffer_start_extalign()
> >
> > Looking at
> >
> >      if (IS_ENABLED(CONFIG_BOUNCE_BUFFER) && desc->bb) {
> >
> > in drivers/block/blk-uclass.c the bounce buffer has to be explicitly
> > enabled by the device driver. Only the scsi drivers sets bb = true.
> >
> > Cf. 81bd22e935dc ("rockchip: block: blk-uclass: add bounce buffer flag
> > to blk_desc")
> >
> > Which device-drivers of the boards mentioned below do actually need
> > bounce buffering?
>
> Unfortunately, I don't have any of the hardware to test and I havent
> worked with that platform much.
> That 'bb' variable and the fact that EFI needs bigger allocations is
> why I ended up allocationg properly aligned memory from the EFI
> subsystem. But as Mark pointed out, the cache flush is a no go for
> now, so I'll drop this and see if I find time to rework the bounce
> buffer logic overall

There was quite a bit of discussion about all this in the context of
my attempt to just add a message to warn the user[1]

We might consider adding an event to reserve memory before relocation,
along with a way to discover (in board_r) where the memory was
allocated. That would make the solution more generic.

For the <4GB case we could perhaps add generic support for that in
board_f, i.e. the ability to reserve a region for boards that need it.

Regards,
SImon

[1] https://lore.kernel.org/u-boot/?q=%22Show+the+location+of+the+bounce+buffer+when+debugging%22
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
