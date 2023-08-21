Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F0C7830DB
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Aug 2023 21:13:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F063AC6B47D;
	Mon, 21 Aug 2023 19:13:41 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F32C2C6B44C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 19:13:39 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-58fc4eaa04fso24226227b3.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 12:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692645219; x=1693250019;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4b8vVOy+7wecpbSr04GBcW/NVbN5vG825shqLiwpSys=;
 b=UQ5QXwo3tRZd3NmqWF1BZToVsPp+urnkkbM7zmYloiTGBq1sJFYEG89Pdhp9MDranQ
 qYXu3c7gTG8lzdQFbrkH1WjY4C225EsU/7S5U5lDxOchIUSmLfZfnSUy8QDNnDUEvJcC
 t5KwbZW5QgCWLyNE7uumD0Rnya5VJp9/aNg2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692645219; x=1693250019;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4b8vVOy+7wecpbSr04GBcW/NVbN5vG825shqLiwpSys=;
 b=lhibiOWb139RJJAA5XQ4vSb1Dydt6fiIMBER0Vn9gk5rMRY6+yW7s7NeUN1szDz79F
 v9mba61btynlO7oDs2TppliL7qlRYERtwhstN+GG/6Sosnn1SJncxLEPVeNGU/kuCr3k
 A4NNzf++J+RQrNRIIhAc3UGof3B4ubEOQAnxq7Fm8DSToo+SFSwxmtwVMzkezZ5+2Fpp
 EGsKA9EOzmNBl1ClzPZcjxJXyjLuW3TyrMEKmMDHQTrGPrZxNUTsBTHJffVLHTKUhsyU
 QrBeAFWT0is9Fyw5MATBDyWwdwY5lu+3FJCAphkMjIbMQV9qkgEYaWM3p4snnk7Dhswf
 xecw==
X-Gm-Message-State: AOJu0YwJT3mJh+x7aPpNL+DaxY49/vHUYvsPBGysh43GF1vkqnj96JM8
 KeUqMey8/uT4p6HHZh5l1xbkwML6mxwpPTcGuSMx7A==
X-Google-Smtp-Source: AGHT+IGz6onVLaBq5SgMlvOlRVzPtuIoSQmIoY1RA5Np6UijxL01X70HGA+5W7rboBPf54h4A1z61iMXypakJKMH28g=
X-Received: by 2002:a25:e758:0:b0:bfe:e383:6297 with SMTP id
 e85-20020a25e758000000b00bfee3836297mr6799558ybh.19.1692645218700; Mon, 21
 Aug 2023 12:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
 <20230821135111.3558478-12-alpernebiyasak@gmail.com>
In-Reply-To: <20230821135111.3558478-12-alpernebiyasak@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 21 Aug 2023 13:11:53 -0600
Message-ID: <CAPnjgZ0Ho7h5T-7S1Mi23+1ez7hq2MCEEZJjjieM3oZNHY5uOQ@mail.gmail.com>
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
Subject: Re: [Uboot-stm32] [PATCH v5 11/13] video: Use VIDEO_DAMAGE for
	VIDEO_COPY
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
> From: Alexander Graf <agraf@csgraf.de>
>
> CONFIG_VIDEO_COPY implemented a range-based copying mechanism: If we
> print a single character, it will always copy the full range of bytes
> from the top left corner of the character to the lower right onto the
> uncached frame buffer. This includes pretty much the full line contents
> of the printed character.
>
> Since we now have proper damage tracking, let's make use of that to reduce
> the amount of data we need to copy. With this patch applied, we will only
> copy the tiny rectangle surrounding characters when we print them,
> speeding up the video console.

I suppose for rotated consoles it copies whole lines, but otherwise it
does a lot of small copies?

>
> After this, changes to the main frame buffer are not immediately copied
> to the copy frame buffer, but postponed until the next video device
> sync. So issue an explicit sync before inspecting the copy frame buffer
> contents for the video tests.

So how does the sync get done in this case?

>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> [Alper: Rebase for fontdata->height/w, fill_part(), fix memmove(dev),
>         drop from defconfig, use damage.xstart/yend, use IS_ENABLED(),
>         call video_sync() before copy_fb check, update video_copy test]
> Co-developed-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> ---
>
> Changes in v5:
> - Remove video_sync_copy() also from video_fill(), video_fill_part()
> - Fix memmove() calls by removing the extra dev argument
> - Call video_sync() before checking copy_fb in video tests
> - Use xstart, ystart, xend, yend as names for damage region
> - Use met->baseline instead of priv->baseline
> - Use fontdata->height/width instead of VIDEO_FONT_HEIGHT/WIDTH
> - Use xstart, ystart, xend, yend as names for damage region
> - Use IS_ENABLED() instead of CONFIG_IS_ENABLED()
> - Drop VIDEO_DAMAGE from sandbox defconfig added in a new patch
> - Update dm_test_video_copy test added in a new patch
>
> Changes in v3:
> - Make VIDEO_COPY always select VIDEO_DAMAGE
>
> Changes in v2:
> - Add patch "video: Use VIDEO_DAMAGE for VIDEO_COPY"
>
>  configs/sandbox_defconfig         |  1 -
>  drivers/video/Kconfig             |  5 ++
>  drivers/video/console_normal.c    | 13 +----
>  drivers/video/console_rotate.c    | 44 +++-----------
>  drivers/video/console_truetype.c  | 16 +----
>  drivers/video/vidconsole-uclass.c | 16 -----
>  drivers/video/video-uclass.c      | 97 ++++++++-----------------------
>  drivers/video/video_bmp.c         |  7 ---
>  include/video.h                   | 37 ------------
>  include/video_console.h           | 52 -----------------
>  test/dm/video.c                   |  3 +-
>  11 files changed, 43 insertions(+), 248 deletions(-)
>
> diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
> index 51b820f13121..259f31f26cee 100644
> --- a/configs/sandbox_defconfig
> +++ b/configs/sandbox_defconfig
> @@ -307,7 +307,6 @@ CONFIG_USB_ETH_CDC=y
>  CONFIG_VIDEO=y
>  CONFIG_VIDEO_FONT_SUN12X22=y
>  CONFIG_VIDEO_COPY=y
> -CONFIG_VIDEO_DAMAGE=y
>  CONFIG_CONSOLE_ROTATION=y
>  CONFIG_CONSOLE_TRUETYPE=y
>  CONFIG_CONSOLE_TRUETYPE_CANTORAONE=y
> diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
> index 97f494a1340b..b3fbd9d7d9ca 100644
> --- a/drivers/video/Kconfig
> +++ b/drivers/video/Kconfig
> @@ -83,11 +83,14 @@ config VIDEO_PCI_DEFAULT_FB_SIZE
>
>  config VIDEO_COPY
>         bool "Enable copying the frame buffer to a hardware copy"
> +       select VIDEO_DAMAGE
>         help
>           On some machines (e.g. x86), reading from the frame buffer is very
>           slow because it is uncached. To improve performance, this feature
>           allows the frame buffer to be kept in cached memory (allocated by
>           U-Boot) and then copied to the hardware frame-buffer as needed.
> +         It uses the VIDEO_DAMAGE feature to keep track of regions to copy
> +         and will only copy actually touched regions.
>
>           To use this, your video driver must set @copy_base in
>           struct video_uc_plat.
> @@ -105,6 +108,8 @@ config VIDEO_DAMAGE
>           regions of the frame buffer that were modified before, speeding up
>           screen refreshes significantly.
>
> +         It is also used by VIDEO_COPY to identify which regions changed.
> +
>  config BACKLIGHT_PWM
>         bool "Generic PWM based Backlight Driver"
>         depends on BACKLIGHT && DM_PWM
> diff --git a/drivers/video/console_normal.c b/drivers/video/console_normal.c
> index a19ce6a2bc11..c44aa09473a3 100644
> --- a/drivers/video/console_normal.c
> +++ b/drivers/video/console_normal.c
> @@ -35,10 +35,6 @@ static int console_set_row(struct udevice *dev, uint row, int clr)
>                 fill_pixel_and_goto_next(&dst, clr, pbytes, pbytes);
>         end = dst;
>
> -       ret = vidconsole_sync_copy(dev, line, end);
> -       if (ret)
> -               return ret;
> -
>         video_damage(dev->parent,
>                      0,
>                      fontdata->height * row,
> @@ -57,14 +53,11 @@ static int console_move_rows(struct udevice *dev, uint rowdst,
>         void *dst;
>         void *src;
>         int size;
> -       int ret;
>
>         dst = vid_priv->fb + rowdst * fontdata->height * vid_priv->line_length;
>         src = vid_priv->fb + rowsrc * fontdata->height * vid_priv->line_length;
>         size = fontdata->height * vid_priv->line_length * count;
> -       ret = vidconsole_memmove(dev, dst, src, size);
> -       if (ret)
> -               return ret;
> +       memmove(dst, src, size);

Why are you making that change?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
