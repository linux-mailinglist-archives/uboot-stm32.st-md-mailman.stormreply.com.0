Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A4F4577B3
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Nov 2021 21:24:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F2EEC5C82A;
	Fri, 19 Nov 2021 20:24:39 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91DE0C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Nov 2021 20:24:37 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 x43-20020a056830246b00b00570d09d34ebso18525961otr.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Nov 2021 12:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7S2QYszxkWjcxCn0v87/jwUQo+dnicNFOTQQA4Ur+GA=;
 b=eNDjr70p66cWlpOHmLr1IVFVfILwtixTCIY48dA/QvjjT9Obw2iUbQd+HyR5ZyFPks
 3kgFfY3MVV0So8HkqRYERVx7o7Yj974BF/wlx7ys98AOtWjm+8Ff5rrL7YdT/PPJ4XXD
 Av1AhvcgMLXJN+l4qMGa/wWMLQbAKfIeBD1f4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7S2QYszxkWjcxCn0v87/jwUQo+dnicNFOTQQA4Ur+GA=;
 b=4rOqEcxNWx8WzYusY54GQrEkcPJRx6Rw1933jbFefvHrArzHncM916tioPD9YRNUNb
 BF4sRvXBr1nKMy1ch0jpEZQXiVYmgSkOKli702LODccH0CDE8Wk4JunpjJN0FGqaq1bC
 swlF2lJy/TAjpSXFCXWeBDsXdjxl6Ku2bL8NKhC9bOjHddgth8Jt2d/cNuo3ZwawnvAY
 P0v1fC7AaDkZcQYL+UmS0lZAViSbs2/Vwn6vE9wjdd0QgK1d/bpKVU1s6YAQDfvj2jg1
 injflmON4lQA/I0TDDGpvFglWo4Ujr5yBeMKEkvK8B+wU3LvLYFLEEXb1R9zlyjkfpsb
 RLyg==
X-Gm-Message-State: AOAM532zxx50ks5dZMQjk9IaH3zOJkfJeXP9h0r/VM7feEJ2uhIs9ajW
 /AjBxXBWqCbcHBjw9gXtht29Pw==
X-Google-Smtp-Source: ABdhPJx6OdkwXhq/FVIeeSZhia/uygNEbUcHxVZwW+9HVbpQfPrgeoqYEBlIH51l0HeXf30oPX7AFw==
X-Received: by 2002:a05:6830:1d7c:: with SMTP id
 l28mr6963432oti.372.1637353476306; 
 Fri, 19 Nov 2021 12:24:36 -0800 (PST)
Received: from kiwi.bld.corp.google.com (c-67-190-101-114.hsd1.co.comcast.net.
 [67.190.101.114])
 by smtp.gmail.com with ESMTPSA id bl33sm197093oib.47.2021.11.19.12.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 12:24:35 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Fri, 19 Nov 2021 13:24:01 -0700
Message-Id: <20211119202408.1815506-18-sjg@chromium.org>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
In-Reply-To: <20211119202408.1815506-1-sjg@chromium.org>
References: <20211119202408.1815506-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Baruch Siach <baruch@tkos.co.il>, Nikita Kiryanov <nikita@compulab.co.il>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Adrian Alonso <adrian.alonso@nxp.com>, Samuel Egli <samuel.egli@siemens.com>,
 Peng Fan <peng.fan@nxp.com>, Sean Anderson <seanga2@gmail.com>,
 Stefan Bosch <stefan_b@posteo.net>,
 =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Hu <richard.hu@technexion.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Liu <jason.hui.liu@nxp.com>,
 Heiko Schocher <hs@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
 Vanessa Maegima <vanessa.maegima@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Alison Wang <alison.wang@nxp.com>, Rick Chen <rick@andestech.com>,
 =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>,
 Stefano Babic <sbabic@denx.de>, Olaf Mandel <o.mandel@menlosystems.com>,
 Anatolij Gustschin <agust@denx.de>, Priyanka Jain <priyanka.jain@nxp.com>,
 Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [Uboot-stm32] [PATCH 17/23] video: Convert CONFIG_VIDEO_LOGO to
	Kconfig
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

This converts the following to Kconfig:
   CONFIG_VIDEO_LOGO

Note that this option depends on CONFIG_DM_VIDEO now, since cfb_console is
deprecated. The only relevant code is now in splash.c

Drop the check for DM_VIDEO in that file.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 README                                 | 1 -
 common/splash.c                        | 2 +-
 configs/apalis_imx6_defconfig          | 1 +
 configs/aristainetos2c_defconfig       | 1 +
 configs/aristainetos2ccslb_defconfig   | 1 +
 configs/cm_fx6_defconfig               | 1 +
 configs/colibri-imx6ull-emmc_defconfig | 1 +
 configs/colibri-imx6ull_defconfig      | 1 +
 configs/colibri_imx6_defconfig         | 1 +
 configs/colibri_imx7_defconfig         | 1 +
 configs/colibri_imx7_emmc_defconfig    | 1 +
 configs/colibri_vf_defconfig           | 1 +
 configs/gwventana_emmc_defconfig       | 1 +
 configs/gwventana_gw5904_defconfig     | 1 +
 configs/gwventana_nand_defconfig       | 1 +
 configs/imx6dl_icore_nand_defconfig    | 1 +
 configs/imx6q_icore_nand_defconfig     | 1 +
 configs/imx6qdl_icore_mmc_defconfig    | 1 +
 configs/imx6qdl_icore_nand_defconfig   | 1 +
 configs/imxrt1050-evk_defconfig        | 1 +
 configs/m53menlo_defconfig             | 1 +
 configs/marsboard_defconfig            | 1 +
 configs/mx6cuboxi_defconfig            | 1 +
 configs/mx6sabreauto_defconfig         | 1 +
 configs/mx6sabresd_defconfig           | 1 +
 configs/mx6ul_14x14_evk_defconfig      | 1 +
 configs/mx6ul_9x9_evk_defconfig        | 1 +
 configs/novena_defconfig               | 1 +
 configs/opos6uldev_defconfig           | 1 +
 configs/pico-dwarf-imx7d_defconfig     | 1 +
 configs/pico-hobbit-imx7d_defconfig    | 1 +
 configs/pico-imx6_defconfig            | 1 +
 configs/pico-imx6ul_defconfig          | 1 +
 configs/pico-imx7d_bl33_defconfig      | 1 +
 configs/pico-imx7d_defconfig           | 1 +
 configs/pico-nymph-imx7d_defconfig     | 1 +
 configs/pico-pi-imx7d_defconfig        | 1 +
 configs/riotboard_defconfig            | 1 +
 configs/s5p4418_nanopi2_defconfig      | 1 +
 configs/wandboard_defconfig            | 1 +
 drivers/video/Kconfig                  | 9 +++++++++
 include/configs/T102xRDB.h             | 1 -
 include/configs/T104xRDB.h             | 1 -
 include/configs/apalis_imx6.h          | 1 -
 include/configs/aristainetos2.h        | 1 -
 include/configs/cm_fx6.h               | 1 -
 include/configs/colibri-imx6ull.h      | 1 -
 include/configs/colibri_imx6.h         | 1 -
 include/configs/colibri_imx7.h         | 1 -
 include/configs/colibri_vf.h           | 1 -
 include/configs/embestmx6boards.h      | 1 -
 include/configs/gw_ventana.h           | 1 -
 include/configs/imx6-engicam.h         | 1 -
 include/configs/imxrt1050-evk.h        | 1 -
 include/configs/ls1021aqds.h           | 1 -
 include/configs/ls1021atwr.h           | 1 -
 include/configs/m53menlo.h             | 1 -
 include/configs/mx23evk.h              | 1 -
 include/configs/mx28evk.h              | 1 -
 include/configs/mx51evk.h              | 1 -
 include/configs/mx53loco.h             | 1 -
 include/configs/mx6cuboxi.h            | 1 -
 include/configs/mx6sabre_common.h      | 1 -
 include/configs/mx6sxsabresd.h         | 1 -
 include/configs/mx6ul_14x14_evk.h      | 1 -
 include/configs/mx7dsabresd.h          | 1 -
 include/configs/nokia_rx51.h           | 1 -
 include/configs/novena.h               | 1 -
 include/configs/opos6uldev.h           | 1 -
 include/configs/pico-imx6.h            | 1 -
 include/configs/pico-imx6ul.h          | 1 -
 include/configs/pico-imx7d.h           | 1 -
 include/configs/pxm2.h                 | 1 -
 include/configs/rut.h                  | 1 -
 include/configs/s5p4418_nanopi2.h      | 2 --
 include/configs/wandboard.h            | 1 -
 scripts/config_whitelist.txt           | 1 -
 77 files changed, 48 insertions(+), 39 deletions(-)

diff --git a/README b/README
index 9606a8b3acf..2b8fa030859 100644
--- a/README
+++ b/README
@@ -1095,7 +1095,6 @@ The following options need to be configured:
 			CONFIG_CFB_CONSOLE
 			CONFIG_VIDEO_SW_CURSOR
 			CONFIG_VGA_AS_SINGLE_DEVICE
-			CONFIG_VIDEO_LOGO
 			CONFIG_VIDEO_BMP_LOGO
 
 		The DIU driver will look for the 'video-mode' environment
diff --git a/common/splash.c b/common/splash.c
index de720df9f58..98f0089266d 100644
--- a/common/splash.c
+++ b/common/splash.c
@@ -52,7 +52,7 @@ static struct splash_location default_splash_locations[] = {
 	},
 };
 
-#if defined(CONFIG_DM_VIDEO) && defined(CONFIG_VIDEO_LOGO)
+#ifdef CONFIG_VIDEO_LOGO
 
 #include <bmp_logo_data.h>
 
diff --git a/configs/apalis_imx6_defconfig b/configs/apalis_imx6_defconfig
index b5c846aa6a4..81d964302c5 100644
--- a/configs/apalis_imx6_defconfig
+++ b/configs/apalis_imx6_defconfig
@@ -105,6 +105,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0x4000
 CONFIG_CI_UDC=y
 CONFIG_USB_GADGET_DOWNLOAD=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/aristainetos2c_defconfig b/configs/aristainetos2c_defconfig
index ad4e8350c3a..27607d2ace4 100644
--- a/configs/aristainetos2c_defconfig
+++ b/configs/aristainetos2c_defconfig
@@ -109,6 +109,7 @@ CONFIG_SYSRESET_WATCHDOG=y
 CONFIG_USB=y
 CONFIG_USB_STORAGE=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_IPUV3=y
diff --git a/configs/aristainetos2ccslb_defconfig b/configs/aristainetos2ccslb_defconfig
index e4ecd81c1e2..bfc967b38e6 100644
--- a/configs/aristainetos2ccslb_defconfig
+++ b/configs/aristainetos2ccslb_defconfig
@@ -109,6 +109,7 @@ CONFIG_SYSRESET_WATCHDOG=y
 CONFIG_USB=y
 CONFIG_USB_STORAGE=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_IPUV3=y
diff --git a/configs/cm_fx6_defconfig b/configs/cm_fx6_defconfig
index b823a150dc0..4e7f152185b 100644
--- a/configs/cm_fx6_defconfig
+++ b/configs/cm_fx6_defconfig
@@ -106,6 +106,7 @@ CONFIG_USB=y
 CONFIG_USB_KEYBOARD=y
 CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 CONFIG_VIDEO_IPUV3=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SOURCE=y
diff --git a/configs/colibri-imx6ull-emmc_defconfig b/configs/colibri-imx6ull-emmc_defconfig
index 4b346a98793..81881ef1e9b 100644
--- a/configs/colibri-imx6ull-emmc_defconfig
+++ b/configs/colibri-imx6ull-emmc_defconfig
@@ -80,6 +80,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0x4000
 CONFIG_CI_UDC=y
 CONFIG_USB_GADGET_DOWNLOAD=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
diff --git a/configs/colibri-imx6ull_defconfig b/configs/colibri-imx6ull_defconfig
index 7d15b7b58bf..3e4d1b82090 100644
--- a/configs/colibri-imx6ull_defconfig
+++ b/configs/colibri-imx6ull_defconfig
@@ -95,6 +95,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0x4000
 CONFIG_CI_UDC=y
 CONFIG_USB_GADGET_DOWNLOAD=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_MXS=y
 CONFIG_SPLASH_SCREEN=y
diff --git a/configs/colibri_imx6_defconfig b/configs/colibri_imx6_defconfig
index 1f3c0f17d0c..3900ad258bd 100644
--- a/configs/colibri_imx6_defconfig
+++ b/configs/colibri_imx6_defconfig
@@ -103,6 +103,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0x4000
 CONFIG_CI_UDC=y
 CONFIG_USB_GADGET_DOWNLOAD=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/colibri_imx7_defconfig b/configs/colibri_imx7_defconfig
index 129f625acab..0e8cabc3468 100644
--- a/configs/colibri_imx7_defconfig
+++ b/configs/colibri_imx7_defconfig
@@ -91,6 +91,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0x4000
 CONFIG_CI_UDC=y
 CONFIG_USB_GADGET_DOWNLOAD=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_MXS=y
 CONFIG_SPLASH_SCREEN=y
diff --git a/configs/colibri_imx7_emmc_defconfig b/configs/colibri_imx7_emmc_defconfig
index c06ef33eb0b..e2de213018c 100644
--- a/configs/colibri_imx7_emmc_defconfig
+++ b/configs/colibri_imx7_emmc_defconfig
@@ -85,6 +85,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x1b67
 CONFIG_USB_GADGET_PRODUCT_NUM=0x4000
 CONFIG_CI_UDC=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
diff --git a/configs/colibri_vf_defconfig b/configs/colibri_vf_defconfig
index 4306ff485e9..c404139ef18 100644
--- a/configs/colibri_vf_defconfig
+++ b/configs/colibri_vf_defconfig
@@ -97,6 +97,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0x4000
 CONFIG_CI_UDC=y
 CONFIG_USB_GADGET_DOWNLOAD=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP16 is not set
 CONFIG_VIDEO_FSL_DCU_FB=y
diff --git a/configs/gwventana_emmc_defconfig b/configs/gwventana_emmc_defconfig
index 3c94c0a5927..6b58474e5e8 100644
--- a/configs/gwventana_emmc_defconfig
+++ b/configs/gwventana_emmc_defconfig
@@ -138,6 +138,7 @@ CONFIG_USB_GADGET_DOWNLOAD=y
 CONFIG_USB_ETHER=y
 CONFIG_USB_ETH_CDC=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 # CONFIG_BACKLIGHT is not set
 # CONFIG_CMD_VIDCONSOLE is not set
 # CONFIG_VIDEO_BPP8 is not set
diff --git a/configs/gwventana_gw5904_defconfig b/configs/gwventana_gw5904_defconfig
index 3309c657f19..f3e54a32af3 100644
--- a/configs/gwventana_gw5904_defconfig
+++ b/configs/gwventana_gw5904_defconfig
@@ -142,6 +142,7 @@ CONFIG_USB_GADGET_DOWNLOAD=y
 CONFIG_USB_ETHER=y
 CONFIG_USB_ETH_CDC=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 # CONFIG_BACKLIGHT is not set
 # CONFIG_CMD_VIDCONSOLE is not set
 # CONFIG_VIDEO_BPP8 is not set
diff --git a/configs/gwventana_nand_defconfig b/configs/gwventana_nand_defconfig
index b64d4ae1592..0833f7ce630 100644
--- a/configs/gwventana_nand_defconfig
+++ b/configs/gwventana_nand_defconfig
@@ -146,6 +146,7 @@ CONFIG_USB_GADGET_DOWNLOAD=y
 CONFIG_USB_ETHER=y
 CONFIG_USB_ETH_CDC=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 # CONFIG_BACKLIGHT is not set
 # CONFIG_CMD_VIDCONSOLE is not set
 # CONFIG_VIDEO_BPP8 is not set
diff --git a/configs/imx6dl_icore_nand_defconfig b/configs/imx6dl_icore_nand_defconfig
index 3076dced10b..146cb1c58f5 100644
--- a/configs/imx6dl_icore_nand_defconfig
+++ b/configs/imx6dl_icore_nand_defconfig
@@ -64,6 +64,7 @@ CONFIG_PINCTRL_IMX6=y
 CONFIG_MXC_UART=y
 CONFIG_IMX_THERMAL=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/imx6q_icore_nand_defconfig b/configs/imx6q_icore_nand_defconfig
index 439917bf243..16711327be5 100644
--- a/configs/imx6q_icore_nand_defconfig
+++ b/configs/imx6q_icore_nand_defconfig
@@ -65,6 +65,7 @@ CONFIG_PINCTRL_IMX6=y
 CONFIG_MXC_UART=y
 CONFIG_IMX_THERMAL=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/imx6qdl_icore_mmc_defconfig b/configs/imx6qdl_icore_mmc_defconfig
index 61d8a7b2e63..47607eb8bd6 100644
--- a/configs/imx6qdl_icore_mmc_defconfig
+++ b/configs/imx6qdl_icore_mmc_defconfig
@@ -82,6 +82,7 @@ CONFIG_PINCTRL_IMX6=y
 CONFIG_MXC_UART=y
 CONFIG_IMX_THERMAL=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/imx6qdl_icore_nand_defconfig b/configs/imx6qdl_icore_nand_defconfig
index 439917bf243..16711327be5 100644
--- a/configs/imx6qdl_icore_nand_defconfig
+++ b/configs/imx6qdl_icore_nand_defconfig
@@ -65,6 +65,7 @@ CONFIG_PINCTRL_IMX6=y
 CONFIG_MXC_UART=y
 CONFIG_IMX_THERMAL=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
index ca3f810e025..bc438b9fa6c 100644
--- a/configs/imxrt1050-evk_defconfig
+++ b/configs/imxrt1050-evk_defconfig
@@ -72,6 +72,7 @@ CONFIG_USB=y
 # CONFIG_SPL_DM_USB is not set
 CONFIG_USB_EHCI_HCD=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 CONFIG_BACKLIGHT_GPIO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_MXS=y
diff --git a/configs/m53menlo_defconfig b/configs/m53menlo_defconfig
index 48d75669cb5..08f7a92b35f 100644
--- a/configs/m53menlo_defconfig
+++ b/configs/m53menlo_defconfig
@@ -109,6 +109,7 @@ CONFIG_USB_ETHER_ASIX=y
 CONFIG_USB_ETHER_MCS7830=y
 CONFIG_USB_ETHER_SMSC95XX=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/marsboard_defconfig b/configs/marsboard_defconfig
index 281563401f5..0ce228d320d 100644
--- a/configs/marsboard_defconfig
+++ b/configs/marsboard_defconfig
@@ -57,6 +57,7 @@ CONFIG_USB=y
 CONFIG_USB_HOST_ETHER=y
 CONFIG_USB_ETHER_ASIX=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 # CONFIG_BACKLIGHT is not set
 # CONFIG_CMD_VIDCONSOLE is not set
 # CONFIG_VIDEO_BPP8 is not set
diff --git a/configs/mx6cuboxi_defconfig b/configs/mx6cuboxi_defconfig
index 70374515abe..4fbd83f0a5d 100644
--- a/configs/mx6cuboxi_defconfig
+++ b/configs/mx6cuboxi_defconfig
@@ -70,6 +70,7 @@ CONFIG_IMX_THERMAL=y
 CONFIG_USB=y
 CONFIG_USB_KEYBOARD=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 # CONFIG_BACKLIGHT is not set
 # CONFIG_CMD_VIDCONSOLE is not set
 # CONFIG_VIDEO_BPP8 is not set
diff --git a/configs/mx6sabreauto_defconfig b/configs/mx6sabreauto_defconfig
index c5cdc3ac17f..f8e622106c9 100644
--- a/configs/mx6sabreauto_defconfig
+++ b/configs/mx6sabreauto_defconfig
@@ -109,6 +109,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
 CONFIG_USB_GADGET_DOWNLOAD=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/mx6sabresd_defconfig b/configs/mx6sabresd_defconfig
index 6733038060a..86af807ad4a 100644
--- a/configs/mx6sabresd_defconfig
+++ b/configs/mx6sabresd_defconfig
@@ -116,6 +116,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/mx6ul_14x14_evk_defconfig b/configs/mx6ul_14x14_evk_defconfig
index 5fa9d341f98..52e588e31e2 100644
--- a/configs/mx6ul_14x14_evk_defconfig
+++ b/configs/mx6ul_14x14_evk_defconfig
@@ -92,6 +92,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_MXS=y
 CONFIG_SPLASH_SCREEN=y
diff --git a/configs/mx6ul_9x9_evk_defconfig b/configs/mx6ul_9x9_evk_defconfig
index 1b80f043bd7..8d18e43956e 100644
--- a/configs/mx6ul_9x9_evk_defconfig
+++ b/configs/mx6ul_9x9_evk_defconfig
@@ -82,6 +82,7 @@ CONFIG_IMX_THERMAL=y
 CONFIG_USB=y
 CONFIG_USB_STORAGE=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_MXS=y
 CONFIG_SPLASH_SCREEN=y
diff --git a/configs/novena_defconfig b/configs/novena_defconfig
index 06864db00d5..132d2dff0d7 100644
--- a/configs/novena_defconfig
+++ b/configs/novena_defconfig
@@ -84,6 +84,7 @@ CONFIG_USB_GADGET=y
 CONFIG_CI_UDC=y
 CONFIG_USB_ETHER=y
 CONFIG_USB_ETH_CDC=y
+CONFIG_VIDEO_LOGO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/opos6uldev_defconfig b/configs/opos6uldev_defconfig
index c52d2a5d396..f101d3abfdd 100644
--- a/configs/opos6uldev_defconfig
+++ b/configs/opos6uldev_defconfig
@@ -103,6 +103,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
 CONFIG_USB_GADGET_DOWNLOAD=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/configs/pico-dwarf-imx7d_defconfig b/configs/pico-dwarf-imx7d_defconfig
index 6df4d44e1ed..13e4d9b0c20 100644
--- a/configs/pico-dwarf-imx7d_defconfig
+++ b/configs/pico-dwarf-imx7d_defconfig
@@ -85,6 +85,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
diff --git a/configs/pico-hobbit-imx7d_defconfig b/configs/pico-hobbit-imx7d_defconfig
index a5b6a30556e..7dc7e5d6ec3 100644
--- a/configs/pico-hobbit-imx7d_defconfig
+++ b/configs/pico-hobbit-imx7d_defconfig
@@ -85,6 +85,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
diff --git a/configs/pico-imx6_defconfig b/configs/pico-imx6_defconfig
index 20c7d45a463..2353dd762be 100644
--- a/configs/pico-imx6_defconfig
+++ b/configs/pico-imx6_defconfig
@@ -82,6 +82,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 # CONFIG_BACKLIGHT is not set
 # CONFIG_CMD_VIDCONSOLE is not set
 # CONFIG_VIDEO_BPP8 is not set
diff --git a/configs/pico-imx6ul_defconfig b/configs/pico-imx6ul_defconfig
index 215537e8cd4..35021ac39b7 100644
--- a/configs/pico-imx6ul_defconfig
+++ b/configs/pico-imx6ul_defconfig
@@ -79,6 +79,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 CONFIG_VIDEO_MXS=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
diff --git a/configs/pico-imx7d_bl33_defconfig b/configs/pico-imx7d_bl33_defconfig
index 3c669e7fe9d..005f8d8d8ca 100644
--- a/configs/pico-imx7d_bl33_defconfig
+++ b/configs/pico-imx7d_bl33_defconfig
@@ -81,6 +81,7 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
 CONFIG_USB_GADGET_DOWNLOAD=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_MXS=y
 CONFIG_SPLASH_SCREEN=y
diff --git a/configs/pico-imx7d_defconfig b/configs/pico-imx7d_defconfig
index 8e7e10e1149..ed20aeae685 100644
--- a/configs/pico-imx7d_defconfig
+++ b/configs/pico-imx7d_defconfig
@@ -85,6 +85,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_MXS=y
 CONFIG_SPLASH_SCREEN=y
diff --git a/configs/pico-nymph-imx7d_defconfig b/configs/pico-nymph-imx7d_defconfig
index 6df4d44e1ed..13e4d9b0c20 100644
--- a/configs/pico-nymph-imx7d_defconfig
+++ b/configs/pico-nymph-imx7d_defconfig
@@ -85,6 +85,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
diff --git a/configs/pico-pi-imx7d_defconfig b/configs/pico-pi-imx7d_defconfig
index 40a7232b65e..f74e83e96d3 100644
--- a/configs/pico-pi-imx7d_defconfig
+++ b/configs/pico-pi-imx7d_defconfig
@@ -85,6 +85,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0525
 CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
 CONFIG_CI_UDC=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_SPLASH_SCREEN=y
 CONFIG_SPLASH_SCREEN_ALIGN=y
diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
index 0dd538e5c1a..3c277ed65a0 100644
--- a/configs/riotboard_defconfig
+++ b/configs/riotboard_defconfig
@@ -69,6 +69,7 @@ CONFIG_USB=y
 CONFIG_USB_HOST_ETHER=y
 CONFIG_USB_ETHER_ASIX=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 # CONFIG_BACKLIGHT is not set
 # CONFIG_CMD_VIDCONSOLE is not set
 # CONFIG_VIDEO_BPP8 is not set
diff --git a/configs/s5p4418_nanopi2_defconfig b/configs/s5p4418_nanopi2_defconfig
index fa59cfd0692..0e17e759b58 100644
--- a/configs/s5p4418_nanopi2_defconfig
+++ b/configs/s5p4418_nanopi2_defconfig
@@ -50,6 +50,7 @@ CONFIG_DM_PMIC=y
 CONFIG_DM_REGULATOR=y
 CONFIG_CONS_INDEX=0
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 CONFIG_DISPLAY=y
 CONFIG_VIDEO_NX=y
 CONFIG_VIDEO_NX_RGB=y
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 4015c39143f..2160dd852ed 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -74,6 +74,7 @@ CONFIG_MXC_UART=y
 CONFIG_DM_THERMAL=y
 CONFIG_USB=y
 CONFIG_DM_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 # CONFIG_VIDEO_BPP8 is not set
 # CONFIG_VIDEO_BPP32 is not set
 CONFIG_SYS_WHITE_ON_BLACK=y
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index a58f87f479b..7a73ecc1f40 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -14,6 +14,15 @@ config DM_VIDEO
 	  option compiles in the video uclass and routes all LCD/video access
 	  through this.
 
+config VIDEO_LOGO
+	bool "Show the U-Boot logo on the display"
+	depends on DM_VIDEO
+	help
+	  This enables showing the U-Boot logo on the display when a video
+	  device is probed. It appears at the top right. The logo itself is at
+	  tools/logos/u-boot_logo.bmp and looks best when the display has a
+	  black background.
+
 config BACKLIGHT
 	bool "Enable panel backlight uclass support"
 	depends on DM_VIDEO
diff --git a/include/configs/T102xRDB.h b/include/configs/T102xRDB.h
index 89bbeb77844..fdda8c92437 100644
--- a/include/configs/T102xRDB.h
+++ b/include/configs/T102xRDB.h
@@ -380,7 +380,6 @@ unsigned long get_board_sys_clk(void);
 #undef CONFIG_FSL_DIU_FB	/* RDB doesn't support DIU */
 #ifdef CONFIG_FSL_DIU_FB
 #define CONFIG_SYS_DIU_ADDR	(CONFIG_SYS_CCSRBAR + 0x180000)
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_CFI_FLASH_USE_WEAK_ACCESSORS
 /*
diff --git a/include/configs/T104xRDB.h b/include/configs/T104xRDB.h
index 48fc8a271c2..d02d580edaf 100644
--- a/include/configs/T104xRDB.h
+++ b/include/configs/T104xRDB.h
@@ -367,7 +367,6 @@
 #ifdef CONFIG_FSL_DIU_FB
 #define CONFIG_FSL_DIU_CH7301
 #define CONFIG_SYS_DIU_ADDR	(CONFIG_SYS_CCSRBAR + 0x180000)
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #endif
 #endif
diff --git a/include/configs/apalis_imx6.h b/include/configs/apalis_imx6.h
index dfed1615b9b..3c062d42f8d 100644
--- a/include/configs/apalis_imx6.h
+++ b/include/configs/apalis_imx6.h
@@ -46,7 +46,6 @@
 
 /* Framebuffer and LCD */
 #define CONFIG_SYS_CONSOLE_OVERWRITE_ROUTINE
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_IMX_HDMI
 #define CONFIG_IMX_VIDEO_SKIP
diff --git a/include/configs/aristainetos2.h b/include/configs/aristainetos2.h
index b73b0d5b92b..e6397378e45 100644
--- a/include/configs/aristainetos2.h
+++ b/include/configs/aristainetos2.h
@@ -443,7 +443,6 @@
 /* Framebuffer */
 /* check this console not needed, after test remove it */
 #define CONFIG_IMX_VIDEO_SKIP
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 
 #define CONFIG_IMX6_PWM_PER_CLK	66000000
diff --git a/include/configs/cm_fx6.h b/include/configs/cm_fx6.h
index d61d759092c..267496b7d10 100644
--- a/include/configs/cm_fx6.h
+++ b/include/configs/cm_fx6.h
@@ -177,7 +177,6 @@
 /* Display */
 #define CONFIG_IMX_HDMI
 
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 
 /* EEPROM */
diff --git a/include/configs/colibri-imx6ull.h b/include/configs/colibri-imx6ull.h
index 6b3e1c665a0..e4daa4bec46 100644
--- a/include/configs/colibri-imx6ull.h
+++ b/include/configs/colibri-imx6ull.h
@@ -165,7 +165,6 @@
 
 #if defined(CONFIG_DM_VIDEO)
 #define MXS_LCDIF_BASE MX6UL_LCDIF1_BASE_ADDR
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #endif
 
diff --git a/include/configs/colibri_imx6.h b/include/configs/colibri_imx6.h
index b103186bf46..e0174c58343 100644
--- a/include/configs/colibri_imx6.h
+++ b/include/configs/colibri_imx6.h
@@ -36,7 +36,6 @@
 
 /* Framebuffer and LCD */
 #define CONFIG_SYS_CONSOLE_OVERWRITE_ROUTINE
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_IMX_HDMI
 #define CONFIG_IMX_VIDEO_SKIP
diff --git a/include/configs/colibri_imx7.h b/include/configs/colibri_imx7.h
index ac188ee3ac6..f9b505c45b5 100644
--- a/include/configs/colibri_imx7.h
+++ b/include/configs/colibri_imx7.h
@@ -199,7 +199,6 @@
 #define CONFIG_USBD_HS
 
 #if defined(CONFIG_DM_VIDEO)
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #endif
 
diff --git a/include/configs/colibri_vf.h b/include/configs/colibri_vf.h
index 71fe768d679..60bd9332b75 100644
--- a/include/configs/colibri_vf.h
+++ b/include/configs/colibri_vf.h
@@ -17,7 +17,6 @@
 #define CONFIG_SYS_FSL_CLK
 
 #ifdef CONFIG_VIDEO_FSL_DCU_FB
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_SYS_FSL_DCU_LE
 
diff --git a/include/configs/embestmx6boards.h b/include/configs/embestmx6boards.h
index 9769155bca7..d001580d7dd 100644
--- a/include/configs/embestmx6boards.h
+++ b/include/configs/embestmx6boards.h
@@ -52,7 +52,6 @@
 #endif
 
 /* Framebuffer */
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_IMX_HDMI
 #define CONFIG_IMX_VIDEO_SKIP
diff --git a/include/configs/gw_ventana.h b/include/configs/gw_ventana.h
index abceffb4220..5301d81dd41 100644
--- a/include/configs/gw_ventana.h
+++ b/include/configs/gw_ventana.h
@@ -72,7 +72,6 @@
 #define CONFIG_USBD_HS
 
 /* Framebuffer and LCD */
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_IMX_HDMI
 #define CONFIG_IMX_VIDEO_SKIP
 #define CONFIG_VIDEO_BMP_LOGO
diff --git a/include/configs/imx6-engicam.h b/include/configs/imx6-engicam.h
index fed6545fdf9..47ecbf3b381 100644
--- a/include/configs/imx6-engicam.h
+++ b/include/configs/imx6-engicam.h
@@ -156,7 +156,6 @@
 #ifdef CONFIG_VIDEO_IPUV3
 # define CONFIG_IMX_VIDEO_SKIP
 
-# define CONFIG_VIDEO_LOGO
 # define CONFIG_VIDEO_BMP_LOGO
 #endif
 
diff --git a/include/configs/imxrt1050-evk.h b/include/configs/imxrt1050-evk.h
index 99d25c1e6ef..e26febb0a78 100644
--- a/include/configs/imxrt1050-evk.h
+++ b/include/configs/imxrt1050-evk.h
@@ -22,7 +22,6 @@
 					 DMAMEM_SZ_ALL)
 
 #ifdef CONFIG_DM_VIDEO
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 
 #define CONFIG_EXTRA_ENV_SETTINGS \
diff --git a/include/configs/ls1021aqds.h b/include/configs/ls1021aqds.h
index 27b97ffd2fb..c37593edb3f 100644
--- a/include/configs/ls1021aqds.h
+++ b/include/configs/ls1021aqds.h
@@ -323,7 +323,6 @@ unsigned long get_board_sys_clk(void);
  * Video
  */
 #ifdef CONFIG_VIDEO_FSL_DCU_FB
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 
 #define CONFIG_FSL_DIU_CH7301
diff --git a/include/configs/ls1021atwr.h b/include/configs/ls1021atwr.h
index c099629607f..0976bf2e575 100644
--- a/include/configs/ls1021atwr.h
+++ b/include/configs/ls1021atwr.h
@@ -209,7 +209,6 @@
  * Video
  */
 #ifdef CONFIG_VIDEO_FSL_DCU_FB
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 
 #define CONFIG_FSL_DCU_SII9022A
diff --git a/include/configs/m53menlo.h b/include/configs/m53menlo.h
index f94cf28b135..db8c4a12db2 100644
--- a/include/configs/m53menlo.h
+++ b/include/configs/m53menlo.h
@@ -112,7 +112,6 @@
 /*
  * LCD
  */
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_SYS_VIDEO_LOGO_MAX_SIZE	(2 << 20)
 
 /* LVDS display */
diff --git a/include/configs/mx23evk.h b/include/configs/mx23evk.h
index bccba5cbb17..4d2c4e43579 100644
--- a/include/configs/mx23evk.h
+++ b/include/configs/mx23evk.h
@@ -27,7 +27,6 @@
 
 /* Framebuffer support */
 #ifdef CONFIG_DM_VIDEO
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_SYS_VIDEO_LOGO_MAX_SIZE	(512 << 10)
 #endif
 
diff --git a/include/configs/mx28evk.h b/include/configs/mx28evk.h
index fe4ea8997d4..3eddc1bce07 100644
--- a/include/configs/mx28evk.h
+++ b/include/configs/mx28evk.h
@@ -41,7 +41,6 @@
 
 /* Framebuffer support */
 #ifdef CONFIG_DM_VIDEO
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_SYS_VIDEO_LOGO_MAX_SIZE	(512 << 10)
 #endif
 
diff --git a/include/configs/mx51evk.h b/include/configs/mx51evk.h
index 9cc297da30e..3512be8774e 100644
--- a/include/configs/mx51evk.h
+++ b/include/configs/mx51evk.h
@@ -45,7 +45,6 @@
 #define CONFIG_MXC_USB_FLAGS	MXC_EHCI_POWER_PINS_ENABLED
 
 /* Framebuffer and LCD */
-#define CONFIG_VIDEO_LOGO
 
 #define CONFIG_ETHPRIME		"FEC0"
 
diff --git a/include/configs/mx53loco.h b/include/configs/mx53loco.h
index b026c6ff89f..8fd5dc8d05a 100644
--- a/include/configs/mx53loco.h
+++ b/include/configs/mx53loco.h
@@ -146,6 +146,5 @@
 #endif
 
 /* Framebuffer and LCD */
-#define CONFIG_VIDEO_LOGO
 
 #endif				/* __CONFIG_H */
diff --git a/include/configs/mx6cuboxi.h b/include/configs/mx6cuboxi.h
index da2533637b0..7d3e651f44d 100644
--- a/include/configs/mx6cuboxi.h
+++ b/include/configs/mx6cuboxi.h
@@ -25,7 +25,6 @@
 #endif
 
 /* Framebuffer */
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_IMX_HDMI
 #define CONFIG_IMX_VIDEO_SKIP
diff --git a/include/configs/mx6sabre_common.h b/include/configs/mx6sabre_common.h
index 51f6b3ac462..97109032bbb 100644
--- a/include/configs/mx6sabre_common.h
+++ b/include/configs/mx6sabre_common.h
@@ -167,7 +167,6 @@
 /* Environment organization */
 
 /* Framebuffer */
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_IMX_HDMI
 #define CONFIG_IMX_VIDEO_SKIP
diff --git a/include/configs/mx6sxsabresd.h b/include/configs/mx6sxsabresd.h
index a554011d75d..1eca81ad073 100644
--- a/include/configs/mx6sxsabresd.h
+++ b/include/configs/mx6sxsabresd.h
@@ -161,7 +161,6 @@
 
 #ifndef CONFIG_SPL_BUILD
 #ifdef CONFIG_DM_VIDEO
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #define MXS_LCDIF_BASE MX6SX_LCDIF1_BASE_ADDR
 #endif
diff --git a/include/configs/mx6ul_14x14_evk.h b/include/configs/mx6ul_14x14_evk.h
index 0b777fbbdc0..987f6cb1b63 100644
--- a/include/configs/mx6ul_14x14_evk.h
+++ b/include/configs/mx6ul_14x14_evk.h
@@ -165,7 +165,6 @@
 
 #ifndef CONFIG_SPL_BUILD
 #if defined(CONFIG_DM_VIDEO)
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #define MXS_LCDIF_BASE MX6UL_LCDIF1_BASE_ADDR
 #endif
diff --git a/include/configs/mx7dsabresd.h b/include/configs/mx7dsabresd.h
index f11e2e3f807..f0ed44cc496 100644
--- a/include/configs/mx7dsabresd.h
+++ b/include/configs/mx7dsabresd.h
@@ -125,7 +125,6 @@
 #define CONFIG_USBD_HS
 
 #ifdef CONFIG_DM_VIDEO
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #endif
 
diff --git a/include/configs/nokia_rx51.h b/include/configs/nokia_rx51.h
index b37e05406e9..afb91d96a54 100644
--- a/include/configs/nokia_rx51.h
+++ b/include/configs/nokia_rx51.h
@@ -75,7 +75,6 @@
  * Framebuffer
  */
 /* Video console */
-#define CONFIG_VIDEO_LOGO
 #define VIDEO_FB_16BPP_PIXEL_SWAP
 #define VIDEO_FB_16BPP_WORD_SWAP
 
diff --git a/include/configs/novena.h b/include/configs/novena.h
index 28fb1b8d753..ec192c5eecb 100644
--- a/include/configs/novena.h
+++ b/include/configs/novena.h
@@ -87,7 +87,6 @@
 #endif
 
 /* Video output */
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_IMX_HDMI
 #define CONFIG_IMX_VIDEO_SKIP
 
diff --git a/include/configs/opos6uldev.h b/include/configs/opos6uldev.h
index d9311a49350..ad2d3ce29e3 100644
--- a/include/configs/opos6uldev.h
+++ b/include/configs/opos6uldev.h
@@ -41,7 +41,6 @@
 /* LCD */
 #ifndef CONFIG_SPL_BUILD
 #ifdef CONFIG_DM_VIDEO
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #define MXS_LCDIF_BASE MX6UL_LCDIF1_BASE_ADDR
 #endif
diff --git a/include/configs/pico-imx6.h b/include/configs/pico-imx6.h
index 2528d319d1f..19955623b7f 100644
--- a/include/configs/pico-imx6.h
+++ b/include/configs/pico-imx6.h
@@ -136,7 +136,6 @@
 #define CONFIG_FEC_MXC_PHYADDR		1
 
 /* Framebuffer */
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_IMX_HDMI
 #define CONFIG_IMX_VIDEO_SKIP
diff --git a/include/configs/pico-imx6ul.h b/include/configs/pico-imx6ul.h
index 3fe178316f7..442dd2a0fb5 100644
--- a/include/configs/pico-imx6ul.h
+++ b/include/configs/pico-imx6ul.h
@@ -133,7 +133,6 @@
 #define CONFIG_BOARD_SIZE_LIMIT		715776
 
 #ifdef CONFIG_DM_VIDEO
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #define MXS_LCDIF_BASE MX6UL_LCDIF1_BASE_ADDR
 #endif
diff --git a/include/configs/pico-imx7d.h b/include/configs/pico-imx7d.h
index cbac9505492..253283aab26 100644
--- a/include/configs/pico-imx7d.h
+++ b/include/configs/pico-imx7d.h
@@ -124,7 +124,6 @@
 #define CONFIG_POWER_PFUZE3000_I2C_ADDR	0x08
 
 #ifdef CONFIG_DM_VIDEO
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #endif
 
diff --git a/include/configs/pxm2.h b/include/configs/pxm2.h
index a333326dff6..498932dcfd7 100644
--- a/include/configs/pxm2.h
+++ b/include/configs/pxm2.h
@@ -108,7 +108,6 @@
 
 #if defined(CONFIG_VIDEO)
 #define CONFIG_VIDEO_DA8XX
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #define DA8XX_LCD_CNTL_BASE	LCD_CNTL_BASE
 #define PWM_TICKS	0x1388
diff --git a/include/configs/rut.h b/include/configs/rut.h
index 68d68d084d2..b1bf0c23a3c 100644
--- a/include/configs/rut.h
+++ b/include/configs/rut.h
@@ -97,7 +97,6 @@
 
 #if defined(CONFIG_VIDEO)
 #define CONFIG_VIDEO_DA8XX
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #define DA8XX_LCD_CNTL_BASE	LCD_CNTL_BASE
 
diff --git a/include/configs/s5p4418_nanopi2.h b/include/configs/s5p4418_nanopi2.h
index 2e94613c37a..1b1b2bfb67a 100644
--- a/include/configs/s5p4418_nanopi2.h
+++ b/include/configs/s5p4418_nanopi2.h
@@ -131,8 +131,6 @@
  * VIDEO
  */
 
-#define CONFIG_VIDEO_LOGO
-
 #ifdef CONFIG_VIDEO_LOGO
 #ifdef CONFIG_SPLASH_SCREEN
 #define SPLASH_FILE			logo.bmp
diff --git a/include/configs/wandboard.h b/include/configs/wandboard.h
index ece762e512d..051c18ca232 100644
--- a/include/configs/wandboard.h
+++ b/include/configs/wandboard.h
@@ -32,7 +32,6 @@
 #define CONFIG_MXC_USB_FLAGS		0
 
 /* Framebuffer */
-#define CONFIG_VIDEO_LOGO
 #define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_IMX_HDMI
 #define CONFIG_IMX_VIDEO_SKIP
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index b9c1c61e13d..5c4df1ebccb 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -3052,7 +3052,6 @@ CONFIG_VIDEO_BCM2835
 CONFIG_VIDEO_BMP_LOGO
 CONFIG_VIDEO_DA8XX
 CONFIG_VIDEO_FONT_4X6
-CONFIG_VIDEO_LOGO
 CONFIG_VIDEO_MXS_MODE_SYSTEM
 CONFIG_VIDEO_STD_TIMINGS
 CONFIG_VID_FLS_ENV
-- 
2.34.0.rc2.393.gf8c9666880-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
