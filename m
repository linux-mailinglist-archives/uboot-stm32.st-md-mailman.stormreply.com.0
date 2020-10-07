Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5AB285CE0
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Oct 2020 12:26:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83C31C32EA7;
	Wed,  7 Oct 2020 10:26:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4595C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Oct 2020 10:26:48 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2AFC121775
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Oct 2020 10:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602066407;
 bh=vem9MdkzOa7GlkbdQ/URYoklyBc+gCZXgivFBHhxDc4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LXr1BwqVyFIYQdB+A27ITOyETzFhAzjnNLW6cR5PgmsIFhLX1hBgGCRSZshWLXymj
 RUu7Dq4wpckQd2Kz98buovTvQWev1EFD3HVb500l6ni+MKUIwPvMb/vW9IzU5icelU
 RXCiKqHWTGuXBWT3L2mIhO7vboQaOGmo7g72wDOs=
Received: by mail-oo1-f45.google.com with SMTP id y127so475911ooa.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Oct 2020 03:26:47 -0700 (PDT)
X-Gm-Message-State: AOAM530VIUxq1ETVau9AEdE17XivfUt8y87iF1HL72AWkR5JtoskRL1X
 GHZ/o+YpjMIlQj5UH/ZlaUu/FgDP3ETw3HVxwLo=
X-Google-Smtp-Source: ABdhPJyokqUDmbCPxbsMR1CB8hBsK9nDsuPVzro+dFAqWereqSNjHbKcO2/PI2pR6G8aBrxA8qRXYeMrhZs69DSSIY4=
X-Received: by 2002:a4a:b443:: with SMTP id h3mr1597412ooo.45.1602066406196;
 Wed, 07 Oct 2020 03:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201006163602.21687-1-patrick.delaunay@st.com>
In-Reply-To: <20201006163602.21687-1-patrick.delaunay@st.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 7 Oct 2020 12:26:34 +0200
X-Gmail-Original-Message-ID: <CAMj1kXET8=ERg7gGqWa-FwLZzAuztBsVMhyTGmYEMAxzb63_sw@mail.gmail.com>
Message-ID: <CAMj1kXET8=ERg7gGqWa-FwLZzAuztBsVMhyTGmYEMAxzb63_sw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: chenshuo <chenshuo@eswin.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 marek.bykowski@gmail.com, Stefan Roese <sr@denx.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>,
 Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Rajesh Ravi <rajesh.ravi@broadcom.com>,
 Thirupathaiah Annapureddy <thiruan@linux.microsoft.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bin Meng <bmeng.cn@gmail.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Simon Glass <sjg@chromium.org>, Tero Kristo <t-kristo@ti.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
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

On Tue, 6 Oct 2020 at 18:36, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
>
> Hi,
>
> On STM32MP15x platform we can use OP-TEE, loaded in DDR in a region
> protected by a firewall. This region is reserved in device with "no-map"
> property.
>
> But sometime the platform boot failed in U-boot on a Cortex A7 access to
> this region (depending of the binary and the issue can change with compiler
> version or with code alignment), then the firewall raise a error,
> for example:
>
> E/TC:0   tzc_it_handler:19 TZC permission failure
> E/TC:0   dump_fail_filter:420 Permission violation on filter 0
> E/TC:0   dump_fail_filter:425 Violation @0xde5c6bf0, non-secure privileged read,
>          AXI ID 5c0
> E/TC:0   Panic
>
> After investigation, the forbidden access is a speculative request performed
> by the Cortex A7 because all the DDR is mapped as MEMORY with CACHEABLE
> property.
>
> The issue is solved only when the region reserved by OP-TEE is no more
> mapped in U-Boot (mapped as DEVICE/NON-CACHEABLE wasn't enough) as it is
> already done in Linux kernel.
>

Spurious peculative accesses to device regions would be a severe
silicon bug, so I wonder what is going on here.

(Apologies if we are rehashing stuff here that has already been
discussed - I don't remember the details)

Are you sure that the speculative accesses were not caused by
misconfigured CPU or page tables, missing TLB maintenance, etc etc?
Because it really does smell like a software issue not a hardware
issue.

> I think that can be a general issue for ARM architecture: the no-map tag
> in device should be respected by U-boot, so I propose a  generic solution
> in arm/lib/cache-cp15.c:dram_bank_mmu_setup().
>
> This serie is composed by 7 patches
> - 1..4/7: preliminary steps to support flags in library in lmb
>   (as it is done in memblock.c in Linux)
> - 5/7: unitary test on the added feature in lmb lib
> - 6/7: save the no-map flags in lmb when the device tree is parsed
> - 7/7: update the generic behavior for "no-map" region in
>        arm/lib/cache-cp15.c::dram_bank_mmu_setup()
>
> It is a rebase on master branch of previous RFC [2].
>
> I can change this last patch if this feature is note required by other
> ARM architecture; it is a weak function so I can avoid to map the region
> with "no-map" property in device tree only for STM32MP architecture
> (in arch/arm/mach-stm32mp/cpu.c).
>
> See also [1] which handle same speculative access on armv8 for area
> with Executable attribute.
>
> [1] http://patchwork.ozlabs.org/project/uboot/patch/20200903000106.5016-1-marek.bykowski@gmail.com/
> [2] http://patchwork.ozlabs.org/project/uboot/list/?series=199486&archive=both&state=*
>
> Regards
> Patrick
>
>
> Patrick Delaunay (7):
>   lmb: Add support of flags for no-map properties
>   lmb: add lmb_is_reserved_flags
>   lmb: remove lmb_region.size
>   lmb: add lmb_dump_region() function
>   test: lmb: add test for lmb_reserve_flags
>   image-fdt: save no-map parameter of reserve-memory
>   arm: cache: cp15: don't map the reserved region with no-map property
>
>  arch/arm/include/asm/system.h |   3 +
>  arch/arm/lib/cache-cp15.c     |  19 ++++++-
>  common/image-fdt.c            |  23 +++++---
>  include/lmb.h                 |  22 +++++++-
>  lib/lmb.c                     | 100 +++++++++++++++++++++++-----------
>  test/lib/lmb.c                |  89 ++++++++++++++++++++++++++++++
>  6 files changed, 212 insertions(+), 44 deletions(-)
>
> --
> 2.17.1
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
