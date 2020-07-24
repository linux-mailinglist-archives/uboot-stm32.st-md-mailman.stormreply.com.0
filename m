Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7B922C21C
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Jul 2020 11:22:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7D12C36B25
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Jul 2020 09:22:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEBDFC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jul 2020 09:22:01 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06O9CaWO024633; Fri, 24 Jul 2020 11:21:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=GCdNgWBy58iMkpu1Vp5BaVQ3aEPb7jlzVlp1E8gf9Xg=;
 b=loR3Td+wwxWgX76K/z3DRV1aapgnak0UD9Up5W62rqW6m+SmG9lKYXxLHm3HlGv6zfLJ
 GmEiikSQ6npqN/kQu++f4r1wPs/PGNe6Eecw3ByroWbe+c3fKV+jsyAlVBPyrdBxpVVc
 FtO1btN+yan4hMjIevlJOTeFnjby7dCy0Cxk7/+kNA+HCP1RoGYagnQxU6X5fQ0Z1nEC
 phtwKqnKiEi9vqMILXE3YNZ7CVOotgsSfSMGN7oZTJZf0VLdk7zL0mrJ+w0/u4VpFPCz
 CTE+EfQAllz2sucFNUqzAYF0yKBe1PtPoa/yEUwYOGYQmnrjeuhviWAHoFQyqVcA9c2M 0g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32cux0sw1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 11:21:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 893B9100034;
 Fri, 24 Jul 2020 11:21:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7768921F690;
 Fri, 24 Jul 2020 11:21:58 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 24 Jul 2020 11:21:58 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 24 Jul 2020 11:21:51 +0200
Message-ID: <20200724092151.21335-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-24_02:2020-07-24,
 2020-07-24 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] stm32mp1: mmu_set_region_dcache_behaviour
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

Since commit d877f8fd0f09 ("arm: provide a function for boards init
code to modify MMU virtual-physical map") the parameter of
mmu_set_region_dcache_behaviour need to be MMU_SECTION_SIZE
aligned.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/cpu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index 56092c8bf6..b7fcee2b36 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -225,9 +225,10 @@ static void early_enable_caches(void)
 	dcache_enable();
 
 	if (IS_ENABLED(CONFIG_SPL_BUILD))
-		mmu_set_region_dcache_behaviour(STM32_SYSRAM_BASE,
-						STM32_SYSRAM_SIZE,
-						DCACHE_DEFAULT_OPTION);
+		mmu_set_region_dcache_behaviour(
+			ALIGN(STM32_SYSRAM_BASE, MMU_SECTION_SIZE),
+			round_up(STM32_SYSRAM_SIZE, MMU_SECTION_SIZE),
+			DCACHE_DEFAULT_OPTION);
 	else
 		mmu_set_region_dcache_behaviour(STM32_DDR_BASE, STM32_DDR_SIZE,
 						DCACHE_DEFAULT_OPTION);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
