Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C46D5AB3EE2
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 May 2025 19:22:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B079C7A830;
	Mon, 12 May 2025 17:22:19 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB10EC7A82F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 May 2025 17:22:18 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Zx5yL1V9Xz9sbC;
 Mon, 12 May 2025 19:22:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1747070538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ik9x1wZdjesIp4A/xscKhDgqtc9UHg4BB0CclKTiVoA=;
 b=Phs7f2ZaGlWavtFN9yFl8AeBFQHt2/EkL2fzGX11oCJmSLxiCOUWIm4sbGtnSp/2qD4hau
 RCRelYla27ZeAEKSQ21Ulf2xlJg3EIqT83xLXvMblFIIfuIJV1X8xBrDIPgNRPFIVeJh50
 fJH1kj3PB7V3G4qjDjySedh7lFdXEP5Jv3rsLlrsSPRc2ZaNaSxXCM4RkDfI6ZVSdUqCjR
 C0j/TDvgUsM0QJ3wqmc0TgmgNRdgC8DwDYFb8U3wLPld+UBEUnLvmQOK2CAceTzp7YBR21
 c3+/1w6soLXNLtZPwTAYYY8ZxfmXg3SBCTmBeeCc6IGFP3GIio2DRNG2kzdl/Q==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1747070536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ik9x1wZdjesIp4A/xscKhDgqtc9UHg4BB0CclKTiVoA=;
 b=ux2mBWUWn+tQbn0X5M+/oVKikLe/rQaHtNzRCtQjOHQ6mNCLZVq2+k+7yrHs74cPASimlh
 sjk44PjiTN91uOQ/CrW74DQcquO/QCrBGX4x3eYY521Ni4AYt7BL9bUhke7xoAFW3uyYEX
 WIp9V/NyMuMUeIvwXRt/wR2XMGWxi1aTqNVw0Te83i/PyH/reGX5/6GUxrbevu+u9uI12p
 7rwneKz6cb4YyzvOpTiypQibmGTjH2LzjK+vJRe4/K/dw1pEGugLXMhqRxgulDsJw44zeQ
 io52DFTnZsUbEBfbuxkp7FnUmDE/KP1y/zj8kvAojHvteddnAPoc59qXvgadhg==
To: u-boot@lists.denx.de
Date: Mon, 12 May 2025 19:21:29 +0200
Message-ID: <20250512172149.150214-3-marek.vasut@mailbox.org>
In-Reply-To: <20250512172149.150214-1-marek.vasut@mailbox.org>
References: <20250512172149.150214-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: daf7fe283e26fa8f520
X-MBO-RS-META: gjm4n9h8ym8dj73arf894c5r4hejs5yt
Cc: Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>, u-boot@dh-electronics.com,
 Marek Vasut <marek.vasut@mailbox.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Lionel Debieve <lionel.debieve@foss.st.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>
Subject: [Uboot-stm32] [PATCH 02/10] ARM: stm32: Add STM32MP13xx SPL
	hardware initialization
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

Add hardware initialization for the STM32MP13xx in SPL. This is
similar to STM32MP15xx except the code has to enable MCE to bring
DRAM controller up later.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Cheick Traore <cheick.traore@foss.st.com>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Lionel Debieve <lionel.debieve@foss.st.com>
Cc: Pascal Zimmermann <pzimmermann@dh-electronics.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Sughosh Ganu <sughosh.ganu@linaro.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/mach-stm32mp/include/mach/stm32.h  |   2 +
 arch/arm/mach-stm32mp/stm32mp1/stm32mp13x.c | 204 ++++++++++++++++++++
 2 files changed, 206 insertions(+)

diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
index dfba57e7dc4..37f3e8595b2 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
@@ -156,6 +156,8 @@ enum forced_boot_mode {
 #endif
 
 #ifdef CONFIG_STM32MP13X
+#define TAMP_BACKUP_MAGIC_NUMBER	TAMP_BACKUP_REGISTER(4)
+#define TAMP_BACKUP_BRANCH_ADDRESS	TAMP_BACKUP_REGISTER(5)
 #define TAMP_BOOTCOUNT			TAMP_BACKUP_REGISTER(31)
 #define TAMP_BOOT_CONTEXT		TAMP_BACKUP_REGISTER(30)
 #endif
diff --git a/arch/arm/mach-stm32mp/stm32mp1/stm32mp13x.c b/arch/arm/mach-stm32mp/stm32mp1/stm32mp13x.c
index 4a811065fc3..79b2f2d0bba 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/stm32mp13x.c
+++ b/arch/arm/mach-stm32mp/stm32mp1/stm32mp13x.c
@@ -6,11 +6,59 @@
 #define LOG_CATEGORY LOGC_ARCH
 
 #include <config.h>
+#include <cpu_func.h>
 #include <log.h>
 #include <syscon.h>
 #include <asm/io.h>
+#include <asm/system.h>
+#include <asm/arch/bsec.h>
 #include <asm/arch/stm32.h>
 #include <asm/arch/sys_proto.h>
+#include <dm/device.h>
+#include <dm/uclass.h>
+#include <linux/bitfield.h>
+#include <malloc.h>
+
+/* RCC register */
+#define RCC_TZCR		(STM32_RCC_BASE + 0x00)
+#define RCC_BDCR		(STM32_RCC_BASE + 0x400)
+#define RCC_DBGCFGR		(STM32_RCC_BASE + 0x468)
+#define RCC_MP_APB5ENSETR	(STM32_RCC_BASE + 0x740)
+#define RCC_MP_AHB6ENSETR	(STM32_RCC_BASE + 0x780)
+
+#define RCC_BDCR_VSWRST		BIT(31)
+#define RCC_BDCR_RTCSRC		GENMASK(17, 16)
+
+#define RCC_DBGCFGR_DBGCKEN	BIT(8)
+
+/* DBGMCU register */
+#define DBGMCU_APB4FZ1		(STM32_DBGMCU_BASE + 0x2c)
+#define DBGMCU_APB4FZ1_IWDG2	BIT(2)
+
+/* Security register */
+#define ETZPC_TZMA1_SIZE	(STM32_ETZPC_BASE + 0x04)
+#define ETZPC_DECPROT0		(STM32_ETZPC_BASE + 0x10)
+
+#define TZC_ACTION		(STM32_TZC_BASE + 0x004)
+#define TZC_GATE_KEEPER		(STM32_TZC_BASE + 0x008)
+#define TZC_REGION_BASE(n)	(STM32_TZC_BASE + 0x100 + (0x20 * (n)))
+#define TZC_REGION_TOP(n)	(STM32_TZC_BASE + 0x108 + (0x20 * (n)))
+#define TZC_REGION_ATTRIBUTE(n)	(STM32_TZC_BASE + 0x110 + (0x20 * (n)))
+#define TZC_REGION_ID_ACCESS(n)	(STM32_TZC_BASE + 0x114 + (0x20 * (n)))
+
+#define TAMP_CR1		(STM32_TAMP_BASE + 0x00)
+
+#define PWR_CR1			(STM32_PWR_BASE + 0x00)
+#define PWR_CR1_DBP		BIT(8)
+
+/* boot interface from Bootrom
+ * - boot instance = bit 31:16
+ * - boot device = bit 15:0
+ */
+#define BOOTROM_MODE_MASK	GENMASK(15, 0)
+#define BOOTROM_MODE_SHIFT	0
+#define BOOTROM_INSTANCE_MASK	GENMASK(31, 16)
+#define BOOTROM_INSTANCE_SHIFT	16
 
 /* SYSCFG register */
 #define SYSCFG_IDC_OFFSET	0x380
@@ -23,6 +71,162 @@
 #define RPN_SHIFT	0
 #define RPN_MASK	GENMASK(11, 0)
 
+static void security_init(void)
+{
+	/* Disable the backup domain write protection */
+	/* the protection is enable at each reset by hardware */
+	/* And must be disable by software */
+	setbits_le32(PWR_CR1, PWR_CR1_DBP);
+
+	while (!(readl(PWR_CR1) & PWR_CR1_DBP))
+		;
+
+	/* If RTC clock isn't enable so this is a cold boot then we need
+	 * to reset the backup domain
+	 */
+	if (!(readl(RCC_BDCR) & RCC_BDCR_RTCSRC)) {
+		setbits_le32(RCC_BDCR, RCC_BDCR_VSWRST);
+		while (!(readl(RCC_BDCR) & RCC_BDCR_VSWRST))
+			;
+		clrbits_le32(RCC_BDCR, RCC_BDCR_VSWRST);
+	}
+
+	/* allow non secure access in Write/Read for all peripheral */
+	writel(0, ETZPC_DECPROT0);
+
+	/* Open SYSRAM for no secure access */
+	writel(0x0, ETZPC_TZMA1_SIZE);
+
+	/* enable MCE clock */
+	writel(BIT(1), RCC_MP_AHB6ENSETR);
+
+	/* enable TZC clock */
+	writel(BIT(11), RCC_MP_APB5ENSETR);
+
+	/* Disable Filter 0 */
+	writel(0, TZC_GATE_KEEPER);
+
+	/* Region 0 set to no access by default */
+	/* bit 0 / 16 => nsaid0 read/write Enable
+	 * bit 1 / 17 => nsaid1 read/write Enable
+	 * ...
+	 * bit 15 / 31 => nsaid15 read/write Enable
+	 */
+	writel(0xFFFFFFFF, TZC_REGION_ID_ACCESS(0));
+
+	/* bit 30 / 31 => Secure Global Enable : write/read */
+	writel(BIT(0) | BIT(30) | BIT(31), TZC_REGION_ATTRIBUTE(0));
+
+	writel(0xFFFFFFFF, TZC_REGION_ID_ACCESS(1));
+	writel(0xC0000000, TZC_REGION_BASE(1));
+	writel(0xDDFFFFFF, TZC_REGION_TOP(1));
+	writel(BIT(0) | BIT(30) | BIT(31), TZC_REGION_ATTRIBUTE(1));
+
+	writel(0x00000000, TZC_REGION_ID_ACCESS(2));
+	writel(0xDE000000, TZC_REGION_BASE(2));
+	writel(0xDFFFFFFF, TZC_REGION_TOP(2));
+	writel(BIT(0) | BIT(30) | BIT(31), TZC_REGION_ATTRIBUTE(2));
+
+	writel(0xFFFFFFFF, TZC_REGION_ID_ACCESS(3));
+	writel(0x00000000, TZC_REGION_BASE(3));
+	writel(0xBFFFFFFF, TZC_REGION_TOP(3));
+	writel(BIT(0) | BIT(30) | BIT(31), TZC_REGION_ATTRIBUTE(3));
+
+	/* Set Action */
+	writel(BIT(0), TZC_ACTION);
+
+	/* Enable Filter 0 */
+	writel(BIT(0), TZC_GATE_KEEPER);
+
+	/* RCC trust zone deactivated */
+	writel(0x0, RCC_TZCR);
+
+	/* TAMP: deactivate the internal tamper
+	 * Bit 23 ITAMP8E: monotonic counter overflow
+	 * Bit 20 ITAMP5E: RTC calendar overflow
+	 * Bit 19 ITAMP4E: HSE monitoring
+	 * Bit 18 ITAMP3E: LSE monitoring
+	 * Bit 16 ITAMP1E: RTC power domain supply monitoring
+	 */
+	writel(0x0, TAMP_CR1);
+}
+
+/*
+ * Debug init
+ */
+void dbgmcu_init(void)
+{
+	/*
+	 * Freeze IWDG2 if Cortex-A7 is in debug mode
+	 * done in TF-A for TRUSTED boot and
+	 * DBGMCU access is controlled by BSEC_DENABLE.DBGSWENABLE
+	 */
+	if (bsec_dbgswenable()) {
+		setbits_le32(RCC_DBGCFGR, RCC_DBGCFGR_DBGCKEN);
+		setbits_le32(DBGMCU_APB4FZ1, DBGMCU_APB4FZ1_IWDG2);
+	}
+}
+
+void spl_board_init(void)
+{
+	struct udevice *dev;
+	u8 *tlb;
+	int ret;
+
+	dbgmcu_init();
+
+	/* force probe of BSEC driver to shadow the upper OTP */
+	ret = uclass_get_device_by_driver(UCLASS_MISC, DM_DRIVER_GET(stm32mp_bsec), &dev);
+	if (ret)
+		log_warning("BSEC probe failed: %d\n", ret);
+
+	/* Enable Dcache here, now that DRAM is available */
+	if (IS_ENABLED(CONFIG_XPL_BUILD) && IS_ENABLED(CONFIG_STM32MP13X)) {
+		tlb = memalign(0x4000, PGTABLE_SIZE);
+		if (!tlb)
+			return;
+
+		gd->arch.tlb_size = PGTABLE_SIZE;
+		gd->arch.tlb_addr = (unsigned long)tlb;
+		dcache_enable();
+	}
+}
+
+/* get bootmode from ROM code boot context: saved in TAMP register */
+static void update_bootmode(void)
+{
+	u32 boot_mode;
+	u32 bootrom_itf = readl(get_stm32mp_rom_api_table());
+	u32 bootrom_device, bootrom_instance;
+
+	/* enable TAMP clock = RTCAPBEN */
+	writel(BIT(8), RCC_MP_APB5ENSETR);
+
+	/* read bootrom context */
+	bootrom_device =
+		(bootrom_itf & BOOTROM_MODE_MASK) >> BOOTROM_MODE_SHIFT;
+	bootrom_instance =
+		(bootrom_itf & BOOTROM_INSTANCE_MASK) >> BOOTROM_INSTANCE_SHIFT;
+	boot_mode =
+		((bootrom_device << BOOT_TYPE_SHIFT) & BOOT_TYPE_MASK) |
+		((bootrom_instance << BOOT_INSTANCE_SHIFT) &
+		 BOOT_INSTANCE_MASK);
+
+	/* save the boot mode in TAMP backup register */
+	clrsetbits_le32(TAMP_BOOT_CONTEXT,
+			TAMP_BOOT_MODE_MASK,
+			boot_mode << TAMP_BOOT_MODE_SHIFT);
+}
+
+/* weak function: STM32MP15x mach init for boot without TFA */
+void stm32mp_cpu_init(void)
+{
+	if (IS_ENABLED(CONFIG_XPL_BUILD)) {
+		security_init();
+		update_bootmode();
+	}
+}
+
 static u32 read_idc(void)
 {
 	void *syscfg = syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
-- 
2.47.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
