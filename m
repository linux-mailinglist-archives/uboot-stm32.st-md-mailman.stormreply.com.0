Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B491BB9FC
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Apr 2020 11:38:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 651FEC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Apr 2020 09:38:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6657C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 09:38:22 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03S9c8BN011941; Tue, 28 Apr 2020 11:38:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=6Jl8SYzUvlth9S8Ocr8ebeiBNoKAuIgVBWw4hOgkxAE=;
 b=Q14BoKeXN/8qMnCi/5/jLejxtZc0euOLSbWzM2+uFhNcn7jU1JtnHnsOaf7nSvSIiITa
 eJAsQRPgAwLoGqnReoHtH910bYG8IPJ4EK6u0/HQz179w2VXz5m3iV7F5CjXW6BASTRi
 4oNFQwSGpegF6a3Ck/dXcutlZiEaNDywMEDZy643rllyaE8rriOLoJeKGbWapwiFJ4mn
 2I5SlDERrtSSdN5dsBXB+TO42xOnXYmSqH0NA53VuflWiyJB3IRpMd0zRJJs9imh/tAZ
 EizdIWnOGZjYPuLz5yZu5q8GX1Bm+BZkh3oKPCUGkuTqflyLbEwVxG3f+4pYPWQUyYNJ QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30n4j5tyu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 11:38:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3151810002A;
 Tue, 28 Apr 2020 11:38:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1A9872A7302;
 Tue, 28 Apr 2020 11:38:11 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Apr 2020 11:38:10 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 28 Apr 2020 11:38:03 +0200
Message-ID: <20200428093804.20773-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-28_05:2020-04-27,
 2020-04-28 signatures=0
Cc: Marek Vasut <marex@denx.de>, Stephen Warren <swarren@nvidia.com>,
 Simon Glass <sjg@chromium.org>, Ovidiu Panait <ovpanait@gmail.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, Eric Perie <eric.perie@yahoo.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Trevor Woerner <trevor@toganlabs.com>, Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2] cmd: cache: Fix non-cached memory
	cachability
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

Introduce noncached_set_region() to set this non-cached region's mmu
settings. Let architecture override it by defining it as a weak
function.

For ARM architecture, noncached_set_region() defines all noncached
region as non-cacheable.

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

Changes in v2:
    - make noncached_set_region a weak function

 arch/arm/lib/cache.c | 13 ++++++++++---
 cmd/cache.c          |  5 +++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/arm/lib/cache.c b/arch/arm/lib/cache.c
index 44dde26065..224f2aef14 100644
--- a/arch/arm/lib/cache.c
+++ b/arch/arm/lib/cache.c
@@ -75,6 +75,15 @@ static unsigned long noncached_start;
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
@@ -91,9 +100,7 @@ void noncached_init(void)
 	noncached_end = end;
 	noncached_next = start;
 
-#if !CONFIG_IS_ENABLED(SYS_DCACHE_OFF)
-	mmu_set_region_dcache_behaviour(noncached_start, size, DCACHE_OFF);
-#endif
+	noncached_set_region();
 }
 
 phys_addr_t noncached_alloc(size_t size, size_t align)
diff --git a/cmd/cache.c b/cmd/cache.c
index 27dcec0931..7678615dd8 100644
--- a/cmd/cache.c
+++ b/cmd/cache.c
@@ -20,6 +20,10 @@ void __weak invalidate_icache_all(void)
 	puts("No arch specific invalidate_icache_all available!\n");
 }
 
+__weak void noncached_set_region(void)
+{
+}
+
 static int do_icache(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
 {
 	switch (argc) {
@@ -64,6 +68,7 @@ static int do_dcache(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
 			break;
 		case 1:
 			dcache_enable();
+			noncached_set_region();
 			break;
 		case 2:
 			flush_dcache_all();
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
