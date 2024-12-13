Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC0A9F0D4A
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Dec 2024 14:29:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6E07C78015;
	Fri, 13 Dec 2024 13:29:51 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F3EFC57194
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2024 13:29:45 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDAwBoa011341;
 Fri, 13 Dec 2024 14:29:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=4km6wvgpiCv3WySfrwHIlc
 Fn1IE4/ZTMAWdj/6wjn0I=; b=egY1HfSpZne8ZkuhB/PR2nNx/lgVXropTGaAZ3
 cuy8l3n3hT41yZG7TSmXK6UPkei+X5CKJWm10Rn5/tUQ6FUcHkiLpBQj8TD8Z6I6
 4EAbBFFI/DBDa5EBY1Y0zioCFXA74AeFzHUeLeaZZoJ/qdwA8xCjS8z785y2upIk
 k6qqxsacuFFICViQH0NzNhxONBMYd0r4c4VHUmbAEfZmaJ8oazhgV4qh87+w4gDq
 earknRc6ful21xw/09YmDsh0NxUjAJ4nKQ/1avDkLXZ8Hz1sQ0JD5SuNkbV93oD9
 9adEoFxwKmhAVFLO5Zg59BH4AHd5C7xuBQkQb4h3s0SXNCIA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43d26nt462-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 14:29:39 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B8F5C40044;
 Fri, 13 Dec 2024 14:28:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1020B270F0C;
 Fri, 13 Dec 2024 14:27:01 +0100 (CET)
Received: from localhost (10.252.14.115) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 13 Dec
 2024 14:27:00 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 13 Dec 2024 14:26:55 +0100
Message-ID: <20241213132655.670837-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.14.115]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>, Igor Opaniuk <igor.opaniuk@foundries.io>,
 Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: stm32mp: Fix dram_bank_mmu_setup() for
	LMB located above ram_top
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

Previously, all LMB marked with LMB_NOMAP (above and below ram_top)
are considered as invalid entry in TLB.

Since commit 1a48b0be93d4 ("lmb: prohibit allocations above ram_top
 even from same bank") all LMB located above ram_top are now marked
LMB_NOOVERWRITE and no more LMB_MAP.

This area above ram_top is reserved for OPTEE and must not be cacheable,
otherwise this leads to a Panic on some boards (Issue on STM32MP135F-DK).

Restore previous behavior by marking invalid entry all TLB above ram_top.

Fixes: 1a48b0be93d4 ("lmb: prohibit allocations above ram_top even from same bank")

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
cc: Sughosh Ganu <sughosh.ganu@linaro.org>
---

 arch/arm/mach-stm32mp/stm32mp1/cpu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/stm32mp1/cpu.c b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
index 62cc98910a7..cb1b84c9af9 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/cpu.c
+++ b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
@@ -53,6 +53,7 @@ void dram_bank_mmu_setup(int bank)
 	struct bd_info *bd = gd->bd;
 	int	i;
 	phys_addr_t start;
+	phys_addr_t addr;
 	phys_size_t size;
 	bool use_lmb = false;
 	enum dcache_option option;
@@ -77,8 +78,12 @@ void dram_bank_mmu_setup(int bank)
 	for (i = start >> MMU_SECTION_SHIFT;
 	     i < (start >> MMU_SECTION_SHIFT) + (size >> MMU_SECTION_SHIFT);
 	     i++) {
+		addr = i << MMU_SECTION_SHIFT;
 		option = DCACHE_DEFAULT_OPTION;
-		if (use_lmb && lmb_is_reserved_flags(i << MMU_SECTION_SHIFT, LMB_NOMAP))
+		if (use_lmb &&
+		    (lmb_is_reserved_flags(i << MMU_SECTION_SHIFT, LMB_NOMAP) ||
+		    addr >= gd->ram_top)
+		   )
 			option = 0; /* INVALID ENTRY in TLB */
 		set_section_dcache(i, option);
 	}
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
