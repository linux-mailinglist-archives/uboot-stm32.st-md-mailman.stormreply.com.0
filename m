Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9B828F2B0
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Oct 2020 14:52:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1FB0C32EA7;
	Thu, 15 Oct 2020 12:52:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA206C32EA3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Oct 2020 12:52:33 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09FCqMWj017554; Thu, 15 Oct 2020 14:52:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=LcsDCtnhbz1wvFf/kRfOmW7xaZRzdLuLibJBv73Awao=;
 b=HV4YdphTY+pWVBsBruqLYjS0pg7910TVFEs81LVZhl5Rfrmi9tmj7C5q0PTWSVlx63uV
 cfAXstUOiYxHNTBwhjy8uiPGspxquxPjIquFm8aRAQF+s/9Jbcev4ZnN9ypArU6Z9VTN
 9MnrTIJpU1PNjjCFjNbpWGdENOKA7aNQ7fK0km2gCGka2lrL1bo6vE6l7lKerw45Zeak
 r1sIDhkWYP7JopDvRjfHWcOTEjDyzdELw5EiPdGuRNyASbw+DALzObZoPQHHYaIzIPu9
 Byd86fDQ+ZLFLUjn3f0ZXv8y7i8dRAMJH9diDDWTJYJCMqRIFJTmygkpUFV1OFq7rFx7 HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34353wp97q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Oct 2020 14:52:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A581C10002A;
 Thu, 15 Oct 2020 14:52:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9D25E221F62;
 Thu, 15 Oct 2020 14:52:32 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 15 Oct 2020 14:52:32
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 15 Oct 2020 14:52:30 +0200
Message-ID: <20201015125230.8378-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-15_07:2020-10-14,
 2020-10-15 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] board: stm32mp1: no MTD partitions fixup for
	serial boot
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

Remove the update of the MTD partitions in kernel device tree
for serial boot (USB / UART), and the kernel will use the MTD
partitions define in the loaded DTB because U-Boot can't known the
expected flash layout in this case.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 03a19af930..8a3ce0a6f5 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -848,9 +848,14 @@ int ft_board_setup(void *blob, struct bd_info *bd)
 		{ "st,stm32mp15-fmc2",		MTD_DEV_TYPE_NAND, },
 		{ "st,stm32mp1-fmc2-nfc",	MTD_DEV_TYPE_NAND, },
 	};
-
-	if (IS_ENABLED(CONFIG_FDT_FIXUP_PARTITIONS))
-		fdt_fixup_mtdparts(blob, nodes, ARRAY_SIZE(nodes));
+	char *boot_device;
+
+	/* Check the boot-source and don't update MTD for serial or usb boot */
+	boot_device = env_get("boot_device");
+	if (!boot_device ||
+	    (strcmp(boot_device, "serial") && strcmp(boot_device, "usb")))
+		if (IS_ENABLED(CONFIG_FDT_FIXUP_PARTITIONS))
+			fdt_fixup_mtdparts(blob, nodes, ARRAY_SIZE(nodes));
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
