Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B80C8354DD2
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Apr 2021 09:27:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75FC5C57B6B;
	Tue,  6 Apr 2021 07:27:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE319C57B5E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Apr 2021 07:27:44 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1367RG7b026114; Tue, 6 Apr 2021 09:27:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=dJYmOaZi9XdsQYki52iZU6JsTISZWcVYYiVlpv7Mrok=;
 b=XyiFfbsYHUtpYiwM0qKidCCp7DSXQD/RJt/VG/lZCEbdr8F9e/K2bIsH/2sn8qfyzMHn
 mF3D6TfOQpqaEJbECB88dynossUfD7c/JMMm6KvWmc3wzK19/F/0/yxaniBDd5+FlKmw
 EcJWpSsWWTt0omhbSXmerFu33uM7BPwppOM7zVbY/D4+1IG3YbJrtqSS1Sg6jcneXFjP
 Pd/dqHQCELb0Cha3Ijtzhf7UyxP/i/aW1UYYgx2eLNNHnidSYMGBB0TPqT8XRKnMBbKf
 Em8TLoanEyqAsTjskzdgORJY5uU36Ac2KIfg1OW8KTkXZWFTx+g1CGJRsGOHs/Qgo8C7 /Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37rjf009pr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 09:27:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A3B3E10002A;
 Tue,  6 Apr 2021 09:27:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 99DBD21E68E;
 Tue,  6 Apr 2021 09:27:43 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 6 Apr 2021 09:27:43
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 6 Apr 2021 09:27:39 +0200
Message-ID: <20210406092731.2.I5436203a1417ef602cffce8d3e56f84c5f92c539@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210406092731.1.Iad88039569017850ed77dfae267b261f8efc8ad7@changeid>
References: <20210406092731.1.Iad88039569017850ed77dfae267b261f8efc8ad7@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-06_01:2021-04-01,
 2021-04-06 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/2] stm32mp: replace printf by log macro in
	setup_boot_mode
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

Replace the remaining printf in setup_boot_mode() by log macro
to handle filtering for log features.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cpu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index 2f05c5e91b..621a6b7c89 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -502,8 +502,8 @@ static void setup_boot_mode(void)
 			if (IS_ENABLED(CONFIG_CMD_STM32PROG_SERIAL))
 				gd->flags &= ~(GD_FLG_SILENT |
 					       GD_FLG_DISABLE_CONSOLE);
-			printf("uart%d = %s not found in device tree!\n",
-			       instance + 1, cmd);
+			log_err("uart%d = %s not found in device tree!\n",
+				instance + 1, cmd);
 			break;
 		}
 		sprintf(cmd, "%d", dev_seq(dev));
@@ -514,7 +514,7 @@ static void setup_boot_mode(void)
 		if (IS_ENABLED(CONFIG_CMD_STM32PROG_SERIAL) && gd->cur_serial_dev != dev) {
 			gd->flags &= ~(GD_FLG_SILENT |
 				       GD_FLG_DISABLE_CONSOLE);
-			printf("serial boot with console enabled!\n");
+			log_info("serial boot with console enabled!\n");
 		}
 		break;
 	case BOOT_SERIAL_USB:
@@ -546,7 +546,7 @@ static void setup_boot_mode(void)
 
 	switch (forced_mode) {
 	case BOOT_FASTBOOT:
-		printf("Enter fastboot!\n");
+		log_info("Enter fastboot!\n");
 		env_set("preboot", "env set preboot; fastboot 0");
 		break;
 	case BOOT_STM32PROG:
@@ -556,7 +556,7 @@ static void setup_boot_mode(void)
 	case BOOT_UMS_MMC0:
 	case BOOT_UMS_MMC1:
 	case BOOT_UMS_MMC2:
-		printf("Enter UMS!\n");
+		log_info("Enter UMS!\n");
 		instance = forced_mode - BOOT_UMS_MMC0;
 		sprintf(cmd, "env set preboot; ums 0 mmc %d", instance);
 		env_set("preboot", cmd);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
