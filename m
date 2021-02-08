Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFF4313338
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Feb 2021 14:27:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 889A3C57B55;
	Mon,  8 Feb 2021 13:27:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEBC8C57B57
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 13:27:27 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 118DR4pn030233; Mon, 8 Feb 2021 14:27:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=bu6I8KnhzHGIRlrTDYJqb3lu0VpICKm1qC1JNryVu9w=;
 b=bAw5+8mvdyW6+XkBbEufIJFn6z2lclYAeibVJzmSWbZBkhwwpfL8vLs0ws/0pfLOzhLg
 ZK0SHtkSl11PDDOgHSTBcX/maPFBnRUB42RYn8U2FpqyGVqBK/Q8Vx5kLSnqUWqKuCqd
 Mytw6RGcimP2/qEUUhfYSwsTiZ08BW9iq0M8cbtc6pyuAsZRaYPkzMtj8PYJaJi3bUlm
 0mxQgaHK1fQlKMNz5nCYMKmEYi6h4YPU0mImQCtbLaWlDcZRZeID866whHxg51YQqw7A
 xKEKx63CSvOgPK52pFR459ty9ZLv3Fd2d0AjvDH1oHSDkbwVRqX5TAbi+uhB9CKhzBnC lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hrf72au1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Feb 2021 14:27:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 75CCA10002A;
 Mon,  8 Feb 2021 14:27:23 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 693662AD2C0;
 Mon,  8 Feb 2021 14:27:23 +0100 (CET)
Received: from localhost (10.75.127.123) by GPXDAG2NODE6.st.com (10.75.127.70)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 8 Feb 2021 14:27:22 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 8 Feb 2021 14:26:54 +0100
Message-ID: <20210208142645.v2.6.Ibd5e48dc85df5bb52a2a1a54054e96d53c2e3358@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210208132655.25057-1-patrick.delaunay@foss.st.com>
References: <20210208132655.25057-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.123]
X-ClientProxiedBy: GPXDAG1NODE5.st.com (10.75.127.66) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-08_06:2021-02-08,
 2021-02-08 signatures=0
Cc: Marek Vasut <marex@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, marek.bykowski@gmail.com,
 Etienne
 Carriere <etienne.carriere@linaro.org>, Ard Biesheuvel <ardb@kernel.org>
Subject: [Uboot-stm32] [PATCH v2 6/7] stm32mp: don't map the reserved region
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

This patch fixes an issue where predictive read access on secure DDR
OP-TEE reserved area are caught by firewall.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- NEW: update in stm32mp specific MMU setup functions

 arch/arm/mach-stm32mp/cpu.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index 030066dc7c..2e0d709fed 100644
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
@@ -220,6 +221,9 @@ void dram_bank_mmu_setup(int bank)
 	int	i;
 	phys_addr_t start;
 	phys_size_t size;
+	struct lmb lmb;
+	bool use_lmb = false;
+	enum dcache_option option;
 
 	if (IS_ENABLED(CONFIG_SPL_BUILD)) {
 		start = ALIGN_DOWN(STM32_SYSRAM_BASE, MMU_SECTION_SIZE);
@@ -228,6 +232,10 @@ void dram_bank_mmu_setup(int bank)
 		/* bd->bi_dram is available only after relocation */
 		start = bd->bi_dram[bank].start;
 		size =  bd->bi_dram[bank].size;
+		if (IS_ENABLED(CONFIG_LMB)) {
+			use_lmb = true;
+			lmb_init_and_reserve(&lmb, bd, (void *)gd->fdt_blob);
+		}
 	} else {
 		/* mark cacheable and executable the beggining of the DDR */
 		start = STM32_DDR_BASE;
@@ -236,8 +244,12 @@ void dram_bank_mmu_setup(int bank)
 
 	for (i = start >> MMU_SECTION_SHIFT;
 	     i < (start >> MMU_SECTION_SHIFT) + (size >> MMU_SECTION_SHIFT);
-	     i++)
-		set_section_dcache(i, DCACHE_DEFAULT_OPTION);
+	     i++) {
+		option = DCACHE_DEFAULT_OPTION;
+		if (use_lmb && lmb_is_reserved_flags(&lmb, i << MMU_SECTION_SHIFT, LMB_NOMAP))
+			option = INVALID_ENTRY;
+		set_section_dcache(i, option);
+	}
 }
 /*
  * initialize the MMU and activate cache in SPL or in U-Boot pre-reloc stage
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
