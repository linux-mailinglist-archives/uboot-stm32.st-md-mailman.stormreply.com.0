Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1FF1BFE47
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 16:30:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93B60C36B10
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 14:30:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DD32C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 14:30:30 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03UEQRc9005666; Thu, 30 Apr 2020 16:30:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=mMIsvqGwBsvmjCvcJaFRPhuGenognytzuL9IVcM1PlM=;
 b=bvK3VZ+Xgc5Kv6BVYKsT/KpXrAuch/wm782rUTPKvrwMrhx/WY1qacY6DROEwEfB2B89
 nfcmcBIXkx8V9JA/zELyitiaL4Gfe1ycvYfN7hZBoubUsN7XFUZhwBCVQ7iKTEbiMjKe
 HhHNJZr6q7pmdTYNYyF1j0cO+xaSuZrdqQMKMjBhYsaShVhNyUX2kYMZMxIk8GlHQvd6
 l+4MYrMrzvkszBhPoz6aNl48DwKgCZUPgwDwsBy8lgNMVghy3c2axCvEHi8WyblTNrcI
 tU74dKkKnJQaTTIhIVbD7kc0qI3WMxSRBkvPdlJPPkBjGzQz6mOih/LSIZol9jSDDY3A 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30n4j69550-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 16:30:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 71B2B10002A;
 Thu, 30 Apr 2020 16:30:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6788121FE98;
 Thu, 30 Apr 2020 16:30:25 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 30 Apr 2020 16:30:25 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 30 Apr 2020 16:30:21 +0200
Message-ID: <20200430163010.v4.2.Ib571c64a8c50fcbe386e728e38bbd320427e4efb@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430143021.3636-1-patrick.delaunay@st.com>
References: <20200430143021.3636-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-30_09:2020-04-30,
 2020-04-30 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v4 2/2] arm: stm32mp: activate data cache on
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

Activate cache on DDR to improve the accesses to DDR used by SPL:
- CONFIG_SPL_BSS_START_ADDR
- CONFIG_SYS_SPL_MALLOC_START

Cache is configured only when DDR is fully initialized,
to avoid speculative access and issue in get_ram_size().
Data cache is deactivated at the end of SPL, to flush the data cache
and the TLB.

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v4:
- fix commit message and add Patrice Chotard reviewed-by

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
