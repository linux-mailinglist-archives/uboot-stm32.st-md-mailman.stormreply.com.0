Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D481896F2
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:25:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCB99C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 08:25:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96BD9C36B14
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 08:25:19 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I8HTXS019416; Wed, 18 Mar 2020 09:25:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=OHfYnx56XQDSyB+y4sK9Nun7SZa8sMlaJvPl14tb/nY=;
 b=p+DknnuZXGMzwuEW6tlEHOlyfrcNK1WUWoqbI7GTkpNOEgvHoQ/FZc4LeEDAVGQywwJf
 OS1/LkB1ntT6Smvygtd7aQP4o1iZR4IJhL5HpECbeutza5mjx0411kY1p5JSzvkaBYul
 Bo3oybczTTXr7/AzXako4IivAwDBjMkdmLjMB0UnqXYZMzpT3jY5dyqUirrlibODpkT2
 t5O6w1glHEI9ymT/WIpyJE7uys6LZZGiuVBTxHcOMi6FjQlNrGSq9EEfMKWjowoiPi4W
 PWI0Zw5lMLQR9oZc0l1nXPXfxRCN6PZuPLtx9U+otXpBSepAkk76KnnG+pvgp857lZrq TA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu8eta8t3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 09:25:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2D21110003A;
 Wed, 18 Mar 2020 09:25:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2176021CA95;
 Wed, 18 Mar 2020 09:25:15 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Mar 2020 09:25:14 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Mar 2020 09:24:55 +0100
Message-ID: <20200318082503.8025-11-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318082503.8025-1-patrick.delaunay@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 10/18] stm32mp: stm32prog: adapt the MTD
	partitions
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

Dynamically adapt the MTD partitions in NOR/NAND/SPI-NAND when stm32prog
command detects in the parsed flash layout files:
- a fsbl partition in NOR.
- a tee partition in NOR/NAND/SPI-NAND

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 .../mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c  | 17 +++++++++++++++++
 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 17 +++++++++++++++++
 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h |  2 ++
 arch/arm/mach-stm32mp/include/mach/stm32prog.h  |  4 ++++
 board/st/common/stm32mp_mtdparts.c              | 14 ++++++++++++--
 5 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
index 3e8b426444..581f97e0b5 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
@@ -6,6 +6,7 @@
 #include <common.h>
 #include <command.h>
 #include <dfu.h>
+#include <asm/arch/stm32prog.h>
 #include "stm32prog.h"
 
 struct stm32prog_data *stm32prog_data;
@@ -94,3 +95,19 @@ U_BOOT_CMD(stm32prog, 5, 0, do_stm32prog,
 	   "<addr> = address of flashlayout\n"
 	   "<size> = size of flashlayout\n"
 );
+
+bool stm32prog_get_tee_partitions(void)
+{
+	if (stm32prog_data)
+		return stm32prog_data->tee_detected;
+
+	return false;
+}
+
+bool stm32prog_get_fsbl_nor(void)
+{
+	if (stm32prog_data)
+		return stm32prog_data->fsbl_nor_detected;
+
+	return false;
+}
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index 93ee6a55a1..0140fd479d 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -762,6 +762,8 @@ static int treat_partition_list(struct stm32prog_data *data)
 		INIT_LIST_HEAD(&data->dev[j].part_list);
 	}
 
+	data->tee_detected = false;
+	data->fsbl_nor_detected = false;
 	for (i = 0; i < data->part_nb; i++) {
 		part = &data->part_array[i];
 		part->alt_id = -1;
@@ -806,6 +808,21 @@ static int treat_partition_list(struct stm32prog_data *data)
 			stm32prog_err("Layout: too many device");
 			return -EINVAL;
 		}
+		switch (part->target)  {
+		case STM32PROG_NOR:
+			if (!data->fsbl_nor_detected &&
+			    !strncmp(part->name, "fsbl", 4))
+				data->fsbl_nor_detected = true;
+			/* fallthrough */
+		case STM32PROG_NAND:
+		case STM32PROG_SPI_NAND:
+			if (!data->tee_detected &&
+			    !strncmp(part->name, "tee", 3))
+				data->tee_detected = true;
+			break;
+		default:
+			break;
+		}
 		part->dev = &data->dev[j];
 		if (!IS_SELECT(part))
 			part->dev->full_update = false;
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
index 8e635da3a4..7f06627ebc 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
@@ -107,6 +107,8 @@ struct stm32prog_data {
 	struct stm32prog_dev_t	dev[STM32PROG_MAX_DEV];	/* array of device */
 	int			part_nb;	/* nb of partition */
 	struct stm32prog_part_t	*part_array;	/* array of partition */
+	bool			tee_detected;
+	bool			fsbl_nor_detected;
 
 	/* command internal information */
 	unsigned int		phase;
diff --git a/arch/arm/mach-stm32mp/include/mach/stm32prog.h b/arch/arm/mach-stm32mp/include/mach/stm32prog.h
index c10bff09c8..c080b9cc42 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32prog.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32prog.h
@@ -10,3 +10,7 @@ int stm32prog_write_medium_virt(struct dfu_entity *dfu, u64 offset,
 int stm32prog_read_medium_virt(struct dfu_entity *dfu, u64 offset,
 			       void *buf, long *len);
 int stm32prog_get_medium_size_virt(struct dfu_entity *dfu, u64 *size);
+
+bool stm32prog_get_tee_partitions(void);
+
+bool stm32prog_get_fsbl_nor(void);
diff --git a/board/st/common/stm32mp_mtdparts.c b/board/st/common/stm32mp_mtdparts.c
index 5028511077..9f5897f8c8 100644
--- a/board/st/common/stm32mp_mtdparts.c
+++ b/board/st/common/stm32mp_mtdparts.c
@@ -4,12 +4,14 @@
  */
 
 #include <common.h>
+#include <dfu.h>
 #include <dm.h>
 #include <env.h>
 #include <env_internal.h>
 #include <mtd.h>
 #include <mtd_node.h>
 #include <tee.h>
+#include <asm/arch/stm32prog.h>
 #include <asm/arch/sys_proto.h>
 
 #define MTDPARTS_LEN		256
@@ -66,7 +68,7 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 	static char parts[3 * MTDPARTS_LEN + 1];
 	static char ids[MTDIDS_LEN + 1];
 	static bool mtd_initialized;
-	bool tee, nor, nand, spinand;
+	bool tee, nor, nand, spinand, serial;
 
 	if (mtd_initialized) {
 		*mtdids = ids;
@@ -78,10 +80,18 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 	nor = false;
 	nand = false;
 	spinand = false;
+	serial = false;
 
 	switch (get_bootmode() & TAMP_BOOT_DEVICE_MASK) {
 	case BOOT_SERIAL_UART:
 	case BOOT_SERIAL_USB:
+		serial = true;
+		if (CONFIG_IS_ENABLED(CMD_STM32PROG)) {
+			tee = stm32prog_get_tee_partitions();
+			nor = stm32prog_get_fsbl_nor();
+		}
+		nand = true;
+		spinand = true;
 		break;
 	case BOOT_FLASH_NAND:
 		nand = true;
@@ -96,7 +106,7 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 		break;
 	}
 
-	if (CONFIG_IS_ENABLED(OPTEE) &&
+	if (!serial && CONFIG_IS_ENABLED(OPTEE) &&
 	    tee_find_device(NULL, NULL, NULL, NULL))
 		tee = true;
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
