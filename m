Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F6F784788
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Aug 2023 18:27:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E591C78F6F;
	Tue, 22 Aug 2023 16:27:09 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DBF9C6B44B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 13:51:40 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-3fe4a89e8c4so32334085e9.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 06:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692625900; x=1693230700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=du9K8HAMfjDBv9t9zq9p8Zs+vCZHJ6g2zmB7iSzSF7o=;
 b=i+1wSJUCYpv3D2Y4WhFT+a+eXACMjCfu9K5FQkWQdC2smyIukzPLOT9TKll1BIlZ+S
 0BSrF+Vp8/DGT40HSh+wXWV4jYRbGaai6uC9HETzas7pJ6Qhy+ffz2UKdEYLi1VLHsaq
 X75Z5dWmXphu9f83rAKezE9CYHm+PJtfCCmN6nzYmKby9xzdvEmPjC4JmCjqvh+sqORE
 Bzxq55zbOUyTxIzqT01tuFNOw/v8W0H5dQ6fFOCzvxrMmYV1xWY68YL/0QqfqG2DG5q1
 XPDS0Sgg6L+yzBD2e/I0iNDZaFfXRDq4jvWBkELBWMrWm1880C9/qHFlPwFRRUlHYf+M
 4DSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692625900; x=1693230700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=du9K8HAMfjDBv9t9zq9p8Zs+vCZHJ6g2zmB7iSzSF7o=;
 b=MR+6glP/iuMUrDL0gC//F5WN6eLXff4TV7gJ6/QBBbPuxsaWQm28cNKM4aEwFS4rHF
 vZ4hVYWK8QnTj80+HURwBPqj/+hPMLvFgPkmCun9zoKw/yOonrGalm67OmAIjIyxdVjY
 z/qtbbKl769myqfE+H4ktXAzSLR0UaetvI/NQmp1MVx2Ii/3YASdB7aXMA3iLDMxfP62
 F7zWFdmubRbS6m7jotBbi8PHEFU9bI3bu1MhDt/Vke49HiFaEs7GV378OdSsu826N37w
 Zz2evleXjdTiKhFmuRf4ziVTW0CAIc9KU10SpKAm8PX44Tl06wb0VFjt5zz+YipOa3Ni
 jHUA==
X-Gm-Message-State: AOJu0Yxyi0b1DNep/QbkGERJJktihSOBficrpA+NoR3CtwDv6CAnKb3+
 CaAHBUvL6HPpz2jB0k7S5Hg=
X-Google-Smtp-Source: AGHT+IE0aHC9IeAZ9om6v+CX5lhGhaikzyvs7K+JjasiPPxFotFPaEOG+0SHfy/L4wW7iRlvWFh0mw==
X-Received: by 2002:a5d:568f:0:b0:317:e5ec:8767 with SMTP id
 f15-20020a5d568f000000b00317e5ec8767mr4615501wrv.21.1692625899711; 
 Mon, 21 Aug 2023 06:51:39 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1]) by smtp.gmail.com with ESMTPSA id
 r11-20020a5d4e4b000000b00317b063590fsm12600049wrt.55.2023.08.21.06.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 06:51:39 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: u-boot@lists.denx.de
Date: Mon, 21 Aug 2023 16:51:04 +0300
Message-Id: <20230821135111.3558478-8-alpernebiyasak@gmail.com>
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
Subject: [Uboot-stm32] [PATCH v5 07/13] video: test: Test video damage
	tracking via vidconsole
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

With VIDEO_DAMAGE, the video uclass tracks updated regions of the frame
buffer in order to avoid unnecessary work during a video sync. Enable
the config in sandbox and add a test for it, by printing strings at a
few locations and checking the tracked region.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---
This is hard to test because most things issue video syncs that process
and reset the damaged region.

Changes in v5:
- Add patch "video: test: Test video damage tracking via vidconsole"

 configs/sandbox_defconfig |  1 +
 test/dm/video.c           | 56 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
index 259f31f26cee..51b820f13121 100644
--- a/configs/sandbox_defconfig
+++ b/configs/sandbox_defconfig
@@ -307,6 +307,7 @@ CONFIG_USB_ETH_CDC=y
 CONFIG_VIDEO=y
 CONFIG_VIDEO_FONT_SUN12X22=y
 CONFIG_VIDEO_COPY=y
+CONFIG_VIDEO_DAMAGE=y
 CONFIG_CONSOLE_ROTATION=y
 CONFIG_CONSOLE_TRUETYPE=y
 CONFIG_CONSOLE_TRUETYPE_CANTORAONE=y
diff --git a/test/dm/video.c b/test/dm/video.c
index e4bd27a6b76f..8c7d9800a42e 100644
--- a/test/dm/video.c
+++ b/test/dm/video.c
@@ -711,3 +711,59 @@ static int dm_test_video_copy(struct unit_test_state *uts)
 	return 0;
 }
 DM_TEST(dm_test_video_copy, UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
+
+/* Test video damage tracking */
+static int dm_test_video_damage(struct unit_test_state *uts)
+{
+	struct sandbox_sdl_plat *plat;
+	struct udevice *dev, *con;
+	struct video_priv *priv;
+	const char *test_string_1 = "Criticism may not be agreeable, ";
+	const char *test_string_2 = "but it is necessary.";
+	const char *test_string_3 = "It fulfils the same function as pain in the human body.";
+
+	if (!IS_ENABLED(CONFIG_VIDEO_DAMAGE))
+		return -EAGAIN;
+
+	ut_assertok(uclass_find_device(UCLASS_VIDEO, 0, &dev));
+	ut_assert(!device_active(dev));
+	plat = dev_get_plat(dev);
+	plat->font_size = 32;
+
+	ut_assertok(video_get_nologo(uts, &dev));
+	ut_assertok(uclass_get_device(UCLASS_VIDEO_CONSOLE, 0, &con));
+	priv = dev_get_uclass_priv(dev);
+
+	vidconsole_position_cursor(con, 14, 10);
+	vidconsole_put_string(con, test_string_2);
+	ut_asserteq(449, priv->damage.xstart);
+	ut_asserteq(325, priv->damage.ystart);
+	ut_asserteq(661, priv->damage.xend);
+	ut_asserteq(350, priv->damage.yend);
+
+	vidconsole_position_cursor(con, 7, 5);
+	vidconsole_put_string(con, test_string_1);
+	ut_asserteq(225, priv->damage.xstart);
+	ut_asserteq(164, priv->damage.ystart);
+	ut_asserteq(661, priv->damage.xend);
+	ut_asserteq(350, priv->damage.yend);
+
+	vidconsole_position_cursor(con, 21, 15);
+	vidconsole_put_string(con, test_string_3);
+	ut_asserteq(225, priv->damage.xstart);
+	ut_asserteq(164, priv->damage.ystart);
+	ut_asserteq(1280, priv->damage.xend);
+	ut_asserteq(510, priv->damage.yend);
+
+	video_sync(dev, false);
+	ut_asserteq(priv->xsize, priv->damage.xstart);
+	ut_asserteq(priv->ysize, priv->damage.ystart);
+	ut_asserteq(0, priv->damage.xend);
+	ut_asserteq(0, priv->damage.yend);
+
+	ut_asserteq(7339, compress_frame_buffer(uts, dev, false));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
+
+	return 0;
+}
+DM_TEST(dm_test_video_damage, UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
-- 
2.40.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
