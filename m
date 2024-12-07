Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 438E09E82BA
	for <lists+uboot-stm32@lfdr.de>; Sun,  8 Dec 2024 00:43:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF39FC7801E;
	Sat,  7 Dec 2024 23:43:29 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64751C7801A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Dec 2024 23:43:22 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-aa647af6804so207217766b.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 07 Dec 2024 15:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733615002; x=1734219802;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=OJIhuMAWzV8raRAv1jJAZT5DP5cIG7000jONP2NFqBk=;
 b=jpj7DOcb00Eu9nf7nUSTOEbOtatVujQPoiCm4DUyG9tfudZT5dQoKnoPXjwoxQ10ND
 BxuP0BTGecSfdk3qLICKrtFIaxJuH4dazXfjJ0pfhmF346yVvgTAfbluMoFWGWIix/3J
 NfQmgRch/Jd0TicTLschKGId2gyV4RMjAvkVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733615002; x=1734219802;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OJIhuMAWzV8raRAv1jJAZT5DP5cIG7000jONP2NFqBk=;
 b=P7j8fGtoUNO5E7wDBRYILaz0jHTeN3pOtKAhyDB1buKWrmAuT5nB5bcM38MdI4wR3+
 EAy6A7OlfyluntMoce7He9RyZdwf/Ng4Nurjt44jPZzLj2Q+KE6nhrScoQocA/R1Hmk+
 1fE6sNlzsUVqhEex37iluL2CTJkcYVtyIQJOXjxN8m9SJ8w4/vg8BUlFwPzkEqokDodD
 cR7AEaAMUa8SCRxzzxgSWhttSTK3h5tn62szGYA8BNY3z68tqicSbwX8HPbPUA8XJUZ/
 15aU0aOKn8oEUUYWpJodxDrUmTjgumNwWk3ZuQAfN4VChIUSELvZA4qk1ORre8FkBt3y
 Y+yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhdCmW4+Stcv3SEMsdRInG3pkbxIQRQGoF4nRYHsD79zw1H4d1RzWcZ7OYjvxQFqzN5SHRJ6DJYXiZEQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxda7XcYGk4NtuoACEpTGGlC823uozhC3ct4pyGXuTNBCMd3I4r
 o4mStwfu8Ww4rtBZM+Z8bhh6J9LnTQgqDZnyYGhQERCKg/JZrjaaRge79NZmhSXnPfudDrLdLVv
 z0ryoUtcuK9j58UQ0XAyMaLTgJyQ3yEI+S2DB
X-Gm-Gg: ASbGncv3SlOkemn3EeLJNVbOY2lxboYCHtxvc6WctXKy20k/qhGRY+dmguElz2zM63o
 KnN//eycR84TJn5n6Wh7aYC7XpSnoic5e
X-Google-Smtp-Source: AGHT+IHAMN9I8KQXAfG6e5u6VUP6pyv2OADyqO/u7npItgclDHcsKtlK9yh4KNj4zcb/jlRbovX9KNG8rQyXSs/z1Kg=
X-Received: by 2002:a17:906:2929:b0:aa5:f2c0:2378 with SMTP id
 a640c23a62f3a-aa6373a1bf4mr811424866b.13.1733615001794; Sat, 07 Dec 2024
 15:43:21 -0800 (PST)
MIME-Version: 1.0
From: Simon Glass <sjg@chromium.org>
Date: Sat, 7 Dec 2024 16:43:10 -0700
Message-ID: <CAFLszThXbhVtYqi27BtKv6PHwVNnhvwJ5+vKQ_yMMJ33GrYd4g@mail.gmail.com>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io,
 Matthias Brugger <mbrugger@suse.com>, Derald Woods <woods.technical@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Andrew Davis <afd@ti.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>, Da Xue <da@libre.computer>
Subject: [Uboot-stm32] [PATCH v5 00/13] Add video damage tracking
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

On Mon, Aug 21, 2023 at 01:50 PM Alper Nebi Yasak
<alpernebiyasak@gmail.com> wrote:
>
> This is a rebase of Alexander Graf's video damage tracking series, with
> some tests and other changes. The original cover letter is as follows:
>
>
> > This patch set speeds up graphics output on ARM by a factor of 60x.
> >
> > On most ARM SBCs, we keep the frame buffer in DRAM and map it as cached,
> > but need it accessible by the display controller which reads directly
> > from a later point of consistency. Hence, we flush the frame buffer to
> > DRAM on every change. The full frame buffer.
> >
> > Unfortunately, with the advent of 4k displays, we are seeing frame buffers
> > that can take a while to flush out. This was reported by Da Xue with grub,
> > which happily print 1000s of spaces on the screen to draw a menu. Every
> > printed space triggers a cache flush.
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
>
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
>
> v4: https://lore.kernel.org/all/20230103215004.22646-1-agraf@csgraf.de/
>
>
> Changes in v4:
> - Move damage clear to patch "dm: video: Add damage tracking API"
> - Simplify first damage logic
> - Remove VIDEO_DAMAGE default for ARM
> - Skip damage on EfiBltVideoToBltBuffer
> - Add patch "video: Always compile cache flushing code"
> - Add patch "video: Enable VIDEO_DAMAGE for drivers that need it"
>
>
> v3: https://lore.kernel.org/all/20221230195828.88134-1-agraf@csgraf.de/
>
>
> Changes in v3:
> - Adapt to always assume DM is used
> - Adapt to always assume DM is used
> - Make VIDEO_COPY always select VIDEO_DAMAGE
>
>
> v2: https://lore.kernel.org/all/20220609225921.62462-1-agraf@csgraf.de/
>
>
> Changes in v2:
> - Remove ifdefs
> - Fix ranges in truetype target
> - Limit rotate to necessary damage
> - Remove ifdefs from gop
> - Fix dcache range; we were flushing too much before
> - Add patch "video: Use VIDEO_DAMAGE for VIDEO_COPY"
>
>
> v1: https://lore.kernel.org/all/20220606234336.5021-1-agraf@csgraf.de/
>
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
>
> Alper Nebi Yasak (4):
>   video: test: Split copy frame buffer check into a function
>   video: test: Support checking copy frame buffer contents
>   video: test: Test partial updates of hardware frame buffer
>   video: test: Test video damage tracking via vidconsole
>
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
>
>
>
> base-commit: 3881c9fbb7fdd98f6eae5cd33f7e9abe9455a585

Rebased and applied to ci/master, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
