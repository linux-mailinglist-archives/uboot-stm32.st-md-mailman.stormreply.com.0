Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D91B284FFD
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Oct 2020 18:37:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00A07C32E8F;
	Tue,  6 Oct 2020 16:37:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55E63C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Oct 2020 16:36:59 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 096GXJUP029151; Tue, 6 Oct 2020 18:36:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=KFnKBXWVV5ggwGlIikc3EG6IZkB7IpTqIOLXlvrhkHQ=;
 b=pasfOV6ZflJZcVaAY9Qj56zyw7K2FZ1RpwmV5H3/HUWZpm/V/C5pdkr2jhLzFOcOMcdL
 c6efdMDsKwjhVBZGhL2ndJQ8uR8ZGgpXlG+QAYYMnCtXimluEWmF6GyqautSXwWgCfxl
 HMBioCnMGlB9aH7HDzXT9DBNBhF36BxRP4o6cxFAO8Bn2TPRTSDySlxFaTc+uSOd2XFp
 nJtRbMMRDbxR5UlJwvzVD0rFxwyjzFvfjQscyLq7bnnHM/7x7/sfl0fqoY6ZeWaJOM5C
 eK/flEcTX916M1qUm+VOmE3xwRvhbKkzTsQv9ac+gaPXnuCYSblVgAayPM8hihTQRQxu qA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3402tj7y8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Oct 2020 18:36:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 603A510002A;
 Tue,  6 Oct 2020 18:36:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C4092C38BB;
 Tue,  6 Oct 2020 18:36:40 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 6 Oct 2020 18:36:39
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 6 Oct 2020 18:36:02 +0200
Message-ID: <20201006163602.21687-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201006163602.21687-1-patrick.delaunay@st.com>
References: <20201006163602.21687-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-06_09:2020-10-06,
 2020-10-06 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Rajesh Ravi <rajesh.ravi@broadcom.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 marek.bykowski@gmail.com, Ard Biesheuvel <ardb@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Uboot-stm32] [PATCH 7/7] arm: cache: cp15: don't map the reserved
	region with no-map property
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

This patch fixes an issue on STM32MP15x where predictive read access
on secure DDR area are caught by OP-TEE.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/include/asm/system.h |  3 +++
 arch/arm/lib/cache-cp15.c     | 19 +++++++++++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/system.h b/arch/arm/include/asm/system.h
index ce552944b7..932f12af1c 100644
--- a/arch/arm/include/asm/system.h
+++ b/arch/arm/include/asm/system.h
@@ -458,6 +458,7 @@ static inline void set_dacr(unsigned int val)
 
 /* options available for data cache on each page */
 enum dcache_option {
+	INVALID_ENTRY = 0,
 	DCACHE_OFF = TTB_SECT | TTB_SECT_MAIR(0) | TTB_SECT_XN_MASK,
 	DCACHE_WRITETHROUGH = TTB_SECT | TTB_SECT_MAIR(1),
 	DCACHE_WRITEBACK = TTB_SECT | TTB_SECT_MAIR(2),
@@ -488,6 +489,7 @@ enum dcache_option {
  *   1    1  1   Outer/Inner Write-Back, Read-Allocate Write-Allocate
  */
 enum dcache_option {
+	INVALID_ENTRY = 0,
 	DCACHE_OFF = TTB_SECT_DOMAIN(0) | TTB_SECT_XN_MASK | TTB_SECT,
 	DCACHE_WRITETHROUGH = DCACHE_OFF | TTB_SECT_C_MASK,
 	DCACHE_WRITEBACK = DCACHE_WRITETHROUGH | TTB_SECT_B_MASK,
@@ -497,6 +499,7 @@ enum dcache_option {
 #define TTB_SECT_AP		(3 << 10)
 /* options available for data cache on each page */
 enum dcache_option {
+	INVALID_ENTRY = 0,
 	DCACHE_OFF = 0x12,
 	DCACHE_WRITETHROUGH = 0x1a,
 	DCACHE_WRITEBACK = 0x1e,
diff --git a/arch/arm/lib/cache-cp15.c b/arch/arm/lib/cache-cp15.c
index abd81d21c7..9e778dfd06 100644
--- a/arch/arm/lib/cache-cp15.c
+++ b/arch/arm/lib/cache-cp15.c
@@ -6,6 +6,7 @@
 
 #include <common.h>
 #include <cpu_func.h>
+#include <lmb.h>
 #include <log.h>
 #include <asm/system.h>
 #include <asm/cache.h>
@@ -105,18 +106,32 @@ void mmu_set_region_dcache_behaviour(phys_addr_t start, size_t size,
 __weak void dram_bank_mmu_setup(int bank)
 {
 	struct bd_info *bd = gd->bd;
+	struct lmb lmb;
 	int	i;
 
 	/* bd->bi_dram is available only after relocation */
 	if ((gd->flags & GD_FLG_RELOC) == 0)
 		return;
 
+	/*
+	 * don't allow cache on reserved memory tagged 'no-map' in DT
+	 * => avoid speculative access to "secure" data
+	 */
+	if (IS_ENABLED(CONFIG_LMB))
+		lmb_init_and_reserve(&lmb, bd, (void *)gd->fdt_blob);
+
 	debug("%s: bank: %d\n", __func__, bank);
 	for (i = bd->bi_dram[bank].start >> MMU_SECTION_SHIFT;
 	     i < (bd->bi_dram[bank].start >> MMU_SECTION_SHIFT) +
 		 (bd->bi_dram[bank].size >> MMU_SECTION_SHIFT);
-	     i++)
-		set_section_dcache(i, DCACHE_DEFAULT_OPTION);
+	     i++) {
+		if (IS_ENABLED(CONFIG_LMB) &&
+		    lmb_is_reserved_flags(&lmb, i << MMU_SECTION_SHIFT,
+					  LMB_NOMAP))
+			set_section_dcache(i, INVALID_ENTRY);
+		else
+			set_section_dcache(i, DCACHE_DEFAULT_OPTION);
+	}
 }
 
 /* to activate the MMU we need to set up virtual memory: use 1M areas */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
