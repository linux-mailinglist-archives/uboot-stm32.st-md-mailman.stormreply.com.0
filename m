Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C91D1975F2
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Mar 2020 09:46:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DA65C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Mar 2020 07:46:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8107AC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 07:46:36 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02U7gbNW007805; Mon, 30 Mar 2020 09:46:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=g2MLO1X6lDdHLDpgpdVrIHAOUjaeYKP/Y25Lk32dA50=;
 b=aWOJXa2r0kgSF0MbbYivs+X+sCfwg1mTiKLb+67IZC2I7V5OV+zr6ivZJLZkGAoNX7li
 N0TN0Mrqi+Al8FO9+KsMCVoi1oCI86/S3C2wbc768bH8lkOqTup1EY5ohc2V+62oboka
 IMp3astPcGSCMDSG+PnU33VPiUFrOEpgfbgiY/2EjzkNctQ8Y4RZW/khVtlLa/NsnVI7
 rGgLikue0adqUa/2eBPQ+xA7/vsUtumTeCjJges/jVjUhh/hrJ/uGvUkbY2c6GxCflMi
 8f4o/ZEypB9gFXL+mQ3tn3CIAcYVLCkBcm1YctD7jZUK5pG786eQAtLqonBVraPCUYZo Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301xbm84ju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Mar 2020 09:46:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5AC4B10002A;
 Mon, 30 Mar 2020 09:46:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D56821CA9A;
 Mon, 30 Mar 2020 09:46:29 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 30 Mar 2020 09:46:28 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 30 Mar 2020 09:46:13 +0200
Message-ID: <20200330094610.1.I2ff601b652f4995a3401dc67c2369a4187046ed8@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-30_01:2020-03-27,
 2020-03-30 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] arm: stm32mp1: activate data cache in SPL and
	before relocation
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

Activate the data cache in SPL and in U-Boot before relocation
- before relocation, the TLB is located after U-Boot
  (CONFIG_SYS_TEXT_BASE and an assumed 2MB max size)
  and all the DDR is marked cacheable
- in SPL, the TLB is located at the end of SYSRAM, just after the stack
  (CONFIG_SPL_STACK) with size PGTABLE_SIZE = 16kB
  and all the SYSRAM is marked cacheable

This patch allows to reduce the execution time, particularly
- for the device tree parsing in U-Boot pre-reloc stage
  (dm_extended_scan_fd =>dm_scan_fdt)
- in I2C timing computation in SPL (stm32_i2c_choose_solution())

For example, the result on STM32MP157C-DK2 board is:
   1,6s gain for trusted boot chain with TF-A
   2,2s gain for basic boot chain with SPL

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Example of bootstage report on STM32MP157C-DK2

1/ For trusted boot chain with TF-A

a) Before the patch

    STM32MP> bootstage report
    Timer summary in microseconds (9 records):
           Mark    Elapsed  Stage
              0          0  reset
        583,290    583,290  board_init_f
      2,348,898  1,765,608  board_init_r
      2,664,580    315,682  id=64
      2,704,027     39,447  id=65
      2,704,729        702  main_loop
      5,563,519  2,858,790  id=175

    Accumulated time:
                    41,696  dm_r
                   615,561  dm_f

b) After the patch
    STM32MP> bootstage report

Timer summary in microseconds (9 records):
       Mark    Elapsed  Stage
          0          0  reset
    577,841    577,841  board_init_f
    722,178    144,337  board_init_r
  1,038,458    316,280  id=64
  1,078,298     39,840  id=65
  1,078,999        701  main_loop
  4,169,020  3,090,021  id=175

Accumulated time:
                36,330  dm_f
                41,999  dm_r

2/ And for the basic boot chain with SPL

a) Before the patch:

    STM32MP> bootstage report
    Timer summary in microseconds (12 records):
           Mark    Elapsed  Stage
              0          0  reset
        195,613    195,613  SPL
        837,867    642,254  end SPL
        840,117      2,250  board_init_f
      2,739,639  1,899,522  board_init_r
      3,066,815    327,176  id=64
      3,103,377     36,562  id=65
      3,104,078        701  main_loop
      3,142,171     38,093  id=175

    Accumulated time:
                    38,124  dm_spl
                    41,956  dm_r
                   648,861  dm_f

b) After the patch

    STM32MP> bootstage report
    Timer summary in microseconds (12 records):
           Mark    Elapsed  Stage
              0          0  reset
        195,859    195,859  SPL
        330,190    134,331  end SPL
        332,408      2,218  board_init_f
        482,688    150,280  board_init_r
        808,694    326,006  id=64
        845,029     36,335  id=65
        845,730        701  main_loop
      3,281,876  2,436,146  id=175

    Accumulated time:
                     3,169  dm_spl
                    36,041  dm_f
                    41,701  dm_r


 arch/arm/mach-stm32mp/cpu.c       | 28 ++++++++++++++++++++++++-
 arch/arm/mach-stm32mp/dram_init.c | 35 +++++++++++++++++++++++++++++++
 include/configs/stm32mp1.h        |  4 ++--
 3 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index 36a9205819..579468a1a0 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -193,6 +193,26 @@ int arch_cpu_init(void)
 {
 	u32 boot_mode;
 
+	/*
+	 * initialialize the MMU and activate data cache
+	 * in SPL or in U- Boot pre-reloc stage
+	 */
+	gd->arch.tlb_size = PGTABLE_SIZE;
+#if defined(CONFIG_SPL_BUILD)
+#if (STM32_SYSRAM_BASE + STM32_SYSRAM_SIZE - CONFIG_SPL_STACK < PGTABLE_SIZE)
+#error "The reserved memory for SPL PGTABLE is not enough."
+#endif
+	gd->arch.tlb_addr = CONFIG_SPL_STACK;
+#else
+	/* TLB is located after U-Boot, assumed 2MB as max size */
+	gd->arch.tlb_addr = CONFIG_SYS_TEXT_BASE + SZ_2M;
+#endif
+	dcache_enable();
+	/*
+	 * MMU/TLB is updated in enable_caches() for U-Boot after relocation
+	 * or is deactivated in U-Boot start.S::cpu_init_cp15 for SPL
+	 */
+
 	/* early armv7 timer init: needed for polling */
 	timer_init();
 
@@ -225,7 +245,13 @@ int arch_cpu_init(void)
 
 void enable_caches(void)
 {
-	/* Enable D-cache. I-cache is already enabled in start.S */
+	/* I-cache is already enabled in start.S */
+	/* deactivate the data cache, early enabled in arch_cpu_init() */
+	dcache_disable();
+	/*
+	 * update MMU after relocation, the TLB location was udpated in
+	 * board_f.c::reserve_mmu, and enable the data cache
+	 */
 	dcache_enable();
 }
 
diff --git a/arch/arm/mach-stm32mp/dram_init.c b/arch/arm/mach-stm32mp/dram_init.c
index 3233415eff..15b39ecc03 100644
--- a/arch/arm/mach-stm32mp/dram_init.c
+++ b/arch/arm/mach-stm32mp/dram_init.c
@@ -7,9 +7,29 @@
 #include <dm.h>
 #include <lmb.h>
 #include <ram.h>
+#include <asm/cache.h>
 
 DECLARE_GLOBAL_DATA_PTR;
 
+static void set_mmu_dcache(u32 addr, u32 size)
+{
+	int	i;
+	u32 start, end;
+
+	start = addr >> MMU_SECTION_SHIFT;
+	end = ((u64)addr + (u64)size) >> MMU_SECTION_SHIFT;
+
+	for (i = start; i < end; i++) {
+#if defined(CONFIG_SYS_ARM_CACHE_WRITETHROUGH)
+		set_section_dcache(i, DCACHE_WRITETHROUGH);
+#elif defined(CONFIG_SYS_ARM_CACHE_WRITEALLOC)
+		set_section_dcache(i, DCACHE_WRITEALLOC);
+#else
+		set_section_dcache(i, DCACHE_WRITEBACK);
+#endif
+	}
+}
+
 int dram_init(void)
 {
 	struct ram_info ram;
@@ -49,3 +69,18 @@ ulong board_get_usable_ram_top(ulong total_size)
 
 	return gd->ram_top;
 }
+
+void dram_bank_mmu_setup(int bank)
+{
+	if (gd->flags & GD_FLG_RELOC) {
+		debug("%s: bank: %d\n", __func__, bank);
+		set_mmu_dcache(gd->bd->bi_dram[bank].start,
+			       gd->bd->bi_dram[bank].size);
+	} else {
+#if defined(CONFIG_SPL_BUILD)
+		set_mmu_dcache(STM32_SYSRAM_BASE, STM32_SYSRAM_SIZE);
+#else
+		set_mmu_dcache(STM32_DDR_BASE, STM32_DDR_SIZE);
+#endif
+	}
+}
diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index c34a720e0c..5203fc93ad 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -58,8 +58,8 @@
 
 /* limit SYSRAM usage to first 128 KB */
 #define CONFIG_SPL_MAX_SIZE		0x00020000
-#define CONFIG_SPL_STACK		(STM32_SYSRAM_BASE + \
-					 STM32_SYSRAM_SIZE)
+/* stack at STM32_SYSRAM_BASE + STM32_SYSRAM_SIZE - PGTABLE_SIZE (=16kB) */
+#define CONFIG_SPL_STACK		0x2FFFC000
 #endif /* #ifdef CONFIG_SPL */
 
 #define CONFIG_SYS_MEMTEST_START	STM32_DDR_BASE
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
