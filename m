Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2104B6FAE
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Feb 2022 16:23:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F832C5F1F9;
	Tue, 15 Feb 2022 15:23:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4D6FC5F1F9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Feb 2022 15:23:37 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21FA8msC024927;
 Tue, 15 Feb 2022 16:23:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=wgTBgt0Kc2bHRa6mWxtkmWrCyRLJR6MFI0TrMNVPAxQ=;
 b=wVSroEzWJR7Qu3zvekGbhq52JAMyXIkVj15W2iOsoyFx984Nnovvjn/gRR0YiF4eGCO7
 QdmtNUCy+fGa3hnfNieIUd69An9Eu6X3MAtEJZuFW5j28gzP2gXjz389vkAW4xyex1Gx
 THntM3hfZ71aF3rg8hGzqUfH0wzIPs//Av89B/QEc/DVqEmtsUvh1ub4HUSeV5t28GDJ
 BjwH3/aPSpSYFnezBuo4sV6yWGx+x3DUTy84hF9KKiO4nlbiULzp+Ya+OJs0X2AzfPqM
 0inx/KkYW5+0VCHS/qSzNZyL8y+i/2eTF8O3yu4AnrOLe5NKo2OWDjz01+xVfAZQFXG6 jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e84wwkfrm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 16:23:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 36FC010002A;
 Tue, 15 Feb 2022 16:23:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2FD9822A6DF;
 Tue, 15 Feb 2022 16:23:30 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 15 Feb 2022 16:23:29
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 15 Feb 2022 16:23:22 +0100
Message-ID: <20220215162301.1.I5f92544259c3d1dad2df30c9d7762ec7860f07cf@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_04,2022-02-14_04,2021-12-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Peng Fan <peng.fan@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 1/2] mmc: fix error message for unaligned
	erase request
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

Fix the end address in the message for unaligned erase request in
mmc_berase() when start + blkcnt is aligned to erase_grp_size.

for example:
  - start = 0x2000 - 26
  - count = 26
  - erase_grp_size = 0x400

  Caution! Your devices Erase group is 0x400
  The erase range would be change to 0x2000~0x27ff

But no issue when the end address is not aligned, for example
  - start = 0x2000 - 2 * 26
  - count = 26
  - erase_grp_size = 0x400

  Caution! Your devices Erase group is 0x400
  The erase range would be change to 0x2000~0x23ff

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/mmc/mmc_write.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/mmc_write.c b/drivers/mmc/mmc_write.c
index d23b7d9729..eab94c7b60 100644
--- a/drivers/mmc/mmc_write.c
+++ b/drivers/mmc/mmc_write.c
@@ -102,7 +102,7 @@ ulong mmc_berase(struct blk_desc *block_dev, lbaint_t start, lbaint_t blkcnt)
 		       "The erase range would be change to "
 		       "0x" LBAF "~0x" LBAF "\n\n",
 		       mmc->erase_grp_size, start & ~(mmc->erase_grp_size - 1),
-		       ((start + blkcnt + mmc->erase_grp_size)
+		       ((start + blkcnt + mmc->erase_grp_size - 1)
 		       & ~(mmc->erase_grp_size - 1)) - 1);
 
 	while (blk < blkcnt) {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
