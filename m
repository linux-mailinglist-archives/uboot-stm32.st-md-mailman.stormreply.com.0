Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDF136EDE6
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Apr 2021 18:11:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38324C58D5A;
	Thu, 29 Apr 2021 16:11:05 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E863EC58D59
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 16:11:03 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 65-20020a9d03470000b02902808b4aec6dso57060898otv.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 09:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nRA9EClE4hIuojK799GaxVV+B8157TllAJjwH+xeH2Q=;
 b=L6g2jBoCk5PSlSP3tH4zEZ2lS0cJtNp+xptayMCSPQCBXay9JPrTrR1cSKX+RNlHyM
 VFyMQvzse0BJWy8dJQzHLWKcnf3hCNdzeB99mL7YX0twAW7Mc/kIcNAoyu7c8AubotZG
 peOdJ97/tCwZ4LxPp22A1KsTo0uTRBC+AyTw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nRA9EClE4hIuojK799GaxVV+B8157TllAJjwH+xeH2Q=;
 b=e6/oBZ9B4PVG/kTNb4PrJIg/YCNaR3j1P1aHBCVC1OAlhzshMIlrHYp9si9yQtpv0h
 aPj2CHSBKWhD44oZJCki43JdFzLkZk9pD/q9LikXToB9F4wW8TrHen7DgwgWdBvwCE6B
 cu9k8LMv+jJ4qz3G1fKKJlysXjZqVpfaxu4Ir40jI2+Wj6lA7MRISlZrjr7FUAdnJjdL
 /mcFA3qZ+I+/lIcwu0pnQTNfD3WYOh1DovteVSiEKlxY5amBzLYQ//6vL1cbCR6i570q
 5ISMaXCKqCOaJD7C31QlZ5TXjA9LB7JQ9YtwfeRMca6+NWP0NlRkABaFvNgaICyZKi2G
 a3uw==
X-Gm-Message-State: AOAM532r///jXnlfPO0yrhYas15NXC6f2ZaYn0T1TVr5SqDa5h6/MldP
 VcZ/ngfHrCNnR6iTdIgPhrS5zOFuIp/t14ztSMBLvg==
X-Google-Smtp-Source: ABdhPJzcLvJ9uwfnnok9Jrb599YP1lppiXDpug5l7v9Ijo6uL0bZhx3cGiTdzjdevdqTA+btYSibvOQhZGiCLuM12wY=
X-Received: by 2002:a9d:7d81:: with SMTP id j1mr147663otn.88.1619712662466;
 Thu, 29 Apr 2021 09:11:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210428102345.3192-1-patrick.delaunay@foss.st.com>
 <20210428122109.v3.3.I45ee4207ad3fed413a4f3382b0698998aef3266e@changeid>
In-Reply-To: <20210428122109.v3.3.I45ee4207ad3fed413a4f3382b0698998aef3266e@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 29 Apr 2021 09:10:46 -0700
Message-ID: <CAPnjgZ06JKkSE3t_CjuT32PYkW5S_yjy9AdNcy6d-2HD8+BEaA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Tero Kristo <t-kristo@ti.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Marek Bykowski <marek.bykowski@gmail.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v3 3/7] lmb: add lmb_dump_region() function
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

On Wed, 28 Apr 2021 at 03:23, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Add lmb_dump_region() function, to simplify lmb_dump_all_force().
> This patch is based on Linux memblock dump function.
>
> An example of bdinfo output is:
>
> .....
> fdt_size    = 0x000146a0
> FB base     = 0xfdd00000
> lmb_dump_all:
>  memory.cnt  = 0x1
>  memory[0]      [0xc0000000-0xffffffff], 0x40000000 bytes flags: 0
>  reserved.cnt  = 0x6
>  reserved[0]    [0x10000000-0x10045fff], 0x00046000 bytes flags: 4
>  reserved[1]    [0x30000000-0x3003ffff], 0x00040000 bytes flags: 4
>  reserved[2]    [0x38000000-0x3800ffff], 0x00010000 bytes flags: 4
>  reserved[3]    [0xe8000000-0xefffffff], 0x08000000 bytes flags: 4
>  reserved[4]    [0xfbaea344-0xfdffffff], 0x02515cbc bytes flags: 0
>  reserved[5]    [0xfe000000-0xffffffff], 0x02000000 bytes flags: 4
> arch_number = 0x00000000
> TLB addr    = 0xfdff0000
> ....
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> (no changes since v1)
>
>  lib/lmb.c | 40 ++++++++++++++++++++--------------------
>  1 file changed, 20 insertions(+), 20 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
