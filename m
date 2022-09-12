Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC0D5B5D6D
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Sep 2022 17:41:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8974DC04004;
	Mon, 12 Sep 2022 15:41:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FAA4C04003
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Sep 2022 15:41:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28CDuxPb018008;
 Mon, 12 Sep 2022 17:41:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=DdgTXYOMSKTJUl9v0X7c8rF3KZ1hRrOOtL3tTHF6eck=;
 b=OGnNHRo0q5FutRujuIbJGjNdPwdh+6Q7c4Krge/OXyIYLJerLFBzY5aeo4TE2fzJM7Rn
 bo/GFLI9qkRyL9Fn8VYG/1fIDy+Q2rhJbqLxgse1zl7hIxsFF+RmzweDVUlxh+AB8lpe
 a71qsfPqLVSTSdpFY+B+h2nJG2qtLfnH4bVe7uZyOdDLuHRZODjLzShgWOLPAyDfpIH5
 /UiqyyN0nwtaCaWVkc0urWq7q+8nFQ8WzLZ3izVtIjeBaXQ54KO3FnDSZ/ez8GU3SKtE
 ALWJFrXVQ4ueZOLnrEW7H5Ja6wCgyF4Xp/t7tu5Egaq5DorHYI8pL+bk4pM8jfB7CfcE tA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jgjvjus6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 17:41:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7348B10002A;
 Mon, 12 Sep 2022 17:41:02 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5D8FE23BE08;
 Mon, 12 Sep 2022 17:41:02 +0200 (CEST)
Received: from localhost (10.75.127.49) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 12 Sep
 2022 17:40:58 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 12 Sep 2022 17:40:50 +0200
Message-ID: <20220912174045.1.Iae28ab1a0be932b26f9cf8b17d870508efa88b79@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_10,2022-09-12_02,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>
Subject: [Uboot-stm32] [PATCH] board: st: stm32mp1: use of correct
	compatible string to add partitions
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

From: Christophe Kerello <christophe.kerello@foss.st.com>

Current compatible string used to update SPI NAND and SPI NOR devices
can lead to a wrong partitions update (for example, SPI NAND partitions
added to SPI NOR node in the device tree). To avoid this wrong behavior,
use jedec,spi-nor compatible string for SPI NOR devices and spi-nand
compatible string for SPI NAND devices.

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 board/st/stm32mp1/stm32mp1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 8c162b42a59..7dc26f850ff 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -898,8 +898,8 @@ int mmc_get_env_dev(void)
 int ft_board_setup(void *blob, struct bd_info *bd)
 {
 	static const struct node_info nodes[] = {
-		{ "st,stm32f469-qspi",		MTD_DEV_TYPE_NOR,  },
-		{ "st,stm32f469-qspi",		MTD_DEV_TYPE_SPINAND},
+		{ "jedec,spi-nor",		MTD_DEV_TYPE_NOR,  },
+		{ "spi-nand",			MTD_DEV_TYPE_SPINAND},
 		{ "st,stm32mp15-fmc2",		MTD_DEV_TYPE_NAND, },
 		{ "st,stm32mp1-fmc2-nfc",	MTD_DEV_TYPE_NAND, },
 	};
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
