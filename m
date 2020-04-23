Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB2C1B601B
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Apr 2020 18:02:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEFBCC36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Apr 2020 16:02:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3543C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Apr 2020 16:02:37 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03NFqIVV005150; Thu, 23 Apr 2020 18:02:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=EIFbQ5vOjghQj8OBGAUUa5LUp2mtz9ui3WYEuHbTn34=;
 b=GT/73xOzHy0r838Nx18PWLxgZmQFFWNQbA6RZBTKlfEKUklgHUDAXfHXlWVKxz5zbife
 dVlQbmUC6q4MVEXvn1+um4b6bTXtSdD0Z+WdoJ1Ny1BHGhsP5aGOxk2eoCSv/kKaNXz6
 J5pLlrYm9jI72KRNnQoF4KW179c0aZvk7J9748g1GLz9Ms3PPNJAKnoQ5weOf1MzME2Z
 X651IVvwTZeZsr211qnqAaEAoqs+wWevomTBGdnDtBpI+Yfaw9huefUod+AzTy1LWPc5
 CFiB2obHSr7KrBXzq9RCe6/OefzvSMFJJFwduEcyYh4OKlXtfVyJX8AtCFGYKd6quPjc 5w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fq11ww5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Apr 2020 18:02:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A2CB9100034;
 Thu, 23 Apr 2020 18:02:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D5342A8A8E;
 Thu, 23 Apr 2020 18:02:20 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 23 Apr 2020 18:02:19 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 23 Apr 2020 18:01:55 +0200
Message-ID: <20200423160155.9258-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-23_12:2020-04-23,
 2020-04-23 signatures=0
Cc: Marek Vasut <marex@denx.de>, Stephen Warren <swarren@nvidia.com>,
 Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>,
 Rajesh Ravi <rajesh.ravi@broadcom.com>, Simon Glass <sjg@chromium.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, Eric Perie <eric.perie@yahoo.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Trevor Woerner <trevor@toganlabs.com>, Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] cmd: cache: Fix non-cached memory cachability
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

If dcache is switched OFF to ON state and if non-cached memory is
used, this non-cached memory must be re-declared as uncached to mmu
each time dcache is set ON.

Issue found on STM32MP1 platform using dwc_eth_qos ethernet driver,
when going from dcache OFF to dcache ON state, ethernet driver issued
TX timeout errors when performing dhcp or ping.

It can be reproduced with the following sequence:

dhcp
while true ; do
  ping 192.168.1.300 ;
  dcache off ;
  ping 192.168.1.300 ;
  dcache on ;
done

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Joe Hershberger <joe.hershberger@ni.com>
Cc: Ramon Fried <rfried.dev@gmail.com>
Cc: Stephen Warren <swarren@nvidia.com>
---

 arch/arm/include/asm/system.h |  1 +
 arch/arm/lib/cache.c          | 13 ++++++++++---
 cmd/cache.c                   |  3 +++
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/system.h b/arch/arm/include/asm/system.h
index 81ccead112..06fb458301 100644
--- a/arch/arm/include/asm/system.h
+++ b/arch/arm/include/asm/system.h
@@ -584,6 +584,7 @@ void mmu_set_region_dcache_behaviour(phys_addr_t start, size_t size,
 
 #ifdef CONFIG_SYS_NONCACHED_MEMORY
 void noncached_init(void);
+void noncached_set_region(void);
 phys_addr_t noncached_alloc(size_t size, size_t align);
 #endif /* CONFIG_SYS_NONCACHED_MEMORY */
 
diff --git a/arch/arm/lib/cache.c b/arch/arm/lib/cache.c
index 007d4ebc49..7f3cfb407c 100644
--- a/arch/arm/lib/cache.c
+++ b/arch/arm/lib/cache.c
@@ -73,6 +73,15 @@ static unsigned long noncached_start;
 static unsigned long noncached_end;
 static unsigned long noncached_next;
 
+void noncached_set_region(void)
+{
+#if !CONFIG_IS_ENABLED(SYS_DCACHE_OFF)
+	mmu_set_region_dcache_behaviour(noncached_start,
+					noncached_end - noncached_start,
+					DCACHE_OFF);
+#endif
+}
+
 void noncached_init(void)
 {
 	phys_addr_t start, end;
@@ -89,9 +98,7 @@ void noncached_init(void)
 	noncached_end = end;
 	noncached_next = start;
 
-#if !CONFIG_IS_ENABLED(SYS_DCACHE_OFF)
-	mmu_set_region_dcache_behaviour(noncached_start, size, DCACHE_OFF);
-#endif
+	noncached_set_region();
 }
 
 phys_addr_t noncached_alloc(size_t size, size_t align)
diff --git a/cmd/cache.c b/cmd/cache.c
index 27dcec0931..86fbaf8dd6 100644
--- a/cmd/cache.c
+++ b/cmd/cache.c
@@ -64,6 +64,9 @@ static int do_dcache(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
 			break;
 		case 1:
 			dcache_enable();
+#ifdef CONFIG_SYS_NONCACHED_MEMORY
+			noncached_set_region();
+#endif
 			break;
 		case 2:
 			flush_dcache_all();
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
