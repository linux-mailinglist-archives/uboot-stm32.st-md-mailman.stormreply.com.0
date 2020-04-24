Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2061B7DD4
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Apr 2020 20:24:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4A53C36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Apr 2020 18:24:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FA29C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 18:24:21 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03OICdwJ011605; Fri, 24 Apr 2020 20:24:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=TtytuLEH0KAZBV2fQWdEPTV40y+D9jvu5j3Vbq/eN6k=;
 b=TM69J7/vAgElc1X5pS9xfILVbwNQU+z4TOIBH4OL+LEwEc+6AF4eawWLtjZryuWuDFJ9
 8EMiLZ5RQU89ov9jZt8C0R6gnLBDwYJiujJaoSeL5I+d8Ivf3V228o3oZZh0Dzl5IFDK
 MAHCspAhD7VFcMSwZzgPipCE3KC8aw9oG++aJINUcUiklXzKYrynfMJdpwzMkj36tGcm
 Hk09oltxhwz/AVJ5DkWoP+6RoiKEmpR+j39A5hQYjilu7qwbkLyf1d07fHcdO1y4Iqt5
 gCblT+a3Zkzv93qUZIFTHqgAYeTyQfhsNKn8fB08GQD7GBEWoSRG2gaw7YrFW+3x0Zt5 uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fq124kmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 20:24:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E854110002A;
 Fri, 24 Apr 2020 20:24:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DFB582BCDE5;
 Fri, 24 Apr 2020 20:24:17 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 24 Apr 2020 20:24:17 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 24 Apr 2020 20:24:13 +0200
Message-ID: <20200424202335.v3.2.Ib571c64a8c50fcbe386e728e38bbd320427e4efb@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200424182413.12685-1-patrick.delaunay@st.com>
References: <20200424182413.12685-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_09:2020-04-24,
 2020-04-24 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v3 2/2] arm: stm32mp: activate data cache on
	DDR in SPL
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

Activate cache on DDR to improves the accesses to DDR used by SPL:
- CONFIG_SPL_BSS_START_ADDR
- CONFIG_SYS_SPL_MALLOC_START

Cache is configured only when DDR is fully initialized,
to avoid speculative access and issue in get_ram_size().
Data cache is deactivated at the end of SPL, to flush the data cache
and the TLB.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v3:
- remove debug message "bye"

Changes in v2:
- new

 arch/arm/mach-stm32mp/spl.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/spl.c
index f85391c6af..e50a21c3b7 100644
--- a/arch/arm/mach-stm32mp/spl.c
+++ b/arch/arm/mach-stm32mp/spl.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <cpu_func.h>
 #include <dm.h>
 #include <hang.h>
 #include <spl.h>
@@ -115,4 +116,22 @@ void board_init_f(ulong dummy)
 		printf("DRAM init failed: %d\n", ret);
 		hang();
 	}
+
+	/*
+	 * activate cache on DDR only when DDR is fully initialized
+	 * to avoid speculative access and issue in get_ram_size()
+	 */
+	if (!CONFIG_IS_ENABLED(SYS_DCACHE_OFF))
+		mmu_set_region_dcache_behaviour(STM32_DDR_BASE, STM32_DDR_SIZE,
+						DCACHE_DEFAULT_OPTION);
+}
+
+void spl_board_prepare_for_boot(void)
+{
+	dcache_disable();
+}
+
+void spl_board_prepare_for_boot_linux(void)
+{
+	dcache_disable();
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
