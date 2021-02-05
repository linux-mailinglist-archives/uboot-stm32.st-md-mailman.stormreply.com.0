Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8E0310B5F
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Feb 2021 13:53:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE346C57B53;
	Fri,  5 Feb 2021 12:53:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C741C57B51
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 12:53:45 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 115CQqF3028785; Fri, 5 Feb 2021 13:53:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=uP+XO4TRIcVzHg3/TXkedXaqs/wdrjz5GSVZ3k17Pl8=;
 b=l+AHZOHSWdCyL4JLv5a9ZUOwDwJ7huZl9xUDUpAnRDwTKkdWgJFRdd8jefHpCKNatS7P
 Bh+HgVwoMJSOwp42JieFCuf6pHxn12roL6TujFKN43CIXIqgHCJIBd6zv0T36+F5GMKS
 3fR/zZsOiHB3EIU3Yhtrc7GW0cQEFWQ+wACs9OpvLncurYSr4cVBJvS+Pi2gVV2o2myl
 7wWSlzsAwWuzyIb4TqjTTlCECqG21BimtltIY8xihG2aLgMPxt41RrC2FDNK+lyVisXg
 4+26q1yNx86nAgdrT5189xppwqxQY59PnfZHNvmyBrmBGySJr2m+NZivy6HQpnxbga7A BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36ey7hgc3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 13:53:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B3EE3100038;
 Fri,  5 Feb 2021 13:53:43 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ABCA6231DDB;
 Fri,  5 Feb 2021 13:53:43 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb 2021 13:53:43
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 5 Feb 2021 13:53:33 +0100
Message-ID: <20210205135332.2.I89418f0518a81f98643b36c248b006e596950c25@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210205125339.24721-1-patrick.delaunay@foss.st.com>
References: <20210205125339.24721-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_07:2021-02-05,
 2021-02-05 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/8] stm32mp: update the mmu configuration for
	SPL and prereloc
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

Overidde the weak function dram_bank_mmu_setup() to set the DDR
(preloc case) or the SYSRAM (in SPL case) executable before to enable
the MMU and configure DACR.

This weak function is called in dcache_enable/mmu_setup.

This patchs avoids a permission access issue when the DDR is marked
executable (by calling mmu_set_region_dcache_behaviour with
DCACHE_DEFAULT_OPTION) after MMU setup and domain access permission
activation with DACR in dcache_enable.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cpu.c | 40 +++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index 717f80e9ff..030066dc7c 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -210,6 +210,35 @@ u32 get_bootmode(void)
 		    TAMP_BOOT_MODE_SHIFT;
 }
 
+/*
+ * weak function overidde: set the DDR/SYSRAM executable before to enable the
+ * MMU and configure DACR, for early early_enable_caches (SPL or pre-reloc)
+ */
+void dram_bank_mmu_setup(int bank)
+{
+	struct bd_info *bd = gd->bd;
+	int	i;
+	phys_addr_t start;
+	phys_size_t size;
+
+	if (IS_ENABLED(CONFIG_SPL_BUILD)) {
+		start = ALIGN_DOWN(STM32_SYSRAM_BASE, MMU_SECTION_SIZE);
+		size = ALIGN(STM32_SYSRAM_SIZE, MMU_SECTION_SIZE);
+	} else if (gd->flags & GD_FLG_RELOC) {
+		/* bd->bi_dram is available only after relocation */
+		start = bd->bi_dram[bank].start;
+		size =  bd->bi_dram[bank].size;
+	} else {
+		/* mark cacheable and executable the beggining of the DDR */
+		start = STM32_DDR_BASE;
+		size = CONFIG_DDR_CACHEABLE_SIZE;
+	}
+
+	for (i = start >> MMU_SECTION_SHIFT;
+	     i < (start >> MMU_SECTION_SHIFT) + (size >> MMU_SECTION_SHIFT);
+	     i++)
+		set_section_dcache(i, DCACHE_DEFAULT_OPTION);
+}
 /*
  * initialize the MMU and activate cache in SPL or in U-Boot pre-reloc stage
  * MMU/TLB is updated in enable_caches() for U-Boot after relocation
@@ -225,17 +254,8 @@ static void early_enable_caches(void)
 	gd->arch.tlb_size = PGTABLE_SIZE;
 	gd->arch.tlb_addr = (unsigned long)&early_tlb;
 
+	/* enable MMU (default configuration) */
 	dcache_enable();
-
-	if (IS_ENABLED(CONFIG_SPL_BUILD))
-		mmu_set_region_dcache_behaviour(
-			ALIGN_DOWN(STM32_SYSRAM_BASE, MMU_SECTION_SIZE),
-			ALIGN(STM32_SYSRAM_SIZE, MMU_SECTION_SIZE),
-			DCACHE_DEFAULT_OPTION);
-	else
-		mmu_set_region_dcache_behaviour(STM32_DDR_BASE,
-						CONFIG_DDR_CACHEABLE_SIZE,
-						DCACHE_DEFAULT_OPTION);
 }
 
 /*
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
