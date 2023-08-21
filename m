Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C587830D9
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Aug 2023 21:13:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB45CC6B454;
	Mon, 21 Aug 2023 19:13:41 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 089B5C6B454
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 19:13:40 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-d35a9d7a5bdso3638361276.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 12:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692645219; x=1693250019;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DqnQVI9FjdFWaTVdYgZNjV0l5IXKSpQEFxEXyyTxLsw=;
 b=bkuTJKHxnYNHlfomz0jYUdK3n1AACjof6cDIgbBguokq2pl0zbvsOnpc1u9lBZOekO
 jH0bWrfizCH2udkUTuud//OAQb9Kw0MgyrmgM+yh8lFk+EIE/aVPq9o6IcQ7n9CXo//i
 aBQlSneWP+yuMPt7Abr/WLm5f34wCKRQQuGWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692645219; x=1693250019;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DqnQVI9FjdFWaTVdYgZNjV0l5IXKSpQEFxEXyyTxLsw=;
 b=WTkF8rz1pYHBYG0vqtOKPVDGBSymsHyo/WAU6JwSGowClqqQCePSzj5gJT7PEaQ+Hk
 z2j/knafxF5JsUCeM3Df4Xt+C1BpL208x9b6EdtbfVfDnE9sbdqpyvvea+MIxhofovQb
 H0SBc0ZBQAO3Iv60O+B7wA+NK5ZFEJp5kusOy2BgjKHK1OKCthUpJ/OBMoP2FUTIPYTE
 gw24fXtZD/80Oyh+FsS72CgHcRAccHAmRYaXFEqHCs7Cg4RBBXPeoAEDhRRKMzRANb/W
 YUnM5BgFUlClgDOyNFyF9WwZ7n3jYq+kE4hkPWpGcgd2o2nGHIAMVKVId4CP/tg63diS
 iCAA==
X-Gm-Message-State: AOJu0YysE0vrmr1uflYBRLLZMgxqswHzBfaLevtk721pnidkIOSGA17M
 pZtcQ95TRQDpXMc1Y+RMP/LZ20R6UATqogN10CNIdQ==
X-Google-Smtp-Source: AGHT+IFOLez/38pZ2NOPKSr4eykGt9MLMbNGQwGlZ3PXX4JpDpe2GxX+vLQOcQvMS7Swb4N2mcRaCfILdhVfMA9S3Vw=
X-Received: by 2002:a25:ac82:0:b0:d0f:65db:dc0e with SMTP id
 x2-20020a25ac82000000b00d0f65dbdc0emr7706059ybi.39.1692645218711; Mon, 21 Aug
 2023 12:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
In-Reply-To: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 21 Aug 2023 13:11:59 -0600
Message-ID: <CAPnjgZ0FrwViFv8xLFSkTtztZQw=hnNprCcHfp39s_jfMHRCgA@mail.gmail.com>
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io,
 Matthias Brugger <mbrugger@suse.com>, Derald Woods <woods.technical@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Andrew Davis <afd@ti.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Alexander Graf <agraf@csgraf.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>, Da Xue <da@libre.computer>
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

Hi Alper,

On Mon, 21 Aug 2023 at 07:51, Alper Nebi Yasak <alpernebiyasak@gmail.com> wrote:
>
> This is a rebase of Alexander Graf's video damage tracking series, with
> some tests and other changes. The original cover letter is as follows:
>
> > This patch set speeds up graphics output on ARM by a factor of 60x.
> >
> > On most ARM SBCs, we keep the frame buffer in DRAM and map it as cached,
> > but need it accessible by the display controller which reads directly
> > from a later point of consistency. Hence, we flush the frame buffer to
> > DRAM on every change. The full frame buffer.

It should not, see below.

> >
> > Unfortunately, with the advent of 4k displays, we are seeing frame buffers
> > that can take a while to flush out. This was reported by Da Xue with grub,
> > which happily print 1000s of spaces on the screen to draw a menu. Every
> > printed space triggers a cache flush.

That is a bug somewhere in EFI.

> >
> > This patch set implements the easiest mitigation against this problem:
> > Damage tracking. We remember the lowest common denominator region that was
> > touched since the last video_sync() call and only flush that. The most
> > typical writer to the frame buffer is the video console, which always
> > writes rectangles of characters on the screen and syncs afterwards.
> >
> > With this patch set applied, we reduce drawing a large grub menu (with
> > serial console attached for size information) on an RK3399-ROC system
> > at 1440p from 55 seconds to less than 1 second.
> >
> > Version 2 also implements VIDEO_COPY using this mechanism, reducing its
> > overhead compared to before as well. So even x86 systems should be faster
> > with this now :).
> >
> >
> > Alternatives considered:
> >
> >   1) Lazy sync - Sandbox does this. It only calls video_sync(true) ever
> >      so often. We are missing timers to do this generically.
> >
> >   2) Double buffering - We could try to identify whether anything changed
> >      at all and only draw to the FB if it did. That would require
> >      maintaining a second buffer that we need to scan.
> >
> >   3) Text buffer - Maintain a buffer of all text printed on the screen with
> >      respective location. Don't write if the old and new character are
> >      identical. This would limit applicability to text only and is an
> >      optimization on top of this patch set.
> >
> >   4) Hash screen lines - Create a hash (sha256?) over every line when it
> >      changes. Only flush when it does. I'm not sure if this would waste
> >      more time, memory and cache than the current approach. It would make
> >      full screen updates much more expensive.

5) Fix the bug mentioned above?

>
> Changes in v5:
> - Add patch "video: test: Split copy frame buffer check into a function"
> - Add patch "video: test: Support checking copy frame buffer contents"
> - Add patch "video: test: Test partial updates of hardware frame buffer"
> - Use xstart, ystart, xend, yend as names for damage region
> - Document damage struct and fields in struct video_priv comment
> - Return void from video_damage()
> - Fix undeclared priv error in video_sync()
> - Drop unused headers from video-uclass.c
> - Use IS_ENABLED() instead of CONFIG_IS_ENABLED()
> - Call video_damage() also in video_fill_part()
> - Use met->baseline instead of priv->baseline
> - Use fontdata->height/width instead of VIDEO_FONT_HEIGHT/WIDTH
> - Update console_rotate.c video_damage() calls to pass video tests
> - Remove mention about not having minimal damage for console_rotate.c
> - Add patch "video: test: Test video damage tracking via vidconsole"
> - Document new vdev field in struct efi_gop_obj comment
> - Remove video_sync_copy() also from video_fill(), video_fill_part()
> - Fix memmove() calls by removing the extra dev argument
> - Call video_sync() before checking copy_fb in video tests
> - Imply VIDEO_DAMAGE for video drivers instead of selecting it
> - Imply VIDEO_DAMAGE also for VIDEO_TIDSS
>
> v4: https://lore.kernel.org/all/20230103215004.22646-1-agraf@csgraf.de/
>
> Changes in v4:
> - Move damage clear to patch "dm: video: Add damage tracking API"
> - Simplify first damage logic
> - Remove VIDEO_DAMAGE default for ARM
> - Skip damage on EfiBltVideoToBltBuffer
> - Add patch "video: Always compile cache flushing code"
> - Add patch "video: Enable VIDEO_DAMAGE for drivers that need it"
>
> v3: https://lore.kernel.org/all/20221230195828.88134-1-agraf@csgraf.de/
>
> Changes in v3:
> - Adapt to always assume DM is used
> - Adapt to always assume DM is used
> - Make VIDEO_COPY always select VIDEO_DAMAGE
>
> v2: https://lore.kernel.org/all/20220609225921.62462-1-agraf@csgraf.de/
>
> Changes in v2:
> - Remove ifdefs
> - Fix ranges in truetype target
> - Limit rotate to necessary damage
> - Remove ifdefs from gop
> - Fix dcache range; we were flushing too much before
> - Add patch "video: Use VIDEO_DAMAGE for VIDEO_COPY"
>
> v1: https://lore.kernel.org/all/20220606234336.5021-1-agraf@csgraf.de/
>
> Alexander Graf (9):
>   dm: video: Add damage tracking API
>   dm: video: Add damage notification on display fills
>   vidconsole: Add damage notifications to all vidconsole drivers
>   video: Add damage notification on bmp display
>   efi_loader: GOP: Add damage notification on BLT
>   video: Only dcache flush damaged lines
>   video: Use VIDEO_DAMAGE for VIDEO_COPY
>   video: Always compile cache flushing code
>   video: Enable VIDEO_DAMAGE for drivers that need it
>
> Alper Nebi Yasak (4):
>   video: test: Split copy frame buffer check into a function
>   video: test: Support checking copy frame buffer contents
>   video: test: Test partial updates of hardware frame buffer
>   video: test: Test video damage tracking via vidconsole
>
>  arch/arm/mach-omap2/omap3/Kconfig |   1 +
>  arch/arm/mach-sunxi/Kconfig       |   1 +
>  drivers/video/Kconfig             |  26 +++
>  drivers/video/console_normal.c    |  27 ++--
>  drivers/video/console_rotate.c    |  94 +++++++----
>  drivers/video/console_truetype.c  |  37 +++--
>  drivers/video/exynos/Kconfig      |   1 +
>  drivers/video/imx/Kconfig         |   1 +
>  drivers/video/meson/Kconfig       |   1 +
>  drivers/video/rockchip/Kconfig    |   1 +
>  drivers/video/stm32/Kconfig       |   1 +
>  drivers/video/tegra20/Kconfig     |   1 +
>  drivers/video/tidss/Kconfig       |   1 +
>  drivers/video/vidconsole-uclass.c |  16 --
>  drivers/video/video-uclass.c      | 190 ++++++++++++----------
>  drivers/video/video_bmp.c         |   7 +-
>  include/video.h                   |  59 +++----
>  include/video_console.h           |  52 ------
>  lib/efi_loader/efi_gop.c          |   7 +
>  test/dm/video.c                   | 256 ++++++++++++++++++++++++------
>  20 files changed, 483 insertions(+), 297 deletions(-)

It is good to see this tidied up into something that can be applied!

I am unsure what is going on with the EFI performance, though. It
should not flush the cache after every character, only after a new
line. Is there something wrong in here? If so, we should fix that bug
first and it should be patch 1 of this series.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
