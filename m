Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EC51B7DC0
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Apr 2020 20:21:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 528D5C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Apr 2020 18:21:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AEAEC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 18:21:05 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03OIDXSV028603; Fri, 24 Apr 2020 20:21:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=LPP6lgvDaI9z8mKWhqlUMxOKBQWUwyvEXl+lLztKtrg=;
 b=LYztT0CMMcbO0bBBaGJWGRJSwHGnCyC5ANyHn87uzV0JQFj/3+BIJYi+4UErxIDF+kHL
 NPqx/zgnRsG6uB4u9ohOu8zoB9hX7aIH/guhJSa2SkuhPqHU2NDHGLBgo5yfRm2LPL2T
 qK/9JkC+nR+Ta8zG7gOUPHnT596lb1itRjb8kTcz8sBkKmzO/Dl41ccyrES/t/8pcJ4V
 6mPPgLrWkcCBqPlnSRyMdJFrwRBEXwM0HWHnBma6yO+aBAQIhnmoEk0PStL1bi+z19Iu
 h9ahk9R/SnjZ4mF3hIEfO6IuIb7r2DpHy6tleMgL/Fgi84K/DctsSnD0sQxs8kGNb8ok lQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fqawvh1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 20:21:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A9666100038;
 Fri, 24 Apr 2020 20:20:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9B94D2CF9BE;
 Fri, 24 Apr 2020 20:20:58 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 24 Apr 2020 20:20:58 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 24 Apr 2020 20:20:16 +0200
Message-ID: <20200424201957.v2.2.Ib6abcb05422a74bc6bc03daa71b15c98c99dbc5d@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200424182017.11852-1-patrick.delaunay@st.com>
References: <20200424182017.11852-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_09:2020-04-24,
 2020-04-24 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Rajesh Ravi <rajesh.ravi@broadcom.com>,
 Simon Glass <sjg@chromium.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Trevor Woerner <trevor@toganlabs.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2 2/3] arm: caches: add DCACHE_DEFAULT_OPTION
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

Add the new flags DCACHE_DEFAULT_OPTION to define the default
option to use according the compilation flags
CONFIG_SYS_ARM_CACHE_*.

This new compilation flag allows to simplify dram_bank_mmu_setup()
and can be used as third parameter (option=dcache option to select)
of mmu_set_region_dcache_behaviour function.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---
CONFIG_SYS_ARM_CACHE_WRITEBACK dependency with
[v2] configs: migrate CONFIG_SYS_ARM_CACHE_* in Kconfig
http://patchwork.ozlabs.org/patch/1269103/


Changes in v2: None

 arch/arm/include/asm/system.h |  8 ++++++++
 arch/arm/lib/cache-cp15.c     | 11 ++---------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/arm/include/asm/system.h b/arch/arm/include/asm/system.h
index 81ccead112..a3147fde14 100644
--- a/arch/arm/include/asm/system.h
+++ b/arch/arm/include/asm/system.h
@@ -485,6 +485,14 @@ enum dcache_option {
 };
 #endif
 
+#if defined(CONFIG_SYS_ARM_CACHE_WRITETHROUGH)
+#define DCACHE_DEFAULT_OPTION	DCACHE_WRITETHROUGH
+#elif defined(CONFIG_SYS_ARM_CACHE_WRITEALLOC)
+#define DCACHE_DEFAULT_OPTION	DCACHE_WRITEALLOC
+#elif defined(CONFIG_SYS_ARM_CACHE_WRITEBACK)
+#define DCACHE_DEFAULT_OPTION	DCACHE_WRITEBACK
+#endif
+
 /* Size of an MMU section */
 enum {
 #ifdef CONFIG_ARMV7_LPAE
diff --git a/arch/arm/lib/cache-cp15.c b/arch/arm/lib/cache-cp15.c
index 54509f11c3..d15144188b 100644
--- a/arch/arm/lib/cache-cp15.c
+++ b/arch/arm/lib/cache-cp15.c
@@ -99,15 +99,8 @@ __weak void dram_bank_mmu_setup(int bank)
 	for (i = bd->bi_dram[bank].start >> MMU_SECTION_SHIFT;
 	     i < (bd->bi_dram[bank].start >> MMU_SECTION_SHIFT) +
 		 (bd->bi_dram[bank].size >> MMU_SECTION_SHIFT);
-	     i++) {
-#if defined(CONFIG_SYS_ARM_CACHE_WRITETHROUGH)
-		set_section_dcache(i, DCACHE_WRITETHROUGH);
-#elif defined(CONFIG_SYS_ARM_CACHE_WRITEALLOC)
-		set_section_dcache(i, DCACHE_WRITEALLOC);
-#else
-		set_section_dcache(i, DCACHE_WRITEBACK);
-#endif
-	}
+	     i++)
+		set_section_dcache(i, DCACHE_DEFAULT_OPTION);
 }
 
 /* to activate the MMU we need to set up virtual memory: use 1M areas */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
