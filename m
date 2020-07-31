Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D498F2347DA
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 16:32:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BD56C36B35
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 14:32:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58FD3C36B35
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:32:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VEScrm016907; Fri, 31 Jul 2020 16:32:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=772VuvTtBrmdjDa4EktV5RupLhMEbKn8DFH3KSt84cQ=;
 b=Dmg6WF6Ode8jGp55v9ElNhpAafeBPc6pfG5T9wbp4eFw6QxS3GkExeK9DTrpqpayuxq/
 mDzWaxE3I/oBVmcXaIFvd44cyUiIUQGQwO8h2I98noThFV73zwBybvFlTnAk+IKdm+4u
 GPLpHJkuL324+1wcn04kbi45AE0jrZUV1u7vWSwYitRftGnn/wVM3k3glu4sAHbwpS5D
 K5IlTE4+MRFJmI5uSPqjqNhQKBTsW407QO2vNPr3woBlCSJUo717FpBgiNdAyyG9A/BL
 ICQ6jVZFG6mstKR5LibWZxmrX+mZq/0dYmf2X4tBLkv0xLw3zvKhH52UK8RNbCcsSWhr jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gbmgpu9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 16:32:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6F3F910002A;
 Fri, 31 Jul 2020 16:32:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 617E62B1899;
 Fri, 31 Jul 2020 16:32:05 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 31 Jul 2020 16:32:04 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 31 Jul 2020 16:31:52 +0200
Message-ID: <20200731143152.8812-11-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731143152.8812-1-patrick.delaunay@st.com>
References: <20200731143152.8812-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_05:2020-07-31,
 2020-07-31 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH 11/11] arm: stm32mp: stm32prog: use IS_ENABLED
	to prevent ifdef
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

Use IS_ENABLED to prevent ifdef in stm32prog command.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 .../cmd_stm32prog/cmd_stm32prog.c             |   5 +-
 .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 100 ++++++++++--------
 2 files changed, 58 insertions(+), 47 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
index cbf0120adc..49dd25b28f 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
@@ -14,7 +14,6 @@ struct stm32prog_data *stm32prog_data;
 
 static void enable_vidconsole(void)
 {
-#ifdef CONFIG_DM_VIDEO
 	char *stdname;
 	char buf[64];
 
@@ -35,7 +34,6 @@ static void enable_vidconsole(void)
 			snprintf(buf, sizeof(buf), "%s,vidconsole", stdname);
 		env_set("stderr", buf);
 	}
-#endif
 }
 
 static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
@@ -86,7 +84,8 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
 						   "script@1");
 	}
 
-	enable_vidconsole();
+	if (IS_ENABLED(CONFIG_DM_VIDEO))
+		enable_vidconsole();
 
 	data = (struct stm32prog_data *)malloc(sizeof(*data));
 
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index e4199dbaa5..ec3355d816 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -544,10 +544,8 @@ static int init_device(struct stm32prog_data *data,
 {
 	struct mmc *mmc = NULL;
 	struct blk_desc *block_dev = NULL;
-#ifdef CONFIG_MTD
 	struct mtd_info *mtd = NULL;
 	char mtd_id[16];
-#endif
 	int part_id;
 	int ret;
 	u64 first_addr = 0, last_addr = 0;
@@ -557,8 +555,11 @@ static int init_device(struct stm32prog_data *data,
 	const char *part_name;
 
 	switch (dev->target) {
-#ifdef CONFIG_MMC
 	case STM32PROG_MMC:
+		if (!IS_ENABLED(CONFIG_MMC)) {
+			stm32prog_err("unknown device type = %d", dev->target);
+			return -ENODEV;
+		}
 		mmc = find_mmc_device(dev->dev_id);
 		if (!mmc || mmc_init(mmc)) {
 			stm32prog_err("mmc device %d not found", dev->dev_id);
@@ -589,11 +590,13 @@ static int init_device(struct stm32prog_data *data,
 			 first_addr, last_addr);
 		pr_debug(" full_update = %d\n", dev->full_update);
 		break;
-#endif
-#ifdef CONFIG_MTD
 	case STM32PROG_NOR:
 	case STM32PROG_NAND:
 	case STM32PROG_SPI_NAND:
+		if (!IS_ENABLED(CONFIG_MTD)) {
+			stm32prog_err("unknown device type = %d", dev->target);
+			return -ENODEV;
+		}
 		get_mtd_by_target(mtd_id, dev->target, dev->dev_id);
 		pr_debug("%s\n", mtd_id);
 
@@ -612,7 +615,6 @@ static int init_device(struct stm32prog_data *data,
 			 first_addr, last_addr);
 		dev->mtd = mtd;
 		break;
-#endif
 	case STM32PROG_RAM:
 		first_addr = gd->bd->bi_dram[0].start;
 		last_addr = first_addr + gd->bd->bi_dram[0].size;
@@ -744,8 +746,7 @@ static int init_device(struct stm32prog_data *data,
 			part_found = true;
 		}
 
-#ifdef CONFIG_MTD
-		if (mtd) {
+		if (IS_ENABLED(CONFIG_MTD) && mtd) {
 			char mtd_part_id[32];
 			struct part_info *mtd_part;
 			struct mtd_device *mtd_dev;
@@ -766,7 +767,7 @@ static int init_device(struct stm32prog_data *data,
 			part_name = mtd_part->name;
 			part_found = true;
 		}
-#endif
+
 		if (!part_found) {
 			stm32prog_err("%s (0x%x): Invalid partition",
 				      part->name, part->id);
@@ -873,9 +874,8 @@ static int treat_partition_list(struct stm32prog_data *data)
 	return 0;
 }
 
-static int create_partitions(struct stm32prog_data *data)
+static int create_gpt_partitions(struct stm32prog_data *data)
 {
-#ifdef CONFIG_MMC
 	int offset = 0;
 	const int buflen = SZ_8K;
 	char *buf;
@@ -991,7 +991,6 @@ static int create_partitions(struct stm32prog_data *data)
 	run_command("mtd list", 0);
 #endif
 	free(buf);
-#endif
 
 	return 0;
 }
@@ -1070,28 +1069,35 @@ static int stm32prog_alt_add(struct stm32prog_data *data,
 		offset += snprintf(buf + offset, ALT_BUF_LEN - offset,
 				   " %d;", part->part_id);
 	}
+	ret = -ENODEV;
 	switch (part->target) {
-#ifdef CONFIG_MMC
 	case STM32PROG_MMC:
-		sprintf(dfustr, "mmc");
-		sprintf(devstr, "%d", part->dev_id);
+		if (IS_ENABLED(CONFIG_MMC)) {
+			ret = 0;
+			sprintf(dfustr, "mmc");
+			sprintf(devstr, "%d", part->dev_id);
+		}
 		break;
-#endif
-#ifdef CONFIG_MTD
 	case STM32PROG_NAND:
 	case STM32PROG_NOR:
 	case STM32PROG_SPI_NAND:
-		sprintf(dfustr, "mtd");
-		get_mtd_by_target(devstr, part->target, part->dev_id);
+		if (IS_ENABLED(CONFIG_MTD)) {
+			ret = 0;
+			sprintf(dfustr, "mtd");
+			get_mtd_by_target(devstr, part->target, part->dev_id);
+		}
 		break;
-#endif
 	case STM32PROG_RAM:
+		ret = 0;
 		sprintf(dfustr, "ram");
 		sprintf(devstr, "0");
 		break;
 	default:
+		break;
+	}
+	if (ret) {
 		stm32prog_err("invalid target: %d", part->target);
-		return -ENODEV;
+		return ret;
 	}
 	pr_debug("dfu_alt_add(%s,%s,%s)\n", dfustr, devstr, buf);
 	ret = dfu_alt_add(dfu, dfustr, devstr, buf);
@@ -1213,13 +1219,14 @@ int stm32prog_otp_write(struct stm32prog_data *data, u32 offset, u8 *buffer,
 int stm32prog_otp_read(struct stm32prog_data *data, u32 offset, u8 *buffer,
 		       long *size)
 {
-#ifndef CONFIG_ARM_SMCCC
-	stm32prog_err("OTP update not supported");
-
-	return -1;
-#else
 	int result = 0;
 
+	if (!IS_ENABLED(CONFIG_ARM_SMCCC)) {
+		stm32prog_err("OTP update not supported");
+
+		return -1;
+	}
+
 	pr_debug("%s: %x %lx\n", __func__, offset, *size);
 	/* alway read for first packet */
 	if (!offset) {
@@ -1255,19 +1262,19 @@ end_otp_read:
 	pr_debug("%s: result %i\n", __func__, result);
 
 	return result;
-#endif
 }
 
 int stm32prog_otp_start(struct stm32prog_data *data)
 {
-#ifndef CONFIG_ARM_SMCCC
-	stm32prog_err("OTP update not supported");
-
-	return -1;
-#else
 	int result = 0;
 	struct arm_smccc_res res;
 
+	if (!IS_ENABLED(CONFIG_ARM_SMCCC)) {
+		stm32prog_err("OTP update not supported");
+
+		return -1;
+	}
+
 	if (!data->otp_part) {
 		stm32prog_err("start OTP without data");
 		return -1;
@@ -1302,7 +1309,6 @@ int stm32prog_otp_start(struct stm32prog_data *data)
 	pr_debug("%s: result %i\n", __func__, result);
 
 	return result;
-#endif
 }
 
 int stm32prog_pmic_write(struct stm32prog_data *data, u32 offset, u8 *buffer,
@@ -1538,19 +1544,20 @@ static int part_delete(struct stm32prog_data *data,
 		       struct stm32prog_part_t *part)
 {
 	int ret = 0;
-#ifdef CONFIG_MMC
 	unsigned long blks, blks_offset, blks_size;
 	struct blk_desc *block_dev = NULL;
- #endif
-#ifdef CONFIG_MTD
 	char cmdbuf[40];
 	char devstr[10];
-#endif
 
 	printf("Erasing %s ", part->name);
 	switch (part->target) {
-#ifdef CONFIG_MMC
 	case STM32PROG_MMC:
+		if (!IS_ENABLED(CONFIG_MMC)) {
+			ret = -1;
+			stm32prog_err("%s (0x%x): erase invalid",
+				      part->name, part->id);
+			break;
+		}
 		printf("on mmc %d: ", part->dev->dev_id);
 		block_dev = mmc_get_blk_desc(part->dev->mmc);
 		blks_offset = lldiv(part->addr, part->dev->mmc->read_bl_len);
@@ -1576,11 +1583,15 @@ static int part_delete(struct stm32prog_data *data,
 				      part->name, part->id);
 		}
 		break;
-#endif
-#ifdef CONFIG_MTD
 	case STM32PROG_NOR:
 	case STM32PROG_NAND:
 	case STM32PROG_SPI_NAND:
+		if (!IS_ENABLED(CONFIG_MTD)) {
+			ret = -1;
+			stm32prog_err("%s (0x%x): erase invalid",
+				      part->name, part->id);
+			break;
+		}
 		get_mtd_by_target(devstr, part->target, part->dev->dev_id);
 		printf("on %s: ", devstr);
 		sprintf(cmdbuf, "mtd erase %s 0x%llx 0x%llx",
@@ -1591,7 +1602,6 @@ static int part_delete(struct stm32prog_data *data,
 				      part->name, part->id, cmdbuf);
 		}
 		break;
-#endif
 	case STM32PROG_RAM:
 		printf("on ram: ");
 		memset((void *)(uintptr_t)part->addr, 0, (size_t)part->size);
@@ -1639,9 +1649,11 @@ static void stm32prog_devices_init(struct stm32prog_data *data)
 			goto error;
 	}
 
-	ret = create_partitions(data);
-	if (ret)
-		goto error;
+	if (IS_ENABLED(CONFIG_MMC)) {
+		ret = create_gpt_partitions(data);
+		if (ret)
+			goto error;
+	}
 
 	/* delete partition GPT or MTD */
 	for (i = 0; i < data->part_nb; i++) {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
