Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A54C2660AA7
	for <lists+uboot-stm32@lfdr.de>; Sat,  7 Jan 2023 01:14:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6101FC69069;
	Sat,  7 Jan 2023 00:14:33 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDD1AC69066
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Jan 2023 00:14:31 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-4c15c4fc8ccso42944847b3.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Jan 2023 16:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fF9LMAV9ZWAuTltQqLjReBhFcZlOY2ZG1nq6P8vDKWg=;
 b=fCXTMrD5Fu2G4d4U1EViWb+9NBtIxwO/8NJM2+yE44yTWPM7sWHK7xNQgQDHmOe0fR
 KwQrJro2BjnYXMeb2hmHLnCnvc2i7UhAvjrCMfVglYP/vInWw2uRx5KW2rRzw82MLrxc
 wz3uv7bkWPmzzse3B2TUbLRcQdEhIMtNmsQNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fF9LMAV9ZWAuTltQqLjReBhFcZlOY2ZG1nq6P8vDKWg=;
 b=W/b0vkY+ARbRwdgbzq6994hYoawiKngVboNYZlTxBBH0ix2V32w8w6xAG7Cnt5laM0
 AH4H9GuiIDqedpjgNM2rH+AVNxKrE3cHu/46dWCA9XCWx9JHuheEOk6TfAjR4DUfpiVZ
 QfclXGh7dnvD+Xv1/T64JKdcYmszWcJFvBgLPeUupxd04Od42P3jsckz0ulnBkF6cWtN
 IV98ZVRYf3WfKkthTumtTaZ7aLiCa9ZabYEoxinreEXQNpKr9+KHDgzNAAw2LTXoTjLW
 cA3a5KofgKYxLpzYx4oJ3oHeimC/R8FKgqtlIfJMVd5nTlnxQFpINXBKy81qX/AYUYHn
 eRYA==
X-Gm-Message-State: AFqh2koDq1hwsKP+of7ZJ8pwlEJl2pTBF+jsINK9I0rfoPKznePtpW5c
 EqBUT2rgnrLD2exseJMTjVt3ZAetiUo20AbUte+jdw==
X-Google-Smtp-Source: AMrXdXv+AvpMM7Q5hmDTx0fd7n30utq5Go4D7mxlULkVdAlnNNyYLX20H8oFWD1uuEaF3zmYDVDAWOWBlZHaNBMIrpc=
X-Received: by 2002:a81:25cf:0:b0:426:6938:b154 with SMTP id
 l198-20020a8125cf000000b004266938b154mr1029010ywl.511.1673050470605; Fri, 06
 Jan 2023 16:14:30 -0800 (PST)
MIME-Version: 1.0
References: <20230103215004.22646-1-agraf@csgraf.de>
 <20230103215004.22646-2-agraf@csgraf.de>
In-Reply-To: <20230103215004.22646-2-agraf@csgraf.de>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 6 Jan 2023 17:13:30 -0700
Message-ID: <CAPnjgZ3pmF60WMNFipBUN9nqd4pQC=FeYOy5zgt6pvEWckROqw@mail.gmail.com>
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
Subject: Re: [Uboot-stm32] [PATCH v4 1/9] dm: video: Add damage tracking API
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
> We are going to introduce image damage tracking to fasten up screen
> refresh on large displays. This patch adds damage tracking for up to
> one rectangle of the screen which is typically enough to hold blt or
> text print updates. Callers into this API and a reduced dcache flush
> code path will follow in later patches.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reported-by: Da Xue <da@libre.computer>
>
> ---
>
> v1 -> v2:
>
>   - Remove ifdefs
>
> v2 -> v3:
>
>   - Adapt Kconfig to DM always
>
> v3 -> v4:
>
>   - Move damage clear from patch 6 to this one
>   - Simplify first damage logic
>   - Remove VIDEO_DAMAGE default for ARM
> ---
>  drivers/video/Kconfig        | 13 ++++++++++++
>  drivers/video/video-uclass.c | 41 ++++++++++++++++++++++++++++++++++++
>  include/video.h              | 29 +++++++++++++++++++++++--
>  3 files changed, 81 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
> index f539977d9b..826a1a6587 100644
> --- a/drivers/video/Kconfig
> +++ b/drivers/video/Kconfig
> @@ -62,6 +62,19 @@ config VIDEO_COPY
>           To use this, your video driver must set @copy_base in
>           struct video_uc_plat.
>
> +config VIDEO_DAMAGE
> +       bool "Enable damage tracking of frame buffer regions"
> +       help
> +         On some machines (most ARM), the display frame buffer resides in
> +         RAM. To make the display controller pick up screen updates, we
> +         have to flush frame buffer contents from CPU caches into RAM which
> +         can be a slow operation.
> +
> +         This feature adds damage tracking to collect information about regions
> +         that received updates. When we want to sync, we then only flush
> +         regions of the frame buffer that were modified before, speeding up
> +         screen refreshes significantly.
> +
>  config BACKLIGHT_PWM
>         bool "Generic PWM based Backlight Driver"
>         depends on BACKLIGHT && DM_PWM
> diff --git a/drivers/video/video-uclass.c b/drivers/video/video-uclass.c
> index 0ce376ca3f..d18c8cd2b1 100644
> --- a/drivers/video/video-uclass.c
> +++ b/drivers/video/video-uclass.c
> @@ -21,6 +21,8 @@
>  #include <dm/device_compat.h>
>  #include <dm/device-internal.h>
>  #include <dm/uclass-internal.h>
> +#include <linux/types.h>
> +#include <linux/bitmap.h>
>  #ifdef CONFIG_SANDBOX
>  #include <asm/sdl.h>
>  #endif
> @@ -254,6 +256,37 @@ void video_set_default_colors(struct udevice *dev, bool invert)
>         priv->colour_bg = video_index_to_colour(priv, back);
>  }
>
> +/* Notify about changes in the frame buffer */
> +int video_damage(struct udevice *vid, int x, int y, int width, int height)
> +{
> +       struct video_priv *priv = dev_get_uclass_priv(vid);
> +       int endx = x + width;
> +       int endy = y + height;
> +
> +       if (!CONFIG_IS_ENABLED(VIDEO_DAMAGE))
> +               return 0;
> +
> +       if (x > priv->xsize)
> +               return 0;
> +
> +       if (y > priv->ysize)
> +               return 0;
> +
> +       if (endx > priv->xsize)
> +               endx = priv->xsize;
> +
> +       if (endy > priv->ysize)
> +               endy = priv->ysize;
> +
> +       /* Span a rectangle across all old and new damage */
> +       priv->damage.x = min(x, priv->damage.x);
> +       priv->damage.y = min(y, priv->damage.y);
> +       priv->damage.endx = max(endx, priv->damage.endx);
> +       priv->damage.endy = max(endy, priv->damage.endy);
> +
> +       return 0;

Should we make this void, then?

> +}
> +
>  /* Flush video activity to the caches */
>  int video_sync(struct udevice *vid, bool force)
>  {
> @@ -288,6 +321,14 @@ int video_sync(struct udevice *vid, bool force)
>                 last_sync = get_timer(0);
>         }
>  #endif
> +
> +       if (CONFIG_IS_ENABLED(VIDEO_DAMAGE)) {
> +               priv->damage.x = priv->xsize;
> +               priv->damage.y = priv->ysize;
> +               priv->damage.endx = 0;
> +               priv->damage.endy = 0;
> +       }
> +
>         return 0;
>  }
>
> diff --git a/include/video.h b/include/video.h
> index 43f2e2c02f..4b35e97f79 100644
> --- a/include/video.h
> +++ b/include/video.h
> @@ -109,6 +109,12 @@ struct video_priv {

Please update the comment when you add struct members.

>         void *fb;
>         int fb_size;
>         void *copy_fb;
> +       struct {
> +               int x;
> +               int y;
> +               int endx;
> +               int endy;
> +       } damage;
>         int line_length;
>         u32 colour_fg;
>         u32 colour_bg;
> @@ -211,8 +217,9 @@ int video_fill(struct udevice *dev, u32 colour);
>   * @return: 0 on success, error code otherwise
>   *
>   * Some frame buffers are cached or have a secondary frame buffer. This
> - * function syncs these up so that the current contents of the U-Boot frame
> - * buffer are displayed to the user.
> + * function syncs the damaged parts of them up so that the current contents
> + * of the U-Boot frame buffer are displayed to the user. It clears the damage
> + * buffer.
>   */
>  int video_sync(struct udevice *vid, bool force);
>
> @@ -332,6 +339,24 @@ static inline int video_sync_copy_all(struct udevice *dev)
>
>  #endif
>
> +/**
> + * video_damage() - Notify the video subsystem about screen updates.
> + *
> + * @vid:       Device to sync
> + * @x:         Upper left X coordinate of the damaged rectangle
> + * @y:         Upper left Y coordinate of the damaged rectangle
> + * @width:     Width of the damaged rectangle
> + * @height:    Height of the damaged rectangle
> + *
> + * @return: 0

Returns: 0

(that is the style now, sadly meaning that much of U-Boot needs to be updated)

> + *
> + * Some frame buffers are cached or have a secondary frame buffer. This
> + * function notifies the video subsystem about rectangles that were updated
> + * within the frame buffer. They may only get written to the screen on the
> + * next call to video_sync().
> + */
> +int video_damage(struct udevice *vid, int x, int y, int width, int height);
> +
>  /**
>   * video_is_active() - Test if one video device it active
>   *
> --
> 2.37.1 (Apple Git-137.1)
>

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
