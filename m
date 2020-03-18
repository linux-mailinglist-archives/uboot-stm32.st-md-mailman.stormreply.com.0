Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEEE1896F0
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:25:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A556C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 08:25:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FFD1C36B12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 08:25:19 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I8HTVe019413; Wed, 18 Mar 2020 09:25:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=cCcqTxs/P8L2Pcq8g2lh/axiBgoBm4OJoCxDFNKZW9E=;
 b=i6NNMDbvCUKRhQroCA8pPE98s5jLKxo56pEGm/K6ke/iSEfCbX47wwnZYhqNvoSyFnxZ
 BnFthYK3y7AVG7/HyhvWI6VKnh7NsBGhUfb4Mp2RFH1BqZgHDnSwlWaCjaqtctsZshdv
 H/O7XWSi0Ua/vLIX/MsXIOVxQmnrdfo6UDcppqcMHC8KuTGk9sdlGey5pMk7tAWQJSpi
 LMYSzKTT5+x3jtYfs/Kf1BxrRZARo4/Z6zKk7Z0UYxMmC+VmtxDrzFz9ycFM7gP0UkUv
 mCO4Oe92Z7qkwnPu0Ovu9I2nW8Z2t5lwMkN1clKmoMvWO/BNbO3u9rrjHIkvZdYkxKqO 6Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu8eta8t2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 09:25:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0BCC5100040;
 Wed, 18 Mar 2020 09:25:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 00F5D21CA96;
 Wed, 18 Mar 2020 09:25:14 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Mar 2020 09:25:13 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Mar 2020 09:24:54 +0100
Message-ID: <20200318082503.8025-10-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318082503.8025-1-patrick.delaunay@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 09/18] stm32mp: stm32prog: add MTD devices
	support
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

Add support of MTD device (DFU_MTD backend) for
NOR, NAND or SPI-NAND target.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/Kconfig                 |   2 +
 .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 114 +++++++++++++++++-
 .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |   4 +
 configs/stm32mp15_basic_defconfig             |   2 -
 configs/stm32mp15_trusted_defconfig           |   2 -
 5 files changed, 117 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 39504e8540..af16393152 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -121,7 +121,9 @@ config CMD_STM32PROG
 	select DFU_VIRT
 	select PARTITION_TYPE_GUID
 	imply CMD_GPT if MMC
+	imply CMD_MTD if MTD
 	imply DFU_MMC if MMC
+	imply DFU_MTD if MTD
 	help
 		activate a specific command stm32prog for STM32MP soc family
 		witch update the device with the tools STM32CubeProgrammer,
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index 787bcdef7d..93ee6a55a1 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -8,9 +8,12 @@
 #include <dfu.h>
 #include <malloc.h>
 #include <mmc.h>
+#include <part.h>
 #include <dm/uclass.h>
+#include <jffs2/load_kernel.h>
 #include <linux/list.h>
 #include <linux/list_sort.h>
+#include <linux/mtd/mtd.h>
 #include <linux/sizes.h>
 
 #include "stm32prog.h"
@@ -65,6 +68,11 @@ enum stm32prog_col_t {
 	COL_NB_STM32
 };
 
+/* partition handling routines : CONFIG_CMD_MTDPARTS */
+int mtdparts_init(void);
+int find_dev_and_part(const char *id, struct mtd_device **dev,
+		      u8 *part_num, struct part_info **part);
+
 char *stm32prog_get_error(struct stm32prog_data *data)
 {
 	static const char error_msg[] = "Unspecified";
@@ -233,6 +241,15 @@ static int parse_ip(struct stm32prog_data *data,
 	} else if (!strncmp(p, "mmc", 3)) {
 		part->target = STM32PROG_MMC;
 		len = 3;
+	} else if (!strncmp(p, "nor", 3)) {
+		part->target = STM32PROG_NOR;
+		len = 3;
+	} else if (!strncmp(p, "nand", 4)) {
+		part->target = STM32PROG_NAND;
+		len = 4;
+	} else if (!strncmp(p, "spi-nand", 8)) {
+		part->target = STM32PROG_SPI_NAND;
+		len = 8;
 	} else {
 		result = -EINVAL;
 	}
@@ -475,11 +492,37 @@ static int __init part_cmp(void *priv, struct list_head *a, struct list_head *b)
 		return parta->addr > partb->addr ? 1 : -1;
 }
 
+static void get_mtd_by_target(char *string, enum stm32prog_target target,
+			      int dev_id)
+{
+	const char *dev_str;
+
+	switch (target) {
+	case STM32PROG_NOR:
+		dev_str = "nor";
+		break;
+	case STM32PROG_NAND:
+		dev_str = "nand";
+		break;
+	case STM32PROG_SPI_NAND:
+		dev_str = "spi-nand";
+		break;
+	default:
+		dev_str = "invalid";
+		break;
+	}
+	sprintf(string, "%s%d", dev_str, dev_id);
+}
+
 static int init_device(struct stm32prog_data *data,
 		       struct stm32prog_dev_t *dev)
 {
 	struct mmc *mmc = NULL;
 	struct blk_desc *block_dev = NULL;
+#ifdef CONFIG_MTD
+	struct mtd_info *mtd = NULL;
+	char mtd_id[16];
+#endif
 	int part_id;
 	int ret;
 	u64 first_addr = 0, last_addr = 0;
@@ -521,6 +564,29 @@ static int init_device(struct stm32prog_data *data,
 			 first_addr, last_addr);
 		pr_debug(" full_update = %d\n", dev->full_update);
 		break;
+#endif
+#ifdef CONFIG_MTD
+	case STM32PROG_NOR:
+	case STM32PROG_NAND:
+	case STM32PROG_SPI_NAND:
+		get_mtd_by_target(mtd_id, dev->target, dev->dev_id);
+		pr_debug("%s\n", mtd_id);
+
+		mtdparts_init();
+		mtd = get_mtd_device_nm(mtd_id);
+		if (IS_ERR(mtd)) {
+			stm32prog_err("MTD device %s not found", mtd_id);
+			return -ENODEV;
+		}
+		first_addr = 0;
+		last_addr = mtd->size;
+		dev->erase_size = mtd->erasesize;
+		pr_debug("MTD device %s: size=%lld erasesize=%d\n",
+			 mtd_id, mtd->size, mtd->erasesize);
+		pr_debug(" available address = 0x%llx..0x%llx\n",
+			 first_addr, last_addr);
+		dev->mtd = mtd;
+		break;
 #endif
 	default:
 		stm32prog_err("unknown device type = %d", dev->target);
@@ -637,6 +703,29 @@ static int init_device(struct stm32prog_data *data,
 			part_found = true;
 		}
 
+#ifdef CONFIG_MTD
+		if (mtd) {
+			char mtd_part_id[32];
+			struct part_info *mtd_part;
+			struct mtd_device *mtd_dev;
+			u8 part_num;
+
+			sprintf(mtd_part_id, "%s,%d", mtd_id,
+				part->part_id - 1);
+			ret = find_dev_and_part(mtd_part_id, &mtd_dev,
+						&part_num, &mtd_part);
+			if (ret != 0) {
+				stm32prog_err("%s (0x%x): Invalid MTD partition %s",
+					      part->name, part->id,
+					      mtd_part_id);
+				return -ENODEV;
+			}
+			part_addr = mtd_part->offset;
+			part_size = mtd_part->size;
+			part_name = mtd_part->name;
+			part_found = true;
+		}
+#endif
 		if (!part_found) {
 			stm32prog_err("%s (0x%x): Invalid partition",
 				      part->name, part->id);
@@ -840,6 +929,9 @@ static int create_partitions(struct stm32prog_data *data)
 	}
 	puts("done\n");
 
+#ifdef DEBUG
+	run_command("mtd list", 0);
+#endif
 	free(buf);
 #endif
 
@@ -898,9 +990,17 @@ static int stm32prog_alt_add(struct stm32prog_data *data,
 		offset += snprintf(buf + offset, ALT_BUF_LEN - offset,
 				   " mmcpart %d;", -(part->part_id));
 	} else {
-		offset += snprintf(buf + offset,
-				   ALT_BUF_LEN - offset,
-				   "part");
+		if (part->part_type == PART_SYSTEM &&
+		    (part->target == STM32PROG_NAND ||
+		     part->target == STM32PROG_NOR ||
+		     part->target == STM32PROG_SPI_NAND))
+			offset += snprintf(buf + offset,
+					   ALT_BUF_LEN - offset,
+					   "partubi");
+		else
+			offset += snprintf(buf + offset,
+					   ALT_BUF_LEN - offset,
+					   "part");
 		/* dev_id requested by DFU MMC */
 		if (part->target == STM32PROG_MMC)
 			offset += snprintf(buf + offset, ALT_BUF_LEN - offset,
@@ -914,6 +1014,14 @@ static int stm32prog_alt_add(struct stm32prog_data *data,
 		sprintf(dfustr, "mmc");
 		sprintf(devstr, "%d", part->dev_id);
 		break;
+#endif
+#ifdef CONFIG_MTD
+	case STM32PROG_NAND:
+	case STM32PROG_NOR:
+	case STM32PROG_SPI_NAND:
+		sprintf(dfustr, "mtd");
+		get_mtd_by_target(devstr, part->target, part->dev_id);
+		break;
 #endif
 	default:
 		stm32prog_err("invalid target: %d", part->target);
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
index ea88459896..8e635da3a4 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
@@ -20,6 +20,9 @@
 enum stm32prog_target {
 	STM32PROG_NONE,
 	STM32PROG_MMC,
+	STM32PROG_NAND,
+	STM32PROG_NOR,
+	STM32PROG_SPI_NAND
 };
 
 enum stm32prog_link_t {
@@ -67,6 +70,7 @@ struct stm32prog_dev_t {
 	char			dev_id;
 	u32			erase_size;
 	struct mmc		*mmc;
+	struct mtd_info		*mtd;
 	/* list of partition for this device / ordered in offset */
 	struct list_head	part_list;
 	bool			full_update;
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 2e7d8bc990..7837cbe9c7 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -37,7 +37,6 @@ CONFIG_CMD_FUSE=y
 CONFIG_CMD_GPIO=y
 CONFIG_CMD_I2C=y
 CONFIG_CMD_MMC=y
-CONFIG_CMD_MTD=y
 CONFIG_CMD_REMOTEPROC=y
 CONFIG_CMD_SPI=y
 CONFIG_CMD_USB=y
@@ -67,7 +66,6 @@ CONFIG_ENV_UBI_VOLUME="uboot_config"
 CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_STM32_ADC=y
-CONFIG_DFU_MTD=y
 CONFIG_SET_DFU_ALT_INFO=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
 CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 6f6c909da0..e5b1ab5d04 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -25,7 +25,6 @@ CONFIG_CMD_FUSE=y
 CONFIG_CMD_GPIO=y
 CONFIG_CMD_I2C=y
 CONFIG_CMD_MMC=y
-CONFIG_CMD_MTD=y
 CONFIG_CMD_REMOTEPROC=y
 CONFIG_CMD_SPI=y
 CONFIG_CMD_USB=y
@@ -53,7 +52,6 @@ CONFIG_ENV_UBI_VOLUME="uboot_config"
 CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_STM32_ADC=y
-CONFIG_DFU_MTD=y
 CONFIG_SET_DFU_ALT_INFO=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
 CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
