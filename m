Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A67FC7849CA
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Aug 2023 20:57:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B837C6B44B;
	Tue, 22 Aug 2023 18:57:53 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 920B9C6B444
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Aug 2023 18:57:52 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-3a82db15081so2954585b6e.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Aug 2023 11:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692730671; x=1693335471;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DZVRGfmBOabu1wOEPPuYW3gyh2bZLY1wdIdhvnWyWK0=;
 b=glII45v5dlryN8ldctkMdTJaqSnv+fZgqAfdkMRw8yiQKhoZSx7JHcKUU1Zk54xRZj
 nb3OuOiKl1pnO+3Mj83QaKVcVeJouZZVh78NT/0YuzBYqYsQdLnKo0tyrVW25pCmhWw2
 7UpL876FncTMAjyfDJjo7NXsalHktthEhWyVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692730671; x=1693335471;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DZVRGfmBOabu1wOEPPuYW3gyh2bZLY1wdIdhvnWyWK0=;
 b=gp7Mj3vp1prv3vLS01Ca95ccZab2eH9sD+BvabCKJXdVhLkT740WcS9LfbSG+XI0AP
 c5hiS4BIiD7B7TTxM0eYTFlpBTF127LVTj0iI690dhesEJ/MMuoMSnwWyrzgehrnXm4q
 rnZwunlZIPfMAM1UAzftNM5zKNEQQfGa0WP8tAeLFLLHv7qmR5qtXr8ERTRw+68eiUdx
 hs5tHEpm4/2bZu0dO1PzIe49p/wgEPFxhOF2EPWDRWsUaE4pOiHqxc/taUdTI1lV+kTK
 o+IZYc6L/XjgZcrBrk43Hef7Tqx5hRneFR8XPm8eygUU+tWil6jR8bwEfmJ3NRTzPDXT
 fPpA==
X-Gm-Message-State: AOJu0YzXMn8SirNWhATNBfHjbI6cVWMmjXdpj+zTfyEM4DwJSuJ3rHcH
 njJhw6D3vUobbBAY9xVS32KtdM1H/6Cl2TAZImzzBg==
X-Google-Smtp-Source: AGHT+IHLM6yan8hnPIGrS8HQD/qTIPzHnGKkUAcYUlcjLk5cal9wLxkLuIrYBF2JoPr0gFByaaoQWX2G/5I/JpLeffs=
X-Received: by 2002:a05:6358:5284:b0:134:d030:e5da with SMTP id
 g4-20020a056358528400b00134d030e5damr5276158rwa.21.1692730670856; Tue, 22 Aug
 2023 11:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
 <CAPnjgZ0FrwViFv8xLFSkTtztZQw=hnNprCcHfp39s_jfMHRCgA@mail.gmail.com>
 <eda9f0f0-fc4d-42b6-abbd-749f67ef6b10@csgraf.de>
 <CAPnjgZ376PEfX75eGL6QvmehZ9Kp+5_orhcsKOpr=8rpRKutFA@mail.gmail.com>
 <62403d10-946d-489a-b225-1b1c180b9349@csgraf.de>
 <CAPnjgZ3WCmtw_Gdpf=E8Ed5faH4T7-=yPf6RwcktukQEG-7J8g@mail.gmail.com>
 <c1ddb2af-8f3d-1e6c-cc67-76d16fe6aff5@csgraf.de>
 <CAPnjgZ1Y6aahxRRnY5Tb8N6Uk2TuZViXyBXG_MgMSn7QKt8EXw@mail.gmail.com>
 <3edfc316-bdf4-4d11-b592-2e584f1aabb3@csgraf.de>
In-Reply-To: <3edfc316-bdf4-4d11-b592-2e584f1aabb3@csgraf.de>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 22 Aug 2023 12:56:40 -0600
Message-ID: <CAPnjgZ1jMhuw2iqkiy6uEWABSF_4fHiet=-=-9LOMKb7-RGziw@mail.gmail.com>
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

On Tue, 22 Aug 2023 at 01:47, Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 22.08.23 01:03, Simon Glass wrote:
> > Hi Alex,
> >
> > On Mon, 21 Aug 2023 at 16:40, Alexander Graf <agraf@csgraf.de> wrote:
> >>
> >> On 22.08.23 00:10, Simon Glass wrote:
> >>> Hi Alex,
> >>>
> >>> On Mon, 21 Aug 2023 at 14:20, Alexander Graf <agraf@csgraf.de> wrote:
> >>>> On 21.08.23 21:57, Simon Glass wrote:
> >>>>> Hi Alex,
> >>>>>
> >>>>> On Mon, 21 Aug 2023 at 13:33, Alexander Graf <agraf@csgraf.de> wrote:
> >>>>>> On 21.08.23 21:11, Simon Glass wrote:
> >>>>>>> Hi Alper,
> >>>>>>>
> >>>>>>> On Mon, 21 Aug 2023 at 07:51, Alper Nebi Yasak <alpernebiyasak@gmail.com> wrote:
> >>>>>>>> This is a rebase of Alexander Graf's video damage tracking series, with
> >>>>>>>> some tests and other changes. The original cover letter is as follows:
> >>>>>>>>
> >>>>>>>>> This patch set speeds up graphics output on ARM by a factor of 60x.
> >>>>>>>>>
> >>>>>>>>> On most ARM SBCs, we keep the frame buffer in DRAM and map it as cached,
> >>>>>>>>> but need it accessible by the display controller which reads directly
> >>>>>>>>> from a later point of consistency. Hence, we flush the frame buffer to
> >>>>>>>>> DRAM on every change. The full frame buffer.
> >>>>>>> It should not, see below.
> >>>>>>>
> >>>>>>>>> Unfortunately, with the advent of 4k displays, we are seeing frame buffers
> >>>>>>>>> that can take a while to flush out. This was reported by Da Xue with grub,
> >>>>>>>>> which happily print 1000s of spaces on the screen to draw a menu. Every
> >>>>>>>>> printed space triggers a cache flush.
> >>>>>>> That is a bug somewhere in EFI.
> >>>>>> Unfortunately not :). You may call it a bug in grub: It literally prints
> >>>>>> over space characters for every character in its menu that it wants
> >>>>>> cleared. On every text screen draw.
> >>>>>>
> >>>>>> This wouldn't be a big issue if we only flush the reactangle that gets
> >>>>>> modified. But without this patch set, we're flushing the full DRAM
> >>>>>> buffer on every u-boot text console character write, which means for
> >>>>>> every character (as that's the only API UEFI has).
> >>>>>>
> >>>>>> As a nice side effect, we speed up the normal U-Boot text console as
> >>>>>> well with this patch set, because even "normal" text prints that write
> >>>>>> for example a single line of text on the screen today flush the full
> >>>>>> frame buffer to DRAM.
> >>>>> No, I mean that it is a bug that U-Boot (apparently) flushes the cache
> >>>>> after every character. It doesn't do that for normal character output
> >>>>> and I don't think it makes sense to do it for EFI either.
> >>>> I see. Let's trace the calls:
> >>>>
> >>>> efi_cout_output_string()
> >>>> -> fputs()
> >>>> -> vidconsole_puts()
> >>>> -> video_sync()
> >>>> -> flush_dcache_range()
> >>>>
> >>>> Unfortunately grub abstracts character backends down to the "print
> >>>> character" level, so it calls UEFI's sopisticated "output_string"
> >>>> callback with single characters at a time, which means we do a full
> >>>> dcache flush for every character that we print:
> >>>>
> >>>> https://git.savannah.gnu.org/cgit/grub.git/tree/grub-core/term/efi/console.c#n165
> >>>>
> >>>>
> >>>>>>>>> This patch set implements the easiest mitigation against this problem:
> >>>>>>>>> Damage tracking. We remember the lowest common denominator region that was
> >>>>>>>>> touched since the last video_sync() call and only flush that. The most
> >>>>>>>>> typical writer to the frame buffer is the video console, which always
> >>>>>>>>> writes rectangles of characters on the screen and syncs afterwards.
> >>>>>>>>>
> >>>>>>>>> With this patch set applied, we reduce drawing a large grub menu (with
> >>>>>>>>> serial console attached for size information) on an RK3399-ROC system
> >>>>>>>>> at 1440p from 55 seconds to less than 1 second.
> >>>>>>>>>
> >>>>>>>>> Version 2 also implements VIDEO_COPY using this mechanism, reducing its
> >>>>>>>>> overhead compared to before as well. So even x86 systems should be faster
> >>>>>>>>> with this now :).
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Alternatives considered:
> >>>>>>>>>
> >>>>>>>>>       1) Lazy sync - Sandbox does this. It only calls video_sync(true) ever
> >>>>>>>>>          so often. We are missing timers to do this generically.
> >>>>>>>>>
> >>>>>>>>>       2) Double buffering - We could try to identify whether anything changed
> >>>>>>>>>          at all and only draw to the FB if it did. That would require
> >>>>>>>>>          maintaining a second buffer that we need to scan.
> >>>>>>>>>
> >>>>>>>>>       3) Text buffer - Maintain a buffer of all text printed on the screen with
> >>>>>>>>>          respective location. Don't write if the old and new character are
> >>>>>>>>>          identical. This would limit applicability to text only and is an
> >>>>>>>>>          optimization on top of this patch set.
> >>>>>>>>>
> >>>>>>>>>       4) Hash screen lines - Create a hash (sha256?) over every line when it
> >>>>>>>>>          changes. Only flush when it does. I'm not sure if this would waste
> >>>>>>>>>          more time, memory and cache than the current approach. It would make
> >>>>>>>>>          full screen updates much more expensive.
> >>>>>>> 5) Fix the bug mentioned above?
> >>>>>>>
> >>>>>>>> Changes in v5:
> >>>>>>>> - Add patch "video: test: Split copy frame buffer check into a function"
> >>>>>>>> - Add patch "video: test: Support checking copy frame buffer contents"
> >>>>>>>> - Add patch "video: test: Test partial updates of hardware frame buffer"
> >>>>>>>> - Use xstart, ystart, xend, yend as names for damage region
> >>>>>>>> - Document damage struct and fields in struct video_priv comment
> >>>>>>>> - Return void from video_damage()
> >>>>>>>> - Fix undeclared priv error in video_sync()
> >>>>>>>> - Drop unused headers from video-uclass.c
> >>>>>>>> - Use IS_ENABLED() instead of CONFIG_IS_ENABLED()
> >>>>>>>> - Call video_damage() also in video_fill_part()
> >>>>>>>> - Use met->baseline instead of priv->baseline
> >>>>>>>> - Use fontdata->height/width instead of VIDEO_FONT_HEIGHT/WIDTH
> >>>>>>>> - Update console_rotate.c video_damage() calls to pass video tests
> >>>>>>>> - Remove mention about not having minimal damage for console_rotate.c
> >>>>>>>> - Add patch "video: test: Test video damage tracking via vidconsole"
> >>>>>>>> - Document new vdev field in struct efi_gop_obj comment
> >>>>>>>> - Remove video_sync_copy() also from video_fill(), video_fill_part()
> >>>>>>>> - Fix memmove() calls by removing the extra dev argument
> >>>>>>>> - Call video_sync() before checking copy_fb in video tests
> >>>>>>>> - Imply VIDEO_DAMAGE for video drivers instead of selecting it
> >>>>>>>> - Imply VIDEO_DAMAGE also for VIDEO_TIDSS
> >>>>>>>>
> >>>>>>>> v4: https://lore.kernel.org/all/20230103215004.22646-1-agraf@csgraf.de/
> >>>>>>>>
> >>>>>>>> Changes in v4:
> >>>>>>>> - Move damage clear to patch "dm: video: Add damage tracking API"
> >>>>>>>> - Simplify first damage logic
> >>>>>>>> - Remove VIDEO_DAMAGE default for ARM
> >>>>>>>> - Skip damage on EfiBltVideoToBltBuffer
> >>>>>>>> - Add patch "video: Always compile cache flushing code"
> >>>>>>>> - Add patch "video: Enable VIDEO_DAMAGE for drivers that need it"
> >>>>>>>>
> >>>>>>>> v3: https://lore.kernel.org/all/20221230195828.88134-1-agraf@csgraf.de/
> >>>>>>>>
> >>>>>>>> Changes in v3:
> >>>>>>>> - Adapt to always assume DM is used
> >>>>>>>> - Adapt to always assume DM is used
> >>>>>>>> - Make VIDEO_COPY always select VIDEO_DAMAGE
> >>>>>>>>
> >>>>>>>> v2: https://lore.kernel.org/all/20220609225921.62462-1-agraf@csgraf.de/
> >>>>>>>>
> >>>>>>>> Changes in v2:
> >>>>>>>> - Remove ifdefs
> >>>>>>>> - Fix ranges in truetype target
> >>>>>>>> - Limit rotate to necessary damage
> >>>>>>>> - Remove ifdefs from gop
> >>>>>>>> - Fix dcache range; we were flushing too much before
> >>>>>>>> - Add patch "video: Use VIDEO_DAMAGE for VIDEO_COPY"
> >>>>>>>>
> >>>>>>>> v1: https://lore.kernel.org/all/20220606234336.5021-1-agraf@csgraf.de/
> >>>>>>>>
> >>>>>>>> Alexander Graf (9):
> >>>>>>>>       dm: video: Add damage tracking API
> >>>>>>>>       dm: video: Add damage notification on display fills
> >>>>>>>>       vidconsole: Add damage notifications to all vidconsole drivers
> >>>>>>>>       video: Add damage notification on bmp display
> >>>>>>>>       efi_loader: GOP: Add damage notification on BLT
> >>>>>>>>       video: Only dcache flush damaged lines
> >>>>>>>>       video: Use VIDEO_DAMAGE for VIDEO_COPY
> >>>>>>>>       video: Always compile cache flushing code
> >>>>>>>>       video: Enable VIDEO_DAMAGE for drivers that need it
> >>>>>>>>
> >>>>>>>> Alper Nebi Yasak (4):
> >>>>>>>>       video: test: Split copy frame buffer check into a function
> >>>>>>>>       video: test: Support checking copy frame buffer contents
> >>>>>>>>       video: test: Test partial updates of hardware frame buffer
> >>>>>>>>       video: test: Test video damage tracking via vidconsole
> >>>>>>>>
> >>>>>>>>      arch/arm/mach-omap2/omap3/Kconfig |   1 +
> >>>>>>>>      arch/arm/mach-sunxi/Kconfig       |   1 +
> >>>>>>>>      drivers/video/Kconfig             |  26 +++
> >>>>>>>>      drivers/video/console_normal.c    |  27 ++--
> >>>>>>>>      drivers/video/console_rotate.c    |  94 +++++++----
> >>>>>>>>      drivers/video/console_truetype.c  |  37 +++--
> >>>>>>>>      drivers/video/exynos/Kconfig      |   1 +
> >>>>>>>>      drivers/video/imx/Kconfig         |   1 +
> >>>>>>>>      drivers/video/meson/Kconfig       |   1 +
> >>>>>>>>      drivers/video/rockchip/Kconfig    |   1 +
> >>>>>>>>      drivers/video/stm32/Kconfig       |   1 +
> >>>>>>>>      drivers/video/tegra20/Kconfig     |   1 +
> >>>>>>>>      drivers/video/tidss/Kconfig       |   1 +
> >>>>>>>>      drivers/video/vidconsole-uclass.c |  16 --
> >>>>>>>>      drivers/video/video-uclass.c      | 190 ++++++++++++----------
> >>>>>>>>      drivers/video/video_bmp.c         |   7 +-
> >>>>>>>>      include/video.h                   |  59 +++----
> >>>>>>>>      include/video_console.h           |  52 ------
> >>>>>>>>      lib/efi_loader/efi_gop.c          |   7 +
> >>>>>>>>      test/dm/video.c                   | 256 ++++++++++++++++++++++++------
> >>>>>>>>      20 files changed, 483 insertions(+), 297 deletions(-)
> >>>>>>> It is good to see this tidied up into something that can be applied!
> >>>>>>>
> >>>>>>> I am unsure what is going on with the EFI performance, though. It
> >>>>>>> should not flush the cache after every character, only after a new
> >>>>>>> line. Is there something wrong in here? If so, we should fix that bug
> >>>>>>> first and it should be patch 1 of this series.
> >>>>>> Before I came up with this series, I was trying to identify the UEFI bug
> >>>>>> in question as well, because intuition told me surely this is a bug in
> >>>>>> UEFI :). Turns out it really isn't this time around.
> >>>>> I don't mean a bug in UEFI, I mean a bug in U-Boot's EFI
> >>>>> implementation. Where did you look for the bug?
> >>>> The "real" bug is in grub. But given that it's reasonably simple to work
> >>>> around in U-Boot and even with it "fixed" in grub we would still see
> >>>> performance benefits from flushing only parts of the screen, I think
> >>>> it's worth living with the grub deficiency.
> >>> OK thanks for digging into it. I suggest we add a param to
> >>> vidconsole_puts() to tell it whether to sync or not, then the EFI code
> >>> can indicate this and try to be a bit smarter about it.
> >>
> >> It doesn't know when to sync either. From its point of view, any
> >> "console output" could be the last one. There is no API in UEFI that
> >> says "please flush console output now".
> > Yes, I understand. I was not suggesting we were missing an API. But
> > some sort of heuristic would do, e.g. only flush on a newline, flush
> > every 50 chars, etc.
>
> I can't think of any heuristic that would reliably work. Relevant for
> this conversation, UEFI provides 2 calls:
>
>    * Write string to screen (efi_cout_output_string)
>    * Set text cursor position to X, Y (efi_cout_set_cursor_position)
>
> It's perfectly legal for a UEFI application to do something like
>
> efi_cout_set_cursor_position(10, 10);
> efi_cout_output_string("f");
> efi_cout_output_string("o");
> efi_cout_output_string("o") ;
>
> to update contents of a virtual text box on the screen. Where in this
> chain of events would we call video_sync(), but on every call to
> efi_cout_output_string()?

Actually U-Boot has the same problem, but we have managed to work out something.

I do think it is still to flush the cache on every char. I suspect you
will find that even a simple heuristic like I mentioned would be good
enough.

Also I notice that EFI calls notify? all the time, so U-Boot probably
does have the ability to sync the video every 10ms if we wanted to.

It seems from this discussion that we have made great the enemy of the good.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
