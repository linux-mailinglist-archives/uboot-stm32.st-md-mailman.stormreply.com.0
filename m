Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F5BA7554E
	for <lists+uboot-stm32@lfdr.de>; Sat, 29 Mar 2025 10:05:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FFDCC78F6C;
	Sat, 29 Mar 2025 09:05:53 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7BCBC78F64
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 29 Mar 2025 09:05:51 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e6b81408b9fso639114276.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 29 Mar 2025 02:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743239150; x=1743843950;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=s9GtLCu3gyux9oVcvDMwLhHdah2i3b65TcWN3cFiwwk=;
 b=OcOkpaUMp9wFE+Wlnim2xW5jkKK/8HN97woozUNNqMYY916xSCDjVrh6aaDbmWCccF
 y+7UkZJuRsPr2cRIO3/5AADOxOLCFRTOS0N1lMvdbK3wctJfxOZCBWskdfoiHxIH7yeA
 Z/L61SgVkvoROLvWePhLx2UbB+9y2eJ/msCClVN8rDMkSiYbowdqFzX+cBEl5g7b50Y/
 sr8j/zuKPcLvix5AF61RfOxfYBRO96HzHSW5rboZwt+Fq3IYpOYRetr13vssiQByurlj
 UvQPKMXnJwQ7tb3Xgol+Yk35gMJrMW0/3HdQtLMmk5ZrVZ61lO0rs+FHk1z+w2Qr0v2t
 6L4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743239150; x=1743843950;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s9GtLCu3gyux9oVcvDMwLhHdah2i3b65TcWN3cFiwwk=;
 b=JHNr2RMZsQREAjbF+oVllF09EKlZi39rcmRsSkHo0SE6Mssz//TrRVK+HgYZkED7Vq
 dQ5KQzWjOuLfmxqpC/Oja9eZCJHTEqmTT0FhNaUKAq4sO1QMNK/qIgeayS39QapRkjFc
 Ld51Vs8s9V6KCTk+NgDg1LNvLsUGyJaHdzvzaaI3gT0n6Huqh8teVC+AYezvEqOQyOAv
 INUkOvU2suWCJP7P4GaoFP+PHvVwPLbG4LDN0SKmQp/8AbFEdN7sRozITAwV6qSbnQEC
 2zDO4WEqlXcYNSZpUs4AR06p1l6dVgjSyVb6QWpVAOfWwELr+6NEPlcX5NHd+aK+Cach
 5Xrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJmIHZl6veXSCmf17IuJGqWJIzizpFiREhO34pHTQ+IxtdWItPqCvcXpq1+om9lpu2LaCD2ZUhNAOtOw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzaB1CjE70cuv37YmhtDgGx0zzh1xy9YCK+QRblncQJ2UPC7Fgg
 EOXjwVYtXxpW+iv5zPZ7l9cuyJOCFk56UF4IUaQXLwxpvURmCY7ExNnjI2wcPr/o6QLeV07Kh2u
 8pjFiuphZfGYACKGC1CmXpuO6Tjlyw6qQNJD8zg==
X-Gm-Gg: ASbGncv6Tpew7WuuJDF7OOxwL+0we2tyaasG0dT7R0kOpuilOeSTp3G9QGC225TAV3K
 FvCSKtbGXaYcl6eKZhB5X+Z/aao1z3z5+Mpxjf3iX1SMFy8eFxVYkbOD+S0cT/mEDWQMYH0ysxA
 KccMBquqZ3cxOnire27OP51jvRiif8e6OffjJT
X-Google-Smtp-Source: AGHT+IHaWBs7FkRRJNP1+nPos8IY5efB14N3pdEqC2tQGrSYLXCswgEYpA5muddktZyz5kHqSLKQAr66CkxqBk5SSQI=
X-Received: by 2002:a05:6902:2808:b0:e64:60d:e3cc with SMTP id
 3f1490d57ef6-e6b838d4d60mr2529580276.7.1743239150356; Sat, 29 Mar 2025
 02:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250317133845.138061-1-ilias.apalodimas@linaro.org>
 <380f1f2c-59cd-4c52-a598-5e6f1ed1dcad@gmx.de>
 <CAC_iWj+DazCNrMktmwJQxt7bVPbu-qWCfjW4bgcv0cngiH03gw@mail.gmail.com>
 <CAFLszTgq25-E-n+UaJ_wRdimCLcAta-fetWpOW++NCOfN_eL5w@mail.gmail.com>
 <CAC_iWjLS_yNPCMY2RhGZ0390ZysH=N5x5JZ-qOnNjX7nofPS4Q@mail.gmail.com>
 <CAFLszThhK4-+Qh_eQLD0fuJZVodBkwit4rw5mOcGU58m6=5knw@mail.gmail.com>
 <CAC_iWj+2EsRUBT5ThAR7+wwxVkFSzrApCNDbTEEHQ-W658LwCw@mail.gmail.com>
 <20250328160419.GX93000@bill-the-cat>
 <87wmc95b68.fsf@bloch.sibelius.xs4all.nl>
In-Reply-To: <87wmc95b68.fsf@bloch.sibelius.xs4all.nl>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Sat, 29 Mar 2025 11:05:14 +0200
X-Gm-Features: AQ5f1JrEJj2iC3Z6CIi7-Ll16Bfz38_3VNV2UJZa6sWDYGlFg_wXcp8jvlzDRIc
Message-ID: <CAC_iWjLNiNiJL49MbcGZJED=1GK_euoUox0T+dEn5fF8PcrvKQ@mail.gmail.com>
To: Mark Kettenis <mark.kettenis@xs4all.nl>
Cc: peng.fan@nxp.com, vincent.stehle@arm.com, u-boot@lists.denx.de,
 jj251510319013@gmail.com, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.rudolph@9elements.com, Tom Rini <trini@konsulko.com>,
 udit.agarwal@nxp.com, xypron.glpk@gmx.de, Manish.Tomar@nxp.com,
 Oliver.Gaskell@analog.com, wasim.khan@nxp.com, matt@traverse.com.au,
 duje.mihanovic@skole.hr, tien.fong.chee@altera.com, e@freeshell.de,
 rayagonda.kokatanur@broadcom.com, adrianox@gmail.com, Ashish.Kumar@nxp.com,
 semen.protsenko@linaro.org, sumit.garg@kernel.org, sughosh.ganu@linaro.org,
 alif.zakuan.yuslaimi@intel.com, lukas.funke@weidmueller.com,
 robert.marko@sartura.hr, michal.simek@amd.com, mingkai.hu@nxp.com,
 raymond.mao@linaro.org, caleb.connolly@linaro.org, andy.tang@nxp.com,
 priyanka.jain@nxp.com, sjg@chromium.org, maks.mishinfz@gmail.com,
 meenakshi.aggarwal@nxp.com, patrick.delaunay@foss.st.com
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

Thanks all this is helpful

On Fri, 28 Mar 2025 at 19:15, Mark Kettenis <mark.kettenis@xs4all.nl> wrote:
>
> > Date: Fri, 28 Mar 2025 10:04:19 -0600
> > From: Tom Rini <trini@konsulko.com>
> >
> > On Fri, Mar 28, 2025 at 02:26:39PM +0200, Ilias Apalodimas wrote:
> > > On Fri, 28 Mar 2025 at 13:34, Simon Glass <sjg@chromium.org> wrote:
> > > >
> > > > Hi Ilias,
> > > >
> > > > On Thu, 27 Mar 2025 at 15:19, Ilias Apalodimas
> > > > <ilias.apalodimas@linaro.org> wrote:
> > > > >
> > > > > Hi Simon
> > > > >
> > > > > On Thu, 27 Mar 2025 at 15:33, Simon Glass <sjg@chromium.org> wrote:
> > > > > >
> > > > > > Hi Ilias,
> > > > > >
> > > > > > On Wed, 26 Mar 2025 at 02:37, Ilias Apalodimas
> > > > > > <ilias.apalodimas@linaro.org> wrote:
> > > > > > >
> > > > > > > Hi Heinrich,
> > > > > > >
> > > > > > > On Mon, 24 Mar 2025 at 19:50, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> > > > > > > >
> > > > > > > > On 17.03.25 14:38, Ilias Apalodimas wrote:
> > > > > > > >
> > > > > > > > %s/EFI_BOUNCE_BUFFER/CONFIG_EFI_LOADER_BOUNCE_BUFFER/
> > > > > > > >
> > > > > > > > > The EFI subsystem defines its own bounce buffer for devices that
> > > > > > > > > can't transfer data > 4GB. U-Boot already has a generic BOUNCE_BUFFER
> > > > > > > > > which can be reused instead of defining another symbol.
> > > > > > > > > The only limitation for EFI is that we don't know how big the file a user
> > > > > > > > > chooses to transfer is and as a result we can't depend on allocating the
> > > > > > > > > memory from the malloc area, which can prove too small.
> > > > > > > > >
> > > > > > > > > So allocate an EFI buffer of the correct size and pass it to the DM,
> > > > > > > > > which already supports bounce buffering via bounce_buffer_start_extalign()
> > > > > > > >
> > > > > > > > Looking at
> > > > > > > >
> > > > > > > >      if (IS_ENABLED(CONFIG_BOUNCE_BUFFER) && desc->bb) {
> > > > > > > >
> > > > > > > > in drivers/block/blk-uclass.c the bounce buffer has to be explicitly
> > > > > > > > enabled by the device driver. Only the scsi drivers sets bb = true.
> > > > > > > >
> > > > > > > > Cf. 81bd22e935dc ("rockchip: block: blk-uclass: add bounce buffer flag
> > > > > > > > to blk_desc")
> > > > > > > >
> > > > > > > > Which device-drivers of the boards mentioned below do actually need
> > > > > > > > bounce buffering?
> > > > > > >
> > > > > > > Unfortunately, I don't have any of the hardware to test and I havent
> > > > > > > worked with that platform much.
> > > > > > > That 'bb' variable and the fact that EFI needs bigger allocations is
> > > > > > > why I ended up allocationg properly aligned memory from the EFI
> > > > > > > subsystem. But as Mark pointed out, the cache flush is a no go for
> > > > > > > now, so I'll drop this and see if I find time to rework the bounce
> > > > > > > buffer logic overall
> > > > > >
> > > > > > There was quite a bit of discussion about all this in the context of
> > > > > > my attempt to just add a message to warn the user[1]
> > > > > >
> > > > > > We might consider adding an event to reserve memory before relocation,
> > > > > > along with a way to discover (in board_r) where the memory was
> > > > > > allocated. That would make the solution more generic.
> > > > >
> > > > > I am not sure what you are trying to solve here. The EFI bounce buffer
> > > > > after the LMB patches can't overwrite memory, nor can it be
> > > > > overwritten.
> > > >
> > > > I am thinking of we can create a single implementation of the
> > > > bouncebuf logic which also works for EFI.
> > > >
> > > > I think the two sane things to do are:
> > > > - restrict U-Boot to using memory below 4GB for platforms which have
> > > > the DMA limitation
> > >
> > > You don't need that. The bounce buf code has a callback you can use to
> > > define the limitations
> > >
> > > > - create (in board_f) a special region below 4GB for use with the
> > > > bouncebuf logic
> > >
> > > The only problem with EFI is that you don't know how much memory it
> > > needs and we can't use the existing memalign calls. So if we replace
> > > that memalign in the bounce buffer code, with an lmb reservation we
> > > have everything we need.
> >
> > It's not even an EFI problem is it?
>
> Fundamentall, yes, this isn't an EFI problem.

+1 it's not. As Heinrich explained EFI just makes it a lot easier to trigger

>
> > You could hit the same problem reading a file from a filesystem
> > outside of EFI too.
>
> Yes, but we tend to choose the addresses in the env variables that are
> used in the more traditional boot methods to prevent this.
>
> > These specific SoCs just aren't heavily exercised is one of the
> > challenges I think and so it's possible that we have a few things to
> > yet improve in the bounce buffer code (which was added for other
> > SoCs and done as generic enough starting point for others).
>
> The existing bounce buffer code was written to solve a completely
> different problem.  But it could indeed be generalized to solve this
> problem as well.  That requires somebody willing to work on a larger
> set of actual hardware that includes SoC with cache-coherency
> challanges (which is what the current bounce buffer implementation is
> there for) and SoCs with DMA addressing challenges.

So, I think if we
- Use LMB instead of memalign for the buffer allocation
- Add an explicit flag on the API to cache flush or not. We could add
this to the existing DM code
- Revisit the 'bb' variable usage and set it correctly on
drivers/platforms that need the bounce buffer

We should be covered, no?

Thanks
/Ilias
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
