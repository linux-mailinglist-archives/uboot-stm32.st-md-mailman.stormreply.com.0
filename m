Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F07B825FCFD
	for <lists+uboot-stm32@lfdr.de>; Mon,  7 Sep 2020 17:25:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1B1AC3FAE0
	for <lists+uboot-stm32@lfdr.de>; Mon,  7 Sep 2020 15:25:00 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE3CFC36B33
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Sep 2020 15:24:59 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id r7so5327474ejs.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Sep 2020 08:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xeLZOGY0Q6wnB6ftPpFx/0o9Fg3OXw8dYyTBM1ICsgg=;
 b=pwJV1bR6Q8EYbYgdh9wYAfpczW1LuLRs6aObuvRWBXE++1NWVjFVnIhxWF3yUsEYDD
 X8xp/b8qWw3iy00TNtRnEMxDUN8/LTVUh6LCaLDi2Tp71RSoQVAAEV6WdADecFAp3wyV
 F+5Aob7yBgZIKazDlw3h31LhXC4c/Csqvq87D/1MTsRvVu+yrxCxBky6uvRKIRjSmsED
 UZxgURTR8wKl9YeOFEsoONsHsZib7eyoyNu5Rx/+orPqPsmxgs44StljrFb3pGcBaO0L
 QD8ZaysrDX8shAyj08eRq3zG+RmUWmQBcaoFpG6e0MOfOyHIFBbkyYzfFyQQLTYHu+jy
 MxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xeLZOGY0Q6wnB6ftPpFx/0o9Fg3OXw8dYyTBM1ICsgg=;
 b=oG9l7kCeTzcZYVkzqjqPPNuNTVclrXzQmY8MXUMnFJCAGr+eupl7zYkb9iCHUL1t5p
 ZPSDk4g6iVewbHCeY1E987uVB4bLlBV47L9DyeTMkFddF0LI+L48sbKOjMdLgh1ZUlXb
 1lprrU2kvSw+BZsn4xzptQSdpwsbfbvz6bLqw0DG7HwePaIiekZAaBdA4hpGRYe5xRwy
 ZzjF9d/yCp2TSOpT4KTrzZKhQMscrMbbGBiAo9SXe867Uk/CzpZr27k9xOgmcblCbdYX
 JcjAFQRpBCW1/+ZP0cY1H6Y/Hj4q2WPpRJ9zRNwjmMM2JX1LZqjhVxQRLq90t8QQ1wfb
 mK1w==
X-Gm-Message-State: AOAM533agqlb7vD1jREDmDSakXu1QpPJ1U/z9sH1I+iNaLK7IYcz46ZW
 iXh7ozsGZkD+T6Gld1IHbADKEfAzUVBL9lz4eF50Kg==
X-Google-Smtp-Source: ABdhPJwFHw0pUAxega5glo0KoO2pfSzgMfpgGpm4tPbaOhF6xJw/AAA3gNSG5TFIShOt/RQKuGI+jUgNUfjPOHxcCg0=
X-Received: by 2002:a17:906:19db:: with SMTP id
 h27mr19865613ejd.154.1599492298562; 
 Mon, 07 Sep 2020 08:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200904105133.2502-1-patrick.delaunay@st.com>
 <CAMj1kXHTJpfjUX_KdCvmzVm2m7B61yVvnb95NNh8yhphyROchg@mail.gmail.com>
In-Reply-To: <CAMj1kXHTJpfjUX_KdCvmzVm2m7B61yVvnb95NNh8yhphyROchg@mail.gmail.com>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Mon, 7 Sep 2020 17:24:47 +0200
Message-ID: <CAN5uoS9NJv5--9CRMmoUSN10K-dmeHfmhP1haDaidg1zfAR8Sw@mail.gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Rajesh Ravi <rajesh.ravi@broadcom.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>, Tero Kristo <t-kristo@ti.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Thirupathaiah Annapureddy <thiruan@linux.microsoft.com>,
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

On Fri, 4 Sep 2020 at 14:25, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Fri, 4 Sep 2020 at 13:51, Patrick Delaunay <patrick.delaunay@st.com> wrote:
> >
> > arm: cache: cp15: don't map reserved region with no-map property
> >
> > Hi,
> >
> > On STM32MP15x platform we can use OP-TEE, loaded in DDR in a region protected
> > by a firewall. This region is reserved in device with "no-map" property.
> >
> > But sometime the platform boot failed in U-boot on a Cortex A7 access to this
> > region (depending of the binary and the issue can change with compiler version or
> > with code alignment), then the firewall raise a error, for example:
> >
> > E/TC:0   tzc_it_handler:19 TZC permission failure
> > E/TC:0   dump_fail_filter:420 Permission violation on filter 0
> > E/TC:0   dump_fail_filter:425 Violation @0xde5c6bf0, non-secure privileged read, AXI ID 5c0
> > E/TC:0   Panic
> >
> > After investigation, the forbidden access is a speculative request performed by
> > the Cortex A7 because all the DDR is mapped as MEMORY with CACHEABLE property.
> >
> > The issue is solved only when the region reserved by OP-TEE is no more mapped
> > in U-Boot (mapped as DEVICE/NON-CACHEABLE wasn't enough) as it is already done
> > in Linux kernel.
> >
>
> The only speculative accesses to such regions permitted by the
> architecture are instruction fetches, which is why setting the nx
> attribute is required on v7 for device mappings.
>
> Does uboot currently honour this requirement?

I think current U-Boot honours the speculative side by using a IO memory
default mapping strategy. If the reserved memory is used by a driver
with a specific
mapping, u-boot cannot ensure the mapping won't conflict with default mapping.
For example OP-TEE defines a portion of this memory as non-secure
cached shared memory.
With Arm, we cannot map an area both as cached memory and as IO memory
(Device/StronglyOrdered).
So here, using a not-mapped strategy for "no-map" property looks better.

Regards,
Etienne

>
>
> > I think that can be a general issue for ARM architecture: the no-map tag in
> > device should be respected by U-boot, so I propose a  generic solution in
> > arm/lib/cache-cp15.c:dram_bank_mmu_setup().
> >
> > This RFC serie is composed by 7 patches
> > - 1..4/7: preliminary steps to support flags in library in lmb
> >   (as it is done in memblock.c in Linux)
> > - 5/7: unitary test on the added feature in lmb lib
> > - 6/7: save the no-map flags in lmb when the device tree is parsed
> > - 7/7: update the generic behavior for "no-map" region in
> >        arm/lib/cache-cp15.c::dram_bank_mmu_setup()
> >
> > I can change this last patch if it is required by other ARM architecture;
> > it is a weak function so I can avoid to map the region with "no-map"
> > property in device tree only for STM32MP architecture
> > (in arch/arm/mach-stm32mp/cpu.c).
> >
> > See also [1] which handle same speculative access on armv8 for area
> > with Executable attribute.
> >
> > [1] http://patchwork.ozlabs.org/project/uboot/patch/20200903000106.5016-1-marek.bykowski@gmail.com/
> >
> > Regards
> > Patrick
> >
> >
> > Patrick Delaunay (7):
> >   lmb: Add support of flags for no-map properties
> >   lmb: add lmb_is_reserved_flags
> >   lmb: remove lmb_region.size
> >   lmb: add lmb_dump_region() function
> >   test: lmb: add test for lmb_reserve_flags
> >   image-fdt: save no-map parameter of reserve-memory
> >   arm: cache: cp15: don't map the reserved region with no-map property
> >
> >  arch/arm/include/asm/system.h |   3 +
> >  arch/arm/lib/cache-cp15.c     |  17 +++++-
> >  common/image-fdt.c            |  23 +++++---
> >  include/lmb.h                 |  22 +++++++-
> >  lib/lmb.c                     | 100 +++++++++++++++++++++++-----------
> >  test/lib/lmb.c                |  89 ++++++++++++++++++++++++++++++
> >  6 files changed, 210 insertions(+), 44 deletions(-)
> >
> > --
> > 2.17.1
> >
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
