Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4AFA749C7
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Mar 2025 13:27:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4299C78F77;
	Fri, 28 Mar 2025 12:27:17 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 916AAC78F75
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Mar 2025 12:27:16 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e46ebe19368so1800762276.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Mar 2025 05:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743164835; x=1743769635;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3gXJNeHoigOcUVFmwnvJZnQU2dSZTeimRSdsa6Jtuqg=;
 b=sL/wnW7Lj+X3VkA7NE8m+sBoDouAd3eTHIALBgF2bLsf63G/VrVLH1pq/+7Pg2ip4q
 PCplTyCvC4XSq5chFeWL6BBD34rg2BDaWH2hk4UoBe6oURPkaKMdBAPhLEENUCMRqtSa
 MBvyWVOsbsk/DdVIUAvv/6iVXppWbxu4pMLxXOSDGBHPOvZk+7ONIpoDmlutja74EHLU
 CE16TxmELl3X6MoZkUIDU7FM9cxYaa/n3FRAvVcUj27APuKjPa+rQUlrnulATgnyp44p
 n++V9CzB21dbfS0vTrnJEJSBjRAyiGbdHQvuYkKNyR1WyIFwePtpiLSAIYNIK/+nPzyx
 MDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743164835; x=1743769635;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3gXJNeHoigOcUVFmwnvJZnQU2dSZTeimRSdsa6Jtuqg=;
 b=BG6NZeLFQvkUNxowoohyf1N43+BNTwUFWZcRZCRpi67upspPAYqiEwJGCqBwOzKi05
 OsVfjgnnDmJ+75QGh+PscCTauAOzYibQRZaDltbiSbmvzgrapKIvHIqZrx2d7eaypXGy
 hr/SdZnjMyU/tW9cySGJ9UpDdjuQhydK0xdZzmmsnYI5uWN+Ij0nTDfHBhCwipxnnQA7
 vP1ocxwT50JfMcY1jHJ5EEFXU0DSiPkfHlz9rwQNnck9O1vAQr4PJwyCz08vhJadSNrS
 0ioRV3XRCKHolGfLroOQM7URRHj5fM4a2SXxVja5cvRDnF2bf52n4vS6UdZvyDt6NBxy
 3xdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ4EYkYLtBKX5EMeKgZQcXTSI86tknIKj+a31RaiWbHfD6EMbRKaatnVyvEU0mjZPB2umUNWyLCGh/aA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxuLdA9QJYx2Zk64iQR59MzE7AMuvmQhTnd6JbYIJ9j/ST/YdRt
 +w5nmXE/F49UOCAM69T4u2PoGy/Xd7mNpfoeGoWs+2IBGPK1utJ9JRR3STGA4Lq9ZNM3FHkRDsY
 wDPLAGneppWu1rm9BW9K7TP8j1roUqflt1EUE4w==
X-Gm-Gg: ASbGncso+bOmdCaXGw4VYlHy7TpDBsQ6KZk0LeoKWE6/ZM0OnH9C88omYsQO8uRIOl+
 ZsUlbYt781HPOiD2JDg7RnMdpfcsC+11Xk6QVWEvkmIG3MTfM3kexSD8fBN1j+OPY7fkX1Mmbnj
 vj1sWcJaVljv63mj96U+xUULIj
X-Google-Smtp-Source: AGHT+IHuCr4N/l8ppCD/CVxfjTnfKuALtC3ApEr3Pz1Drp18IhiT0vFmcbzQ/lh2uKdoDG/vKhbdIkW/a9qIyLY7HNE=
X-Received: by 2002:a05:6902:4810:b0:e60:87a0:61fd with SMTP id
 3f1490d57ef6-e694353efb7mr9125750276.6.1743164835100; Fri, 28 Mar 2025
 05:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250317133845.138061-1-ilias.apalodimas@linaro.org>
 <380f1f2c-59cd-4c52-a598-5e6f1ed1dcad@gmx.de>
 <CAC_iWj+DazCNrMktmwJQxt7bVPbu-qWCfjW4bgcv0cngiH03gw@mail.gmail.com>
 <CAFLszTgq25-E-n+UaJ_wRdimCLcAta-fetWpOW++NCOfN_eL5w@mail.gmail.com>
 <CAC_iWjLS_yNPCMY2RhGZ0390ZysH=N5x5JZ-qOnNjX7nofPS4Q@mail.gmail.com>
 <CAFLszThhK4-+Qh_eQLD0fuJZVodBkwit4rw5mOcGU58m6=5knw@mail.gmail.com>
In-Reply-To: <CAFLszThhK4-+Qh_eQLD0fuJZVodBkwit4rw5mOcGU58m6=5knw@mail.gmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Fri, 28 Mar 2025 14:26:39 +0200
X-Gm-Features: AQ5f1JrdtDBiVDeDyMwSR7s_zRoiEaXlLzSX8ImIiYXcv_UI35-iPSBu9BXBoDM
Message-ID: <CAC_iWj+2EsRUBT5ThAR7+wwxVkFSzrApCNDbTEEHQ-W658LwCw@mail.gmail.com>
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

On Fri, 28 Mar 2025 at 13:34, Simon Glass <sjg@chromium.org> wrote:
>
> Hi Ilias,
>
> On Thu, 27 Mar 2025 at 15:19, Ilias Apalodimas
> <ilias.apalodimas@linaro.org> wrote:
> >
> > Hi Simon
> >
> > On Thu, 27 Mar 2025 at 15:33, Simon Glass <sjg@chromium.org> wrote:
> > >
> > > Hi Ilias,
> > >
> > > On Wed, 26 Mar 2025 at 02:37, Ilias Apalodimas
> > > <ilias.apalodimas@linaro.org> wrote:
> > > >
> > > > Hi Heinrich,
> > > >
> > > > On Mon, 24 Mar 2025 at 19:50, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> > > > >
> > > > > On 17.03.25 14:38, Ilias Apalodimas wrote:
> > > > >
> > > > > %s/EFI_BOUNCE_BUFFER/CONFIG_EFI_LOADER_BOUNCE_BUFFER/
> > > > >
> > > > > > The EFI subsystem defines its own bounce buffer for devices that
> > > > > > can't transfer data > 4GB. U-Boot already has a generic BOUNCE_BUFFER
> > > > > > which can be reused instead of defining another symbol.
> > > > > > The only limitation for EFI is that we don't know how big the file a user
> > > > > > chooses to transfer is and as a result we can't depend on allocating the
> > > > > > memory from the malloc area, which can prove too small.
> > > > > >
> > > > > > So allocate an EFI buffer of the correct size and pass it to the DM,
> > > > > > which already supports bounce buffering via bounce_buffer_start_extalign()
> > > > >
> > > > > Looking at
> > > > >
> > > > >      if (IS_ENABLED(CONFIG_BOUNCE_BUFFER) && desc->bb) {
> > > > >
> > > > > in drivers/block/blk-uclass.c the bounce buffer has to be explicitly
> > > > > enabled by the device driver. Only the scsi drivers sets bb = true.
> > > > >
> > > > > Cf. 81bd22e935dc ("rockchip: block: blk-uclass: add bounce buffer flag
> > > > > to blk_desc")
> > > > >
> > > > > Which device-drivers of the boards mentioned below do actually need
> > > > > bounce buffering?
> > > >
> > > > Unfortunately, I don't have any of the hardware to test and I havent
> > > > worked with that platform much.
> > > > That 'bb' variable and the fact that EFI needs bigger allocations is
> > > > why I ended up allocationg properly aligned memory from the EFI
> > > > subsystem. But as Mark pointed out, the cache flush is a no go for
> > > > now, so I'll drop this and see if I find time to rework the bounce
> > > > buffer logic overall
> > >
> > > There was quite a bit of discussion about all this in the context of
> > > my attempt to just add a message to warn the user[1]
> > >
> > > We might consider adding an event to reserve memory before relocation,
> > > along with a way to discover (in board_r) where the memory was
> > > allocated. That would make the solution more generic.
> >
> > I am not sure what you are trying to solve here. The EFI bounce buffer
> > after the LMB patches can't overwrite memory, nor can it be
> > overwritten.
>
> I am thinking of we can create a single implementation of the
> bouncebuf logic which also works for EFI.
>
> I think the two sane things to do are:
> - restrict U-Boot to using memory below 4GB for platforms which have
> the DMA limitation

You don't need that. The bounce buf code has a callback you can use to
define the limitations

> - create (in board_f) a special region below 4GB for use with the
> bouncebuf logic

The only problem with EFI is that you don't know how much memory it
needs and we can't use the existing memalign calls. So if we replace
that memalign in the bounce buffer code, with an lmb reservation we
have everything we need.

/Ilias
>
>
> >
> > Thanks
> > /Ilias
> >
> > >
> > > For the <4GB case we could perhaps add generic support for that in
> > > board_f, i.e. the ability to reserve a region for boards that need it.
>
> Regards,
> SImon
>
> > > [1] https://lore.kernel.org/u-boot/?q=%22Show+the+location+of+the+bounce+buffer+when+debugging%22
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
