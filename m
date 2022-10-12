Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B5C5FCBC0
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Oct 2022 21:58:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA18DC640F2;
	Wed, 12 Oct 2022 19:58:32 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51CC1C640F3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 19:58:31 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 874CE1FF35;
 Wed, 12 Oct 2022 19:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665604710; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vkJT8w1B9rFdi9bwv3HK828iW3C6/J68K6nuBkkLsac=;
 b=rYXPITtWsi1JrQrLwI2VrUiVq8jowpWDaWECKbK8KKNevBRyMSJOiysc1p6Y+aQsIoWfMX
 JjAG3MnTRjCu3GUZBS7JoFj2BNX7p18cJinf/GgelaK9vxfNSbcOUw4WhCQcGzT5S9cFsd
 1/7lfjz2MbBo1AIUaVS3Q0i6V6kLtDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665604710;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vkJT8w1B9rFdi9bwv3HK828iW3C6/J68K6nuBkkLsac=;
 b=1ouBY7jMDehrsTAWNqfLSdvZWiuq9Fev5OsQOFVs7ijmNq7rBZUS8WT9R+malJzfZjcNQd
 CqTtIy2NfvcJ+LAQ==
Received: from naga.suse.cz (unknown [10.100.224.114])
 by relay2.suse.de (Postfix) with ESMTP id E0F042C153;
 Wed, 12 Oct 2022 19:58:29 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: u-boot@lists.denx.de
Date: Wed, 12 Oct 2022 21:57:59 +0200
Message-Id: <e2a53ad0b2112945b159b66d20d96dd811b4e525.1665604425.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1665604425.git.msuchanek@suse.de>
References: <cover.1664314042.git.msuchanek@suse.de>
 <cover.1665604425.git.msuchanek@suse.de>
MIME-Version: 1.0
Cc: Peng Fan <peng.fan@nxp.com>, Liviu Dudau <liviu.dudau@foss.arm.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 "moderated list:ARM STM STM32MP" <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Mark Kettenis <kettenis@openbsd.org>,
 Sean Anderson <sean.anderson@seco.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ramon Fried <rfried.dev@gmail.com>,
 Peter Robinson <pbrobinson@gmail.com>, Anatolij Gustschin <agust@denx.de>,
 Michal Suchanek <msuchanek@suse.de>, Heiko Schocher <hs@denx.de>,
 Matthias Brugger <mbrugger@suse.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Tom Warren <twarren@nvidia.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Andrew Scull <ascull@google.com>
Subject: [Uboot-stm32] [PATCH v6 10/20] dm: treewide: Use
	uclass_first_device_err when accessing one device
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

There is a number of users that use uclass_first_device to access the
first and (assumed) only device in uclass.

Some check the return value of uclass_first_device and also that a
device was returned which is exactly what uclass_first_device_err does.

Some are not checking that a device was returned and can potentially
crash if no device exists in the uclass. Finally there is one that
returns NULL on error either way.

Convert all of these to use uclass_first_device_err instead, the return
value will be removed from uclass_first_device in a later patch.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
Reviewed-by: Simon Glass <sjg@chromium.org>
---
v6: drop errno_str
---
 arch/arm/mach-omap2/am33xx/board.c        |  4 ++--
 arch/x86/cpu/broadwell/cpu.c              |  4 +---
 arch/x86/cpu/intel_common/cpu.c           |  4 +---
 arch/x86/lib/pinctrl_ich6.c               |  4 +---
 board/intel/cougarcanyon2/cougarcanyon2.c |  4 +---
 drivers/mmc/omap_hsmmc.c                  |  2 +-
 drivers/serial/serial-uclass.c            |  2 +-
 drivers/serial/serial_bcm283x_mu.c        |  2 +-
 drivers/serial/serial_bcm283x_pl011.c     |  2 +-
 drivers/sysreset/sysreset_ast.c           |  2 +-
 drivers/video/exynos/exynos_fb.c          | 14 +++-----------
 drivers/video/mali_dp.c                   |  2 +-
 drivers/video/stm32/stm32_dsi.c           |  2 +-
 drivers/video/tegra124/dp.c               |  4 ++--
 lib/acpi/acpi_table.c                     |  2 +-
 lib/efi_loader/efi_gop.c                  |  2 +-
 net/eth-uclass.c                          |  4 ++--
 test/boot/bootmeth.c                      |  2 +-
 test/dm/acpi.c                            | 14 +++++++-------
 test/dm/devres.c                          |  4 ++--
 test/dm/i2c.c                             |  8 ++++----
 test/dm/virtio_device.c                   |  8 ++++----
 test/dm/virtio_rng.c                      |  2 +-
 test/fuzz/cmd_fuzz.c                      |  2 +-
 test/fuzz/virtio.c                        |  2 +-
 25 files changed, 43 insertions(+), 59 deletions(-)

diff --git a/arch/arm/mach-omap2/am33xx/board.c b/arch/arm/mach-omap2/am33xx/board.c
index 7f1b84e466..f393ff9144 100644
--- a/arch/arm/mach-omap2/am33xx/board.c
+++ b/arch/arm/mach-omap2/am33xx/board.c
@@ -265,8 +265,8 @@ int arch_misc_init(void)
 	struct udevice *dev;
 	int ret;
 
-	ret = uclass_first_device(UCLASS_MISC, &dev);
-	if (ret || !dev)
+	ret = uclass_first_device_err(UCLASS_MISC, &dev);
+	if (ret)
 		return ret;
 
 #if defined(CONFIG_DM_ETH) && defined(CONFIG_USB_ETHER)
diff --git a/arch/x86/cpu/broadwell/cpu.c b/arch/x86/cpu/broadwell/cpu.c
index 2adcf4b242..7877961451 100644
--- a/arch/x86/cpu/broadwell/cpu.c
+++ b/arch/x86/cpu/broadwell/cpu.c
@@ -31,11 +31,9 @@ static int broadwell_init_cpu(void *ctx, struct event *event)
 	int ret;
 
 	/* Start up the LPC so we have serial */
-	ret = uclass_first_device(UCLASS_LPC, &dev);
+	ret = uclass_first_device_err(UCLASS_LPC, &dev);
 	if (ret)
 		return ret;
-	if (!dev)
-		return -ENODEV;
 	ret = cpu_set_flex_ratio_to_tdp_nominal();
 	if (ret)
 		return ret;
diff --git a/arch/x86/cpu/intel_common/cpu.c b/arch/x86/cpu/intel_common/cpu.c
index 96d05e2eb3..8f489e6c65 100644
--- a/arch/x86/cpu/intel_common/cpu.c
+++ b/arch/x86/cpu/intel_common/cpu.c
@@ -61,11 +61,9 @@ int cpu_common_init(void)
 	/* Early chipset init required before RAM init can work */
 	uclass_first_device(UCLASS_NORTHBRIDGE, &dev);
 
-	ret = uclass_first_device(UCLASS_LPC, &lpc);
+	ret = uclass_first_device_err(UCLASS_LPC, &lpc);
 	if (ret)
 		return ret;
-	if (!lpc)
-		return -ENODEV;
 
 	/* Cause the SATA device to do its early init */
 	uclass_first_device(UCLASS_AHCI, &dev);
diff --git a/arch/x86/lib/pinctrl_ich6.c b/arch/x86/lib/pinctrl_ich6.c
index fd5e311b29..c93f245845 100644
--- a/arch/x86/lib/pinctrl_ich6.c
+++ b/arch/x86/lib/pinctrl_ich6.c
@@ -160,11 +160,9 @@ static int ich6_pinctrl_probe(struct udevice *dev)
 	u32 iobase = -1;
 
 	debug("%s: start\n", __func__);
-	ret = uclass_first_device(UCLASS_PCH, &pch);
+	ret = uclass_first_device_err(UCLASS_PCH, &pch);
 	if (ret)
 		return ret;
-	if (!pch)
-		return -ENODEV;
 
 	/*
 	 * Get the memory/io base address to configure every pins.
diff --git a/board/intel/cougarcanyon2/cougarcanyon2.c b/board/intel/cougarcanyon2/cougarcanyon2.c
index ce11eae59d..7f61ef8b36 100644
--- a/board/intel/cougarcanyon2/cougarcanyon2.c
+++ b/board/intel/cougarcanyon2/cougarcanyon2.c
@@ -21,11 +21,9 @@ int board_early_init_f(void)
 	struct udevice *pch;
 	int ret;
 
-	ret = uclass_first_device(UCLASS_PCH, &pch);
+	ret = uclass_first_device_err(UCLASS_PCH, &pch);
 	if (ret)
 		return ret;
-	if (!pch)
-		return -ENODEV;
 
 	/* Initialize LPC interface to turn on superio chipset decode range */
 	dm_pci_write_config16(pch, LPC_IO_DEC, COMA_DEC_RANGE | COMB_DEC_RANGE);
diff --git a/drivers/mmc/omap_hsmmc.c b/drivers/mmc/omap_hsmmc.c
index b2f4a4e721..a2595d19e7 100644
--- a/drivers/mmc/omap_hsmmc.c
+++ b/drivers/mmc/omap_hsmmc.c
@@ -644,7 +644,7 @@ static int omap_hsmmc_execute_tuning(struct udevice *dev, uint opcode)
 	      ((mmc->selected_mode == UHS_SDR50) && (val & CAPA2_TSDR50))))
 		return 0;
 
-	ret = uclass_first_device(UCLASS_THERMAL, &thermal_dev);
+	ret = uclass_first_device_err(UCLASS_THERMAL, &thermal_dev);
 	if (ret) {
 		printf("Couldn't get thermal device for tuning\n");
 		return ret;
diff --git a/drivers/serial/serial-uclass.c b/drivers/serial/serial-uclass.c
index da3e1eb3ab..83cda1f204 100644
--- a/drivers/serial/serial-uclass.c
+++ b/drivers/serial/serial-uclass.c
@@ -143,7 +143,7 @@ static void serial_find_console_or_panic(void)
 #else
 		if (!uclass_get_device_by_seq(UCLASS_SERIAL, INDEX, &dev) ||
 		    !uclass_get_device(UCLASS_SERIAL, INDEX, &dev) ||
-		    (!uclass_first_device(UCLASS_SERIAL, &dev) && dev)) {
+		    !uclass_first_device_err(UCLASS_SERIAL, &dev)) {
 			gd->cur_serial_dev = dev;
 			return;
 		}
diff --git a/drivers/serial/serial_bcm283x_mu.c b/drivers/serial/serial_bcm283x_mu.c
index 493a42b4cc..12cbcb9858 100644
--- a/drivers/serial/serial_bcm283x_mu.c
+++ b/drivers/serial/serial_bcm283x_mu.c
@@ -147,7 +147,7 @@ static bool bcm283x_is_serial_muxed(void)
 	int serial_gpio = 15;
 	struct udevice *dev;
 
-	if (uclass_first_device(UCLASS_PINCTRL, &dev) || !dev)
+	if (uclass_first_device_err(UCLASS_PINCTRL, &dev))
 		return false;
 
 	if (pinctrl_get_gpio_mux(dev, 0, serial_gpio) != BCM2835_GPIO_ALT5)
diff --git a/drivers/serial/serial_bcm283x_pl011.c b/drivers/serial/serial_bcm283x_pl011.c
index fe746294cd..7d172cdac0 100644
--- a/drivers/serial/serial_bcm283x_pl011.c
+++ b/drivers/serial/serial_bcm283x_pl011.c
@@ -24,7 +24,7 @@ static bool bcm283x_is_serial_muxed(void)
 	int serial_gpio = 15;
 	struct udevice *dev;
 
-	if (uclass_first_device(UCLASS_PINCTRL, &dev) || !dev)
+	if (uclass_first_device_err(UCLASS_PINCTRL, &dev))
 		return false;
 
 	if (pinctrl_get_gpio_mux(dev, 0, serial_gpio) != BCM2835_GPIO_ALT0)
diff --git a/drivers/sysreset/sysreset_ast.c b/drivers/sysreset/sysreset_ast.c
index d747ed00a7..92fad96871 100644
--- a/drivers/sysreset/sysreset_ast.c
+++ b/drivers/sysreset/sysreset_ast.c
@@ -18,7 +18,7 @@ static int ast_sysreset_request(struct udevice *dev, enum sysreset_t type)
 {
 	struct udevice *wdt;
 	u32 reset_mode;
-	int ret = uclass_first_device(UCLASS_WDT, &wdt);
+	int ret = uclass_first_device_err(UCLASS_WDT, &wdt);
 
 	if (ret)
 		return ret;
diff --git a/drivers/video/exynos/exynos_fb.c b/drivers/video/exynos/exynos_fb.c
index 69992b3c2b..86970a6d5d 100644
--- a/drivers/video/exynos/exynos_fb.c
+++ b/drivers/video/exynos/exynos_fb.c
@@ -640,25 +640,17 @@ static int exynos_fb_probe(struct udevice *dev)
 #endif
 	exynos_fimd_lcd_init(dev);
 
-	ret = uclass_first_device(UCLASS_PANEL, &panel);
+	ret = uclass_first_device_err(UCLASS_PANEL, &panel);
 	if (ret) {
-		printf("LCD panel failed to probe\n");
+		printf("%s: LCD panel failed to probe %d\n", __func__, ret);
 		return ret;
 	}
-	if (!panel) {
-		printf("LCD panel not found\n");
-		return -ENODEV;
-	}
 
-	ret = uclass_first_device(UCLASS_DISPLAY, &dp);
+	ret = uclass_first_device_err(UCLASS_DISPLAY, &dp);
 	if (ret) {
 		debug("%s: Display device error %d\n", __func__, ret);
 		return ret;
 	}
-	if (!dev) {
-		debug("%s: Display device missing\n", __func__);
-		return -ENODEV;
-	}
 	ret = display_enable(dp, 18, NULL);
 	if (ret) {
 		debug("%s: Display enable error %d\n", __func__, ret);
diff --git a/drivers/video/mali_dp.c b/drivers/video/mali_dp.c
index ba1ddd64e0..cbcdb99e1f 100644
--- a/drivers/video/mali_dp.c
+++ b/drivers/video/mali_dp.c
@@ -244,7 +244,7 @@ static int malidp_update_timings_from_edid(struct udevice *dev,
 	struct udevice *disp_dev;
 	int err;
 
-	err = uclass_first_device(UCLASS_DISPLAY, &disp_dev);
+	err = uclass_first_device_err(UCLASS_DISPLAY, &disp_dev);
 	if (err)
 		return err;
 
diff --git a/drivers/video/stm32/stm32_dsi.c b/drivers/video/stm32/stm32_dsi.c
index 5871ac7c4f..e6347bb8da 100644
--- a/drivers/video/stm32/stm32_dsi.c
+++ b/drivers/video/stm32/stm32_dsi.c
@@ -346,7 +346,7 @@ static int stm32_dsi_attach(struct udevice *dev)
 	struct display_timing timings;
 	int ret;
 
-	ret = uclass_first_device(UCLASS_PANEL, &priv->panel);
+	ret = uclass_first_device_err(UCLASS_PANEL, &priv->panel);
 	if (ret) {
 		dev_err(dev, "panel device error %d\n", ret);
 		return ret;
diff --git a/drivers/video/tegra124/dp.c b/drivers/video/tegra124/dp.c
index ee4f09a0c4..b27b1633ba 100644
--- a/drivers/video/tegra124/dp.c
+++ b/drivers/video/tegra124/dp.c
@@ -1494,8 +1494,8 @@ int tegra_dp_enable(struct udevice *dev, int panel_bpp,
 		return -ENOLINK;
 	}
 
-	ret = uclass_first_device(UCLASS_VIDEO_BRIDGE, &sor);
-	if (ret || !sor) {
+	ret = uclass_first_device_err(UCLASS_VIDEO_BRIDGE, &sor);
+	if (ret) {
 		debug("dp: failed to find SOR device: ret=%d\n", ret);
 		return ret;
 	}
diff --git a/lib/acpi/acpi_table.c b/lib/acpi/acpi_table.c
index f8642f9942..7c4189e243 100644
--- a/lib/acpi/acpi_table.c
+++ b/lib/acpi/acpi_table.c
@@ -40,7 +40,7 @@ int acpi_create_dmar(struct acpi_dmar *dmar, enum dmar_flags flags)
 	struct udevice *cpu;
 	int ret;
 
-	ret = uclass_first_device(UCLASS_CPU, &cpu);
+	ret = uclass_first_device_err(UCLASS_CPU, &cpu);
 	if (ret)
 		return log_msg_ret("cpu", ret);
 	ret = cpu_get_info(cpu, &info);
diff --git a/lib/efi_loader/efi_gop.c b/lib/efi_loader/efi_gop.c
index 5908b5c646..20bd7fff08 100644
--- a/lib/efi_loader/efi_gop.c
+++ b/lib/efi_loader/efi_gop.c
@@ -482,7 +482,7 @@ efi_status_t efi_gop_register(void)
 	struct video_priv *priv;
 
 	/* We only support a single video output device for now */
-	if (uclass_first_device(UCLASS_VIDEO, &vdev) || !vdev) {
+	if (uclass_first_device_err(UCLASS_VIDEO, &vdev)) {
 		debug("WARNING: No video device\n");
 		return EFI_SUCCESS;
 	}
diff --git a/net/eth-uclass.c b/net/eth-uclass.c
index 0f6b45b002..8c3f9cc31b 100644
--- a/net/eth-uclass.c
+++ b/net/eth-uclass.c
@@ -91,8 +91,8 @@ struct udevice *eth_get_dev(void)
 		eth_errno = uclass_get_device_by_seq(UCLASS_ETH, 0,
 						     &uc_priv->current);
 		if (eth_errno)
-			eth_errno = uclass_first_device(UCLASS_ETH,
-							&uc_priv->current);
+			eth_errno = uclass_first_device_err(UCLASS_ETH,
+							    &uc_priv->current);
 	}
 	return uc_priv->current;
 }
diff --git a/test/boot/bootmeth.c b/test/boot/bootmeth.c
index fb62731339..f0b5ab9adb 100644
--- a/test/boot/bootmeth.c
+++ b/test/boot/bootmeth.c
@@ -156,7 +156,7 @@ static int bootmeth_state(struct unit_test_state *uts)
 	struct udevice *dev;
 	char buf[50];
 
-	ut_assertok(uclass_first_device(UCLASS_BOOTMETH, &dev));
+	ut_assertok(uclass_first_device_err(UCLASS_BOOTMETH, &dev));
 	ut_assertnonnull(dev);
 
 	ut_assertok(bootmeth_get_state_desc(dev, buf, sizeof(buf)));
diff --git a/test/dm/acpi.c b/test/dm/acpi.c
index edad91329f..9634fc2e90 100644
--- a/test/dm/acpi.c
+++ b/test/dm/acpi.c
@@ -169,28 +169,28 @@ static int dm_test_acpi_get_name(struct unit_test_state *uts)
 	ut_asserteq_str("GHIJ", name);
 
 	/* Test getting the name from acpi_device_get_name() */
-	ut_assertok(uclass_first_device(UCLASS_I2C, &i2c));
+	ut_assertok(uclass_first_device_err(UCLASS_I2C, &i2c));
 	ut_assertok(acpi_get_name(i2c, name));
 	ut_asserteq_str("I2C0", name);
 
-	ut_assertok(uclass_first_device(UCLASS_SPI, &spi));
+	ut_assertok(uclass_first_device_err(UCLASS_SPI, &spi));
 	ut_assertok(acpi_get_name(spi, name));
 	ut_asserteq_str("SPI0", name);
 
 	/* ACPI doesn't know about the timer */
-	ut_assertok(uclass_first_device(UCLASS_TIMER, &timer));
+	ut_assertok(uclass_first_device_err(UCLASS_TIMER, &timer));
 	ut_asserteq(-ENOENT, acpi_get_name(timer, name));
 
 	/* May as well test the rest of the cases */
-	ut_assertok(uclass_first_device(UCLASS_SOUND, &sound));
+	ut_assertok(uclass_first_device_err(UCLASS_SOUND, &sound));
 	ut_assertok(acpi_get_name(sound, name));
 	ut_asserteq_str("HDAS", name);
 
-	ut_assertok(uclass_first_device(UCLASS_PCI, &pci));
+	ut_assertok(uclass_first_device_err(UCLASS_PCI, &pci));
 	ut_assertok(acpi_get_name(pci, name));
 	ut_asserteq_str("PCI0", name);
 
-	ut_assertok(uclass_first_device(UCLASS_ROOT, &root));
+	ut_assertok(uclass_first_device_err(UCLASS_ROOT, &root));
 	ut_assertok(acpi_get_name(root, name));
 	ut_asserteq_str("\\_SB", name);
 
@@ -219,7 +219,7 @@ static int dm_test_acpi_create_dmar(struct unit_test_state *uts)
 	struct acpi_dmar dmar;
 	struct udevice *cpu;
 
-	ut_assertok(uclass_first_device(UCLASS_CPU, &cpu));
+	ut_assertok(uclass_first_device_err(UCLASS_CPU, &cpu));
 	ut_assertnonnull(cpu);
 	ut_assertok(acpi_create_dmar(&dmar, DMAR_INTR_REMAP));
 	ut_asserteq(DMAR_INTR_REMAP, dmar.flags);
diff --git a/test/dm/devres.c b/test/dm/devres.c
index 524114c833..3df0f64362 100644
--- a/test/dm/devres.c
+++ b/test/dm/devres.c
@@ -165,8 +165,8 @@ static int dm_test_devres_phase(struct unit_test_state *uts)
 	ut_asserteq(TEST_DEVRES_SIZE + TEST_DEVRES_SIZE3, stats.total_size);
 
 	/* Probing the device should add one allocation */
-	ut_assertok(uclass_first_device(UCLASS_TEST_DEVRES, &dev));
-	ut_assert(dev != NULL);
+	ut_assertok(uclass_first_device_err(UCLASS_TEST_DEVRES, &dev));
+	ut_assertnonnull(dev);
 	devres_get_stats(dev, &stats);
 	ut_asserteq(3, stats.allocs);
 	ut_asserteq(TEST_DEVRES_SIZE + TEST_DEVRES_SIZE2 + TEST_DEVRES_SIZE3,
diff --git a/test/dm/i2c.c b/test/dm/i2c.c
index 74b2097195..b46a22e79b 100644
--- a/test/dm/i2c.c
+++ b/test/dm/i2c.c
@@ -124,7 +124,7 @@ static int dm_test_i2c_bytewise(struct unit_test_state *uts)
 	ut_asserteq_mem(buf, "\0\0\0\0\0", sizeof(buf));
 
 	/* Tell the EEPROM to only read/write one register at a time */
-	ut_assertok(uclass_first_device(UCLASS_I2C_EMUL, &eeprom));
+	ut_assertok(uclass_first_device_err(UCLASS_I2C_EMUL, &eeprom));
 	ut_assertnonnull(eeprom);
 	sandbox_i2c_eeprom_set_test_mode(eeprom, SIE_TEST_MODE_SINGLE_BYTE);
 
@@ -177,7 +177,7 @@ static int dm_test_i2c_offset(struct unit_test_state *uts)
 
 	/* Do a transfer so we can find the emulator */
 	ut_assertok(dm_i2c_read(dev, 0, buf, 5));
-	ut_assertok(uclass_first_device(UCLASS_I2C_EMUL, &eeprom));
+	ut_assertok(uclass_first_device_err(UCLASS_I2C_EMUL, &eeprom));
 
 	/* Offset length 0 */
 	sandbox_i2c_eeprom_set_offset_len(eeprom, 0);
@@ -250,7 +250,7 @@ static int dm_test_i2c_addr_offset(struct unit_test_state *uts)
 
 	/* Do a transfer so we can find the emulator */
 	ut_assertok(dm_i2c_read(dev, 0, buf, 5));
-	ut_assertok(uclass_first_device(UCLASS_I2C_EMUL, &eeprom));
+	ut_assertok(uclass_first_device_err(UCLASS_I2C_EMUL, &eeprom));
 
 	/* Offset length 0 */
 	sandbox_i2c_eeprom_set_offset_len(eeprom, 0);
@@ -315,7 +315,7 @@ static int dm_test_i2c_reg_clrset(struct unit_test_state *uts)
 
 	/* Do a transfer so we can find the emulator */
 	ut_assertok(dm_i2c_read(dev, 0, buf, 5));
-	ut_assertok(uclass_first_device(UCLASS_I2C_EMUL, &eeprom));
+	ut_assertok(uclass_first_device_err(UCLASS_I2C_EMUL, &eeprom));
 
 	/* Dummy data for the test */
 	ut_assertok(dm_i2c_write(dev, 0, "\xff\x00\xff\x00\x10", 5));
diff --git a/test/dm/virtio_device.c b/test/dm/virtio_device.c
index d0195e6bf0..b5c4523a02 100644
--- a/test/dm/virtio_device.c
+++ b/test/dm/virtio_device.c
@@ -22,7 +22,7 @@ static int dm_test_virtio_base(struct unit_test_state *uts)
 	u8 status;
 
 	/* check probe success */
-	ut_assertok(uclass_first_device(UCLASS_VIRTIO, &bus));
+	ut_assertok(uclass_first_device_err(UCLASS_VIRTIO, &bus));
 	ut_assertnonnull(bus);
 
 	/* check the child virtio-rng device is bound */
@@ -60,7 +60,7 @@ static int dm_test_virtio_all_ops(struct unit_test_state *uts)
 	struct virtqueue *vqs[2];
 
 	/* check probe success */
-	ut_assertok(uclass_first_device(UCLASS_VIRTIO, &bus));
+	ut_assertok(uclass_first_device_err(UCLASS_VIRTIO, &bus));
 	ut_assertnonnull(bus);
 
 	/* check the child virtio-rng device is bound */
@@ -102,7 +102,7 @@ static int dm_test_virtio_remove(struct unit_test_state *uts)
 	struct udevice *bus, *dev;
 
 	/* check probe success */
-	ut_assertok(uclass_first_device(UCLASS_VIRTIO, &bus));
+	ut_assertok(uclass_first_device_err(UCLASS_VIRTIO, &bus));
 	ut_assertnonnull(bus);
 
 	/* check the child virtio-rng device is bound */
@@ -134,7 +134,7 @@ static int dm_test_virtio_ring(struct unit_test_state *uts)
 	u8 buffer[2][32];
 
 	/* check probe success */
-	ut_assertok(uclass_first_device(UCLASS_VIRTIO, &bus));
+	ut_assertok(uclass_first_device_err(UCLASS_VIRTIO, &bus));
 	ut_assertnonnull(bus);
 
 	/* check the child virtio-blk device is bound */
diff --git a/test/dm/virtio_rng.c b/test/dm/virtio_rng.c
index ff5646b4e1..8b9a04b1fd 100644
--- a/test/dm/virtio_rng.c
+++ b/test/dm/virtio_rng.c
@@ -28,7 +28,7 @@ static int dm_test_virtio_rng_check_len(struct unit_test_state *uts)
 	u8 buffer[16];
 
 	/* check probe success */
-	ut_assertok(uclass_first_device(UCLASS_VIRTIO, &bus));
+	ut_assertok(uclass_first_device_err(UCLASS_VIRTIO, &bus));
 	ut_assertnonnull(bus);
 
 	/* check the child virtio-rng device is bound */
diff --git a/test/fuzz/cmd_fuzz.c b/test/fuzz/cmd_fuzz.c
index 0cc01dc199..e2f44f3ecb 100644
--- a/test/fuzz/cmd_fuzz.c
+++ b/test/fuzz/cmd_fuzz.c
@@ -29,7 +29,7 @@ static struct udevice *find_fuzzing_engine(void)
 {
 	struct udevice *dev;
 
-	if (uclass_first_device(UCLASS_FUZZING_ENGINE, &dev))
+	if (uclass_first_device_err(UCLASS_FUZZING_ENGINE, &dev))
 		return NULL;
 
 	return dev;
diff --git a/test/fuzz/virtio.c b/test/fuzz/virtio.c
index e5363d5638..8a47667e77 100644
--- a/test/fuzz/virtio.c
+++ b/test/fuzz/virtio.c
@@ -30,7 +30,7 @@ static int fuzz_vring(const uint8_t *data, size_t size)
 		return 0;
 
 	/* check probe success */
-	if (uclass_first_device(UCLASS_VIRTIO, &bus) || !bus)
+	if (uclass_first_device_err(UCLASS_VIRTIO, &bus))
 		panic("Could not find virtio bus\n");
 
 	/* check the child virtio-rng device is bound */
-- 
2.37.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
