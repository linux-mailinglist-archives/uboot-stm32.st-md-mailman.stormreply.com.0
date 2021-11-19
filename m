Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6354577B0
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Nov 2021 21:24:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14401C5C82A;
	Fri, 19 Nov 2021 20:24:19 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41E27C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Nov 2021 20:24:17 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 b5-20020a9d60c5000000b0055c6349ff22so18443197otk.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Nov 2021 12:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r2eU19BxJafUxNVdWPF8hvA/6i6BdIsgd6iy3acsiBE=;
 b=bkpDTi5LLe/LKaNvWFXso/mJOaHZcWFsS2rqdJH65UgomXaJdo4a6OdpTS95S6vzet
 7qKHF/YsjvRUD9TaNK0xqKsMXP5iWb/8t0zIGx6XOxE50i2pfSQwAlqspWQfsBgdIu2x
 Da32+PsjRwjQxVvBNb7DGDhtewKi48KU+MxYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r2eU19BxJafUxNVdWPF8hvA/6i6BdIsgd6iy3acsiBE=;
 b=rUViZ8EEPO4G5TNI9gkeOk6EOM07kD+femJ90fCjGG2aF1iQbyTO/d/bYRh4UZ94jA
 Fj9T2WAWywjXBdYRdCjPN+aIvB1HFp18JmI86vrIZDQlHmnag17UnkG5vYR2SwK9PE9d
 vwjhdMOZgTTtSGEXdaVnsYYWwZAJFhuwalk+SdeSDJm2IbPTg7pZNPUeJjcIsnrpa8ca
 Zdg02Y2we1sOvsUQNWNGnCNyLRaxa5Ie6CE+ikF0FkKVJu4d6bD8mqomUn2TG/ruIpC7
 7jgOAE7TzrfQdoSCP+Ei+TpoOjVqTERPGypx8GordY/hSq7a/qHehpVHWKc7U3FM34EZ
 zssw==
X-Gm-Message-State: AOAM532NY52oaaVjU1/jgf+lUZnf/eAflJJZRhbUfoz0YqxTj+r8tLbZ
 AuV73phVeZmqpzy6byNyqezukw==
X-Google-Smtp-Source: ABdhPJwS930mOu139m14c3QPg0cJr8/UwghDpNU8YIuuvLBwJq36CEOeJqbOzjs1yMqqP4fnr8XQ/g==
X-Received: by 2002:a05:6830:3155:: with SMTP id
 c21mr6957934ots.183.1637353455911; 
 Fri, 19 Nov 2021 12:24:15 -0800 (PST)
Received: from kiwi.bld.corp.google.com (c-67-190-101-114.hsd1.co.comcast.net.
 [67.190.101.114])
 by smtp.gmail.com with ESMTPSA id bl33sm197093oib.47.2021.11.19.12.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 12:24:15 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Fri, 19 Nov 2021 13:23:44 -0700
Message-Id: <20211119202408.1815506-1-sjg@chromium.org>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
MIME-Version: 1.0
Cc: Baruch Siach <baruch@tkos.co.il>, Nikita Kiryanov <nikita@compulab.co.il>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Adrian Alonso <adrian.alonso@nxp.com>, Roger Pau Monne <royger@FreeBSD.org>,
 Samuel Egli <samuel.egli@siemens.com>, Peng Fan <peng.fan@nxp.com>,
 Sean Anderson <seanga2@gmail.com>, Stefan Bosch <stefan_b@posteo.net>,
 Soeren Moch <smoch@web.de>, =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Hu <richard.hu@technexion.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Liu <jason.hui.liu@nxp.com>,
 Harald Seiler <hws@denx.de>, Alistair Delva <adelva@google.com>,
 Anatolij Gustschin <agust@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
 Vanessa Maegima <vanessa.maegima@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Alison Wang <alison.wang@nxp.com>, Rick Chen <rick@andestech.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Vadim Bendebury <vbendeb@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>,
 Stefano Babic <sbabic@denx.de>, Olaf Mandel <o.mandel@menlosystems.com>,
 Stefan Reinauer <reinauer@chromium.org>, Heiko Schocher <hs@denx.de>,
 Steffen Jaeckel <jaeckel-floss@eyet-services.de>,
 Tero Kristo <kristo@kernel.org>, Priyanka Jain <priyanka.jain@nxp.com>,
 Simon Glass <sjg@chromium.org>, Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [Uboot-stm32] [PATCH 00/23] video: Support a U-Boot logo more easily
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

At present it is possible to show a logo on the display but it requires
some board configuration and an image.

This series aims to make this easier, by showing a logo automatically if
there is a display but no splash screen.

The logo is embedded in U-Boot and takes approximately 7KB of space.

Some fixes to the sandbox display support are provided, to make it more
robust and to allow running tests with different display depths. Support
for 8bpp depths is added, to enable more tests.

This series also includes a lot of improvements to BMP (Windows Bitmap)
support:

- support for drawing to depths other than 16bpp
- tests for the different types of supported BMP images

For theadorable there is a potentially breaking change to consider.

This series also enables a logo to be shown when running coreboot via
qemu, providing a script to help with that.


Simon Glass (23):
  sandbox: video: Support 8bpp depth
  video: sandbox: Avoid duplicate display windows
  console: Avoid serial output before the console is running
  video: sandbox: Set a maximum frame-buffer size
  sandbox: video: Correct the address of the copy base
  sandbox: video: Add BMP tests for 32bpp and 8bpp modes
  video: Expand video debugging buffer size
  sandbox: Enable support for the gzip command
  video: Drop fb_put_byte() el at
  video: Move BMP pixel-writing into a function
  video: bmp: Update RLE8 support to use the write function
  video: Drop the uclass colour map
  video: Tidy up 24/32 BMP blitting
  video: Add a test for 16bpp BMP files
  video: theadorable: Use RGB565 for BMP blitting
  video: Drop #ifdefs from video_bmp
  video: Convert CONFIG_VIDEO_LOGO to Kconfig
  video: Drop VIDEO_LOGO from cfb_console
  video: Support showing the U-Boot logo
  video: Show the U-Boot logo by default
  video: Support virtio devices with the splash screen
  x86: coreboot: Support getting a logo from virtio
  x86: coreboot: Add a sample script to build a qemu image

 .gitattributes                         |   1 +
 README                                 |   1 -
 arch/sandbox/cpu/sdl.c                 |  98 +++++++-
 arch/sandbox/include/asm/sdl.h         |   7 +
 arch/sandbox/include/asm/test.h        |  18 ++
 board/coreboot/coreboot/coreboot.c     |  20 +-
 cmd/unzip.c                            |   4 +-
 common/console.c                       |   6 +-
 common/splash.c                        |   2 +-
 common/splash_source.c                 |  14 ++
 configs/apalis_imx6_defconfig          |   1 +
 configs/aristainetos2c_defconfig       |   1 +
 configs/aristainetos2ccslb_defconfig   |   1 +
 configs/cm_fx6_defconfig               |   1 +
 configs/colibri-imx6ull-emmc_defconfig |   1 +
 configs/colibri-imx6ull_defconfig      |   1 +
 configs/colibri_imx6_defconfig         |   1 +
 configs/colibri_imx7_defconfig         |   1 +
 configs/colibri_imx7_emmc_defconfig    |   1 +
 configs/colibri_vf_defconfig           |   1 +
 configs/gurnard_defconfig              |   1 +
 configs/gwventana_emmc_defconfig       |   1 +
 configs/gwventana_gw5904_defconfig     |   1 +
 configs/gwventana_nand_defconfig       |   1 +
 configs/imx6dl_icore_nand_defconfig    |   1 +
 configs/imx6q_icore_nand_defconfig     |   1 +
 configs/imx6qdl_icore_mmc_defconfig    |   1 +
 configs/imx6qdl_icore_nand_defconfig   |   1 +
 configs/imxrt1050-evk_defconfig        |   1 +
 configs/m53menlo_defconfig             |   1 +
 configs/marsboard_defconfig            |   1 +
 configs/mx6cuboxi_defconfig            |   1 +
 configs/mx6sabreauto_defconfig         |   1 +
 configs/mx6sabresd_defconfig           |   1 +
 configs/mx6ul_14x14_evk_defconfig      |   1 +
 configs/mx6ul_9x9_evk_defconfig        |   1 +
 configs/novena_defconfig               |   1 +
 configs/opos6uldev_defconfig           |   1 +
 configs/pico-dwarf-imx7d_defconfig     |   1 +
 configs/pico-hobbit-imx7d_defconfig    |   1 +
 configs/pico-imx6_defconfig            |   1 +
 configs/pico-imx6ul_defconfig          |   1 +
 configs/pico-imx7d_bl33_defconfig      |   1 +
 configs/pico-imx7d_defconfig           |   1 +
 configs/pico-nymph-imx7d_defconfig     |   1 +
 configs/pico-pi-imx7d_defconfig        |   1 +
 configs/riotboard_defconfig            |   1 +
 configs/s5p4418_nanopi2_defconfig      |   1 +
 configs/sandbox_defconfig              |   2 +
 configs/sandbox_flattree_defconfig     |   2 +
 configs/tbs2910_defconfig              |   1 +
 configs/wandboard_defconfig            |   1 +
 drivers/video/Kconfig                  |  11 +
 drivers/video/Makefile                 |   3 +
 drivers/video/cfb_console.c            | 325 +------------------------
 drivers/video/console_truetype.c       |  21 ++
 drivers/video/sandbox_sdl.c            |  77 +++++-
 drivers/video/u_boot_logo.bmp          | Bin 0 -> 6932 bytes
 drivers/video/video-uclass.c           |  35 +--
 drivers/video/video_bmp.c              | 249 +++++++++----------
 include/configs/T102xRDB.h             |   1 -
 include/configs/T104xRDB.h             |   1 -
 include/configs/apalis_imx6.h          |   1 -
 include/configs/aristainetos2.h        |   1 -
 include/configs/cm_fx6.h               |   1 -
 include/configs/colibri-imx6ull.h      |   1 -
 include/configs/colibri_imx6.h         |   1 -
 include/configs/colibri_imx7.h         |   1 -
 include/configs/colibri_vf.h           |   1 -
 include/configs/coreboot.h             |   3 +
 include/configs/embestmx6boards.h      |   1 -
 include/configs/gw_ventana.h           |   1 -
 include/configs/imx6-engicam.h         |   1 -
 include/configs/imxrt1050-evk.h        |   1 -
 include/configs/ls1021aqds.h           |   1 -
 include/configs/ls1021atwr.h           |   1 -
 include/configs/m53menlo.h             |   1 -
 include/configs/mx23evk.h              |   1 -
 include/configs/mx28evk.h              |   1 -
 include/configs/mx51evk.h              |   1 -
 include/configs/mx53loco.h             |   1 -
 include/configs/mx6cuboxi.h            |   1 -
 include/configs/mx6sabre_common.h      |   1 -
 include/configs/mx6sxsabresd.h         |   1 -
 include/configs/mx6ul_14x14_evk.h      |   1 -
 include/configs/mx7dsabresd.h          |   1 -
 include/configs/nokia_rx51.h           |   1 -
 include/configs/novena.h               |   1 -
 include/configs/opos6uldev.h           |   1 -
 include/configs/pico-imx6.h            |   1 -
 include/configs/pico-imx6ul.h          |   1 -
 include/configs/pico-imx7d.h           |   1 -
 include/configs/pxm2.h                 |   1 -
 include/configs/rut.h                  |   1 -
 include/configs/s5p4418_nanopi2.h      |   2 -
 include/configs/wandboard.h            |   1 -
 include/configs/x86-common.h           |   6 +-
 include/splash.h                       |   1 +
 include/video.h                        |   4 +-
 include/virtio.h                       |   1 +
 scripts/Makefile.lib                   |  21 ++
 scripts/build-cb.sh                    |  19 ++
 scripts/config_whitelist.txt           |   1 -
 test/dm/video.c                        | 189 +++++++++++++-
 tools/logos/denx-16bpp.bmp.gz          | Bin 0 -> 4516 bytes
 tools/logos/denx-24bpp.bmp.gz          | Bin 0 -> 7137 bytes
 106 files changed, 678 insertions(+), 539 deletions(-)
 create mode 100644 drivers/video/u_boot_logo.bmp
 create mode 100755 scripts/build-cb.sh
 create mode 100644 tools/logos/denx-16bpp.bmp.gz
 create mode 100644 tools/logos/denx-24bpp.bmp.gz

-- 
2.34.0.rc2.393.gf8c9666880-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
