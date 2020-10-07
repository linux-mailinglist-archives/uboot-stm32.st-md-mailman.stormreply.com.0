Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD922861EB
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Oct 2020 17:14:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0F4EC32EA7
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Oct 2020 15:14:13 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57117C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Oct 2020 15:14:12 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id p15so3471562ejm.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Oct 2020 08:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xRo3YqXEs4lSpqTcyP22GeEP2yd9hpVZRHojCBT4nCA=;
 b=i018DFhN9PyaQ/7HFv5h6Ui5eTgLY9Db1tAT6BeMKZcnd4Rc3D7iW1nuYNCWdR0LiR
 Z+WLNakL5GFrOUK3f8V+tPI6zfhoHphmQepkxAy79b0ckKZoOuvgSGDGOUaG25uls99R
 oQ/ZKknalTnk2Kf/RC51DX6wSmvSJnSwmQOzS1VV3MMy7BjqMLAPw06s9a85kqNI810B
 wjvlqwN+RafFg/w9xjqwRSC8WiTfFkjBj+XEe6rq7nLKu4nfYovxjlphCfXFi/g5y6kp
 RhNbRgEFhSiX4YclJ01z6piNGhECDEVywimDDDUB7M6VFrN1n7F2nGHTY57Ou8YRMhYZ
 Pv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xRo3YqXEs4lSpqTcyP22GeEP2yd9hpVZRHojCBT4nCA=;
 b=Rm8NSzeEF3sMAWlBbCRuRy5FMchp/HbZjI7MFfNCRlmVOjjFbLs0/kAhK3o8BODbb0
 cj0O09H8cBso7gw5i78SMgIzjp9TudD+KHS5JTGs/WpYdkeF45amtSwBl4/0aHZjqkoN
 cpGVw2bnH1Pq41fPROsjOyuPcSl67PcUv8DUvGBbYGMfvyHpPBA/Uq6soQ/KMcilUyET
 py2UGIaaSB9JSSBWGiAzxI0PcLuMqfQ4+ulUZMgI1WBGQYCVmFu1fQ3iZmVqVOpcqDVn
 0ngAnWUL2WfEgILMDYzF+RvKiEnJBUnhmNfrRNE7vW8kIkcF7o2xBFbxx6S4oNAQBhfu
 PJ5A==
X-Gm-Message-State: AOAM530r9EynNGcLZsItJDQjAEQ8ZRy/91cLdUkVyGiUg92aTKOZQQYu
 Im5iHwqkwj1a0rTCbuKzbzRosbILvhpIh/6U5r4vKA==
X-Google-Smtp-Source: ABdhPJwLbcddVMG9BpFQbVXTaH1/o3gSfG3XjHaBd5Q/7n1bqX3w1zwAo/5dng4dvefTq9MMA3RELrMOtPV0r22xjrA=
X-Received: by 2002:a17:906:4dc7:: with SMTP id
 f7mr3779110ejw.73.1602083651828; 
 Wed, 07 Oct 2020 08:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20201006163602.21687-1-patrick.delaunay@st.com>
 <CAMj1kXET8=ERg7gGqWa-FwLZzAuztBsVMhyTGmYEMAxzb63_sw@mail.gmail.com>
 <190d019a-7e18-b4bc-9276-e14bbe4c2855@pengutronix.de>
 <258ba4fa-8d1e-56be-e0de-2d6c09812c13@pengutronix.de>
 <CAMj1kXFoJx7henE0FbSXzsATH4z4Xg8EfJkc+ki7=i33cz3Vew@mail.gmail.com>
 <CAN5uoS_WpEymUbsr2=_t--M6EJJwPTy2XAqbkDvtejwfwPbC=A@mail.gmail.com>
 <CAMj1kXGOfMax-4KO9upqJi6WtuoNvK=KcdWoKeUqzEoJhrQGaA@mail.gmail.com>
In-Reply-To: <CAMj1kXGOfMax-4KO9upqJi6WtuoNvK=KcdWoKeUqzEoJhrQGaA@mail.gmail.com>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Wed, 7 Oct 2020 17:13:58 +0200
Message-ID: <CAN5uoS_2qmE-U-UM=2S9zmsRsEOLke1j8=D7QKu3fGLCu3vKOg@mail.gmail.com>
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

On Wed, 7 Oct 2020 at 17:08, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Wed, 7 Oct 2020 at 16:55, Etienne Carriere
> <etienne.carriere@linaro.org> wrote:
> >
> > Hello all,
> >
> > On Wed, 7 Oct 2020 at 15:16, Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > On Wed, 7 Oct 2020 at 13:53, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> > > >
> > > > Hello,
> > > >
> > > > On 10/7/20 1:23 PM, Ahmad Fatoum wrote:
> > > > > My findings[1] back then were that U-Boot did set the eXecute Never bit only on
> > > > > OMAP, but not for other platforms.  So I could imagine this being the root cause
> > > > > of Patrick's issues as well:
> > > >
> > > > Rereading my own link, my memory is a little less fuzzy: eXecute Never was being
> > > > set, but was without effect due Manager mode being set in the DACR:
> > > >
> > > > > The ARM Architecture Reference Manual notes[1]:
> > > > > > When using the Short-descriptor translation table format, the XN
> > > > > > attribute is not checked for domains marked as Manager.
> > > > > > Therefore, the system must not include read-sensitive memory in
> > > > > > domains marked as Manager, because the XN bit does not prevent
> > > > > > speculative fetches from a Manager domain.
> > > >
> > > > > To avoid speculative access to read-sensitive memory-mapped peripherals
> > > > > on ARMv7, we'll need U-Boot to use client domain permissions, so the XN
> > > > > bit can function.
> > > >
> > > > > This issue has come up before and was fixed in de63ac278
> > > > > ("ARM: mmu: Set domain permissions to client access") for OMAP2 only.
> > > > > It's equally applicable to all ARMv7-A platforms where caches are
> > > > > enabled.
> > > > > [1]: B3.7.2 - Execute-never restrictions on instruction fetching
> > > >
> > > > Hope this helps,
> > > > Ahmad
> > > >
> > >
> > > It most definitely does, thanks a lot.
> > >
> > > U-boot's mmu_setup() currently sets DACR to manager for all domains,
> > > so this is broken for all non-LPAE configurations running on v7 CPUs
> > > (except OMAP and perhaps others that fixed it individually). This
> > > affects all device mappings: not just secure DRAM for OP-TEE, but any
> > > MMIO register for any peripheral that is mapped into the CPU's address
> > > space.
> >
> > Despite the change proposed below seems to fix permissions bypass,
> > I think that not mapping the memory address ranges that are explicitly
> > expected to be not mapped (as in Patrick proposal) seems a consistent approach.
> >
>
> Agreed.
>
> But the issue Patrick is addressing uncovered a real bug that affects
> many platforms, so let's please take advantage of this, and get it
> fixed for everyone.
>
> Then, we can decide whether unmapping the secure DRAM is worth it or
> not, on its own merit, and not based on the justification that it
> fixes a bug that should be fixed in a different way in the first
> place.

Fair.

Etienne
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
