Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96590376588
	for <lists+uboot-stm32@lfdr.de>; Fri,  7 May 2021 14:50:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D577C59781;
	Fri,  7 May 2021 12:50:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46C31C56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 May 2021 12:50:50 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 147ClSMd001910; Fri, 7 May 2021 14:50:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=5957LmZWx+WeyhUaHEUPiQwgW+NW2T+om3hiwN3Wgro=;
 b=bpXSFBxwbGNemy/uR9r3gW9ZcZooQsl9uRlCaaTaSk+RCI/knwwmyeRj+ZNPhwZgJrHh
 UdHNq0wR0Nvl35EYykR9vrAIZNvjm7XbXRLwD1vvOTCeYFMN8tdGlsSpUgh42S0AN62p
 MlfcGXbYBx5BFIKVH2Nca5ZzvDmr9Ote3TRNm/34+nO5vTHosyJlW9gNDBedI4hotxh5
 3cGlb6Jg0BSGMl8+PWlb1wewLNRuX3iS2L057jyef43P+TR63+30yH4u+ncq0UnB9c4u
 Jb24BYnYuhoLTUbbz+JBJ6D58Hb55kr5M0YKIfuvEmTfZyRDmmGg2Iq3FVOTi3nbfbRc 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38csqg3xph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 May 2021 14:50:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1612110002A;
 Fri,  7 May 2021 14:50:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0DD5521CA8B;
 Fri,  7 May 2021 14:50:49 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 7 May 2021 14:50:48
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 7 May 2021 14:50:34 +0200
Message-ID: <20210507145030.v4.6.Iacc4c98187ccfabfd7b72068ad27ad1581bd4cda@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210507125035.1594-1-patrick.delaunay@foss.st.com>
References: <20210507125035.1594-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-07_04:2021-05-06,
 2021-05-07 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v4 6/7] stm32mp: Increase the reserved memory
	in board_get_usable_ram_top
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

Add 8M for the U-Boot reserved memory (display, fdt, gd, ...)
mapped cacheable before relocation.

Without this patch the device tree, located before the MALLOC area
is not tagged cacheable just after relocation, before mmu reconfiguration.

This patch reduces the duration for device tree parsing in
lmb_init_and_reserve.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v4:
- map the end of the DDR only before relocation, in board_f.c;
  this test avoid issue when board_get_usable_ram_top() is called
  in efi_loader function efi_add_known_memory()

Changes in v3:
- NEW: solve performance issue as relocated DT is not marked cacheable

 arch/arm/mach-stm32mp/dram_init.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/dram_init.c b/arch/arm/mach-stm32mp/dram_init.c
index 66e81bacca..3c097029bd 100644
--- a/arch/arm/mach-stm32mp/dram_init.c
+++ b/arch/arm/mach-stm32mp/dram_init.c
@@ -50,13 +50,16 @@ ulong board_get_usable_ram_top(ulong total_size)
 	lmb_init(&lmb);
 	lmb_add(&lmb, gd->ram_base, gd->ram_size);
 	boot_fdt_add_mem_rsv_regions(&lmb, (void *)gd->fdt_blob);
-	size = ALIGN(CONFIG_SYS_MALLOC_LEN + total_size, MMU_SECTION_SIZE),
+	/* add 8M for reserved memory for display, fdt, gd,... */
+	size = ALIGN(SZ_8M + CONFIG_SYS_MALLOC_LEN + total_size, MMU_SECTION_SIZE),
 	reg = lmb_alloc(&lmb, size, MMU_SECTION_SIZE);
 
 	if (!reg)
 		reg = gd->ram_top - size;
 
-	mmu_set_region_dcache_behaviour(reg, size, DCACHE_DEFAULT_OPTION);
+	/* before relocation, mark the U-Boot memory as cacheable by default */
+	if (!(gd->flags & GD_FLG_RELOC))
+		mmu_set_region_dcache_behaviour(reg, size, DCACHE_DEFAULT_OPTION);
 
 	return reg + size;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
