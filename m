Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C31784782
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Aug 2023 18:27:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BF19C78F63;
	Tue, 22 Aug 2023 16:27:08 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25080C65E56
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 13:51:25 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-3fe1a17f983so31791575e9.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 06:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692625884; x=1693230684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0KM0F1+WkNhDdn0zbbXHFFjqAdCr64hX7QvIzy6/iyI=;
 b=jAFdt8C3owZgLvkS3GxcS5N+GiTxn30Z/xJkqzPDEYfC0PDH1kIsDI4pb6eHKAFVBt
 PLqr4R9Sdmb05o76fez0U9nTmmv97QjcaeHGc0adZliwf33YdMgotCTaUiHc/nhkpLWw
 c8rHP6jWgFPGn5Y45QEtPjQFEuV0nP0SkMONJorI+ci6NUadDN8X0tZNK5GoF1lvhF4o
 mQZs5xJfJ6evaIBX7srcue8NUq4BtyhQ18vVYm0nCIPEltA23PBpkcejhCv6g5o/4puI
 sgF/+jj8BhBQFKhPEIktVLWcqveScR/ngqiv1iDRHrCL6flPhtCsrpShY+rzilzpJdtC
 fkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692625884; x=1693230684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0KM0F1+WkNhDdn0zbbXHFFjqAdCr64hX7QvIzy6/iyI=;
 b=ftH9JiFZnzjpDMO2LWHWoEt7I/ON+Sep8JVj+r1V3my3pMUzKq4molFhgnNbjIdiOY
 sKyszCoXL091dgxNME4ma4TF4IMISzJkwhNUxg2xmUhBIb9G3dU/MZ9qmcdmsVAIaNTh
 JxrqwGpPSijAFbpAcx9SVI6EGVpOlmmZPjM+GjyovcvU+61Ho1vM/O9udfsmtjqsxuZU
 Bho3TB3Cz6UKFZng4SR1yxacsURfOQ8YH6x2HJSIn5k22gVfRSW1eFwe05jFrLGEa3iy
 d59lralMXzftRenjwH/gefYqX7Fk5SD2ILM1tQlpYNjwYdxipJaznOuqV+V5OAYqK0EC
 zHHQ==
X-Gm-Message-State: AOJu0Yz+lXtYhEGPrdmh3wJ+Sg+nqjCCVVirpdkZuf6kN3xiqxMlfxGR
 aRC9dXCmetPogtZlAGfkc9o=
X-Google-Smtp-Source: AGHT+IGiiJu3kdw60kWynu1HizRmCX0l3/hesikD0kGHzt9jbq6D24m4A0InLSpbaBLDcUVjniBVKA==
X-Received: by 2002:a05:600c:3799:b0:3fe:2011:a7ce with SMTP id
 o25-20020a05600c379900b003fe2011a7cemr5345546wmr.6.1692625884228; 
 Mon, 21 Aug 2023 06:51:24 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1]) by smtp.gmail.com with ESMTPSA id
 r11-20020a5d4e4b000000b00317b063590fsm12600049wrt.55.2023.08.21.06.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 06:51:23 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: u-boot@lists.denx.de
Date: Mon, 21 Aug 2023 16:50:58 +0300
Message-Id: <20230821135111.3558478-2-alpernebiyasak@gmail.com>
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
Subject: [Uboot-stm32] [PATCH v5 01/13] video: test: Split copy frame buffer
	check into a function
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

While checking frame buffer contents, the video tests also check if the
copy frame buffer contents match the main frame buffer. To test if only
the modified regions are updated after a sync, we will need to create
situations where the two are mismatched. Split this check into another
function that we can skip calling, since we won't want it to error on
those mismatched cases.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---

Changes in v5:
- Add patch "video: test: Split copy frame buffer check into a function"

 test/dm/video.c | 69 +++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 58 insertions(+), 11 deletions(-)

diff --git a/test/dm/video.c b/test/dm/video.c
index d907f681600b..641a6250100a 100644
--- a/test/dm/video.c
+++ b/test/dm/video.c
@@ -55,9 +55,6 @@ DM_TEST(dm_test_video_base, UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
  * size of the compressed data. This provides a pretty good level of
  * certainty and the resulting tests need only check a single value.
  *
- * If the copy framebuffer is enabled, this compares it to the main framebuffer
- * too.
- *
  * @uts:	Test state
  * @dev:	Video device
  * Return: compressed size of the frame buffer, or -ve on error
@@ -66,7 +63,6 @@ static int compress_frame_buffer(struct unit_test_state *uts,
 				 struct udevice *dev)
 {
 	struct video_priv *priv = dev_get_uclass_priv(dev);
-	struct video_priv *uc_priv = dev_get_uclass_priv(dev);
 	uint destlen;
 	void *dest;
 	int ret;
@@ -82,16 +78,34 @@ static int compress_frame_buffer(struct unit_test_state *uts,
 	if (ret)
 		return ret;
 
-	/* Check here that the copy frame buffer is working correctly */
-	if (IS_ENABLED(CONFIG_VIDEO_COPY)) {
-		ut_assertf(!memcmp(uc_priv->fb, uc_priv->copy_fb,
-				   uc_priv->fb_size),
-				   "Copy framebuffer does not match fb");
-	}
-
 	return destlen;
 }
 
+/**
+ * check_copy_frame_buffer() - Compare main frame buffer to copy
+ *
+ * If the copy frame buffer is enabled, this compares it to the main
+ * frame buffer. Normally they should have the same contents after a
+ * sync.
+ *
+ * @uts:	Test state
+ * @dev:	Video device
+ * Return: 0, or -ve on error
+ */
+static int check_copy_frame_buffer(struct unit_test_state *uts,
+				   struct udevice *dev)
+{
+	struct video_priv *priv = dev_get_uclass_priv(dev);
+
+	if (!IS_ENABLED(CONFIG_VIDEO_COPY))
+		return 0;
+
+	ut_assertf(!memcmp(priv->fb, priv->copy_fb, priv->fb_size),
+		   "Copy framebuffer does not match fb");
+
+	return 0;
+}
+
 /*
  * Call this function at any point to halt and show the current display. Be
  * sure to run the test with the -l flag.
@@ -155,24 +169,30 @@ static int dm_test_video_text(struct unit_test_state *uts)
 	ut_assertok(uclass_get_device(UCLASS_VIDEO_CONSOLE, 0, &con));
 	ut_assertok(vidconsole_select_font(con, "8x16", 0));
 	ut_asserteq(46, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	ut_assertok(uclass_get_device(UCLASS_VIDEO_CONSOLE, 0, &con));
 	vidconsole_putc_xy(con, 0, 0, 'a');
 	ut_asserteq(79, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	vidconsole_putc_xy(con, 0, 0, ' ');
 	ut_asserteq(46, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	for (i = 0; i < 20; i++)
 		vidconsole_putc_xy(con, VID_TO_POS(i * 8), 0, ' ' + i);
 	ut_asserteq(273, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	vidconsole_set_row(con, 0, WHITE);
 	ut_asserteq(46, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	for (i = 0; i < 20; i++)
 		vidconsole_putc_xy(con, VID_TO_POS(i * 8), 0, ' ' + i);
 	ut_asserteq(273, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
 }
@@ -191,24 +211,30 @@ static int dm_test_video_text_12x22(struct unit_test_state *uts)
 	ut_assertok(uclass_get_device(UCLASS_VIDEO_CONSOLE, 0, &con));
 	ut_assertok(vidconsole_select_font(con, "12x22", 0));
 	ut_asserteq(46, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	ut_assertok(uclass_get_device(UCLASS_VIDEO_CONSOLE, 0, &con));
 	vidconsole_putc_xy(con, 0, 0, 'a');
 	ut_asserteq(89, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	vidconsole_putc_xy(con, 0, 0, ' ');
 	ut_asserteq(46, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	for (i = 0; i < 20; i++)
 		vidconsole_putc_xy(con, VID_TO_POS(i * 8), 0, ' ' + i);
 	ut_asserteq(363, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	vidconsole_set_row(con, 0, WHITE);
 	ut_asserteq(46, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	for (i = 0; i < 20; i++)
 		vidconsole_putc_xy(con, VID_TO_POS(i * 8), 0, ' ' + i);
 	ut_asserteq(363, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
 }
@@ -226,6 +252,7 @@ static int dm_test_video_chars(struct unit_test_state *uts)
 	ut_assertok(vidconsole_select_font(con, "8x16", 0));
 	vidconsole_put_string(con, test_string);
 	ut_asserteq(466, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
 }
@@ -247,19 +274,23 @@ static int dm_test_video_ansi(struct unit_test_state *uts)
 	video_clear(con->parent);
 	video_sync(con->parent, false);
 	ut_asserteq(46, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	/* test clear escape sequence: [2J */
 	vidconsole_put_string(con, "A\tB\tC"ANSI_ESC"[2J");
 	ut_asserteq(46, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	/* test set-cursor: [%d;%df */
 	vidconsole_put_string(con, "abc"ANSI_ESC"[2;2fab"ANSI_ESC"[4;4fcd");
 	ut_asserteq(143, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	/* test colors (30-37 fg color, 40-47 bg color) */
 	vidconsole_put_string(con, ANSI_ESC"[30;41mfoo"); /* black on red */
 	vidconsole_put_string(con, ANSI_ESC"[33;44mbar"); /* yellow on blue */
 	ut_asserteq(272, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
 }
@@ -292,11 +323,13 @@ static int check_vidconsole_output(struct unit_test_state *uts, int rot,
 	ut_assertok(uclass_get_device(UCLASS_VIDEO_CONSOLE, 0, &con));
 	ut_assertok(vidconsole_select_font(con, "8x16", 0));
 	ut_asserteq(46, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	/* Check display wrap */
 	for (i = 0; i < 120; i++)
 		vidconsole_put_char(con, 'A' + i % 50);
 	ut_asserteq(wrap_size, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	/* Check display scrolling */
 	for (i = 0; i < SCROLL_LINES; i++) {
@@ -304,11 +337,13 @@ static int check_vidconsole_output(struct unit_test_state *uts, int rot,
 		vidconsole_put_char(con, '\n');
 	}
 	ut_asserteq(scroll_size, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	/* If we scroll enough, the screen becomes blank again */
 	for (i = 0; i < SCROLL_LINES; i++)
 		vidconsole_put_char(con, '\n');
 	ut_asserteq(46, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
 }
@@ -383,6 +418,7 @@ static int dm_test_video_bmp(struct unit_test_state *uts)
 
 	ut_assertok(video_bmp_display(dev, addr, 0, 0, false));
 	ut_asserteq(1368, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
 }
@@ -402,6 +438,7 @@ static int dm_test_video_bmp8(struct unit_test_state *uts)
 
 	ut_assertok(video_bmp_display(dev, addr, 0, 0, false));
 	ut_asserteq(1247, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
 }
@@ -425,6 +462,7 @@ static int dm_test_video_bmp16(struct unit_test_state *uts)
 
 	ut_assertok(video_bmp_display(dev, dst, 0, 0, false));
 	ut_asserteq(3700, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
 }
@@ -448,6 +486,7 @@ static int dm_test_video_bmp24(struct unit_test_state *uts)
 
 	ut_assertok(video_bmp_display(dev, dst, 0, 0, false));
 	ut_asserteq(3656, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
 }
@@ -471,6 +510,7 @@ static int dm_test_video_bmp24_32(struct unit_test_state *uts)
 
 	ut_assertok(video_bmp_display(dev, dst, 0, 0, false));
 	ut_asserteq(6827, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
 }
@@ -489,6 +529,7 @@ static int dm_test_video_bmp32(struct unit_test_state *uts)
 
 	ut_assertok(video_bmp_display(dev, addr, 0, 0, false));
 	ut_asserteq(2024, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
 }
@@ -505,6 +546,7 @@ static int dm_test_video_bmp_comp(struct unit_test_state *uts)
 
 	ut_assertok(video_bmp_display(dev, addr, 0, 0, false));
 	ut_asserteq(1368, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
 }
@@ -524,6 +566,7 @@ static int dm_test_video_comp_bmp32(struct unit_test_state *uts)
 
 	ut_assertok(video_bmp_display(dev, addr, 0, 0, false));
 	ut_asserteq(2024, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
 }
@@ -543,6 +586,7 @@ static int dm_test_video_comp_bmp8(struct unit_test_state *uts)
 
 	ut_assertok(video_bmp_display(dev, addr, 0, 0, false));
 	ut_asserteq(1247, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
 }
@@ -558,6 +602,7 @@ static int dm_test_video_truetype(struct unit_test_state *uts)
 	ut_assertok(uclass_get_device(UCLASS_VIDEO_CONSOLE, 0, &con));
 	vidconsole_put_string(con, test_string);
 	ut_asserteq(12174, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
 }
@@ -579,6 +624,7 @@ static int dm_test_video_truetype_scroll(struct unit_test_state *uts)
 	ut_assertok(uclass_get_device(UCLASS_VIDEO_CONSOLE, 0, &con));
 	vidconsole_put_string(con, test_string);
 	ut_asserteq(34287, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
 }
@@ -600,6 +646,7 @@ static int dm_test_video_truetype_bs(struct unit_test_state *uts)
 	ut_assertok(uclass_get_device(UCLASS_VIDEO_CONSOLE, 0, &con));
 	vidconsole_put_string(con, test_string);
 	ut_asserteq(29471, compress_frame_buffer(uts, dev));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
 
 	return 0;
 }
-- 
2.40.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
