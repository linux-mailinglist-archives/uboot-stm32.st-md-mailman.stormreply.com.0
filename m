Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A507078478A
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Aug 2023 18:27:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D86EC78F73;
	Tue, 22 Aug 2023 16:27:09 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32FC3C6B44B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 13:51:45 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-3feddbb670cso21248935e9.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 06:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692625905; x=1693230705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NHWfOmBWnCfG15vLo7N7Y/b5x/nSoPE0dmgy30xOm9Q=;
 b=rvkBTDGokSsZ+zHSmCyephYHOa1zCgYEH1V/eHcDIaJehG3LF1h3ZetBhv0F1WCnRL
 dg0OqSl4nhT+d01IqkhLNI1FTeIJQeE/FHwY83jActydA9RdIKB97V7VAmOnABjsedPs
 n/m1fNRUpKdpm/TBglBcCWTlhrozxmO+plcVOAjMhNlQQGUGkRo1eq/yHOw8pzfiIQVT
 4G4hJi3ePKSsEYbd1YuMZSkrzN70N+Erw/eeRb2QAdkn4J6xcJyPMEWirh7uNV2erutB
 ZzxtmQOTBV9y19HeQkYKJeCnpReJ2LaLzTJj72ehPZpZqbYfj67OE+MeCC6Yt/m3YILh
 fpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692625905; x=1693230705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NHWfOmBWnCfG15vLo7N7Y/b5x/nSoPE0dmgy30xOm9Q=;
 b=Eio70w3JrSgBSyeFUj1bi/1nUA379e0gg7jcN4wcZPwFEAHidnT/rBaR813+0fp9W0
 oAFBQG5+qeZU+9c7N0fJkgYn85Q67jvv2RdF2E0xDWCP2EAhjNWmKy8Rb4HUivz3reUB
 O4pyEdQ1Fm37jhauHLjZTiOoe11I0ycOhnssA6TzM4tEq54L7s375TWVlfUAsRJaZM9j
 VlSDKfDX8lxXdudvbqX2JEcg1lbJ23gtjt0nk5FzMOQDKOzIjgI7lVmlkmLvWAEYXUPx
 0Dp7kO6/n4+jc2pbFS/dBWb25uRtktTryfj38VYoVl9u6Td2Zs5PtfdeiVAW+JFjq05P
 nB0w==
X-Gm-Message-State: AOJu0Yz1MMNMlyMfkK31qfQoBYGe7HUtYyQctvNR4AOc19jEN646BLjH
 xXQKh5HhnCbQMzvbvcUzI2g=
X-Google-Smtp-Source: AGHT+IF9A6Dqme3W/tV3JyovhEsU6i4A15qi8QyYKIlOrt7P6EPMkzmv+B+4oB2S58BxD/9oTr/SHQ==
X-Received: by 2002:a5d:4988:0:b0:31a:e6c2:770d with SMTP id
 r8-20020a5d4988000000b0031ae6c2770dmr4196623wrq.36.1692625904737; 
 Mon, 21 Aug 2023 06:51:44 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1]) by smtp.gmail.com with ESMTPSA id
 r11-20020a5d4e4b000000b00317b063590fsm12600049wrt.55.2023.08.21.06.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 06:51:44 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: u-boot@lists.denx.de
Date: Mon, 21 Aug 2023 16:51:06 +0300
Message-Id: <20230821135111.3558478-10-alpernebiyasak@gmail.com>
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
Subject: [Uboot-stm32] [PATCH v5 09/13] efi_loader: GOP: Add damage
	notification on BLT
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
UEFI payloads when they BLT data onto the screen.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reported-by: Da Xue <da@libre.computer>
Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
[Alper: Add struct comment for new member]
Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---

Changes in v5:
- Document new vdev field in struct efi_gop_obj comment

Changes in v4:
- Skip damage on EfiBltVideoToBltBuffer

Changes in v3:
- Adapt to always assume DM is used

Changes in v2:
- Remove ifdefs from gop

 lib/efi_loader/efi_gop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/efi_loader/efi_gop.c b/lib/efi_loader/efi_gop.c
index 778b693f983a..db6535e080c4 100644
--- a/lib/efi_loader/efi_gop.c
+++ b/lib/efi_loader/efi_gop.c
@@ -24,6 +24,7 @@ static const efi_guid_t efi_gop_guid = EFI_GRAPHICS_OUTPUT_PROTOCOL_GUID;
  * @ops:	graphical output protocol interface
  * @info:	graphical output mode information
  * @mode:	graphical output mode
+ * @vdev:	backing video device
  * @bpix:	bits per pixel
  * @fb:		frame buffer
  */
@@ -32,6 +33,7 @@ struct efi_gop_obj {
 	struct efi_gop ops;
 	struct efi_gop_mode_info info;
 	struct efi_gop_mode mode;
+	struct udevice *vdev;
 	/* Fields we only have access to during init */
 	u32 bpix;
 	void *fb;
@@ -120,6 +122,7 @@ static __always_inline efi_status_t gop_blt_int(struct efi_gop *this,
 	u32 *fb32 = gopobj->fb;
 	u16 *fb16 = gopobj->fb;
 	struct efi_gop_pixel *buffer = __builtin_assume_aligned(bufferp, 4);
+	bool blt_to_video = (operation != EFI_BLT_VIDEO_TO_BLT_BUFFER);
 
 	if (delta) {
 		/* Check for 4 byte alignment */
@@ -243,6 +246,9 @@ static __always_inline efi_status_t gop_blt_int(struct efi_gop *this,
 		dlineoff += dwidth;
 	}
 
+	if (blt_to_video)
+		video_damage(gopobj->vdev, dx, dy, width, height);
+
 	return EFI_SUCCESS;
 }
 
@@ -548,6 +554,7 @@ efi_status_t efi_gop_register(void)
 	gopobj->info.pixels_per_scanline = col;
 	gopobj->bpix = bpix;
 	gopobj->fb = fb;
+	gopobj->vdev = vdev;
 
 	return EFI_SUCCESS;
 }
-- 
2.40.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
