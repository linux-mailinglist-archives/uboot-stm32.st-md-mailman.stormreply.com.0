Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF673781ED1
	for <lists+uboot-stm32@lfdr.de>; Sun, 20 Aug 2023 18:24:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50390C6B44E;
	Sun, 20 Aug 2023 16:24:52 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03A25C6B444
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Aug 2023 16:24:50 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-99cce6f7de2so345189066b.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Aug 2023 09:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692548690; x=1693153490;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M+0bDMv7y1bManA0WwHVCJ4esmff4eVaMiBWsimTQ5U=;
 b=Uzyp1y2XVshpnosLXE8DqlO42t9m6CUmqnKAaP1H8cbXfIHm6b4NWDKnFuAXxvLjxi
 rL15vGkLqhwS4HODM/o6k2VSS810th6IXKdm6yU5T4thGrqVTOtgx4e6/Fomxkpllcaq
 kNxSeKuG2gtwJ9DvrkH0vu9wcB3FRPBG95JpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692548690; x=1693153490;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M+0bDMv7y1bManA0WwHVCJ4esmff4eVaMiBWsimTQ5U=;
 b=YmGcrhM8PXLI2b5+FKGEiy+6X7X43yao8FXiM2CIyGA5WqxfoxVEpM6tJCBid6op0p
 10HJ2Isbamj8nrPC5/FZ9StM8cXmQaKP8+XP+aKhpvz7MnoSQz+vpSM96IhpTQo7qSAU
 ET8DpHzq2YgMahIaSA+14EhtpSlSklUVP0Wn05/yMAuvwNDRvqXn4XA9Z1Fsnik7Hodc
 el+MmcGu4nNh51jzHtwmDJ+PW44oeDOK3bW+c/4ZhOK3a5PDZHtqg+B5LzCdnkGX1gob
 AmhbFj6cLNDHGH8zUJu6shD7KZB35aQ7jNPqd2NWLlDa/fVckGgcr6jBlQxGKNYdcsNa
 b4gw==
X-Gm-Message-State: AOJu0Yz/C/Le/uiyr5qRDdB1P8iC0NjHnuk+QcSmOuIeOoQJND8gCxY9
 snUX1RJm4zbvsthOSBIVSbGQvA==
X-Google-Smtp-Source: AGHT+IF1iYCAXgnyoofnd5pgBsdPhMjFPf5hVYCl60a2NjAs0CVpL1jEUNg4Z+KZPfpJt5emsZ4ROw==
X-Received: by 2002:a17:906:315b:b0:988:9b29:5653 with SMTP id
 e27-20020a170906315b00b009889b295653mr3170869eje.77.1692548690398; 
 Sun, 20 Aug 2023 09:24:50 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-180-23-204.pool80180.interbusiness.it. [80.180.23.204])
 by smtp.gmail.com with ESMTPSA id
 sd20-20020a170906ce3400b0096f6a131b9fsm4844859ejb.23.2023.08.20.09.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Aug 2023 09:24:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun, 20 Aug 2023 18:24:44 +0200
Message-Id: <20230820162446.616442-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Vikas Manocha <vikas.manocha@st.com>,
 yannick fertre <yannick.fertre@st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 1/3] configs: stm32f746-disco: limit
	resolution to 480x272
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

The patch fixes the y-resolution, which was causing the creation of a
framebuffer larger than actually needed, resulting in memory waste.

Fixes: cc1b0e7b8e55b ("board: Add display to STM32F746 SoC discovery board")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 configs/stm32f746-disco_defconfig     | 2 +-
 configs/stm32f746-disco_spl_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/stm32f746-disco_defconfig b/configs/stm32f746-disco_defconfig
index bb98ee307a6e..8403679d7fa6 100644
--- a/configs/stm32f746-disco_defconfig
+++ b/configs/stm32f746-disco_defconfig
@@ -59,7 +59,7 @@ CONFIG_VIDEO=y
 CONFIG_BACKLIGHT_GPIO=y
 CONFIG_VIDEO_STM32=y
 CONFIG_VIDEO_STM32_MAX_XRES=480
-CONFIG_VIDEO_STM32_MAX_YRES=640
+CONFIG_VIDEO_STM32_MAX_YRES=272
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/stm32f746-disco_spl_defconfig b/configs/stm32f746-disco_spl_defconfig
index 84aaec1e3390..50c2a36784af 100644
--- a/configs/stm32f746-disco_spl_defconfig
+++ b/configs/stm32f746-disco_spl_defconfig
@@ -85,7 +85,7 @@ CONFIG_VIDEO=y
 CONFIG_BACKLIGHT_GPIO=y
 CONFIG_VIDEO_STM32=y
 CONFIG_VIDEO_STM32_MAX_XRES=480
-CONFIG_VIDEO_STM32_MAX_YRES=640
+CONFIG_VIDEO_STM32_MAX_YRES=272
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
