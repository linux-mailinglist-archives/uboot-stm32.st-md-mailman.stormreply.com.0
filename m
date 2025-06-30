Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B62AED1E2
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Jun 2025 02:11:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAD9BC30883;
	Mon, 30 Jun 2025 00:11:12 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC5C1C32E8E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 00:11:11 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bVmlz47Qhz9sTJ;
 Mon, 30 Jun 2025 02:11:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1751242271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CAIA9r/8TbaxhgZXLTlk0GhYEF0XRmu5tfyglYnvKjk=;
 b=nnbthAmBf4g0Q75JyM4zCmTwQcNLVxv44AQI1W/Y7m9c6/hb8lczokbueH/eyZDjBC7IQr
 pypdMR4ImFxNOKPDs/76WJTO2pKZVskYnQreeAhgRK9TLhTDc8A4nGfYedaBWGIs/2GeSY
 /NLs4YCheh/FwrUYI7N+kTNheo2VWVElAs5lF2Nyu6xLbOTeyVhvQrlDlyoc96xFGdoldf
 IjAHQqfHvzr0bt7PmVvScXXaBTdzPiF/YuE7uB9Zee1aFMBMC0QKkr+7HdwvNWFqOKSo8T
 RiBWbkbSIz5sb+44F9+1zCVJL+EOmG7tynLPenhMwJLXfOVxtugmjMaWbynn6g==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1751242269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CAIA9r/8TbaxhgZXLTlk0GhYEF0XRmu5tfyglYnvKjk=;
 b=NcE3dA+HSL2mZ2WQ/6Yk83ORnLcSbLFPpeMiLg/SHXZdpTkCdCYn+Egjg4VKXAp03ADmj0
 ziVo6BfQL0dfzTRvmFjR0XoCINLBcpjBcviF0MFSeM+YyBCXWQjvQz71j7wSAWbzJlshCr
 oMQYn0mR0TCojFErEmL5X5j6XU6usTJlbUSa47Et2jfnNyO8Y8u25NPlTlF1Jjvg4YSjpA
 nwxS2WqR+XE+z9z3ZxW+0rmLvVnb4tfcm7tFDjK5Htj3SGmgPXGYwBhxwNF8QZLiVR0rxn
 HFVaTYJMTBHS6Jv5HfHCd6IiXEvWsRmDfLJoatZRAzoDaEOHAslSwrtFuVlZiw==
To: u-boot@lists.denx.de
Date: Mon, 30 Jun 2025 02:10:29 +0200
Message-ID: <20250630001053.952342-3-marek.vasut@mailbox.org>
In-Reply-To: <20250630001053.952342-1-marek.vasut@mailbox.org>
References: <20250630001053.952342-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: metzk3a9fnx7masbfeabyeubab1gugrp
X-MBO-RS-ID: ffcfa1b79bb6b4ec111
Cc: Tom Rini <trini@konsulko.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>, u-boot@dh-electronics.com,
 Marek Vasut <marek.vasut@mailbox.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 03/10] ARM: stm32: Limit early cache
	enablement in SPL to STM32MP15xx
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

The STM32MP13xx SRAM size is half that the SRAM size on STM32MP15xx,
disable early dcache start on STM32MP13xx as the TLB itself takes
about a quarter of the SPL size. The dcache will be enabled later,
once DRAM is available and TLB can be placed in DRAM.

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
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
V2: Add RB from Patrice
---
 arch/arm/mach-stm32mp/stm32mp1/cpu.c | 9 ++++++---
 arch/arm/mach-stm32mp/stm32mp1/spl.c | 3 ++-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-stm32mp/stm32mp1/cpu.c b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
index 8c09d91de05..e0c6f8ba937 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/cpu.c
+++ b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
@@ -28,7 +28,9 @@
  * early TLB into the .data section so that it not get cleared
  * with 16kB allignment (see TTBR0_BASE_ADDR_MASK)
  */
+#if (!IS_ENABLED(CONFIG_XPL_BUILD) || !IS_ENABLED(CONFIG_STM32MP13X))
 u8 early_tlb[PGTABLE_SIZE] __section(".data") __aligned(0x4000);
+#endif
 
 u32 get_bootmode(void)
 {
@@ -95,18 +97,19 @@ void dram_bank_mmu_setup(int bank)
  */
 static void early_enable_caches(void)
 {
+#if (!IS_ENABLED(CONFIG_XPL_BUILD) || !IS_ENABLED(CONFIG_STM32MP13X))
 	/* I-cache is already enabled in start.S: cpu_init_cp15 */
-
 	if (CONFIG_IS_ENABLED(SYS_DCACHE_OFF))
 		return;
 
 #if !(CONFIG_IS_ENABLED(SYS_ICACHE_OFF) && CONFIG_IS_ENABLED(SYS_DCACHE_OFF))
-		gd->arch.tlb_size = PGTABLE_SIZE;
-		gd->arch.tlb_addr = (unsigned long)&early_tlb;
+	gd->arch.tlb_size = PGTABLE_SIZE;
+	gd->arch.tlb_addr = (unsigned long)&early_tlb;
 #endif
 
 	/* enable MMU (default configuration) */
 	dcache_enable();
+#endif
 }
 
 /*
diff --git a/arch/arm/mach-stm32mp/stm32mp1/spl.c b/arch/arm/mach-stm32mp/stm32mp1/spl.c
index 9c4fafbf478..e63bdaaf42f 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/spl.c
+++ b/arch/arm/mach-stm32mp/stm32mp1/spl.c
@@ -220,10 +220,11 @@ void board_init_f(ulong dummy)
 	 * activate cache on DDR only when DDR is fully initialized
 	 * to avoid speculative access and issue in get_ram_size()
 	 */
-	if (!CONFIG_IS_ENABLED(SYS_DCACHE_OFF))
+	if (!CONFIG_IS_ENABLED(SYS_DCACHE_OFF) && !IS_ENABLED(CONFIG_STM32MP13X)) {
 		mmu_set_region_dcache_behaviour(STM32_DDR_BASE,
 						CONFIG_DDR_CACHEABLE_SIZE,
 						DCACHE_DEFAULT_OPTION);
+	}
 }
 
 void spl_board_prepare_for_boot(void)
-- 
2.47.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
