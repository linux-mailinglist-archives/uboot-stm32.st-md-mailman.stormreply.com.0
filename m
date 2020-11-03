Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 729EE2A43AA
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Nov 2020 12:02:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38AF8C3FAD4;
	Tue,  3 Nov 2020 11:02:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BC0CC36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Nov 2020 11:02:13 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A3B1ibS001068; Tue, 3 Nov 2020 12:02:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=juCfEWBpvfDTW7snBeKsGHfLnThBGXuoCeozZlmQdcM=;
 b=xA92Ebkj10KBWhMm130K80alq6LpLL3adiREqcpRUQUSCVP6o1B6YEl1OVmkDqwoQ/iZ
 r8aGIIXw2x/ZSA9GhCAZkj7JXvEZL//uSx8nGImsa6dllRs/l2MSpye/+0dKRGaHgusD
 y4MEDtvfxF6FDBEEGpJtFPUX1eYCJZ028PR+K6Ep+4o22FXyqahA7LNS7WF6O7GhgrgJ
 2j5Uvv8NN4XgSeCGfZI46+LUOAcFl413zIveRAkrI5kvV1ULLclP29BL420g/1lAxfYN
 lFPYYW3obQc3tbfNRP/zMRWZJRaEiH+E6f9289Yb6qc45gFXXNdKuyiwQ1bmH2ZAPxyb MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gyw17uq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Nov 2020 12:02:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 625A7100038;
 Tue,  3 Nov 2020 12:01:59 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 52D342461EB;
 Tue,  3 Nov 2020 12:01:59 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov 2020 12:01:16
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 3 Nov 2020 12:01:11 +0100
Message-ID: <20201103110115.12875-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201103120047.1.I30ef60ea8b13322a6ec7b675dc2de5f63f336fc3@changeid>
References: <20201103120047.1.I30ef60ea8b13322a6ec7b675dc2de5f63f336fc3@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-03_07:2020-11-03,
 2020-11-03 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Uboot-stm32] [PATCH 2/4] arm: cache-cp15: simplify trace support
	for LPAE
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

Add a new define OPTIONF to handle enum dcache_option option size.

This patch avoid one #ifdef CONFIG_ARMV7_LPAE in
mmu_set_region_dcache_behaviour_phys code.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/lib/cache-cp15.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/arm/lib/cache-cp15.c b/arch/arm/lib/cache-cp15.c
index e2efe6f244..6f154de4c3 100644
--- a/arch/arm/lib/cache-cp15.c
+++ b/arch/arm/lib/cache-cp15.c
@@ -12,6 +12,13 @@
 #include <linux/compiler.h>
 #include <asm/armv7_mpu.h>
 
+/* for LPAE : enum dcache_option option is ULL*/
+#ifdef CONFIG_ARMV7_LPAE
+#define OPTIONF "%llx"
+#else
+#define OPTIONF "%x"
+#endif
+
 #if !(CONFIG_IS_ENABLED(SYS_ICACHE_OFF) && CONFIG_IS_ENABLED(SYS_DCACHE_OFF))
 
 DECLARE_GLOBAL_DATA_PTR;
@@ -78,13 +85,9 @@ void mmu_set_region_dcache_behaviour_phys(phys_addr_t start, phys_addr_t phys,
 	      >> (MMU_SECTION_SHIFT - 1);
 	start = start >> MMU_SECTION_SHIFT;
 
-#ifdef CONFIG_ARMV7_LPAE
-	debug("%s: start=%pa, size=%zu, option=%llx\n", __func__, &start, size,
-	      option);
-#else
-	debug("%s: start=%pa, size=%zu, option=0x%x\n", __func__, &start, size,
-	      option);
-#endif
+	debug("%s: start=%pa, size=%zu, option=0x" OPTIONF "\n",
+	      __func__, &start, size, option);
+
 	for (upto = start; upto < end; upto++, phys += MMU_SECTION_SIZE)
 		set_section_phys(upto, phys, option);
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
