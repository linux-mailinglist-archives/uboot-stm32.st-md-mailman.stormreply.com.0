Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A67772347D4
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 16:32:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D79DC36B36
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 14:32:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71E24C36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:32:01 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VESaOc016776; Fri, 31 Jul 2020 16:32:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ytXIBVGIyjm4ugA9gtpzPqp1Oup17H9PFYPpmry8vY0=;
 b=HRlHGvkWiJ7cJHb7nMu8comQ6SAmBJMQWSyqy92YulJ0QpHIy8K0kTK/NuMasB7zCF9c
 9dzB7Ws6cGKyxaVspR2ruCDaEK2w0vPrpN5CTD/VNJnMd8juiuqSyUKk2LB5WeXTQ5aP
 o6pRteWttB84iXnEspOlyYKE+wwjq21IE10VEs+FKfe4RC6GJEtNv5yMhCaUi1BK4wyM
 6jzUU5olDdvj/O9UpW6T5bxhWgiUKQXohetFPixyPI7F8vAl9gCWAo/8inEO+711Vyio
 Y1H/Z73/4ZN9RKkX8GJPTmyjy0WDu2RSj0LWj1KFcedhWbY2mjEdQSjeHL+ToXfBvwcp /w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gbmgpu9f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 16:32:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 66844100038;
 Fri, 31 Jul 2020 16:32:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E2912B1899;
 Fri, 31 Jul 2020 16:32:00 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 31 Jul 2020 16:32:00 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 31 Jul 2020 16:31:46 +0200
Message-ID: <20200731143152.8812-5-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731143152.8812-1-patrick.delaunay@st.com>
References: <20200731143152.8812-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_05:2020-07-31,
 2020-07-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 05/11] board: stm32mp1: use IS_ENABLED to
	prevent ifdef in set_dfu_alt_inf
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

Use CONFIG_IS_ENABLED to prevent ifdef in set_dfu_alt_inf.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/common/stm32mp_dfu.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/board/st/common/stm32mp_dfu.c b/board/st/common/stm32mp_dfu.c
index 0cda9196f9..2fb307efe4 100644
--- a/board/st/common/stm32mp_dfu.c
+++ b/board/st/common/stm32mp_dfu.c
@@ -113,11 +113,13 @@ void set_dfu_alt_info(char *interface, char *devstr)
 	snprintf(buf, DFU_ALT_BUF_LEN,
 		 "ram 0=%s", CONFIG_DFU_ALT_RAM0);
 
-	if (!uclass_get_device(UCLASS_MMC, 0, &dev))
-		board_get_alt_info_mmc(dev, buf);
+	if (CONFIG_IS_ENABLED(MMC)) {
+		if (!uclass_get_device(UCLASS_MMC, 0, &dev))
+			board_get_alt_info_mmc(dev, buf);
 
-	if (!uclass_get_device(UCLASS_MMC, 1, &dev))
-		board_get_alt_info_mmc(dev, buf);
+		if (!uclass_get_device(UCLASS_MMC, 1, &dev))
+			board_get_alt_info_mmc(dev, buf);
+	}
 
 	if (CONFIG_IS_ENABLED(MTD)) {
 		/* probe all MTD devices */
@@ -139,12 +141,12 @@ void set_dfu_alt_info(char *interface, char *devstr)
 			board_get_alt_info_mtd(mtd, buf);
 	}
 
-#ifdef CONFIG_DFU_VIRT
-	strncat(buf, "&virt 0=OTP", DFU_ALT_BUF_LEN);
+	if (IS_ENABLED(CONFIG_DFU_VIRT)) {
+		strncat(buf, "&virt 0=OTP", DFU_ALT_BUF_LEN);
 
-	if (IS_ENABLED(CONFIG_PMIC_STPMIC1))
-		strncat(buf, "&virt 1=PMIC", DFU_ALT_BUF_LEN);
-#endif
+		if (IS_ENABLED(CONFIG_PMIC_STPMIC1))
+			strncat(buf, "&virt 1=PMIC", DFU_ALT_BUF_LEN);
+	}
 
 	env_set("dfu_alt_info", buf);
 	puts("DFU alt info setting: done\n");
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
