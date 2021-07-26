Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FC73D56E3
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Jul 2021 11:55:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86938C597AB;
	Mon, 26 Jul 2021 09:55:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DAFEC57B6B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jul 2021 09:55:36 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16Q9prl5015334; Mon, 26 Jul 2021 11:55:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=bFyejVriSzFYl8Pqt4yEpSvAmr9sn5tHKShnppyGklg=;
 b=GUR373TpES+hO/dDeoq2dMHOqp14vYjHqUPP6PtmA12Q5Ocm3q3LdSXHLu5XhkI53i4E
 NAqVBkSDqWGs2b62qa1/j4NLddepRvwd3vB+ntnYCmxlTE4yu6/eWAdmAbOHOLbISEKB
 VMfKIpE1luaZNwJ9Zut2VkjN/sfzGrorqH/cul/5vWaEzlgTN+v6Q4KtxMEX0zLbZiqw
 cc2REy7GzCxnVhWCkZXWWafiKdD/D1mzJwMARh52HpXxJvdj6cp7BhXpoY82Rags+KWN
 syIvpA97o2OqbKDjeiIlyPaIdQH8EDeaHit+bYpgabCXjgNWFVmdh8jgwFLU+uEINa6o 1w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a1swgrbpx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Jul 2021 11:55:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B132D10002A;
 Mon, 26 Jul 2021 11:55:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 252B421B539;
 Mon, 26 Jul 2021 11:55:31 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 26 Jul 2021 11:55:30
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 26 Jul 2021 11:55:27 +0200
Message-ID: <20210726115518.1.I199b974cdcfac6b770c164eef50f53ea8ad02bc5@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-26_05:2021-07-26,
 2021-07-26 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Alexander Graf <agraf@csgraf.de>
Subject: [Uboot-stm32] [PATCH] stm32mp: correctly handle
	board_get_usable_ram_top(0)
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

The function board_get_usable_ram_top can to called after relocation
with total_size = 0 to get the uppermost pointer that is valid to access
in U-Boot.

When total_size = 0, the reserved memory should be not take in account
with lmb library and 'gd->ram_base + gd->ram_size' can be used.

It is the case today in lib/efi_loader/efi_memory.c:efi_add_known_memory()
and this patch avoids that the reserved memory for OP-TEE is not part of
the EFI available memory regions.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
Patch to correct the UEFI support for STM32MP platform
after Heinrich's remark on patch [1].

[1] efi_loader: replace board_get_usable_ram_top by gd->ram_top
http://patchwork.ozlabs.org/project/uboot/patch/20210709124630.1.I212e7cd96724368b8272300c59c2a1c1f227ed67@changeid/

 arch/arm/mach-stm32mp/dram_init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mach-stm32mp/dram_init.c b/arch/arm/mach-stm32mp/dram_init.c
index 3c097029bd..94f25f34e0 100644
--- a/arch/arm/mach-stm32mp/dram_init.c
+++ b/arch/arm/mach-stm32mp/dram_init.c
@@ -46,6 +46,9 @@ ulong board_get_usable_ram_top(ulong total_size)
 	phys_addr_t reg;
 	struct lmb lmb;
 
+	if (!total_size)
+		return gd->ram_base + gd->ram_size;
+
 	/* found enough not-reserved memory to relocated U-Boot */
 	lmb_init(&lmb);
 	lmb_add(&lmb, gd->ram_base, gd->ram_size);
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
