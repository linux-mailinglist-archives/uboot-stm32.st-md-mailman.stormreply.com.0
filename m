Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8E74971D3
	for <lists+uboot-stm32@lfdr.de>; Sun, 23 Jan 2022 15:04:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28067C5EC6C;
	Sun, 23 Jan 2022 14:04:24 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D320C5AB61
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jan 2022 14:04:22 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id o9so16505790iob.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jan 2022 06:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=btCxZQFv8/VwlZ+1IQ9ATgtCz1XJuRG8wi/CZC2I2Q8=;
 b=AsoN/QIm/fqlEbH7grhmYuHTN89KoAey6Hcn7Tk7dxyqY9hyH9pAKSukr28Q0Jonid
 znvkbmmINsv7COr/bCM01+aQMbV3pZkIYEQNf7BpdHhe4pb2NG+KfZe0sDn9xjF+yoWv
 RQulyyN9czYQTd9g1JSjJSR1IPLLngrDS0eFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=btCxZQFv8/VwlZ+1IQ9ATgtCz1XJuRG8wi/CZC2I2Q8=;
 b=mfZ2mlWSlAeOWZJVDlAMAyBMgLYFoF18hItsk4vKg68cNRI69txm7WhTPieuCsIne0
 7/osBenqNRBKmlRw6bWTUwHA59CcP4irTN4RQJYA5u1NP/JSv9V6prXQGZzmOBJpmYLu
 5/JA2nR4zgXQAZARZctLKOBWqCO3NPw+U1K3MyHtueN0jYrnpNOBpoT5YaQHunkhz+8R
 mRaGxvtlOG+mUKNAS1BRslKQSAcl+z8Ehwk5eM+ZEpcNLcQYWBF+zk3q/Y49GFFQ2dcS
 Aqh157xx58NszDjHZU5Oi0No7oUnxUzmrtMWvry6aOu33xYCa1oDkHw+JTOWGQevhisy
 Gccw==
X-Gm-Message-State: AOAM532DZElJh+l8TMnkzCwaEykKKEStjOfPjBuYMA4i+wfvB4d98KaK
 7zSFVZu9qfdob6TsXwW2mpea5w==
X-Google-Smtp-Source: ABdhPJwzpOhYudJzMPtA8z1wTvRcE25x3nBSgTul1twk8FCVKeg+BVR4EJ6xPLh6AXuPg/WhU68AXw==
X-Received: by 2002:a02:238b:: with SMTP id u133mr905346jau.105.1642946661475; 
 Sun, 23 Jan 2022 06:04:21 -0800 (PST)
Received: from kiwi.bld.corp.google.com (c-67-190-101-114.hsd1.co.comcast.net.
 [67.190.101.114])
 by smtp.gmail.com with ESMTPSA id m1sm6136361ilu.87.2022.01.23.06.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 06:04:20 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sun, 23 Jan 2022 07:04:01 -0700
Message-Id: <20220123140415.3091482-1-sjg@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
MIME-Version: 1.0
Cc: Baruch Siach <baruch@tkos.co.il>, Aymen Sghaier <aymen.sghaier@nxp.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Adrian Alonso <adrian.alonso@nxp.com>, Samuel Egli <samuel.egli@siemens.com>,
 Peng Fan <peng.fan@nxp.com>, Sean Anderson <seanga2@gmail.com>,
 Stefan Bosch <stefan_b@posteo.net>,
 =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Hu <richard.hu@technexion.com>,
 Nikita Kiryanov <nikita@compulab.co.il>, Marek Vasut <marex@denx.de>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Vanessa Maegima <vanessa.maegima@nxp.com>,
 Michal Simek <michal.simek@xilinx.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Liu <jason.hui.liu@nxp.com>,
 Heiko Schocher <hs@denx.de>, Dario Binacchi <dariobin@libero.it>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Andre Przywara <andre.przywara@arm.com>, Tim Harvey <tharvey@gateworks.com>,
 Alison Wang <alison.wang@nxp.com>, Rick Chen <rick@andestech.com>,
 Matthias Brugger <mbrugger@suse.com>, Aswath Govindraju <a-govindraju@ti.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>,
 Stefano Babic <sbabic@denx.de>, Kory Maincent <kory.maincent@bootlin.com>,
 Anatolij Gustschin <agust@denx.de>, Joel Peshkin <joel.peshkin@broadcom.com>,
 Igor Opaniuk <igor.opaniuk@foundries.io>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Stephen Carlson <stcarlso@linux.microsoft.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [Uboot-stm32] [PATCH 00/14] video: Drop old CFB code
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

There is still quite a bit of cruft in the video subsystem. Mainly this is
users of the now-removed CONFIG_VIDEO, cfb_console and CONFIG_LCD.

This series removes most of the first two. The exception is videomodes.c
and its header, since these are used by sunxi. It looks like the code
could be removed, but I did not attempt it.

This is left for the sunxi maintainer.

The LCD clean-up can come later. Once done, we can rename CONFIG_DM_VIDEO
to CONFIG_VIDEO, thus completing the migration.


Simon Glass (14):
  video: Drop cfg_console
  video: nokia_rx51: Drop obsolete video code
  video: siemens: Drop unused video code
  video: nexell: Drop unused and invalid code
  video: Drop video_fb header
  video: Drop CONFIG_VIDEO_BMP_LOGO
  video: Drop references to CONFIG_VIDEO et al
  video: Clean up the uclass header
  video: Drop da8xx-fb
  video: fsl: colibri_vf: Drop FSL DCU driver
  video: Drop FSL DIU driver
  video: mxs: Drop old video code
  video: Convert CONFIG_VIDEO_BCM2835 to Kconfig
  video: Drop formike driver

 README                                        |   18 -
 arch/arm/cpu/armv7/ls102xa/soc.c              |    4 -
 arch/arm/include/asm/arch-ls102xa/config.h    |    1 -
 arch/arm/include/asm/mach-imx/mx5_video.h     |    5 -
 .../mach-nexell/include/mach/display_dev.h    |    7 +-
 board/aristainetos/aristainetos.c             |    1 -
 board/freescale/common/Makefile               |    4 -
 board/freescale/common/dcu_sii9022a.c         |  248 ---
 board/freescale/common/dcu_sii9022a.h         |   12 -
 board/freescale/common/diu_ch7301.c           |  217 --
 board/freescale/common/diu_ch7301.h           |   12 -
 board/freescale/ls1021aiot/Makefile           |    1 -
 board/freescale/ls1021aiot/dcu.c              |   48 -
 board/freescale/ls1021aqds/Makefile           |    1 -
 board/freescale/ls1021aqds/dcu.c              |  110 -
 board/freescale/ls1021atwr/Makefile           |    1 -
 board/freescale/ls1021atwr/dcu.c              |   48 -
 board/freescale/mx51evk/Makefile              |    1 -
 board/freescale/mx53loco/Makefile             |    1 -
 board/freescale/t104xrdb/Makefile             |    1 -
 board/freescale/t104xrdb/diu.c                |   84 -
 board/kosagi/novena/novena_spl.c              |   23 -
 board/nokia/rx51/rx51.c                       |   19 -
 board/siemens/common/board.c                  |    3 -
 board/siemens/common/factoryset.c             |    7 -
 board/siemens/common/factoryset.h             |    3 -
 board/siemens/pxm2/board.c                    |  189 --
 board/siemens/rut/board.c                     |  247 ---
 board/socrates/socrates.c                     |    1 -
 board/toradex/colibri_vf/Makefile             |    1 -
 board/toradex/colibri_vf/colibri_vf.c         |   62 -
 board/toradex/colibri_vf/dcu.c                |   38 -
 cmd/Kconfig                                   |    2 +-
 cmd/bdinfo.c                                  |    2 +-
 cmd/bmp.c                                     |    4 +-
 cmd/cls.c                                     |    2 -
 common/fdt_support.c                          |    2 +-
 common/stdio.c                                |    4 +-
 configs/colibri_vf_defconfig                  |    1 -
 configs/nokia_rx51_defconfig                  |    3 -
 configs/rpi_0_w_defconfig                     |    1 +
 configs/rpi_2_defconfig                       |    1 +
 configs/rpi_3_32b_defconfig                   |    1 +
 configs/rpi_3_b_plus_defconfig                |    1 +
 configs/rpi_3_defconfig                       |    1 +
 configs/rpi_4_32b_defconfig                   |    1 +
 configs/rpi_4_defconfig                       |    1 +
 configs/rpi_arm64_defconfig                   |    1 +
 configs/rpi_defconfig                         |    1 +
 doc/usage/bootmenu.rst                        |    5 -
 drivers/pci/pci_rom.c                         |    1 -
 drivers/video/Kconfig                         |  129 +-
 drivers/video/Makefile                        |    5 -
 drivers/video/cfb_console.c                   | 1865 -----------------
 drivers/video/da8xx-fb.c                      | 1048 ---------
 drivers/video/da8xx-fb.h                      |  115 -
 drivers/video/formike.c                       |  513 -----
 drivers/video/fsl_dcu_fb.c                    |  549 -----
 drivers/video/fsl_diu_fb.c                    |  416 ----
 drivers/video/imx/mxc_ipuv3_fb.c              |    1 -
 drivers/video/mxsfb.c                         |   90 -
 drivers/video/nexell_display.c                |   18 +-
 drivers/video/omap3_dss.c                     |   29 -
 drivers/video/sunxi/sunxi_display.c           |    1 -
 include/asm-generic/global_data.h             |    2 +-
 include/configs/T102xRDB.h                    |   13 -
 include/configs/T104xRDB.h                    |   20 -
 include/configs/apalis_imx6.h                 |    1 -
 include/configs/aristainetos2.h               |    1 -
 include/configs/cm_fx6.h                      |    2 -
 include/configs/colibri-imx6ull.h             |    1 -
 include/configs/colibri_imx6.h                |    1 -
 include/configs/colibri_imx7.h                |    4 -
 include/configs/colibri_vf.h                  |    8 -
 include/configs/embestmx6boards.h             |    1 -
 include/configs/gw_ventana.h                  |    1 -
 include/configs/imx6-engicam.h                |    2 -
 include/configs/imxrt1050-evk.h               |    2 -
 include/configs/ls1021aqds.h                  |   12 -
 include/configs/ls1021atwr.h                  |   15 -
 include/configs/mx6cuboxi.h                   |    1 -
 include/configs/mx6sabre_common.h             |    1 -
 include/configs/mx6sxsabresd.h                |    1 -
 include/configs/mx6ul_14x14_evk.h             |    1 -
 include/configs/mx7dsabresd.h                 |    4 -
 include/configs/nokia_rx51.h                  |   11 -
 include/configs/opos6uldev.h                  |    1 -
 include/configs/pico-imx6.h                   |    1 -
 include/configs/pico-imx6ul.h                 |    1 -
 include/configs/pico-imx7d.h                  |    4 -
 include/configs/pxm2.h                        |    8 -
 include/configs/rpi.h                         |    1 -
 include/configs/rut.h                         |   10 -
 include/configs/wandboard.h                   |    1 -
 include/fsl_dcu_fb.h                          |   22 -
 include/fsl_diu_fb.h                          |   14 -
 include/video.h                               |   84 +-
 include/video_fb.h                            |   91 -
 lib/efi_loader/Kconfig                        |    1 -
 scripts/config_whitelist.txt                  |   10 -
 100 files changed, 33 insertions(+), 6553 deletions(-)
 delete mode 100644 board/freescale/common/dcu_sii9022a.c
 delete mode 100644 board/freescale/common/dcu_sii9022a.h
 delete mode 100644 board/freescale/common/diu_ch7301.c
 delete mode 100644 board/freescale/common/diu_ch7301.h
 delete mode 100644 board/freescale/ls1021aiot/dcu.c
 delete mode 100644 board/freescale/ls1021aqds/dcu.c
 delete mode 100644 board/freescale/ls1021atwr/dcu.c
 delete mode 100644 board/freescale/t104xrdb/diu.c
 delete mode 100644 board/toradex/colibri_vf/dcu.c
 delete mode 100644 drivers/video/cfb_console.c
 delete mode 100644 drivers/video/da8xx-fb.c
 delete mode 100644 drivers/video/da8xx-fb.h
 delete mode 100644 drivers/video/formike.c
 delete mode 100644 drivers/video/fsl_dcu_fb.c
 delete mode 100644 drivers/video/fsl_diu_fb.c
 delete mode 100644 include/fsl_dcu_fb.h
 delete mode 100644 include/fsl_diu_fb.h
 delete mode 100644 include/video_fb.h

-- 
2.35.0.rc0.227.g00780c9af4-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
