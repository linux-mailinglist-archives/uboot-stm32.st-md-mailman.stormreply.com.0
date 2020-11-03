Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF982A43A9
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Nov 2020 12:02:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 326DCC36B35;
	Tue,  3 Nov 2020 11:02:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93187C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Nov 2020 11:02:13 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A3B1n9W013545; Tue, 3 Nov 2020 12:02:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=9RHd5yJL++7vv5tir1QrVRjdKA0jzlWdk+pLyJdLpD8=;
 b=ELshRTv3ToD/gbTWn8dtoDFrdXcGYTm7i9QYAz80JKllWcGJD6GaOhA0fJLVHcDaKBls
 5lB109LoUbClATByH3aEy6LehukapGw+k2Vz1kZxRMA2lvhO+fQa6u4dAfxZXdylRzcO
 +Ug2MKJxU+ZPCNw9rgMo+feyBgT72kvM0e9NE3uzlXykMB3D3vp+jezg7LtoNYx31vX7
 OojVLQIWQBn1ELdx0+arxPqXvPcARqz18r3i34IyEBYTjjUi4O/m/RRXeXxKPEHLYAcV
 vNF0e71HrDz9cOavZJLLyJ6AycpMSCYqRB4cn0Jv51vTYKkWxPxo1j6DRy/af1Ihv/4w RA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gywqrv4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Nov 2020 12:02:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5C60E100034;
 Tue,  3 Nov 2020 12:01:59 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4BFCB2461E9;
 Tue,  3 Nov 2020 12:01:59 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov 2020 12:01:15
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 3 Nov 2020 12:01:10 +0100
Message-ID: <20201103120047.1.I30ef60ea8b13322a6ec7b675dc2de5f63f336fc3@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-03_07:2020-11-03,
 2020-11-03 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Uboot-stm32] [PATCH 1/4] arm: cache-cp15: add error when region is
	not aligned on MMU_SECTION
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

Since commit d877f8fd0f09 ("arm: provide a function for boards init code to
modify MMU virtual-physical map"), the mmu_set_region_dcache_behaviour_phys
parameter need to be aligned on MMU_SECTION_SIZE to avoid unpredictable
behavior (alignment was done previously done in the function
mmu_set_region_dcache_behaviour_phys).

This patch raised a error when this alignment is not respected.
Even if this function is called so early, this  message can be printed
when CONFIG_DEBUG_UART is activated or can be treated later with
CONFIG_PRE_CONSOLE_BUFFER.

CC: Marek Szyprowski <m.szyprowski@samsung.com>

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---
See complete analysis in comment #3 of patch [1]
For example of workaround patch already sent see [2]

[1] http://patchwork.ozlabs.org/project/uboot/patch/20200603124345.18595-4-m.szyprowski@samsung.com/#2490603
[2] stm32mp1: mmu_set_region_dcache_behaviour
    http://patchwork.ozlabs.org/project/uboot/patch/20200724092151.21335-1-patrick.delaunay@st.com/


 arch/arm/lib/cache-cp15.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/lib/cache-cp15.c b/arch/arm/lib/cache-cp15.c
index abd81d21c7..e2efe6f244 100644
--- a/arch/arm/lib/cache-cp15.c
+++ b/arch/arm/lib/cache-cp15.c
@@ -68,6 +68,11 @@ void mmu_set_region_dcache_behaviour_phys(phys_addr_t start, phys_addr_t phys,
 	unsigned long startpt, stoppt;
 	unsigned long upto, end;
 
+	if (!IS_ALIGNED(start, MMU_SECTION_SIZE) ||
+	    !IS_ALIGNED(size, MMU_SECTION_SIZE))
+		log_err("%s: start=%p or size =%zx is not aligned with MMU_SECTION_SIZE (%x)\n",
+			__func__, (void *)start, size, MMU_SECTION_SIZE);
+
 	/* div by 2 before start + size to avoid phys_addr_t overflow */
 	end = ALIGN((start / 2) + (size / 2), MMU_SECTION_SIZE / 2)
 	      >> (MMU_SECTION_SHIFT - 1);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
