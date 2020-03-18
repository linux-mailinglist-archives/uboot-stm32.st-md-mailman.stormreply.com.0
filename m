Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CCF1896F1
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:25:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73DEEC36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 08:25:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90D8FC36B13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 08:25:19 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I8HTVf019413; Wed, 18 Mar 2020 09:25:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=7G6XLsE1bMwCYp8dcvKu5Se5p+eCUAbsSQ6we6ktqSM=;
 b=Zmy5Z7FQ5wEm3UloYQ8Mx5lcloxG8LmO2ZsUcN9WnRQqxNrIcCiF5VvUqcKE2AhtSle6
 gZtc9ZvV35TNqN0HHd6C0VG3WgySReagGbTox1KYaKGTcWR/zshUReG958Gj96+WqxY4
 vsJYNfcr9w1RyNH2+KIyQXSuMOBuPqFoIhHnOpzwHc9U6MgQW9bQbWXmSv52slX4OH9P
 mVGsfNmMv6BlmTqikTPngbxliDeOtC+Debk2gA4sHRs9ooVdImCrB4jneHkPG4LPLbEb
 RdlVh7udSXTVkcwmvEQNS+4jMS3ztAfk1qb4XT7n6jfWb+w53l9Q37RbTzcpSkISNoqc 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu8eta8t4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 09:25:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4745110002A;
 Wed, 18 Mar 2020 09:25:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3D0A221CA95;
 Wed, 18 Mar 2020 09:25:16 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Mar 2020 09:25:15 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Mar 2020 09:24:56 +0100
Message-ID: <20200318082503.8025-12-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318082503.8025-1-patrick.delaunay@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 11/18] stm32mp: stm32prog: add support of ssbl
	copy
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

For reliability of boot from NAND/SPI-NAND (with read-disturb issue)
the SSBL can be present several time, when it is indicated in the
flashlayout with "Binary(X)".
The received binary is copied X times by U-Boot on the target.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 98 ++++++++++++++++++-
 .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |  1 +
 2 files changed, 94 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index 0140fd479d..3e521d42f2 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -210,9 +210,24 @@ static int parse_type(struct stm32prog_data *data,
 		      int i, char *p, struct stm32prog_part_t *part)
 {
 	int result = 0;
+	int len = 0;
 
-	if (!strcmp(p, "Binary")) {
+	part->bin_nb = 0;
+	if (!strncmp(p, "Binary", 6)) {
 		part->part_type = PART_BINARY;
+
+		/* search for Binary(X) case */
+		len = strlen(p);
+		part->bin_nb = 1;
+		if (len > 6) {
+			if (len < 8 ||
+			    (p[6] != '(') ||
+			    (p[len - 1] != ')'))
+				result = -EINVAL;
+			else
+				part->bin_nb =
+					simple_strtoul(&p[7], NULL, 10);
+		}
 	} else if (!strcmp(p, "System")) {
 		part->part_type = PART_SYSTEM;
 	} else if (!strcmp(p, "FileSystem")) {
@@ -600,6 +615,17 @@ static int init_device(struct stm32prog_data *data,
 	part_id = 1;
 	pr_debug("id : Opt Phase     Name target.n dev.n addr     size     part_off part_size\n");
 	list_for_each_entry(part, &dev->part_list, list) {
+		if (part->bin_nb > 1) {
+			if ((dev->target != STM32PROG_NAND &&
+			     dev->target != STM32PROG_SPI_NAND) ||
+			    part->id >= PHASE_FIRST_USER ||
+			    strncmp(part->name, "fsbl", 4)) {
+				stm32prog_err("%s (0x%x): multiple binary %d not supported",
+					      part->name, part->id,
+					      part->bin_nb);
+				return -EINVAL;
+			}
+		}
 		if (part->part_type == RAW_IMAGE) {
 			part->part_id = 0x0;
 			part->addr = 0x0;
@@ -607,9 +633,9 @@ static int init_device(struct stm32prog_data *data,
 				part->size = block_dev->lba * block_dev->blksz;
 			else
 				part->size = last_addr;
-			pr_debug("-- : %1d %02x %14s %02d %02d.%02d %08llx %08llx\n",
+			pr_debug("-- : %1d %02x %14s %02d.%d %02d.%02d %08llx %08llx\n",
 				 part->option, part->id, part->name,
-				 part->part_type, part->target,
+				 part->part_type, part->bin_nb, part->target,
 				 part->dev_id, part->addr, part->size);
 			continue;
 		}
@@ -666,9 +692,9 @@ static int init_device(struct stm32prog_data *data,
 				      part->dev->erase_size);
 			return -EINVAL;
 		}
-		pr_debug("%02d : %1d %02x %14s %02d %02d.%02d %08llx %08llx",
+		pr_debug("%02d : %1d %02x %14s %02d.%d %02d.%02d %08llx %08llx",
 			 part->part_id, part->option, part->id, part->name,
-			 part->part_type, part->target,
+			 part->part_type, part->bin_nb, part->target,
 			 part->dev_id, part->addr, part->size);
 
 		part_addr = 0;
@@ -1133,6 +1159,59 @@ static int dfu_init_entities(struct stm32prog_data *data)
 	return ret;
 }
 
+/* copy FSBL on NAND to improve reliability on NAND */
+static int stm32prog_copy_fsbl(struct stm32prog_part_t *part)
+{
+	int ret, i;
+	void *fsbl;
+	struct image_header_s header;
+	struct raw_header_s raw_header;
+	struct dfu_entity *dfu;
+	long size, offset;
+
+	if (part->target != STM32PROG_NAND &&
+	    part->target != STM32PROG_SPI_NAND)
+		return -1;
+
+	dfu = dfu_get_entity(part->alt_id);
+
+	/* read header */
+	dfu_transaction_cleanup(dfu);
+	size = BL_HEADER_SIZE;
+	ret = dfu->read_medium(dfu, 0, (void *)&raw_header, &size);
+	if (ret)
+		return ret;
+	if (stm32prog_header_check(&raw_header, &header))
+		return -1;
+
+	/* read header + payload */
+	size = header.image_length + BL_HEADER_SIZE;
+	size = round_up(size, part->dev->mtd->erasesize);
+	fsbl = calloc(1, size);
+	if (!fsbl)
+		return -ENOMEM;
+	ret = dfu->read_medium(dfu, 0, fsbl, &size);
+	pr_debug("%s read size=%lx ret=%d\n", __func__, size, ret);
+	if (ret)
+		goto error;
+
+	dfu_transaction_cleanup(dfu);
+	offset = 0;
+	for (i = part->bin_nb - 1; i > 0; i--) {
+		offset += size;
+		/* write to the next erase block */
+		ret = dfu->write_medium(dfu, offset, fsbl, &size);
+		pr_debug("%s copy at ofset=%lx size=%lx ret=%d",
+			 __func__, offset, size, ret);
+		if (ret)
+			goto error;
+	}
+
+error:
+	free(fsbl);
+	return ret;
+}
+
 static void stm32prog_end_phase(struct stm32prog_data *data)
 {
 	if (data->phase == PHASE_FLASHLAYOUT) {
@@ -1156,6 +1235,15 @@ static void stm32prog_end_phase(struct stm32prog_data *data)
 			return;
 		}
 	}
+
+	if (CONFIG_IS_ENABLED(MTD) &&
+	    data->cur_part->bin_nb > 1) {
+		if (stm32prog_copy_fsbl(data->cur_part)) {
+			stm32prog_err("%s (0x%x): copy of fsbl failed",
+				      data->cur_part->name, data->cur_part->id);
+			return;
+		}
+	}
 }
 
 void stm32prog_do_reset(struct stm32prog_data *data)
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
index 7f06627ebc..1880b163d7 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
@@ -91,6 +91,7 @@ struct stm32prog_part_t {
 	char			name[16 + 1];
 	u64			addr;
 	u64			size;
+	enum stm32prog_part_type bin_nb;	/* SSBL repeatition */
 
 	/* information on associated device */
 	struct stm32prog_dev_t	*dev;		/* pointer to device */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
