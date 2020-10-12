Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A0D28B152
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Oct 2020 11:20:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FC31C32EA7
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Oct 2020 09:20:31 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BAD8C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Oct 2020 09:20:29 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8B56D221FF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Oct 2020 09:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602494427;
 bh=z1Zb+ic+SKG+wPgsoYa9Y/kOy7BjwhfgTvAjuKlB76g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=efyJCcoP+mUZ6QyHIrlk0Iv6+Ikb/aEBTlY29OKXHoCpra6r3QZNAYQiLYSuCc+Ad
 6kWOWETBHFkDC8uU2XCwrThrZKCvcwq6/C+O2ugxzwpIjkrawTyKpvr5lL5Eb3G0UN
 Ms+3SiJsIiEmsr4NLKqSTtod1SeYyK9weF7jIIc4=
Received: by mail-oo1-f48.google.com with SMTP id r7so2742622ool.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Oct 2020 02:20:27 -0700 (PDT)
X-Gm-Message-State: AOAM531FKymCeAqtnDaR+mTB7s2oDO1gxT0ur5pN6Fu/zorSxAyXdUCH
 icwD9tGDTc8TYRtkPmTNfEqTs08lny5PTXcM62A=
X-Google-Smtp-Source: ABdhPJyc3MiQ/0BDUXJoU9oVEPJxbhhGk0h6ZNjUDTCZ5l+TZaBOqYDWsN7nyoqlXptqPnLAYuvLhYMI/wUT55biJHo=
X-Received: by 2002:a4a:c3ca:: with SMTP id e10mr17934101ooq.41.1602494426558; 
 Mon, 12 Oct 2020 02:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20201006163602.21687-1-patrick.delaunay@st.com>
 <CAMj1kXET8=ERg7gGqWa-FwLZzAuztBsVMhyTGmYEMAxzb63_sw@mail.gmail.com>
 <190d019a-7e18-b4bc-9276-e14bbe4c2855@pengutronix.de>
 <31d9c120b2894c3b9ac6160e87306cc1@SFHDAG2NODE3.st.com>
 <8647d12f-02df-3ef5-78f1-1c064631ef07@pengutronix.de>
 <CAN5uoS_EbyGTFEgZ5rU7c8YwqFrVpwg0XEyrLF-=CWsCYmQsQA@mail.gmail.com>
In-Reply-To: <CAN5uoS_EbyGTFEgZ5rU7c8YwqFrVpwg0XEyrLF-=CWsCYmQsQA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 12 Oct 2020 11:20:15 +0200
X-Gmail-Original-Message-ID: <CAMj1kXH81VRJkZ5qehDkWmKxnk_akbmfZCnSFuUpPgAUT_scRQ@mail.gmail.com>
Message-ID: <CAMj1kXH81VRJkZ5qehDkWmKxnk_akbmfZCnSFuUpPgAUT_scRQ@mail.gmail.com>
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

On Mon, 12 Oct 2020 at 11:09, Etienne Carriere
<etienne.carriere@linaro.org> wrote:
>
> On Fri, 9 Oct 2020 at 19:13, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >
> > Hello Patrick,
> >
> > On 10/9/20 5:52 PM, Patrick DELAUNAY wrote:
> > > I checked DACR behavior and CheckDomain /  CheckPermission
> > >
> > > In my case the cortex A7 try to access to part of DDR / mapped cacheable and bufferable, protected by firewall.
> > >
> > > So to use DACR I always need to configure the MMU with several Domain
> > > - unsecure part of DDR as Domain 0 (DCACHE_WRITEALLOC)
> > > - secure part of DDR as  Domain 1 (DCACHE_OFF)
> > >
> > > For other part of MMU region, the I/O registers are mapped as register with Domain 0 (D_CACHE_OFF)
> > >
> > > Then I can set DACR = 0x55555555
> > > => Client Accesses are checked against the access permission bits in the TLB entry
> > >
> > > You ar right, the access permission is check only for domain configurated as client in DACR
> > >
> > > But in ARM architecture
> > >
> > > B2.4.8 Access permission checking
> > >
> > > CheckPermission() pseudo code
> > > Only check perms.ap is checked
> > > And perms.xp is not checked
> > >
> > > But as the secure memory is mapped cacheable by secure OS, OP-TEE
> > > I think to avoid to map the region is the ARM preconized solution
> > > As explain in my answer to ard in [1]
> > >
> > > [1] http://u-boot.10912.n7.nabble.com/PATCH-0-7-arm-cache-cp15-don-t-map-reserved-region-with-no-map-property-tt428715.html#a428958
> >
> > I don't think the aliasing described in "A3.5.7 Memory access restrictions" applies if the
> > same memory is mapped twice only, once in secure and another in normal world.
> > Data is already segregated in the caches by means of a NS bit. Only thing you should need
> > to do within normal world is mapping it XN, cacheable and not be in manager domain.
> > Unmapping sounds unnecessary to me. (You don't unmap peripherals you aren't using either.
> > Why handle OP-TEE DRAM specially?)
>
> This is right regarding the secure memory/NS=0. But the
> reserved-memory node for OP-TEE can also cover non-secure (shared)
> memory that OP-TEE secure world maps Normal/NS=1. So U-boot should not
> map such memory as Device/NS=0. That would jeopardize non-secure
> memory content.
>

Agreed. If secure and non-secure need to have a coherent, cacheable
view of that shared memory, non-secure device mappings must be
avoided.

But is no-map really needed for that memory? It needs to be mapped in
any case to be usable for the non-secure world to communicate with the
secure world, right?

I'd assume the no-map is only needed if cacheable, inner shareable
mappings are a problem.

> Note that platforms can define either a single reserved-memory node in
> the FDT for both contiguous secure and shared DDR
> or platforms can alternatively define 2 reserved_memory nodes: one for
> the secure DDR and one for the non-secure shared DDR.
>
> In the 1st case, the no-map property of the single reserved-memory
> node should really not map the area in U-Boot.
>
> In the 2nd case, the no-map property on the secure DDR reserved-memory
> node must prevent U-Boot speculative accesses while node for shared
> memory obviously doesn't need no-map.
>
> This is to say that mapping as Device memory that has the no-map
> property can be an issue.
>

So in summary, there are two separate requirements resulting from this:
- the DT should not describe secure world memory as ordinary memory,
as the S and NS address spaces could overlap, and the distinction only
makes sense for agents running in the secure world;
- no-map should be honored by u-boot, but it should only be used if
the existence of a cacheable, inner shareable mapping of that memory
poses a problem.

-- 
Ard.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
