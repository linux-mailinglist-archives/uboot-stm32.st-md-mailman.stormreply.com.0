Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EA1AE97A3
	for <lists+uboot-stm32@lfdr.de>; Thu, 26 Jun 2025 10:10:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2EBAC30883;
	Thu, 26 Jun 2025 08:10:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C90EDC36B0E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Jun 2025 08:10:57 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q7hxUM025231;
 Thu, 26 Jun 2025 10:10:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=oD9ncGTXXOfl8s8QZxh3kr
 Sqfe2N+nKpELWSIYxX1q8=; b=d8f5IJ5ruv4+80uJXUQTrk0wEplDXsiSohlt1I
 aKhlWnpiJFrHuGxWhCSTE6H+REjvkpDdJ0jqayP883iCvFywVk1k9V7Y7FExN+Tn
 pCQN3S4p87999JWRkohQZi+KUnBSd0mV2GemNQwoxNHyuHq4Jhxd1waLz0Gk9IIM
 1RscD7SrHofl8WbOnJQ3u5gIHM7+XQvzwwpihBbe6SVc7VI5IJNfb6hoV5hDlq5q
 EjKRG7Vz2W9mRQhHJKRmtFzkqBA6epssfie/S0uxYawM7D0SN4N2aEJ0q+WyRYKC
 DSvX08p1iXQqwy0ds3R+L1ZEav71JksQcAueC3lCqDtLcnpg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dkmjw2kj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jun 2025 10:10:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B690B4004A;
 Thu, 26 Jun 2025 10:09:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 148B2B17AF2;
 Thu, 26 Jun 2025 10:08:49 +0200 (CEST)
Received: from localhost (10.252.13.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 10:08:48 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 26 Jun 2025 10:08:45 +0200
Message-ID: <20250626080846.48576-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.13.141]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_03,2025-06-25_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Marek Vasut <marek.vasut@mailbox.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/2] ARM: stm32mp: Add STM32MP23 support
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

Add STM32MP23 support which is a cost optimized of STM32MP25.
More details available at:
https://www.st.com/en/microcontrollers-microprocessors/stm32mp2-series.html

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/mach-stm32mp/Kconfig                 |  27 +++
 arch/arm/mach-stm32mp/Kconfig.23x             |  37 ++++
 arch/arm/mach-stm32mp/Makefile                |   1 +
 arch/arm/mach-stm32mp/cmd_stm32key.c          |   8 +-
 arch/arm/mach-stm32mp/include/mach/stm32.h    |   8 +-
 .../arm/mach-stm32mp/include/mach/sys_proto.h |  21 ++
 arch/arm/mach-stm32mp/stm32mp2/Makefile       |   1 +
 arch/arm/mach-stm32mp/stm32mp2/stm32mp23x.c   | 191 ++++++++++++++++++
 board/st/common/Kconfig                       |   2 +-
 board/st/stm32mp2/Kconfig                     |  14 ++
 configs/stm32mp23_defconfig                   |  82 ++++++++
 drivers/reset/stm32/Kconfig                   |   2 +-
 include/configs/stm32mp23_common.h            | 130 ++++++++++++
 include/configs/stm32mp23_st_common.h         |  51 +++++
 14 files changed, 565 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm/mach-stm32mp/Kconfig.23x
 create mode 100644 arch/arm/mach-stm32mp/stm32mp2/stm32mp23x.c
 create mode 100644 configs/stm32mp23_defconfig
 create mode 100644 include/configs/stm32mp23_common.h
 create mode 100644 include/configs/stm32mp23_st_common.h

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 09b7d5123ae..ed638e4a364 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -81,6 +81,32 @@ config STM32MP15X
 		STMicroelectronics MPU with core ARMv7
 		dual core A7 for STM32MP157/3, monocore for STM32MP151
 
+config STM32MP23X
+	bool "Support STMicroelectronics STM32MP23x Soc"
+	select ARM64
+	select CLK_STM32MP25
+	select OF_BOARD
+	select PINCTRL_STM32
+	select STM32_RCC
+	select STM32_RESET
+	select STM32_SERIAL
+	select STM32MP_TAMP_NVMEM
+	select SYS_ARCH_TIMER
+	select TFABOOT
+	imply CLK_SCMI
+	imply CMD_NVEDIT_INFO
+	imply DM_REGULATOR
+	imply DM_REGULATOR_SCMI
+	imply OF_UPSTREAM
+	imply OPTEE
+	imply RESET_SCMI
+	imply SYSRESET_PSCI
+	imply TEE
+	imply VERSION_VARIABLE
+	help
+		Support of STMicroelectronics SOC STM32MP23x family
+		STMicroelectronics MPU with 2 * A53 core and 1 M33 core
+
 config STM32MP25X
 	bool "Support STMicroelectronics STM32MP25x Soc"
 	select ARM64
@@ -165,6 +191,7 @@ config MFD_STM32_TIMERS
 
 source "arch/arm/mach-stm32mp/Kconfig.13x"
 source "arch/arm/mach-stm32mp/Kconfig.15x"
+source "arch/arm/mach-stm32mp/Kconfig.23x"
 source "arch/arm/mach-stm32mp/Kconfig.25x"
 source "arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig"
 
diff --git a/arch/arm/mach-stm32mp/Kconfig.23x b/arch/arm/mach-stm32mp/Kconfig.23x
new file mode 100644
index 00000000000..2859210c77c
--- /dev/null
+++ b/arch/arm/mach-stm32mp/Kconfig.23x
@@ -0,0 +1,37 @@
+if STM32MP23X
+
+choice
+	prompt "STM32MP23x board select"
+	optional
+
+config TARGET_ST_STM32MP23X
+	bool "STMicroelectronics STM32MP23x boards"
+	imply BOOTSTAGE
+	imply CMD_BOOTSTAGE
+	help
+		target the STMicroelectronics board with SOC STM32MP23x
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
+if DEBUG_UART
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
index ecd49fe668d..eeb5fdd7b45 100644
--- a/arch/arm/mach-stm32mp/Makefile
+++ b/arch/arm/mach-stm32mp/Makefile
@@ -10,6 +10,7 @@ obj-y += soc.o
 
 obj-$(CONFIG_STM32MP15X) += stm32mp1/
 obj-$(CONFIG_STM32MP13X) += stm32mp1/
+obj-$(CONFIG_STM32MP23X) += stm32mp2/
 obj-$(CONFIG_STM32MP25X) += stm32mp2/
 
 obj-$(CONFIG_MFD_STM32_TIMERS) += timers.o
diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
index 6bfa67859e1..f5def4cd2dc 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32key.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
@@ -171,7 +171,7 @@ static u8 get_key_nb(void)
 	if (IS_ENABLED(CONFIG_STM32MP15X))
 		return ARRAY_SIZE(stm32mp15_list);
 
-	if (IS_ENABLED(CONFIG_STM32MP25X))
+	if (IS_ENABLED(CONFIG_STM32MP23X) || IS_ENABLED(CONFIG_STM32MP25X))
 		return ARRAY_SIZE(stm32mp25_list);
 }
 
@@ -183,7 +183,7 @@ static const struct stm32key *get_key(u8 index)
 	if (IS_ENABLED(CONFIG_STM32MP15X))
 		return &stm32mp15_list[index];
 
-	if (IS_ENABLED(CONFIG_STM32MP25X))
+	if (IS_ENABLED(CONFIG_STM32MP23X) || IS_ENABLED(CONFIG_STM32MP25X))
 		return &stm32mp25_list[index];
 }
 
@@ -195,7 +195,7 @@ static u8 get_otp_close_state_nb(void)
 	if (IS_ENABLED(CONFIG_STM32MP15X))
 		return ARRAY_SIZE(stm32mp15_close_state_otp);
 
-	if (IS_ENABLED(CONFIG_STM32MP25X))
+	if (IS_ENABLED(CONFIG_STM32MP23X) || IS_ENABLED(CONFIG_STM32MP25X))
 		return ARRAY_SIZE(stm32mp25_close_state_otp);
 }
 
@@ -207,7 +207,7 @@ static const struct otp_close *get_otp_close_state(u8 index)
 	if (IS_ENABLED(CONFIG_STM32MP15X))
 		return &stm32mp15_close_state_otp[index];
 
-	if (IS_ENABLED(CONFIG_STM32MP25X))
+	if (IS_ENABLED(CONFIG_STM32MP23X) || IS_ENABLED(CONFIG_STM32MP25X))
 		return &stm32mp25_close_state_otp[index];
 }
 
diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
index dfba57e7dc4..a858e2ff50a 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
@@ -163,7 +163,7 @@ enum forced_boot_mode {
 #endif /* __ASSEMBLY__ */
 #endif /* CONFIG_STM32MP15X || CONFIG_STM32MP13X */
 
-#ifdef CONFIG_STM32MP25X
+#if defined(CONFIG_STM32MP23X) || defined(CONFIG_STM32MP25X)
 #define STM32_USART2_BASE		0x400E0000
 #define STM32_USART3_BASE		0x400F0000
 #define STM32_UART4_BASE		0x40100000
@@ -188,7 +188,7 @@ enum forced_boot_mode {
 
 /* TAMP registers zone 3 RIF 1 (RW) at 96*/
 #define TAMP_BOOT_CONTEXT		TAMP_BACKUP_REGISTER(96)
-#endif /* STM32MP25X */
+#endif /* defined(CONFIG_STM32MP23X) || defined(CONFIG_STM32MP25X) */
 
 /* offset used for BSEC driver: misc_read and misc_write */
 #define STM32_BSEC_SHADOW_OFFSET	0x0
@@ -212,14 +212,14 @@ enum forced_boot_mode {
 #define BSEC_OTP_MAC	57
 #define BSEC_OTP_BOARD	60
 #endif
-#ifdef CONFIG_STM32MP25X
+#if defined(CONFIG_STM32MP23X) || defined(CONFIG_STM32MP25X)
 #define BSEC_OTP_SERIAL	5
 #define BSEC_OTP_RPN	9
 #define BSEC_OTP_REVID	102
 #define BSEC_OTP_PKG	122
 #define BSEC_OTP_BOARD	246
 #define BSEC_OTP_MAC	247
-#endif
+#endif /* defined(CONFIG_STM32MP23X) || defined(CONFIG_STM32MP25X) */
 
 #ifndef __ASSEMBLY__
 #include <asm/types.h>
diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
index 19073668497..733ac3b595f 100644
--- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
+++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
@@ -30,6 +30,20 @@
 #define CPU_STM32MP131Fxx	0x05010EC8
 #define CPU_STM32MP131Dxx	0x05010EC9
 
+/* ID for STM32MP23x = Device Part Number (RPN) (bit31:0) */
+#define CPU_STM32MP235Cxx	0x00082182
+#define CPU_STM32MP233Cxx	0x000B318E
+#define CPU_STM32MP231Cxx	0x000B31EF
+#define CPU_STM32MP235Axx	0x40082F82
+#define CPU_STM32MP233Axx	0x400B3F8E
+#define CPU_STM32MP231Axx	0x400B3FEF
+#define CPU_STM32MP235Fxx	0x80082182
+#define CPU_STM32MP233Fxx	0x800B318E
+#define CPU_STM32MP231Fxx	0x800B31EF
+#define CPU_STM32MP235Dxx	0xC0082F82
+#define CPU_STM32MP233Dxx	0xC00B3F8E
+#define CPU_STM32MP231Dxx	0xC00B3FEF
+
 /* ID for STM32MP25x = Device Part Number (RPN) (bit31:0) */
 #define CPU_STM32MP257Cxx       0x00002000
 #define CPU_STM32MP255Cxx       0x00082000
@@ -53,6 +67,7 @@ u32 get_cpu_type(void);
 
 #define CPU_DEV_STM32MP15	0x500
 #define CPU_DEV_STM32MP13	0x501
+#define CPU_DEV_STM32MP23	0x505
 #define CPU_DEV_STM32MP25	0x505
 
 /* return CPU_DEV constants */
@@ -87,6 +102,12 @@ u32 get_cpu_package(void);
 #define STM32MP15_PKG_AD_TFBGA257	1
 #define STM32MP15_PKG_UNKNOWN		0
 
+/* package used for STM32MP23x */
+#define STM32MP23_PKG_CUSTOM		0
+#define STM32MP23_PKG_AL_VFBGA361	1
+#define STM32MP23_PKG_AK_VFBGA424	3
+#define STM32MP23_PKG_AJ_TFBGA361	7
+
 /* package used for STM32MP25x */
 #define STM32MP25_PKG_CUSTOM		0
 #define STM32MP25_PKG_AL_VFBGA361	1
diff --git a/arch/arm/mach-stm32mp/stm32mp2/Makefile b/arch/arm/mach-stm32mp/stm32mp2/Makefile
index 5dbf75daa76..27fbf3ae728 100644
--- a/arch/arm/mach-stm32mp/stm32mp2/Makefile
+++ b/arch/arm/mach-stm32mp/stm32mp2/Makefile
@@ -7,4 +7,5 @@ obj-y += cpu.o
 obj-y += arm64-mmu.o
 obj-y += rifsc.o
 obj-$(CONFIG_OF_SYSTEM_SETUP) += fdt.o
+obj-$(CONFIG_STM32MP23X) += stm32mp23x.o
 obj-$(CONFIG_STM32MP25X) += stm32mp25x.o
diff --git a/arch/arm/mach-stm32mp/stm32mp2/stm32mp23x.c b/arch/arm/mach-stm32mp/stm32mp2/stm32mp23x.c
new file mode 100644
index 00000000000..022db60811a
--- /dev/null
+++ b/arch/arm/mach-stm32mp/stm32mp2/stm32mp23x.c
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) 2025, STMicroelectronics - All Rights Reserved
+ */
+
+#define LOG_CATEGORY LOGC_ARCH
+
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
+
+/* Revision ID = OTP102[5:0] 6 bits : 3 for Major / 3 for Minor*/
+#define REVID_SHIFT	0
+#define REVID_MASK	GENMASK(5, 0)
+
+/* Device Part Number (RPN) = OTP9 */
+#define RPN_SHIFT	0
+#define RPN_MASK	GENMASK(31, 0)
+
+/* Package = bit 0:2 of OTP122 => STM32MP23_PKG defines
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
+	return get_otp(BSEC_OTP_REVID, REVID_SHIFT, REVID_MASK);
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
+	case CPU_STM32MP235Fxx:
+		fallthrough;
+	case CPU_STM32MP235Dxx:
+		fallthrough;
+	case CPU_STM32MP235Cxx:
+		fallthrough;
+	case CPU_STM32MP235Axx:
+		fallthrough;
+	case CPU_STM32MP233Fxx:
+		fallthrough;
+	case CPU_STM32MP233Dxx:
+		fallthrough;
+	case CPU_STM32MP233Cxx:
+		fallthrough;
+	case CPU_STM32MP233Axx:
+		nb_eth = 2; /* dual ETH */
+		break;
+	case CPU_STM32MP231Fxx:
+		fallthrough;
+	case CPU_STM32MP231Dxx:
+		fallthrough;
+	case CPU_STM32MP231Cxx:
+		fallthrough;
+	case CPU_STM32MP231Axx:
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
+	if (get_cpu_dev() == CPU_DEV_STM32MP23) {
+		switch (get_cpu_type()) {
+		case CPU_STM32MP235Fxx:
+			cpu_s = "235F";
+			break;
+		case CPU_STM32MP235Dxx:
+			cpu_s = "235D";
+			break;
+		case CPU_STM32MP235Cxx:
+			cpu_s = "235C";
+			break;
+		case CPU_STM32MP235Axx:
+			cpu_s = "235A";
+			break;
+		case CPU_STM32MP233Fxx:
+			cpu_s = "233F";
+			break;
+		case CPU_STM32MP233Dxx:
+			cpu_s = "233D";
+			break;
+		case CPU_STM32MP233Cxx:
+			cpu_s = "233C";
+			break;
+		case CPU_STM32MP233Axx:
+			cpu_s = "233A";
+			break;
+		case CPU_STM32MP231Fxx:
+			cpu_s = "231F";
+			break;
+		case CPU_STM32MP231Dxx:
+			cpu_s = "231D";
+			break;
+		case CPU_STM32MP231Cxx:
+			cpu_s = "231C";
+			break;
+		case CPU_STM32MP231Axx:
+			cpu_s = "231A";
+			break;
+		default:
+			cpu_s = "23??";
+			break;
+		}
+		/* REVISION */
+		switch (get_cpu_rev()) {
+		case OTP_REVID_1:
+			cpu_r = "A";
+			break;
+		case OTP_REVID_2:
+			cpu_r = "B";
+			break;
+		case OTP_REVID_2_1:
+			cpu_r = "Y";
+			break;
+		case OTP_REVID_2_2:
+			cpu_r = "X";
+			break;
+		default:
+			break;
+		}
+		/* PACKAGE */
+		switch (get_cpu_package()) {
+		case STM32MP23_PKG_CUSTOM:
+			package = "XX";
+			break;
+		case STM32MP23_PKG_AL_VFBGA361:
+			package = "AL";
+			break;
+		case STM32MP23_PKG_AK_VFBGA424:
+			package = "AK";
+			break;
+		case STM32MP23_PKG_AJ_TFBGA361:
+			package = "AJ";
+			break;
+		default:
+			break;
+		}
+	}
+
+	snprintf(name, SOC_NAME_SIZE, "STM32MP%s%s Rev.%s", cpu_s, package, cpu_r);
+}
diff --git a/board/st/common/Kconfig b/board/st/common/Kconfig
index 5efac658cf4..94ec806949b 100644
--- a/board/st/common/Kconfig
+++ b/board/st/common/Kconfig
@@ -1,7 +1,7 @@
 config CMD_STBOARD
 	bool "stboard - command for OTP board information"
 	depends on ARCH_STM32MP
-	default y if TARGET_ST_STM32MP25X || TARGET_ST_STM32MP15X || TARGET_ST_STM32MP13X
+	default y if TARGET_ST_STM32MP13X || TARGET_ST_STM32MP15X || TARGET_ST_STM32MP23X || TARGET_ST_STM32MP25X
 	help
 	  This compile the stboard command to
 	  read and write the board in the OTP.
diff --git a/board/st/stm32mp2/Kconfig b/board/st/stm32mp2/Kconfig
index f91e25f1f9a..e88c71a278e 100644
--- a/board/st/stm32mp2/Kconfig
+++ b/board/st/stm32mp2/Kconfig
@@ -1,3 +1,17 @@
+if TARGET_ST_STM32MP23X
+
+config SYS_BOARD
+	default "stm32mp2"
+
+config SYS_VENDOR
+	default "st"
+
+config SYS_CONFIG_NAME
+	default "stm32mp23_st_common"
+
+source "board/st/common/Kconfig"
+endif
+
 if TARGET_ST_STM32MP25X
 
 config SYS_BOARD
diff --git a/configs/stm32mp23_defconfig b/configs/stm32mp23_defconfig
new file mode 100644
index 00000000000..3f8fa6ce527
--- /dev/null
+++ b/configs/stm32mp23_defconfig
@@ -0,0 +1,82 @@
+CONFIG_ARM=y
+CONFIG_ARCH_STM32MP=y
+CONFIG_SYS_MALLOC_F_LEN=0x600000
+CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0x90000000
+CONFIG_ENV_OFFSET=0x900000
+CONFIG_ENV_SECT_SIZE=0x40000
+CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp235f-dk"
+CONFIG_SYS_BOOTM_LEN=0x2000000
+CONFIG_SYS_LOAD_ADDR=0x84000000
+CONFIG_STM32MP23X=y
+CONFIG_DDR_CACHEABLE_SIZE=0x10000000
+CONFIG_CMD_STM32KEY=y
+CONFIG_ENV_OFFSET_REDUND=0x940000
+CONFIG_TARGET_ST_STM32MP23X=y
+CONFIG_SYS_MEMTEST_START=0x84000000
+CONFIG_SYS_MEMTEST_END=0x88000000
+CONFIG_API=y
+CONFIG_SYS_MMC_MAX_DEVICE=3
+CONFIG_FIT=y
+CONFIG_DISTRO_DEFAULTS=y
+CONFIG_BOOTDELAY=1
+CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
+CONFIG_SYS_PROMPT="STM32MP> "
+# CONFIG_CMD_BDI is not set
+CONFIG_CMD_BOOTZ=y
+CONFIG_CMD_ADTIMG=y
+# CONFIG_CMD_ELF is not set
+CONFIG_CMD_MEMINFO=y
+CONFIG_CMD_MEMTEST=y
+CONFIG_CMD_CLK=y
+CONFIG_CMD_FUSE=y
+CONFIG_CMD_GPIO=y
+# CONFIG_CMD_LOADB is not set
+CONFIG_CMD_MMC=y
+CONFIG_CMD_CACHE=y
+CONFIG_CMD_TIME=y
+CONFIG_CMD_RNG=y
+CONFIG_CMD_TIMER=y
+CONFIG_CMD_REGULATOR=y
+CONFIG_CMD_LOG=y
+CONFIG_CMD_UBI=y
+CONFIG_OF_LIVE=y
+CONFIG_OF_UPSTREAM_BUILD_VENDOR=y
+CONFIG_OF_UPSTREAM_VENDOR="st"
+CONFIG_ENV_IS_NOWHERE=y
+CONFIG_ENV_IS_IN_MMC=y
+CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_IS_IN_UBI=y
+CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_UBI_PART="UBI"
+CONFIG_ENV_UBI_VOLUME="uboot_config"
+CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
+CONFIG_SYS_MMC_ENV_DEV=-1
+CONFIG_NO_NET=y
+CONFIG_SYS_64BIT_LBA=y
+CONFIG_BUTTON=y
+CONFIG_BUTTON_GPIO=y
+CONFIG_GPIO_HOG=y
+CONFIG_DM_I2C=y
+CONFIG_SYS_I2C_STM32F7=y
+CONFIG_LED=y
+CONFIG_LED_GPIO=y
+CONFIG_SUPPORT_EMMC_BOOT=y
+CONFIG_STM32_SDMMC2=y
+CONFIG_MTD=y
+CONFIG_USE_SYS_MAX_FLASH_BANKS=y
+CONFIG_SPI_FLASH=y
+CONFIG_PINCONF=y
+CONFIG_DM_REGULATOR_FIXED=y
+CONFIG_DM_REGULATOR_GPIO=y
+CONFIG_RAM=y
+# CONFIG_STM32MP1_DDR is not set
+CONFIG_DM_RNG=y
+CONFIG_SERIAL_RX_BUFFER=y
+CONFIG_SPI=y
+CONFIG_DM_SPI=y
+# CONFIG_OPTEE_TA_AVB is not set
+CONFIG_WDT=y
+CONFIG_WDT_STM32MP=y
+CONFIG_WDT_ARM_SMC=y
+# CONFIG_UBIFS_SILENCE_DEBUG_DUMP is not set
+CONFIG_ERRNO_STR=y
diff --git a/drivers/reset/stm32/Kconfig b/drivers/reset/stm32/Kconfig
index 39dcfa0a9ca..fdd88a6bfae 100644
--- a/drivers/reset/stm32/Kconfig
+++ b/drivers/reset/stm32/Kconfig
@@ -16,7 +16,7 @@ config RESET_STM32MP1
 
 config RESET_STM32MP25
 	bool "Enable the STM32MP25 reset"
-	depends on STM32MP25X
+	depends on STM32MP23X || STM32MP25X
 	default y
 	help
 	  Support for reset controllers on STMicroelectronics STM32MP2 family SoCs.
diff --git a/include/configs/stm32mp23_common.h b/include/configs/stm32mp23_common.h
new file mode 100644
index 00000000000..7285886b822
--- /dev/null
+++ b/include/configs/stm32mp23_common.h
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause */
+/*
+ * Copyright (C) 2025, STMicroelectronics - All Rights Reserved
+ *
+ * Configuration settings for the STM32MP23x CPU
+ */
+
+#ifndef __CONFIG_STM32MP23_COMMMON_H
+#define __CONFIG_STM32MP23_COMMMON_H
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
+#define CFG_SYS_BOOTMAPSZ		SZ_256M
+
+#define STM32MP_FIP_IMAGE_GUID \
+	EFI_GUID(0x19d5df83, 0x11b0, 0x457b, 0xbe, 0x2c, \
+		 0x75, 0x59, 0xc1, 0x31, 0x42, 0xa5)
+
+/*****************************************************************************/
+#ifdef CONFIG_DISTRO_DEFAULTS
+/*****************************************************************************/
+
+#ifdef CONFIG_NET
+#define BOOT_TARGET_PXE(func)	func(PXE, pxe, na)
+#else
+#define BOOT_TARGET_PXE(func)
+#endif
+
+#ifdef CONFIG_CMD_MMC
+#define BOOT_TARGET_MMC0(func)	func(MMC, mmc, 0)
+#define BOOT_TARGET_MMC1(func)	func(MMC, mmc, 1)
+#define BOOT_TARGET_MMC2(func)	func(MMC, mmc, 2)
+#else
+#define BOOT_TARGET_MMC0(func)
+#define BOOT_TARGET_MMC1(func)
+#define BOOT_TARGET_MMC2(func)
+#endif
+
+#ifdef CONFIG_CMD_UBIFS
+#define BOOT_TARGET_UBIFS(func)	func(UBIFS, ubifs, 0, UBI, boot)
+#else
+#define BOOT_TARGET_UBIFS(func)
+#endif
+
+#ifdef CONFIG_CMD_USB
+#define BOOT_TARGET_USB(func)	func(USB, usb, 0)
+#else
+#define BOOT_TARGET_USB(func)
+#endif
+
+#define BOOT_TARGET_DEVICES(func)	\
+	BOOT_TARGET_MMC1(func)		\
+	BOOT_TARGET_UBIFS(func)		\
+	BOOT_TARGET_MMC0(func)		\
+	BOOT_TARGET_MMC2(func)		\
+	BOOT_TARGET_USB(func)		\
+	BOOT_TARGET_PXE(func)
+
+/*
+ * default bootcmd for stm32mp23:
+ * for serial/usb: execute the stm32prog command
+ * for mmc boot (eMMC, SD card), distro boot on the same mmc device
+ * for NAND or SPI-NAND boot, distro boot with UBIFS on UBI partition
+ * for other boot, use the default distro order in ${boot_targets}
+ */
+#define STM32MP_BOOTCMD "bootcmd_stm32mp=" \
+	"echo \"Boot over ${boot_device}${boot_instance}!\";" \
+	"if test ${boot_device} = serial || test ${boot_device} = usb;" \
+	"then stm32prog ${boot_device} ${boot_instance}; " \
+	"else " \
+		"run env_check;" \
+		"if test ${boot_device} = mmc;" \
+		"then env set boot_targets \"mmc${boot_instance}\"; fi;" \
+		"if test ${boot_device} = nand ||" \
+		  " test ${boot_device} = spi-nand ;" \
+		"then env set boot_targets ubifs0; fi;" \
+		"run distro_bootcmd;" \
+	"fi;\0"
+
+#ifndef STM32MP_BOARD_EXTRA_ENV
+#define STM32MP_BOARD_EXTRA_ENV
+#endif
+
+#define STM32MP_EXTRA \
+	"env_check=if env info -p -d -q; then env save; fi\0" \
+	"boot_net_usb_start=true\0"
+/*
+ * memory layout for 96MB uncompressed/compressed kernel,
+ * 1M fdt, 1M script, 1M pxe and 1M for overlay
+ * and the ramdisk at the end.
+ */
+#define __KERNEL_COMP_ADDR_R	__stringify(0x84000000)
+#define __KERNEL_COMP_SIZE_R	__stringify(0x04000000)
+#define __KERNEL_ADDR_R		__stringify(0x8a000000)
+#define __FDT_ADDR_R		__stringify(0x90000000)
+#define __SCRIPT_ADDR_R		__stringify(0x90100000)
+#define __PXEFILE_ADDR_R	__stringify(0x90200000)
+#define __FDTOVERLAY_ADDR_R	__stringify(0x90300000)
+#define __RAMDISK_ADDR_R	__stringify(0x90400000)
+
+#define STM32MP_MEM_LAYOUT \
+	"kernel_addr_r=" __KERNEL_ADDR_R "\0" \
+	"fdt_addr_r=" __FDT_ADDR_R "\0" \
+	"scriptaddr=" __SCRIPT_ADDR_R "\0" \
+	"pxefile_addr_r=" __PXEFILE_ADDR_R "\0" \
+	"fdtoverlay_addr_r=" __FDTOVERLAY_ADDR_R "\0" \
+	"ramdisk_addr_r=" __RAMDISK_ADDR_R "\0" \
+	"kernel_comp_addr_r=" __KERNEL_COMP_ADDR_R "\0"	\
+	"kernel_comp_size=" __KERNEL_COMP_SIZE_R "\0"
+
+#include <config_distro_bootcmd.h>
+#define CFG_EXTRA_ENV_SETTINGS \
+	STM32MP_MEM_LAYOUT \
+	STM32MP_BOOTCMD \
+	BOOTENV \
+	STM32MP_EXTRA \
+	STM32MP_BOARD_EXTRA_ENV
+
+#endif
+
+#endif /* __CONFIG_STM32MP23_COMMMON_H */
diff --git a/include/configs/stm32mp23_st_common.h b/include/configs/stm32mp23_st_common.h
new file mode 100644
index 00000000000..0c5c2fbef87
--- /dev/null
+++ b/include/configs/stm32mp23_st_common.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause */
+/*
+ * Copyright (C) 2025, STMicroelectronics - All Rights Reserved
+ *
+ * Configuration settings for the STMicroelectonics STM32MP23x boards
+ */
+
+#ifndef __CONFIG_STM32MP23_ST_COMMON_H__
+#define __CONFIG_STM32MP23_ST_COMMON_H__
+
+#define STM32MP_BOARD_EXTRA_ENV \
+	"usb_pgood_delay=2000\0" \
+	"console=ttySTM0\0"
+
+#include <configs/stm32mp23_common.h>
+
+#ifdef CFG_EXTRA_ENV_SETTINGS
+/*
+ * default bootcmd for stm32mp23 STMicroelectronics boards:
+ * for serial/usb: execute the stm32prog command
+ * for mmc boot (eMMC, SD card), distro boot on the same mmc device
+ * for nand or spi-nand boot, distro boot with ubifs on UBI partition or
+ * sdcard
+ * for nor boot, distro boot on SD card = mmc0 ONLY !
+ */
+#define ST_STM32MP23_BOOTCMD "bootcmd_stm32mp=" \
+	"echo \"Boot over ${boot_device}${boot_instance}!\";" \
+	"if test ${boot_device} = serial || test ${boot_device} = usb;" \
+	"then stm32prog ${boot_device} ${boot_instance}; " \
+	"else " \
+		"run env_check;" \
+		"if test ${boot_device} = mmc;" \
+		"then env set boot_targets \"mmc${boot_instance}\"; fi;" \
+		"if test ${boot_device} = nand ||" \
+		  " test ${boot_device} = spi-nand ;" \
+		"then env set boot_targets ubifs0 mmc0; fi;" \
+		"if test ${boot_device} = nor;" \
+		"then env set boot_targets mmc0; fi;" \
+		"run distro_bootcmd;" \
+	"fi;\0"
+
+#undef CFG_EXTRA_ENV_SETTINGS
+#define CFG_EXTRA_ENV_SETTINGS \
+	STM32MP_MEM_LAYOUT \
+	ST_STM32MP23_BOOTCMD \
+	BOOTENV \
+	STM32MP_EXTRA \
+	STM32MP_BOARD_EXTRA_ENV
+
+#endif
+#endif
-- 
2.25.1

base-commit: 3b164fd951a9e93a13e793588cbcd3182089ec48
branch: upstream_Add_STM32MP23_support
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
