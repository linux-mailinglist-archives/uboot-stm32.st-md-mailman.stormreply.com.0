Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DBC784784
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Aug 2023 18:27:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C594C78F67;
	Tue, 22 Aug 2023 16:27:08 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1038C65E56
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 13:51:29 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-31c5cac3ae2so351821f8f.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 06:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692625889; x=1693230689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ls20OKhVk8mknnS6GLFBhmTjxLz0/7fKNgK2nzSEs6M=;
 b=h0nfUUKHqteSaQqflnkXT9zc90H1nKLTOoG4B78CtKhSKUI/thuMDU61AtN+enWvFJ
 MdvU9OW3jOHeg+LRrxur+6+N4V9k4nGhm2BGwtj56A1DDfCLgk5+Vg38dhi1a24kfBH9
 d5w6HXOg3wdMizdTsyL0PbugSX7K9ByL9XKpH646NdsnqcikQNdmT2OeiGAmonEmHXAa
 FII1SypkiZ5TOFcJx9N4X2XqMM3CNxyUsDs6+AV4dTPnjtXaElWj1fQcz8bLn/9q88/X
 UCvE35N4Y37FFgb+5uTi+00hcLIavYKYrLEpNAclnl9NKFSUAUJyabqQM0+riy1OSMHF
 5YBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692625889; x=1693230689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ls20OKhVk8mknnS6GLFBhmTjxLz0/7fKNgK2nzSEs6M=;
 b=lUK7kMbLPecu8qMU9wPOQPkZQtdlBDdBQjQTL2ilBKWUlg0U5q9JMz6FkSsc+UEjxF
 iMdMC/CP5rRBaUpLhCJeOiAZSl4PjeuwS7E2KhpSlNrCcxIU5DT5u1e+LrRAMR2PPKh4
 SNfRWH4LMuw9UhsQEXgzB/4im17B1uDOaPzyNnTGKczTMzH5xble8UkJAUIwaqLMjXZX
 6Zd6SBfpoZxsj1emUs9k+r+q7VduC57OoDoWZ3epWUXav4URsTdkhqhFtddd4CDpJY7i
 1zZ2YPommLHR8I0RaCQN9ry+WGVxrKpFbfBdeF6dePd51MtleR8HOUqXI2X6+sxoZaqE
 0hPg==
X-Gm-Message-State: AOJu0YztJAB1qV+n8DAtcLnCOhcThkXIfUEyexAZ9Wijh+SM7d7LXbJG
 0e17AJo9iyLcjlUS5SMv1zQ=
X-Google-Smtp-Source: AGHT+IEwSW6rIF+3ua5ruA0V/p8R0SXlrxBIJRwdiP9dn7nhkL8gMfhxYppZ2c8jWSzauubY8xUVnQ==
X-Received: by 2002:adf:e482:0:b0:31a:dc27:e10 with SMTP id
 i2-20020adfe482000000b0031adc270e10mr4721868wrm.65.1692625889315; 
 Mon, 21 Aug 2023 06:51:29 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1]) by smtp.gmail.com with ESMTPSA id
 r11-20020a5d4e4b000000b00317b063590fsm12600049wrt.55.2023.08.21.06.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 06:51:28 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: u-boot@lists.denx.de
Date: Mon, 21 Aug 2023 16:51:00 +0300
Message-Id: <20230821135111.3558478-4-alpernebiyasak@gmail.com>
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
Subject: [Uboot-stm32] [PATCH v5 03/13] video: test: Test partial updates of
	hardware frame buffer
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

With VIDEO_COPY enabled, only the modified parts of the frame buffer are
intended to be copied to the hardware. Add a test that checks this, by
overwriting contents we prepared without telling the video uclass and
then checking if the overwritten contents have been redrawn on the next
sync.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---

Changes in v5:
- Add patch "video: test: Test partial updates of hardware frame buffer"

 test/dm/video.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/test/dm/video.c b/test/dm/video.c
index b9ff3da10c18..e4bd27a6b76f 100644
--- a/test/dm/video.c
+++ b/test/dm/video.c
@@ -657,3 +657,57 @@ static int dm_test_video_truetype_bs(struct unit_test_state *uts)
 	return 0;
 }
 DM_TEST(dm_test_video_truetype_bs, UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
+
+/* Test partial rendering onto hardware frame buffer */
+static int dm_test_video_copy(struct unit_test_state *uts)
+{
+	struct sandbox_sdl_plat *plat;
+	struct video_uc_plat *uc_plat;
+	struct udevice *dev, *con;
+	struct video_priv *priv;
+	const char *test_string = "\n\tCriticism may not be agreeable, but it is necessary.\t";
+	ulong addr;
+
+	if (!IS_ENABLED(CONFIG_VIDEO_COPY))
+		return -EAGAIN;
+
+	ut_assertok(uclass_find_first_device(UCLASS_VIDEO, &dev));
+	ut_assertnonnull(dev);
+	uc_plat = dev_get_uclass_plat(dev);
+	uc_plat->hide_logo = true;
+	plat = dev_get_plat(dev);
+	plat->font_size = 32;
+	ut_assert(!device_active(dev));
+	ut_assertok(uclass_first_device_err(UCLASS_VIDEO, &dev));
+	ut_assertnonnull(dev);
+	priv = dev_get_uclass_priv(dev);
+
+	ut_assertok(read_file(uts, "tools/logos/denx.bmp", &addr));
+	ut_assertok(video_bmp_display(dev, addr, 0, 0, false));
+
+	ut_assertok(uclass_get_device(UCLASS_VIDEO_CONSOLE, 0, &con));
+	vidconsole_put_string(con, "\n\n\n\n\n");
+	vidconsole_put_string(con, test_string);
+	vidconsole_put_string(con, test_string);
+
+	ut_asserteq(6678, compress_frame_buffer(uts, dev, false));
+	ut_assertok(check_copy_frame_buffer(uts, dev));
+
+	/*
+	 * Secretly clear the hardware frame buffer, but in a different
+	 * color (black) to see which parts will be overwritten.
+	 */
+	memset(priv->copy_fb, 0, priv->fb_size);
+
+	/*
+	 * We should have the full content on the main buffer, but only
+	 * the new content should have been copied to the copy buffer.
+	 */
+	vidconsole_put_string(con, test_string);
+	vidconsole_put_string(con, test_string);
+	ut_asserteq(7589, compress_frame_buffer(uts, dev, false));
+	ut_asserteq(5278, compress_frame_buffer(uts, dev, true));
+
+	return 0;
+}
+DM_TEST(dm_test_video_copy, UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
-- 
2.40.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
