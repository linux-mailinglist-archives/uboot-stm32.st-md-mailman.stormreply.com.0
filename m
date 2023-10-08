Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C4C7BCF25
	for <lists+uboot-stm32@lfdr.de>; Sun,  8 Oct 2023 17:46:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1E5BC6C83E;
	Sun,  8 Oct 2023 15:46:03 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B64E9C6C83E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Oct 2023 15:46:02 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-9b9faf05f51so405592166b.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 08 Oct 2023 08:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696779962; x=1697384762;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fY6FlJfVNoPy6YrmmBZZaj6Y9r9HCEihc5HK1yFhXQQ=;
 b=AKZ46EJyn3mbrcX9B88J9zZsVZiZS8kS8fZHdf8YNiEw6V+NWPIlcEXWXkrTq4MR3G
 uLi2zjyGxPvDt2uszirhGB+olWxgyFizjWAJX2pD6kfkmt4iwSi4DlQyVUCFsUtcCXLw
 AP5LtvRFjZlt6OikJxDFeSng5LDs49GEG3Oeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696779962; x=1697384762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fY6FlJfVNoPy6YrmmBZZaj6Y9r9HCEihc5HK1yFhXQQ=;
 b=MP5EInyOrRQJaXwQbopdqW+Uyy8etQNlwSrBOesImako7mr66jRSbgaizi2ATFC++A
 flnI9I23QJFQ32LpAoA7dIdGT4HWkoFblFk6PyB+2GfgC9fDa9Dp1CgTHsnpyJ2+OjG+
 WFpeyHTz0/xt76e6sHURvPGPyC4Erz0gMXGbiGCbtoSV8iTO+1Q4TNAZSj2hrvL/iga2
 ge3aUIsSo3Wpb2cD8qDlEdR8v10wL0EcWnlgEoxoUueh3gDIJ15Xu356Jcrov5xpiN38
 miWwY9PnZKH8f00KCE5H2kKgOKSI+oMZjHLj1zSAue2yGf91YuQOMtndOJwwKaUWDBaX
 RGLA==
X-Gm-Message-State: AOJu0YxvySXtJqjaktBojyM9Weq+tYKL2gAMVTkYMN31geyFOTI5S/LA
 pDNU5Ofaf+nbL6YKCWqdcd9Yvw==
X-Google-Smtp-Source: AGHT+IFa8uy7If46bkn3X+X8IJdmXe+icpv6wVYCVOnxLTC+HAZ2rhZnjDgcispEGT4zirr8EIZhIA==
X-Received: by 2002:a17:907:7887:b0:9b2:ccd8:2d2c with SMTP id
 ku7-20020a170907788700b009b2ccd82d2cmr11653180ejc.34.1696779962307; 
 Sun, 08 Oct 2023 08:46:02 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-50-102-159.retail.telecomitalia.it. [79.50.102.159])
 by smtp.gmail.com with ESMTPSA id
 lc11-20020a170906f90b00b009b9aa8fffdasm5623981ejb.131.2023.10.08.08.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 08:46:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun,  8 Oct 2023 17:44:56 +0200
Message-ID: <20231008154538.1622772-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231008154538.1622772-1-dario.binacchi@amarulasolutions.com>
References: <20231008154538.1622772-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Anatolij Gustschin <agust@denx.de>,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [RFC PATCH v2 4/5] ARM: dts: stm32: support display
	on stm32f469-disco board
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

Furthermore, unlike Linux, the DSI driver requires the LTDC clock to be
properly probed. Hence, the changes made to the DSI node in
stm32f469-disco-u-boot.dtsi.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Add DRAM_SIZE macro.
- Fix frame buffer allocation function so that it is backward compatible
  with boards other than the one it was introduced for (i. e. stm32f469-disco).
  Tested on stm32f469-disco and stm32mp157f-dk2 boards.

 arch/arm/dts/stm32f469-disco-u-boot.dtsi |  4 +++
 configs/stm32f469-discovery_defconfig    | 13 ++++++++++
 drivers/video/stm32/stm32_ltdc.c         | 31 ++++++++++++++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/arch/arm/dts/stm32f469-disco-u-boot.dtsi b/arch/arm/dts/stm32f469-disco-u-boot.dtsi
index 8e781c5a7b23..47ba9fa4a783 100644
--- a/arch/arm/dts/stm32f469-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f469-disco-u-boot.dtsi
@@ -92,7 +92,9 @@
 
 &dsi {
 	clocks = <&rcc 0 STM32F4_APB2_CLOCK(DSI)>,
+		 <&rcc 0 STM32F4_APB2_CLOCK(LTDC)>,
 		 <&clk_hse>;
+	clock-names = "pclk", "px_clk", "ref";
 };
 
 &gpioa {
@@ -140,6 +142,8 @@
 };
 
 &ltdc {
+	bootph-all;
+
 	clocks = <&rcc 0 STM32F4_APB2_CLOCK(LTDC)>;
 };
 
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
index 6fd90e33919d..9054db1d78b3 100644
--- a/drivers/video/stm32/stm32_ltdc.c
+++ b/drivers/video/stm32/stm32_ltdc.c
@@ -495,6 +495,33 @@ static void stm32_ltdc_set_layer1(struct stm32_ltdc_priv *priv, ulong fb_addr)
 	setbits_le32(priv->regs + LTDC_L1CR, LXCR_LEN);
 }
 
+#if IS_ENABLED(CONFIG_TARGET_STM32F469_DISCOVERY)
+static int stm32_ltdc_alloc_fb(struct udevice *dev)
+{
+#define SDRAM_SIZE 0x1000000 /* 128Mbit = 16 Mbyte = 0x1000000 */
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
+	uc_plat->base = bus + SDRAM_SIZE - ALIGN(uc_plat->size, uc_plat->align);
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
2.42.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
