Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FE93338B3
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Mar 2021 10:27:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D05C0C57B77;
	Wed, 10 Mar 2021 09:27:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2226AC57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 09:27:41 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12A9R3qR016456; Wed, 10 Mar 2021 10:27:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=E8wCwaICoNXWo7oIpQ0bMzWPAC4fzl+gvoUkdS/IXuo=;
 b=AsuQ6b+d44uGXNGzSUFBtOIVtKpIdanpGWHYJKs5VT4ih9Np1ACBXOeGU/bTwaRpl9bK
 hBwqSBk3oIwSKi4aDPLHM24n02uCOr4yR+Y/GkN8bRVxkt+Ku6WZcznddvf1fkvnE5/t
 43dQz7wuaV1GbiL2xaI0xW/s9I3iy9dk4snVIIU5+BlYU11XWlcGInBs2bUBKdR20duY
 9G9FNBPuvtlE8+6k0Hc16Ydm/CMTfakdIxuFLN9UI9K57n87IBhZ4HNaqfNUzzjI8q73
 LweYSF+c07nrBLRixsDWvaQf2ZuqzDnNUrb9KseKCZJoo47AEWniNnz+K3Q72fb4UguZ IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 373yrequks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Mar 2021 10:27:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 56D9210002A;
 Wed, 10 Mar 2021 10:27:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EEA9822B1A2;
 Wed, 10 Mar 2021 10:27:29 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Mar 2021 10:27:29
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 10 Mar 2021 10:27:22 +0100
Message-ID: <20210310102719.1.Ieb141155065c9aaf05a0199ef688e1eb3ba0e621@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-10_07:2021-03-09,
 2021-03-10 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Lukasz Majewski <lukma@denx.de>, Takahiro Akashi <takahiro.akashi@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Alexander Graf <agraf@csgraf.de>, Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] dfu: dfu_mtd: remove the mtd_block_op error
	when mtd_lock is not supported
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

Fix the result of DFU_OP_WRITE operation in mtd_block_op function
when mtd_lock is not supported (-EOPNOTSUPP) to avoid DFU stack
error on the DFU manifestation of the MTD device, when
dfu_flush_medium_mtd is called.

Without this patch, dfu-util failed on dfuERROR state at the end
of the write operation on the alternate even if MTD write
opeartion is correctly performed.

$> dfu-util -a 3 -D test.bin
....
DFU mode device DFU version 0110
Device returned transfer size 4096
Copying data from PC to DFU device
....
Download	[=========================] 100%       225469 bytes
Download done.
state(10) = dfuERROR, status(14) = Something went wrong,
  but the device does not know what it was Done!

Fixes: 65f3fc18fc1e ("dfu_mtd: Add provision to unlock mtd device")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/dfu/dfu_mtd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dfu/dfu_mtd.c b/drivers/dfu/dfu_mtd.c
index ca67585a7e..ec40b8f6bb 100644
--- a/drivers/dfu/dfu_mtd.c
+++ b/drivers/dfu/dfu_mtd.c
@@ -150,7 +150,9 @@ static int mtd_block_op(enum dfu_op op, struct dfu_entity *dfu,
 		/* Write done, lock again */
 		debug("Locking the mtd device\n");
 		ret = mtd_lock(mtd, lock_ofs, lock_len);
-		if (ret && ret != -EOPNOTSUPP)
+		if (ret == -EOPNOTSUPP)
+			ret = 0;
+		else if (ret)
 			printf("MTD device lock failed\n");
 	}
 	return ret;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
