Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEA219D22B
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Apr 2020 10:28:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAE84C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Apr 2020 08:28:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 563BAC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Apr 2020 08:28:54 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0338RGd1017486; Fri, 3 Apr 2020 10:28:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=zYGoKxdFXgIiMg5AQKfMjwtqwcrIAXmDXy5YYOL29hc=;
 b=L0tOmEvBbci/NSEr8x2worzxI0AScXp6qK0L79JoVkjpx/4LmRoSHlWfyizTb5B7GwGB
 ROyp73tS+o05VaOfeyv+5H64Qd5iMQVXjEp8uiyN03LhLbUEnR6n9oUJ6zvOud+celXj
 Hq80JYeP1Bs+UE1krYzqU1y2do7QoHxX0vMYRaqKVLQ73GDK1+oqRLTzI8ZrawyKdtvt
 /QC1BLd+HHOg+ogXrrnkQYb13dySxQe6HYH40IRHcn9nywpneqURcVechu7IyHYvRDpj
 AfQYcVrwYkG5gWEJW5mSXsrMTmDukqTusU5ZX8cQNHT/VUGkhp6/t5/Jo1m1MdUwVkmD Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 302y54a4g6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Apr 2020 10:28:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3BFB0100039;
 Fri,  3 Apr 2020 10:28:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 279F621E68E;
 Fri,  3 Apr 2020 10:28:52 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 3 Apr 2020 10:28:51 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 3 Apr 2020 10:28:34 +0200
Message-ID: <20200403102815.3.Ic2c7c6923035711a4c653d52ae7c0f57ca6f9210@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200403102815.1.I64599059b66bacb531db38c67273754a145dbad8@changeid>
References: <20200403102815.1.I64599059b66bacb531db38c67273754a145dbad8@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-03_05:2020-04-02,
 2020-04-03 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Simon Glass <sjg@chromium.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Trevor Woerner <trevor@toganlabs.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 3/3] arm: caches: manage phys_addr_t overflow
	in mmu_set_region_dcache_behaviour
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

Detect and solve the overflow on phys_addr_t type for start + size in
mmu_set_region_dcache_behaviour() function.

This issue occurs for example with ARM32, start = 0xC0000000 and
size = 0x40000000: start + size = 0x100000000 and end = 0x0.

Overflow is detected when end < start.
In normal case the previous behavior is still used: when start is not
aligned on MMU section, the end address is only aligned after the sum
start + size.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/lib/cache-cp15.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/lib/cache-cp15.c b/arch/arm/lib/cache-cp15.c
index d15144188b..e5a7fd0ef4 100644
--- a/arch/arm/lib/cache-cp15.c
+++ b/arch/arm/lib/cache-cp15.c
@@ -63,6 +63,11 @@ void mmu_set_region_dcache_behaviour(phys_addr_t start, size_t size,
 
 	end = ALIGN(start + size, MMU_SECTION_SIZE) >> MMU_SECTION_SHIFT;
 	start = start >> MMU_SECTION_SHIFT;
+
+	/* phys_addr_t overflow detected */
+	if (end < start)
+		end = (~(phys_addr_t)0x0 >> MMU_SECTION_SHIFT) + 1;
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
