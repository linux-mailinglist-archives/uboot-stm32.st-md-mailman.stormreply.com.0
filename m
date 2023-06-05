Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AA572201D
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 Jun 2023 09:52:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0D5BC6A5FB;
	Mon,  5 Jun 2023 07:52:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D12F9C03FC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jun 2023 07:52:22 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3555nS0e025134; Mon, 5 Jun 2023 09:52:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=YZJ5bSMLZPXT+d0qldGWTs1H2RMoy0c+twsK7elWouQ=;
 b=J/VgmuC/xPc/fpacOjMb710Bqq220CO0L0l/VC/u8P9OKSYGiJtch7F9C/rEE9btbk53
 Mo87zKTDlgPSlZr6JUuV+tcJtYNgX0Z1k6fgeuMuLpsyNQHqT0xBWYh6lLiZyPlKMNhc
 X0S9dZNPqxQmY1eda4MhUtDiBPb92lYxWvLipJ+gG763yAcuEup/0bHcsLnLdP+xyft2
 53oE3opVOMFpDFAEZvnAeaCoVfxmFhoLrAMyuSpaUGIMmPfXuZJoPlA1lvMRIp8i88av
 6yZNwHmkAkoGWuZrXSpfualFG15xzrMrJjk8XMGS1BuSv0ysnyc/05jJGMcCJAfJM6tJ Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r19w98pwh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Jun 2023 09:52:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 167F3100038;
 Mon,  5 Jun 2023 09:52:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0ED7420F55C;
 Mon,  5 Jun 2023 09:52:11 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 5 Jun
 2023 09:52:10 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 5 Jun 2023 09:52:07 +0200
Message-ID: <20230605095147.v3.1.I442ff110f3340ab844d07bfaa40ad621f1217b03@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230605075208.55221-1-patrick.delaunay@foss.st.com>
References: <20230605075208.55221-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-03_08,2023-06-02_02,2023-05-22_02
Cc: Christophe KERELLO <christophe.kerello@foss.st.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 1/2] dfu: mtd: fix the trace when limit is
	reached
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

The offset variable = 'off' used in the error trace when limit is reach
on erase operation is incorect as 'erase_op.addr' is used in the loop.
This patch corrects the copy paste issue between the erase loop and
the write loop.

This patch also adds the 'remaining' information to allow to debug of
limit issues.

Fixes: 6015af28ee6d ("dfu: add backend for MTD device")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 drivers/dfu/dfu_mtd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dfu/dfu_mtd.c b/drivers/dfu/dfu_mtd.c
index c7075f12eca9..b764f091786d 100644
--- a/drivers/dfu/dfu_mtd.c
+++ b/drivers/dfu/dfu_mtd.c
@@ -86,8 +86,8 @@ static int mtd_block_op(enum dfu_op op, struct dfu_entity *dfu,
 
 		while (remaining) {
 			if (erase_op.addr + remaining > lim) {
-				printf("Limit reached 0x%llx while erasing at offset 0x%llx\n",
-				       lim, off);
+				printf("Limit reached 0x%llx while erasing at offset 0x%llx, remaining 0x%llx\n",
+				       lim, erase_op.addr, remaining);
 				return -EIO;
 			}
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
