Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7DE728343
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Jun 2023 17:10:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90B12C65E58;
	Thu,  8 Jun 2023 15:10:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8913FC65E42
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jun 2023 15:10:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 358EA8HJ029843; Thu, 8 Jun 2023 17:10:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=WrSkoo5FchRFoswYGuG5dOQycmL07P67jUPeXtn9zV4=;
 b=2NZnOh+Z7wJkldY2fcdYyeGo4pAuZOlaRcUsYhZ6VybFvgeO2h3b8Fjup+9pceNfnm6n
 OtMlQmf/pJSMU0Kxba86jo9GafRESCJthqrgTN3cASfwdkAQ2RYy4Dmc+RjbQ2I55sUX
 51k5XgqZ8Epdj44s3dKgvyBraaRGBZRArzid57UdPMDSZVThg4pYCo2Q2wi5758Kd3Rx
 FY9RutA0JwDeWa2QlBcTTsT5MLhctkO09uJVE+acJK6oHbAjVlxmdpj7DydV7F7KahjG
 5OSy/rB88ge7TrRfcQLF8FZk4k2D/l9trbMg/fcxp+LPPPVrsFTm+Ouuyq9B5Jk+G0PO +w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r3ggygcny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jun 2023 17:10:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9003610003E;
 Thu,  8 Jun 2023 17:10:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8995D237D92;
 Thu,  8 Jun 2023 17:10:03 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 8 Jun
 2023 17:10:03 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 8 Jun 2023 17:09:54 +0200
Message-ID: <20230608170941.1.I0c3b7963b669b6c03e5a3bdf7e9e736e767aafd1@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_11,2023-06-08_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 1/3] stm32mp: stm32prog: Add support of ENV
	partition type
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

Add support of "ENV" partition type in flashlayout to select
the "u-boot-env" GUID, with PARTITION_U_BOOT_ENVIRONMENT =
3de21764-95bd-54bd-a5c3-4abe786f38a8, that mean a partition
holding a U-Boot environment introduced by
commit c0364ce1c695 ("doc/README.gpt: define partition type
GUID for U-Boot environment")'

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 5 +++++
 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index 6f3641ccf57b..1bd86b5187da 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -430,6 +430,8 @@ static int parse_type(struct stm32prog_data *data,
 		}
 	} else if (!strcmp(p, "FIP")) {
 		part->part_type = PART_FIP;
+	} else if (!strcmp(p, "ENV")) {
+		part->part_type = PART_ENV;
 	} else if (!strcmp(p, "System")) {
 		part->part_type = PART_SYSTEM;
 	} else if (!strcmp(p, "FileSystem")) {
@@ -1130,6 +1132,9 @@ static int create_gpt_partitions(struct stm32prog_data *data)
 			case PART_BINARY:
 				type_str = LINUX_RESERVED_UUID;
 				break;
+			case PART_ENV:
+				type_str = "u-boot-env";
+				break;
 			case PART_FIP:
 				type_str = FIP_TYPE_UUID;
 				break;
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
index 58f4b96fa752..4c2c1314d990 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
@@ -100,6 +100,7 @@ struct stm32_header_v2 {
 enum stm32prog_part_type {
 	PART_BINARY,
 	PART_FIP,
+	PART_ENV,
 	PART_SYSTEM,
 	PART_FILESYSTEM,
 	RAW_IMAGE,
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
