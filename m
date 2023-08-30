Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CC278DE92
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Aug 2023 21:07:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCDB1C6A61A;
	Wed, 30 Aug 2023 19:07:43 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7630BC62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 19:07:42 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-401f68602a8so7443165e9.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 12:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693422462; x=1694027262;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gLGrY5biqcp6T6dTNEIWQBzPL3heig8F9eKIC9yTalw=;
 b=oLW8ZApt0sFAc+8Eotthr2G7yCVT6OM0Eh4G75Lly9bNQlDBspbBV6mqeO/dW8EBCy
 /CxNLyfrstM4Qb3MTmGs7zkPXPnvjHP0giwFaRB50xeQpqT69l+AqC8uOgYWiKJfEDyp
 cneawXj16/0gkqEFVZ6Zc7xRTEG6dwDc/fc1N3Dei2cu5lGnlE7ybqK9XDLcZT/rTMEk
 t+wLhzERrx7NDE0qUOlsBSmUtXxBoDSo/BXwzuhQ918PqVvQEob1mFWUz1yqUvhfjcvo
 ZQMsnbt5U2y1zBcYMjJi9leFvvtGjxHJEI9x8nLdd15EbV3HbPlxUnWSF9sO+OHUs1Fm
 0xuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693422462; x=1694027262;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gLGrY5biqcp6T6dTNEIWQBzPL3heig8F9eKIC9yTalw=;
 b=A+sEzgUxY61F05el1j94rYb0lAR+h/axhwKfrDC68fCzBeFrXVG2BGo9wKSCo9Z6LU
 iqDyuDHRDxtucuYJ4VtSXudT5KmW2SSUBe1P4vcG9WearnVtEytQNT2Q5tJZ8GT21Hjf
 GUsHvgyc1wCpq0do7ALtp/3nZpMq1YZRC+DGdLA28WLeXqHwHtAyZj//ww51eoPS/ACK
 i2O7BxiKYacVV8BdB6ic0vSfCvWiZwocMFkI677J/ioYZ/X6iGV2l4ohZ+NuB2sCWPYu
 a7v+4y7va/N2nSB7rAY5ZQqKZen+d5+W0uTUKbDisY5LK6lI9ixMQO1ii97L2dTw9Pr9
 JuRQ==
X-Gm-Message-State: AOJu0YxYNIwkwMDXRsodAl/VcSGd4aCdzEQN77jgChh5UViKpMJqYHnR
 RTYh11NO15dNuurFFP4Uss8=
X-Google-Smtp-Source: AGHT+IHNnOTh34WBWk9Y0vv46TcL/xd7zI7WLG5Hmpso8j8zzrTK3Q4+l35880lUxPZzwxHZV4yLUw==
X-Received: by 2002:a05:600c:3655:b0:400:cc2d:5e00 with SMTP id
 y21-20020a05600c365500b00400cc2d5e00mr2498803wmq.7.1693422461642; 
 Wed, 30 Aug 2023 12:07:41 -0700 (PDT)
Received: from [192.168.0.84] ([178.233.24.1])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a1c4b0b000000b003fe2b081661sm3017694wma.30.2023.08.30.12.07.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 12:07:40 -0700 (PDT)
Message-ID: <ee7997af-e004-414c-857c-b0ca2dad1b4d@gmail.com>
Date: Wed, 30 Aug 2023 22:07:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, tr, en-GB
To: Alexander Graf <agraf@csgraf.de>, Simon Glass <sjg@chromium.org>
References: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
 <20230821135111.3558478-12-alpernebiyasak@gmail.com>
 <CAPnjgZ0Ho7h5T-7S1Mi23+1ez7hq2MCEEZJjjieM3oZNHY5uOQ@mail.gmail.com>
 <c7579b16-e373-46ae-87d9-d2a1184d6b8d@csgraf.de>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
In-Reply-To: <c7579b16-e373-46ae-87d9-d2a1184d6b8d@csgraf.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io,
 Matthias Brugger <mbrugger@suse.com>, Derald Woods <woods.technical@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Andrew Davis <afd@ti.com>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
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

On 2023-08-21 23:06 +03:00, Alexander Graf wrote:
> 
> On 21.08.23 21:11, Simon Glass wrote:
>> Hi Alper,
>>
>> On Mon, 21 Aug 2023 at 07:51, Alper Nebi Yasak <alpernebiyasak@gmail.com> wrote:
>>> From: Alexander Graf <agraf@csgraf.de>
>>>
>>> CONFIG_VIDEO_COPY implemented a range-based copying mechanism: If we
>>> print a single character, it will always copy the full range of bytes
>>> from the top left corner of the character to the lower right onto the
>>> uncached frame buffer. This includes pretty much the full line contents
>>> of the printed character.
>>>
>>> Since we now have proper damage tracking, let's make use of that to reduce
>>> the amount of data we need to copy. With this patch applied, we will only
>>> copy the tiny rectangle surrounding characters when we print them,
>>> speeding up the video console.
>> I suppose for rotated consoles it copies whole lines, but otherwise it
>> does a lot of small copies?
> 
> 
> I tried to keep the code as simple as possible and only track an "upper 
> left" and "lower right" corner of modifications. So sync will always 
> copy/flush a single rectangle.

Yep, see patch 06/13 for size of the regions. E.g. for putc_xy()s it's
fontdata->height * fontdata->width, for rows it's like fontdata->height
* vid_priv->xsize * count...

>>
>>> After this, changes to the main frame buffer are not immediately copied
>>> to the copy frame buffer, but postponed until the next video device
>>> sync. So issue an explicit sync before inspecting the copy frame buffer
>>> contents for the video tests.
>> So how does the sync get done in this case?
> 
> It gets called as part of video_sync():
> 
> +static void video_flush_copy(struct udevice *vid)
> +{
> +	struct video_priv *priv = dev_get_uclass_priv(vid);
> +
> +	if (!priv->copy_fb)
> +		return;
> +
> +	if (priv->damage.xend && priv->damage.yend) {
> +		int lstart = priv->damage.xstart * VNBYTES(priv->bpix);
> +		int lend = priv->damage.xend * VNBYTES(priv->bpix);
> +		int y;
> +
> +		for (y = priv->damage.ystart; y < priv->damage.yend; y++) {
> +			ulong offset = (y * priv->line_length) + lstart;
> +			ulong len = lend - lstart;
> +
> +			memcpy(priv->copy_fb + offset, priv->fb + offset, len);
> +		}
> +	}
> +}

I think Simon was asking how and when video_sync() is called outside the
tests. The tests use lower-level functions that are ops->putc_xy() in
each console, and normally vidconsole calls higher on the call-chain
also maybe do a video_sync() when they think it's worth updating the
display.

>>
>>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>>> [Alper: Rebase for fontdata->height/w, fill_part(), fix memmove(dev),
>>>          drop from defconfig, use damage.xstart/yend, use IS_ENABLED(),
>>>          call video_sync() before copy_fb check, update video_copy test]
>>> Co-developed-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
>>> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
>>> ---
>>>
>>> Changes in v5:
>>> - Remove video_sync_copy() also from video_fill(), video_fill_part()
>>> - Fix memmove() calls by removing the extra dev argument
>>> - Call video_sync() before checking copy_fb in video tests
>>> - Use xstart, ystart, xend, yend as names for damage region
>>> - Use met->baseline instead of priv->baseline
>>> - Use fontdata->height/width instead of VIDEO_FONT_HEIGHT/WIDTH
>>> - Use xstart, ystart, xend, yend as names for damage region
>>> - Use IS_ENABLED() instead of CONFIG_IS_ENABLED()
>>> - Drop VIDEO_DAMAGE from sandbox defconfig added in a new patch
>>> - Update dm_test_video_copy test added in a new patch
>>>
>>> Changes in v3:
>>> - Make VIDEO_COPY always select VIDEO_DAMAGE
>>>
>>> Changes in v2:
>>> - Add patch "video: Use VIDEO_DAMAGE for VIDEO_COPY"
>>>
>>>   configs/sandbox_defconfig         |  1 -
>>>   drivers/video/Kconfig             |  5 ++
>>>   drivers/video/console_normal.c    | 13 +----
>>>   drivers/video/console_rotate.c    | 44 +++-----------
>>>   drivers/video/console_truetype.c  | 16 +----
>>>   drivers/video/vidconsole-uclass.c | 16 -----
>>>   drivers/video/video-uclass.c      | 97 ++++++++-----------------------
>>>   drivers/video/video_bmp.c         |  7 ---
>>>   include/video.h                   | 37 ------------
>>>   include/video_console.h           | 52 -----------------
>>>   test/dm/video.c                   |  3 +-
>>>   11 files changed, 43 insertions(+), 248 deletions(-)
>>>
>>> diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
>>> index 51b820f13121..259f31f26cee 100644
>>> --- a/configs/sandbox_defconfig
>>> +++ b/configs/sandbox_defconfig
>>> @@ -307,7 +307,6 @@ CONFIG_USB_ETH_CDC=y
>>>   CONFIG_VIDEO=y
>>>   CONFIG_VIDEO_FONT_SUN12X22=y
>>>   CONFIG_VIDEO_COPY=y
>>> -CONFIG_VIDEO_DAMAGE=y
>>>   CONFIG_CONSOLE_ROTATION=y
>>>   CONFIG_CONSOLE_TRUETYPE=y
>>>   CONFIG_CONSOLE_TRUETYPE_CANTORAONE=y
>>> diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
>>> index 97f494a1340b..b3fbd9d7d9ca 100644
>>> --- a/drivers/video/Kconfig
>>> +++ b/drivers/video/Kconfig
>>> @@ -83,11 +83,14 @@ config VIDEO_PCI_DEFAULT_FB_SIZE
>>>
>>>   config VIDEO_COPY
>>>          bool "Enable copying the frame buffer to a hardware copy"
>>> +       select VIDEO_DAMAGE
>>>          help
>>>            On some machines (e.g. x86), reading from the frame buffer is very
>>>            slow because it is uncached. To improve performance, this feature
>>>            allows the frame buffer to be kept in cached memory (allocated by
>>>            U-Boot) and then copied to the hardware frame-buffer as needed.
>>> +         It uses the VIDEO_DAMAGE feature to keep track of regions to copy
>>> +         and will only copy actually touched regions.
>>>
>>>            To use this, your video driver must set @copy_base in
>>>            struct video_uc_plat.
>>> @@ -105,6 +108,8 @@ config VIDEO_DAMAGE
>>>            regions of the frame buffer that were modified before, speeding up
>>>            screen refreshes significantly.
>>>
>>> +         It is also used by VIDEO_COPY to identify which regions changed.
>>> +
>>>   config BACKLIGHT_PWM
>>>          bool "Generic PWM based Backlight Driver"
>>>          depends on BACKLIGHT && DM_PWM
>>> diff --git a/drivers/video/console_normal.c b/drivers/video/console_normal.c
>>> index a19ce6a2bc11..c44aa09473a3 100644
>>> --- a/drivers/video/console_normal.c
>>> +++ b/drivers/video/console_normal.c
>>> @@ -35,10 +35,6 @@ static int console_set_row(struct udevice *dev, uint row, int clr)
>>>                  fill_pixel_and_goto_next(&dst, clr, pbytes, pbytes);
>>>          end = dst;
>>>
>>> -       ret = vidconsole_sync_copy(dev, line, end);
>>> -       if (ret)
>>> -               return ret;
>>> -
>>>          video_damage(dev->parent,
>>>                       0,
>>>                       fontdata->height * row,
>>> @@ -57,14 +53,11 @@ static int console_move_rows(struct udevice *dev, uint rowdst,
>>>          void *dst;
>>>          void *src;
>>>          int size;
>>> -       int ret;
>>>
>>>          dst = vid_priv->fb + rowdst * fontdata->height * vid_priv->line_length;
>>>          src = vid_priv->fb + rowsrc * fontdata->height * vid_priv->line_length;
>>>          size = fontdata->height * vid_priv->line_length * count;
>>> -       ret = vidconsole_memmove(dev, dst, src, size);
>>> -       if (ret)
>>> -               return ret;
>>> +       memmove(dst, src, size);
>> Why are you making that change?
> 
> There is no point in keeping a special vidconsole_memmove() around 
> anymore, since we don't actually need to call vidconsole_sync_copy() 
> after the move. The damage call that we introduced to all call sites in 
> combination with a video_sync() call takes over the job of the sync copy.

More specifically, this batches the copying work video_sync_copy() does
per console-op into video_flush_copy() called once per video_sync().
Then, since vidconsole_memmove() is only used to memmove() and invoke
that copy mechanism, we can also reduce it to just memmove().
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
