Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAFE82DB04
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jan 2024 15:09:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 735BFC6DD74;
	Mon, 15 Jan 2024 14:09:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29F6EC6DD66
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 14:09:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40FD9K8t001957; Mon, 15 Jan 2024 15:08:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=biRg3sB4NHYQEetDBljDMAQBVcy11dBmKGZ09F3h/TY=; b=CB
 a1YmvATn/YCvv3y7sRzGUNIwKYVmZkFWPWUcU3NDlUV13i8O0fXOylrqdKlr2tXP
 7Z0Y1u9ov921v61RrIEBAxFNy9mxBbjd0qB8/348DZmmss9eMMTHryE6h9mD0d68
 uLp2r6xKRb5aPTyef7EhONnoVV3UCIZDuVLLlAKnST1zwHwYCzG8Xuh7hR1OQr7V
 67l2bpC1aYv9jmJ9RTpZkKU1zWVQuM8kNw+moPC80N03i6TxhUR8gfTgdW7pPv/x
 Zbgn0WgQOQLkgPTl88eP1nQL7jfUu2QgmA4YVzW4g1VRA9XnB8vm/W/nkYI2FKwF
 Vqr0BMFasnDVIK4z4xag==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vkmddruaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jan 2024 15:08:52 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 914B7100058;
 Mon, 15 Jan 2024 15:08:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 86529298668;
 Mon, 15 Jan 2024 15:08:36 +0100 (CET)
Received: from localhost (10.201.22.165) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 15 Jan
 2024 15:08:36 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Jan 2024 15:05:56 +0100
Message-ID: <20240115150451.v2.13.I5567541b00df544ba476065a5cbe453a52add94e@changeid>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Hai Pham <hai.pham.ud@renesas.com>, Tom Rini <trini@konsulko.com>,
 Igor Opaniuk <igor.opaniuk@foundries.io>, Jonas Karlman <jonas@kwiboo.se>,
 Simon Glass <sjg@chromium.org>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>, Lukasz Majewski <lukma@denx.de>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 uboot-stm32@st-md-mailman.stormreply.com, FUKAUMI Naoki <naoki@radxa.com>,
 Sean Anderson <seanga2@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Michal Simek <michal.simek@amd.com>
Subject: [Uboot-stm32] [PATCH v2 13/14] arm: Rename STM32MP13x
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

Signed-off-by: Simon Glass <sjg@chromium.org>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
See Simon's patch in serie "Clean up of bad Kconfig options" never merged
https://patchwork.ozlabs.org/project/uboot/list/?series=339004&state=*
https://patchwork.ozlabs.org/project/uboot/patch/20230129005903.74918-68-sjg@chromium.org/

Changes in v2:
- add "arm: Rename STM32MP13x"

 arch/arm/dts/Makefile                           |  2 +-
 arch/arm/mach-stm32mp/Kconfig                   |  4 ++--
 arch/arm/mach-stm32mp/Kconfig.13x               |  4 ++--
 arch/arm/mach-stm32mp/Makefile                  |  2 +-
 arch/arm/mach-stm32mp/cmd_stm32key.c            | 10 +++++-----
 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h |  2 +-
 arch/arm/mach-stm32mp/include/mach/stm32.h      |  8 ++++----
 arch/arm/mach-stm32mp/stm32mp1/Makefile         |  2 +-
 arch/arm/mach-stm32mp/stm32mp1/fdt.c            |  4 ++--
 board/st/common/Kconfig                         |  2 +-
 board/st/stm32mp1/Kconfig                       |  2 +-
 configs/stm32mp13_defconfig                     |  4 ++--
 drivers/clk/stm32/Kconfig                       |  2 +-
 13 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 773c2546131c..8dcf1f5717ce 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -1360,7 +1360,7 @@ dtb-$(CONFIG_ASPEED_AST2600) += ast2600-evb.dtb
 
 dtb-$(CONFIG_ARCH_STI) += stih410-b2260.dtb
 
-dtb-$(CONFIG_STM32MP13x) += \
+dtb-$(CONFIG_STM32MP13X) += \
 	stm32mp135f-dk.dtb
 
 dtb-$(CONFIG_STM32MP15x) += \
diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 5fc92d07fe6d..241fcf3e0d22 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -37,7 +37,7 @@ choice
 	prompt "Select STMicroelectronics STM32MPxxx Soc"
 	default STM32MP15x
 
-config STM32MP13x
+config STM32MP13X
 	bool "Support STMicroelectronics STM32MP13x Soc"
 	select ARM_SMCCC
 	select CPU_V7A
@@ -127,7 +127,7 @@ config SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION_MMC2
 
 config STM32_ETZPC
 	bool "STM32 Extended TrustZone Protection"
-	depends on STM32MP15x || STM32MP13x
+	depends on STM32MP15x || STM32MP13X
 	default y
 	imply BOOTP_SERVERIP
 	help
diff --git a/arch/arm/mach-stm32mp/Kconfig.13x b/arch/arm/mach-stm32mp/Kconfig.13x
index acc02a5a1872..4d74b35055b8 100644
--- a/arch/arm/mach-stm32mp/Kconfig.13x
+++ b/arch/arm/mach-stm32mp/Kconfig.13x
@@ -1,10 +1,10 @@
-if STM32MP13x
+if STM32MP13X
 
 choice
 	prompt "STM32MP13x board select"
 	optional
 
-config TARGET_ST_STM32MP13x
+config TARGET_ST_STM32MP13X
 	bool "STMicroelectronics STM32MP13x boards"
 	imply BOOTSTAGE
 	imply CMD_BOOTSTAGE
diff --git a/arch/arm/mach-stm32mp/Makefile b/arch/arm/mach-stm32mp/Makefile
index fdcbbf91dfd5..3d194de0631c 100644
--- a/arch/arm/mach-stm32mp/Makefile
+++ b/arch/arm/mach-stm32mp/Makefile
@@ -9,7 +9,7 @@ obj-y += bsec.o
 obj-y += soc.o
 
 obj-$(CONFIG_STM32MP15x) += stm32mp1/
-obj-$(CONFIG_STM32MP13x) += stm32mp1/
+obj-$(CONFIG_STM32MP13X) += stm32mp1/
 obj-$(CONFIG_STM32MP25X) += stm32mp2/
 
 obj-$(CONFIG_STM32_ECDSA_VERIFY) += ecdsa_romapi.o
diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
index e16fcf4424dc..dcef6ac4fb82 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32key.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
@@ -19,7 +19,7 @@
  * STM32MP13x: 0b111111 = 0x3F for OTP_SECURED closed device
  */
 #define STM32_OTP_CLOSE_ID		0
-#define STM32_OTP_STM32MP13x_CLOSE_MASK	0x3F
+#define STM32_OTP_STM32MP13X_CLOSE_MASK	0x3F
 #define STM32_OTP_STM32MP15x_CLOSE_MASK	BIT(6)
 
 /* PKH is the first element of the key list */
@@ -61,7 +61,7 @@ static u8 stm32key_index;
 
 static u8 get_key_nb(void)
 {
-	if (IS_ENABLED(CONFIG_STM32MP13x))
+	if (IS_ENABLED(CONFIG_STM32MP13X))
 		return ARRAY_SIZE(stm32mp13_list);
 
 	if (IS_ENABLED(CONFIG_STM32MP15x))
@@ -70,7 +70,7 @@ static u8 get_key_nb(void)
 
 static const struct stm32key *get_key(u8 index)
 {
-	if (IS_ENABLED(CONFIG_STM32MP13x))
+	if (IS_ENABLED(CONFIG_STM32MP13X))
 		return &stm32mp13_list[index];
 
 	if (IS_ENABLED(CONFIG_STM32MP15x))
@@ -79,8 +79,8 @@ static const struct stm32key *get_key(u8 index)
 
 static u32 get_otp_close_mask(void)
 {
-	if (IS_ENABLED(CONFIG_STM32MP13x))
-		return STM32_OTP_STM32MP13x_CLOSE_MASK;
+	if (IS_ENABLED(CONFIG_STM32MP13X))
+		return STM32_OTP_STM32MP13X_CLOSE_MASK;
 
 	if (IS_ENABLED(CONFIG_STM32MP15x))
 		return STM32_OTP_STM32MP15x_CLOSE_MASK;
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
index eda98eb61d76..934ffb1105a0 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
@@ -30,7 +30,7 @@
 #endif
 /* size of the OTP struct in NVMEM PTA */
 #define _OTP_SIZE_TA(otp)	(((otp) * 2 + 2) * 4)
-#if defined(CONFIG_STM32MP13x) || defined(CONFIG_STM32MP15x)
+#if defined(CONFIG_STM32MP13X) || defined(CONFIG_STM32MP15x)
 /* STM32MP1 with BSEC2 */
 #define OTP_SIZE_TA		_OTP_SIZE_TA(96)
 #else
diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
index 726c390977e3..2d7d973368c1 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
@@ -71,7 +71,7 @@ enum forced_boot_mode {
  * only address used before device tree parsing
  */
 
-#if defined(CONFIG_STM32MP15x) || defined(CONFIG_STM32MP13x)
+#if defined(CONFIG_STM32MP15x) || defined(CONFIG_STM32MP13X)
 #define STM32_RCC_BASE			0x50000000
 #define STM32_PWR_BASE			0x50001000
 #define STM32_SYSCFG_BASE		0x50020000
@@ -92,7 +92,7 @@ enum forced_boot_mode {
 #define STM32_USART1_BASE		0x5C000000
 #define STM32_USART2_BASE		0x4000E000
 #endif
-#ifdef CONFIG_STM32MP13x
+#ifdef CONFIG_STM32MP13X
 #define STM32_USART1_BASE		0x4c000000
 #define STM32_USART2_BASE		0x4c001000
 #endif
@@ -149,7 +149,7 @@ enum forced_boot_mode {
 #define TAMP_COPRO_STATE_CRASH		5
 #endif
 
-#ifdef CONFIG_STM32MP13x
+#ifdef CONFIG_STM32MP13X
 #define TAMP_BOOTCOUNT			TAMP_BACKUP_REGISTER(31)
 #define TAMP_BOOT_CONTEXT		TAMP_BACKUP_REGISTER(30)
 #endif
@@ -188,7 +188,7 @@ enum forced_boot_mode {
 #define BSEC_OTP_MAC	57
 #define BSEC_OTP_BOARD	59
 #endif
-#ifdef CONFIG_STM32MP13x
+#ifdef CONFIG_STM32MP13X
 #define BSEC_OTP_RPN	1
 #define BSEC_OTP_SERIAL	13
 #define BSEC_OTP_MAC	57
diff --git a/arch/arm/mach-stm32mp/stm32mp1/Makefile b/arch/arm/mach-stm32mp/stm32mp1/Makefile
index 94c7724127e4..e74342d0c608 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/Makefile
+++ b/arch/arm/mach-stm32mp/stm32mp1/Makefile
@@ -5,7 +5,7 @@
 
 obj-y += cpu.o
 
-obj-$(CONFIG_STM32MP13x) += stm32mp13x.o
+obj-$(CONFIG_STM32MP13X) += stm32mp13x.o
 obj-$(CONFIG_STM32MP15x) += stm32mp15x.o
 
 obj-$(CONFIG_STM32_ECDSA_VERIFY) += ecdsa_romapi.o
diff --git a/arch/arm/mach-stm32mp/stm32mp1/fdt.c b/arch/arm/mach-stm32mp/stm32mp1/fdt.c
index de5c5a55ea0e..9436b872e31e 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/fdt.c
+++ b/arch/arm/mach-stm32mp/stm32mp1/fdt.c
@@ -270,7 +270,7 @@ static int stm32_fdt_fixup_etzpc(void *fdt, int soc_node)
 	int offset, shift;
 	u32 addr, status, decprot[ETZPC_DECPROT_NB];
 
-	if (IS_ENABLED(CONFIG_STM32MP13x)) {
+	if (IS_ENABLED(CONFIG_STM32MP13X)) {
 		array = stm32mp13_ip_addr;
 		array_size = ARRAY_SIZE(stm32mp13_ip_addr);
 	}
@@ -491,7 +491,7 @@ int ft_system_setup(void *blob, struct bd_info *bd)
 	cpu = get_cpu_type();
 	get_soc_name(name);
 
-	if (IS_ENABLED(CONFIG_STM32MP13x))
+	if (IS_ENABLED(CONFIG_STM32MP13X))
 		stm32mp13_fdt_fixup(blob, soc, cpu, name);
 
 	if (IS_ENABLED(CONFIG_STM32MP15x)) {
diff --git a/board/st/common/Kconfig b/board/st/common/Kconfig
index f40d1a78ca36..6d1b76ba43a8 100644
--- a/board/st/common/Kconfig
+++ b/board/st/common/Kconfig
@@ -1,7 +1,7 @@
 config CMD_STBOARD
 	bool "stboard - command for OTP board information"
 	depends on ARCH_STM32MP
-	default y if TARGET_ST_STM32MP25X || TARGET_ST_STM32MP15x || TARGET_ST_STM32MP13x
+	default y if TARGET_ST_STM32MP25X || TARGET_ST_STM32MP15x || TARGET_ST_STM32MP13X
 	help
 	  This compile the stboard command to
 	  read and write the board in the OTP.
diff --git a/board/st/stm32mp1/Kconfig b/board/st/stm32mp1/Kconfig
index 6ab8f80fa45b..7d0d41bfea05 100644
--- a/board/st/stm32mp1/Kconfig
+++ b/board/st/stm32mp1/Kconfig
@@ -12,7 +12,7 @@ config SYS_CONFIG_NAME
 source "board/st/common/Kconfig"
 endif
 
-if TARGET_ST_STM32MP13x
+if TARGET_ST_STM32MP13X
 
 config SYS_BOARD
 	default "stm32mp1"
diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index 2d79bf0eb050..c893e272db9b 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -5,10 +5,10 @@ CONFIG_SYS_MALLOC_F_LEN=0x180000
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0xc0400000
 CONFIG_ENV_OFFSET=0x900000
 CONFIG_DEFAULT_DEVICE_TREE="stm32mp135f-dk"
-CONFIG_STM32MP13x=y
+CONFIG_STM32MP13X=y
 CONFIG_DDR_CACHEABLE_SIZE=0x8000000
 CONFIG_CMD_STM32KEY=y
-CONFIG_TARGET_ST_STM32MP13x=y
+CONFIG_TARGET_ST_STM32MP13X=y
 CONFIG_ENV_OFFSET_REDUND=0x940000
 CONFIG_CMD_STM32PROG=y
 # CONFIG_ARMV7_NONSEC is not set
diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
index 7a34ea23c381..7dbddd032b89 100644
--- a/drivers/clk/stm32/Kconfig
+++ b/drivers/clk/stm32/Kconfig
@@ -31,7 +31,7 @@ config CLK_STM32MP1
 config CLK_STM32MP13
 	bool "Enable RCC clock driver for STM32MP13"
 	depends on ARCH_STM32MP && CLK
-	default y if STM32MP13x
+	default y if STM32MP13X
 	select CLK_STM32_CORE
 	help
 	  Enable the STM32 clock (RCC) driver. Enable support for
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
