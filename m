Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA20310B63
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Feb 2021 13:53:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09F4DC57B54;
	Fri,  5 Feb 2021 12:53:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3C11C57B51
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 12:53:55 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 115CRRbA015917; Fri, 5 Feb 2021 13:53:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=tNfOLzKfFCMmVD/fTh4+BBD7OJFv0TGN2Q96xm9+A20=;
 b=YxShh2WgNDVQUFl3J7VWCLIVLB+rZsYfUdHxnKsvdUbkKMDXl9dvpCeO3I7/mvPOwwEX
 CfYb4JKhPaUdXSWrYKNv1nCISafcAVx7pYKMlgpYhbrSTkwCgh3agK2Sg3gaCULk5eBB
 G/oD2/I3PlabN9qX00hcxdMhev5XoeQgrX7srFFWrw5BZwYZbektwTU3EO6tK0XfB3rB
 cooeBBNq9HFJmCoQy7cfQ9uz1oJww5mFy/Cj0YGgNKcagvjU7sohbbygCnRNlQqbK/Mg
 F+Vo+oZCyxB/TMfm/0/qUnV//cOapE7kiJTuh+847ha5AKklbWwz3tZGTubZ6Fb6plDH 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36h1kea2s4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 13:53:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 46F1B10002A;
 Fri,  5 Feb 2021 13:53:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3DAEA230A83;
 Fri,  5 Feb 2021 13:53:46 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb 2021 13:53:45
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 5 Feb 2021 13:53:36 +0100
Message-ID: <20210205135332.5.I7ab5a1fc95ca9fae01a4ec194a67374ba6872638@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210205125339.24721-1-patrick.delaunay@foss.st.com>
References: <20210205125339.24721-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_07:2021-02-05,
 2021-02-05 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Uboot-stm32] [PATCH 5/8] arm: cp15: update DACR value to activate
	access control
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

Update the initial value of Domain Access Control Register (DACR)
and set by default the access permission to client (DACR_Dn_CLIENT = 1U)
for each of the 16 domains and no more to all-supervisor
(DACR_Dn_MANAGER = 3U).

This patch allows to activate the domain checking in MMU against the
permission bits in the translation tables and avoids prefetching issue
on ARMv7 [1].

Today it was already done for OMAP2 architecture
./arch/arm/mach-omap2/omap-cache.c::arm_init_domains
introduced by commit de63ac278cba ("ARM: mmu: Set domain permissions
to client access") which fixes lot of speculative prefetch aborts seen
on OMAP5 secure devices.

[1] https://developer.arm.com/documentation/ddi0406/b/System-Level-Architecture/Virtual-Memory-System-Architecture--VMSA-/Memory-access-control/The-Execute-Never--XN--attribute-and-instruction-prefetching

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reported-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/lib/cache-cp15.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/lib/cache-cp15.c b/arch/arm/lib/cache-cp15.c
index abd81d21c7..f78ce33b18 100644
--- a/arch/arm/lib/cache-cp15.c
+++ b/arch/arm/lib/cache-cp15.c
@@ -202,9 +202,12 @@ static inline void mmu_setup(void)
 	asm volatile("mcr p15, 0, %0, c2, c0, 0"
 		     : : "r" (gd->arch.tlb_addr) : "memory");
 #endif
-	/* Set the access control to all-supervisor */
+	/*
+	 * initial value of Domain Access Control Register (DACR)
+	 * Set the access control to client (1U) for each of the 16 domains
+	 */
 	asm volatile("mcr p15, 0, %0, c3, c0, 0"
-		     : : "r" (~0));
+		     : : "r" (0x55555555));
 
 	arm_init_domains();
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
