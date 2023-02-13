Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C61C1694DFA
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Feb 2023 18:30:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F4FDC69069;
	Mon, 13 Feb 2023 17:30:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1F02C69066
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Feb 2023 17:30:18 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DF1TKB002817; Mon, 13 Feb 2023 18:30:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=0YsQQzuFI7cRqQLMdTmgH53AkHD+QET38RkuIWwTGDk=;
 b=5wLp+x8AllEEj9pfbUz979uXJ6U+NifuNfQZvhqULJ7oKAVmKVMiHpEcJGtJDX/dFg9u
 3W8Sx0z/rvnjYUxQuGbtzgmQjUpyAJ0zhNL9kIDy6d98s+ItVFaJEala50TODASnsD2c
 mjYOAkMogJctTQ3Sx7hHF5GJS/TpEIN0FLWJVohD3MH47x2raXtTnEuEOgh3m/+VTic5
 z5kxoZHEi4RRIKlFYrCJluI69GDF53YSYqsVD96k2phcPFSfDkieXWjgo4Hg8i4vPf+x
 DgrXNjDSwh3oX354l83ufkopNm21CLFMoblTkkVI0601bKJOyVhMJXq8JlIGl07CTogm bA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3np1aq3wux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 18:30:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F007110002A;
 Mon, 13 Feb 2023 18:30:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DF3AA22F7D3;
 Mon, 13 Feb 2023 18:30:06 +0100 (CET)
Received: from localhost (10.252.8.188) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 13 Feb
 2023 18:30:06 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 13 Feb 2023 18:30:04 +0100
Message-ID: <20230213173005.913823-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.8.188]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_11,2023-02-13_01,2023-02-09_01
Cc: Boris Brezillon <bbrezillon@kernel.org>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Stefan Roese <sr@denx.de>,
 Jagan Teki <jagan@openedev.com>, Peter Pan <peterpandong@micron.com>
Subject: [Uboot-stm32] [PATCH] mtd: spinand: Fix display of unknown raw ID
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

In case ID is not found in manufacturer table, the raw ID is
printed using %*phN format which is not supported by lib/vsprintf.c.
The information displayed doesn't reflect the raw ID return by the
unknown spi-nand.

Use %02x format instead, as done in spi-nor-core.c.

For example, before this patch:
  ERROR: spi-nand: spi_nand flash@0: unknown raw ID f74ec040
after
  ERROR: spi-nand: spi_nand flash@0: unknown raw ID 00 c2 26 03

Fixes: 0a6d6bae0386 ("mtd: nand: Add core infrastructure to support SPI NANDs")

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/mtd/nand/spi/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 134bf22c805..70d8ae531ee 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -979,8 +979,9 @@ static int spinand_detect(struct spinand_device *spinand)
 
 	ret = spinand_manufacturer_detect(spinand);
 	if (ret) {
-		dev_err(spinand->slave->dev, "unknown raw ID %*phN\n",
-			SPINAND_MAX_ID_LEN, spinand->id.data);
+		dev_err(spinand->slave->dev, "unknown raw ID %02x %02x %02x %02x\n",
+			spinand->id.data[0], spinand->id.data[1],
+			spinand->id.data[2], spinand->id.data[3]);
 		return ret;
 	}
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
