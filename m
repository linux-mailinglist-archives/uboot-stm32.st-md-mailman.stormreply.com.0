Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE3D2A5F53
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Nov 2020 09:22:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41DFDC36B35;
	Wed,  4 Nov 2020 08:22:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 692EBC36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Nov 2020 08:22:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A48JSZP006255; Wed, 4 Nov 2020 09:22:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=57XwekbNHR7nzVOb6YnYDlYPKm/7OLueyBSBYaBtfxs=;
 b=w2hW6eOW7jYegyilhm0AX26SdY5oTWu9ccbBPCaeDMF4B0Jspf7dVnR59fKAq2XNyEAT
 yEfeABjOtOlu7FdxweWiqGV06fE8Uy2f8+DBQzwiOd0bJ3uKis2aM4yZT6vk5M01SxC/
 pEYj5eei/LDR1eYNFgObVcctxGySJw7/smcW32P+H8vGItnC34HjAgrL3n78h28PnuVU
 hcIjHc+vN9lw+7D3ZmLakq7XA6LAAAKAF0B9d4SWumN8gH4eXGut+gR82qE4uLOpYipe
 Wf8/UROiheT/PRzS7DgjT+HBClxmG1xiTqG/BKtZPZOgzPP4r+G/0bPYDdxYP9ZFTryT Sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gywqy0vv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Nov 2020 09:22:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1786F100034;
 Wed,  4 Nov 2020 09:22:36 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F33AB2322FF;
 Wed,  4 Nov 2020 09:22:35 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 4 Nov 2020 09:22:11
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 4 Nov 2020 09:22:09 +0100
Message-ID: <20201104082209.6424-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-04_06:2020-11-04,
 2020-11-04 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] arm: stm32mp: correct the ALIGN macro usage
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

Correct the ALIGN macro usage in mmu_set_region_dcache_behaviour
call: the address must use ALIGN_DOWN and size can use ALIGN macro.

With STM32_SYSRAM_BASE=0x2FFC0000 and MMU_SECTION_SIZE=0x100000 for
STM32MP15x the computed address was 30000000 instead of 2ff00000.

Fixes: 43fe9d2fda24 ("stm32mp1: mmu_set_region_dcache_behaviour")
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index 6785ab6b58..1520c6eaed 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -226,8 +226,8 @@ static void early_enable_caches(void)
 
 	if (IS_ENABLED(CONFIG_SPL_BUILD))
 		mmu_set_region_dcache_behaviour(
-			ALIGN(STM32_SYSRAM_BASE, MMU_SECTION_SIZE),
-			round_up(STM32_SYSRAM_SIZE, MMU_SECTION_SIZE),
+			ALIGN_DOWN(STM32_SYSRAM_BASE, MMU_SECTION_SIZE),
+			ALIGN(STM32_SYSRAM_SIZE, MMU_SECTION_SIZE),
 			DCACHE_DEFAULT_OPTION);
 	else
 		mmu_set_region_dcache_behaviour(STM32_DDR_BASE,
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
