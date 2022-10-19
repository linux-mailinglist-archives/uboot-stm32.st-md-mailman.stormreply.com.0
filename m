Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 956DD604314
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Oct 2022 13:24:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F3D4C64101;
	Wed, 19 Oct 2022 11:24:07 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45D05C63326
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Oct 2022 11:24:05 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id o13so8977501ilc.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Oct 2022 04:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GLnkVsqMt3R5lQKtngS8oGoiz1873MfG/gOhX6fR2K8=;
 b=SLjTo7dpfuTClvEJ4Rh6C292VkS9wpXJXnLrnOdCUWuVVNRHvStpvXvZUeOzzrQdS1
 qHCqyEX7NxZVXV8uuTWG867cxhrcKyjZdpCnVjihXujTLfcWSKhNbXPkutWH9xJSCUk5
 RJ7eW9hb2N4EoKVbyYm9BJf5mGNi4WonQZ5KI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GLnkVsqMt3R5lQKtngS8oGoiz1873MfG/gOhX6fR2K8=;
 b=vy7OzSB3zS5a62vnWDvI8sV5fJMhZtqYTBnDzk5ibAoChf7NjpRjTJGj7EEXn9qGX4
 IOTnNEbvjVG7fZV6YRxFXEdPbZZtIF8AfRoA+JKxwFK6Gnsl7Y/iOfHZd72GTQuk6k1e
 ytkBslGk8z+FvFeRNbSQ2d8vXTew+vtdc8n2pHR+J4lhTc224gCupHAC+eztbYxAyEL7
 jhlDVRoZl6Ayq8lQOinfABO1Ssi4X4CvZEdOXn4P6Y/gHRKwtnhZU8X3xRwLauTmEHYq
 Lz9/zPV0jz610Qeh72QBzxUty/E7A6s6WNDpx7PBhamNz+jPIYKFUcfBmjb81BPX2oVl
 OxKQ==
X-Gm-Message-State: ACrzQf1SwI26axby9217ihgHU0AlHL9NvFTFS+ZXZzKpR6EoKkCyvDDQ
 sPGBoUXuci+0bH4VtLu/Lxs1Bw==
X-Google-Smtp-Source: AMsMyM48veEhht8daqOKkVoH3QKb4Tp91qorZcB67bJ+Me16sPXdHWCs1rOJYld2kVgBfe/YVhS+Qw==
X-Received: by 2002:a92:c901:0:b0:2f9:993e:8e31 with SMTP id
 t1-20020a92c901000000b002f9993e8e31mr4808208ilp.55.1666178644029; 
 Wed, 19 Oct 2022 04:24:04 -0700 (PDT)
Received: from sjg1.roam.corp.google.com
 (c-67-190-102-125.hsd1.co.comcast.net. [67.190.102.125])
 by smtp.gmail.com with ESMTPSA id
 g34-20020a022722000000b003634aa4a55asm2041156jaa.82.2022.10.19.04.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 04:24:03 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Wed, 19 Oct 2022 05:23:17 -0600
Message-Id: <20221019112356.1042065-1-sjg@chromium.org>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
MIME-Version: 1.0
Cc: Stephen Warren <swarren@wwwdotorg.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Richard Hu <richard.hu@technexion.com>, Wolfgang Denk <wd@denx.de>,
 Marek Vasut <marex@denx.de>, Dzmitry Sankouski <dsankouski@gmail.com>,
 Sean Anderson <sean.anderson@seco.com>, Minkyu Kang <mk7.kang@samsung.com>,
 Rui Miguel Silva <rui.silva@linaro.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ian Ray <ian.ray@ge.com>,
 Sven Schwermer <sven@svenschwermer.de>, Jason Liu <jason.hui.liu@nxp.com>,
 Mario Six <mario.six@gdsys.cc>, Harald Seiler <hws@denx.de>,
 Vikas Manocha <vikas.manocha@st.com>, Icenowy Zheng <icenowy@aosc.io>,
 Michal Suchanek <msuchanek@suse.de>, Ye Li <ye.li@nxp.com>,
 Bharat Gooty <bharat.gooty@broadcom.com>, Samuel Holland <samuel@sholland.org>,
 Ilko Iliev <iliev@ronetix.com>, AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Ovidiu Panait <ovpanait@gmail.com>,
 Troy Kisky <troy.kisky@boundarydevices.com>,
 Hiremath Gireesh <Gireesh.Hiremath@in.bosch.com>,
 Wolfgang Wallner <wolfgang.wallner@br-automation.com>,
 Andrew Scull <ascull@google.com>, Suniel Mahesh <sunil@amarulasolutions.com>,
 Jens Scharsig <esw@bus-elektronik.de>, Michal Simek <michal.simek@amd.com>,
 =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>,
 Anatolij Gustschin <agust@denx.de>,
 =?UTF-8?q?Antti=20M=C3=A4entausta?= <antti.maentausta@ge.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Simon Glass <sjg@chromium.org>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Jesse Taube <Mr.Bossman075@gmail.com>, John Keeping <john@metanate.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bin Meng <bmeng.cn@gmail.com>, Alban Bedel <alban.bedel@avionic-design.de>,
 Artem Lapkin <email2tema@gmail.com>
Subject: [Uboot-stm32] [PATCH 00/39] lcd: Drop old LCD support
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

The conversion to DM_VIDEO was completed some years ago. The old video
code has been removed but the LCD code remains. This series removes it,
to complete the driver model migration.


Simon Glass (39):
  video: Split SPLASH_SCREEN_ALIGN from bmp command
  Convert CONFIG_HIDE_LOGO_VERSION to Kconfig
  video: Rename CONFIG_SYS_VIDEO_LOGO_MAX_SIZE
  Convert CONFIG_VIDEO_LOGO_MAX_SIZE to Kconfig
  video: lcd: Drop console rotation
  video: Drop CONFIG_LCD_ALIGNMENT
  video: Drop CONFIG_LCD_MENU
  video: Drop CONFIG_LCD_INFO_BELOW_LOGO
  video: Drop CONFIG_LCD_INFO
  video: Move bmp_display() prototype to video.h
  api: Drop LCD implementation
  Drop CONFIG_LCD_LOGO
  video: Drop VCXK video controller
  BuR: Drop old LCD code
  video: Drop CONFIG_AM335X_LCD
  video: atmel: Drop pre-DM parts of video driver
  video: Drop ld9040 driver
  video: atmel: Drop CONFIG_LCD_IN_PSRAM
  treewide: Stop enabling CONFIG_LCD
  video: Drop atmel LCD code
  video: samsung: Drop old LCD code
  nexell: Drop old LCD code
  compulab: Drop old LCD code
  tegra: Drop old LCD code
  BuR: ronetix: siemens: Drop old LCD code
  video: cmd: Drop old LCD code
  efi: Drop old LCD code
  video: Drop remaining references to CONFIG_LCD
  fdt: Drop support for LCD fixup in simplefb
  video: Drop LCD_BPP
  video: Drop CONFIG_VIDEO
  video: Drop CONFIG_VIDEO
  video: Drop CONFIG_LCD
  video: Drop use of the lcd header file
  video: Drop common LCD implementation
  video: Drop SPLASHIMAGE_CALLBACK
  video: Make all video options depend on DM_VIDEO
  pci: Drop test for DM_VIDEO
  video: Rename CONFIG_DM_VIDEO to CONFIG_VIDEO

 MAINTAINERS                                   |   2 -
 README                                        |  74 ---
 api/api_display.c                             |  22 -
 arch/Kconfig                                  |   2 +-
 arch/arm/Kconfig                              |   2 +-
 .../mach-at91/arm926ejs/at91sam9n12_devices.c |  39 --
 arch/arm/mach-at91/armv7/sama5d3_devices.c    |  33 -
 arch/arm/mach-exynos/include/mach/mipi_dsim.h |   1 -
 arch/arm/mach-imx/cpu.c                       |   2 +-
 arch/arm/mach-imx/mx6/Kconfig                 |   2 +-
 arch/arm/mach-imx/mx6/soc.c                   |   2 +-
 arch/arm/mach-imx/mx7/soc.c                   |   2 +-
 .../mach-nexell/include/mach/display_dev.h    |   7 -
 arch/arm/mach-omap2/am33xx/Kconfig            |   2 +-
 arch/arm/mach-omap2/am33xx/clock_am33xx.c     |   4 -
 .../cmd_stm32prog/cmd_stm32prog.c             |   2 +-
 arch/arm/mach-sunxi/Kconfig                   |   6 +-
 arch/arm/mach-tegra/board2.c                  |   4 +-
 arch/x86/Kconfig                              |   2 +-
 board/BuR/brxre1/board.c                      |   9 -
 board/BuR/common/br_resetc.c                  |   6 -
 board/BuR/common/bur_common.h                 |   6 -
 board/BuR/common/common.c                     | 225 -------
 board/BuS/eb_cpu5282/eb_cpu5282.c             |  82 ---
 board/aristainetos/aristainetos.c             |   4 +-
 board/atmel/at91sam9261ek/at91sam9261ek.c     |  95 ---
 board/atmel/at91sam9263ek/at91sam9263ek.c     | 108 ----
 .../atmel/at91sam9m10g45ek/at91sam9m10g45ek.c | 103 ----
 board/atmel/at91sam9n12ek/at91sam9n12ek.c     |  64 --
 board/atmel/at91sam9rlek/at91sam9rlek.c       |  88 ---
 board/atmel/at91sam9x5ek/at91sam9x5ek.c       |   2 +-
 board/atmel/common/Makefile                   |   2 +-
 .../atmel/sama5d27_som1_ek/sama5d27_som1_ek.c |   2 +-
 .../sama5d27_wlsom1_ek/sama5d27_wlsom1_ek.c   |   2 +-
 .../atmel/sama5d2_xplained/sama5d2_xplained.c |   2 +-
 board/atmel/sama5d3xek/sama5d3xek.c           |   2 +-
 .../atmel/sama5d4_xplained/sama5d4_xplained.c |   2 +-
 board/atmel/sama5d4ek/sama5d4ek.c             |   2 +-
 board/beckhoff/mx53cx9020/Makefile            |   2 +-
 board/bluewater/gurnard/gurnard.c             |   5 +-
 board/bosch/guardian/board.c                  |  70 ---
 board/compal/paz00/paz00.c                    |   2 +-
 board/compulab/common/Makefile                |   1 -
 board/compulab/common/omap3_display.c         | 452 --------------
 board/freescale/imx8ulp_evk/imx8ulp_evk.c     |   2 +-
 .../mx6ul_14x14_evk/mx6ul_14x14_evk.c         |   2 +-
 board/ge/mx53ppd/Makefile                     |   2 +-
 board/l+g/vinco/vinco.c                       |   1 -
 board/menlo/m53menlo/m53menlo.c               |   6 +-
 board/nvidia/harmony/harmony.c                |   1 -
 board/raspberrypi/rpi/rpi.c                   |   1 -
 board/ronetix/pm9263/pm9263.c                 | 112 ----
 board/samsung/common/board.c                  |   5 -
 board/samsung/common/misc.c                   | 340 -----------
 board/samsung/trats/trats.c                   |   1 -
 board/samsung/trats2/trats2.c                 |  22 -
 board/samsung/universal_c210/universal.c      |   2 -
 board/st/stm32f746-disco/stm32f746-disco.c    |   1 -
 board/technexion/pico-imx7d/README            |   1 -
 board/technexion/pico-imx7d/pico-imx7d.c      |   4 +-
 .../toradex/colibri-imx6ull/colibri-imx6ull.c |   4 +-
 board/toradex/colibri_imx7/colibri_imx7.c     |   6 +-
 board/toradex/common/tdx-common.c             |   2 +-
 boot/pxe_utils.c                              |   3 +-
 cmd/Kconfig                                   |   2 +-
 cmd/bdinfo.c                                  |   5 +-
 cmd/bmp.c                                     |  42 +-
 cmd/cls.c                                     |   2 +-
 common/Kconfig                                |   2 +-
 common/Makefile                               |   4 -
 common/board_f.c                              |  27 +-
 common/fdt_simplefb.c                         |  10 +-
 common/fdt_support.c                          |  29 -
 common/lcd.c                                  | 578 ------------------
 common/lcd_console.c                          | 260 --------
 common/lcd_console_rotation.c                 | 194 ------
 common/splash.c                               |  11 +-
 common/stdio.c                                |   9 +-
 configs/am335x_guardian_defconfig             |   1 -
 configs/aristainetos2c_defconfig              |   2 +-
 configs/aristainetos2ccslb_defconfig          |   2 +-
 configs/at91sam9x5ek_dataflash_defconfig      |   2 +-
 configs/at91sam9x5ek_mmc_defconfig            |   2 +-
 configs/at91sam9x5ek_nandflash_defconfig      |   2 +-
 configs/at91sam9x5ek_spiflash_defconfig       |   2 +-
 configs/bananapi-m5_defconfig                 |   2 +-
 configs/beelink-gsking-x_defconfig            |   2 +-
 configs/beelink-gtking_defconfig              |   2 +-
 configs/beelink-gtkingpro_defconfig           |   2 +-
 configs/chromebit_mickey_defconfig            |   2 +-
 configs/chromebook_bob_defconfig              |   2 +-
 configs/chromebook_jerry_defconfig            |   2 +-
 configs/chromebook_kevin_defconfig            |   2 +-
 configs/chromebook_minnie_defconfig           |   2 +-
 configs/chromebook_speedy_defconfig           |   2 +-
 configs/cm_fx6_defconfig                      |   2 +-
 configs/eb_cpu5282_defconfig                  |   1 -
 configs/eb_cpu5282_internal_defconfig         |   1 -
 configs/evb-px30_defconfig                    |   3 +-
 configs/evb-rk3288_defconfig                  |   2 +-
 configs/evb-rk3399_defconfig                  |   2 +-
 configs/firefly-px30_defconfig                |   3 +-
 configs/firefly-rk3288_defconfig              |   2 +-
 configs/gazerbeam_defconfig                   |   2 +-
 configs/ge_b1x5v2_defconfig                   |   2 +-
 configs/ge_bx50v3_defconfig                   |   2 +-
 configs/gurnard_defconfig                     |   3 +-
 configs/gwventana_emmc_defconfig              |   3 +-
 configs/gwventana_gw5904_defconfig            |   3 +-
 configs/gwventana_nand_defconfig              |   3 +-
 configs/harmony_defconfig                     |   2 +-
 configs/imx6dl_icore_nand_defconfig           |   2 +-
 configs/imx6q_icore_nand_defconfig            |   2 +-
 configs/imx6qdl_icore_mmc_defconfig           |   2 +-
 configs/imx6qdl_icore_nand_defconfig          |   2 +-
 configs/imx7_cm_defconfig                     |   2 +-
 configs/imx8mp_rsb3720a1_4G_defconfig         |   2 +-
 configs/imx8mp_rsb3720a1_6G_defconfig         |   2 +-
 configs/imxrt1050-evk_defconfig               |   2 +-
 configs/khadas-vim3_android_ab_defconfig      |   2 +-
 configs/khadas-vim3_android_defconfig         |   2 +-
 configs/khadas-vim3_defconfig                 |   2 +-
 configs/khadas-vim3l_android_ab_defconfig     |   2 +-
 configs/khadas-vim3l_android_defconfig        |   2 +-
 configs/khadas-vim3l_defconfig                |   2 +-
 configs/libretech-ac_defconfig                |   2 +-
 configs/libretech-cc_defconfig                |   2 +-
 configs/libretech-cc_v2_defconfig             |   2 +-
 configs/libretech-s905d-pc_defconfig          |   2 +-
 configs/libretech-s912-pc_defconfig           |   2 +-
 configs/ls1028aqds_tfa_SECURE_BOOT_defconfig  |   1 -
 configs/ls1028aqds_tfa_defconfig              |   1 -
 configs/ls1028ardb_tfa_SECURE_BOOT_defconfig  |   1 -
 configs/ls1028ardb_tfa_defconfig              |   1 -
 configs/m53menlo_defconfig                    |   4 +-
 configs/marsboard_defconfig                   |   2 +-
 configs/medcom-wide_defconfig                 |   2 +-
 configs/miqi-rk3288_defconfig                 |   2 +-
 configs/mx53cx9020_defconfig                  |   2 +-
 configs/mx53ppd_defconfig                     |   2 +-
 configs/mx6cuboxi_defconfig                   |   2 +-
 configs/mx6qsabrelite_defconfig               |   3 +-
 configs/mx6sabreauto_defconfig                |   2 +-
 configs/mx6sabresd_defconfig                  |   2 +-
 configs/mx6ul_14x14_evk_defconfig             |   2 +-
 configs/mx6ul_9x9_evk_defconfig               |   2 +-
 configs/nanopc-t4-rk3399_defconfig            |   2 +-
 configs/nanopi-m4-2gb-rk3399_defconfig        |   2 +-
 configs/nanopi-m4-rk3399_defconfig            |   2 +-
 configs/nanopi-m4b-rk3399_defconfig           |   2 +-
 configs/nanopi-neo4-rk3399_defconfig          |   2 +-
 configs/nanopi-r4s-rk3399_defconfig           |   2 +-
 configs/nitrogen6dl2g_defconfig               |   3 +-
 configs/nitrogen6dl_defconfig                 |   3 +-
 configs/nitrogen6q2g_defconfig                |   3 +-
 configs/nitrogen6q_defconfig                  |   3 +-
 configs/nitrogen6s1g_defconfig                |   3 +-
 configs/nitrogen6s_defconfig                  |   3 +-
 configs/nokia_rx51_defconfig                  |   2 +-
 configs/nyan-big_defconfig                    |   2 +-
 configs/odroid-c2_defconfig                   |   2 +-
 configs/odroid-c4_defconfig                   |   2 +-
 configs/odroid-go2_defconfig                  |   3 +-
 configs/odroid-hc4_defconfig                  |   2 +-
 configs/odroid-n2_defconfig                   |   2 +-
 configs/opos6uldev_defconfig                  |   2 +-
 configs/paz00_defconfig                       |   2 +-
 configs/peach-pi_defconfig                    |   3 +-
 configs/peach-pit_defconfig                   |   3 +-
 configs/pico-dwarf-imx7d_defconfig            |   2 +-
 configs/pico-hobbit-imx7d_defconfig           |   2 +-
 configs/pico-imx6_defconfig                   |   2 +-
 configs/pico-imx6ul_defconfig                 |   2 +-
 configs/pico-imx7d_bl33_defconfig             |   2 +-
 configs/pico-imx7d_defconfig                  |   2 +-
 configs/pico-nymph-imx7d_defconfig            |   2 +-
 configs/pico-pi-imx7d_defconfig               |   2 +-
 configs/pinebook-pro-rk3399_defconfig         |   2 +-
 configs/pm9261_defconfig                      |   5 +-
 configs/pm9263_defconfig                      |   5 +-
 configs/puma-rk3399_defconfig                 |   2 +-
 configs/px30-core-ctouch2-of10-px30_defconfig |   3 +-
 configs/px30-core-ctouch2-px30_defconfig      |   3 +-
 configs/px30-core-edimm2.2-px30_defconfig     |   3 +-
 configs/radxa-zero_defconfig                  |   2 +-
 configs/riotboard_defconfig                   |   2 +-
 configs/roc-pc-mezzanine-rk3399_defconfig     |   2 +-
 configs/roc-pc-rk3399_defconfig               |   2 +-
 configs/rock-pi-4-rk3399_defconfig            |   2 +-
 configs/rock-pi-4c-rk3399_defconfig           |   2 +-
 configs/rock-pi-n10-rk3399pro_defconfig       |   2 +-
 configs/rock-pi-n8-rk3288_defconfig           |   2 +-
 configs/rock2_defconfig                       |   2 +-
 configs/rock960-rk3399_defconfig              |   2 +-
 configs/rockpro64-rk3399_defconfig            |   2 +-
 configs/rpi_0_w_defconfig                     |   2 +-
 configs/rpi_2_defconfig                       |   2 +-
 configs/rpi_3_32b_defconfig                   |   2 +-
 configs/rpi_3_b_plus_defconfig                |   2 +-
 configs/rpi_3_defconfig                       |   2 +-
 configs/rpi_4_32b_defconfig                   |   2 +-
 configs/rpi_4_defconfig                       |   2 +-
 configs/rpi_arm64_defconfig                   |   2 +-
 configs/rpi_defconfig                         |   2 +-
 configs/s5p4418_nanopi2_defconfig             |   2 +-
 configs/s5pc210_universal_defconfig           |   1 +
 configs/sama5d27_som1_ek_mmc1_defconfig       |   2 +-
 configs/sama5d27_som1_ek_mmc_defconfig        |   2 +-
 configs/sama5d27_som1_ek_qspiflash_defconfig  |   2 +-
 configs/sama5d27_wlsom1_ek_mmc_defconfig      |   2 +-
 .../sama5d27_wlsom1_ek_qspiflash_defconfig    |   2 +-
 configs/sama5d2_xplained_emmc_defconfig       |   2 +-
 configs/sama5d2_xplained_mmc_defconfig        |   2 +-
 configs/sama5d2_xplained_qspiflash_defconfig  |   2 +-
 configs/sama5d2_xplained_spiflash_defconfig   |   2 +-
 configs/sama5d36ek_cmp_mmc_defconfig          |   2 +-
 configs/sama5d36ek_cmp_nandflash_defconfig    |   2 +-
 configs/sama5d36ek_cmp_spiflash_defconfig     |   2 +-
 configs/sama5d3xek_mmc_defconfig              |   2 +-
 configs/sama5d3xek_nandflash_defconfig        |   2 +-
 configs/sama5d3xek_spiflash_defconfig         |   2 +-
 configs/sama5d4_xplained_mmc_defconfig        |   2 +-
 configs/sama5d4_xplained_nandflash_defconfig  |   2 +-
 configs/sama5d4_xplained_spiflash_defconfig   |   2 +-
 configs/sama5d4ek_mmc_defconfig               |   2 +-
 configs/sama5d4ek_nandflash_defconfig         |   2 +-
 configs/sama5d4ek_spiflash_defconfig          |   2 +-
 configs/sandbox64_defconfig                   |   2 +-
 configs/sandbox_defconfig                     |   2 +-
 configs/sandbox_flattree_defconfig            |   2 +-
 configs/sandbox_noinst_defconfig              |   2 +-
 configs/sandbox_spl_defconfig                 |   2 +-
 configs/sandbox_vpl_defconfig                 |   2 +-
 configs/seaboard_defconfig                    |   2 +-
 configs/sei510_defconfig                      |   2 +-
 configs/sei610_defconfig                      |   2 +-
 configs/snow_defconfig                        |   3 +-
 configs/spring_defconfig                      |   3 +-
 configs/starqltechn_defconfig                 |   2 +-
 configs/stemmy_defconfig                      |   2 +-
 configs/stm32746g-eval_defconfig              |   2 +-
 configs/stm32746g-eval_spl_defconfig          |   2 +-
 configs/stm32f746-disco_defconfig             |   2 +-
 configs/stm32f746-disco_spl_defconfig         |   2 +-
 configs/stm32f769-disco_defconfig             |   2 +-
 configs/stm32f769-disco_spl_defconfig         |   2 +-
 configs/stm32mp15_basic_defconfig             |   2 +-
 configs/stm32mp15_defconfig                   |   2 +-
 configs/stm32mp15_trusted_defconfig           |   2 +-
 configs/tbs2910_defconfig                     |   2 +-
 configs/tec_defconfig                         |   2 +-
 configs/theadorable_debug_defconfig           |   2 +-
 configs/tinker-rk3288_defconfig               |   2 +-
 configs/tinker-s-rk3288_defconfig             |   2 +-
 configs/trats2_defconfig                      |   1 +
 configs/trats_defconfig                       |   1 +
 configs/ventana_defconfig                     |   2 +-
 configs/vyasa-rk3288_defconfig                |   2 +-
 configs/wandboard_defconfig                   |   2 +-
 configs/wetek-core2_defconfig                 |   2 +-
 configs/xilinx_zynqmp_virt_defconfig          |   3 +-
 doc/README.bus_vcxk                           |  67 --
 doc/develop/driver-model/migration.rst        |   2 +-
 doc/usage/environment.rst                     |   4 +-
 drivers/pci/Makefile                          |   2 +-
 drivers/pci/pci_rom.c                         |   2 -
 drivers/serial/sandbox.c                      |   3 +-
 drivers/video/Kconfig                         | 113 +---
 drivers/video/Makefile                        |   7 +-
 drivers/video/atmel_hlcdfb.c                  | 227 -------
 drivers/video/atmel_lcdfb.c                   | 102 ----
 drivers/video/bus_vcxk.c                      | 426 -------------
 drivers/video/exynos/Kconfig                  |   2 +-
 drivers/video/exynos/exynos_mipi_dsi_common.c |   1 -
 drivers/video/imx/Kconfig                     |   2 +-
 drivers/video/ld9040.c                        | 112 ----
 drivers/video/meson/Kconfig                   |   2 +-
 drivers/video/nexell_display.c                |  53 +-
 drivers/video/rockchip/Kconfig                |   2 +-
 drivers/video/stm32/Kconfig                   |   2 +-
 drivers/video/tegra124/display.c              |   1 -
 drivers/video/ti/Kconfig                      |   8 -
 drivers/video/ti/Makefile                     |  10 -
 drivers/video/ti/am335x-fb.c                  | 318 ----------
 drivers/video/ti/am335x-fb.h                  |  71 ---
 drivers/video/ti/tilcdc-panel.c               | 172 ------
 drivers/video/ti/tilcdc-panel.h               |  14 -
 drivers/video/ti/tilcdc.c                     | 426 -------------
 drivers/video/ti/tilcdc.h                     |  38 --
 include/asm-generic/global_data.h             |   4 +-
 include/configs/at91sam9261ek.h               |   7 -
 include/configs/at91sam9263ek.h               |   7 -
 include/configs/at91sam9m10g45ek.h            |   5 -
 include/configs/at91sam9n12ek.h               |   5 -
 include/configs/at91sam9rlek.h                |   7 -
 include/configs/brxre1.h                      |   4 -
 include/configs/colibri-imx6ull.h             |   2 +-
 include/configs/ge_b1x5v2.h                   |   1 -
 include/configs/ge_bx50v3.h                   |   1 -
 include/configs/gw_ventana.h                  |   1 -
 include/configs/imxrt1050-evk.h               |   2 +-
 include/configs/m53menlo.h                    |   5 -
 include/configs/meson64.h                     |   2 +-
 include/configs/mx23evk.h                     |  11 -
 include/configs/mx28evk.h                     |   7 -
 include/configs/nitrogen6x.h                  |   1 -
 include/configs/nyan-big.h                    |   5 -
 include/configs/pico-imx6ul.h                 |   4 +-
 include/configs/pm9261.h                      |   7 -
 include/configs/pm9263.h                      |   6 -
 include/configs/pxm2.h                        |   5 -
 include/configs/s5pc210_universal.h           |  12 -
 include/configs/sama5d3xek.h                  |   3 -
 include/configs/sunxi-common.h                |   2 +-
 include/configs/tegra-common-post.h           |  12 +-
 include/configs/tegra20-common.h              |   5 -
 include/configs/trats.h                       |   9 -
 include/configs/trats2.h                      |   9 -
 include/env_callback.h                        |   7 -
 include/lcd.h                                 | 218 -------
 include/ld9040.h                              |  15 -
 include/libtizen.h                            |   4 -
 include/samsung/misc.h                        |  15 -
 include/video.h                               |   9 +
 lib/efi_loader/Makefile                       |   2 +-
 lib/efi_loader/efi_console.c                  |   2 +-
 lib/efi_loader/efi_gop.c                      |  30 -
 lib/efi_loader/efi_setup.c                    |  10 +-
 scripts/config_whitelist.txt                  |   6 -
 test/dm/Makefile                              |   4 +-
 tools/Makefile                                |   6 +-
 331 files changed, 334 insertions(+), 5961 deletions(-)
 delete mode 100644 board/compulab/common/omap3_display.c
 delete mode 100644 common/lcd.c
 delete mode 100644 common/lcd_console.c
 delete mode 100644 common/lcd_console_rotation.c
 delete mode 100644 doc/README.bus_vcxk
 delete mode 100644 drivers/video/bus_vcxk.c
 delete mode 100644 drivers/video/ld9040.c
 delete mode 100644 drivers/video/ti/Kconfig
 delete mode 100644 drivers/video/ti/Makefile
 delete mode 100644 drivers/video/ti/am335x-fb.c
 delete mode 100644 drivers/video/ti/am335x-fb.h
 delete mode 100644 drivers/video/ti/tilcdc-panel.c
 delete mode 100644 drivers/video/ti/tilcdc-panel.h
 delete mode 100644 drivers/video/ti/tilcdc.c
 delete mode 100644 drivers/video/ti/tilcdc.h
 delete mode 100644 include/lcd.h
 delete mode 100644 include/ld9040.h

-- 
2.38.0.413.g74048e4d9e-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
