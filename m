Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 679CB783613
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Aug 2023 01:03:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30575C6A5EF;
	Mon, 21 Aug 2023 23:03:40 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 029DCC62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 23:03:39 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-51a52a7d859so10192348a12.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 16:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692659018; x=1693263818;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BqAaQ+pOOQckYt9cdLLzjoRsc6NHyyYeuDaHaR6JbOY=;
 b=Kj/j8hpoL3CPbm4JGuU76s630jFegz8CaBzWC+1xklcnIieUBxYfUDzzLAdc5VRUJ0
 espSCdP+kBvbh1PlGeksgDerDyVQpP7/u/NPLMrmQOu0sDbSt9lrkOkNsHzQQvkBDO0r
 cbl1yaVAQ6LBmjCVKkaVf9TItppGHHyJ/nk0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692659018; x=1693263818;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BqAaQ+pOOQckYt9cdLLzjoRsc6NHyyYeuDaHaR6JbOY=;
 b=KgcLriP91R/Y04z0icQ32np56sDklIaeWrYc6erozZj7fvkACIOMdSGgVAE2QROWlc
 2HPNLXJer0LPthCnDIwmXF4v1XWI393mkqRXYAjranfa1FGBOP2SrmHlNgTkNuJiuLQC
 Y4YUZUi4fyUz7gWXYFqXzTbifKjosYVXSatMGxPv0A03OqLGViNZkGO3wwUpe4P0FgVU
 SIDbEvKHOtIQs9uW5lz7LMotjJbABVpdPX1uEsTBO+ASd8810IthH/T+MWCe6qql3G4b
 uwsQb0JS7ouFlBY2wm39i5gQdYF2T0VezaF0FTEqM7Q7s5D9FmzT69bD7d/WkG3qfHXZ
 c17Q==
X-Gm-Message-State: AOJu0Yw/heh/z+U1Fk3LBnWs53yztVpqOVvLdamfIYkBnwWcQMDHBibp
 UKLEVx0KJ9+buK1Cew7lXWWAytruFgZAkC9Yo82cTQ==
X-Google-Smtp-Source: AGHT+IEl0fzPqGwBrw8bLLK7Rlf+CWzzxuIE6tsqGUWIO4uVPufMsxG2Bzb/FdiIhpA+VNJUmK4rQ0G9OF4t+np4/kE=
X-Received: by 2002:a05:6402:348b:b0:522:ab20:368a with SMTP id
 v11-20020a056402348b00b00522ab20368amr8649261edc.13.1692659018483; Mon, 21
 Aug 2023 16:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
 <CAPnjgZ0FrwViFv8xLFSkTtztZQw=hnNprCcHfp39s_jfMHRCgA@mail.gmail.com>
 <eda9f0f0-fc4d-42b6-abbd-749f67ef6b10@csgraf.de>
 <CAPnjgZ376PEfX75eGL6QvmehZ9Kp+5_orhcsKOpr=8rpRKutFA@mail.gmail.com>
 <62403d10-946d-489a-b225-1b1c180b9349@csgraf.de>
 <CAPnjgZ3WCmtw_Gdpf=E8Ed5faH4T7-=yPf6RwcktukQEG-7J8g@mail.gmail.com>
 <c1ddb2af-8f3d-1e6c-cc67-76d16fe6aff5@csgraf.de>
In-Reply-To: <c1ddb2af-8f3d-1e6c-cc67-76d16fe6aff5@csgraf.de>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 21 Aug 2023 17:03:26 -0600
Message-ID: <CAPnjgZ1Y6aahxRRnY5Tb8N6Uk2TuZViXyBXG_MgMSn7QKt8EXw@mail.gmail.com>
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
Subject: Re: [Uboot-stm32] [PATCH v5 00/13] Add video damage tracking
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

On Mon, 21 Aug 2023 at 16:40, Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 22.08.23 00:10, Simon Glass wrote:
> > Hi Alex,
> >
> > On Mon, 21 Aug 2023 at 14:20, Alexander Graf <agraf@csgraf.de> wrote:
> >>
> >> On 21.08.23 21:57, Simon Glass wrote:
> >>> Hi Alex,
> >>>
> >>> On Mon, 21 Aug 2023 at 13:33, Alexander Graf <agraf@csgraf.de> wrote:
> >>>> On 21.08.23 21:11, Simon Glass wrote:
> >>>>> Hi Alper,
> >>>>>
> >>>>> On Mon, 21 Aug 2023 at 07:51, Alper Nebi Yasak <alpernebiyasak@gmail.com> wrote:
> >>>>>> This is a rebase of Alexander Graf's video damage tracking series, with
> >>>>>> some tests and other changes. The original cover letter is as follows:
> >>>>>>
> >>>>>>> This patch set speeds up graphics output on ARM by a factor of 60x.
> >>>>>>>
> >>>>>>> On most ARM SBCs, we keep the frame buffer in DRAM and map it as cached,
> >>>>>>> but need it accessible by the display controller which reads directly
> >>>>>>> from a later point of consistency. Hence, we flush the frame buffer to
> >>>>>>> DRAM on every change. The full frame buffer.
> >>>>> It should not, see below.
> >>>>>
> >>>>>>> Unfortunately, with the advent of 4k displays, we are seeing frame buffers
> >>>>>>> that can take a while to flush out. This was reported by Da Xue with grub,
> >>>>>>> which happily print 1000s of spaces on the screen to draw a menu. Every
> >>>>>>> printed space triggers a cache flush.
> >>>>> That is a bug somewhere in EFI.
> >>>> Unfortunately not :). You may call it a bug in grub: It literally prints
> >>>> over space characters for every character in its menu that it wants
> >>>> cleared. On every text screen draw.
> >>>>
> >>>> This wouldn't be a big issue if we only flush the reactangle that gets
> >>>> modified. But without this patch set, we're flushing the full DRAM
> >>>> buffer on every u-boot text console character write, which means for
> >>>> every character (as that's the only API UEFI has).
> >>>>
> >>>> As a nice side effect, we speed up the normal U-Boot text console as
> >>>> well with this patch set, because even "normal" text prints that write
> >>>> for example a single line of text on the screen today flush the full
> >>>> frame buffer to DRAM.
> >>> No, I mean that it is a bug that U-Boot (apparently) flushes the cache
> >>> after every character. It doesn't do that for normal character output
> >>> and I don't think it makes sense to do it for EFI either.
> >>
> >> I see. Let's trace the calls:
> >>
> >> efi_cout_output_string()
> >> -> fputs()
> >> -> vidconsole_puts()
> >> -> video_sync()
> >> -> flush_dcache_range()
> >>
> >> Unfortunately grub abstracts character backends down to the "print
> >> character" level, so it calls UEFI's sopisticated "output_string"
> >> callback with single characters at a time, which means we do a full
> >> dcache flush for every character that we print:
> >>
> >> https://git.savannah.gnu.org/cgit/grub.git/tree/grub-core/term/efi/console.c#n165
> >>
> >>
> >>>>>>> This patch set implements the easiest mitigation against this problem:
> >>>>>>> Damage tracking. We remember the lowest common denominator region that was
> >>>>>>> touched since the last video_sync() call and only flush that. The most
> >>>>>>> typical writer to the frame buffer is the video console, which always
> >>>>>>> writes rectangles of characters on the screen and syncs afterwards.
> >>>>>>>
> >>>>>>> With this patch set applied, we reduce drawing a large grub menu (with
> >>>>>>> serial console attached for size information) on an RK3399-ROC system
> >>>>>>> at 1440p from 55 seconds to less than 1 second.
> >>>>>>>
> >>>>>>> Version 2 also implements VIDEO_COPY using this mechanism, reducing its
> >>>>>>> overhead compared to before as well. So even x86 systems should be faster
> >>>>>>> with this now :).
> >>>>>>>
> >>>>>>>
> >>>>>>> Alternatives considered:
> >>>>>>>
> >>>>>>>      1) Lazy sync - Sandbox does this. It only calls video_sync(true) ever
> >>>>>>>         so often. We are missing timers to do this generically.
> >>>>>>>
> >>>>>>>      2) Double buffering - We could try to identify whether anything changed
> >>>>>>>         at all and only draw to the FB if it did. That would require
> >>>>>>>         maintaining a second buffer that we need to scan.
> >>>>>>>
> >>>>>>>      3) Text buffer - Maintain a buffer of all text printed on the screen with
> >>>>>>>         respective location. Don't write if the old and new character are
> >>>>>>>         identical. This would limit applicability to text only and is an
> >>>>>>>         optimization on top of this patch set.
> >>>>>>>
> >>>>>>>      4) Hash screen lines - Create a hash (sha256?) over every line when it
> >>>>>>>         changes. Only flush when it does. I'm not sure if this would waste
> >>>>>>>         more time, memory and cache than the current approach. It would make
> >>>>>>>         full screen updates much more expensive.
> >>>>> 5) Fix the bug mentioned above?
> >>>>>
> >>>>>> Changes in v5:
> >>>>>> - Add patch "video: test: Split copy frame buffer check into a function"
> >>>>>> - Add patch "video: test: Support checking copy frame buffer contents"
> >>>>>> - Add patch "video: test: Test partial updates of hardware frame buffer"
> >>>>>> - Use xstart, ystart, xend, yend as names for damage region
> >>>>>> - Document damage struct and fields in struct video_priv comment
> >>>>>> - Return void from video_damage()
> >>>>>> - Fix undeclared priv error in video_sync()
> >>>>>> - Drop unused headers from video-uclass.c
> >>>>>> - Use IS_ENABLED() instead of CONFIG_IS_ENABLED()
> >>>>>> - Call video_damage() also in video_fill_part()
> >>>>>> - Use met->baseline instead of priv->baseline
> >>>>>> - Use fontdata->height/width instead of VIDEO_FONT_HEIGHT/WIDTH
> >>>>>> - Update console_rotate.c video_damage() calls to pass video tests
> >>>>>> - Remove mention about not having minimal damage for console_rotate.c
> >>>>>> - Add patch "video: test: Test video damage tracking via vidconsole"
> >>>>>> - Document new vdev field in struct efi_gop_obj comment
> >>>>>> - Remove video_sync_copy() also from video_fill(), video_fill_part()
> >>>>>> - Fix memmove() calls by removing the extra dev argument
> >>>>>> - Call video_sync() before checking copy_fb in video tests
> >>>>>> - Imply VIDEO_DAMAGE for video drivers instead of selecting it
> >>>>>> - Imply VIDEO_DAMAGE also for VIDEO_TIDSS
> >>>>>>
> >>>>>> v4: https://lore.kernel.org/all/20230103215004.22646-1-agraf@csgraf.de/
> >>>>>>
> >>>>>> Changes in v4:
> >>>>>> - Move damage clear to patch "dm: video: Add damage tracking API"
> >>>>>> - Simplify first damage logic
> >>>>>> - Remove VIDEO_DAMAGE default for ARM
> >>>>>> - Skip damage on EfiBltVideoToBltBuffer
> >>>>>> - Add patch "video: Always compile cache flushing code"
> >>>>>> - Add patch "video: Enable VIDEO_DAMAGE for drivers that need it"
> >>>>>>
> >>>>>> v3: https://lore.kernel.org/all/20221230195828.88134-1-agraf@csgraf.de/
> >>>>>>
> >>>>>> Changes in v3:
> >>>>>> - Adapt to always assume DM is used
> >>>>>> - Adapt to always assume DM is used
> >>>>>> - Make VIDEO_COPY always select VIDEO_DAMAGE
> >>>>>>
> >>>>>> v2: https://lore.kernel.org/all/20220609225921.62462-1-agraf@csgraf.de/
> >>>>>>
> >>>>>> Changes in v2:
> >>>>>> - Remove ifdefs
> >>>>>> - Fix ranges in truetype target
> >>>>>> - Limit rotate to necessary damage
> >>>>>> - Remove ifdefs from gop
> >>>>>> - Fix dcache range; we were flushing too much before
> >>>>>> - Add patch "video: Use VIDEO_DAMAGE for VIDEO_COPY"
> >>>>>>
> >>>>>> v1: https://lore.kernel.org/all/20220606234336.5021-1-agraf@csgraf.de/
> >>>>>>
> >>>>>> Alexander Graf (9):
> >>>>>>      dm: video: Add damage tracking API
> >>>>>>      dm: video: Add damage notification on display fills
> >>>>>>      vidconsole: Add damage notifications to all vidconsole drivers
> >>>>>>      video: Add damage notification on bmp display
> >>>>>>      efi_loader: GOP: Add damage notification on BLT
> >>>>>>      video: Only dcache flush damaged lines
> >>>>>>      video: Use VIDEO_DAMAGE for VIDEO_COPY
> >>>>>>      video: Always compile cache flushing code
> >>>>>>      video: Enable VIDEO_DAMAGE for drivers that need it
> >>>>>>
> >>>>>> Alper Nebi Yasak (4):
> >>>>>>      video: test: Split copy frame buffer check into a function
> >>>>>>      video: test: Support checking copy frame buffer contents
> >>>>>>      video: test: Test partial updates of hardware frame buffer
> >>>>>>      video: test: Test video damage tracking via vidconsole
> >>>>>>
> >>>>>>     arch/arm/mach-omap2/omap3/Kconfig |   1 +
> >>>>>>     arch/arm/mach-sunxi/Kconfig       |   1 +
> >>>>>>     drivers/video/Kconfig             |  26 +++
> >>>>>>     drivers/video/console_normal.c    |  27 ++--
> >>>>>>     drivers/video/console_rotate.c    |  94 +++++++----
> >>>>>>     drivers/video/console_truetype.c  |  37 +++--
> >>>>>>     drivers/video/exynos/Kconfig      |   1 +
> >>>>>>     drivers/video/imx/Kconfig         |   1 +
> >>>>>>     drivers/video/meson/Kconfig       |   1 +
> >>>>>>     drivers/video/rockchip/Kconfig    |   1 +
> >>>>>>     drivers/video/stm32/Kconfig       |   1 +
> >>>>>>     drivers/video/tegra20/Kconfig     |   1 +
> >>>>>>     drivers/video/tidss/Kconfig       |   1 +
> >>>>>>     drivers/video/vidconsole-uclass.c |  16 --
> >>>>>>     drivers/video/video-uclass.c      | 190 ++++++++++++----------
> >>>>>>     drivers/video/video_bmp.c         |   7 +-
> >>>>>>     include/video.h                   |  59 +++----
> >>>>>>     include/video_console.h           |  52 ------
> >>>>>>     lib/efi_loader/efi_gop.c          |   7 +
> >>>>>>     test/dm/video.c                   | 256 ++++++++++++++++++++++++------
> >>>>>>     20 files changed, 483 insertions(+), 297 deletions(-)
> >>>>> It is good to see this tidied up into something that can be applied!
> >>>>>
> >>>>> I am unsure what is going on with the EFI performance, though. It
> >>>>> should not flush the cache after every character, only after a new
> >>>>> line. Is there something wrong in here? If so, we should fix that bug
> >>>>> first and it should be patch 1 of this series.
> >>>> Before I came up with this series, I was trying to identify the UEFI bug
> >>>> in question as well, because intuition told me surely this is a bug in
> >>>> UEFI :). Turns out it really isn't this time around.
> >>> I don't mean a bug in UEFI, I mean a bug in U-Boot's EFI
> >>> implementation. Where did you look for the bug?
> >>
> >> The "real" bug is in grub. But given that it's reasonably simple to work
> >> around in U-Boot and even with it "fixed" in grub we would still see
> >> performance benefits from flushing only parts of the screen, I think
> >> it's worth living with the grub deficiency.
> > OK thanks for digging into it. I suggest we add a param to
> > vidconsole_puts() to tell it whether to sync or not, then the EFI code
> > can indicate this and try to be a bit smarter about it.
>
>
> It doesn't know when to sync either. From its point of view, any
> "console output" could be the last one. There is no API in UEFI that
> says "please flush console output now".

Yes, I understand. I was not suggesting we were missing an API. But
some sort of heuristic would do, e.g. only flush on a newline, flush
every 50 chars, etc.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
