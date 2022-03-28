Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB724E9D77
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Mar 2022 19:26:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB106C60465;
	Mon, 28 Mar 2022 17:26:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DD58C60464
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 17:26:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22SDdbQe008179;
 Mon, 28 Mar 2022 19:26:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=JxTm02ia5m7G9W/8eNYdGaWpou6Pqi0tNGWTjO00nMs=;
 b=k3W5VkfhG7CTJ5C6LIoBV3PtLRD16yDCsjIbl6uxN/AJZzaOY/bsbzIHFptNnN1ygOIw
 Bd0/ZjdrKBVn9CWP4SgizTUOnjpNqT4KL6278i7sBaUhPRoG8MIO89GpmTiAV6hhE785
 bpvPvwugn6Bh5Rla9Lgz50n699KlEJMRv5prC+xBAlVA25QNCLszKL6AaxT2G7lrSijb
 7IkERxwZTqIZvK2XtPLxrvIf67Gm8D0+jCVrAGd7sbX15izBX9HJvNd57C495yw19JAC
 LK/VtLcWYziHG2QW1AnWrLvZKo4MxR5FDLJkFQA0xkxfAqcyV8YuObDyfnDlUmDzc7yZ Lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f1rud4g0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 19:26:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 00F2010002A;
 Mon, 28 Mar 2022 19:26:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EE7F2237D8C;
 Mon, 28 Mar 2022 19:26:40 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 28 Mar 2022 19:26:40
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 28 Mar 2022 19:25:30 +0200
Message-ID: <20220328192520.5.I94e74b521fd55dcc68ab8d000cb93ef48fc12f14@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220328172534.1196119-1-patrick.delaunay@foss.st.com>
References: <20220328172534.1196119-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-28_08,2022-03-28_01,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 5/8] stm32mp: stm32prog: add support of UUID
	for FIP partition
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

Add support of UUID for FIP parttion, required by Firmware update
support in TF-A:
- UUID TYPE for FIP partition: 19d5df83-11b0-457b-be2c-7559c13142a5
- "fip-a" partition UUID: 4fd84c93-54ef-463f-a7ef-ae25ff887087
- "fip-b" partition UUID: 09c54952-d5bf-45af-acee-335303766fb3

This check is done with a new partition type "FIP" associated
at the FIP UUID.

The A/B partition UUID is detected by the partition name:
"fip-a", "fip-b".

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 76 ++++++++++++++-----
 .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |  3 +-
 2 files changed, 59 insertions(+), 20 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index 3e1fdee5b3..d3b3e1ed72 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -62,6 +62,28 @@ static const efi_guid_t uuid_mmc[3] = {
 	ROOTFS_MMC2_UUID
 };
 
+/* FIP type partition UUID used by TF-A*/
+#define FIP_TYPE_UUID "19D5DF83-11B0-457B-BE2C-7559C13142A5"
+
+/* unique partition guid (uuid) for FIP partitions A/B */
+#define FIP_A_UUID \
+	EFI_GUID(0x4FD84C93, 0x54EF, 0x463F, \
+		 0xA7, 0xEF, 0xAE, 0x25, 0xFF, 0x88, 0x70, 0x87)
+
+#define FIP_B_UUID \
+	EFI_GUID(0x09C54952, 0xD5BF, 0x45AF, \
+		 0xAC, 0xEE, 0x33, 0x53, 0x03, 0x76, 0x6F, 0xB3)
+
+static const char * const fip_part_name[] = {
+	"fip-a",
+	"fip-b"
+};
+
+static const efi_guid_t fip_part_uuid[] = {
+	FIP_A_UUID,
+	FIP_B_UUID
+};
+
 /* order of column in flash layout file */
 enum stm32prog_col_t {
 	COL_OPTION,
@@ -405,6 +427,8 @@ static int parse_type(struct stm32prog_data *data,
 				part->bin_nb =
 					dectoul(&p[7], NULL);
 		}
+	} else if (!strcmp(p, "FIP")) {
+		part->part_type = PART_FIP;
 	} else if (!strcmp(p, "System")) {
 		part->part_type = PART_SYSTEM;
 	} else if (!strcmp(p, "FileSystem")) {
@@ -1056,9 +1080,10 @@ static int create_gpt_partitions(struct stm32prog_data *data)
 	char uuid[UUID_STR_LEN + 1];
 	unsigned char *uuid_bin;
 	unsigned int mmc_id;
-	int i;
+	int i, j;
 	bool rootfs_found;
 	struct stm32prog_part_t *part;
+	const char *type_str;
 
 	buf = malloc(buflen);
 	if (!buf)
@@ -1100,33 +1125,46 @@ static int create_gpt_partitions(struct stm32prog_data *data)
 					   part->addr,
 					   part->size);
 
-			if (part->part_type == PART_BINARY)
-				offset += snprintf(buf + offset,
-						   buflen - offset,
-						   ",type="
-						   LINUX_RESERVED_UUID);
-			else
-				offset += snprintf(buf + offset,
-						   buflen - offset,
-						   ",type=linux");
+			switch (part->part_type) {
+			case PART_BINARY:
+				type_str = LINUX_RESERVED_UUID;
+				break;
+			case PART_FIP:
+				type_str = FIP_TYPE_UUID;
+				break;
+			default:
+				type_str = "linux";
+				break;
+			}
+			offset += snprintf(buf + offset,
+					   buflen - offset,
+					   ",type=%s", type_str);
 
 			if (part->part_type == PART_SYSTEM)
 				offset += snprintf(buf + offset,
 						   buflen - offset,
 						   ",bootable");
 
+			/* partition UUID */
+			uuid_bin = NULL;
 			if (!rootfs_found && !strcmp(part->name, "rootfs")) {
 				mmc_id = part->dev_id;
 				rootfs_found = true;
-				if (mmc_id < ARRAY_SIZE(uuid_mmc)) {
-					uuid_bin =
-					  (unsigned char *)uuid_mmc[mmc_id].b;
-					uuid_bin_to_str(uuid_bin, uuid,
-							UUID_STR_FORMAT_GUID);
-					offset += snprintf(buf + offset,
-							   buflen - offset,
-							   ",uuid=%s", uuid);
-				}
+				if (mmc_id < ARRAY_SIZE(uuid_mmc))
+					uuid_bin = (unsigned char *)uuid_mmc[mmc_id].b;
+			}
+			if (part->part_type == PART_FIP) {
+				for (j = 0; j < ARRAY_SIZE(fip_part_name); j++)
+					if (!strcmp(part->name, fip_part_name[j])) {
+						uuid_bin = (unsigned char *)fip_part_uuid[j].b;
+						break;
+					}
+			}
+			if (uuid_bin) {
+				uuid_bin_to_str(uuid_bin, uuid, UUID_STR_FORMAT_GUID);
+				offset += snprintf(buf + offset,
+						   buflen - offset,
+						   ",uuid=%s", uuid);
 			}
 
 			offset += snprintf(buf + offset, buflen - offset, ";");
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
index 90cdc2ba47..b3e5c74810 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
@@ -94,9 +94,10 @@ struct stm32_header_v2 {
 /* partition type in flashlayout file */
 enum stm32prog_part_type {
 	PART_BINARY,
+	PART_FIP,
 	PART_SYSTEM,
 	PART_FILESYSTEM,
-	RAW_IMAGE
+	RAW_IMAGE,
 };
 
 /* device information */
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
