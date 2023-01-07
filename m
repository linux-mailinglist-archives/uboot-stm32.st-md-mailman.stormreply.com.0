Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D109B660AAC
	for <lists+uboot-stm32@lfdr.de>; Sat,  7 Jan 2023 01:14:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91E06C69066;
	Sat,  7 Jan 2023 00:14:58 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CC48C69062
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Jan 2023 00:14:56 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-4c58b07d32dso4715677b3.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Jan 2023 16:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=q6MDKFfNMpUwDT4kpz1nwZ1PpW0xfg2y1jjQxeeOyrQ=;
 b=aSI1TdCmtsNjAExEa6zqfBhcefSoAR3/BEgt+QIFf3XD8ji+vuO0rKSrAPGNbI4lvK
 hn3O647iuJ1tSa0IoK2P0OPFoYWnsbbCsPpVonmq+KI/n8UlWnb8zeuI2j81t3WOxlqB
 thcU6amTUWmLLwSzVdngaqQe9967deX1EZW4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q6MDKFfNMpUwDT4kpz1nwZ1PpW0xfg2y1jjQxeeOyrQ=;
 b=nbcKvrroVRwCoMSMu6Le1jXkKadToROb0orJjA2ro8+FsB5Op/Og/vQuDN0LO1jIbQ
 BbyfROtRb1DtkmaPnFKsmCkWH6wlHfL5LxOkN78G4jhuiv+AD/ln4Bud59aiLtmKpLsa
 FoRP2cd8qv7pSoA67gLedoV5Xo+cPWVdFsqQZ0aXa1mKJg1jxI4+qIt66c2OLCGfTdAv
 ZR4Gnv3t6EpzhmiIDWV2QQcaHbDdADWDXo0mlzVcCl/w8RK3NF8Qvc97qHWTpniyoOBP
 AHbeDs95b5cVNuBifLQ1N1UvbyZKXoIUDxyA0LIEvsrP9vSOfx6juTHY1vTJUsUxzfjx
 r4vQ==
X-Gm-Message-State: AFqh2krCKa6RojwhQzywhkodh0Nk+StXeHW7CkR31e33peKJCDYvRjca
 WfI9ShC7+J4BWrp7yslXGp55gc6bwPGsMEF4ZY98rg==
X-Google-Smtp-Source: AMrXdXuUZOtR/yoo6N5KFxKQANn1s5z9+fuIQ9OLfpmK4PtsTiJPP1XUsg7yLwVKqipKj/n4kUw1g8P2K4HM+AvwJX8=
X-Received: by 2002:a81:1dd8:0:b0:3e8:5c02:56d6 with SMTP id
 d207-20020a811dd8000000b003e85c0256d6mr791033ywd.413.1673050495177; Fri, 06
 Jan 2023 16:14:55 -0800 (PST)
MIME-Version: 1.0
References: <20230103215004.22646-1-agraf@csgraf.de>
In-Reply-To: <20230103215004.22646-1-agraf@csgraf.de>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 6 Jan 2023 17:13:37 -0700
Message-ID: <CAPnjgZ1tg8YU5bKqnjwNRRk0A=3drrvXw8O_Sjen8ZgKeRkcaw@mail.gmail.com>
To: Alexander Graf <agraf@csgraf.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io,
 Matthias Brugger <mbrugger@suse.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>, Da Xue <da@libre.computer>
Subject: Re: [Uboot-stm32] [PATCH v4 0/9] Add video damage tracking
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

On Tue, 3 Jan 2023 at 14:50, Alexander Graf <agraf@csgraf.de> wrote:
>
> This patch set speeds up graphics output on ARM by a factor of 60x.
>
> On most ARM SBCs, we keep the frame buffer in DRAM and map it as cached,
> but need it accessible by the display controller which reads directly
> from a later point of consistency. Hence, we flush the frame buffer to
> DRAM on every change. The full frame buffer.
>
> Unfortunately, with the advent of 4k displays, we are seeing frame buffers
> that can take a while to flush out. This was reported by Da Xue with grub,
> which happily print 1000s of spaces on the screen to draw a menu. Every
> printed space triggers a cache flush.
>
> This patch set implements the easiest mitigation against this problem:
> Damage tracking. We remember the lowest common denominator region that was
> touched since the last video_sync() call and only flush that. The most
> typical writer to the frame buffer is the video console, which always
> writes rectangles of characters on the screen and syncs afterwards.
>
> With this patch set applied, we reduce drawing a large grub menu (with
> serial console attached for size information) on an RK3399-ROC system
> at 1440p from 55 seconds to less than 1 second.
>
> Version 2 also implements VIDEO_COPY using this mechanism, reducing its
> overhead compared to before as well. So even x86 systems should be faster
> with this now :).
>
>
> Alternatives considered:
>
>   1) Lazy sync - Sandbox does this. It only calls video_sync(true) ever
>      so often. We are missing timers to do this generically.
>
>   2) Double buffering - We could try to identify whether anything changed
>      at all and only draw to the FB if it did. That would require
>      maintaining a second buffer that we need to scan.
>
>   3) Text buffer - Maintain a buffer of all text printed on the screen with
>      respective location. Don't write if the old and new character are
>      identical. This would limit applicability to text only and is an
>      optimization on top of this patch set.
>
>   4) Hash screen lines - Create a hash (sha256?) over every line when it
>      changes. Only flush when it does. I'm not sure if this would waste
>      more time, memory and cache than the current approach. It would make
>      full screen updates much more expensive.
>
> v1 -> v2:
>
>   - new patch: video: Use VIDEO_DAMAGE for VIDEO_COPY
>   - Remove ifdefs
>   - Fix dcache range; we were flushing too much before
>   - Fix ranges in truetype target
>   - Limit rotate to necessary damange

damage

>
> v2 -> v3:
>
>   - Rebase
>   - Adapt to DM_VIDEO always
>   - Make CONFIG_COPY always select VIDEO_DAMAGE
>
> v3 -> v4:
>
>   - New patch: video: Always compile cache flushing code
>   - New patch: video: Enable VIDEO_DAMAGE for drivers that need it
>   - Simplify first damage logic
>   - Skip damage on EfiBltVideoToBltBuffer
>   - Move damage clear from patch 6 to patch 1
>   - Remove VIDEO_DAMAGE default for ARM
>
> Alexander Graf (9):
>   dm: video: Add damage tracking API
>   dm: video: Add damage notification on display clear
>   vidconsole: Add damage notifications to all vidconsole drivers
>   video: Add damage notification on bmp display
>   efi_loader: GOP: Add damage notification on BLT
>   video: Only dcache flush damaged lines
>   video: Use VIDEO_DAMAGE for VIDEO_COPY
>   video: Always compile cache flushing code
>   video: Enable VIDEO_DAMAGE for drivers that need it
>
>  arch/arm/mach-omap2/omap3/Kconfig |   1 +
>  arch/arm/mach-sunxi/Kconfig       |   1 +
>  drivers/video/Kconfig             |  27 +++++
>  drivers/video/console_normal.c    |  22 ++--
>  drivers/video/console_rotate.c    |  87 +++++++++-----
>  drivers/video/console_truetype.c  |  30 ++---
>  drivers/video/exynos/Kconfig      |   1 +
>  drivers/video/imx/Kconfig         |   1 +
>  drivers/video/meson/Kconfig       |   1 +
>  drivers/video/rockchip/Kconfig    |   1 +
>  drivers/video/stm32/Kconfig       |   1 +
>  drivers/video/vidconsole-uclass.c |  16 ---
>  drivers/video/video-uclass.c      | 187 +++++++++++++++++-------------
>  drivers/video/video_bmp.c         |   7 +-
>  include/video.h                   |  54 ++++-----
>  include/video_console.h           |  49 --------
>  lib/efi_loader/efi_gop.c          |   6 +
>  17 files changed, 251 insertions(+), 241 deletions(-)
>
> --
> 2.37.1 (Apple Git-137.1)
>

This looks good but needs tests and a rebase to -next

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
