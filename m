Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 425A828F20E
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Oct 2020 14:28:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53AF1C32EA7;
	Thu, 15 Oct 2020 12:28:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E475FC32E91
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Oct 2020 12:28:25 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09FCQK00000918; Thu, 15 Oct 2020 14:28:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=tXN3d4XYoc5MXWCBtB51CwFfxMKv1Z1BUsvK1kApf74=;
 b=K852jxCG70kURyvgsJv+frMrCz+r5JvPkCWZnRID1KYLb7RgGEEPUcKQl0hhbKDT7b4T
 Get04r96iKsucaAXwMeEQ7VY5LPZNFkx0NfIhT5N8sgzP6Y19Dr2do3BpWCwy9HRhujr
 kHOmrymeDDLu2nYHfIt2v05T20ucnpdg7fi+tGIatVnncUJoOfed4/sUSNn1PxhPljBe
 8xRl25JEN3w2HUnkTjABZuGoe625QqBuLTnQyLALW7aTSusyNf2kPl50ldft4Nlox+ER
 3jU6gUGU5HH0JKSNWayTTeaP2+pYk0cCdAftO5fHu/yTVyHertv781pPPdUoH5sjLYSZ Aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34356emx74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Oct 2020 14:28:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 51F7C10002A;
 Thu, 15 Oct 2020 14:28:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 47EE4221763;
 Thu, 15 Oct 2020 14:28:22 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 15 Oct 2020 14:28:21
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 15 Oct 2020 14:28:17 +0200
Message-ID: <20201015122817.18234-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-15_07:2020-10-14,
 2020-10-15 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] stm32mp: stm32prog: accept device without
	partition
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

When partitions are not available on a device the command stm32prog raises
an error but a device can have no partition to check in init_device()
and the command need to continue to the next part_id.

This patch correct an issue for ram0 target, when block_dev and mtd
are NULL.

For example with the simple flashlayout file:

Opt	Part	Name	Type	Device	Offset	Binary
-	0x01	fsbl	Binary	none	0x0	tf-a-serialboot.stm32
-	0x03	ssbl	Binary	none	0x0	u-boot.stm32
P	0x10	kernel	System	ram0	0xC2000000	uImage.bin
P	0x11	dtb	FileSytem	ram0	0xC4000000	stm32mp157f-ev1.dtb

Fixes: ffc405e63b94 ("stm32mp: stm32prog: add upport of partial update")
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index ec3355d816..a777827c55 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -768,9 +768,8 @@ static int init_device(struct stm32prog_data *data,
 			part_found = true;
 		}
 
+		/* no partition for this device */
 		if (!part_found) {
-			stm32prog_err("%s (0x%x): Invalid partition",
-				      part->name, part->id);
 			pr_debug("\n");
 			continue;
 		}
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
