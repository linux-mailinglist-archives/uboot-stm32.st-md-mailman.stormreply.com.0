Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C4B728395
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Jun 2023 17:19:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCE5DC6A5FA;
	Thu,  8 Jun 2023 15:19:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 167D8C6A5FB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jun 2023 15:19:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 358EAB83029869; Thu, 8 Jun 2023 17:19:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=GZPZUtY6zuBzktGn0IuP1cyOAH3J6D0NWtBuN/2l5ho=;
 b=ZLe/wQ0ziH/bXbahoVvKHtKGyFVIKHTCYrNQwhyBRNVnl8FnuGtn6lgRYGb8i9j0f0wP
 jxAV1UA9AcX3cZjUjTEfs57cDJHV7vGapjIdmVW/QLvc8hEswYQpurHoDfl38p1VxcW0
 yduKeP3VzWmL7uC5bt06tS3yLoU2k3LIhJ+lGxHQBPDOIV0qgHq7U/27TGxtRMUwg6kB
 3vZt3icj7e9vSonpoKkih4uo+f8WQ523YTSF2D+1TRFmWtUWzFDemL+xk6/AWociveeN
 c1DrKOSNKVt8V119PKrUfE1xFT7u9H+UfVV/Exqr8hopw90KrQAMnb8mv4w3ArbJok0/ sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r3ggygedk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jun 2023 17:19:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E4C0C10002A;
 Thu,  8 Jun 2023 17:19:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DB14F21BF4D;
 Thu,  8 Jun 2023 17:19:01 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 8 Jun
 2023 17:19:01 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 8 Jun 2023 17:16:46 +0200
Message-ID: <20230608171614.10.I244f84db09e1225f509e2b1072e974810f2024df@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
References: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_11,2023-06-08_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, Sean Anderson <sean.anderson@seco.com>,
 Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 10/12] stm32mp: stm32prog: Remove tee_detected
	from stm32prog_data struct
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

As stm32prog_get_tee_partitions() is no more used, remove tee_detected
boolean from stm32prog_data struct and all code using it.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c |  9 ---------
 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c     | 11 -----------
 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h     |  3 ---
 arch/arm/mach-stm32mp/include/mach/stm32prog.h      |  4 ----
 4 files changed, 27 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
index cfafa539aeb9..c695cc11232b 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
@@ -180,15 +180,6 @@ U_BOOT_CMD(stm32prog, 5, 0, do_stm32prog,
 	   "  <size> = size of flashlayout (optional for image with STM32 header)\n"
 );
 
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
-bool stm32prog_get_tee_partitions(void)
-{
-	if (stm32prog_data)
-		return stm32prog_data->tee_detected;
-
-	return false;
-}
-#endif
 
 bool stm32prog_get_fsbl_nor(void)
 {
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index 241ad40abb7c..0cdc14dd5bc8 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -995,9 +995,6 @@ static int treat_partition_list(struct stm32prog_data *data)
 		INIT_LIST_HEAD(&data->dev[j].part_list);
 	}
 
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
-	data->tee_detected = false;
-#endif
 	data->fsbl_nor_detected = false;
 	for (i = 0; i < data->part_nb; i++) {
 		part = &data->part_array[i];
@@ -1049,14 +1046,6 @@ static int treat_partition_list(struct stm32prog_data *data)
 			    !strncmp(part->name, "fsbl", 4))
 				data->fsbl_nor_detected = true;
 			/* fallthrough */
-		case STM32PROG_NAND:
-		case STM32PROG_SPI_NAND:
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
-			if (!data->tee_detected &&
-			    !strncmp(part->name, "tee", 3))
-				data->tee_detected = true;
-			break;
-#endif
 		default:
 			break;
 		}
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
index 58f4b96fa752..04a899ee1184 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
@@ -149,9 +149,6 @@ struct stm32prog_data {
 	struct stm32prog_dev_t	dev[STM32PROG_MAX_DEV];	/* array of device */
 	int			part_nb;	/* nb of partition */
 	struct stm32prog_part_t	*part_array;	/* array of partition */
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
-	bool			tee_detected;
-#endif
 	bool			fsbl_nor_detected;
 
 	/* command internal information */
diff --git a/arch/arm/mach-stm32mp/include/mach/stm32prog.h b/arch/arm/mach-stm32mp/include/mach/stm32prog.h
index 99be4e1d656b..23d1adfbad92 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32prog.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32prog.h
@@ -11,8 +11,4 @@ int stm32prog_read_medium_virt(struct dfu_entity *dfu, u64 offset,
 			       void *buf, long *len);
 int stm32prog_get_medium_size_virt(struct dfu_entity *dfu, u64 *size);
 
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
-bool stm32prog_get_tee_partitions(void);
-#endif
-
 bool stm32prog_get_fsbl_nor(void);
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
