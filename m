Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ABE9913B7
	for <lists+uboot-stm32@lfdr.de>; Sat,  5 Oct 2024 03:17:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E46CC7802D;
	Sat,  5 Oct 2024 01:17:13 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5535FC6C855
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Oct 2024 01:17:06 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4E7A988F55;
 Sat,  5 Oct 2024 03:17:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1728091026;
 bh=dQVlI6LvJoJayVDNu+HJAQrmhRJ4l0Xjv5/aO58HDFA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MhqkNZIXzXJ4zi4calCcedxxMcDsl7E4gDdCSF1IxZ/qfKDuzrCQMjfE8YzNtUJLl
 g/gQJ78WPCRp3CcV4E5VAi6AzDAQp8WBlO3FmDlkRt+0u9raMFLreG9MCt/zT8+IU1
 gcwxSLwYCeMuXin8KV1C/awckVu4U3VnohLxJV/lDLsYK0Ihn0YCtG3/m8oPPe0l7j
 zoABSol8qezJWlPuTR0NwHGQk3oekbW0cC0V8irCO40snFKJGyVwM0sNR7oYJ1g+9A
 xmzAbH9/DZldOFvYxxZ+PPRpMoRWfl7fRCJDrLmhZr0E2OIFpGtUYKJZoewfbTjsPW
 G0HRw9HUVV+wA==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Sat,  5 Oct 2024 03:15:50 +0200
Message-ID: <20241005011647.436456-3-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241005011647.436456-1-marex@denx.de>
References: <20241005011647.436456-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, Simon Glass <sjg@chromium.org>,
 Sean Anderson <seanga2@gmail.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 3/3] ARM: dts: stm32: Generate u-boot.itb
	using binman on DH STM32 DHSOM
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

Describe the u-boot.its generation in stm32mp15xx-dhsom-u-boot.dtsi
binman {} DT node as a replacement for current CONFIG_SPL_FIT_SOURCE
use, dispose of both u-boot-dhcom.its and u-boot-dhcor.its.

Use fdt-SEQ/config-SEQ to generate a list of fdt-N fitImage images {} and
matching configuration {} node entries. The configuration node entry names
no longer encode _somrevN_boardrevN suffix, which was never really used, so
drop this functionality by default. Rework board_fit_config_name_match() to
match on the new configuration node entry names.

Users who do need the match on _somrevN_boardrevN can either replace the
fdt-SEQ/config-SEQ with fixed fdt-N/config-N nodes which each encode the
matching 'description = "NAME_somrevN_boardrevN"' to restore the old
behavior verbatim, or better use SPL DT overlays for U-Boot control DT
the same way e.g. i.MX8MP DHCOM does to support multiple SoM and board
variants.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Sean Anderson <seanga2@gmail.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
V2: No change
---
 arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi    |  1 +
 arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi    |  1 +
 arch/arm/dts/stm32mp15xx-dhsom-u-boot.dtsi    | 53 +++++++++++
 board/dhelectronics/dh_stm32mp1/board.c       | 19 +++-
 .../dh_stm32mp1/u-boot-dhcom.its              | 91 -------------------
 .../dh_stm32mp1/u-boot-dhcor.its              | 70 --------------
 configs/stm32mp15_dhcom_basic_defconfig       |  2 -
 configs/stm32mp15_dhcor_basic_defconfig       |  2 -
 8 files changed, 70 insertions(+), 169 deletions(-)
 create mode 100644 arch/arm/dts/stm32mp15xx-dhsom-u-boot.dtsi
 delete mode 100644 board/dhelectronics/dh_stm32mp1/u-boot-dhcom.its
 delete mode 100644 board/dhelectronics/dh_stm32mp1/u-boot-dhcor.its

diff --git a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
index d7b78cdcfa9..dd67e960a64 100644
--- a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
@@ -8,6 +8,7 @@
 #include "stm32mp15-ddr3-dhsom-2x1Gb-1066-binG.dtsi"
 #include "stm32mp15-ddr3-dhsom-2x2Gb-1066-binG.dtsi"
 #include "stm32mp15-ddr3-dhsom-2x4Gb-1066-binG.dtsi"
+#include "stm32mp15xx-dhsom-u-boot.dtsi"
 
 / {
 	aliases {
diff --git a/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
index ba84db679e1..08439342cb2 100644
--- a/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
@@ -12,6 +12,7 @@
 #include "stm32mp15-ddr3-dhsom-2x1Gb-1066-binG.dtsi"
 #include "stm32mp15-ddr3-dhsom-2x2Gb-1066-binG.dtsi"
 #include "stm32mp15-ddr3-dhsom-2x4Gb-1066-binG.dtsi"
+#include "stm32mp15xx-dhsom-u-boot.dtsi"
 
 / {
 	bootph-all;
diff --git a/arch/arm/dts/stm32mp15xx-dhsom-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhsom-u-boot.dtsi
new file mode 100644
index 00000000000..386c605c07f
--- /dev/null
+++ b/arch/arm/dts/stm32mp15xx-dhsom-u-boot.dtsi
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+/*
+ * Copyright (C) 2024 Marek Vasut <marex@denx.de>
+ */
+
+&binman {
+	 u-boot {
+		filename = "u-boot.itb";
+
+		fit {
+			description = "U-Boot mainline";
+			fit,fdt-list = "of-list";
+			#address-cells = <1>;
+
+			images {
+				uboot {
+					arch = "arm";
+					compression = "none";
+					description = "U-Boot (32-bit)";
+					entry = <CONFIG_TEXT_BASE>;
+					load = <CONFIG_TEXT_BASE>;
+					type = "standalone";
+
+					uboot-blob {
+						filename = "u-boot-nodtb.bin";
+						type = "blob-ext";
+					};
+				};
+
+				@fdt-SEQ {
+					compression = "none";
+					description = "NAME";
+					type = "flat_dt";
+
+					uboot-fdt-blob {
+						filename = "u-boot.dtb";
+						type = "blob-ext";
+					};
+				};
+			};
+
+			configurations {
+				default = "@config-DEFAULT-SEQ";
+
+				@config-SEQ {
+					description = "NAME";
+					fdt = "fdt-SEQ";
+					firmware = "uboot";
+				};
+			};
+		};
+	};
+};
diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
index 24c5f37c12f..3e4b22505ff 100644
--- a/board/dhelectronics/dh_stm32mp1/board.c
+++ b/board/dhelectronics/dh_stm32mp1/board.c
@@ -276,15 +276,26 @@ int board_early_init_f(void)
 #ifdef CONFIG_SPL_LOAD_FIT
 int board_fit_config_name_match(const char *name)
 {
+	char *cdevice, *ndevice;
 	const char *compat;
-	char test[128];
 
 	compat = ofnode_get_property(ofnode_root(), "compatible", NULL);
+	if (!compat)
+		return -EINVAL;
+
+	cdevice = strchr(compat, ',');
+	if (!cdevice)
+		return -ENODEV;
+
+	cdevice++;	/* Move past the comma right after vendor prefix. */
+
+	ndevice = strchr(name, '/');
+	if (!ndevice)
+		return -ENODEV;
 
-	snprintf(test, sizeof(test), "%s_somrev%d_boardrev%d",
-		compat, somcode, brdcode);
+	ndevice++;	/* Move past the last slash in DT path */
 
-	if (!strcmp(name, test))
+	if (!strcmp(cdevice, ndevice))
 		return 0;
 
 	return -EINVAL;
diff --git a/board/dhelectronics/dh_stm32mp1/u-boot-dhcom.its b/board/dhelectronics/dh_stm32mp1/u-boot-dhcom.its
deleted file mode 100644
index 38ecb601190..00000000000
--- a/board/dhelectronics/dh_stm32mp1/u-boot-dhcom.its
+++ /dev/null
@@ -1,91 +0,0 @@
-/dts-v1/;
-
-/ {
-	description = "U-Boot mainline";
-	#address-cells = <1>;
-
-	images {
-		uboot {
-			description = "U-Boot (32-bit)";
-			data = /incbin/("u-boot-nodtb.bin");
-			type = "standalone";
-			os = "U-Boot";
-			arch = "arm";
-			compression = "none";
-			load = <0xc0100000>;
-			entry = <0xc0100000>;
-		};
-
-		fdt-1 {
-			description = ".dtb";
-			data = /incbin/("dts/upstream/src/arm/st/stm32mp157c-dhcom-pdk2.dtb");
-			type = "flat_dt";
-			arch = "arm";
-			compression = "none";
-		};
-
-		fdt-2 {
-			description = ".dtb";
-			data = /incbin/("dts/upstream/src/arm/st/stm32mp153c-dhcom-drc02.dtb");
-			type = "flat_dt";
-			arch = "arm";
-			compression = "none";
-		};
-
-		fdt-3 {
-			description = ".dtb";
-			data = /incbin/("dts/upstream/src/arm/st/stm32mp157c-dhcom-picoitx.dtb");
-			type = "flat_dt";
-			arch = "arm";
-			compression = "none";
-		};
-	};
-
-	configurations {
-		default = "config-1";
-
-		config-1 {
-			/* DT+SoM+board model */
-			description = "dh,stm32mp157c-dhcom-pdk2_somrev0_boardrev0";
-			firmware = "uboot";
-			fdt = "fdt-1";
-		};
-
-		config-2 {
-			/* DT+SoM+board model */
-			description = "dh,stm32mp157c-dhcom-pdk2_somrev1_boardrev0";
-			firmware = "uboot";
-			fdt = "fdt-1";
-		};
-
-		config-3 {
-			/* DT+SoM+board model */
-			description = "dh,stm32mp153c-dhcom-drc02_somrev0_boardrev0";
-			firmware = "uboot";
-			fdt = "fdt-2";
-		};
-
-		config-4 {
-			/* DT+SoM+board model */
-			description = "dh,stm32mp153c-dhcom-drc02_somrev1_boardrev0";
-			firmware = "uboot";
-			fdt = "fdt-2";
-		};
-
-		config-5 {
-			/* DT+SoM+board model */
-			description = "dh,stm32mp157c-dhcom-picoitx_somrev0_boardrev0";
-			loadables = "uboot";
-			fdt = "fdt-3";
-		};
-
-		config-6 {
-			/* DT+SoM+board model */
-			description = "dh,stm32mp157c-dhcom-picoitx_somrev1_boardrev0";
-			loadables = "uboot";
-			fdt = "fdt-3";
-		};
-
-		/* Add 587-100..587-400 with fdt-2..fdt-4 here */
-	};
-};
diff --git a/board/dhelectronics/dh_stm32mp1/u-boot-dhcor.its b/board/dhelectronics/dh_stm32mp1/u-boot-dhcor.its
deleted file mode 100644
index e17dac77804..00000000000
--- a/board/dhelectronics/dh_stm32mp1/u-boot-dhcor.its
+++ /dev/null
@@ -1,70 +0,0 @@
-/dts-v1/;
-
-/ {
-	description = "U-Boot mainline";
-	#address-cells = <1>;
-
-	images {
-		uboot {
-			description = "U-Boot (32-bit)";
-			data = /incbin/("u-boot-nodtb.bin");
-			type = "standalone";
-			os = "U-Boot";
-			arch = "arm";
-			compression = "none";
-			load = <0xc0100000>;
-			entry = <0xc0100000>;
-		};
-
-		fdt-1 {
-			description = ".dtb";
-			data = /incbin/("dts/upstream/src/arm/st/stm32mp151a-dhcor-testbench.dtb");
-			type = "flat_dt";
-			arch = "arm";
-			compression = "none";
-		};
-
-		fdt-2 {
-			description = ".dtb";
-			data = /incbin/("dts/upstream/src/arm/st/stm32mp157a-dhcor-avenger96.dtb");
-			type = "flat_dt";
-			arch = "arm";
-			compression = "none";
-		};
-
-		fdt-3 {
-			description = ".dtb";
-			data = /incbin/("dts/upstream/src/arm/st/stm32mp153c-dhcor-drc-compact.dtb");
-			type = "flat_dt";
-			arch = "arm";
-			compression = "none";
-		};
-	};
-
-	configurations {
-		default = "config-1";
-
-		config-1 {
-			/* DT+SoM+board model */
-			description = "dh,stm32mp151a-dhcor-testbench_somrev0_boardrev1";
-			firmware = "uboot";
-			fdt = "fdt-1";
-		};
-
-		config-2 {
-			/* DT+SoM+board model */
-			description = "arrow,stm32mp157a-avenger96_somrev0_boardrev1";
-			firmware = "uboot";
-			fdt = "fdt-2";
-		};
-
-		config-3 {
-			/* DT+SoM+board model */
-			description = "dh,stm32mp153c-dhcor-drc-compact_somrev0_boardrev0";
-			firmware = "uboot";
-			fdt = "fdt-3";
-		};
-
-		/* Add 586-200..586-400 with fdt-2..fdt-4 here */
-	};
-};
diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
index e2a26e2b774..bb2866a6782 100644
--- a/configs/stm32mp15_dhcom_basic_defconfig
+++ b/configs/stm32mp15_dhcom_basic_defconfig
@@ -30,7 +30,6 @@ CONFIG_BOARD_SIZE_LIMIT=1441792
 CONFIG_FIT=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0xc1000000
-CONFIG_SPL_FIT_SOURCE="board/dhelectronics/dh_stm32mp1/u-boot-dhcom.its"
 CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_BOOTDELAY=1
@@ -59,7 +58,6 @@ CONFIG_SPL_RAM_SUPPORT=y
 CONFIG_SPL_RAM_DEVICE=y
 CONFIG_SPL_SPI_FLASH_MTD=y
 CONFIG_SYS_SPI_U_BOOT_OFFS=0x80000
-CONFIG_SPL_TARGET="u-boot.itb"
 CONFIG_SYS_PROMPT="STM32MP> "
 # CONFIG_CMD_ELF is not set
 # CONFIG_CMD_EXPORTENV is not set
diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
index f73bd2fa12c..8868d54c120 100644
--- a/configs/stm32mp15_dhcor_basic_defconfig
+++ b/configs/stm32mp15_dhcor_basic_defconfig
@@ -28,7 +28,6 @@ CONFIG_BOARD_SIZE_LIMIT=1441792
 CONFIG_FIT=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0xc1000000
-CONFIG_SPL_FIT_SOURCE="board/dhelectronics/dh_stm32mp1/u-boot-dhcor.its"
 CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_BOOTDELAY=1
@@ -57,7 +56,6 @@ CONFIG_SPL_RAM_SUPPORT=y
 CONFIG_SPL_RAM_DEVICE=y
 CONFIG_SPL_SPI_FLASH_MTD=y
 CONFIG_SYS_SPI_U_BOOT_OFFS=0x80000
-CONFIG_SPL_TARGET="u-boot.itb"
 CONFIG_SYS_PROMPT="STM32MP> "
 # CONFIG_CMD_ELF is not set
 # CONFIG_CMD_EXPORTENV is not set
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
