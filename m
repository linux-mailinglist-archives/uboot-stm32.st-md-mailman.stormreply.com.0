Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF1419D22A
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Apr 2020 10:28:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0ACC8C36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Apr 2020 08:28:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5480FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Apr 2020 08:28:54 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0338RGd0017486; Fri, 3 Apr 2020 10:28:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=T00ExUGVjgfoxlJajIZfoGjf44a+mUDbRcyFHj81ML0=;
 b=w7MEk00hey6K6N5FNFX0YhczVsebqZHmHwyNnG3nTiCBXrznI8GrD82VSepYeTRSaJ+9
 xCutv0dqQrxvONRoLRt78uPGmGhn5kgBuF4bzU28+21IKUen1WJhaCnRXMXBA7lD+J0U
 OC7s2tHK4BIQOtatKpIbdI2XnkytggbRkKl8l5ckF8W+jr3KRJwI/VPDkdYLXTPjjtsS
 2Iz/Ca8O1CUYrhPygMupoiQvhBqr8tccipayUb7XjjE1Kxw4klt9mbVj2LsfQQhXxVdp
 WDnXON8YA14pOw1KxwcbOeQJnpp1F6pBXUHz+rHnv3iNluMkmEVStbtwAo3/7MIE5B4W HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 302y54a4g2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Apr 2020 10:28:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A243710003B;
 Fri,  3 Apr 2020 10:28:50 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8E57921E68D;
 Fri,  3 Apr 2020 10:28:50 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 3 Apr 2020 10:28:50 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 3 Apr 2020 10:28:32 +0200
Message-ID: <20200403102815.1.I64599059b66bacb531db38c67273754a145dbad8@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE3.st.com
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
Subject: [Uboot-stm32] [PATCH 1/3] arm: caches: protect dram_bank_mmu_setup
	access to bi_dram
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
