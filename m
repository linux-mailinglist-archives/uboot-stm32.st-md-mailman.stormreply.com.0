Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C32927AAC9
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Sep 2020 11:31:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42F12C36B37;
	Mon, 28 Sep 2020 09:31:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F662C36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Sep 2020 09:31:42 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08S9N4AF021141; Mon, 28 Sep 2020 11:30:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=4LgQYqr5cmG/oJykp2I8qQiyf/kDM1/DzGsTlJCKlFs=;
 b=GM1vYCZqc2uN309xiqaBN5i3dxsk/PPjSBpy3+pA9H+EviT4C3CSEV276odc/sTsuQ2w
 0RLobi/35Lr/pcG9YMuEi+uBndUk1m5plX/GjsJ/69uNxXXIg/FoJKXnr4/JLAs2pz8j
 KzMvPbsjVq21AMOzgK3IO1o7pfPc/Vm5QtQbpC8t1deNhVeS+JXFR8Oj5Fgro3Wgn/fp
 HTOpxjOhL9oSUaYUfQo7K1kpcHwMnby2gexKxFiTZNHPX8Vp6bnGvvu2nhc659tuVNzT
 Ai+pD36oR7KEd+dtF9lOQPi2zou6w5gq+fn8jgA+5fkJa0cEapA3gSElw6Gku0lq3KE5 Kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33sudv9r90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Sep 2020 11:30:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7D58410002A;
 Mon, 28 Sep 2020 11:30:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E66A32AD2B3;
 Mon, 28 Sep 2020 11:30:20 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 28 Sep 2020 11:30:20 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 28 Sep 2020 11:30:16 +0200
Message-ID: <20200928093017.19053-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928093017.19053-1-patrick.delaunay@st.com>
References: <20200928093017.19053-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-28_07:2020-09-24,
 2020-09-28 signatures=0
Cc: Baruch Siach <baruch@tkos.co.il>, Neil Armstrong <narmstrong@baylibre.com>,
 Adrian Alonso <adrian.alonso@nxp.com>,
 Vanessa Maegima <vanessa.maegima@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 Stefan Bosch <stefan_b@posteo.net>, Joe
 Hershberger <joe.hershberger@ni.com>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Klaus Goger <klaus.goger@theobroma-systems.com>,
 =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>,
 Ken Lin <Ken.Lin@advantech.com.tw>, uboot-stm32@st-md-mailman.stormreply.com,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Richard Hu <richard.hu@technexion.com>, Marek Vasut <marex@denx.de>, Stefan
 Roese <sr@denx.de>, Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, u-boot-amlogic@groups.io,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Liu <jason.hui.liu@nxp.com>,
 Anatolij Gustschin <agust@denx.de>, Vikas Manocha <vikas.manocha@st.com>,
 Otavio Salvador <otavio@ossystems.com.br>, Ashok Reddy
 Soma <ashok.reddy.soma@xilinx.com>, Troy Kisky <troy.kisky@boundarydevices.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Akshay Bhat <akshaybhat@timesys.com>,
 Adam Ford <aford173@gmail.com>,
 =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>,
 Stefano Babic <sbabic@denx.de>, Olaf Mandel <o.mandel@menlosystems.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>, Heiko Schocher <hs@denx.de>,
 Simon Glass <sjg@chromium.org>, Holger
 Brunck <holger.brunck@ch.abb.com>, Fabio Estevam <fabio.estevam@nxp.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: [Uboot-stm32] [PATCH 3/3] configs: migrate CONFIG_BMP_16/24/32BPP
	to defconfigs
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
./tools/moveconfig.py BMP_16BPP BMP_24BPP BMP_32BPP

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 configs/apalis_imx6_defconfig                  |  1 +
 configs/aristainetos2_defconfig                |  1 +
 configs/aristainetos2b_defconfig               |  1 +
 configs/aristainetos2bcsl_defconfig            |  1 +
 configs/aristainetos2c_defconfig               |  1 +
 configs/cgtqmx6eval_defconfig                  |  1 +
 configs/colibri-imx6ull_defconfig              |  1 +
 configs/colibri_imx6_defconfig                 |  1 +
 configs/colibri_imx7_defconfig                 |  1 +
 configs/colibri_imx7_emmc_defconfig            |  1 +
 configs/imx6dl_icore_nand_defconfig            |  1 +
 configs/imx6q_icore_nand_defconfig             |  1 +
 configs/imx6qdl_icore_mmc_defconfig            |  1 +
 configs/imx6qdl_icore_nand_defconfig           |  1 +
 configs/imxrt1050-evk_defconfig                |  1 +
 configs/khadas-vim3_defconfig                  |  3 +++
 configs/khadas-vim3l_defconfig                 |  3 +++
 configs/libretech-ac_defconfig                 |  3 +++
 configs/libretech-cc_defconfig                 |  3 +++
 configs/libretech-s905d-pc_defconfig           |  3 +++
 configs/libretech-s912-pc_defconfig            |  3 +++
 configs/m53menlo_defconfig                     |  1 +
 configs/marsboard_defconfig                    |  1 +
 configs/mx6cuboxi_defconfig                    |  1 +
 configs/mx6qsabrelite_defconfig                |  1 +
 configs/mx6sabreauto_defconfig                 |  1 +
 configs/mx6sabresd_defconfig                   |  1 +
 configs/mx6ul_14x14_evk_defconfig              |  1 +
 configs/mx6ul_9x9_evk_defconfig                |  1 +
 configs/nitrogen6dl2g_defconfig                |  1 +
 configs/nitrogen6dl_defconfig                  |  1 +
 configs/nitrogen6q2g_defconfig                 |  1 +
 configs/nitrogen6q_defconfig                   |  1 +
 configs/nitrogen6s1g_defconfig                 |  1 +
 configs/nitrogen6s_defconfig                   |  1 +
 configs/novena_defconfig                       |  1 +
 configs/odroid-c2_defconfig                    |  3 +++
 configs/odroid-c4_defconfig                    |  3 +++
 configs/odroid-n2_defconfig                    |  3 +++
 configs/opos6uldev_defconfig                   |  3 +++
 configs/pico-dwarf-imx7d_defconfig             |  1 +
 configs/pico-hobbit-imx7d_defconfig            |  1 +
 configs/pico-imx6_defconfig                    |  1 +
 configs/pico-imx7d_bl33_defconfig              |  1 +
 configs/pico-imx7d_defconfig                   |  1 +
 configs/pico-nymph-imx7d_defconfig             |  1 +
 configs/pico-pi-imx7d_defconfig                |  1 +
 configs/puma-rk3399_defconfig                  |  3 +++
 configs/riotboard_defconfig                    |  1 +
 configs/riotboard_spl_defconfig                |  1 +
 configs/s5p4418_nanopi2_defconfig              |  1 +
 configs/sei510_defconfig                       |  3 +++
 configs/sei610_defconfig                       |  3 +++
 configs/stm32f746-disco_defconfig              |  3 +++
 configs/stm32f769-disco_defconfig              |  3 +++
 configs/stm32mp15_basic_defconfig              |  3 +++
 configs/stm32mp15_dhcom_basic_defconfig        |  3 +++
 configs/stm32mp15_dhcor_basic_defconfig        |  3 +++
 configs/stm32mp15_trusted_defconfig            |  3 +++
 ...rable-x86-conga-qa3-e3845-pcie-x4_defconfig |  1 +
 .../theadorable-x86-conga-qa3-e3845_defconfig  |  1 +
 configs/theadorable-x86-dfi-bt700_defconfig    |  1 +
 configs/theadorable_debug_defconfig            |  3 +++
 configs/wandboard_defconfig                    |  1 +
 drivers/video/Kconfig                          | 18 ++++++++++++++++++
 include/configs/advantech_dms-ba16.h           |  1 -
 include/configs/apalis_imx6.h                  |  1 -
 include/configs/aristainetos2.h                |  1 -
 include/configs/cgtqmx6eval.h                  |  1 -
 include/configs/colibri-imx6ull.h              |  1 -
 include/configs/colibri_imx6.h                 |  1 -
 include/configs/colibri_imx7.h                 |  1 -
 include/configs/embestmx6boards.h              |  1 -
 include/configs/imx6-engicam.h                 |  1 -
 include/configs/imxrt1050-evk.h                |  1 -
 include/configs/m53menlo.h                     |  1 -
 include/configs/meson64.h                      |  3 ---
 include/configs/mx23evk.h                      |  1 -
 include/configs/mx28evk.h                      |  1 -
 include/configs/mx51evk.h                      |  1 -
 include/configs/mx53loco.h                     |  1 -
 include/configs/mx6cuboxi.h                    |  1 -
 include/configs/mx6sabre_common.h              |  1 -
 include/configs/mx6sxsabresd.h                 |  1 -
 include/configs/mx6ul_14x14_evk.h              |  1 -
 include/configs/mx7dsabresd.h                  |  1 -
 include/configs/nitrogen6x.h                   |  1 -
 include/configs/novena.h                       |  1 -
 include/configs/opos6uldev.h                   |  3 ---
 include/configs/pico-imx6.h                    |  1 -
 include/configs/pico-imx6ul.h                  |  1 -
 include/configs/pico-imx7d.h                   |  1 -
 include/configs/puma_rk3399.h                  |  4 ----
 include/configs/s5p4418_nanopi2.h              |  5 -----
 include/configs/s5pc210_universal.h            |  1 -
 include/configs/stm32f746-disco.h              |  5 -----
 include/configs/stm32mp1.h                     |  6 ------
 include/configs/theadorable-x86-common.h       |  1 -
 include/configs/theadorable.h                  |  4 ----
 include/configs/trats.h                        |  1 -
 include/configs/trats2.h                       |  1 -
 include/configs/wandboard.h                    |  1 -
 scripts/config_whitelist.txt                   |  3 ---
 103 files changed, 122 insertions(+), 63 deletions(-)

diff --git a/configs/apalis_imx6_defconfig b/configs/apalis_imx6_defconfig
index 1c2f8267ba..27ad8a65cb 100644
--- a/configs/apalis_imx6_defconfig
+++ b/configs/apalis_imx6_defconfig
@@ -107,4 +107,5 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/aristainetos2_defconfig b/configs/aristainetos2_defconfig
index b895c5282f..77da70b539 100644
--- a/configs/aristainetos2_defconfig
+++ b/configs/aristainetos2_defconfig
@@ -115,5 +115,6 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
 CONFIG_IMX_WATCHDOG=y
 # CONFIG_EFI_LOADER is not set
diff --git a/configs/aristainetos2b_defconfig b/configs/aristainetos2b_defconfig
index 5d60cf29b8..180c08b8ae 100644
--- a/configs/aristainetos2b_defconfig
+++ b/configs/aristainetos2b_defconfig
@@ -109,5 +109,6 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
 CONFIG_IMX_WATCHDOG=y
 # CONFIG_EFI_LOADER is not set
diff --git a/configs/aristainetos2bcsl_defconfig b/configs/aristainetos2bcsl_defconfig
index 350c754954..42dd85f82c 100644
--- a/configs/aristainetos2bcsl_defconfig
+++ b/configs/aristainetos2bcsl_defconfig
@@ -109,5 +109,6 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
 CONFIG_IMX_WATCHDOG=y
 # CONFIG_EFI_LOADER is not set
diff --git a/configs/aristainetos2c_defconfig b/configs/aristainetos2c_defconfig
index e4b22323e7..213de32ebb 100644
--- a/configs/aristainetos2c_defconfig
+++ b/configs/aristainetos2c_defconfig
@@ -115,5 +115,6 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
 CONFIG_IMX_WATCHDOG=y
 # CONFIG_EFI_LOADER is not set
diff --git a/configs/cgtqmx6eval_defconfig b/configs/cgtqmx6eval_defconfig
index c69c305ac3..edc06e98dc 100644
--- a/configs/cgtqmx6eval_defconfig
+++ b/configs/cgtqmx6eval_defconfig
@@ -94,4 +94,5 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
 CONFIG_OF_LIBFDT=y
diff --git a/configs/colibri-imx6ull_defconfig b/configs/colibri-imx6ull_defconfig
index 9c930fe1b4..b64bb89b3a 100644
--- a/configs/colibri-imx6ull_defconfig
+++ b/configs/colibri-imx6ull_defconfig
@@ -97,5 +97,6 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
 CONFIG_OF_LIBFDT_OVERLAY=y
 CONFIG_FDT_FIXUP_PARTITIONS=y
diff --git a/configs/colibri_imx6_defconfig b/configs/colibri_imx6_defconfig
index 25b6668391..e930dcb284 100644
--- a/configs/colibri_imx6_defconfig
+++ b/configs/colibri_imx6_defconfig
@@ -105,4 +105,5 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/colibri_imx7_defconfig b/configs/colibri_imx7_defconfig
index 31c456b7b1..9e9d6944cf 100644
--- a/configs/colibri_imx7_defconfig
+++ b/configs/colibri_imx7_defconfig
@@ -96,5 +96,6 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
 CONFIG_OF_LIBFDT_OVERLAY=y
 CONFIG_FDT_FIXUP_PARTITIONS=y
diff --git a/configs/colibri_imx7_emmc_defconfig b/configs/colibri_imx7_emmc_defconfig
index a8728c8c91..5426a4cf03 100644
--- a/configs/colibri_imx7_emmc_defconfig
+++ b/configs/colibri_imx7_emmc_defconfig
@@ -92,4 +92,5 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/imx6dl_icore_nand_defconfig b/configs/imx6dl_icore_nand_defconfig
index 770aa9a4d4..cbbda07d64 100644
--- a/configs/imx6dl_icore_nand_defconfig
+++ b/configs/imx6dl_icore_nand_defconfig
@@ -67,3 +67,4 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
diff --git a/configs/imx6q_icore_nand_defconfig b/configs/imx6q_icore_nand_defconfig
index 11fd7178f9..6af81f5754 100644
--- a/configs/imx6q_icore_nand_defconfig
+++ b/configs/imx6q_icore_nand_defconfig
@@ -68,3 +68,4 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
diff --git a/configs/imx6qdl_icore_mmc_defconfig b/configs/imx6qdl_icore_mmc_defconfig
index 7aef7873b4..809878dd3f 100644
--- a/configs/imx6qdl_icore_mmc_defconfig
+++ b/configs/imx6qdl_icore_mmc_defconfig
@@ -84,4 +84,5 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
 CONFIG_IMX_WATCHDOG=y
diff --git a/configs/imx6qdl_icore_nand_defconfig b/configs/imx6qdl_icore_nand_defconfig
index 11fd7178f9..6af81f5754 100644
--- a/configs/imx6qdl_icore_nand_defconfig
+++ b/configs/imx6qdl_icore_nand_defconfig
@@ -68,3 +68,4 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
index eb26bca269..7261382811 100644
--- a/configs/imxrt1050-evk_defconfig
+++ b/configs/imxrt1050-evk_defconfig
@@ -71,6 +71,7 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
 CONFIG_SHA1=y
 CONFIG_SHA256=y
 CONFIG_HEXDUMP=y
diff --git a/configs/khadas-vim3_defconfig b/configs/khadas-vim3_defconfig
index 6a4fafe585..bb947f5944 100644
--- a/configs/khadas-vim3_defconfig
+++ b/configs/khadas-vim3_defconfig
@@ -74,4 +74,7 @@ CONFIG_VIDEO_DT_SIMPLEFB=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/khadas-vim3l_defconfig b/configs/khadas-vim3l_defconfig
index f33f6a6dd0..59ab35e5fd 100644
--- a/configs/khadas-vim3l_defconfig
+++ b/configs/khadas-vim3l_defconfig
@@ -74,4 +74,7 @@ CONFIG_VIDEO_DT_SIMPLEFB=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/libretech-ac_defconfig b/configs/libretech-ac_defconfig
index 70451c48fd..53836f1e27 100644
--- a/configs/libretech-ac_defconfig
+++ b/configs/libretech-ac_defconfig
@@ -84,4 +84,7 @@ CONFIG_VIDEO_DT_SIMPLEFB=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/libretech-cc_defconfig b/configs/libretech-cc_defconfig
index 8dbea40b68..3f7462f5c0 100644
--- a/configs/libretech-cc_defconfig
+++ b/configs/libretech-cc_defconfig
@@ -67,4 +67,7 @@ CONFIG_VIDEO_DT_SIMPLEFB=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/libretech-s905d-pc_defconfig b/configs/libretech-s905d-pc_defconfig
index a3eeb6308e..12a5a8e97d 100644
--- a/configs/libretech-s905d-pc_defconfig
+++ b/configs/libretech-s905d-pc_defconfig
@@ -77,4 +77,7 @@ CONFIG_VIDEO_DT_SIMPLEFB=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/libretech-s912-pc_defconfig b/configs/libretech-s912-pc_defconfig
index 19b7be90b0..377d519bd9 100644
--- a/configs/libretech-s912-pc_defconfig
+++ b/configs/libretech-s912-pc_defconfig
@@ -76,4 +76,7 @@ CONFIG_VIDEO_DT_SIMPLEFB=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/m53menlo_defconfig b/configs/m53menlo_defconfig
index 57977e5e86..6dd53f9cea 100644
--- a/configs/m53menlo_defconfig
+++ b/configs/m53menlo_defconfig
@@ -106,5 +106,6 @@ CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_SPLASH_SOURCE=y
 CONFIG_VIDEO_BMP_GZIP=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
 CONFIG_WATCHDOG_TIMEOUT_MSECS=8000
 CONFIG_IMX_WATCHDOG=y
diff --git a/configs/marsboard_defconfig b/configs/marsboard_defconfig
index 6ddd6ba862..1bf329fb8d 100644
--- a/configs/marsboard_defconfig
+++ b/configs/marsboard_defconfig
@@ -53,4 +53,5 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
 CONFIG_OF_LIBFDT=y
diff --git a/configs/mx6cuboxi_defconfig b/configs/mx6cuboxi_defconfig
index db5af85955..802e731931 100644
--- a/configs/mx6cuboxi_defconfig
+++ b/configs/mx6cuboxi_defconfig
@@ -81,3 +81,4 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
diff --git a/configs/mx6qsabrelite_defconfig b/configs/mx6qsabrelite_defconfig
index 6e5cd098cd..2f10faa92b 100644
--- a/configs/mx6qsabrelite_defconfig
+++ b/configs/mx6qsabrelite_defconfig
@@ -84,3 +84,4 @@ CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_GZIP=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
diff --git a/configs/mx6sabreauto_defconfig b/configs/mx6sabreauto_defconfig
index 47dfd0cb63..9f97d6cb19 100644
--- a/configs/mx6sabreauto_defconfig
+++ b/configs/mx6sabreauto_defconfig
@@ -108,3 +108,4 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
diff --git a/configs/mx6sabresd_defconfig b/configs/mx6sabresd_defconfig
index 3a08398303..179fb33b97 100644
--- a/configs/mx6sabresd_defconfig
+++ b/configs/mx6sabresd_defconfig
@@ -117,3 +117,4 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
diff --git a/configs/mx6ul_14x14_evk_defconfig b/configs/mx6ul_14x14_evk_defconfig
index af1805daab..846f73b49f 100644
--- a/configs/mx6ul_14x14_evk_defconfig
+++ b/configs/mx6ul_14x14_evk_defconfig
@@ -93,3 +93,4 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
diff --git a/configs/mx6ul_9x9_evk_defconfig b/configs/mx6ul_9x9_evk_defconfig
index b28863e92c..0bbd26bafb 100644
--- a/configs/mx6ul_9x9_evk_defconfig
+++ b/configs/mx6ul_9x9_evk_defconfig
@@ -83,3 +83,4 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
diff --git a/configs/nitrogen6dl2g_defconfig b/configs/nitrogen6dl2g_defconfig
index aff1ea35fa..46042dd10a 100644
--- a/configs/nitrogen6dl2g_defconfig
+++ b/configs/nitrogen6dl2g_defconfig
@@ -85,3 +85,4 @@ CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_GZIP=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
diff --git a/configs/nitrogen6dl_defconfig b/configs/nitrogen6dl_defconfig
index f726834aa9..a8834c5b57 100644
--- a/configs/nitrogen6dl_defconfig
+++ b/configs/nitrogen6dl_defconfig
@@ -85,3 +85,4 @@ CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_GZIP=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
diff --git a/configs/nitrogen6q2g_defconfig b/configs/nitrogen6q2g_defconfig
index cab0426995..397cc5cd25 100644
--- a/configs/nitrogen6q2g_defconfig
+++ b/configs/nitrogen6q2g_defconfig
@@ -87,3 +87,4 @@ CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_GZIP=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
diff --git a/configs/nitrogen6q_defconfig b/configs/nitrogen6q_defconfig
index eb517201ea..9b05490af4 100644
--- a/configs/nitrogen6q_defconfig
+++ b/configs/nitrogen6q_defconfig
@@ -87,3 +87,4 @@ CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_GZIP=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
diff --git a/configs/nitrogen6s1g_defconfig b/configs/nitrogen6s1g_defconfig
index 47a622a36a..d18a4e82fc 100644
--- a/configs/nitrogen6s1g_defconfig
+++ b/configs/nitrogen6s1g_defconfig
@@ -85,3 +85,4 @@ CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_GZIP=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
diff --git a/configs/nitrogen6s_defconfig b/configs/nitrogen6s_defconfig
index 9d20369363..e5dd9538ac 100644
--- a/configs/nitrogen6s_defconfig
+++ b/configs/nitrogen6s_defconfig
@@ -85,3 +85,4 @@ CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_GZIP=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
diff --git a/configs/novena_defconfig b/configs/novena_defconfig
index 7fb70e8fcd..4368ab96bd 100644
--- a/configs/novena_defconfig
+++ b/configs/novena_defconfig
@@ -81,3 +81,4 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
diff --git a/configs/odroid-c2_defconfig b/configs/odroid-c2_defconfig
index 17cee882cc..76eb583f5d 100644
--- a/configs/odroid-c2_defconfig
+++ b/configs/odroid-c2_defconfig
@@ -60,5 +60,8 @@ CONFIG_VIDEO_DT_SIMPLEFB=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
 CONFIG_OF_LIBFDT_OVERLAY=y
 CONFIG_SMBIOS_MANUFACTURER="Hardkernel Co., Ltd."
diff --git a/configs/odroid-c4_defconfig b/configs/odroid-c4_defconfig
index 58961a6d54..0969d0de6d 100644
--- a/configs/odroid-c4_defconfig
+++ b/configs/odroid-c4_defconfig
@@ -65,4 +65,7 @@ CONFIG_VIDEO_DT_SIMPLEFB=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/odroid-n2_defconfig b/configs/odroid-n2_defconfig
index 7e20462eea..055c95d619 100644
--- a/configs/odroid-n2_defconfig
+++ b/configs/odroid-n2_defconfig
@@ -63,4 +63,7 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_MESON=y
 CONFIG_VIDEO_DT_SIMPLEFB=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/opos6uldev_defconfig b/configs/opos6uldev_defconfig
index 5e06ee0d21..e0fdab7bb0 100644
--- a/configs/opos6uldev_defconfig
+++ b/configs/opos6uldev_defconfig
@@ -110,5 +110,8 @@ CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_SPLASH_SOURCE=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
 CONFIG_OF_LIBFDT_OVERLAY=y
 # CONFIG_EFI_LOADER is not set
diff --git a/configs/pico-dwarf-imx7d_defconfig b/configs/pico-dwarf-imx7d_defconfig
index c2890a9169..c1ebf9936d 100644
--- a/configs/pico-dwarf-imx7d_defconfig
+++ b/configs/pico-dwarf-imx7d_defconfig
@@ -81,3 +81,4 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
diff --git a/configs/pico-hobbit-imx7d_defconfig b/configs/pico-hobbit-imx7d_defconfig
index fab1bdd99c..57d5f722b4 100644
--- a/configs/pico-hobbit-imx7d_defconfig
+++ b/configs/pico-hobbit-imx7d_defconfig
@@ -81,3 +81,4 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
diff --git a/configs/pico-imx6_defconfig b/configs/pico-imx6_defconfig
index dd9fbe4a6d..cc0cae88b3 100644
--- a/configs/pico-imx6_defconfig
+++ b/configs/pico-imx6_defconfig
@@ -91,3 +91,4 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
diff --git a/configs/pico-imx7d_bl33_defconfig b/configs/pico-imx7d_bl33_defconfig
index da61b0c221..1595c7f1ca 100644
--- a/configs/pico-imx7d_bl33_defconfig
+++ b/configs/pico-imx7d_bl33_defconfig
@@ -77,4 +77,5 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/pico-imx7d_defconfig b/configs/pico-imx7d_defconfig
index 962a2cd619..ae4d022909 100644
--- a/configs/pico-imx7d_defconfig
+++ b/configs/pico-imx7d_defconfig
@@ -81,3 +81,4 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
diff --git a/configs/pico-nymph-imx7d_defconfig b/configs/pico-nymph-imx7d_defconfig
index c2890a9169..c1ebf9936d 100644
--- a/configs/pico-nymph-imx7d_defconfig
+++ b/configs/pico-nymph-imx7d_defconfig
@@ -81,3 +81,4 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
diff --git a/configs/pico-pi-imx7d_defconfig b/configs/pico-pi-imx7d_defconfig
index a0d9f18721..6d3d92df54 100644
--- a/configs/pico-pi-imx7d_defconfig
+++ b/configs/pico-pi-imx7d_defconfig
@@ -81,3 +81,4 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
diff --git a/configs/puma-rk3399_defconfig b/configs/puma-rk3399_defconfig
index 2849ee4d12..99e4fe4cbb 100644
--- a/configs/puma-rk3399_defconfig
+++ b/configs/puma-rk3399_defconfig
@@ -95,4 +95,7 @@ CONFIG_DM_VIDEO=y
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_ROCKCHIP=y
 CONFIG_DISPLAY_ROCKCHIP_HDMI=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
 CONFIG_ERRNO_STR=y
diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
index 711856b1c1..8663d31fd4 100644
--- a/configs/riotboard_defconfig
+++ b/configs/riotboard_defconfig
@@ -54,4 +54,5 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
 CONFIG_OF_LIBFDT=y
diff --git a/configs/riotboard_spl_defconfig b/configs/riotboard_spl_defconfig
index 33c53de179..42d737771c 100644
--- a/configs/riotboard_spl_defconfig
+++ b/configs/riotboard_spl_defconfig
@@ -64,5 +64,6 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
 CONFIG_OF_LIBFDT=y
 CONFIG_SPL_OF_LIBFDT=y
diff --git a/configs/s5p4418_nanopi2_defconfig b/configs/s5p4418_nanopi2_defconfig
index 3b2169195c..771e88e41b 100644
--- a/configs/s5p4418_nanopi2_defconfig
+++ b/configs/s5p4418_nanopi2_defconfig
@@ -55,4 +55,5 @@ CONFIG_VIDEO_NX_HDMI=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_SPLASH_SOURCE=y
+CONFIG_BMP_24BPP=y
 CONFIG_ERRNO_STR=y
diff --git a/configs/sei510_defconfig b/configs/sei510_defconfig
index 137457f7b4..db5bc59d27 100644
--- a/configs/sei510_defconfig
+++ b/configs/sei510_defconfig
@@ -81,4 +81,7 @@ CONFIG_VIDEO_DT_SIMPLEFB=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/sei610_defconfig b/configs/sei610_defconfig
index 6c57e561f9..7745476f25 100644
--- a/configs/sei610_defconfig
+++ b/configs/sei610_defconfig
@@ -81,4 +81,7 @@ CONFIG_VIDEO_DT_SIMPLEFB=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/stm32f746-disco_defconfig b/configs/stm32f746-disco_defconfig
index a3f4b5c93f..03b7e7dd2d 100644
--- a/configs/stm32f746-disco_defconfig
+++ b/configs/stm32f746-disco_defconfig
@@ -63,4 +63,7 @@ CONFIG_VIDEO_STM32_MAX_YRES=640
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/stm32f769-disco_defconfig b/configs/stm32f769-disco_defconfig
index 5192bf11d9..3059714666 100644
--- a/configs/stm32f769-disco_defconfig
+++ b/configs/stm32f769-disco_defconfig
@@ -65,4 +65,7 @@ CONFIG_VIDEO_STM32_MAX_YRES=800
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
 CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index dc02d1011f..ce7225cee1 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -150,6 +150,9 @@ CONFIG_VIDEO_STM32_DSI=y
 CONFIG_VIDEO_STM32_MAX_XRES=1280
 CONFIG_VIDEO_STM32_MAX_YRES=800
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
 CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
 CONFIG_ERRNO_STR=y
diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
index e6d712ccf6..d7b4cd76c8 100644
--- a/configs/stm32mp15_dhcom_basic_defconfig
+++ b/configs/stm32mp15_dhcom_basic_defconfig
@@ -149,5 +149,8 @@ CONFIG_VIDEO_STM32_DSI=y
 CONFIG_VIDEO_STM32_MAX_XRES=1280
 CONFIG_VIDEO_STM32_MAX_YRES=800
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
 CONFIG_LZO=y
 CONFIG_FDT_FIXUP_PARTITIONS=y
diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
index 5e549ff248..a6620561ac 100644
--- a/configs/stm32mp15_dhcor_basic_defconfig
+++ b/configs/stm32mp15_dhcor_basic_defconfig
@@ -143,5 +143,8 @@ CONFIG_VIDEO_STM32_DSI=y
 CONFIG_VIDEO_STM32_MAX_XRES=1280
 CONFIG_VIDEO_STM32_MAX_YRES=800
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
 CONFIG_LZO=y
 CONFIG_FDT_FIXUP_PARTITIONS=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 62958b7ed4..50288fe866 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -131,6 +131,9 @@ CONFIG_VIDEO_STM32_DSI=y
 CONFIG_VIDEO_STM32_MAX_XRES=1280
 CONFIG_VIDEO_STM32_MAX_YRES=800
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
 CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
 CONFIG_ERRNO_STR=y
diff --git a/configs/theadorable-x86-conga-qa3-e3845-pcie-x4_defconfig b/configs/theadorable-x86-conga-qa3-e3845-pcie-x4_defconfig
index 532863dff0..897d061416 100644
--- a/configs/theadorable-x86-conga-qa3-e3845-pcie-x4_defconfig
+++ b/configs/theadorable-x86-conga-qa3-e3845-pcie-x4_defconfig
@@ -67,4 +67,5 @@ CONFIG_USB_ETHER_RTL8152=y
 CONFIG_FRAMEBUFFER_SET_VESA_MODE=y
 CONFIG_FRAMEBUFFER_VESA_MODE_114=y
 CONFIG_CONSOLE_SCROLL_LINES=5
+CONFIG_BMP_16BPP=y
 # CONFIG_GZIP is not set
diff --git a/configs/theadorable-x86-conga-qa3-e3845_defconfig b/configs/theadorable-x86-conga-qa3-e3845_defconfig
index 8e5b6a5a5c..a8890eb4e8 100644
--- a/configs/theadorable-x86-conga-qa3-e3845_defconfig
+++ b/configs/theadorable-x86-conga-qa3-e3845_defconfig
@@ -66,4 +66,5 @@ CONFIG_USB_ETHER_RTL8152=y
 CONFIG_FRAMEBUFFER_SET_VESA_MODE=y
 CONFIG_FRAMEBUFFER_VESA_MODE_114=y
 CONFIG_CONSOLE_SCROLL_LINES=5
+CONFIG_BMP_16BPP=y
 # CONFIG_GZIP is not set
diff --git a/configs/theadorable-x86-dfi-bt700_defconfig b/configs/theadorable-x86-dfi-bt700_defconfig
index 28a5f98ef7..51aeaafe87 100644
--- a/configs/theadorable-x86-dfi-bt700_defconfig
+++ b/configs/theadorable-x86-dfi-bt700_defconfig
@@ -63,4 +63,5 @@ CONFIG_USB_ETHER_RTL8152=y
 CONFIG_FRAMEBUFFER_SET_VESA_MODE=y
 CONFIG_FRAMEBUFFER_VESA_MODE_114=y
 CONFIG_CONSOLE_SCROLL_LINES=5
+CONFIG_BMP_16BPP=y
 # CONFIG_GZIP is not set
diff --git a/configs/theadorable_debug_defconfig b/configs/theadorable_debug_defconfig
index 48fd12425f..dbf006b190 100644
--- a/configs/theadorable_debug_defconfig
+++ b/configs/theadorable_debug_defconfig
@@ -82,3 +82,6 @@ CONFIG_DM_VIDEO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_VIDEO_MVEBU=y
+CONFIG_BMP_16BPP=y
+CONFIG_BMP_24BPP=y
+CONFIG_BMP_32BPP=y
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index d7b5de66f4..357b075c2e 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -82,3 +82,4 @@ CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_VIDEO_BMP_RLE8=y
+CONFIG_BMP_16BPP=y
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 8df69f1496..b1cb745d59 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -954,4 +954,22 @@ config VIDEO_BMP_RLE8
 	  If this option is set, the 8-bit RLE compressed BMP images
 	  is supported.
 
+config BMP_16BPP
+	bool "16-bit-per-pixel BMP image support"
+	depends on DM_VIDEO || LCD
+	help
+	  Support display of bitmaps file with 16-bit-per-pixel
+
+config BMP_24BPP
+	bool "24-bit-per-pixel BMP image support"
+	depends on DM_VIDEO || LCD
+	help
+	  Support display of bitmaps file with 24-bit-per-pixel.
+
+config BMP_32BPP
+	bool "32-bit-per-pixel BMP image support"
+	depends on DM_VIDEO || LCD
+	help
+	  Support display of bitmaps file with 32-bit-per-pixel.
+
 endmenu
diff --git a/include/configs/advantech_dms-ba16.h b/include/configs/advantech_dms-ba16.h
index 8baa811166..1ecb7c9df8 100644
--- a/include/configs/advantech_dms-ba16.h
+++ b/include/configs/advantech_dms-ba16.h
@@ -197,7 +197,6 @@
 #define CONFIG_SYS_FSL_USDHC_NUM        3
 
 /* Framebuffer */
-#define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_IMX_HDMI
diff --git a/include/configs/apalis_imx6.h b/include/configs/apalis_imx6.h
index af903e0acd..0e81ef94d3 100644
--- a/include/configs/apalis_imx6.h
+++ b/include/configs/apalis_imx6.h
@@ -67,7 +67,6 @@
 
 /* Framebuffer and LCD */
 #define CONFIG_SYS_CONSOLE_OVERWRITE_ROUTINE
-#define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_IMX_HDMI
diff --git a/include/configs/aristainetos2.h b/include/configs/aristainetos2.h
index 223090409a..6e8595caad 100644
--- a/include/configs/aristainetos2.h
+++ b/include/configs/aristainetos2.h
@@ -441,7 +441,6 @@
 #define CONFIG_IMX_VIDEO_SKIP
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
-#define CONFIG_BMP_16BPP
 
 #define CONFIG_IMX6_PWM_PER_CLK	66000000
 
diff --git a/include/configs/cgtqmx6eval.h b/include/configs/cgtqmx6eval.h
index 9ee5eba748..2ef6bfdba8 100644
--- a/include/configs/cgtqmx6eval.h
+++ b/include/configs/cgtqmx6eval.h
@@ -60,7 +60,6 @@
 #define CONFIG_USBD_HS
 
 /* Framebuffer */
-#define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_IMX_HDMI
diff --git a/include/configs/colibri-imx6ull.h b/include/configs/colibri-imx6ull.h
index 1057619864..d373fda016 100644
--- a/include/configs/colibri-imx6ull.h
+++ b/include/configs/colibri-imx6ull.h
@@ -152,7 +152,6 @@
 #define CONFIG_VIDEO_MXS
 #define MXS_LCDIF_BASE MX6UL_LCDIF1_BASE_ADDR
 #define CONFIG_VIDEO_LOGO
-#define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_BMP_LOGO
 #endif
 
diff --git a/include/configs/colibri_imx6.h b/include/configs/colibri_imx6.h
index 4bdba6ce00..c014d6b2d5 100644
--- a/include/configs/colibri_imx6.h
+++ b/include/configs/colibri_imx6.h
@@ -55,7 +55,6 @@
 
 /* Framebuffer and LCD */
 #define CONFIG_SYS_CONSOLE_OVERWRITE_ROUTINE
-#define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_IMX_HDMI
diff --git a/include/configs/colibri_imx7.h b/include/configs/colibri_imx7.h
index 55f55cb613..b3601abe2c 100644
--- a/include/configs/colibri_imx7.h
+++ b/include/configs/colibri_imx7.h
@@ -215,7 +215,6 @@
 #if defined(CONFIG_VIDEO) || defined(CONFIG_DM_VIDEO)
 #define CONFIG_VIDEO_MXS
 #define CONFIG_VIDEO_LOGO
-#define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_BMP_LOGO
 #endif
 
diff --git a/include/configs/embestmx6boards.h b/include/configs/embestmx6boards.h
index cf94fbb2b0..b18db76d2f 100644
--- a/include/configs/embestmx6boards.h
+++ b/include/configs/embestmx6boards.h
@@ -72,7 +72,6 @@
 #endif
 
 /* Framebuffer */
-#define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_IMX_HDMI
diff --git a/include/configs/imx6-engicam.h b/include/configs/imx6-engicam.h
index 954425dbb0..bfe83b8cba 100644
--- a/include/configs/imx6-engicam.h
+++ b/include/configs/imx6-engicam.h
@@ -165,7 +165,6 @@
 #ifdef CONFIG_VIDEO_IPUV3
 # define CONFIG_IMX_VIDEO_SKIP
 
-# define CONFIG_BMP_16BPP
 # define CONFIG_VIDEO_LOGO
 # define CONFIG_VIDEO_BMP_LOGO
 #endif
diff --git a/include/configs/imxrt1050-evk.h b/include/configs/imxrt1050-evk.h
index 31f8ef4e0a..c8d661fb3e 100644
--- a/include/configs/imxrt1050-evk.h
+++ b/include/configs/imxrt1050-evk.h
@@ -31,7 +31,6 @@
 #ifdef CONFIG_DM_VIDEO
 #define CONFIG_VIDEO_MXS
 #define CONFIG_VIDEO_LOGO
-#define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_BMP_LOGO
 
 #define CONFIG_EXTRA_ENV_SETTINGS \
diff --git a/include/configs/m53menlo.h b/include/configs/m53menlo.h
index 4bc64f5af6..52c95de523 100644
--- a/include/configs/m53menlo.h
+++ b/include/configs/m53menlo.h
@@ -126,7 +126,6 @@
 /*
  * LCD
  */
-#define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_SYS_VIDEO_LOGO_MAX_SIZE	(2 << 20)
 
diff --git a/include/configs/meson64.h b/include/configs/meson64.h
index 77f73b4b17..cee6900680 100644
--- a/include/configs/meson64.h
+++ b/include/configs/meson64.h
@@ -18,9 +18,6 @@
 
 /* For splashscreen */
 #ifdef CONFIG_DM_VIDEO
-#define CONFIG_BMP_16BPP
-#define CONFIG_BMP_24BPP
-#define CONFIG_BMP_32BPP
 #define STDOUT_CFG "vidconsole,serial"
 #else
 #define STDOUT_CFG "serial"
diff --git a/include/configs/mx23evk.h b/include/configs/mx23evk.h
index 5ba1a3916c..3f13e60531 100644
--- a/include/configs/mx23evk.h
+++ b/include/configs/mx23evk.h
@@ -31,7 +31,6 @@
 /* Framebuffer support */
 #ifdef CONFIG_VIDEO
 #define CONFIG_VIDEO_LOGO
-#define CONFIG_BMP_16BPP
 #define CONFIG_SYS_VIDEO_LOGO_MAX_SIZE	(512 << 10)
 #endif
 
diff --git a/include/configs/mx28evk.h b/include/configs/mx28evk.h
index 236b25e075..a65df48608 100644
--- a/include/configs/mx28evk.h
+++ b/include/configs/mx28evk.h
@@ -52,7 +52,6 @@
 /* Framebuffer support */
 #ifdef CONFIG_VIDEO
 #define CONFIG_VIDEO_LOGO
-#define CONFIG_BMP_16BPP
 #define CONFIG_SYS_VIDEO_LOGO_MAX_SIZE	(512 << 10)
 #endif
 
diff --git a/include/configs/mx51evk.h b/include/configs/mx51evk.h
index e7e301e1d3..49f88c27dc 100644
--- a/include/configs/mx51evk.h
+++ b/include/configs/mx51evk.h
@@ -65,7 +65,6 @@
 #define CONFIG_MXC_USB_FLAGS	MXC_EHCI_POWER_PINS_ENABLED
 
 /* Framebuffer and LCD */
-#define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 
 #define CONFIG_ETHPRIME		"FEC0"
diff --git a/include/configs/mx53loco.h b/include/configs/mx53loco.h
index 23250fd879..a0dd33aecd 100644
--- a/include/configs/mx53loco.h
+++ b/include/configs/mx53loco.h
@@ -176,7 +176,6 @@
 #endif
 
 /* Framebuffer and LCD */
-#define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 
 #endif				/* __CONFIG_H */
diff --git a/include/configs/mx6cuboxi.h b/include/configs/mx6cuboxi.h
index 4f7eda2eef..cfab9a7fc0 100644
--- a/include/configs/mx6cuboxi.h
+++ b/include/configs/mx6cuboxi.h
@@ -29,7 +29,6 @@
 #endif
 
 /* Framebuffer */
-#define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_IMX_HDMI
diff --git a/include/configs/mx6sabre_common.h b/include/configs/mx6sabre_common.h
index 898aa96213..c4e34e9cbc 100644
--- a/include/configs/mx6sabre_common.h
+++ b/include/configs/mx6sabre_common.h
@@ -169,7 +169,6 @@
 /* Environment organization */
 
 /* Framebuffer */
-#define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_IMX_HDMI
diff --git a/include/configs/mx6sxsabresd.h b/include/configs/mx6sxsabresd.h
index e041284d3c..42feb14019 100644
--- a/include/configs/mx6sxsabresd.h
+++ b/include/configs/mx6sxsabresd.h
@@ -176,7 +176,6 @@
 #ifdef CONFIG_VIDEO
 #define CONFIG_VIDEO_MXS
 #define CONFIG_VIDEO_LOGO
-#define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_BMP_LOGO
 #define MXS_LCDIF_BASE MX6SX_LCDIF1_BASE_ADDR
 #endif
diff --git a/include/configs/mx6ul_14x14_evk.h b/include/configs/mx6ul_14x14_evk.h
index 4e2c3d769f..fa6b303dd4 100644
--- a/include/configs/mx6ul_14x14_evk.h
+++ b/include/configs/mx6ul_14x14_evk.h
@@ -183,7 +183,6 @@
 #if defined(CONFIG_DM_VIDEO)
 #define CONFIG_VIDEO_MXS
 #define CONFIG_VIDEO_LOGO
-#define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_BMP_LOGO
 #define MXS_LCDIF_BASE MX6UL_LCDIF1_BASE_ADDR
 #endif
diff --git a/include/configs/mx7dsabresd.h b/include/configs/mx7dsabresd.h
index 668c9943a5..51a7a5f4a0 100644
--- a/include/configs/mx7dsabresd.h
+++ b/include/configs/mx7dsabresd.h
@@ -141,7 +141,6 @@
 #ifdef CONFIG_VIDEO
 #define CONFIG_VIDEO_MXS
 #define CONFIG_VIDEO_LOGO
-#define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_BMP_LOGO
 #endif
 
diff --git a/include/configs/nitrogen6x.h b/include/configs/nitrogen6x.h
index 5c80696e86..6448ea891f 100644
--- a/include/configs/nitrogen6x.h
+++ b/include/configs/nitrogen6x.h
@@ -57,7 +57,6 @@
 
 /* Framebuffer and LCD */
 #define CONFIG_SYS_VIDEO_LOGO_MAX_SIZE (6 * 1024 * 1024)
-#define CONFIG_BMP_16BPP
 #define CONFIG_IMX_HDMI
 #define CONFIG_IMX_VIDEO_SKIP
 
diff --git a/include/configs/novena.h b/include/configs/novena.h
index e0f8b3535e..2b0a7631c8 100644
--- a/include/configs/novena.h
+++ b/include/configs/novena.h
@@ -101,7 +101,6 @@
 #endif
 
 /* Video output */
-#define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_IMX_HDMI
 #define CONFIG_IMX_VIDEO_SKIP
diff --git a/include/configs/opos6uldev.h b/include/configs/opos6uldev.h
index 1930b8b785..2fb1634a7d 100644
--- a/include/configs/opos6uldev.h
+++ b/include/configs/opos6uldev.h
@@ -46,9 +46,6 @@
 #ifdef CONFIG_DM_VIDEO
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
-#define CONFIG_BMP_16BPP
-#define CONFIG_BMP_24BPP
-#define CONFIG_BMP_32BPP
 #define CONFIG_VIDEO_MXS
 #define MXS_LCDIF_BASE MX6UL_LCDIF1_BASE_ADDR
 #endif
diff --git a/include/configs/pico-imx6.h b/include/configs/pico-imx6.h
index 48b62f7140..19c8aeb71b 100644
--- a/include/configs/pico-imx6.h
+++ b/include/configs/pico-imx6.h
@@ -143,7 +143,6 @@
 #define CONFIG_FEC_MXC_PHYADDR		1
 
 /* Framebuffer */
-#define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_IMX_HDMI
diff --git a/include/configs/pico-imx6ul.h b/include/configs/pico-imx6ul.h
index 92fed20f0a..747ef09f37 100644
--- a/include/configs/pico-imx6ul.h
+++ b/include/configs/pico-imx6ul.h
@@ -147,7 +147,6 @@
 #ifdef CONFIG_VIDEO
 #define CONFIG_VIDEO_MXS
 #define CONFIG_VIDEO_LOGO
-#define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_BMP_LOGO
 #define MXS_LCDIF_BASE MX6UL_LCDIF1_BASE_ADDR
 #endif
diff --git a/include/configs/pico-imx7d.h b/include/configs/pico-imx7d.h
index bf5690d480..51b7359cad 100644
--- a/include/configs/pico-imx7d.h
+++ b/include/configs/pico-imx7d.h
@@ -143,7 +143,6 @@
 #ifdef CONFIG_DM_VIDEO
 #define CONFIG_VIDEO_MXS
 #define CONFIG_VIDEO_LOGO
-#define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_BMP_LOGO
 #endif
 
diff --git a/include/configs/puma_rk3399.h b/include/configs/puma_rk3399.h
index 5714437a00..f52ea014b5 100644
--- a/include/configs/puma_rk3399.h
+++ b/include/configs/puma_rk3399.h
@@ -12,8 +12,4 @@
 
 #define CONFIG_SERIAL_TAG
 
-#define CONFIG_BMP_16BPP
-#define CONFIG_BMP_24BPP
-#define CONFIG_BMP_32BPP
-
 #endif
diff --git a/include/configs/s5p4418_nanopi2.h b/include/configs/s5p4418_nanopi2.h
index 8577729d65..6dd1f3bc04 100644
--- a/include/configs/s5p4418_nanopi2.h
+++ b/include/configs/s5p4418_nanopi2.h
@@ -153,11 +153,6 @@
 #define CONFIG_VIDEO_LOGO
 
 #ifdef CONFIG_VIDEO_LOGO
-
-#ifdef CONFIG_DM_VIDEO
-#define CONFIG_BMP_24BPP
-#endif
-
 #ifdef CONFIG_SPLASH_SCREEN
 #define SPLASH_FILE			logo.bmp
 #endif
diff --git a/include/configs/s5pc210_universal.h b/include/configs/s5pc210_universal.h
index 673797ea01..86c90d990b 100644
--- a/include/configs/s5pc210_universal.h
+++ b/include/configs/s5pc210_universal.h
@@ -158,7 +158,6 @@ int universal_spi_read(void);
 /*
  * LCD Settings
  */
-#define CONFIG_BMP_16BPP
 #define CONFIG_LD9040
 #define CONFIG_SYS_VIDEO_LOGO_MAX_SIZE ((500 * 160 * 4) + 54)
 
diff --git a/include/configs/stm32f746-disco.h b/include/configs/stm32f746-disco.h
index 21cba767f2..08d050adfa 100644
--- a/include/configs/stm32f746-disco.h
+++ b/include/configs/stm32f746-disco.h
@@ -76,10 +76,5 @@
 /* For SPL ends */
 
 /* For splashcreen */
-#ifdef CONFIG_DM_VIDEO
-#define CONFIG_BMP_16BPP
-#define CONFIG_BMP_24BPP
-#define CONFIG_BMP_32BPP
-#endif
 
 #endif /* __CONFIG_H */
diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index dc1d79011d..1aa7514ac7 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -75,12 +75,6 @@
 #define CONFIG_SYS_AUTOLOAD		"no"
 #endif
 
-#ifdef CONFIG_DM_VIDEO
-#define CONFIG_BMP_16BPP
-#define CONFIG_BMP_24BPP
-#define CONFIG_BMP_32BPP
-#endif
-
 /*****************************************************************************/
 #ifdef CONFIG_DISTRO_DEFAULTS
 /*****************************************************************************/
diff --git a/include/configs/theadorable-x86-common.h b/include/configs/theadorable-x86-common.h
index 141d4d61f8..193c6c3bb5 100644
--- a/include/configs/theadorable-x86-common.h
+++ b/include/configs/theadorable-x86-common.h
@@ -19,7 +19,6 @@
 
 #define VIDEO_IO_OFFSET				0
 #define CONFIG_X86EMU_RAW_IO
-#define CONFIG_BMP_16BPP
 
 /* Environment settings */
 
diff --git a/include/configs/theadorable.h b/include/configs/theadorable.h
index 85ab34c083..587b134a1b 100644
--- a/include/configs/theadorable.h
+++ b/include/configs/theadorable.h
@@ -51,10 +51,6 @@
 /* Enable LCD and reserve 512KB from top of memory*/
 #define CONFIG_SYS_MEM_TOP_HIDE		0x80000
 
-#define CONFIG_BMP_16BPP
-#define CONFIG_BMP_24BPP
-#define CONFIG_BMP_32BPP
-
 /* FPGA programming support */
 #define CONFIG_FPGA_STRATIX_V
 
diff --git a/include/configs/trats.h b/include/configs/trats.h
index acfa9fe7d9..3c71f08ea4 100644
--- a/include/configs/trats.h
+++ b/include/configs/trats.h
@@ -178,7 +178,6 @@
 #define LCD_BPP			LCD_COLOR16
 
 /* LCD */
-#define CONFIG_BMP_16BPP
 #define CONFIG_FB_ADDR		0x52504000
 #define CONFIG_EXYNOS_MIPI_DSIM
 #define CONFIG_SYS_VIDEO_LOGO_MAX_SIZE  ((500 * 160 * 4) + 54)
diff --git a/include/configs/trats2.h b/include/configs/trats2.h
index 06d80ce698..d53b855023 100644
--- a/include/configs/trats2.h
+++ b/include/configs/trats2.h
@@ -161,7 +161,6 @@
 #define LCD_BPP                 LCD_COLOR16
 
 /* LCD */
-#define CONFIG_BMP_16BPP
 #define CONFIG_FB_ADDR		0x52504000
 #define CONFIG_EXYNOS_MIPI_DSIM
 #define CONFIG_SYS_VIDEO_LOGO_MAX_SIZE ((500 * 160 * 4) + 54)
diff --git a/include/configs/wandboard.h b/include/configs/wandboard.h
index 42be278b83..bd64893fc7 100644
--- a/include/configs/wandboard.h
+++ b/include/configs/wandboard.h
@@ -37,7 +37,6 @@
 #define CONFIG_MXC_USB_FLAGS		0
 
 /* Framebuffer */
-#define CONFIG_BMP_16BPP
 #define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_IMX_HDMI
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index 460f01d138..9887804414 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -101,9 +101,6 @@ CONFIG_BL1_OFFSET
 CONFIG_BL1_SIZE
 CONFIG_BL2_OFFSET
 CONFIG_BL2_SIZE
-CONFIG_BMP_16BPP
-CONFIG_BMP_24BPP
-CONFIG_BMP_32BPP
 CONFIG_BOARDDIR
 CONFIG_BOARDNAME
 CONFIG_BOARDNAME_LOCAL
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
