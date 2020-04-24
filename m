Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D3D1B7DC1
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Apr 2020 20:21:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59B43C36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Apr 2020 18:21:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A9EBC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 18:21:09 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03OIDXSU028603; Fri, 24 Apr 2020 20:20:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=xzTkNteO6SifJuWz+8DYueEdQiuBVZ8uqLERX3Qb4Pg=;
 b=rHCgp8mu/xlxJKIclRk8ZVo4Ixyaytn+Fy6eOV5fSUyMyzGuZ6CKvemOuEEMB3tnmOu9
 Fnk0r0eF/x+nGN+eW+hlLZmJGSmT88rkksDj1vWP23SP8PfmnKq0ihTnhXYqiAsFsmGy
 Bok2cV8cONHfTikm4ampJ/xTU6szXFteBWHm0NgueUydGuoLTaYhSaey2E5y1YFx74OC
 6RyKRm4ispqwF1eC1WFLul32+bHqWKQ5ZrCr/fIwDIzoaeDsqMewsyquT/PyQRXg5ppP
 hm79Rf+1BPHpRcJ8+ZnY7/S+ffZDFp11Xg9hAuU9g6t11CiSm2PA/fcSDNYAWZNIYSa/ NQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fqawvh1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 20:20:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 667EB10002A;
 Fri, 24 Apr 2020 20:20:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B4C62CF9BD;
 Fri, 24 Apr 2020 20:20:59 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 24 Apr 2020 20:20:58 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 24 Apr 2020 20:20:17 +0200
Message-ID: <20200424201957.v2.3.Ic2c7c6923035711a4c653d52ae7c0f57ca6f9210@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200424182017.11852-1-patrick.delaunay@st.com>
References: <20200424182017.11852-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_09:2020-04-24,
 2020-04-24 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Simon Glass <sjg@chromium.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Trevor Woerner <trevor@toganlabs.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2 3/3] arm: caches: manage phys_addr_t
	overflow in mmu_set_region_dcache_behaviour
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

Solved the overflow on phys_addr_t type for start + size in
mmu_set_region_dcache_behaviour() function.

This overflow is avoided by dividing start and end by 2 before addition,
and we only expecting that start and size are even.

This patch doesn't change the current function behavior if the
parameters (start or size) are not aligned on MMU_SECTION_SIZE.

For example, this overflow occurs on ARM32 with:
start = 0xC0000000 and size = 0x40000000
then start + size = 0x100000000 and end = 0x0.

For information the function behavior change with risk of regression,
if we just shift start and size before the addition.
Example with 2MB section size:
  MMU_SECTION_SIZE 0x200000 and MMU_SECTION_SHIFT = 21
  with start = 0x1000000, size = 0x1000000,
  - with the proposed patch, start = 0 and end = 0x1 as previously
  - with the more simple patch:
    end = (start >> MMU_SECTION_SHIFT) + (size >> MMU_SECTION_SHIFT)
    the value of end change:
    start >> 21 = 0, size >> 21 = 0 and end = 0x0 !!!

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- update patch after Marek's proposal. but I just divided by 2 instead
  of 4kB (minimal MMU page size)

 arch/arm/lib/cache-cp15.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/lib/cache-cp15.c b/arch/arm/lib/cache-cp15.c
index d15144188b..f803d6fb8c 100644
--- a/arch/arm/lib/cache-cp15.c
+++ b/arch/arm/lib/cache-cp15.c
@@ -61,8 +61,11 @@ void mmu_set_region_dcache_behaviour(phys_addr_t start, size_t size,
 	unsigned long startpt, stoppt;
 	unsigned long upto, end;
 
-	end = ALIGN(start + size, MMU_SECTION_SIZE) >> MMU_SECTION_SHIFT;
+	/* div by 2 before start + size to avoid phys_addr_t overflow */
+	end = ALIGN((start / 2) + (size / 2), MMU_SECTION_SIZE / 2)
+	      >> (MMU_SECTION_SHIFT - 1);
 	start = start >> MMU_SECTION_SHIFT;
+
 #ifdef CONFIG_ARMV7_LPAE
 	debug("%s: start=%pa, size=%zu, option=%llx\n", __func__, &start, size,
 	      option);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
