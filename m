Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D4665EE16
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 Jan 2023 15:01:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61C7EC69070;
	Thu,  5 Jan 2023 14:01:31 +0000 (UTC)
Received: from zulu616.server4you.de (mail.csgraf.de [85.25.223.15])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A93BFC65048
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 21:50:08 +0000 (UTC)
Received: from localhost.localdomain
 (dynamic-092-225-244-121.92.225.pool.telefonica.de [92.225.244.121])
 by csgraf.de (Postfix) with ESMTPSA id A1F526080DD2;
 Tue,  3 Jan 2023 22:50:07 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: u-boot@lists.denx.de
Date: Tue,  3 Jan 2023 22:49:58 +0100
Message-Id: <20230103215004.22646-4-agraf@csgraf.de>
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
Subject: [Uboot-stm32] [PATCH v4 3/9] vidconsole: Add damage notifications
	to all vidconsole drivers
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

Now that we have a damage tracking API, let's populate damage done by
vidconsole drivers. We try to declare as little memory as damaged as
possible, with the exception of rotated screens that I couldn't get my
head wrapped around. On those, we revert to the old behavior and mark
the full screen as damaged on every update.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reported-by: Da Xue <da@libre.computer>

---

v1 -> v2:

  - Fix ranges in truetype target
  - Limit rotate to necessary damange
---
 drivers/video/console_normal.c   | 10 ++++++
 drivers/video/console_rotate.c   | 54 ++++++++++++++++++++++++++++++++
 drivers/video/console_truetype.c | 15 +++++++++
 3 files changed, 79 insertions(+)

diff --git a/drivers/video/console_normal.c b/drivers/video/console_normal.c
index 04f022491e..5b5586fd3e 100644
--- a/drivers/video/console_normal.c
+++ b/drivers/video/console_normal.c
@@ -57,6 +57,9 @@ static int console_normal_set_row(struct udevice *dev, uint row, int clr)
 	if (ret)
 		return ret;
 
+	video_damage(dev->parent, 0, VIDEO_FONT_HEIGHT * row, vid_priv->xsize,
+		     VIDEO_FONT_HEIGHT);
+
 	return 0;
 }
 
@@ -76,6 +79,9 @@ static int console_normal_move_rows(struct udevice *dev, uint rowdst,
 	if (ret)
 		return ret;
 
+	video_damage(dev->parent, 0, VIDEO_FONT_HEIGHT * rowdst, vid_priv->xsize,
+		     VIDEO_FONT_HEIGHT * count);
+
 	return 0;
 }
 
@@ -143,6 +149,10 @@ static int console_normal_putc_xy(struct udevice *dev, uint x_frac, uint y,
 		}
 		line += vid_priv->line_length;
 	}
+
+	video_damage(dev->parent, VID_TO_PIXEL(x_frac), y, VIDEO_FONT_WIDTH,
+		     VIDEO_FONT_HEIGHT);
+
 	ret = vidconsole_sync_copy(dev, start, line);
 	if (ret)
 		return ret;
diff --git a/drivers/video/console_rotate.c b/drivers/video/console_rotate.c
index 36c8d0609d..56e20bb4f3 100644
--- a/drivers/video/console_rotate.c
+++ b/drivers/video/console_rotate.c
@@ -57,6 +57,12 @@ static int console_set_row_1(struct udevice *dev, uint row, int clr)
 	if (ret)
 		return ret;
 
+	video_damage(dev->parent,
+		     vid_priv->xsize - ((row + 1) * VIDEO_FONT_HEIGHT),
+		     0,
+		     VIDEO_FONT_HEIGHT,
+		     vid_priv->ysize);
+
 	return 0;
 }
 
@@ -83,6 +89,12 @@ static int console_move_rows_1(struct udevice *dev, uint rowdst, uint rowsrc,
 		dst += vid_priv->line_length;
 	}
 
+	video_damage(dev->parent,
+		     vid_priv->xsize - ((rowdst + count) * VIDEO_FONT_HEIGHT),
+		     0,
+		     count * VIDEO_FONT_HEIGHT,
+		     vid_priv->ysize);
+
 	return 0;
 }
 
@@ -150,6 +162,12 @@ static int console_putc_xy_1(struct udevice *dev, uint x_frac, uint y, char ch)
 	if (ret)
 		return ret;
 
+	video_damage(dev->parent,
+		     vid_priv->xsize - y - VIDEO_FONT_HEIGHT - 1,
+		     linenum - 1,
+		     VIDEO_FONT_HEIGHT,
+		     VIDEO_FONT_WIDTH);
+
 	return VID_TO_POS(VIDEO_FONT_WIDTH);
 }
 
@@ -199,6 +217,12 @@ static int console_set_row_2(struct udevice *dev, uint row, int clr)
 	if (ret)
 		return ret;
 
+	video_damage(dev->parent,
+		     0,
+		     vid_priv->ysize - (row + 1) * VIDEO_FONT_HEIGHT,
+		     vid_priv->xsize,
+		     VIDEO_FONT_HEIGHT);
+
 	return 0;
 }
 
@@ -218,6 +242,12 @@ static int console_move_rows_2(struct udevice *dev, uint rowdst, uint rowsrc,
 	vidconsole_memmove(dev, dst, src,
 			   VIDEO_FONT_HEIGHT * vid_priv->line_length * count);
 
+	video_damage(dev->parent,
+		     0,
+		     vid_priv->ysize - (rowdst + count) * VIDEO_FONT_HEIGHT,
+		     vid_priv->xsize,
+		     count * VIDEO_FONT_HEIGHT);
+
 	return 0;
 }
 
@@ -288,6 +318,12 @@ static int console_putc_xy_2(struct udevice *dev, uint x_frac, uint y, char ch)
 	if (ret)
 		return ret;
 
+	video_damage(dev->parent,
+		     x - VIDEO_FONT_WIDTH,
+		     linenum - VIDEO_FONT_HEIGHT + 1,
+		     VIDEO_FONT_WIDTH,
+		     VIDEO_FONT_HEIGHT);
+
 	return VID_TO_POS(VIDEO_FONT_WIDTH);
 }
 
@@ -335,6 +371,12 @@ static int console_set_row_3(struct udevice *dev, uint row, int clr)
 	if (ret)
 		return ret;
 
+	video_damage(dev->parent,
+		     row * VIDEO_FONT_HEIGHT,
+		     0,
+		     VIDEO_FONT_HEIGHT,
+		     vid_priv->ysize);
+
 	return 0;
 }
 
@@ -359,6 +401,12 @@ static int console_move_rows_3(struct udevice *dev, uint rowdst, uint rowsrc,
 		dst += vid_priv->line_length;
 	}
 
+	video_damage(dev->parent,
+		     rowdst * VIDEO_FONT_HEIGHT,
+		     0,
+		     count * VIDEO_FONT_HEIGHT,
+		     vid_priv->ysize);
+
 	return 0;
 }
 
@@ -424,6 +472,12 @@ static int console_putc_xy_3(struct udevice *dev, uint x_frac, uint y, char ch)
 	if (ret)
 		return ret;
 
+	video_damage(dev->parent,
+		     y,
+		     x - VIDEO_FONT_WIDTH + 1,
+		     VIDEO_FONT_HEIGHT,
+		     VIDEO_FONT_WIDTH);
+
 	return VID_TO_POS(VIDEO_FONT_WIDTH);
 }
 
diff --git a/drivers/video/console_truetype.c b/drivers/video/console_truetype.c
index 6859c9fa11..3fc6e24485 100644
--- a/drivers/video/console_truetype.c
+++ b/drivers/video/console_truetype.c
@@ -145,6 +145,7 @@ struct console_tt_priv {
 static int console_truetype_set_row(struct udevice *dev, uint row, int clr)
 {
 	struct video_priv *vid_priv = dev_get_uclass_priv(dev->parent);
+	struct vidconsole_priv *vc_priv = dev_get_uclass_priv(dev);
 	struct console_tt_priv *priv = dev_get_priv(dev);
 	struct console_tt_metrics *met = priv->cur_met;
 	void *end, *line;
@@ -188,6 +189,9 @@ static int console_truetype_set_row(struct udevice *dev, uint row, int clr)
 	if (ret)
 		return ret;
 
+	video_damage(dev->parent, 0, vc_priv->y_charsize * row, vid_priv->xsize,
+		     vc_priv->y_charsize);
+
 	return 0;
 }
 
@@ -195,6 +199,7 @@ static int console_truetype_move_rows(struct udevice *dev, uint rowdst,
 				     uint rowsrc, uint count)
 {
 	struct video_priv *vid_priv = dev_get_uclass_priv(dev->parent);
+	struct vidconsole_priv *vc_priv = dev_get_uclass_priv(dev);
 	struct console_tt_priv *priv = dev_get_priv(dev);
 	struct console_tt_metrics *met = priv->cur_met;
 	void *dst;
@@ -213,6 +218,9 @@ static int console_truetype_move_rows(struct udevice *dev, uint rowdst,
 	for (i = 0; i < priv->pos_ptr; i++)
 		priv->pos[i].ypos -= diff;
 
+	video_damage(dev->parent, 0, vc_priv->y_charsize * rowdst, vid_priv->xsize,
+		     vc_priv->y_charsize * count);
+
 	return 0;
 }
 
@@ -370,6 +378,10 @@ static int console_truetype_putc_xy(struct udevice *dev, uint x, uint y,
 
 		line += vid_priv->line_length;
 	}
+
+	video_damage(dev->parent, VID_TO_PIXEL(x) + xoff,
+		     y + priv->baseline + yoff, width, height);
+
 	ret = vidconsole_sync_copy(dev, start, line);
 	if (ret)
 		return ret;
@@ -437,6 +449,9 @@ static int console_truetype_erase(struct udevice *dev, int xstart, int ystart,
 		}
 		line += vid_priv->line_length;
 	}
+
+	video_damage(dev->parent, xstart, ystart, xend - xstart, yend - ystart);
+
 	ret = vidconsole_sync_copy(dev, start, line);
 	if (ret)
 		return ret;
-- 
2.37.1 (Apple Git-137.1)

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
