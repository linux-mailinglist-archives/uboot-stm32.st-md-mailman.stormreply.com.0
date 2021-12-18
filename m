Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E69E3479C08
	for <lists+uboot-stm32@lfdr.de>; Sat, 18 Dec 2021 19:28:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B367C5EC76;
	Sat, 18 Dec 2021 18:28:02 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F4D1C5A4FE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Dec 2021 18:28:01 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id f11so2922985ilr.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Dec 2021 10:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e13N9vjmswNl6tGW9xKh+kVwo8dybb97wCJ14cxH/kk=;
 b=ROnKkbOvEDbWjrWwfUsBMh7wiDsWcIcbjStQtKH5lELFoP+rCIUEQ48lo21rmugf00
 C5Ht9u2K8DJ2BU4pBn/0nZxvyOMEtMBFheiwtWNzOJSn10XZ2WoqC1i23WclsXhXmLr6
 yVdn5qP0B+hchJlnY9d0jiXbq0GT61mDkAio8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e13N9vjmswNl6tGW9xKh+kVwo8dybb97wCJ14cxH/kk=;
 b=7twi3tBfYdRVuQCnl7GP3PebMXJAn2hV/a4bOMyHlceb7ng5RbJuMyArqdYJOsoS0q
 Bne1zvsRoiSLVfnNpQhlyyX6jj+cpZZNG/ZmcQVaxJm6jOzXKL8itTU6SMYyawYr5pUO
 FHFfcSBg9O2dJdeRkD+IxqpMZpou4DJfdVeP5PJA5bPp16XaI9aFSIMKy+h47WkAHMxD
 mNZSYKq5J+QYr5xAjJ23a6ybRbojU23XS3Lw5telbrlLUbD4WDaMgyStHCFc3fD7FioV
 RtIens0KkxVyDzWJDWn0opqTnsjYcjfVB0s96DVknMQCRNC/vUPcST+ApwMmrreBosU3
 EcJw==
X-Gm-Message-State: AOAM531gjjAH/FQJa+uzaI6jN6jeiHnPXGDtnl8HRZkks8UW9eQQJqci
 qDhvufAmJ12uYxo429dkUr3Peg==
X-Google-Smtp-Source: ABdhPJzwSLU93LQjG2tocxRA2VlmHa7kyZgXtbmqQAgA+9vNt2OUa0MWDZYnY7VClU+FkoerxugdQQ==
X-Received: by 2002:a92:d410:: with SMTP id q16mr322117ilm.295.1639852080570; 
 Sat, 18 Dec 2021 10:28:00 -0800 (PST)
Received: from kiwi.bld.corp.google.com (c-67-190-101-114.hsd1.co.comcast.net.
 [67.190.101.114])
 by smtp.gmail.com with ESMTPSA id k13sm8369628iow.45.2021.12.18.10.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 10:28:00 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sat, 18 Dec 2021 11:27:51 -0700
Message-Id: <20211218182752.1121322-4-sjg@chromium.org>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
In-Reply-To: <20211218182752.1121322-1-sjg@chromium.org>
References: <20211218182752.1121322-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Michal Simek <monstr@monstr.eu>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Mario Six <mario.six@gdsys.cc>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ramon Fried <rfried.dev@gmail.com>, Stefan Roese <sr@denx.de>,
 Andes <uboot@andestech.com>
Subject: [Uboot-stm32] [PATCH v2 4/5] Convert CONFIG_BOOTP_SERVERIP to
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
   CONFIG_BOOTP_SERVERIP

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Send the correct series

 README                                | 3 ---
 arch/arm/mach-stm32mp/Kconfig         | 1 +
 configs/adp-ae3xx_defconfig           | 1 +
 configs/adp-ag101p_defconfig          | 1 +
 configs/bitmain_antminer_s9_defconfig | 1 +
 configs/sandbox64_defconfig           | 1 +
 configs/sandbox_defconfig             | 1 +
 configs/sandbox_flattree_defconfig    | 1 +
 configs/sandbox_noinst_defconfig      | 1 +
 configs/sandbox_spl_defconfig         | 1 +
 include/configs/adp-ae3xx.h           | 2 --
 include/configs/adp-ag101p.h          | 2 --
 include/configs/bitmain_antminer_s9.h | 2 --
 include/configs/sandbox.h             | 2 --
 include/configs/stm32mp15_common.h    | 1 -
 net/Kconfig                           | 7 +++++++
 scripts/config_whitelist.txt          | 1 -
 17 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/README b/README
index 79843787eeb..f1b541a796d 100644
--- a/README
+++ b/README
@@ -1258,9 +1258,6 @@ The following options need to be configured:
 		CONFIG_BOOTP_VENDOREX
 		CONFIG_BOOTP_MAY_FAIL
 
-		CONFIG_BOOTP_SERVERIP - TFTP server will be the serverip
-		environment variable, not the BOOTP server.
-
 		CONFIG_BOOTP_MAY_FAIL - If the DHCP server is not found
 		after the configured retry count, the call will fail
 		instead of starting over.  This can be used to fail over
diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index a6c7fc5bfde..06ac349e2e7 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -173,6 +173,7 @@ config STM32_ETZPC
 	bool "STM32 Extended TrustZone Protection"
 	depends on STM32MP15x
 	default y
+	imply BOOTP_SERVERIP
 	help
 	  Say y to enable STM32 Extended TrustZone Protection
 
diff --git a/configs/adp-ae3xx_defconfig b/configs/adp-ae3xx_defconfig
index 3fa00fb4cc4..89f2a153b1d 100644
--- a/configs/adp-ae3xx_defconfig
+++ b/configs/adp-ae3xx_defconfig
@@ -30,6 +30,7 @@ CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_BOOTP_SEND_HOSTNAME=y
 CONFIG_NET_RANDOM_ETHADDR=y
+CONFIG_BOOTP_SERVERIP=y
 CONFIG_DM=y
 CONFIG_CLK=y
 CONFIG_MMC=y
diff --git a/configs/adp-ag101p_defconfig b/configs/adp-ag101p_defconfig
index cc6541b1e3b..b9d1117ff7d 100644
--- a/configs/adp-ag101p_defconfig
+++ b/configs/adp-ag101p_defconfig
@@ -28,6 +28,7 @@ CONFIG_ENV_IS_IN_FLASH=y
 CONFIG_ENV_ADDR=0x80140000
 CONFIG_BOOTP_SEND_HOSTNAME=y
 CONFIG_NET_RANDOM_ETHADDR=y
+CONFIG_BOOTP_SERVERIP=y
 CONFIG_DM=y
 CONFIG_MMC=y
 CONFIG_FTSDC010=y
diff --git a/configs/bitmain_antminer_s9_defconfig b/configs/bitmain_antminer_s9_defconfig
index 4cd6a7c102d..f6563333360 100644
--- a/configs/bitmain_antminer_s9_defconfig
+++ b/configs/bitmain_antminer_s9_defconfig
@@ -56,6 +56,7 @@ CONFIG_ENV_IS_IN_FAT=y
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_NET_RANDOM_ETHADDR=y
+CONFIG_BOOTP_SERVERIP=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_FPGA_XILINX=y
diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
index d849989cf61..bdf805ad197 100644
--- a/configs/sandbox64_defconfig
+++ b/configs/sandbox64_defconfig
@@ -96,6 +96,7 @@ CONFIG_ENV_IMPORT_FDT=y
 CONFIG_BOOTP_SEND_HOSTNAME=y
 CONFIG_NETCONSOLE=y
 CONFIG_IP_DEFRAG=y
+CONFIG_BOOTP_SERVERIP=y
 CONFIG_DM_DMA=y
 CONFIG_REGMAP=y
 CONFIG_SYSCON=y
diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
index c390afe9de5..36461b21b39 100644
--- a/configs/sandbox_defconfig
+++ b/configs/sandbox_defconfig
@@ -121,6 +121,7 @@ CONFIG_ENV_IMPORT_FDT=y
 CONFIG_BOOTP_SEND_HOSTNAME=y
 CONFIG_NETCONSOLE=y
 CONFIG_IP_DEFRAG=y
+CONFIG_BOOTP_SERVERIP=y
 CONFIG_DM_DMA=y
 CONFIG_DEVRES=y
 CONFIG_DEBUG_DEVRES=y
diff --git a/configs/sandbox_flattree_defconfig b/configs/sandbox_flattree_defconfig
index f184723a899..7d2130dd89c 100644
--- a/configs/sandbox_flattree_defconfig
+++ b/configs/sandbox_flattree_defconfig
@@ -76,6 +76,7 @@ CONFIG_ENV_EXT4_DEVICE_AND_PART="0:0"
 CONFIG_BOOTP_SEND_HOSTNAME=y
 CONFIG_NETCONSOLE=y
 CONFIG_IP_DEFRAG=y
+CONFIG_BOOTP_SERVERIP=y
 CONFIG_DM_DMA=y
 CONFIG_REGMAP=y
 CONFIG_SYSCON=y
diff --git a/configs/sandbox_noinst_defconfig b/configs/sandbox_noinst_defconfig
index 490368e768f..6679c4335b2 100644
--- a/configs/sandbox_noinst_defconfig
+++ b/configs/sandbox_noinst_defconfig
@@ -96,6 +96,7 @@ CONFIG_ENV_EXT4_DEVICE_AND_PART="0:0"
 CONFIG_BOOTP_SEND_HOSTNAME=y
 CONFIG_NETCONSOLE=y
 CONFIG_IP_DEFRAG=y
+CONFIG_BOOTP_SERVERIP=y
 CONFIG_SPL_DM=y
 CONFIG_DM_DMA=y
 CONFIG_REGMAP=y
diff --git a/configs/sandbox_spl_defconfig b/configs/sandbox_spl_defconfig
index f1a54ace9bc..fddf132dfed 100644
--- a/configs/sandbox_spl_defconfig
+++ b/configs/sandbox_spl_defconfig
@@ -98,6 +98,7 @@ CONFIG_ENV_EXT4_DEVICE_AND_PART="0:0"
 CONFIG_BOOTP_SEND_HOSTNAME=y
 CONFIG_NETCONSOLE=y
 CONFIG_IP_DEFRAG=y
+CONFIG_BOOTP_SERVERIP=y
 CONFIG_SPL_DM=y
 CONFIG_DM_DMA=y
 CONFIG_REGMAP=y
diff --git a/include/configs/adp-ae3xx.h b/include/configs/adp-ae3xx.h
index 973033d6b4d..497db49297b 100644
--- a/include/configs/adp-ae3xx.h
+++ b/include/configs/adp-ae3xx.h
@@ -19,8 +19,6 @@
 
 #define CONFIG_ARCH_MAP_SYSMEM
 
-#define CONFIG_BOOTP_SERVERIP
-
 #ifdef CONFIG_SKIP_LOWLEVEL_INIT
 #ifdef CONFIG_OF_CONTROL
 #undef CONFIG_OF_SEPARATE
diff --git a/include/configs/adp-ag101p.h b/include/configs/adp-ag101p.h
index f533ada73f4..be1d95ee49e 100644
--- a/include/configs/adp-ag101p.h
+++ b/include/configs/adp-ag101p.h
@@ -17,8 +17,6 @@
 
 #define CONFIG_ARCH_MAP_SYSMEM
 
-#define CONFIG_BOOTP_SERVERIP
-
 #ifndef CONFIG_SKIP_LOWLEVEL_INIT
 #define CONFIG_MEM_REMAP
 #endif
diff --git a/include/configs/bitmain_antminer_s9.h b/include/configs/bitmain_antminer_s9.h
index a9f45f19295..2bcd0e1a989 100644
--- a/include/configs/bitmain_antminer_s9.h
+++ b/include/configs/bitmain_antminer_s9.h
@@ -9,8 +9,6 @@
 #define CONFIG_SYS_SDRAM_BASE	0x00000000
 #define CONFIG_SYS_SDRAM_SIZE	0x40000000
 
-#define CONFIG_BOOTP_SERVERIP
-
 #define CONFIG_EXTRA_ENV_SETTINGS \
 	"autoload=no\0" \
 	"pxefile_addr_r=0x2000000\0" \
diff --git a/include/configs/sandbox.h b/include/configs/sandbox.h
index 5c2f3d84c3b..9e0e8c7056f 100644
--- a/include/configs/sandbox.h
+++ b/include/configs/sandbox.h
@@ -25,8 +25,6 @@
 #define CONFIG_SYS_BAUDRATE_TABLE	{4800, 9600, 19200, 38400, 57600,\
 					115200}
 
-#define CONFIG_BOOTP_SERVERIP
-
 #ifndef SANDBOX_NO_SDL
 #define CONFIG_SANDBOX_SDL
 #endif
diff --git a/include/configs/stm32mp15_common.h b/include/configs/stm32mp15_common.h
index dab679f71e3..2bbc8def820 100644
--- a/include/configs/stm32mp15_common.h
+++ b/include/configs/stm32mp15_common.h
@@ -57,7 +57,6 @@
 /* Ethernet need */
 #ifdef CONFIG_DWC_ETH_QOS
 #define CONFIG_SERVERIP                 192.168.1.1
-#define CONFIG_BOOTP_SERVERIP
 #define CONFIG_SYS_AUTOLOAD		"no"
 #endif
 
diff --git a/net/Kconfig b/net/Kconfig
index 1983506bb8e..2643b79c468 100644
--- a/net/Kconfig
+++ b/net/Kconfig
@@ -115,4 +115,11 @@ config UDP_CHECKSUM
 	  is wrong then the packet is discussed and an error is shown, like
 	  "UDP wrong checksum 29374a23 30ff3826"
 
+config BOOTP_SERVERIP
+	bool "Use the 'serverip' env var for tftp, not bootp"
+	help
+	  Enable this if the TFTP server will be the 'serverip' environment
+	  variable, not the BOOTP server. This affects the operation of both
+	  bootp and tftp.
+
 endif   # if NET
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index 72ebcda1d4f..75c176fdbc9 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -78,7 +78,6 @@ CONFIG_BOOTP_ID_CACHE_SIZE
 CONFIG_BOOTP_MAY_FAIL
 CONFIG_BOOTP_NISDOMAIN
 CONFIG_BOOTP_RANDOM_DELAY
-CONFIG_BOOTP_SERVERIP
 CONFIG_BOOTP_TIMEOFFSET
 CONFIG_BOOTP_VENDOREX
 CONFIG_BOOTROM_ERR_REG
-- 
2.34.1.173.g76aa8bc2d0-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
