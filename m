Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B57C94E21C3
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Mar 2022 09:13:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F6B8C5E2C2;
	Mon, 21 Mar 2022 08:13:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC2C9C57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Mar 2022 08:13:55 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22L80pAF006151;
 Mon, 21 Mar 2022 09:13:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=z+EeasMqWh7qZ6v6OigFck14QXo3AWNGryMtz2eKRlM=;
 b=zQTw0rH9rdGzR9At1XLeKQ9q36ebCMAUea3rEOqiMpIj5GvbCESoCz9IpKluL6ASGaHM
 L+J/ZoReKPDGChr8SqWOjWuw4sYuF6G0toTm/21eNSB1/PlHUrH/TV8qxnZhM/kGNIOn
 UBoJ7cPEKTz0GIylgeCxKFr/eFKnXVaUkscOQ5aZ0macicYmj4a2mI3nci4y3JBKLtHi
 sugK+Rwboqktq6F7hxzdxdnkkVSz+5f7oLl9sQFMl6T5jVMFi1u1stO+/NGGpt3pZxwZ
 W/cKWcu8QnM3wPjT14pj7R1YSbQKfUbEgVVNh/Ym42UPM0larVrmBjylLHRGsmFBkWHy /Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ew7d405m4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 09:13:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 64264100034;
 Mon, 21 Mar 2022 09:13:46 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 59E1B212FC4;
 Mon, 21 Mar 2022 09:13:46 +0100 (CET)
Received: from localhost (10.75.127.51) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 21 Mar
 2022 09:13:46 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 21 Mar 2022 09:13:36 +0100
Message-ID: <20220321091329.v1.1.I6c2140112986b016356da7d05e846bcaefdd3fcf@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220321081337.28971-1-patrice.chotard@foss.st.com>
References: <20220321081337.28971-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-21_02,2022-03-15_01,2022-02-23_01
Cc: Wolfgang Denk <wd@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Marek Behun <marek.behun@nic.cz>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Farhan Ali <farhan.ali@broadcom.com>
Subject: [Uboot-stm32] [PATCH v1 1/2] mtd: Add flash_node in struct mtd_info
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

Currently, add_mtd_partitions_of() can be used only if dev field of
mtd_info struct is populated. It's the case, for example, for a spi nor
flash, which has a DT compatible "jedec,spi-nor" and an associated
device. mtd->dev is populated in spi_nor_scan().

But in case of a raw nand node, mtd_info's dev field can't be populated
as flash node has no compatible, so no associated device.
add_mtd_partitions_of() can't be used to parse "partitions" subnode.

To remove this constraint, add an ofnode field in mtd_info struct
which reference the DT flash node. This new field is populated by
nand_scan_tail(). This new field will be used by add_mtd_partitions_of()
to parse the flash node for "partitions" defined in DT.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Farhan Ali <farhan.ali@broadcom.com>
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Marek Behun <marek.behun@nic.cz>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Wolfgang Denk <wd@denx.de>
---

 drivers/mtd/nand/raw/nand_base.c | 1 +
 include/linux/mtd/mtd.h          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index f7616985d9..a007603df1 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5257,6 +5257,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 		break;
 	}
 
+	mtd->flash_node = chip->flash_node;
 	/* Fill in remaining MTD driver data */
 	mtd->type = nand_is_slc(chip) ? MTD_NANDFLASH : MTD_MLCNANDFLASH;
 	mtd->flags = (chip->options & NAND_ROM) ? MTD_CAP_ROM :
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 7455400981..af45e63bf9 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -305,6 +305,7 @@ struct mtd_info {
 	struct device dev;
 #else
 	struct udevice *dev;
+	ofnode flash_node;
 #endif
 	int usecount;
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
