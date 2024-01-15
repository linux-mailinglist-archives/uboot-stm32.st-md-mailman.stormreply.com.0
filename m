Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A7782DB0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jan 2024 15:09:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FCF9C6DD74;
	Mon, 15 Jan 2024 14:09:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEC04C6DD66
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 14:09:20 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40FBDdEZ005244; Mon, 15 Jan 2024 15:08:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=GlNVjAEtKvEPSqh0kVQkWFcNozvwhnj88F8juxMYTB0=; b=PH
 3aHu1kthGDZDfxdQh+TaXKZbbpxqr58NEGm/OVYLK589drQYI3knlFCBiwviPyro
 KxB+KxuieWm3HWNbCuJ1Z1A0Jm/6TYX4mPzRWbXQhPJ0GOlIUf3e0/JodHDbIPDC
 oYrCwEdAQeCjBL7F4HGgQDJkksQWG0JXmU4jeTXTnl2Fm7EZbB8aVldLq0nb9VOU
 u4RLcbd/pIqI3zNTZv+i+Uy4ui9X4nGI08zHlnssqf51b3Y9JiyDvh3b/lzKZk4N
 YouKvYTrAeXaQWMhwiFxxr5ClxE2jzkcoGL2fL1Sr5tztHIKwF5VPnVLaen4LTAz
 3YWkSLTdxM4Mxcj5PdsA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vkmfy912h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jan 2024 15:08:50 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8ED5E10002A;
 Mon, 15 Jan 2024 15:08:37 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 809A4298668;
 Mon, 15 Jan 2024 15:08:37 +0100 (CET)
Received: from localhost (10.201.22.165) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 15 Jan
 2024 15:08:37 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Jan 2024 15:05:57 +0100
Message-ID: <20240115150451.v2.14.Ic8bb25401fdf8da5065400fd85d7d926b3f21740@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240115140557.57448-1-patrick.delaunay@foss.st.com>
References: <20240115140557.57448-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: Svyatoslav Ryhel <clamor95@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Masahisa Kojima <masahisa.kojima@linaro.org>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>, Hai Pham <hai.pham.ud@renesas.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Lukasz Majewski <lukma@denx.de>,
 Jonas Karlman <jonas@kwiboo.se>, Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Igor Opaniuk <igor.opaniuk@foundries.io>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Christian Hewitt <christianshewitt@gmail.com>, FUKAUMI Naoki <naoki@radxa.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 14/14] arm: Rename STM32MP15x
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

CONFIG options must not use lower-case letter. Convert this and related
ones to upper case.

Signed-off-by: Simon Glass <sjg@chromium.org
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
See Simon's patch in serie "Clean up of bad Kconfig options" never merged
https://patchwork.ozlabs.org/project/uboot/list/?series=339004&state=*
https://patchwork.ozlabs.org/project/uboot/patch/20230129005903.74918-69-sjg@chromium.org/

Changes in v2:
- add "arm: Rename STM32MP15x"

 arch/arm/dts/Makefile                           |  2 +-
 arch/arm/dts/stm32mp15-u-boot.dtsi              |  2 +-
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi        |  4 ++--
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi        |  4 ++--
 arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi        |  4 ++--
 arch/arm/mach-stm32mp/Kconfig                   |  6 +++---
 arch/arm/mach-stm32mp/Kconfig.15x               |  6 +++---
 arch/arm/mach-stm32mp/Makefile                  |  2 +-
 arch/arm/mach-stm32mp/cmd_stm32key.c            | 10 +++++-----
 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h |  4 ++--
 arch/arm/mach-stm32mp/include/mach/stm32.h      | 12 ++++++------
 arch/arm/mach-stm32mp/stm32mp1/Makefile         |  2 +-
 arch/arm/mach-stm32mp/stm32mp1/fdt.c            |  6 +++---
 board/st/common/Kconfig                         |  2 +-
 board/st/stm32mp1/Kconfig                       |  2 +-
 board/st/stm32mp1/stm32mp1.c                    |  6 +++---
 configs/stm32mp15_basic_defconfig               |  2 +-
 configs/stm32mp15_defconfig                     |  2 +-
 configs/stm32mp15_trusted_defconfig             |  4 ++--
 drivers/clk/stm32/Kconfig                       |  2 +-
 20 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 8dcf1f5717ce..02074440b55d 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -1363,7 +1363,7 @@ dtb-$(CONFIG_ARCH_STI) += stih410-b2260.dtb
 dtb-$(CONFIG_STM32MP13X) += \
 	stm32mp135f-dk.dtb
 
-dtb-$(CONFIG_STM32MP15x) += \
+dtb-$(CONFIG_STM32MP15X) += \
 	stm32mp157a-dk1.dtb \
 	stm32mp157a-dk1-scmi.dtb \
 	stm32mp157a-icore-stm32mp1-ctouch2.dtb \
diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
index 573dd4d3ed56..fe56f05616a0 100644
--- a/arch/arm/dts/stm32mp15-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
@@ -206,7 +206,7 @@
 	resets = <&rcc UART8_R>;
 };
 
-#if defined(CONFIG_STM32MP15x_STM32IMAGE)
+#if defined(CONFIG_STM32MP15X_STM32IMAGE)
 &binman {
 	u-boot-stm32 {
 		filename = "u-boot.stm32";
diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index 2623cebf21a4..a16358266a2d 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -22,13 +22,13 @@
 		st,stm32prog-gpios = <&gpioa 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
 	};
 
-#if defined(CONFIG_STM32MP15x_STM32IMAGE) || defined(CONFIG_SPL)
+#if defined(CONFIG_STM32MP15X_STM32IMAGE) || defined(CONFIG_SPL)
 	config {
 		u-boot,mmc-env-partition = "ssbl";
 	};
 #endif
 
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
+#ifdef CONFIG_STM32MP15X_STM32IMAGE
 	/* only needed for boot with TF-A, witout FIP support */
 	firmware {
 		optee {
diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
index b8288273ddb5..ef91088aa375 100644
--- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
@@ -20,13 +20,13 @@
 		st,stm32prog-gpios = <&gpioa 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
 	};
 
-#if defined(CONFIG_STM32MP15x_STM32IMAGE) || defined(CONFIG_SPL)
+#if defined(CONFIG_STM32MP15X_STM32IMAGE) || defined(CONFIG_SPL)
 	config {
 		u-boot,mmc-env-partition = "ssbl";
 	};
 #endif
 
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
+#ifdef CONFIG_STM32MP15X_STM32IMAGE
 	/* only needed for boot with TF-A, witout FIP support */
 	firmware {
 		optee {
diff --git a/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
index eb283cacd27d..139940bd5d47 100644
--- a/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
@@ -28,7 +28,7 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-#if defined(CONFIG_STM32MP15x_STM32IMAGE) || defined(CONFIG_SPL)
+#if defined(CONFIG_STM32MP15X_STM32IMAGE) || defined(CONFIG_SPL)
 		partition@0 {
 			label = "fsbl1";
 			reg = <0x00000000 0x00040000>;
@@ -82,7 +82,7 @@
 				#address-cells = <1>;
 				#size-cells = <1>;
 
-#if defined(CONFIG_STM32MP15x_STM32IMAGE) || defined(CONFIG_SPL)
+#if defined(CONFIG_STM32MP15X_STM32IMAGE) || defined(CONFIG_SPL)
 				partition@0 {
 					label = "fsbl";
 					reg = <0x00000000 0x00200000>;
diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 241fcf3e0d22..a1763ff19993 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -35,7 +35,7 @@ config ENV_SIZE
 
 choice
 	prompt "Select STMicroelectronics STM32MPxxx Soc"
-	default STM32MP15x
+	default STM32MP15X
 
 config STM32MP13X
 	bool "Support STMicroelectronics STM32MP13x Soc"
@@ -55,7 +55,7 @@ config STM32MP13X
 		support of STMicroelectronics SOC STM32MP13x family
 		STMicroelectronics MPU with core ARMv7
 
-config STM32MP15x
+config STM32MP15X
 	bool "Support STMicroelectronics STM32MP15x Soc"
 	select ARCH_SUPPORT_PSCI
 	select BINMAN
@@ -127,7 +127,7 @@ config SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION_MMC2
 
 config STM32_ETZPC
 	bool "STM32 Extended TrustZone Protection"
-	depends on STM32MP15x || STM32MP13X
+	depends on STM32MP15X || STM32MP13X
 	default y
 	imply BOOTP_SERVERIP
 	help
diff --git a/arch/arm/mach-stm32mp/Kconfig.15x b/arch/arm/mach-stm32mp/Kconfig.15x
index 1d32f8bf3395..71c14eb4955f 100644
--- a/arch/arm/mach-stm32mp/Kconfig.15x
+++ b/arch/arm/mach-stm32mp/Kconfig.15x
@@ -1,6 +1,6 @@
-if STM32MP15x
+if STM32MP15X
 
-config STM32MP15x_STM32IMAGE
+config STM32MP15X_STM32IMAGE
 	bool "Support STM32 image for generated U-Boot image"
 	depends on TFABOOT
 	help
@@ -11,7 +11,7 @@ choice
 	prompt "STM32MP15x board select"
 	optional
 
-config TARGET_ST_STM32MP15x
+config TARGET_ST_STM32MP15X
 	bool "STMicroelectronics STM32MP15x boards"
 	imply BOOTSTAGE
 	imply CMD_BOOTSTAGE
diff --git a/arch/arm/mach-stm32mp/Makefile b/arch/arm/mach-stm32mp/Makefile
index 3d194de0631c..ee8a5428feba 100644
--- a/arch/arm/mach-stm32mp/Makefile
+++ b/arch/arm/mach-stm32mp/Makefile
@@ -8,7 +8,7 @@ obj-y += syscon.o
 obj-y += bsec.o
 obj-y += soc.o
 
-obj-$(CONFIG_STM32MP15x) += stm32mp1/
+obj-$(CONFIG_STM32MP15X) += stm32mp1/
 obj-$(CONFIG_STM32MP13X) += stm32mp1/
 obj-$(CONFIG_STM32MP25X) += stm32mp2/
 
diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
index dcef6ac4fb82..c7fe232f86e0 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32key.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
@@ -20,7 +20,7 @@
  */
 #define STM32_OTP_CLOSE_ID		0
 #define STM32_OTP_STM32MP13X_CLOSE_MASK	0x3F
-#define STM32_OTP_STM32MP15x_CLOSE_MASK	BIT(6)
+#define STM32_OTP_STM32MP15X_CLOSE_MASK	BIT(6)
 
 /* PKH is the first element of the key list */
 #define STM32KEY_PKH 0
@@ -64,7 +64,7 @@ static u8 get_key_nb(void)
 	if (IS_ENABLED(CONFIG_STM32MP13X))
 		return ARRAY_SIZE(stm32mp13_list);
 
-	if (IS_ENABLED(CONFIG_STM32MP15x))
+	if (IS_ENABLED(CONFIG_STM32MP15X))
 		return ARRAY_SIZE(stm32mp15_list);
 }
 
@@ -73,7 +73,7 @@ static const struct stm32key *get_key(u8 index)
 	if (IS_ENABLED(CONFIG_STM32MP13X))
 		return &stm32mp13_list[index];
 
-	if (IS_ENABLED(CONFIG_STM32MP15x))
+	if (IS_ENABLED(CONFIG_STM32MP15X))
 		return &stm32mp15_list[index];
 }
 
@@ -82,8 +82,8 @@ static u32 get_otp_close_mask(void)
 	if (IS_ENABLED(CONFIG_STM32MP13X))
 		return STM32_OTP_STM32MP13X_CLOSE_MASK;
 
-	if (IS_ENABLED(CONFIG_STM32MP15x))
-		return STM32_OTP_STM32MP15x_CLOSE_MASK;
+	if (IS_ENABLED(CONFIG_STM32MP15X))
+		return STM32_OTP_STM32MP15X_CLOSE_MASK;
 }
 
 static int get_misc_dev(struct udevice **dev)
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
index 934ffb1105a0..bf184c8a8846 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
@@ -23,14 +23,14 @@
 
 #define CMD_SIZE		512
 /* SMC is only supported in SPMIN for STM32MP15x */
-#ifdef CONFIG_STM32MP15x
+#ifdef CONFIG_STM32MP15X
 #define OTP_SIZE_SMC		1024
 #else
 #define OTP_SIZE_SMC		0
 #endif
 /* size of the OTP struct in NVMEM PTA */
 #define _OTP_SIZE_TA(otp)	(((otp) * 2 + 2) * 4)
-#if defined(CONFIG_STM32MP13X) || defined(CONFIG_STM32MP15x)
+#if defined(CONFIG_STM32MP13X) || defined(CONFIG_STM32MP15X)
 /* STM32MP1 with BSEC2 */
 #define OTP_SIZE_TA		_OTP_SIZE_TA(96)
 #else
diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
index 2d7d973368c1..f598da99fbab 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
@@ -71,11 +71,11 @@ enum forced_boot_mode {
  * only address used before device tree parsing
  */
 
-#if defined(CONFIG_STM32MP15x) || defined(CONFIG_STM32MP13X)
+#if defined(CONFIG_STM32MP15X) || defined(CONFIG_STM32MP13X)
 #define STM32_RCC_BASE			0x50000000
 #define STM32_PWR_BASE			0x50001000
 #define STM32_SYSCFG_BASE		0x50020000
-#ifdef CONFIG_STM32MP15x
+#ifdef CONFIG_STM32MP15X
 #define STM32_DBGMCU_BASE		0x50081000
 #endif
 #define STM32_FMC2_BASE			0x58002000
@@ -88,7 +88,7 @@ enum forced_boot_mode {
 #define STM32_STGEN_BASE		0x5C008000
 #define STM32_TAMP_BASE			0x5C00A000
 
-#ifdef CONFIG_STM32MP15x
+#ifdef CONFIG_STM32MP15X
 #define STM32_USART1_BASE		0x5C000000
 #define STM32_USART2_BASE		0x4000E000
 #endif
@@ -107,7 +107,7 @@ enum forced_boot_mode {
 #define STM32_SDMMC2_BASE		0x58007000
 #define STM32_SDMMC3_BASE		0x48004000
 
-#ifdef CONFIG_STM32MP15x
+#ifdef CONFIG_STM32MP15X
 #define STM32_SYSRAM_BASE		0x2FFC0000
 #define STM32_SYSRAM_SIZE		SZ_256K
 #endif
@@ -129,7 +129,7 @@ enum forced_boot_mode {
 /* TAMP registers */
 #define TAMP_BACKUP_REGISTER(x)		(STM32_TAMP_BASE + 0x100 + 4 * x)
 
-#ifdef CONFIG_STM32MP15x
+#ifdef CONFIG_STM32MP15X
 #define TAMP_BACKUP_MAGIC_NUMBER	TAMP_BACKUP_REGISTER(4)
 #define TAMP_BACKUP_BRANCH_ADDRESS	TAMP_BACKUP_REGISTER(5)
 #define TAMP_FWU_BOOT_INFO_REG		TAMP_BACKUP_REGISTER(10)
@@ -181,7 +181,7 @@ enum forced_boot_mode {
 #define STM32_BSEC_LOCK(id)		(STM32_BSEC_LOCK_OFFSET + (id) * 4)
 
 /* BSEC OTP index */
-#ifdef CONFIG_STM32MP15x
+#ifdef CONFIG_STM32MP15X
 #define BSEC_OTP_RPN	1
 #define BSEC_OTP_SERIAL	13
 #define BSEC_OTP_PKG	16
diff --git a/arch/arm/mach-stm32mp/stm32mp1/Makefile b/arch/arm/mach-stm32mp/stm32mp1/Makefile
index e74342d0c608..857148747ef7 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/Makefile
+++ b/arch/arm/mach-stm32mp/stm32mp1/Makefile
@@ -6,7 +6,7 @@
 obj-y += cpu.o
 
 obj-$(CONFIG_STM32MP13X) += stm32mp13x.o
-obj-$(CONFIG_STM32MP15x) += stm32mp15x.o
+obj-$(CONFIG_STM32MP15X) += stm32mp15x.o
 
 obj-$(CONFIG_STM32_ECDSA_VERIFY) += ecdsa_romapi.o
 ifdef CONFIG_SPL_BUILD
diff --git a/arch/arm/mach-stm32mp/stm32mp1/fdt.c b/arch/arm/mach-stm32mp/stm32mp1/fdt.c
index 9436b872e31e..d0b6c3cc5a55 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/fdt.c
+++ b/arch/arm/mach-stm32mp/stm32mp1/fdt.c
@@ -275,7 +275,7 @@ static int stm32_fdt_fixup_etzpc(void *fdt, int soc_node)
 		array_size = ARRAY_SIZE(stm32mp13_ip_addr);
 	}
 
-	if (IS_ENABLED(CONFIG_STM32MP15x)) {
+	if (IS_ENABLED(CONFIG_STM32MP15X)) {
 		array = stm32mp15_ip_addr;
 		array_size = ARRAY_SIZE(stm32mp15_ip_addr);
 	}
@@ -494,7 +494,7 @@ int ft_system_setup(void *blob, struct bd_info *bd)
 	if (IS_ENABLED(CONFIG_STM32MP13X))
 		stm32mp13_fdt_fixup(blob, soc, cpu, name);
 
-	if (IS_ENABLED(CONFIG_STM32MP15x)) {
+	if (IS_ENABLED(CONFIG_STM32MP15X)) {
 		stm32mp15_fdt_fixup(blob, soc, cpu, name);
 
 		/*
@@ -505,7 +505,7 @@ int ft_system_setup(void *blob, struct bd_info *bd)
 		 * under CONFIG_STM32MP15x_STM32IMAGE only for compatibility
 		 * when FIP is not used by TF-A
 		 */
-		if (IS_ENABLED(CONFIG_STM32MP15x_STM32IMAGE) &&
+		if (IS_ENABLED(CONFIG_STM32MP15X_STM32IMAGE) &&
 		    !tee_find_device(NULL, NULL, NULL, NULL))
 			stm32_fdt_disable_optee(blob);
 	}
diff --git a/board/st/common/Kconfig b/board/st/common/Kconfig
index 6d1b76ba43a8..5efac658cf4d 100644
--- a/board/st/common/Kconfig
+++ b/board/st/common/Kconfig
@@ -1,7 +1,7 @@
 config CMD_STBOARD
 	bool "stboard - command for OTP board information"
 	depends on ARCH_STM32MP
-	default y if TARGET_ST_STM32MP25X || TARGET_ST_STM32MP15x || TARGET_ST_STM32MP13X
+	default y if TARGET_ST_STM32MP25X || TARGET_ST_STM32MP15X || TARGET_ST_STM32MP13X
 	help
 	  This compile the stboard command to
 	  read and write the board in the OTP.
diff --git a/board/st/stm32mp1/Kconfig b/board/st/stm32mp1/Kconfig
index 7d0d41bfea05..96de41546f1d 100644
--- a/board/st/stm32mp1/Kconfig
+++ b/board/st/stm32mp1/Kconfig
@@ -1,4 +1,4 @@
-if TARGET_ST_STM32MP15x
+if TARGET_ST_STM32MP15X
 
 config SYS_BOARD
 	default "stm32mp1"
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 8f5719c28b33..a17c314daeb8 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -114,7 +114,7 @@ int checkboard(void)
 	int fdt_compat_len;
 
 	if (IS_ENABLED(CONFIG_TFABOOT)) {
-		if (IS_ENABLED(CONFIG_STM32MP15x_STM32IMAGE))
+		if (IS_ENABLED(CONFIG_STM32MP15X_STM32IMAGE))
 			mode = "trusted - stm32image";
 		else
 			mode = "trusted";
@@ -616,7 +616,7 @@ error:
 
 static bool board_is_stm32mp15x_dk2(void)
 {
-	if (CONFIG_IS_ENABLED(TARGET_ST_STM32MP15x) &&
+	if (CONFIG_IS_ENABLED(TARGET_ST_STM32MP15X) &&
 	    of_machine_is_compatible("st,stm32mp157c-dk2"))
 		return true;
 
@@ -625,7 +625,7 @@ static bool board_is_stm32mp15x_dk2(void)
 
 static bool board_is_stm32mp15x_ev1(void)
 {
-	if (CONFIG_IS_ENABLED(TARGET_ST_STM32MP15x) &&
+	if (CONFIG_IS_ENABLED(TARGET_ST_STM32MP15X) &&
 	    (of_machine_is_compatible("st,stm32mp157a-ev1") ||
 	     of_machine_is_compatible("st,stm32mp157c-ev1") ||
 	     of_machine_is_compatible("st,stm32mp157d-ev1") ||
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 3032d83b992e..005f1d55f80e 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -13,7 +13,7 @@ CONFIG_SPL_STACK=0x30000000
 CONFIG_SPL=y
 CONFIG_CMD_STM32KEY=y
 CONFIG_TYPEC_STUSB160X=y
-CONFIG_TARGET_ST_STM32MP15x=y
+CONFIG_TARGET_ST_STM32MP15X=y
 CONFIG_ENV_OFFSET_REDUND=0x2C0000
 CONFIG_CMD_STM32PROG=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
index 4aff6398846f..3302b3069965 100644
--- a/configs/stm32mp15_defconfig
+++ b/configs/stm32mp15_defconfig
@@ -9,7 +9,7 @@ CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
 CONFIG_DDR_CACHEABLE_SIZE=0x8000000
 CONFIG_CMD_STM32KEY=y
 CONFIG_TYPEC_STUSB160X=y
-CONFIG_TARGET_ST_STM32MP15x=y
+CONFIG_TARGET_ST_STM32MP15X=y
 CONFIG_ENV_OFFSET_REDUND=0x940000
 CONFIG_CMD_STM32PROG=y
 # CONFIG_ARMV7_NONSEC is not set
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index ec32f1ea0f2c..84b0854b5573 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -9,8 +9,8 @@ CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
 CONFIG_DDR_CACHEABLE_SIZE=0x10000000
 CONFIG_CMD_STM32KEY=y
 CONFIG_TYPEC_STUSB160X=y
-CONFIG_STM32MP15x_STM32IMAGE=y
-CONFIG_TARGET_ST_STM32MP15x=y
+CONFIG_STM32MP15X_STM32IMAGE=y
+CONFIG_TARGET_ST_STM32MP15X=y
 CONFIG_ENV_OFFSET_REDUND=0x2C0000
 CONFIG_CMD_STM32PROG=y
 # CONFIG_ARMV7_NONSEC is not set
diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
index 7dbddd032b89..c05015efe8b4 100644
--- a/drivers/clk/stm32/Kconfig
+++ b/drivers/clk/stm32/Kconfig
@@ -23,7 +23,7 @@ config CLK_STM32_CORE
 config CLK_STM32MP1
 	bool "Enable RCC clock driver for STM32MP15"
 	depends on ARCH_STM32MP && CLK
-	default y if STM32MP15x
+	default y if STM32MP15X
 	help
 	  Enable the STM32 clock (RCC) driver. Enable support for
 	  manipulating STM32MP15's on-SoC clocks.
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
