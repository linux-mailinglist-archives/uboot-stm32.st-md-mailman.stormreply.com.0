Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B9378356D
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Aug 2023 00:11:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D8ADC6A5EF;
	Mon, 21 Aug 2023 22:11:12 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17084C65E56
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 22:11:11 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-51bece5d935so4722725a12.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 15:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692655870; x=1693260670;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xiE/zxGEnnrBNUJKNMHviq1ps/Vf5CNpmXYPRNEnJ38=;
 b=MFSXC6iyMzw7CMVvQ96rP76/h9CF5Q0ed/eD3aUZ/zbn2cz4RbvRq103oO0Mv66wVW
 v4X50gaXOIsD+9IpKHcMdwm2FZ3VoDYoGL85QUFvhXWdj3a5jtvZeMWhHhuic8PmHPaE
 eYsgl20eq+8ngL43ln0aMnV+Vt/ugo6NCLv/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692655870; x=1693260670;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xiE/zxGEnnrBNUJKNMHviq1ps/Vf5CNpmXYPRNEnJ38=;
 b=PRUekRRtlMpUC5C29wcYw4Zq+KJlS8rIVf71cTHeC1HjDIx5e8Ge6EDWd1cFUq/6fw
 sZ62ePy2FhAt6Oy8a3S1WnT2QL+7pthbATRj9kWZTdNcWn6IWJNliA1wJJqKrPYRBcoG
 ps54ssGb3XZjy6dSofdnjsfddHhgpwGaT8Ze451vWsYZLOAebEF053+An5Z9rhTWBtUv
 Wlh8GgFcn3QPSTL0UcrlF5QApcU0RJR3LFX9Pyk+hFqjG2AZMDsC75BBeJL60yyUiIDH
 ku2Q+Vbyr2uXijOIKmPkoMgRdbL5JEfE5skMO1BJ/7xkwD9tMppsxaMtU1VPh8W0RlkH
 jY/g==
X-Gm-Message-State: AOJu0YzcnRcJATYRFcG92hKrsl4EQugzAEKrK2Ljlo+1fCe3m7Pl9MOd
 3IiVfphb/5wncgxv8EscUpuA9X6IVxiKhNwo2IBCbA==
X-Google-Smtp-Source: AGHT+IHcuSTvD0+hEMx+YWEb08Rdu4uz6wZxcd9xrgUjMxIsNxMFt16DT3TDf4boTzMxKeBwr2VraUVUYm2xlXmfdVs=
X-Received: by 2002:a50:fc02:0:b0:525:6666:3551 with SMTP id
 i2-20020a50fc02000000b0052566663551mr5467396edr.27.1692655870494; Mon, 21 Aug
 2023 15:11:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
 <20230821135111.3558478-11-alpernebiyasak@gmail.com>
 <CAPnjgZ2_9s_n9RWO_t_UUJWK1uvjDQSHikpMg7VbpmCn9uuk5g@mail.gmail.com>
 <e24d94b4-d519-4491-a38b-488510059a2a@csgraf.de>
In-Reply-To: <e24d94b4-d519-4491-a38b-488510059a2a@csgraf.de>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 21 Aug 2023 16:10:58 -0600
Message-ID: <CAPnjgZ2HqmyOPixmec8v9g2V9mvCQ2mnG4+jUL4-4=qXPOvsOw@mail.gmail.com>
To: Alexander Graf <agraf@csgraf.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io,
 Matthias Brugger <mbrugger@suse.com>, Derald Woods <woods.technical@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Andrew Davis <afd@ti.com>,
 u-boot@lists.denx.de, Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Anatolij Gustschin <agust@denx.de>,
 Da Xue <da@libre.computer>
Subject: Re: [Uboot-stm32] [PATCH v5 10/13] video: Only dcache flush damaged
	lines
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

Hi Alex,

On Mon, 21 Aug 2023 at 13:59, Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 21.08.23 21:11, Simon Glass wrote:
> > Hi Alper,
> >
> > On Mon, 21 Aug 2023 at 07:51, Alper Nebi Yasak <alpernebiyasak@gmail.com> wrote:
> >> From: Alexander Graf <agraf@csgraf.de>
> >>
> >> Now that we have a damage area tells us which parts of the frame buffer
> >> actually need updating, let's only dcache flush those on video_sync()
> >> calls. With this optimization in place, frame buffer updates - especially
> >> on large screen such as 4k displays - speed up significantly.
> >>
> >> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> >> Reported-by: Da Xue <da@libre.computer>
> >> [Alper: Use damage.xstart/yend, IS_ENABLED()]
> >> Co-developed-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> >> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> >> ---
> >>
> >> Changes in v5:
> >> - Use xstart, ystart, xend, yend as names for damage region
> >> - Use IS_ENABLED() instead of CONFIG_IS_ENABLED()
> >>
> >> Changes in v2:
> >> - Fix dcache range; we were flushing too much before
> >> - Remove ifdefs
> >>
> >>   drivers/video/video-uclass.c | 41 +++++++++++++++++++++++++++++++-----
> >>   1 file changed, 36 insertions(+), 5 deletions(-)
> > This is a little strange, since flushing the whole cache will only
> > actually write out data that was actually written (to the display). Is
> > there a benefit to this patch, in terms of performance?
>
>
> I'm happy to see you go through the same thought process I went through
> when writing these: "This surely can't be the problem, can it?". The
> answer is "simple" in hindsight:
>
> Have a look at the ARMv8 cache flush function. It does the only "safe"
> thing you can expect it to do: Clean+Invalidate to POC because we use it
> for multiple things, clearing modified code among others:
>
> ENTRY(__asm_flush_dcache_range)
>          mrs     x3, ctr_el0
>          ubfx    x3, x3, #16, #4
>          mov     x2, #4
>          lsl     x2, x2, x3              /* cache line size */
>
>          /* x2 <- minimal cache line size in cache system */
>          sub     x3, x2, #1
>          bic     x0, x0, x3
> 1:      dc      civac, x0       /* clean & invalidate data or unified
> cache */
>          add     x0, x0, x2
>          cmp     x0, x1
>          b.lo    1b
>          dsb     sy
>          ret
> ENDPROC(__asm_flush_dcache_range)
>
>
> Looking at the "dc civac" call, we find this documentation page from
> ARM:
> https://developer.arm.com/documentation/ddi0601/2022-03/AArch64-Instructions/DC-CIVAC--Data-or-unified-Cache-line-Clean-and-Invalidate-by-VA-to-PoC
>
> This says we're writing any dirtyness of this cache line up to the POC
> and then invalidate (remove the cache line) also up to POC. That means
> when you look at a typical SBC, this will either be L2 or system level
> cache. Every read afterwards needs to go and pull it all the way back to
> L1 to modify it (or not) on the next character write and then flush it
> again.
>
> Even worse: Because of the invalidate, we may even evict it from caches
> that the display controller uses to read the frame buffer. So depending
> on the SoC's cache topology and implementation, we may force the display
> controller to refetch the full FB content on its next screen refresh cycle.
>
> I faintly remember that I tried to experiment with CVAC instead to only
> flush without invalidating. I don't fully remember the results anymore
> though. I believe CVAC just behaved identical to CIVAC on the A53
> platform I was working on. And then I looked at Cortex-A53 errata like
> [1] and just accepted that doing anything but restricting the flushing
> range is a waste of time :)

Yuck I didn't know it was invalidating too. That is horrible. Is there
no way to fix it?

Regards,
Simon

>
>
> Alex
>
>
> [1]
> https://patchwork.kernel.org/project/xen-devel/patch/1462466065-30212-14-git-send-email-julien.grall@arm.com/
>
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
