Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7AD36F5A7
	for <lists+uboot-stm32@lfdr.de>; Fri, 30 Apr 2021 08:21:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75318C58D59;
	Fri, 30 Apr 2021 06:21:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 266A3CFAC55
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Apr 2021 06:21:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF8C761409
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Apr 2021 06:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619763698;
 bh=V0xmL0d3J8pTcepDiSfeVTWItt9d7GwxCsTkcN/RuuU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=l9N42pQFhFjeEJzMK/FWRjbAqokwKPDbyzgaVoBumuz9V4CiwDXKRUONokZEekpP/
 d6TJTB1S3DqBCZkBStp2sZ8GBVQQ8Lnl4CCh65rQFycPdxCfZyi/l3wgBYlBQ5IS7n
 utMdGdWlUnu4utylGY1+XFWTDJSyuSt3540xcz04aCazuWLkYDaYlXRBYZi/sKYITo
 WWdvOBlCPkH8XCrk+KUqvFGqdVP5Jdwk0GL0CphM+N1v7pyBnzbRulptrfgrQsFAKt
 OGua0Iymut3EvlORhKR3BAnIjMrFKmIO/P1Z3A4r+D6F7fpg1mq95BuUNZqyrFuYa1
 x5fT3tL4MKzjg==
Received: by mail-lj1-f173.google.com with SMTP id b21so6950278ljf.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 23:21:38 -0700 (PDT)
X-Gm-Message-State: AOAM533oomri9INu0WDOq6cNlPbj7axvK0uim4xfhIXqIE9zNOBmXYBl
 LgYZsi+r6OFmBwcbJ2salPPIXnuVzq1rXWSsOds=
X-Google-Smtp-Source: ABdhPJydYHESyavGzfD4pl8vNew5IOqc1HAdU/+sCJF5pfEc5/iSWoFBkhZxSZe53JCnXGVPKH65oXM+XPC5rOjvZoU=
X-Received: by 2002:a2e:591:: with SMTP id 139mr2597828ljf.234.1619763697016; 
 Thu, 29 Apr 2021 23:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210428102345.3192-1-patrick.delaunay@foss.st.com>
 <20210428122109.v3.5.Id906966934e591cb691481197488ae2cfa31ffa1@changeid>
 <CAPnjgZ2KvAKjxK=2N36G5TM3L1GuF1aK0Ftj=jgjjg=Y+WWYFw@mail.gmail.com>
In-Reply-To: <CAPnjgZ2KvAKjxK=2N36G5TM3L1GuF1aK0Ftj=jgjjg=Y+WWYFw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 30 Apr 2021 08:21:25 +0200
X-Gmail-Original-Message-ID: <CAMj1kXELyJgG7iULZcpoEWPFruHOJgmO2tJA=PMXoByrfD6jhw@mail.gmail.com>
Message-ID: <CAMj1kXELyJgG7iULZcpoEWPFruHOJgmO2tJA=PMXoByrfD6jhw@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: Marek Vasut <marex@denx.de>, chenshuo <chenshuo@eswin.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBEYW5pcw==?= <frederic.danis@collabora.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wasim Khan <wasim.khan@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Marek Bykowski <marek.bykowski@gmail.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v3 5/7] image-fdt: save no-map parameter
	of reserve-memory
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

On Thu, 29 Apr 2021 at 18:11, Simon Glass <sjg@chromium.org> wrote:
>
> Hi Patrick,
>
> On Wed, 28 Apr 2021 at 03:23, Patrick Delaunay
> <patrick.delaunay@foss.st.com> wrote:
> >
> > Save the no-map information present in 'reserved-memory' node to allow
> > correct handling when the MMU is configured in board to avoid
> > speculative access.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> > ---
> >
> > (no changes since v1)
> >
> >  common/image-fdt.c | 23 +++++++++++++++--------
> >  1 file changed, 15 insertions(+), 8 deletions(-)
>
> Where is no-map documented?
>
> Reviewed-by: Simon Glass <sjg@chromium.org>

I don't remember exactly where the discussion ended up the last time,
so please disregard this if we settled it, but I still don't think
that secure-only memory should be described in the DT at all.

The v7 and v8 documentation are not 100% aligned on this, but the S
bit is now considered a true address bit, and so secure address 0x0
and non-secure address zero could be decoded by different peripherals
at the same time, even if some TZ firewall implementations don't
implement it that way.

Since DT addresses don't carry the S bit at all, any address described
in DT must be assumed to be a non-secure address. This means that the
no-map region essentially describes a non-secure region that does not
exist, in order to prevent a secure region at the same offset (which
DT cannot describe in the first place) from being covered by the
linear mapping.

So, apologies if we are going around in circles here, but could you
please explain again why the DT is describing secure memory as
non-secure memory, and then reserving it again using no-map?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
