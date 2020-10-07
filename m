Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E90E285FE9
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Oct 2020 15:16:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6933C32EA7
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Oct 2020 13:16:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5569C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Oct 2020 13:16:06 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 08DAB21897
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Oct 2020 13:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602076565;
 bh=tuPZCNsNtdTM8yVLrZP2tok+yl8hx3rnidpWi0M3twA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=v5VEiUjQ6y2ApJQW383au8+vutn+FsL2JWductHZpoG9yCgpH/WrQR4fuJJN4IAvf
 l7OUZtDHJQPH0fqm1lpwMoj3C+75i4cokAKOoSRkYEzuzhjpOGJVd87MvNTHZgChJX
 udGHFRu3yfbU8m68OC5rjTylzH9RUxSGIQAaNvQY=
Received: by mail-ot1-f48.google.com with SMTP id f10so2135022otb.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Oct 2020 06:16:04 -0700 (PDT)
X-Gm-Message-State: AOAM5301PtUAg6Q4ENJXSCqt91UeCadfO+UOkGUiY11e+VFQgnXa/NmX
 3+ssCTLNTYVxBrUVHzokucL53AT5ccDv3rZ6gS8=
X-Google-Smtp-Source: ABdhPJy1nZJ2rC/zGnzrOD2GAVEchRgzgC9Abd78Jg1Y3hB8j7QEYJbWsKcedQm5EAEz+YMIB/RR3/D0cSvzjcKMsqg=
X-Received: by 2002:a9d:6a85:: with SMTP id l5mr1941432otq.77.1602076564009;
 Wed, 07 Oct 2020 06:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20201006163602.21687-1-patrick.delaunay@st.com>
 <CAMj1kXET8=ERg7gGqWa-FwLZzAuztBsVMhyTGmYEMAxzb63_sw@mail.gmail.com>
 <190d019a-7e18-b4bc-9276-e14bbe4c2855@pengutronix.de>
 <258ba4fa-8d1e-56be-e0de-2d6c09812c13@pengutronix.de>
In-Reply-To: <258ba4fa-8d1e-56be-e0de-2d6c09812c13@pengutronix.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 7 Oct 2020 15:15:53 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFoJx7henE0FbSXzsATH4z4Xg8EfJkc+ki7=i33cz3Vew@mail.gmail.com>
Message-ID: <CAMj1kXFoJx7henE0FbSXzsATH4z4Xg8EfJkc+ki7=i33cz3Vew@mail.gmail.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: chenshuo <chenshuo@eswin.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 marek.bykowski@gmail.com, Stefan Roese <sr@denx.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>,
 Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
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

On Wed, 7 Oct 2020 at 13:53, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> Hello,
>
> On 10/7/20 1:23 PM, Ahmad Fatoum wrote:
> > My findings[1] back then were that U-Boot did set the eXecute Never bit only on
> > OMAP, but not for other platforms.  So I could imagine this being the root cause
> > of Patrick's issues as well:
>
> Rereading my own link, my memory is a little less fuzzy: eXecute Never was being
> set, but was without effect due Manager mode being set in the DACR:
>
> > The ARM Architecture Reference Manual notes[1]:
> > > When using the Short-descriptor translation table format, the XN
> > > attribute is not checked for domains marked as Manager.
> > > Therefore, the system must not include read-sensitive memory in
> > > domains marked as Manager, because the XN bit does not prevent
> > > speculative fetches from a Manager domain.
>
> > To avoid speculative access to read-sensitive memory-mapped peripherals
> > on ARMv7, we'll need U-Boot to use client domain permissions, so the XN
> > bit can function.
>
> > This issue has come up before and was fixed in de63ac278
> > ("ARM: mmu: Set domain permissions to client access") for OMAP2 only.
> > It's equally applicable to all ARMv7-A platforms where caches are
> > enabled.
> > [1]: B3.7.2 - Execute-never restrictions on instruction fetching
>
> Hope this helps,
> Ahmad
>

It most definitely does, thanks a lot.

U-boot's mmu_setup() currently sets DACR to manager for all domains,
so this is broken for all non-LPAE configurations running on v7 CPUs
(except OMAP and perhaps others that fixed it individually). This
affects all device mappings: not just secure DRAM for OP-TEE, but any
MMIO register for any peripheral that is mapped into the CPU's address
space.

Patrick, could you please check whether this fixes the issue as well?

--- a/arch/arm/lib/cache-cp15.c
+++ b/arch/arm/lib/cache-cp15.c
@@ -202,9 +202,9 @@ static inline void mmu_setup(void)
        asm volatile("mcr p15, 0, %0, c2, c0, 0"
                     : : "r" (gd->arch.tlb_addr) : "memory");
 #endif
-       /* Set the access control to all-supervisor */
+       /* Set the access control to client (0b01) for each of the 16 domains */
        asm volatile("mcr p15, 0, %0, c3, c0, 0"
-                    : : "r" (~0));
+                    : : "r" (0x55555555));

        arm_init_domains();
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
