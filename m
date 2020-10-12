Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F4128B123
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Oct 2020 11:09:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BACB1C32EA7
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Oct 2020 09:09:52 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56FA2C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Oct 2020 09:09:50 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id t20so9822923edr.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Oct 2020 02:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MFiZpUXXeJCuoNTKgiQuaTtg2SGk/OAFm81FBHNeYk4=;
 b=mekBjdw0ozeCL0qgtdAfgTetKoH+0RIhjLWbRrx/fnW9qIO55dOfXTeR1Y8W/KBa9r
 dxD/bKsPZWkcWljpXeBoKcTBul3lo+J/n0ZEiHYm7Re17DYN+Xhalq3nlk9HFoLRWzuk
 kQskuF3v4rzZCy9VOwdHRyPRuvboG4QPt9S6Ru0dY+mCYM53FkYq08jhowrZP4/b/MdJ
 uU/bzT598f+tjAigqO1QXv3Bci4y7zrVas4Gr65AUqoqREB8OS5KxjRqto4zPiqp2WQ3
 wglKdc4lyWiKled3ZFerMtTcujpnojOV6HEbobcU6+x5TL1Rq4h3Mqp/knXXa2Jl+cix
 Wg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MFiZpUXXeJCuoNTKgiQuaTtg2SGk/OAFm81FBHNeYk4=;
 b=kyN01R9WVSGuZszY7jlNZoer8N8UQgLish363PeaTUeDzm21LlyDfiylNQdRa0ZZgr
 sK6yl5uEzjUzRqBOhkPnFvACclqWlEJMHq9buEaPmRkK0MlgCHIIMBIVPlDrTgF3BA5s
 b73emHe7Ft/JRHjQou3Huf7cwdNS2alWi+CZGUw10+JQY5QvGUtZNZhUWJ0+xMD6HnYG
 aWecX0EGZTj+no5wKy/219/xpgPEEZC4t8+pGMjz0ZjpaJunpFtCVAvDNjnvcsnIAYJ2
 9l78kbkCNVP41uN0ny2H8JZXGhG5GJgLVKy5dX0uXM4Ps81JvU5mOZR+0YGKfmlSPKYT
 riwQ==
X-Gm-Message-State: AOAM5324Qml0R/C/KcuLWz9U9kEAyYEteHSB80ZJwsG042uhhNbE0SGG
 AWs7fUj+rwDNL0zwlMc3Y8URJN0qvW/BmmYIE1wYLg==
X-Google-Smtp-Source: ABdhPJxn1DJMHKAKZTZpFCUf2jZPIeS3+l05utmEdmZUxKFyzzWCgf+ZRHkOD4fZ5oVH48EjXSxpWIxCnqfhdD30S3Y=
X-Received: by 2002:aa7:c38b:: with SMTP id k11mr13147496edq.33.1602493790273; 
 Mon, 12 Oct 2020 02:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201006163602.21687-1-patrick.delaunay@st.com>
 <CAMj1kXET8=ERg7gGqWa-FwLZzAuztBsVMhyTGmYEMAxzb63_sw@mail.gmail.com>
 <190d019a-7e18-b4bc-9276-e14bbe4c2855@pengutronix.de>
 <31d9c120b2894c3b9ac6160e87306cc1@SFHDAG2NODE3.st.com>
 <8647d12f-02df-3ef5-78f1-1c064631ef07@pengutronix.de>
In-Reply-To: <8647d12f-02df-3ef5-78f1-1c064631ef07@pengutronix.de>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Mon, 12 Oct 2020 11:09:39 +0200
Message-ID: <CAN5uoS_EbyGTFEgZ5rU7c8YwqFrVpwg0XEyrLF-=CWsCYmQsQA@mail.gmail.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: chenshuo <chenshuo@eswin.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "marek.bykowski@gmail.com" <marek.bykowski@gmail.com>,
 Stefan Roese <sr@denx.de>, Ard Biesheuvel <ardb@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>,
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

This is right regarding the secure memory/NS=0. But the
reserved-memory node for OP-TEE can also cover non-secure (shared)
memory that OP-TEE secure world maps Normal/NS=1. So U-boot should not
map such memory as Device/NS=0. That would jeopardize non-secure
memory content.

Note that platforms can define either a single reserved-memory node in
the FDT for both contiguous secure and shared DDR
or platforms can alternatively define 2 reserved_memory nodes: one for
the secure DDR and one for the non-secure shared DDR.

In the 1st case, the no-map property of the single reserved-memory
node should really not map the area in U-Boot.

In the 2nd case, the no-map property on the secure DDR reserved-memory
node must prevent U-Boot speculative accesses while node for shared
memory obviously doesn't need no-map.

This is to say that mapping as Device memory that has the no-map
property can be an issue.

Etienne



>
> Cheers
> Ahmad
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
