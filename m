Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3393E2FD15B
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Jan 2021 14:42:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3FF9C3FADA;
	Wed, 20 Jan 2021 13:42:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86C3BC3FADB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Jan 2021 13:42:23 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10KDeokr022072; Wed, 20 Jan 2021 14:42:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=oeQUzES+kXBnBo7Ps7etR98I9BOS4b3PuXoVNnKu3E4=;
 b=Lj/I+44N8Qoi/jXkpu34y/iGrw0b4o5IAcZLvjL963My+72crEWDMWdBMjrWRJkCm0l6
 MwiPi/R1SBo9jVkiWULMHb5DBKG1qRJQ+EZOk8LRh3LEm6zMzCiUv56MoPfooxYxYSWu
 wdkUkeIbR8YzZxNczgBdOvd8szdU9jyXKgg+xOaLCgshTEXoY7vOcxA0gFcyVahN76aG
 NBtv8aHxMx1mYkqKD2cbDPzn+rgnt080EvotVooYVWlCyv0dDshvW9fjVi4DqiBoRPHI
 FV2TLrT8615ywvSZ/17xUWYVz6qca57BQaKGtVgUNhla99BU/cncQ85SEn59dPZLCj1s JQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3668p4vt73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 14:42:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E27A210002A;
 Wed, 20 Jan 2021 14:42:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D9F23250725;
 Wed, 20 Jan 2021 14:42:21 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 Jan 2021 14:42:20
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 20 Jan 2021 14:42:03 +0100
Message-ID: <20210120134205.30488-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210120134205.30488-1-patrice.chotard@foss.st.com>
References: <20210120134205.30488-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-20_05:2021-01-20,
 2021-01-20 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 3/4] mtd: nand: Add WATCHDOG_RESET() in
	nanddev_mtd_erase()
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

In case of big area erased on nand, watchdog timeout may occurs.
To fix that, add WATCHDOG_RESET() in nanddev_mtd_erase() to ensure that
watchdog is reset.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/mtd/nand/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/core.c b/drivers/mtd/nand/core.c
index 3abaef23c5..ec11bf44f8 100644
--- a/drivers/mtd/nand/core.c
+++ b/drivers/mtd/nand/core.c
@@ -10,6 +10,7 @@
 #define pr_fmt(fmt)	"nand: " fmt
 
 #include <common.h>
+#include <watchdog.h>
 #ifndef __UBOOT__
 #include <linux/module.h>
 #endif
@@ -162,6 +163,7 @@ int nanddev_mtd_erase(struct mtd_info *mtd, struct erase_info *einfo)
 	nanddev_offs_to_pos(nand, einfo->addr, &pos);
 	nanddev_offs_to_pos(nand, einfo->addr + einfo->len - 1, &last);
 	while (nanddev_pos_cmp(&pos, &last) <= 0) {
+		WATCHDOG_RESET();
 		ret = nanddev_erase(nand, &pos);
 		if (ret) {
 			einfo->fail_addr = nanddev_pos_to_offs(nand, &pos);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
