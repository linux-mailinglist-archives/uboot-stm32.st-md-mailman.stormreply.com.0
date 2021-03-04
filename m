Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA36432D806
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Mar 2021 17:48:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9909EC57B53;
	Thu,  4 Mar 2021 16:48:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 246FEC56631
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Mar 2021 16:48:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 124GW6sS003446; Thu, 4 Mar 2021 17:48:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=zKXKvaXO1dk3XQWTokckBc3uYf5oIL2p7u2mIp6bCeM=;
 b=puOkueY2ANU4SgBIHz6hxeg2VeKTxd4JFN92JgaDcbUiXt3XbqKyQj2XJ1uPP4eReWNO
 tBatWEMqiOAwErqs8zJmwQXqogyw4urLPVYMAEqEp+44CMiHMkQsPFk3sz/iLTEYIulG
 W9KumoDExj7SvrkHdBOzjJaVfPJ811FDyK/QWuqqXgxB0gIufCmTYKXebpsdAeBgr7HN
 fK0d4fp0h6R2y/OIRXw01BCBqsBeqCdN/f3/ZqhFrbx4OQh5u/wd9I4oGCTyrV1/dt03
 c1q8hJsZVibevi9vexX9UjfrNew5grmYWXV9wsNRGl5YFemVDuhcYDQDFFfow89G8LrA Mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36yfdygpa7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 17:48:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D71AB10002A;
 Thu,  4 Mar 2021 17:48:02 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C3C92207588;
 Thu,  4 Mar 2021 17:48:02 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Mar 2021 17:48:02
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 4 Mar 2021 17:47:56 +0100
Message-ID: <20210304174748.1.I1d824180669d63e22275f082e7ac0fe50c2b8646@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-04_05:2021-03-03,
 2021-03-04 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: [Uboot-stm32] [PATCH] dfu: dfu_mtd: set max_buf_size to erasesize
	also for NOR devices
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

For NOR devices the logical DFU buffer size is the sector_size,
as it is done in dfu_sf.c or in spi/sf_mtd.c
(sf_mtd_info.erasesize = flash->sector_size)

For NAND the DFU size was already limited to erasesize as
has_pages = true.

So the mtd dfu backend can use this erasesize for all the MTD devices,
NOR and NAND with dfu->max_buf_size = mtd->erasesize

This difference was initially copied from MTD command, where
data is fully available in RAM without size limitation.

This patch avoids to have many sector write in dfu_mtd.c at the end
of the DFU transfer and avoids issues with USB timeout or WATCHDOG.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/dfu/dfu_mtd.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dfu/dfu_mtd.c b/drivers/dfu/dfu_mtd.c
index ca67585a7e..7efb3cbd79 100644
--- a/drivers/dfu/dfu_mtd.c
+++ b/drivers/dfu/dfu_mtd.c
@@ -252,7 +252,6 @@ int dfu_fill_entity_mtd(struct dfu_entity *dfu, char *devstr, char *s)
 {
 	char *st;
 	struct mtd_info *mtd;
-	bool has_pages;
 	int ret, part;
 
 	mtd = get_mtd_device_nm(devstr);
@@ -262,9 +261,7 @@ int dfu_fill_entity_mtd(struct dfu_entity *dfu, char *devstr, char *s)
 
 	dfu->dev_type = DFU_DEV_MTD;
 	dfu->data.mtd.info = mtd;
-
-	has_pages = mtd->type == MTD_NANDFLASH || mtd->type == MTD_MLCNANDFLASH;
-	dfu->max_buf_size = has_pages ? mtd->erasesize : 0;
+	dfu->max_buf_size = mtd->erasesize;
 
 	st = strsep(&s, " ");
 	if (!strcmp(st, "raw")) {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
