Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 221DE6043C8
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Oct 2022 13:48:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7F1CC63326;
	Wed, 19 Oct 2022 11:48:44 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A2C3C63326
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Oct 2022 11:25:20 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id b79so13985872iof.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Oct 2022 04:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mrT8m8VozhXFi7OI6yrlIy2LevgpXbVBb+++MLpc2vk=;
 b=A2LUw2/u7/C6bE98wV+dClO5Sbnyv/230/jMvQsW5PdhmFeI0ENjCA0IFn9lNgIFXv
 twVMGxBWW90ho4oPNgZGFhfwVgYxN+w1x0INNiTCS5KqwvOHRwP4L5XdncGpOgEFpCPr
 g0opq3+lIffRSE+RPbWX6Wno8tONquwGyPPVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mrT8m8VozhXFi7OI6yrlIy2LevgpXbVBb+++MLpc2vk=;
 b=zJiA/ckdE+UGI3w8KHwGk3PyTU5kL108uIwWet7GmN5dw4qz7vFIt1WNwzgW0CHplp
 w0K9EMFxhQWUeXvsDq27q2GUUMBvJiFhg9RLyTjoY4jy8YHTziWYqkr72hx/JITkCNOY
 K3OWCNxl76BjHqVlBWC3SU33wBU0+TH87ouXx5xWiuXXZAGGULZ9u96Zyusm365WkGW3
 +eGcSH74h+f2jCmI6W9Ns9FFrt08QnzLGcDv929KkaHQdXNHxx9jD7ba/zsvDWoDegvK
 OHYmx6tK9h7sC4vAgknYypAD8V+ERYJ6N3Bnm/ghYCc3Zq9BxkZLpKyt+QhtNP77GuWR
 8uxg==
X-Gm-Message-State: ACrzQf2WaPFJVypLtRKX3QneT8bR+SowSt5PaID6iJ4dTfXDC8LQMtV+
 /cpFcv2GAeW7ZmQYFHlsNdgjDA==
X-Google-Smtp-Source: AMsMyM5nZkB1Cv5BmvffdK34l3rEgHEA2URgmAIAhYv7g6dzveLcVaMnahpRnWXZnjPbLtXHcyz/0Q==
X-Received: by 2002:a05:6638:25c5:b0:363:e601:6b74 with SMTP id
 u5-20020a05663825c500b00363e6016b74mr5567725jat.168.1666178718182; 
 Wed, 19 Oct 2022 04:25:18 -0700 (PDT)
Received: from sjg1.roam.corp.google.com
 (c-67-190-102-125.hsd1.co.comcast.net. [67.190.102.125])
 by smtp.gmail.com with ESMTPSA id
 g34-20020a022722000000b003634aa4a55asm2041156jaa.82.2022.10.19.04.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 04:25:17 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Wed, 19 Oct 2022 05:23:56 -0600
Message-Id: <20221019112356.1042065-40-sjg@chromium.org>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221019112356.1042065-1-sjg@chromium.org>
References: <20221019112356.1042065-1-sjg@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Oct 2022 11:48:43 +0000
Cc: Baruch Siach <baruch@tkos.co.il>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, Wolfgang Denk <wd@denx.de>,
 Gaurav Jain <gaurav.jain@nxp.com>, Zhaofeng Li <hello@zhaofeng.li>,
 Kever Yang <kever.yang@rock-chips.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, Richard Hu <richard.hu@technexion.com>,
 Nikita Kiryanov <nikita@compulab.co.il>, Marek Vasut <marex@denx.de>,
 Stephen Warren <swarren@nvidia.com>, Stephan Gerhold <stephan@gerhold.net>,
 Dzmitry Sankouski <dsankouski@gmail.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ian Ray <ian.ray@ge.com>,
 Ramon Fried <rfried.dev@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Sven Schwermer <sven@svenschwermer.de>, Mario Six <mario.six@gdsys.cc>,
 Heiko Schocher <hs@denx.de>, Huan 'Kitty' Wang <HuanWang@ge.com>,
 Icenowy Zheng <icenowy@aosc.io>, Ye Li <ye.li@nxp.com>,
 Bharat Gooty <bharat.gooty@broadcom.com>,
 Otavio Salvador <otavio@ossystems.com.br>, Ilko Iliev <iliev@ronetix.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Troy Kisky <troy.kisky@boundarydevices.com>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Loic Poulain <loic.poulain@linaro.org>, Andrew Scull <ascull@google.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Michal Simek <michal.simek@amd.com>,
 =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>,
 Olaf Mandel <o.mandel@menlosystems.com>, Harald Seiler <hws@denx.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 =?UTF-8?q?Antti=20M=C3=A4entausta?= <antti.maentausta@ge.com>,
 Martyn Welch <martyn.welch@collabora.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Jesse Taube <Mr.Bossman075@gmail.com>, Anatolij Gustschin <agust@denx.de>,
 Tom Warren <twarren@nvidia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bin Meng <bmeng.cn@gmail.com>, Alban Bedel <alban.bedel@avionic-design.de>
Subject: [Uboot-stm32] [PATCH 39/39] video: Rename CONFIG_DM_VIDEO to
	CONFIG_VIDEO
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

Now that all the old code is gone, rename this option. Driver model
migration is now complete.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 arch/Kconfig                                        | 2 +-
 arch/arm/Kconfig                                    | 2 +-
 arch/arm/mach-imx/cpu.c                             | 2 +-
 arch/arm/mach-imx/mx6/Kconfig                       | 2 +-
 arch/arm/mach-imx/mx6/soc.c                         | 2 +-
 arch/arm/mach-imx/mx7/soc.c                         | 2 +-
 arch/arm/mach-omap2/am33xx/Kconfig                  | 2 +-
 arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c | 2 +-
 arch/arm/mach-sunxi/Kconfig                         | 6 +++---
 arch/arm/mach-tegra/board2.c                        | 4 ++--
 arch/x86/Kconfig                                    | 2 +-
 board/atmel/at91sam9x5ek/at91sam9x5ek.c             | 2 +-
 board/atmel/common/Makefile                         | 2 +-
 board/atmel/sama5d27_som1_ek/sama5d27_som1_ek.c     | 2 +-
 board/atmel/sama5d27_wlsom1_ek/sama5d27_wlsom1_ek.c | 2 +-
 board/atmel/sama5d2_xplained/sama5d2_xplained.c     | 2 +-
 board/atmel/sama5d3xek/sama5d3xek.c                 | 2 +-
 board/atmel/sama5d4_xplained/sama5d4_xplained.c     | 2 +-
 board/atmel/sama5d4ek/sama5d4ek.c                   | 2 +-
 board/beckhoff/mx53cx9020/Makefile                  | 2 +-
 board/bluewater/gurnard/gurnard.c                   | 4 ++--
 board/compal/paz00/paz00.c                          | 2 +-
 board/freescale/imx8ulp_evk/imx8ulp_evk.c           | 2 +-
 board/freescale/mx6ul_14x14_evk/mx6ul_14x14_evk.c   | 2 +-
 board/ge/mx53ppd/Makefile                           | 2 +-
 board/technexion/pico-imx7d/pico-imx7d.c            | 4 ++--
 board/toradex/colibri-imx6ull/colibri-imx6ull.c     | 4 ++--
 board/toradex/colibri_imx7/colibri_imx7.c           | 6 +++---
 board/toradex/common/tdx-common.c                   | 2 +-
 boot/pxe_utils.c                                    | 2 +-
 cmd/Kconfig                                         | 2 +-
 cmd/bdinfo.c                                        | 2 +-
 cmd/cls.c                                           | 2 +-
 common/Kconfig                                      | 2 +-
 common/board_f.c                                    | 2 +-
 common/fdt_simplefb.c                               | 2 +-
 common/splash.c                                     | 6 +++---
 common/stdio.c                                      | 4 ++--
 configs/aristainetos2c_defconfig                    | 2 +-
 configs/aristainetos2ccslb_defconfig                | 2 +-
 configs/at91sam9x5ek_dataflash_defconfig            | 2 +-
 configs/at91sam9x5ek_mmc_defconfig                  | 2 +-
 configs/at91sam9x5ek_nandflash_defconfig            | 2 +-
 configs/at91sam9x5ek_spiflash_defconfig             | 2 +-
 configs/bananapi-m5_defconfig                       | 2 +-
 configs/beelink-gsking-x_defconfig                  | 2 +-
 configs/beelink-gtking_defconfig                    | 2 +-
 configs/beelink-gtkingpro_defconfig                 | 2 +-
 configs/chromebit_mickey_defconfig                  | 2 +-
 configs/chromebook_bob_defconfig                    | 2 +-
 configs/chromebook_jerry_defconfig                  | 2 +-
 configs/chromebook_kevin_defconfig                  | 2 +-
 configs/chromebook_minnie_defconfig                 | 2 +-
 configs/chromebook_speedy_defconfig                 | 2 +-
 configs/cm_fx6_defconfig                            | 2 +-
 configs/evb-px30_defconfig                          | 2 +-
 configs/evb-rk3288_defconfig                        | 2 +-
 configs/evb-rk3399_defconfig                        | 2 +-
 configs/firefly-px30_defconfig                      | 2 +-
 configs/firefly-rk3288_defconfig                    | 2 +-
 configs/gazerbeam_defconfig                         | 2 +-
 configs/ge_b1x5v2_defconfig                         | 2 +-
 configs/ge_bx50v3_defconfig                         | 2 +-
 configs/gurnard_defconfig                           | 2 +-
 configs/gwventana_emmc_defconfig                    | 2 +-
 configs/gwventana_gw5904_defconfig                  | 2 +-
 configs/gwventana_nand_defconfig                    | 2 +-
 configs/harmony_defconfig                           | 2 +-
 configs/imx6dl_icore_nand_defconfig                 | 2 +-
 configs/imx6q_icore_nand_defconfig                  | 2 +-
 configs/imx6qdl_icore_mmc_defconfig                 | 2 +-
 configs/imx6qdl_icore_nand_defconfig                | 2 +-
 configs/imx7_cm_defconfig                           | 2 +-
 configs/imx8mp_rsb3720a1_4G_defconfig               | 2 +-
 configs/imx8mp_rsb3720a1_6G_defconfig               | 2 +-
 configs/imxrt1050-evk_defconfig                     | 2 +-
 configs/khadas-vim3_android_ab_defconfig            | 2 +-
 configs/khadas-vim3_android_defconfig               | 2 +-
 configs/khadas-vim3_defconfig                       | 2 +-
 configs/khadas-vim3l_android_ab_defconfig           | 2 +-
 configs/khadas-vim3l_android_defconfig              | 2 +-
 configs/khadas-vim3l_defconfig                      | 2 +-
 configs/libretech-ac_defconfig                      | 2 +-
 configs/libretech-cc_defconfig                      | 2 +-
 configs/libretech-cc_v2_defconfig                   | 2 +-
 configs/libretech-s905d-pc_defconfig                | 2 +-
 configs/libretech-s912-pc_defconfig                 | 2 +-
 configs/m53menlo_defconfig                          | 2 +-
 configs/marsboard_defconfig                         | 2 +-
 configs/medcom-wide_defconfig                       | 2 +-
 configs/miqi-rk3288_defconfig                       | 2 +-
 configs/mx53cx9020_defconfig                        | 2 +-
 configs/mx53ppd_defconfig                           | 2 +-
 configs/mx6cuboxi_defconfig                         | 2 +-
 configs/mx6qsabrelite_defconfig                     | 2 +-
 configs/mx6sabreauto_defconfig                      | 2 +-
 configs/mx6sabresd_defconfig                        | 2 +-
 configs/mx6ul_14x14_evk_defconfig                   | 2 +-
 configs/mx6ul_9x9_evk_defconfig                     | 2 +-
 configs/nanopc-t4-rk3399_defconfig                  | 2 +-
 configs/nanopi-m4-2gb-rk3399_defconfig              | 2 +-
 configs/nanopi-m4-rk3399_defconfig                  | 2 +-
 configs/nanopi-m4b-rk3399_defconfig                 | 2 +-
 configs/nanopi-neo4-rk3399_defconfig                | 2 +-
 configs/nanopi-r4s-rk3399_defconfig                 | 2 +-
 configs/nitrogen6dl2g_defconfig                     | 2 +-
 configs/nitrogen6dl_defconfig                       | 2 +-
 configs/nitrogen6q2g_defconfig                      | 2 +-
 configs/nitrogen6q_defconfig                        | 2 +-
 configs/nitrogen6s1g_defconfig                      | 2 +-
 configs/nitrogen6s_defconfig                        | 2 +-
 configs/nokia_rx51_defconfig                        | 2 +-
 configs/nyan-big_defconfig                          | 2 +-
 configs/odroid-c2_defconfig                         | 2 +-
 configs/odroid-c4_defconfig                         | 2 +-
 configs/odroid-go2_defconfig                        | 2 +-
 configs/odroid-hc4_defconfig                        | 2 +-
 configs/odroid-n2_defconfig                         | 2 +-
 configs/opos6uldev_defconfig                        | 2 +-
 configs/paz00_defconfig                             | 2 +-
 configs/peach-pi_defconfig                          | 2 +-
 configs/peach-pit_defconfig                         | 2 +-
 configs/pico-dwarf-imx7d_defconfig                  | 2 +-
 configs/pico-hobbit-imx7d_defconfig                 | 2 +-
 configs/pico-imx6_defconfig                         | 2 +-
 configs/pico-imx6ul_defconfig                       | 2 +-
 configs/pico-imx7d_bl33_defconfig                   | 2 +-
 configs/pico-imx7d_defconfig                        | 2 +-
 configs/pico-nymph-imx7d_defconfig                  | 2 +-
 configs/pico-pi-imx7d_defconfig                     | 2 +-
 configs/pinebook-pro-rk3399_defconfig               | 2 +-
 configs/pm9261_defconfig                            | 2 +-
 configs/pm9263_defconfig                            | 2 +-
 configs/puma-rk3399_defconfig                       | 2 +-
 configs/px30-core-ctouch2-of10-px30_defconfig       | 2 +-
 configs/px30-core-ctouch2-px30_defconfig            | 2 +-
 configs/px30-core-edimm2.2-px30_defconfig           | 2 +-
 configs/radxa-zero_defconfig                        | 2 +-
 configs/riotboard_defconfig                         | 2 +-
 configs/roc-pc-mezzanine-rk3399_defconfig           | 2 +-
 configs/roc-pc-rk3399_defconfig                     | 2 +-
 configs/rock-pi-4-rk3399_defconfig                  | 2 +-
 configs/rock-pi-4c-rk3399_defconfig                 | 2 +-
 configs/rock-pi-n10-rk3399pro_defconfig             | 2 +-
 configs/rock-pi-n8-rk3288_defconfig                 | 2 +-
 configs/rock2_defconfig                             | 2 +-
 configs/rock960-rk3399_defconfig                    | 2 +-
 configs/rockpro64-rk3399_defconfig                  | 2 +-
 configs/rpi_0_w_defconfig                           | 2 +-
 configs/rpi_2_defconfig                             | 2 +-
 configs/rpi_3_32b_defconfig                         | 2 +-
 configs/rpi_3_b_plus_defconfig                      | 2 +-
 configs/rpi_3_defconfig                             | 2 +-
 configs/rpi_4_32b_defconfig                         | 2 +-
 configs/rpi_4_defconfig                             | 2 +-
 configs/rpi_arm64_defconfig                         | 2 +-
 configs/rpi_defconfig                               | 2 +-
 configs/s5p4418_nanopi2_defconfig                   | 2 +-
 configs/sama5d27_som1_ek_mmc1_defconfig             | 2 +-
 configs/sama5d27_som1_ek_mmc_defconfig              | 2 +-
 configs/sama5d27_som1_ek_qspiflash_defconfig        | 2 +-
 configs/sama5d27_wlsom1_ek_mmc_defconfig            | 2 +-
 configs/sama5d27_wlsom1_ek_qspiflash_defconfig      | 2 +-
 configs/sama5d2_xplained_emmc_defconfig             | 2 +-
 configs/sama5d2_xplained_mmc_defconfig              | 2 +-
 configs/sama5d2_xplained_qspiflash_defconfig        | 2 +-
 configs/sama5d2_xplained_spiflash_defconfig         | 2 +-
 configs/sama5d36ek_cmp_mmc_defconfig                | 2 +-
 configs/sama5d36ek_cmp_nandflash_defconfig          | 2 +-
 configs/sama5d36ek_cmp_spiflash_defconfig           | 2 +-
 configs/sama5d3xek_mmc_defconfig                    | 2 +-
 configs/sama5d3xek_nandflash_defconfig              | 2 +-
 configs/sama5d3xek_spiflash_defconfig               | 2 +-
 configs/sama5d4_xplained_mmc_defconfig              | 2 +-
 configs/sama5d4_xplained_nandflash_defconfig        | 2 +-
 configs/sama5d4_xplained_spiflash_defconfig         | 2 +-
 configs/sama5d4ek_mmc_defconfig                     | 2 +-
 configs/sama5d4ek_nandflash_defconfig               | 2 +-
 configs/sama5d4ek_spiflash_defconfig                | 2 +-
 configs/sandbox64_defconfig                         | 2 +-
 configs/sandbox_defconfig                           | 2 +-
 configs/sandbox_flattree_defconfig                  | 2 +-
 configs/sandbox_noinst_defconfig                    | 2 +-
 configs/sandbox_spl_defconfig                       | 2 +-
 configs/sandbox_vpl_defconfig                       | 2 +-
 configs/seaboard_defconfig                          | 2 +-
 configs/sei510_defconfig                            | 2 +-
 configs/sei610_defconfig                            | 2 +-
 configs/snow_defconfig                              | 2 +-
 configs/spring_defconfig                            | 2 +-
 configs/starqltechn_defconfig                       | 2 +-
 configs/stemmy_defconfig                            | 2 +-
 configs/stm32746g-eval_defconfig                    | 2 +-
 configs/stm32746g-eval_spl_defconfig                | 2 +-
 configs/stm32f746-disco_defconfig                   | 2 +-
 configs/stm32f746-disco_spl_defconfig               | 2 +-
 configs/stm32f769-disco_defconfig                   | 2 +-
 configs/stm32f769-disco_spl_defconfig               | 2 +-
 configs/stm32mp15_basic_defconfig                   | 2 +-
 configs/stm32mp15_defconfig                         | 2 +-
 configs/stm32mp15_trusted_defconfig                 | 2 +-
 configs/tbs2910_defconfig                           | 2 +-
 configs/tec_defconfig                               | 2 +-
 configs/theadorable_debug_defconfig                 | 2 +-
 configs/tinker-rk3288_defconfig                     | 2 +-
 configs/tinker-s-rk3288_defconfig                   | 2 +-
 configs/ventana_defconfig                           | 2 +-
 configs/vyasa-rk3288_defconfig                      | 2 +-
 configs/wandboard_defconfig                         | 2 +-
 configs/wetek-core2_defconfig                       | 2 +-
 configs/xilinx_zynqmp_virt_defconfig                | 2 +-
 doc/develop/driver-model/migration.rst              | 2 +-
 doc/usage/environment.rst                           | 2 +-
 drivers/pci/Makefile                                | 2 +-
 drivers/serial/sandbox.c                            | 2 +-
 drivers/video/Kconfig                               | 6 +++---
 drivers/video/Makefile                              | 4 ++--
 drivers/video/exynos/Kconfig                        | 2 +-
 drivers/video/imx/Kconfig                           | 2 +-
 drivers/video/meson/Kconfig                         | 2 +-
 drivers/video/nexell_display.c                      | 2 +-
 drivers/video/rockchip/Kconfig                      | 2 +-
 drivers/video/stm32/Kconfig                         | 2 +-
 include/asm-generic/global_data.h                   | 4 ++--
 include/configs/colibri-imx6ull.h                   | 2 +-
 include/configs/imxrt1050-evk.h                     | 2 +-
 include/configs/meson64.h                           | 2 +-
 include/configs/pico-imx6ul.h                       | 4 +---
 include/configs/sunxi-common.h                      | 2 +-
 include/configs/tegra-common-post.h                 | 2 +-
 lib/efi_loader/Makefile                             | 2 +-
 lib/efi_loader/efi_console.c                        | 2 +-
 lib/efi_loader/efi_setup.c                          | 2 +-
 test/dm/Makefile                                    | 4 ++--
 tools/Makefile                                      | 2 +-
 235 files changed, 251 insertions(+), 253 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 1ffd77c0f4f..e3a456a98d2 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -251,7 +251,7 @@ config X86
 	imply DM_SPI
 	imply DM_SPI_FLASH
 	imply DM_USB
-	imply DM_VIDEO
+	imply VIDEO
 	imply SYSRESET
 	imply SPL_SYSRESET
 	imply SYSRESET_X86
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 2e833940525..6fb39e18d29 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1040,7 +1040,7 @@ config ARCH_APPLE
 	select DM_SERIAL
 	select DM_SPI
 	select DM_USB
-	select DM_VIDEO
+	select VIDEO
 	select IOMMU
 	select LINUX_KERNEL_IMAGE_HEADER
 	select OF_BOARD_SETUP
diff --git a/arch/arm/mach-imx/cpu.c b/arch/arm/mach-imx/cpu.c
index ba386c24b4a..702cfc33275 100644
--- a/arch/arm/mach-imx/cpu.c
+++ b/arch/arm/mach-imx/cpu.c
@@ -310,7 +310,7 @@ void arch_preboot_os(void)
 	/* disable video before launching O/S */
 	ipuv3_fb_shutdown();
 #endif
-#if defined(CONFIG_VIDEO_MXS) && !defined(CONFIG_DM_VIDEO)
+#if defined(CONFIG_VIDEO_MXS) && !defined(CONFIG_VIDEO)
 	lcdif_power_down();
 #endif
 }
diff --git a/arch/arm/mach-imx/mx6/Kconfig b/arch/arm/mach-imx/mx6/Kconfig
index c7a03e50421..752c57f52db 100644
--- a/arch/arm/mach-imx/mx6/Kconfig
+++ b/arch/arm/mach-imx/mx6/Kconfig
@@ -249,7 +249,7 @@ config TARGET_KOSAGI_NOVENA
 	select DM_MMC
 	select PCI
 	select DM_SCSI
-	select DM_VIDEO
+	select VIDEO
 	select OF_CONTROL
 	select SUPPORT_SPL
 	imply CMD_DM
diff --git a/arch/arm/mach-imx/mx6/soc.c b/arch/arm/mach-imx/mx6/soc.c
index 67bd9919892..08f47cf03d2 100644
--- a/arch/arm/mach-imx/mx6/soc.c
+++ b/arch/arm/mach-imx/mx6/soc.c
@@ -598,7 +598,7 @@ const struct boot_mode soc_boot_modes[] = {
 void reset_misc(void)
 {
 #ifndef CONFIG_SPL_BUILD
-#if defined(CONFIG_VIDEO_MXS) && !defined(CONFIG_DM_VIDEO)
+#if defined(CONFIG_VIDEO_MXS) && !defined(CONFIG_VIDEO)
 	lcdif_power_down();
 #endif
 #endif
diff --git a/arch/arm/mach-imx/mx7/soc.c b/arch/arm/mach-imx/mx7/soc.c
index c672be5d5dd..02af0d568f2 100644
--- a/arch/arm/mach-imx/mx7/soc.c
+++ b/arch/arm/mach-imx/mx7/soc.c
@@ -447,7 +447,7 @@ int boot_mode_getprisec(void)
 void reset_misc(void)
 {
 #ifndef CONFIG_SPL_BUILD
-#if defined(CONFIG_VIDEO_MXS) && !defined(CONFIG_DM_VIDEO)
+#if defined(CONFIG_VIDEO_MXS) && !defined(CONFIG_VIDEO)
 	lcdif_power_down();
 #endif
 #endif
diff --git a/arch/arm/mach-omap2/am33xx/Kconfig b/arch/arm/mach-omap2/am33xx/Kconfig
index 987ab367ece..77830e61a23 100644
--- a/arch/arm/mach-omap2/am33xx/Kconfig
+++ b/arch/arm/mach-omap2/am33xx/Kconfig
@@ -94,7 +94,7 @@ config TARGET_AM335X_GUARDIAN
 	select DM
 	select DM_SERIAL
 	select DM_GPIO
-	select DM_VIDEO
+	select VIDEO
 	select DM_PANEL_HX8238D
 
 config TARGET_AM335X_SL50
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
index d2666b97757..007f7131306 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
@@ -79,7 +79,7 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
 		}
 	}
 
-	if (IS_ENABLED(CONFIG_DM_VIDEO))
+	if (IS_ENABLED(CONFIG_VIDEO))
 		enable_vidconsole();
 
 	data = (struct stm32prog_data *)malloc(sizeof(*data));
diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 57125761844..385525cae31 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -774,7 +774,7 @@ config VIDEO_SUNXI
 	depends on !MACH_SUN9I
 	depends on !MACH_SUN50I
 	depends on !SUN50I_GEN_H6
-	select DM_VIDEO
+	select VIDEO
 	select DISPLAY
 	imply VIDEO_DT_SIMPLEFB
 	default y
@@ -839,7 +839,7 @@ config VIDEO_LCD_MODE
 
 config VIDEO_LCD_DCLK_PHASE
 	int "LCD panel display clock phase"
-	depends on VIDEO_SUNXI || DM_VIDEO
+	depends on VIDEO_SUNXI || VIDEO
 	default 1
 	range 0 3
 	---help---
@@ -914,7 +914,7 @@ config SUNXI_DE2
 config VIDEO_DE2
 	bool "Display Engine 2 video driver"
 	depends on SUNXI_DE2
-	select DM_VIDEO
+	select VIDEO
 	select DISPLAY
 	select VIDEO_DW_HDMI
 	imply VIDEO_DT_SIMPLEFB
diff --git a/arch/arm/mach-tegra/board2.c b/arch/arm/mach-tegra/board2.c
index 1994db0e15f..82d3d335028 100644
--- a/arch/arm/mach-tegra/board2.c
+++ b/arch/arm/mach-tegra/board2.c
@@ -134,7 +134,7 @@ int board_init(void)
 #endif
 
 	/* Init is handled automatically in the driver-model case */
-#if defined(CONFIG_DM_VIDEO)
+#if defined(CONFIG_VIDEO)
 	pin_mux_display();
 #endif
 	/* boot param addr */
@@ -158,7 +158,7 @@ int board_init(void)
 	pin_mux_usb();
 #endif
 
-#if defined(CONFIG_DM_VIDEO)
+#if defined(CONFIG_VIDEO)
 	board_id = tegra_board_id();
 	err = tegra_lcd_pmic_init(board_id);
 	if (err) {
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 7e86c6a0cd0..a2da080eaed 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -703,7 +703,7 @@ config VBT_ADDR
 
 config VIDEO_FSP
 	bool "Enable FSP framebuffer driver support"
-	depends on HAVE_VBT && DM_VIDEO
+	depends on HAVE_VBT && VIDEO
 	help
 	  Turn on this option to enable a framebuffer driver when U-Boot is
 	  using Video BIOS Table (VBT) image for FSP firmware to initialize
diff --git a/board/atmel/at91sam9x5ek/at91sam9x5ek.c b/board/atmel/at91sam9x5ek/at91sam9x5ek.c
index 8192824c59c..b5af35bc7e5 100644
--- a/board/atmel/at91sam9x5ek/at91sam9x5ek.c
+++ b/board/atmel/at91sam9x5ek/at91sam9x5ek.c
@@ -87,7 +87,7 @@ static void at91sam9x5ek_nand_hw_init(void)
 #ifdef CONFIG_BOARD_LATE_INIT
 int board_late_init(void)
 {
-#ifdef CONFIG_DM_VIDEO
+#ifdef CONFIG_VIDEO
 	at91_video_show_board_info();
 #endif
 	at91_prepare_cpu_var();
diff --git a/board/atmel/common/Makefile b/board/atmel/common/Makefile
index 6bc8cabb8d6..c046da79886 100644
--- a/board/atmel/common/Makefile
+++ b/board/atmel/common/Makefile
@@ -6,4 +6,4 @@
 obj-y += board.o
 obj-$(CONFIG_I2C_EEPROM) += mac_eeprom.o
 obj-$(CONFIG_SPI_FLASH_SFDP_SUPPORT) += mac-spi-nor.o
-obj-$(CONFIG_DM_VIDEO) += video_display.o
+obj-$(CONFIG_VIDEO) += video_display.o
diff --git a/board/atmel/sama5d27_som1_ek/sama5d27_som1_ek.c b/board/atmel/sama5d27_som1_ek/sama5d27_som1_ek.c
index 65d0a7532ea..329eac7223a 100644
--- a/board/atmel/sama5d27_som1_ek/sama5d27_som1_ek.c
+++ b/board/atmel/sama5d27_som1_ek/sama5d27_som1_ek.c
@@ -39,7 +39,7 @@ static void board_usb_hw_init(void)
 #ifdef CONFIG_BOARD_LATE_INIT
 int board_late_init(void)
 {
-#ifdef CONFIG_DM_VIDEO
+#ifdef CONFIG_VIDEO
 	at91_video_show_board_info();
 #endif
 	at91_pda_detect();
diff --git a/board/atmel/sama5d27_wlsom1_ek/sama5d27_wlsom1_ek.c b/board/atmel/sama5d27_wlsom1_ek/sama5d27_wlsom1_ek.c
index c38585c6fe7..6524867708a 100644
--- a/board/atmel/sama5d27_wlsom1_ek/sama5d27_wlsom1_ek.c
+++ b/board/atmel/sama5d27_wlsom1_ek/sama5d27_wlsom1_ek.c
@@ -32,7 +32,7 @@ static void rgb_leds_init(void)
 #ifdef CONFIG_BOARD_LATE_INIT
 int board_late_init(void)
 {
-#ifdef CONFIG_DM_VIDEO
+#ifdef CONFIG_VIDEO
 	at91_video_show_board_info();
 #endif
 	at91_pda_detect();
diff --git a/board/atmel/sama5d2_xplained/sama5d2_xplained.c b/board/atmel/sama5d2_xplained/sama5d2_xplained.c
index 9e0f9c3b7e3..aa522075691 100644
--- a/board/atmel/sama5d2_xplained/sama5d2_xplained.c
+++ b/board/atmel/sama5d2_xplained/sama5d2_xplained.c
@@ -38,7 +38,7 @@ static void board_usb_hw_init(void)
 #ifdef CONFIG_BOARD_LATE_INIT
 int board_late_init(void)
 {
-#ifdef CONFIG_DM_VIDEO
+#ifdef CONFIG_VIDEO
 	at91_video_show_board_info();
 #endif
 	at91_pda_detect();
diff --git a/board/atmel/sama5d3xek/sama5d3xek.c b/board/atmel/sama5d3xek/sama5d3xek.c
index 132e7fad1ef..008f1db6b0e 100644
--- a/board/atmel/sama5d3xek/sama5d3xek.c
+++ b/board/atmel/sama5d3xek/sama5d3xek.c
@@ -186,7 +186,7 @@ int board_late_init(void)
 	strcat(name, "ek.dtb");
 	env_set("dtb_name", name);
 #endif
-#ifdef CONFIG_DM_VIDEO
+#ifdef CONFIG_VIDEO
 	at91_video_show_board_info();
 #endif
 	return 0;
diff --git a/board/atmel/sama5d4_xplained/sama5d4_xplained.c b/board/atmel/sama5d4_xplained/sama5d4_xplained.c
index 9fb7e6f308d..4058594e4de 100644
--- a/board/atmel/sama5d4_xplained/sama5d4_xplained.c
+++ b/board/atmel/sama5d4_xplained/sama5d4_xplained.c
@@ -76,7 +76,7 @@ static void sama5d4_xplained_usb_hw_init(void)
 int board_late_init(void)
 {
 	at91_pda_detect();
-#ifdef CONFIG_DM_VIDEO
+#ifdef CONFIG_VIDEO
 	at91_video_show_board_info();
 #endif
 	return 0;
diff --git a/board/atmel/sama5d4ek/sama5d4ek.c b/board/atmel/sama5d4ek/sama5d4ek.c
index ba385333433..ef5a8a0d5cc 100644
--- a/board/atmel/sama5d4ek/sama5d4ek.c
+++ b/board/atmel/sama5d4ek/sama5d4ek.c
@@ -74,7 +74,7 @@ static void sama5d4ek_usb_hw_init(void)
 #ifdef CONFIG_BOARD_LATE_INIT
 int board_late_init(void)
 {
-#ifdef CONFIG_DM_VIDEO
+#ifdef CONFIG_VIDEO
 	at91_video_show_board_info();
 #endif
 	return 0;
diff --git a/board/beckhoff/mx53cx9020/Makefile b/board/beckhoff/mx53cx9020/Makefile
index 7f15fc5746d..423a5532ca6 100644
--- a/board/beckhoff/mx53cx9020/Makefile
+++ b/board/beckhoff/mx53cx9020/Makefile
@@ -4,4 +4,4 @@
 # Patrick Bruenn <p.bruenn@beckhoff.com>
 
 obj-y               += mx53cx9020.o
-obj-$(CONFIG_DM_VIDEO) += mx53cx9020_video.o
+obj-$(CONFIG_VIDEO) += mx53cx9020_video.o
diff --git a/board/bluewater/gurnard/gurnard.c b/board/bluewater/gurnard/gurnard.c
index aee134dbc56..f547ce3cc21 100644
--- a/board/bluewater/gurnard/gurnard.c
+++ b/board/bluewater/gurnard/gurnard.c
@@ -139,7 +139,7 @@ static void lcd_splash(int width, int height)
 }
 #endif
 
-#ifdef CONFIG_DM_VIDEO
+#ifdef CONFIG_VIDEO
 static void at91sam9g45_lcd_hw_init(void)
 {
 	at91_set_A_periph(AT91_PIN_PE0, 0);	/* LCDDPWR */
@@ -337,7 +337,7 @@ int board_init(void)
 	at91_mci_hw_init();
 #endif
 
-#ifdef CONFIG_DM_VIDEO
+#ifdef CONFIG_VIDEO
 	at91sam9g45_lcd_hw_init();
 	at91_set_A_periph(AT91_PIN_PE6, 1);	/* power up */
 
diff --git a/board/compal/paz00/paz00.c b/board/compal/paz00/paz00.c
index 64d0860d213..d92eb162243 100644
--- a/board/compal/paz00/paz00.c
+++ b/board/compal/paz00/paz00.c
@@ -41,7 +41,7 @@ void pin_mux_mmc(void)
 }
 #endif
 
-#ifdef CONFIG_DM_VIDEO
+#ifdef CONFIG_VIDEO
 /* this is a weak define that we are overriding */
 void pin_mux_display(void)
 {
diff --git a/board/freescale/imx8ulp_evk/imx8ulp_evk.c b/board/freescale/imx8ulp_evk/imx8ulp_evk.c
index 1fd338c7e16..5aad1074a86 100644
--- a/board/freescale/imx8ulp_evk/imx8ulp_evk.c
+++ b/board/freescale/imx8ulp_evk/imx8ulp_evk.c
@@ -112,7 +112,7 @@ int board_init(void)
 	}
 
 	/* When sync with M33 is failed, use local driver to set for video */
-	if (sync != 0 && IS_ENABLED(CONFIG_DM_VIDEO)) {
+	if (sync != 0 && IS_ENABLED(CONFIG_VIDEO)) {
 		mipi_dsi_mux_panel();
 		mipi_dsi_panel_backlight();
 	}
diff --git a/board/freescale/mx6ul_14x14_evk/mx6ul_14x14_evk.c b/board/freescale/mx6ul_14x14_evk/mx6ul_14x14_evk.c
index b916ea01029..1eec048a66f 100644
--- a/board/freescale/mx6ul_14x14_evk/mx6ul_14x14_evk.c
+++ b/board/freescale/mx6ul_14x14_evk/mx6ul_14x14_evk.c
@@ -240,7 +240,7 @@ int board_phy_config(struct phy_device *phydev)
 }
 #endif
 
-#ifdef CONFIG_DM_VIDEO
+#ifdef CONFIG_VIDEO
 static iomux_v3_cfg_t const lcd_pads[] = {
 	/* Use GPIO for Brightness adjustment, duty cycle = period. */
 	MX6_PAD_GPIO1_IO08__GPIO1_IO08 | MUX_PAD_CTRL(NO_PAD_CTRL),
diff --git a/board/ge/mx53ppd/Makefile b/board/ge/mx53ppd/Makefile
index f423e80caee..9fae4143998 100644
--- a/board/ge/mx53ppd/Makefile
+++ b/board/ge/mx53ppd/Makefile
@@ -7,4 +7,4 @@
 # Jason Liu <r64343@freescale.com>
 
 obj-y			+= mx53ppd.o
-obj-$(CONFIG_DM_VIDEO)	+= mx53ppd_video.o
+obj-$(CONFIG_VIDEO)	+= mx53ppd_video.o
diff --git a/board/technexion/pico-imx7d/pico-imx7d.c b/board/technexion/pico-imx7d/pico-imx7d.c
index 1c0cc238df0..7db34abcb1e 100644
--- a/board/technexion/pico-imx7d/pico-imx7d.c
+++ b/board/technexion/pico-imx7d/pico-imx7d.c
@@ -175,7 +175,7 @@ int board_early_init_f(void)
 	return 0;
 }
 
-#ifdef CONFIG_DM_VIDEO
+#ifdef CONFIG_VIDEO
 void setup_lcd(void)
 {
 	gpio_request(IMX_GPIO_NR(1, 11), "lcd_brightness");
@@ -192,7 +192,7 @@ int board_init(void)
 	/* address of boot parameters */
 	gd->bd->bi_boot_params = PHYS_SDRAM + 0x100;
 
-#ifdef CONFIG_DM_VIDEO
+#ifdef CONFIG_VIDEO
 	setup_lcd();
 #endif
 #ifdef CONFIG_FEC_MXC
diff --git a/board/toradex/colibri-imx6ull/colibri-imx6ull.c b/board/toradex/colibri-imx6ull/colibri-imx6ull.c
index ba4e0df2c27..6007f110e4b 100644
--- a/board/toradex/colibri-imx6ull/colibri-imx6ull.c
+++ b/board/toradex/colibri-imx6ull/colibri-imx6ull.c
@@ -67,7 +67,7 @@ static void setup_gpmi_nand(void)
 }
 #endif /* CONFIG_NAND_MXS */
 
-#ifdef CONFIG_DM_VIDEO
+#ifdef CONFIG_VIDEO
 static const iomux_v3_cfg_t backlight_pads[] = {
 	/* Backlight On */
 	MX6_PAD_JTAG_TMS__GPIO1_IO11		| MUX_PAD_CTRL(NO_PAD_CTRL),
@@ -195,7 +195,7 @@ int board_late_init(void)
 	}
 #endif /* CONFIG_CMD_USB_SDP */
 
-#if defined(CONFIG_DM_VIDEO)
+#if defined(CONFIG_VIDEO)
 	setup_lcd();
 #endif
 
diff --git a/board/toradex/colibri_imx7/colibri_imx7.c b/board/toradex/colibri_imx7/colibri_imx7.c
index 4f04543832e..6ce4fa376ac 100644
--- a/board/toradex/colibri_imx7/colibri_imx7.c
+++ b/board/toradex/colibri_imx7/colibri_imx7.c
@@ -101,7 +101,7 @@ static void setup_gpmi_nand(void)
 }
 #endif
 
-#ifdef CONFIG_DM_VIDEO
+#ifdef CONFIG_VIDEO
 static iomux_v3_cfg_t const backlight_pads[] = {
 	/* Backlight On */
 	MX7D_PAD_SD1_WP__GPIO5_IO1 | MUX_PAD_CTRL(NO_PAD_CTRL),
@@ -134,7 +134,7 @@ static int setup_lcd(void)
  */
 void board_preboot_os(void)
 {
-#ifdef CONFIG_DM_VIDEO
+#ifdef CONFIG_VIDEO
 	gpio_direction_output(GPIO_PWM_A, 1);
 	gpio_direction_output(GPIO_BL_ON, 0);
 #endif
@@ -334,7 +334,7 @@ int board_fix_fdt(void *rw_fdt_blob)
 #if defined(CONFIG_BOARD_LATE_INIT)
 int board_late_init(void)
 {
-#if defined(CONFIG_DM_VIDEO)
+#if defined(CONFIG_VIDEO)
 	setup_lcd();
 #endif
 
diff --git a/board/toradex/common/tdx-common.c b/board/toradex/common/tdx-common.c
index fadbe455419..071961f3d93 100644
--- a/board/toradex/common/tdx-common.c
+++ b/board/toradex/common/tdx-common.c
@@ -9,7 +9,7 @@
 #include <init.h>
 #include <linux/libfdt.h>
 
-#ifdef CONFIG_DM_VIDEO
+#ifdef CONFIG_VIDEO
 #include <bmp_logo.h>
 #include <dm.h>
 #include <splash.h>
diff --git a/boot/pxe_utils.c b/boot/pxe_utils.c
index 3fdd14d1cdb..8133006875f 100644
--- a/boot/pxe_utils.c
+++ b/boot/pxe_utils.c
@@ -1518,7 +1518,7 @@ void handle_pxe_menu(struct pxe_context *ctx, struct pxe_menu *cfg)
 		/* display BMP if available */
 		if (cfg->bmp) {
 			if (get_relfile(ctx, cfg->bmp, image_load_addr, NULL)) {
-#if defined(CONFIG_DM_VIDEO)
+#if defined(CONFIG_VIDEO)
 				struct udevice *dev;
 
 				err = uclass_first_device_err(UCLASS_VIDEO, &dev);
diff --git a/cmd/Kconfig b/cmd/Kconfig
index bdeaeefe67a..a077e7f4b14 100644
--- a/cmd/Kconfig
+++ b/cmd/Kconfig
@@ -1868,7 +1868,7 @@ menu "Misc commands"
 
 config CMD_BMP
 	bool "Enable 'bmp' command"
-	depends on DM_VIDEO
+	depends on VIDEO
 	help
 	  This provides a way to obtain information about a BMP-format image
 	  and to display it. BMP (which presumably stands for BitMaP) is a
diff --git a/cmd/bdinfo.c b/cmd/bdinfo.c
index c454e6eee18..bf002f84475 100644
--- a/cmd/bdinfo.c
+++ b/cmd/bdinfo.c
@@ -122,7 +122,7 @@ int do_bdinfo(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
 	bdinfo_print_num_l("fdt_blob", (ulong)gd->fdt_blob);
 	bdinfo_print_num_l("new_fdt", (ulong)gd->new_fdt);
 	bdinfo_print_num_l("fdt_size", (ulong)gd->fdt_size);
-	if (IS_ENABLED(CONFIG_DM_VIDEO))
+	if (IS_ENABLED(CONFIG_VIDEO))
 		show_video_info();
 #if CONFIG_IS_ENABLED(MULTI_DTB_FIT)
 	bdinfo_print_num_l("multi_dtb_fit", (ulong)gd->multi_dtb_fit);
diff --git a/cmd/cls.c b/cmd/cls.c
index ba36220d9e1..18643ec0243 100644
--- a/cmd/cls.c
+++ b/cmd/cls.c
@@ -19,7 +19,7 @@ static int do_video_clear(struct cmd_tbl *cmdtp, int flag, int argc,
 
 	/*  Send clear screen and home */
 	printf(CSI "2J" CSI "1;1H");
-	if (CONFIG_IS_ENABLED(DM_VIDEO) && !CONFIG_IS_ENABLED(VIDEO_ANSI)) {
+	if (CONFIG_IS_ENABLED(VIDEO) && !CONFIG_IS_ENABLED(VIDEO_ANSI)) {
 		if (uclass_first_device_err(UCLASS_VIDEO, &dev))
 			return CMD_RET_FAILURE;
 		if (video_clear(dev))
diff --git a/common/Kconfig b/common/Kconfig
index 6608a4f0fc1..62e7fb5d0e9 100644
--- a/common/Kconfig
+++ b/common/Kconfig
@@ -194,7 +194,7 @@ config CONSOLE_FLUSH_SUPPORT
 
 config CONSOLE_MUX
 	bool "Enable console multiplexing"
-	default y if DM_VIDEO || VIDEO || LCD
+	default y if VIDEO || VIDEO || LCD
 	help
 	  This allows multiple devices to be used for each console 'file'.
 	  For example, stdout can be set to go to serial and video.
diff --git a/common/board_f.c b/common/board_f.c
index 2660ce67d8b..8bd3291edef 100644
--- a/common/board_f.c
+++ b/common/board_f.c
@@ -401,7 +401,7 @@ __weak int arch_reserve_mmu(void)
 
 static int reserve_video(void)
 {
-	if (IS_ENABLED(CONFIG_DM_VIDEO)) {
+	if (IS_ENABLED(CONFIG_VIDEO)) {
 		ulong addr;
 		int ret;
 
diff --git a/common/fdt_simplefb.c b/common/fdt_simplefb.c
index 951956430c3..71d4c8fde90 100644
--- a/common/fdt_simplefb.c
+++ b/common/fdt_simplefb.c
@@ -82,7 +82,7 @@ int fdt_simplefb_enable_existing_node(void *blob)
 	return fdt_simplefb_configure_node(blob, off);
 }
 
-#if CONFIG_IS_ENABLED(DM_VIDEO)
+#if CONFIG_IS_ENABLED(VIDEO)
 int fdt_simplefb_enable_and_mem_rsv(void *blob)
 {
 	struct fdt_memory mem;
diff --git a/common/splash.c b/common/splash.c
index f31ab4fe1d7..c4435560e94 100644
--- a/common/splash.c
+++ b/common/splash.c
@@ -113,7 +113,7 @@ void splash_get_pos(int *x, int *y)
 }
 #endif /* CONFIG_SPLASH_SCREEN_ALIGN */
 
-#if defined(CONFIG_DM_VIDEO) && !defined(CONFIG_HIDE_LOGO_VERSION)
+#if defined(CONFIG_VIDEO) && !defined(CONFIG_HIDE_LOGO_VERSION)
 
 #ifdef CONFIG_VIDEO_LOGO
 #include <bmp_logo.h>
@@ -145,7 +145,7 @@ void splash_display_banner(void)
 	vidconsole_put_string(dev, buf);
 	vidconsole_position_cursor(dev, 0, row);
 }
-#endif /* CONFIG_DM_VIDEO && !CONFIG_HIDE_LOGO_VERSION */
+#endif /* CONFIG_VIDEO && !CONFIG_HIDE_LOGO_VERSION */
 
 /*
  * Common function to show a splash image if env("splashimage") is set.
@@ -175,7 +175,7 @@ int splash_display(void)
 	if (x || y)
 		goto end;
 
-#if defined(CONFIG_DM_VIDEO) && !defined(CONFIG_HIDE_LOGO_VERSION)
+#if defined(CONFIG_VIDEO) && !defined(CONFIG_HIDE_LOGO_VERSION)
 	splash_display_banner();
 #endif
 end:
diff --git a/common/stdio.c b/common/stdio.c
index 481a30486a7..98f404d49fe 100644
--- a/common/stdio.c
+++ b/common/stdio.c
@@ -200,7 +200,7 @@ struct stdio_dev *stdio_get_by_name(const char *name)
 		if (strcmp(sdev->name, name) == 0)
 			return sdev;
 	}
-	if (IS_ENABLED(CONFIG_DM_VIDEO)) {
+	if (IS_ENABLED(CONFIG_VIDEO)) {
 		/*
 		 * We did not find a suitable stdio device. If there is a video
 		 * driver with a name starting with 'vidconsole', we can try
@@ -340,7 +340,7 @@ int stdio_add_devices(void)
 #if CONFIG_IS_ENABLED(SYS_I2C_LEGACY)
 	i2c_init_all();
 #endif
-	if (IS_ENABLED(CONFIG_DM_VIDEO)) {
+	if (IS_ENABLED(CONFIG_VIDEO)) {
 		/*
 		 * If the console setting is not in environment variables then
 		 * console_init_r() will not be calling iomux_doenv() (which
diff --git a/configs/aristainetos2c_defconfig b/configs/aristainetos2c_defconfig
index 7c421f5ae99..3f6f579845f 100644
--- a/configs/aristainetos2c_defconfig
+++ b/configs/aristainetos2c_defconfig
@@ -113,7 +113,7 @@ CONFIG_SYSRESET=y
 CONFIG_SYSRESET_WATCHDOG=y
 CONFIG_USB=y
 CONFIG_USB_STORAGE=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_DISPLAY=y
diff --git a/configs/aristainetos2ccslb_defconfig b/configs/aristainetos2ccslb_defconfig
index ed7e8c57ad7..62da1778d56 100644
--- a/configs/aristainetos2ccslb_defconfig
+++ b/configs/aristainetos2ccslb_defconfig
@@ -113,7 +113,7 @@ CONFIG_SYSRESET=y
 CONFIG_SYSRESET_WATCHDOG=y
 CONFIG_USB=y
 CONFIG_USB_STORAGE=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_DISPLAY=y
diff --git a/configs/at91sam9x5ek_dataflash_defconfig b/configs/at91sam9x5ek_dataflash_defconfig
index 8ebeac2fb57..3d7900ad512 100644
--- a/configs/at91sam9x5ek_dataflash_defconfig
+++ b/configs/at91sam9x5ek_dataflash_defconfig
@@ -72,7 +72,7 @@ CONFIG_ATMEL_PIT_TIMER=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_ATMEL_HLCD=y
diff --git a/configs/at91sam9x5ek_mmc_defconfig b/configs/at91sam9x5ek_mmc_defconfig
index 6649986e641..b791833ba2a 100644
--- a/configs/at91sam9x5ek_mmc_defconfig
+++ b/configs/at91sam9x5ek_mmc_defconfig
@@ -69,7 +69,7 @@ CONFIG_ATMEL_PIT_TIMER=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_ATMEL_HLCD=y
diff --git a/configs/at91sam9x5ek_nandflash_defconfig b/configs/at91sam9x5ek_nandflash_defconfig
index a9371ad1973..74e1ce30747 100644
--- a/configs/at91sam9x5ek_nandflash_defconfig
+++ b/configs/at91sam9x5ek_nandflash_defconfig
@@ -71,7 +71,7 @@ CONFIG_ATMEL_PIT_TIMER=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_ATMEL_HLCD=y
diff --git a/configs/at91sam9x5ek_spiflash_defconfig b/configs/at91sam9x5ek_spiflash_defconfig
index 1f7d5954ade..e6b2a87ff13 100644
--- a/configs/at91sam9x5ek_spiflash_defconfig
+++ b/configs/at91sam9x5ek_spiflash_defconfig
@@ -73,7 +73,7 @@ CONFIG_ATMEL_PIT_TIMER=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_ATMEL_HLCD=y
diff --git a/configs/bananapi-m5_defconfig b/configs/bananapi-m5_defconfig
index 6ab2d8ef0c4..cd85e32f022 100644
--- a/configs/bananapi-m5_defconfig
+++ b/configs/bananapi-m5_defconfig
@@ -61,7 +61,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_USB_GADGET_DWC2_OTG_PHY_BUS_WIDTH_8=y
 CONFIG_USB_GADGET_DOWNLOAD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/beelink-gsking-x_defconfig b/configs/beelink-gsking-x_defconfig
index 2c8c642dcb2..8b760fcee47 100644
--- a/configs/beelink-gsking-x_defconfig
+++ b/configs/beelink-gsking-x_defconfig
@@ -62,7 +62,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_USB_GADGET_DWC2_OTG_PHY_BUS_WIDTH_8=y
 CONFIG_USB_GADGET_DOWNLOAD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/beelink-gtking_defconfig b/configs/beelink-gtking_defconfig
index 9848252e7e9..5f3cbe92c67 100644
--- a/configs/beelink-gtking_defconfig
+++ b/configs/beelink-gtking_defconfig
@@ -62,7 +62,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_USB_GADGET_DWC2_OTG_PHY_BUS_WIDTH_8=y
 CONFIG_USB_GADGET_DOWNLOAD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/beelink-gtkingpro_defconfig b/configs/beelink-gtkingpro_defconfig
index 484e039fe03..59245391661 100644
--- a/configs/beelink-gtkingpro_defconfig
+++ b/configs/beelink-gtkingpro_defconfig
@@ -62,7 +62,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_USB_GADGET_DWC2_OTG_PHY_BUS_WIDTH_8=y
 CONFIG_USB_GADGET_DOWNLOAD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/chromebit_mickey_defconfig b/configs/chromebit_mickey_defconfig
index dad3b36b993..b8e7f3a1f09 100644
--- a/configs/chromebit_mickey_defconfig
+++ b/configs/chromebit_mickey_defconfig
@@ -100,7 +100,7 @@ CONFIG_USB=y
 # CONFIG_SPL_DM_USB is not set
 CONFIG_USB_DWC2=y
 CONFIG_ROCKCHIP_USB2_PHY=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
diff --git a/configs/chromebook_bob_defconfig b/configs/chromebook_bob_defconfig
index d81129a2d8e..6ebd53eb59d 100644
--- a/configs/chromebook_bob_defconfig
+++ b/configs/chromebook_bob_defconfig
@@ -110,7 +110,7 @@ CONFIG_USB_ETHER_ASIX88179=y
 CONFIG_USB_ETHER_MCS7830=y
 CONFIG_USB_ETHER_RTL8152=y
 CONFIG_USB_ETHER_SMSC95XX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
 CONFIG_VIDEO_ROCKCHIP_MAX_XRES=1280
diff --git a/configs/chromebook_jerry_defconfig b/configs/chromebook_jerry_defconfig
index 35d546e6315..66c75e6925c 100644
--- a/configs/chromebook_jerry_defconfig
+++ b/configs/chromebook_jerry_defconfig
@@ -106,7 +106,7 @@ CONFIG_USB=y
 # CONFIG_SPL_DM_USB is not set
 CONFIG_USB_DWC2=y
 CONFIG_ROCKCHIP_USB2_PHY=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 CONFIG_CONSOLE_TRUETYPE=y
 CONFIG_DISPLAY=y
diff --git a/configs/chromebook_kevin_defconfig b/configs/chromebook_kevin_defconfig
index bafa9fb4def..7de787ed4d3 100644
--- a/configs/chromebook_kevin_defconfig
+++ b/configs/chromebook_kevin_defconfig
@@ -111,7 +111,7 @@ CONFIG_USB_ETHER_ASIX88179=y
 CONFIG_USB_ETHER_MCS7830=y
 CONFIG_USB_ETHER_RTL8152=y
 CONFIG_USB_ETHER_SMSC95XX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
 CONFIG_VIDEO_ROCKCHIP_MAX_XRES=2400
diff --git a/configs/chromebook_minnie_defconfig b/configs/chromebook_minnie_defconfig
index 60fc528a8ce..f0c0843278f 100644
--- a/configs/chromebook_minnie_defconfig
+++ b/configs/chromebook_minnie_defconfig
@@ -106,7 +106,7 @@ CONFIG_USB=y
 # CONFIG_SPL_DM_USB is not set
 CONFIG_USB_DWC2=y
 CONFIG_ROCKCHIP_USB2_PHY=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
diff --git a/configs/chromebook_speedy_defconfig b/configs/chromebook_speedy_defconfig
index e6f03faa87e..8e4e94567c1 100644
--- a/configs/chromebook_speedy_defconfig
+++ b/configs/chromebook_speedy_defconfig
@@ -102,7 +102,7 @@ CONFIG_USB=y
 # CONFIG_SPL_DM_USB is not set
 CONFIG_USB_DWC2=y
 CONFIG_ROCKCHIP_USB2_PHY=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 CONFIG_CONSOLE_TRUETYPE=y
 CONFIG_DISPLAY=y
diff --git a/configs/cm_fx6_defconfig b/configs/cm_fx6_defconfig
index e323438506f..ed267dd2e3f 100644
--- a/configs/cm_fx6_defconfig
+++ b/configs/cm_fx6_defconfig
@@ -112,7 +112,7 @@ CONFIG_MXC_SPI=y
 CONFIG_USB=y
 CONFIG_USB_KEYBOARD=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
diff --git a/configs/evb-px30_defconfig b/configs/evb-px30_defconfig
index 3ed5c3e38ce..5c621636616 100644
--- a/configs/evb-px30_defconfig
+++ b/configs/evb-px30_defconfig
@@ -109,7 +109,7 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_GENERIC=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_DWC2_OTG=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_SPL_TINY_MEMSET=y
 CONFIG_TPL_TINY_MEMSET=y
diff --git a/configs/evb-rk3288_defconfig b/configs/evb-rk3288_defconfig
index 40e235b1ca7..18384474534 100644
--- a/configs/evb-rk3288_defconfig
+++ b/configs/evb-rk3288_defconfig
@@ -86,7 +86,7 @@ CONFIG_USB_DWC2=y
 CONFIG_ROCKCHIP_USB2_PHY=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_DWC2_OTG=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
diff --git a/configs/evb-rk3399_defconfig b/configs/evb-rk3399_defconfig
index b55e0c21e62..504ba2c0d3c 100644
--- a/configs/evb-rk3399_defconfig
+++ b/configs/evb-rk3399_defconfig
@@ -75,7 +75,7 @@ CONFIG_USB_ETHER_ASIX88179=y
 CONFIG_USB_ETHER_MCS7830=y
 CONFIG_USB_ETHER_RTL8152=y
 CONFIG_USB_ETHER_SMSC95XX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
diff --git a/configs/firefly-px30_defconfig b/configs/firefly-px30_defconfig
index eedcd97c0ea..bf6c1c6d7e6 100644
--- a/configs/firefly-px30_defconfig
+++ b/configs/firefly-px30_defconfig
@@ -108,7 +108,7 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_GENERIC=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_DWC2_OTG=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_SPL_TINY_MEMSET=y
 CONFIG_TPL_TINY_MEMSET=y
diff --git a/configs/firefly-rk3288_defconfig b/configs/firefly-rk3288_defconfig
index 1349d6464d1..4312e4f8206 100644
--- a/configs/firefly-rk3288_defconfig
+++ b/configs/firefly-rk3288_defconfig
@@ -87,7 +87,7 @@ CONFIG_USB_ETHER_ASIX=y
 CONFIG_USB_ETHER_SMSC95XX=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_DWC2_OTG=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
diff --git a/configs/gazerbeam_defconfig b/configs/gazerbeam_defconfig
index bee7277483c..025d319b1a1 100644
--- a/configs/gazerbeam_defconfig
+++ b/configs/gazerbeam_defconfig
@@ -219,7 +219,7 @@ CONFIG_MPC83XX_TIMER=y
 CONFIG_TPM_ATMEL_TWI=y
 CONFIG_TPM_AUTH_SESSIONS=y
 # CONFIG_TPM_V2 is not set
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_LOGICORE_DP_TX=y
 CONFIG_OSD=y
diff --git a/configs/ge_b1x5v2_defconfig b/configs/ge_b1x5v2_defconfig
index fefd9901e80..3e51a8fdee3 100644
--- a/configs/ge_b1x5v2_defconfig
+++ b/configs/ge_b1x5v2_defconfig
@@ -131,7 +131,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
 CONFIG_USB_GADGET_DOWNLOAD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_WATCHDOG_TIMEOUT_MSECS=30000
 CONFIG_IMX_WATCHDOG=y
diff --git a/configs/ge_bx50v3_defconfig b/configs/ge_bx50v3_defconfig
index b59d0b9c98c..b77afab5037 100644
--- a/configs/ge_bx50v3_defconfig
+++ b/configs/ge_bx50v3_defconfig
@@ -94,7 +94,7 @@ CONFIG_DM_SPI=y
 CONFIG_MXC_SPI=y
 CONFIG_SYSRESET=y
 CONFIG_SYSRESET_WATCHDOG=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/gurnard_defconfig b/configs/gurnard_defconfig
index 3b98f339496..aaeaaec506e 100644
--- a/configs/gurnard_defconfig
+++ b/configs/gurnard_defconfig
@@ -59,7 +59,7 @@ CONFIG_TIMER=y
 CONFIG_ATMEL_PIT_TIMER=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_LOGO is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_ATMEL_LCD=y
diff --git a/configs/gwventana_emmc_defconfig b/configs/gwventana_emmc_defconfig
index 7a5cea597dc..235e2d63353 100644
--- a/configs/gwventana_emmc_defconfig
+++ b/configs/gwventana_emmc_defconfig
@@ -149,7 +149,7 @@ CONFIG_CI_UDC=y
 CONFIG_USB_GADGET_DOWNLOAD=y
 CONFIG_USB_ETHER=y
 CONFIG_USB_ETH_CDC=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 # CONFIG_BACKLIGHT is not set
 # CONFIG_CMD_VIDCONSOLE is not set
diff --git a/configs/gwventana_gw5904_defconfig b/configs/gwventana_gw5904_defconfig
index a7fa6670dd1..6c427db963c 100644
--- a/configs/gwventana_gw5904_defconfig
+++ b/configs/gwventana_gw5904_defconfig
@@ -153,7 +153,7 @@ CONFIG_CI_UDC=y
 CONFIG_USB_GADGET_DOWNLOAD=y
 CONFIG_USB_ETHER=y
 CONFIG_USB_ETH_CDC=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 # CONFIG_BACKLIGHT is not set
 # CONFIG_CMD_VIDCONSOLE is not set
diff --git a/configs/gwventana_nand_defconfig b/configs/gwventana_nand_defconfig
index 0c49a27f82c..69345732cb8 100644
--- a/configs/gwventana_nand_defconfig
+++ b/configs/gwventana_nand_defconfig
@@ -159,7 +159,7 @@ CONFIG_CI_UDC=y
 CONFIG_USB_GADGET_DOWNLOAD=y
 CONFIG_USB_ETHER=y
 CONFIG_USB_ETH_CDC=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 # CONFIG_BACKLIGHT is not set
 # CONFIG_CMD_VIDCONSOLE is not set
diff --git a/configs/harmony_defconfig b/configs/harmony_defconfig
index 0dc0485c6cb..cf1db81e6c1 100644
--- a/configs/harmony_defconfig
+++ b/configs/harmony_defconfig
@@ -65,7 +65,7 @@ CONFIG_USB_HOST_ETHER=y
 CONFIG_USB_ETHER_ASIX=y
 CONFIG_USB_ETHER_MCS7830=y
 CONFIG_USB_ETHER_SMSC95XX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 CONFIG_VIDEO_TEGRA20=y
 CONFIG_CONSOLE_SCROLL_LINES=10
diff --git a/configs/imx6dl_icore_nand_defconfig b/configs/imx6dl_icore_nand_defconfig
index 51c4a489e6d..48e8ddb7afd 100644
--- a/configs/imx6dl_icore_nand_defconfig
+++ b/configs/imx6dl_icore_nand_defconfig
@@ -68,7 +68,7 @@ CONFIG_PINCTRL=y
 CONFIG_PINCTRL_IMX6=y
 CONFIG_MXC_UART=y
 CONFIG_IMX_THERMAL=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
diff --git a/configs/imx6q_icore_nand_defconfig b/configs/imx6q_icore_nand_defconfig
index 62533f1ac60..251985228e7 100644
--- a/configs/imx6q_icore_nand_defconfig
+++ b/configs/imx6q_icore_nand_defconfig
@@ -69,7 +69,7 @@ CONFIG_PINCTRL=y
 CONFIG_PINCTRL_IMX6=y
 CONFIG_MXC_UART=y
 CONFIG_IMX_THERMAL=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
diff --git a/configs/imx6qdl_icore_mmc_defconfig b/configs/imx6qdl_icore_mmc_defconfig
index 0ace5d93713..0ed45160fd8 100644
--- a/configs/imx6qdl_icore_mmc_defconfig
+++ b/configs/imx6qdl_icore_mmc_defconfig
@@ -91,7 +91,7 @@ CONFIG_PINCTRL=y
 CONFIG_PINCTRL_IMX6=y
 CONFIG_MXC_UART=y
 CONFIG_IMX_THERMAL=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
diff --git a/configs/imx6qdl_icore_nand_defconfig b/configs/imx6qdl_icore_nand_defconfig
index 62533f1ac60..251985228e7 100644
--- a/configs/imx6qdl_icore_nand_defconfig
+++ b/configs/imx6qdl_icore_nand_defconfig
@@ -69,7 +69,7 @@ CONFIG_PINCTRL=y
 CONFIG_PINCTRL_IMX6=y
 CONFIG_MXC_UART=y
 CONFIG_IMX_THERMAL=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
diff --git a/configs/imx7_cm_defconfig b/configs/imx7_cm_defconfig
index 4dfb4690595..75718e5b872 100644
--- a/configs/imx7_cm_defconfig
+++ b/configs/imx7_cm_defconfig
@@ -108,7 +108,7 @@ CONFIG_USB_GADGET_MANUFACTURER="FSL"
 CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
diff --git a/configs/imx8mp_rsb3720a1_4G_defconfig b/configs/imx8mp_rsb3720a1_4G_defconfig
index 378489072f3..6f58be8bbcd 100644
--- a/configs/imx8mp_rsb3720a1_4G_defconfig
+++ b/configs/imx8mp_rsb3720a1_4G_defconfig
@@ -155,7 +155,7 @@ CONFIG_SPL_SYSRESET=y
 CONFIG_SYSRESET_PSCI=y
 CONFIG_SYSRESET_WATCHDOG=y
 CONFIG_DM_THERMAL=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_IMX_WATCHDOG=y
 CONFIG_SHA384=y
diff --git a/configs/imx8mp_rsb3720a1_6G_defconfig b/configs/imx8mp_rsb3720a1_6G_defconfig
index 469ba34de0c..591fcf27146 100644
--- a/configs/imx8mp_rsb3720a1_6G_defconfig
+++ b/configs/imx8mp_rsb3720a1_6G_defconfig
@@ -156,7 +156,7 @@ CONFIG_SPL_SYSRESET=y
 CONFIG_SYSRESET_PSCI=y
 CONFIG_SYSRESET_WATCHDOG=y
 CONFIG_DM_THERMAL=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_IMX_WATCHDOG=y
 CONFIG_SHA384=y
diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
index 9ab4d766225..c12e04db3dc 100644
--- a/configs/imxrt1050-evk_defconfig
+++ b/configs/imxrt1050-evk_defconfig
@@ -73,7 +73,7 @@ CONFIG_IMX_GPT_TIMER=y
 CONFIG_USB=y
 # CONFIG_SPL_DM_USB is not set
 CONFIG_USB_EHCI_HCD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 CONFIG_BACKLIGHT_GPIO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/khadas-vim3_android_ab_defconfig b/configs/khadas-vim3_android_ab_defconfig
index f3e9f11a8ed..d3a4ab748c4 100644
--- a/configs/khadas-vim3_android_ab_defconfig
+++ b/configs/khadas-vim3_android_ab_defconfig
@@ -95,7 +95,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x1b8e
 CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_USB_GADGET_DWC2_OTG_PHY_BUS_WIDTH_8=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/khadas-vim3_android_defconfig b/configs/khadas-vim3_android_defconfig
index f076b6e4e56..827e994f1fd 100644
--- a/configs/khadas-vim3_android_defconfig
+++ b/configs/khadas-vim3_android_defconfig
@@ -93,7 +93,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x1b8e
 CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_USB_GADGET_DWC2_OTG_PHY_BUS_WIDTH_8=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/khadas-vim3_defconfig b/configs/khadas-vim3_defconfig
index 0cf4bac809b..701e70eeb93 100644
--- a/configs/khadas-vim3_defconfig
+++ b/configs/khadas-vim3_defconfig
@@ -82,7 +82,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_USB_GADGET_DWC2_OTG_PHY_BUS_WIDTH_8=y
 CONFIG_USB_GADGET_DOWNLOAD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/khadas-vim3l_android_ab_defconfig b/configs/khadas-vim3l_android_ab_defconfig
index 828ce6dee9d..44ab1ed1b80 100644
--- a/configs/khadas-vim3l_android_ab_defconfig
+++ b/configs/khadas-vim3l_android_ab_defconfig
@@ -95,7 +95,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x1b8e
 CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_USB_GADGET_DWC2_OTG_PHY_BUS_WIDTH_8=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/khadas-vim3l_android_defconfig b/configs/khadas-vim3l_android_defconfig
index ee1fa5c31f8..30c5dc26040 100644
--- a/configs/khadas-vim3l_android_defconfig
+++ b/configs/khadas-vim3l_android_defconfig
@@ -93,7 +93,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x1b8e
 CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_USB_GADGET_DWC2_OTG_PHY_BUS_WIDTH_8=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/khadas-vim3l_defconfig b/configs/khadas-vim3l_defconfig
index f1524f562ac..c78dfce5d5a 100644
--- a/configs/khadas-vim3l_defconfig
+++ b/configs/khadas-vim3l_defconfig
@@ -82,7 +82,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_USB_GADGET_DWC2_OTG_PHY_BUS_WIDTH_8=y
 CONFIG_USB_GADGET_DOWNLOAD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/libretech-ac_defconfig b/configs/libretech-ac_defconfig
index f3734c50669..3e30c252bd6 100644
--- a/configs/libretech-ac_defconfig
+++ b/configs/libretech-ac_defconfig
@@ -76,7 +76,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x1b8e
 CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_USB_GADGET_DOWNLOAD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/libretech-cc_defconfig b/configs/libretech-cc_defconfig
index 7bb85289ea2..f5832cd728e 100644
--- a/configs/libretech-cc_defconfig
+++ b/configs/libretech-cc_defconfig
@@ -59,7 +59,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x1b8e
 CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_USB_GADGET_DOWNLOAD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/libretech-cc_v2_defconfig b/configs/libretech-cc_v2_defconfig
index 2181115f07b..42b76a2ac62 100644
--- a/configs/libretech-cc_v2_defconfig
+++ b/configs/libretech-cc_v2_defconfig
@@ -70,7 +70,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x1b8e
 CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_USB_GADGET_DOWNLOAD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/libretech-s905d-pc_defconfig b/configs/libretech-s905d-pc_defconfig
index 402b8a2cf74..245194ee917 100644
--- a/configs/libretech-s905d-pc_defconfig
+++ b/configs/libretech-s905d-pc_defconfig
@@ -72,7 +72,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x1b8e
 CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_USB_GADGET_DOWNLOAD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_MESON=y
 CONFIG_VIDEO_DT_SIMPLEFB=y
diff --git a/configs/libretech-s912-pc_defconfig b/configs/libretech-s912-pc_defconfig
index 7819e723109..63137eb5686 100644
--- a/configs/libretech-s912-pc_defconfig
+++ b/configs/libretech-s912-pc_defconfig
@@ -71,7 +71,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x1b8e
 CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_USB_GADGET_DOWNLOAD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_MESON=y
 CONFIG_VIDEO_DT_SIMPLEFB=y
diff --git a/configs/m53menlo_defconfig b/configs/m53menlo_defconfig
index e444d16ce30..4d399118e19 100644
--- a/configs/m53menlo_defconfig
+++ b/configs/m53menlo_defconfig
@@ -116,7 +116,7 @@ CONFIG_USB_HOST_ETHER=y
 CONFIG_USB_ETHER_ASIX=y
 CONFIG_USB_ETHER_MCS7830=y
 CONFIG_USB_ETHER_SMSC95XX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
diff --git a/configs/marsboard_defconfig b/configs/marsboard_defconfig
index 4fe153216b2..e631697ab5e 100644
--- a/configs/marsboard_defconfig
+++ b/configs/marsboard_defconfig
@@ -58,7 +58,7 @@ CONFIG_IMX_THERMAL=y
 CONFIG_USB=y
 CONFIG_USB_HOST_ETHER=y
 CONFIG_USB_ETHER_ASIX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 # CONFIG_BACKLIGHT is not set
 # CONFIG_CMD_VIDCONSOLE is not set
diff --git a/configs/medcom-wide_defconfig b/configs/medcom-wide_defconfig
index d51a124ed49..292ab8db354 100644
--- a/configs/medcom-wide_defconfig
+++ b/configs/medcom-wide_defconfig
@@ -54,6 +54,6 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_TEGRA=y
 CONFIG_USB_HOST_ETHER=y
 CONFIG_USB_ETHER_SMSC95XX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 CONFIG_VIDEO_TEGRA20=y
diff --git a/configs/miqi-rk3288_defconfig b/configs/miqi-rk3288_defconfig
index 75675e6095f..9c6de2b81de 100644
--- a/configs/miqi-rk3288_defconfig
+++ b/configs/miqi-rk3288_defconfig
@@ -84,7 +84,7 @@ CONFIG_USB_ETHER_ASIX=y
 CONFIG_USB_ETHER_SMSC95XX=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_DWC2_OTG=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
diff --git a/configs/mx53cx9020_defconfig b/configs/mx53cx9020_defconfig
index 6c3ba9cda74..7bb38937281 100644
--- a/configs/mx53cx9020_defconfig
+++ b/configs/mx53cx9020_defconfig
@@ -35,7 +35,7 @@ CONFIG_DM_REGULATOR=y
 CONFIG_MXC_UART=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_MX5=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/mx53ppd_defconfig b/configs/mx53ppd_defconfig
index c9c6b652014..e5ef804b690 100644
--- a/configs/mx53ppd_defconfig
+++ b/configs/mx53ppd_defconfig
@@ -78,7 +78,7 @@ CONFIG_USB_HOST_ETHER=y
 CONFIG_USB_ETHER_ASIX=y
 CONFIG_USB_ETHER_MCS7830=y
 CONFIG_USB_ETHER_SMSC95XX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_WATCHDOG_TIMEOUT_MSECS=8000
diff --git a/configs/mx6cuboxi_defconfig b/configs/mx6cuboxi_defconfig
index 46d0e8c9903..9cb5581430c 100644
--- a/configs/mx6cuboxi_defconfig
+++ b/configs/mx6cuboxi_defconfig
@@ -74,7 +74,7 @@ CONFIG_DM_THERMAL=y
 CONFIG_IMX_THERMAL=y
 CONFIG_USB=y
 CONFIG_USB_KEYBOARD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 # CONFIG_BACKLIGHT is not set
 # CONFIG_CMD_VIDCONSOLE is not set
diff --git a/configs/mx6qsabrelite_defconfig b/configs/mx6qsabrelite_defconfig
index 33e1a520876..3d5cf5e4441 100644
--- a/configs/mx6qsabrelite_defconfig
+++ b/configs/mx6qsabrelite_defconfig
@@ -86,7 +86,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
 CONFIG_USB_ETHER=y
 CONFIG_USB_ETH_CDC=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_I2C_EDID=y
 CONFIG_VIDEO_IPUV3=y
diff --git a/configs/mx6sabreauto_defconfig b/configs/mx6sabreauto_defconfig
index 093bb85c201..cb6a17be511 100644
--- a/configs/mx6sabreauto_defconfig
+++ b/configs/mx6sabreauto_defconfig
@@ -112,7 +112,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
 CONFIG_USB_GADGET_DOWNLOAD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
diff --git a/configs/mx6sabresd_defconfig b/configs/mx6sabresd_defconfig
index 5db81821424..f7ef8ed8cd8 100644
--- a/configs/mx6sabresd_defconfig
+++ b/configs/mx6sabresd_defconfig
@@ -117,7 +117,7 @@ CONFIG_USB_GADGET_MANUFACTURER="FSL"
 CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
diff --git a/configs/mx6ul_14x14_evk_defconfig b/configs/mx6ul_14x14_evk_defconfig
index b87973fa0b9..55ee1aa894c 100644
--- a/configs/mx6ul_14x14_evk_defconfig
+++ b/configs/mx6ul_14x14_evk_defconfig
@@ -99,7 +99,7 @@ CONFIG_USB_GADGET_MANUFACTURER="FSL"
 CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_MXS=y
diff --git a/configs/mx6ul_9x9_evk_defconfig b/configs/mx6ul_9x9_evk_defconfig
index 8062095dd47..3a90b09f9b5 100644
--- a/configs/mx6ul_9x9_evk_defconfig
+++ b/configs/mx6ul_9x9_evk_defconfig
@@ -88,7 +88,7 @@ CONFIG_SOFT_SPI=y
 CONFIG_IMX_THERMAL=y
 CONFIG_USB=y
 CONFIG_USB_STORAGE=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_MXS=y
diff --git a/configs/nanopc-t4-rk3399_defconfig b/configs/nanopc-t4-rk3399_defconfig
index 951fd0cd11e..c125663ba37 100644
--- a/configs/nanopc-t4-rk3399_defconfig
+++ b/configs/nanopc-t4-rk3399_defconfig
@@ -70,7 +70,7 @@ CONFIG_USB_ETHER_MCS7830=y
 CONFIG_USB_ETHER_RTL8152=y
 CONFIG_USB_ETHER_SMSC95XX=y
 CONFIG_USB_GADGET=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
 CONFIG_DISPLAY_ROCKCHIP_HDMI=y
diff --git a/configs/nanopi-m4-2gb-rk3399_defconfig b/configs/nanopi-m4-2gb-rk3399_defconfig
index 7d0e1f2364f..aa7e379892b 100644
--- a/configs/nanopi-m4-2gb-rk3399_defconfig
+++ b/configs/nanopi-m4-2gb-rk3399_defconfig
@@ -64,7 +64,7 @@ CONFIG_USB_ETHER_ASIX88179=y
 CONFIG_USB_ETHER_MCS7830=y
 CONFIG_USB_ETHER_RTL8152=y
 CONFIG_USB_ETHER_SMSC95XX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
 CONFIG_DISPLAY_ROCKCHIP_HDMI=y
diff --git a/configs/nanopi-m4-rk3399_defconfig b/configs/nanopi-m4-rk3399_defconfig
index 379ec879685..32f63902568 100644
--- a/configs/nanopi-m4-rk3399_defconfig
+++ b/configs/nanopi-m4-rk3399_defconfig
@@ -64,7 +64,7 @@ CONFIG_USB_ETHER_ASIX88179=y
 CONFIG_USB_ETHER_MCS7830=y
 CONFIG_USB_ETHER_RTL8152=y
 CONFIG_USB_ETHER_SMSC95XX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
 CONFIG_DISPLAY_ROCKCHIP_HDMI=y
diff --git a/configs/nanopi-m4b-rk3399_defconfig b/configs/nanopi-m4b-rk3399_defconfig
index 06cefc5e36e..497385ff2af 100644
--- a/configs/nanopi-m4b-rk3399_defconfig
+++ b/configs/nanopi-m4b-rk3399_defconfig
@@ -64,7 +64,7 @@ CONFIG_USB_ETHER_ASIX88179=y
 CONFIG_USB_ETHER_MCS7830=y
 CONFIG_USB_ETHER_RTL8152=y
 CONFIG_USB_ETHER_SMSC95XX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
 CONFIG_DISPLAY_ROCKCHIP_HDMI=y
diff --git a/configs/nanopi-neo4-rk3399_defconfig b/configs/nanopi-neo4-rk3399_defconfig
index 4bfbeb10df9..f47928d6f3c 100644
--- a/configs/nanopi-neo4-rk3399_defconfig
+++ b/configs/nanopi-neo4-rk3399_defconfig
@@ -64,7 +64,7 @@ CONFIG_USB_ETHER_ASIX88179=y
 CONFIG_USB_ETHER_MCS7830=y
 CONFIG_USB_ETHER_RTL8152=y
 CONFIG_USB_ETHER_SMSC95XX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
 CONFIG_DISPLAY_ROCKCHIP_HDMI=y
diff --git a/configs/nanopi-r4s-rk3399_defconfig b/configs/nanopi-r4s-rk3399_defconfig
index d8854abbb17..7cb1dc13d61 100644
--- a/configs/nanopi-r4s-rk3399_defconfig
+++ b/configs/nanopi-r4s-rk3399_defconfig
@@ -65,7 +65,7 @@ CONFIG_USB_ETHER_ASIX88179=y
 CONFIG_USB_ETHER_MCS7830=y
 CONFIG_USB_ETHER_RTL8152=y
 CONFIG_USB_ETHER_SMSC95XX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
 CONFIG_DISPLAY_ROCKCHIP_HDMI=y
diff --git a/configs/nitrogen6dl2g_defconfig b/configs/nitrogen6dl2g_defconfig
index badb17d9480..52872b8c5cd 100644
--- a/configs/nitrogen6dl2g_defconfig
+++ b/configs/nitrogen6dl2g_defconfig
@@ -91,7 +91,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
 CONFIG_USB_ETHER=y
 CONFIG_USB_ETH_CDC=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_I2C_EDID=y
 CONFIG_VIDEO_IPUV3=y
diff --git a/configs/nitrogen6dl_defconfig b/configs/nitrogen6dl_defconfig
index 0d95ae39608..b81ad763ecf 100644
--- a/configs/nitrogen6dl_defconfig
+++ b/configs/nitrogen6dl_defconfig
@@ -91,7 +91,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
 CONFIG_USB_ETHER=y
 CONFIG_USB_ETH_CDC=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_I2C_EDID=y
 CONFIG_VIDEO_IPUV3=y
diff --git a/configs/nitrogen6q2g_defconfig b/configs/nitrogen6q2g_defconfig
index 3ec65d42f52..b7d85465c53 100644
--- a/configs/nitrogen6q2g_defconfig
+++ b/configs/nitrogen6q2g_defconfig
@@ -94,7 +94,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
 CONFIG_USB_ETHER=y
 CONFIG_USB_ETH_CDC=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_I2C_EDID=y
 CONFIG_VIDEO_IPUV3=y
diff --git a/configs/nitrogen6q_defconfig b/configs/nitrogen6q_defconfig
index ecb38fa8045..6de79e84eb4 100644
--- a/configs/nitrogen6q_defconfig
+++ b/configs/nitrogen6q_defconfig
@@ -94,7 +94,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
 CONFIG_USB_ETHER=y
 CONFIG_USB_ETH_CDC=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_I2C_EDID=y
 CONFIG_VIDEO_IPUV3=y
diff --git a/configs/nitrogen6s1g_defconfig b/configs/nitrogen6s1g_defconfig
index d211cdfc0af..51ac95af52e 100644
--- a/configs/nitrogen6s1g_defconfig
+++ b/configs/nitrogen6s1g_defconfig
@@ -91,7 +91,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
 CONFIG_USB_ETHER=y
 CONFIG_USB_ETH_CDC=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_I2C_EDID=y
 CONFIG_VIDEO_IPUV3=y
diff --git a/configs/nitrogen6s_defconfig b/configs/nitrogen6s_defconfig
index f155a6770e2..dc8e587d040 100644
--- a/configs/nitrogen6s_defconfig
+++ b/configs/nitrogen6s_defconfig
@@ -91,7 +91,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
 CONFIG_USB_ETHER=y
 CONFIG_USB_ETH_CDC=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_I2C_EDID=y
 CONFIG_VIDEO_IPUV3=y
diff --git a/configs/nokia_rx51_defconfig b/configs/nokia_rx51_defconfig
index 6629137d004..c5b63181453 100644
--- a/configs/nokia_rx51_defconfig
+++ b/configs/nokia_rx51_defconfig
@@ -66,7 +66,7 @@ CONFIG_SPI=y
 CONFIG_USB=y
 CONFIG_USB_MUSB_UDC=y
 CONFIG_USB_OMAP3=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
diff --git a/configs/nyan-big_defconfig b/configs/nyan-big_defconfig
index 6607edde8db..e55da6ed215 100644
--- a/configs/nyan-big_defconfig
+++ b/configs/nyan-big_defconfig
@@ -98,7 +98,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0955
 CONFIG_USB_GADGET_PRODUCT_NUM=0x701a
 CONFIG_CI_UDC=y
 CONFIG_USB_GADGET_DOWNLOAD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_DISPLAY=y
diff --git a/configs/odroid-c2_defconfig b/configs/odroid-c2_defconfig
index 024a2e27d6c..335a4a3a15e 100644
--- a/configs/odroid-c2_defconfig
+++ b/configs/odroid-c2_defconfig
@@ -54,7 +54,7 @@ CONFIG_SYSINFO_SMBIOS=y
 CONFIG_USB=y
 CONFIG_USB_DWC2=y
 CONFIG_USB_KEYBOARD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/odroid-c4_defconfig b/configs/odroid-c4_defconfig
index d244e71866e..9389e34f407 100644
--- a/configs/odroid-c4_defconfig
+++ b/configs/odroid-c4_defconfig
@@ -62,7 +62,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_USB_GADGET_DWC2_OTG_PHY_BUS_WIDTH_8=y
 CONFIG_USB_GADGET_DOWNLOAD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/odroid-go2_defconfig b/configs/odroid-go2_defconfig
index 8222933bf80..f4aa53a210b 100644
--- a/configs/odroid-go2_defconfig
+++ b/configs/odroid-go2_defconfig
@@ -112,7 +112,7 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_GENERIC=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_DWC2_OTG=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_SPL_TINY_MEMSET=y
 CONFIG_TPL_TINY_MEMSET=y
diff --git a/configs/odroid-hc4_defconfig b/configs/odroid-hc4_defconfig
index fe70d5f12a1..b525358af37 100644
--- a/configs/odroid-hc4_defconfig
+++ b/configs/odroid-hc4_defconfig
@@ -80,7 +80,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_USB_GADGET_DWC2_OTG_PHY_BUS_WIDTH_8=y
 CONFIG_USB_GADGET_DOWNLOAD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/odroid-n2_defconfig b/configs/odroid-n2_defconfig
index 3703d7e17ce..fb91a5b76e8 100644
--- a/configs/odroid-n2_defconfig
+++ b/configs/odroid-n2_defconfig
@@ -62,7 +62,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_USB_GADGET_DWC2_OTG_PHY_BUS_WIDTH_8=y
 CONFIG_USB_GADGET_DOWNLOAD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/opos6uldev_defconfig b/configs/opos6uldev_defconfig
index e508b63b769..1c9579b0dd9 100644
--- a/configs/opos6uldev_defconfig
+++ b/configs/opos6uldev_defconfig
@@ -107,7 +107,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
 CONFIG_USB_GADGET_DOWNLOAD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
diff --git a/configs/paz00_defconfig b/configs/paz00_defconfig
index bb115221f6c..4cd53cd1532 100644
--- a/configs/paz00_defconfig
+++ b/configs/paz00_defconfig
@@ -49,7 +49,7 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_TEGRA=y
 CONFIG_USB_HOST_ETHER=y
 CONFIG_USB_ETHER_ASIX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 CONFIG_VIDEO_TEGRA20=y
 CONFIG_CONSOLE_SCROLL_LINES=10
diff --git a/configs/peach-pi_defconfig b/configs/peach-pi_defconfig
index aa8f85feffb..512a5390b28 100644
--- a/configs/peach-pi_defconfig
+++ b/configs/peach-pi_defconfig
@@ -80,7 +80,7 @@ CONFIG_USB=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_DWC3=y
 CONFIG_USB_HOST_ETHER=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 CONFIG_VIDCONSOLE_AS_LCD=y
 CONFIG_DISPLAY=y
diff --git a/configs/peach-pit_defconfig b/configs/peach-pit_defconfig
index 362cc0ab0ff..8b40caf13e9 100644
--- a/configs/peach-pit_defconfig
+++ b/configs/peach-pit_defconfig
@@ -79,7 +79,7 @@ CONFIG_USB=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_DWC3=y
 CONFIG_USB_HOST_ETHER=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 CONFIG_VIDCONSOLE_AS_LCD=y
 CONFIG_DISPLAY=y
diff --git a/configs/pico-dwarf-imx7d_defconfig b/configs/pico-dwarf-imx7d_defconfig
index 57a54fd3538..e0148f0d7ba 100644
--- a/configs/pico-dwarf-imx7d_defconfig
+++ b/configs/pico-dwarf-imx7d_defconfig
@@ -92,7 +92,7 @@ CONFIG_USB_GADGET_MANUFACTURER="FSL"
 CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
diff --git a/configs/pico-hobbit-imx7d_defconfig b/configs/pico-hobbit-imx7d_defconfig
index 61ceb890201..97d9895c7c1 100644
--- a/configs/pico-hobbit-imx7d_defconfig
+++ b/configs/pico-hobbit-imx7d_defconfig
@@ -92,7 +92,7 @@ CONFIG_USB_GADGET_MANUFACTURER="FSL"
 CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
diff --git a/configs/pico-imx6_defconfig b/configs/pico-imx6_defconfig
index ef724618ed9..63fdca312c2 100644
--- a/configs/pico-imx6_defconfig
+++ b/configs/pico-imx6_defconfig
@@ -88,7 +88,7 @@ CONFIG_USB_GADGET_MANUFACTURER="FSL"
 CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 # CONFIG_BACKLIGHT is not set
 # CONFIG_CMD_VIDCONSOLE is not set
diff --git a/configs/pico-imx6ul_defconfig b/configs/pico-imx6ul_defconfig
index 7384b9b6eac..cd139595d4e 100644
--- a/configs/pico-imx6ul_defconfig
+++ b/configs/pico-imx6ul_defconfig
@@ -83,7 +83,7 @@ CONFIG_USB_GADGET_MANUFACTURER="FSL"
 CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 CONFIG_VIDEO_MXS=y
 CONFIG_SPLASH_SCREEN=y
diff --git a/configs/pico-imx7d_bl33_defconfig b/configs/pico-imx7d_bl33_defconfig
index 49a8051d46a..a94f03e7e25 100644
--- a/configs/pico-imx7d_bl33_defconfig
+++ b/configs/pico-imx7d_bl33_defconfig
@@ -90,7 +90,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
 CONFIG_USB_GADGET_DOWNLOAD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_MXS=y
diff --git a/configs/pico-imx7d_defconfig b/configs/pico-imx7d_defconfig
index 62658bfa4f2..a694d86ac04 100644
--- a/configs/pico-imx7d_defconfig
+++ b/configs/pico-imx7d_defconfig
@@ -92,7 +92,7 @@ CONFIG_USB_GADGET_MANUFACTURER="FSL"
 CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_MXS=y
diff --git a/configs/pico-nymph-imx7d_defconfig b/configs/pico-nymph-imx7d_defconfig
index 57a54fd3538..e0148f0d7ba 100644
--- a/configs/pico-nymph-imx7d_defconfig
+++ b/configs/pico-nymph-imx7d_defconfig
@@ -92,7 +92,7 @@ CONFIG_USB_GADGET_MANUFACTURER="FSL"
 CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
diff --git a/configs/pico-pi-imx7d_defconfig b/configs/pico-pi-imx7d_defconfig
index 4853ab3527b..f8509e221b9 100644
--- a/configs/pico-pi-imx7d_defconfig
+++ b/configs/pico-pi-imx7d_defconfig
@@ -92,7 +92,7 @@ CONFIG_USB_GADGET_MANUFACTURER="FSL"
 CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
diff --git a/configs/pinebook-pro-rk3399_defconfig b/configs/pinebook-pro-rk3399_defconfig
index 5d9a8418998..6971d6baccb 100644
--- a/configs/pinebook-pro-rk3399_defconfig
+++ b/configs/pinebook-pro-rk3399_defconfig
@@ -97,7 +97,7 @@ CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
 CONFIG_USB_HOST_ETHER=y
 CONFIG_USB_ETHER_ASIX=y
 CONFIG_USB_ETHER_RTL8152=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
 CONFIG_DISPLAY_ROCKCHIP_EDP=y
diff --git a/configs/pm9261_defconfig b/configs/pm9261_defconfig
index ead25331b7c..851111e8308 100644
--- a/configs/pm9261_defconfig
+++ b/configs/pm9261_defconfig
@@ -64,7 +64,7 @@ CONFIG_USB=y
 CONFIG_SYS_USB_OHCI_SLOT_NAME="at91sam9261"
 CONFIG_SYS_USB_OHCI_MAX_ROOT_PORTS=2
 CONFIG_USB_ATMEL=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_ATMEL_LCD=y
 CONFIG_ATMEL_LCD_BGR555=y
diff --git a/configs/pm9263_defconfig b/configs/pm9263_defconfig
index 02e983cb5e1..c52a3dda474 100644
--- a/configs/pm9263_defconfig
+++ b/configs/pm9263_defconfig
@@ -67,7 +67,7 @@ CONFIG_USB=y
 CONFIG_SYS_USB_OHCI_SLOT_NAME="at91sam9263"
 CONFIG_SYS_USB_OHCI_MAX_ROOT_PORTS=2
 CONFIG_USB_ATMEL=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_ATMEL_LCD=y
 CONFIG_ATMEL_LCD_BGR555=y
diff --git a/configs/puma-rk3399_defconfig b/configs/puma-rk3399_defconfig
index 6acc442ba84..b2c6c3ee1e4 100644
--- a/configs/puma-rk3399_defconfig
+++ b/configs/puma-rk3399_defconfig
@@ -105,7 +105,7 @@ CONFIG_USB_ETHER_ASIX88179=y
 CONFIG_USB_ETHER_MCS7830=y
 CONFIG_USB_ETHER_RTL8152=y
 CONFIG_USB_ETHER_SMSC95XX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
diff --git a/configs/px30-core-ctouch2-of10-px30_defconfig b/configs/px30-core-ctouch2-of10-px30_defconfig
index 33d502b5f6c..65efd03c678 100644
--- a/configs/px30-core-ctouch2-of10-px30_defconfig
+++ b/configs/px30-core-ctouch2-of10-px30_defconfig
@@ -108,7 +108,7 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_GENERIC=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_DWC2_OTG=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_SPL_TINY_MEMSET=y
 CONFIG_TPL_TINY_MEMSET=y
diff --git a/configs/px30-core-ctouch2-px30_defconfig b/configs/px30-core-ctouch2-px30_defconfig
index 59391647c92..c7e66d36832 100644
--- a/configs/px30-core-ctouch2-px30_defconfig
+++ b/configs/px30-core-ctouch2-px30_defconfig
@@ -108,7 +108,7 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_GENERIC=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_DWC2_OTG=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_SPL_TINY_MEMSET=y
 CONFIG_TPL_TINY_MEMSET=y
diff --git a/configs/px30-core-edimm2.2-px30_defconfig b/configs/px30-core-edimm2.2-px30_defconfig
index dd8cc5f6e6f..9ec4320e14f 100644
--- a/configs/px30-core-edimm2.2-px30_defconfig
+++ b/configs/px30-core-edimm2.2-px30_defconfig
@@ -108,7 +108,7 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_GENERIC=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_DWC2_OTG=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_SPL_TINY_MEMSET=y
 CONFIG_TPL_TINY_MEMSET=y
diff --git a/configs/radxa-zero_defconfig b/configs/radxa-zero_defconfig
index d3744f48a31..1c84cfc5f70 100644
--- a/configs/radxa-zero_defconfig
+++ b/configs/radxa-zero_defconfig
@@ -57,7 +57,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_USB_GADGET_DWC2_OTG_PHY_BUS_WIDTH_8=y
 CONFIG_USB_GADGET_DOWNLOAD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
index 512e9d15765..ff3cf30ebe6 100644
--- a/configs/riotboard_defconfig
+++ b/configs/riotboard_defconfig
@@ -74,7 +74,7 @@ CONFIG_IMX_THERMAL=y
 CONFIG_USB=y
 CONFIG_USB_HOST_ETHER=y
 CONFIG_USB_ETHER_ASIX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 # CONFIG_BACKLIGHT is not set
 # CONFIG_CMD_VIDCONSOLE is not set
diff --git a/configs/roc-pc-mezzanine-rk3399_defconfig b/configs/roc-pc-mezzanine-rk3399_defconfig
index be1f9db43e8..c8e57f60ddd 100644
--- a/configs/roc-pc-mezzanine-rk3399_defconfig
+++ b/configs/roc-pc-mezzanine-rk3399_defconfig
@@ -88,7 +88,7 @@ CONFIG_USB_ETHER_MCS7830=y
 CONFIG_USB_ETHER_RTL8152=y
 CONFIG_USB_ETHER_SMSC95XX=y
 CONFIG_USB_GADGET=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
 CONFIG_DISPLAY_ROCKCHIP_HDMI=y
diff --git a/configs/roc-pc-rk3399_defconfig b/configs/roc-pc-rk3399_defconfig
index 4625e47537c..ed37c687c44 100644
--- a/configs/roc-pc-rk3399_defconfig
+++ b/configs/roc-pc-rk3399_defconfig
@@ -85,7 +85,7 @@ CONFIG_USB_ETHER_MCS7830=y
 CONFIG_USB_ETHER_RTL8152=y
 CONFIG_USB_ETHER_SMSC95XX=y
 CONFIG_USB_GADGET=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
 CONFIG_DISPLAY_ROCKCHIP_HDMI=y
diff --git a/configs/rock-pi-4-rk3399_defconfig b/configs/rock-pi-4-rk3399_defconfig
index f8a57f68381..a6a5292ca83 100644
--- a/configs/rock-pi-4-rk3399_defconfig
+++ b/configs/rock-pi-4-rk3399_defconfig
@@ -78,7 +78,7 @@ CONFIG_USB_ETHER_MCS7830=y
 CONFIG_USB_ETHER_RTL8152=y
 CONFIG_USB_ETHER_SMSC95XX=y
 CONFIG_USB_GADGET=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
 CONFIG_DISPLAY_ROCKCHIP_HDMI=y
diff --git a/configs/rock-pi-4c-rk3399_defconfig b/configs/rock-pi-4c-rk3399_defconfig
index 9aa7809bd09..411a5fd26e8 100644
--- a/configs/rock-pi-4c-rk3399_defconfig
+++ b/configs/rock-pi-4c-rk3399_defconfig
@@ -78,7 +78,7 @@ CONFIG_USB_ETHER_MCS7830=y
 CONFIG_USB_ETHER_RTL8152=y
 CONFIG_USB_ETHER_SMSC95XX=y
 CONFIG_USB_GADGET=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
 CONFIG_DISPLAY_ROCKCHIP_HDMI=y
diff --git a/configs/rock-pi-n10-rk3399pro_defconfig b/configs/rock-pi-n10-rk3399pro_defconfig
index ed77ac2d1da..40b4d7d42a4 100644
--- a/configs/rock-pi-n10-rk3399pro_defconfig
+++ b/configs/rock-pi-n10-rk3399pro_defconfig
@@ -74,7 +74,7 @@ CONFIG_USB_DWC3_GENERIC=y
 CONFIG_USB_KEYBOARD=y
 # CONFIG_USB_KEYBOARD_FN_KEYS is not set
 CONFIG_USB_GADGET=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
 CONFIG_DISPLAY_ROCKCHIP_HDMI=y
diff --git a/configs/rock-pi-n8-rk3288_defconfig b/configs/rock-pi-n8-rk3288_defconfig
index 6227ad39c13..bd2fb5d83ab 100644
--- a/configs/rock-pi-n8-rk3288_defconfig
+++ b/configs/rock-pi-n8-rk3288_defconfig
@@ -83,7 +83,7 @@ CONFIG_USB_KEYBOARD=y
 # CONFIG_USB_KEYBOARD_FN_KEYS is not set
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_DWC2_OTG=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
 CONFIG_DISPLAY_ROCKCHIP_HDMI=y
diff --git a/configs/rock2_defconfig b/configs/rock2_defconfig
index d639ed23385..3f06446c17f 100644
--- a/configs/rock2_defconfig
+++ b/configs/rock2_defconfig
@@ -83,7 +83,7 @@ CONFIG_ROCKCHIP_USB2_PHY=y
 CONFIG_USB_KEYBOARD=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_DWC2_OTG=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
diff --git a/configs/rock960-rk3399_defconfig b/configs/rock960-rk3399_defconfig
index daa0d3ddf5d..9e7d8465719 100644
--- a/configs/rock960-rk3399_defconfig
+++ b/configs/rock960-rk3399_defconfig
@@ -82,7 +82,7 @@ CONFIG_USB_ETHER_ASIX88179=y
 CONFIG_USB_ETHER_MCS7830=y
 CONFIG_USB_ETHER_RTL8152=y
 CONFIG_USB_ETHER_SMSC95XX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
 CONFIG_DISPLAY_ROCKCHIP_HDMI=y
diff --git a/configs/rockpro64-rk3399_defconfig b/configs/rockpro64-rk3399_defconfig
index 87fe8c40463..309efa770e3 100644
--- a/configs/rockpro64-rk3399_defconfig
+++ b/configs/rockpro64-rk3399_defconfig
@@ -98,7 +98,7 @@ CONFIG_USB_ETHER_ASIX88179=y
 CONFIG_USB_ETHER_MCS7830=y
 CONFIG_USB_ETHER_RTL8152=y
 CONFIG_USB_ETHER_SMSC95XX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
 CONFIG_DISPLAY_ROCKCHIP_HDMI=y
diff --git a/configs/rpi_0_w_defconfig b/configs/rpi_0_w_defconfig
index 0bac245df3e..67664516f4f 100644
--- a/configs/rpi_0_w_defconfig
+++ b/configs/rpi_0_w_defconfig
@@ -41,7 +41,7 @@ CONFIG_USB_DWC2=y
 CONFIG_USB_KEYBOARD=y
 CONFIG_USB_HOST_ETHER=y
 CONFIG_USB_ETHER_SMSC95XX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/rpi_2_defconfig b/configs/rpi_2_defconfig
index 700a15267ca..498acc323a8 100644
--- a/configs/rpi_2_defconfig
+++ b/configs/rpi_2_defconfig
@@ -42,7 +42,7 @@ CONFIG_USB_DWC2=y
 CONFIG_USB_KEYBOARD=y
 CONFIG_USB_HOST_ETHER=y
 CONFIG_USB_ETHER_SMSC95XX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/rpi_3_32b_defconfig b/configs/rpi_3_32b_defconfig
index 06aefc4d434..0ffb466a69a 100644
--- a/configs/rpi_3_32b_defconfig
+++ b/configs/rpi_3_32b_defconfig
@@ -43,7 +43,7 @@ CONFIG_USB_KEYBOARD=y
 CONFIG_USB_HOST_ETHER=y
 CONFIG_USB_ETHER_LAN78XX=y
 CONFIG_USB_ETHER_SMSC95XX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/rpi_3_b_plus_defconfig b/configs/rpi_3_b_plus_defconfig
index 05b3bac8f56..e112fca0f29 100644
--- a/configs/rpi_3_b_plus_defconfig
+++ b/configs/rpi_3_b_plus_defconfig
@@ -42,7 +42,7 @@ CONFIG_USB_KEYBOARD=y
 CONFIG_USB_HOST_ETHER=y
 CONFIG_USB_ETHER_LAN78XX=y
 CONFIG_USB_ETHER_SMSC95XX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/rpi_3_defconfig b/configs/rpi_3_defconfig
index c9ecc6e4d1e..94f5d034b00 100644
--- a/configs/rpi_3_defconfig
+++ b/configs/rpi_3_defconfig
@@ -42,7 +42,7 @@ CONFIG_USB_KEYBOARD=y
 CONFIG_USB_HOST_ETHER=y
 CONFIG_USB_ETHER_LAN78XX=y
 CONFIG_USB_ETHER_SMSC95XX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/rpi_4_32b_defconfig b/configs/rpi_4_32b_defconfig
index e9c18f6b274..8c03252e596 100644
--- a/configs/rpi_4_32b_defconfig
+++ b/configs/rpi_4_32b_defconfig
@@ -57,7 +57,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_USB_GADGET_DOWNLOAD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/rpi_4_defconfig b/configs/rpi_4_defconfig
index 1163750558e..46104c9292e 100644
--- a/configs/rpi_4_defconfig
+++ b/configs/rpi_4_defconfig
@@ -57,7 +57,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_USB_GADGET_DOWNLOAD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/rpi_arm64_defconfig b/configs/rpi_arm64_defconfig
index 364a1532df2..433ec8b23b2 100644
--- a/configs/rpi_arm64_defconfig
+++ b/configs/rpi_arm64_defconfig
@@ -49,7 +49,7 @@ CONFIG_USB_KEYBOARD=y
 CONFIG_USB_HOST_ETHER=y
 CONFIG_USB_ETHER_LAN78XX=y
 CONFIG_USB_ETHER_SMSC95XX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/rpi_defconfig b/configs/rpi_defconfig
index 7a0540ac9d5..1e11f378881 100644
--- a/configs/rpi_defconfig
+++ b/configs/rpi_defconfig
@@ -41,7 +41,7 @@ CONFIG_USB_DWC2=y
 CONFIG_USB_KEYBOARD=y
 CONFIG_USB_HOST_ETHER=y
 CONFIG_USB_ETHER_SMSC95XX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/s5p4418_nanopi2_defconfig b/configs/s5p4418_nanopi2_defconfig
index f3a316513c5..ce46f847e09 100644
--- a/configs/s5p4418_nanopi2_defconfig
+++ b/configs/s5p4418_nanopi2_defconfig
@@ -55,7 +55,7 @@ CONFIG_PINCTRL=y
 CONFIG_DM_PMIC=y
 CONFIG_DM_REGULATOR=y
 CONFIG_CONS_INDEX=0
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_NX=y
diff --git a/configs/sama5d27_som1_ek_mmc1_defconfig b/configs/sama5d27_som1_ek_mmc1_defconfig
index 7d6e7472269..126935062a6 100644
--- a/configs/sama5d27_som1_ek_mmc1_defconfig
+++ b/configs/sama5d27_som1_ek_mmc1_defconfig
@@ -111,7 +111,7 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_ATMEL_USBA=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_ATMEL_HLCD=y
diff --git a/configs/sama5d27_som1_ek_mmc_defconfig b/configs/sama5d27_som1_ek_mmc_defconfig
index 84ab87f8b1b..e7e78503758 100644
--- a/configs/sama5d27_som1_ek_mmc_defconfig
+++ b/configs/sama5d27_som1_ek_mmc_defconfig
@@ -111,7 +111,7 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_ATMEL_USBA=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_ATMEL_HLCD=y
diff --git a/configs/sama5d27_som1_ek_qspiflash_defconfig b/configs/sama5d27_som1_ek_qspiflash_defconfig
index ffe6563091f..f97538961b0 100644
--- a/configs/sama5d27_som1_ek_qspiflash_defconfig
+++ b/configs/sama5d27_som1_ek_qspiflash_defconfig
@@ -110,7 +110,7 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_ATMEL_USBA=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_ATMEL_HLCD=y
diff --git a/configs/sama5d27_wlsom1_ek_mmc_defconfig b/configs/sama5d27_wlsom1_ek_mmc_defconfig
index 370fd190b24..edf9c315c45 100644
--- a/configs/sama5d27_wlsom1_ek_mmc_defconfig
+++ b/configs/sama5d27_wlsom1_ek_mmc_defconfig
@@ -116,7 +116,7 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_ATMEL_USBA=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_ATMEL_HLCD=y
diff --git a/configs/sama5d27_wlsom1_ek_qspiflash_defconfig b/configs/sama5d27_wlsom1_ek_qspiflash_defconfig
index d6f8c165232..716967f21dc 100644
--- a/configs/sama5d27_wlsom1_ek_qspiflash_defconfig
+++ b/configs/sama5d27_wlsom1_ek_qspiflash_defconfig
@@ -120,7 +120,7 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_ATMEL_USBA=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_ATMEL_HLCD=y
diff --git a/configs/sama5d2_xplained_emmc_defconfig b/configs/sama5d2_xplained_emmc_defconfig
index 666fa6c8703..deed9af7348 100644
--- a/configs/sama5d2_xplained_emmc_defconfig
+++ b/configs/sama5d2_xplained_emmc_defconfig
@@ -110,7 +110,7 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_ATMEL_USBA=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_ATMEL_HLCD=y
diff --git a/configs/sama5d2_xplained_mmc_defconfig b/configs/sama5d2_xplained_mmc_defconfig
index 4e31813aa7d..9a91a3f68b0 100644
--- a/configs/sama5d2_xplained_mmc_defconfig
+++ b/configs/sama5d2_xplained_mmc_defconfig
@@ -112,7 +112,7 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_ATMEL_USBA=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_ATMEL_HLCD=y
diff --git a/configs/sama5d2_xplained_qspiflash_defconfig b/configs/sama5d2_xplained_qspiflash_defconfig
index bbc6e4b83e7..3ccbeede8fe 100644
--- a/configs/sama5d2_xplained_qspiflash_defconfig
+++ b/configs/sama5d2_xplained_qspiflash_defconfig
@@ -112,7 +112,7 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_ATMEL_USBA=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_ATMEL_HLCD=y
diff --git a/configs/sama5d2_xplained_spiflash_defconfig b/configs/sama5d2_xplained_spiflash_defconfig
index 350e401048a..9590f8387c3 100644
--- a/configs/sama5d2_xplained_spiflash_defconfig
+++ b/configs/sama5d2_xplained_spiflash_defconfig
@@ -116,7 +116,7 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_ATMEL_USBA=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_ATMEL_HLCD=y
diff --git a/configs/sama5d36ek_cmp_mmc_defconfig b/configs/sama5d36ek_cmp_mmc_defconfig
index 023adb32fbc..a07989d10b0 100644
--- a/configs/sama5d36ek_cmp_mmc_defconfig
+++ b/configs/sama5d36ek_cmp_mmc_defconfig
@@ -71,7 +71,7 @@ CONFIG_SYSRESET=y
 CONFIG_SYSRESET_AT91=y
 CONFIG_TIMER=y
 CONFIG_ATMEL_PIT_TIMER=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_ATMEL_HLCD=y
diff --git a/configs/sama5d36ek_cmp_nandflash_defconfig b/configs/sama5d36ek_cmp_nandflash_defconfig
index 0e304aa7fd0..034d72b82ab 100644
--- a/configs/sama5d36ek_cmp_nandflash_defconfig
+++ b/configs/sama5d36ek_cmp_nandflash_defconfig
@@ -71,7 +71,7 @@ CONFIG_SYSRESET=y
 CONFIG_SYSRESET_AT91=y
 CONFIG_TIMER=y
 CONFIG_ATMEL_PIT_TIMER=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_ATMEL_HLCD=y
diff --git a/configs/sama5d36ek_cmp_spiflash_defconfig b/configs/sama5d36ek_cmp_spiflash_defconfig
index c956a7187a0..9c945fdf114 100644
--- a/configs/sama5d36ek_cmp_spiflash_defconfig
+++ b/configs/sama5d36ek_cmp_spiflash_defconfig
@@ -73,7 +73,7 @@ CONFIG_SYSRESET=y
 CONFIG_SYSRESET_AT91=y
 CONFIG_TIMER=y
 CONFIG_ATMEL_PIT_TIMER=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_ATMEL_HLCD=y
diff --git a/configs/sama5d3xek_mmc_defconfig b/configs/sama5d3xek_mmc_defconfig
index 4e4638aa539..f7ff150e2bd 100644
--- a/configs/sama5d3xek_mmc_defconfig
+++ b/configs/sama5d3xek_mmc_defconfig
@@ -115,5 +115,5 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_ATMEL_USBA=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_ATMEL_HLCD=y
diff --git a/configs/sama5d3xek_nandflash_defconfig b/configs/sama5d3xek_nandflash_defconfig
index c050f77ea9e..1a47a097ad8 100644
--- a/configs/sama5d3xek_nandflash_defconfig
+++ b/configs/sama5d3xek_nandflash_defconfig
@@ -117,5 +117,5 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_ATMEL_USBA=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_ATMEL_HLCD=y
diff --git a/configs/sama5d3xek_spiflash_defconfig b/configs/sama5d3xek_spiflash_defconfig
index c9c2f77f2ab..521dbd890d5 100644
--- a/configs/sama5d3xek_spiflash_defconfig
+++ b/configs/sama5d3xek_spiflash_defconfig
@@ -116,5 +116,5 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_ATMEL_USBA=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_ATMEL_HLCD=y
diff --git a/configs/sama5d4_xplained_mmc_defconfig b/configs/sama5d4_xplained_mmc_defconfig
index 8cae9a32800..0adc3012be9 100644
--- a/configs/sama5d4_xplained_mmc_defconfig
+++ b/configs/sama5d4_xplained_mmc_defconfig
@@ -107,7 +107,7 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_ATMEL_USBA=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_ATMEL_HLCD=y
diff --git a/configs/sama5d4_xplained_nandflash_defconfig b/configs/sama5d4_xplained_nandflash_defconfig
index bec2b664270..2dd1de14827 100644
--- a/configs/sama5d4_xplained_nandflash_defconfig
+++ b/configs/sama5d4_xplained_nandflash_defconfig
@@ -111,7 +111,7 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_ATMEL_USBA=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_ATMEL_HLCD=y
diff --git a/configs/sama5d4_xplained_spiflash_defconfig b/configs/sama5d4_xplained_spiflash_defconfig
index 5d0e8afa275..c009e75acfc 100644
--- a/configs/sama5d4_xplained_spiflash_defconfig
+++ b/configs/sama5d4_xplained_spiflash_defconfig
@@ -113,7 +113,7 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_ATMEL_USBA=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_ATMEL_HLCD=y
diff --git a/configs/sama5d4ek_mmc_defconfig b/configs/sama5d4ek_mmc_defconfig
index f639aa0e6c5..aaa8b16fad9 100644
--- a/configs/sama5d4ek_mmc_defconfig
+++ b/configs/sama5d4ek_mmc_defconfig
@@ -105,7 +105,7 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_ATMEL_USBA=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_ATMEL_HLCD=y
diff --git a/configs/sama5d4ek_nandflash_defconfig b/configs/sama5d4ek_nandflash_defconfig
index 175512b2ad2..3a333ebdb2c 100644
--- a/configs/sama5d4ek_nandflash_defconfig
+++ b/configs/sama5d4ek_nandflash_defconfig
@@ -109,7 +109,7 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_ATMEL_USBA=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_ATMEL_HLCD=y
diff --git a/configs/sama5d4ek_spiflash_defconfig b/configs/sama5d4ek_spiflash_defconfig
index d014f88d71f..d7f56d75c81 100644
--- a/configs/sama5d4ek_spiflash_defconfig
+++ b/configs/sama5d4ek_spiflash_defconfig
@@ -108,7 +108,7 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_ATMEL_USBA=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_ATMEL_HLCD=y
diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
index ade1505439f..d87c9c48409 100644
--- a/configs/sandbox64_defconfig
+++ b/configs/sandbox64_defconfig
@@ -225,7 +225,7 @@ CONFIG_SANDBOX_TIMER=y
 CONFIG_USB=y
 CONFIG_USB_EMUL=y
 CONFIG_USB_KEYBOARD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_CONSOLE_ROTATION=y
 CONFIG_CONSOLE_TRUETYPE=y
 CONFIG_CONSOLE_TRUETYPE_CANTORAONE=y
diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
index 1f821cd4721..b3d29adda9c 100644
--- a/configs/sandbox_defconfig
+++ b/configs/sandbox_defconfig
@@ -293,7 +293,7 @@ CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_DOWNLOAD=y
 CONFIG_USB_ETHER=y
 CONFIG_USB_ETH_CDC=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_COPY=y
 CONFIG_CONSOLE_ROTATION=y
 CONFIG_CONSOLE_TRUETYPE=y
diff --git a/configs/sandbox_flattree_defconfig b/configs/sandbox_flattree_defconfig
index 9d8da25648d..e18f9a04d2b 100644
--- a/configs/sandbox_flattree_defconfig
+++ b/configs/sandbox_flattree_defconfig
@@ -194,7 +194,7 @@ CONFIG_SANDBOX_TIMER=y
 CONFIG_USB=y
 CONFIG_USB_EMUL=y
 CONFIG_USB_KEYBOARD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_CONSOLE_ROTATION=y
 CONFIG_CONSOLE_TRUETYPE=y
 CONFIG_CONSOLE_TRUETYPE_CANTORAONE=y
diff --git a/configs/sandbox_noinst_defconfig b/configs/sandbox_noinst_defconfig
index 8e69f084ed7..ef3e28989a4 100644
--- a/configs/sandbox_noinst_defconfig
+++ b/configs/sandbox_noinst_defconfig
@@ -221,7 +221,7 @@ CONFIG_SANDBOX_TIMER=y
 CONFIG_USB=y
 CONFIG_USB_EMUL=y
 CONFIG_USB_KEYBOARD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_CONSOLE_ROTATION=y
 CONFIG_CONSOLE_TRUETYPE=y
 CONFIG_CONSOLE_TRUETYPE_CANTORAONE=y
diff --git a/configs/sandbox_spl_defconfig b/configs/sandbox_spl_defconfig
index af5092b5ca9..3dc041e6616 100644
--- a/configs/sandbox_spl_defconfig
+++ b/configs/sandbox_spl_defconfig
@@ -224,7 +224,7 @@ CONFIG_SANDBOX_TIMER=y
 CONFIG_USB=y
 CONFIG_USB_EMUL=y
 CONFIG_USB_KEYBOARD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_CONSOLE_ROTATION=y
 CONFIG_CONSOLE_TRUETYPE=y
 CONFIG_CONSOLE_TRUETYPE_CANTORAONE=y
diff --git a/configs/sandbox_vpl_defconfig b/configs/sandbox_vpl_defconfig
index c31adbbcf73..8128f6eaaf6 100644
--- a/configs/sandbox_vpl_defconfig
+++ b/configs/sandbox_vpl_defconfig
@@ -231,7 +231,7 @@ CONFIG_SANDBOX_TIMER=y
 CONFIG_USB=y
 CONFIG_USB_EMUL=y
 CONFIG_USB_KEYBOARD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_CONSOLE_ROTATION=y
 CONFIG_CONSOLE_TRUETYPE=y
 CONFIG_CONSOLE_TRUETYPE_CANTORAONE=y
diff --git a/configs/seaboard_defconfig b/configs/seaboard_defconfig
index e3895f520e7..2b96ec54be2 100644
--- a/configs/seaboard_defconfig
+++ b/configs/seaboard_defconfig
@@ -60,7 +60,7 @@ CONFIG_USB_ULPI=y
 CONFIG_USB_KEYBOARD=y
 CONFIG_USB_HOST_ETHER=y
 CONFIG_USB_ETHER_ASIX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 CONFIG_VIDEO_TEGRA20=y
 CONFIG_CONSOLE_SCROLL_LINES=10
diff --git a/configs/sei510_defconfig b/configs/sei510_defconfig
index b26e065a3da..59036ccc29b 100644
--- a/configs/sei510_defconfig
+++ b/configs/sei510_defconfig
@@ -80,7 +80,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x18d1
 CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_USB_GADGET_DWC2_OTG_PHY_BUS_WIDTH_8=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/sei610_defconfig b/configs/sei610_defconfig
index 2302c9eeef0..09d3cfb4e82 100644
--- a/configs/sei610_defconfig
+++ b/configs/sei610_defconfig
@@ -80,7 +80,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x18d1
 CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_USB_GADGET_DWC2_OTG_PHY_BUS_WIDTH_8=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/snow_defconfig b/configs/snow_defconfig
index 5b63529db2e..9c2292a6947 100644
--- a/configs/snow_defconfig
+++ b/configs/snow_defconfig
@@ -90,7 +90,7 @@ CONFIG_USB_XHCI_DWC3=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_HOST_ETHER=y
 CONFIG_USB_ETHER_ASIX88179=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 CONFIG_VIDCONSOLE_AS_LCD=y
 CONFIG_DISPLAY=y
diff --git a/configs/spring_defconfig b/configs/spring_defconfig
index 693ee54fdc5..0cc0556e6ed 100644
--- a/configs/spring_defconfig
+++ b/configs/spring_defconfig
@@ -91,7 +91,7 @@ CONFIG_USB_XHCI_DWC3=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_HOST_ETHER=y
 CONFIG_USB_ETHER_ASIX88179=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 CONFIG_VIDCONSOLE_AS_LCD=y
 CONFIG_DISPLAY=y
diff --git a/configs/starqltechn_defconfig b/configs/starqltechn_defconfig
index 4f84f5f974d..7955076d613 100644
--- a/configs/starqltechn_defconfig
+++ b/configs/starqltechn_defconfig
@@ -29,7 +29,7 @@ CONFIG_DM_PMIC=y
 CONFIG_PMIC_QCOM=y
 # CONFIG_REQUIRE_SERIAL_CONSOLE is not set
 CONFIG_SPMI_MSM=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_SIMPLE=y
 CONFIG_VIDEO_DT_SIMPLEFB=y
diff --git a/configs/stemmy_defconfig b/configs/stemmy_defconfig
index f1d3ef5b123..90f2970def8 100644
--- a/configs/stemmy_defconfig
+++ b/configs/stemmy_defconfig
@@ -40,7 +40,7 @@ CONFIG_USB_MUSB_GADGET=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_VENDOR_NUM=0x04e8
 CONFIG_USB_GADGET_PRODUCT_NUM=0x685d
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_MCDE_SIMPLE=y
 # CONFIG_EFI_LOADER is not set
diff --git a/configs/stm32746g-eval_defconfig b/configs/stm32746g-eval_defconfig
index 7200446d287..50d721fb5c3 100644
--- a/configs/stm32746g-eval_defconfig
+++ b/configs/stm32746g-eval_defconfig
@@ -53,7 +53,7 @@ CONFIG_MII=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
 CONFIG_STM32_QSPI=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_BACKLIGHT_GPIO=y
 CONFIG_VIDEO_STM32=y
 CONFIG_VIDEO_STM32_MAX_XRES=480
diff --git a/configs/stm32746g-eval_spl_defconfig b/configs/stm32746g-eval_spl_defconfig
index ff42952a762..498b478addf 100644
--- a/configs/stm32746g-eval_spl_defconfig
+++ b/configs/stm32746g-eval_spl_defconfig
@@ -79,7 +79,7 @@ CONFIG_SPI=y
 CONFIG_DM_SPI=y
 CONFIG_STM32_QSPI=y
 CONFIG_SPL_TIMER=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_BACKLIGHT_GPIO=y
 CONFIG_VIDEO_STM32=y
 CONFIG_VIDEO_STM32_MAX_XRES=480
diff --git a/configs/stm32f746-disco_defconfig b/configs/stm32f746-disco_defconfig
index a8edf11b400..dfbc766807f 100644
--- a/configs/stm32f746-disco_defconfig
+++ b/configs/stm32f746-disco_defconfig
@@ -53,7 +53,7 @@ CONFIG_MII=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
 CONFIG_STM32_QSPI=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_BACKLIGHT_GPIO=y
 CONFIG_VIDEO_STM32=y
 CONFIG_VIDEO_STM32_MAX_XRES=480
diff --git a/configs/stm32f746-disco_spl_defconfig b/configs/stm32f746-disco_spl_defconfig
index 0e358e86ff5..e9b0f82b1a8 100644
--- a/configs/stm32f746-disco_spl_defconfig
+++ b/configs/stm32f746-disco_spl_defconfig
@@ -79,7 +79,7 @@ CONFIG_SPI=y
 CONFIG_DM_SPI=y
 CONFIG_STM32_QSPI=y
 CONFIG_SPL_TIMER=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_BACKLIGHT_GPIO=y
 CONFIG_VIDEO_STM32=y
 CONFIG_VIDEO_STM32_MAX_XRES=480
diff --git a/configs/stm32f769-disco_defconfig b/configs/stm32f769-disco_defconfig
index 3e7b5bd06ed..122f2ad1355 100644
--- a/configs/stm32f769-disco_defconfig
+++ b/configs/stm32f769-disco_defconfig
@@ -53,7 +53,7 @@ CONFIG_DM_REGULATOR=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
 CONFIG_STM32_QSPI=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_BACKLIGHT_GPIO=y
 CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
 CONFIG_VIDEO_STM32=y
diff --git a/configs/stm32f769-disco_spl_defconfig b/configs/stm32f769-disco_spl_defconfig
index f0a1b667b89..ccec43daeae 100644
--- a/configs/stm32f769-disco_spl_defconfig
+++ b/configs/stm32f769-disco_spl_defconfig
@@ -79,7 +79,7 @@ CONFIG_SPI=y
 CONFIG_DM_SPI=y
 CONFIG_STM32_QSPI=y
 CONFIG_SPL_TIMER=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_BACKLIGHT_GPIO=y
 CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
 CONFIG_VIDEO_STM32=y
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 33680dc25e9..86ebbef0a6c 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -169,7 +169,7 @@ CONFIG_USB_GADGET_MANUFACTURER="STMicroelectronics"
 CONFIG_USB_GADGET_VENDOR_NUM=0x0483
 CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
 CONFIG_USB_GADGET_DWC2_OTG=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_BACKLIGHT_GPIO=y
 CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
 CONFIG_VIDEO_LCD_RAYDIUM_RM68200=y
diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
index ec8fb37110e..caa79e68834 100644
--- a/configs/stm32mp15_defconfig
+++ b/configs/stm32mp15_defconfig
@@ -145,7 +145,7 @@ CONFIG_USB_GADGET_MANUFACTURER="STMicroelectronics"
 CONFIG_USB_GADGET_VENDOR_NUM=0x0483
 CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
 CONFIG_USB_GADGET_DWC2_OTG=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_BACKLIGHT_GPIO=y
 CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
 CONFIG_VIDEO_LCD_RAYDIUM_RM68200=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 9cfa9a20f36..3309c2e7924 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -145,7 +145,7 @@ CONFIG_USB_GADGET_MANUFACTURER="STMicroelectronics"
 CONFIG_USB_GADGET_VENDOR_NUM=0x0483
 CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
 CONFIG_USB_GADGET_DWC2_OTG=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_BACKLIGHT_GPIO=y
 CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
 CONFIG_VIDEO_LCD_RAYDIUM_RM68200=y
diff --git a/configs/tbs2910_defconfig b/configs/tbs2910_defconfig
index 59444372e93..bb5390510d4 100644
--- a/configs/tbs2910_defconfig
+++ b/configs/tbs2910_defconfig
@@ -102,7 +102,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
 CONFIG_USB_GADGET_DOWNLOAD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_LOGO is not set
 # CONFIG_BACKLIGHT is not set
 # CONFIG_CMD_VIDCONSOLE is not set
diff --git a/configs/tec_defconfig b/configs/tec_defconfig
index 99d34901d70..13bc7a9e784 100644
--- a/configs/tec_defconfig
+++ b/configs/tec_defconfig
@@ -54,6 +54,6 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_TEGRA=y
 CONFIG_USB_HOST_ETHER=y
 CONFIG_USB_ETHER_SMSC95XX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 CONFIG_VIDEO_TEGRA20=y
diff --git a/configs/theadorable_debug_defconfig b/configs/theadorable_debug_defconfig
index 3d84bf9d57a..d5f4f77fff9 100644
--- a/configs/theadorable_debug_defconfig
+++ b/configs/theadorable_debug_defconfig
@@ -92,7 +92,7 @@ CONFIG_KIRKWOOD_SPI=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_VIDEO_MVEBU=y
diff --git a/configs/tinker-rk3288_defconfig b/configs/tinker-rk3288_defconfig
index 27ff352fba3..ccd97386aa6 100644
--- a/configs/tinker-rk3288_defconfig
+++ b/configs/tinker-rk3288_defconfig
@@ -92,7 +92,7 @@ CONFIG_USB_ETHER_ASIX=y
 CONFIG_USB_ETHER_SMSC95XX=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_DWC2_OTG=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
 CONFIG_DISPLAY_ROCKCHIP_HDMI=y
diff --git a/configs/tinker-s-rk3288_defconfig b/configs/tinker-s-rk3288_defconfig
index 28ae79bc015..4ea36be6430 100644
--- a/configs/tinker-s-rk3288_defconfig
+++ b/configs/tinker-s-rk3288_defconfig
@@ -92,7 +92,7 @@ CONFIG_USB_ETHER_ASIX=y
 CONFIG_USB_ETHER_SMSC95XX=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_DWC2_OTG=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
diff --git a/configs/ventana_defconfig b/configs/ventana_defconfig
index aac59831ea5..123002097c5 100644
--- a/configs/ventana_defconfig
+++ b/configs/ventana_defconfig
@@ -52,7 +52,7 @@ CONFIG_USB_ULPI=y
 CONFIG_USB_KEYBOARD=y
 CONFIG_USB_HOST_ETHER=y
 CONFIG_USB_ETHER_ASIX=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 CONFIG_VIDEO_TEGRA20=y
 CONFIG_CONSOLE_SCROLL_LINES=10
diff --git a/configs/vyasa-rk3288_defconfig b/configs/vyasa-rk3288_defconfig
index 4b5b1db0ff0..8c9d68bc675 100644
--- a/configs/vyasa-rk3288_defconfig
+++ b/configs/vyasa-rk3288_defconfig
@@ -93,7 +93,7 @@ CONFIG_USB_ETHER_SMSC95XX=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_USB_FUNCTION_MASS_STORAGE=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 1d125d0d7bc..dba90ab9057 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -76,7 +76,7 @@ CONFIG_DM_SCSI=y
 CONFIG_MXC_UART=y
 CONFIG_DM_THERMAL=y
 CONFIG_USB=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
diff --git a/configs/wetek-core2_defconfig b/configs/wetek-core2_defconfig
index a1322d64fe3..8d273f91986 100644
--- a/configs/wetek-core2_defconfig
+++ b/configs/wetek-core2_defconfig
@@ -62,7 +62,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x1b8e
 CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_USB_GADGET_DOWNLOAD=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/xilinx_zynqmp_virt_defconfig b/configs/xilinx_zynqmp_virt_defconfig
index ea66dcf5056..f203a0fe4a1 100644
--- a/configs/xilinx_zynqmp_virt_defconfig
+++ b/configs/xilinx_zynqmp_virt_defconfig
@@ -221,7 +221,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0x0300
 CONFIG_USB_FUNCTION_THOR=y
 CONFIG_USB_ETHER=y
 CONFIG_USB_ETH_CDC=y
-CONFIG_DM_VIDEO=y
+CONFIG_VIDEO=y
 CONFIG_VIDEO_COPY=y
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_SEPS525=y
diff --git a/doc/develop/driver-model/migration.rst b/doc/develop/driver-model/migration.rst
index 742fea5515c..badc5dda0b5 100644
--- a/doc/develop/driver-model/migration.rst
+++ b/doc/develop/driver-model/migration.rst
@@ -80,7 +80,7 @@ CONFIG_DM_VIDEO
 Deadline: 2019.07
 
 The video subsystem has supported driver model since early 2016. Maintainers
-should submit patches switching over to using CONFIG_DM_VIDEO and other base
+should submit patches switching over to using CONFIG_VIDEO and other base
 driver model options in time for inclusion in the 2019.07 release.
 
 CONFIG_DM_ETH
diff --git a/doc/usage/environment.rst b/doc/usage/environment.rst
index d12bbcd85a2..15897f63dd9 100644
--- a/doc/usage/environment.rst
+++ b/doc/usage/environment.rst
@@ -63,7 +63,7 @@ For example, for snapper9260 you would create a text file called
 Example::
 
     stdout=serial
-    #ifdef CONFIG_DM_VIDEO
+    #ifdef CONFIG_VIDEO
     stdout+=,vidconsole
     #endif
     bootcmd=
diff --git a/drivers/pci/Makefile b/drivers/pci/Makefile
index cfcd6fd6c52..dd1ad91cede 100644
--- a/drivers/pci/Makefile
+++ b/drivers/pci/Makefile
@@ -3,7 +3,7 @@
 # (C) Copyright 2000-2007
 # Wolfgang Denk, DENX Software Engineering, wd@denx.de.
 
-obj-$(CONFIG_DM_VIDEO) += pci_rom.o
+obj-$(CONFIG_VIDEO) += pci_rom.o
 obj-$(CONFIG_PCI) += pci-uclass.o pci_auto.o
 obj-$(CONFIG_DM_PCI_COMPAT) += pci_compat.o
 obj-$(CONFIG_PCI_SANDBOX) += pci_sandbox.o
diff --git a/drivers/serial/sandbox.c b/drivers/serial/sandbox.c
index f122e3f7c36..f4003811ee7 100644
--- a/drivers/serial/sandbox.c
+++ b/drivers/serial/sandbox.c
@@ -139,7 +139,7 @@ static int sandbox_serial_pending(struct udevice *dev, bool input)
 		return 0;
 
 	os_usleep(100);
-	if (IS_ENABLED(CONFIG_DM_VIDEO) && !IS_ENABLED(CONFIG_SPL_BUILD))
+	if (IS_ENABLED(CONFIG_VIDEO) && !IS_ENABLED(CONFIG_SPL_BUILD))
 		video_sync_all();
 	avail = membuff_putraw(&priv->buf, 100, false, &data);
 	if (!avail)
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 160f4a008bf..924b7f5abb0 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -4,7 +4,7 @@
 
 menu "Graphics support"
 
-config DM_VIDEO
+config VIDEO
 	bool "Enable driver model support for LCD/video"
 	depends on DM
 	help
@@ -14,7 +14,7 @@ config DM_VIDEO
 	  option compiles in the video uclass and routes all LCD/video access
 	  through this.
 
-if DM_VIDEO
+if VIDEO
 
 config VIDEO_LOGO
 	bool "Show the U-Boot logo on the display"
@@ -882,6 +882,6 @@ config BMP_32BPP
 	help
 	  Support display of bitmaps file with 32-bit-per-pixel.
 
-endif # DM_VIDEO
+endif # VIDEO
 
 endmenu
diff --git a/drivers/video/Makefile b/drivers/video/Makefile
index d410c508e94..ea5dc7467cb 100644
--- a/drivers/video/Makefile
+++ b/drivers/video/Makefile
@@ -12,8 +12,8 @@ obj-$(CONFIG_CONSOLE_ROTATION) += console_rotate.o
 obj-$(CONFIG_CONSOLE_TRUETYPE) += console_truetype.o fonts/
 obj-$(CONFIG_DISPLAY) += display-uclass.o
 obj-$(CONFIG_VIDEO_MIPI_DSI) += dsi-host-uclass.o
-obj-$(CONFIG_DM_VIDEO) += video-uclass.o vidconsole-uclass.o
-obj-$(CONFIG_DM_VIDEO) += video_bmp.o
+obj-$(CONFIG_VIDEO) += video-uclass.o vidconsole-uclass.o
+obj-$(CONFIG_VIDEO) += video_bmp.o
 obj-$(CONFIG_PANEL) += panel-uclass.o
 obj-$(CONFIG_DM_PANEL_HX8238D) += hx8238d.o
 obj-$(CONFIG_SIMPLE_PANEL) += simple_panel.o
diff --git a/drivers/video/exynos/Kconfig b/drivers/video/exynos/Kconfig
index 37e661b1edd..599d19d5ecc 100644
--- a/drivers/video/exynos/Kconfig
+++ b/drivers/video/exynos/Kconfig
@@ -1,7 +1,7 @@
 
 menuconfig VIDEO_EXYNOS
 	bool "Enable Exynos video support"
-	depends on DM_VIDEO
+	depends on VIDEO
 	help
 	  Enable support for various video output options on Exynos SoCs.
 
diff --git a/drivers/video/imx/Kconfig b/drivers/video/imx/Kconfig
index 78eb0f29fb3..afe950b6df7 100644
--- a/drivers/video/imx/Kconfig
+++ b/drivers/video/imx/Kconfig
@@ -1,7 +1,7 @@
 
 config VIDEO_IPUV3
 	bool "i.MX IPUv3 Core video support"
-	depends on DM_VIDEO && (MX5 || MX6)
+	depends on VIDEO && (MX5 || MX6)
 	help
 	  This enables framebuffer driver for i.MX processors working
 	  on the IPUv3(Image Processing Unit) internal graphic processor.
diff --git a/drivers/video/meson/Kconfig b/drivers/video/meson/Kconfig
index 0c9ddeb8b65..3c2d72d019b 100644
--- a/drivers/video/meson/Kconfig
+++ b/drivers/video/meson/Kconfig
@@ -6,7 +6,7 @@
 
 config VIDEO_MESON
 	bool "Enable Amlogic Meson video support"
-	depends on DM_VIDEO
+	depends on VIDEO
 	select DISPLAY
 	help
 	  Enable Amlogic Meson Video Processing Unit video support.
diff --git a/drivers/video/nexell_display.c b/drivers/video/nexell_display.c
index 42b8d926b6a..5595796a678 100644
--- a/drivers/video/nexell_display.c
+++ b/drivers/video/nexell_display.c
@@ -542,7 +542,7 @@ static int nx_display_probe(struct udevice *dev)
 
 	/*
 	 * set environment variable "fb_addr" (frame buffer address), required
-	 * for splash image, which is not set if CONFIG_DM_VIDEO is enabled).
+	 * for splash image, which is not set if CONFIG_VIDEO is enabled).
 	 */
 	sprintf(addr, "0x%x", dp->fb_addr);
 	debug("%s(): env_set(\"fb_addr\", %s) ...\n", __func__, addr);
diff --git a/drivers/video/rockchip/Kconfig b/drivers/video/rockchip/Kconfig
index 0ade631bd5c..b03866347b0 100644
--- a/drivers/video/rockchip/Kconfig
+++ b/drivers/video/rockchip/Kconfig
@@ -10,7 +10,7 @@
 
 menuconfig VIDEO_ROCKCHIP
 	bool "Enable Rockchip Video Support"
-	depends on DM_VIDEO
+	depends on VIDEO
 	help
 	  Rockchip SoCs provide video output capabilities for High-Definition
 	  Multimedia Interface (HDMI), Low-voltage Differential Signalling
diff --git a/drivers/video/stm32/Kconfig b/drivers/video/stm32/Kconfig
index 95d51bb4e96..48066063e4c 100644
--- a/drivers/video/stm32/Kconfig
+++ b/drivers/video/stm32/Kconfig
@@ -7,7 +7,7 @@
 
 menuconfig VIDEO_STM32
 	bool "Enable STM32 video support"
-	depends on DM_VIDEO
+	depends on VIDEO
 	help
 	  STM32 supports many video output options including RGB and
 	  DSI. This option enables these supports which can be used on
diff --git a/include/asm-generic/global_data.h b/include/asm-generic/global_data.h
index 8ca93ac5269..c4b2bb44973 100644
--- a/include/asm-generic/global_data.h
+++ b/include/asm-generic/global_data.h
@@ -68,7 +68,7 @@ struct global_data {
 	 * @mem_clk: memory clock rate in Hz
 	 */
 	unsigned long mem_clk;
-#if defined(CONFIG_DM_VIDEO)
+#if defined(CONFIG_VIDEO)
 	/**
 	 * @fb_base: base address of frame buffer memory
 	 */
@@ -359,7 +359,7 @@ struct global_data {
 	 */
 	struct membuff console_in;
 #endif
-#ifdef CONFIG_DM_VIDEO
+#ifdef CONFIG_VIDEO
 	/**
 	 * @video_top: top of video frame buffer area
 	 */
diff --git a/include/configs/colibri-imx6ull.h b/include/configs/colibri-imx6ull.h
index 04cde9530ad..7e73585f2dc 100644
--- a/include/configs/colibri-imx6ull.h
+++ b/include/configs/colibri-imx6ull.h
@@ -137,7 +137,7 @@
 /* USB Device Firmware Update support */
 #define DFU_DEFAULT_POLL_TIMEOUT	300
 
-#if defined(CONFIG_DM_VIDEO)
+#if defined(CONFIG_VIDEO)
 #define MXS_LCDIF_BASE MX6UL_LCDIF1_BASE_ADDR
 #endif
 
diff --git a/include/configs/imxrt1050-evk.h b/include/configs/imxrt1050-evk.h
index e36718dc825..d1a7dab37c5 100644
--- a/include/configs/imxrt1050-evk.h
+++ b/include/configs/imxrt1050-evk.h
@@ -18,7 +18,7 @@
 #define DMAMEM_BASE			(PHYS_SDRAM + PHYS_SDRAM_SIZE - \
 					 DMAMEM_SZ_ALL)
 
-#ifdef CONFIG_DM_VIDEO
+#ifdef CONFIG_VIDEO
 #define CONFIG_EXTRA_ENV_SETTINGS \
 		"stdin=serial\0" \
 		"stdout=serial,vidconsole\0" \
diff --git a/include/configs/meson64.h b/include/configs/meson64.h
index 40803ee9da1..0c41df2a957 100644
--- a/include/configs/meson64.h
+++ b/include/configs/meson64.h
@@ -17,7 +17,7 @@
 #endif
 
 /* For splashscreen */
-#ifdef CONFIG_DM_VIDEO
+#ifdef CONFIG_VIDEO
 #define STDOUT_CFG "vidconsole,serial"
 #else
 #define STDOUT_CFG "serial"
diff --git a/include/configs/pico-imx6ul.h b/include/configs/pico-imx6ul.h
index 2ac48c40c96..c0d837d7c51 100644
--- a/include/configs/pico-imx6ul.h
+++ b/include/configs/pico-imx6ul.h
@@ -102,9 +102,7 @@
 #define CONFIG_SYS_INIT_RAM_ADDR	IRAM_BASE_ADDR
 #define CONFIG_SYS_INIT_RAM_SIZE	IRAM_SIZE
 
-/* environment organization */
-
-#ifdef CONFIG_DM_VIDEO
+#ifdef CONFIG_VIDEO
 #define MXS_LCDIF_BASE MX6UL_LCDIF1_BASE_ADDR
 #endif
 
diff --git a/include/configs/sunxi-common.h b/include/configs/sunxi-common.h
index 0f0ef4f64bb..3a0f2e6548b 100644
--- a/include/configs/sunxi-common.h
+++ b/include/configs/sunxi-common.h
@@ -298,7 +298,7 @@
 	"stdin=serial\0"
 #endif
 
-#ifdef CONFIG_DM_VIDEO
+#ifdef CONFIG_VIDEO
 #define CONSOLE_STDOUT_SETTINGS \
 	"stdout=serial,vidconsole\0" \
 	"stderr=serial,vidconsole\0"
diff --git a/include/configs/tegra-common-post.h b/include/configs/tegra-common-post.h
index 823b5d63d01..4e20e1d1984 100644
--- a/include/configs/tegra-common-post.h
+++ b/include/configs/tegra-common-post.h
@@ -37,7 +37,7 @@
 #define STDIN_KBD_USB ""
 #endif
 
-#ifdef CONFIG_DM_VIDEO
+#ifdef CONFIG_VIDEO
 #define STDOUT_VIDEO ",vidconsole"
 #else
 #define STDOUT_VIDEO ""
diff --git a/lib/efi_loader/Makefile b/lib/efi_loader/Makefile
index e187d2a914f..f8e8afe1284 100644
--- a/lib/efi_loader/Makefile
+++ b/lib/efi_loader/Makefile
@@ -66,7 +66,7 @@ obj-$(CONFIG_EFI_VARIABLES_PRESEED) += efi_var_seed.o
 endif
 obj-y += efi_watchdog.o
 obj-$(CONFIG_EFI_ESRT) += efi_esrt.o
-obj-$(CONFIG_DM_VIDEO) += efi_gop.o
+obj-$(CONFIG_VIDEO) += efi_gop.o
 obj-$(CONFIG_BLK) += efi_disk.o
 obj-$(CONFIG_NET) += efi_net.o
 obj-$(CONFIG_GENERATE_ACPI_TABLE) += efi_acpi.o
diff --git a/lib/efi_loader/efi_console.c b/lib/efi_loader/efi_console.c
index ab83f8bf828..4d08dd3763a 100644
--- a/lib/efi_loader/efi_console.c
+++ b/lib/efi_loader/efi_console.c
@@ -353,7 +353,7 @@ void efi_setup_console_size(void)
 	int rows = 25, cols = 80;
 	int ret = -ENODEV;
 
-	if (IS_ENABLED(CONFIG_DM_VIDEO))
+	if (IS_ENABLED(CONFIG_VIDEO))
 		ret = query_vidconsole(&rows, &cols);
 	if (ret)
 		ret = query_console_serial(&rows, &cols);
diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
index 0b7372e1cad..a340bc38806 100644
--- a/lib/efi_loader/efi_setup.c
+++ b/lib/efi_loader/efi_setup.c
@@ -326,7 +326,7 @@ efi_status_t efi_init_obj_list(void)
 			goto out;
 	}
 
-	if (IS_ENABLED(CONFIG_DM_VIDEO)) {
+	if (IS_ENABLED(CONFIG_VIDEO)) {
 		ret = efi_gop_register();
 		if (ret != EFI_SUCCESS)
 			goto out;
diff --git a/test/dm/Makefile b/test/dm/Makefile
index 499e76980d9..9f4719849cb 100644
--- a/test/dm/Makefile
+++ b/test/dm/Makefile
@@ -68,7 +68,7 @@ obj-y += ofnode.o
 obj-y += ofread.o
 obj-y += of_extra.o
 obj-$(CONFIG_OSD) += osd.o
-obj-$(CONFIG_DM_VIDEO) += panel.o
+obj-$(CONFIG_VIDEO) += panel.o
 obj-$(CONFIG_EFI_PARTITION) += part.o
 obj-$(CONFIG_PCI) += pci.o
 obj-$(CONFIG_P2SB) += p2sb.o
@@ -111,7 +111,7 @@ obj-$(CONFIG_TEE) += tee.o
 obj-$(CONFIG_TIMER) += timer.o
 obj-$(CONFIG_TPM_V2) += tpm.o
 obj-$(CONFIG_DM_USB) += usb.o
-obj-$(CONFIG_DM_VIDEO) += video.o
+obj-$(CONFIG_VIDEO) += video.o
 ifeq ($(CONFIG_VIRTIO_SANDBOX),y)
 obj-y += virtio.o
 obj-$(CONFIG_VIRTIO_RNG) += virtio_device.o
diff --git a/tools/Makefile b/tools/Makefile
index e8e1d279bba..af6a710c2dd 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -312,7 +312,7 @@ __build:	$(LOGO-y)
 $(LOGO_H):	$(obj)/bmp_logo $(LOGO_BMP)
 	$(obj)/bmp_logo --gen-info $(LOGO_BMP) > $@
 
-ifeq ($(CONFIG_DM_VIDEO),y)
+ifeq ($(CONFIG_VIDEO),y)
 $(LOGO_DATA_H):	$(obj)/bmp_logo $(LOGO_BMP)
 	$(obj)/bmp_logo --gen-bmp $(LOGO_BMP) > $@
 else
-- 
2.38.0.413.g74048e4d9e-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
