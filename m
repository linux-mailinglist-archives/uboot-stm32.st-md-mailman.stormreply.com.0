Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B03D278478B
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Aug 2023 18:27:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74997C78F75;
	Tue, 22 Aug 2023 16:27:09 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBF84C6B44C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 13:51:47 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-31aeef88a55so1551205f8f.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 06:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692625907; x=1693230707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l/DCoXVnGlEMqWseytQAYuhC9MvrFlVv7QEu+lzOB9U=;
 b=SJ3CoTwShv0m1a2l77IYGRiPJhE773qxJozbJ8TLkbWb/Fs3vzMjaetMjO1LteCIix
 nxWVY9KC93yaMYqJT6SqYWKi1BaFToYnd6muvummJcQpRouAllJWg2nVkF0e6rb8GdHn
 kEvHDvCo4Xq4Lrpvs6/W0ONesn+kGcCJbX3+BARXOoTD87bHAQpb5gcTr6FjYwUraYf/
 31t1qEak7+tRD5cuPx0ItVaX8KSHeAMuueL0gEw6Wt64zNUyAO7W7cCRNJFMIsBkB2Lw
 IOsoOk7kBgIqU/InShFLnIoLlW9EafAood5bDff+/ADKYaXgkgxpBbWQWgtF6tmmvjGO
 gfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692625907; x=1693230707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l/DCoXVnGlEMqWseytQAYuhC9MvrFlVv7QEu+lzOB9U=;
 b=WUDZ4E0ENxwZXY5iNyae2iDxyxtJm3CHlEKiOxTlF+qeyMXhgR8IXzvUZa1KUIb3oD
 ZIU2GohZ+J9OG1zq+yqnCv57CO3IH1YFXD55TLXPEw9dFGY9hr/8o/wliE3If27gcbBh
 qGvy7iLI1CQtaj/Dus42owNO3vxcJWtuY9h+7RS/ZrxQnS1H79ziWQhLOI3Pt/iV8GOh
 Bii1i/go2biy7j28o97VZ2ryzX+U8DXvpau6qP0uXM8HsXPaysXvzxaSJJLPT8GM4nOa
 N8/yBeZar2TZYCrMStCvXIhYmiaE1FRQZtiNaAnaPizqr2oIxygO2To1TG/8/FFaJ4RO
 xd/w==
X-Gm-Message-State: AOJu0YyDgVAhSpT63xs6MHGrPr065mT4JtUkWMxsPTmRPi876Bqch1Vd
 vbZ06RTVLQ8vBXV7ZkcqFXw=
X-Google-Smtp-Source: AGHT+IHlrJ5IlwhVESQ4N6S+FeCJPNau4Ry7TWJN4H6yUmdpI19HJsGEPwtYtoPvcLuI4yNltjc9CQ==
X-Received: by 2002:a5d:4483:0:b0:317:dada:2417 with SMTP id
 j3-20020a5d4483000000b00317dada2417mr4326536wrq.31.1692625907186; 
 Mon, 21 Aug 2023 06:51:47 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1]) by smtp.gmail.com with ESMTPSA id
 r11-20020a5d4e4b000000b00317b063590fsm12600049wrt.55.2023.08.21.06.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 06:51:46 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: u-boot@lists.denx.de
Date: Mon, 21 Aug 2023 16:51:07 +0300
Message-Id: <20230821135111.3558478-11-alpernebiyasak@gmail.com>
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
Subject: [Uboot-stm32] [PATCH v5 10/13] video: Only dcache flush damaged
	lines
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

Now that we have a damage area tells us which parts of the frame buffer
actually need updating, let's only dcache flush those on video_sync()
calls. With this optimization in place, frame buffer updates - especially
on large screen such as 4k displays - speed up significantly.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reported-by: Da Xue <da@libre.computer>
[Alper: Use damage.xstart/yend, IS_ENABLED()]
Co-developed-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---

Changes in v5:
- Use xstart, ystart, xend, yend as names for damage region
- Use IS_ENABLED() instead of CONFIG_IS_ENABLED()

Changes in v2:
- Fix dcache range; we were flushing too much before
- Remove ifdefs

 drivers/video/video-uclass.c | 41 +++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/video/video-uclass.c b/drivers/video/video-uclass.c
index 8bfcbc88dda7..a50220bcc684 100644
--- a/drivers/video/video-uclass.c
+++ b/drivers/video/video-uclass.c
@@ -385,6 +385,41 @@ void video_damage(struct udevice *vid, int x, int y, int width, int height)
 	priv->damage.yend = max(yend, priv->damage.yend);
 }
 
+#if defined(CONFIG_ARM) && !CONFIG_IS_ENABLED(SYS_DCACHE_OFF)
+static void video_flush_dcache(struct udevice *vid)
+{
+	struct video_priv *priv = dev_get_uclass_priv(vid);
+
+	if (!priv->flush_dcache)
+		return;
+
+	if (!IS_ENABLED(CONFIG_VIDEO_DAMAGE)) {
+		flush_dcache_range((ulong)priv->fb,
+				   ALIGN((ulong)priv->fb + priv->fb_size,
+					 CONFIG_SYS_CACHELINE_SIZE));
+
+		return;
+	}
+
+	if (priv->damage.xend && priv->damage.yend) {
+		int lstart = priv->damage.xstart * VNBYTES(priv->bpix);
+		int lend = priv->damage.xend * VNBYTES(priv->bpix);
+		int y;
+
+		for (y = priv->damage.ystart; y < priv->damage.yend; y++) {
+			ulong fb = (ulong)priv->fb;
+			ulong start = fb + (y * priv->line_length) + lstart;
+			ulong end = start + lend - lstart;
+
+			start = ALIGN_DOWN(start, CONFIG_SYS_CACHELINE_SIZE);
+			end = ALIGN(end, CONFIG_SYS_CACHELINE_SIZE);
+
+			flush_dcache_range(start, end);
+		}
+	}
+}
+#endif
+
 /* Flush video activity to the caches */
 int video_sync(struct udevice *vid, bool force)
 {
@@ -404,11 +439,7 @@ int video_sync(struct udevice *vid, bool force)
 	 * out whether it exists? For now, ARM is safe.
 	 */
 #if defined(CONFIG_ARM) && !CONFIG_IS_ENABLED(SYS_DCACHE_OFF)
-	if (priv->flush_dcache) {
-		flush_dcache_range((ulong)priv->fb,
-				   ALIGN((ulong)priv->fb + priv->fb_size,
-					 CONFIG_SYS_CACHELINE_SIZE));
-	}
+	video_flush_dcache(vid);
 #elif defined(CONFIG_VIDEO_SANDBOX_SDL)
 	static ulong last_sync;
 
-- 
2.40.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
