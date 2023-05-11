Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9A16FFAE6
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 May 2023 21:55:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6113C6907C;
	Thu, 11 May 2023 19:55:57 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3BD4C65068
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 May 2023 19:55:55 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DF1F2861BC;
 Thu, 11 May 2023 21:55:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1683834955;
 bh=Z/aJ1lah4LhUE1PjIbqas2DOAdWod3efrECiYAC6118=;
 h=From:To:Cc:Subject:Date:From;
 b=gI2liRmBBY4TQY2/XAh4sSXtF8j5By1KnGzjfRbMKYT+uwrkLBwGfeOC4ci1YzQEf
 AKDN4t9+rtxOrNL/zEjtuam43/Hf6WHD4rFYcUJvGTL9MfNNjrJLzLJZJPcsHk2PX7
 KLMaAcng1cJEXG6C2NeXlT6edXpFybT+YW5WPom3OulPS2g4gaBrC3D26NTRCpUoai
 hduRsOBkmeOllm/hhn1QyKj96Nqa+B2z6ra0+RxAAt24bGp0zH9xOyi7YfnMwm7u4m
 EHcm/QacCjgqxXTrB7qExOM3RXqTAC7XDecBLO8zzBMInW1bjajDW9OHpc9FbKA5TJ
 zALtZ9kkdxA3g==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Thu, 11 May 2023 21:55:45 +0200
Message-Id: <20230511195545.228508-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2] ARM: stm32: Add IWDG handling into PSCI
	suspend code
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

In case the IWDG is enabled by either U-Boot or Linux, the IWDG can never
be disabled again. That includes low power states, which means that if the
IWDG is enabled, the SoC would reset itself after a while in suspend via
the IWDG. This is not desired behavior.

It is possible to enable IWDG pre-timeout IRQ which is routed into the EXTI,
and use that IRQ to wake the CPU up before the IWDG timeout is reached and
reset is triggered. This pre-timeout IRQ can be used to reload the WDT and
then suspend the CPU again every once in a while.

Implement this functionality for both IWDG1 and IWDG2 by reading out all
the unmasked IRQs, comparing the list with currently pending IRQs in GICv3:
- If any IRQ is pending and it is NOT IWDG1 or IWDG2 pre-timeout IRQ,
  wake up and let OS handle the IRQs
- If IWDG1 or IWDG2 IRQ is pending and no other IRQ is pending,
  ping the respective IWDG and suspend again

This does not seem to have any adverse impact on power consumption in suspend.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Marek Vasut <marex@denx.de>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Sughosh Ganu <sughosh.ganu@linaro.org>
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
V2: Ping the IWDG before entering WFI to assure they would not reset the SoC
---
 arch/arm/mach-stm32mp/include/mach/stm32.h |  2 +
 arch/arm/mach-stm32mp/psci.c               | 73 ++++++++++++++++++++--
 2 files changed, 70 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
index c85ae6a34ee..1cdc5e3b186 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
@@ -21,8 +21,10 @@
 #define STM32_DBGMCU_BASE		0x50081000
 #endif
 #define STM32_FMC2_BASE			0x58002000
+#define STM32_IWDG2_BASE		0x5A002000
 #define STM32_DDRCTRL_BASE		0x5A003000
 #define STM32_DDRPHYC_BASE		0x5A004000
+#define STM32_IWDG1_BASE		0x5C003000
 #define STM32_TZC_BASE			0x5C006000
 #define STM32_ETZPC_BASE		0x5C007000
 #define STM32_STGEN_BASE		0x5C008000
diff --git a/arch/arm/mach-stm32mp/psci.c b/arch/arm/mach-stm32mp/psci.c
index 1e69673e88b..39b5200949a 100644
--- a/arch/arm/mach-stm32mp/psci.c
+++ b/arch/arm/mach-stm32mp/psci.c
@@ -161,6 +161,12 @@
 #define RCC_MP_GRSTCSETR_MPUP0RST		BIT(4)
 #define RCC_MP_GRSTCSETR_MPUP1RST		BIT(5)
 
+/* IWDG */
+#define IWDG_KR					0x00
+#define IWDG_KR_RELOAD_KEY			0xaaaa
+#define IWDG_EWCR				0x14
+#define IWDG_EWCR_EWIC				BIT(14)
+
 #define STM32MP1_PSCI_NR_CPUS			2
 #if STM32MP1_PSCI_NR_CPUS > CONFIG_ARMV7_PSCI_NR_CPUS
 #error "invalid value for CONFIG_ARMV7_PSCI_NR_CPUS"
@@ -696,7 +702,18 @@ void __secure psci_system_suspend(u32 __always_unused function_id,
 				  u32 ep, u32 context_id)
 {
 	u32 saved_mcudivr, saved_pll3cr, saved_pll4cr, saved_mssckselr;
+	u32 gicd_addr = stm32mp_get_gicd_base_address();
+	bool iwdg1_wake = false;
+	bool iwdg2_wake = false;
+	bool other_wake = false;
 	u32 saved_pwrctl, reg;
+	u32 gic_enabled[8];
+	u32 irqs;
+	int i;
+
+	/* Cache enable mask of all 256 SPI */
+	for (i = 0; i < ARRAY_SIZE(gic_enabled); i++)
+		gic_enabled[i] = readl(gicd_addr + GICD_ISENABLERn + 0x4 + 4 * i);
 
 	/* Disable IO compensation */
 
@@ -725,11 +742,57 @@ void __secure psci_system_suspend(u32 __always_unused function_id,
 	setbits_le32(STM32_PWR_BASE + PWR_CR3, PWR_CR3_DDRSREN);
 	writel(0x3, STM32_RCC_BASE + RCC_MP_SREQSETR);
 
-	/* Zzz, enter stop mode */
-	asm volatile(
-		"isb\n"
-		"dsb\n"
-		"wfi\n");
+	/* Ping the IWDG before entering suspend */
+	iwdg1_wake = !!(gic_enabled[4] & BIT(22));	/* SPI 150 */
+	iwdg2_wake = !!(gic_enabled[4] & BIT(23));	/* SPI 151 */
+
+	for (;;) {
+		/* Ping IWDG1 and ACK pretimer IRQ */
+		if (iwdg1_wake) {
+			writel(IWDG_KR_RELOAD_KEY, STM32_IWDG1_BASE + IWDG_KR);
+			writel(IWDG_EWCR_EWIC, STM32_IWDG1_BASE + IWDG_EWCR);
+		}
+
+		/* Ping IWDG2 and ACK pretimer IRQ */
+		if (iwdg2_wake) {
+			writel(IWDG_KR_RELOAD_KEY, STM32_IWDG2_BASE + IWDG_KR);
+			writel(IWDG_EWCR_EWIC, STM32_IWDG2_BASE + IWDG_EWCR);
+		}
+
+		iwdg1_wake = false;
+		iwdg2_wake = false;
+
+		/* Zzz, enter stop mode */
+		asm volatile(
+			"isb\n"
+			"dsb\n"
+			"wfi\n");
+
+		/* Determine the wake up source */
+		for (i = 0; i < ARRAY_SIZE(gic_enabled); i++) {
+			irqs = readl(gicd_addr + GICR_IGROUPMODRn + 0x4 + 4 * i);
+			irqs &= gic_enabled[i];
+			if (!irqs)
+				continue;
+
+			/* Test whether IWDG pretimeout triggered the wake up. */
+			if (i == 4) {	/* SPI Num 128..159 */
+				iwdg1_wake = !!(irqs & BIT(22));	/* SPI 150 */
+				iwdg2_wake = !!(irqs & BIT(23));	/* SPI 151 */
+				irqs &= ~(BIT(22) | BIT(23));
+			}
+
+			/* Test whether there is any other wake up trigger. */
+			if (irqs) {
+				other_wake = true;
+				break;
+			}
+		}
+
+		/* Other wake up triggers pending, let OS deal with all of it. */
+		if (other_wake)
+			break;
+	}
 
 	writel(0x3, STM32_RCC_BASE + RCC_MP_SREQCLRR);
 	ddr_sw_self_refresh_exit();
-- 
2.39.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
