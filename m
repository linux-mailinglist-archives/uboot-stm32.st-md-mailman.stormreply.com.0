Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F75A784787
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Aug 2023 18:27:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57279C78F6D;
	Tue, 22 Aug 2023 16:27:09 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFE2EC6B44C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 13:51:37 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-3fee769fcc3so16777065e9.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 06:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692625897; x=1693230697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7yrfRyMChh1ygDQtR1jl9BYhd6F+V0coaR3saA65Ao8=;
 b=oaK1+upyGYfwOr4/nZR8RIRT+Yn2PZ+2dy2+GMSjffIkOUvAA4SwUrsuBUHVmQ+cIg
 Q0F+D60Mp5/MzkFm9rwAnrQpO2uJb9esI/U8crcERtM+p1p5iKU9VNHrwRjlzB4VfG3E
 1rFRNOOhGpyPBS6RY+cJD557cLeGMoVUsQbv3xfnShrQg142CAOgzdQ4AtJ3FYRDngOc
 QiczfO53zpeOnZjhBAa5aw7TDgIqHuR1bYCYIRraWJdIl9Cxa6ZDN1IozoPg6hutV+SE
 77oOM9VfIYyC8B3q6wdaduzcH0Qgeq3IEzfE54DLVtS/yT5z2vJiPtnfnV2pXzjU01Iq
 l7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692625897; x=1693230697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7yrfRyMChh1ygDQtR1jl9BYhd6F+V0coaR3saA65Ao8=;
 b=Ba2bxS+eAKCMXp4l+NCP+jYeJTr40PBNQ6LLX26pSRpiKSXsrhaf8uMf2haKQ6Qf5i
 IE4/YLlgXXBXvn+Tc3e1gCuZJAnyca9iDKpNcDatPcURNWGi4l49RrAZj9gxMVK+XDQl
 Luh+uONOJaJQDj8y8Rw04KM/FP3W+37ATgpc/FA0+Rr8GcieRuBxrx2PdHFFuB6bcE7H
 rrrkuSsPH6nD5Ytq8JejjqLA4eekcAV039/2VCGEfY0vStwxiQLRGwF0hjbc0TokKC9J
 Icj6UM3hWBkCfdT/vuucM6B2BjC8HOwqKAC3OeYz2wBT0lSycJh98nx3GJOMh2Tul5h8
 Kp6w==
X-Gm-Message-State: AOJu0YwRWkIjuf8Oqp8UpAWLmC1rCiZWcyrWJbjV63EWnAp/OQCFCUnn
 +ubhYZ9ixAnu6XrOSjRZMFA=
X-Google-Smtp-Source: AGHT+IHO/arCmWeM8GYL18CXATu4Sh++TdyEswajL5QnvTaImLdSHvMUo+xc/gBkyHdBnNYS/qgvaQ==
X-Received: by 2002:adf:cd0b:0:b0:31c:3013:9fa5 with SMTP id
 w11-20020adfcd0b000000b0031c30139fa5mr3560706wrm.59.1692625897248; 
 Mon, 21 Aug 2023 06:51:37 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1]) by smtp.gmail.com with ESMTPSA id
 r11-20020a5d4e4b000000b00317b063590fsm12600049wrt.55.2023.08.21.06.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 06:51:36 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: u-boot@lists.denx.de
Date: Mon, 21 Aug 2023 16:51:03 +0300
Message-Id: <20230821135111.3558478-7-alpernebiyasak@gmail.com>
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
Subject: [Uboot-stm32] [PATCH v5 06/13] vidconsole: Add damage notifications
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

From: Alexander Graf <agraf@csgraf.de>

Now that we have a damage tracking API, let's populate damage done by
vidconsole drivers. We try to declare as little memory as damaged as
possible.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reported-by: Da Xue <da@libre.computer>
[Alper: Rebase for met->baseline, fontdata->height/width, make rotated
        console_putc_xy() damages pass tests, edit patch message]
Co-developed-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---

Changes in v5:
- Use met->baseline instead of priv->baseline
- Use fontdata->height/width instead of VIDEO_FONT_HEIGHT/WIDTH
- Update console_rotate.c video_damage() calls to pass video tests
- Remove mention about not having minimal damage for console_rotate.c

Changes in v2:
- Fix ranges in truetype target
- Limit rotate to necessary damage

 drivers/video/console_normal.c   | 18 +++++++++++
 drivers/video/console_rotate.c   | 54 ++++++++++++++++++++++++++++++++
 drivers/video/console_truetype.c | 21 +++++++++++++
 drivers/video/video-uclass.c     |  1 +
 4 files changed, 94 insertions(+)

diff --git a/drivers/video/console_normal.c b/drivers/video/console_normal.c
index 413c7abee9e1..a19ce6a2bc11 100644
--- a/drivers/video/console_normal.c
+++ b/drivers/video/console_normal.c
@@ -39,6 +39,12 @@ static int console_set_row(struct udevice *dev, uint row, int clr)
 	if (ret)
 		return ret;
 
+	video_damage(dev->parent,
+		     0,
+		     fontdata->height * row,
+		     vid_priv->xsize,
+		     fontdata->height);
+
 	return 0;
 }
 
@@ -60,6 +66,12 @@ static int console_move_rows(struct udevice *dev, uint rowdst,
 	if (ret)
 		return ret;
 
+	video_damage(dev->parent,
+		     0,
+		     fontdata->height * rowdst,
+		     vid_priv->xsize,
+		     fontdata->height * count);
+
 	return 0;
 }
 
@@ -90,6 +102,12 @@ static int console_putc_xy(struct udevice *dev, uint x_frac, uint y, char ch)
 	if (ret)
 		return ret;
 
+	video_damage(dev->parent,
+		     x,
+		     y,
+		     fontdata->width,
+		     fontdata->height);
+
 	ret = vidconsole_sync_copy(dev, start, line);
 	if (ret)
 		return ret;
diff --git a/drivers/video/console_rotate.c b/drivers/video/console_rotate.c
index 65358a1c6e74..6c3e7c1bb8dc 100644
--- a/drivers/video/console_rotate.c
+++ b/drivers/video/console_rotate.c
@@ -36,6 +36,12 @@ static int console_set_row_1(struct udevice *dev, uint row, int clr)
 	if (ret)
 		return ret;
 
+	video_damage(dev->parent,
+		     vid_priv->xsize - ((row + 1) * fontdata->height),
+		     0,
+		     fontdata->height,
+		     vid_priv->ysize);
+
 	return 0;
 }
 
@@ -64,6 +70,12 @@ static int console_move_rows_1(struct udevice *dev, uint rowdst, uint rowsrc,
 		dst += vid_priv->line_length;
 	}
 
+	video_damage(dev->parent,
+		     vid_priv->xsize - ((rowdst + count) * fontdata->height),
+		     0,
+		     count * fontdata->height,
+		     vid_priv->ysize);
+
 	return 0;
 }
 
@@ -96,6 +108,12 @@ static int console_putc_xy_1(struct udevice *dev, uint x_frac, uint y, char ch)
 	if (ret)
 		return ret;
 
+	video_damage(dev->parent,
+		     vid_priv->xsize - y - fontdata->height,
+		     linenum - 1,
+		     fontdata->height,
+		     fontdata->width);
+
 	return VID_TO_POS(fontdata->width);
 }
 
@@ -121,6 +139,12 @@ static int console_set_row_2(struct udevice *dev, uint row, int clr)
 	if (ret)
 		return ret;
 
+	video_damage(dev->parent,
+		     0,
+		     vid_priv->ysize - (row + 1) * fontdata->height,
+		     vid_priv->xsize,
+		     fontdata->height);
+
 	return 0;
 }
 
@@ -142,6 +166,12 @@ static int console_move_rows_2(struct udevice *dev, uint rowdst, uint rowsrc,
 	vidconsole_memmove(dev, dst, src,
 			   fontdata->height * vid_priv->line_length * count);
 
+	video_damage(dev->parent,
+		     0,
+		     vid_priv->ysize - (rowdst + count) * fontdata->height,
+		     vid_priv->xsize,
+		     count * fontdata->height);
+
 	return 0;
 }
 
@@ -174,6 +204,12 @@ static int console_putc_xy_2(struct udevice *dev, uint x_frac, uint y, char ch)
 	if (ret)
 		return ret;
 
+	video_damage(dev->parent,
+		     x - fontdata->width + 1,
+		     linenum - fontdata->height + 1,
+		     fontdata->width,
+		     fontdata->height);
+
 	return VID_TO_POS(fontdata->width);
 }
 
@@ -198,6 +234,12 @@ static int console_set_row_3(struct udevice *dev, uint row, int clr)
 	if (ret)
 		return ret;
 
+	video_damage(dev->parent,
+		     row * fontdata->height,
+		     0,
+		     fontdata->height,
+		     vid_priv->ysize);
+
 	return 0;
 }
 
@@ -224,6 +266,12 @@ static int console_move_rows_3(struct udevice *dev, uint rowdst, uint rowsrc,
 		dst += vid_priv->line_length;
 	}
 
+	video_damage(dev->parent,
+		     rowdst * fontdata->height,
+		     0,
+		     count * fontdata->height,
+		     vid_priv->ysize);
+
 	return 0;
 }
 
@@ -255,6 +303,12 @@ static int console_putc_xy_3(struct udevice *dev, uint x_frac, uint y, char ch)
 	if (ret)
 		return ret;
 
+	video_damage(dev->parent,
+		     y,
+		     linenum - fontdata->width + 1,
+		     fontdata->height,
+		     fontdata->width);
+
 	return VID_TO_POS(fontdata->width);
 }
 
diff --git a/drivers/video/console_truetype.c b/drivers/video/console_truetype.c
index 0f9bb49e44f7..0adbf9cc3d67 100644
--- a/drivers/video/console_truetype.c
+++ b/drivers/video/console_truetype.c
@@ -178,6 +178,7 @@ struct console_tt_priv {
 static int console_truetype_set_row(struct udevice *dev, uint row, int clr)
 {
 	struct video_priv *vid_priv = dev_get_uclass_priv(dev->parent);
+	struct vidconsole_priv *vc_priv = dev_get_uclass_priv(dev);
 	struct console_tt_priv *priv = dev_get_priv(dev);
 	struct console_tt_metrics *met = priv->cur_met;
 	void *end, *line;
@@ -221,6 +222,12 @@ static int console_truetype_set_row(struct udevice *dev, uint row, int clr)
 	if (ret)
 		return ret;
 
+	video_damage(dev->parent,
+		     0,
+		     vc_priv->y_charsize * row,
+		     vid_priv->xsize,
+		     vc_priv->y_charsize);
+
 	return 0;
 }
 
@@ -228,6 +235,7 @@ static int console_truetype_move_rows(struct udevice *dev, uint rowdst,
 				     uint rowsrc, uint count)
 {
 	struct video_priv *vid_priv = dev_get_uclass_priv(dev->parent);
+	struct vidconsole_priv *vc_priv = dev_get_uclass_priv(dev);
 	struct console_tt_priv *priv = dev_get_priv(dev);
 	struct console_tt_metrics *met = priv->cur_met;
 	void *dst;
@@ -246,6 +254,12 @@ static int console_truetype_move_rows(struct udevice *dev, uint rowdst,
 	for (i = 0; i < priv->pos_ptr; i++)
 		priv->pos[i].ypos -= diff;
 
+	video_damage(dev->parent,
+		     0,
+		     vc_priv->y_charsize * rowdst,
+		     vid_priv->xsize,
+		     vc_priv->y_charsize * count);
+
 	return 0;
 }
 
@@ -403,6 +417,13 @@ static int console_truetype_putc_xy(struct udevice *dev, uint x, uint y,
 
 		line += vid_priv->line_length;
 	}
+
+	video_damage(dev->parent,
+		     VID_TO_PIXEL(x) + xoff,
+		     y + met->baseline + yoff,
+		     width,
+		     height);
+
 	ret = vidconsole_sync_copy(dev, start, line);
 	if (ret)
 		return ret;
diff --git a/drivers/video/video-uclass.c b/drivers/video/video-uclass.c
index ebf409d839f0..8bfcbc88dda7 100644
--- a/drivers/video/video-uclass.c
+++ b/drivers/video/video-uclass.c
@@ -199,6 +199,7 @@ int video_fill_part(struct udevice *dev, int xstart, int ystart, int xend,
 		}
 		line += priv->line_length;
 	}
+
 	ret = video_sync_copy(dev, start, line);
 	if (ret)
 		return ret;
-- 
2.40.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
