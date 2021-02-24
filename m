Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB9B323BD3
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Feb 2021 13:20:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DC1BC57B59;
	Wed, 24 Feb 2021 12:20:12 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1ADEC57B58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 12:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1614169187;
 bh=xoD2sogvCPN6q6nOcUcwKlM8kIg3tb5JvWho40vjyuI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=apceBHFOKbhMihB3g9o8Zsl4QlBCwxyLlJQ1dbq6NFEzef/QBiEWveKT8/6TuChmd
 /K4T8XMrxwXGSstQA/TU3Y933UPTa/NcTNtxlikqftRyANht0u6yLu3Q8hI3WWN7Db
 ruHK0a7A2jyECqoIKmIqd4ZriU5EIH7C/pBENXsI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from workstation4.fritz.box ([62.143.246.89]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1N17Ye-1lyeKX1AFe-012Y7h; Wed, 24 Feb 2021 13:19:47 +0100
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Tom Rini <trini@konsulko.com>
Date: Wed, 24 Feb 2021 13:19:04 +0100
Message-Id: <20210224121904.13927-1-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:XZVOyi4eEN6i3jB/5gWGy/N24gNZyBpwKUiopDZf+mk6T6PMhk9
 cl+fej2Hs3sipNlZs1zR6+6KQmhEwh28IoMNaJKHYk0QKH7fmeXkd22Ltpv5TB8poL/CP5O
 mu5f4F5FsDDe/XFtRxO3PuUHIb9W2aDYh8LInsIxZxjX/jxKPcAiGe3gQ5NHRTT8sn1j8EO
 N/BUi2ud1nmdOikHOEyAA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+vKQqHhiegU=:YTyYEriUeOkKXMBzqrXXX8
 vlOyNDqnQ1t6rffC94CWfanm1P8zH3155aabG9Atv1mO09R7tS5zY5RLBjmmzSU6uIo3jsVAm
 LUW5g13YeZTxSNwN5Heno25aFgJsrvYnkJrfz7muWJC6K5x/bNXTzGPPVUdRtqO/yeK0zl9I/
 LkWg5u1giubanRFYuMGDcnV6LcQnQ7GtvgzH9MR9uf1ontLLqnaLzQjgKzBXDZ7/DcnFRAEQT
 rmrUt6XZuih1ksXNV5vno/CYTDzPM2cZiGSQizFIjf0W+ciZEUh+vA6nNjxPycwJjlBnnVHh9
 tE3fe68B/8YGtRLQXjTYQocrJXjCMF5UJWL5cgOOJmuoTZaMPYkmcvGhg7TeWXTe+Gz/4EHG2
 V2DwcM90LN5AoMeAQmCrnXioZr3VKt0epCtdYZZkHhKRYyZ9iTMlc35x5SMHJ9ZGLaWs2JB9f
 wWTjYx/CYGVpTnRXnhFNuI4c/v5Yu5CP1KgXi4xRbAqhTURAAFDxtk91rNG6jS/PkhwmP33Xj
 hzemphG20qZdsV8g8ZXq2y+NPCLSsoEMxzh/HslOaflCI27X6qyWoK2zNt8yAr1oU7FxJXUyQ
 y5YEaJUTwP+t8uvljbTZCj0dLt8SIldOu+RkeT2Y8nyksEhpK6Arw32YNAhHvkWNoXK61a+Mi
 AJTomEEP9EAvIyjTo/LvpwKiNtQijIj/yjlqMdbC71bHZDtI2GYmNtPSq5+dc4RgkSsKrCF3H
 /2TiRSMgiwQFujXglzpEqqOQKwI/K4v1Cz+oIcYLqEurk5V8ahqUdLHnmWgjVHjFAD6LjXMpU
 aaGbGwR65o8Qq0jrlsbbsl+Q8bRwjKLr284918QrlqU2OeL3EKu44EBY4OamubOHaomie2HGk
 BJWztLvXkdDZH29QnQvA==
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Bin Meng <bin.meng@windriver.com>,
 Sean Anderson <seanga2@gmail.com>, Stefan Bosch <stefan_b@posteo.net>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Stefan Roese <sr@denx.de>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Naoki Hayama <naoki.hayama@lineo.co.jp>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Weijie Gao <weijie.gao@mediatek.com>,
 Marek Vasut <marek.vasut@gmail.com>, Ramon Fried <rfried.dev@gmail.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 Wolfgang Denk <wd@denx.de>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Robert Marko <robert.marko@sartura.hr>, Adam Ford <aford173@gmail.com>,
 Michal Simek <monstr@monstr.eu>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/1] Correct U-Boot upstream repository
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

The U-Boot source moves to https://source.denx.de/u-boot/u-boot.git
effective 2021-02-28.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 .gitlab-ci.yml                              |   2 +-
 MAINTAINERS                                 | 110 ++++++++++----------
 README                                      |   4 +-
 board/st/common/MAINTAINERS                 |   2 +-
 board/st/stm32mp1/MAINTAINERS               |   2 +-
 board/ti/j721e/README                       |   2 +-
 board/xilinx/microblaze-generic/MAINTAINERS |   2 +-
 board/xilinx/versal/MAINTAINERS             |   2 +-
 board/xilinx/zynq/MAINTAINERS               |   2 +-
 board/xilinx/zynqmp/MAINTAINERS             |   2 +-
 doc/board/intel/slimbootloader.rst          |   2 +-
 doc/build/source.rst                        |   2 +-
 12 files changed, 67 insertions(+), 67 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 2cdcd864c8..bfcbb9ff11 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0+

 # Grab our configured image.  The source for this is found at:
-# https://gitlab.denx.de/u-boot/gitlab-ci-runner
+# https://source.denx.de/u-boot/gitlab-ci-runner
 image: trini/u-boot-gitlab-ci-runner:bionic-20200807-02Sep2020

 # We run some tests in different order, to catch some failures quicker.
diff --git a/MAINTAINERS b/MAINTAINERS
index b82b7adbeb..db3527081f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -75,7 +75,7 @@ M:	Alexey Brodkin <alexey.brodkin@synopsys.com>
 M:	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
 S:	Maintained
 L:	uboot-snps-arc@synopsys.com
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-arc.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-arc.git
 F:	arch/arc/
 F:	board/synopsys/

@@ -111,7 +111,7 @@ F:	drivers/mmc/snps_dw_mmc.c
 ARM
 M:	Tom Rini <trini@konsulko.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-arm.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-arm.git
 F:	arch/arm/
 F:	cmd/arm/

@@ -120,7 +120,7 @@ M:	Marek Vasut <marex@denx.de>
 M:	Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
 M:	Ley Foon Tan <ley.foon.tan@intel.com>
 S:	Maintainted
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-socfpga.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-socfpga.git
 F:	arch/arm/mach-socfpga/
 F:	drivers/sysreset/sysreset_socfpga*

@@ -128,7 +128,7 @@ ARM AMLOGIC SOC SUPPORT
 M:	Neil Armstrong <narmstrong@baylibre.com>
 S:	Maintained
 L:	u-boot-amlogic@groups.io
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-amlogic.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-amlogic.git
 F:	arch/arm/mach-meson/
 F:	arch/arm/include/asm/arch-meson/
 F:	drivers/clk/meson/
@@ -218,7 +218,7 @@ M:	Stefano Babic <sbabic@denx.de>
 M:	Fabio Estevam <festevam@gmail.com>
 R:	NXP i.MX U-Boot Team <uboot-imx@nxp.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-imx.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-imx.git
 F:	arch/arm/cpu/arm1136/mx*/
 F:	arch/arm/cpu/arm926ejs/mx*/
 F:	arch/arm/cpu/armv7/vf610/
@@ -255,7 +255,7 @@ F:	drivers/rng/msm_rng.c
 ARM MARVELL KIRKWOOD ARMADA-XP ARMADA-38X ARMADA-37XX ARMADA-7K/8K
 M:	Stefan Roese <sr@denx.de>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-marvell.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-marvell.git
 F:	arch/arm/mach-kirkwood/
 F:	arch/arm/mach-mvebu/
 F:	drivers/ata/ahci_mvebu.c
@@ -269,7 +269,7 @@ F:	drivers/watchdog/orion_wdt.c
 ARM MARVELL PXA
 M:	Marek Vasut <marex@denx.de>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-pxa.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-pxa.git
 F:	arch/arm/cpu/pxa/
 F:	arch/arm/include/asm/arch-pxa/

@@ -305,7 +305,7 @@ N:	mediatek
 ARM MICROCHIP/ATMEL AT91
 M:	Eugen Hristev <eugen.hristev@microchip.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-atmel.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-atmel.git
 F:	arch/arm/mach-at91/
 F:	board/atmel/
 F:	drivers/cpu/at91_cpu.c
@@ -345,7 +345,7 @@ ARM RENESAS RMOBILE/R-CAR
 M:	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
 M:	Marek Vasut <marek.vasut+renesas@gmail.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-sh.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-sh.git
 F:	arch/arm/mach-rmobile/

 ARM ROCKCHIP
@@ -353,7 +353,7 @@ M:	Simon Glass <sjg@chromium.org>
 M:	Philipp Tomsich <philipp.tomsich@theobroma-systems.com>
 M:	Kever Yang <kever.yang@rock-chips.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-rockchip.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-rockchip.git
 F:	arch/arm/include/asm/arch-rockchip/
 F:	arch/arm/mach-rockchip/
 F:	board/rockchip/
@@ -375,7 +375,7 @@ F:	tools/rkspi.c
 ARM SAMSUNG
 M:	Minkyu Kang <mk7.kang@samsung.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-samsung.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-samsung.git
 F:	arch/arm/mach-exynos/
 F:	arch/arm/mach-s5pc1xx/
 F:	arch/arm/cpu/armv7/s5p-common/
@@ -394,7 +394,7 @@ F:	drivers/usb/host/ehci-msm.c
 ARM STI
 M:	Patrice Chotard <patrice.chotard@foss.st.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-stm.git
 F:	arch/arm/mach-sti/
 F:	arch/arm/include/asm/arch-sti*/
 F:	drivers/phy/sti_usb_phy.c
@@ -413,7 +413,7 @@ F:	include/dt-bindings/reset/stih407-resets.h
 ARM STM SPEAR
 #M:	Vipin Kumar <vipin.kumar@st.com>
 S:	Orphaned (Since 2016-02)
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-stm.git
 F:	arch/arm/cpu/arm926ejs/spear/
 F:	arch/arm/include/asm/arch-spear/

@@ -421,7 +421,7 @@ ARM STM STM32MP
 M:	Patrick Delaunay <patrick.delaunay@foss.st.com>
 M:	Patrice Chotard <patrice.chotard@foss.st.com>
 L:	uboot-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-stm.git
 S:	Maintained
 F:	arch/arm/mach-stm32mp/
 F:	doc/board/st/
@@ -471,7 +471,7 @@ ARM SUNXI
 M:	Jagan Teki <jagan@amarulasolutions.com>
 M:	Andre Przywara <andre.przywara@arm.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-sunxi.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-sunxi.git
 F:	arch/arm/cpu/armv7/sunxi/
 F:	arch/arm/include/asm/arch-sunxi/
 F:	arch/arm/mach-sunxi/
@@ -480,14 +480,14 @@ F:	board/sunxi/
 ARM TEGRA
 M:	Tom Warren <twarren@nvidia.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-tegra.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-tegra.git
 F:	arch/arm/mach-tegra/
 F:	arch/arm/include/asm/arch-tegra*/

 ARM TI
 M:	Lokesh Vutla <lokeshvutla@ti.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-ti.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-ti.git
 F:	arch/arm/mach-davinci/
 F:	arch/arm/mach-k3/
 F:	arch/arm/mach-keystone/
@@ -536,7 +536,7 @@ N:	uniphier
 ARM VERSAL
 M:	Michal Simek <michal.simek@xilinx.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-microblaze.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-microblaze.git
 F:	arch/arm/mach-versal/
 F:	drivers/watchdog/xilinx_wwdt.c
 N:	(?<!uni)versal
@@ -551,7 +551,7 @@ N:	vexpress
 ARM ZYNQ
 M:	Michal Simek <monstr@monstr.eu>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-microblaze.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-microblaze.git
 F:	arch/arm/mach-zynq/
 F:	doc/board/xilinx/
 F:	doc/device-tree-bindings/video/syncoam,seps525.txt
@@ -577,7 +577,7 @@ N:	zynq
 ARM ZYNQMP
 M:	Michal Simek <michal.simek@xilinx.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-microblaze.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-microblaze.git
 F:	arch/arm/mach-zynqmp/
 F:	drivers/clk/clk_zynqmp.c
 F:	driver/firmware/firmware-zynqmp.c
@@ -607,7 +607,7 @@ N:	zynqmp
 ARM ZYNQMP R5
 M:	Michal Simek <michal.simek@xilinx.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-microblaze.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-microblaze.git
 F:	arch/arm/mach-zynqmp-r5/

 ARM PHYTIUM
@@ -639,14 +639,14 @@ F:	tools/buildman/
 CFI FLASH
 M:	Stefan Roese <sr@denx.de>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-cfi-flash.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-cfi-flash.git
 F:	drivers/mtd/cfi_flash.c
 F:	drivers/mtd/jedec_flash.c

 CLOCK
 M:	Lukasz Majewski <lukma@denx.de>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-clk.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-clk.git
 F:	drivers/clk/
 F:	drivers/clk/imx/

@@ -654,14 +654,14 @@ COLDFIRE
 M:	Huan Wang <alison.wang@nxp.com>
 M:	Angelo Dureghello <angelo@sysam.it>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-coldfire.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-coldfire.git
 F:	arch/m68k/
 F:	doc/arch/m68k.rst

 DFU
 M:	Lukasz Majewski <lukma@denx.de>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-dfu.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-dfu.git
 F:	cmd/dfu.c
 F:	cmd/usb_*.c
 F:	common/dfu.c
@@ -675,7 +675,7 @@ F:	include/dfu.h
 DRIVER MODEL
 M:	Simon Glass <sjg@chromium.org>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-dm.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-dm.git
 F:	doc/driver-model/
 F:	drivers/core/
 F:	include/dm/
@@ -685,7 +685,7 @@ EFI PAYLOAD
 M:	Heinrich Schuchardt <xypron.glpk@gmx.de>
 R:	Alexander Graf <agraf@csgraf.de>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-efi.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-efi.git
 F:	doc/api/efi.rst
 F:	doc/uefi/*
 F:	doc/usage/bootefi.rst
@@ -728,7 +728,7 @@ F:	tools/mkenvimage.c
 FPGA
 M:	Michal Simek <michal.simek@xilinx.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-microblaze.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-microblaze.git
 F:	drivers/fpga/
 F:	cmd/fpga.c
 F:	include/fpga.h
@@ -736,7 +736,7 @@ F:	include/fpga.h
 FLATTENED DEVICE TREE
 M:	Simon Glass <sjg@chromium.org>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-fdt.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-fdt.git
 F:	lib/fdtdec*
 F:	lib/libfdt/
 F:	include/fdt*
@@ -747,25 +747,25 @@ F:	common/fdt_support.c
 FREEBSD
 M:	Rafal Jaworowski <raj@semihalf.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-freebsd.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-freebsd.git

 FREESCALE QORIQ
 M:	Priyanka Jain <priyanka.jain@nxp.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-fsl-qoriq.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-fsl-qoriq.git
 F:	drivers/watchdog/sp805_wdt.c
 F:	drivers/watchdog/sbsa_gwdt.c

 I2C
 M:	Heiko Schocher <hs@denx.de>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-i2c.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-i2c.git
 F:	drivers/i2c/

 LOGGING
 M:	Simon Glass <sjg@chromium.org>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/u-boot.git
+T:	git https://source.denx.de/u-boot/u-boot.git
 F:	common/log*
 F:	cmd/log.c
 F:	doc/develop/logging.rst
@@ -784,7 +784,7 @@ F:	drivers/i2c/i2c-versatile.c
 MICROBLAZE
 M:	Michal Simek <monstr@monstr.eu>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-microblaze.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-microblaze.git
 F:	arch/microblaze/
 F:	cmd/mfsl.c
 F:	drivers/gpio/xilinx_gpio.c
@@ -799,7 +799,7 @@ N:	xilinx
 MIPS
 M:	Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-mips.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-mips.git
 F:	arch/mips/

 MIPS CORTINA ACCESS CAxxxx
@@ -876,26 +876,26 @@ F:	arch/mips/dts/mrvl,cn73xx.dtsi
 MMC
 M:	Peng Fan <peng.fan@nxp.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-mmc.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-mmc.git
 F:	drivers/mmc/

 NAND FLASH
 #M:	Scott Wood <oss@buserror.net>
 S:	Orphaned (Since 2018-07)
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-nand-flash.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-nand-flash.git
 F:	drivers/mtd/nand/raw/

 NDS32
 M:	Rick Chen <rick@andestech.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-nds32.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-nds32.git
 F:	arch/nds32/

 NETWORK
 M:	Joe Hershberger <joe.hershberger@ni.com>
 M:	Ramon Fried <rfried.dev@gmail.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-net.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-net.git
 F:	drivers/net/
 F:	include/net.h
 F:	net/
@@ -903,13 +903,13 @@ F:	net/
 NIOS
 M:	Thomas Chou <thomas@wytron.com.tw>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-nios.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-nios.git
 F:	arch/nios2/

 ONENAND
 #M:	Lukasz Majewski <l.majewski@majess.pl>
 S:	Orphaned (Since 2017-01)
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-onenand.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-onenand.git
 F:	drivers/mtd/onenand/

 PATMAN
@@ -931,7 +931,7 @@ F:	drivers/pci/pci_mpc85xx.c
 POWER
 M:	Jaehoon Chung <jh80.chung@samsung.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-pmic.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-pmic.git
 F:	drivers/power/

 POWERPC
@@ -942,13 +942,13 @@ F:	arch/powerpc/
 POWERPC MPC8XX
 M:	Christophe Leroy <christophe.leroy@c-s.fr>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-mpc8xx.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-mpc8xx.git
 F:	arch/powerpc/cpu/mpc8xx/

 POWERPC MPC83XX
 M:	Mario Six <mario.six@gdsys.cc>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-mpc83xx.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-mpc83xx.git
 F:	drivers/ram/mpc83xx_sdram.c
 F:	include/dt-bindings/memory/mpc83xx-sdram.h
 F:	drivers/sysreset/sysreset_mpc83xx.c
@@ -966,19 +966,19 @@ F:	arch/powerpc/include/asm/arch-mpc83xx/
 POWERPC MPC85XX
 M:	Priyanka Jain <priyanka.jain@nxp.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-mpc85xx.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-mpc85xx.git
 F:	arch/powerpc/cpu/mpc85xx/

 POWERPC MPC86XX
 M:	Priyanka Jain <priyanka.jain@nxp.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-mpc86xx.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-mpc86xx.git
 F:	arch/powerpc/cpu/mpc86xx/

 RISC-V
 M:	Rick Chen <rick@andestech.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-riscv.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-riscv.git
 F:	arch/riscv/
 F:	cmd/riscv/
 F:	doc/usage/sbi.rst
@@ -1023,13 +1023,13 @@ SH
 M:	Marek Vasut <marek.vasut+renesas@gmail.com>
 M:	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-sh.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-sh.git
 F:	arch/sh/

 SPI
 M:	Jagan Teki <jagan@amarulasolutions.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-spi.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-spi.git
 F:	drivers/spi/
 F:	include/spi*

@@ -1127,7 +1127,7 @@ UBI
 M:	Kyungmin Park <kmpark@infradead.org>
 M:	Heiko Schocher <hs@denx.de>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-ubi.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-ubi.git
 F:	drivers/mtd/ubi/

 UFS
@@ -1138,7 +1138,7 @@ F:	drivers/ufs/
 USB
 M:	Marek Vasut <marex@denx.de>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-usb.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-usb.git
 F:	drivers/usb/
 F:	common/usb.c
 F:	common/usb_kbd.c
@@ -1147,14 +1147,14 @@ F:	include/usb.h
 USB xHCI
 M:	Bin Meng <bmeng.cn@gmail.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-usb.git topic-xhci
+T:	git https://source.denx.de/u-boot/custodians/u-boot-usb.git topic-xhci
 F:	drivers/usb/host/xhci*
 F:	include/usb/xhci.h

 VIDEO
 M:	Anatolij Gustschin <agust@denx.de>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-video.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-video.git
 F:	drivers/video/
 F:	common/lcd*.c
 F:	include/lcd*.h
@@ -1164,7 +1164,7 @@ X86
 M:	Simon Glass <sjg@chromium.org>
 M:	Bin Meng <bmeng.cn@gmail.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-x86.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-x86.git
 F:	arch/x86/
 F:	cmd/x86/

@@ -1194,7 +1194,7 @@ M:	Tom Rini <trini@konsulko.com>
 L:	u-boot@lists.denx.de
 Q:	http://patchwork.ozlabs.org/project/uboot/list/
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/u-boot.git
+T:	git https://source.denx.de/u-boot/u-boot.git
 F:	configs/tools-only_defconfig
 F:	*
 F:	*/
diff --git a/README b/README
index b962ba7c2f..a565748e43 100644
--- a/README
+++ b/README
@@ -58,8 +58,8 @@ Where to get source code:
 =========================

 The U-Boot source code is maintained in the Git repository at
-https://gitlab.denx.de/u-boot/u-boot.git ; you can browse it online at
-https://gitlab.denx.de/u-boot/u-boot
+https://source.denx.de/u-boot/u-boot.git ; you can browse it online at
+https://source.denx.de/u-boot/u-boot

 The "Tags" links on this page allow you to download tarballs of
 any version you might be interested in. Official releases are also
diff --git a/board/st/common/MAINTAINERS b/board/st/common/MAINTAINERS
index c4e0c5fd94..0c6db54772 100644
--- a/board/st/common/MAINTAINERS
+++ b/board/st/common/MAINTAINERS
@@ -1,6 +1,6 @@
 ST BOARDS
 M:	Patrick Delaunay <patrick.delaunay@foss.st.com>
 L:	uboot-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-stm.git
 S:	Maintained
 F:	board/st/common/
diff --git a/board/st/stm32mp1/MAINTAINERS b/board/st/stm32mp1/MAINTAINERS
index bd5c07da34..fe8fc6f484 100644
--- a/board/st/stm32mp1/MAINTAINERS
+++ b/board/st/stm32mp1/MAINTAINERS
@@ -1,7 +1,7 @@
 STM32MP1 BOARD
 M:	Patrick Delaunay <patrick.delaunay@foss.st.com>
 L:	uboot-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-stm.git
 S:	Maintained
 F:	arch/arm/dts/stm32mp15*
 F:	board/st/stm32mp1/
diff --git a/board/ti/j721e/README b/board/ti/j721e/README
index 757a59cdb4..c33afa496e 100644
--- a/board/ti/j721e/README
+++ b/board/ti/j721e/README
@@ -132,7 +132,7 @@ Sources:
 	Branch: master

 4. U-Boot:
-	Tree: https://gitlab.denx.de/u-boot/u-boot
+	Tree: https://source.denx.de/u-boot/u-boot
 	Branch: master

 Build procedure:
diff --git a/board/xilinx/microblaze-generic/MAINTAINERS b/board/xilinx/microblaze-generic/MAINTAINERS
index 9a42a8b740..29ed32f78f 100644
--- a/board/xilinx/microblaze-generic/MAINTAINERS
+++ b/board/xilinx/microblaze-generic/MAINTAINERS
@@ -1,7 +1,7 @@
 MICROBLAZE-GENERIC BOARD
 M:	Michal Simek <monstr@monstr.eu>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-microblaze.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-microblaze.git
 F:	board/xilinx/microblaze-generic/
 F:	include/configs/microblaze-generic.h
 F:	configs/microblaze-generic_defconfig
diff --git a/board/xilinx/versal/MAINTAINERS b/board/xilinx/versal/MAINTAINERS
index 0d40196ade..bbab051366 100644
--- a/board/xilinx/versal/MAINTAINERS
+++ b/board/xilinx/versal/MAINTAINERS
@@ -1,7 +1,7 @@
 XILINX_VERSAL BOARDS
 M:	Michal Simek <michal.simek@xilinx.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-microblaze.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-microblaze.git
 F:	arch/arm/dts/versal*
 F:	board/xilinx/versal/
 F:	include/configs/xilinx_versal*
diff --git a/board/xilinx/zynq/MAINTAINERS b/board/xilinx/zynq/MAINTAINERS
index ce760ab02c..b5b9e2fe40 100644
--- a/board/xilinx/zynq/MAINTAINERS
+++ b/board/xilinx/zynq/MAINTAINERS
@@ -1,7 +1,7 @@
 ZYNQ BOARD
 M:	Michal Simek <monstr@monstr.eu>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-microblaze.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-microblaze.git
 F:	arch/arm/dts/zynq-*
 F:	board/xilinx/zynq/
 F:	include/configs/zynq*.h
diff --git a/board/xilinx/zynqmp/MAINTAINERS b/board/xilinx/zynqmp/MAINTAINERS
index a631b380bd..56c637943f 100644
--- a/board/xilinx/zynqmp/MAINTAINERS
+++ b/board/xilinx/zynqmp/MAINTAINERS
@@ -1,7 +1,7 @@
 XILINX_ZYNQMP BOARDS
 M:	Michal Simek <michal.simek@xilinx.com>
 S:	Maintained
-T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-microblaze.git
+T:	git https://source.denx.de/u-boot/custodians/u-boot-microblaze.git
 F:	arch/arm/dts/zynqmp-*
 F:	arch/arm/dts/avnet-ultra96*
 F:	board/xilinx/common/
diff --git a/doc/board/intel/slimbootloader.rst b/doc/board/intel/slimbootloader.rst
index a8c41b1aa7..18f1cc0569 100644
--- a/doc/board/intel/slimbootloader.rst
+++ b/doc/board/intel/slimbootloader.rst
@@ -170,7 +170,7 @@ Build Instruction to use ELF U-Boot

    $ python BuildLoader.py build <qemu or apl> -p "OsLoader.efi:LLDR:Lz4;u-boot:U-BT:Lzma"

-.. _U-Boot: https://gitlab.denx.de/
+.. _U-Boot: https://source.denx.de/
 .. _`Slim Bootloader`: https://github.com/slimbootloader/
 .. _`Intel FSP`: https://github.com/IntelFsp/
 .. _`Getting Started`: https://slimbootloader.github.io/getting-started/
diff --git a/doc/build/source.rst b/doc/build/source.rst
index 75720e2027..470f793985 100644
--- a/doc/build/source.rst
+++ b/doc/build/source.rst
@@ -7,7 +7,7 @@ You can download the source via

 .. code-block:: bash

-    git clone https://gitlab.denx.de/u-boot/u-boot.git
+    git clone https://source.denx.de/u-boot/u-boot.git

 A mirror of the source is maintained on Github

--
2.30.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
