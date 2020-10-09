Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB22C28912B
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Oct 2020 20:35:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E736C32EA7
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Oct 2020 18:35:58 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90062C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Oct 2020 18:35:56 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BE71C223AE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Oct 2020 18:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602268554;
 bh=epGjpLKjgVd+o3D1VIxLf+7BEg5edeaqXW9CYcPccto=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lwpaa0+sDwnurbHbQlllOHi3cue+ZorCSEvjrsFDm55jnIpOZMkXRgtL9IpvqQQL6
 rpuqW6lQJAkWVCgNg2AQ/C0WnnPNipEbIaQm3JbS+ZX3bSsyGzG/HL5CDOY6CLYY6F
 WsAWGPNc1uWXXQsuG3IIb6SIsqOTP/9diSDZEels=
Received: by mail-oi1-f176.google.com with SMTP id z26so11117652oih.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Oct 2020 11:35:54 -0700 (PDT)
X-Gm-Message-State: AOAM5312D9/HkqRyiL21ulrwuRV6HAWox2QXgVac3F4crx13c7o9DFzy
 KVkOsrYDibmmYhnjcu56qfQw32lncGzRgmQ69tw=
X-Google-Smtp-Source: ABdhPJzNkDrGfhIyoljpTOCTmK8FxraCvzGUVRESI6tCHPMIK325TFK+V31q79PW6X7VUXAl1QcIrOvi/hYGLCN4j2Q=
X-Received: by 2002:a05:6808:8e5:: with SMTP id
 d5mr3380891oic.33.1602268553920; 
 Fri, 09 Oct 2020 11:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201006163602.21687-1-patrick.delaunay@st.com>
 <CAMj1kXET8=ERg7gGqWa-FwLZzAuztBsVMhyTGmYEMAxzb63_sw@mail.gmail.com>
 <190d019a-7e18-b4bc-9276-e14bbe4c2855@pengutronix.de>
 <31d9c120b2894c3b9ac6160e87306cc1@SFHDAG2NODE3.st.com>
 <8647d12f-02df-3ef5-78f1-1c064631ef07@pengutronix.de>
In-Reply-To: <8647d12f-02df-3ef5-78f1-1c064631ef07@pengutronix.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 9 Oct 2020 20:35:41 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHcjq8UtxOG+iatX29wa-5bPGnsP5qyHL_eVzXR6KzODw@mail.gmail.com>
Message-ID: <CAMj1kXHcjq8UtxOG+iatX29wa-5bPGnsP5qyHL_eVzXR6KzODw@mail.gmail.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
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
 Etienne Carriere <etienne.carriere@linaro.org>,
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

On Fri, 9 Oct 2020 at 19:13, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> Hello Patrick,
>
> On 10/9/20 5:52 PM, Patrick DELAUNAY wrote:
> > I checked DACR behavior and CheckDomain /  CheckPermission
> >
> > In my case the cortex A7 try to access to part of DDR / mapped cacheable and bufferable, protected by firewall.
> >
> > So to use DACR I always need to configure the MMU with several Domain
> > - unsecure part of DDR as Domain 0 (DCACHE_WRITEALLOC)
> > - secure part of DDR as  Domain 1 (DCACHE_OFF)
> >
> > For other part of MMU region, the I/O registers are mapped as register with Domain 0 (D_CACHE_OFF)
> >
> > Then I can set DACR = 0x55555555
> > => Client Accesses are checked against the access permission bits in the TLB entry
> >
> > You ar right, the access permission is check only for domain configurated as client in DACR
> >
> > But in ARM architecture
> >
> > B2.4.8 Access permission checking
> >
> > CheckPermission() pseudo code
> > Only check perms.ap is checked
> > And perms.xp is not checked
> >
> > But as the secure memory is mapped cacheable by secure OS, OP-TEE
> > I think to avoid to map the region is the ARM preconized solution
> > As explain in my answer to ard in [1]
> >
> > [1] http://u-boot.10912.n7.nabble.com/PATCH-0-7-arm-cache-cp15-don-t-map-reserved-region-with-no-map-property-tt428715.html#a428958
>
> I don't think the aliasing described in "A3.5.7 Memory access restrictions" applies if the
> same memory is mapped twice only, once in secure and another in normal world.
> Data is already segregated in the caches by means of a NS bit. Only thing you should need
> to do within normal world is mapping it XN, cacheable and not be in manager domain.
> Unmapping sounds unnecessary to me. (You don't unmap peripherals you aren't using either.
> Why handle OP-TEE DRAM specially?)
>

Ah good point. The secure DDR is in the secure physical address space,
whereas the non-secure mapping refers to non-secure physical memory.
So from a coherency point of view, they are really not aliases of one
another, and so the mismatched attribute concern does not apply.

But this actually reinforces my previous point too: the secure and
non-secure physical address spaces are disjoint, and the DT can only
describe non-secure memory, so these regions don't belong in the DT
given to the OS in the first place.



>
>
> >
> >> Cheers
> >> Ahmad
> >>
> >> --
> >> Pengutronix e.K.                           |                             |
> >> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> >> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> >> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
>
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
