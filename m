Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CC9784786
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Aug 2023 18:27:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DE59C78F6B;
	Tue, 22 Aug 2023 16:27:08 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4341DC6B44B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 13:51:35 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-31ad9155414so2999736f8f.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 06:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692625895; x=1693230695;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rfyiNp4RS7b8BQCxsUs1afKXNK4WMu1bUdXxDQXJn1U=;
 b=BdIntNrw+JbVTri7AodJPuA4KoTwuid2ByavDMP+gEZwSfMkjrlWlFROWNdM4E2KeC
 btsSXcPQO3jMnyoxVbS5g4DL2PkXPHNZO/Lw5Db4La4RGjoB4ks8w4G1nQ5kVo8NIXlQ
 7da1BVmm9tlV2cmt2LVuLp3WDWvgE5vJ9kVj8BH8fjD+gKc5wVOKtRIPJnqL8Eqj55A5
 y8xjVcW5ldxVps2jj0kE7Mq8LG2R6Bd37Zsw+Dq3Cj/1khMgLkYog8/Nf+k2uYXPQpjA
 TS03XR6eJ7GQcRUf0iWft80hVZMVk6KF2AWuF04HcJ/goyNj4MGGFun0tanDYNImJzv0
 A/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692625895; x=1693230695;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rfyiNp4RS7b8BQCxsUs1afKXNK4WMu1bUdXxDQXJn1U=;
 b=PQGW2Z20bXlCFfNKh8BZGdgdggERDu3hsUnllQ3eiyhKLIxojLq18khqHTRijdXBxN
 54flALpg/dq6b/T2IC/24G+xdPX68ol3Dz3nqXA9KpJ76B+dbCvSREfa1EZ+ADDsYeAk
 F+ubbWg5Rkp46gkbFSJZHYDraYSwee48/O9xsrpTPs449ypnkyb/1IjIViK/RzFkoooD
 bmPavlhtEqQeiye1ZtqVtqwtewVLD/ZC3E8Z/eRoxRM99QBdwHnsbnvPumzd5hhlt+ky
 4auPLLA/iX3/zx0vAQfO41dX7myNWy7FKaJ9yE013znXzBBFt2rw5H0OvkhY76qIb/RZ
 mhwg==
X-Gm-Message-State: AOJu0Ywv76ADPcEzpxEVTkYmZOarrGfnNQubfToaP/KRDLdrQbBQRFKQ
 74DG2TmnQ3HxD1r1BiEt/Lg=
X-Google-Smtp-Source: AGHT+IEaweUWG6MdegfaF+T8dg4D4mXuTL2UTLikuqRhtfAyLWNc6xApEfO0HHPUExbseBScRw20SA==
X-Received: by 2002:a5d:44d1:0:b0:313:f94f:3b15 with SMTP id
 z17-20020a5d44d1000000b00313f94f3b15mr5140696wrr.2.1692625894567; 
 Mon, 21 Aug 2023 06:51:34 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1]) by smtp.gmail.com with ESMTPSA id
 r11-20020a5d4e4b000000b00317b063590fsm12600049wrt.55.2023.08.21.06.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 06:51:34 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: u-boot@lists.denx.de
Date: Mon, 21 Aug 2023 16:51:02 +0300
Message-Id: <20230821135111.3558478-6-alpernebiyasak@gmail.com>
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
Subject: [Uboot-stm32] [PATCH v5 05/13] dm: video: Add damage notification
	on display fills
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

Let's report the video damage when we fill parts of the screen. This
way we can later lazily flush only relevant regions to hardware.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reported-by: Da Xue <da@libre.computer>
[Alper: Call video_damage() in video_fill_part(), edit commit message]
Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---
Does video_fill_part() need a video_sync(dev, false) here?

Changes in v5:
- Call video_damage() also in video_fill_part()

 drivers/video/video-uclass.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/video/video-uclass.c b/drivers/video/video-uclass.c
index 447689581668..ebf409d839f0 100644
--- a/drivers/video/video-uclass.c
+++ b/drivers/video/video-uclass.c
@@ -203,6 +203,8 @@ int video_fill_part(struct udevice *dev, int xstart, int ystart, int xend,
 	if (ret)
 		return ret;
 
+	video_damage(dev, xstart, ystart, xend - xstart, yend - ystart);
+
 	return 0;
 }
 
@@ -249,6 +251,8 @@ int video_fill(struct udevice *dev, u32 colour)
 	if (ret)
 		return ret;
 
+	video_damage(dev, 0, 0, priv->xsize, priv->ysize);
+
 	return video_sync(dev, false);
 }
 
-- 
2.40.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
