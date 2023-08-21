Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F75C784789
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Aug 2023 18:27:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66444C78F71;
	Tue, 22 Aug 2023 16:27:09 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC209C6B44C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 13:51:42 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-3fee769fcc3so16778175e9.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 06:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692625902; x=1693230702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OUPwGyIUGhu07FwRipI6J5nz3cUBWpffvk0k2vprnLg=;
 b=mvjKik+ts2RRqakLQOi9t7J1i101HYF0aguRZ/P4y3h8SvaC+jrWNXPy+MyUiGFatO
 EW5N4iqonVrCvE+i19nnSxA3TW5G5ItgSDTN6yq5TEp806h08MC17nKgCuRk/Urg+Nkj
 ZewK+CW+lOR6k2kB8LtZylmeke1YHCeGMXq9VMK1hsm4co4hgSx0ZJ1OXiP5+tc4mVug
 L2WSO1+ILyeHTT0N/dHw3FHShX08Y0SisUe32K946KofaqN6teHjb172uNMPVvd4Nk1S
 G2GYNvIigYOzyXNzeBRUDXG3TkK8+ioXwBLZ4iqTsf77Dc0p2ePFbhc23gHzBcKBpUSc
 O2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692625902; x=1693230702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OUPwGyIUGhu07FwRipI6J5nz3cUBWpffvk0k2vprnLg=;
 b=fyEVpSdmYjFQXG7UPJ9cluLR+NaclEX8yFadP6wbxn/eNzcF97CXSKzZp1x6Bc2M16
 TJs/rkBKp8DaAIRG2lSxCBnA0JVXE+xunZdaAQx22uRf45LUAwrnfOxCSNN50Poj9/4G
 1LsMpNpLM7T94glkNop9mLm3iUg3KqiLlKlhVuJg5pb8F3aMKGdNPey893gTYQ6JHrdf
 w2GrQKSEzRgV7K4hqQ/UqgSYbEWmSMMQPJCsFLdCAYvp7+sPFz/66IsHKHlKmdT71q/s
 dxH8Lf0VF10yt4phQeFJ/WmJoYh3eFzwPqardd+LcoUmSFJm15ym7m9YE4PBSGQd3ZUx
 U5bg==
X-Gm-Message-State: AOJu0YxqXhpYCP2aDN7Pgf8hEQW2d9+7fpcJihAwuJMmXAuNZXfnOZjq
 R75mS0bJugpNtgxobH0nCHE=
X-Google-Smtp-Source: AGHT+IFzj3fGJ3yOnSTVNmg3QQIrMsHdzvHVI7a3IQjx0jS8kD0qBSvWJ3Z5+c4jA0D6oPZBiuGxwA==
X-Received: by 2002:a5d:6811:0:b0:319:8a5a:ab5e with SMTP id
 w17-20020a5d6811000000b003198a5aab5emr4349395wru.38.1692625902291; 
 Mon, 21 Aug 2023 06:51:42 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1]) by smtp.gmail.com with ESMTPSA id
 r11-20020a5d4e4b000000b00317b063590fsm12600049wrt.55.2023.08.21.06.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 06:51:41 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: u-boot@lists.denx.de
Date: Mon, 21 Aug 2023 16:51:05 +0300
Message-Id: <20230821135111.3558478-9-alpernebiyasak@gmail.com>
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
Subject: [Uboot-stm32] [PATCH v5 08/13] video: Add damage notification on
	bmp display
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

Let's report the video damage when we draw a bitmap on the screen. This
way we can later lazily flush only relevant regions to hardware.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reported-by: Da Xue <da@libre.computer>
Reviewed-by: Simon Glass <sjg@chromium.org>
Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---

(no changes since v1)

 drivers/video/video_bmp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/video_bmp.c b/drivers/video/video_bmp.c
index 45f003c8251a..10943b9ca19f 100644
--- a/drivers/video/video_bmp.c
+++ b/drivers/video/video_bmp.c
@@ -460,6 +460,8 @@ int video_bmp_display(struct udevice *dev, ulong bmp_image, int x, int y,
 		break;
 	};
 
+	video_damage(dev, x, y, width, height);
+
 	/* Find the position of the top left of the image in the framebuffer */
 	fb = (uchar *)(priv->fb + y * priv->line_length + x * bpix / 8);
 	ret = video_sync_copy(dev, start, fb);
-- 
2.40.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
