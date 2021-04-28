Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2049A36D5B9
	for <lists+uboot-stm32@lfdr.de>; Wed, 28 Apr 2021 12:24:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8425C58D60;
	Wed, 28 Apr 2021 10:24:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FB87C58D62
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Apr 2021 10:23:59 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SAGgf4025298; Wed, 28 Apr 2021 12:23:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=RXVyWVMWjX/KwvzaMh+0S9EknX7dSM7IjBZbc9ztDZo=;
 b=lVEH7+teZKfp8TO7fdxBKz31+GCZegSWF24digRu+ZuiGHoM9TUox39ePaOiA7rcNCmF
 hmSdVJ6tFN2DmRWEKFp3/P6CQSJDw2MNmNvUdGGnyLpsIyv8d4TV3ZjHDOQXxiFE7B9y
 3RgAdpG9GMTMoJBMWdyyyIiZYSO4Gv5hOPIcE6tzd1r6YuCOcmIPa3iH1P5cs2hTZT1P
 fpuJporo/ksud6MiId64qLJSC3u/KAkHFP9leky0BQTUG4DjaqdeyajH5F/2rMNnrYO0
 jGgtMPOWEsgrrD3ptpUhAhqdPzTX7L1vGu5OAtQ1HBH7N46+tV2aSVF+bTghe9fMI1q7 gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 386ea8fm42-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 12:23:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8F0EA10002A;
 Wed, 28 Apr 2021 12:23:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 840AD211B08;
 Wed, 28 Apr 2021 12:23:54 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 28 Apr 2021 12:23:54
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 28 Apr 2021 12:23:45 +0200
Message-ID: <20210428122109.v3.7.Ibd5e48dc85df5bb52a2a1a54054e96d53c2e3358@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210428102345.3192-1-patrick.delaunay@foss.st.com>
References: <20210428102345.3192-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_04:2021-04-27,
 2021-04-28 signatures=0
Cc: Marek Vasut <marex@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, marek.bykowski@gmail.com,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: [Uboot-stm32] [PATCH v3 7/7] stm32mp: don't map the reserved region
	with no-map property
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

No more map the reserved region with "no-map" property by marking
the corresponding TLB entries with invalid entry (=0) to avoid
speculative access.

The device tree parsing done in lmb_init_and_reserve() takes a
long time when it is executed without data cache, so it is called in
enable_caches() before to disable it.

This patch fixes an issue where predictive read access on secure DDR
OP-TEE reserved area are caught by firewall.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v3:
- call lmb_init_and_reserve when data cache is activated in enable_caches()
- drop v2 patch "arm: cache: cp15: don't map the reserved region
  with no-map property"

Changes in v2:
- NEW: update in stm32mp specific MMU setup functions

 arch/arm/mach-stm32mp/cpu.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index 8115d58b19..592bfd413d 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -12,6 +12,7 @@
 #include <env.h>
 #include <init.h>
 #include <log.h>
+#include <lmb.h>
 #include <misc.h>
 #include <net.h>
 #include <asm/io.h>
@@ -90,6 +91,8 @@
  */
 u8 early_tlb[PGTABLE_SIZE] __section(".data") __aligned(0x4000);
 
+struct lmb lmb;
+
 #if !defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD)
 #ifndef CONFIG_TFABOOT
 static void security_init(void)
@@ -221,6 +224,8 @@ void dram_bank_mmu_setup(int bank)
 	int	i;
 	phys_addr_t start;
 	phys_size_t size;
+	bool use_lmb = false;
+	enum dcache_option option;
 
 	if (IS_ENABLED(CONFIG_SPL_BUILD)) {
 		start = ALIGN_DOWN(STM32_SYSRAM_BASE, MMU_SECTION_SIZE);
@@ -229,6 +234,7 @@ void dram_bank_mmu_setup(int bank)
 		/* bd->bi_dram is available only after relocation */
 		start = bd->bi_dram[bank].start;
 		size =  bd->bi_dram[bank].size;
+		use_lmb = true;
 	} else {
 		/* mark cacheable and executable the beggining of the DDR */
 		start = STM32_DDR_BASE;
@@ -237,8 +243,12 @@ void dram_bank_mmu_setup(int bank)
 
 	for (i = start >> MMU_SECTION_SHIFT;
 	     i < (start >> MMU_SECTION_SHIFT) + (size >> MMU_SECTION_SHIFT);
-	     i++)
-		set_section_dcache(i, DCACHE_DEFAULT_OPTION);
+	     i++) {
+		option = DCACHE_DEFAULT_OPTION;
+		if (use_lmb && lmb_is_reserved_flags(&lmb, i << MMU_SECTION_SHIFT, LMB_NOMAP))
+			option = 0; /* INVALID ENTRY in TLB */
+		set_section_dcache(i, option);
+	}
 }
 /*
  * initialize the MMU and activate cache in SPL or in U-Boot pre-reloc stage
@@ -302,6 +312,9 @@ int arch_cpu_init(void)
 
 void enable_caches(void)
 {
+	/* parse device tree when data cache is still activated */
+	lmb_init_and_reserve(&lmb, gd->bd, (void *)gd->fdt_blob);
+
 	/* I-cache is already enabled in start.S: icache_enable() not needed */
 
 	/* deactivate the data cache, early enabled in arch_cpu_init() */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
