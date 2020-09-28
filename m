Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CE627AAC7
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Sep 2020 11:31:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC1DBC36B37;
	Mon, 28 Sep 2020 09:31:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B4B8C36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Sep 2020 09:31:19 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08S9N6gU021159; Mon, 28 Sep 2020 11:30:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=6htjZjorvyP0EVIbCG21dB9R0OA3gPub8ZJRDeAyNXw=;
 b=phJ5ZbZg5NOUKgb1C2/ZK+xKuuY345tpVETPeHhXpukb8VgX7jDJ8UC6Z3z4V89gP6T3
 Uer0td4eLuHcS2xKTHYnGSW6a8IFpvjffkc8lmimGU9b6FC5mZr7KD2p9VOiIn0e0PqM
 VTZFybqbOs4lPiiFs+6uGOPeDczX5i+/KFDWVWRteou/3hk8C3R7Gb3RtcoTER9wiebX
 x+eIQonvubpMOKrbdnppxMbFvLzhTvkIM0zdAhQrx1xzgos6H4dS3VMN/BuBMyZH4xNh
 5WzcZVio8vleCCR9aRF2WTatSg26aL7qD4d1rchJHlRqK7td/S6kRS6mo7ysy8B8Q649 jA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33sudv9r91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Sep 2020 11:30:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 521CE100039;
 Mon, 28 Sep 2020 11:30:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EA6C52AD2B4;
 Mon, 28 Sep 2020 11:30:19 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 28 Sep 2020 11:30:19 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 28 Sep 2020 11:30:15 +0200
Message-ID: <20200928093017.19053-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928093017.19053-1-patrick.delaunay@st.com>
References: <20200928093017.19053-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-28_07:2020-09-24,
 2020-09-28 signatures=0
Cc: Baruch Siach <baruch@tkos.co.il>, Nikita
 Kiryanov <nikita@compulab.co.il>, Neil Armstrong <narmstrong@baylibre.com>,
 Adrian Alonso <adrian.alonso@nxp.com>, Samuel Egli <samuel.egli@siemens.com>,
 Peng Fan <peng.fan@nxp.com>, Joe Hershberger <joe.hershberger@ni.com>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Soeren Moch <smoch@web.de>,
 =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>,
 Ken Lin <Ken.Lin@advantech.com.tw>, uboot-stm32@st-md-mailman.stormreply.com,
 Stefan Roese <sr@denx.de>, Richard Hu <richard.hu@technexion.com>,
 Marek Vasut <marex@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, u-boot-amlogic@groups.io,
 Thomas Hebb <tommyhebb@gmail.com>, Ramon Fried <rfried.dev@gmail.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Jason Liu <jason.hui.liu@nxp.com>,
 Anatolij Gustschin <agust@denx.de>, Vikas Manocha <vikas.manocha@st.com>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Vanessa Maegima <vanessa.maegima@nxp.com>, Ashok Reddy
 Soma <ashok.reddy.soma@xilinx.com>, Troy Kisky <troy.kisky@boundarydevices.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Akshay Bhat <akshaybhat@timesys.com>,
 Adam Ford <aford173@gmail.com>,
 =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>,
 Stefano Babic <sbabic@denx.de>, Olaf Mandel <o.mandel@menlosystems.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>, Heiko Schocher <hs@denx.de>,
 Simon Glass <sjg@chromium.org>, Holger Brunck <holger.brunck@ch.abb.com>,
 Mario Six <mario.six@gdsys.cc>, Fabio Estevam <fabio.estevam@nxp.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: [Uboot-stm32] [PATCH 2/3] configs: migrate CONFIG_VIDEO_BMP_RLE8 to
	defconfigs
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

Done with:
./tools/moveconfig.py VIDEO_BMP_RLE8

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 README                                  | 6 ------
 configs/apalis_imx6_defconfig           | 1 +
 configs/aristainetos2_defconfig         | 1 +
 configs/aristainetos2b_defconfig        | 1 +
 configs/aristainetos2bcsl_defconfig     | 1 +
 configs/aristainetos2c_defconfig        | 1 +
 configs/cgtqmx6eval_defconfig           | 1 +
 configs/cm_fx6_defconfig                | 1 +
 configs/colibri-imx6ull_defconfig       | 1 +
 configs/colibri_imx6_defconfig          | 1 +
 configs/colibri_imx7_defconfig          | 1 +
 configs/colibri_imx7_emmc_defconfig     | 1 +
 configs/dms-ba16-1g_defconfig           | 1 +
 configs/dms-ba16_defconfig              | 1 +
 configs/imx6dl_icore_nand_defconfig     | 1 +
 configs/imx6q_icore_nand_defconfig      | 1 +
 configs/imx6qdl_icore_mmc_defconfig     | 1 +
 configs/imx6qdl_icore_nand_defconfig    | 1 +
 configs/imxrt1050-evk_defconfig         | 1 +
 configs/khadas-vim3_defconfig           | 1 +
 configs/khadas-vim3l_defconfig          | 1 +
 configs/libretech-ac_defconfig          | 1 +
 configs/libretech-cc_defconfig          | 1 +
 configs/libretech-s905d-pc_defconfig    | 1 +
 configs/libretech-s912-pc_defconfig     | 1 +
 configs/m53menlo_defconfig              | 1 +
 configs/marsboard_defconfig             | 1 +
 configs/mx23evk_defconfig               | 1 +
 configs/mx28evk_auart_console_defconfig | 1 +
 configs/mx28evk_defconfig               | 1 +
 configs/mx28evk_nand_defconfig          | 1 +
 configs/mx28evk_spi_defconfig           | 1 +
 configs/mx51evk_defconfig               | 1 +
 configs/mx53loco_defconfig              | 1 +
 configs/mx6cuboxi_defconfig             | 1 +
 configs/mx6qsabrelite_defconfig         | 1 +
 configs/mx6sabreauto_defconfig          | 1 +
 configs/mx6sabresd_defconfig            | 1 +
 configs/mx6sxsabresd_defconfig          | 1 +
 configs/mx6ul_14x14_evk_defconfig       | 1 +
 configs/mx6ul_9x9_evk_defconfig         | 1 +
 configs/mx7dsabresd_defconfig           | 1 +
 configs/mx7dsabresd_qspi_defconfig      | 1 +
 configs/nitrogen6dl2g_defconfig         | 1 +
 configs/nitrogen6dl_defconfig           | 1 +
 configs/nitrogen6q2g_defconfig          | 1 +
 configs/nitrogen6q_defconfig            | 1 +
 configs/nitrogen6s1g_defconfig          | 1 +
 configs/nitrogen6s_defconfig            | 1 +
 configs/novena_defconfig                | 1 +
 configs/odroid-c2_defconfig             | 1 +
 configs/odroid-c4_defconfig             | 1 +
 configs/odroid-n2_defconfig             | 1 +
 configs/opos6uldev_defconfig            | 1 +
 configs/pico-dwarf-imx6ul_defconfig     | 1 +
 configs/pico-dwarf-imx7d_defconfig      | 1 +
 configs/pico-hobbit-imx6ul_defconfig    | 1 +
 configs/pico-hobbit-imx7d_defconfig     | 1 +
 configs/pico-imx6_defconfig             | 1 +
 configs/pico-imx7d_bl33_defconfig       | 1 +
 configs/pico-imx7d_defconfig            | 1 +
 configs/pico-nymph-imx7d_defconfig      | 1 +
 configs/pico-pi-imx6ul_defconfig        | 1 +
 configs/pico-pi-imx7d_defconfig         | 1 +
 configs/pxm2_defconfig                  | 1 +
 configs/riotboard_defconfig             | 1 +
 configs/riotboard_spl_defconfig         | 1 +
 configs/rut_defconfig                   | 1 +
 configs/sandbox64_defconfig             | 1 +
 configs/sandbox_defconfig               | 1 +
 configs/sandbox_flattree_defconfig      | 1 +
 configs/sandbox_spl_defconfig           | 1 +
 configs/sei510_defconfig                | 1 +
 configs/sei610_defconfig                | 1 +
 configs/stm32f746-disco_defconfig       | 1 +
 configs/stm32f769-disco_defconfig       | 1 +
 configs/stm32mp15_basic_defconfig       | 1 +
 configs/stm32mp15_dhcom_basic_defconfig | 1 +
 configs/stm32mp15_dhcor_basic_defconfig | 1 +
 configs/stm32mp15_trusted_defconfig     | 1 +
 configs/tbs2910_defconfig               | 1 +
 configs/wandboard_defconfig             | 1 +
 drivers/video/Kconfig                   | 7 +++++++
 include/configs/advantech_dms-ba16.h    | 1 -
 include/configs/apalis_imx6.h           | 1 -
 include/configs/aristainetos2.h         | 1 -
 include/configs/cgtqmx6eval.h           | 1 -
 include/configs/cm_fx6.h                | 2 --
 include/configs/colibri-imx6ull.h       | 1 -
 include/configs/colibri_imx6.h          | 1 -
 include/configs/colibri_imx7.h          | 1 -
 include/configs/embestmx6boards.h       | 1 -
 include/configs/imx6-engicam.h          | 1 -
 include/configs/imxrt1050-evk.h         | 1 -
 include/configs/m53menlo.h              | 1 -
 include/configs/meson64.h               | 1 -
 include/configs/mx23evk.h               | 1 -
 include/configs/mx28evk.h               | 1 -
 include/configs/mx51evk.h               | 1 -
 include/configs/mx53loco.h              | 1 -
 include/configs/mx6cuboxi.h             | 1 -
 include/configs/mx6sabre_common.h       | 1 -
 include/configs/mx6sxsabresd.h          | 1 -
 include/configs/mx6ul_14x14_evk.h       | 1 -
 include/configs/mx7dsabresd.h           | 1 -
 include/configs/nitrogen6x.h            | 1 -
 include/configs/novena.h                | 1 -
 include/configs/opos6uldev.h            | 1 -
 include/configs/pico-imx6.h             | 1 -
 include/configs/pico-imx6ul.h           | 1 -
 include/configs/pico-imx7d.h            | 1 -
 include/configs/pxm2.h                  | 1 -
 include/configs/rut.h                   | 1 -
 include/configs/sandbox.h               | 1 -
 include/configs/stm32f746-disco.h       | 1 -
 include/configs/stm32mp1.h              | 1 -
 include/configs/tbs2910.h               | 1 -
 include/configs/wandboard.h             | 1 -
 scripts/config_whitelist.txt            | 1 -
 119 files changed, 88 insertions(+), 43 deletions(-)

diff --git a/README b/README
index 5104245082..872a854870 100644
--- a/README
+++ b/README
@@ -1250,12 +1250,6 @@ The following options need to be configured:
 		Enables an 'i2c edid' command which can read EDID
 		information over I2C from an attached LCD display.
 
-- Run length encoded BMP image (RLE8) support: CONFIG_VIDEO_BMP_RLE8
-
-		If this option is set, 8-bit RLE compressed BMP images
-		can be displayed via the splashscreen support or the
-		bmp command.
-
 - MII/PHY support:
 		CONFIG_PHY_CLOCK_FREQ (ppc4xx)
 
diff --git a/configs/apalis_imx6_defconfig b/configs/apalis_imx6_defconfig
index 24313a655a..1c2f8267ba 100644
--- a/configs/apalis_imx6_defconfig
+++ b/configs/apalis_imx6_defconfig
@@ -106,4 +106,5 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/aristainetos2_defconfig b/configs/aristainetos2_defconfig
index 8214775f1d..b895c5282f 100644
--- a/configs/aristainetos2_defconfig
+++ b/configs/aristainetos2_defconfig
@@ -114,5 +114,6 @@ CONFIG_DISPLAY=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_IMX_WATCHDOG=y
 # CONFIG_EFI_LOADER is not set
diff --git a/configs/aristainetos2b_defconfig b/configs/aristainetos2b_defconfig
index 301652fa8f..5d60cf29b8 100644
--- a/configs/aristainetos2b_defconfig
+++ b/configs/aristainetos2b_defconfig
@@ -108,5 +108,6 @@ CONFIG_DISPLAY=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_IMX_WATCHDOG=y
 # CONFIG_EFI_LOADER is not set
diff --git a/configs/aristainetos2bcsl_defconfig b/configs/aristainetos2bcsl_defconfig
index 2a5254bee6..350c754954 100644
--- a/configs/aristainetos2bcsl_defconfig
+++ b/configs/aristainetos2bcsl_defconfig
@@ -108,5 +108,6 @@ CONFIG_DISPLAY=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_IMX_WATCHDOG=y
 # CONFIG_EFI_LOADER is not set
diff --git a/configs/aristainetos2c_defconfig b/configs/aristainetos2c_defconfig
index 15e4673651..e4b22323e7 100644
--- a/configs/aristainetos2c_defconfig
+++ b/configs/aristainetos2c_defconfig
@@ -114,5 +114,6 @@ CONFIG_DISPLAY=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_IMX_WATCHDOG=y
 # CONFIG_EFI_LOADER is not set
diff --git a/configs/cgtqmx6eval_defconfig b/configs/cgtqmx6eval_defconfig
index ab2b0b3514..c69c305ac3 100644
--- a/configs/cgtqmx6eval_defconfig
+++ b/configs/cgtqmx6eval_defconfig
@@ -93,4 +93,5 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT=y
diff --git a/configs/cm_fx6_defconfig b/configs/cm_fx6_defconfig
index 8a06830bec..4333ca441d 100644
--- a/configs/cm_fx6_defconfig
+++ b/configs/cm_fx6_defconfig
@@ -97,4 +97,5 @@ CONFIG_DM_VIDEO=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SOURCE=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_FDT_FIXUP_PARTITIONS=y
diff --git a/configs/colibri-imx6ull_defconfig b/configs/colibri-imx6ull_defconfig
index 9bdd8a1c50..9c930fe1b4 100644
--- a/configs/colibri-imx6ull_defconfig
+++ b/configs/colibri-imx6ull_defconfig
@@ -96,5 +96,6 @@ CONFIG_DM_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT_OVERLAY=y
 CONFIG_FDT_FIXUP_PARTITIONS=y
diff --git a/configs/colibri_imx6_defconfig b/configs/colibri_imx6_defconfig
index db81af8b93..25b6668391 100644
--- a/configs/colibri_imx6_defconfig
+++ b/configs/colibri_imx6_defconfig
@@ -104,4 +104,5 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/colibri_imx7_defconfig b/configs/colibri_imx7_defconfig
index 7a4eed2082..31c456b7b1 100644
--- a/configs/colibri_imx7_defconfig
+++ b/configs/colibri_imx7_defconfig
@@ -95,5 +95,6 @@ CONFIG_DM_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT_OVERLAY=y
 CONFIG_FDT_FIXUP_PARTITIONS=y
diff --git a/configs/colibri_imx7_emmc_defconfig b/configs/colibri_imx7_emmc_defconfig
index 81ad8233b3..a8728c8c91 100644
--- a/configs/colibri_imx7_emmc_defconfig
+++ b/configs/colibri_imx7_emmc_defconfig
@@ -91,4 +91,5 @@ CONFIG_DM_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/dms-ba16-1g_defconfig b/configs/dms-ba16-1g_defconfig
index cadeeaf37b..115bf0c193 100644
--- a/configs/dms-ba16-1g_defconfig
+++ b/configs/dms-ba16-1g_defconfig
@@ -63,4 +63,5 @@ CONFIG_USB_GADGET_DOWNLOAD=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT=y
diff --git a/configs/dms-ba16_defconfig b/configs/dms-ba16_defconfig
index e428fef8b4..fa28e3213c 100644
--- a/configs/dms-ba16_defconfig
+++ b/configs/dms-ba16_defconfig
@@ -62,4 +62,5 @@ CONFIG_USB_GADGET_DOWNLOAD=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT=y
diff --git a/configs/imx6dl_icore_nand_defconfig b/configs/imx6dl_icore_nand_defconfig
index 4c0b702f40..770aa9a4d4 100644
--- a/configs/imx6dl_icore_nand_defconfig
+++ b/configs/imx6dl_icore_nand_defconfig
@@ -66,3 +66,4 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/imx6q_icore_nand_defconfig b/configs/imx6q_icore_nand_defconfig
index fbd18235af..11fd7178f9 100644
--- a/configs/imx6q_icore_nand_defconfig
+++ b/configs/imx6q_icore_nand_defconfig
@@ -67,3 +67,4 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/imx6qdl_icore_mmc_defconfig b/configs/imx6qdl_icore_mmc_defconfig
index 6bbf2158cf..7aef7873b4 100644
--- a/configs/imx6qdl_icore_mmc_defconfig
+++ b/configs/imx6qdl_icore_mmc_defconfig
@@ -83,4 +83,5 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_IMX_WATCHDOG=y
diff --git a/configs/imx6qdl_icore_nand_defconfig b/configs/imx6qdl_icore_nand_defconfig
index fbd18235af..11fd7178f9 100644
--- a/configs/imx6qdl_icore_nand_defconfig
+++ b/configs/imx6qdl_icore_nand_defconfig
@@ -67,3 +67,4 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
index 3f7b670459..eb26bca269 100644
--- a/configs/imxrt1050-evk_defconfig
+++ b/configs/imxrt1050-evk_defconfig
@@ -70,6 +70,7 @@ CONFIG_BACKLIGHT_GPIO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_SHA1=y
 CONFIG_SHA256=y
 CONFIG_HEXDUMP=y
diff --git a/configs/khadas-vim3_defconfig b/configs/khadas-vim3_defconfig
index a39e0f9c9f..6a4fafe585 100644
--- a/configs/khadas-vim3_defconfig
+++ b/configs/khadas-vim3_defconfig
@@ -73,4 +73,5 @@ CONFIG_VIDEO_MESON=y
 CONFIG_VIDEO_DT_SIMPLEFB=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/khadas-vim3l_defconfig b/configs/khadas-vim3l_defconfig
index 57cc383b9d..f33f6a6dd0 100644
--- a/configs/khadas-vim3l_defconfig
+++ b/configs/khadas-vim3l_defconfig
@@ -73,4 +73,5 @@ CONFIG_VIDEO_MESON=y
 CONFIG_VIDEO_DT_SIMPLEFB=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/libretech-ac_defconfig b/configs/libretech-ac_defconfig
index e898fb147f..70451c48fd 100644
--- a/configs/libretech-ac_defconfig
+++ b/configs/libretech-ac_defconfig
@@ -83,4 +83,5 @@ CONFIG_VIDEO_MESON=y
 CONFIG_VIDEO_DT_SIMPLEFB=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/libretech-cc_defconfig b/configs/libretech-cc_defconfig
index 65ad7f5de4..8dbea40b68 100644
--- a/configs/libretech-cc_defconfig
+++ b/configs/libretech-cc_defconfig
@@ -66,4 +66,5 @@ CONFIG_VIDEO_MESON=y
 CONFIG_VIDEO_DT_SIMPLEFB=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/libretech-s905d-pc_defconfig b/configs/libretech-s905d-pc_defconfig
index c99a6c5971..a3eeb6308e 100644
--- a/configs/libretech-s905d-pc_defconfig
+++ b/configs/libretech-s905d-pc_defconfig
@@ -76,4 +76,5 @@ CONFIG_VIDEO_MESON=y
 CONFIG_VIDEO_DT_SIMPLEFB=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/libretech-s912-pc_defconfig b/configs/libretech-s912-pc_defconfig
index 7975c590b6..19b7be90b0 100644
--- a/configs/libretech-s912-pc_defconfig
+++ b/configs/libretech-s912-pc_defconfig
@@ -75,4 +75,5 @@ CONFIG_VIDEO_MESON=y
 CONFIG_VIDEO_DT_SIMPLEFB=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/m53menlo_defconfig b/configs/m53menlo_defconfig
index 26e4a885b3..57977e5e86 100644
--- a/configs/m53menlo_defconfig
+++ b/configs/m53menlo_defconfig
@@ -105,5 +105,6 @@ CONFIG_SPLASHIMAGE_GUARD=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_SPLASH_SOURCE=y
 CONFIG_VIDEO_BMP_GZIP=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_WATCHDOG_TIMEOUT_MSECS=8000
 CONFIG_IMX_WATCHDOG=y
diff --git a/configs/marsboard_defconfig b/configs/marsboard_defconfig
index bcda6a38a6..6ddd6ba862 100644
--- a/configs/marsboard_defconfig
+++ b/configs/marsboard_defconfig
@@ -52,4 +52,5 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT=y
diff --git a/configs/mx23evk_defconfig b/configs/mx23evk_defconfig
index 67d8f6754d..7d8c93688e 100644
--- a/configs/mx23evk_defconfig
+++ b/configs/mx23evk_defconfig
@@ -40,4 +40,5 @@ CONFIG_USB_STORAGE=y
 CONFIG_VIDEO=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_VIDEO_BMP_GZIP=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT=y
diff --git a/configs/mx28evk_auart_console_defconfig b/configs/mx28evk_auart_console_defconfig
index bf81a8c624..4944fb6df0 100644
--- a/configs/mx28evk_auart_console_defconfig
+++ b/configs/mx28evk_auart_console_defconfig
@@ -59,4 +59,5 @@ CONFIG_USB_ETHER_SMSC95XX=y
 CONFIG_VIDEO=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_VIDEO_BMP_GZIP=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT=y
diff --git a/configs/mx28evk_defconfig b/configs/mx28evk_defconfig
index 1c3db124b9..e5ba65d8e0 100644
--- a/configs/mx28evk_defconfig
+++ b/configs/mx28evk_defconfig
@@ -59,4 +59,5 @@ CONFIG_USB_ETHER_SMSC95XX=y
 CONFIG_VIDEO=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_VIDEO_BMP_GZIP=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT=y
diff --git a/configs/mx28evk_nand_defconfig b/configs/mx28evk_nand_defconfig
index ae1d02ae81..d5331fa7f9 100644
--- a/configs/mx28evk_nand_defconfig
+++ b/configs/mx28evk_nand_defconfig
@@ -60,4 +60,5 @@ CONFIG_USB_ETHER_SMSC95XX=y
 CONFIG_VIDEO=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_VIDEO_BMP_GZIP=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT=y
diff --git a/configs/mx28evk_spi_defconfig b/configs/mx28evk_spi_defconfig
index 85d328de66..0e521a3724 100644
--- a/configs/mx28evk_spi_defconfig
+++ b/configs/mx28evk_spi_defconfig
@@ -56,4 +56,5 @@ CONFIG_USB_ETHER_SMSC95XX=y
 CONFIG_VIDEO=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_VIDEO_BMP_GZIP=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT=y
diff --git a/configs/mx51evk_defconfig b/configs/mx51evk_defconfig
index 343816f89f..72b1417de9 100644
--- a/configs/mx51evk_defconfig
+++ b/configs/mx51evk_defconfig
@@ -39,4 +39,5 @@ CONFIG_USB_ETHER_ASIX=y
 CONFIG_USB_ETHER_SMSC95XX=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT=y
diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index 0d366c29fb..73e43108bb 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -40,4 +40,5 @@ CONFIG_USB_ETHER_MCS7830=y
 CONFIG_USB_ETHER_SMSC95XX=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT=y
diff --git a/configs/mx6cuboxi_defconfig b/configs/mx6cuboxi_defconfig
index 6dd678f756..db5af85955 100644
--- a/configs/mx6cuboxi_defconfig
+++ b/configs/mx6cuboxi_defconfig
@@ -80,3 +80,4 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/mx6qsabrelite_defconfig b/configs/mx6qsabrelite_defconfig
index 9bdafe2372..6e5cd098cd 100644
--- a/configs/mx6qsabrelite_defconfig
+++ b/configs/mx6qsabrelite_defconfig
@@ -83,3 +83,4 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_GZIP=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/mx6sabreauto_defconfig b/configs/mx6sabreauto_defconfig
index 483e1b999d..47dfd0cb63 100644
--- a/configs/mx6sabreauto_defconfig
+++ b/configs/mx6sabreauto_defconfig
@@ -107,3 +107,4 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/mx6sabresd_defconfig b/configs/mx6sabresd_defconfig
index 542c0a7577..3a08398303 100644
--- a/configs/mx6sabresd_defconfig
+++ b/configs/mx6sabresd_defconfig
@@ -116,3 +116,4 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/mx6sxsabresd_defconfig b/configs/mx6sxsabresd_defconfig
index d3f8e86aa4..8fdbef645b 100644
--- a/configs/mx6sxsabresd_defconfig
+++ b/configs/mx6sxsabresd_defconfig
@@ -76,3 +76,4 @@ CONFIG_USB_ETHER_ASIX=y
 CONFIG_VIDEO=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/mx6ul_14x14_evk_defconfig b/configs/mx6ul_14x14_evk_defconfig
index 58475b5533..af1805daab 100644
--- a/configs/mx6ul_14x14_evk_defconfig
+++ b/configs/mx6ul_14x14_evk_defconfig
@@ -92,3 +92,4 @@ CONFIG_DM_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/mx6ul_9x9_evk_defconfig b/configs/mx6ul_9x9_evk_defconfig
index a9d4190865..b28863e92c 100644
--- a/configs/mx6ul_9x9_evk_defconfig
+++ b/configs/mx6ul_9x9_evk_defconfig
@@ -82,3 +82,4 @@ CONFIG_DM_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/mx7dsabresd_defconfig b/configs/mx7dsabresd_defconfig
index e4655c222f..70c62fb596 100644
--- a/configs/mx7dsabresd_defconfig
+++ b/configs/mx7dsabresd_defconfig
@@ -87,4 +87,5 @@ CONFIG_USB_ETHER_ASIX=y
 CONFIG_VIDEO=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_ERRNO_STR=y
diff --git a/configs/mx7dsabresd_qspi_defconfig b/configs/mx7dsabresd_qspi_defconfig
index 56a8b6bf44..5fe3fd76de 100644
--- a/configs/mx7dsabresd_qspi_defconfig
+++ b/configs/mx7dsabresd_qspi_defconfig
@@ -94,4 +94,5 @@ CONFIG_USB_ETHER_ASIX=y
 CONFIG_VIDEO=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_ERRNO_STR=y
diff --git a/configs/nitrogen6dl2g_defconfig b/configs/nitrogen6dl2g_defconfig
index fda334173b..aff1ea35fa 100644
--- a/configs/nitrogen6dl2g_defconfig
+++ b/configs/nitrogen6dl2g_defconfig
@@ -84,3 +84,4 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_GZIP=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/nitrogen6dl_defconfig b/configs/nitrogen6dl_defconfig
index 2d85352e88..f726834aa9 100644
--- a/configs/nitrogen6dl_defconfig
+++ b/configs/nitrogen6dl_defconfig
@@ -84,3 +84,4 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_GZIP=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/nitrogen6q2g_defconfig b/configs/nitrogen6q2g_defconfig
index 8e78e376c0..cab0426995 100644
--- a/configs/nitrogen6q2g_defconfig
+++ b/configs/nitrogen6q2g_defconfig
@@ -86,3 +86,4 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_GZIP=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/nitrogen6q_defconfig b/configs/nitrogen6q_defconfig
index e8daecb719..eb517201ea 100644
--- a/configs/nitrogen6q_defconfig
+++ b/configs/nitrogen6q_defconfig
@@ -86,3 +86,4 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_GZIP=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/nitrogen6s1g_defconfig b/configs/nitrogen6s1g_defconfig
index 3ccb1bdef8..47a622a36a 100644
--- a/configs/nitrogen6s1g_defconfig
+++ b/configs/nitrogen6s1g_defconfig
@@ -84,3 +84,4 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_GZIP=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/nitrogen6s_defconfig b/configs/nitrogen6s_defconfig
index 3a47d5c3fb..9d20369363 100644
--- a/configs/nitrogen6s_defconfig
+++ b/configs/nitrogen6s_defconfig
@@ -84,3 +84,4 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_GZIP=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/novena_defconfig b/configs/novena_defconfig
index a4bbd8a22e..7fb70e8fcd 100644
--- a/configs/novena_defconfig
+++ b/configs/novena_defconfig
@@ -80,3 +80,4 @@ CONFIG_USB_ETHER_SMSC95XX=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/odroid-c2_defconfig b/configs/odroid-c2_defconfig
index 82bae79d3d..17cee882cc 100644
--- a/configs/odroid-c2_defconfig
+++ b/configs/odroid-c2_defconfig
@@ -59,5 +59,6 @@ CONFIG_VIDEO_MESON=y
 CONFIG_VIDEO_DT_SIMPLEFB=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT_OVERLAY=y
 CONFIG_SMBIOS_MANUFACTURER="Hardkernel Co., Ltd."
diff --git a/configs/odroid-c4_defconfig b/configs/odroid-c4_defconfig
index ffaaaab2b4..58961a6d54 100644
--- a/configs/odroid-c4_defconfig
+++ b/configs/odroid-c4_defconfig
@@ -64,4 +64,5 @@ CONFIG_VIDEO_MESON=y
 CONFIG_VIDEO_DT_SIMPLEFB=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/odroid-n2_defconfig b/configs/odroid-n2_defconfig
index e8b8da9084..7e20462eea 100644
--- a/configs/odroid-n2_defconfig
+++ b/configs/odroid-n2_defconfig
@@ -62,4 +62,5 @@ CONFIG_DM_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_MESON=y
 CONFIG_VIDEO_DT_SIMPLEFB=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/opos6uldev_defconfig b/configs/opos6uldev_defconfig
index 314b40e9b6..5e06ee0d21 100644
--- a/configs/opos6uldev_defconfig
+++ b/configs/opos6uldev_defconfig
@@ -109,5 +109,6 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_SPLASH_SOURCE=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT_OVERLAY=y
 # CONFIG_EFI_LOADER is not set
diff --git a/configs/pico-dwarf-imx6ul_defconfig b/configs/pico-dwarf-imx6ul_defconfig
index c381723069..a39bd7e4d2 100644
--- a/configs/pico-dwarf-imx6ul_defconfig
+++ b/configs/pico-dwarf-imx6ul_defconfig
@@ -72,3 +72,4 @@ CONFIG_CI_UDC=y
 CONFIG_VIDEO=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/pico-dwarf-imx7d_defconfig b/configs/pico-dwarf-imx7d_defconfig
index 6d1d68e3e5..c2890a9169 100644
--- a/configs/pico-dwarf-imx7d_defconfig
+++ b/configs/pico-dwarf-imx7d_defconfig
@@ -80,3 +80,4 @@ CONFIG_DM_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/pico-hobbit-imx6ul_defconfig b/configs/pico-hobbit-imx6ul_defconfig
index c68388347d..e084caadac 100644
--- a/configs/pico-hobbit-imx6ul_defconfig
+++ b/configs/pico-hobbit-imx6ul_defconfig
@@ -75,3 +75,4 @@ CONFIG_CI_UDC=y
 CONFIG_VIDEO=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/pico-hobbit-imx7d_defconfig b/configs/pico-hobbit-imx7d_defconfig
index db30fd504d..fab1bdd99c 100644
--- a/configs/pico-hobbit-imx7d_defconfig
+++ b/configs/pico-hobbit-imx7d_defconfig
@@ -80,3 +80,4 @@ CONFIG_DM_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/pico-imx6_defconfig b/configs/pico-imx6_defconfig
index 94e6f6f779..dd9fbe4a6d 100644
--- a/configs/pico-imx6_defconfig
+++ b/configs/pico-imx6_defconfig
@@ -90,3 +90,4 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/pico-imx7d_bl33_defconfig b/configs/pico-imx7d_bl33_defconfig
index e9194f82e9..da61b0c221 100644
--- a/configs/pico-imx7d_bl33_defconfig
+++ b/configs/pico-imx7d_bl33_defconfig
@@ -76,4 +76,5 @@ CONFIG_DM_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/pico-imx7d_defconfig b/configs/pico-imx7d_defconfig
index a9a1a01ec6..962a2cd619 100644
--- a/configs/pico-imx7d_defconfig
+++ b/configs/pico-imx7d_defconfig
@@ -80,3 +80,4 @@ CONFIG_DM_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/pico-nymph-imx7d_defconfig b/configs/pico-nymph-imx7d_defconfig
index 6d1d68e3e5..c2890a9169 100644
--- a/configs/pico-nymph-imx7d_defconfig
+++ b/configs/pico-nymph-imx7d_defconfig
@@ -80,3 +80,4 @@ CONFIG_DM_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/pico-pi-imx6ul_defconfig b/configs/pico-pi-imx6ul_defconfig
index 9e81d66ee7..a0a331ad75 100644
--- a/configs/pico-pi-imx6ul_defconfig
+++ b/configs/pico-pi-imx6ul_defconfig
@@ -75,3 +75,4 @@ CONFIG_CI_UDC=y
 CONFIG_VIDEO=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/pico-pi-imx7d_defconfig b/configs/pico-pi-imx7d_defconfig
index 3768314bd9..a0d9f18721 100644
--- a/configs/pico-pi-imx7d_defconfig
+++ b/configs/pico-pi-imx7d_defconfig
@@ -80,3 +80,4 @@ CONFIG_DM_VIDEO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/pxm2_defconfig b/configs/pxm2_defconfig
index d66a2114d5..3001ede836 100644
--- a/configs/pxm2_defconfig
+++ b/configs/pxm2_defconfig
@@ -106,3 +106,4 @@ CONFIG_SYS_CONSOLE_BG_COL=0xff
 CONFIG_SYS_CONSOLE_FG_COL=0x00
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
index 17f38a9577..711856b1c1 100644
--- a/configs/riotboard_defconfig
+++ b/configs/riotboard_defconfig
@@ -53,4 +53,5 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT=y
diff --git a/configs/riotboard_spl_defconfig b/configs/riotboard_spl_defconfig
index 61534a96e7..33c53de179 100644
--- a/configs/riotboard_spl_defconfig
+++ b/configs/riotboard_spl_defconfig
@@ -63,5 +63,6 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT=y
 CONFIG_SPL_OF_LIBFDT=y
diff --git a/configs/rut_defconfig b/configs/rut_defconfig
index 1eefb89760..d7f13186b1 100644
--- a/configs/rut_defconfig
+++ b/configs/rut_defconfig
@@ -106,3 +106,4 @@ CONFIG_SYS_CONSOLE_BG_COL=0xff
 CONFIG_SYS_CONSOLE_FG_COL=0x00
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
index c3ca796d51..a968ef668c 100644
--- a/configs/sandbox64_defconfig
+++ b/configs/sandbox64_defconfig
@@ -215,6 +215,7 @@ CONFIG_VIDEO_SANDBOX_SDL=y
 CONFIG_OSD=y
 CONFIG_SANDBOX_OSD=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_WDT=y
 CONFIG_WDT_SANDBOX=y
 CONFIG_FS_CBFS=y
diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
index 6e9f029cc9..48ece99aa8 100644
--- a/configs/sandbox_defconfig
+++ b/configs/sandbox_defconfig
@@ -249,6 +249,7 @@ CONFIG_VIDEO_DSI_HOST_SANDBOX=y
 CONFIG_OSD=y
 CONFIG_SANDBOX_OSD=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_W1=y
 CONFIG_W1_GPIO=y
 CONFIG_W1_EEPROM=y
diff --git a/configs/sandbox_flattree_defconfig b/configs/sandbox_flattree_defconfig
index dd93167e1b..6ee23c4a61 100644
--- a/configs/sandbox_flattree_defconfig
+++ b/configs/sandbox_flattree_defconfig
@@ -192,6 +192,7 @@ CONFIG_CONSOLE_TRUETYPE_CANTORAONE=y
 CONFIG_VIDEO_SANDBOX_SDL=y
 CONFIG_OSD=y
 CONFIG_SANDBOX_OSD=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_CMD_DHRYSTONE=y
 CONFIG_RSA_VERIFY_WITH_PKEY=y
 CONFIG_TPM=y
diff --git a/configs/sandbox_spl_defconfig b/configs/sandbox_spl_defconfig
index 6d8e827aeb..1d49e81639 100644
--- a/configs/sandbox_spl_defconfig
+++ b/configs/sandbox_spl_defconfig
@@ -211,6 +211,7 @@ CONFIG_VIDEO_SANDBOX_SDL=y
 CONFIG_OSD=y
 CONFIG_SANDBOX_OSD=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_FS_CBFS=y
 CONFIG_FS_CRAMFS=y
 # CONFIG_SPL_USE_TINY_PRINTF is not set
diff --git a/configs/sei510_defconfig b/configs/sei510_defconfig
index 8ee3a138e1..137457f7b4 100644
--- a/configs/sei510_defconfig
+++ b/configs/sei510_defconfig
@@ -80,4 +80,5 @@ CONFIG_VIDEO_MESON=y
 CONFIG_VIDEO_DT_SIMPLEFB=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/sei610_defconfig b/configs/sei610_defconfig
index 43932b4c96..6c57e561f9 100644
--- a/configs/sei610_defconfig
+++ b/configs/sei610_defconfig
@@ -80,4 +80,5 @@ CONFIG_VIDEO_MESON=y
 CONFIG_VIDEO_DT_SIMPLEFB=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/stm32f746-disco_defconfig b/configs/stm32f746-disco_defconfig
index 4b2b8587f8..a3f4b5c93f 100644
--- a/configs/stm32f746-disco_defconfig
+++ b/configs/stm32f746-disco_defconfig
@@ -62,4 +62,5 @@ CONFIG_VIDEO_STM32_MAX_XRES=480
 CONFIG_VIDEO_STM32_MAX_YRES=640
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/stm32f769-disco_defconfig b/configs/stm32f769-disco_defconfig
index bed5a773e1..5192bf11d9 100644
--- a/configs/stm32f769-disco_defconfig
+++ b/configs/stm32f769-disco_defconfig
@@ -64,4 +64,5 @@ CONFIG_VIDEO_STM32_MAX_XRES=480
 CONFIG_VIDEO_STM32_MAX_YRES=800
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index a8c4112dbe..dc02d1011f 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -149,6 +149,7 @@ CONFIG_VIDEO_STM32=y
 CONFIG_VIDEO_STM32_DSI=y
 CONFIG_VIDEO_STM32_MAX_XRES=1280
 CONFIG_VIDEO_STM32_MAX_YRES=800
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
 CONFIG_ERRNO_STR=y
diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
index 7668fd01cd..e6d712ccf6 100644
--- a/configs/stm32mp15_dhcom_basic_defconfig
+++ b/configs/stm32mp15_dhcom_basic_defconfig
@@ -148,5 +148,6 @@ CONFIG_VIDEO_STM32=y
 CONFIG_VIDEO_STM32_DSI=y
 CONFIG_VIDEO_STM32_MAX_XRES=1280
 CONFIG_VIDEO_STM32_MAX_YRES=800
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_LZO=y
 CONFIG_FDT_FIXUP_PARTITIONS=y
diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
index aa384517c3..5e549ff248 100644
--- a/configs/stm32mp15_dhcor_basic_defconfig
+++ b/configs/stm32mp15_dhcor_basic_defconfig
@@ -142,5 +142,6 @@ CONFIG_VIDEO_STM32=y
 CONFIG_VIDEO_STM32_DSI=y
 CONFIG_VIDEO_STM32_MAX_XRES=1280
 CONFIG_VIDEO_STM32_MAX_YRES=800
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_LZO=y
 CONFIG_FDT_FIXUP_PARTITIONS=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 0792884a9d..62958b7ed4 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -130,6 +130,7 @@ CONFIG_VIDEO_STM32=y
 CONFIG_VIDEO_STM32_DSI=y
 CONFIG_VIDEO_STM32_MAX_XRES=1280
 CONFIG_VIDEO_STM32_MAX_YRES=800
+CONFIG_VIDEO_BMP_RLE8=y
 CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
 CONFIG_ERRNO_STR=y
diff --git a/configs/tbs2910_defconfig b/configs/tbs2910_defconfig
index 070aea59b5..5e030c5406 100644
--- a/configs/tbs2910_defconfig
+++ b/configs/tbs2910_defconfig
@@ -106,6 +106,7 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDCONSOLE_AS_LCD=y
 CONFIG_I2C_EDID=y
 CONFIG_VIDEO_IPUV3=y
+CONFIG_VIDEO_BMP_RLE8=y
 # CONFIG_GZIP is not set
 CONFIG_OF_LIBFDT_ASSUME_MASK=0xff
 # CONFIG_EFI_LOADER is not set
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 4584007909..d7b5de66f4 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -81,3 +81,4 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_VIDEO_BMP_RLE8=y
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 63638074ca..8df69f1496 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -947,4 +947,11 @@ config VIDEO_BMP_GZIP
 	  images, gzipped BMP images can be displayed via the
 	  splashscreen support or the bmp command.
 
+config VIDEO_BMP_RLE8
+	bool "Run length encoded BMP image (RLE8) support"
+	depends on DM_VIDEO || CFB_CONSOLE
+	help
+	  If this option is set, the 8-bit RLE compressed BMP images
+	  is supported.
+
 endmenu
diff --git a/include/configs/advantech_dms-ba16.h b/include/configs/advantech_dms-ba16.h
index 07d804cbcb..8baa811166 100644
--- a/include/configs/advantech_dms-ba16.h
+++ b/include/configs/advantech_dms-ba16.h
@@ -197,7 +197,6 @@
 #define CONFIG_SYS_FSL_USDHC_NUM        3
 
 /* Framebuffer */
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
diff --git a/include/configs/apalis_imx6.h b/include/configs/apalis_imx6.h
index 4cffc7f887..af903e0acd 100644
--- a/include/configs/apalis_imx6.h
+++ b/include/configs/apalis_imx6.h
@@ -67,7 +67,6 @@
 
 /* Framebuffer and LCD */
 #define CONFIG_SYS_CONSOLE_OVERWRITE_ROUTINE
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
diff --git a/include/configs/aristainetos2.h b/include/configs/aristainetos2.h
index fd28f44ae3..223090409a 100644
--- a/include/configs/aristainetos2.h
+++ b/include/configs/aristainetos2.h
@@ -442,7 +442,6 @@
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_BMP_16BPP
-#define CONFIG_VIDEO_BMP_RLE8
 
 #define CONFIG_IMX6_PWM_PER_CLK	66000000
 
diff --git a/include/configs/cgtqmx6eval.h b/include/configs/cgtqmx6eval.h
index 9d0f516b7d..9ee5eba748 100644
--- a/include/configs/cgtqmx6eval.h
+++ b/include/configs/cgtqmx6eval.h
@@ -60,7 +60,6 @@
 #define CONFIG_USBD_HS
 
 /* Framebuffer */
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
diff --git a/include/configs/cm_fx6.h b/include/configs/cm_fx6.h
index 6915dcb661..72eb19b581 100644
--- a/include/configs/cm_fx6.h
+++ b/include/configs/cm_fx6.h
@@ -204,8 +204,6 @@
 /* Display */
 #define CONFIG_IMX_HDMI
 
-#define CONFIG_VIDEO_BMP_RLE8
-
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 
diff --git a/include/configs/colibri-imx6ull.h b/include/configs/colibri-imx6ull.h
index 63b3fef34c..1057619864 100644
--- a/include/configs/colibri-imx6ull.h
+++ b/include/configs/colibri-imx6ull.h
@@ -153,7 +153,6 @@
 #define MXS_LCDIF_BASE MX6UL_LCDIF1_BASE_ADDR
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_BMP_16BPP
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_VIDEO_BMP_LOGO
 #endif
 
diff --git a/include/configs/colibri_imx6.h b/include/configs/colibri_imx6.h
index 097e620de4..4bdba6ce00 100644
--- a/include/configs/colibri_imx6.h
+++ b/include/configs/colibri_imx6.h
@@ -55,7 +55,6 @@
 
 /* Framebuffer and LCD */
 #define CONFIG_SYS_CONSOLE_OVERWRITE_ROUTINE
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
diff --git a/include/configs/colibri_imx7.h b/include/configs/colibri_imx7.h
index 76088d53a3..55f55cb613 100644
--- a/include/configs/colibri_imx7.h
+++ b/include/configs/colibri_imx7.h
@@ -216,7 +216,6 @@
 #define CONFIG_VIDEO_MXS
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_BMP_16BPP
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_VIDEO_BMP_LOGO
 #endif
 
diff --git a/include/configs/embestmx6boards.h b/include/configs/embestmx6boards.h
index ef4ea9a29b..cf94fbb2b0 100644
--- a/include/configs/embestmx6boards.h
+++ b/include/configs/embestmx6boards.h
@@ -72,7 +72,6 @@
 #endif
 
 /* Framebuffer */
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
diff --git a/include/configs/imx6-engicam.h b/include/configs/imx6-engicam.h
index 13cd54a8dc..954425dbb0 100644
--- a/include/configs/imx6-engicam.h
+++ b/include/configs/imx6-engicam.h
@@ -166,7 +166,6 @@
 # define CONFIG_IMX_VIDEO_SKIP
 
 # define CONFIG_BMP_16BPP
-# define CONFIG_VIDEO_BMP_RLE8
 # define CONFIG_VIDEO_LOGO
 # define CONFIG_VIDEO_BMP_LOGO
 #endif
diff --git a/include/configs/imxrt1050-evk.h b/include/configs/imxrt1050-evk.h
index 559e6880b7..31f8ef4e0a 100644
--- a/include/configs/imxrt1050-evk.h
+++ b/include/configs/imxrt1050-evk.h
@@ -32,7 +32,6 @@
 #define CONFIG_VIDEO_MXS
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_BMP_16BPP
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_VIDEO_BMP_LOGO
 
 #define CONFIG_EXTRA_ENV_SETTINGS \
diff --git a/include/configs/m53menlo.h b/include/configs/m53menlo.h
index f274b96f20..4bc64f5af6 100644
--- a/include/configs/m53menlo.h
+++ b/include/configs/m53menlo.h
@@ -126,7 +126,6 @@
 /*
  * LCD
  */
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_SYS_VIDEO_LOGO_MAX_SIZE	(2 << 20)
diff --git a/include/configs/meson64.h b/include/configs/meson64.h
index c895a24eca..77f73b4b17 100644
--- a/include/configs/meson64.h
+++ b/include/configs/meson64.h
@@ -18,7 +18,6 @@
 
 /* For splashscreen */
 #ifdef CONFIG_DM_VIDEO
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_BMP_16BPP
 #define CONFIG_BMP_24BPP
 #define CONFIG_BMP_32BPP
diff --git a/include/configs/mx23evk.h b/include/configs/mx23evk.h
index bebaf5a868..5ba1a3916c 100644
--- a/include/configs/mx23evk.h
+++ b/include/configs/mx23evk.h
@@ -32,7 +32,6 @@
 #ifdef CONFIG_VIDEO
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_BMP_16BPP
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_SYS_VIDEO_LOGO_MAX_SIZE	(512 << 10)
 #endif
 
diff --git a/include/configs/mx28evk.h b/include/configs/mx28evk.h
index 0b71debc73..236b25e075 100644
--- a/include/configs/mx28evk.h
+++ b/include/configs/mx28evk.h
@@ -53,7 +53,6 @@
 #ifdef CONFIG_VIDEO
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_BMP_16BPP
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_SYS_VIDEO_LOGO_MAX_SIZE	(512 << 10)
 #endif
 
diff --git a/include/configs/mx51evk.h b/include/configs/mx51evk.h
index 58712926b4..e7e301e1d3 100644
--- a/include/configs/mx51evk.h
+++ b/include/configs/mx51evk.h
@@ -65,7 +65,6 @@
 #define CONFIG_MXC_USB_FLAGS	MXC_EHCI_POWER_PINS_ENABLED
 
 /* Framebuffer and LCD */
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 
diff --git a/include/configs/mx53loco.h b/include/configs/mx53loco.h
index 90d800cd25..23250fd879 100644
--- a/include/configs/mx53loco.h
+++ b/include/configs/mx53loco.h
@@ -176,7 +176,6 @@
 #endif
 
 /* Framebuffer and LCD */
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 
diff --git a/include/configs/mx6cuboxi.h b/include/configs/mx6cuboxi.h
index 20b757e621..4f7eda2eef 100644
--- a/include/configs/mx6cuboxi.h
+++ b/include/configs/mx6cuboxi.h
@@ -29,7 +29,6 @@
 #endif
 
 /* Framebuffer */
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
diff --git a/include/configs/mx6sabre_common.h b/include/configs/mx6sabre_common.h
index ecf4681c1f..898aa96213 100644
--- a/include/configs/mx6sabre_common.h
+++ b/include/configs/mx6sabre_common.h
@@ -169,7 +169,6 @@
 /* Environment organization */
 
 /* Framebuffer */
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
diff --git a/include/configs/mx6sxsabresd.h b/include/configs/mx6sxsabresd.h
index 441ea3d4df..e041284d3c 100644
--- a/include/configs/mx6sxsabresd.h
+++ b/include/configs/mx6sxsabresd.h
@@ -177,7 +177,6 @@
 #define CONFIG_VIDEO_MXS
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_BMP_16BPP
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_VIDEO_BMP_LOGO
 #define MXS_LCDIF_BASE MX6SX_LCDIF1_BASE_ADDR
 #endif
diff --git a/include/configs/mx6ul_14x14_evk.h b/include/configs/mx6ul_14x14_evk.h
index 68e1db52c7..4e2c3d769f 100644
--- a/include/configs/mx6ul_14x14_evk.h
+++ b/include/configs/mx6ul_14x14_evk.h
@@ -184,7 +184,6 @@
 #define CONFIG_VIDEO_MXS
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_BMP_16BPP
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_VIDEO_BMP_LOGO
 #define MXS_LCDIF_BASE MX6UL_LCDIF1_BASE_ADDR
 #endif
diff --git a/include/configs/mx7dsabresd.h b/include/configs/mx7dsabresd.h
index 16b8c07f32..668c9943a5 100644
--- a/include/configs/mx7dsabresd.h
+++ b/include/configs/mx7dsabresd.h
@@ -142,7 +142,6 @@
 #define CONFIG_VIDEO_MXS
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_BMP_16BPP
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_VIDEO_BMP_LOGO
 #endif
 
diff --git a/include/configs/nitrogen6x.h b/include/configs/nitrogen6x.h
index ed43963bf4..5c80696e86 100644
--- a/include/configs/nitrogen6x.h
+++ b/include/configs/nitrogen6x.h
@@ -56,7 +56,6 @@
 #define CONFIG_MXC_USB_FLAGS	0
 
 /* Framebuffer and LCD */
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_SYS_VIDEO_LOGO_MAX_SIZE (6 * 1024 * 1024)
 #define CONFIG_BMP_16BPP
 #define CONFIG_IMX_HDMI
diff --git a/include/configs/novena.h b/include/configs/novena.h
index b648c7bc86..e0f8b3535e 100644
--- a/include/configs/novena.h
+++ b/include/configs/novena.h
@@ -101,7 +101,6 @@
 #endif
 
 /* Video output */
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_IMX_HDMI
diff --git a/include/configs/opos6uldev.h b/include/configs/opos6uldev.h
index 8dfd5bede3..1930b8b785 100644
--- a/include/configs/opos6uldev.h
+++ b/include/configs/opos6uldev.h
@@ -45,7 +45,6 @@
 #ifndef CONFIG_SPL_BUILD
 #ifdef CONFIG_DM_VIDEO
 #define CONFIG_VIDEO_LOGO
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_BMP_16BPP
 #define CONFIG_BMP_24BPP
diff --git a/include/configs/pico-imx6.h b/include/configs/pico-imx6.h
index 289c1cac66..48b62f7140 100644
--- a/include/configs/pico-imx6.h
+++ b/include/configs/pico-imx6.h
@@ -143,7 +143,6 @@
 #define CONFIG_FEC_MXC_PHYADDR		1
 
 /* Framebuffer */
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
diff --git a/include/configs/pico-imx6ul.h b/include/configs/pico-imx6ul.h
index 5211970a83..92fed20f0a 100644
--- a/include/configs/pico-imx6ul.h
+++ b/include/configs/pico-imx6ul.h
@@ -148,7 +148,6 @@
 #define CONFIG_VIDEO_MXS
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_BMP_16BPP
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_VIDEO_BMP_LOGO
 #define MXS_LCDIF_BASE MX6UL_LCDIF1_BASE_ADDR
 #endif
diff --git a/include/configs/pico-imx7d.h b/include/configs/pico-imx7d.h
index 12417dfede..bf5690d480 100644
--- a/include/configs/pico-imx7d.h
+++ b/include/configs/pico-imx7d.h
@@ -144,7 +144,6 @@
 #define CONFIG_VIDEO_MXS
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_BMP_16BPP
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_VIDEO_BMP_LOGO
 #endif
 
diff --git a/include/configs/pxm2.h b/include/configs/pxm2.h
index 588eb282a1..4673390c1a 100644
--- a/include/configs/pxm2.h
+++ b/include/configs/pxm2.h
@@ -115,7 +115,6 @@
 #if defined(CONFIG_VIDEO)
 #define CONFIG_VIDEO_DA8XX
 #define CONFIG_VIDEO_LOGO
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_VIDEO_BMP_LOGO
 #define DA8XX_LCD_CNTL_BASE	LCD_CNTL_BASE
 #define PWM_TICKS	0x1388
diff --git a/include/configs/rut.h b/include/configs/rut.h
index 7e1e8f428e..66940033ab 100644
--- a/include/configs/rut.h
+++ b/include/configs/rut.h
@@ -108,7 +108,6 @@
 #if defined(CONFIG_VIDEO)
 #define CONFIG_VIDEO_DA8XX
 #define CONFIG_VIDEO_LOGO
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_VIDEO_BMP_LOGO
 #define DA8XX_LCD_CNTL_BASE	LCD_CNTL_BASE
 
diff --git a/include/configs/sandbox.h b/include/configs/sandbox.h
index 5554313810..e0708fe573 100644
--- a/include/configs/sandbox.h
+++ b/include/configs/sandbox.h
@@ -80,7 +80,6 @@
 #ifdef CONFIG_SANDBOX_SDL
 #define LCD_BPP			LCD_COLOR16
 #define CONFIG_LCD_BMP_RLE8
-#define CONFIG_VIDEO_BMP_RLE8
 
 #define CONFIG_KEYBOARD
 
diff --git a/include/configs/stm32f746-disco.h b/include/configs/stm32f746-disco.h
index 74abf95ce9..21cba767f2 100644
--- a/include/configs/stm32f746-disco.h
+++ b/include/configs/stm32f746-disco.h
@@ -77,7 +77,6 @@
 
 /* For splashcreen */
 #ifdef CONFIG_DM_VIDEO
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_BMP_16BPP
 #define CONFIG_BMP_24BPP
 #define CONFIG_BMP_32BPP
diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index b937233797..dc1d79011d 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -76,7 +76,6 @@
 #endif
 
 #ifdef CONFIG_DM_VIDEO
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_BMP_16BPP
 #define CONFIG_BMP_24BPP
 #define CONFIG_BMP_32BPP
diff --git a/include/configs/tbs2910.h b/include/configs/tbs2910.h
index 8092b9edfb..618cde4612 100644
--- a/include/configs/tbs2910.h
+++ b/include/configs/tbs2910.h
@@ -36,7 +36,6 @@
 #define CONFIG_MXC_UART_BASE		UART1_BASE /* select UART1/UART2 */
 
 /* Framebuffer */
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_IMX_HDMI
 #define CONFIG_IMX_VIDEO_SKIP
 
diff --git a/include/configs/wandboard.h b/include/configs/wandboard.h
index 5506c1a028..42be278b83 100644
--- a/include/configs/wandboard.h
+++ b/include/configs/wandboard.h
@@ -37,7 +37,6 @@
 #define CONFIG_MXC_USB_FLAGS		0
 
 /* Framebuffer */
-#define CONFIG_VIDEO_BMP_RLE8
 #define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index c13a366a56..460f01d138 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -4069,7 +4069,6 @@ CONFIG_VEXPRESS_ORIGINAL_MEMORY_MAP
 CONFIG_VID
 CONFIG_VIDEO_BCM2835
 CONFIG_VIDEO_BMP_LOGO
-CONFIG_VIDEO_BMP_RLE8
 CONFIG_VIDEO_CORALP
 CONFIG_VIDEO_DA8XX
 CONFIG_VIDEO_FONT_4X6
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
