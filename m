Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CBC19D38C
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Apr 2020 11:25:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B537C36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Apr 2020 09:25:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66671C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Apr 2020 09:25:53 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0339NDVG018095; Fri, 3 Apr 2020 11:25:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=SriXs5poKSCrJxMYq/8B8elhNoeVRScHYHdXIt7bePs=;
 b=iDurLHlmbijfMyhJKm0P1Fhl0RbV10NDN7n6hbfDnS0jvK/K1B7WUawEZjdtvLH/DEuE
 YiwqCML19yfSwMzJII7cVroHVJtkJ/byaqb9of/hsUfCBkU2LT0LTGxCor13l7G2ND0V
 upnG2zM83sWI7vam53bR28mALSDuAtNeEldFtRm9/908fa4qruw36chIVVQgKtq67Uuu
 tjWOsfrlVTVxZKn/6wrqRQCy/7175blffoXj/V8/tkX1pOlr1jyVn7ZaZrAw5n5y+/st
 Dt8w1hmtLeLUnNtdnBJc2/EETSTrLcSOQ5xCgHCoBY+iJeQ1HpN6JHTcU7JLIeXlcBe3 MA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 302y54addm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Apr 2020 11:25:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9B91E10002A;
 Fri,  3 Apr 2020 11:25:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 920DC2222AD;
 Fri,  3 Apr 2020 11:25:49 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 3 Apr 2020 11:25:48 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 3 Apr 2020 11:25:37 +0200
Message-ID: <20200403105644.v2.2.Ib571c64a8c50fcbe386e728e38bbd320427e4efb@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200403092537.19961-1-patrick.delaunay@st.com>
References: <20200403092537.19961-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-03_06:2020-04-02,
 2020-04-03 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2 2/2] arm: stm32mp: activate data cache on
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

Changes in v2:
- new

 arch/arm/mach-stm32mp/spl.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/spl.c
index 9cd7b418a4..279121af75 100644
--- a/arch/arm/mach-stm32mp/spl.c
+++ b/arch/arm/mach-stm32mp/spl.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <cpu_func.h>
 #include <dm.h>
 #include <hang.h>
 #include <spl.h>
@@ -117,4 +118,24 @@ void board_init_f(ulong dummy)
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
+	debug("SPL bye\n");
+}
+
+void spl_board_prepare_for_boot_linux(void)
+{
+	dcache_disable();
+	debug("SPL bye\n");
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
