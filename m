Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C68019D22C
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Apr 2020 10:28:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 148E7C36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Apr 2020 08:28:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8367DC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Apr 2020 08:28:56 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0338SFY2013335; Fri, 3 Apr 2020 10:28:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=LFjPtrFeaUTN8FiPDWB0VrIWZJaoxgHeFAunP9ttHeY=;
 b=dkxInaSasNdoUdAJHV4DebxOKs61l1rxLJhYs1rgFsW+UP035qiWnF3V75+36kbR+gtJ
 G2g6Op9is8JO5SdwY8EseinC5hfSNz8IH4VR9kN1lgjz7M6XeKKQUqR4BuQ0WhkX9CUE
 zJFIXxoIbVlp4OnF+HWVIIA19mmDFi+6AJ8BC0FjDMaJTRaJ0V9SC4MZS176w1rCQbYY
 7OBgVFJOoWZGP0/fRdGjP21/jT50qcnogWuo51KBejYQJQ3610X9uvugZUczSD68AS8V
 xwyLjsN2yloVridsTK+7UGPAcavkOw8Sm024Qe1pfdjhz6++Yux799ta5g0DsbX6TqDH VA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301w81fyqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Apr 2020 10:28:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 810D610002A;
 Fri,  3 Apr 2020 10:28:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 649C621E68D;
 Fri,  3 Apr 2020 10:28:51 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 3 Apr 2020 10:28:50 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 3 Apr 2020 10:28:33 +0200
Message-ID: <20200403102815.2.Ib6abcb05422a74bc6bc03daa71b15c98c99dbc5d@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200403102815.1.I64599059b66bacb531db38c67273754a145dbad8@changeid>
References: <20200403102815.1.I64599059b66bacb531db38c67273754a145dbad8@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-03_05:2020-04-02,
 2020-04-03 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Rajesh Ravi <rajesh.ravi@broadcom.com>,
 Simon Glass <sjg@chromium.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Trevor Woerner <trevor@toganlabs.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 2/3] arm: caches: add DCACHE_DEFAULT_OPTION
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
CONFIG_SYS_ARM_CACHE_WRITETHROUGH or CONFIG_SYS_ARM_CACHE_WRITEALLOC.

This new compilation flag allows to simplify dram_bank_mmu_setup()
and can be used as third parameter (option=dcache option to select)
of mmu_set_region_dcache_behaviour function.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/include/asm/system.h |  8 ++++++++
 arch/arm/lib/cache-cp15.c     | 11 ++---------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/arm/include/asm/system.h b/arch/arm/include/asm/system.h
index 81ccead112..01ea96e8ad 100644
--- a/arch/arm/include/asm/system.h
+++ b/arch/arm/include/asm/system.h
@@ -485,6 +485,14 @@ enum dcache_option {
 };
 #endif
 
+#if defined(CONFIG_SYS_ARM_CACHE_WRITETHROUGH)
+#define DCACHE_DEFAULT_OPTION	DCACHE_WRITETHROUGH
+#elif defined(CONFIG_SYS_ARM_CACHE_WRITEALLOC)
+#define DCACHE_DEFAULT_OPTION	DCACHE_WRITEALLOC
+#else
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
