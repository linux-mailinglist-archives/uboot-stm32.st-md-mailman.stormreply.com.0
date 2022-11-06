Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4A561E6EF
	for <lists+uboot-stm32@lfdr.de>; Sun,  6 Nov 2022 23:40:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F831C6334A;
	Sun,  6 Nov 2022 22:40:45 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19BF5C5F1ED
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Nov 2022 22:40:44 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id e189so7614859iof.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 06 Nov 2022 14:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SaOP6VJvrB2CQS1tTj/Qi3QdhNvLD093LgzeMlelUXo=;
 b=jGw53CyHvQDojcAHEXgzXATNT3CeF1c9DeIs4yp9AIdHCjPu3gbb9sTzs1bl7JXiP/
 jX2wopAdvrdvE4R5kctDbV8AjxNUWK3Trys8asOycw8nmxhrDesGM2HO0SzBGiYaU9V9
 XhU3o6BEJqngrLs38v9zbgOtZ4hgKi8YDwQfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SaOP6VJvrB2CQS1tTj/Qi3QdhNvLD093LgzeMlelUXo=;
 b=AMJutqdbb27+psH7P/fKv7AUyXcWuu9esF61Kmg/MxB/hd+AcP2hUZUsYXG2AGvpXl
 OtNjc2uVQOhFX48ZNKRPqONtNAOsCQCVdS9Nm3UtbMbdEUGvDpLDPcfT62OO9hEwv+X5
 u76UVccRGNdFRug/itDwXabQmoTPSIJEsy+ZLU17JinOOHnhWmbqlnRoGbsIx+Q9/JPk
 2/k1GdL9Eopk0l5BDd6jgvhfkQz56yuhL3NKXSQIYJo7UCZagttmmloj8briNBXwK7+R
 BW4B+RX5oFpQusHtbmHR1HKWRwqXKBkHfww+gmsFO9AOL9nEffeLnhV1f+nSzAif5yMF
 Aw/g==
X-Gm-Message-State: ACrzQf2xrLZ6wzh4cgOPoOONQqWMc7l3aKMUCDTB5ee01ilUL0rW7kki
 x1JR8HbWFS9y/eF6yCNe4zfgVw==
X-Google-Smtp-Source: AMsMyM4jA1aukDLxjWJsj3eEOAXdb6IIK1pozPMZseiwJCAW6G70ghgZb2wXY0FW37AE7Nwg5dcbAg==
X-Received: by 2002:a6b:690a:0:b0:6c6:9bb1:a4c7 with SMTP id
 e10-20020a6b690a000000b006c69bb1a4c7mr28026613ioc.92.1667774442791; 
 Sun, 06 Nov 2022 14:40:42 -0800 (PST)
Received: from sjg1.roam.corp.google.com
 (c-67-190-102-125.hsd1.co.comcast.net. [67.190.102.125])
 by smtp.gmail.com with ESMTPSA id
 u192-20020a0223c9000000b00363b8ef4bc5sm2021742jau.71.2022.11.06.14.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 14:40:42 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sun,  6 Nov 2022 15:40:10 -0700
Message-Id: <20221106224011.606743-8-sjg@chromium.org>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221106224011.606743-1-sjg@chromium.org>
References: <20221106224011.606743-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Peng Fan <peng.fan@nxp.com>,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Angus Ainslie <angus@akkea.ca>,
 Kever Yang <kever.yang@rock-chips.com>, Chin-Liang See <clsee@altera.com>,
 Ivan Mikhaylov <ivan.mikhaylov@siemens.com>,
 Teresa Remmet <t.remmet@phytec.de>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Olaf Mandel <o.mandel@menlosystems.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Fabio Estevam <festevam@gmail.com>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>, Chee Tien Fong <tien.fong.chee@intel.com>,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>,
 Michal Simek <michal.simek@amd.com>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>, kernel@puri.sm,
 Mingkai Hu <mingkai.hu@nxp.com>, Le Jin <le.jin@siemens.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Marco Franchi <marcofrk@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Ilko Iliev <iliev@ronetix.at>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Andreas Geisreiter <ageisreiter@dh-electronics.de>,
 Matteo Lisi <matteo.lisi@engicam.com>, Andre Przywara <andre.przywara@arm.com>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Jeffy Chen <jeffy.chen@rock-chips.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Aswath Govindraju <a-govindraju@ti.com>,
 Chee Hong Ang <chee.hong.ang@intel.com>, Adam Ford <aford173@gmail.com>,
 Alifer Moraes <alifer.wsdm@gmail.com>, Roger Quadros <rogerq@ti.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 huang lin <hl@rock-chips.com>, Siew Chin Lim <elly.siew.chin.lim@intel.com>,
 Simon Glass <sjg@chromium.org>, Lukasz Majewski <lukma@denx.de>,
 "Andrew F. Davis" <afd@ti.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Michael Walle <michael@walle.cc>, Rajesh Bhagat <rajesh.bhagat@nxp.com>,
 Peter Geis <pgwipeout@gmail.com>, Luca Ceresoli <luca@lucaceresoli.net>,
 Bin Meng <bmeng.cn@gmail.com>, Tim Harvey <tharvey@gateworks.com>,
 u-boot@dh-electronics.com
Subject: [Uboot-stm32] [PATCH v4 7/7] treewide: Disable
	USE_SPL_FIT_GENERATOR by default
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

This option is deprecated and only used by two boards. Enable it for just
those two boards, so others don't accidentally enable it.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v4:
- Add new patch to disable USE_SPL_FIT_GENERATOR by default

 boot/Kconfig                                                 | 5 +++--
 configs/am335x_evm_defconfig                                 | 1 -
 configs/am335x_hs_evm_defconfig                              | 1 -
 configs/am335x_hs_evm_uart_defconfig                         | 1 -
 configs/am43xx_evm_defconfig                                 | 1 -
 configs/am43xx_evm_rtconly_defconfig                         | 1 -
 configs/am43xx_evm_usbhost_boot_defconfig                    | 1 -
 configs/am43xx_hs_evm_defconfig                              | 1 -
 configs/am57xx_evm_defconfig                                 | 1 -
 configs/am57xx_hs_evm_defconfig                              | 1 -
 configs/am57xx_hs_evm_usb_defconfig                          | 1 -
 configs/am65x_evm_a53_defconfig                              | 1 -
 configs/am65x_evm_r5_defconfig                               | 1 -
 configs/am65x_hs_evm_a53_defconfig                           | 1 -
 configs/am65x_hs_evm_r5_defconfig                            | 1 -
 .../avnet_ultrazedev_cc_v1_0_ultrazedev_som_v1_0_defconfig   | 1 +
 configs/cgtqmx8_defconfig                                    | 1 -
 configs/chromebook_link64_defconfig                          | 1 -
 configs/dh_imx6_defconfig                                    | 1 -
 configs/display5_defconfig                                   | 1 -
 configs/display5_factory_defconfig                           | 1 -
 configs/dra7xx_evm_defconfig                                 | 1 -
 configs/dra7xx_hs_evm_defconfig                              | 1 -
 configs/dra7xx_hs_evm_usb_defconfig                          | 1 -
 configs/evb-ast2600_defconfig                                | 1 -
 configs/evb-rk3229_defconfig                                 | 1 -
 configs/evb-rk3288_defconfig                                 | 1 -
 configs/gwventana_emmc_defconfig                             | 1 -
 configs/gwventana_gw5904_defconfig                           | 1 -
 configs/gwventana_nand_defconfig                             | 1 -
 configs/imx6qdl_icore_mipi_defconfig                         | 1 -
 configs/imx6qdl_icore_mmc_defconfig                          | 1 -
 configs/imx6qdl_icore_rqs_defconfig                          | 1 -
 configs/imx8mm-cl-iot-gate-optee_defconfig                   | 1 -
 configs/imx8mm-cl-iot-gate_defconfig                         | 1 -
 configs/imx8mm-icore-mx8mm-ctouch2_defconfig                 | 1 -
 configs/imx8mm-icore-mx8mm-edimm2.2_defconfig                | 1 -
 configs/imx8mm-mx8menlo_defconfig                            | 1 -
 configs/imx8mm_beacon_defconfig                              | 1 -
 configs/imx8mm_data_modul_edm_sbc_defconfig                  | 1 -
 configs/imx8mm_evk_defconfig                                 | 1 -
 configs/imx8mm_evk_fspi_defconfig                            | 1 -
 configs/imx8mm_venice_defconfig                              | 1 -
 configs/imx8mn_beacon_2g_defconfig                           | 1 -
 configs/imx8mn_beacon_defconfig                              | 1 -
 configs/imx8mn_bsh_smm_s2_defconfig                          | 1 -
 configs/imx8mn_bsh_smm_s2pro_defconfig                       | 1 -
 configs/imx8mn_ddr4_evk_defconfig                            | 1 -
 configs/imx8mn_evk_defconfig                                 | 1 -
 configs/imx8mn_var_som_defconfig                             | 1 -
 configs/imx8mn_venice_defconfig                              | 1 -
 configs/imx8mp-icore-mx8mp-edimm2.2_defconfig                | 1 -
 configs/imx8mp_dhcom_pdk2_defconfig                          | 1 -
 configs/imx8mp_evk_defconfig                                 | 1 -
 configs/imx8mp_rsb3720a1_4G_defconfig                        | 1 -
 configs/imx8mp_rsb3720a1_6G_defconfig                        | 1 -
 configs/imx8mp_venice_defconfig                              | 1 -
 configs/imx8mq_cm_defconfig                                  | 1 -
 configs/imx8mq_evk_defconfig                                 | 1 -
 configs/imx8mq_phanbell_defconfig                            | 1 -
 configs/imx8qm_rom7720_a1_4G_defconfig                       | 1 -
 configs/iot2050_defconfig                                    | 1 -
 configs/j7200_evm_a72_defconfig                              | 1 -
 configs/j7200_evm_r5_defconfig                               | 1 -
 configs/j7200_hs_evm_a72_defconfig                           | 1 -
 configs/j7200_hs_evm_r5_defconfig                            | 1 -
 configs/j721e_evm_a72_defconfig                              | 1 -
 configs/j721e_evm_r5_defconfig                               | 1 -
 configs/j721e_hs_evm_a72_defconfig                           | 1 -
 configs/j721e_hs_evm_r5_defconfig                            | 1 -
 configs/j721s2_evm_a72_defconfig                             | 1 -
 configs/j721s2_evm_r5_defconfig                              | 1 -
 configs/j721s2_hs_evm_a72_defconfig                          | 1 -
 configs/j721s2_hs_evm_r5_defconfig                           | 1 -
 configs/kontron-sl-mx6ul_defconfig                           | 1 -
 configs/kontron-sl-mx8mm_defconfig                           | 1 -
 configs/kontron_pitx_imx8m_defconfig                         | 1 -
 configs/kontron_sl28_defconfig                               | 1 -
 configs/librem5_defconfig                                    | 1 -
 configs/ls1046ardb_qspi_spl_defconfig                        | 1 -
 configs/mccmon6_nor_defconfig                                | 1 -
 configs/mccmon6_sd_defconfig                                 | 1 -
 configs/mx6sabreauto_defconfig                               | 1 -
 configs/mx6sabresd_defconfig                                 | 1 -
 configs/phycore-imx8mm_defconfig                             | 1 -
 configs/phycore-imx8mp_defconfig                             | 1 -
 configs/pico-imx6_defconfig                                  | 1 -
 configs/pico-imx8mq_defconfig                                | 1 -
 configs/qemu-x86_64_defconfig                                | 1 -
 configs/sandbox_noinst_defconfig                             | 1 -
 configs/sandbox_spl_defconfig                                | 1 -
 configs/sandbox_vpl_defconfig                                | 1 -
 configs/socfpga_agilex_atf_defconfig                         | 1 -
 configs/socfpga_agilex_vab_defconfig                         | 1 -
 configs/socfpga_arria10_defconfig                            | 1 -
 configs/socfpga_chameleonv3_defconfig                        | 1 -
 configs/socfpga_n5x_atf_defconfig                            | 1 -
 configs/socfpga_n5x_vab_defconfig                            | 1 -
 configs/socfpga_stratix10_atf_defconfig                      | 1 -
 configs/stm32mp15_dhcom_basic_defconfig                      | 1 -
 configs/stm32mp15_dhcor_basic_defconfig                      | 1 -
 configs/verdin-imx8mm_defconfig                              | 1 -
 configs/verdin-imx8mp_defconfig                              | 1 -
 configs/wandboard_defconfig                                  | 1 -
 configs/xilinx_zynq_virt_defconfig                           | 1 -
 configs/xilinx_zynqmp_virt_defconfig                         | 1 +
 106 files changed, 5 insertions(+), 105 deletions(-)

diff --git a/boot/Kconfig b/boot/Kconfig
index 4e6284f9169..62ca7de0b8a 100644
--- a/boot/Kconfig
+++ b/boot/Kconfig
@@ -277,12 +277,13 @@ config SPL_FIT_SOURCE
 
 config USE_SPL_FIT_GENERATOR
 	bool "Use a script to generate the .its script"
-	default y if SPL_FIT && ARCH_ZYNQMP
+	help
+	  This is deprecated. Please do not use it. Use binman instead.
 
 config SPL_FIT_GENERATOR
 	string ".its file generator script for U-Boot FIT image"
 	depends on USE_SPL_FIT_GENERATOR
-	default "arch/arm/mach-zynqmp/mkimage_fit_atf.sh" if SPL_LOAD_FIT && ARCH_ZYNQMP
+	default "arch/arm/mach-zynqmp/mkimage_fit_atf.sh" if ARCH_ZYNQMP
 	help
 	  Specifies a (platform specific) script file to generate the FIT
 	  source file used to build the U-Boot FIT image file. This gets
diff --git a/configs/am335x_evm_defconfig b/configs/am335x_evm_defconfig
index f0fbe475b39..14cba17a10b 100644
--- a/configs/am335x_evm_defconfig
+++ b/configs/am335x_evm_defconfig
@@ -14,7 +14,6 @@ CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x4030ff00
 CONFIG_TIMESTAMP=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTCOMMAND="run findfdt; run init_console; run finduuid; run distro_bootcmd"
 CONFIG_LOGLEVEL=3
diff --git a/configs/am335x_hs_evm_defconfig b/configs/am335x_hs_evm_defconfig
index 8d3a4548d9a..038bfa7ea7a 100644
--- a/configs/am335x_hs_evm_defconfig
+++ b/configs/am335x_hs_evm_defconfig
@@ -13,7 +13,6 @@ CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x4030ff00
 CONFIG_TIMESTAMP=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTCOMMAND="run findfdt; run init_console; run finduuid; run distro_bootcmd"
 CONFIG_LOGLEVEL=3
diff --git a/configs/am335x_hs_evm_uart_defconfig b/configs/am335x_hs_evm_uart_defconfig
index 7080b14c467..1050d1fe79b 100644
--- a/configs/am335x_hs_evm_uart_defconfig
+++ b/configs/am335x_hs_evm_uart_defconfig
@@ -16,7 +16,6 @@ CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x4030ff00
 CONFIG_TIMESTAMP=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTCOMMAND="run findfdt; run init_console; run finduuid; run distro_bootcmd"
 CONFIG_LOGLEVEL=3
diff --git a/configs/am43xx_evm_defconfig b/configs/am43xx_evm_defconfig
index 2dfd936057f..67b56764432 100644
--- a/configs/am43xx_evm_defconfig
+++ b/configs/am43xx_evm_defconfig
@@ -13,7 +13,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x4033ff00
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_BOOTCOMMAND="run findfdt; run finduuid; run distro_bootcmd"
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
 # CONFIG_MISC_INIT_R is not set
diff --git a/configs/am43xx_evm_rtconly_defconfig b/configs/am43xx_evm_rtconly_defconfig
index 357da192b83..922342a0b38 100644
--- a/configs/am43xx_evm_rtconly_defconfig
+++ b/configs/am43xx_evm_rtconly_defconfig
@@ -13,7 +13,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x4033ff00
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_BOOTCOMMAND="run findfdt; run finduuid; run distro_bootcmd"
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
 # CONFIG_MISC_INIT_R is not set
diff --git a/configs/am43xx_evm_usbhost_boot_defconfig b/configs/am43xx_evm_usbhost_boot_defconfig
index 0e58221c820..801afba1d84 100644
--- a/configs/am43xx_evm_usbhost_boot_defconfig
+++ b/configs/am43xx_evm_usbhost_boot_defconfig
@@ -12,7 +12,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x4033ff00
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_BOOTCOMMAND="run findfdt; run finduuid; run distro_bootcmd"
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
 # CONFIG_MISC_INIT_R is not set
diff --git a/configs/am43xx_hs_evm_defconfig b/configs/am43xx_hs_evm_defconfig
index 2b5a7fb2599..3ea06628dbe 100644
--- a/configs/am43xx_hs_evm_defconfig
+++ b/configs/am43xx_hs_evm_defconfig
@@ -18,7 +18,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x4033ff00
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTCOMMAND="run findfdt; run finduuid; run distro_bootcmd"
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
diff --git a/configs/am57xx_evm_defconfig b/configs/am57xx_evm_defconfig
index 054e9747a8b..b3490dabaab 100644
--- a/configs/am57xx_evm_defconfig
+++ b/configs/am57xx_evm_defconfig
@@ -18,7 +18,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x4037ff00
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="androidboot.serialno=${serial#} console=ttyS2,115200 androidboot.console=ttyS2 androidboot.hardware=beagle_x15board"
diff --git a/configs/am57xx_hs_evm_defconfig b/configs/am57xx_hs_evm_defconfig
index 02a2543a3f0..c0d5a5893ec 100644
--- a/configs/am57xx_hs_evm_defconfig
+++ b/configs/am57xx_hs_evm_defconfig
@@ -21,7 +21,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x4037ff00
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="androidboot.serialno=${serial#} console=ttyS2,115200 androidboot.console=ttyS2 androidboot.hardware=beagle_x15board"
diff --git a/configs/am57xx_hs_evm_usb_defconfig b/configs/am57xx_hs_evm_usb_defconfig
index 84eca42aac0..66dfb96f6a6 100644
--- a/configs/am57xx_hs_evm_usb_defconfig
+++ b/configs/am57xx_hs_evm_usb_defconfig
@@ -23,7 +23,6 @@ CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x4037ff00
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x80200000
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="androidboot.serialno=${serial#} console=ttyS2,115200 androidboot.console=ttyS2 androidboot.hardware=beagle_x15board"
diff --git a/configs/am65x_evm_a53_defconfig b/configs/am65x_evm_a53_defconfig
index fe3346f2150..84ca386eafd 100644
--- a/configs/am65x_evm_a53_defconfig
+++ b/configs/am65x_evm_a53_defconfig
@@ -30,7 +30,6 @@ CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x80480000
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x81000000
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTCOMMAND="run findfdt; run distro_bootcmd; run init_${boot}; run boot_rprocs; run get_kern_${boot}; run get_fdt_${boot}; run get_overlay_${boot}; run run_kern"
 CONFIG_LOGLEVEL=7
diff --git a/configs/am65x_evm_r5_defconfig b/configs/am65x_evm_r5_defconfig
index 45f50b6ae8e..64e1416162b 100644
--- a/configs/am65x_evm_r5_defconfig
+++ b/configs/am65x_evm_r5_defconfig
@@ -28,7 +28,6 @@ CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x41c7effc
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_USE_BOOTCOMMAND=y
 # CONFIG_DISPLAY_CPUINFO is not set
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_GD=y
diff --git a/configs/am65x_hs_evm_a53_defconfig b/configs/am65x_hs_evm_a53_defconfig
index 79182a77f30..94beb9ed67c 100644
--- a/configs/am65x_hs_evm_a53_defconfig
+++ b/configs/am65x_hs_evm_a53_defconfig
@@ -30,7 +30,6 @@ CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x80480000
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTCOMMAND="run findfdt; run envboot; run init_${boot}; run get_fit_${boot}; run get_overlaystring; run run_fit"
 CONFIG_LOGLEVEL=7
diff --git a/configs/am65x_hs_evm_r5_defconfig b/configs/am65x_hs_evm_r5_defconfig
index cbd702c3eda..9b463044211 100644
--- a/configs/am65x_hs_evm_r5_defconfig
+++ b/configs/am65x_hs_evm_r5_defconfig
@@ -27,7 +27,6 @@ CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x41c7effc
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_USE_BOOTCOMMAND=y
 # CONFIG_DISPLAY_CPUINFO is not set
 CONFIG_SPL_MAX_SIZE=0x58000
diff --git a/configs/avnet_ultrazedev_cc_v1_0_ultrazedev_som_v1_0_defconfig b/configs/avnet_ultrazedev_cc_v1_0_ultrazedev_som_v1_0_defconfig
index 943b4da21d1..7842481c45b 100644
--- a/configs/avnet_ultrazedev_cc_v1_0_ultrazedev_som_v1_0_defconfig
+++ b/configs/avnet_ultrazedev_cc_v1_0_ultrazedev_som_v1_0_defconfig
@@ -23,6 +23,7 @@ CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x10000000
+CONFIG_USE_SPL_FIT_GENERATOR=y
 CONFIG_BOOTDELAY=0
 # CONFIG_DISPLAY_CPUINFO is not set
 CONFIG_CLOCKS=y
diff --git a/configs/cgtqmx8_defconfig b/configs/cgtqmx8_defconfig
index ba2b09fb441..5bdd6d1afe6 100644
--- a/configs/cgtqmx8_defconfig
+++ b/configs/cgtqmx8_defconfig
@@ -21,7 +21,6 @@ CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x80200000
 CONFIG_REMAKE_ELF=y
 CONFIG_FIT=y
 CONFIG_SPL_LOAD_FIT=y
-CONFIG_SPL_FIT_GENERATOR="arch/arm/mach-imx/mkimage_fit_atf.sh"
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTDELAY=3
 CONFIG_USE_BOOTCOMMAND=y
diff --git a/configs/chromebook_link64_defconfig b/configs/chromebook_link64_defconfig
index b645cba9070..3a657027fbf 100644
--- a/configs/chromebook_link64_defconfig
+++ b/configs/chromebook_link64_defconfig
@@ -20,7 +20,6 @@ CONFIG_HAVE_VGA_BIOS=y
 CONFIG_X86_OFFSET_U_BOOT=0xffa00000
 CONFIG_FIT=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_BOOTSTAGE=y
 CONFIG_BOOTSTAGE_REPORT=y
 CONFIG_SHOW_BOOT_PROGRESS=y
diff --git a/configs/dh_imx6_defconfig b/configs/dh_imx6_defconfig
index 007438ba83d..44814322e14 100644
--- a/configs/dh_imx6_defconfig
+++ b/configs/dh_imx6_defconfig
@@ -32,7 +32,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_SPL_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_BOOTDELAY=3
 # CONFIG_USE_BOOTCOMMAND is not set
 CONFIG_SYS_CONSOLE_OVERWRITE_ROUTINE=y
diff --git a/configs/display5_defconfig b/configs/display5_defconfig
index 9daa9a49211..143280cdeed 100644
--- a/configs/display5_defconfig
+++ b/configs/display5_defconfig
@@ -31,7 +31,6 @@ CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI=y
 CONFIG_FIT=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_SUPPORT_RAW_INITRD=y
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_USE_BOOTCOMMAND=y
diff --git a/configs/display5_factory_defconfig b/configs/display5_factory_defconfig
index 1f0546027f9..8e7511b8f5e 100644
--- a/configs/display5_factory_defconfig
+++ b/configs/display5_factory_defconfig
@@ -28,7 +28,6 @@ CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI=y
 CONFIG_FIT=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_SUPPORT_RAW_INITRD=y
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTDELAY=3
diff --git a/configs/dra7xx_evm_defconfig b/configs/dra7xx_evm_defconfig
index d91cf3e1301..ed47a396d5c 100644
--- a/configs/dra7xx_evm_defconfig
+++ b/configs/dra7xx_evm_defconfig
@@ -20,7 +20,6 @@ CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x4037fef0
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x80200000
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="androidboot.serialno=${serial#} console=ttyS0,115200 androidboot.console=ttyS0 androidboot.hardware=jacinto6evmboard"
diff --git a/configs/dra7xx_hs_evm_defconfig b/configs/dra7xx_hs_evm_defconfig
index 195bc0e4ee0..ffff1116e7a 100644
--- a/configs/dra7xx_hs_evm_defconfig
+++ b/configs/dra7xx_hs_evm_defconfig
@@ -23,7 +23,6 @@ CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x4037fef0
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x80200000
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="androidboot.serialno=${serial#} console=ttyS0,115200 androidboot.console=ttyS0 androidboot.hardware=jacinto6evmboard"
diff --git a/configs/dra7xx_hs_evm_usb_defconfig b/configs/dra7xx_hs_evm_usb_defconfig
index 99cdbbc02f8..fd24cb0a23d 100644
--- a/configs/dra7xx_hs_evm_usb_defconfig
+++ b/configs/dra7xx_hs_evm_usb_defconfig
@@ -24,7 +24,6 @@ CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x4037fef0
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x80200000
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="androidboot.serialno=${serial#} console=ttyS0,115200 androidboot.console=ttyS0 androidboot.hardware=jacinto6evmboard"
diff --git a/configs/evb-ast2600_defconfig b/configs/evb-ast2600_defconfig
index 2fac79bbd72..11f3d57a8f4 100644
--- a/configs/evb-ast2600_defconfig
+++ b/configs/evb-ast2600_defconfig
@@ -28,7 +28,6 @@ CONFIG_FIT=y
 CONFIG_SPL_FIT_SIGNATURE=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x10000
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyS4,115200n8 root=/dev/ram rw"
 CONFIG_USE_BOOTCOMMAND=y
diff --git a/configs/evb-rk3229_defconfig b/configs/evb-rk3229_defconfig
index f8ca1f6597b..b7aef260ba0 100644
--- a/configs/evb-rk3229_defconfig
+++ b/configs/evb-rk3229_defconfig
@@ -23,7 +23,6 @@ CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x61100000
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_USE_PREBOOT=y
 CONFIG_DEFAULT_FDT_FILE="rk3229-evb.dtb"
 # CONFIG_DISPLAY_CPUINFO is not set
diff --git a/configs/evb-rk3288_defconfig b/configs/evb-rk3288_defconfig
index bc3e590a117..dc71457be17 100644
--- a/configs/evb-rk3288_defconfig
+++ b/configs/evb-rk3288_defconfig
@@ -21,7 +21,6 @@ CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x100000
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_USE_PREBOOT=y
 CONFIG_DEFAULT_FDT_FILE="rk3288-evb-rk808.dtb"
 CONFIG_SILENT_CONSOLE=y
diff --git a/configs/gwventana_emmc_defconfig b/configs/gwventana_emmc_defconfig
index 8ec67510ff2..ac10e03fd9a 100644
--- a/configs/gwventana_emmc_defconfig
+++ b/configs/gwventana_emmc_defconfig
@@ -28,7 +28,6 @@ CONFIG_AHCI=y
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_SUPPORT_RAW_INITRD=y
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTDELAY=3
diff --git a/configs/gwventana_gw5904_defconfig b/configs/gwventana_gw5904_defconfig
index 597d289f32d..bd1b254794a 100644
--- a/configs/gwventana_gw5904_defconfig
+++ b/configs/gwventana_gw5904_defconfig
@@ -28,7 +28,6 @@ CONFIG_AHCI=y
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_SUPPORT_RAW_INITRD=y
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTDELAY=3
diff --git a/configs/gwventana_nand_defconfig b/configs/gwventana_nand_defconfig
index 54195fb6e5d..3ec68b3ee07 100644
--- a/configs/gwventana_nand_defconfig
+++ b/configs/gwventana_nand_defconfig
@@ -28,7 +28,6 @@ CONFIG_AHCI=y
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_SUPPORT_RAW_INITRD=y
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTDELAY=3
diff --git a/configs/imx6qdl_icore_mipi_defconfig b/configs/imx6qdl_icore_mipi_defconfig
index d90e42c723b..e15b00da9c8 100644
--- a/configs/imx6qdl_icore_mipi_defconfig
+++ b/configs/imx6qdl_icore_mipi_defconfig
@@ -27,7 +27,6 @@ CONFIG_FIT=y
 CONFIG_FIT_SIGNATURE=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_LEGACY_IMAGE_FORMAT=y
 CONFIG_SUPPORT_RAW_INITRD=y
 CONFIG_BOOTDELAY=3
diff --git a/configs/imx6qdl_icore_mmc_defconfig b/configs/imx6qdl_icore_mmc_defconfig
index e8cbf67b68b..f6459556009 100644
--- a/configs/imx6qdl_icore_mmc_defconfig
+++ b/configs/imx6qdl_icore_mmc_defconfig
@@ -30,7 +30,6 @@ CONFIG_FIT=y
 CONFIG_FIT_SIGNATURE=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_LEGACY_IMAGE_FORMAT=y
 CONFIG_SUPPORT_RAW_INITRD=y
 CONFIG_BOOTDELAY=3
diff --git a/configs/imx6qdl_icore_rqs_defconfig b/configs/imx6qdl_icore_rqs_defconfig
index e497d28ff28..bc4a191351a 100644
--- a/configs/imx6qdl_icore_rqs_defconfig
+++ b/configs/imx6qdl_icore_rqs_defconfig
@@ -24,7 +24,6 @@ CONFIG_FIT=y
 CONFIG_FIT_SIGNATURE=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_LEGACY_IMAGE_FORMAT=y
 CONFIG_SUPPORT_RAW_INITRD=y
 CONFIG_BOOTDELAY=3
diff --git a/configs/imx8mm-cl-iot-gate-optee_defconfig b/configs/imx8mm-cl-iot-gate-optee_defconfig
index bb105811c47..21b773842f0 100644
--- a/configs/imx8mm-cl-iot-gate-optee_defconfig
+++ b/configs/imx8mm-cl-iot-gate-optee_defconfig
@@ -21,7 +21,6 @@ CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_FIT_SIGNATURE=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_HAS_BSS_LINKER_SECTION=y
diff --git a/configs/imx8mm-cl-iot-gate_defconfig b/configs/imx8mm-cl-iot-gate_defconfig
index 548fb7bf7a2..88a0b987c78 100644
--- a/configs/imx8mm-cl-iot-gate_defconfig
+++ b/configs/imx8mm-cl-iot-gate_defconfig
@@ -23,7 +23,6 @@ CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_FIT_SIGNATURE=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_HAS_BSS_LINKER_SECTION=y
diff --git a/configs/imx8mm-icore-mx8mm-ctouch2_defconfig b/configs/imx8mm-icore-mx8mm-ctouch2_defconfig
index 18d605e0446..97b50433ef3 100644
--- a/configs/imx8mm-icore-mx8mm-ctouch2_defconfig
+++ b/configs/imx8mm-icore-mx8mm-ctouch2_defconfig
@@ -21,7 +21,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_DEFAULT_FDT_FILE="imx8mm-icore-mx8mm-ctouch2.dtb"
 CONFIG_SPL_HAS_BSS_LINKER_SECTION=y
diff --git a/configs/imx8mm-icore-mx8mm-edimm2.2_defconfig b/configs/imx8mm-icore-mx8mm-edimm2.2_defconfig
index 9fe30e2030b..69b6bd51b8e 100644
--- a/configs/imx8mm-icore-mx8mm-edimm2.2_defconfig
+++ b/configs/imx8mm-icore-mx8mm-edimm2.2_defconfig
@@ -21,7 +21,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_DEFAULT_FDT_FILE="imx8mm-icore-mx8mm-edimm2.2.dtb"
 CONFIG_SPL_HAS_BSS_LINKER_SECTION=y
diff --git a/configs/imx8mm-mx8menlo_defconfig b/configs/imx8mm-mx8menlo_defconfig
index 991bd1a43c9..54c8781d96f 100644
--- a/configs/imx8mm-mx8menlo_defconfig
+++ b/configs/imx8mm-mx8menlo_defconfig
@@ -27,7 +27,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_BOOTCOMMAND="mmc partconf 0 distro_bootpart && load ${devtype} ${devnum}:${distro_bootpart} ${loadaddr} boot/fitImage && source ${loadaddr}:bootscr-boot.cmd ; reset"
 CONFIG_DEFAULT_FDT_FILE="imx8mm-mx8menlo.dtb"
diff --git a/configs/imx8mm_beacon_defconfig b/configs/imx8mm_beacon_defconfig
index b66f8bfea06..cceaeaaca2c 100644
--- a/configs/imx8mm_beacon_defconfig
+++ b/configs/imx8mm_beacon_defconfig
@@ -21,7 +21,6 @@ CONFIG_LTO=y
 CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_USE_BOOTCOMMAND=y
 CONFIG_BOOTCOMMAND="mmc dev ${mmcdev}; if mmc rescan; then if run loadbootscript; then run bootscript; else if run loadimage; then run mmcboot; else run netboot; fi; fi; fi;"
diff --git a/configs/imx8mm_data_modul_edm_sbc_defconfig b/configs/imx8mm_data_modul_edm_sbc_defconfig
index a18c2ca3ff3..32da356a109 100644
--- a/configs/imx8mm_data_modul_edm_sbc_defconfig
+++ b/configs/imx8mm_data_modul_edm_sbc_defconfig
@@ -29,7 +29,6 @@ CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x44000000
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_SUPPORT_RAW_INITRD=y
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_USE_BOOTARGS=y
diff --git a/configs/imx8mm_evk_defconfig b/configs/imx8mm_evk_defconfig
index 158627b8a12..38f3c4e2d47 100644
--- a/configs/imx8mm_evk_defconfig
+++ b/configs/imx8mm_evk_defconfig
@@ -22,7 +22,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_HAS_BSS_LINKER_SECTION=y
diff --git a/configs/imx8mm_evk_fspi_defconfig b/configs/imx8mm_evk_fspi_defconfig
index 66e85ed2fcd..b8cccd8047b 100644
--- a/configs/imx8mm_evk_fspi_defconfig
+++ b/configs/imx8mm_evk_fspi_defconfig
@@ -22,7 +22,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_MAX_SIZE=0x25000
diff --git a/configs/imx8mm_venice_defconfig b/configs/imx8mm_venice_defconfig
index 5652e1bb66f..82501f5c0a6 100644
--- a/configs/imx8mm_venice_defconfig
+++ b/configs/imx8mm_venice_defconfig
@@ -25,7 +25,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_USE_PREBOOT=y
diff --git a/configs/imx8mn_beacon_2g_defconfig b/configs/imx8mn_beacon_2g_defconfig
index 3f6a42b5bd0..2c507e5eb33 100644
--- a/configs/imx8mn_beacon_2g_defconfig
+++ b/configs/imx8mn_beacon_2g_defconfig
@@ -27,7 +27,6 @@ CONFIG_REMAKE_ELF=y
 CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_USE_BOOTCOMMAND=y
 CONFIG_BOOTCOMMAND="mmc dev ${mmcdev}; if mmc rescan; then if run loadbootscript; then run bootscript; else if run loadimage; then run mmcboot; else run netboot; fi; fi; else booti ${loadaddr} - ${fdt_addr}; fi"
diff --git a/configs/imx8mn_beacon_defconfig b/configs/imx8mn_beacon_defconfig
index 0d8601ad395..2c7ac387cc3 100644
--- a/configs/imx8mn_beacon_defconfig
+++ b/configs/imx8mn_beacon_defconfig
@@ -26,7 +26,6 @@ CONFIG_REMAKE_ELF=y
 CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_USE_BOOTCOMMAND=y
 CONFIG_BOOTCOMMAND="mmc dev ${mmcdev}; if mmc rescan; then if run loadbootscript; then run bootscript; else if run loadimage; then run mmcboot; else run netboot; fi; fi; else booti ${loadaddr} - ${fdt_addr}; fi"
diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_defconfig
index b695a69ecaa..20c578e2441 100644
--- a/configs/imx8mn_bsh_smm_s2_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_defconfig
@@ -22,7 +22,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_DEFAULT_FDT_FILE="freescale/imx8mn-bsh-smm-s2.dtb"
 CONFIG_ARCH_MISC_INIT=y
diff --git a/configs/imx8mn_bsh_smm_s2pro_defconfig b/configs/imx8mn_bsh_smm_s2pro_defconfig
index 34893fc6b8d..9c18b0d8147 100644
--- a/configs/imx8mn_bsh_smm_s2pro_defconfig
+++ b/configs/imx8mn_bsh_smm_s2pro_defconfig
@@ -23,7 +23,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_DEFAULT_FDT_FILE="freescale/imx8mn-bsh-smm-s2pro.dtb"
 CONFIG_ARCH_MISC_INIT=y
diff --git a/configs/imx8mn_ddr4_evk_defconfig b/configs/imx8mn_ddr4_evk_defconfig
index c574bb272f3..d9ffd15dbf4 100644
--- a/configs/imx8mn_ddr4_evk_defconfig
+++ b/configs/imx8mn_ddr4_evk_defconfig
@@ -22,7 +22,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_DEFAULT_FDT_FILE="imx8mn-ddr4-evk.dtb"
 CONFIG_ARCH_MISC_INIT=y
diff --git a/configs/imx8mn_evk_defconfig b/configs/imx8mn_evk_defconfig
index b40ffea9789..9218f2257b5 100644
--- a/configs/imx8mn_evk_defconfig
+++ b/configs/imx8mn_evk_defconfig
@@ -22,7 +22,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_DEFAULT_FDT_FILE="imx8mn-evk.dtb"
 CONFIG_ARCH_MISC_INIT=y
diff --git a/configs/imx8mn_var_som_defconfig b/configs/imx8mn_var_som_defconfig
index 1ff1909e906..83cdba79f0e 100644
--- a/configs/imx8mn_var_som_defconfig
+++ b/configs/imx8mn_var_som_defconfig
@@ -24,7 +24,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_DEFAULT_FDT_FILE="freescale/imx8mn-var-som-symphony.dtb"
 CONFIG_ARCH_MISC_INIT=y
diff --git a/configs/imx8mn_venice_defconfig b/configs/imx8mn_venice_defconfig
index e7b2b5ce9f5..816e5d47daa 100644
--- a/configs/imx8mn_venice_defconfig
+++ b/configs/imx8mn_venice_defconfig
@@ -26,7 +26,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_USE_PREBOOT=y
diff --git a/configs/imx8mp-icore-mx8mp-edimm2.2_defconfig b/configs/imx8mp-icore-mx8mp-edimm2.2_defconfig
index 79eb8b056e2..d719f899583 100644
--- a/configs/imx8mp-icore-mx8mp-edimm2.2_defconfig
+++ b/configs/imx8mp-icore-mx8mp-edimm2.2_defconfig
@@ -25,7 +25,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_DEFAULT_FDT_FILE="imx8mp-icore-mx8mp-edimm2.2.dtb"
 CONFIG_BOARD_LATE_INIT=y
diff --git a/configs/imx8mp_dhcom_pdk2_defconfig b/configs/imx8mp_dhcom_pdk2_defconfig
index 872465b99b0..1dccee07c29 100644
--- a/configs/imx8mp_dhcom_pdk2_defconfig
+++ b/configs/imx8mp_dhcom_pdk2_defconfig
@@ -34,7 +34,6 @@ CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x44000000
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_SUPPORT_RAW_INITRD=y
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_USE_BOOTARGS=y
diff --git a/configs/imx8mp_evk_defconfig b/configs/imx8mp_evk_defconfig
index f8b903d71e2..4f1a8ee4cfc 100644
--- a/configs/imx8mp_evk_defconfig
+++ b/configs/imx8mp_evk_defconfig
@@ -25,7 +25,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_DEFAULT_FDT_FILE="imx8mp-evk.dtb"
 CONFIG_BOARD_LATE_INIT=y
diff --git a/configs/imx8mp_rsb3720a1_4G_defconfig b/configs/imx8mp_rsb3720a1_4G_defconfig
index 3e1c195b8e9..2cffe6b1b14 100644
--- a/configs/imx8mp_rsb3720a1_4G_defconfig
+++ b/configs/imx8mp_rsb3720a1_4G_defconfig
@@ -28,7 +28,6 @@ CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_FIT_SIGNATURE=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_DEFAULT_FDT_FILE="imx8mp-rsb3720-a1.dtb"
diff --git a/configs/imx8mp_rsb3720a1_6G_defconfig b/configs/imx8mp_rsb3720a1_6G_defconfig
index 20f4a8c2b1b..5dc896c21b8 100644
--- a/configs/imx8mp_rsb3720a1_6G_defconfig
+++ b/configs/imx8mp_rsb3720a1_6G_defconfig
@@ -28,7 +28,6 @@ CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_FIT_SIGNATURE=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_DEFAULT_FDT_FILE="imx8mp-rsb3720-a1.dtb"
diff --git a/configs/imx8mp_venice_defconfig b/configs/imx8mp_venice_defconfig
index 5c0ea11efc4..ff2b01b4f31 100644
--- a/configs/imx8mp_venice_defconfig
+++ b/configs/imx8mp_venice_defconfig
@@ -26,7 +26,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_USE_PREBOOT=y
diff --git a/configs/imx8mq_cm_defconfig b/configs/imx8mq_cm_defconfig
index 7a92fccd5d7..d899ed54268 100644
--- a/configs/imx8mq_cm_defconfig
+++ b/configs/imx8mq_cm_defconfig
@@ -25,7 +25,6 @@ CONFIG_REMAKE_ELF=y
 CONFIG_FIT=y
 CONFIG_SPL_FIT_PRINT=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_MAX_SIZE=0x1f000
diff --git a/configs/imx8mq_evk_defconfig b/configs/imx8mq_evk_defconfig
index 252565da11e..b3b670be27a 100644
--- a/configs/imx8mq_evk_defconfig
+++ b/configs/imx8mq_evk_defconfig
@@ -26,7 +26,6 @@ CONFIG_REMAKE_ELF=y
 CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_BOARD_EARLY_INIT_F=y
 CONFIG_BOARD_LATE_INIT=y
diff --git a/configs/imx8mq_phanbell_defconfig b/configs/imx8mq_phanbell_defconfig
index 16cd4cc70c0..ae35d949643 100644
--- a/configs/imx8mq_phanbell_defconfig
+++ b/configs/imx8mq_phanbell_defconfig
@@ -24,7 +24,6 @@ CONFIG_REMAKE_ELF=y
 CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_SD_BOOT=y
 CONFIG_USE_BOOTCOMMAND=y
diff --git a/configs/imx8qm_rom7720_a1_4G_defconfig b/configs/imx8qm_rom7720_a1_4G_defconfig
index c3c93bfdf8a..153eb9b7277 100644
--- a/configs/imx8qm_rom7720_a1_4G_defconfig
+++ b/configs/imx8qm_rom7720_a1_4G_defconfig
@@ -21,7 +21,6 @@ CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x80200000
 CONFIG_REMAKE_ELF=y
 CONFIG_FIT=y
 CONFIG_SPL_LOAD_FIT=y
-CONFIG_SPL_FIT_GENERATOR="arch/arm/mach-imx/mkimage_fit_atf.sh"
 CONFIG_BOOTDELAY=3
 CONFIG_USE_BOOTCOMMAND=y
 CONFIG_BOOTCOMMAND="mmc dev ${mmcdev}; if mmc rescan; then if run loadbootscript; then run bootscript; else if run loadimage; then run mmcboot; else run netboot; fi; fi; else booti ${loadaddr} - ${fdt_addr}; fi"
diff --git a/configs/iot2050_defconfig b/configs/iot2050_defconfig
index 4ae85f391b7..f83283ec220 100644
--- a/configs/iot2050_defconfig
+++ b/configs/iot2050_defconfig
@@ -27,7 +27,6 @@ CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x80100000
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTSTAGE=y
 CONFIG_SHOW_BOOT_PROGRESS=y
diff --git a/configs/j7200_evm_a72_defconfig b/configs/j7200_evm_a72_defconfig
index e7cdd84ecba..b3f7c4521ec 100644
--- a/configs/j7200_evm_a72_defconfig
+++ b/configs/j7200_evm_a72_defconfig
@@ -30,7 +30,6 @@ CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x80480000
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x81000000
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTCOMMAND="run findfdt; run envboot; run init_${boot}; run boot_rprocs; run get_kern_${boot}; run get_fdt_${boot}; run get_overlay_${boot}; run run_kern"
 CONFIG_LOGLEVEL=7
diff --git a/configs/j7200_evm_r5_defconfig b/configs/j7200_evm_r5_defconfig
index 87101cbf53e..291341cc761 100644
--- a/configs/j7200_evm_r5_defconfig
+++ b/configs/j7200_evm_r5_defconfig
@@ -27,7 +27,6 @@ CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x41cf5bfc
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x80080000
 CONFIG_SPL_FIT_IMAGE_POST_PROCESS=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_USE_BOOTCOMMAND=y
 # CONFIG_DISPLAY_CPUINFO is not set
 CONFIG_SPL_MAX_SIZE=0xc0000
diff --git a/configs/j7200_hs_evm_a72_defconfig b/configs/j7200_hs_evm_a72_defconfig
index b9598ca1fe2..9d18aed6300 100644
--- a/configs/j7200_hs_evm_a72_defconfig
+++ b/configs/j7200_hs_evm_a72_defconfig
@@ -31,7 +31,6 @@ CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x80480000
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x81000000
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTCOMMAND="run findfdt; run envboot; run init_${boot}; run boot_rprocs; run get_fit_${boot}; run get_overlaystring; run run_fit"
 CONFIG_LOGLEVEL=7
diff --git a/configs/j7200_hs_evm_r5_defconfig b/configs/j7200_hs_evm_r5_defconfig
index 608778ade86..ab3461efe9c 100644
--- a/configs/j7200_hs_evm_r5_defconfig
+++ b/configs/j7200_hs_evm_r5_defconfig
@@ -27,7 +27,6 @@ CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x41cf5bfc
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x80080000
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_USE_BOOTCOMMAND=y
 # CONFIG_DISPLAY_CPUINFO is not set
 CONFIG_SPL_MAX_SIZE=0xc0000
diff --git a/configs/j721e_evm_a72_defconfig b/configs/j721e_evm_a72_defconfig
index 48a24446941..b0570d88ad9 100644
--- a/configs/j721e_evm_a72_defconfig
+++ b/configs/j721e_evm_a72_defconfig
@@ -28,7 +28,6 @@ CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x80480000
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x81000000
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTCOMMAND="run findfdt; run distro_bootcmd; run init_${boot}; run main_cpsw0_qsgmii_phyinit; run boot_rprocs; run get_kern_${boot}; run get_fdt_${boot}; run get_overlay_${boot}; run run_kern"
 CONFIG_LOGLEVEL=7
diff --git a/configs/j721e_evm_r5_defconfig b/configs/j721e_evm_r5_defconfig
index d6da4c6ae2e..fa89fa45227 100644
--- a/configs/j721e_evm_r5_defconfig
+++ b/configs/j721e_evm_r5_defconfig
@@ -27,7 +27,6 @@ CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x41cf5bfc
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x80080000
 CONFIG_SPL_FIT_IMAGE_POST_PROCESS=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_USE_BOOTCOMMAND=y
 # CONFIG_DISPLAY_CPUINFO is not set
diff --git a/configs/j721e_hs_evm_a72_defconfig b/configs/j721e_hs_evm_a72_defconfig
index a1cc7da0bfb..8f009b49708 100644
--- a/configs/j721e_hs_evm_a72_defconfig
+++ b/configs/j721e_hs_evm_a72_defconfig
@@ -29,7 +29,6 @@ CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x80480000
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x81000000
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTCOMMAND="run findfdt; run envboot; run init_${boot}; run main_cpsw0_qsgmii_phyinit; run boot_rprocs; run get_fit_${boot}; run get_overlay_${boot}; run run_fit"
 CONFIG_LOGLEVEL=7
diff --git a/configs/j721e_hs_evm_r5_defconfig b/configs/j721e_hs_evm_r5_defconfig
index eb9df365538..709127fb1d1 100644
--- a/configs/j721e_hs_evm_r5_defconfig
+++ b/configs/j721e_hs_evm_r5_defconfig
@@ -27,7 +27,6 @@ CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x41cf5bfc
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x80080000
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_USE_BOOTCOMMAND=y
 # CONFIG_DISPLAY_CPUINFO is not set
diff --git a/configs/j721s2_evm_a72_defconfig b/configs/j721s2_evm_a72_defconfig
index 2b2f80c4aaa..df63003736a 100644
--- a/configs/j721s2_evm_a72_defconfig
+++ b/configs/j721s2_evm_a72_defconfig
@@ -30,7 +30,6 @@ CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x80480000
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x81000000
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTCOMMAND="run findfdt; run envboot; run init_${boot}; run boot_rprocs; run get_kern_${boot}; run get_fdt_${boot}; run get_overlay_${boot}; run run_kern"
 CONFIG_LOGLEVEL=7
diff --git a/configs/j721s2_evm_r5_defconfig b/configs/j721s2_evm_r5_defconfig
index 2de5d87bdb2..bdc6782ed6a 100644
--- a/configs/j721s2_evm_r5_defconfig
+++ b/configs/j721s2_evm_r5_defconfig
@@ -29,7 +29,6 @@ CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x41c76000
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x80080000
 CONFIG_SPL_FIT_IMAGE_POST_PROCESS=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_USE_BOOTCOMMAND=y
 # CONFIG_DISPLAY_CPUINFO is not set
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_GD=y
diff --git a/configs/j721s2_hs_evm_a72_defconfig b/configs/j721s2_hs_evm_a72_defconfig
index 3e0ec40fb2e..8615aa1e202 100644
--- a/configs/j721s2_hs_evm_a72_defconfig
+++ b/configs/j721s2_hs_evm_a72_defconfig
@@ -31,7 +31,6 @@ CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x80480000
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x81000000
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTCOMMAND="run findfdt; run envboot; run init_${boot}; run boot_rprocs; run get_fit_${boot}; run get_overlaystring; run run_fit"
 CONFIG_LOGLEVEL=7
diff --git a/configs/j721s2_hs_evm_r5_defconfig b/configs/j721s2_hs_evm_r5_defconfig
index bc8672f7096..3dbec11c458 100644
--- a/configs/j721s2_hs_evm_r5_defconfig
+++ b/configs/j721s2_hs_evm_r5_defconfig
@@ -29,7 +29,6 @@ CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x41c76000
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x80080000
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_USE_BOOTCOMMAND=y
 # CONFIG_DISPLAY_CPUINFO is not set
 CONFIG_SPL_SIZE_LIMIT_SUBTRACT_GD=y
diff --git a/configs/kontron-sl-mx6ul_defconfig b/configs/kontron-sl-mx6ul_defconfig
index 7391e597642..015480d277c 100644
--- a/configs/kontron-sl-mx6ul_defconfig
+++ b/configs/kontron-sl-mx6ul_defconfig
@@ -25,7 +25,6 @@ CONFIG_SYS_MEMTEST_END=0x90000000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_SYS_CONSOLE_IS_IN_ENV=y
 CONFIG_BOARD_TYPES=y
diff --git a/configs/kontron-sl-mx8mm_defconfig b/configs/kontron-sl-mx8mm_defconfig
index ad1952fd2d2..7296fb80a47 100644
--- a/configs/kontron-sl-mx8mm_defconfig
+++ b/configs/kontron-sl-mx8mm_defconfig
@@ -28,7 +28,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOARD_TYPES=y
 CONFIG_BOARD_LATE_INIT=y
diff --git a/configs/kontron_pitx_imx8m_defconfig b/configs/kontron_pitx_imx8m_defconfig
index 05c09ae3c5b..b5aa26afc96 100644
--- a/configs/kontron_pitx_imx8m_defconfig
+++ b/configs/kontron_pitx_imx8m_defconfig
@@ -25,7 +25,6 @@ CONFIG_REMAKE_ELF=y
 CONFIG_FIT=y
 CONFIG_SPL_FIT_PRINT=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_BOARD_EARLY_INIT_F=y
 CONFIG_BOARD_LATE_INIT=y
diff --git a/configs/kontron_sl28_defconfig b/configs/kontron_sl28_defconfig
index 9112956e070..ed3abdb81cb 100644
--- a/configs/kontron_sl28_defconfig
+++ b/configs/kontron_sl28_defconfig
@@ -32,7 +32,6 @@ CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x1800eff0
 CONFIG_MP=y
 CONFIG_FIT=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_OF_STDOUT_VIA_ALIAS=y
 CONFIG_BOOTDELAY=10
diff --git a/configs/librem5_defconfig b/configs/librem5_defconfig
index d5304bc21ce..4ec50aaca6c 100644
--- a/configs/librem5_defconfig
+++ b/configs/librem5_defconfig
@@ -26,7 +26,6 @@ CONFIG_REMAKE_ELF=y
 CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_BOOTDELAY=0
 CONFIG_SYS_CONSOLE_IS_IN_ENV=y
diff --git a/configs/ls1046ardb_qspi_spl_defconfig b/configs/ls1046ardb_qspi_spl_defconfig
index c43f46231cc..844a1681420 100644
--- a/configs/ls1046ardb_qspi_spl_defconfig
+++ b/configs/ls1046ardb_qspi_spl_defconfig
@@ -34,7 +34,6 @@ CONFIG_REMAKE_ELF=y
 CONFIG_MP=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_RAMBOOT_PBL=y
 CONFIG_SYS_FSL_PBL_PBI="board/freescale/ls1046ardb/ls1046ardb_qspi_pbi.cfg"
diff --git a/configs/mccmon6_nor_defconfig b/configs/mccmon6_nor_defconfig
index 2566bdef168..b0787e12052 100644
--- a/configs/mccmon6_nor_defconfig
+++ b/configs/mccmon6_nor_defconfig
@@ -20,7 +20,6 @@ CONFIG_ENV_ADDR=0x8040000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 # CONFIG_USE_BOOTCOMMAND is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_BOARD_INIT=y
diff --git a/configs/mccmon6_sd_defconfig b/configs/mccmon6_sd_defconfig
index 93e40b6b6b8..26f96f16b3e 100644
--- a/configs/mccmon6_sd_defconfig
+++ b/configs/mccmon6_sd_defconfig
@@ -21,7 +21,6 @@ CONFIG_ENV_ADDR=0x8040000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 # CONFIG_USE_BOOTCOMMAND is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_BOARD_INIT=y
diff --git a/configs/mx6sabreauto_defconfig b/configs/mx6sabreauto_defconfig
index bf6aff8e48e..03814e53523 100644
--- a/configs/mx6sabreauto_defconfig
+++ b/configs/mx6sabreauto_defconfig
@@ -25,7 +25,6 @@ CONFIG_NXP_BOARD_REVISION=y
 CONFIG_FIT=y
 CONFIG_SPL_FIT_PRINT=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_SUPPORT_RAW_INITRD=y
 CONFIG_USE_BOOTCOMMAND=y
 CONFIG_BOOTCOMMAND="run findfdt;mmc dev ${mmcdev};if mmc rescan; then if run loadbootscript; then run bootscript; else if run loadimage; then run mmcboot; else run netboot; fi; fi; else run netboot; fi"
diff --git a/configs/mx6sabresd_defconfig b/configs/mx6sabresd_defconfig
index 26cee0eae60..da8bf786832 100644
--- a/configs/mx6sabresd_defconfig
+++ b/configs/mx6sabresd_defconfig
@@ -24,7 +24,6 @@ CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_FIT=y
 CONFIG_SPL_FIT_PRINT=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_SUPPORT_RAW_INITRD=y
 CONFIG_USE_BOOTCOMMAND=y
 CONFIG_BOOTCOMMAND="run findfdt;mmc dev ${mmcdev};if mmc rescan; then if run loadbootscript; then run bootscript; else if run loadimage; then run mmcboot; else run netboot; fi; fi; else run netboot; fi"
diff --git a/configs/phycore-imx8mm_defconfig b/configs/phycore-imx8mm_defconfig
index 7dbaa8f07ac..cc1e136e465 100644
--- a/configs/phycore-imx8mm_defconfig
+++ b/configs/phycore-imx8mm_defconfig
@@ -21,7 +21,6 @@ CONFIG_SYS_LOAD_ADDR=0x40480000
 CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_USE_BOOTCOMMAND=y
 CONFIG_BOOTCOMMAND="mmc dev ${mmcdev}; if mmc rescan; then if run loadimage; then run mmcboot; else run netboot; fi; fi;"
diff --git a/configs/phycore-imx8mp_defconfig b/configs/phycore-imx8mp_defconfig
index 0c1cad8086b..a3198c1df75 100644
--- a/configs/phycore-imx8mp_defconfig
+++ b/configs/phycore-imx8mp_defconfig
@@ -22,7 +22,6 @@ CONFIG_SYS_LOAD_ADDR=0x40480000
 CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_USE_BOOTCOMMAND=y
 CONFIG_BOOTCOMMAND="mmc dev ${mmcdev}; if mmc rescan; then if run loadimage; then run mmcboot; else run netboot; fi; fi;"
diff --git a/configs/pico-imx6_defconfig b/configs/pico-imx6_defconfig
index 8aa33f46f87..60bcb3d1eea 100644
--- a/configs/pico-imx6_defconfig
+++ b/configs/pico-imx6_defconfig
@@ -23,7 +23,6 @@ CONFIG_BOARD_SIZE_LIMIT=715776
 CONFIG_FIT=y
 CONFIG_SPL_FIT_PRINT=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_BOOTCOMMAND="run default_boot"
 CONFIG_DEFAULT_FDT_FILE="ask"
 CONFIG_SYS_CONSOLE_OVERWRITE_ROUTINE=y
diff --git a/configs/pico-imx8mq_defconfig b/configs/pico-imx8mq_defconfig
index 8867317f375..c00855235bd 100644
--- a/configs/pico-imx8mq_defconfig
+++ b/configs/pico-imx8mq_defconfig
@@ -24,7 +24,6 @@ CONFIG_REMAKE_ELF=y
 CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_USE_BOOTCOMMAND=y
 CONFIG_BOOTCOMMAND="mmc dev ${mmcdev}; if mmc rescan; then if run loadbootscript; then run bootscript; else if run loadimage; then run mmcboot; else run netboot; fi; fi; else booti ${loadaddr} - ${fdt_addr}; fi"
diff --git a/configs/qemu-x86_64_defconfig b/configs/qemu-x86_64_defconfig
index 8433b5734f6..02bfc86fa43 100644
--- a/configs/qemu-x86_64_defconfig
+++ b/configs/qemu-x86_64_defconfig
@@ -19,7 +19,6 @@ CONFIG_X86_OFFSET_U_BOOT=0xfff00000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_SYS_MONITOR_BASE=0x01110000
 CONFIG_BOOTSTAGE=y
 CONFIG_BOOTSTAGE_REPORT=y
diff --git a/configs/sandbox_noinst_defconfig b/configs/sandbox_noinst_defconfig
index a12235559bf..b961fc82367 100644
--- a/configs/sandbox_noinst_defconfig
+++ b/configs/sandbox_noinst_defconfig
@@ -20,7 +20,6 @@ CONFIG_FIT=y
 CONFIG_FIT_SIGNATURE=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_BOOTSTAGE=y
 CONFIG_BOOTSTAGE_REPORT=y
 CONFIG_BOOTSTAGE_FDT=y
diff --git a/configs/sandbox_spl_defconfig b/configs/sandbox_spl_defconfig
index 4d70466fa9d..e583897a565 100644
--- a/configs/sandbox_spl_defconfig
+++ b/configs/sandbox_spl_defconfig
@@ -20,7 +20,6 @@ CONFIG_FIT=y
 CONFIG_FIT_SIGNATURE=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_BOOTSTAGE=y
 CONFIG_BOOTSTAGE_REPORT=y
 CONFIG_BOOTSTAGE_FDT=y
diff --git a/configs/sandbox_vpl_defconfig b/configs/sandbox_vpl_defconfig
index c94b059a978..f3856c03638 100644
--- a/configs/sandbox_vpl_defconfig
+++ b/configs/sandbox_vpl_defconfig
@@ -27,7 +27,6 @@ CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_FIT_BEST_MATCH=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_BOOTSTAGE=y
 CONFIG_BOOTSTAGE_REPORT=y
 CONFIG_BOOTSTAGE_FDT=y
diff --git a/configs/socfpga_agilex_atf_defconfig b/configs/socfpga_agilex_atf_defconfig
index 167e05b0aa5..7d8108c6b61 100644
--- a/configs/socfpga_agilex_atf_defconfig
+++ b/configs/socfpga_agilex_atf_defconfig
@@ -22,7 +22,6 @@ CONFIG_FIT=y
 CONFIG_SPL_FIT_SIGNATURE=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x02000000
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_BOOTDELAY=5
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="earlycon"
diff --git a/configs/socfpga_agilex_vab_defconfig b/configs/socfpga_agilex_vab_defconfig
index bcdeb6d17cf..d98f571022f 100644
--- a/configs/socfpga_agilex_vab_defconfig
+++ b/configs/socfpga_agilex_vab_defconfig
@@ -23,7 +23,6 @@ CONFIG_FIT=y
 CONFIG_SPL_FIT_SIGNATURE=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x02000000
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_BOOTDELAY=5
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="earlycon"
diff --git a/configs/socfpga_arria10_defconfig b/configs/socfpga_arria10_defconfig
index 6fe8d550029..93b524a5395 100644
--- a/configs/socfpga_arria10_defconfig
+++ b/configs/socfpga_arria10_defconfig
@@ -17,7 +17,6 @@ CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0xffe2b000
 CONFIG_FIT=y
 CONFIG_TIMESTAMP=y
 CONFIG_SPL_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyS0,115200"
 # CONFIG_USE_BOOTCOMMAND is not set
diff --git a/configs/socfpga_chameleonv3_defconfig b/configs/socfpga_chameleonv3_defconfig
index 478efc59ea9..683b6f3c5c3 100644
--- a/configs/socfpga_chameleonv3_defconfig
+++ b/configs/socfpga_chameleonv3_defconfig
@@ -11,7 +11,6 @@ CONFIG_SPL_FS_FAT=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_SPL_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_MISC_INIT_R=y
 CONFIG_SPL_NO_BSS_LIMIT=y
 CONFIG_SYS_SPL_MALLOC=y
diff --git a/configs/socfpga_n5x_atf_defconfig b/configs/socfpga_n5x_atf_defconfig
index 453fd87bd22..c877d42661b 100644
--- a/configs/socfpga_n5x_atf_defconfig
+++ b/configs/socfpga_n5x_atf_defconfig
@@ -21,7 +21,6 @@ CONFIG_FIT=y
 CONFIG_SPL_FIT_SIGNATURE=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x02000000
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_BOOTDELAY=5
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="earlycon panic=-1 earlyprintk=ttyS0,115200"
diff --git a/configs/socfpga_n5x_vab_defconfig b/configs/socfpga_n5x_vab_defconfig
index 259b8ddf85e..126be682704 100644
--- a/configs/socfpga_n5x_vab_defconfig
+++ b/configs/socfpga_n5x_vab_defconfig
@@ -22,7 +22,6 @@ CONFIG_FIT=y
 CONFIG_SPL_FIT_SIGNATURE=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x02000000
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_BOOTDELAY=5
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="earlycon panic=-1 earlyprintk=ttyS0,115200"
diff --git a/configs/socfpga_stratix10_atf_defconfig b/configs/socfpga_stratix10_atf_defconfig
index acb1ce9e0c9..0a785c1e4d1 100644
--- a/configs/socfpga_stratix10_atf_defconfig
+++ b/configs/socfpga_stratix10_atf_defconfig
@@ -22,7 +22,6 @@ CONFIG_FIT=y
 CONFIG_SPL_FIT_SIGNATURE=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x02000000
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_BOOTDELAY=5
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="earlycon"
diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
index 3ba396b9671..216b04b0b1e 100644
--- a/configs/stm32mp15_dhcom_basic_defconfig
+++ b/configs/stm32mp15_dhcom_basic_defconfig
@@ -23,7 +23,6 @@ CONFIG_FIT=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0xc1000000
 CONFIG_SPL_FIT_SOURCE="board/dhelectronics/dh_stm32mp1/u-boot-dhcom.its"
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_BOOTDELAY=1
 CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
 CONFIG_CONSOLE_MUX=y
diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
index ddd96ac4d29..13026ae9768 100644
--- a/configs/stm32mp15_dhcor_basic_defconfig
+++ b/configs/stm32mp15_dhcor_basic_defconfig
@@ -21,7 +21,6 @@ CONFIG_FIT=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0xc1000000
 CONFIG_SPL_FIT_SOURCE="board/dhelectronics/dh_stm32mp1/u-boot-dhcor.its"
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_BOOTDELAY=1
 CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
 CONFIG_CONSOLE_MUX=y
diff --git a/configs/verdin-imx8mm_defconfig b/configs/verdin-imx8mm_defconfig
index 7bb4b88b449..903bc791894 100644
--- a/configs/verdin-imx8mm_defconfig
+++ b/configs/verdin-imx8mm_defconfig
@@ -25,7 +25,6 @@ CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_FIT_VERBOSE=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_BOOTDELAY=1
 CONFIG_USE_PREBOOT=y
diff --git a/configs/verdin-imx8mp_defconfig b/configs/verdin-imx8mp_defconfig
index ed54132222c..2efdf3fb549 100644
--- a/configs/verdin-imx8mp_defconfig
+++ b/configs/verdin-imx8mp_defconfig
@@ -31,7 +31,6 @@ CONFIG_FIT=y
 CONFIG_FIT_EXTERNAL_OFFSET=0x3000
 CONFIG_FIT_VERBOSE=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_BOOTDELAY=1
 CONFIG_USE_PREBOOT=y
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 70b4cf9ffaa..7e8fe1d30b5 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -26,7 +26,6 @@ CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_SPL_FIT_PRINT=y
 CONFIG_SPL_LOAD_FIT=y
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_BOOTCOMMAND="run findfdt; run finduuid; run distro_bootcmd"
 # CONFIG_CONSOLE_MUX is not set
 CONFIG_SYS_CONSOLE_IS_IN_ENV=y
diff --git a/configs/xilinx_zynq_virt_defconfig b/configs/xilinx_zynq_virt_defconfig
index 1db3a2c6352..7062aa91ef2 100644
--- a/configs/xilinx_zynq_virt_defconfig
+++ b/configs/xilinx_zynq_virt_defconfig
@@ -24,7 +24,6 @@ CONFIG_FIT_VERBOSE=y
 CONFIG_SPL_FIT_PRINT=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x10000000
-# CONFIG_USE_SPL_FIT_GENERATOR is not set
 CONFIG_LEGACY_IMAGE_FORMAT=y
 # CONFIG_ARCH_FIXUP_FDT_MEMORY is not set
 CONFIG_USE_PREBOOT=y
diff --git a/configs/xilinx_zynqmp_virt_defconfig b/configs/xilinx_zynqmp_virt_defconfig
index ea111272366..599b785232a 100644
--- a/configs/xilinx_zynqmp_virt_defconfig
+++ b/configs/xilinx_zynqmp_virt_defconfig
@@ -27,6 +27,7 @@ CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0x10000000
+CONFIG_USE_SPL_FIT_GENERATOR=y
 # CONFIG_ARCH_FIXUP_FDT_MEMORY is not set
 CONFIG_USE_PREBOOT=y
 CONFIG_PREBOOT="run scsi_init;usb start"
-- 
2.38.1.431.g37b22c650d-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
