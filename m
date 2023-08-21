Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2192078478C
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Aug 2023 18:27:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85BC4C78F79;
	Tue, 22 Aug 2023 16:27:09 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4DD5C6B44B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 13:51:52 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-317716a4622so3055295f8f.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 06:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692625912; x=1693230712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pB2qI48avq9qUXnFEl+wSnmS8SG0cxx3SZjicfp6H7M=;
 b=Q9fX66MTTcUQaIK9Ypbt13c6159mxahNRVYZb/qRcTZRgB9DWf7SyL5B6iwaerzl6H
 V/NgeKQknUqjdF1rx5cN+0oUlRjL/uqf2PRT1u/2iPSTrLx9ImfxO59U1v7bkAyqsRHD
 9d/OLcbkmN2dqLKXGEJEhw9wRWn6PflMZfMjZfJ6PgDh1lldO8RAGdA+f9Wv0Uqs/CHY
 M6HHFEIenHnWt15i3RWPMrP09rbx4OkOqYNXz1V/3BWUxb3tRe+1IqwA2n/oEpR5c0PM
 YcGRP1tNM3yqfxG53IdsPPiujOtSHSbvtWSyefvk7z3wSlVPYMzicea8BirSi8/Ag/R0
 CJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692625912; x=1693230712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pB2qI48avq9qUXnFEl+wSnmS8SG0cxx3SZjicfp6H7M=;
 b=KBIyTorfHUXErwotFhcTcF89cyzCcHgSlXZY5EYQeA6WOQedGgzFlStVWwtaLayJvY
 4K/cxf3atoDypVxKUZi62Urch3I9swI+nBRGubOxR3iQRUX1uDoS7hGo6AxdreyWn4p3
 O1LkkV9lQRK3sZUyDwZxqcpQOTFTYEsGZtn1mMcwpXZLp1gNBJMndz706F6iWtHcQkUV
 wOUxVVdfn/z5Avnjh2Kva/51D5UK+e3xRsWbas7ghpbfpAIlZqRBDCo/ipjyHQ2IDYAi
 RkfCPR9CH4Dt9tNUG/uWsdnb8wh1vIvDltjmjGQ3804HDznQ4XSGqwjZodKzqImm1weR
 Q/fQ==
X-Gm-Message-State: AOJu0Yyg4xCo4oreLmgIH1k6V4UHfUQYZ4LwK3w+ttBDjHa0AW2ch5vN
 RZPT0+1qhTodmR+VFc/5J8U=
X-Google-Smtp-Source: AGHT+IFpiAY2BjXpJaKJJodzwN7aKj9YFF3eAkfmZgRFnB94o3W7mQtEZgXERHeKNVbIpRB5HlMypw==
X-Received: by 2002:a05:6000:1205:b0:31c:4f80:9f7 with SMTP id
 e5-20020a056000120500b0031c4f8009f7mr1593479wrx.45.1692625912317; 
 Mon, 21 Aug 2023 06:51:52 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1]) by smtp.gmail.com with ESMTPSA id
 r11-20020a5d4e4b000000b00317b063590fsm12600049wrt.55.2023.08.21.06.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 06:51:51 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: u-boot@lists.denx.de
Date: Mon, 21 Aug 2023 16:51:09 +0300
Message-Id: <20230821135111.3558478-13-alpernebiyasak@gmail.com>
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
Subject: [Uboot-stm32] [PATCH v5 12/13] video: Always compile cache flushing
	code
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

The dcache flushing code path was conditional on ARM && !DCACHE config
options. However, dcaches exist on other platforms as well and may need
clearing if their driver requires it.

Simplify the compile logic and always enable the dcache flush logic in
the video core. That way, drivers can always rely on it to call the arch
specific callbacks.

This will increase code size for non-ARM platforms with CONFIG_VIDEO=y
slightly.

Reported-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Simon Glass <sjg@chromium.org>
Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---

(no changes since v4)

Changes in v4:
- Add patch "video: Always compile cache flushing code"

 drivers/video/video-uclass.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/video/video-uclass.c b/drivers/video/video-uclass.c
index c79499252a22..3f9ddaadd15d 100644
--- a/drivers/video/video-uclass.c
+++ b/drivers/video/video-uclass.c
@@ -377,11 +377,13 @@ void video_damage(struct udevice *vid, int x, int y, int width, int height)
 	priv->damage.yend = max(yend, priv->damage.yend);
 }
 
-#if defined(CONFIG_ARM) && !CONFIG_IS_ENABLED(SYS_DCACHE_OFF)
 static void video_flush_dcache(struct udevice *vid)
 {
 	struct video_priv *priv = dev_get_uclass_priv(vid);
 
+	if (CONFIG_IS_ENABLED(SYS_DCACHE_OFF))
+		return;
+
 	if (!priv->flush_dcache)
 		return;
 
@@ -410,7 +412,6 @@ static void video_flush_dcache(struct udevice *vid)
 		}
 	}
 }
-#endif
 
 static void video_flush_copy(struct udevice *vid)
 {
@@ -449,14 +450,9 @@ int video_sync(struct udevice *vid, bool force)
 			return ret;
 	}
 
-	/*
-	 * flush_dcache_range() is declared in common.h but it seems that some
-	 * architectures do not actually implement it. Is there a way to find
-	 * out whether it exists? For now, ARM is safe.
-	 */
-#if defined(CONFIG_ARM) && !CONFIG_IS_ENABLED(SYS_DCACHE_OFF)
 	video_flush_dcache(vid);
-#elif defined(CONFIG_VIDEO_SANDBOX_SDL)
+
+#if defined(CONFIG_VIDEO_SANDBOX_SDL)
 	static ulong last_sync;
 
 	if (force || get_timer(last_sync) > 100) {
-- 
2.40.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
