Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFC828B234
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Oct 2020 12:27:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19E9CC35E2B
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Oct 2020 10:27:33 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E3BDC36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Oct 2020 10:27:31 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B583E221FC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Oct 2020 10:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602498449;
 bh=HBYEJmwHiGbHQ7t5fneesdIojtr1Hv0V7kQdlyi+pZ4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sqDBmsvWPUsMmmOpH1wMDb4DDGcLw57PMw0ogzMote4V18hD28/cNrAd7tgdU1TE3
 8NJdz9A3KFPjPs+vPck7h9zAI+GDhlPiHTArNevaa78d9W5/Yih4DYW7VN17aM2w06
 gxiJV/sqifhtuqdTpCrRouH4xZawy/gB/i2s5X3c=
Received: by mail-oo1-f43.google.com with SMTP id l18so3945693ooa.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Oct 2020 03:27:29 -0700 (PDT)
X-Gm-Message-State: AOAM531gZKGZSSn36F5ulsVFNMuWqIqWWnP0FLfClaGgJ8kHttrTJqyk
 lvhTU1qmH+3dg8SzvUsGypO6gfGtEsVodmKaMQE=
X-Google-Smtp-Source: ABdhPJy45+9skpDRehbFNxYxUEpS/+hMhGz/uFzoMp7J26ePy44ECjvpgk4TzMuB28hncRa9XJNQDjVkTYUJoOLMB4s=
X-Received: by 2002:a4a:b443:: with SMTP id h3mr18068617ooo.45.1602498448765; 
 Mon, 12 Oct 2020 03:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201006163602.21687-1-patrick.delaunay@st.com>
 <CAMj1kXET8=ERg7gGqWa-FwLZzAuztBsVMhyTGmYEMAxzb63_sw@mail.gmail.com>
 <190d019a-7e18-b4bc-9276-e14bbe4c2855@pengutronix.de>
 <31d9c120b2894c3b9ac6160e87306cc1@SFHDAG2NODE3.st.com>
 <8647d12f-02df-3ef5-78f1-1c064631ef07@pengutronix.de>
 <CAN5uoS_EbyGTFEgZ5rU7c8YwqFrVpwg0XEyrLF-=CWsCYmQsQA@mail.gmail.com>
 <CAMj1kXH81VRJkZ5qehDkWmKxnk_akbmfZCnSFuUpPgAUT_scRQ@mail.gmail.com>
 <CAN5uoS9XnnVeRynuT5asnVzGJDOAyq4p9j5jtJGVZ5Oe1yWBNg@mail.gmail.com>
In-Reply-To: <CAN5uoS9XnnVeRynuT5asnVzGJDOAyq4p9j5jtJGVZ5Oe1yWBNg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 12 Oct 2020 12:27:17 +0200
X-Gmail-Original-Message-ID: <CAMj1kXERr=OK4LYm1dZgFqKVVMXAF=BuZvzAEqGoAqOiZj_nxA@mail.gmail.com>
Message-ID: <CAMj1kXERr=OK4LYm1dZgFqKVVMXAF=BuZvzAEqGoAqOiZj_nxA@mail.gmail.com>
To: Etienne Carriere <etienne.carriere@linaro.org>
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

On Mon, 12 Oct 2020 at 11:51, Etienne Carriere
<etienne.carriere@linaro.org> wrote:
>
> On Mon, 12 Oct 2020 at 11:20, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Mon, 12 Oct 2020 at 11:09, Etienne Carriere
> > <etienne.carriere@linaro.org> wrote:
> > >
> > > On Fri, 9 Oct 2020 at 19:13, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> > > >
> > > > Hello Patrick,
> > > >
> > > > On 10/9/20 5:52 PM, Patrick DELAUNAY wrote:
> > > > > I checked DACR behavior and CheckDomain /  CheckPermission
> > > > >
> > > > > In my case the cortex A7 try to access to part of DDR / mapped cacheable and bufferable, protected by firewall.
> > > > >
> > > > > So to use DACR I always need to configure the MMU with several Domain
> > > > > - unsecure part of DDR as Domain 0 (DCACHE_WRITEALLOC)
> > > > > - secure part of DDR as  Domain 1 (DCACHE_OFF)
> > > > >
> > > > > For other part of MMU region, the I/O registers are mapped as register with Domain 0 (D_CACHE_OFF)
> > > > >
> > > > > Then I can set DACR = 0x55555555
> > > > > => Client Accesses are checked against the access permission bits in the TLB entry
> > > > >
> > > > > You ar right, the access permission is check only for domain configurated as client in DACR
> > > > >
> > > > > But in ARM architecture
> > > > >
> > > > > B2.4.8 Access permission checking
> > > > >
> > > > > CheckPermission() pseudo code
> > > > > Only check perms.ap is checked
> > > > > And perms.xp is not checked
> > > > >
> > > > > But as the secure memory is mapped cacheable by secure OS, OP-TEE
> > > > > I think to avoid to map the region is the ARM preconized solution
> > > > > As explain in my answer to ard in [1]
> > > > >
> > > > > [1] http://u-boot.10912.n7.nabble.com/PATCH-0-7-arm-cache-cp15-don-t-map-reserved-region-with-no-map-property-tt428715.html#a428958
> > > >
> > > > I don't think the aliasing described in "A3.5.7 Memory access restrictions" applies if the
> > > > same memory is mapped twice only, once in secure and another in normal world.
> > > > Data is already segregated in the caches by means of a NS bit. Only thing you should need
> > > > to do within normal world is mapping it XN, cacheable and not be in manager domain.
> > > > Unmapping sounds unnecessary to me. (You don't unmap peripherals you aren't using either.
> > > > Why handle OP-TEE DRAM specially?)
> > >
> > > This is right regarding the secure memory/NS=0. But the
> > > reserved-memory node for OP-TEE can also cover non-secure (shared)
> > > memory that OP-TEE secure world maps Normal/NS=1. So U-boot should not
> > > map such memory as Device/NS=0. That would jeopardize non-secure
> > > memory content.
> > >
> >
> > Agreed. If secure and non-secure need to have a coherent, cacheable
> > view of that shared memory, non-secure device mappings must be
> > avoided.
> >
> > But is no-map really needed for that memory? It needs to be mapped in
> > any case to be usable for the non-secure world to communicate with the
> > secure world, right?
> >
> > I'd assume the no-map is only needed if cacheable, inner shareable
> > mappings are a problem.
>
> The non-secure (shared) reserved-memory gets mapped by the related
> driver (drivers/tee/optee/) at run time.
> Hmm... actually, U-Boot driver does map or use this shared memory,
> only Linux does.
> But even if U-Boot optee driver does not map the shared memory, OP-TEE
> secure world still likely does.
>
> >
> > > Note that platforms can define either a single reserved-memory node in
> > > the FDT for both contiguous secure and shared DDR
> > > or platforms can alternatively define 2 reserved_memory nodes: one for
> > > the secure DDR and one for the non-secure shared DDR.
> > >
> > > In the 1st case, the no-map property of the single reserved-memory
> > > node should really not map the area in U-Boot.
> > >
> > > In the 2nd case, the no-map property on the secure DDR reserved-memory
> > > node must prevent U-Boot speculative accesses while node for shared
> > > memory obviously doesn't need no-map.
> > >
> > > This is to say that mapping as Device memory that has the no-map
> > > property can be an issue.
> > >
> >
> > So in summary, there are two separate requirements resulting from this:
> > - the DT should not describe secure world memory as ordinary memory,
> > as the S and NS address spaces could overlap, and the distinction only
> > makes sense for agents running in the secure world;
>
> I don't mean S and NS can overlap.
> I say that reserved-memory with no-map could cover as well S only or
> contiguous S and NS ranges.

No, it cannot. That is basically the point I am trying to clarify.

Even if in this particular case, the firewall configuration simply
moves part of the DDR between the secure and non-secure address
spaces, this is not required by the architecture. In the general case,
non-secure address N and secure address N could both be valid, and
refer to different things. When you describe something in the
/reserved-memory node, there is no way to disambiguate between S and
NS, and so the only assumption we can make is that all memory ranges
and reservations described in DT are non-secure.

Since the DDR region we are trying to protect is secure memory, it
should not be in the DT, since the DT only describes non-secure memory
to begin with.

> So no-map does not specifically mean S. It means: only driver knows
> how to map the thing.
>
> > - no-map should be honored by u-boot, but it should only be used if
> > the existence of a cacheable, inner shareable mapping of that memory
> > poses a problem.
>
> I would say yes, does this description really cover the requirements?
> I think no-map should be honored for memory that doesn't suit U-Boot
> default mapping strategy if this one is Device memory in arm arch.
> Note that linux default memory mapping strategy is
> Normal/Shared/Cached. No-map should be agnostic from what is software
> mapping strategy.
>

I assumed that U-boot maps all of memory cacheable, inner shareable,
but if that is not the case, I agree the non-secure shared region
should not be mapped at all, and so for this region, the no-map
attribute would be appropriate (and u-boot should honour it)
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
