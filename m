Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C6928619B
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Oct 2020 16:55:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07724C32EA7
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Oct 2020 14:55:56 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 673C3C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Oct 2020 14:55:54 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id 33so2454127edq.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Oct 2020 07:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9F0OB8q9fGJNK647UkJi8bC+AtxK4pv/pGM8IsQdkgU=;
 b=kmJCVnHGXmEx65pOIATvPGdMpJcm/ZOcMOikdl+iW8bYn5eFQvAtVcPOf2dnPwq0KZ
 ZCZQLSm4nj7FPku7/flw582gcn56fRVEvahfSW1ZeEKzz/tawnjfjAvhEk2ZNtCULR8M
 LPDqt9iWf3Vn+mTsklaXKp/Uz+FVxwDtaisb95sAabMiKYhnmukAtVFL+cLF+yc0wnW0
 9fDbRF1VLy7uoJRnm6WCVQZL1H7eUAqlEqH6mj99KkXV/6VcyppJmU8kdgR+Ov52ctEW
 XT3LJRiIWYf8r2tRXSpEASvgPQ4O6c9KWE8RphOKFsB31/52v+iNnGMzQWxUDYTNbGX4
 wKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9F0OB8q9fGJNK647UkJi8bC+AtxK4pv/pGM8IsQdkgU=;
 b=bAp5ad298tZkbnIKEYTbgTreIGI/MnbI9m7qQTtr9pEp8AQdnemiKaKQ4IZhoWJ7O9
 1C1hCvpxaUKis9qc6vze9vuRyeec+rkjQPKmjWq/usAMy/CVBr3+cDmJ1kPJASkeCBkS
 QtZWL+zMWrCuQvE/B1kJatD9uASRnrMeGycBOLiDaz1+TdS6JOOfEJfX+ho6YIxD0Qrf
 W6XMtcp/5f6W9VszCch0+eY8XFR5EbpMUw3n7wDzwW0+64NhuQyQhFy1XPUwtUFitj0V
 Q9pneNdiK1q9KBEeSv/F5E4jn6noiSE+9Mj/TQIXyYpLTVm8xCQ5kpNiQdX8juLTiykv
 yfTA==
X-Gm-Message-State: AOAM5323XpTocXQeFIkC3ApNFDXyIG9DEq/zCcsT1/2HA81JvXu2ucM+
 VSCPGvuTZhVE4DZCsx/QlDPhKEBOAnzPlKC1WzLRwQ==
X-Google-Smtp-Source: ABdhPJzN61puUXjHeKCOimQPEzC9xovIAOMRZkRRB7nPZpp4Uxdr+nQIlfImyPyzAnspk9ePSSbhSDV+Rk61p6Yn4XY=
X-Received: by 2002:a50:8b62:: with SMTP id l89mr4130221edl.132.1602082553866; 
 Wed, 07 Oct 2020 07:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201006163602.21687-1-patrick.delaunay@st.com>
 <CAMj1kXET8=ERg7gGqWa-FwLZzAuztBsVMhyTGmYEMAxzb63_sw@mail.gmail.com>
 <190d019a-7e18-b4bc-9276-e14bbe4c2855@pengutronix.de>
 <258ba4fa-8d1e-56be-e0de-2d6c09812c13@pengutronix.de>
 <CAMj1kXFoJx7henE0FbSXzsATH4z4Xg8EfJkc+ki7=i33cz3Vew@mail.gmail.com>
In-Reply-To: <CAMj1kXFoJx7henE0FbSXzsATH4z4Xg8EfJkc+ki7=i33cz3Vew@mail.gmail.com>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Wed, 7 Oct 2020 16:55:43 +0200
Message-ID: <CAN5uoS_WpEymUbsr2=_t--M6EJJwPTy2XAqbkDvtejwfwPbC=A@mail.gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>
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

Hello all,

On Wed, 7 Oct 2020 at 15:16, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Wed, 7 Oct 2020 at 13:53, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >
> > Hello,
> >
> > On 10/7/20 1:23 PM, Ahmad Fatoum wrote:
> > > My findings[1] back then were that U-Boot did set the eXecute Never bit only on
> > > OMAP, but not for other platforms.  So I could imagine this being the root cause
> > > of Patrick's issues as well:
> >
> > Rereading my own link, my memory is a little less fuzzy: eXecute Never was being
> > set, but was without effect due Manager mode being set in the DACR:
> >
> > > The ARM Architecture Reference Manual notes[1]:
> > > > When using the Short-descriptor translation table format, the XN
> > > > attribute is not checked for domains marked as Manager.
> > > > Therefore, the system must not include read-sensitive memory in
> > > > domains marked as Manager, because the XN bit does not prevent
> > > > speculative fetches from a Manager domain.
> >
> > > To avoid speculative access to read-sensitive memory-mapped peripherals
> > > on ARMv7, we'll need U-Boot to use client domain permissions, so the XN
> > > bit can function.
> >
> > > This issue has come up before and was fixed in de63ac278
> > > ("ARM: mmu: Set domain permissions to client access") for OMAP2 only.
> > > It's equally applicable to all ARMv7-A platforms where caches are
> > > enabled.
> > > [1]: B3.7.2 - Execute-never restrictions on instruction fetching
> >
> > Hope this helps,
> > Ahmad
> >
>
> It most definitely does, thanks a lot.
>
> U-boot's mmu_setup() currently sets DACR to manager for all domains,
> so this is broken for all non-LPAE configurations running on v7 CPUs
> (except OMAP and perhaps others that fixed it individually). This
> affects all device mappings: not just secure DRAM for OP-TEE, but any
> MMIO register for any peripheral that is mapped into the CPU's address
> space.

Despite the change proposed below seems to fix permissions bypass,
I think that not mapping the memory address ranges that are explicitly
expected to be not mapped (as in Patrick proposal) seems a consistent approach.

regards,
etienne

>
> Patrick, could you please check whether this fixes the issue as well?
>
> --- a/arch/arm/lib/cache-cp15.c
> +++ b/arch/arm/lib/cache-cp15.c
> @@ -202,9 +202,9 @@ static inline void mmu_setup(void)
>         asm volatile("mcr p15, 0, %0, c2, c0, 0"
>                      : : "r" (gd->arch.tlb_addr) : "memory");
>  #endif
> -       /* Set the access control to all-supervisor */
> +       /* Set the access control to client (0b01) for each of the 16 domains */
>         asm volatile("mcr p15, 0, %0, c3, c0, 0"
> -                    : : "r" (~0));
> +                    : : "r" (0x55555555));
>
>         arm_init_domains();
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
