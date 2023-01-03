Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D6A65EE1B
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 Jan 2023 15:01:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99429C6907D;
	Thu,  5 Jan 2023 14:01:31 +0000 (UTC)
Received: from zulu616.server4you.de (mail.csgraf.de [85.25.223.15])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8AEBC69052
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 21:50:12 +0000 (UTC)
Received: from localhost.localdomain
 (dynamic-092-225-244-121.92.225.pool.telefonica.de [92.225.244.121])
 by csgraf.de (Postfix) with ESMTPSA id 167746080DD2;
 Tue,  3 Jan 2023 22:50:12 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: u-boot@lists.denx.de
Date: Tue,  3 Jan 2023 22:50:04 +0100
Message-Id: <20230103215004.22646-10-agraf@csgraf.de>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230103215004.22646-1-agraf@csgraf.de>
References: <20230103215004.22646-1-agraf@csgraf.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Jan 2023 14:01:29 +0000
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io,
 Matthias Brugger <mbrugger@suse.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>, Da Xue <da@libre.computer>
Subject: [Uboot-stm32] [PATCH v4 9/9] video: Enable VIDEO_DAMAGE for drivers
	that need it
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

Some drivers call video_set_flush_dcache() to indicate that they want to
have the dcache flushed for the frame buffer. These drivers benefit from
our new video damage control, because we can reduce the amount of memory
that gets flushed significantly.

This patch enables video damage control for all device drivers that call
video_set_flush_dcache() to make sure they benefit from it.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 arch/arm/mach-omap2/omap3/Kconfig | 1 +
 arch/arm/mach-sunxi/Kconfig       | 1 +
 drivers/video/Kconfig             | 9 +++++++++
 drivers/video/exynos/Kconfig      | 1 +
 drivers/video/imx/Kconfig         | 1 +
 drivers/video/meson/Kconfig       | 1 +
 drivers/video/rockchip/Kconfig    | 1 +
 drivers/video/stm32/Kconfig       | 1 +
 8 files changed, 16 insertions(+)

diff --git a/arch/arm/mach-omap2/omap3/Kconfig b/arch/arm/mach-omap2/omap3/Kconfig
index 3e97ec2629..ea231f16a2 100644
--- a/arch/arm/mach-omap2/omap3/Kconfig
+++ b/arch/arm/mach-omap2/omap3/Kconfig
@@ -113,6 +113,7 @@ config TARGET_NOKIA_RX51
 	select CMDLINE_TAG
 	select INITRD_TAG
 	select REVISION_TAG
+	select VIDEO_DAMAGE
 
 config TARGET_TAO3530
 	bool "TAO3530"
diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index dbe6005daa..373bf58731 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -790,6 +790,7 @@ config VIDEO_SUNXI
 	depends on !SUN50I_GEN_H6
 	select VIDEO
 	select DISPLAY
+	select VIDEO_DAMAGE
 	imply VIDEO_DT_SIMPLEFB
 	default y
 	---help---
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 472e9c7c61..a186bd8525 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -436,6 +436,7 @@ config VIDEO_LCD_ANX9804
 
 config ATMEL_LCD
 	bool "Atmel LCD panel support"
+	select VIDEO_DAMAGE
 	depends on ARCH_AT91
 
 config ATMEL_LCD_BGR555
@@ -445,6 +446,7 @@ config ATMEL_LCD_BGR555
 
 config VIDEO_BCM2835
 	bool "Display support for BCM2835"
+	select VIDEO_DAMAGE
 	help
 	  The graphics processor already sets up the display so this driver
 	  simply checks the resolution and then sets up the frame buffer with
@@ -554,6 +556,7 @@ source "drivers/video/meson/Kconfig"
 
 config VIDEO_MVEBU
 	bool "Armada XP LCD controller"
+	select VIDEO_DAMAGE
 	---help---
 	Support for the LCD controller integrated in the Marvell
 	Armada XP SoC.
@@ -588,6 +591,7 @@ config NXP_TDA19988
 
 config ATMEL_HLCD
 	bool "Enable ATMEL video support using HLCDC"
+	select VIDEO_DAMAGE
 	help
 	   HLCDC supports video output to an attached LCD panel.
 
@@ -652,6 +656,7 @@ source "drivers/video/stm32/Kconfig"
 config VIDEO_TEGRA20
 	bool "Enable LCD support on Tegra20"
 	depends on OF_CONTROL
+	select VIDEO_DAMAGE
 	help
 	   Tegra20 supports video output to an attached LCD panel as well as
 	   other options such as HDMI. Only the LCD is supported in U-Boot.
@@ -660,6 +665,7 @@ config VIDEO_TEGRA20
 
 config VIDEO_TEGRA124
 	bool "Enable video support on Tegra124"
+	select VIDEO_DAMAGE
 	help
 	   Tegra124 supports many video output options including eDP and
 	   HDMI. At present only eDP is supported by U-Boot. This option
@@ -672,6 +678,7 @@ source "drivers/video/imx/Kconfig"
 
 config VIDEO_MXS
 	bool "Enable video support on i.MX28/i.MX6UL/i.MX7 SoCs"
+	select VIDEO_DAMAGE
 	help
 	  Enable framebuffer driver for i.MX28/i.MX6UL/i.MX7 processors
 
@@ -741,6 +748,7 @@ config VIDEO_DW_MIPI_DSI
 
 config VIDEO_SIMPLE
 	bool "Simple display driver for preconfigured display"
+	select VIDEO_DAMAGE
 	help
 	  Enables a simple generic display driver which utilizes the
 	  simple-framebuffer devicetree bindings.
@@ -759,6 +767,7 @@ config VIDEO_DT_SIMPLEFB
 
 config VIDEO_MCDE_SIMPLE
 	bool "Simple driver for ST-Ericsson MCDE with preconfigured display"
+	select VIDEO_DAMAGE
 	help
 	  Enables a simple display driver for ST-Ericsson MCDE
 	  (Multichannel Display Engine), which reads the configuration from
diff --git a/drivers/video/exynos/Kconfig b/drivers/video/exynos/Kconfig
index 599d19d5ec..66aa11661c 100644
--- a/drivers/video/exynos/Kconfig
+++ b/drivers/video/exynos/Kconfig
@@ -12,6 +12,7 @@ config EXYNOS_DP
 
 config EXYNOS_FB
 	bool "Exynos FIMD support"
+	select VIDEO_DAMAGE
 
 config EXYNOS_MIPI_DSIM
 	bool "Exynos MIPI DSI support"
diff --git a/drivers/video/imx/Kconfig b/drivers/video/imx/Kconfig
index 34e8b64059..50d8b05365 100644
--- a/drivers/video/imx/Kconfig
+++ b/drivers/video/imx/Kconfig
@@ -2,6 +2,7 @@
 config VIDEO_IPUV3
 	bool "i.MX IPUv3 Core video support"
 	depends on VIDEO && (MX5 || MX6)
+	select VIDEO_DAMAGE
 	help
 	  This enables framebuffer driver for i.MX processors working
 	  on the IPUv3(Image Processing Unit) internal graphic processor.
diff --git a/drivers/video/meson/Kconfig b/drivers/video/meson/Kconfig
index 3c2d72d019..70fb75607b 100644
--- a/drivers/video/meson/Kconfig
+++ b/drivers/video/meson/Kconfig
@@ -8,5 +8,6 @@ config VIDEO_MESON
 	bool "Enable Amlogic Meson video support"
 	depends on VIDEO
 	select DISPLAY
+	select VIDEO_DAMAGE
 	help
 	  Enable Amlogic Meson Video Processing Unit video support.
diff --git a/drivers/video/rockchip/Kconfig b/drivers/video/rockchip/Kconfig
index b03866347b..1a3b02cee0 100644
--- a/drivers/video/rockchip/Kconfig
+++ b/drivers/video/rockchip/Kconfig
@@ -11,6 +11,7 @@
 menuconfig VIDEO_ROCKCHIP
 	bool "Enable Rockchip Video Support"
 	depends on VIDEO
+	select VIDEO_DAMAGE
 	help
 	  Rockchip SoCs provide video output capabilities for High-Definition
 	  Multimedia Interface (HDMI), Low-voltage Differential Signalling
diff --git a/drivers/video/stm32/Kconfig b/drivers/video/stm32/Kconfig
index 48066063e4..cce2255706 100644
--- a/drivers/video/stm32/Kconfig
+++ b/drivers/video/stm32/Kconfig
@@ -8,6 +8,7 @@
 menuconfig VIDEO_STM32
 	bool "Enable STM32 video support"
 	depends on VIDEO
+	select VIDEO_DAMAGE
 	help
 	  STM32 supports many video output options including RGB and
 	  DSI. This option enables these supports which can be used on
-- 
2.37.1 (Apple Git-137.1)

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
