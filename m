Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC85784785
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Aug 2023 18:27:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 456BEC78F69;
	Tue, 22 Aug 2023 16:27:08 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76F1EC6A5EF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 13:51:32 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-31aec0a1a8bso1211538f8f.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 06:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692625892; x=1693230692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=edVipA0fXjfO2+yIw/Pp5VvEle3RKuzWiUXEb/KCl5I=;
 b=bU3qjQR0xHT3knwMAc4fOHXpeWOGcUonKhClh1IfqxsqOHWeRbIi1W1OtDuPIyv8dX
 CyIHX30R+SQr8o+T5xSFf4E4kwRpsqOzh2mXOD3dzuYzJPkreOM5clQMgmyn2JGs+nON
 KDztnOSqesV2IvPZqdr61bxJTw/SjXqRXGc7/YkT7OWwlaug26E+DbzP7Xt+plHDVz/9
 6OB5zFxUapwX0mqxb6jbNAz17TvjQ5qIviNkCRZUZ2vseEB78BwHajxkNCG4jVOaQDON
 aJWc+UOFyWJ3jLmQ+cOJgR+J0SoF3VAVYhbYaYviNV2DiaBPLPL9axirby/hW4Kx2waB
 YKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692625892; x=1693230692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=edVipA0fXjfO2+yIw/Pp5VvEle3RKuzWiUXEb/KCl5I=;
 b=Au9KCz2F1O7sp+3MaML1dLRVlrIUqJ2S3vdIzTNdYPT/5ZWKiMjclQroHcEEHygLIX
 RJH+JbIb9y4faqoMgd6jPi7kNGbo3tyQFP3168CTqkyaqgJNZ8dU+6MWN444B7jzKdgZ
 F50y+thxEhy6pZ3DX6XCSfFU2CPjnLLiku2w9SRSULgwuysM/qS7ZROloROj0VxcTSzS
 coNHoTb9dppM96c40jCai2RcAy2dWvn56JviQ5/Y74xjChJVjRK0Y23HPBigug+XG+f0
 n+CnfFXgup6RI17dYBD3YBkDcuthukiJJ10opKVP+68N76omYfjj7EG+76mTVRAzkJ2O
 xqsw==
X-Gm-Message-State: AOJu0Yz/XcXO6dgd/gJ1GladKLcN//Kjo57Av1aIn+Pdd2hGukD9fVZZ
 P24fTC85uUe64CzTpZeAwFg=
X-Google-Smtp-Source: AGHT+IFAUyNsvOmdhjdIygYhsv/SH6hvXItfwiWsY14vr3nwQ9J7A0Q0Y71M8WvaFJdxn7mmOeZlrg==
X-Received: by 2002:a5d:44c8:0:b0:317:e9d7:9387 with SMTP id
 z8-20020a5d44c8000000b00317e9d79387mr7196865wrr.25.1692625891911; 
 Mon, 21 Aug 2023 06:51:31 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1]) by smtp.gmail.com with ESMTPSA id
 r11-20020a5d4e4b000000b00317b063590fsm12600049wrt.55.2023.08.21.06.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 06:51:31 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: u-boot@lists.denx.de
Date: Mon, 21 Aug 2023 16:51:01 +0300
Message-Id: <20230821135111.3558478-5-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
References: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:27:06 +0000
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io,
 Matthias Brugger <mbrugger@suse.com>, Derald Woods <woods.technical@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Andrew Davis <afd@ti.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>, Da Xue <da@libre.computer>
Subject: [Uboot-stm32] [PATCH v5 04/13] dm: video: Add damage tracking API
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

From: Alexander Graf <agraf@csgraf.de>

We are going to introduce image damage tracking to fasten up screen
refresh on large displays. This patch adds damage tracking for up to
one rectangle of the screen which is typically enough to hold blt or
text print updates. Callers into this API and a reduced dcache flush
code path will follow in later patches.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reported-by: Da Xue <da@libre.computer>
[Alper: Use xstart/yend, document new fields, return void from
        video_damage(), declare priv, drop headers, use IS_ENABLED()]
Co-developed-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---

Changes in v5:
- Use xstart, ystart, xend, yend as names for damage region
- Document damage struct and fields in struct video_priv comment
- Return void from video_damage()
- Fix undeclared priv error in video_sync()
- Drop unused headers from video-uclass.c
- Use IS_ENABLED() instead of CONFIG_IS_ENABLED()

Changes in v4:
- Move damage clear to patch "dm: video: Add damage tracking API"
- Simplify first damage logic
- Remove VIDEO_DAMAGE default for ARM

Changes in v3:
- Adapt to always assume DM is used

Changes in v2:
- Remove ifdefs

 drivers/video/Kconfig        | 13 ++++++++++++
 drivers/video/video-uclass.c | 41 +++++++++++++++++++++++++++++++++---
 include/video.h              | 32 ++++++++++++++++++++++++++--
 3 files changed, 81 insertions(+), 5 deletions(-)

diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index fe43fbd7004a..97f494a1340b 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -92,6 +92,19 @@ config VIDEO_COPY
 	  To use this, your video driver must set @copy_base in
 	  struct video_uc_plat.
 
+config VIDEO_DAMAGE
+	bool "Enable damage tracking of frame buffer regions"
+	help
+	  On some machines (most ARM), the display frame buffer resides in
+	  RAM. To make the display controller pick up screen updates, we
+	  have to flush frame buffer contents from CPU caches into RAM which
+	  can be a slow operation.
+
+	  This feature adds damage tracking to collect information about regions
+	  that received updates. When we want to sync, we then only flush
+	  regions of the frame buffer that were modified before, speeding up
+	  screen refreshes significantly.
+
 config BACKLIGHT_PWM
 	bool "Generic PWM based Backlight Driver"
 	depends on BACKLIGHT && DM_PWM
diff --git a/drivers/video/video-uclass.c b/drivers/video/video-uclass.c
index 8f268fc4063f..447689581668 100644
--- a/drivers/video/video-uclass.c
+++ b/drivers/video/video-uclass.c
@@ -351,9 +351,39 @@ void video_set_default_colors(struct udevice *dev, bool invert)
 	priv->colour_bg = video_index_to_colour(priv, back);
 }
 
+/* Notify about changes in the frame buffer */
+void video_damage(struct udevice *vid, int x, int y, int width, int height)
+{
+	struct video_priv *priv = dev_get_uclass_priv(vid);
+	int xend = x + width;
+	int yend = y + height;
+
+	if (!IS_ENABLED(CONFIG_VIDEO_DAMAGE))
+		return;
+
+	if (x > priv->xsize)
+		return;
+
+	if (y > priv->ysize)
+		return;
+
+	if (xend > priv->xsize)
+		xend = priv->xsize;
+
+	if (yend > priv->ysize)
+		yend = priv->ysize;
+
+	/* Span a rectangle across all old and new damage */
+	priv->damage.xstart = min(x, priv->damage.xstart);
+	priv->damage.ystart = min(y, priv->damage.ystart);
+	priv->damage.xend = max(xend, priv->damage.xend);
+	priv->damage.yend = max(yend, priv->damage.yend);
+}
+
 /* Flush video activity to the caches */
 int video_sync(struct udevice *vid, bool force)
 {
+	struct video_priv *priv = dev_get_uclass_priv(vid);
 	struct video_ops *ops = video_get_ops(vid);
 	int ret;
 
@@ -369,15 +399,12 @@ int video_sync(struct udevice *vid, bool force)
 	 * out whether it exists? For now, ARM is safe.
 	 */
 #if defined(CONFIG_ARM) && !CONFIG_IS_ENABLED(SYS_DCACHE_OFF)
-	struct video_priv *priv = dev_get_uclass_priv(vid);
-
 	if (priv->flush_dcache) {
 		flush_dcache_range((ulong)priv->fb,
 				   ALIGN((ulong)priv->fb + priv->fb_size,
 					 CONFIG_SYS_CACHELINE_SIZE));
 	}
 #elif defined(CONFIG_VIDEO_SANDBOX_SDL)
-	struct video_priv *priv = dev_get_uclass_priv(vid);
 	static ulong last_sync;
 
 	if (force || get_timer(last_sync) > 100) {
@@ -385,6 +412,14 @@ int video_sync(struct udevice *vid, bool force)
 		last_sync = get_timer(0);
 	}
 #endif
+
+	if (IS_ENABLED(CONFIG_VIDEO_DAMAGE)) {
+		priv->damage.xstart = priv->xsize;
+		priv->damage.ystart = priv->ysize;
+		priv->damage.xend = 0;
+		priv->damage.yend = 0;
+	}
+
 	return 0;
 }
 
diff --git a/include/video.h b/include/video.h
index 66d109ca5da6..a522f33949e5 100644
--- a/include/video.h
+++ b/include/video.h
@@ -85,6 +85,11 @@ enum video_format {
  * @fb_size:	Frame buffer size
  * @copy_fb:	Copy of the frame buffer to keep up to date; see struct
  *		video_uc_plat
+ * @damage:	A bounding box of framebuffer regions updated since last sync
+ * @damage.xstart:	X start position in pixels from the left
+ * @damage.ystart:	Y start position in pixels from the top
+ * @damage.xend:	X end position in pixels from the left
+ * @damage.xend:	Y end position in pixels from the top
  * @line_length:	Length of each frame buffer line, in bytes. This can be
  *		set by the driver, but if not, the uclass will set it after
  *		probing
@@ -112,6 +117,12 @@ struct video_priv {
 	void *fb;
 	int fb_size;
 	void *copy_fb;
+	struct {
+		int xstart;
+		int ystart;
+		int xend;
+		int yend;
+	} damage;
 	int line_length;
 	u32 colour_fg;
 	u32 colour_bg;
@@ -254,8 +265,9 @@ int video_fill_part(struct udevice *dev, int xstart, int ystart, int xend,
  * @return: 0 on success, error code otherwise
  *
  * Some frame buffers are cached or have a secondary frame buffer. This
- * function syncs these up so that the current contents of the U-Boot frame
- * buffer are displayed to the user.
+ * function syncs the damaged parts of them up so that the current contents
+ * of the U-Boot frame buffer are displayed to the user. It clears the damage
+ * buffer.
  */
 int video_sync(struct udevice *vid, bool force);
 
@@ -375,6 +387,22 @@ static inline int video_sync_copy_all(struct udevice *dev)
 
 #endif
 
+/**
+ * video_damage() - Notify the video subsystem about screen updates.
+ *
+ * @vid:	Device to sync
+ * @x:	        Upper left X coordinate of the damaged rectangle
+ * @y:	        Upper left Y coordinate of the damaged rectangle
+ * @width:	Width of the damaged rectangle
+ * @height:	Height of the damaged rectangle
+ *
+ * Some frame buffers are cached or have a secondary frame buffer. This
+ * function notifies the video subsystem about rectangles that were updated
+ * within the frame buffer. They may only get written to the screen on the
+ * next call to video_sync().
+ */
+void video_damage(struct udevice *vid, int x, int y, int width, int height);
+
 /**
  * video_is_active() - Test if one video device it active
  *
-- 
2.40.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
