Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A1FA7493E
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Mar 2025 12:34:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7636EC78F75;
	Fri, 28 Mar 2025 11:34:50 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03611C7128A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Mar 2025 11:34:48 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-ac3fcf5ab0dso333105866b.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Mar 2025 04:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1743161688; x=1743766488;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4aFwvL7gyifHzpc0klq/Pti/yD4vWJJws4d/4dOrLAI=;
 b=Z5fNNS6FkgBX0I8+bNosx991/lZ6VLG/yfH2sS/QCnNfCmHSlCEM8OC+CMoLHHczYx
 OGkLfolUDXCo7xUXagl98FNCdU541ReJD5l3FFYMo60EYytXZtI9wbNohzOMBy+/qoyK
 S1frHNVqP9B4Notql41afFaoKu8o69uY2Fy/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743161688; x=1743766488;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4aFwvL7gyifHzpc0klq/Pti/yD4vWJJws4d/4dOrLAI=;
 b=mXUeEDJeJJ5+cuX36ae4MRGUudSXht/Ap6M+vfDYj/FD88KdQn/V9azvOKBu0uwEFL
 pU14Wwaz1WviWAaZxgqZIJ4tqxo/CHLXgu6LEyOBEv1VnqwqmtO3E5OuwMS9VrBrS0zT
 /tr5L42FpNbeELorNiLeklvyT1CjnEFOCm6AFD6vgSpOGsQW2SDt0oQtALTDZ4JkBG4q
 TneAJaYGpSUdvbkwgNGNQAx3/zOiXa/9hVDH6foDuAKWEkQlNWkxYWm87nxmuExy9gxz
 yZK863+6yll0+Hvk1VMRZfzv7UqF2ibmfLoAl/0p0slYdg6GR9HCUWsH2Iz8S2BAYTSv
 vZPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM+1apdlaL97UH00ftBM/ThSlY96doSKYlBwqqO4kReQ8HCkxGfYtgjAk61q8/ef5cQh9aZE+KoZsXXg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywn+Kl0Th4tfYctCvA2by1xQDUsWJ5wefR6HiIkPiawFV+fJ/yu
 V1AC1hkyGsiOgiQZHlHqnV0zpqsGqX4toOnYdrMTy8D8nQq/2SxojsC90Nj4UqIbdGL/U0WPxbH
 UlxQJguCYl+mWvBUnVDH6EjnLuy3W9a/gYY9C
X-Gm-Gg: ASbGncvuaHsI/hIl1eNrabF9Lg6/HN9CkczG5FBfNPa5VN7CXcN0IqyZcI7kdgga2mJ
 D+GBR4KqhT7brcKcWYiQJywBCqFUE+CW5m4+e6bmW4H9AiWIKVb4ohxLhMoSA5M8r7xxCp+KBRa
 BjR4eh2Cplue0LtBpxwUeM5X02Mbp+3o86UDQygg==
X-Google-Smtp-Source: AGHT+IHJku0Sbo3jwI6acgZGfszf5R9A9mz+uQNN7jKCD3FdCgGjNkdRoL+TsInv2HnuxmQyzrtJpfd4hDZEI2RiKk4=
X-Received: by 2002:a17:907:7f06:b0:ac3:1b00:e17d with SMTP id
 a640c23a62f3a-ac6fb1606a6mr708919566b.54.1743161688119; Fri, 28 Mar 2025
 04:34:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250317133845.138061-1-ilias.apalodimas@linaro.org>
 <380f1f2c-59cd-4c52-a598-5e6f1ed1dcad@gmx.de>
 <CAC_iWj+DazCNrMktmwJQxt7bVPbu-qWCfjW4bgcv0cngiH03gw@mail.gmail.com>
 <CAFLszTgq25-E-n+UaJ_wRdimCLcAta-fetWpOW++NCOfN_eL5w@mail.gmail.com>
 <CAC_iWjLS_yNPCMY2RhGZ0390ZysH=N5x5JZ-qOnNjX7nofPS4Q@mail.gmail.com>
In-Reply-To: <CAC_iWjLS_yNPCMY2RhGZ0390ZysH=N5x5JZ-qOnNjX7nofPS4Q@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 28 Mar 2025 05:34:31 -0600
X-Gm-Features: AQ5f1JpDpXaCd3wqLaJ5MWS8n5h6ctazvZFOheWacyKDSnmR4T8mWPNRJzEkiJs
Message-ID: <CAFLszThhK4-+Qh_eQLD0fuJZVodBkwit4rw5mOcGU58m6=5knw@mail.gmail.com>
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

On Thu, 27 Mar 2025 at 15:19, Ilias Apalodimas
<ilias.apalodimas@linaro.org> wrote:
>
> Hi Simon
>
> On Thu, 27 Mar 2025 at 15:33, Simon Glass <sjg@chromium.org> wrote:
> >
> > Hi Ilias,
> >
> > On Wed, 26 Mar 2025 at 02:37, Ilias Apalodimas
> > <ilias.apalodimas@linaro.org> wrote:
> > >
> > > Hi Heinrich,
> > >
> > > On Mon, 24 Mar 2025 at 19:50, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> > > >
> > > > On 17.03.25 14:38, Ilias Apalodimas wrote:
> > > >
> > > > %s/EFI_BOUNCE_BUFFER/CONFIG_EFI_LOADER_BOUNCE_BUFFER/
> > > >
> > > > > The EFI subsystem defines its own bounce buffer for devices that
> > > > > can't transfer data > 4GB. U-Boot already has a generic BOUNCE_BUFFER
> > > > > which can be reused instead of defining another symbol.
> > > > > The only limitation for EFI is that we don't know how big the file a user
> > > > > chooses to transfer is and as a result we can't depend on allocating the
> > > > > memory from the malloc area, which can prove too small.
> > > > >
> > > > > So allocate an EFI buffer of the correct size and pass it to the DM,
> > > > > which already supports bounce buffering via bounce_buffer_start_extalign()
> > > >
> > > > Looking at
> > > >
> > > >      if (IS_ENABLED(CONFIG_BOUNCE_BUFFER) && desc->bb) {
> > > >
> > > > in drivers/block/blk-uclass.c the bounce buffer has to be explicitly
> > > > enabled by the device driver. Only the scsi drivers sets bb = true.
> > > >
> > > > Cf. 81bd22e935dc ("rockchip: block: blk-uclass: add bounce buffer flag
> > > > to blk_desc")
> > > >
> > > > Which device-drivers of the boards mentioned below do actually need
> > > > bounce buffering?
> > >
> > > Unfortunately, I don't have any of the hardware to test and I havent
> > > worked with that platform much.
> > > That 'bb' variable and the fact that EFI needs bigger allocations is
> > > why I ended up allocationg properly aligned memory from the EFI
> > > subsystem. But as Mark pointed out, the cache flush is a no go for
> > > now, so I'll drop this and see if I find time to rework the bounce
> > > buffer logic overall
> >
> > There was quite a bit of discussion about all this in the context of
> > my attempt to just add a message to warn the user[1]
> >
> > We might consider adding an event to reserve memory before relocation,
> > along with a way to discover (in board_r) where the memory was
> > allocated. That would make the solution more generic.
>
> I am not sure what you are trying to solve here. The EFI bounce buffer
> after the LMB patches can't overwrite memory, nor can it be
> overwritten.

I am thinking of we can create a single implementation of the
bouncebuf logic which also works for EFI.

I think the two sane things to do are:
- restrict U-Boot to using memory below 4GB for platforms which have
the DMA limitation
- create (in board_f) a special region below 4GB for use with the
bouncebuf logic


>
> Thanks
> /Ilias
>
> >
> > For the <4GB case we could perhaps add generic support for that in
> > board_f, i.e. the ability to reserve a region for boards that need it.

Regards,
SImon

> > [1] https://lore.kernel.org/u-boot/?q=%22Show+the+location+of+the+bounce+buffer+when+debugging%22
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
