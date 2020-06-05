Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DADB31EF1F4
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jun 2020 09:24:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4BD1C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jun 2020 07:24:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 361C4C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2020 07:24:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0557MAC2028595; Fri, 5 Jun 2020 09:24:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=xdf8/xf1jjkwTxMO01HOAplIhJv0VJMKS1T4I/C4UOU=;
 b=1Y9syMFEX4mTlXw8Km/hWIayV2GN8WjqdEXDzONtBJk/7GNYMu1VteQj3WtadCzkznpu
 agk8+WiCw+/nCILeNTfxBPw0+ZBzHx1v4u3hkZPUfY1WMVeIfyWvVEw4IaAzx7r44m5c
 1c1dag3mmDaQBkLspzXfkUxvoNltdy9nolUh6nHgtX/gIKEwjSOJ+ujEAtaMoXbtV3Vf
 Sq8gtoLBINn0dhkmaZkwE+bMmWUJu3kW7aHXMcQqhVQjpHt2s5LMn17xhk3VjLq9kGzj
 hxR6scCCRk4uukyzoTyhkzHa2eHg4qc1GqV/4A/IKUluTRXrCM7ht0gR+k6f7yz4uLFH ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31fasesqhq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jun 2020 09:24:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 49F6710002A;
 Fri,  5 Jun 2020 09:24:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3EE582A7E6D;
 Fri,  5 Jun 2020 09:24:38 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 5 Jun 2020 09:24:37 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 5 Jun 2020 09:24:29 +0200
Message-ID: <20200605092427.1.I393865d4202eca31c111da33b792596f130b73d2@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-05_01:2020-06-04,
 2020-06-05 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/2] board: stm32mp1: fix handling of DT
	OP-TEE reserved memory nodes
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

From: Etienne Carriere <etienne.carriere@linaro.org>

Fix the sequence in stm32mp1 fdt.c that disables OP-TEE resources
defined in FDT when U-boot detects OP-TEE firmware is not present.

Before this change, helper function stm32_fdt_disable_optee()
set property status to "disabled" for the OP-TEE reserved memory
nodes but this has no impact since Linux kernel does not consider
the status property for reserved-memory subnodes. This change
make U-Boot to attempt to delete the node instead.

Fixes: 4a1b975dac02 ("board: stm32mp1: reserve memory for OP-TEE in device tree")
Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/fdt.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-stm32mp/fdt.c b/arch/arm/mach-stm32mp/fdt.c
index c723b223e0..959f12efe1 100644
--- a/arch/arm/mach-stm32mp/fdt.c
+++ b/arch/arm/mach-stm32mp/fdt.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
 /*
- * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
+ * Copyright (C) 2019-2020, STMicroelectronics - All Rights Reserved
  */
 
 #include <common.h>
@@ -224,19 +224,23 @@ static void stm32_fdt_disable_optee(void *blob)
 {
 	int off, node;
 
+	/* Delete "optee" firmware node */
 	off = fdt_node_offset_by_compatible(blob, -1, "linaro,optee-tz");
 	if (off >= 0 && fdtdec_get_is_enabled(blob, off))
-		fdt_status_disabled(blob, off);
+		fdt_del_node(blob, off);
 
-	/* Disabled "optee@..." reserved-memory node */
+	/* Delete "optee@..." reserved-memory node */
 	off = fdt_path_offset(blob, "/reserved-memory/");
 	if (off < 0)
 		return;
 	for (node = fdt_first_subnode(blob, off);
 	     node >= 0;
 	     node = fdt_next_subnode(blob, node)) {
-		if (!strncmp(fdt_get_name(blob, node, NULL), "optee@", 6))
-			fdt_status_disabled(blob, node);
+		if (strncmp(fdt_get_name(blob, node, NULL), "optee@", 6))
+			continue;
+
+		if (fdt_del_node(blob, node))
+			printf("Failed to remove optee reserved-memory node\n");
 	}
 }
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
