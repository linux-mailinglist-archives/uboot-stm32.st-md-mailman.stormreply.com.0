Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A56CC31333B
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Feb 2021 14:27:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D019C57B54;
	Mon,  8 Feb 2021 13:27:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8080BC57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 13:27:38 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 118DRCn4030377; Mon, 8 Feb 2021 14:27:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=HpM0CRwen7FIvAmaAGTaCd8sTpOfFtcX3uKQ6N8jGVk=;
 b=e5lRfb4mf8N6gQVvVUu6ZyNDEx01ia9CUH2GfQaKYwq2boPVrHLF2d1GDSAX+ykZEYNu
 5HWeAyFHGfDMYSs6P7pAuAYgG7suVgA9JCxPbOO6Kmlzac41+Cl+pfA1GBJasQ84Q0E9
 9k8aPvUf4uOfQeYMq0K0aMXZh6SIdppCRvSA9Pcc8Ibiqbhr6d0ZrYMA//w1edTyxJQ7
 VDyMXbX9LD74odsU4PqcWVfZYG0UmTKtI6XIt4zuOwz1hzvfgh23SHn+ML2gQ8MQd/Ff
 Nfx/UeMMgtv45e8HL7dPCAqCWuOP2XzfsQQg4lF+4p+YV6xgwmG6MivPLhwPdJ5plkUo Zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hrf72aue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Feb 2021 14:27:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2212B10002A;
 Mon,  8 Feb 2021 14:27:25 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0E28B2AD2C0;
 Mon,  8 Feb 2021 14:27:25 +0100 (CET)
Received: from localhost (10.75.127.123) by GPXDAG2NODE6.st.com (10.75.127.70)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 8 Feb 2021 14:27:24 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 8 Feb 2021 14:26:55 +0100
Message-ID: <20210208142645.v2.7.I27d5ccee284a768e98f06abc8949579f65c85018@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210208132655.25057-1-patrick.delaunay@foss.st.com>
References: <20210208132655.25057-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.123]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-08_06:2021-02-08,
 2021-02-08 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, marek.bykowski@gmail.com,
 Etienne
 Carriere <etienne.carriere@linaro.org>, Ard Biesheuvel <ardb@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Uboot-stm32] [PATCH v2 7/7] arm: cache: cp15: don't map the
	reserved region with no-map property
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

This patch fixes potential issue when predictive access is done by ARM
core.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 arch/arm/include/asm/system.h |  3 +++
 arch/arm/lib/cache-cp15.c     | 19 +++++++++++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/system.h b/arch/arm/include/asm/system.h
index 11fceec4d2..c63ed07f2c 100644
--- a/arch/arm/include/asm/system.h
+++ b/arch/arm/include/asm/system.h
@@ -444,6 +444,7 @@ static inline void set_cr(unsigned int val)
 
 /* options available for data cache on each page */
 enum dcache_option {
+	INVALID_ENTRY = 0,
 	DCACHE_OFF = TTB_SECT | TTB_SECT_MAIR(0) | TTB_SECT_XN_MASK,
 	DCACHE_WRITETHROUGH = TTB_SECT | TTB_SECT_MAIR(1),
 	DCACHE_WRITEBACK = TTB_SECT | TTB_SECT_MAIR(2),
@@ -474,6 +475,7 @@ enum dcache_option {
  *   1    1  1   Outer/Inner Write-Back, Read-Allocate Write-Allocate
  */
 enum dcache_option {
+	INVALID_ENTRY = 0,
 	DCACHE_OFF = TTB_SECT_DOMAIN(0) | TTB_SECT_XN_MASK | TTB_SECT,
 	DCACHE_WRITETHROUGH = TTB_SECT_DOMAIN(0) | TTB_SECT | TTB_SECT_C_MASK,
 	DCACHE_WRITEBACK = DCACHE_WRITETHROUGH | TTB_SECT_B_MASK,
@@ -483,6 +485,7 @@ enum dcache_option {
 #define TTB_SECT_AP		(3 << 10)
 /* options available for data cache on each page */
 enum dcache_option {
+	INVALID_ENTRY = 0,
 	DCACHE_OFF = 0x12,
 	DCACHE_WRITETHROUGH = 0x1a,
 	DCACHE_WRITEBACK = 0x1e,
diff --git a/arch/arm/lib/cache-cp15.c b/arch/arm/lib/cache-cp15.c
index 8a49e5217c..8a354d364d 100644
--- a/arch/arm/lib/cache-cp15.c
+++ b/arch/arm/lib/cache-cp15.c
@@ -6,6 +6,7 @@
 
 #include <common.h>
 #include <cpu_func.h>
+#include <lmb.h>
 #include <log.h>
 #include <asm/system.h>
 #include <asm/cache.h>
@@ -101,18 +102,32 @@ void mmu_set_region_dcache_behaviour(phys_addr_t start, size_t size,
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
