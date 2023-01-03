Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8AC65EE1A
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 Jan 2023 15:01:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89775C69079;
	Thu,  5 Jan 2023 14:01:31 +0000 (UTC)
Received: from zulu616.server4you.de (mail.csgraf.de [85.25.223.15])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7064AC69048
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 21:50:11 +0000 (UTC)
Received: from localhost.localdomain
 (dynamic-092-225-244-121.92.225.pool.telefonica.de [92.225.244.121])
 by csgraf.de (Postfix) with ESMTPSA id A7CB46081071;
 Tue,  3 Jan 2023 22:50:10 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: u-boot@lists.denx.de
Date: Tue,  3 Jan 2023 22:50:02 +0100
Message-Id: <20230103215004.22646-8-agraf@csgraf.de>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230103215004.22646-1-agraf@csgraf.de>
References: <20230103215004.22646-1-agraf@csgraf.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Jan 2023 14:01:29 +0000
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io,
 Matthias Brugger <mbrugger@suse.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>, Da Xue <da@libre.computer>
Subject: [Uboot-stm32] [PATCH v4 7/9] video: Use VIDEO_DAMAGE for VIDEO_COPY
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

CONFIG_VIDEO_COPY implemented a range based copying mechanism: If we
print a single character, it will always copy the full range of bytes
from the top left corner of the character to the lower right onto the
uncached frame buffer. This includes pretty much the full line contents
of the printed character.

Since we now have proper damage tracking, let's make use of that to reduce
the amount of data we need to copy. With this patch applied, we will only
copy the tiny rectangle surrounding characters when we print them,
speeding up the video console.

As a bonus, we remove a lot of code.

Signed-off-by: Alexander Graf <agraf@csgraf.de>

---

v2 -> v3:

  - Rebase
  - Make CONFIG_COPY always select VIDEO_DAMAGE
---
 drivers/video/Kconfig             |  5 ++
 drivers/video/console_normal.c    | 14 +----
 drivers/video/console_rotate.c    | 37 ++-----------
 drivers/video/console_truetype.c  | 17 +-----
 drivers/video/vidconsole-uclass.c | 16 ------
 drivers/video/video-uclass.c      | 91 ++++++++-----------------------
 drivers/video/video_bmp.c         |  7 ---
 include/video.h                   | 37 -------------
 include/video_console.h           | 49 -----------------
 9 files changed, 37 insertions(+), 236 deletions(-)

diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 826a1a6587..472e9c7c61 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -53,11 +53,14 @@ config VIDEO_PCI_DEFAULT_FB_SIZE
 
 config VIDEO_COPY
 	bool "Enable copying the frame buffer to a hardware copy"
+	select VIDEO_DAMAGE
 	help
 	  On some machines (e.g. x86), reading from the frame buffer is very
 	  slow because it is uncached. To improve performance, this feature
 	  allows the frame buffer to be kept in cached memory (allocated by
 	  U-Boot) and then copied to the hardware frame-buffer as needed.
+	  It uses the VIDEO_DAMAGE feature to keep track of regions to copy
+	  and will only copy actually touched regions.
 
 	  To use this, your video driver must set @copy_base in
 	  struct video_uc_plat.
@@ -75,6 +78,8 @@ config VIDEO_DAMAGE
 	  regions of the frame buffer that were modified before, speeding up
 	  screen refreshes significantly.
 
+	  It is also used by VIDEO_COPY to identify which regions changed.
+
 config BACKLIGHT_PWM
 	bool "Generic PWM based Backlight Driver"
 	depends on BACKLIGHT && DM_PWM
diff --git a/drivers/video/console_normal.c b/drivers/video/console_normal.c
index 5b5586fd3e..625d14516f 100644
--- a/drivers/video/console_normal.c
+++ b/drivers/video/console_normal.c
@@ -18,7 +18,6 @@ static int console_normal_set_row(struct udevice *dev, uint row, int clr)
 	struct video_priv *vid_priv = dev_get_uclass_priv(dev->parent);
 	void *line, *end;
 	int pixels = VIDEO_FONT_HEIGHT * vid_priv->xsize;
-	int ret;
 	int i;
 
 	line = vid_priv->fb + row * VIDEO_FONT_HEIGHT * vid_priv->line_length;
@@ -53,9 +52,6 @@ static int console_normal_set_row(struct udevice *dev, uint row, int clr)
 	default:
 		return -ENOSYS;
 	}
-	ret = vidconsole_sync_copy(dev, line, end);
-	if (ret)
-		return ret;
 
 	video_damage(dev->parent, 0, VIDEO_FONT_HEIGHT * row, vid_priv->xsize,
 		     VIDEO_FONT_HEIGHT);
@@ -70,14 +66,11 @@ static int console_normal_move_rows(struct udevice *dev, uint rowdst,
 	void *dst;
 	void *src;
 	int size;
-	int ret;
 
 	dst = vid_priv->fb + rowdst * VIDEO_FONT_HEIGHT * vid_priv->line_length;
 	src = vid_priv->fb + rowsrc * VIDEO_FONT_HEIGHT * vid_priv->line_length;
 	size = VIDEO_FONT_HEIGHT * vid_priv->line_length * count;
-	ret = vidconsole_memmove(dev, dst, src, size);
-	if (ret)
-		return ret;
+	memmove(dst, src, size);
 
 	video_damage(dev->parent, 0, VIDEO_FONT_HEIGHT * rowdst, vid_priv->xsize,
 		     VIDEO_FONT_HEIGHT * count);
@@ -94,7 +87,6 @@ static int console_normal_putc_xy(struct udevice *dev, uint x_frac, uint y,
 	int i, row;
 	void *start;
 	void *line;
-	int ret;
 
 	start = vid_priv->fb + y * vid_priv->line_length +
 		VID_TO_PIXEL(x_frac) * VNBYTES(vid_priv->bpix);
@@ -153,10 +145,6 @@ static int console_normal_putc_xy(struct udevice *dev, uint x_frac, uint y,
 	video_damage(dev->parent, VID_TO_PIXEL(x_frac), y, VIDEO_FONT_WIDTH,
 		     VIDEO_FONT_HEIGHT);
 
-	ret = vidconsole_sync_copy(dev, start, line);
-	if (ret)
-		return ret;
-
 	return VID_TO_POS(VIDEO_FONT_WIDTH);
 }
 
diff --git a/drivers/video/console_rotate.c b/drivers/video/console_rotate.c
index 56e20bb4f3..9b179a45b6 100644
--- a/drivers/video/console_rotate.c
+++ b/drivers/video/console_rotate.c
@@ -53,9 +53,6 @@ static int console_set_row_1(struct udevice *dev, uint row, int clr)
 		}
 		line += vid_priv->line_length;
 	}
-	ret = vidconsole_sync_copy(dev, start, line);
-	if (ret)
-		return ret;
 
 	video_damage(dev->parent,
 		     vid_priv->xsize - ((row + 1) * VIDEO_FONT_HEIGHT),
@@ -81,10 +78,7 @@ static int console_move_rows_1(struct udevice *dev, uint rowdst, uint rowsrc,
 		(rowsrc + count) * VIDEO_FONT_HEIGHT * pbytes;
 
 	for (j = 0; j < vid_priv->ysize; j++) {
-		ret = vidconsole_memmove(dev, dst, src,
-					 VIDEO_FONT_HEIGHT * pbytes * count);
-		if (ret)
-			return ret;
+		memmove(dst, src, VIDEO_FONT_HEIGHT * pbytes * count);
 		src += vid_priv->line_length;
 		dst += vid_priv->line_length;
 	}
@@ -158,10 +152,6 @@ static int console_putc_xy_1(struct udevice *dev, uint x_frac, uint y, char ch)
 		mask >>= 1;
 	}
 	/* We draw backwards from 'start, so account for the first line */
-	ret = vidconsole_sync_copy(dev, start - vid_priv->line_length, line);
-	if (ret)
-		return ret;
-
 	video_damage(dev->parent,
 		     vid_priv->xsize - y - VIDEO_FONT_HEIGHT - 1,
 		     linenum - 1,
@@ -213,9 +203,6 @@ static int console_set_row_2(struct udevice *dev, uint row, int clr)
 	default:
 		return -ENOSYS;
 	}
-	ret = vidconsole_sync_copy(dev, start, end);
-	if (ret)
-		return ret;
 
 	video_damage(dev->parent,
 		     0,
@@ -239,8 +226,8 @@ static int console_move_rows_2(struct udevice *dev, uint rowdst, uint rowsrc,
 		vid_priv->line_length;
 	src = end - (rowsrc + count) * VIDEO_FONT_HEIGHT *
 		vid_priv->line_length;
-	vidconsole_memmove(dev, dst, src,
-			   VIDEO_FONT_HEIGHT * vid_priv->line_length * count);
+	memmove(dev, dst, src, VIDEO_FONT_HEIGHT *
+		vid_priv->line_length * count);
 
 	video_damage(dev->parent,
 		     0,
@@ -313,10 +300,6 @@ static int console_putc_xy_2(struct udevice *dev, uint x_frac, uint y, char ch)
 		}
 		line -= vid_priv->line_length;
 	}
-	/* Add 4 bytes to allow for the first pixel writen */
-	ret = vidconsole_sync_copy(dev, start + 4, line);
-	if (ret)
-		return ret;
 
 	video_damage(dev->parent,
 		     x - VIDEO_FONT_WIDTH,
@@ -367,9 +350,6 @@ static int console_set_row_3(struct udevice *dev, uint row, int clr)
 		}
 		line += vid_priv->line_length;
 	}
-	ret = vidconsole_sync_copy(dev, start, line);
-	if (ret)
-		return ret;
 
 	video_damage(dev->parent,
 		     row * VIDEO_FONT_HEIGHT,
@@ -387,16 +367,13 @@ static int console_move_rows_3(struct udevice *dev, uint rowdst, uint rowsrc,
 	int pbytes = VNBYTES(vid_priv->bpix);
 	void *dst;
 	void *src;
-	int j, ret;
+	int j;
 
 	dst = vid_priv->fb + rowdst * VIDEO_FONT_HEIGHT * pbytes;
 	src = vid_priv->fb + rowsrc * VIDEO_FONT_HEIGHT * pbytes;
 
 	for (j = 0; j < vid_priv->ysize; j++) {
-		ret = vidconsole_memmove(dev, dst, src,
-					 VIDEO_FONT_HEIGHT * pbytes * count);
-		if (ret)
-			return ret;
+		memmove(dev, dst, src, VIDEO_FONT_HEIGHT * pbytes * count);
 		src += vid_priv->line_length;
 		dst += vid_priv->line_length;
 	}
@@ -468,10 +445,6 @@ static int console_putc_xy_3(struct udevice *dev, uint x_frac, uint y, char ch)
 		mask >>= 1;
 	}
 	/* Add a line to allow for the first pixels writen */
-	ret = vidconsole_sync_copy(dev, start + vid_priv->line_length, line);
-	if (ret)
-		return ret;
-
 	video_damage(dev->parent,
 		     y,
 		     x - VIDEO_FONT_WIDTH + 1,
diff --git a/drivers/video/console_truetype.c b/drivers/video/console_truetype.c
index 3fc6e24485..a545189cbd 100644
--- a/drivers/video/console_truetype.c
+++ b/drivers/video/console_truetype.c
@@ -185,9 +185,6 @@ static int console_truetype_set_row(struct udevice *dev, uint row, int clr)
 	default:
 		return -ENOSYS;
 	}
-	ret = vidconsole_sync_copy(dev, line, end);
-	if (ret)
-		return ret;
 
 	video_damage(dev->parent, 0, vc_priv->y_charsize * row, vid_priv->xsize,
 		     vc_priv->y_charsize);
@@ -204,14 +201,11 @@ static int console_truetype_move_rows(struct udevice *dev, uint rowdst,
 	struct console_tt_metrics *met = priv->cur_met;
 	void *dst;
 	void *src;
-	int i, diff, ret;
+	int i, diff;
 
 	dst = vid_priv->fb + rowdst * met->font_size * vid_priv->line_length;
 	src = vid_priv->fb + rowsrc * met->font_size * vid_priv->line_length;
-	ret = vidconsole_memmove(dev, dst, src, met->font_size *
-				 vid_priv->line_length * count);
-	if (ret)
-		return ret;
+	memmove(dev, dst, src, met->font_size * vid_priv->line_length * count);
 
 	/* Scroll up our position history */
 	diff = (rowsrc - rowdst) * met->font_size;
@@ -382,9 +376,6 @@ static int console_truetype_putc_xy(struct udevice *dev, uint x, uint y,
 	video_damage(dev->parent, VID_TO_PIXEL(x) + xoff,
 		     y + priv->baseline + yoff, width, height);
 
-	ret = vidconsole_sync_copy(dev, start, line);
-	if (ret)
-		return ret;
 	free(data);
 
 	return width_frac;
@@ -452,10 +443,6 @@ static int console_truetype_erase(struct udevice *dev, int xstart, int ystart,
 
 	video_damage(dev->parent, xstart, ystart, xend - xstart, yend - ystart);
 
-	ret = vidconsole_sync_copy(dev, start, line);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
diff --git a/drivers/video/vidconsole-uclass.c b/drivers/video/vidconsole-uclass.c
index 6bdfb6e37d..c6447baf36 100644
--- a/drivers/video/vidconsole-uclass.c
+++ b/drivers/video/vidconsole-uclass.c
@@ -601,22 +601,6 @@ UCLASS_DRIVER(vidconsole) = {
 	.per_device_auto	= sizeof(struct vidconsole_priv),
 };
 
-#ifdef CONFIG_VIDEO_COPY
-int vidconsole_sync_copy(struct udevice *dev, void *from, void *to)
-{
-	struct udevice *vid = dev_get_parent(dev);
-
-	return video_sync_copy(vid, from, to);
-}
-
-int vidconsole_memmove(struct udevice *dev, void *dst, const void *src,
-		       int size)
-{
-	memmove(dst, src, size);
-	return vidconsole_sync_copy(dev, dst, dst + size);
-}
-#endif
-
 void vidconsole_position_cursor(struct udevice *dev, unsigned col, unsigned row)
 {
 	struct vidconsole_priv *priv = dev_get_uclass_priv(dev);
diff --git a/drivers/video/video-uclass.c b/drivers/video/video-uclass.c
index 37ab9f7ca4..956863f98a 100644
--- a/drivers/video/video-uclass.c
+++ b/drivers/video/video-uclass.c
@@ -131,7 +131,6 @@ int video_reserve(ulong *addrp)
 int video_fill(struct udevice *dev, u32 colour)
 {
 	struct video_priv *priv = dev_get_uclass_priv(dev);
-	int ret;
 
 	switch (priv->bpix) {
 	case VIDEO_BPP16:
@@ -156,9 +155,6 @@ int video_fill(struct udevice *dev, u32 colour)
 		memset(priv->fb, colour, priv->fb_size);
 		break;
 	}
-	ret = video_sync_copy(dev, priv->fb, priv->fb + priv->fb_size);
-	if (ret)
-		return ret;
 
 	video_damage(dev, 0, 0, priv->xsize, priv->ysize);
 
@@ -324,6 +320,27 @@ static void video_flush_dcache(struct udevice *vid)
 }
 #endif
 
+static void video_flush_copy(struct udevice *vid)
+{
+	struct video_priv *priv = dev_get_uclass_priv(vid);
+
+	if (!priv->copy_fb)
+		return;
+
+	if (priv->damage.endx && priv->damage.endy) {
+		int lstart = priv->damage.x * VNBYTES(priv->bpix);
+		int lend = priv->damage.endx * VNBYTES(priv->bpix);
+		int y;
+
+		for (y = priv->damage.y; y < priv->damage.endy; y++) {
+			ulong offset = (y * priv->line_length) + lstart;
+			ulong len = lend - lstart;
+
+			memcpy(priv->copy_fb + offset, priv->fb + offset, len);
+		}
+	}
+}
+
 /* Flush video activity to the caches */
 int video_sync(struct udevice *vid, bool force)
 {
@@ -331,6 +348,9 @@ int video_sync(struct udevice *vid, bool force)
 	struct video_ops *ops = video_get_ops(vid);
 	int ret;
 
+	if (CONFIG_IS_ENABLED(VIDEO_COPY))
+		video_flush_copy(vid);
+
 	if (ops && ops->video_sync) {
 		ret = ops->video_sync(vid);
 		if (ret)
@@ -407,69 +427,6 @@ int video_get_ysize(struct udevice *dev)
 	return priv->ysize;
 }
 
-#ifdef CONFIG_VIDEO_COPY
-int video_sync_copy(struct udevice *dev, void *from, void *to)
-{
-	struct video_priv *priv = dev_get_uclass_priv(dev);
-
-	if (priv->copy_fb) {
-		long offset, size;
-
-		/* Find the offset of the first byte to copy */
-		if ((ulong)to > (ulong)from) {
-			size = to - from;
-			offset = from - priv->fb;
-		} else {
-			size = from - to;
-			offset = to - priv->fb;
-		}
-
-		/*
-		 * Allow a bit of leeway for valid requests somewhere near the
-		 * frame buffer
-		 */
-		if (offset < -priv->fb_size || offset > 2 * priv->fb_size) {
-#ifdef DEBUG
-			char str[120];
-
-			snprintf(str, sizeof(str),
-				 "[** FAULT sync_copy fb=%p, from=%p, to=%p, offset=%lx]",
-				 priv->fb, from, to, offset);
-			console_puts_select_stderr(true, str);
-#endif
-			return -EFAULT;
-		}
-
-		/*
-		 * Silently crop the memcpy. This allows callers to avoid doing
-		 * this themselves. It is common for the end pointer to go a
-		 * few lines after the end of the frame buffer, since most of
-		 * the update algorithms terminate a line after their last write
-		 */
-		if (offset + size > priv->fb_size) {
-			size = priv->fb_size - offset;
-		} else if (offset < 0) {
-			size += offset;
-			offset = 0;
-		}
-
-		memcpy(priv->copy_fb + offset, priv->fb + offset, size);
-	}
-
-	return 0;
-}
-
-int video_sync_copy_all(struct udevice *dev)
-{
-	struct video_priv *priv = dev_get_uclass_priv(dev);
-
-	video_sync_copy(dev, priv->fb, priv->fb + priv->fb_size);
-
-	return 0;
-}
-
-#endif
-
 #define SPLASH_DECL(_name) \
 	extern u8 __splash_ ## _name ## _begin[]; \
 	extern u8 __splash_ ## _name ## _end[]
diff --git a/drivers/video/video_bmp.c b/drivers/video/video_bmp.c
index 7dc5b011a8..609dc9fef6 100644
--- a/drivers/video/video_bmp.c
+++ b/drivers/video/video_bmp.c
@@ -254,7 +254,6 @@ int video_bmp_display(struct udevice *dev, ulong bmp_image, int x, int y,
 	enum video_format eformat;
 	struct bmp_color_table_entry *palette;
 	int hdr_size;
-	int ret;
 
 	if (!bmp || !(bmp->header.signature[0] == 'B' &&
 	    bmp->header.signature[1] == 'M')) {
@@ -426,11 +425,5 @@ int video_bmp_display(struct udevice *dev, ulong bmp_image, int x, int y,
 
 	video_damage(dev, x, y, width, height);
 
-	/* Find the position of the top left of the image in the framebuffer */
-	fb = (uchar *)(priv->fb + y * priv->line_length + x * bpix / 8);
-	ret = video_sync_copy(dev, start, fb);
-	if (ret)
-		return log_ret(ret);
-
 	return video_sync(dev, false);
 }
diff --git a/include/video.h b/include/video.h
index 4b35e97f79..e1162fc533 100644
--- a/include/video.h
+++ b/include/video.h
@@ -302,43 +302,6 @@ void video_set_default_colors(struct udevice *dev, bool invert);
  */
 int video_default_font_height(struct udevice *dev);
 
-#ifdef CONFIG_VIDEO_COPY
-/**
- * vidconsole_sync_copy() - Sync back to the copy framebuffer
- *
- * This ensures that the copy framebuffer has the same data as the framebuffer
- * for a particular region. It should be called after the framebuffer is updated
- *
- * @from and @to can be in either order. The region between them is synced.
- *
- * @dev: Vidconsole device being updated
- * @from: Start/end address within the framebuffer (->fb)
- * @to: Other address within the frame buffer
- * Return: 0 if OK, -EFAULT if the start address is before the start of the
- *	frame buffer start
- */
-int video_sync_copy(struct udevice *dev, void *from, void *to);
-
-/**
- * video_sync_copy_all() - Sync the entire framebuffer to the copy
- *
- * @dev: Vidconsole device being updated
- * Return: 0 (always)
- */
-int video_sync_copy_all(struct udevice *dev);
-#else
-static inline int video_sync_copy(struct udevice *dev, void *from, void *to)
-{
-	return 0;
-}
-
-static inline int video_sync_copy_all(struct udevice *dev)
-{
-	return 0;
-}
-
-#endif
-
 /**
  * video_damage() - Notify the video subsystem about screen updates.
  *
diff --git a/include/video_console.h b/include/video_console.h
index d755eb73cf..10d2d111c2 100644
--- a/include/video_console.h
+++ b/include/video_console.h
@@ -256,53 +256,4 @@ int vidconsole_select_font(struct udevice *dev, const char *name, uint size);
  */
 const char *vidconsole_get_font(struct udevice *dev, uint *sizep);
 
-#ifdef CONFIG_VIDEO_COPY
-/**
- * vidconsole_sync_copy() - Sync back to the copy framebuffer
- *
- * This ensures that the copy framebuffer has the same data as the framebuffer
- * for a particular region. It should be called after the framebuffer is updated
- *
- * @from and @to can be in either order. The region between them is synced.
- *
- * @dev: Vidconsole device being updated
- * @from: Start/end address within the framebuffer (->fb)
- * @to: Other address within the frame buffer
- * Return: 0 if OK, -EFAULT if the start address is before the start of the
- *	frame buffer start
- */
-int vidconsole_sync_copy(struct udevice *dev, void *from, void *to);
-
-/**
- * vidconsole_memmove() - Perform a memmove() within the frame buffer
- *
- * This handles a memmove(), e.g. for scrolling. It also updates the copy
- * framebuffer.
- *
- * @dev: Vidconsole device being updated
- * @dst: Destination address within the framebuffer (->fb)
- * @src: Source address within the framebuffer (->fb)
- * @size: Number of bytes to transfer
- * Return: 0 if OK, -EFAULT if the start address is before the start of the
- *	frame buffer start
- */
-int vidconsole_memmove(struct udevice *dev, void *dst, const void *src,
-		       int size);
-#else
-static inline int vidconsole_sync_copy(struct udevice *dev, void *from,
-				       void *to)
-{
-	return 0;
-}
-
-static inline int vidconsole_memmove(struct udevice *dev, void *dst,
-				     const void *src, int size)
-{
-	memmove(dst, src, size);
-
-	return 0;
-}
-
-#endif
-
 #endif
-- 
2.37.1 (Apple Git-137.1)

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
