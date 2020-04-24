Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9391B7DBE
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Apr 2020 20:21:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FE50C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Apr 2020 18:21:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC3C0C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 18:21:03 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03OICsok025097; Fri, 24 Apr 2020 20:20:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=SP1WMkXdXFi/7kFq5SOdBJufClyW71StlW+Jw2Drz38=;
 b=oSi2CoAQJDdm7OlwcS7f+HN4Efc8po5vuXMyAP96p0lpqgXmKi6KLcS1be78wN9a8L/w
 A8cYMFeNxD2AuslFpYipcM9Od8KIOXODDa12f5E0/wARVzwhwCaTxaTvYROqETTIwx65
 z9PDaVijyP/If7ybooVe5GOeAYQYlJbYwJvnswN8H1f3i070kVpHg5XfsyP95i3GnSXE
 ex75QEpof4ShArvmyOGU2dfS1h7x8LjQMYa+VSZ88SSgmKEL9suMbT+B2N7A0wSjAI2G
 Z6dQCJU+2b1HDZRJiYwcBNRubkBGI4q3u1X6gcsNO3bHtZjW8ZQVxF94NW+Cn5NbJn4c rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30freh4sm3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 20:20:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F03F710002A;
 Fri, 24 Apr 2020 20:20:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E58A82CF9BE;
 Fri, 24 Apr 2020 20:20:57 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 24 Apr 2020 20:20:57 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 24 Apr 2020 20:20:15 +0200
Message-ID: <20200424201957.v2.1.I64599059b66bacb531db38c67273754a145dbad8@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200424182017.11852-1-patrick.delaunay@st.com>
References: <20200424182017.11852-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE3.st.com
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
Subject: [Uboot-stm32] [PATCH v2 1/3] arm: caches: protect
	dram_bank_mmu_setup access to bi_dram
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

Add protection in dram_bank_mmu_setup() to avoid access to bd->bi_dram
before relocation.

This patch allow to use the generic weak function dram_bank_mmu_setup
to activate the MMU and the data cache in SPL or in U-Boot before
relocation, when bd->bi_dram is not yet initialized.

In this cases, the MMU must be initialized explicitly with
mmu_set_region_dcache_behaviour function.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2: None

 arch/arm/lib/cache-cp15.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/lib/cache-cp15.c b/arch/arm/lib/cache-cp15.c
index f8d20960da..54509f11c3 100644
--- a/arch/arm/lib/cache-cp15.c
+++ b/arch/arm/lib/cache-cp15.c
@@ -91,6 +91,10 @@ __weak void dram_bank_mmu_setup(int bank)
 	bd_t *bd = gd->bd;
 	int	i;
 
+	/* bd->bi_dram is available only after relocation */
+	if ((gd->flags & GD_FLG_RELOC) == 0)
+		return;
+
 	debug("%s: bank: %d\n", __func__, bank);
 	for (i = bd->bi_dram[bank].start >> MMU_SECTION_SHIFT;
 	     i < (bd->bi_dram[bank].start >> MMU_SECTION_SHIFT) +
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
