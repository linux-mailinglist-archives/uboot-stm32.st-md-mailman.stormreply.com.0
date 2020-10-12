Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1AE28B1C7
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Oct 2020 11:51:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E617C35E2B
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Oct 2020 09:51:45 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A77AC36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Oct 2020 09:51:44 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id l16so16268435eds.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Oct 2020 02:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yrP2yGDFiGVSL+5bt8wNeS6tVSnRs2Kqw7/6xp2/axg=;
 b=g5OPnqQVt3amRTMwcoL4uZ7toHOn9YwSU11u/k5lfF5LFK/uNbdPEx1416FBpBEKva
 Xu3gpRirPVu1dl2x7iOvkHtP0PZz4Lfhm6jyGdlOyt7f4Q2scwFSnBQlbvIyNThkopcf
 gjePOFOxMbtZDvV0HryzRec5DPoyqnJ9FIYFrBrrluA1oB3ev005VZnxUoPDyqkZ1fHr
 i6jRy3LqJICgKkl5Av9CVq9dPw5fxCIYHt/4i6S+JZNPRtu6nO6v/OGU1+yZyCP3s72r
 kZYjtDZ6FjU8Nj3IFlW086lx7VlsJA60yS4VddWLYKpHAsPrbHkL+Tmqo2clLLyrEOBv
 v9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yrP2yGDFiGVSL+5bt8wNeS6tVSnRs2Kqw7/6xp2/axg=;
 b=fp/3olf1x5/t2uygVmOU0oQLf4g3+BBh8OHIBcfxBEYuEMAKZK37/rO+aABqatqn64
 dpolF3UlNqUFrlLgKvpf5ZO+3V/PWLmWavGyQj+w25mD5XAGr5YhqDZUJeLZn2fOfP4J
 GALnvwed3KeMde1MSV4bUV0lr23b3ezimdg0g/Jv7uSkxE+OzPk+LoXP5hdJbX+0YU6c
 Q2df1JB58sIe0Ke1nIaIVdUcy6QvoZJIACEHNPMsFLUlEEbW8fnJGHTI4D8ckBfCqHDr
 d5bY5+R/H8UM6U5Rw+LuyPs8OM1tkZ2e01orxW1cfvsaXQKnRnkbYKqlb4K4LayxFCli
 hEXA==
X-Gm-Message-State: AOAM531TYmEllOun7nOiAECa5GdZ2zw13jl58b1llLbP8fIn50P2gFRc
 o5o5PRhmqU4rTK0rzfFkpUx5L0V4+LUOjux7NGVtVA==
X-Google-Smtp-Source: ABdhPJx6osiEEpwJMXJnC7jTiG3X2jJ1LfR7donQeYdTKL9EIEyBQfVlAUdFh5idxOWqdaXei1HAWsD68umbojMzVRQ=
X-Received: by 2002:a50:b261:: with SMTP id o88mr13590954edd.150.1602496303653; 
 Mon, 12 Oct 2020 02:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20201006163602.21687-1-patrick.delaunay@st.com>
 <CAMj1kXET8=ERg7gGqWa-FwLZzAuztBsVMhyTGmYEMAxzb63_sw@mail.gmail.com>
 <190d019a-7e18-b4bc-9276-e14bbe4c2855@pengutronix.de>
 <31d9c120b2894c3b9ac6160e87306cc1@SFHDAG2NODE3.st.com>
 <8647d12f-02df-3ef5-78f1-1c064631ef07@pengutronix.de>
 <CAN5uoS_EbyGTFEgZ5rU7c8YwqFrVpwg0XEyrLF-=CWsCYmQsQA@mail.gmail.com>
 <CAMj1kXH81VRJkZ5qehDkWmKxnk_akbmfZCnSFuUpPgAUT_scRQ@mail.gmail.com>
In-Reply-To: <CAMj1kXH81VRJkZ5qehDkWmKxnk_akbmfZCnSFuUpPgAUT_scRQ@mail.gmail.com>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Mon, 12 Oct 2020 11:51:32 +0200
Message-ID: <CAN5uoS9XnnVeRynuT5asnVzGJDOAyq4p9j5jtJGVZ5Oe1yWBNg@mail.gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: chenshuo <chenshuo@eswin.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "marek.bykowski@gmail.com" <marek.bykowski@gmail.com>,
 Stefan Roese <sr@denx.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Rajesh Ravi <rajesh.ravi@broadcom.com>,
 Thirupathaiah Annapureddy <thiruan@linux.microsoft.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>,
 Tero Kristo <t-kristo@ti.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH 0/7] arm: cache: cp15: don't map reserved
 region with no-map property
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

On Mon, 12 Oct 2020 at 11:20, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Mon, 12 Oct 2020 at 11:09, Etienne Carriere
> <etienne.carriere@linaro.org> wrote:
> >
> > On Fri, 9 Oct 2020 at 19:13, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> > >
> > > Hello Patrick,
> > >
> > > On 10/9/20 5:52 PM, Patrick DELAUNAY wrote:
> > > > I checked DACR behavior and CheckDomain /  CheckPermission
> > > >
> > > > In my case the cortex A7 try to access to part of DDR / mapped cacheable and bufferable, protected by firewall.
> > > >
> > > > So to use DACR I always need to configure the MMU with several Domain
> > > > - unsecure part of DDR as Domain 0 (DCACHE_WRITEALLOC)
> > > > - secure part of DDR as  Domain 1 (DCACHE_OFF)
> > > >
> > > > For other part of MMU region, the I/O registers are mapped as register with Domain 0 (D_CACHE_OFF)
> > > >
> > > > Then I can set DACR = 0x55555555
> > > > => Client Accesses are checked against the access permission bits in the TLB entry
> > > >
> > > > You ar right, the access permission is check only for domain configurated as client in DACR
> > > >
> > > > But in ARM architecture
> > > >
> > > > B2.4.8 Access permission checking
> > > >
> > > > CheckPermission() pseudo code
> > > > Only check perms.ap is checked
> > > > And perms.xp is not checked
> > > >
> > > > But as the secure memory is mapped cacheable by secure OS, OP-TEE
> > > > I think to avoid to map the region is the ARM preconized solution
> > > > As explain in my answer to ard in [1]
> > > >
> > > > [1] http://u-boot.10912.n7.nabble.com/PATCH-0-7-arm-cache-cp15-don-t-map-reserved-region-with-no-map-property-tt428715.html#a428958
> > >
> > > I don't think the aliasing described in "A3.5.7 Memory access restrictions" applies if the
> > > same memory is mapped twice only, once in secure and another in normal world.
> > > Data is already segregated in the caches by means of a NS bit. Only thing you should need
> > > to do within normal world is mapping it XN, cacheable and not be in manager domain.
> > > Unmapping sounds unnecessary to me. (You don't unmap peripherals you aren't using either.
> > > Why handle OP-TEE DRAM specially?)
> >
> > This is right regarding the secure memory/NS=0. But the
> > reserved-memory node for OP-TEE can also cover non-secure (shared)
> > memory that OP-TEE secure world maps Normal/NS=1. So U-boot should not
> > map such memory as Device/NS=0. That would jeopardize non-secure
> > memory content.
> >
>
> Agreed. If secure and non-secure need to have a coherent, cacheable
> view of that shared memory, non-secure device mappings must be
> avoided.
>
> But is no-map really needed for that memory? It needs to be mapped in
> any case to be usable for the non-secure world to communicate with the
> secure world, right?
>
> I'd assume the no-map is only needed if cacheable, inner shareable
> mappings are a problem.

The non-secure (shared) reserved-memory gets mapped by the related
driver (drivers/tee/optee/) at run time.
Hmm... actually, U-Boot driver does map or use this shared memory,
only Linux does.
But even if U-Boot optee driver does not map the shared memory, OP-TEE
secure world still likely does.

>
> > Note that platforms can define either a single reserved-memory node in
> > the FDT for both contiguous secure and shared DDR
> > or platforms can alternatively define 2 reserved_memory nodes: one for
> > the secure DDR and one for the non-secure shared DDR.
> >
> > In the 1st case, the no-map property of the single reserved-memory
> > node should really not map the area in U-Boot.
> >
> > In the 2nd case, the no-map property on the secure DDR reserved-memory
> > node must prevent U-Boot speculative accesses while node for shared
> > memory obviously doesn't need no-map.
> >
> > This is to say that mapping as Device memory that has the no-map
> > property can be an issue.
> >
>
> So in summary, there are two separate requirements resulting from this:
> - the DT should not describe secure world memory as ordinary memory,
> as the S and NS address spaces could overlap, and the distinction only
> makes sense for agents running in the secure world;

I don't mean S and NS can overlap.
I say that reserved-memory with no-map could cover as well S only or
contiguous S and NS ranges.
So no-map does not specifically mean S. It means: only driver knows
how to map the thing.

> - no-map should be honored by u-boot, but it should only be used if
> the existence of a cacheable, inner shareable mapping of that memory
> poses a problem.

I would say yes, does this description really cover the requirements?
I think no-map should be honored for memory that doesn't suit U-Boot
default mapping strategy if this one is Device memory in arm arch.
Note that linux default memory mapping strategy is
Normal/Shared/Cached. No-map should be agnostic from what is software
mapping strategy.


etienne


>
> --
> Ard.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
