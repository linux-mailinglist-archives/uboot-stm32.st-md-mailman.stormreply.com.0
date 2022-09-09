Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E751C5B3BBC
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Sep 2022 17:22:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FF22C64113;
	Fri,  9 Sep 2022 15:22:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7FD4C6410E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Sep 2022 15:22:22 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2899xreS025381;
 Fri, 9 Sep 2022 17:22:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=do9vDHIYYNAijiV2yZesAu/noh7LKin5B1pBTr3BRmQ=;
 b=suxoIzp0He6J4p/t6xjhxFqNMnBEwR/nD0x83Q51JDBe8RZZmqgWiB/pu8z/XRBQ0qB2
 P0fndOtC3SSjIk6zO5MlvmbJPamTDbXAHoh0hHLbC4GsRTPX4MX2k3JKkp+8vsr0k4Qr
 uyrnBVK5i9a1E2fOmEMWBuFX6ExJ4oMDC8GBfWPqq3aRrrXFE2JQ/XIUhtG2EjOZS4w5
 H19JBkRjhIzqbut8ujhm0TpwK3lVKNkRuMVuMdS4mDAmi4Jv7BiduxjusVXGhL54owqN
 pu8iN50PJrII5VTcGiAyZqnhRnjWfSEBK+LL2/ChlXaQOicacf4HZ1llecW4DhlcRr39 wQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jg3bnsrys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Sep 2022 17:22:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1F9E410002A;
 Fri,  9 Sep 2022 17:22:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1AC9623694F;
 Fri,  9 Sep 2022 17:22:21 +0200 (CEST)
Received: from localhost (10.75.127.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 9 Sep
 2022 17:22:18 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 9 Sep 2022 17:22:15 +0200
Message-ID: <20220909172212.1.I257345934e82f832c20e7c5792f7c0186949e93b@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.120]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-09_08,2022-09-09_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] stm32mp: stm32prog: improve the partitioning
	trace
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

Improve the partitioning trace done in command stm32prog:
- remove the trace "partition: Done" when the GPT partitioning is not done
- indicate the mmc instance used for each 'gpt write' command

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index c391b6c7abb..7ee4590ef26 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -1090,7 +1090,6 @@ static int create_gpt_partitions(struct stm32prog_data *data)
 	if (!buf)
 		return -ENOMEM;
 
-	puts("partitions : ");
 	/* initialize the selected device */
 	for (i = 0; i < data->dev_nb; i++) {
 		/* create gpt partition support only for full update on MMC */
@@ -1098,6 +1097,7 @@ static int create_gpt_partitions(struct stm32prog_data *data)
 		    !data->dev[i].full_update)
 			continue;
 
+		printf("partitions on mmc%d: ", data->dev[i].dev_id);
 		offset = 0;
 		rootfs_found = false;
 		memset(buf, 0, buflen);
@@ -1197,8 +1197,8 @@ static int create_gpt_partitions(struct stm32prog_data *data)
 		sprintf(buf, "part list mmc %d", data->dev[i].dev_id);
 		run_command(buf, 0);
 #endif
+		puts("done\n");
 	}
-	puts("done\n");
 
 #ifdef DEBUG
 	run_command("mtd list", 0);
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
