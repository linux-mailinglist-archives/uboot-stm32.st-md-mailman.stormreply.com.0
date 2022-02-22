Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C744BFF87
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Feb 2022 18:00:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DBABC60462;
	Tue, 22 Feb 2022 17:00:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 364B6C60461
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Feb 2022 16:43:09 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21MEXcSm003245;
 Tue, 22 Feb 2022 17:43:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=LNX7hrhLqh66kvSwZBJ+fbBlobHevDKRvSOnF1YPOOY=;
 b=xDPzdwl02I+ytADBU03leXFMnPhc+0if8dI7lh8xyv79qIqU3MC/7C6mYAf30bQkIOgZ
 FWaZsNCMqQVwR0VzXC6sMjixspZ2SQYwMvzaEc3BQnzyVAOfEYKxsWzZRP8CHJTt3PXs
 HSOUs0zTgDBpimT6FScb4jGw/MNRfwIT8KfJV4X8GV9mgULkgMU3BW6G8i0m3NB1f/U/
 9913pr4fvWg7QX8v/WmyrTW5BcvEOjImnqew18QCpEXeihB87I7GFyqbgI9kQC4lSLVp
 mdYjuIb/sLKGrq0DkTbkyzAARc33NpeOaBbqF3jGanoqtliZMTxOL8/8cV9pub1yE56K Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ecq13mk3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Feb 2022 17:43:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6DEFD10002A;
 Tue, 22 Feb 2022 17:43:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9D3FA2309E2;
 Tue, 22 Feb 2022 17:43:06 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE1.st.com (10.75.127.4)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 22 Feb 2022 17:43:06
 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 22 Feb 2022 17:38:49 +0100
Message-ID: <20220222163849.77875-1-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-22_05,2022-02-21_02,2021-12-02_01
X-Mailman-Approved-At: Tue, 22 Feb 2022 17:00:54 +0000
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>
Subject: [Uboot-stm32] [PATCH] mtd: rawnand: stm32_fmc2: add NAND Write
	Protect support
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

This patch adds the support of the WP# signal. WP will be disabled
before the first access to the NAND flash.

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
---

 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index eee65949d77..fb3279b405e 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -12,6 +12,7 @@
 #include <log.h>
 #include <nand.h>
 #include <reset.h>
+#include <asm/gpio.h>
 #include <dm/device_compat.h>
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
@@ -149,6 +150,7 @@ struct stm32_fmc2_timings {
 struct stm32_fmc2_nand {
 	struct nand_chip chip;
 	struct stm32_fmc2_timings timings;
+	struct gpio_desc wp_gpio;
 	int ncs;
 	int cs_used[FMC2_MAX_CE];
 };
@@ -824,6 +826,9 @@ static int stm32_fmc2_nfc_parse_child(struct stm32_fmc2_nfc *nfc, ofnode node)
 		nand->cs_used[i] = cs[i];
 	}
 
+	gpio_request_by_name_nodev(node, "wp-gpios", 0, &nand->wp_gpio,
+				   GPIOD_IS_OUT | GPIOD_IS_OUT_ACTIVE);
+
 	nand->chip.flash_node = node;
 
 	return 0;
@@ -972,6 +977,10 @@ static int stm32_fmc2_nfc_probe(struct udevice *dev)
 	chip->ecc.size = FMC2_ECC_STEP_SIZE;
 	chip->ecc.strength = FMC2_ECC_BCH8;
 
+	/* Disable Write Protect */
+	if (dm_gpio_is_valid(&nand->wp_gpio))
+		dm_gpio_set_value(&nand->wp_gpio, 0);
+
 	ret = nand_scan_ident(mtd, nand->ncs, NULL);
 	if (ret)
 		return ret;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
