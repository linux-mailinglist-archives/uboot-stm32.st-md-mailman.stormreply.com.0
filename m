Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E31A784783
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Aug 2023 18:27:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 341CFC78F65;
	Tue, 22 Aug 2023 16:27:08 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71BA5C6A5EF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 13:51:27 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-31c5c06e8bbso443240f8f.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 06:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692625887; x=1693230687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2OB7382go0g6JBjezy6TmzGfi6gIlYCFDFe4xM7HRw8=;
 b=mYzIbw17s5ut2Lj8TmUyEmZZuMpoWf/YpZMisLloBGvTOI6o9/p8nP2M17yjk++h8P
 8+GH169jMY+6EuzecVUKktHLjLULhqcSGVgb+K8TH4Z0MkPhLZg6u+23TnjErs5v1VYS
 +euy4y8wSAudLGdJHtR26NtBqeJHDFiK6ves/aUe6PVWoPVDofUTUC53I4mvF96uWF8K
 NxLW9B5KIoY0T2WpxZUDwabQASQORqw1sA33K5oTD5OvFTS081ZnJT9otEq9+EgTySU5
 e9RQTRRZ1lstBqBTAQHRXPAniy7qhyu+ptlO9RhqLC6R08WOBN8Fwz7r4fVsnuuGMEgm
 CatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692625887; x=1693230687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2OB7382go0g6JBjezy6TmzGfi6gIlYCFDFe4xM7HRw8=;
 b=OwkM+GnBUvT/q3imIRP0MBtpCReqd7eesnlUbWAK4DVfdfNQEvSbR9eYhyUcIIskCh
 nVCduFJqENA2aaE1aiBzg/1veMC6eTViXMG0ZiQQkechScU01eEU/9NRFx6eAb7e7b8t
 4qBjmar25y0iMWx4YtVnjfi6jpQHPACSsWspgnvXPIs6iT54DvEWS4LyKl8Ds4M+Mrkp
 EgvtdFtMzkUxTOWthvRohIV9w2aZU2OroV/eO+gjk8jwjsFXCWJP9q28bD+gpKPHo530
 RRjUNX6CQYWxxKjKEBBYj5IY3PioaWdSGzpDLeeJHVzRt4Y1vHfUilx4bG521wWMBBuw
 oVIg==
X-Gm-Message-State: AOJu0YyP7gNT+8CMnPSETv9erp9fsNxAgtp7nr0C9uDNdkp1pktaxfeS
 a/14gsGaWrIV+NLWKsjAfe4=
X-Google-Smtp-Source: AGHT+IHSYU3/G4dWV8P3egqgpph9YxOl4+mH1vDWUtosphrFiVQk7BNu/zdvNsUiJiU3qzGO9VCxdg==
X-Received: by 2002:a5d:44cf:0:b0:313:f33c:24c4 with SMTP id
 z15-20020a5d44cf000000b00313f33c24c4mr4457731wrr.39.1692625886757; 
 Mon, 21 Aug 2023 06:51:26 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1]) by smtp.gmail.com with ESMTPSA id
 r11-20020a5d4e4b000000b00317b063590fsm12600049wrt.55.2023.08.21.06.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 06:51:26 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: u-boot@lists.denx.de
Date: Mon, 21 Aug 2023 16:50:59 +0300
Message-Id: <20230821135111.3558478-3-alpernebiyasak@gmail.com>
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
Subject: [Uboot-stm32] [PATCH v5 02/13] video: test: Support checking copy
	frame buffer contents
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

The video tests have a helper function to generate a pseudo-digest of
frame buffer contents, but it only does so for the main one. There is
another check that the copy frame buffer is the same as that. But
neither is enough to test if only the modified regions are copied to the
copy frame buffer, since we will want the two to be different in very
specific ways.

Add a boolean argument to the existing helper function to indicate which
frame buffer we want to inspect, and update the existing callers.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---

Changes in v5:
- Add patch "video: test: Support checking copy frame buffer contents"

 test/dm/video.c | 76 ++++++++++++++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 35 deletions(-)

diff --git a/test/dm/video.c b/test/dm/video.c
index 641a6250100a..b9ff3da10c18 100644
--- a/test/dm/video.c
+++ b/test/dm/video.c
@@ -57,22 +57,28 @@ DM_TEST(dm_test_video_base, UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
  *
  * @uts:	Test state
  * @dev:	Video device
+ * @use_copy:	Use copy frame buffer if available
  * Return: compressed size of the frame buffer, or -ve on error
  */
 static int compress_frame_buffer(struct unit_test_state *uts,
-				 struct udevice *dev)
+				 struct udevice *dev,
+				 bool use_copy)
 {
 	struct video_priv *priv = dev_get_uclass_priv(dev);
 	uint destlen;
 	void *dest;
 	int ret;
 
+	if (!IS_ENABLED(CONFIG_VIDEO_COPY))
+		use_copy = false;
+
 	destlen = priv->fb_size;
 	dest = malloc(priv->fb_size);
 	if (!dest)
 		return -ENOMEM;
 	ret = BZ2_bzBuffToBuffCompress(dest, &destlen,
-				       priv->fb, priv->fb_size,
+				       use_copy ? priv->copy_fb : priv->fb,
+				       priv->fb_size,
 				       3, 0, 0);
 	free(dest);
 	if (ret)
@@ -168,30 +174,30 @@ static int dm_test_video_text(struct unit_test_state *uts)
 	ut_assertok(video_get_nologo(uts, &dev));
 	ut_assertok(uclass_get_device(UCLASS_VIDEO_CONSOLE, 0, &con));
 	ut_assertok(vidconsole_select_font(con, "8x16", 0));
-	ut_asserteq(46, compress_frame_buffer(uts, dev));
+	ut_asserteq(46, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	ut_assertok(uclass_get_device(UCLASS_VIDEO_CONSOLE, 0, &con));
 	vidconsole_putc_xy(con, 0, 0, 'a');
-	ut_asserteq(79, compress_frame_buffer(uts, dev));
+	ut_asserteq(79, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	vidconsole_putc_xy(con, 0, 0, ' ');
-	ut_asserteq(46, compress_frame_buffer(uts, dev));
+	ut_asserteq(46, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	for (i = 0; i < 20; i++)
 		vidconsole_putc_xy(con, VID_TO_POS(i * 8), 0, ' ' + i);
-	ut_asserteq(273, compress_frame_buffer(uts, dev));
+	ut_asserteq(273, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	vidconsole_set_row(con, 0, WHITE);
-	ut_asserteq(46, compress_frame_buffer(uts, dev));
+	ut_asserteq(46, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	for (i = 0; i < 20; i++)
 		vidconsole_putc_xy(con, VID_TO_POS(i * 8), 0, ' ' + i);
-	ut_asserteq(273, compress_frame_buffer(uts, dev));
+	ut_asserteq(273, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
@@ -210,30 +216,30 @@ static int dm_test_video_text_12x22(struct unit_test_state *uts)
 	ut_assertok(video_get_nologo(uts, &dev));
 	ut_assertok(uclass_get_device(UCLASS_VIDEO_CONSOLE, 0, &con));
 	ut_assertok(vidconsole_select_font(con, "12x22", 0));
-	ut_asserteq(46, compress_frame_buffer(uts, dev));
+	ut_asserteq(46, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	ut_assertok(uclass_get_device(UCLASS_VIDEO_CONSOLE, 0, &con));
 	vidconsole_putc_xy(con, 0, 0, 'a');
-	ut_asserteq(89, compress_frame_buffer(uts, dev));
+	ut_asserteq(89, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	vidconsole_putc_xy(con, 0, 0, ' ');
-	ut_asserteq(46, compress_frame_buffer(uts, dev));
+	ut_asserteq(46, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	for (i = 0; i < 20; i++)
 		vidconsole_putc_xy(con, VID_TO_POS(i * 8), 0, ' ' + i);
-	ut_asserteq(363, compress_frame_buffer(uts, dev));
+	ut_asserteq(363, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	vidconsole_set_row(con, 0, WHITE);
-	ut_asserteq(46, compress_frame_buffer(uts, dev));
+	ut_asserteq(46, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	for (i = 0; i < 20; i++)
 		vidconsole_putc_xy(con, VID_TO_POS(i * 8), 0, ' ' + i);
-	ut_asserteq(363, compress_frame_buffer(uts, dev));
+	ut_asserteq(363, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
@@ -251,7 +257,7 @@ static int dm_test_video_chars(struct unit_test_state *uts)
 	ut_assertok(uclass_get_device(UCLASS_VIDEO_CONSOLE, 0, &con));
 	ut_assertok(vidconsole_select_font(con, "8x16", 0));
 	vidconsole_put_string(con, test_string);
-	ut_asserteq(466, compress_frame_buffer(uts, dev));
+	ut_asserteq(466, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
@@ -273,23 +279,23 @@ static int dm_test_video_ansi(struct unit_test_state *uts)
 	/* reference clear: */
 	video_clear(con->parent);
 	video_sync(con->parent, false);
-	ut_asserteq(46, compress_frame_buffer(uts, dev));
+	ut_asserteq(46, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	/* test clear escape sequence: [2J */
 	vidconsole_put_string(con, "A\tB\tC"ANSI_ESC"[2J");
-	ut_asserteq(46, compress_frame_buffer(uts, dev));
+	ut_asserteq(46, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	/* test set-cursor: [%d;%df */
 	vidconsole_put_string(con, "abc"ANSI_ESC"[2;2fab"ANSI_ESC"[4;4fcd");
-	ut_asserteq(143, compress_frame_buffer(uts, dev));
+	ut_asserteq(143, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	/* test colors (30-37 fg color, 40-47 bg color) */
 	vidconsole_put_string(con, ANSI_ESC"[30;41mfoo"); /* black on red */
 	vidconsole_put_string(con, ANSI_ESC"[33;44mbar"); /* yellow on blue */
-	ut_asserteq(272, compress_frame_buffer(uts, dev));
+	ut_asserteq(272, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
@@ -322,13 +328,13 @@ static int check_vidconsole_output(struct unit_test_state *uts, int rot,
 	ut_assertok(video_get_nologo(uts, &dev));
 	ut_assertok(uclass_get_device(UCLASS_VIDEO_CONSOLE, 0, &con));
 	ut_assertok(vidconsole_select_font(con, "8x16", 0));
-	ut_asserteq(46, compress_frame_buffer(uts, dev));
+	ut_asserteq(46, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	/* Check display wrap */
 	for (i = 0; i < 120; i++)
 		vidconsole_put_char(con, 'A' + i % 50);
-	ut_asserteq(wrap_size, compress_frame_buffer(uts, dev));
+	ut_asserteq(wrap_size, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	/* Check display scrolling */
@@ -336,13 +342,13 @@ static int check_vidconsole_output(struct unit_test_state *uts, int rot,
 		vidconsole_put_char(con, 'A' + i % 50);
 		vidconsole_put_char(con, '\n');
 	}
-	ut_asserteq(scroll_size, compress_frame_buffer(uts, dev));
+	ut_asserteq(scroll_size, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	/* If we scroll enough, the screen becomes blank again */
 	for (i = 0; i < SCROLL_LINES; i++)
 		vidconsole_put_char(con, '\n');
-	ut_asserteq(46, compress_frame_buffer(uts, dev));
+	ut_asserteq(46, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
@@ -417,7 +423,7 @@ static int dm_test_video_bmp(struct unit_test_state *uts)
 	ut_assertok(read_file(uts, "tools/logos/denx.bmp", &addr));
 
 	ut_assertok(video_bmp_display(dev, addr, 0, 0, false));
-	ut_asserteq(1368, compress_frame_buffer(uts, dev));
+	ut_asserteq(1368, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
@@ -437,7 +443,7 @@ static int dm_test_video_bmp8(struct unit_test_state *uts)
 	ut_assertok(read_file(uts, "tools/logos/denx.bmp", &addr));
 
 	ut_assertok(video_bmp_display(dev, addr, 0, 0, false));
-	ut_asserteq(1247, compress_frame_buffer(uts, dev));
+	ut_asserteq(1247, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
@@ -461,7 +467,7 @@ static int dm_test_video_bmp16(struct unit_test_state *uts)
 			   &src_len));
 
 	ut_assertok(video_bmp_display(dev, dst, 0, 0, false));
-	ut_asserteq(3700, compress_frame_buffer(uts, dev));
+	ut_asserteq(3700, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
@@ -485,7 +491,7 @@ static int dm_test_video_bmp24(struct unit_test_state *uts)
 			   &src_len));
 
 	ut_assertok(video_bmp_display(dev, dst, 0, 0, false));
-	ut_asserteq(3656, compress_frame_buffer(uts, dev));
+	ut_asserteq(3656, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
@@ -509,7 +515,7 @@ static int dm_test_video_bmp24_32(struct unit_test_state *uts)
 			   &src_len));
 
 	ut_assertok(video_bmp_display(dev, dst, 0, 0, false));
-	ut_asserteq(6827, compress_frame_buffer(uts, dev));
+	ut_asserteq(6827, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
@@ -528,7 +534,7 @@ static int dm_test_video_bmp32(struct unit_test_state *uts)
 	ut_assertok(read_file(uts, "tools/logos/denx.bmp", &addr));
 
 	ut_assertok(video_bmp_display(dev, addr, 0, 0, false));
-	ut_asserteq(2024, compress_frame_buffer(uts, dev));
+	ut_asserteq(2024, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
@@ -545,7 +551,7 @@ static int dm_test_video_bmp_comp(struct unit_test_state *uts)
 	ut_assertok(read_file(uts, "tools/logos/denx-comp.bmp", &addr));
 
 	ut_assertok(video_bmp_display(dev, addr, 0, 0, false));
-	ut_asserteq(1368, compress_frame_buffer(uts, dev));
+	ut_asserteq(1368, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
@@ -565,7 +571,7 @@ static int dm_test_video_comp_bmp32(struct unit_test_state *uts)
 	ut_assertok(read_file(uts, "tools/logos/denx.bmp", &addr));
 
 	ut_assertok(video_bmp_display(dev, addr, 0, 0, false));
-	ut_asserteq(2024, compress_frame_buffer(uts, dev));
+	ut_asserteq(2024, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
@@ -585,7 +591,7 @@ static int dm_test_video_comp_bmp8(struct unit_test_state *uts)
 	ut_assertok(read_file(uts, "tools/logos/denx.bmp", &addr));
 
 	ut_assertok(video_bmp_display(dev, addr, 0, 0, false));
-	ut_asserteq(1247, compress_frame_buffer(uts, dev));
+	ut_asserteq(1247, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
@@ -601,7 +607,7 @@ static int dm_test_video_truetype(struct unit_test_state *uts)
 	ut_assertok(video_get_nologo(uts, &dev));
 	ut_assertok(uclass_get_device(UCLASS_VIDEO_CONSOLE, 0, &con));
 	vidconsole_put_string(con, test_string);
-	ut_asserteq(12174, compress_frame_buffer(uts, dev));
+	ut_asserteq(12174, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
@@ -623,7 +629,7 @@ static int dm_test_video_truetype_scroll(struct unit_test_state *uts)
 	ut_assertok(video_get_nologo(uts, &dev));
 	ut_assertok(uclass_get_device(UCLASS_VIDEO_CONSOLE, 0, &con));
 	vidconsole_put_string(con, test_string);
-	ut_asserteq(34287, compress_frame_buffer(uts, dev));
+	ut_asserteq(34287, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
@@ -645,7 +651,7 @@ static int dm_test_video_truetype_bs(struct unit_test_state *uts)
 	ut_assertok(video_get_nologo(uts, &dev));
 	ut_assertok(uclass_get_device(UCLASS_VIDEO_CONSOLE, 0, &con));
 	vidconsole_put_string(con, test_string);
-	ut_asserteq(29471, compress_frame_buffer(uts, dev));
+	ut_asserteq(29471, compress_frame_buffer(uts, dev, false));
 	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
-- 
2.40.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
