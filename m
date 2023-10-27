Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEA37D9BE7
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Oct 2023 16:44:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F758C6C855;
	Fri, 27 Oct 2023 14:44:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4805C6C841
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Oct 2023 14:44:28 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39RCg2QD010088; Fri, 27 Oct 2023 16:44:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=FF+71gaSy7DAlbSqWdIWn+w70Szs4lyHGfepwbfgFxQ=; b=hD
 aWp5de3aW0GAXX5fsYtsj/ERB5tZxMEnMXfnHmIOojHQNOOwUqfzm4bxlY0el64Q
 47w8PqZPsPtObzShD7Mo6Psd6UMCNO8nXwJnqmPi9gcmkZu8VFNuYh+sz9TXGxjL
 CpPNB0Z6wG377hntRMq0gx5UfvOaf0YjkMBpk3SKqPKSpRwZuaau+OXiUXNknxFI
 CVjzDWnEwGTsN66R+gHhg+2FwfVQavJP5XW+bheXRLYSqRObEWNSq0mkgT4V/TwK
 9WJl0JR7sOi3qxSfYP/7/GPUAedkFH5uU6N1L3kl3fgBLCgiUZSQMo+fX6oGHo6o
 XQalrDXlzx1W/mJvQawg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tywqq49e2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 16:44:19 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 97107100062;
 Fri, 27 Oct 2023 16:44:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 88E222721C2;
 Fri, 27 Oct 2023 16:44:16 +0200 (CEST)
Received: from localhost (10.201.20.38) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 27 Oct
 2023 16:44:16 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 27 Oct 2023 16:43:04 +0200
Message-ID: <20231027144304.1002307-10-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231027144304.1002307-1-patrice.chotard@foss.st.com>
References: <20231027144304.1002307-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_13,2023-10-27_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, Bharat Gooty <bharat.gooty@broadcom.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Simon Glass <sjg@chromium.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Johan Jonker <jbx6244@gmail.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: [Uboot-stm32] [PATCH v1 9/9] stm32mp2: initial support
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

Add initial support for STM32MP2 SoCs family.

SoCs information are available here :
https://www.st.com/content/st_com/en/campaigns/microprocessor-stm32mp2.html

Migrate all MP1 related code into stm32mp1/ directory
Create stm32mp2 directory dedicated for STM32MP2 SoCs.

Common code to MP1, MP13 and MP25 is kept into
arch/arm/mach-stm32/mach-stm32mp directory :
  - boot_params.c
  - bsec
  - cmd_stm32key
  - cmd_stm32prog
  - dram_init.c
  - syscon.c
  - ecdsa_romapi.c

For STM32MP2, it also :
  - adds memory region description needed for ARMv8 MMU.
  - enables early data cache before relocation.
    During the transition before/after relocation, the MMU, initially setup
    at the beginning of DDR, must be setup again at a correct address after
    relocation. This is done in enables_caches() by disabling cache, force
    arch.tlb_fillptr to NULL which will force the MMU to be setup again but
    with a new value for gd->arch.tlb_addr. gd->arch.tlb_addr has been
    updated after relocation in arm_reserve_mmu().

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/Kconfig                              |   2 +-
 arch/arm/mach-stm32mp/Kconfig                 |  26 ++-
 arch/arm/mach-stm32mp/Kconfig.25x             |  43 ++++
 arch/arm/mach-stm32mp/Makefile                |  15 +-
 arch/arm/mach-stm32mp/include/mach/stm32.h    | 141 ++++++++-----
 .../arm/mach-stm32mp/include/mach/sys_proto.h |  26 +++
 arch/arm/mach-stm32mp/stm32mp1/Makefile       |  20 ++
 arch/arm/mach-stm32mp/{ => stm32mp1}/cpu.c    |   0
 arch/arm/mach-stm32mp/{ => stm32mp1}/fdt.c    |   0
 arch/arm/mach-stm32mp/{ => stm32mp1}/psci.c   |   0
 .../{ => stm32mp1}/pwr_regulator.c            |   0
 arch/arm/mach-stm32mp/{ => stm32mp1}/spl.c    |   0
 .../mach-stm32mp/{ => stm32mp1}/stm32mp13x.c  |   0
 .../mach-stm32mp/{ => stm32mp1}/stm32mp15x.c  |   0
 arch/arm/mach-stm32mp/{ => stm32mp1}/tzc400.c |   0
 arch/arm/mach-stm32mp/stm32mp2/Makefile       |   9 +
 arch/arm/mach-stm32mp/stm32mp2/arm64-mmu.c    |  68 ++++++
 arch/arm/mach-stm32mp/stm32mp2/cpu.c          | 108 ++++++++++
 arch/arm/mach-stm32mp/stm32mp2/fdt.c          |  16 ++
 arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c   | 194 ++++++++++++++++++
 arch/arm/mach-stm32mp/syscon.c                |   4 +-
 board/st/stm32mp2/Kconfig                     |  13 ++
 board/st/stm32mp2/MAINTAINERS                 |   9 +
 board/st/stm32mp2/Makefile                    |   6 +
 board/st/stm32mp2/stm32mp2.c                  |  52 +++++
 configs/stm32mp25_defconfig                   |  52 +++++
 include/configs/stm32mp25_common.h            |  24 +++
 27 files changed, 757 insertions(+), 71 deletions(-)
 create mode 100644 arch/arm/mach-stm32mp/Kconfig.25x
 create mode 100644 arch/arm/mach-stm32mp/stm32mp1/Makefile
 rename arch/arm/mach-stm32mp/{ => stm32mp1}/cpu.c (100%)
 rename arch/arm/mach-stm32mp/{ => stm32mp1}/fdt.c (100%)
 rename arch/arm/mach-stm32mp/{ => stm32mp1}/psci.c (100%)
 rename arch/arm/mach-stm32mp/{ => stm32mp1}/pwr_regulator.c (100%)
 rename arch/arm/mach-stm32mp/{ => stm32mp1}/spl.c (100%)
 rename arch/arm/mach-stm32mp/{ => stm32mp1}/stm32mp13x.c (100%)
 rename arch/arm/mach-stm32mp/{ => stm32mp1}/stm32mp15x.c (100%)
 rename arch/arm/mach-stm32mp/{ => stm32mp1}/tzc400.c (100%)
 create mode 100644 arch/arm/mach-stm32mp/stm32mp2/Makefile
 create mode 100644 arch/arm/mach-stm32mp/stm32mp2/arm64-mmu.c
 create mode 100644 arch/arm/mach-stm32mp/stm32mp2/cpu.c
 create mode 100644 arch/arm/mach-stm32mp/stm32mp2/fdt.c
 create mode 100644 arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c
 create mode 100644 board/st/stm32mp2/Kconfig
 create mode 100644 board/st/stm32mp2/MAINTAINERS
 create mode 100644 board/st/stm32mp2/Makefile
 create mode 100644 board/st/stm32mp2/stm32mp2.c
 create mode 100644 configs/stm32mp25_defconfig
 create mode 100644 include/configs/stm32mp25_common.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index d812685c984..77f960de5c3 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1945,7 +1945,7 @@ config ARCH_STM32MP
 	select REGMAP
 	select SYSCON
 	select SYSRESET
-	select SYS_THUMB_BUILD
+	select SYS_THUMB_BUILD if !ARM64
 	imply SPL_SYSRESET
 	imply CMD_DM
 	imply CMD_POWEROFF
diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index db47baba6d1..5fc92d07fe6 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -76,6 +76,30 @@ config STM32MP15x
 		STM32MP157, STM32MP153 or STM32MP151
 		STMicroelectronics MPU with core ARMv7
 		dual core A7 for STM32MP157/3, monocore for STM32MP151
+
+config STM32MP25X
+	bool "Support STMicroelectronics STM32MP25x Soc"
+	select ARM64
+	select CLK_STM32MP25
+	select OF_BOARD
+	select PINCTRL_STM32
+	select STM32_RCC
+	select STM32_RESET
+	select STM32_SERIAL
+	select SYS_ARCH_TIMER
+	select TFABOOT
+	imply CLK_SCMI
+	imply CMD_NVEDIT_INFO
+	imply DM_REGULATOR
+	imply DM_REGULATOR_SCMI
+	imply OPTEE
+	imply RESET_SCMI
+	imply SYSRESET_PSCI
+	imply TEE
+	imply VERSION_VARIABLE
+	help
+		Support of STMicroelectronics SOC STM32MP25x family
+		STMicroelectronics MPU with 2 * A53 core and 1 M33 core
 endchoice
 
 config NR_DRAM_BANKS
@@ -128,6 +152,6 @@ config CMD_STM32KEY
 
 source "arch/arm/mach-stm32mp/Kconfig.13x"
 source "arch/arm/mach-stm32mp/Kconfig.15x"
-
+source "arch/arm/mach-stm32mp/Kconfig.25x"
 source "arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig"
 endif
diff --git a/arch/arm/mach-stm32mp/Kconfig.25x b/arch/arm/mach-stm32mp/Kconfig.25x
new file mode 100644
index 00000000000..2c0f691f8b5
--- /dev/null
+++ b/arch/arm/mach-stm32mp/Kconfig.25x
@@ -0,0 +1,43 @@
+if STM32MP25X
+
+choice
+	prompt "STM32MP25x board select"
+	optional
+
+config TARGET_ST_STM32MP25X
+	bool "STMicroelectronics STM32MP25x boards"
+	imply BOOTSTAGE
+	imply CMD_BOOTSTAGE
+	help
+		target the STMicroelectronics board with SOC STM32MP25x
+		managed by board/st/stm32mp2
+		The difference between board are managed with devicetree
+
+endchoice
+
+config TEXT_BASE
+	default 0x84000000
+
+config PRE_CON_BUF_ADDR
+	default 0x84800000
+
+config PRE_CON_BUF_SZ
+	default 4096
+
+config BOOTSTAGE_STASH_ADDR
+	default 0x87000000
+
+if DEBUG_UART
+
+config DEBUG_UART_BOARD_INIT
+	default y
+
+# debug on USART2 by default
+config DEBUG_UART_BASE
+	default 0x400e0000
+
+endif
+
+source "board/st/stm32mp2/Kconfig"
+
+endif
diff --git a/arch/arm/mach-stm32mp/Makefile b/arch/arm/mach-stm32mp/Makefile
index a19b2797c8b..00dc25bb275 100644
--- a/arch/arm/mach-stm32mp/Makefile
+++ b/arch/arm/mach-stm32mp/Makefile
@@ -3,24 +3,17 @@
 # Copyright (C) 2018, STMicroelectronics - All Rights Reserved
 #
 
-obj-y += cpu.o
 obj-y += dram_init.o
 obj-y += syscon.o
 obj-y += bsec.o
 
-obj-$(CONFIG_STM32MP13x) += stm32mp13x.o
-obj-$(CONFIG_STM32MP15x) += stm32mp15x.o
+obj-$(CONFIG_STM32MP15x) += stm32mp1/
+obj-$(CONFIG_STM32MP13x) += stm32mp1/
+obj-$(CONFIG_STM32MP25X) += stm32mp2/
 
 obj-$(CONFIG_STM32_ECDSA_VERIFY) += ecdsa_romapi.o
-ifdef CONFIG_SPL_BUILD
-obj-y += spl.o
-obj-y += tzc400.o
-else
+ifndef CONFIG_SPL_BUILD
 obj-y += cmd_stm32prog/
 obj-$(CONFIG_CMD_STM32KEY) += cmd_stm32key.o
-obj-$(CONFIG_ARMV7_PSCI) += psci.o
 obj-$(CONFIG_TFABOOT) += boot_params.o
 endif
-
-obj-$(CONFIG_$(SPL_)STM32MP15_PWR) += pwr_regulator.o
-obj-$(CONFIG_OF_SYSTEM_SETUP) += fdt.o
diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
index 1cdc5e3b186..ce9d795651b 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
@@ -8,12 +8,66 @@
 
 #ifndef __ASSEMBLY__
 #include <linux/bitops.h>
+
+enum boot_device {
+	BOOT_FLASH_SD = 0x10,
+	BOOT_FLASH_SD_1 = 0x11,
+	BOOT_FLASH_SD_2 = 0x12,
+	BOOT_FLASH_SD_3 = 0x13,
+
+	BOOT_FLASH_EMMC = 0x20,
+	BOOT_FLASH_EMMC_1 = 0x21,
+	BOOT_FLASH_EMMC_2 = 0x22,
+	BOOT_FLASH_EMMC_3 = 0x23,
+
+	BOOT_FLASH_NAND = 0x30,
+	BOOT_FLASH_NAND_FMC = 0x31,
+
+	BOOT_FLASH_NOR = 0x40,
+	BOOT_FLASH_NOR_QSPI = 0x41,
+
+	BOOT_SERIAL_UART = 0x50,
+	BOOT_SERIAL_UART_1 = 0x51,
+	BOOT_SERIAL_UART_2 = 0x52,
+	BOOT_SERIAL_UART_3 = 0x53,
+	BOOT_SERIAL_UART_4 = 0x54,
+	BOOT_SERIAL_UART_5 = 0x55,
+	BOOT_SERIAL_UART_6 = 0x56,
+	BOOT_SERIAL_UART_7 = 0x57,
+	BOOT_SERIAL_UART_8 = 0x58,
+
+	BOOT_SERIAL_USB = 0x60,
+	BOOT_SERIAL_USB_OTG = 0x62,
+
+	BOOT_FLASH_SPINAND = 0x70,
+	BOOT_FLASH_SPINAND_1 = 0x71,
+};
+
+#define TAMP_BOOT_MODE_MASK		GENMASK(15, 8)
+#define TAMP_BOOT_MODE_SHIFT		8
+#define TAMP_BOOT_DEVICE_MASK		GENMASK(7, 4)
+#define TAMP_BOOT_INSTANCE_MASK		GENMASK(3, 0)
+#define TAMP_BOOT_FORCED_MASK		GENMASK(7, 0)
+#define TAMP_BOOT_DEBUG_ON		BIT(16)
+
+enum forced_boot_mode {
+	BOOT_NORMAL = 0x00,
+	BOOT_FASTBOOT = 0x01,
+	BOOT_RECOVERY = 0x02,
+	BOOT_STM32PROG = 0x03,
+	BOOT_UMS_MMC0 = 0x10,
+	BOOT_UMS_MMC1 = 0x11,
+	BOOT_UMS_MMC2 = 0x12,
+};
+
 #endif
 
 /*
  * Peripheral memory map
  * only address used before device tree parsing
  */
+
+#if defined(CONFIG_STM32MP15x) || defined(CONFIG_STM32MP13x)
 #define STM32_RCC_BASE			0x50000000
 #define STM32_PWR_BASE			0x50001000
 #define STM32_SYSCFG_BASE		0x50020000
@@ -58,12 +112,6 @@
 #define STM32_DDR_SIZE			SZ_1G
 
 #ifndef __ASSEMBLY__
-/* enumerated used to identify the SYSCON driver instance */
-enum {
-	STM32MP_SYSCON_UNKNOWN,
-	STM32MP_SYSCON_SYSCFG,
-};
-
 /*
  * enumerated for boot interface from Bootrom, used in TAMP_BOOT_CONTEXT
  * - boot device = bit 8:4
@@ -74,40 +122,6 @@ enum {
 #define BOOT_INSTANCE_MASK	0x0F
 #define BOOT_INSTANCE_SHIFT	0
 
-enum boot_device {
-	BOOT_FLASH_SD = 0x10,
-	BOOT_FLASH_SD_1 = 0x11,
-	BOOT_FLASH_SD_2 = 0x12,
-	BOOT_FLASH_SD_3 = 0x13,
-
-	BOOT_FLASH_EMMC = 0x20,
-	BOOT_FLASH_EMMC_1 = 0x21,
-	BOOT_FLASH_EMMC_2 = 0x22,
-	BOOT_FLASH_EMMC_3 = 0x23,
-
-	BOOT_FLASH_NAND = 0x30,
-	BOOT_FLASH_NAND_FMC = 0x31,
-
-	BOOT_FLASH_NOR = 0x40,
-	BOOT_FLASH_NOR_QSPI = 0x41,
-
-	BOOT_SERIAL_UART = 0x50,
-	BOOT_SERIAL_UART_1 = 0x51,
-	BOOT_SERIAL_UART_2 = 0x52,
-	BOOT_SERIAL_UART_3 = 0x53,
-	BOOT_SERIAL_UART_4 = 0x54,
-	BOOT_SERIAL_UART_5 = 0x55,
-	BOOT_SERIAL_UART_6 = 0x56,
-	BOOT_SERIAL_UART_7 = 0x57,
-	BOOT_SERIAL_UART_8 = 0x58,
-
-	BOOT_SERIAL_USB = 0x60,
-	BOOT_SERIAL_USB_OTG = 0x62,
-
-	BOOT_FLASH_SPINAND = 0x70,
-	BOOT_FLASH_SPINAND_1 = 0x71,
-};
-
 /* TAMP registers */
 #define TAMP_BACKUP_REGISTER(x)		(STM32_TAMP_BASE + 0x100 + 4 * x)
 
@@ -123,7 +137,6 @@ enum boot_device {
 #define TAMP_FWU_BOOT_IDX_MASK		GENMASK(3, 0)
 
 #define TAMP_FWU_BOOT_IDX_OFFSET	0
-
 #define TAMP_COPRO_STATE_OFF		0
 #define TAMP_COPRO_STATE_INIT		1
 #define TAMP_COPRO_STATE_CRUN		2
@@ -137,21 +150,23 @@ enum boot_device {
 #define TAMP_BOOT_CONTEXT		TAMP_BACKUP_REGISTER(30)
 #endif
 
-#define TAMP_BOOT_MODE_MASK		GENMASK(15, 8)
-#define TAMP_BOOT_MODE_SHIFT		8
-#define TAMP_BOOT_DEVICE_MASK		GENMASK(7, 4)
-#define TAMP_BOOT_INSTANCE_MASK		GENMASK(3, 0)
-#define TAMP_BOOT_FORCED_MASK		GENMASK(7, 0)
+#endif /* __ASSEMBLY__ */
+#endif /* CONFIG_STM32MP15X || CONFIG_STM32MP13X */
 
-enum forced_boot_mode {
-	BOOT_NORMAL = 0x00,
-	BOOT_FASTBOOT = 0x01,
-	BOOT_RECOVERY = 0x02,
-	BOOT_STM32PROG = 0x03,
-	BOOT_UMS_MMC0 = 0x10,
-	BOOT_UMS_MMC1 = 0x11,
-	BOOT_UMS_MMC2 = 0x12,
-};
+#if CONFIG_STM32MP25X
+#define STM32_RCC_BASE			0x44200000
+#define STM32_TAMP_BASE			0x46010000
+
+#define STM32_DDR_BASE			0x80000000
+
+#define STM32_DDR_SIZE			SZ_4G
+
+/* TAMP registers x = 0 to 127 : hardcoded description, waiting NVMEM node in DT */
+#define TAMP_BACKUP_REGISTER(x)		(STM32_TAMP_BASE + 0x100 + 4 * (x))
+
+/* TAMP registers zone 3 RIF 1 (RW) at 96*/
+#define TAMP_BOOT_CONTEXT		TAMP_BACKUP_REGISTER(96)
+#endif /* STM32MP25X */
 
 /* offset used for BSEC driver: misc_read and misc_write */
 #define STM32_BSEC_SHADOW_OFFSET	0x0
@@ -175,6 +190,20 @@ enum forced_boot_mode {
 #define BSEC_OTP_MAC	57
 #define BSEC_OTP_BOARD	60
 #endif
+#ifdef CONFIG_STM32MP25X
+#define BSEC_OTP_SERIAL	5
+#define BSEC_OTP_RPN	9
+#define BSEC_OTP_PKG	246
+#endif
+
+#ifndef __ASSEMBLY__
+#include <asm/types.h>
+
+/* enumerated used to identify the SYSCON driver instance */
+enum {
+	STM32MP_SYSCON_UNKNOWN,
+	STM32MP_SYSCON_SYSCFG,
+};
+#endif /* __ASSEMBLY__*/
 
-#endif /* __ASSEMBLY__ */
 #endif /* _MACH_STM32_H_ */
diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
index 83fb32a45fc..7b2df09a33c 100644
--- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
+++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
@@ -30,11 +30,30 @@
 #define CPU_STM32MP131Fxx	0x05010EC8
 #define CPU_STM32MP131Dxx	0x05010EC9
 
+/* ID for STM32MP25x = Device Part Number (RPN) (bit31:0) */
+#define CPU_STM32MP257Cxx       0x00002000
+#define CPU_STM32MP255Cxx       0x00082000
+#define CPU_STM32MP253Cxx       0x000B2004
+#define CPU_STM32MP251Cxx       0x000B3065
+#define CPU_STM32MP257Axx       0x40002E00
+#define CPU_STM32MP255Axx       0x40082E00
+#define CPU_STM32MP253Axx       0x400B2E04
+#define CPU_STM32MP251Axx       0x400B3E65
+#define CPU_STM32MP257Fxx       0x80002000
+#define CPU_STM32MP255Fxx       0x80082000
+#define CPU_STM32MP253Fxx       0x800B2004
+#define CPU_STM32MP251Fxx       0x800B3065
+#define CPU_STM32MP257Dxx       0xC0002E00
+#define CPU_STM32MP255Dxx       0xC0082E00
+#define CPU_STM32MP253Dxx       0xC00B2E04
+#define CPU_STM32MP251Dxx       0xC00B3E65
+
 /* return CPU_STMP32MP...Xxx constants */
 u32 get_cpu_type(void);
 
 #define CPU_DEV_STM32MP15	0x500
 #define CPU_DEV_STM32MP13	0x501
+#define CPU_DEV_STM32MP25	0x505
 
 /* return CPU_DEV constants */
 u32 get_cpu_dev(void);
@@ -59,6 +78,13 @@ u32 get_cpu_package(void);
 #define STM32MP15_PKG_AD_TFBGA257	1
 #define STM32MP15_PKG_UNKNOWN		0
 
+/* package used for STM32MP25x */
+#define STM32MP25_PKG_CUSTOM		0
+#define STM32MP25_PKG_AL_TBGA361	3
+#define STM32MP25_PKG_AK_TBGA424	4
+#define STM32MP25_PKG_AI_TBGA436	5
+#define STM32MP25_PKG_UNKNOWN		7
+
 /* Get SOC name */
 #define SOC_NAME_SIZE 20
 void get_soc_name(char name[SOC_NAME_SIZE]);
diff --git a/arch/arm/mach-stm32mp/stm32mp1/Makefile b/arch/arm/mach-stm32mp/stm32mp1/Makefile
new file mode 100644
index 00000000000..94c7724127e
--- /dev/null
+++ b/arch/arm/mach-stm32mp/stm32mp1/Makefile
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0+
+#
+# Copyright (C) 2018, STMicroelectronics - All Rights Reserved
+#
+
+obj-y += cpu.o
+
+obj-$(CONFIG_STM32MP13x) += stm32mp13x.o
+obj-$(CONFIG_STM32MP15x) += stm32mp15x.o
+
+obj-$(CONFIG_STM32_ECDSA_VERIFY) += ecdsa_romapi.o
+ifdef CONFIG_SPL_BUILD
+obj-y += spl.o
+obj-y += tzc400.o
+else
+obj-$(CONFIG_ARMV7_PSCI) += psci.o
+endif
+
+obj-$(CONFIG_$(SPL_)STM32MP15_PWR) += pwr_regulator.o
+obj-$(CONFIG_OF_SYSTEM_SETUP) += fdt.o
diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
similarity index 100%
rename from arch/arm/mach-stm32mp/cpu.c
rename to arch/arm/mach-stm32mp/stm32mp1/cpu.c
diff --git a/arch/arm/mach-stm32mp/fdt.c b/arch/arm/mach-stm32mp/stm32mp1/fdt.c
similarity index 100%
rename from arch/arm/mach-stm32mp/fdt.c
rename to arch/arm/mach-stm32mp/stm32mp1/fdt.c
diff --git a/arch/arm/mach-stm32mp/psci.c b/arch/arm/mach-stm32mp/stm32mp1/psci.c
similarity index 100%
rename from arch/arm/mach-stm32mp/psci.c
rename to arch/arm/mach-stm32mp/stm32mp1/psci.c
diff --git a/arch/arm/mach-stm32mp/pwr_regulator.c b/arch/arm/mach-stm32mp/stm32mp1/pwr_regulator.c
similarity index 100%
rename from arch/arm/mach-stm32mp/pwr_regulator.c
rename to arch/arm/mach-stm32mp/stm32mp1/pwr_regulator.c
diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/stm32mp1/spl.c
similarity index 100%
rename from arch/arm/mach-stm32mp/spl.c
rename to arch/arm/mach-stm32mp/stm32mp1/spl.c
diff --git a/arch/arm/mach-stm32mp/stm32mp13x.c b/arch/arm/mach-stm32mp/stm32mp1/stm32mp13x.c
similarity index 100%
rename from arch/arm/mach-stm32mp/stm32mp13x.c
rename to arch/arm/mach-stm32mp/stm32mp1/stm32mp13x.c
diff --git a/arch/arm/mach-stm32mp/stm32mp15x.c b/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
similarity index 100%
rename from arch/arm/mach-stm32mp/stm32mp15x.c
rename to arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
diff --git a/arch/arm/mach-stm32mp/tzc400.c b/arch/arm/mach-stm32mp/stm32mp1/tzc400.c
similarity index 100%
rename from arch/arm/mach-stm32mp/tzc400.c
rename to arch/arm/mach-stm32mp/stm32mp1/tzc400.c
diff --git a/arch/arm/mach-stm32mp/stm32mp2/Makefile b/arch/arm/mach-stm32mp/stm32mp2/Makefile
new file mode 100644
index 00000000000..b579ce5a800
--- /dev/null
+++ b/arch/arm/mach-stm32mp/stm32mp2/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+#
+# Copyright (C) 2023, STMicroelectronics - All Rights Reserved
+#
+
+obj-y += cpu.o
+obj-y += arm64-mmu.o
+obj-$(CONFIG_OF_SYSTEM_SETUP) += fdt.o
+obj-$(CONFIG_STM32MP25X) += stm32mp25x.o
diff --git a/arch/arm/mach-stm32mp/stm32mp2/arm64-mmu.c b/arch/arm/mach-stm32mp/stm32mp2/arm64-mmu.c
new file mode 100644
index 00000000000..a203eebdc59
--- /dev/null
+++ b/arch/arm/mach-stm32mp/stm32mp2/arm64-mmu.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
+ */
+
+#include <common.h>
+#include <asm/system.h>
+#include <asm/armv8/mmu.h>
+
+#define MP2_MEM_MAP_MAX 10
+
+#if (CONFIG_TEXT_BASE < STM32_DDR_BASE) || \
+	(CONFIG_TEXT_BASE > (STM32_DDR_BASE + STM32_DDR_SIZE))
+#error "invalid CONFIG_TEXT_BASE value"
+#endif
+
+struct mm_region stm32mp2_mem_map[MP2_MEM_MAP_MAX] = {
+	{
+		/* PCIe */
+		.virt = 0x10000000UL,
+		.phys = 0x10000000UL,
+		.size = 0x10000000UL,
+		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
+			 PTE_BLOCK_NON_SHARE |
+			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
+	}, {
+		/* LPSRAMs, VDERAM, RETRAM, SRAMs, SYSRAM: alias1 */
+		.virt = 0x20000000UL,
+		.phys = 0x20000000UL,
+		.size = 0x00200000UL,
+		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
+			 PTE_BLOCK_NON_SHARE |
+			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
+	}, {
+		/* Peripherals: alias1 */
+		.virt = 0x40000000UL,
+		.phys = 0x40000000UL,
+		.size = 0x10000000UL,
+		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
+			 PTE_BLOCK_NON_SHARE |
+			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
+	}, {
+		/* OSPI and FMC: memory-map area */
+		.virt = 0x60000000UL,
+		.phys = 0x60000000UL,
+		.size = 0x20000000UL,
+		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
+			 PTE_BLOCK_NON_SHARE |
+			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
+	}, {
+		/*
+		 * DDR = STM32_DDR_BASE / STM32_DDR_SIZE
+		 * the beginning of DDR (before CONFIG_TEXT_BASE) is not
+		 * mapped, protected by RIF and reserved for other firmware
+		 * (OP-TEE / TF-M / Cube M33)
+		 */
+		.virt = CONFIG_TEXT_BASE,
+		.phys = CONFIG_TEXT_BASE,
+		.size = STM32_DDR_SIZE - (CONFIG_TEXT_BASE - STM32_DDR_BASE),
+		.attrs = PTE_BLOCK_MEMTYPE(MT_NORMAL) |
+			 PTE_BLOCK_INNER_SHARE
+	}, {
+		/* List terminator */
+		0,
+	}
+};
+
+struct mm_region *mem_map = stm32mp2_mem_map;
diff --git a/arch/arm/mach-stm32mp/stm32mp2/cpu.c b/arch/arm/mach-stm32mp/stm32mp2/cpu.c
new file mode 100644
index 00000000000..5bfeab17ab7
--- /dev/null
+++ b/arch/arm/mach-stm32mp/stm32mp2/cpu.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
+ */
+
+#define LOG_CATEGORY LOGC_ARCH
+
+#include <common.h>
+#include <clk.h>
+#include <cpu_func.h>
+#include <debug_uart.h>
+#include <env_internal.h>
+#include <init.h>
+#include <misc.h>
+#include <wdt.h>
+#include <asm/io.h>
+#include <asm/arch/stm32.h>
+#include <asm/arch/sys_proto.h>
+#include <asm/system.h>
+#include <dm/device.h>
+#include <dm/lists.h>
+#include <dm/uclass.h>
+
+/*
+ * early TLB into the .data section so that it not get cleared
+ * with 16kB alignment
+ */
+#define EARLY_TLB_SIZE 0xA000
+u8 early_tlb[EARLY_TLB_SIZE] __section(".data") __aligned(0x4000);
+
+/*
+ * initialize the MMU and activate cache in U-Boot pre-reloc stage
+ * MMU/TLB is updated in enable_caches() for U-Boot after relocation
+ */
+static void early_enable_caches(void)
+{
+	if (CONFIG_IS_ENABLED(SYS_DCACHE_OFF))
+		return;
+
+	if (!(CONFIG_IS_ENABLED(SYS_ICACHE_OFF) && CONFIG_IS_ENABLED(SYS_DCACHE_OFF))) {
+		gd->arch.tlb_size = EARLY_TLB_SIZE;
+		gd->arch.tlb_addr = (unsigned long)&early_tlb;
+	}
+	/* enable MMU (default configuration) */
+	dcache_enable();
+}
+
+/*
+ * Early system init
+ */
+int arch_cpu_init(void)
+{
+	icache_enable();
+	early_enable_caches();
+
+	return 0;
+}
+
+void enable_caches(void)
+{
+	/* deactivate the data cache, early enabled in arch_cpu_init() */
+	dcache_disable();
+	/*
+	 * Force the call of setup_all_pgtables() in mmu_setup() by clearing tlb_fillptr
+	 * to update the TLB location udpated in board_f.c::reserve_mmu
+	 */
+	gd->arch.tlb_fillptr = 0;
+	dcache_enable();
+}
+
+/* used when CONFIG_DISPLAY_CPUINFO is activated */
+int print_cpuinfo(void)
+{
+	char name[SOC_NAME_SIZE];
+
+	get_soc_name(name);
+	printf("CPU: %s\n", name);
+
+	return 0;
+}
+
+int arch_misc_init(void)
+{
+	return 0;
+}
+
+/*
+ * Force data-section, as .bss will not be valid
+ * when save_boot_params is invoked.
+ */
+static uintptr_t nt_fw_dtb __section(".data");
+
+uintptr_t get_stm32mp_bl2_dtb(void)
+{
+	return nt_fw_dtb;
+}
+
+/*
+ * Save the FDT address provided by TF-A in r2 at boot time
+ * This function is called from start.S
+ */
+void save_boot_params(unsigned long r0, unsigned long r1, unsigned long r2,
+		      unsigned long r3)
+{
+	nt_fw_dtb = r2;
+
+	save_boot_params_ret();
+}
diff --git a/arch/arm/mach-stm32mp/stm32mp2/fdt.c b/arch/arm/mach-stm32mp/stm32mp2/fdt.c
new file mode 100644
index 00000000000..ee570863bb7
--- /dev/null
+++ b/arch/arm/mach-stm32mp/stm32mp2/fdt.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
+ */
+
+#include <common.h>
+
+/*
+ * This function is called right before the kernel is booted. "blob" is the
+ * device tree that will be passed to the kernel.
+ */
+int ft_system_setup(void *blob, struct bd_info *bd)
+{
+	return 0;
+}
+
diff --git a/arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c b/arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c
new file mode 100644
index 00000000000..7d2dab2201d
--- /dev/null
+++ b/arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
+ */
+
+#define LOG_CATEGORY LOGC_ARCH
+
+#include <common.h>
+#include <log.h>
+#include <syscon.h>
+#include <asm/io.h>
+#include <asm/arch/stm32.h>
+#include <asm/arch/sys_proto.h>
+
+/* SYSCFG register */
+#define SYSCFG_DEVICEID_OFFSET		0x6400
+#define SYSCFG_DEVICEID_DEV_ID_MASK	GENMASK(11, 0)
+#define SYSCFG_DEVICEID_DEV_ID_SHIFT	0
+#define SYSCFG_DEVICEID_REV_ID_MASK	GENMASK(31, 16)
+#define SYSCFG_DEVICEID_REV_ID_SHIFT	16
+
+/* Device Part Number (RPN) = OTP9 */
+#define RPN_SHIFT	0
+#define RPN_MASK	GENMASK(31, 0)
+
+/* Package = bit 0:2 of OTP122 => STM32MP25_PKG defines
+ * - 000: Custom package
+ * - 011: TFBGA361 => AL = 10x10, 361 balls pith 0.5mm
+ * - 100: TFBGA424 => AK = 14x14, 424 balls pith 0.5mm
+ * - 101: TFBGA436 => AI = 18x18, 436 balls pith 0.5mm
+ * - others: Reserved
+ */
+#define PKG_SHIFT	0
+#define PKG_MASK	GENMASK(2, 0)
+
+static u32 read_deviceid(void)
+{
+	void *syscfg = syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
+
+	return readl(syscfg + SYSCFG_DEVICEID_OFFSET);
+}
+
+u32 get_cpu_dev(void)
+{
+	return (read_deviceid() & SYSCFG_DEVICEID_DEV_ID_MASK) >> SYSCFG_DEVICEID_DEV_ID_SHIFT;
+}
+
+u32 get_cpu_rev(void)
+{
+	return (read_deviceid() & SYSCFG_DEVICEID_REV_ID_MASK) >> SYSCFG_DEVICEID_REV_ID_SHIFT;
+}
+
+/* Get Device Part Number (RPN) from OTP */
+u32 get_cpu_type(void)
+{
+	return get_otp(BSEC_OTP_RPN, RPN_SHIFT, RPN_MASK);
+}
+
+/* Get Package options from OTP */
+u32 get_cpu_package(void)
+{
+	return get_otp(BSEC_OTP_PKG, PKG_SHIFT, PKG_MASK);
+}
+
+int get_eth_nb(void)
+{
+	int nb_eth;
+
+	switch (get_cpu_type()) {
+	case CPU_STM32MP257Fxx:
+		fallthrough;
+	case CPU_STM32MP257Dxx:
+		fallthrough;
+	case CPU_STM32MP257Cxx:
+		fallthrough;
+	case CPU_STM32MP257Axx:
+		nb_eth = 5; /* dual ETH with TSN support */
+		break;
+	case CPU_STM32MP253Fxx:
+		fallthrough;
+	case CPU_STM32MP253Dxx:
+		fallthrough;
+	case CPU_STM32MP253Cxx:
+		fallthrough;
+	case CPU_STM32MP253Axx:
+		nb_eth = 2; /* dual ETH */
+		break;
+	case CPU_STM32MP251Fxx:
+		fallthrough;
+	case CPU_STM32MP251Dxx:
+		fallthrough;
+	case CPU_STM32MP251Cxx:
+		fallthrough;
+	case CPU_STM32MP251Axx:
+		nb_eth = 1; /* single ETH */
+		break;
+	default:
+		nb_eth = 0;
+		break;
+	}
+
+	return nb_eth;
+}
+
+void get_soc_name(char name[SOC_NAME_SIZE])
+{
+	char *cpu_s, *cpu_r, *package;
+
+	cpu_s = "????";
+	cpu_r = "?";
+	package = "??";
+	if (get_cpu_dev() == CPU_DEV_STM32MP25) {
+		switch (get_cpu_type()) {
+		case CPU_STM32MP257Fxx:
+			cpu_s = "257F";
+			break;
+		case CPU_STM32MP257Dxx:
+			cpu_s = "257D";
+			break;
+		case CPU_STM32MP257Cxx:
+			cpu_s = "257C";
+			break;
+		case CPU_STM32MP257Axx:
+			cpu_s = "257A";
+			break;
+		case CPU_STM32MP255Fxx:
+			cpu_s = "255F";
+			break;
+		case CPU_STM32MP255Dxx:
+			cpu_s = "255D";
+			break;
+		case CPU_STM32MP255Cxx:
+			cpu_s = "255C";
+			break;
+		case CPU_STM32MP255Axx:
+			cpu_s = "255A";
+			break;
+		case CPU_STM32MP253Fxx:
+			cpu_s = "253F";
+			break;
+		case CPU_STM32MP253Dxx:
+			cpu_s = "253D";
+			break;
+		case CPU_STM32MP253Cxx:
+			cpu_s = "253C";
+			break;
+		case CPU_STM32MP253Axx:
+			cpu_s = "253A";
+			break;
+		case CPU_STM32MP251Fxx:
+			cpu_s = "251F";
+			break;
+		case CPU_STM32MP251Dxx:
+			cpu_s = "251D";
+			break;
+		case CPU_STM32MP251Cxx:
+			cpu_s = "251C";
+			break;
+		case CPU_STM32MP251Axx:
+			cpu_s = "251A";
+			break;
+		default:
+			cpu_s = "25??";
+			break;
+		}
+		/* REVISION */
+		switch (get_cpu_rev()) {
+		case CPU_REV1:
+			cpu_r = "A";
+			break;
+		default:
+			break;
+		}
+		/* PACKAGE */
+		switch (get_cpu_package()) {
+		case STM32MP25_PKG_CUSTOM:
+			package = "XX";
+			break;
+		case STM32MP25_PKG_AL_TBGA361:
+			package = "AL";
+			break;
+		case STM32MP25_PKG_AK_TBGA424:
+			package = "AK";
+			break;
+		case STM32MP25_PKG_AI_TBGA436:
+			package = "AI";
+			break;
+		default:
+			break;
+		}
+	}
+
+	snprintf(name, SOC_NAME_SIZE, "STM32MP%s%s Rev.%s", cpu_s, package, cpu_r);
+}
diff --git a/arch/arm/mach-stm32mp/syscon.c b/arch/arm/mach-stm32mp/syscon.c
index a0e8e1dfdc5..a2e351d74a7 100644
--- a/arch/arm/mach-stm32mp/syscon.c
+++ b/arch/arm/mach-stm32mp/syscon.c
@@ -10,8 +10,8 @@
 #include <asm/arch/stm32.h>
 
 static const struct udevice_id stm32mp_syscon_ids[] = {
-	{ .compatible = "st,stm32mp157-syscfg",
-	  .data = STM32MP_SYSCON_SYSCFG },
+	{ .compatible = "st,stm32mp157-syscfg", .data = STM32MP_SYSCON_SYSCFG },
+	{ .compatible = "st,stm32mp25-syscfg", .data = STM32MP_SYSCON_SYSCFG},
 	{ }
 };
 
diff --git a/board/st/stm32mp2/Kconfig b/board/st/stm32mp2/Kconfig
new file mode 100644
index 00000000000..89039f068a2
--- /dev/null
+++ b/board/st/stm32mp2/Kconfig
@@ -0,0 +1,13 @@
+if TARGET_ST_STM32MP25X
+
+config SYS_BOARD
+	default "stm32mp2"
+
+config SYS_VENDOR
+	default "st"
+
+config SYS_CONFIG_NAME
+	default "stm32mp25_common"
+
+source "board/st/common/Kconfig"
+endif
diff --git a/board/st/stm32mp2/MAINTAINERS b/board/st/stm32mp2/MAINTAINERS
new file mode 100644
index 00000000000..e6bea910f92
--- /dev/null
+++ b/board/st/stm32mp2/MAINTAINERS
@@ -0,0 +1,9 @@
+STM32MP2 BOARD
+M:	Patrice Chotard <patrice.chotard@st.com>
+M:	Patrick Delaunay <patrick.delaunay@st.com>
+L:	uboot-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
+S:	Maintained
+F:	arch/arm/dts/stm32mp25*
+F:	board/st/stm32mp2/
+F:	configs/stm32mp25_defconfig
+F:	include/configs/stm32mp25_common.h
diff --git a/board/st/stm32mp2/Makefile b/board/st/stm32mp2/Makefile
new file mode 100644
index 00000000000..50352fb71b4
--- /dev/null
+++ b/board/st/stm32mp2/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+#
+# Copyright (C) 2023, STMicroelectronics - All Rights Reserved
+#
+
+obj-y += stm32mp2.o
diff --git a/board/st/stm32mp2/stm32mp2.c b/board/st/stm32mp2/stm32mp2.c
new file mode 100644
index 00000000000..132c511ce96
--- /dev/null
+++ b/board/st/stm32mp2/stm32mp2.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
+ */
+
+#define LOG_CATEGORY LOGC_BOARD
+
+#include <common.h>
+#include <config.h>
+#include <env.h>
+#include <fdt_support.h>
+#include <asm/global_data.h>
+#include <asm/arch/sys_proto.h>
+
+/*
+ * Get a global data pointer
+ */
+DECLARE_GLOBAL_DATA_PTR;
+
+/* board dependent setup after realloc */
+int board_init(void)
+{
+	return 0;
+}
+
+int board_late_init(void)
+{
+	const void *fdt_compat;
+	int fdt_compat_len;
+	char dtb_name[256];
+	int buf_len;
+
+	if (IS_ENABLED(CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG)) {
+		fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
+					 &fdt_compat_len);
+		if (fdt_compat && fdt_compat_len) {
+			if (strncmp(fdt_compat, "st,", 3) != 0) {
+				env_set("board_name", fdt_compat);
+			} else {
+				env_set("board_name", fdt_compat + 3);
+
+				buf_len = sizeof(dtb_name);
+				strlcpy(dtb_name, fdt_compat + 3, buf_len);
+				buf_len -= strlen(fdt_compat + 3);
+				strlcat(dtb_name, ".dtb", buf_len);
+				env_set("fdtfile", dtb_name);
+			}
+		}
+	}
+
+	return 0;
+}
diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
new file mode 100644
index 00000000000..4d5ac6f64ea
--- /dev/null
+++ b/configs/stm32mp25_defconfig
@@ -0,0 +1,52 @@
+CONFIG_ARM=y
+CONFIG_ARCH_STM32MP=y
+CONFIG_SYS_MALLOC_F_LEN=0x400000
+CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x90000000
+CONFIG_DEFAULT_DEVICE_TREE="stm32mp257f-ev1"
+CONFIG_STM32MP25X=y
+CONFIG_DDR_CACHEABLE_SIZE=0x10000000
+CONFIG_TARGET_ST_STM32MP25X=y
+CONFIG_SYS_LOAD_ADDR=0x84000000
+CONFIG_SYS_MEMTEST_START=0x84000000
+CONFIG_SYS_MEMTEST_END=0x88000000
+CONFIG_FIT=y
+CONFIG_BOOTDELAY=1
+CONFIG_LAST_STAGE_INIT=y
+CONFIG_SYS_PROMPT="STM32MP> "
+# CONFIG_CMD_BDI is not set
+CONFIG_CMD_BOOTZ=y
+CONFIG_SYS_BOOTM_LEN=0x2000000
+CONFIG_CMD_ADTIMG=y
+# CONFIG_CMD_ELF is not set
+CONFIG_CMD_MEMINFO=y
+CONFIG_CMD_MEMTEST=y
+CONFIG_CMD_CLK=y
+CONFIG_CMD_GPIO=y
+# CONFIG_CMD_LOADB is not set
+# CONFIG_CMD_NET is not set
+CONFIG_CMD_CACHE=y
+CONFIG_CMD_TIME=y
+CONFIG_CMD_RNG=y
+CONFIG_CMD_TIMER=y
+CONFIG_CMD_REGULATOR=y
+CONFIG_CMD_LOG=y
+CONFIG_OF_LIVE=y
+CONFIG_GPIO_HOG=y
+CONFIG_DM_I2C=y
+CONFIG_SYS_I2C_STM32F7=y
+# CONFIG_MMC is not set
+CONFIG_PINCONF=y
+CONFIG_DM_REGULATOR_FIXED=y
+CONFIG_DM_REGULATOR_GPIO=y
+CONFIG_RAM=y
+# CONFIG_STM32MP1_DDR is not set
+CONFIG_DM_RNG=y
+CONFIG_SERIAL_RX_BUFFER=y
+# CONFIG_OPTEE_TA_AVB is not set
+CONFIG_WDT=y
+CONFIG_WDT_STM32MP=y
+CONFIG_WDT_ARM_SMC=y
+CONFIG_ERRNO_STR=y
+# CONFIG_LMB_USE_MAX_REGIONS is not set
+CONFIG_LMB_MEMORY_REGIONS=2
+CONFIG_LMB_RESERVED_REGIONS=32
diff --git a/include/configs/stm32mp25_common.h b/include/configs/stm32mp25_common.h
new file mode 100644
index 00000000000..ec980eea856
--- /dev/null
+++ b/include/configs/stm32mp25_common.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause */
+/*
+ * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
+ *
+ * Configuration settings for the STM32MP25x CPU
+ */
+
+#ifndef __CONFIG_STM32MP25_COMMMON_H
+#define __CONFIG_STM32MP25_COMMMON_H
+#include <linux/sizes.h>
+#include <asm/arch/stm32.h>
+
+/*
+ * Configuration of the external SRAM memory used by U-Boot
+ */
+#define CFG_SYS_SDRAM_BASE	STM32_DDR_BASE
+
+/*
+ * For booting Linux, use the first 256 MB of memory, since this is
+ * the maximum mapped by the Linux kernel during initialization.
+ */
+#define CFG_SYS_BOOTMAPSZ	SZ_256M
+
+#endif /* __CONFIG_STM32MP25_COMMMON_H */
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
