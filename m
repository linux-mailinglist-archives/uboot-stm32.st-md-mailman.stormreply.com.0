Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B74B8720328
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Jun 2023 15:23:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A764C6A617;
	Fri,  2 Jun 2023 13:23:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 825B2C6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jun 2023 13:23:37 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 352BZ8mc001363; Fri, 2 Jun 2023 15:23:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=Qg0fo5nf4N4Jrgt/oKk/AYaFk+JjHjs7IbA4guRXGhs=;
 b=2QP5GfZ4HXm+I7MX4Ruib52eDQzC4mSV5XgPufJv/msIDHLWjbMoydljkQfmjL+KApgB
 CpQ20UmSqxMQ6ktXLjt7lLS7jVrVw6HsWHUY7Xu2+ciD6gs4okuy/apKWDS91K+oNgKa
 xJSLI78rJ98qSsXGPo0kYuFHqmxKLr5P9pU7D2D6zpPaoPw6MmEaEZzjb0wD2KOZ0RLH
 +2K7twlTCf+2z1nv1I9awpS9+uCMFMmqh0eH5Wm4DOhCLNbUq9cj5r5UstK/Il9Iil9n
 EjYYOjakUMz3BM1Ln55x3TFfZ32xvKAiOOM6zOKFfX+YPtFuqt4NBZlsrpPKBtVzbY98 QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qweqepg2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jun 2023 15:23:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2F15C10002A;
 Fri,  2 Jun 2023 15:23:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1238A231538;
 Fri,  2 Jun 2023 15:23:29 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 2 Jun
 2023 15:23:28 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 2 Jun 2023 15:23:23 +0200
Message-ID: <20230602152232.v2.1.I20e8d74ea2ff0a99c6c741846b46af89c4ee136a@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_10,2023-06-02_02,2023-05-22_02
Cc: Christophe KERELLO <christophe.kerello@foss.st.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2] dfu: mtd: mark bad the MTD block on erase
	error
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

In the MTD DFU backend, it is needed to mark the NAND block bad when the
erase failed with the -EIO error, as it is done in UBI and JFFS2 code.

This operation is not done in the MTD framework, but the bad block
tag (in BBM or in BBT) is required to avoid to write data on this block
in the next DFU_OP_WRITE loop in mtd_block_op(): the code skip the bad
blocks, tested by mtd_block_isbad().

Without this patch, when the NAND block become bad on DFU write operation
- low probability on new NAND - the DFU write operation will always failed
because the failing block is never marked bad.

This patch also adds a test to avoid to request an erase operation on a
block already marked bad; this test is not performed in MTD framework
in mtd_erase().

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- fixe mtd_block_isbad offset parameter for erase check
- Add trace when bad block are skipped in erase loop
- Add remaining byte in trace "Limit reached"

 drivers/dfu/dfu_mtd.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/dfu/dfu_mtd.c b/drivers/dfu/dfu_mtd.c
index c7075f12eca9..a4a3e91be23e 100644
--- a/drivers/dfu/dfu_mtd.c
+++ b/drivers/dfu/dfu_mtd.c
@@ -86,27 +86,39 @@ static int mtd_block_op(enum dfu_op op, struct dfu_entity *dfu,
 
 		while (remaining) {
 			if (erase_op.addr + remaining > lim) {
-				printf("Limit reached 0x%llx while erasing at offset 0x%llx\n",
-				       lim, off);
+				printf("Limit reached 0x%llx while erasing at offset 0x%llx, remaining 0x%llx\n",
+				       lim, erase_op.addr, remaining);
 				return -EIO;
 			}
 
+			/* Skip the block if it is bad, don't erase it again */
+			if (mtd_block_isbad(mtd, erase_op.addr)) {
+				printf("Skipping bad block at 0x%08llx\n",
+				       erase_op.addr);
+				erase_op.addr += mtd->erasesize;
+				continue;
+			}
+
 			ret = mtd_erase(mtd, &erase_op);
 
 			if (ret) {
-				/* Abort if its not a bad block error */
-				if (ret != -EIO) {
-					printf("Failure while erasing at offset 0x%llx\n",
-					       erase_op.fail_addr);
-					return 0;
+				/* If this is not -EIO, we have no idea what to do. */
+				if (ret == -EIO) {
+					printf("Marking bad block at 0x%08llx (%d)\n",
+					       erase_op.fail_addr, ret);
+					ret = mtd_block_markbad(mtd, erase_op.addr);
+				}
+				/* Abort if it is not -EIO or can't mark bad */
+				if (ret) {
+					printf("Failure while erasing at offset 0x%llx (%d)\n",
+					       erase_op.fail_addr, ret);
+					return ret;
 				}
-				printf("Skipping bad block at 0x%08llx\n",
-				       erase_op.addr);
 			} else {
 				remaining -= mtd->erasesize;
 			}
 
-			/* Continue erase behind bad block */
+			/* Continue erase behind the current block */
 			erase_op.addr += mtd->erasesize;
 		}
 	}
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
