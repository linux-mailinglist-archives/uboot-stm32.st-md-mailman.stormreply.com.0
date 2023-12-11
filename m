Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC82A80DDDE
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Dec 2023 23:07:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B43E3C6B45E;
	Mon, 11 Dec 2023 22:07:01 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09502C6B45B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 22:07:01 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a1ef2f5ed01so616263466b.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 14:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702332420; x=1702937220;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WZieAwOD2NNljHe77pz/k/wqxwTnG1bIiBYPuEc4BHQ=;
 b=osuX+rFynBxaEjn+++59TimLGeJAETikyq9fQsQhoKZKkYD2RW+Hx3Up5WLr4N1QUO
 7sRCCL0cgd1+BpO0BID8jAvv4PEH29+tU9pCaeolbzJTG+c2ynOaoyiSl6owC97uGcPe
 g8U+YUMEYTgSig3osyv17efsw+kTldBNoQe50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702332420; x=1702937220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WZieAwOD2NNljHe77pz/k/wqxwTnG1bIiBYPuEc4BHQ=;
 b=o4qVxDnWLB/Bhr3o5fN6VcCrKwfUvfpYkABJlU/kMfzqoKk5M8sQbh5S9Z5kP9FT6G
 nYBdgOufDuljLuY5oN/q1w5nx9zRkqs8ovZKTMEU5ES8i+fUPtbQ9WOEgI+7+mfcUXhX
 0OY54cAQJaIm+2YT7y/PfEI58qXRo0HRMWEq6zq3sPJX7J9oiTuo5yNTgR3leeGax/+5
 IQ5HdEUj9OPzA2Ey6+G7Ro/71PSulcbBFAGXF5c75ik3RmqBqWJKzom7xJvAhmKnSvj7
 rDV0YTbz70Mz2ZnjFxRHMOvy4RNfWnX3XmGyOYVUi7qwhQV6yz/T/AMTivhiwOgTHYgl
 fhwg==
X-Gm-Message-State: AOJu0YzOS0zSNwRZXmd2htDX8KHHTBTdpTt1GR6rNOqp2XracfevxAsr
 TNhQTxf/xgqmG7Jq1/TXrfTWVQ==
X-Google-Smtp-Source: AGHT+IFj2wKp0lwxcvqay2Gf96MoWEkBLeUQef556gHD4jhkfZyv2lIXbcK6Xb7aY5POlJ3Gz//eJQ==
X-Received: by 2002:a17:907:7b82:b0:a19:d40a:d22c with SMTP id
 ne2-20020a1709077b8200b00a19d40ad22cmr1518218ejc.248.1702332420654; 
 Mon, 11 Dec 2023 14:07:00 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-54-95-129.retail.telecomitalia.it. [82.54.95.129])
 by smtp.gmail.com with ESMTPSA id
 se13-20020a170907a38d00b00a1f78048f08sm4568276ejc.146.2023.12.11.14.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 14:07:00 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Mon, 11 Dec 2023 23:05:55 +0100
Message-ID: <20231211220643.1073606-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211220643.1073606-1-dario.binacchi@amarulasolutions.com>
References: <20231211220643.1073606-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Anatolij Gustschin <agust@denx.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH v3 5/6] board: stm32f469-disco: add support to
	display
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

Add support to Orise Tech OTM8009A display on stm32f469-disco board.

It was necessary to retrieve the framebuffer address from the device tree
because the address returned by the video-uclass driver pointed to a memory
area that was not usable.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

Changes in v3:
- Replace SDRAM_SIZE constant with global data gd->ram_size.

Changes in v2:
- Add DRAM_SIZE macro.
- Fix frame buffer allocation function so that it is backward compatible
  with boards other than the one it was introduced for (i. e. stm32f469-disco).
  Tested on stm32f469-disco and stm32mp157f-dk2 boards.

 configs/stm32f469-discovery_defconfig | 13 +++++++++++
 drivers/video/stm32/stm32_ltdc.c      | 31 +++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/configs/stm32f469-discovery_defconfig b/configs/stm32f469-discovery_defconfig
index 21c5498466cd..85e795e83e7d 100644
--- a/configs/stm32f469-discovery_defconfig
+++ b/configs/stm32f469-discovery_defconfig
@@ -21,6 +21,7 @@ CONFIG_CMD_GPT=y
 # CONFIG_RANDOM_UUID is not set
 CONFIG_CMD_MMC=y
 # CONFIG_CMD_SETEXPR is not set
+CONFIG_CMD_BMP=y
 CONFIG_CMD_CACHE=y
 CONFIG_CMD_TIMER=y
 # CONFIG_ISO_PARTITION is not set
@@ -40,3 +41,15 @@ CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
 CONFIG_STM32_QSPI=y
+CONFIG_VIDEO=y
+CONFIG_BACKLIGHT_GPIO=y
+CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
+CONFIG_VIDEO_STM32=y
+CONFIG_VIDEO_STM32_DSI=y
+CONFIG_VIDEO_STM32_MAX_XRES=480
+CONFIG_VIDEO_STM32_MAX_YRES=800
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
+CONFIG_DM_REGULATOR=y
+CONFIG_DM_REGULATOR_FIXED=y
diff --git a/drivers/video/stm32/stm32_ltdc.c b/drivers/video/stm32/stm32_ltdc.c
index 6fd90e33919d..4f60ba8ebeeb 100644
--- a/drivers/video/stm32/stm32_ltdc.c
+++ b/drivers/video/stm32/stm32_ltdc.c
@@ -495,6 +495,33 @@ static void stm32_ltdc_set_layer1(struct stm32_ltdc_priv *priv, ulong fb_addr)
 	setbits_le32(priv->regs + LTDC_L1CR, LXCR_LEN);
 }
 
+#if IS_ENABLED(CONFIG_TARGET_STM32F469_DISCOVERY)
+static int stm32_ltdc_alloc_fb(struct udevice *dev)
+{
+	u32 sdram_size = gd->ram_size;
+	struct video_uc_plat *uc_plat = dev_get_uclass_plat(dev);
+	phys_addr_t cpu;
+	dma_addr_t bus;
+	u64 dma_size;
+	int ret;
+
+	ret = dev_get_dma_range(dev, &cpu, &bus, &dma_size);
+	if (ret) {
+		dev_err(dev, "failed to get dma address\n");
+		return ret;
+	}
+
+	uc_plat->base = bus + sdram_size - ALIGN(uc_plat->size, uc_plat->align);
+	return 0;
+}
+#else
+static inline int stm32_ltdc_alloc_fb(struct udevice *dev)
+{
+	/* Delegate framebuffer allocation to video-uclass */
+	return 0;
+}
+#endif
+
 static int stm32_ltdc_probe(struct udevice *dev)
 {
 	struct video_uc_plat *uc_plat = dev_get_uclass_plat(dev);
@@ -605,6 +632,10 @@ static int stm32_ltdc_probe(struct udevice *dev)
 	priv->crop_h = timings.vactive.typ;
 	priv->alpha = 0xFF;
 
+	ret = stm32_ltdc_alloc_fb(dev);
+	if (ret)
+		return ret;
+
 	dev_dbg(dev, "%dx%d %dbpp frame buffer at 0x%lx\n",
 		timings.hactive.typ, timings.vactive.typ,
 		VNBITS(priv->l2bpp), uc_plat->base);
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
