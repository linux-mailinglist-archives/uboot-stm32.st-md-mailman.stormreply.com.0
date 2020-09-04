Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AE725D939
	for <lists+uboot-stm32@lfdr.de>; Fri,  4 Sep 2020 15:03:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 111B1C3FADA
	for <lists+uboot-stm32@lfdr.de>; Fri,  4 Sep 2020 13:03:51 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 697A6C3FAD8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Sep 2020 12:25:27 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D943D215A4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Sep 2020 12:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599222326;
 bh=mvLDpaZhgyYyTzTJ2LWW0yFbMNncaB9fUot85giDPVA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=G9qlbZbXJ9TSxxr5CMOwJaz3/LLgYHVjqk6SPGcVbCqyAfaCKguh5xhwIOQ3/XvTI
 kM6olajDjExZU2Mjalygb6q2sUW6gaO+6GxlKR4KNGlhNrR+d3btcnNDA2p2pRiWPG
 h572ULieWQGFxGBbcK9/8GY5d6dcqH86Ls98RWRk=
Received: by mail-oo1-f44.google.com with SMTP id h9so1564617ooo.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Sep 2020 05:25:25 -0700 (PDT)
X-Gm-Message-State: AOAM530FtPrE8TcBv2Po3CPuIomsDGIfwEviihNaWn51ePYu0xdblOXh
 d0FLoPyRRG3SIIeRSpsktPFr8JiUVz3BnDcwxNM=
X-Google-Smtp-Source: ABdhPJzkolT+Qy4iBaepe5CRzvxN5YMOs2++Iqb1fopkZUFOfz70aTEQrtej5Axy8QuyjK+ksBA4eR5Uwce177mPFDU=
X-Received: by 2002:a4a:b443:: with SMTP id h3mr5597707ooo.45.1599222325066;
 Fri, 04 Sep 2020 05:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200904105133.2502-1-patrick.delaunay@st.com>
In-Reply-To: <20200904105133.2502-1-patrick.delaunay@st.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 4 Sep 2020 15:25:13 +0300
X-Gmail-Original-Message-ID: <CAMj1kXHTJpfjUX_KdCvmzVm2m7B61yVvnb95NNh8yhphyROchg@mail.gmail.com>
Message-ID: <CAMj1kXHTJpfjUX_KdCvmzVm2m7B61yVvnb95NNh8yhphyROchg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
X-Mailman-Approved-At: Fri, 04 Sep 2020 13:03:49 +0000
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Rajesh Ravi <rajesh.ravi@broadcom.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Tero Kristo <t-kristo@ti.com>,
 u-boot@lists.denx.de, Thirupathaiah Annapureddy <thiruan@linux.microsoft.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Jens Wiklander <jens.wiklander@linaro.org>,
 chenshuo <chenshuo@eswin.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Uboot-stm32] [RFC PATCH 0/7]
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

On Fri, 4 Sep 2020 at 13:51, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> arm: cache: cp15: don't map reserved region with no-map property
>
> Hi,
>
> On STM32MP15x platform we can use OP-TEE, loaded in DDR in a region protected
> by a firewall. This region is reserved in device with "no-map" property.
>
> But sometime the platform boot failed in U-boot on a Cortex A7 access to this
> region (depending of the binary and the issue can change with compiler version or
> with code alignment), then the firewall raise a error, for example:
>
> E/TC:0   tzc_it_handler:19 TZC permission failure
> E/TC:0   dump_fail_filter:420 Permission violation on filter 0
> E/TC:0   dump_fail_filter:425 Violation @0xde5c6bf0, non-secure privileged read, AXI ID 5c0
> E/TC:0   Panic
>
> After investigation, the forbidden access is a speculative request performed by
> the Cortex A7 because all the DDR is mapped as MEMORY with CACHEABLE property.
>
> The issue is solved only when the region reserved by OP-TEE is no more mapped
> in U-Boot (mapped as DEVICE/NON-CACHEABLE wasn't enough) as it is already done
> in Linux kernel.
>

The only speculative accesses to such regions permitted by the
architecture are instruction fetches, which is why setting the nx
attribute is required on v7 for device mappings.

Does uboot currently honour this requirement?


> I think that can be a general issue for ARM architecture: the no-map tag in
> device should be respected by U-boot, so I propose a  generic solution in
> arm/lib/cache-cp15.c:dram_bank_mmu_setup().
>
> This RFC serie is composed by 7 patches
> - 1..4/7: preliminary steps to support flags in library in lmb
>   (as it is done in memblock.c in Linux)
> - 5/7: unitary test on the added feature in lmb lib
> - 6/7: save the no-map flags in lmb when the device tree is parsed
> - 7/7: update the generic behavior for "no-map" region in
>        arm/lib/cache-cp15.c::dram_bank_mmu_setup()
>
> I can change this last patch if it is required by other ARM architecture;
> it is a weak function so I can avoid to map the region with "no-map"
> property in device tree only for STM32MP architecture
> (in arch/arm/mach-stm32mp/cpu.c).
>
> See also [1] which handle same speculative access on armv8 for area
> with Executable attribute.
>
> [1] http://patchwork.ozlabs.org/project/uboot/patch/20200903000106.5016-1-marek.bykowski@gmail.com/
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
>  arch/arm/lib/cache-cp15.c     |  17 +++++-
>  common/image-fdt.c            |  23 +++++---
>  include/lmb.h                 |  22 +++++++-
>  lib/lmb.c                     | 100 +++++++++++++++++++++++-----------
>  test/lib/lmb.c                |  89 ++++++++++++++++++++++++++++++
>  6 files changed, 210 insertions(+), 44 deletions(-)
>
> --
> 2.17.1
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
