Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E8A78478E
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Aug 2023 18:27:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F4D0C78F7B;
	Tue, 22 Aug 2023 16:27:09 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A637AC6B44C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 13:51:55 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-31965c94001so2890661f8f.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 06:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692625915; x=1693230715;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q4KbQNgBgg/jRM/b8KJaE0YjvGZTzMRikT8MXE6mjwI=;
 b=LXQ9F9oF17Es3W44Ien7NWJ7ymwABfjmSOFUn1nlvsBdcyw9b3O/o8ulQCpUwqhXho
 Lsoff11Pmwlo87siidtGiRDX/BRiaZ8rBVWjS3jgK+U6RDPcwNCfR7otgNlLLaNyAd4w
 BCXHT1+90WvAX/9alOvPUYlvUkP1t/S15/C+bUJWxok5Nf6l5iGthuNMWvZFFiUdQ8yR
 02AJastvoFpsYlAJI+JY69q6OhIhuxvdeDVc81dEOKzKkkEOdENJDmT6pJI4fiWlgwEE
 iSJz97xC4lCSs+y5RPJTJfxE97zWwduKphPAN75dLRw0vnBYyqeXIo4ERx4uO7ku2jHf
 8feQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692625915; x=1693230715;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q4KbQNgBgg/jRM/b8KJaE0YjvGZTzMRikT8MXE6mjwI=;
 b=F5a/LPQL8guEfnSW0OaJo9BJ21vbN8LA9+SwgfbGEmbMMOfxAmPAa3s3MRVGP97BAu
 rR+YC/PUJfG8ZM0CkLB2sQgg7LKEsjQ6dHZxFB5L0pVTq7KCxgMGpyfpRmWF2KuS9WEr
 nwMaEtCPwqW4KCtdCIF/Fh+uFkFMsFaV3vPxsjs9bSaOJUNSOZ8e1OOHFlL6V+TuF1Dg
 +FRh7X7yqEFA+6NGd+YLBfqcaWtU86+G4k/gP9jAQ+xowpiQLh88wmRq5A8Cjx/p3Sj/
 Bf0RzGg6lnfcILwpPGRFb8WleGHr7YMansmKGA+tO0Sjei7tYlSKXSkCm4IugqQq8jzP
 Kj8Q==
X-Gm-Message-State: AOJu0YwEDDd4t3TnXNgi7XcWktLJmAMl3nY8Bbs0LRRzLOFG7Lhd/FMI
 P5FnT7GriFehADavKvw7gHk=
X-Google-Smtp-Source: AGHT+IER2mHBuKBsYnQ3qf+DOtUzSQystkj8v17bWgFVK+zSLUhwLW9BOExvB2cO0RXSrx1vnjzR/w==
X-Received: by 2002:adf:e711:0:b0:317:e542:80a8 with SMTP id
 c17-20020adfe711000000b00317e54280a8mr4968619wrm.15.1692625915025; 
 Mon, 21 Aug 2023 06:51:55 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1]) by smtp.gmail.com with ESMTPSA id
 r11-20020a5d4e4b000000b00317b063590fsm12600049wrt.55.2023.08.21.06.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 06:51:54 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: u-boot@lists.denx.de
Date: Mon, 21 Aug 2023 16:51:10 +0300
Message-Id: <20230821135111.3558478-14-alpernebiyasak@gmail.com>
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
Subject: [Uboot-stm32] [PATCH v5 13/13] video: Enable VIDEO_DAMAGE for
	drivers that need it
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

Some drivers call video_set_flush_dcache() to indicate that they want to
have the dcache flushed for the frame buffer. These drivers benefit from
our new video damage control, because we can reduce the amount of memory
that gets flushed significantly.

This patch enables video damage control for all device drivers that call
video_set_flush_dcache() to make sure they benefit from it.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
[Alper: Add to VIDEO_TIDSS, imply instead of select]
Co-developed-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---

Changes in v5:
- Imply VIDEO_DAMAGE for video drivers instead of selecting it
- Imply VIDEO_DAMAGE also for VIDEO_TIDSS

Changes in v4:
- Add patch "video: Enable VIDEO_DAMAGE for drivers that need it"

 arch/arm/mach-omap2/omap3/Kconfig | 1 +
 arch/arm/mach-sunxi/Kconfig       | 1 +
 drivers/video/Kconfig             | 8 ++++++++
 drivers/video/exynos/Kconfig      | 1 +
 drivers/video/imx/Kconfig         | 1 +
 drivers/video/meson/Kconfig       | 1 +
 drivers/video/rockchip/Kconfig    | 1 +
 drivers/video/stm32/Kconfig       | 1 +
 drivers/video/tegra20/Kconfig     | 1 +
 drivers/video/tidss/Kconfig       | 1 +
 10 files changed, 17 insertions(+)

diff --git a/arch/arm/mach-omap2/omap3/Kconfig b/arch/arm/mach-omap2/omap3/Kconfig
index 671e4791c67f..fd858f7b50f2 100644
--- a/arch/arm/mach-omap2/omap3/Kconfig
+++ b/arch/arm/mach-omap2/omap3/Kconfig
@@ -113,6 +113,7 @@ config TARGET_NOKIA_RX51
 	select CMDLINE_TAG
 	select INITRD_TAG
 	select REVISION_TAG
+	imply VIDEO_DAMAGE
 
 config TARGET_TAO3530
 	bool "TAO3530"
diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 9d5df2c10273..fb4478ea32e8 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -813,6 +813,7 @@ config VIDEO_SUNXI
 	depends on !SUN50I_GEN_H6
 	select VIDEO
 	select DISPLAY
+	imply VIDEO_DAMAGE
 	imply VIDEO_DT_SIMPLEFB
 	default y
 	---help---
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index b3fbd9d7d9ca..185dbb1f8390 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -499,6 +499,7 @@ config VIDEO_LCD_ANX9804
 
 config ATMEL_LCD
 	bool "Atmel LCD panel support"
+	imply VIDEO_DAMAGE
 	depends on ARCH_AT91
 
 config ATMEL_LCD_BGR555
@@ -508,6 +509,7 @@ config ATMEL_LCD_BGR555
 
 config VIDEO_BCM2835
 	bool "Display support for BCM2835"
+	imply VIDEO_DAMAGE
 	help
 	  The graphics processor already sets up the display so this driver
 	  simply checks the resolution and then sets up the frame buffer with
@@ -654,6 +656,7 @@ source "drivers/video/meson/Kconfig"
 
 config VIDEO_MVEBU
 	bool "Armada XP LCD controller"
+	imply VIDEO_DAMAGE
 	---help---
 	Support for the LCD controller integrated in the Marvell
 	Armada XP SoC.
@@ -688,6 +691,7 @@ config NXP_TDA19988
 
 config ATMEL_HLCD
 	bool "Enable ATMEL video support using HLCDC"
+	imply VIDEO_DAMAGE
 	help
 	   HLCDC supports video output to an attached LCD panel.
 
@@ -764,6 +768,7 @@ source "drivers/video/tidss/Kconfig"
 
 config VIDEO_TEGRA124
 	bool "Enable video support on Tegra124"
+	imply VIDEO_DAMAGE
 	help
 	   Tegra124 supports many video output options including eDP and
 	   HDMI. At present only eDP is supported by U-Boot. This option
@@ -778,6 +783,7 @@ source "drivers/video/imx/Kconfig"
 
 config VIDEO_MXS
 	bool "Enable video support on i.MX28/i.MX6UL/i.MX7 SoCs"
+	imply VIDEO_DAMAGE
 	help
 	  Enable framebuffer driver for i.MX28/i.MX6UL/i.MX7 processors
 
@@ -840,6 +846,7 @@ config VIDEO_DW_MIPI_DSI
 
 config VIDEO_SIMPLE
 	bool "Simple display driver for preconfigured display"
+	imply VIDEO_DAMAGE
 	help
 	  Enables a simple generic display driver which utilizes the
 	  simple-framebuffer devicetree bindings.
@@ -858,6 +865,7 @@ config VIDEO_DT_SIMPLEFB
 
 config VIDEO_MCDE_SIMPLE
 	bool "Simple driver for ST-Ericsson MCDE with preconfigured display"
+	imply VIDEO_DAMAGE
 	help
 	  Enables a simple display driver for ST-Ericsson MCDE
 	  (Multichannel Display Engine), which reads the configuration from
diff --git a/drivers/video/exynos/Kconfig b/drivers/video/exynos/Kconfig
index 599d19d5ecc2..a2cf752aac03 100644
--- a/drivers/video/exynos/Kconfig
+++ b/drivers/video/exynos/Kconfig
@@ -12,6 +12,7 @@ config EXYNOS_DP
 
 config EXYNOS_FB
 	bool "Exynos FIMD support"
+	imply VIDEO_DAMAGE
 
 config EXYNOS_MIPI_DSIM
 	bool "Exynos MIPI DSI support"
diff --git a/drivers/video/imx/Kconfig b/drivers/video/imx/Kconfig
index 34e8b640595b..5db3e5c0499e 100644
--- a/drivers/video/imx/Kconfig
+++ b/drivers/video/imx/Kconfig
@@ -2,6 +2,7 @@
 config VIDEO_IPUV3
 	bool "i.MX IPUv3 Core video support"
 	depends on VIDEO && (MX5 || MX6)
+	imply VIDEO_DAMAGE
 	help
 	  This enables framebuffer driver for i.MX processors working
 	  on the IPUv3(Image Processing Unit) internal graphic processor.
diff --git a/drivers/video/meson/Kconfig b/drivers/video/meson/Kconfig
index 3c2d72d019b8..fcf486ca0a3a 100644
--- a/drivers/video/meson/Kconfig
+++ b/drivers/video/meson/Kconfig
@@ -8,5 +8,6 @@ config VIDEO_MESON
 	bool "Enable Amlogic Meson video support"
 	depends on VIDEO
 	select DISPLAY
+	imply VIDEO_DAMAGE
 	help
 	  Enable Amlogic Meson Video Processing Unit video support.
diff --git a/drivers/video/rockchip/Kconfig b/drivers/video/rockchip/Kconfig
index 01804dcb1cc8..0f4550a29e38 100644
--- a/drivers/video/rockchip/Kconfig
+++ b/drivers/video/rockchip/Kconfig
@@ -11,6 +11,7 @@
 menuconfig VIDEO_ROCKCHIP
 	bool "Enable Rockchip Video Support"
 	depends on VIDEO
+	imply VIDEO_DAMAGE
 	help
 	  Rockchip SoCs provide video output capabilities for High-Definition
 	  Multimedia Interface (HDMI), Low-voltage Differential Signalling
diff --git a/drivers/video/stm32/Kconfig b/drivers/video/stm32/Kconfig
index 48066063e4c5..c354c402c288 100644
--- a/drivers/video/stm32/Kconfig
+++ b/drivers/video/stm32/Kconfig
@@ -8,6 +8,7 @@
 menuconfig VIDEO_STM32
 	bool "Enable STM32 video support"
 	depends on VIDEO
+	imply VIDEO_DAMAGE
 	help
 	  STM32 supports many video output options including RGB and
 	  DSI. This option enables these supports which can be used on
diff --git a/drivers/video/tegra20/Kconfig b/drivers/video/tegra20/Kconfig
index f5c4843e1191..2232b0b3ff53 100644
--- a/drivers/video/tegra20/Kconfig
+++ b/drivers/video/tegra20/Kconfig
@@ -1,6 +1,7 @@
 config VIDEO_TEGRA20
 	bool "Enable Display Controller support on Tegra20 and Tegra 30"
 	depends on OF_CONTROL
+	imply VIDEO_DAMAGE
 	help
 	   T20/T30 support video output to an attached LCD panel as well as
 	   other options such as HDMI. Only the LCD is supported in U-Boot.
diff --git a/drivers/video/tidss/Kconfig b/drivers/video/tidss/Kconfig
index 95086f3a5d66..3291b3ceb8d5 100644
--- a/drivers/video/tidss/Kconfig
+++ b/drivers/video/tidss/Kconfig
@@ -11,6 +11,7 @@
 menuconfig VIDEO_TIDSS
 	bool "Enable TIDSS video support"
 	depends on VIDEO
+	imply VIDEO_DAMAGE
 	help
 	  TIDSS supports  video output options LVDS and
 	  DPI . This option enables these supports which can be used on
-- 
2.40.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
