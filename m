Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DACD3B5E52
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Jun 2021 14:44:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2A7EC58D7F;
	Mon, 28 Jun 2021 12:44:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3FB8C58D78
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jun 2021 12:44:37 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15SCgDYr021911; Mon, 28 Jun 2021 14:44:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=m/ZJitmucEV0AaHZ51J/Mns6bc5I2BSLeXCUYm54RvA=;
 b=d2rA5hwdGoUw8lORYyxHQMrmfAW9RYxT8w4384dg8Ugy4sfukYfOjA15+4hEAN/V4Wz+
 lw5GBYtfJggXTixR+17HLWmug0wUK8DfRKXAvQwAcluBb6NgbgDXsYAlcQmvcJTabGRS
 hDZx+txD+YCBWAXLT9x+5yH3Oz49J9587Y7ti7CbsU83xVYjVPBkcAp4czwUZe/0LJ9n
 zGmFx59fOtTHbHvhXt87/cLvQiFPowOeXd9vleIVbZwkVcXKbOrvgi6QiJLE3/zI7h3r
 ryfEqisHDvgRqUCDfKPxUgRXQcqdZ6jGtVMmujsfPRbIHQC7KFVKmXp4Tt0hR973Xfnt OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39fc110vam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 14:44:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F2D3C10002A;
 Mon, 28 Jun 2021 14:44:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E65E5226FCE;
 Mon, 28 Jun 2021 14:44:35 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 28 Jun 2021 14:44:35
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 28 Jun 2021 14:44:33 +0200
Message-ID: <20210628144418.1.I207c8af71917766e343179128c630d483c9f6ece@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-28_11:2021-06-25,
 2021-06-28 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH] stm32mp: stm32prog: fix the content of short
	help message
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

Reduce the content of short help message for stm32prog command and
removed the carriage return to fix the display of 'help' command when
this command is activated.

Fixes: 954bd1a923a6 ("stm32mp: add the command stm32prog")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
index feff73c79e..064f51b2c7 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
@@ -177,12 +177,12 @@ cleanup:
 }
 
 U_BOOT_CMD(stm32prog, 5, 0, do_stm32prog,
+	   "start communication with tools STM32Cubeprogrammer",
 	   "<link> <dev> [<addr>] [<size>]\n"
-	   "start communication with tools STM32Cubeprogrammer on <link> with Flashlayout at <addr>",
-	   "<link> = serial|usb\n"
-	   "<dev>  = device instance\n"
-	   "<addr> = address of flashlayout\n"
-	   "<size> = size of flashlayout\n"
+	   "  <link> = serial|usb\n"
+	   "  <dev>  = device instance\n"
+	   "  <addr> = address of flashlayout\n"
+	   "  <size> = size of flashlayout (optional for image with STM32 header)\n"
 );
 
 bool stm32prog_get_tee_partitions(void)
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
