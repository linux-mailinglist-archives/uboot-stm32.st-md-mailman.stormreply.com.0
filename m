Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EED1896F3
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:25:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C455CC36B0F
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 08:25:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF848C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 08:25:19 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I8HTXT019416; Wed, 18 Mar 2020 09:25:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=eQGkyT/45OeQ/+NPklDea0zJxpoLKKVWEew2Q7jlWTc=;
 b=P0mreQLVhgyMGG4eJRQ41y67Q0dVuGPSgo5yMhy5ZWckAxa/m/TL5dINCRrXyXsB5ujB
 gPQw57KGo0VHiIeaGBOahAF/JcGkjkl2/Q1nyV1g+4QKS35snd3NPQpSW6VPeTYZsHWo
 jm/Kx2xxjBNLJ1X3Xzlgcb8aftq6n/RSwEY6nhat1cIq+10Gus9sHJ9RJWO8NhG82+cc
 csUFK9+im4Cpegf8BBD41wZzW9jwfMO99LWdVKumOHJw5AzXCw51YBwVvbHqJBJ4m7J7
 f6PB5oBfwU/rGb+BdO8S4L8D0ug/UvcTjN4Vyog/IQQNh0J2NV15cUanTsHsJH7Ruh3j EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu8eta8t5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 09:25:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6E1B410003D;
 Wed, 18 Mar 2020 09:25:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E93B21CA95;
 Wed, 18 Mar 2020 09:25:17 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Mar 2020 09:25:16 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Mar 2020 09:24:57 +0100
Message-ID: <20200318082503.8025-13-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318082503.8025-1-patrick.delaunay@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 12/18] stm32mp: stm32prog: add support for
	delete option in flashlayout
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

Add support for delete option 'D' in flashlayout for
full device or for partitions

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index 3e521d42f2..3573c04d16 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -23,9 +23,11 @@
 
 #define OPT_SELECT	BIT(0)
 #define OPT_EMPTY	BIT(1)
+#define OPT_DELETE	BIT(2)
 
 #define IS_SELECT(part)	((part)->option & OPT_SELECT)
 #define IS_EMPTY(part)	((part)->option & OPT_EMPTY)
+#define IS_DELETE(part)	((part)->option & OPT_DELETE)
 
 #define ALT_BUF_LEN			SZ_1K
 
@@ -158,6 +160,9 @@ static int parse_option(struct stm32prog_data *data,
 		case 'E':
 			part->option |= OPT_EMPTY;
 			break;
+		case 'D':
+			part->option |= OPT_DELETE;
+			break;
 		default:
 			result = -EINVAL;
 			stm32prog_err("Layout line %d: invalid option '%c' in %s)",
@@ -1293,10 +1298,80 @@ void stm32prog_next_phase(struct stm32prog_data *data)
 		puts("Phase=END\n");
 }
 
+static int part_delete(struct stm32prog_data *data,
+		       struct stm32prog_part_t *part)
+{
+	int ret = 0;
+#ifdef CONFIG_MMC
+	unsigned long blks, blks_offset, blks_size;
+	struct blk_desc *block_dev = NULL;
+ #endif
+#ifdef CONFIG_MTD
+	char cmdbuf[40];
+	char devstr[10];
+#endif
+
+	printf("Erasing %s ", part->name);
+	switch (part->target) {
+#ifdef CONFIG_MMC
+	case STM32PROG_MMC:
+		printf("on mmc %d: ", part->dev->dev_id);
+		block_dev = mmc_get_blk_desc(part->dev->mmc);
+		blks_offset = lldiv(part->addr, part->dev->mmc->read_bl_len);
+		blks_size = lldiv(part->size, part->dev->mmc->read_bl_len);
+		/* -1 or -2 : delete boot partition of MMC
+		 * need to switch to associated hwpart 1 or 2
+		 */
+		if (part->part_id < 0)
+			if (blk_select_hwpart_devnum(IF_TYPE_MMC,
+						     part->dev->dev_id,
+						     -part->part_id))
+				return -1;
+
+		blks = blk_derase(block_dev, blks_offset, blks_size);
+
+		/* return to user partition */
+		if (part->part_id < 0)
+			blk_select_hwpart_devnum(IF_TYPE_MMC,
+						 part->dev->dev_id, 0);
+		if (blks != blks_size) {
+			ret = -1;
+			stm32prog_err("%s (0x%x): MMC erase failed",
+				      part->name, part->id);
+		}
+		break;
+#endif
+#ifdef CONFIG_MTD
+	case STM32PROG_NOR:
+	case STM32PROG_NAND:
+	case STM32PROG_SPI_NAND:
+		get_mtd_by_target(devstr, part->target, part->dev->dev_id);
+		printf("on %s: ", devstr);
+		sprintf(cmdbuf, "mtd erase %s 0x%llx 0x%llx",
+			devstr, part->addr, part->size);
+		if (run_command(cmdbuf, 0)) {
+			ret = -1;
+			stm32prog_err("%s (0x%x): MTD erase commands failed (%s)",
+				      part->name, part->id, cmdbuf);
+		}
+		break;
+#endif
+	default:
+		ret = -1;
+		stm32prog_err("%s (0x%x): erase invalid", part->name, part->id);
+		break;
+	}
+	if (!ret)
+		printf("done\n");
+
+	return ret;
+}
+
 static void stm32prog_devices_init(struct stm32prog_data *data)
 {
 	int i;
 	int ret;
+	struct stm32prog_part_t *part;
 
 	ret = treat_partition_list(data);
 	if (ret)
@@ -1309,10 +1384,40 @@ static void stm32prog_devices_init(struct stm32prog_data *data)
 			goto error;
 	}
 
+	/* delete RAW partition before create partition */
+	for (i = 0; i < data->part_nb; i++) {
+		part = &data->part_array[i];
+
+		if (part->part_type != RAW_IMAGE)
+			continue;
+
+		if (!IS_SELECT(part) || !IS_DELETE(part))
+			continue;
+
+		ret = part_delete(data, part);
+		if (ret)
+			goto error;
+	}
+
 	ret = create_partitions(data);
 	if (ret)
 		goto error;
 
+	/* delete partition GPT or MTD */
+	for (i = 0; i < data->part_nb; i++) {
+		part = &data->part_array[i];
+
+		if (part->part_type == RAW_IMAGE)
+			continue;
+
+		if (!IS_SELECT(part) || !IS_DELETE(part))
+			continue;
+
+		ret = part_delete(data, part);
+		if (ret)
+			goto error;
+	}
+
 	return;
 
 error:
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
