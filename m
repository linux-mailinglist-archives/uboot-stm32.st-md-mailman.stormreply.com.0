Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FD078F6A1
	for <lists+uboot-stm32@lfdr.de>; Fri,  1 Sep 2023 03:14:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40B3BC6A61D;
	Fri,  1 Sep 2023 01:14:17 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02FBEC6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Sep 2023 01:14:16 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-7927f36120cso54165239f.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Aug 2023 18:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693530855; x=1694135655;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BsVQ2qB9dV5JRYsvQznVsAp8aRZKueYYfotzPQMuV3w=;
 b=mONI9Cnby10gtshOUgzLLkorGQ1yXBd003n2FLZUpInOYbYBOsYbFafOyZv74ZESxG
 IN5+yrP6NR1etmAx6M+H0r+fVZTx6UlfA4KDg4QJoBu28Pa2hKUXBvkr72l0tCgVSmcN
 3Eqt/CBnMyC3vI/LBmU/M11gmpNDgHEbMPTe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693530855; x=1694135655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BsVQ2qB9dV5JRYsvQznVsAp8aRZKueYYfotzPQMuV3w=;
 b=lMzK2BOSpmTtx8YXfmcs4oaPSZKic2ZFamGDbPcV8HmNQSr//ij8LjnHtjVC1sRI1U
 OguPH5XWs6R8yjVm8nHeX4dAUOufA6x9XfT86Y1Chw6epYIcR8tePEwVXotzf2KCXq3E
 Y+H2/ZvBI6Z/GcYXRdRAbBybsdx8GnL9oQo8glQNlt4R788sDkshhW0UQghseWxLNJl7
 BtthXHNkmIOECnCsDmf36DD1ZbzwtVp0nBNEuZLuhiBqHsV+J5D5aUj6S7u7LqNEf20S
 JpG7i5fNPHYWuL23nfEJaVMA1cuOVDKsuhOaMpFLZhtT+M/jKCTSQuuQO3WJefWhpRXS
 EVng==
X-Gm-Message-State: AOJu0YwCWR65iFfGHY7bM6SDfZpJdOckXtvgIzeWkXdzI57AQ7AKVMyD
 E1ds7MWfrRMsNlreTSPFLUVnvg==
X-Google-Smtp-Source: AGHT+IEvkV9j/fk1lsPRWskAKgEtB9V5j6uuAl8rygb08x9JHje+5gLP7Fl2qaqzknI+8Yd01Z0CmA==
X-Received: by 2002:a5d:84ca:0:b0:790:ff32:eb3 with SMTP id
 z10-20020a5d84ca000000b00790ff320eb3mr943433ior.17.1693530854932; 
 Thu, 31 Aug 2023 18:14:14 -0700 (PDT)
Received: from sjg1.lan (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
 by smtp.gmail.com with ESMTPSA id
 dk8-20020a0566384bc800b0042b279bb086sm712101jab.66.2023.08.31.18.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 18:14:14 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Thu, 31 Aug 2023 19:13:44 -0600
Message-ID: <20230901011357.2482203-7-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230901011357.2482203-1-sjg@chromium.org>
References: <20230901011357.2482203-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Mark Kettenis <kettenis@openbsd.org>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Dzmitry Sankouski <dsankouski@gmail.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Brandon Maier <brandon.maier@collins.com>,
 Kautuk Consul <kconsul@ventanamicro.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Sjoerd Simons <sjoerd@collabora.com>,
 Sam Shih <sam.shih@mediatek.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Yixun Lan <dlan@gentoo.org>, Wei Fu <wefu@redhat.com>,
 Michal Simek <michal.simek@amd.com>, Sumit Garg <sumit.garg@linaro.org>
Subject: [Uboot-stm32] [PATCH v2 06/14] lmb: Rename LMB_MAX_REGIONS and
	LMB_USE_MAX_REGIONS
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

These refer to the maximum number of areas, so rename them.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Add new patch to rename LMB_MAX_REGIONS and LMB_USE_MAX_REGIONS

 configs/a3y17lte_defconfig           |  2 +-
 configs/a5y17lte_defconfig           |  2 +-
 configs/a7y17lte_defconfig           |  2 +-
 configs/apple_m1_defconfig           |  2 +-
 configs/dragonboard845c_defconfig    |  2 +-
 configs/mt7981_emmc_rfb_defconfig    |  2 +-
 configs/mt7981_rfb_defconfig         |  2 +-
 configs/mt7981_sd_rfb_defconfig      |  2 +-
 configs/mt7986_rfb_defconfig         |  2 +-
 configs/mt7986a_bpir3_emmc_defconfig |  2 +-
 configs/mt7986a_bpir3_sd_defconfig   |  2 +-
 configs/qcs404evb_defconfig          |  2 +-
 configs/starqltechn_defconfig        |  2 +-
 configs/stm32mp13_defconfig          |  2 +-
 configs/stm32mp15_basic_defconfig    |  2 +-
 configs/stm32mp15_defconfig          |  2 +-
 configs/stm32mp15_trusted_defconfig  |  2 +-
 configs/th1520_lpi4a_defconfig       |  2 +-
 include/lmb.h                        | 14 ++++-----
 lib/Kconfig                          | 24 +++++++--------
 lib/lmb.c                            |  6 ++--
 test/lib/lmb.c                       | 44 ++++++++++++++--------------
 22 files changed, 62 insertions(+), 62 deletions(-)

diff --git a/configs/a3y17lte_defconfig b/configs/a3y17lte_defconfig
index 42fcd2a3d317..4db2274731ad 100644
--- a/configs/a3y17lte_defconfig
+++ b/configs/a3y17lte_defconfig
@@ -24,4 +24,4 @@ CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_CMD_GPIO=y
 CONFIG_CMD_I2C=y
 CONFIG_DM_I2C_GPIO=y
-CONFIG_LMB_MAX_REGIONS=64
+CONFIG_LMB_MAX_AREAS=64
diff --git a/configs/a5y17lte_defconfig b/configs/a5y17lte_defconfig
index 3b80536c12c8..4bcd8313630c 100644
--- a/configs/a5y17lte_defconfig
+++ b/configs/a5y17lte_defconfig
@@ -24,4 +24,4 @@ CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_CMD_GPIO=y
 CONFIG_CMD_I2C=y
 CONFIG_DM_I2C_GPIO=y
-CONFIG_LMB_MAX_REGIONS=64
+CONFIG_LMB_MAX_AREAS=64
diff --git a/configs/a7y17lte_defconfig b/configs/a7y17lte_defconfig
index 9390e35057eb..7236b70e4f88 100644
--- a/configs/a7y17lte_defconfig
+++ b/configs/a7y17lte_defconfig
@@ -24,4 +24,4 @@ CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_CMD_GPIO=y
 CONFIG_CMD_I2C=y
 CONFIG_DM_I2C_GPIO=y
-CONFIG_LMB_MAX_REGIONS=64
+CONFIG_LMB_MAX_AREAS=64
diff --git a/configs/apple_m1_defconfig b/configs/apple_m1_defconfig
index d58a9030dbd0..618baee132fa 100644
--- a/configs/apple_m1_defconfig
+++ b/configs/apple_m1_defconfig
@@ -22,4 +22,4 @@ CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_NO_FB_CLEAR=y
 CONFIG_VIDEO_SIMPLE=y
 # CONFIG_GENERATE_SMBIOS_TABLE is not set
-CONFIG_LMB_MAX_REGIONS=64
+CONFIG_LMB_MAX_AREAS=64
diff --git a/configs/dragonboard845c_defconfig b/configs/dragonboard845c_defconfig
index a69d82761a8d..17b1e4ffd7df 100644
--- a/configs/dragonboard845c_defconfig
+++ b/configs/dragonboard845c_defconfig
@@ -26,4 +26,4 @@ CONFIG_DM_PMIC=y
 CONFIG_PMIC_QCOM=y
 CONFIG_MSM_GENI_SERIAL=y
 CONFIG_SPMI_MSM=y
-CONFIG_LMB_MAX_REGIONS=64
+CONFIG_LMB_MAX_AREAS=64
diff --git a/configs/mt7981_emmc_rfb_defconfig b/configs/mt7981_emmc_rfb_defconfig
index b3b37b6e5ed4..44dbfa86e9b1 100644
--- a/configs/mt7981_emmc_rfb_defconfig
+++ b/configs/mt7981_emmc_rfb_defconfig
@@ -62,4 +62,4 @@ CONFIG_MTK_SERIAL=y
 CONFIG_FAT_WRITE=y
 CONFIG_HEXDUMP=y
 # CONFIG_EFI_LOADER is not set
-CONFIG_LMB_MAX_REGIONS=64
+CONFIG_LMB_MAX_AREAS=64
diff --git a/configs/mt7981_rfb_defconfig b/configs/mt7981_rfb_defconfig
index b7ffb4dfa74d..4fc9dd92fe43 100644
--- a/configs/mt7981_rfb_defconfig
+++ b/configs/mt7981_rfb_defconfig
@@ -64,4 +64,4 @@ CONFIG_SPI=y
 CONFIG_DM_SPI=y
 CONFIG_MTK_SPIM=y
 CONFIG_HEXDUMP=y
-CONFIG_LMB_MAX_REGIONS=64
+CONFIG_LMB_MAX_AREAS=64
diff --git a/configs/mt7981_sd_rfb_defconfig b/configs/mt7981_sd_rfb_defconfig
index 85be9bbc5030..2cbac6adde83 100644
--- a/configs/mt7981_sd_rfb_defconfig
+++ b/configs/mt7981_sd_rfb_defconfig
@@ -62,4 +62,4 @@ CONFIG_MTK_SERIAL=y
 CONFIG_FAT_WRITE=y
 CONFIG_HEXDUMP=y
 # CONFIG_EFI_LOADER is not set
-CONFIG_LMB_MAX_REGIONS=64
+CONFIG_LMB_MAX_AREAS=64
diff --git a/configs/mt7986_rfb_defconfig b/configs/mt7986_rfb_defconfig
index ac91c93efb42..73b2cad4275e 100644
--- a/configs/mt7986_rfb_defconfig
+++ b/configs/mt7986_rfb_defconfig
@@ -64,4 +64,4 @@ CONFIG_SPI=y
 CONFIG_DM_SPI=y
 CONFIG_MTK_SPIM=y
 CONFIG_HEXDUMP=y
-CONFIG_LMB_MAX_REGIONS=64
+CONFIG_LMB_MAX_AREAS=64
diff --git a/configs/mt7986a_bpir3_emmc_defconfig b/configs/mt7986a_bpir3_emmc_defconfig
index 5b76512a46f6..ee8f58bdbe09 100644
--- a/configs/mt7986a_bpir3_emmc_defconfig
+++ b/configs/mt7986a_bpir3_emmc_defconfig
@@ -62,4 +62,4 @@ CONFIG_MTK_SERIAL=y
 CONFIG_FAT_WRITE=y
 CONFIG_HEXDUMP=y
 # CONFIG_EFI_LOADER is not set
-CONFIG_LMB_MAX_REGIONS=64
+CONFIG_LMB_MAX_AREAS=64
diff --git a/configs/mt7986a_bpir3_sd_defconfig b/configs/mt7986a_bpir3_sd_defconfig
index 36547db91423..b301a626a946 100644
--- a/configs/mt7986a_bpir3_sd_defconfig
+++ b/configs/mt7986a_bpir3_sd_defconfig
@@ -62,4 +62,4 @@ CONFIG_MTK_SERIAL=y
 CONFIG_FAT_WRITE=y
 CONFIG_HEXDUMP=y
 # CONFIG_EFI_LOADER is not set
-CONFIG_LMB_MAX_REGIONS=64
+CONFIG_LMB_MAX_AREAS=64
diff --git a/configs/qcs404evb_defconfig b/configs/qcs404evb_defconfig
index 9e72f64f7849..811d8b2bd4c8 100644
--- a/configs/qcs404evb_defconfig
+++ b/configs/qcs404evb_defconfig
@@ -52,4 +52,4 @@ CONFIG_USB_XHCI_DWC3=y
 CONFIG_USB_DWC3=y
 CONFIG_USB_DWC3_GENERIC=y
 CONFIG_USB_STORAGE=y
-CONFIG_LMB_MAX_REGIONS=64
+CONFIG_LMB_MAX_AREAS=64
diff --git a/configs/starqltechn_defconfig b/configs/starqltechn_defconfig
index 5b85ce5fe96f..4522928125f7 100644
--- a/configs/starqltechn_defconfig
+++ b/configs/starqltechn_defconfig
@@ -38,4 +38,4 @@ CONFIG_VIDEO_FONT_16X32=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_VIDEO_SIMPLE=y
 CONFIG_VIDEO_DT_SIMPLEFB=y
-CONFIG_LMB_MAX_REGIONS=64
+CONFIG_LMB_MAX_AREAS=64
diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index 98fcfeb5fa61..0f6fa08c0002 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -73,6 +73,6 @@ CONFIG_TEE=y
 CONFIG_OPTEE=y
 # CONFIG_OPTEE_TA_AVB is not set
 CONFIG_ERRNO_STR=y
-# CONFIG_LMB_USE_MAX_REGIONS is not set
+# CONFIG_LMB_USE_MAX_AREAS is not set
 CONFIG_LMB_MEMORY_AREAS=2
 CONFIG_LMB_RESERVED_AREAS=16
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 7b5655d957d9..1aeaabb22a4e 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -188,6 +188,6 @@ CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
 # CONFIG_BINMAN_FDT is not set
 CONFIG_ERRNO_STR=y
-# CONFIG_LMB_USE_MAX_REGIONS is not set
+# CONFIG_LMB_USE_MAX_AREAS is not set
 CONFIG_LMB_MEMORY_AREAS=2
 CONFIG_LMB_RESERVED_AREAS=16
diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
index 643ec201c644..a17749411c62 100644
--- a/configs/stm32mp15_defconfig
+++ b/configs/stm32mp15_defconfig
@@ -164,6 +164,6 @@ CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
 # CONFIG_BINMAN_FDT is not set
 CONFIG_ERRNO_STR=y
-# CONFIG_LMB_USE_MAX_REGIONS is not set
+# CONFIG_LMB_USE_MAX_AREAS is not set
 CONFIG_LMB_MEMORY_AREAS=2
 CONFIG_LMB_RESERVED_AREAS=16
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 2a8162a870c5..45ef9fe9aa12 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -164,6 +164,6 @@ CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
 # CONFIG_BINMAN_FDT is not set
 CONFIG_ERRNO_STR=y
-# CONFIG_LMB_USE_MAX_REGIONS is not set
+# CONFIG_LMB_USE_MAX_AREAS is not set
 CONFIG_LMB_MEMORY_AREAS=2
 CONFIG_LMB_RESERVED_AREAS=16
diff --git a/configs/th1520_lpi4a_defconfig b/configs/th1520_lpi4a_defconfig
index 710ec6abf520..ff88729541ff 100644
--- a/configs/th1520_lpi4a_defconfig
+++ b/configs/th1520_lpi4a_defconfig
@@ -79,4 +79,4 @@ CONFIG_BZIP2=y
 CONFIG_ZSTD=y
 CONFIG_LIB_RATIONAL=y
 # CONFIG_EFI_LOADER is not set
-# CONFIG_LMB_USE_MAX_REGIONS is not set
+# CONFIG_LMB_USE_MAX_AREAS is not set
diff --git a/include/lmb.h b/include/lmb.h
index d963ac28d9ac..3cf23d2f2346 100644
--- a/include/lmb.h
+++ b/include/lmb.h
@@ -37,14 +37,14 @@ struct lmb_area {
 
 /*
  * For regions size management, see LMB configuration in KConfig
- * all the #if test are done with CONFIG_LMB_USE_MAX_REGIONS (boolean)
+ * all the #if test are done with CONFIG_LMB_USE_MAX_AREAS (boolean)
  *
- * case 1. CONFIG_LMB_USE_MAX_REGIONS is defined (legacy mode)
- *         => CONFIG_LMB_MAX_REGIONS is used to configure the region size,
+ * case 1. CONFIG_LMB_USE_MAX_AREAS is defined (legacy mode)
+ *         => CONFIG_LMB_MAX_AREAS is used to configure the region size,
  *         directly in the array lmb_region.region[], with the same
  *         configuration for memory and reserved regions.
  *
- * case 2. CONFIG_LMB_USE_MAX_REGIONS is not defined, the size of each
+ * case 2. CONFIG_LMB_USE_MAX_AREAS is not defined, the size of each
  *         region is configurated *independently* with
  *         => CONFIG_LMB_MEMORY_AREAS: struct lmb.memory_regions
  *         => CONFIG_LMB_RESERVED_AREAS: struct lmb.reserved_regions
@@ -63,8 +63,8 @@ struct lmb_area {
 struct lmb_region {
 	unsigned long cnt;
 	unsigned long max;
-#if IS_ENABLED(CONFIG_LMB_USE_MAX_REGIONS)
-	struct lmb_area area[CONFIG_LMB_MAX_REGIONS];
+#if IS_ENABLED(CONFIG_LMB_USE_MAX_AREAS)
+	struct lmb_area area[CONFIG_LMB_MAX_AREAS];
 #else
 	struct lmb_area *area;
 #endif
@@ -86,7 +86,7 @@ struct lmb_region {
 struct lmb {
 	struct lmb_region memory;
 	struct lmb_region reserved;
-#if !IS_ENABLED(CONFIG_LMB_USE_MAX_REGIONS)
+#if !IS_ENABLED(CONFIG_LMB_USE_MAX_AREAS)
 	struct lmb_area memory_areas[CONFIG_LMB_MEMORY_AREAS];
 	struct lmb_area reserved_areas[CONFIG_LMB_RESERVED_AREAS];
 #endif
diff --git a/lib/Kconfig b/lib/Kconfig
index 53f1332a8f83..e8c88591ffa5 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -1075,38 +1075,38 @@ config LMB
 	help
 	  Support the library logical memory blocks.
 
-config LMB_USE_MAX_REGIONS
+config LMB_USE_MAX_AREAS
 	bool "Use a common number of memory and reserved regions in lmb lib"
 	default y
 	help
-	  Define the number of supported memory regions in the library logical
+	  Define the number of supported memory areas in the library logical
 	  memory blocks.
 	  This feature allow to reduce the lmb library size by using compiler
 	  optimization when LMB_MEMORY_AREAS == LMB_RESERVED_AREAS.
 
-config LMB_MAX_REGIONS
-	int "Number of memory and reserved regions in lmb lib"
-	depends on LMB_USE_MAX_REGIONS
+config LMB_MAX_AREAS
+	int "Number of memory and reserved areas in lmb lib"
+	depends on LMB_USE_MAX_AREAS
 	default 16
 	help
-	  Define the number of supported regions, memory and reserved, in the
+	  Define the number of supported areas, memory and reserved, in the
 	  library logical memory blocks.
 
 config LMB_MEMORY_AREAS
-	int "Number of memory regions in lmb lib"
-	depends on !LMB_USE_MAX_REGIONS
+	int "Number of memory areas in lmb lib"
+	depends on !LMB_USE_MAX_AREAS
 	default 8
 	help
-	  Define the number of supported memory regions in the library logical
+	  Define the number of supported memory areas in the library logical
 	  memory blocks.
 	  The minimal value is CONFIG_NR_DRAM_BANKS.
 
 config LMB_RESERVED_AREAS
-	int "Number of reserved regions in lmb lib"
-	depends on !LMB_USE_MAX_REGIONS
+	int "Number of reserved areas in lmb lib"
+	depends on !LMB_USE_MAX_AREAS
 	default 8
 	help
-	  Define the number of supported reserved regions in the library logical
+	  Define the number of supported reserved areas in the library logical
 	  memory blocks.
 
 config PHANDLE_CHECK_SEQ
diff --git a/lib/lmb.c b/lib/lmb.c
index f4321d10118b..6061c6f361c6 100644
--- a/lib/lmb.c
+++ b/lib/lmb.c
@@ -107,9 +107,9 @@ static void lmb_coalesce_regions(struct lmb_region *rgn, unsigned long r1,
 
 void lmb_init(struct lmb *lmb)
 {
-#if IS_ENABLED(CONFIG_LMB_USE_MAX_REGIONS)
-	lmb->memory.max = CONFIG_LMB_MAX_REGIONS;
-	lmb->reserved.max = CONFIG_LMB_MAX_REGIONS;
+#if IS_ENABLED(CONFIG_LMB_USE_MAX_AREAS)
+	lmb->memory.max = CONFIG_LMB_MAX_AREAS;
+	lmb->reserved.max = CONFIG_LMB_MAX_AREAS;
 #else
 	lmb->memory.max = CONFIG_LMB_MEMORY_AREAS;
 	lmb->reserved.max = CONFIG_LMB_RESERVED_AREAS;
diff --git a/test/lib/lmb.c b/test/lib/lmb.c
index a5c96993f7f9..b665d8dcdeb4 100644
--- a/test/lib/lmb.c
+++ b/test/lib/lmb.c
@@ -665,8 +665,8 @@ static int lib_test_lmb_get_free_size(struct unit_test_state *uts)
 DM_TEST(lib_test_lmb_get_free_size,
 	UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
 
-#ifdef CONFIG_LMB_USE_MAX_REGIONS
-static int lib_test_lmb_max_regions(struct unit_test_state *uts)
+#ifdef CONFIG_LMB_USE_MAX_AREAS
+static int lib_test_LMB_MAX_AREAS(struct unit_test_state *uts)
 {
 	const phys_addr_t ram = 0x00000000;
 	/*
@@ -674,8 +674,8 @@ static int lib_test_lmb_max_regions(struct unit_test_state *uts)
 	 * we need to scale ram_size (which in this case is the size of the lmb
 	 * region) to match.
 	 */
-	const phys_size_t ram_size = ((0xFFFFFFFF >> CONFIG_LMB_MAX_REGIONS)
-			+ 1) * CONFIG_LMB_MAX_REGIONS;
+	const phys_size_t ram_size = ((0xFFFFFFFF >> CONFIG_LMB_MAX_AREAS)
+			+ 1) * CONFIG_LMB_MAX_AREAS;
 	const phys_size_t blk_size = 0x10000;
 	phys_addr_t offset;
 	struct lmb lmb;
@@ -684,57 +684,57 @@ static int lib_test_lmb_max_regions(struct unit_test_state *uts)
 	lmb_init(&lmb);
 
 	ut_asserteq(lmb.memory.cnt, 0);
-	ut_asserteq(lmb.memory.max, CONFIG_LMB_MAX_REGIONS);
+	ut_asserteq(lmb.memory.max, CONFIG_LMB_MAX_AREAS);
 	ut_asserteq(lmb.reserved.cnt, 0);
-	ut_asserteq(lmb.reserved.max, CONFIG_LMB_MAX_REGIONS);
+	ut_asserteq(lmb.reserved.max, CONFIG_LMB_MAX_AREAS);
 
-	/*  Add CONFIG_LMB_MAX_REGIONS memory regions */
-	for (i = 0; i < CONFIG_LMB_MAX_REGIONS; i++) {
+	/*  Add CONFIG_LMB_MAX_AREAS memory regions */
+	for (i = 0; i < CONFIG_LMB_MAX_AREAS; i++) {
 		offset = ram + 2 * i * ram_size;
 		ret = lmb_add(&lmb, offset, ram_size);
 		ut_asserteq(ret, 0);
 	}
-	ut_asserteq(lmb.memory.cnt, CONFIG_LMB_MAX_REGIONS);
+	ut_asserteq(lmb.memory.cnt, CONFIG_LMB_MAX_AREAS);
 	ut_asserteq(lmb.reserved.cnt, 0);
 
-	/*  error for the (CONFIG_LMB_MAX_REGIONS + 1) memory regions */
-	offset = ram + 2 * (CONFIG_LMB_MAX_REGIONS + 1) * ram_size;
+	/*  error for the (CONFIG_LMB_MAX_AREAS + 1) memory regions */
+	offset = ram + 2 * (CONFIG_LMB_MAX_AREAS + 1) * ram_size;
 	ret = lmb_add(&lmb, offset, ram_size);
 	ut_asserteq(ret, -1);
 
-	ut_asserteq(lmb.memory.cnt, CONFIG_LMB_MAX_REGIONS);
+	ut_asserteq(lmb.memory.cnt, CONFIG_LMB_MAX_AREAS);
 	ut_asserteq(lmb.reserved.cnt, 0);
 
-	/*  reserve CONFIG_LMB_MAX_REGIONS regions */
-	for (i = 0; i < CONFIG_LMB_MAX_REGIONS; i++) {
+	/*  reserve CONFIG_LMB_MAX_AREAS regions */
+	for (i = 0; i < CONFIG_LMB_MAX_AREAS; i++) {
 		offset = ram + 2 * i * blk_size;
 		ret = lmb_reserve(&lmb, offset, blk_size);
 		ut_asserteq(ret, 0);
 	}
 
-	ut_asserteq(lmb.memory.cnt, CONFIG_LMB_MAX_REGIONS);
-	ut_asserteq(lmb.reserved.cnt, CONFIG_LMB_MAX_REGIONS);
+	ut_asserteq(lmb.memory.cnt, CONFIG_LMB_MAX_AREAS);
+	ut_asserteq(lmb.reserved.cnt, CONFIG_LMB_MAX_AREAS);
 
 	/*  error for the 9th reserved blocks */
-	offset = ram + 2 * (CONFIG_LMB_MAX_REGIONS + 1) * blk_size;
+	offset = ram + 2 * (CONFIG_LMB_MAX_AREAS + 1) * blk_size;
 	ret = lmb_reserve(&lmb, offset, blk_size);
 	ut_asserteq(ret, -1);
 
-	ut_asserteq(lmb.memory.cnt, CONFIG_LMB_MAX_REGIONS);
-	ut_asserteq(lmb.reserved.cnt, CONFIG_LMB_MAX_REGIONS);
+	ut_asserteq(lmb.memory.cnt, CONFIG_LMB_MAX_AREAS);
+	ut_asserteq(lmb.reserved.cnt, CONFIG_LMB_MAX_AREAS);
 
 	/*  check each regions */
-	for (i = 0; i < CONFIG_LMB_MAX_REGIONS; i++)
+	for (i = 0; i < CONFIG_LMB_MAX_AREAS; i++)
 		ut_asserteq(lmb.memory.area[i].base, ram + 2 * i * ram_size);
 
-	for (i = 0; i < CONFIG_LMB_MAX_REGIONS; i++)
+	for (i = 0; i < CONFIG_LMB_MAX_AREAS; i++)
 		ut_asserteq(lmb.reserved.area[i].base, ram + 2 * i * blk_size);
 
 	return 0;
 }
 #endif
 
-DM_TEST(lib_test_lmb_max_regions,
+DM_TEST(lib_test_LMB_MAX_AREAS,
 	UT_TESTF_SCAN_PDATA | UT_TESTF_SCAN_FDT);
 
 static int lib_test_lmb_flags(struct unit_test_state *uts)
-- 
2.42.0.283.g2d96d420d3-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
