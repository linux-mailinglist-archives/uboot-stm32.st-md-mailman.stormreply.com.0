Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5521A7402A
	for <lists+uboot-stm32@lfdr.de>; Thu, 27 Mar 2025 22:19:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6768FC78F74;
	Thu, 27 Mar 2025 21:19:49 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C63F5C78F73
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Mar 2025 21:19:47 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e53ef7462b6so1515529276.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Mar 2025 14:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743110386; x=1743715186;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XCtrrkQ2+tSdAd5jdeMocl1pOeBn3vHfDqajDWw6+Q4=;
 b=S0O17XQ3pVuXE+nLGgxs0njLUvheah05meNMw7fE4O9wZPNdmI2XUa5dc3V8wApTqe
 J+rtdjHw1Eyz/SNf4M4uwbV6meefZkgCHofnSYSbrZ2fXjhhq/Jp0O4IZ6l8FDlr//kf
 92VZzSQjEYYXEUJV0w5L55HkPanAHqhSmVLm72q8zY1/ZbgIyysGE4wK4mJaIzfMiEqs
 yXBfh1MPjTaJeWsczsAiZ+B8aEea78OLUJ+dZ8VHM0r3zKMRj4NmRoPFY5pnJhM/RG0a
 If5JKITOsmDmxgaWIrgg5rIqAV8/m6fF1HPjzG7pxKN+PmLDbp5sGxUeNy//cvbg9oy6
 pKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743110386; x=1743715186;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XCtrrkQ2+tSdAd5jdeMocl1pOeBn3vHfDqajDWw6+Q4=;
 b=c/qzpTSnFQzsy4Dxh7Qf53TBQpn5x6M1MLQRS9YASaGpRYKK85F1V/XFoMPi/oOzcF
 QHGn9LOyavrNyyjlDiDDMu5fE0kqZrb+Xowyv9ZAdPJ/lkskGCgQETLjY80dnzGb4tgF
 z4+dWDz/qa8cxWolM9q0iQJI/2BWFTY1e7jHwvpUOXz7JJ3abCWTpnI5nhBP9vD5DNOM
 eJ7+B0iobuCMqO28lB6CO3TbrJcORs8rVBNiKVXbzWfn2UtyRnNU816ErZBC40UmSm0R
 PYdiX4KTgeZ0mGvC5Rp9wGd5ve+zw51OvoldZslv3Gml4VHECVMSnXzlOL1QooxrRPsz
 Rgaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqiqHdcBg4teiOH8VHVD5B7zXyoMSqzfoelrrX8/3mq5J9HqH0cKzGguocHzEj/hfnpYTRDjQI1SKrpg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx6lofWXtdOt6i6RCjP09tfAM0lXPxN0ocMyan4ShozAGMJZ+9u
 PHTmm5hsfsniam9r87cErO3e7iJKRgiplGauaHKLnxp8KIfXFtDd056bpNujPvOZoxqJ6cYPfz0
 Anxd1U8NZc2XzpBqGfPXJ8DnyhrftRqwNEE8EUw==
X-Gm-Gg: ASbGncsvok2bS3NWzAT6b9EOQgQ+4RK6vUjPEo7Lfn3BShEDIZB84XlUV+tSNjY0lH/
 DYRHt6MQo/XKq07eDO1/Zf2uI3xqyEDrzH4nk4Y5/vlhgpouk5ULgO6VEZmL2yUxw2rt5Em5VQu
 e7m+c586kgh5Dh2biV+be/SYvj
X-Google-Smtp-Source: AGHT+IEzKjqpBs4pv2Zhe5nFV+IMR2KHYrZlEXsCYxUvbivCFDkk78CVi2yJM5aS48knodZfzkUjlOpzl0BOn1aZNfg=
X-Received: by 2002:a05:6902:1085:b0:e5b:1b55:1325 with SMTP id
 3f1490d57ef6-e6943656293mr6785695276.25.1743110386316; Thu, 27 Mar 2025
 14:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250317133845.138061-1-ilias.apalodimas@linaro.org>
 <380f1f2c-59cd-4c52-a598-5e6f1ed1dcad@gmx.de>
 <CAC_iWj+DazCNrMktmwJQxt7bVPbu-qWCfjW4bgcv0cngiH03gw@mail.gmail.com>
 <CAFLszTgq25-E-n+UaJ_wRdimCLcAta-fetWpOW++NCOfN_eL5w@mail.gmail.com>
In-Reply-To: <CAFLszTgq25-E-n+UaJ_wRdimCLcAta-fetWpOW++NCOfN_eL5w@mail.gmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Thu, 27 Mar 2025 23:19:10 +0200
X-Gm-Features: AQ5f1JqiGXoFSpP_OXtYKjDUwD54vMBuPRVxwH3aSr2qgWmMcAMsZ5ZpLTERIOE
Message-ID: <CAC_iWjLS_yNPCMY2RhGZ0390ZysH=N5x5JZ-qOnNjX7nofPS4Q@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
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

Hi Simon

On Thu, 27 Mar 2025 at 15:33, Simon Glass <sjg@chromium.org> wrote:
>
> Hi Ilias,
>
> On Wed, 26 Mar 2025 at 02:37, Ilias Apalodimas
> <ilias.apalodimas@linaro.org> wrote:
> >
> > Hi Heinrich,
> >
> > On Mon, 24 Mar 2025 at 19:50, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> > >
> > > On 17.03.25 14:38, Ilias Apalodimas wrote:
> > >
> > > %s/EFI_BOUNCE_BUFFER/CONFIG_EFI_LOADER_BOUNCE_BUFFER/
> > >
> > > > The EFI subsystem defines its own bounce buffer for devices that
> > > > can't transfer data > 4GB. U-Boot already has a generic BOUNCE_BUFFER
> > > > which can be reused instead of defining another symbol.
> > > > The only limitation for EFI is that we don't know how big the file a user
> > > > chooses to transfer is and as a result we can't depend on allocating the
> > > > memory from the malloc area, which can prove too small.
> > > >
> > > > So allocate an EFI buffer of the correct size and pass it to the DM,
> > > > which already supports bounce buffering via bounce_buffer_start_extalign()
> > >
> > > Looking at
> > >
> > >      if (IS_ENABLED(CONFIG_BOUNCE_BUFFER) && desc->bb) {
> > >
> > > in drivers/block/blk-uclass.c the bounce buffer has to be explicitly
> > > enabled by the device driver. Only the scsi drivers sets bb = true.
> > >
> > > Cf. 81bd22e935dc ("rockchip: block: blk-uclass: add bounce buffer flag
> > > to blk_desc")
> > >
> > > Which device-drivers of the boards mentioned below do actually need
> > > bounce buffering?
> >
> > Unfortunately, I don't have any of the hardware to test and I havent
> > worked with that platform much.
> > That 'bb' variable and the fact that EFI needs bigger allocations is
> > why I ended up allocationg properly aligned memory from the EFI
> > subsystem. But as Mark pointed out, the cache flush is a no go for
> > now, so I'll drop this and see if I find time to rework the bounce
> > buffer logic overall
>
> There was quite a bit of discussion about all this in the context of
> my attempt to just add a message to warn the user[1]
>
> We might consider adding an event to reserve memory before relocation,
> along with a way to discover (in board_r) where the memory was
> allocated. That would make the solution more generic.

I am not sure what you are trying to solve here. The EFI bounce buffer
after the LMB patches can't overwrite memory, nor can it be
overwritten.

Thanks
/Ilias

>
> For the <4GB case we could perhaps add generic support for that in
> board_f, i.e. the ability to reserve a region for boards that need it.
>
> Regards,
> SImon
>
> [1] https://lore.kernel.org/u-boot/?q=%22Show+the+location+of+the+bounce+buffer+when+debugging%22
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
