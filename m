Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6E1AB3EE3
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 May 2025 19:22:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9355FC7A82D;
	Mon, 12 May 2025 17:22:21 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 853D4C7A82A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 May 2025 17:22:20 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Zx5yN1CTfz9stq;
 Mon, 12 May 2025 19:22:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1747070540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m4kZ0qrokejhOL6UjdNJuLAqzDXaaJnV7J7MVFW6APU=;
 b=XO52Zbc1SHxn86MH6zfrK0u59Y2no/sBvH0J21C9OPG5t9NFdHzA/icWoWlrOj/F9aSuNG
 JSuLAwvRE+COpi66Ran7xWeQ0JbgoQrAMIeCSgUxRuh+PwQMOR6l75vaZ+kncIdO7XMN/e
 mMiGSU7wMBCv/AD7Y0zyeO95o9IrLRL/ZlOVmzIaen4OcpW1eS5yYNhH1Rs1v3peM4zuHb
 PbRYZdj5iBLl9P+2jDq0nVghYaFCHNZDkwG9XMq+xUhvCw++VWBCRAzytosIGS5kNjKsZS
 EzPkmNTt+0N+4ZhHRaAgx4+Ew9bU5tpqLptlRaxWrN6skciOYyy/LEcXCmbtwQ==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1747070538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m4kZ0qrokejhOL6UjdNJuLAqzDXaaJnV7J7MVFW6APU=;
 b=iw48QphqR+WglhaQ9gvX4YGjcL/+7bMb5skPpLqNAVN1neeeecJCxNUpIG6GTSYQe0iRCv
 m0b9sgNJXTf9xGhfrI3CQ/ifAPrwBGVsys6ZK6VpWWkFhtPss4iJM9K2/pynBrUBPDmUmV
 z4+r+ihOb6cFopwcxCHR8d7KO1S6lCOoZIe6cQakON4iZNjGrRPqPUKz5KqUjVsyPsR05L
 pw6evJvrfjPcCxFJ22rDWZMTPqrSMnjb5K8qG/B39jvsQkRTBtTZG3ebRuMtqVYRzPVzTW
 V4gD3lbS0YLh8LN64UaL2cHyP/CXd4TURFoH+44Afi43pytbWsVmoL+EL9AUqg==
To: u-boot@lists.denx.de
Date: Mon, 12 May 2025 19:21:30 +0200
Message-ID: <20250512172149.150214-4-marek.vasut@mailbox.org>
In-Reply-To: <20250512172149.150214-1-marek.vasut@mailbox.org>
References: <20250512172149.150214-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: 2d17c81c8ac6c85ab4c
X-MBO-RS-META: wmdkcry3rq3tzrfe7j4tz38c66xgu1mu
X-Rspamd-Queue-Id: 4Zx5yN1CTfz9stq
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
Subject: [Uboot-stm32] [PATCH 03/10] ARM: stm32: Limit early cache
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
 arch/arm/mach-stm32mp/stm32mp1/cpu.c | 9 ++++++---
 arch/arm/mach-stm32mp/stm32mp1/spl.c | 3 ++-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-stm32mp/stm32mp1/cpu.c b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
index 9ab5a3ede52..1ae82489a4b 100644
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
