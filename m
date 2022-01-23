Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEA94971D5
	for <lists+uboot-stm32@lfdr.de>; Sun, 23 Jan 2022 15:04:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35F28C5EC6C;
	Sun, 23 Jan 2022 14:04:41 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1A5EC5AB61
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jan 2022 14:04:39 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id y17so126996ilm.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jan 2022 06:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OPH8KAER9/v+mDRIHdyPcc5tvZIDhi05XLA2xvtUmKk=;
 b=YSkFKmLvmW+6xHWyiIOkuaxWvvecJpcootSuoAAl/cEns0bkGJqXneVv9pFbsfYPfF
 D4O4fNK4lpvM6ZPYqU4iWmb7RaskwHKwqO/3X2K61UQ6iyCbHgXuoqMcTNSKlmOuT3yI
 MyzmrWdKitLxYGx7YMG3OdDC9xP1VGQs+XzJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OPH8KAER9/v+mDRIHdyPcc5tvZIDhi05XLA2xvtUmKk=;
 b=0ykfB2ruZ0IBrrH9rRZhD+1e3lu6Kwkk9TK5pfqnCAY1M5zqMfzAQDXH+0xEWCvZvG
 vJMUIMjH+59u2YV7WJHO71E6oPDGH5NU47GcOOMWj/chYJBqFPzwfNd2YW3WBnuTtuwh
 lQDOqnaXONlkBAaRddWJy7Y/he1rB5PRlulPKH046Bw3P95NCNbNjICqb9OIVVmwOsvf
 aVUvPbolqZAfEoWU2FrHgXzZwlEpC+0YT+rkgX9LWR8e5YV0V7nnxYKJp1SZktJAM5j0
 57Wk5AdMZBQ+STJIjyTdX/X2hMzBNh2ofUcu212iOezp0lMbdmWgmbrKvPqQIoocFMaX
 WSpg==
X-Gm-Message-State: AOAM533PNpC9tu/bAO6IxTYcXmskDtK6JNtY/aAFVSnn6bMkUu9ICdqv
 0iVgCRVyP2fKHsWi7WSyr5pYlA==
X-Google-Smtp-Source: ABdhPJx0dYE/F32lUAcFVekMXLxrwUS+OIXslu+pW1L7eTklhnQrctaRx5gVlAguL3hO8F7b5Ws9tw==
X-Received: by 2002:a92:ccc5:: with SMTP id u5mr5935226ilq.140.1642946678574; 
 Sun, 23 Jan 2022 06:04:38 -0800 (PST)
Received: from kiwi.bld.corp.google.com (c-67-190-101-114.hsd1.co.comcast.net.
 [67.190.101.114])
 by smtp.gmail.com with ESMTPSA id m1sm6136361ilu.87.2022.01.23.06.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 06:04:38 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sun, 23 Jan 2022 07:04:07 -0700
Message-Id: <20220123140415.3091482-7-sjg@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220123140415.3091482-1-sjg@chromium.org>
References: <20220123140415.3091482-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Baruch Siach <baruch@tkos.co.il>, Nikita Kiryanov <nikita@compulab.co.il>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Adrian Alonso <adrian.alonso@nxp.com>, Samuel Egli <samuel.egli@siemens.com>,
 Peng Fan <peng.fan@nxp.com>, Sean Anderson <seanga2@gmail.com>,
 =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Hu <richard.hu@technexion.com>,
 Marek Vasut <marex@denx.de>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Vanessa Maegima <vanessa.maegima@nxp.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 Jagan Teki <jagan@amarulasolutions.com>, Heiko Schocher <hs@denx.de>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Andre Przywara <andre.przywara@arm.com>, Tim Harvey <tharvey@gateworks.com>,
 Alison Wang <alison.wang@nxp.com>, Rick Chen <rick@andestech.com>,
 =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>,
 Anatolij Gustschin <agust@denx.de>, Priyanka Jain <priyanka.jain@nxp.com>,
 Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: [Uboot-stm32] [PATCH 06/14] video: Drop CONFIG_VIDEO_BMP_LOGO
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

This option is not implemented anymore. Drop it.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 README                            | 1 -
 include/configs/T102xRDB.h        | 1 -
 include/configs/T104xRDB.h        | 1 -
 include/configs/apalis_imx6.h     | 1 -
 include/configs/aristainetos2.h   | 1 -
 include/configs/cm_fx6.h          | 2 --
 include/configs/colibri-imx6ull.h | 1 -
 include/configs/colibri_imx6.h    | 1 -
 include/configs/colibri_imx7.h    | 4 ----
 include/configs/colibri_vf.h      | 1 -
 include/configs/embestmx6boards.h | 1 -
 include/configs/gw_ventana.h      | 1 -
 include/configs/imx6-engicam.h    | 2 --
 include/configs/imxrt1050-evk.h   | 2 --
 include/configs/ls1021aqds.h      | 2 --
 include/configs/ls1021atwr.h      | 2 --
 include/configs/mx6cuboxi.h       | 1 -
 include/configs/mx6sabre_common.h | 1 -
 include/configs/mx6sxsabresd.h    | 1 -
 include/configs/mx6ul_14x14_evk.h | 1 -
 include/configs/mx7dsabresd.h     | 4 ----
 include/configs/opos6uldev.h      | 1 -
 include/configs/pico-imx6.h       | 1 -
 include/configs/pico-imx6ul.h     | 1 -
 include/configs/pico-imx7d.h      | 4 ----
 include/configs/pxm2.h            | 1 -
 include/configs/rut.h             | 1 -
 include/configs/wandboard.h       | 1 -
 scripts/config_whitelist.txt      | 1 -
 29 files changed, 43 deletions(-)

diff --git a/README b/README
index 4fa369c4dd8..816d9c4dfb2 100644
--- a/README
+++ b/README
@@ -1016,7 +1016,6 @@ The following options need to be configured:
 			CONFIG_VIDEO
 			CONFIG_VIDEO_SW_CURSOR
 			CONFIG_VGA_AS_SINGLE_DEVICE
-			CONFIG_VIDEO_BMP_LOGO
 
 		The DIU driver will look for the 'video-mode' environment
 		variable, and if defined, enable the DIU as a console during
diff --git a/include/configs/T102xRDB.h b/include/configs/T102xRDB.h
index d24cfce8b3b..71c96102dd4 100644
--- a/include/configs/T102xRDB.h
+++ b/include/configs/T102xRDB.h
@@ -372,7 +372,6 @@
 #undef CONFIG_FSL_DIU_FB	/* RDB doesn't support DIU */
 #ifdef CONFIG_FSL_DIU_FB
 #define CONFIG_SYS_DIU_ADDR	(CONFIG_SYS_CCSRBAR + 0x180000)
-#define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_CFI_FLASH_USE_WEAK_ACCESSORS
 /*
  * With CONFIG_CFI_FLASH_USE_WEAK_ACCESSORS, flash I/O is really slow, so
diff --git a/include/configs/T104xRDB.h b/include/configs/T104xRDB.h
index f60010f7876..0a8694f186e 100644
--- a/include/configs/T104xRDB.h
+++ b/include/configs/T104xRDB.h
@@ -361,7 +361,6 @@
 #ifdef CONFIG_FSL_DIU_FB
 #define CONFIG_FSL_DIU_CH7301
 #define CONFIG_SYS_DIU_ADDR	(CONFIG_SYS_CCSRBAR + 0x180000)
-#define CONFIG_VIDEO_BMP_LOGO
 #endif
 #endif
 
diff --git a/include/configs/apalis_imx6.h b/include/configs/apalis_imx6.h
index c165f618be9..0a4ad980801 100644
--- a/include/configs/apalis_imx6.h
+++ b/include/configs/apalis_imx6.h
@@ -45,7 +45,6 @@
 #define CONFIG_USBD_HS
 
 /* Framebuffer and LCD */
-#define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_IMX_HDMI
 #define CONFIG_IMX_VIDEO_SKIP
 
diff --git a/include/configs/aristainetos2.h b/include/configs/aristainetos2.h
index e6397378e45..14163ae8b81 100644
--- a/include/configs/aristainetos2.h
+++ b/include/configs/aristainetos2.h
@@ -443,7 +443,6 @@
 /* Framebuffer */
 /* check this console not needed, after test remove it */
 #define CONFIG_IMX_VIDEO_SKIP
-#define CONFIG_VIDEO_BMP_LOGO
 
 #define CONFIG_IMX6_PWM_PER_CLK	66000000
 
diff --git a/include/configs/cm_fx6.h b/include/configs/cm_fx6.h
index 40bc8215480..df9c7d37221 100644
--- a/include/configs/cm_fx6.h
+++ b/include/configs/cm_fx6.h
@@ -176,8 +176,6 @@
 /* Display */
 #define CONFIG_IMX_HDMI
 
-#define CONFIG_VIDEO_BMP_LOGO
-
 /* EEPROM */
 
 #endif	/* __CONFIG_CM_FX6_H */
diff --git a/include/configs/colibri-imx6ull.h b/include/configs/colibri-imx6ull.h
index 787fe33941b..db8807a5569 100644
--- a/include/configs/colibri-imx6ull.h
+++ b/include/configs/colibri-imx6ull.h
@@ -164,7 +164,6 @@
 
 #if defined(CONFIG_DM_VIDEO)
 #define MXS_LCDIF_BASE MX6UL_LCDIF1_BASE_ADDR
-#define CONFIG_VIDEO_BMP_LOGO
 #endif
 
 #endif /* __COLIBRI_IMX6ULL_CONFIG_H */
diff --git a/include/configs/colibri_imx6.h b/include/configs/colibri_imx6.h
index c8e733bc366..d03263c96c6 100644
--- a/include/configs/colibri_imx6.h
+++ b/include/configs/colibri_imx6.h
@@ -35,7 +35,6 @@
 #define CONFIG_USBD_HS
 
 /* Framebuffer and LCD */
-#define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_IMX_HDMI
 #define CONFIG_IMX_VIDEO_SKIP
 
diff --git a/include/configs/colibri_imx7.h b/include/configs/colibri_imx7.h
index faf27ba4fa3..876e2d84884 100644
--- a/include/configs/colibri_imx7.h
+++ b/include/configs/colibri_imx7.h
@@ -196,8 +196,4 @@
 
 #define CONFIG_USBD_HS
 
-#if defined(CONFIG_DM_VIDEO)
-#define CONFIG_VIDEO_BMP_LOGO
-#endif
-
 #endif
diff --git a/include/configs/colibri_vf.h b/include/configs/colibri_vf.h
index 62f85185b76..3711e429a70 100644
--- a/include/configs/colibri_vf.h
+++ b/include/configs/colibri_vf.h
@@ -15,7 +15,6 @@
 #include <linux/sizes.h>
 
 #ifdef CONFIG_VIDEO_FSL_DCU_FB
-#define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_SYS_FSL_DCU_LE
 
 #define CONFIG_SYS_DCU_ADDR		DCU0_BASE_ADDR
diff --git a/include/configs/embestmx6boards.h b/include/configs/embestmx6boards.h
index 8ac92e480e0..f8e5c058114 100644
--- a/include/configs/embestmx6boards.h
+++ b/include/configs/embestmx6boards.h
@@ -52,7 +52,6 @@
 #endif
 
 /* Framebuffer */
-#define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_IMX_HDMI
 #define CONFIG_IMX_VIDEO_SKIP
 
diff --git a/include/configs/gw_ventana.h b/include/configs/gw_ventana.h
index 2853d75a163..f2dd862b7fe 100644
--- a/include/configs/gw_ventana.h
+++ b/include/configs/gw_ventana.h
@@ -73,7 +73,6 @@
 /* Framebuffer and LCD */
 #define CONFIG_IMX_HDMI
 #define CONFIG_IMX_VIDEO_SKIP
-#define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_HIDE_LOGO_VERSION  /* Custom config to hide U-boot version */
 
 /* Miscellaneous configurable options */
diff --git a/include/configs/imx6-engicam.h b/include/configs/imx6-engicam.h
index ff774ec54ba..26d7a88ebde 100644
--- a/include/configs/imx6-engicam.h
+++ b/include/configs/imx6-engicam.h
@@ -152,8 +152,6 @@
 /* Framebuffer */
 #ifdef CONFIG_VIDEO_IPUV3
 # define CONFIG_IMX_VIDEO_SKIP
-
-# define CONFIG_VIDEO_BMP_LOGO
 #endif
 
 /* SPL */
diff --git a/include/configs/imxrt1050-evk.h b/include/configs/imxrt1050-evk.h
index b507895a0d8..5c2f975ba7f 100644
--- a/include/configs/imxrt1050-evk.h
+++ b/include/configs/imxrt1050-evk.h
@@ -21,8 +21,6 @@
 					 DMAMEM_SZ_ALL)
 
 #ifdef CONFIG_DM_VIDEO
-#define CONFIG_VIDEO_BMP_LOGO
-
 #define CONFIG_EXTRA_ENV_SETTINGS \
 		"stdin=serial\0" \
 		"stdout=serial,vidconsole\0" \
diff --git a/include/configs/ls1021aqds.h b/include/configs/ls1021aqds.h
index 8c4cb7b7205..54860af946b 100644
--- a/include/configs/ls1021aqds.h
+++ b/include/configs/ls1021aqds.h
@@ -307,8 +307,6 @@
  * Video
  */
 #ifdef CONFIG_VIDEO_FSL_DCU_FB
-#define CONFIG_VIDEO_BMP_LOGO
-
 #define CONFIG_FSL_DIU_CH7301
 #define CONFIG_SYS_I2C_DVI_BUS_NUM	0
 #define CONFIG_SYS_I2C_QIXIS_ADDR	0x66
diff --git a/include/configs/ls1021atwr.h b/include/configs/ls1021atwr.h
index dcee79de884..dd47ba5efc6 100644
--- a/include/configs/ls1021atwr.h
+++ b/include/configs/ls1021atwr.h
@@ -198,8 +198,6 @@
  * Video
  */
 #ifdef CONFIG_VIDEO_FSL_DCU_FB
-#define CONFIG_VIDEO_BMP_LOGO
-
 #define CONFIG_FSL_DCU_SII9022A
 #define CONFIG_SYS_I2C_DVI_BUS_NUM	1
 #define CONFIG_SYS_I2C_DVI_ADDR		0x39
diff --git a/include/configs/mx6cuboxi.h b/include/configs/mx6cuboxi.h
index 7d3e651f44d..7cf65f56889 100644
--- a/include/configs/mx6cuboxi.h
+++ b/include/configs/mx6cuboxi.h
@@ -25,7 +25,6 @@
 #endif
 
 /* Framebuffer */
-#define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_IMX_HDMI
 #define CONFIG_IMX_VIDEO_SKIP
 
diff --git a/include/configs/mx6sabre_common.h b/include/configs/mx6sabre_common.h
index c1c012bbb53..e9781d52a37 100644
--- a/include/configs/mx6sabre_common.h
+++ b/include/configs/mx6sabre_common.h
@@ -153,7 +153,6 @@
 /* Environment organization */
 
 /* Framebuffer */
-#define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_IMX_HDMI
 #define CONFIG_IMX_VIDEO_SKIP
 
diff --git a/include/configs/mx6sxsabresd.h b/include/configs/mx6sxsabresd.h
index 8bc86749aac..fe9fef25d93 100644
--- a/include/configs/mx6sxsabresd.h
+++ b/include/configs/mx6sxsabresd.h
@@ -148,7 +148,6 @@
 
 #ifndef CONFIG_SPL_BUILD
 #ifdef CONFIG_DM_VIDEO
-#define CONFIG_VIDEO_BMP_LOGO
 #define MXS_LCDIF_BASE MX6SX_LCDIF1_BASE_ADDR
 #endif
 #endif
diff --git a/include/configs/mx6ul_14x14_evk.h b/include/configs/mx6ul_14x14_evk.h
index c24578aff1c..bc11cad2e4b 100644
--- a/include/configs/mx6ul_14x14_evk.h
+++ b/include/configs/mx6ul_14x14_evk.h
@@ -149,7 +149,6 @@
 
 #ifndef CONFIG_SPL_BUILD
 #if defined(CONFIG_DM_VIDEO)
-#define CONFIG_VIDEO_BMP_LOGO
 #define MXS_LCDIF_BASE MX6UL_LCDIF1_BASE_ADDR
 #endif
 #endif
diff --git a/include/configs/mx7dsabresd.h b/include/configs/mx7dsabresd.h
index d5b38fd91dd..d411b1a3866 100644
--- a/include/configs/mx7dsabresd.h
+++ b/include/configs/mx7dsabresd.h
@@ -122,8 +122,4 @@
 
 #define CONFIG_USBD_HS
 
-#ifdef CONFIG_DM_VIDEO
-#define CONFIG_VIDEO_BMP_LOGO
-#endif
-
 #endif	/* __CONFIG_H */
diff --git a/include/configs/opos6uldev.h b/include/configs/opos6uldev.h
index ac8eb052756..28104183b54 100644
--- a/include/configs/opos6uldev.h
+++ b/include/configs/opos6uldev.h
@@ -41,7 +41,6 @@
 /* LCD */
 #ifndef CONFIG_SPL_BUILD
 #ifdef CONFIG_DM_VIDEO
-#define CONFIG_VIDEO_BMP_LOGO
 #define MXS_LCDIF_BASE MX6UL_LCDIF1_BASE_ADDR
 #endif
 #endif
diff --git a/include/configs/pico-imx6.h b/include/configs/pico-imx6.h
index 4700fff0731..ddedd3cf787 100644
--- a/include/configs/pico-imx6.h
+++ b/include/configs/pico-imx6.h
@@ -135,7 +135,6 @@
 #define CONFIG_FEC_MXC_PHYADDR		1
 
 /* Framebuffer */
-#define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_IMX_HDMI
 #define CONFIG_IMX_VIDEO_SKIP
 
diff --git a/include/configs/pico-imx6ul.h b/include/configs/pico-imx6ul.h
index d87bcf45d6e..606a5bea1bf 100644
--- a/include/configs/pico-imx6ul.h
+++ b/include/configs/pico-imx6ul.h
@@ -130,7 +130,6 @@
 #define CONFIG_BOARD_SIZE_LIMIT		715776
 
 #ifdef CONFIG_DM_VIDEO
-#define CONFIG_VIDEO_BMP_LOGO
 #define MXS_LCDIF_BASE MX6UL_LCDIF1_BASE_ADDR
 #endif
 
diff --git a/include/configs/pico-imx7d.h b/include/configs/pico-imx7d.h
index eb87073a430..a90befc0116 100644
--- a/include/configs/pico-imx7d.h
+++ b/include/configs/pico-imx7d.h
@@ -119,10 +119,6 @@
 #define CONFIG_POWER_PFUZE3000
 #define CONFIG_POWER_PFUZE3000_I2C_ADDR	0x08
 
-#ifdef CONFIG_DM_VIDEO
-#define CONFIG_VIDEO_BMP_LOGO
-#endif
-
 /* FLASH and environment organization */
 
 /* Environment starts at 768k = 768 * 1024 = 786432 */
diff --git a/include/configs/pxm2.h b/include/configs/pxm2.h
index 753fc14ce0e..6cd7929db30 100644
--- a/include/configs/pxm2.h
+++ b/include/configs/pxm2.h
@@ -76,7 +76,6 @@
 
 #if defined(CONFIG_VIDEO)
 #define CONFIG_VIDEO_DA8XX
-#define CONFIG_VIDEO_BMP_LOGO
 #define DA8XX_LCD_CNTL_BASE	LCD_CNTL_BASE
 #define PWM_TICKS	0x1388
 #define PWM_DUTY	0x200
diff --git a/include/configs/rut.h b/include/configs/rut.h
index 02d330e4f0f..410c6d379c3 100644
--- a/include/configs/rut.h
+++ b/include/configs/rut.h
@@ -69,7 +69,6 @@
 
 #if defined(CONFIG_VIDEO)
 #define CONFIG_VIDEO_DA8XX
-#define CONFIG_VIDEO_BMP_LOGO
 #define DA8XX_LCD_CNTL_BASE	LCD_CNTL_BASE
 
 #define BOARD_LCD_RESET		115	/* Bank 3 pin 19 */
diff --git a/include/configs/wandboard.h b/include/configs/wandboard.h
index 051c18ca232..3ef7a507f3f 100644
--- a/include/configs/wandboard.h
+++ b/include/configs/wandboard.h
@@ -32,7 +32,6 @@
 #define CONFIG_MXC_USB_FLAGS		0
 
 /* Framebuffer */
-#define CONFIG_VIDEO_BMP_LOGO
 #define CONFIG_IMX_HDMI
 #define CONFIG_IMX_VIDEO_SKIP
 
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index e393fbee1b0..89f6717fdd9 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -2118,7 +2118,6 @@ CONFIG_U_BOOT_HDR_SIZE
 CONFIG_VAR_SIZE_SPL
 CONFIG_VERY_BIG_RAM
 CONFIG_VIDEO_BCM2835
-CONFIG_VIDEO_BMP_LOGO
 CONFIG_VIDEO_DA8XX
 CONFIG_VSC7385_ENET
 CONFIG_VSC7385_IMAGE
-- 
2.35.0.rc0.227.g00780c9af4-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
