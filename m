Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C085C4E21C5
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Mar 2022 09:13:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A004C5F1D5;
	Mon, 21 Mar 2022 08:13:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D490C57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Mar 2022 08:13:57 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22L7hxqo014854;
 Mon, 21 Mar 2022 09:13:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=9d29BcCycfgRJC5LS6n6946KNXwUEqY6lBLUlczAUmE=;
 b=daWxvViUCH9VEbEyt5eImBzmNWi0STUnIGp23ffiTikbaDFspNcoobVQjcEKpFXJmTVq
 ju+DGXy/MVXNmDUwixP29MBP6tCqgpFaQcgSTtHKmvwEs00pnpljp18AvwMnRcRPwjpS
 zgThp49Ef8rkgFDMfMcomR7Nr2AMX0fWgcTMnWvhl4niF9HDJNDC0fMpTRk1jhKQfRFo
 RXx9sGloX+Brj1rcw1JBORhUizLkiC1QlVLJzht+WsoXprPGVZV7ucBTdHIulzALC2ZP
 BP2evabiKyauGVb3yYm9wwjjaHtVarLPLC7Kxy5IKT1L9u42toKPynbedQnu+l5I7vsE QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ew5fp0gkw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 09:13:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DAF0510002A;
 Mon, 21 Mar 2022 09:13:47 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D072E212FC4;
 Mon, 21 Mar 2022 09:13:47 +0100 (CET)
Received: from localhost (10.75.127.51) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 21 Mar
 2022 09:13:47 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 21 Mar 2022 09:13:37 +0100
Message-ID: <20220321081337.28971-2-patrice.chotard@foss.st.com>
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
Subject: [Uboot-stm32] [PATCH v1 2/2] mtd: Update the way partitions are
	parsed
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

In case mtd_info's dev field is not populated (raw nand's case),
use the flash_node new field which reference the DT flash node where
can be found "partitions" node with "fixed-partitions" compatible.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Cc: Farhan Ali <farhan.ali@broadcom.com>
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Marek Behun <marek.behun@nic.cz>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Wolfgang Denk <wd@denx.de>

---

 drivers/mtd/mtdpart.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 4119ea4ff6..d077897e4a 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -887,10 +887,14 @@ int add_mtd_partitions_of(struct mtd_info *master)
 	ofnode parts, child;
 	int i = 0;
 
-	if (!master->dev)
+	if (!master->dev && !ofnode_valid(master->flash_node))
 		return 0;
 
-	parts = ofnode_find_subnode(mtd_get_ofnode(master), "partitions");
+	if (master->dev)
+		parts = ofnode_find_subnode(mtd_get_ofnode(master), "partitions");
+	else
+		parts = ofnode_find_subnode(master->flash_node, "partitions");
+
 	if (!ofnode_valid(parts) || !ofnode_is_available(parts) ||
 	    !ofnode_device_is_compatible(parts, "fixed-partitions"))
 		return 0;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
