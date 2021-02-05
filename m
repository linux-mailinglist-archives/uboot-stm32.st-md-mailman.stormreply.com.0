Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB2B310B5E
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Feb 2021 13:53:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4142C57B51;
	Fri,  5 Feb 2021 12:53:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67E15C5662E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 12:53:45 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 115CR8fT013484; Fri, 5 Feb 2021 13:53:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=GprV08w5UiIL5YcroVnAYpxqQ8sHMcfDBjYrFbb9Wq8=;
 b=SCKtSkggU2JU+mJmGyLTfm66Kh2j+jB1uUJAhuY0HXe9/LO7ZF6uAoM1TuIGxOpqLlX4
 fUYiAdIGoCl1E2K8YOn0z33JiWnc9GxolL6llXd/6uUVYPFseNfYEicY7yb/wZXXYRAU
 1W581U6W4rM2HKmiauTnXe8YKvgcMrkV9DNBGgwrYRb6MYZJnM+Ss3nRntit91DxCEeD
 WYeoSuKjhwtT7K0TfGVvfht6Rg8+9G7YtMl5Tway/Ei7WzZDkFLQz885klGn+3HQmNr/
 oNsj7iXbBD6ZPjZL2ccXJXUPVk1su9tjgWUEyygp/Hb8cbAkA6UhiXGt8hnXZQU8yipf MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36d0nsfm8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 13:53:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C88E6100034;
 Fri,  5 Feb 2021 13:53:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BEEA7231DDB;
 Fri,  5 Feb 2021 13:53:42 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb 2021 13:53:42
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 5 Feb 2021 13:53:32 +0100
Message-ID: <20210205135332.1.Id05ed63c4c424d0307d757026ab2f22621b5481b@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210205125339.24721-1-patrick.delaunay@foss.st.com>
References: <20210205125339.24721-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_07:2021-02-05,
 2021-02-05 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/8] stm32mp: update MMU config before the
	relocation
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

Mark the top of ram, used for relocated U-Boot as a normal memory
(cacheable and executable) to avoid permission access issue when
U-Boot jumps to this relocated code.

When MMU is activated in pre-reloc stage; only the beginning of
DDR is marked executable.

This patch avoids access issue when DACR is correctly managed.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/dram_init.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-stm32mp/dram_init.c b/arch/arm/mach-stm32mp/dram_init.c
index 32b177bb79..5fc8c6e15d 100644
--- a/arch/arm/mach-stm32mp/dram_init.c
+++ b/arch/arm/mach-stm32mp/dram_init.c
@@ -12,6 +12,7 @@
 #include <lmb.h>
 #include <log.h>
 #include <ram.h>
+#include <asm/system.h>
 
 DECLARE_GLOBAL_DATA_PTR;
 
@@ -40,6 +41,7 @@ int dram_init(void)
 
 ulong board_get_usable_ram_top(ulong total_size)
 {
+	phys_size_t size;
 	phys_addr_t reg;
 	struct lmb lmb;
 
@@ -47,10 +49,13 @@ ulong board_get_usable_ram_top(ulong total_size)
 	lmb_init(&lmb);
 	lmb_add(&lmb, gd->ram_base, gd->ram_size);
 	boot_fdt_add_mem_rsv_regions(&lmb, (void *)gd->fdt_blob);
-	reg = lmb_alloc(&lmb, CONFIG_SYS_MALLOC_LEN + total_size, SZ_4K);
+	size = ALIGN(CONFIG_SYS_MALLOC_LEN + total_size, MMU_SECTION_SIZE),
+	reg = lmb_alloc(&lmb, size, MMU_SECTION_SIZE);
 
-	if (reg)
-		return ALIGN(reg + CONFIG_SYS_MALLOC_LEN + total_size, SZ_4K);
+	if (!reg)
+		reg = gd->ram_top - size;
 
-	return gd->ram_top;
+	mmu_set_region_dcache_behaviour(reg, size, DCACHE_DEFAULT_OPTION);
+
+	return reg + size;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
