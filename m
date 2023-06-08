Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BBD728344
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Jun 2023 17:10:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3FF7C6A5FA;
	Thu,  8 Jun 2023 15:10:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61DE6C65E42
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jun 2023 15:10:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 358EAHET029938; Thu, 8 Jun 2023 17:10:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=U0ten2sCPaJbuVNmQywyltYr4TZxelxOF+tCM3IhHRg=;
 b=WZSGJksiCUSGRmz6gC2wXcV08ELonoR0R8qxhR+BuNfaGsGj+LSaGZ7p2bGXLG22a/2S
 hexwJ8ZW1v7MCJjDNz2/nH3WI9OrYyeH4MthX1QXw/Z43xLWjs5r5nq/lI9mY68pBSON
 kawHZzLTjbjR0FPyiSQQOflOk3Vv3VNu68/tE6JQyf4NASTfB3HZlyENryaZ1uDbisou
 GVMF/y0xYHMJsLNLxUbBpBOP9GxALsFGMsZg8ySJHR4iingoLz8jREdanheRQr7PR2Fi
 H3MBZemgXcg6EX/dLm21icGNACuiRjUa3pRN+UkRcjzqEuou2V1z+d+bhI02eZZA3h5z AA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r3ggygcp4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jun 2023 17:10:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9C3EC10002A;
 Thu,  8 Jun 2023 17:10:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 95713237D91;
 Thu,  8 Jun 2023 17:10:05 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 8 Jun
 2023 17:10:05 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 8 Jun 2023 17:09:56 +0200
Message-ID: <20230608170941.3.I2c67e801f791e9b397c7a39c6f9ac503930f1203@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230608170941.1.I0c3b7963b669b6c03e5a3bdf7e9e736e767aafd1@changeid>
References: <20230608170941.1.I0c3b7963b669b6c03e5a3bdf7e9e736e767aafd1@changeid>
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
Subject: [Uboot-stm32] [PATCH 3/3] stm32mp: stm32prog: Add support of
	FWU_MDATA partition type
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

Add support of "FWU_MDATA" partition type in flashlayout to select
the TF-A firmware update metadata partition type guid, associated to
U-Boot "system" partition type guid, FWU_MDATA_GUID introduced by
commit 2eaedc95164f ("FWU: Add FWU metadata structure and driver for
accessing metadata") and used in gpt_get_mdata_partitions() for
commit 554b38f7a532 ("FWU: Add FWU metadata access driver for GPT
partitioned block devices")

See also recommendation in FWU-PSA-A_DEN0118_1.0ALP3.pdf
  4.1.2 Metadata integration with GPT
  When embedded in a GPT, each metadata replica occupies a single
  partition with PartitionTypeGUID = metadata_uuid.
  UUID = 8a7a84a0-8387-40f6-ab41-a8b9a5a60d23

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 11 +++++++++++
 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index 07369919620e..a2ff5558a519 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -63,6 +63,12 @@ static const efi_guid_t uuid_mmc[3] = {
 	ROOTFS_MMC2_UUID
 };
 
+/*
+ * GUID value defined in the FWU specification for identification
+ * of the FWU metadata partition.
+ */
+#define FWU_MDATA_UUID "8a7a84a0-8387-40f6-ab41-a8b9a5a60d23"
+
 /* FIP type partition UUID used by TF-A*/
 #define FIP_TYPE_UUID "19D5DF83-11B0-457B-BE2C-7559C13142A5"
 
@@ -430,6 +436,8 @@ static int parse_type(struct stm32prog_data *data,
 		}
 	} else if (!strcmp(p, "FIP")) {
 		part->part_type = PART_FIP;
+	} else if (!strcmp(p, "FWU_MDATA")) {
+		part->part_type = PART_FWU_MDATA;
 	} else if (!strcmp(p, "ENV")) {
 		part->part_type = PART_ENV;
 	} else if (!strcmp(p, "System")) {
@@ -1140,6 +1148,9 @@ static int create_gpt_partitions(struct stm32prog_data *data)
 			case PART_FIP:
 				type_str = FIP_TYPE_UUID;
 				break;
+			case PART_FWU_MDATA:
+				type_str = FWU_MDATA_UUID;
+				break;
 			case PART_ESP:
 				/* EFI System Partition */
 				type_str = "system";
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
index a6fb9d5e9cc5..02b286be8182 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
@@ -105,6 +105,7 @@ struct stm32_header_v2 {
 enum stm32prog_part_type {
 	PART_BINARY,
 	PART_FIP,
+	PART_FWU_MDATA,
 	PART_ENV,
 	PART_SYSTEM,
 	PART_FILESYSTEM,
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
