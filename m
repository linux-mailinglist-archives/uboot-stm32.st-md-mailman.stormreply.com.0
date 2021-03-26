Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2A934A022
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Mar 2021 04:13:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFEEFC57B5F;
	Fri, 26 Mar 2021 03:13:55 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B444C57B5E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 03:13:52 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id t20so231155plr.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 20:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AnIElntyq7HWPc5Gmxva0RLBd+SdcXPPM+wXWEugL88=;
 b=ISzoTw+VJX7RJ2E6XjOIfgL7db6xEg9ODkmqAHOOF2Q9nMbbsZiaxl7HaCSF+F9TNk
 iieEcn7KflfkYkxHIuG+tDS05kr7H2nOZfIaR9qsxXPwGf077Hjv2ZfQWRDkByWRjtBy
 6Qn1xCzOg/a1hxxr7sUJERJ37zREZpkh3NC5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AnIElntyq7HWPc5Gmxva0RLBd+SdcXPPM+wXWEugL88=;
 b=eUlOmof07rtve+fQd+d7Mwon1MwXvMw+727xpjvxV1JFnohkWhr8NOjc+YQRi/lV5T
 84oixWtWM8XPodzV+p/74iIGiW8OL0se6Zbbmz+//jpsW5YO3/iV8iaPUs7IlJ0P6NaN
 ayYxhxKtpIkRf2iLAJ6bchiMaH9f8TH1DPcLptkU0Ca4yXHRFR0T7KBnw45XoFNTScRf
 Qa9ODWdeiCp0gGuZgp8B8bgiOKABMMff9gMoEzc/zF6b3WKVjn+KH2DcbG9LsnXc0VLU
 3v/MzbDxDNkgkU1yoS3mcR2iau0zOkpB36eXAC+hfYIek9GFR5IOOM18UXOD9tEkcO2b
 w3kA==
X-Gm-Message-State: AOAM530ujZE1vvgNalkf6OFADFLOboxN8mFLh6eHx5sZbIL2SqzsfJzZ
 fa7W7nNA97yO/pL3BjmhrsSUDA==
X-Google-Smtp-Source: ABdhPJw9uDQ55JbZkXUtiMZ/SzJ4v8vyUlfFesKNilePXoQxehSd53VouwhWuRrZQc0RstzQsAQVhA==
X-Received: by 2002:a17:902:a513:b029:e5:d91c:2ede with SMTP id
 s19-20020a170902a513b02900e5d91c2edemr13365095plq.65.1616728430179; 
 Thu, 25 Mar 2021 20:13:50 -0700 (PDT)
Received: from sjg1.roam.corp.google.com (85.72.69.111.dynamic.snap.net.nz.
 [111.69.72.85])
 by smtp.gmail.com with ESMTPSA id g72sm7346133pfb.189.2021.03.25.20.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 20:13:48 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Fri, 26 Mar 2021 16:13:02 +1300
Message-Id: <20210326031303.833293-2-sjg@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210326031303.833293-1-sjg@chromium.org>
References: <20210326031303.833293-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Peng Fan <peng.fan@nxp.com>, Reuben Dowle <reubendowle0@gmail.com>,
 Marco Franchi <marcofrk@gmail.com>, Robert Marko <robert.marko@sartura.hr>,
 Samuel Holland <samuel@sholland.org>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Lukasz Majewski <lukma@denx.de>,
 Joao Marcos Costa <joaomarcos.costa@bootlin.com>,
 Ramon Fried <rfried.dev@gmail.com>, Harald Seiler <hws@denx.de>,
 Wolfgang Grandegger <wg@aries-embedded.de>,
 Beniamino Galvani <b.galvani@gmail.com>, David Bauer <mail@david-bauer.net>,
 Trevor Woerner <twoerner@gmail.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Pavel Machek <pavel@denx.de>,
 Anup Patel <anup.patel@wdc.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Pratyush Yadav <p.yadav@ti.com>,
 =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Klaus Goger <klaus.goger@theobroma-systems.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Stefan Roese <sr@denx.de>, u-boot-amlogic@groups.io,
 Jagan Teki <jagan@amarulasolutions.com>, Anatolij Gustschin <agust@denx.de>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Chee Hong Ang <chee.hong.ang@intel.com>, Alifer Moraes <alifer.wsdm@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Simon Glass <sjg@chromium.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Mario Six <mario.six@gdsys.cc>, Andy Yan <andy.yan@rock-chips.com>,
 Dalon Westergreen <dwesterg@gmail.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Joel Johnson <mrjoel@lixil.net>, Neil Armstrong <narmstrong@baylibre.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Michal Simek <michal.simek@xilinx.com>,
 Atish Patra <atish.patra@wdc.com>,
 "Matwey V. Kornilov" <matwey.kornilov@gmail.com>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Fabio Estevam <festevam@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Holger Brunck <holger.brunck@hitachi-powergrids.com>,
 Dirk Eibach <dirk.eibach@gdsys.cc>, Loic Devulder <ldevulder@suse.com>,
 Akash Gajjar <akash@openedev.com>, Eugeniy Paltsev <paltsev@synopsys.com>,
 Levin Du <djw@t-chip.com.cn>, Adam Ford <aford173@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Jack Mitchell <ml@embed.me.uk>,
 Chin-Liang See <clsee@altera.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Marek Vasut <marex@denx.de>, Banglang Huang <banglang.huang@foxmail.com>,
 Maxim Sloyko <maxims@google.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Peter Robinson <pbrobinson@gmail.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>,
 Bharat Gooty <bharat.gooty@broadcom.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Siew Chin Lim <elly.siew.chin.lim@intel.com>,
 Christian Hewitt <christianshewitt@gmail.com>, "Andrew F. Davis" <afd@ti.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Tom Warren <twarren@nvidia.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH 2/2] Rename CONFIG_DM_RESET to CONFIG_RESET
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

This config was misnamed at birth since there has never been a
CONFIG_RESET option used before driver model. Rename it so that it is
clear that driver model is the only option here.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 arch/arm/Kconfig                          | 10 +++----
 arch/arm/mach-aspeed/Kconfig              |  2 +-
 arch/arm/mach-socfpga/Kconfig             |  4 +--
 arch/arm/mach-stm32/Kconfig               |  8 ++---
 arch/arm/mach-stm32mp/Kconfig             |  2 +-
 arch/arm/mach-tegra/Kconfig               |  2 +-
 arch/mips/Kconfig                         |  2 +-
 board/sipeed/maix/Kconfig                 |  2 +-
 common/spl/Kconfig                        |  2 +-
 configs/am65x_evm_a53_defconfig           |  4 +--
 configs/am65x_evm_r5_defconfig            |  4 +--
 configs/am65x_evm_r5_usbdfu_defconfig     |  4 +--
 configs/am65x_evm_r5_usbmsc_defconfig     |  4 +--
 configs/am65x_hs_evm_a53_defconfig        |  4 +--
 configs/am65x_hs_evm_r5_defconfig         |  4 +--
 configs/bcm968380gerg_ram_defconfig       |  2 +-
 configs/beelink-gtking_defconfig          |  2 +-
 configs/beelink-gtkingpro_defconfig       |  2 +-
 configs/comtrend_ar5315u_ram_defconfig    |  2 +-
 configs/comtrend_ar5387un_ram_defconfig   |  2 +-
 configs/comtrend_ct5361_ram_defconfig     |  2 +-
 configs/comtrend_vr3032u_ram_defconfig    |  2 +-
 configs/comtrend_wap5813n_ram_defconfig   |  2 +-
 configs/evb-ast2500_defconfig             |  2 +-
 configs/evb-ast2600_defconfig             |  4 +--
 configs/evb-px30_defconfig                |  2 +-
 configs/evb-px5_defconfig                 |  2 +-
 configs/evb-rk3128_defconfig              |  2 +-
 configs/evb-rk3308_defconfig              |  2 +-
 configs/evb-rk3399_defconfig              |  2 +-
 configs/firefly-px30_defconfig            |  2 +-
 configs/firefly-rk3399_defconfig          |  2 +-
 configs/gazerbeam_defconfig               |  2 +-
 configs/hsdk_4xd_defconfig                |  2 +-
 configs/hsdk_defconfig                    |  2 +-
 configs/huawei_hg556a_ram_defconfig       |  2 +-
 configs/imx8mn_beacon_2g_defconfig        |  2 +-
 configs/imx8mn_beacon_defconfig           |  2 +-
 configs/imx8mq_evk_defconfig              |  2 +-
 configs/imx8mq_phanbell_defconfig         |  2 +-
 configs/j7200_evm_a72_defconfig           |  4 +--
 configs/j7200_evm_r5_defconfig            |  4 +--
 configs/j721e_evm_a72_defconfig           |  4 +--
 configs/j721e_evm_r5_defconfig            |  4 +--
 configs/j721e_hs_evm_a72_defconfig        |  4 +--
 configs/j721e_hs_evm_r5_defconfig         |  4 +--
 configs/khadas-vim2_defconfig             |  2 +-
 configs/khadas-vim3_defconfig             |  2 +-
 configs/khadas-vim3l_defconfig            |  2 +-
 configs/khadas-vim_defconfig              |  2 +-
 configs/libretech-ac_defconfig            |  2 +-
 configs/libretech-cc_defconfig            |  2 +-
 configs/libretech-cc_v2_defconfig         |  2 +-
 configs/libretech-s905d-pc_defconfig      |  2 +-
 configs/libretech-s912-pc_defconfig       |  2 +-
 configs/nanopc-t4-rk3399_defconfig        |  2 +-
 configs/nanopi-k2_defconfig               |  2 +-
 configs/nanopi-r2s-rk3328_defconfig       |  2 +-
 configs/netgear_cg3100d_ram_defconfig     |  2 +-
 configs/netgear_dgnd3700v2_ram_defconfig  |  2 +-
 configs/odroid-c2_defconfig               |  2 +-
 configs/odroid-c4_defconfig               |  2 +-
 configs/odroid-go2_defconfig              |  2 +-
 configs/odroid-n2_defconfig               |  2 +-
 configs/p200_defconfig                    |  2 +-
 configs/p201_defconfig                    |  2 +-
 configs/p212_defconfig                    |  2 +-
 configs/pico-imx8mq_defconfig             |  2 +-
 configs/pinebook-pro-rk3399_defconfig     |  2 +-
 configs/puma-rk3399_defconfig             |  2 +-
 configs/px30-core-ctouch2-px30_defconfig  |  2 +-
 configs/px30-core-edimm2.2-px30_defconfig |  2 +-
 configs/roc-cc-rk3308_defconfig           |  2 +-
 configs/roc-cc-rk3328_defconfig           |  2 +-
 configs/roc-pc-mezzanine-rk3399_defconfig |  2 +-
 configs/roc-pc-rk3399_defconfig           |  2 +-
 configs/rock-pi-4-rk3399_defconfig        |  2 +-
 configs/rock-pi-4c-rk3399_defconfig       |  2 +-
 configs/rock-pi-e-rk3328_defconfig        |  2 +-
 configs/rock-pi-n10-rk3399pro_defconfig   |  2 +-
 configs/rock64-rk3328_defconfig           |  2 +-
 configs/rock960-rk3399_defconfig          |  2 +-
 configs/rockpro64-rk3399_defconfig        |  2 +-
 configs/rpi_4_32b_defconfig               |  2 +-
 configs/rpi_4_defconfig                   |  2 +-
 configs/rpi_arm64_defconfig               |  2 +-
 configs/s400_defconfig                    |  2 +-
 configs/sagem_f@st1704_ram_defconfig      |  2 +-
 configs/sandbox64_defconfig               |  2 +-
 configs/sandbox_defconfig                 |  2 +-
 configs/sandbox_flattree_defconfig        |  2 +-
 configs/sandbox_spl_defconfig             |  2 +-
 configs/sei510_defconfig                  |  2 +-
 configs/sei610_defconfig                  |  2 +-
 configs/sfr_nb4-ser_ram_defconfig         |  2 +-
 configs/sifive_fu540_defconfig            |  4 +--
 configs/socfpga_agilex_atf_defconfig      |  2 +-
 configs/socfpga_agilex_defconfig          |  2 +-
 configs/socfpga_agilex_vab_defconfig      |  2 +-
 configs/socfpga_arria5_defconfig          |  2 +-
 configs/socfpga_cyclone5_defconfig        |  2 +-
 configs/socfpga_dbm_soc1_defconfig        |  2 +-
 configs/socfpga_de0_nano_soc_defconfig    |  2 +-
 configs/socfpga_de10_nano_defconfig       |  2 +-
 configs/socfpga_de1_soc_defconfig         |  2 +-
 configs/socfpga_is1_defconfig             |  2 +-
 configs/socfpga_mcvevk_defconfig          |  2 +-
 configs/socfpga_secu1_defconfig           |  2 +-
 configs/socfpga_sockit_defconfig          |  2 +-
 configs/socfpga_socrates_defconfig        |  2 +-
 configs/socfpga_sr1500_defconfig          |  2 +-
 configs/socfpga_stratix10_atf_defconfig   |  2 +-
 configs/socfpga_stratix10_defconfig       |  2 +-
 configs/socfpga_vining_fpga_defconfig     |  2 +-
 configs/u200_defconfig                    |  2 +-
 configs/wetek-core2_defconfig             |  2 +-
 drivers/Makefile                          |  2 +-
 drivers/clk/sunxi/Kconfig                 |  2 +-
 drivers/gpio/dwapb_gpio.c                 |  2 +-
 drivers/net/Kconfig                       |  6 ++--
 drivers/reset/Kconfig                     | 36 +++++++++++------------
 drivers/reset/Makefile                    |  2 +-
 drivers/spi/designware_spi.c              |  2 +-
 drivers/sysreset/Kconfig                  |  2 +-
 drivers/usb/host/dwc2.c                   |  2 +-
 drivers/watchdog/designware_wdt.c         | 18 ++++++------
 include/reset.h                           |  2 +-
 test/dm/Makefile                          |  2 +-
 128 files changed, 177 insertions(+), 177 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 3307f2b3fc5..51301e6e80e 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -763,7 +763,7 @@ config ARCH_IPQ40XX
 	select DM
 	select DM_GPIO
 	select DM_SERIAL
-	select DM_RESET
+	select RESET
 	select MSM_SMEM
 	select PINCTRL
 	select CLK
@@ -976,7 +976,7 @@ config ARCH_SOCFPGA
 	select DM_SERIAL
 	select ENABLE_ARM_SOC_BOOT0_HOOK if TARGET_SOCFPGA_GEN5 || TARGET_SOCFPGA_ARRIA10
 	select OF_CONTROL
-	select SPL_DM_RESET if DM_RESET
+	select SPL_RESET if RESET
 	select SPL_DM_SERIAL
 	select SPL_LIBCOMMON_SUPPORT
 	select SPL_LIBGENERIC_SUPPORT
@@ -1640,7 +1640,7 @@ config ARCH_UNIPHIER
 	select DM_I2C
 	select DM_MMC
 	select DM_MTD
-	select DM_RESET
+	select RESET
 	select DM_SERIAL
 	select DM_USB
 	select OF_BOARD_SETUP
@@ -1674,7 +1674,7 @@ config ARCH_STI
 	select CPU_V7A
 	select DM
 	select DM_MMC
-	select DM_RESET
+	select RESET
 	select DM_SERIAL
 	imply CMD_DM
 	help
@@ -1689,7 +1689,7 @@ config ARCH_STM32MP
 	select CLK
 	select DM
 	select DM_GPIO
-	select DM_RESET
+	select RESET
 	select DM_SERIAL
 	select MISC
 	select OF_CONTROL
diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
index 9a725f195a3..b5047ab1ddf 100644
--- a/arch/arm/mach-aspeed/Kconfig
+++ b/arch/arm/mach-aspeed/Kconfig
@@ -16,7 +16,7 @@ choice
 
 config ASPEED_AST2500
 	bool "Support Aspeed AST2500 SoC"
-	depends on DM_RESET
+	depends on RESET
 	select CPU_ARM1176
 	help
 	  The Aspeed AST2500 is a ARM-based SoC with arm1176 CPU.
diff --git a/arch/arm/mach-socfpga/Kconfig b/arch/arm/mach-socfpga/Kconfig
index 0c354062328..0ec92ca25f1 100644
--- a/arch/arm/mach-socfpga/Kconfig
+++ b/arch/arm/mach-socfpga/Kconfig
@@ -67,8 +67,8 @@ config TARGET_SOCFPGA_ARRIA10
 	select CLK
 	select SPL_CLK if SPL
 	select DM_I2C
-	select DM_RESET
-	select SPL_DM_RESET if SPL
+	select RESET
+	select SPL_RESET if SPL
 	select REGMAP
 	select SPL_REGMAP if SPL
 	select SYSCON
diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
index b42b05669a1..2b008a3d73b 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -4,7 +4,7 @@ config STM32F4
 	bool "stm32f4 family"
 	select CLK
 	select DM_GPIO
-	select DM_RESET
+	select RESET
 	select MISC
 	select PINCTRL
 	select PINCTRL_STM32
@@ -20,7 +20,7 @@ config STM32F7
 	bool "stm32f7 family"
 	select CLK
 	select DM_GPIO
-	select DM_RESET
+	select RESET
 	select MISC
 	select PINCTRL
 	select PINCTRL_STM32
@@ -29,7 +29,7 @@ config STM32F7
 	select SPL_BOARD_INIT
 	select SPL_CLK
 	select SPL_DM
-	select SPL_DM_RESET
+	select SPL_RESET
 	select SPL_DM_SEQ_ALIAS
 	select SPL_DRIVERS_MISC_SUPPORT
 	select SPL_GPIO_SUPPORT
@@ -58,7 +58,7 @@ config STM32H7
 	bool "stm32h7 family"
 	select CLK
 	select DM_GPIO
-	select DM_RESET
+	select RESET
 	select MISC
 	select PINCTRL
 	select PINCTRL_STM32
diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 079d66a80c1..0bd097cea99 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -14,7 +14,7 @@ config SPL
 	select SPL_OF_TRANSLATE
 	select SPL_PINCTRL
 	select SPL_REGMAP
-	select SPL_DM_RESET
+	select SPL_RESET
 	select SPL_SERIAL_SUPPORT
 	select SPL_SPI_LOAD
 	select SPL_SYSCON
diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index a397748b72b..2d89a2161c3 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -50,7 +50,7 @@ config TEGRA_COMMON
 	select DM_KEYBOARD
 	select DM_MMC
 	select DM_PWM
-	select DM_RESET
+	select RESET
 	select DM_SERIAL
 	select DM_SPI
 	select DM_SPI_FLASH
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 77f563e98ed..dc8f2253e80 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -82,7 +82,7 @@ config ARCH_MTMIPS
 	select DM
 	imply DM_ETH
 	imply DM_GPIO
-	select DM_RESET
+	select RESET
 	select DM_SERIAL
 	select PINCTRL
 	select PINMUX
diff --git a/board/sipeed/maix/Kconfig b/board/sipeed/maix/Kconfig
index 2cdea8ea813..4020f25f241 100644
--- a/board/sipeed/maix/Kconfig
+++ b/board/sipeed/maix/Kconfig
@@ -40,7 +40,7 @@ config BOARD_SPECIFIC_OPTIONS
 	imply CLK_CCF
 	imply CLK_COMPOSITE_CCF
 	imply CLK_K210
-	imply DM_RESET
+	imply RESET
 	imply RESET_SYSCON
 	imply SYSRESET
 	imply SYSRESET_SYSCON
diff --git a/common/spl/Kconfig b/common/spl/Kconfig
index 774541c02bc..52bbdb33281 100644
--- a/common/spl/Kconfig
+++ b/common/spl/Kconfig
@@ -1010,7 +1010,7 @@ config SPL_POST_MEM_SUPPORT
 	  performed before booting. This enables the drivers in post/drivers
 	  as part of an SPL build.
 
-config SPL_DM_RESET
+config SPL_RESET
 	bool "Support reset drivers"
 	depends on SPL
 	help
diff --git a/configs/am65x_evm_a53_defconfig b/configs/am65x_evm_a53_defconfig
index 1f2d78d1ac6..2582b43e757 100644
--- a/configs/am65x_evm_a53_defconfig
+++ b/configs/am65x_evm_a53_defconfig
@@ -43,7 +43,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_DM_MAILBOX=y
 CONFIG_SPL_MTD_SUPPORT=y
 CONFIG_SPL_DM_SPI_FLASH=y
-CONFIG_SPL_DM_RESET=y
+CONFIG_SPL_RESET=y
 CONFIG_SPL_POWER_DOMAIN=y
 CONFIG_SPL_RAM_SUPPORT=y
 # CONFIG_SPL_SPI_FLASH_TINY is not set
@@ -141,7 +141,7 @@ CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
 CONFIG_DM_REGULATOR_GPIO=y
 CONFIG_REMOTEPROC_TI_K3_R5F=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_RESET_TI_SCI=y
 CONFIG_DM_SERIAL=y
 CONFIG_SOC_DEVICE=y
diff --git a/configs/am65x_evm_r5_defconfig b/configs/am65x_evm_r5_defconfig
index 57f3300380f..00a1ca98647 100644
--- a/configs/am65x_evm_r5_defconfig
+++ b/configs/am65x_evm_r5_defconfig
@@ -41,7 +41,7 @@ CONFIG_SPL_DMA=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_DM_MAILBOX=y
 CONFIG_SPL_DM_SPI_FLASH=y
-CONFIG_SPL_DM_RESET=y
+CONFIG_SPL_RESET=y
 CONFIG_SPL_POWER_SUPPORT=y
 CONFIG_SPL_POWER_DOMAIN=y
 CONFIG_SPL_RAM_SUPPORT=y
@@ -115,7 +115,7 @@ CONFIG_RAM=y
 CONFIG_SPL_RAM=y
 CONFIG_K3_SYSTEM_CONTROLLER=y
 CONFIG_REMOTEPROC_TI_K3_ARM64=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_RESET_TI_SCI=y
 CONFIG_DM_SERIAL=y
 CONFIG_SOC_DEVICE=y
diff --git a/configs/am65x_evm_r5_usbdfu_defconfig b/configs/am65x_evm_r5_usbdfu_defconfig
index 16163422251..434329c3f7e 100644
--- a/configs/am65x_evm_r5_usbdfu_defconfig
+++ b/configs/am65x_evm_r5_usbdfu_defconfig
@@ -29,7 +29,7 @@ CONFIG_SPL_DMA=y
 CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_DM_MAILBOX=y
-CONFIG_SPL_DM_RESET=y
+CONFIG_SPL_RESET=y
 CONFIG_SPL_POWER_SUPPORT=y
 CONFIG_SPL_POWER_DOMAIN=y
 CONFIG_SPL_RAM_SUPPORT=y
@@ -94,7 +94,7 @@ CONFIG_RAM=y
 CONFIG_SPL_RAM=y
 CONFIG_K3_SYSTEM_CONTROLLER=y
 CONFIG_REMOTEPROC_TI_K3_ARM64=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_RESET_TI_SCI=y
 CONFIG_DM_SERIAL=y
 CONFIG_SYSRESET=y
diff --git a/configs/am65x_evm_r5_usbmsc_defconfig b/configs/am65x_evm_r5_usbmsc_defconfig
index bd051eb2ad6..07bdcaf64d3 100644
--- a/configs/am65x_evm_r5_usbmsc_defconfig
+++ b/configs/am65x_evm_r5_usbmsc_defconfig
@@ -28,7 +28,7 @@ CONFIG_SPL_DMA=y
 CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_DM_MAILBOX=y
-CONFIG_SPL_DM_RESET=y
+CONFIG_SPL_RESET=y
 CONFIG_SPL_POWER_SUPPORT=y
 CONFIG_SPL_POWER_DOMAIN=y
 CONFIG_SPL_RAM_SUPPORT=y
@@ -93,7 +93,7 @@ CONFIG_RAM=y
 CONFIG_SPL_RAM=y
 CONFIG_K3_SYSTEM_CONTROLLER=y
 CONFIG_REMOTEPROC_TI_K3_ARM64=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_RESET_TI_SCI=y
 CONFIG_DM_SERIAL=y
 CONFIG_SYSRESET=y
diff --git a/configs/am65x_hs_evm_a53_defconfig b/configs/am65x_hs_evm_a53_defconfig
index a9737d0835f..47f338178c2 100644
--- a/configs/am65x_hs_evm_a53_defconfig
+++ b/configs/am65x_hs_evm_a53_defconfig
@@ -44,7 +44,7 @@ CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_DM_MAILBOX=y
 CONFIG_SPL_MTD_SUPPORT=y
 CONFIG_SPL_DM_SPI_FLASH=y
-CONFIG_SPL_DM_RESET=y
+CONFIG_SPL_RESET=y
 CONFIG_SPL_POWER_DOMAIN=y
 # CONFIG_SPL_SPI_FLASH_TINY is not set
 CONFIG_SPL_SPI_FLASH_SFDP_SUPPORT=y
@@ -126,7 +126,7 @@ CONFIG_PINCTRL_SINGLE=y
 CONFIG_POWER_DOMAIN=y
 CONFIG_TI_SCI_POWER_DOMAIN=y
 CONFIG_REMOTEPROC_TI_K3_R5F=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_RESET_TI_SCI=y
 CONFIG_DM_SERIAL=y
 CONFIG_SOC_DEVICE=y
diff --git a/configs/am65x_hs_evm_r5_defconfig b/configs/am65x_hs_evm_r5_defconfig
index d54f209d6f9..c17077c0607 100644
--- a/configs/am65x_hs_evm_r5_defconfig
+++ b/configs/am65x_hs_evm_r5_defconfig
@@ -38,7 +38,7 @@ CONFIG_SPL_DMA=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_DM_MAILBOX=y
 CONFIG_SPL_DM_SPI_FLASH=y
-CONFIG_SPL_DM_RESET=y
+CONFIG_SPL_RESET=y
 CONFIG_SPL_POWER_SUPPORT=y
 CONFIG_SPL_POWER_DOMAIN=y
 CONFIG_SPL_RAM_SUPPORT=y
@@ -109,7 +109,7 @@ CONFIG_RAM=y
 CONFIG_SPL_RAM=y
 CONFIG_K3_SYSTEM_CONTROLLER=y
 CONFIG_REMOTEPROC_TI_K3_ARM64=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_RESET_TI_SCI=y
 CONFIG_DM_SERIAL=y
 CONFIG_SOC_DEVICE=y
diff --git a/configs/bcm968380gerg_ram_defconfig b/configs/bcm968380gerg_ram_defconfig
index b1f8bf5000d..877c2eb3685 100644
--- a/configs/bcm968380gerg_ram_defconfig
+++ b/configs/bcm968380gerg_ram_defconfig
@@ -49,7 +49,7 @@ CONFIG_BCM6368_USBH_PHY=y
 CONFIG_PINCTRL=y
 CONFIG_POWER_DOMAIN=y
 CONFIG_BCM6328_POWER_DOMAIN=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_RESET_BCM6345=y
 CONFIG_DM_SERIAL=y
 CONFIG_BCM6345_SERIAL=y
diff --git a/configs/beelink-gtking_defconfig b/configs/beelink-gtking_defconfig
index 6270c23bb07..d289e3eac44 100644
--- a/configs/beelink-gtking_defconfig
+++ b/configs/beelink-gtking_defconfig
@@ -40,7 +40,7 @@ CONFIG_POWER_DOMAIN=y
 CONFIG_MESON_EE_POWER_DOMAIN=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
diff --git a/configs/beelink-gtkingpro_defconfig b/configs/beelink-gtkingpro_defconfig
index 310654e3536..9faf481131a 100644
--- a/configs/beelink-gtkingpro_defconfig
+++ b/configs/beelink-gtkingpro_defconfig
@@ -40,7 +40,7 @@ CONFIG_POWER_DOMAIN=y
 CONFIG_MESON_EE_POWER_DOMAIN=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
diff --git a/configs/comtrend_ar5315u_ram_defconfig b/configs/comtrend_ar5315u_ram_defconfig
index bb9c0b89bd1..9349110ba17 100644
--- a/configs/comtrend_ar5315u_ram_defconfig
+++ b/configs/comtrend_ar5315u_ram_defconfig
@@ -49,7 +49,7 @@ CONFIG_BCM6368_ETH=y
 CONFIG_PHY=y
 CONFIG_BCM6318_USBH_PHY=y
 CONFIG_BCM6328_POWER_DOMAIN=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_RESET_BCM6345=y
 CONFIG_DM_SERIAL=y
 CONFIG_BCM6345_SERIAL=y
diff --git a/configs/comtrend_ar5387un_ram_defconfig b/configs/comtrend_ar5387un_ram_defconfig
index 80bafb02aa4..7f65d977283 100644
--- a/configs/comtrend_ar5387un_ram_defconfig
+++ b/configs/comtrend_ar5387un_ram_defconfig
@@ -50,7 +50,7 @@ CONFIG_PHY=y
 CONFIG_BCM6368_USBH_PHY=y
 CONFIG_POWER_DOMAIN=y
 CONFIG_BCM6328_POWER_DOMAIN=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_RESET_BCM6345=y
 CONFIG_DM_SERIAL=y
 CONFIG_BCM6345_SERIAL=y
diff --git a/configs/comtrend_ct5361_ram_defconfig b/configs/comtrend_ct5361_ram_defconfig
index 36dcf2cdb89..ed3791984b1 100644
--- a/configs/comtrend_ct5361_ram_defconfig
+++ b/configs/comtrend_ct5361_ram_defconfig
@@ -49,7 +49,7 @@ CONFIG_DM_ETH=y
 CONFIG_BCM6348_ETH=y
 CONFIG_PHY=y
 CONFIG_BCM6348_USBH_PHY=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_RESET_BCM6345=y
 CONFIG_DM_SERIAL=y
 CONFIG_BCM6345_SERIAL=y
diff --git a/configs/comtrend_vr3032u_ram_defconfig b/configs/comtrend_vr3032u_ram_defconfig
index 1c2eeeddf82..e565511d601 100644
--- a/configs/comtrend_vr3032u_ram_defconfig
+++ b/configs/comtrend_vr3032u_ram_defconfig
@@ -51,7 +51,7 @@ CONFIG_PHY=y
 CONFIG_BCM6368_USBH_PHY=y
 CONFIG_POWER_DOMAIN=y
 CONFIG_BCM6328_POWER_DOMAIN=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_RESET_BCM6345=y
 CONFIG_DM_SERIAL=y
 CONFIG_BCM6345_SERIAL=y
diff --git a/configs/comtrend_wap5813n_ram_defconfig b/configs/comtrend_wap5813n_ram_defconfig
index fda61ecd729..28301b56b31 100644
--- a/configs/comtrend_wap5813n_ram_defconfig
+++ b/configs/comtrend_wap5813n_ram_defconfig
@@ -49,7 +49,7 @@ CONFIG_PHY_GIGE=y
 CONFIG_BCM6368_ETH=y
 CONFIG_PHY=y
 CONFIG_BCM6368_USBH_PHY=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_RESET_BCM6345=y
 CONFIG_DM_SERIAL=y
 CONFIG_BCM6345_SERIAL=y
diff --git a/configs/evb-ast2500_defconfig b/configs/evb-ast2500_defconfig
index 0370ef031a1..15607217bf8 100644
--- a/configs/evb-ast2500_defconfig
+++ b/configs/evb-ast2500_defconfig
@@ -37,7 +37,7 @@ CONFIG_FTGMAC100=y
 CONFIG_PHY=y
 CONFIG_PINCTRL=y
 CONFIG_RAM=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DM_SERIAL=y
 CONFIG_SYS_NS16550=y
 CONFIG_SYSRESET=y
diff --git a/configs/evb-ast2600_defconfig b/configs/evb-ast2600_defconfig
index 003fedd02ad..7366ba449ea 100644
--- a/configs/evb-ast2600_defconfig
+++ b/configs/evb-ast2600_defconfig
@@ -26,7 +26,7 @@ CONFIG_SPL_SIZE_LIMIT_SUBTRACT_GD=y
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_MALLOC=y
 # CONFIG_SPL_LEGACY_IMAGE_SUPPORT is not set
 CONFIG_SPL_SYS_MALLOC_SIMPLE=y
-CONFIG_SPL_DM_RESET=y
+CONFIG_SPL_RESET=y
 CONFIG_SPL_RAM_SUPPORT=y
 CONFIG_SPL_RAM_DEVICE=y
 CONFIG_HUSH_PARSER=y
@@ -58,7 +58,7 @@ CONFIG_PHY=y
 CONFIG_PINCTRL=y
 CONFIG_RAM=y
 CONFIG_SPL_RAM=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DM_SERIAL=y
 CONFIG_SYS_NS16550=y
 CONFIG_SYSRESET=y
diff --git a/configs/evb-px30_defconfig b/configs/evb-px30_defconfig
index d2fdfef2938..ea4bc607de7 100644
--- a/configs/evb-px30_defconfig
+++ b/configs/evb-px30_defconfig
@@ -84,7 +84,7 @@ CONFIG_RAM=y
 CONFIG_SPL_RAM=y
 CONFIG_TPL_RAM=y
 CONFIG_ROCKCHIP_SDRAM_COMMON=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DM_RNG=y
 CONFIG_RNG_ROCKCHIP=y
 # CONFIG_SPECIFY_CONSOLE_INDEX is not set
diff --git a/configs/evb-px5_defconfig b/configs/evb-px5_defconfig
index fce3b855947..b0bef4a06a0 100644
--- a/configs/evb-px5_defconfig
+++ b/configs/evb-px5_defconfig
@@ -63,7 +63,7 @@ CONFIG_SPL_PINCTRL=y
 CONFIG_RAM=y
 CONFIG_SPL_RAM=y
 CONFIG_TPL_RAM=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DEBUG_UART_SHIFT=2
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_SYSRESET=y
diff --git a/configs/evb-rk3128_defconfig b/configs/evb-rk3128_defconfig
index f72f27f3d8c..5b05b05a081 100644
--- a/configs/evb-rk3128_defconfig
+++ b/configs/evb-rk3128_defconfig
@@ -37,7 +37,7 @@ CONFIG_PINCTRL=y
 CONFIG_REGULATOR_PWM=y
 CONFIG_DM_REGULATOR_FIXED=y
 CONFIG_RAM=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DEBUG_UART_SHIFT=2
 CONFIG_SYSRESET=y
 CONFIG_USB=y
diff --git a/configs/evb-rk3308_defconfig b/configs/evb-rk3308_defconfig
index 9230983c880..e8a7fc6057a 100644
--- a/configs/evb-rk3308_defconfig
+++ b/configs/evb-rk3308_defconfig
@@ -58,7 +58,7 @@ CONFIG_REGULATOR_PWM=y
 CONFIG_DM_REGULATOR_FIXED=y
 CONFIG_PWM_ROCKCHIP=y
 CONFIG_RAM=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_BAUDRATE=1500000
 CONFIG_DEBUG_UART_SHIFT=2
 CONFIG_DEBUG_UART_SKIP_INIT=y
diff --git a/configs/evb-rk3399_defconfig b/configs/evb-rk3399_defconfig
index 909c68822cc..cb48629728a 100644
--- a/configs/evb-rk3399_defconfig
+++ b/configs/evb-rk3399_defconfig
@@ -43,7 +43,7 @@ CONFIG_PMIC_RK8XX=y
 CONFIG_REGULATOR_PWM=y
 CONFIG_REGULATOR_RK8XX=y
 CONFIG_PWM_ROCKCHIP=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DM_RNG=y
 CONFIG_RNG_ROCKCHIP=y
 CONFIG_BAUDRATE=1500000
diff --git a/configs/firefly-px30_defconfig b/configs/firefly-px30_defconfig
index 6487615fe08..ece29c7df5a 100644
--- a/configs/firefly-px30_defconfig
+++ b/configs/firefly-px30_defconfig
@@ -85,7 +85,7 @@ CONFIG_RAM=y
 CONFIG_SPL_RAM=y
 CONFIG_TPL_RAM=y
 CONFIG_ROCKCHIP_SDRAM_COMMON=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 # CONFIG_SPECIFY_CONSOLE_INDEX is not set
 CONFIG_DEBUG_UART_SHIFT=2
 CONFIG_DEBUG_UART_SKIP_INIT=y
diff --git a/configs/firefly-rk3399_defconfig b/configs/firefly-rk3399_defconfig
index fe9fbef7816..865ec282594 100644
--- a/configs/firefly-rk3399_defconfig
+++ b/configs/firefly-rk3399_defconfig
@@ -45,7 +45,7 @@ CONFIG_PMIC_RK8XX=y
 CONFIG_REGULATOR_PWM=y
 CONFIG_REGULATOR_RK8XX=y
 CONFIG_PWM_ROCKCHIP=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DM_RNG=y
 CONFIG_RNG_ROCKCHIP=y
 CONFIG_BAUDRATE=1500000
diff --git a/configs/gazerbeam_defconfig b/configs/gazerbeam_defconfig
index 899e61ad3ce..1ebba973218 100644
--- a/configs/gazerbeam_defconfig
+++ b/configs/gazerbeam_defconfig
@@ -192,7 +192,7 @@ CONFIG_TSEC_ENET=y
 # CONFIG_PCI is not set
 CONFIG_RAM=y
 CONFIG_MPC83XX_SDRAM=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DM_SERIAL=y
 CONFIG_SYS_NS16550=y
 CONFIG_SYSINFO=y
diff --git a/configs/hsdk_4xd_defconfig b/configs/hsdk_4xd_defconfig
index 8ae05fedece..a39d6ca10f0 100644
--- a/configs/hsdk_4xd_defconfig
+++ b/configs/hsdk_4xd_defconfig
@@ -47,7 +47,7 @@ CONFIG_SPI_FLASH_SST=y
 CONFIG_DM_ETH=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DM_SERIAL=y
 CONFIG_DEBUG_UART_SHIFT=2
 CONFIG_DEBUG_UART_ANNOUNCE=y
diff --git a/configs/hsdk_defconfig b/configs/hsdk_defconfig
index aaf127077d4..758841760b4 100644
--- a/configs/hsdk_defconfig
+++ b/configs/hsdk_defconfig
@@ -46,7 +46,7 @@ CONFIG_SPI_FLASH_SST=y
 CONFIG_DM_ETH=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DM_SERIAL=y
 CONFIG_DEBUG_UART_SHIFT=2
 CONFIG_DEBUG_UART_ANNOUNCE=y
diff --git a/configs/huawei_hg556a_ram_defconfig b/configs/huawei_hg556a_ram_defconfig
index 00290042f22..ecb9cc01744 100644
--- a/configs/huawei_hg556a_ram_defconfig
+++ b/configs/huawei_hg556a_ram_defconfig
@@ -49,7 +49,7 @@ CONFIG_DM_ETH=y
 CONFIG_BCM6348_ETH=y
 CONFIG_PHY=y
 CONFIG_BCM6358_USBH_PHY=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_RESET_BCM6345=y
 CONFIG_DM_SERIAL=y
 CONFIG_BCM6345_SERIAL=y
diff --git a/configs/imx8mn_beacon_2g_defconfig b/configs/imx8mn_beacon_2g_defconfig
index 58b8e494864..f8a9e72046e 100644
--- a/configs/imx8mn_beacon_2g_defconfig
+++ b/configs/imx8mn_beacon_2g_defconfig
@@ -111,7 +111,7 @@ CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_BD71837=y
 CONFIG_DM_REGULATOR_FIXED=y
 CONFIG_DM_REGULATOR_GPIO=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DM_SERIAL=y
 # CONFIG_SPL_DM_SERIAL is not set
 CONFIG_MXC_UART=y
diff --git a/configs/imx8mn_beacon_defconfig b/configs/imx8mn_beacon_defconfig
index d6a3385d8de..0d0b8b9d34f 100644
--- a/configs/imx8mn_beacon_defconfig
+++ b/configs/imx8mn_beacon_defconfig
@@ -110,7 +110,7 @@ CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_BD71837=y
 CONFIG_DM_REGULATOR_FIXED=y
 CONFIG_DM_REGULATOR_GPIO=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DM_SERIAL=y
 # CONFIG_SPL_DM_SERIAL is not set
 CONFIG_MXC_UART=y
diff --git a/configs/imx8mq_evk_defconfig b/configs/imx8mq_evk_defconfig
index a149c1a7709..f1f19db2ce4 100644
--- a/configs/imx8mq_evk_defconfig
+++ b/configs/imx8mq_evk_defconfig
@@ -51,6 +51,6 @@ CONFIG_IMX8M_POWER_DOMAIN=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
 CONFIG_DM_REGULATOR_GPIO=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_MXC_UART=y
 CONFIG_DM_THERMAL=y
diff --git a/configs/imx8mq_phanbell_defconfig b/configs/imx8mq_phanbell_defconfig
index 5fa89e9963f..1c3d827ea1e 100644
--- a/configs/imx8mq_phanbell_defconfig
+++ b/configs/imx8mq_phanbell_defconfig
@@ -56,6 +56,6 @@ CONFIG_IMX8M_POWER_DOMAIN=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
 CONFIG_DM_REGULATOR_GPIO=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_MXC_UART=y
 CONFIG_DM_THERMAL=y
diff --git a/configs/j7200_evm_a72_defconfig b/configs/j7200_evm_a72_defconfig
index 162bcc8753f..9b6bc812d95 100644
--- a/configs/j7200_evm_a72_defconfig
+++ b/configs/j7200_evm_a72_defconfig
@@ -45,7 +45,7 @@ CONFIG_SPL_DM_MAILBOX=y
 CONFIG_SPL_MTD_SUPPORT=y
 CONFIG_SPL_DM_SPI_FLASH=y
 CONFIG_SPL_NOR_SUPPORT=y
-CONFIG_SPL_DM_RESET=y
+CONFIG_SPL_RESET=y
 CONFIG_SPL_POWER_SUPPORT=y
 CONFIG_SPL_POWER_DOMAIN=y
 CONFIG_SPL_RAM_SUPPORT=y
@@ -154,7 +154,7 @@ CONFIG_DM_REGULATOR_GPIO=y
 CONFIG_RAM=y
 CONFIG_SPL_RAM=y
 CONFIG_REMOTEPROC_TI_K3_R5F=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_RESET_TI_SCI=y
 CONFIG_SCSI=y
 CONFIG_DM_SCSI=y
diff --git a/configs/j7200_evm_r5_defconfig b/configs/j7200_evm_r5_defconfig
index b20698fd0ed..13027204082 100644
--- a/configs/j7200_evm_r5_defconfig
+++ b/configs/j7200_evm_r5_defconfig
@@ -41,7 +41,7 @@ CONFIG_SPL_DM_MAILBOX=y
 CONFIG_SPL_MTD_SUPPORT=y
 CONFIG_SPL_DM_SPI_FLASH=y
 CONFIG_SPL_NOR_SUPPORT=y
-CONFIG_SPL_DM_RESET=y
+CONFIG_SPL_RESET=y
 CONFIG_SPL_POWER_SUPPORT=y
 CONFIG_SPL_POWER_DOMAIN=y
 CONFIG_SPL_RAM_SUPPORT=y
@@ -114,7 +114,7 @@ CONFIG_POWER_DOMAIN=y
 CONFIG_TI_SCI_POWER_DOMAIN=y
 CONFIG_K3_SYSTEM_CONTROLLER=y
 CONFIG_REMOTEPROC_TI_K3_ARM64=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_RESET_TI_SCI=y
 CONFIG_DM_SERIAL=y
 CONFIG_SOC_DEVICE=y
diff --git a/configs/j721e_evm_a72_defconfig b/configs/j721e_evm_a72_defconfig
index e14005c39dd..8b399a60ab8 100644
--- a/configs/j721e_evm_a72_defconfig
+++ b/configs/j721e_evm_a72_defconfig
@@ -42,7 +42,7 @@ CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_DM_MAILBOX=y
 CONFIG_SPL_DM_SPI_FLASH=y
-CONFIG_SPL_DM_RESET=y
+CONFIG_SPL_RESET=y
 CONFIG_SPL_POWER_SUPPORT=y
 CONFIG_SPL_POWER_DOMAIN=y
 CONFIG_SPL_RAM_SUPPORT=y
@@ -153,7 +153,7 @@ CONFIG_RAM=y
 CONFIG_SPL_RAM=y
 CONFIG_REMOTEPROC_TI_K3_DSP=y
 CONFIG_REMOTEPROC_TI_K3_R5F=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_RESET_TI_SCI=y
 CONFIG_SCSI=y
 CONFIG_DM_SCSI=y
diff --git a/configs/j721e_evm_r5_defconfig b/configs/j721e_evm_r5_defconfig
index 7b4f0afce61..1067f2aabea 100644
--- a/configs/j721e_evm_r5_defconfig
+++ b/configs/j721e_evm_r5_defconfig
@@ -39,7 +39,7 @@ CONFIG_SPL_FS_EXT4=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_DM_MAILBOX=y
 CONFIG_SPL_DM_SPI_FLASH=y
-CONFIG_SPL_DM_RESET=y
+CONFIG_SPL_RESET=y
 CONFIG_SPL_POWER_SUPPORT=y
 CONFIG_SPL_POWER_DOMAIN=y
 CONFIG_SPL_RAM_SUPPORT=y
@@ -112,7 +112,7 @@ CONFIG_DM_REGULATOR_TPS65941=y
 CONFIG_K3_SYSTEM_CONTROLLER=y
 CONFIG_REMOTEPROC_TI_K3_ARM64=y
 CONFIG_REMOTEPROC_TI_K3_R5F=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_RESET_TI_SCI=y
 CONFIG_DM_SERIAL=y
 CONFIG_SOC_DEVICE=y
diff --git a/configs/j721e_hs_evm_a72_defconfig b/configs/j721e_hs_evm_a72_defconfig
index 28bf56e7e10..3fc595fd681 100644
--- a/configs/j721e_hs_evm_a72_defconfig
+++ b/configs/j721e_hs_evm_a72_defconfig
@@ -40,7 +40,7 @@ CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_DM_MAILBOX=y
 CONFIG_SPL_DM_SPI_FLASH=y
-CONFIG_SPL_DM_RESET=y
+CONFIG_SPL_RESET=y
 CONFIG_SPL_POWER_SUPPORT=y
 CONFIG_SPL_POWER_DOMAIN=y
 # CONFIG_SPL_SPI_FLASH_TINY is not set
@@ -134,7 +134,7 @@ CONFIG_TI_SCI_POWER_DOMAIN=y
 CONFIG_RAM=y
 CONFIG_REMOTEPROC_TI_K3_DSP=y
 CONFIG_REMOTEPROC_TI_K3_R5F=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_RESET_TI_SCI=y
 CONFIG_SCSI=y
 CONFIG_DM_SCSI=y
diff --git a/configs/j721e_hs_evm_r5_defconfig b/configs/j721e_hs_evm_r5_defconfig
index f4faa740686..38f998a9455 100644
--- a/configs/j721e_hs_evm_r5_defconfig
+++ b/configs/j721e_hs_evm_r5_defconfig
@@ -38,7 +38,7 @@ CONFIG_SPL_ENV_SUPPORT=y
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_SPL_DM_MAILBOX=y
 CONFIG_SPL_DM_SPI_FLASH=y
-CONFIG_SPL_DM_RESET=y
+CONFIG_SPL_RESET=y
 CONFIG_SPL_POWER_SUPPORT=y
 CONFIG_SPL_POWER_DOMAIN=y
 CONFIG_SPL_RAM_SUPPORT=y
@@ -105,7 +105,7 @@ CONFIG_SPL_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_TPS65941=y
 CONFIG_K3_SYSTEM_CONTROLLER=y
 CONFIG_REMOTEPROC_TI_K3_ARM64=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_RESET_TI_SCI=y
 CONFIG_DM_SERIAL=y
 CONFIG_SOC_DEVICE=y
diff --git a/configs/khadas-vim2_defconfig b/configs/khadas-vim2_defconfig
index c26c0ca45c4..842713ce046 100644
--- a/configs/khadas-vim2_defconfig
+++ b/configs/khadas-vim2_defconfig
@@ -44,7 +44,7 @@ CONFIG_PINCTRL=y
 CONFIG_PINCTRL_MESON_GXL=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
diff --git a/configs/khadas-vim3_defconfig b/configs/khadas-vim3_defconfig
index bc174305692..cecdbbf55e7 100644
--- a/configs/khadas-vim3_defconfig
+++ b/configs/khadas-vim3_defconfig
@@ -51,7 +51,7 @@ CONFIG_POWER_DOMAIN=y
 CONFIG_MESON_EE_POWER_DOMAIN=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
diff --git a/configs/khadas-vim3l_defconfig b/configs/khadas-vim3l_defconfig
index c1877922c71..ad578851795 100644
--- a/configs/khadas-vim3l_defconfig
+++ b/configs/khadas-vim3l_defconfig
@@ -51,7 +51,7 @@ CONFIG_POWER_DOMAIN=y
 CONFIG_MESON_EE_POWER_DOMAIN=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
diff --git a/configs/khadas-vim_defconfig b/configs/khadas-vim_defconfig
index e7e5c420350..db77b35e5ba 100644
--- a/configs/khadas-vim_defconfig
+++ b/configs/khadas-vim_defconfig
@@ -40,7 +40,7 @@ CONFIG_PINCTRL=y
 CONFIG_PINCTRL_MESON_GXL=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
diff --git a/configs/libretech-ac_defconfig b/configs/libretech-ac_defconfig
index ca61591bd71..783ac4540cf 100644
--- a/configs/libretech-ac_defconfig
+++ b/configs/libretech-ac_defconfig
@@ -54,7 +54,7 @@ CONFIG_POWER_DOMAIN=y
 CONFIG_MESON_EE_POWER_DOMAIN=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
diff --git a/configs/libretech-cc_defconfig b/configs/libretech-cc_defconfig
index fb4bf4c9292..e1a929c644d 100644
--- a/configs/libretech-cc_defconfig
+++ b/configs/libretech-cc_defconfig
@@ -41,7 +41,7 @@ CONFIG_POWER_DOMAIN=y
 CONFIG_MESON_EE_POWER_DOMAIN=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
diff --git a/configs/libretech-cc_v2_defconfig b/configs/libretech-cc_v2_defconfig
index 86f88dbc6eb..6b44c4c0259 100644
--- a/configs/libretech-cc_v2_defconfig
+++ b/configs/libretech-cc_v2_defconfig
@@ -48,7 +48,7 @@ CONFIG_PINCTRL=y
 CONFIG_PINCTRL_MESON_GXL=y
 CONFIG_POWER_DOMAIN=y
 CONFIG_MESON_GX_VPU_POWER_DOMAIN=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
diff --git a/configs/libretech-s905d-pc_defconfig b/configs/libretech-s905d-pc_defconfig
index 85dfd9c7300..2e94a5c4a69 100644
--- a/configs/libretech-s905d-pc_defconfig
+++ b/configs/libretech-s905d-pc_defconfig
@@ -48,7 +48,7 @@ CONFIG_POWER_DOMAIN=y
 CONFIG_MESON_EE_POWER_DOMAIN=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
diff --git a/configs/libretech-s912-pc_defconfig b/configs/libretech-s912-pc_defconfig
index a515833cc5c..b1a0baeab2f 100644
--- a/configs/libretech-s912-pc_defconfig
+++ b/configs/libretech-s912-pc_defconfig
@@ -47,7 +47,7 @@ CONFIG_POWER_DOMAIN=y
 CONFIG_MESON_EE_POWER_DOMAIN=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
diff --git a/configs/nanopc-t4-rk3399_defconfig b/configs/nanopc-t4-rk3399_defconfig
index 4bda66ada9b..6a4c0bd6095 100644
--- a/configs/nanopc-t4-rk3399_defconfig
+++ b/configs/nanopc-t4-rk3399_defconfig
@@ -41,7 +41,7 @@ CONFIG_PMIC_RK8XX=y
 CONFIG_REGULATOR_PWM=y
 CONFIG_REGULATOR_RK8XX=y
 CONFIG_PWM_ROCKCHIP=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_BAUDRATE=1500000
 CONFIG_DEBUG_UART_SHIFT=2
 CONFIG_SYSRESET=y
diff --git a/configs/nanopi-k2_defconfig b/configs/nanopi-k2_defconfig
index c2dc4881713..abba4a0c7f6 100644
--- a/configs/nanopi-k2_defconfig
+++ b/configs/nanopi-k2_defconfig
@@ -34,7 +34,7 @@ CONFIG_PINCTRL=y
 CONFIG_PINCTRL_MESON_GXBB=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
diff --git a/configs/nanopi-r2s-rk3328_defconfig b/configs/nanopi-r2s-rk3328_defconfig
index ea46dd0b28c..738838cbee2 100644
--- a/configs/nanopi-r2s-rk3328_defconfig
+++ b/configs/nanopi-r2s-rk3328_defconfig
@@ -75,7 +75,7 @@ CONFIG_PWM_ROCKCHIP=y
 CONFIG_RAM=y
 CONFIG_SPL_RAM=y
 CONFIG_TPL_RAM=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_BAUDRATE=1500000
 CONFIG_DEBUG_UART_SHIFT=2
 CONFIG_SYSINFO=y
diff --git a/configs/netgear_cg3100d_ram_defconfig b/configs/netgear_cg3100d_ram_defconfig
index 538056cfda8..adbd2a76fc3 100644
--- a/configs/netgear_cg3100d_ram_defconfig
+++ b/configs/netgear_cg3100d_ram_defconfig
@@ -41,7 +41,7 @@ CONFIG_MTD=y
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH_SPANSION=y
 CONFIG_SPI_FLASH_MTD=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_RESET_BCM6345=y
 CONFIG_DM_SERIAL=y
 CONFIG_BCM6345_SERIAL=y
diff --git a/configs/netgear_dgnd3700v2_ram_defconfig b/configs/netgear_dgnd3700v2_ram_defconfig
index 333652de122..ae596dd24f8 100644
--- a/configs/netgear_dgnd3700v2_ram_defconfig
+++ b/configs/netgear_dgnd3700v2_ram_defconfig
@@ -48,7 +48,7 @@ CONFIG_PHY=y
 CONFIG_BCM6368_USBH_PHY=y
 CONFIG_POWER_DOMAIN=y
 CONFIG_BCM6328_POWER_DOMAIN=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_RESET_BCM6345=y
 CONFIG_DM_SERIAL=y
 CONFIG_BCM6345_SERIAL=y
diff --git a/configs/odroid-c2_defconfig b/configs/odroid-c2_defconfig
index 5c02fa1e621..684f0652158 100644
--- a/configs/odroid-c2_defconfig
+++ b/configs/odroid-c2_defconfig
@@ -42,7 +42,7 @@ CONFIG_MESON_EE_POWER_DOMAIN=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
 CONFIG_DM_REGULATOR_GPIO=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
diff --git a/configs/odroid-c4_defconfig b/configs/odroid-c4_defconfig
index 8a9b8b0c021..1331aebdbf4 100644
--- a/configs/odroid-c4_defconfig
+++ b/configs/odroid-c4_defconfig
@@ -40,7 +40,7 @@ CONFIG_POWER_DOMAIN=y
 CONFIG_MESON_EE_POWER_DOMAIN=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
diff --git a/configs/odroid-go2_defconfig b/configs/odroid-go2_defconfig
index 853890901a1..359f2b92594 100644
--- a/configs/odroid-go2_defconfig
+++ b/configs/odroid-go2_defconfig
@@ -90,7 +90,7 @@ CONFIG_RAM=y
 CONFIG_SPL_RAM=y
 CONFIG_TPL_RAM=y
 CONFIG_ROCKCHIP_SDRAM_COMMON=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 # CONFIG_SPECIFY_CONSOLE_INDEX is not set
 CONFIG_DEBUG_UART_SHIFT=2
 CONFIG_DEBUG_UART_SKIP_INIT=y
diff --git a/configs/odroid-n2_defconfig b/configs/odroid-n2_defconfig
index b82bd78f2d5..b758ac62b1c 100644
--- a/configs/odroid-n2_defconfig
+++ b/configs/odroid-n2_defconfig
@@ -40,7 +40,7 @@ CONFIG_POWER_DOMAIN=y
 CONFIG_MESON_EE_POWER_DOMAIN=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
diff --git a/configs/p200_defconfig b/configs/p200_defconfig
index 6efc7bc92d6..da6e90bd33d 100644
--- a/configs/p200_defconfig
+++ b/configs/p200_defconfig
@@ -33,7 +33,7 @@ CONFIG_PINCTRL=y
 CONFIG_PINCTRL_MESON_GXBB=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
diff --git a/configs/p201_defconfig b/configs/p201_defconfig
index a1d3f04b4f0..ade45716556 100644
--- a/configs/p201_defconfig
+++ b/configs/p201_defconfig
@@ -34,7 +34,7 @@ CONFIG_PINCTRL=y
 CONFIG_PINCTRL_MESON_GXBB=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
diff --git a/configs/p212_defconfig b/configs/p212_defconfig
index da66c50ea0b..c51f75dac46 100644
--- a/configs/p212_defconfig
+++ b/configs/p212_defconfig
@@ -37,7 +37,7 @@ CONFIG_PINCTRL=y
 CONFIG_PINCTRL_MESON_GXL=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
diff --git a/configs/pico-imx8mq_defconfig b/configs/pico-imx8mq_defconfig
index e2e3a15da19..60851f1b38d 100644
--- a/configs/pico-imx8mq_defconfig
+++ b/configs/pico-imx8mq_defconfig
@@ -54,6 +54,6 @@ CONFIG_IMX8M_POWER_DOMAIN=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
 CONFIG_DM_REGULATOR_GPIO=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_MXC_UART=y
 CONFIG_DM_THERMAL=y
diff --git a/configs/pinebook-pro-rk3399_defconfig b/configs/pinebook-pro-rk3399_defconfig
index c4bab29a063..9ac10af9b12 100644
--- a/configs/pinebook-pro-rk3399_defconfig
+++ b/configs/pinebook-pro-rk3399_defconfig
@@ -64,7 +64,7 @@ CONFIG_REGULATOR_PWM=y
 CONFIG_REGULATOR_RK8XX=y
 CONFIG_PWM_ROCKCHIP=y
 CONFIG_RAM_RK3399_LPDDR4=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DM_RNG=y
 CONFIG_RNG_ROCKCHIP=y
 CONFIG_BAUDRATE=1500000
diff --git a/configs/puma-rk3399_defconfig b/configs/puma-rk3399_defconfig
index 0f15936c2d6..77562dad9a7 100644
--- a/configs/puma-rk3399_defconfig
+++ b/configs/puma-rk3399_defconfig
@@ -73,7 +73,7 @@ CONFIG_SPL_DM_REGULATOR_FIXED=y
 CONFIG_DM_REGULATOR_GPIO=y
 CONFIG_REGULATOR_RK8XX=y
 CONFIG_PWM_ROCKCHIP=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DM_RTC=y
 CONFIG_RTC_ISL1208=y
 CONFIG_DEBUG_UART_SHIFT=2
diff --git a/configs/px30-core-ctouch2-px30_defconfig b/configs/px30-core-ctouch2-px30_defconfig
index 1afc146bbf2..ee08fd2bf2e 100644
--- a/configs/px30-core-ctouch2-px30_defconfig
+++ b/configs/px30-core-ctouch2-px30_defconfig
@@ -84,7 +84,7 @@ CONFIG_RAM=y
 CONFIG_SPL_RAM=y
 CONFIG_TPL_RAM=y
 CONFIG_ROCKCHIP_SDRAM_COMMON=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DM_RNG=y
 CONFIG_RNG_ROCKCHIP=y
 # CONFIG_SPECIFY_CONSOLE_INDEX is not set
diff --git a/configs/px30-core-edimm2.2-px30_defconfig b/configs/px30-core-edimm2.2-px30_defconfig
index 9d78eee84d7..8305488e122 100644
--- a/configs/px30-core-edimm2.2-px30_defconfig
+++ b/configs/px30-core-edimm2.2-px30_defconfig
@@ -84,7 +84,7 @@ CONFIG_RAM=y
 CONFIG_SPL_RAM=y
 CONFIG_TPL_RAM=y
 CONFIG_ROCKCHIP_SDRAM_COMMON=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DM_RNG=y
 CONFIG_RNG_ROCKCHIP=y
 # CONFIG_SPECIFY_CONSOLE_INDEX is not set
diff --git a/configs/roc-cc-rk3308_defconfig b/configs/roc-cc-rk3308_defconfig
index 2d02e294e68..038eaae0f1a 100644
--- a/configs/roc-cc-rk3308_defconfig
+++ b/configs/roc-cc-rk3308_defconfig
@@ -58,7 +58,7 @@ CONFIG_REGULATOR_PWM=y
 CONFIG_DM_REGULATOR_FIXED=y
 CONFIG_PWM_ROCKCHIP=y
 CONFIG_RAM=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_BAUDRATE=1500000
 CONFIG_DEBUG_UART_SHIFT=2
 CONFIG_DEBUG_UART_SKIP_INIT=y
diff --git a/configs/roc-cc-rk3328_defconfig b/configs/roc-cc-rk3328_defconfig
index aa131bf8ea0..5828eb0a491 100644
--- a/configs/roc-cc-rk3328_defconfig
+++ b/configs/roc-cc-rk3328_defconfig
@@ -79,7 +79,7 @@ CONFIG_PWM_ROCKCHIP=y
 CONFIG_RAM=y
 CONFIG_SPL_RAM=y
 CONFIG_TPL_RAM=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_BAUDRATE=1500000
 CONFIG_DEBUG_UART_SHIFT=2
 CONFIG_SYSINFO=y
diff --git a/configs/roc-pc-mezzanine-rk3399_defconfig b/configs/roc-pc-mezzanine-rk3399_defconfig
index 8aa5a155180..0fe8b9e30a4 100644
--- a/configs/roc-pc-mezzanine-rk3399_defconfig
+++ b/configs/roc-pc-mezzanine-rk3399_defconfig
@@ -57,7 +57,7 @@ CONFIG_REGULATOR_RK8XX=y
 CONFIG_PWM_ROCKCHIP=y
 # CONFIG_RAM_ROCKCHIP_DEBUG is not set
 CONFIG_RAM_RK3399_LPDDR4=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_BAUDRATE=1500000
 CONFIG_DEBUG_UART_SHIFT=2
 CONFIG_ROCKCHIP_SPI=y
diff --git a/configs/roc-pc-rk3399_defconfig b/configs/roc-pc-rk3399_defconfig
index 927b57685d9..b6577ee4606 100644
--- a/configs/roc-pc-rk3399_defconfig
+++ b/configs/roc-pc-rk3399_defconfig
@@ -54,7 +54,7 @@ CONFIG_REGULATOR_RK8XX=y
 CONFIG_PWM_ROCKCHIP=y
 # CONFIG_RAM_ROCKCHIP_DEBUG is not set
 CONFIG_RAM_RK3399_LPDDR4=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_BAUDRATE=1500000
 CONFIG_DEBUG_UART_SHIFT=2
 CONFIG_ROCKCHIP_SPI=y
diff --git a/configs/rock-pi-4-rk3399_defconfig b/configs/rock-pi-4-rk3399_defconfig
index c7e1a8d2e4b..28f551ffb1f 100644
--- a/configs/rock-pi-4-rk3399_defconfig
+++ b/configs/rock-pi-4-rk3399_defconfig
@@ -47,7 +47,7 @@ CONFIG_REGULATOR_PWM=y
 CONFIG_REGULATOR_RK8XX=y
 CONFIG_PWM_ROCKCHIP=y
 CONFIG_RAM_RK3399_LPDDR4=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_BAUDRATE=1500000
 CONFIG_DEBUG_UART_SHIFT=2
 CONFIG_SYSRESET=y
diff --git a/configs/rock-pi-4c-rk3399_defconfig b/configs/rock-pi-4c-rk3399_defconfig
index 9c2c9e2a785..6345b0a7125 100644
--- a/configs/rock-pi-4c-rk3399_defconfig
+++ b/configs/rock-pi-4c-rk3399_defconfig
@@ -47,7 +47,7 @@ CONFIG_REGULATOR_PWM=y
 CONFIG_REGULATOR_RK8XX=y
 CONFIG_PWM_ROCKCHIP=y
 CONFIG_RAM_RK3399_LPDDR4=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_BAUDRATE=1500000
 CONFIG_DEBUG_UART_SHIFT=2
 CONFIG_SYSRESET=y
diff --git a/configs/rock-pi-e-rk3328_defconfig b/configs/rock-pi-e-rk3328_defconfig
index bc4068a2d9f..7b9a7a83cd8 100644
--- a/configs/rock-pi-e-rk3328_defconfig
+++ b/configs/rock-pi-e-rk3328_defconfig
@@ -79,7 +79,7 @@ CONFIG_PWM_ROCKCHIP=y
 CONFIG_RAM=y
 CONFIG_SPL_RAM=y
 CONFIG_TPL_RAM=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_BAUDRATE=1500000
 CONFIG_DEBUG_UART_SHIFT=2
 CONFIG_DEBUG_UART_ANNOUNCE=y
diff --git a/configs/rock-pi-n10-rk3399pro_defconfig b/configs/rock-pi-n10-rk3399pro_defconfig
index 3255e015120..80e3a939ef2 100644
--- a/configs/rock-pi-n10-rk3399pro_defconfig
+++ b/configs/rock-pi-n10-rk3399pro_defconfig
@@ -49,7 +49,7 @@ CONFIG_REGULATOR_PWM=y
 CONFIG_REGULATOR_RK8XX=y
 CONFIG_PWM_ROCKCHIP=y
 # CONFIG_RAM_ROCKCHIP_DEBUG is not set
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_BAUDRATE=1500000
 CONFIG_DEBUG_UART_SHIFT=2
 CONFIG_SYSRESET=y
diff --git a/configs/rock64-rk3328_defconfig b/configs/rock64-rk3328_defconfig
index cb79cea821f..3a694c5b00a 100644
--- a/configs/rock64-rk3328_defconfig
+++ b/configs/rock64-rk3328_defconfig
@@ -77,7 +77,7 @@ CONFIG_PWM_ROCKCHIP=y
 CONFIG_RAM=y
 CONFIG_SPL_RAM=y
 CONFIG_TPL_RAM=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_BAUDRATE=1500000
 CONFIG_DEBUG_UART_SHIFT=2
 CONFIG_ROCKCHIP_SPI=y
diff --git a/configs/rock960-rk3399_defconfig b/configs/rock960-rk3399_defconfig
index 28d1fc53a59..211f925f0c5 100644
--- a/configs/rock960-rk3399_defconfig
+++ b/configs/rock960-rk3399_defconfig
@@ -47,7 +47,7 @@ CONFIG_PMIC_RK8XX=y
 CONFIG_REGULATOR_PWM=y
 CONFIG_REGULATOR_RK8XX=y
 CONFIG_PWM_ROCKCHIP=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DM_RNG=y
 CONFIG_RNG_ROCKCHIP=y
 CONFIG_BAUDRATE=1500000
diff --git a/configs/rockpro64-rk3399_defconfig b/configs/rockpro64-rk3399_defconfig
index e9a01ec9d56..468b164b5c2 100644
--- a/configs/rockpro64-rk3399_defconfig
+++ b/configs/rockpro64-rk3399_defconfig
@@ -55,7 +55,7 @@ CONFIG_REGULATOR_PWM=y
 CONFIG_REGULATOR_RK8XX=y
 CONFIG_PWM_ROCKCHIP=y
 CONFIG_RAM_RK3399_LPDDR4=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DM_RNG=y
 CONFIG_RNG_ROCKCHIP=y
 CONFIG_BAUDRATE=1500000
diff --git a/configs/rpi_4_32b_defconfig b/configs/rpi_4_32b_defconfig
index 0cbdd5fee10..a6c71ec93cf 100644
--- a/configs/rpi_4_32b_defconfig
+++ b/configs/rpi_4_32b_defconfig
@@ -35,7 +35,7 @@ CONFIG_DM_PCI=y
 CONFIG_PCI_BRCMSTB=y
 CONFIG_PINCTRL=y
 # CONFIG_PINCTRL_GENERIC is not set
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DM_RNG=y
 CONFIG_RNG_IPROC200=y
 # CONFIG_REQUIRE_SERIAL_CONSOLE is not set
diff --git a/configs/rpi_4_defconfig b/configs/rpi_4_defconfig
index 3f21f99edbf..6586f051d75 100644
--- a/configs/rpi_4_defconfig
+++ b/configs/rpi_4_defconfig
@@ -35,7 +35,7 @@ CONFIG_DM_PCI=y
 CONFIG_PCI_BRCMSTB=y
 CONFIG_PINCTRL=y
 # CONFIG_PINCTRL_GENERIC is not set
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DM_RNG=y
 CONFIG_RNG_IPROC200=y
 # CONFIG_REQUIRE_SERIAL_CONSOLE is not set
diff --git a/configs/rpi_arm64_defconfig b/configs/rpi_arm64_defconfig
index d282d509ce8..936e0629161 100644
--- a/configs/rpi_arm64_defconfig
+++ b/configs/rpi_arm64_defconfig
@@ -32,7 +32,7 @@ CONFIG_DM_PCI=y
 CONFIG_PCI_BRCMSTB=y
 CONFIG_PINCTRL=y
 # CONFIG_PINCTRL_GENERIC is not set
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DM_RNG=y
 CONFIG_RNG_IPROC200=y
 # CONFIG_REQUIRE_SERIAL_CONSOLE is not set
diff --git a/configs/s400_defconfig b/configs/s400_defconfig
index a15ac32986a..1eea2f7231c 100644
--- a/configs/s400_defconfig
+++ b/configs/s400_defconfig
@@ -35,7 +35,7 @@ CONFIG_PINCTRL=y
 CONFIG_PINCTRL_MESON_AXG=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
diff --git a/configs/sagem_f@st1704_ram_defconfig b/configs/sagem_f@st1704_ram_defconfig
index efd23b405c5..af7d661d726 100644
--- a/configs/sagem_f@st1704_ram_defconfig
+++ b/configs/sagem_f@st1704_ram_defconfig
@@ -46,7 +46,7 @@ CONFIG_SPI_FLASH_MTD=y
 CONFIG_PHY_FIXED=y
 CONFIG_DM_ETH=y
 CONFIG_BCM6348_ETH=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_RESET_BCM6345=y
 CONFIG_DM_SERIAL=y
 CONFIG_BCM6345_SERIAL=y
diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
index cfda83474b6..68882b4e672 100644
--- a/configs/sandbox64_defconfig
+++ b/configs/sandbox64_defconfig
@@ -189,7 +189,7 @@ CONFIG_DM_PWM=y
 CONFIG_PWM_SANDBOX=y
 CONFIG_RAM=y
 CONFIG_REMOTEPROC_SANDBOX=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_SANDBOX_RESET=y
 CONFIG_DM_RNG=y
 CONFIG_DM_RTC=y
diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
index 5bc90d09a8f..4a52dfbd63f 100644
--- a/configs/sandbox_defconfig
+++ b/configs/sandbox_defconfig
@@ -223,7 +223,7 @@ CONFIG_DM_PWM=y
 CONFIG_PWM_SANDBOX=y
 CONFIG_RAM=y
 CONFIG_REMOTEPROC_SANDBOX=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_SANDBOX_RESET=y
 CONFIG_RESET_SYSCON=y
 CONFIG_RESET_SCMI=y
diff --git a/configs/sandbox_flattree_defconfig b/configs/sandbox_flattree_defconfig
index 4401f33f0ba..66655f88102 100644
--- a/configs/sandbox_flattree_defconfig
+++ b/configs/sandbox_flattree_defconfig
@@ -166,7 +166,7 @@ CONFIG_DM_PWM=y
 CONFIG_PWM_SANDBOX=y
 CONFIG_RAM=y
 CONFIG_REMOTEPROC_SANDBOX=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_SANDBOX_RESET=y
 CONFIG_DM_RTC=y
 CONFIG_SANDBOX_SERIAL=y
diff --git a/configs/sandbox_spl_defconfig b/configs/sandbox_spl_defconfig
index 2696d0b6cdd..51f92fc107a 100644
--- a/configs/sandbox_spl_defconfig
+++ b/configs/sandbox_spl_defconfig
@@ -184,7 +184,7 @@ CONFIG_DM_PWM=y
 CONFIG_PWM_SANDBOX=y
 CONFIG_RAM=y
 CONFIG_REMOTEPROC_SANDBOX=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_SANDBOX_RESET=y
 CONFIG_DM_RTC=y
 CONFIG_SPL_DM_RTC=y
diff --git a/configs/sei510_defconfig b/configs/sei510_defconfig
index 7b97a2f6f34..19f6f0a9428 100644
--- a/configs/sei510_defconfig
+++ b/configs/sei510_defconfig
@@ -56,7 +56,7 @@ CONFIG_POWER_DOMAIN=y
 CONFIG_MESON_EE_POWER_DOMAIN=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
diff --git a/configs/sei610_defconfig b/configs/sei610_defconfig
index 0ed17091b58..949ff41cda6 100644
--- a/configs/sei610_defconfig
+++ b/configs/sei610_defconfig
@@ -56,7 +56,7 @@ CONFIG_POWER_DOMAIN=y
 CONFIG_MESON_EE_POWER_DOMAIN=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
diff --git a/configs/sfr_nb4-ser_ram_defconfig b/configs/sfr_nb4-ser_ram_defconfig
index 6cf07402a5d..fffe7fb093a 100644
--- a/configs/sfr_nb4-ser_ram_defconfig
+++ b/configs/sfr_nb4-ser_ram_defconfig
@@ -51,7 +51,7 @@ CONFIG_DM_ETH=y
 CONFIG_BCM6348_ETH=y
 CONFIG_PHY=y
 CONFIG_BCM6358_USBH_PHY=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_RESET_BCM6345=y
 CONFIG_DM_SERIAL=y
 CONFIG_BCM6345_SERIAL=y
diff --git a/configs/sifive_fu540_defconfig b/configs/sifive_fu540_defconfig
index cabd3b17782..fca339bf0ec 100644
--- a/configs/sifive_fu540_defconfig
+++ b/configs/sifive_fu540_defconfig
@@ -19,11 +19,11 @@ CONFIG_DISPLAY_BOARDINFO=y
 CONFIG_MISC_INIT_R=y
 CONFIG_SPL_SEPARATE_BSS=y
 CONFIG_SPL_DM_SPI_FLASH=y
-CONFIG_SPL_DM_RESET=y
+CONFIG_SPL_RESET=y
 CONFIG_SPL_SPI_LOAD=y
 CONFIG_SPL_YMODEM_SUPPORT=y
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_SPL_CLK=y
 CONFIG_DM_MTD=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
diff --git a/configs/socfpga_agilex_atf_defconfig b/configs/socfpga_agilex_atf_defconfig
index 7adda02b000..c2e42669343 100644
--- a/configs/socfpga_agilex_atf_defconfig
+++ b/configs/socfpga_agilex_atf_defconfig
@@ -59,7 +59,7 @@ CONFIG_PHY_MICREL_KSZ90X1=y
 CONFIG_DM_ETH=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_SPI=y
 CONFIG_CADENCE_QSPI=y
 CONFIG_DESIGNWARE_SPI=y
diff --git a/configs/socfpga_agilex_defconfig b/configs/socfpga_agilex_defconfig
index 3d5d39fe0f8..1ac92d4575a 100644
--- a/configs/socfpga_agilex_defconfig
+++ b/configs/socfpga_agilex_defconfig
@@ -54,7 +54,7 @@ CONFIG_PHY_MICREL_KSZ90X1=y
 CONFIG_DM_ETH=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_SPI=y
 CONFIG_CADENCE_QSPI=y
 CONFIG_DESIGNWARE_SPI=y
diff --git a/configs/socfpga_agilex_vab_defconfig b/configs/socfpga_agilex_vab_defconfig
index bca663ed617..d7dea7d622d 100644
--- a/configs/socfpga_agilex_vab_defconfig
+++ b/configs/socfpga_agilex_vab_defconfig
@@ -61,7 +61,7 @@ CONFIG_PHY_MICREL_KSZ90X1=y
 CONFIG_DM_ETH=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_SPI=y
 CONFIG_CADENCE_QSPI=y
 CONFIG_DESIGNWARE_SPI=y
diff --git a/configs/socfpga_arria5_defconfig b/configs/socfpga_arria5_defconfig
index ff9c8340fe5..2a2cdd27fb4 100644
--- a/configs/socfpga_arria5_defconfig
+++ b/configs/socfpga_arria5_defconfig
@@ -54,7 +54,7 @@ CONFIG_PHY_MICREL_KSZ90X1=y
 CONFIG_DM_ETH=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_SPI=y
 CONFIG_CADENCE_QSPI=y
 CONFIG_DESIGNWARE_SPI=y
diff --git a/configs/socfpga_cyclone5_defconfig b/configs/socfpga_cyclone5_defconfig
index 5b75026ee85..adf570b3442 100644
--- a/configs/socfpga_cyclone5_defconfig
+++ b/configs/socfpga_cyclone5_defconfig
@@ -55,7 +55,7 @@ CONFIG_PHY_MICREL_KSZ90X1=y
 CONFIG_DM_ETH=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_SPI=y
 CONFIG_CADENCE_QSPI=y
 CONFIG_DESIGNWARE_SPI=y
diff --git a/configs/socfpga_dbm_soc1_defconfig b/configs/socfpga_dbm_soc1_defconfig
index 73549fe6790..a1f3418e722 100644
--- a/configs/socfpga_dbm_soc1_defconfig
+++ b/configs/socfpga_dbm_soc1_defconfig
@@ -55,7 +55,7 @@ CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_SPI=y
 CONFIG_USB=y
 CONFIG_DM_USB=y
diff --git a/configs/socfpga_de0_nano_soc_defconfig b/configs/socfpga_de0_nano_soc_defconfig
index 6c49f289550..66432afbe46 100644
--- a/configs/socfpga_de0_nano_soc_defconfig
+++ b/configs/socfpga_de0_nano_soc_defconfig
@@ -51,7 +51,7 @@ CONFIG_PHY_MICREL_KSZ90X1=y
 CONFIG_DM_ETH=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_SPI=y
 CONFIG_CADENCE_QSPI=y
 CONFIG_DESIGNWARE_SPI=y
diff --git a/configs/socfpga_de10_nano_defconfig b/configs/socfpga_de10_nano_defconfig
index 9075af61e47..b51065ce5df 100644
--- a/configs/socfpga_de10_nano_defconfig
+++ b/configs/socfpga_de10_nano_defconfig
@@ -48,7 +48,7 @@ CONFIG_PHY_MICREL_KSZ90X1=y
 CONFIG_DM_ETH=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_SPI=y
 CONFIG_CADENCE_QSPI=y
 CONFIG_DESIGNWARE_SPI=y
diff --git a/configs/socfpga_de1_soc_defconfig b/configs/socfpga_de1_soc_defconfig
index d2f6799da0a..4894a278e92 100644
--- a/configs/socfpga_de1_soc_defconfig
+++ b/configs/socfpga_de1_soc_defconfig
@@ -45,7 +45,7 @@ CONFIG_PHY_MICREL_KSZ90X1=y
 CONFIG_DM_ETH=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_SPI=y
 CONFIG_USB=y
 CONFIG_DM_USB=y
diff --git a/configs/socfpga_is1_defconfig b/configs/socfpga_is1_defconfig
index c2f73b5d8df..02a42cd6a6d 100644
--- a/configs/socfpga_is1_defconfig
+++ b/configs/socfpga_is1_defconfig
@@ -51,7 +51,7 @@ CONFIG_PHY_MICREL_KSZ90X1=y
 CONFIG_DM_ETH=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_SPI=y
 CONFIG_CADENCE_QSPI=y
 # CONFIG_SPL_WDT is not set
diff --git a/configs/socfpga_mcvevk_defconfig b/configs/socfpga_mcvevk_defconfig
index 58700d9bc5b..cb4b2196df0 100644
--- a/configs/socfpga_mcvevk_defconfig
+++ b/configs/socfpga_mcvevk_defconfig
@@ -47,7 +47,7 @@ CONFIG_SPI_FLASH_MTD=y
 CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_ETH_DESIGNWARE=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_SPI=y
 CONFIG_CADENCE_QSPI=y
 CONFIG_DESIGNWARE_SPI=y
diff --git a/configs/socfpga_secu1_defconfig b/configs/socfpga_secu1_defconfig
index 710e97cbf7b..20c917bd9e7 100644
--- a/configs/socfpga_secu1_defconfig
+++ b/configs/socfpga_secu1_defconfig
@@ -81,7 +81,7 @@ CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DM_RTC=y
 CONFIG_RTC_M41T62=y
 CONFIG_SPI=y
diff --git a/configs/socfpga_sockit_defconfig b/configs/socfpga_sockit_defconfig
index 2c6135bde4e..ac21a8174ba 100644
--- a/configs/socfpga_sockit_defconfig
+++ b/configs/socfpga_sockit_defconfig
@@ -55,7 +55,7 @@ CONFIG_PHY_MICREL_KSZ90X1=y
 CONFIG_DM_ETH=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_SPI=y
 CONFIG_CADENCE_QSPI=y
 CONFIG_DESIGNWARE_SPI=y
diff --git a/configs/socfpga_socrates_defconfig b/configs/socfpga_socrates_defconfig
index 13a911fc0b8..c6d15565f85 100644
--- a/configs/socfpga_socrates_defconfig
+++ b/configs/socfpga_socrates_defconfig
@@ -55,7 +55,7 @@ CONFIG_PHY_MICREL_KSZ90X1=y
 CONFIG_DM_ETH=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DM_RTC=y
 CONFIG_RTC_M41T62=y
 CONFIG_SPI=y
diff --git a/configs/socfpga_sr1500_defconfig b/configs/socfpga_sr1500_defconfig
index bf864d089fe..17e1ebfc119 100644
--- a/configs/socfpga_sr1500_defconfig
+++ b/configs/socfpga_sr1500_defconfig
@@ -61,7 +61,7 @@ CONFIG_DM_ETH=y
 CONFIG_PHY_GIGE=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_SPI=y
 CONFIG_CADENCE_QSPI=y
 # CONFIG_SPL_WDT is not set
diff --git a/configs/socfpga_stratix10_atf_defconfig b/configs/socfpga_stratix10_atf_defconfig
index 8dbb7424ba8..327cbb6a216 100644
--- a/configs/socfpga_stratix10_atf_defconfig
+++ b/configs/socfpga_stratix10_atf_defconfig
@@ -60,7 +60,7 @@ CONFIG_PHY_MICREL_KSZ90X1=y
 CONFIG_DM_ETH=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_SPI=y
 CONFIG_CADENCE_QSPI=y
 CONFIG_DESIGNWARE_SPI=y
diff --git a/configs/socfpga_stratix10_defconfig b/configs/socfpga_stratix10_defconfig
index 2d145e1a5f2..9a04400f52d 100644
--- a/configs/socfpga_stratix10_defconfig
+++ b/configs/socfpga_stratix10_defconfig
@@ -58,7 +58,7 @@ CONFIG_PHY_MICREL_KSZ90X1=y
 CONFIG_DM_ETH=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_SPI=y
 CONFIG_CADENCE_QSPI=y
 CONFIG_DESIGNWARE_SPI=y
diff --git a/configs/socfpga_vining_fpga_defconfig b/configs/socfpga_vining_fpga_defconfig
index 78f894844c5..e69667c70ac 100644
--- a/configs/socfpga_vining_fpga_defconfig
+++ b/configs/socfpga_vining_fpga_defconfig
@@ -84,7 +84,7 @@ CONFIG_PHY_MICREL_KSZ90X1=y
 CONFIG_DM_ETH=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_SPI=y
 CONFIG_CADENCE_QSPI=y
 CONFIG_DESIGNWARE_SPI=y
diff --git a/configs/u200_defconfig b/configs/u200_defconfig
index b0b822b9cb9..2a3760ab187 100644
--- a/configs/u200_defconfig
+++ b/configs/u200_defconfig
@@ -36,7 +36,7 @@ CONFIG_PINCTRL=y
 CONFIG_PINCTRL_MESON_G12A=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
diff --git a/configs/wetek-core2_defconfig b/configs/wetek-core2_defconfig
index cbe747b63ea..6f3ddcc07db 100644
--- a/configs/wetek-core2_defconfig
+++ b/configs/wetek-core2_defconfig
@@ -41,7 +41,7 @@ CONFIG_POWER_DOMAIN=y
 CONFIG_MESON_GX_VPU_POWER_DOMAIN=y
 CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
-CONFIG_DM_RESET=y
+CONFIG_RESET=y=y
 CONFIG_DEBUG_UART_ANNOUNCE=y
 CONFIG_DEBUG_UART_SKIP_INIT=y
 CONFIG_MESON_SERIAL=y
diff --git a/drivers/Makefile b/drivers/Makefile
index c562a719f74..17894d3cc10 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -48,7 +48,7 @@ obj-$(CONFIG_ARCH_IMX8M) += ddr/imx/imx8m/
 obj-$(CONFIG_SPL_POWER_SUPPORT) += power/ power/pmic/
 obj-$(CONFIG_SPL_POWER_SUPPORT) += power/regulator/
 obj-$(CONFIG_SPL_POWER_DOMAIN) += power/domain/
-obj-$(CONFIG_SPL_DM_RESET) += reset/
+obj-$(CONFIG_SPL_RESET) += reset/
 obj-$(CONFIG_SPL_DMA) += dma/
 obj-$(CONFIG_SPL_ETH_SUPPORT) += net/
 obj-$(CONFIG_SPL_ETH_SUPPORT) += net/phy/
diff --git a/drivers/clk/sunxi/Kconfig b/drivers/clk/sunxi/Kconfig
index bf084fa7a84..75eb05ba788 100644
--- a/drivers/clk/sunxi/Kconfig
+++ b/drivers/clk/sunxi/Kconfig
@@ -1,7 +1,7 @@
 config CLK_SUNXI
 	bool "Clock support for Allwinner SoCs"
 	depends on CLK && ARCH_SUNXI
-	select DM_RESET
+	select RESET
 	default y
 	help
 	  This enables support for common clock driver API on Allwinner
diff --git a/drivers/gpio/dwapb_gpio.c b/drivers/gpio/dwapb_gpio.c
index e6e919444f5..86e5d3510cd 100644
--- a/drivers/gpio/dwapb_gpio.c
+++ b/drivers/gpio/dwapb_gpio.c
@@ -118,7 +118,7 @@ static int gpio_dwapb_reset(struct udevice *dev)
 
 	ret = reset_get_bulk(dev, &priv->resets);
 	if (ret) {
-		/* Return 0 if error due to !CONFIG_DM_RESET and reset
+		/* Return 0 if error due to !CONFIG_RESET and reset
 		 * DT property is not present.
 		 */
 		if (ret == -ENOENT || ret == -ENOTSUPP)
diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
index 0e84c22b507..2068bc224c6 100644
--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -425,7 +425,7 @@ config MT7620_ETH
 	bool "MediaTek MT7620 Ethernet Interface"
 	depends on SOC_MT7620
 	select PHYLIB
-	select DM_RESET
+	select RESET
 	select DM_GPIO
 	select CLK
 	help
@@ -737,7 +737,7 @@ config MEDIATEK_ETH
 	depends on DM_ETH
 	select PHYLIB
 	select DM_GPIO
-	select DM_RESET
+	select RESET
 	help
 	  This Driver support MediaTek Ethernet GMAC
 	  Say Y to enable support for the MediaTek Ethernet GMAC.
@@ -745,7 +745,7 @@ config MEDIATEK_ETH
 config HIGMACV300_ETH
 	bool "HiSilicon Gigabit Ethernet Controller"
 	depends on DM_ETH
-	select DM_RESET
+	select RESET
 	select PHYLIB
 	help
 	  This driver supports HIGMACV300 Ethernet controller found on
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index f5b3f8826fb..91a3e1257a8 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -1,6 +1,6 @@
 menu "Reset Controller Support"
 
-config DM_RESET
+config RESET
 	bool "Enable reset controllers using Driver Model"
 	depends on DM && OF_CONTROL
 	help
@@ -51,7 +51,7 @@ config TEGRA186_RESET
 
 config RESET_TI_SCI
 	bool "TI System Control Interface (TI SCI) reset driver"
-	depends on DM_RESET && TI_SCI_PROTOCOL
+	depends on RESET && TI_SCI_PROTOCOL
 	help
 	  This enables the reset driver support over TI System Control Interface
 	  available on some new TI's SoCs. If you wish to use reset resources
@@ -59,7 +59,7 @@ config RESET_TI_SCI
 
 config RESET_BCM6345
 	bool "Reset controller driver for BCM6345"
-	depends on DM_RESET && ARCH_BMIPS
+	depends on RESET && ARCH_BMIPS
 	help
 	  Support reset controller on BCM6345.
 
@@ -74,7 +74,7 @@ config RESET_UNIPHIER
 
 config RESET_AST2500
 	bool "Reset controller driver for AST2500 SoCs"
-	depends on DM_RESET
+	depends on RESET
 	default y if ASPEED_AST2500
 	help
 	  Support for reset controller on AST2500 SoC.
@@ -83,7 +83,7 @@ config RESET_AST2500
 
 config RESET_AST2600
 	bool "Reset controller driver for AST2600 SoCs"
-	depends on DM_RESET
+	depends on RESET
 	default y if ASPEED_AST2600
 	help
 	  Support for reset controller on AST2600 SoC.
@@ -92,7 +92,7 @@ config RESET_AST2600
 
 config RESET_ROCKCHIP
 	bool "Reset controller driver for Rockchip SoCs"
-	depends on DM_RESET && ARCH_ROCKCHIP && CLK
+	depends on RESET && ARCH_ROCKCHIP && CLK
 	default y
 	help
 	  Support for reset controller on rockchip SoC. The main limitation
@@ -101,14 +101,14 @@ config RESET_ROCKCHIP
 
 config RESET_HSDK
 	bool "Synopsys HSDK Reset Driver"
-	depends on DM_RESET && TARGET_HSDK
+	depends on RESET && TARGET_HSDK
 	default y
 	help
 	  This enables the reset controller driver for HSDK board.
 
 config RESET_MESON
 	bool "Reset controller driver for Amlogic Meson SoCs"
-	depends on DM_RESET && ARCH_MESON
+	depends on RESET && ARCH_MESON
 	imply REGMAP
 	default y
 	help
@@ -116,28 +116,28 @@ config RESET_MESON
 
 config RESET_SOCFPGA
 	bool "Reset controller driver for SoCFPGA"
-	depends on DM_RESET && ARCH_SOCFPGA
+	depends on RESET && ARCH_SOCFPGA
 	default y
 	help
 	  Support for reset controller on SoCFPGA platform.
 
 config RESET_MEDIATEK
 	bool "Reset controller driver for MediaTek SoCs"
-	depends on DM_RESET && ARCH_MEDIATEK && CLK
+	depends on RESET && ARCH_MEDIATEK && CLK
 	default y
 	help
 	  Support for reset controller on MediaTek SoCs.
 
 config RESET_MTMIPS
 	bool "Reset controller driver for MediaTek MIPS platform"
-	depends on DM_RESET && ARCH_MTMIPS
+	depends on RESET && ARCH_MTMIPS
 	default y
 	help
 	  Support for reset controller on MediaTek MIPS platform.
 
 config RESET_SUNXI
 	bool "RESET support for Allwinner SoCs"
-	depends on DM_RESET && ARCH_SUNXI
+	depends on RESET && ARCH_SUNXI
 	default y
 	help
 	  This enables support for common reset driver for
@@ -145,20 +145,20 @@ config RESET_SUNXI
 
 config RESET_HISILICON
 	bool "Reset controller driver for HiSilicon SoCs"
-	depends on DM_RESET
+	depends on RESET
 	help
 	  Support for reset controller on HiSilicon SoCs.
 
 config RESET_IMX7
 	bool "i.MX7/8 Reset Driver"
-	depends on DM_RESET && (ARCH_MX7 || ARCH_IMX8M)
+	depends on RESET && (ARCH_MX7 || ARCH_IMX8M)
 	default y
 	help
 	  Support for reset controller on i.MX7/8 SoCs.
 
 config RESET_IPQ419
 	bool "Reset driver for Qualcomm IPQ40xx SoCs"
-	depends on DM_RESET && ARCH_IPQ40XX
+	depends on RESET && ARCH_IPQ40XX
 	default y
 	help
 	  Support for reset controller on Qualcomm
@@ -166,7 +166,7 @@ config RESET_IPQ419
 
 config RESET_SIFIVE
 	bool "Reset Driver for SiFive SoC's"
-	depends on DM_RESET && CLK_SIFIVE_FU540_PRCI && TARGET_SIFIVE_FU540
+	depends on RESET && CLK_SIFIVE_FU540_PRCI && TARGET_SIFIVE_FU540
 	default y
 	help
 	  PRCI module within SiFive SoC's provides mechanism to reset
@@ -175,13 +175,13 @@ config RESET_SIFIVE
 
 config RESET_SYSCON
 	bool "Enable generic syscon reset driver support"
-	depends on DM_RESET
+	depends on RESET
 	help
 	  Support generic syscon mapped register reset devices.
 
 config RESET_RASPBERRYPI
 	bool "Raspberry Pi 4 Firmware Reset Controller Driver"
-	depends on DM_RESET && ARCH_BCM283X
+	depends on RESET && ARCH_BCM283X
 	default USB_XHCI_PCI
 	help
 	  Raspberry Pi 4's co-processor controls some of the board's HW
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 8a0f5280761..c70fab97059 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -3,7 +3,7 @@
 # Copyright (c) 2016, NVIDIA CORPORATION.
 #
 
-obj-$(CONFIG_DM_RESET) += reset-uclass.o
+obj-$(CONFIG_RESET) += reset-uclass.o
 obj-$(CONFIG_SANDBOX_MBOX) += sandbox-reset.o
 obj-$(CONFIG_SANDBOX_MBOX) += sandbox-reset-test.o
 obj-$(CONFIG_STI_RESET) += sti-reset.o
diff --git a/drivers/spi/designware_spi.c b/drivers/spi/designware_spi.c
index 742121140de..41ea19b9cf7 100644
--- a/drivers/spi/designware_spi.c
+++ b/drivers/spi/designware_spi.c
@@ -315,7 +315,7 @@ static int dw_spi_reset(struct udevice *bus)
 	ret = reset_get_bulk(bus, &priv->resets);
 	if (ret) {
 		/*
-		 * Return 0 if error due to !CONFIG_DM_RESET and reset
+		 * Return 0 if error due to !CONFIG_RESET and reset
 		 * DT property is not present.
 		 */
 		if (ret == -ENOENT || ret == -ENOTSUPP)
diff --git a/drivers/sysreset/Kconfig b/drivers/sysreset/Kconfig
index ac77ffbc8be..978247662e4 100644
--- a/drivers/sysreset/Kconfig
+++ b/drivers/sysreset/Kconfig
@@ -123,7 +123,7 @@ config SYSRESET_WATCHDOG
 
 config SYSRESET_RESETCTL
 	bool "Enable support for reset controller reboot driver"
-	select DM_RESET
+	select RESET
 	help
 	  Reboot support using generic reset controller.
 
diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c
index ec643e9f45b..2775e9e51f5 100644
--- a/drivers/usb/host/dwc2.c
+++ b/drivers/usb/host/dwc2.c
@@ -1154,7 +1154,7 @@ static int dwc2_reset(struct udevice *dev)
 	ret = reset_get_bulk(dev, &priv->resets);
 	if (ret) {
 		dev_warn(dev, "Can't get reset: %d\n", ret);
-		/* Return 0 if error due to !CONFIG_DM_RESET and reset
+		/* Return 0 if error due to !CONFIG_RESET and reset
 		 * DT property is not present.
 		 */
 		if (ret == -ENOENT || ret == -ENOTSUPP)
diff --git a/drivers/watchdog/designware_wdt.c b/drivers/watchdog/designware_wdt.c
index c020324973e..753e21b0dd1 100644
--- a/drivers/watchdog/designware_wdt.c
+++ b/drivers/watchdog/designware_wdt.c
@@ -137,17 +137,17 @@ static int designware_wdt_probe(struct udevice *dev)
 	priv->clk_khz = CONFIG_DW_WDT_CLOCK_KHZ;
 #endif
 
-#if CONFIG_IS_ENABLED(DM_RESET)
-	struct reset_ctl_bulk resets;
+	if (CONFIG_IS_ENABLED(RESET)) {
+		struct reset_ctl_bulk resets;
 
-	ret = reset_get_bulk(dev, &resets);
-	if (ret)
-		return ret;
+		ret = reset_get_bulk(dev, &resets);
+		if (ret)
+			return ret;
 
-	ret = reset_deassert_bulk(&resets);
-	if (ret)
-		return ret;
-#endif
+		ret = reset_deassert_bulk(&resets);
+		if (ret)
+			return ret;
+	}
 
 	/* reset to disable the watchdog */
 	return designware_wdt_stop(dev);
diff --git a/include/reset.h b/include/reset.h
index cde2c4b4a8c..1539954be6d 100644
--- a/include/reset.h
+++ b/include/reset.h
@@ -83,7 +83,7 @@ struct reset_ctl_bulk {
 	unsigned int count;
 };
 
-#if CONFIG_IS_ENABLED(DM_RESET)
+#if CONFIG_IS_ENABLED(RESET)
 
 /**
  * devm_reset_control_get - resource managed reset_get_by_name()
diff --git a/test/dm/Makefile b/test/dm/Makefile
index f5cc5540e8a..1990d3ca281 100644
--- a/test/dm/Makefile
+++ b/test/dm/Makefile
@@ -58,7 +58,7 @@ obj-$(CONFIG_DM_PWM) += pwm.o
 obj-$(CONFIG_RAM) += ram.o
 obj-y += regmap.o
 obj-$(CONFIG_REMOTEPROC) += remoteproc.o
-obj-$(CONFIG_DM_RESET) += reset.o
+obj-$(CONFIG_RESET) += reset.o
 obj-$(CONFIG_SYSRESET) += sysreset.o
 obj-$(CONFIG_DM_RTC) += rtc.o
 obj-$(CONFIG_DM_SPI_FLASH) += sf.o
-- 
2.31.0.291.g576ba9dcdaf-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
