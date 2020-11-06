Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 337062A9B62
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 19:02:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F26B5C36B36;
	Fri,  6 Nov 2020 18:02:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F5EFC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 18:02:16 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6HvRhF007306; Fri, 6 Nov 2020 19:02:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=+7MpAaUw0QoNb/JkxKbenIPO1BYI47jh6OSms4FyRPk=;
 b=04A4GJq1WxCOIBQWmtgPVSjepxC/Q4OMoE8gkTpx3srdLSq6h1/PCfjkyq/VUjY2uByX
 onofVVlusBJfp4xtoKGNkidQRnOa3l2EurPqARu7Cw0jucCMSsT84SyT4ESqIa5BJR5W
 hpEfnMaMLwRW7wuixRLJDPHm+SRd7jOgzrzxFhbiJ32B1dP8OmMOel4oNnGZWv5pKgnO
 +y57g/ks8KNAvaFXoqat5skDi4TqIsq/p8mdE1RWLRo9jhhh4CeO7P5Gb9Ip6EGtTPO1
 zxPXXiumk2ZwWnjBRr8y5zI+j9+Ru8C2bCk5ruWGDDbM22/AWkEL2sfgnNHZbrpN2WWx lA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34h0328rvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 19:02:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6086510002A;
 Fri,  6 Nov 2020 19:02:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 57CCF24C782;
 Fri,  6 Nov 2020 19:02:08 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 19:02:07
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Nov 2020 19:01:30 +0100
Message-ID: <20201106180201.31784-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106180201.31784-1-patrick.delaunay@st.com>
References: <20201106180201.31784-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 02/33] arm: stm32mp: migrate cmd_stm32prog
	to log macro
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

Change debug and pr_ macro to log macro.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---

Changes in v2:
- solve rebase conflict

 .../cmd_stm32prog/cmd_stm32prog.c             |   4 +-
 .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 112 +++++++++---------
 .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |   2 +-
 .../cmd_stm32prog/stm32prog_serial.c          |  24 ++--
 .../cmd_stm32prog/stm32prog_usb.c             |  14 +--
 5 files changed, 78 insertions(+), 78 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
index 49dd25b28f..34a6be66c3 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
@@ -56,7 +56,7 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
 		link = LINK_SERIAL;
 
 	if (link == LINK_UNDEFINED) {
-		pr_err("not supported link=%s\n", argv[1]);
+		log_err("not supported link=%s\n", argv[1]);
 		return CMD_RET_USAGE;
 	}
 
@@ -90,7 +90,7 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
 	data = (struct stm32prog_data *)malloc(sizeof(*data));
 
 	if (!data) {
-		pr_err("Alloc failed.");
+		log_err("Alloc failed.");
 		return CMD_RET_FAILURE;
 	}
 	stm32prog_data = data;
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index a777827c55..0c6f25617b 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -97,28 +97,28 @@ u8 stm32prog_header_check(struct raw_header_s *raw_header,
 	header->image_length = 0x0;
 
 	if (!raw_header || !header) {
-		pr_debug("%s:no header data\n", __func__);
+		log_debug("%s:no header data\n", __func__);
 		return -1;
 	}
 	if (raw_header->magic_number !=
 		(('S' << 0) | ('T' << 8) | ('M' << 16) | (0x32 << 24))) {
-		pr_debug("%s:invalid magic number : 0x%x\n",
-			 __func__, raw_header->magic_number);
+		log_debug("%s:invalid magic number : 0x%x\n",
+			  __func__, raw_header->magic_number);
 		return -2;
 	}
 	/* only header v1.0 supported */
 	if (raw_header->header_version != 0x00010000) {
-		pr_debug("%s:invalid header version : 0x%x\n",
-			 __func__, raw_header->header_version);
+		log_debug("%s:invalid header version : 0x%x\n",
+			  __func__, raw_header->header_version);
 		return -3;
 	}
 	if (raw_header->reserved1 != 0x0 || raw_header->reserved2) {
-		pr_debug("%s:invalid reserved field\n", __func__);
+		log_debug("%s:invalid reserved field\n", __func__);
 		return -4;
 	}
 	for (i = 0; i < (sizeof(raw_header->padding) / 4); i++) {
 		if (raw_header->padding[i] != 0) {
-			pr_debug("%s:invalid padding field\n", __func__);
+			log_debug("%s:invalid padding field\n", __func__);
 			return -5;
 		}
 	}
@@ -376,7 +376,7 @@ static int parse_flash_layout(struct stm32prog_data *data,
 	last = start + size;
 
 	*last = 0x0; /* force null terminated string */
-	pr_debug("flash layout =\n%s\n", start);
+	log_debug("flash layout =\n%s\n", start);
 
 	/* calculate expected number of partitions */
 	part_list_size = 1;
@@ -584,11 +584,11 @@ static int init_device(struct stm32prog_data *data,
 			last_addr = (u64)(block_dev->lba - GPT_HEADER_SZ - 1) *
 				    block_dev->blksz;
 		}
-		pr_debug("MMC %d: lba=%ld blksz=%ld\n", dev->dev_id,
-			 block_dev->lba, block_dev->blksz);
-		pr_debug(" available address = 0x%llx..0x%llx\n",
-			 first_addr, last_addr);
-		pr_debug(" full_update = %d\n", dev->full_update);
+		log_debug("MMC %d: lba=%ld blksz=%ld\n", dev->dev_id,
+			  block_dev->lba, block_dev->blksz);
+		log_debug(" available address = 0x%llx..0x%llx\n",
+			  first_addr, last_addr);
+		log_debug(" full_update = %d\n", dev->full_update);
 		break;
 	case STM32PROG_NOR:
 	case STM32PROG_NAND:
@@ -598,7 +598,7 @@ static int init_device(struct stm32prog_data *data,
 			return -ENODEV;
 		}
 		get_mtd_by_target(mtd_id, dev->target, dev->dev_id);
-		pr_debug("%s\n", mtd_id);
+		log_debug("%s\n", mtd_id);
 
 		mtdparts_init();
 		mtd = get_mtd_device_nm(mtd_id);
@@ -609,10 +609,10 @@ static int init_device(struct stm32prog_data *data,
 		first_addr = 0;
 		last_addr = mtd->size;
 		dev->erase_size = mtd->erasesize;
-		pr_debug("MTD device %s: size=%lld erasesize=%d\n",
-			 mtd_id, mtd->size, mtd->erasesize);
-		pr_debug(" available address = 0x%llx..0x%llx\n",
-			 first_addr, last_addr);
+		log_debug("MTD device %s: size=%lld erasesize=%d\n",
+			  mtd_id, mtd->size, mtd->erasesize);
+		log_debug(" available address = 0x%llx..0x%llx\n",
+			  first_addr, last_addr);
 		dev->mtd = mtd;
 		break;
 	case STM32PROG_RAM:
@@ -624,13 +624,13 @@ static int init_device(struct stm32prog_data *data,
 		stm32prog_err("unknown device type = %d", dev->target);
 		return -ENODEV;
 	}
-	pr_debug(" erase size = 0x%x\n", dev->erase_size);
-	pr_debug(" full_update = %d\n", dev->full_update);
+	log_debug(" erase size = 0x%x\n", dev->erase_size);
+	log_debug(" full_update = %d\n", dev->full_update);
 
 	/* order partition list in offset order */
 	list_sort(NULL, &dev->part_list, &part_cmp);
 	part_id = 1;
-	pr_debug("id : Opt Phase     Name target.n dev.n addr     size     part_off part_size\n");
+	log_debug("id : Opt Phase     Name target.n dev.n addr     size     part_off part_size\n");
 	list_for_each_entry(part, &dev->part_list, list) {
 		if (part->bin_nb > 1) {
 			if ((dev->target != STM32PROG_NAND &&
@@ -650,10 +650,10 @@ static int init_device(struct stm32prog_data *data,
 				part->size = block_dev->lba * block_dev->blksz;
 			else
 				part->size = last_addr;
-			pr_debug("-- : %1d %02x %14s %02d.%d %02d.%02d %08llx %08llx\n",
-				 part->option, part->id, part->name,
-				 part->part_type, part->bin_nb, part->target,
-				 part->dev_id, part->addr, part->size);
+			log_debug("-- : %1d %02x %14s %02d.%d %02d.%02d %08llx %08llx\n",
+				  part->option, part->id, part->name,
+				  part->part_type, part->bin_nb, part->target,
+				  part->dev_id, part->addr, part->size);
 			continue;
 		}
 		if (part->part_id < 0) { /* boot hw partition for eMMC */
@@ -709,10 +709,10 @@ static int init_device(struct stm32prog_data *data,
 				      part->dev->erase_size);
 			return -EINVAL;
 		}
-		pr_debug("%02d : %1d %02x %14s %02d.%d %02d.%02d %08llx %08llx",
-			 part->part_id, part->option, part->id, part->name,
-			 part->part_type, part->bin_nb, part->target,
-			 part->dev_id, part->addr, part->size);
+		log_debug("%02d : %1d %02x %14s %02d.%d %02d.%02d %08llx %08llx",
+			  part->part_id, part->option, part->id, part->name,
+			  part->part_type, part->bin_nb, part->target,
+			  part->dev_id, part->addr, part->size);
 
 		part_addr = 0;
 		part_size = 0;
@@ -726,7 +726,7 @@ static int init_device(struct stm32prog_data *data,
 			 * created for full update
 			 */
 			if (dev->full_update || part->part_id < 0) {
-				pr_debug("\n");
+				log_debug("\n");
 				continue;
 			}
 			struct disk_partition partinfo;
@@ -770,11 +770,11 @@ static int init_device(struct stm32prog_data *data,
 
 		/* no partition for this device */
 		if (!part_found) {
-			pr_debug("\n");
+			log_debug("\n");
 			continue;
 		}
 
-		pr_debug(" %08llx %08llx\n", part_addr, part_size);
+		log_debug(" %08llx %08llx\n", part_addr, part_size);
 
 		if (part->addr != part_addr) {
 			stm32prog_err("%s (0x%x): Bad address for partition %d (%s) = 0x%llx <> 0x%llx expected",
@@ -910,8 +910,8 @@ static int create_gpt_partitions(struct stm32prog_data *data)
 				continue;
 
 			if (offset + 100 > buflen) {
-				pr_debug("\n%s: buffer too small, %s skippped",
-					 __func__, part->name);
+				log_debug("\n%s: buffer too small, %s skippped",
+					  __func__, part->name);
 				continue;
 			}
 
@@ -959,7 +959,7 @@ static int create_gpt_partitions(struct stm32prog_data *data)
 
 		if (offset) {
 			offset += snprintf(buf + offset, buflen - offset, "\"");
-			pr_debug("\ncmd: %s\n", buf);
+			log_debug("\ncmd: %s\n", buf);
 			if (run_command(buf, 0)) {
 				stm32prog_err("GPT partitionning fail: %s",
 					      buf);
@@ -974,7 +974,7 @@ static int create_gpt_partitions(struct stm32prog_data *data)
 
 #ifdef DEBUG
 		sprintf(buf, "gpt verify mmc %d", data->dev[i].dev_id);
-		pr_debug("\ncmd: %s", buf);
+		log_debug("\ncmd: %s", buf);
 		if (run_command(buf, 0))
 			printf("fail !\n");
 		else
@@ -1098,10 +1098,10 @@ static int stm32prog_alt_add(struct stm32prog_data *data,
 		stm32prog_err("invalid target: %d", part->target);
 		return ret;
 	}
-	pr_debug("dfu_alt_add(%s,%s,%s)\n", dfustr, devstr, buf);
+	log_debug("dfu_alt_add(%s,%s,%s)\n", dfustr, devstr, buf);
 	ret = dfu_alt_add(dfu, dfustr, devstr, buf);
-	pr_debug("dfu_alt_add(%s,%s,%s) result %d\n",
-		 dfustr, devstr, buf, ret);
+	log_debug("dfu_alt_add(%s,%s,%s) result %d\n",
+		  dfustr, devstr, buf, ret);
 
 	return ret;
 }
@@ -1116,7 +1116,7 @@ static int stm32prog_alt_add_virt(struct dfu_entity *dfu,
 	sprintf(devstr, "%d", phase);
 	sprintf(buf, "@%s/0x%02x/1*%dBe", name, phase, size);
 	ret = dfu_alt_add(dfu, "virt", devstr, buf);
-	pr_debug("dfu_alt_add(virt,%s,%s) result %d\n", devstr, buf, ret);
+	log_debug("dfu_alt_add(virt,%s,%s) result %d\n", devstr, buf, ret);
 
 	return ret;
 }
@@ -1171,7 +1171,7 @@ static int dfu_init_entities(struct stm32prog_data *data)
 		sprintf(buf, "@FlashLayout/0x%02x/1*256Ke ram %x 40000",
 			PHASE_FLASHLAYOUT, STM32_DDR_BASE);
 		ret = dfu_alt_add(dfu, "ram", NULL, buf);
-		pr_debug("dfu_alt_add(ram, NULL,%s) result %d\n", buf, ret);
+		log_debug("dfu_alt_add(ram, NULL,%s) result %d\n", buf, ret);
 	}
 
 	if (!ret)
@@ -1196,7 +1196,7 @@ static int dfu_init_entities(struct stm32prog_data *data)
 int stm32prog_otp_write(struct stm32prog_data *data, u32 offset, u8 *buffer,
 			long *size)
 {
-	pr_debug("%s: %x %lx\n", __func__, offset, *size);
+	log_debug("%s: %x %lx\n", __func__, offset, *size);
 
 	if (!data->otp_part) {
 		data->otp_part = memalign(CONFIG_SYS_CACHELINE_SIZE, OTP_SIZE);
@@ -1226,7 +1226,7 @@ int stm32prog_otp_read(struct stm32prog_data *data, u32 offset, u8 *buffer,
 		return -1;
 	}
 
-	pr_debug("%s: %x %lx\n", __func__, offset, *size);
+	log_debug("%s: %x %lx\n", __func__, offset, *size);
 	/* alway read for first packet */
 	if (!offset) {
 		if (!data->otp_part)
@@ -1258,7 +1258,7 @@ int stm32prog_otp_read(struct stm32prog_data *data, u32 offset, u8 *buffer,
 	memcpy(buffer, (void *)((u32)data->otp_part + offset), *size);
 
 end_otp_read:
-	pr_debug("%s: result %i\n", __func__, result);
+	log_debug("%s: result %i\n", __func__, result);
 
 	return result;
 }
@@ -1292,20 +1292,20 @@ int stm32prog_otp_start(struct stm32prog_data *data)
 			result = 0;
 			break;
 		default:
-			pr_err("%s: OTP incorrect value (err = %ld)\n",
-			       __func__, res.a1);
+			log_err("%s: OTP incorrect value (err = %ld)\n",
+				__func__, res.a1);
 			result = -EINVAL;
 			break;
 		}
 	} else {
-		pr_err("%s: Failed to exec svc=%x op=%x in secure mode (err = %ld)\n",
-		       __func__, STM32_SMC_BSEC, STM32_SMC_WRITE_ALL, res.a0);
+		log_err("%s: Failed to exec svc=%x op=%x in secure mode (err = %ld)\n",
+			__func__, STM32_SMC_BSEC, STM32_SMC_WRITE_ALL, res.a0);
 		result = -EINVAL;
 	}
 
 	free(data->otp_part);
 	data->otp_part = NULL;
-	pr_debug("%s: result %i\n", __func__, result);
+	log_debug("%s: result %i\n", __func__, result);
 
 	return result;
 }
@@ -1313,7 +1313,7 @@ int stm32prog_otp_start(struct stm32prog_data *data)
 int stm32prog_pmic_write(struct stm32prog_data *data, u32 offset, u8 *buffer,
 			 long *size)
 {
-	pr_debug("%s: %x %lx\n", __func__, offset, *size);
+	log_debug("%s: %x %lx\n", __func__, offset, *size);
 
 	if (!offset)
 		memset(data->pmic_part, 0, PMIC_SIZE);
@@ -1338,7 +1338,7 @@ int stm32prog_pmic_read(struct stm32prog_data *data, u32 offset, u8 *buffer,
 		return -EOPNOTSUPP;
 	}
 
-	pr_debug("%s: %x %lx\n", __func__, offset, *size);
+	log_debug("%s: %x %lx\n", __func__, offset, *size);
 	ret = uclass_get_device_by_driver(UCLASS_MISC,
 					  DM_GET_DRIVER(stpmic1_nvm),
 					  &dev);
@@ -1373,7 +1373,7 @@ int stm32prog_pmic_read(struct stm32prog_data *data, u32 offset, u8 *buffer,
 	memcpy(buffer, &data->pmic_part[offset], *size);
 
 end_pmic_read:
-	pr_debug("%s: result %i\n", __func__, result);
+	log_debug("%s: result %i\n", __func__, result);
 	return result;
 }
 
@@ -1429,7 +1429,7 @@ static int stm32prog_copy_fsbl(struct stm32prog_part_t *part)
 	if (!fsbl)
 		return -ENOMEM;
 	ret = dfu->read_medium(dfu, 0, fsbl, &size);
-	pr_debug("%s read size=%lx ret=%d\n", __func__, size, ret);
+	log_debug("%s read size=%lx ret=%d\n", __func__, size, ret);
 	if (ret)
 		goto error;
 
@@ -1439,8 +1439,8 @@ static int stm32prog_copy_fsbl(struct stm32prog_part_t *part)
 		offset += size;
 		/* write to the next erase block */
 		ret = dfu->write_medium(dfu, offset, fsbl, &size);
-		pr_debug("%s copy at ofset=%lx size=%lx ret=%d",
-			 __func__, offset, size, ret);
+		log_debug("%s copy at ofset=%lx size=%lx ret=%d",
+			  __func__, offset, size, ret);
 		if (ret)
 			goto error;
 	}
@@ -1751,6 +1751,6 @@ void dfu_initiated_callback(struct dfu_entity *dfu)
 	if (dfu->alt == stm32prog_data->cur_part->alt_id) {
 		dfu->offset = stm32prog_data->offset;
 		stm32prog_data->dfu_seq = 0;
-		pr_debug("dfu offset = 0x%llx\n", dfu->offset);
+		log_debug("dfu offset = 0x%llx\n", dfu->offset);
 	}
 }
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
index bae4e91c01..be482c3402 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
@@ -172,7 +172,7 @@ char *stm32prog_get_error(struct stm32prog_data *data);
 	if (data->phase != PHASE_RESET) { \
 		sprintf(data->error, args); \
 		data->phase = PHASE_RESET; \
-		pr_err("Error: %s\n", data->error); } \
+		log_err("Error: %s\n", data->error); } \
 	}
 
 /* Main function */
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
index 8aad4be467..e534b3fa82 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
@@ -159,8 +159,8 @@ static int stm32prog_read(struct stm32prog_data *data, u8 phase, u32 offset,
 		dfu_entity->offset = offset;
 	data->offset = offset;
 	data->read_phase = phase;
-	pr_debug("\nSTM32 download read %s offset=0x%x\n",
-		 dfu_entity->name, offset);
+	log_debug("\nSTM32 download read %s offset=0x%x\n",
+		  dfu_entity->name, offset);
 	ret = dfu_read(dfu_entity, buffer, buffer_size,
 		       dfu_entity->i_blk_seq_num);
 	if (ret < 0) {
@@ -198,7 +198,7 @@ int stm32prog_serial_init(struct stm32prog_data *data, int link_dev)
 	sprintf(alias, "serial%d", link_dev);
 	path = fdt_get_alias(gd->fdt_blob, alias);
 	if (!path) {
-		pr_err("%s alias not found", alias);
+		log_err("%s alias not found", alias);
 		return -ENODEV;
 	}
 	node = fdt_path_offset(gd->fdt_blob, path);
@@ -212,7 +212,7 @@ int stm32prog_serial_init(struct stm32prog_data *data, int link_dev)
 			down_serial_dev = dev;
 	}
 	if (!down_serial_dev) {
-		pr_err("%s = %s device not found", alias, path);
+		log_err("%s = %s device not found", alias, path);
 		return -ENODEV;
 	}
 
@@ -225,11 +225,11 @@ int stm32prog_serial_init(struct stm32prog_data *data, int link_dev)
 	ops = serial_get_ops(down_serial_dev);
 
 	if (!ops) {
-		pr_err("%s = %s missing ops", alias, path);
+		log_err("%s = %s missing ops", alias, path);
 		return -ENODEV;
 	}
 	if (!ops->setconfig) {
-		pr_err("%s = %s missing setconfig", alias, path);
+		log_err("%s = %s missing setconfig", alias, path);
 		return -ENODEV;
 	}
 
@@ -815,7 +815,7 @@ static void download_command(struct stm32prog_data *data)
 
 		if (data->cursor >
 		    image_header->image_length + BL_HEADER_SIZE) {
-			pr_err("expected size exceeded\n");
+			log_err("expected size exceeded\n");
 			result = ABORT_BYTE;
 			goto end;
 		}
@@ -859,8 +859,8 @@ static void read_partition_command(struct stm32prog_data *data)
 
 	rcv_data = stm32prog_serial_getc();
 	if (rcv_data != tmp_xor) {
-		pr_debug("1st checksum received = %x, computed %x\n",
-			 rcv_data, tmp_xor);
+		log_debug("1st checksum received = %x, computed %x\n",
+			  rcv_data, tmp_xor);
 		goto error;
 	}
 	stm32prog_serial_putc(ACK_BYTE);
@@ -872,12 +872,12 @@ static void read_partition_command(struct stm32prog_data *data)
 
 	rcv_data = stm32prog_serial_getc();
 	if ((rcv_data ^ tmp_xor) != 0xFF) {
-		pr_debug("2nd checksum received = %x, computed %x\n",
-			 rcv_data, tmp_xor);
+		log_debug("2nd checksum received = %x, computed %x\n",
+			  rcv_data, tmp_xor);
 		goto error;
 	}
 
-	pr_debug("%s : %x\n", __func__, part_id);
+	log_debug("%s : %x\n", __func__, part_id);
 	rcv_data = 0;
 	switch (part_id) {
 	case PHASE_OTP:
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
index 30547f94c9..bc44d9fc8f 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
@@ -47,11 +47,11 @@ static int stm32prog_cmd_write(u64 offset, void *buf, long *len)
 	int ret;
 
 	if (*len < 5) {
-		pr_err("size not allowed\n");
+		log_err("size not allowed\n");
 		return  -EINVAL;
 	}
 	if (offset) {
-		pr_err("invalid offset\n");
+		log_err("invalid offset\n");
 		return  -EINVAL;
 	}
 	phase = pt[0];
@@ -66,7 +66,7 @@ static int stm32prog_cmd_write(u64 offset, void *buf, long *len)
 	/* set phase and offset */
 	ret = stm32prog_set_phase(stm32prog_data, phase, address);
 	if (ret)
-		pr_err("failed: %d\n", ret);
+		log_err("failed: %d\n", ret);
 	return ret;
 }
 
@@ -81,7 +81,7 @@ static int stm32prog_cmd_read(u64 offset, void *buf, long *len)
 	int length;
 
 	if (*len < PHASE_MIN_SIZE) {
-		pr_err("request exceeds allowed area\n");
+		log_err("request exceeds allowed area\n");
 		return  -EINVAL;
 	}
 	if (offset) {
@@ -171,8 +171,8 @@ int stm32prog_get_medium_size_virt(struct dfu_entity *dfu, u64 *size)
 {
 	if (dfu->dev_type != DFU_DEV_VIRT) {
 		*size = 0;
-		pr_debug("%s, invalid dev_type = %d\n",
-			 __func__, dfu->dev_type);
+		log_debug("%s, invalid dev_type = %d\n",
+			  __func__, dfu->dev_type);
 		return -EINVAL;
 	}
 
@@ -227,6 +227,6 @@ bool stm32prog_usb_loop(struct stm32prog_data *data, int dev)
 
 int g_dnl_get_board_bcd_device_number(int gcnum)
 {
-	pr_debug("%s\n", __func__);
+	log_debug("%s\n", __func__);
 	return 0x200;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
