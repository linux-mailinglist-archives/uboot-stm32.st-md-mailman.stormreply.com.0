Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FB1728388
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Jun 2023 17:18:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98305C6A61A;
	Thu,  8 Jun 2023 15:18:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6223BC65E42
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jun 2023 15:18:02 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 358Dk9IH007584; Thu, 8 Jun 2023 17:18:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=8Y5pEv+MUulVuhF3UudS6c+X8+AVP+9e9W/O5gczkfg=;
 b=UbZbxUMUvtjDC1G7Ws3Mj/UWuWA2+cveXu6DEAcbXps3eyZy9JfTvYMWq8s3ZvDLD7/N
 kaISjuhIejYxcloKEjrAihQy/WE9R2QFKzx5t/iTzcWtG/RcoXGphJR2Bb51qlV/pclu
 nt6/gGxDB2yKBwCrrdxwKmrUoNvHE/z/ER69Cv6RUThMMbTVkjcOlpmOxPTLf7CV9siV
 iI0pkROv4iTpUPJ/Fs5sYQF2SypAXWGPnWa9xOY/LkBudektObu6jbbI+34o6bA2d0hs
 sy6x8KZpFtmMiO3JHsjzC+GUxLclJwJHzZc8Z2AECSLVnQXbfal7Uf5t/WQoNKx01wKo Iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r3cax2av0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jun 2023 17:18:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C242810003D;
 Thu,  8 Jun 2023 17:18:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BA5E721B507;
 Thu,  8 Jun 2023 17:18:00 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 8 Jun
 2023 17:18:00 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 8 Jun 2023 17:16:45 +0200
Message-ID: <20230608171614.9.I762bbd3d98a9b9c886a85a8bedd2666b721f7002@changeid>
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
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH 09/12] board: st: remove board_mtdparts_default
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

Remove the function board_mtdparts_default and the associated file
or configs, only used by the CONFIG_SYS_MTDPARTS_RUNTIME now removed.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 board/st/common/Kconfig            |  66 -----------
 board/st/common/Makefile           |   1 -
 board/st/common/stm32mp_mtdparts.c | 177 -----------------------------
 3 files changed, 244 deletions(-)
 delete mode 100644 board/st/common/stm32mp_mtdparts.c

diff --git a/board/st/common/Kconfig b/board/st/common/Kconfig
index aba3590866e0..c1c254d07354 100644
--- a/board/st/common/Kconfig
+++ b/board/st/common/Kconfig
@@ -6,72 +6,6 @@ config CMD_STBOARD
 	  This compile the stboard command to
 	  read and write the board in the OTP.
 
-config MTDPARTS_NAND0_BOOT
-	string "mtd boot partitions for nand0"
-	default "2m(fsbl),2m(ssbl1),2m(ssbl2)" if STM32MP15x_STM32IMAGE || \
-						  !TFABOOT
-	default "2m(fsbl),4m(fip1),4m(fip2)"
-	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
-	help
-	  This define the partitions of nand0 used to build mtparts dynamically
-	  for boot from nand0.
-	  Each partition need to be aligned with the device erase block size,
-	  512KB is the max size for the NAND supported by stm32mp1 platform.
-	  The fsbl partition support multiple copy of the same binary, one by
-	  erase block.
-
-config MTDPARTS_NAND0_TEE
-	string "mtd tee partitions for nand0"
-	default "512k(teeh),512k(teed),512k(teex)"
-	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP && STM32MP15x_STM32IMAGE
-	help
-	  This define the tee partitions added in mtparts dynamically
-	  when tee is supported with boot from nand0.
-	  Each partition need to be aligned with the device erase block size,
-	  512KB is the max size for the NAND supported by stm32mp1 platform.
-
-config MTDPARTS_NOR0_BOOT
-	string "mtd boot partitions for nor0"
-	default "256k(fsbl1),256k(fsbl2),2m(ssbl),512k(u-boot-env)" if STM32MP15x_STM32IMAGE || \
-								       !TFABOOT
-	default "256k(fsbl1),256k(fsbl2),4m(fip),512k(u-boot-env)"
-	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
-	help
-	  This define the partitions of nand0 used to build mtparts dynamically
-	  for boot from nor0.
-	  Each partition need to be aligned with the device erase block size,
-	  with 256KB we support all the NOR.
-	  U-Boot env partition (512kB) use 2 erase block for redundancy.
-
-config MTDPARTS_NOR0_TEE
-	string "mtd tee partitions for nor0"
-	default "256k(teeh),512k(teed),256k(teex)"
-	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP && STM32MP15x_STM32IMAGE
-	help
-	  This define the tee partitions added in mtparts dynamically
-	  when tee is supported with boot from nor0.
-
-config MTDPARTS_SPINAND0_BOOT
-	string "mtd boot partitions for spi-nand0"
-	default "2m(fsbl),2m(ssbl1),2m(ssbl2)" if STM32MP15x_STM32IMAGE || !TFABOOT
-	default "2m(fsbl),4m(fip1),4m(fip2)"
-	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
-	help
-	  This define the partitions of nand0 used to build mtparts dynamically
-	  for boot from spi-nand0,
-	  512KB is the max size for the NAND supported by stm32mp1 platform.
-	  The fsbl partition support multiple copy of the same binary, one by
-	  erase block.
-
-config MTDPARTS_SPINAND0_TEE
-	string "mtd tee partitions for spi-nand0"
-	default "512k(teeh),512k(teed),512k(teex)"
-	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP && STM32MP15x_STM32IMAGE
-	help
-	  This define the tee partitions added in mtparts dynamically
-	  when tee is supported with boot from spi-nand0,
-	  512KB is the max size for the NAND supported by stm32mp1 platform.
-
 config DFU_ALT_RAM0
 	string "dfu for ram0"
 	default "uImage ram 0xc2000000 0x2000000;devicetree.dtb ram 0xc4000000 0x100000;uramdisk.image.gz ram 0xc4400000 0x10000000"
diff --git a/board/st/common/Makefile b/board/st/common/Makefile
index 65bbebd6abc3..c9608297261a 100644
--- a/board/st/common/Makefile
+++ b/board/st/common/Makefile
@@ -7,7 +7,6 @@ obj-$(CONFIG_CMD_STBOARD) += cmd_stboard.o
 obj-$(CONFIG_PMIC_STPMIC1) += stpmic1.o
 
 ifeq ($(CONFIG_ARCH_STM32MP),y)
-obj-$(CONFIG_SYS_MTDPARTS_RUNTIME) += stm32mp_mtdparts.o
 obj-$(CONFIG_SET_DFU_ALT_INFO) += stm32mp_dfu.o
 endif
 
diff --git a/board/st/common/stm32mp_mtdparts.c b/board/st/common/stm32mp_mtdparts.c
deleted file mode 100644
index 67a56a2623a1..000000000000
--- a/board/st/common/stm32mp_mtdparts.c
+++ /dev/null
@@ -1,177 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
-/*
- * Copyright (C) 2020, STMicroelectronics - All Rights Reserved
- */
-
-#include <common.h>
-#include <dfu.h>
-#include <dm.h>
-#include <env.h>
-#include <env_internal.h>
-#include <log.h>
-#include <mtd.h>
-#include <mtd_node.h>
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
-#include <tee.h>
-#endif
-#include <asm/arch/stm32prog.h>
-#include <asm/arch/sys_proto.h>
-#include <asm/global_data.h>
-
-#define MTDPARTS_LEN		256
-#define MTDIDS_LEN		128
-
-/*
- * Get a global data pointer
- */
-DECLARE_GLOBAL_DATA_PTR;
-
-/**
- * update the variables "mtdids" and "mtdparts" with boot, tee and user strings
- */
-static void board_set_mtdparts(const char *dev,
-			       char *mtdids,
-			       char *mtdparts,
-			       const char *boot,
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
-			       const char *tee,
-#endif
-			       const char *user)
-{
-	/* mtdids: "<dev>=<dev>, ...." */
-	if (mtdids[0] != '\0')
-		strcat(mtdids, ",");
-	strcat(mtdids, dev);
-	strcat(mtdids, "=");
-	strcat(mtdids, dev);
-
-	/* mtdparts: "mtdparts=<dev>:<mtdparts_<dev>>;..." */
-	if (mtdparts[0] != '\0')
-		strncat(mtdparts, ";", MTDPARTS_LEN);
-	else
-		strcat(mtdparts, "mtdparts=");
-
-	strncat(mtdparts, dev, MTDPARTS_LEN);
-	strncat(mtdparts, ":", MTDPARTS_LEN);
-
-	if (boot) {
-		strncat(mtdparts, boot, MTDPARTS_LEN);
-		strncat(mtdparts, ",", MTDPARTS_LEN);
-	}
-
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
-	if (tee) {
-		strncat(mtdparts, tee, MTDPARTS_LEN);
-		strncat(mtdparts, ",", MTDPARTS_LEN);
-	}
-#endif
-
-	strncat(mtdparts, user, MTDPARTS_LEN);
-}
-
-void board_mtdparts_default(const char **mtdids, const char **mtdparts)
-{
-	struct mtd_info *mtd;
-	struct udevice *dev;
-	static char parts[3 * MTDPARTS_LEN + 1];
-	static char ids[MTDIDS_LEN + 1];
-	static bool mtd_initialized;
-	bool nor, nand, spinand, serial;
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
-	bool tee = false;
-#endif
-
-	if (mtd_initialized) {
-		*mtdids = ids;
-		*mtdparts = parts;
-		return;
-	}
-
-	nor = false;
-	nand = false;
-	spinand = false;
-	serial = false;
-
-	switch (get_bootmode() & TAMP_BOOT_DEVICE_MASK) {
-	case BOOT_SERIAL_UART:
-	case BOOT_SERIAL_USB:
-		serial = true;
-		if (IS_ENABLED(CONFIG_CMD_STM32PROG)) {
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
-			tee = stm32prog_get_tee_partitions();
-#endif
-			nor = stm32prog_get_fsbl_nor();
-		}
-		nand = true;
-		spinand = true;
-		break;
-	case BOOT_FLASH_NAND:
-		nand = true;
-		break;
-	case BOOT_FLASH_SPINAND:
-		spinand = true;
-		break;
-	case BOOT_FLASH_NOR:
-		nor = true;
-		break;
-	default:
-		break;
-	}
-
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
-	if (!serial && tee_find_device(NULL, NULL, NULL, NULL))
-		tee = true;
-#endif
-
-	memset(parts, 0, sizeof(parts));
-	memset(ids, 0, sizeof(ids));
-
-	/* probe all MTD devices */
-	for (uclass_first_device(UCLASS_MTD, &dev);
-	     dev;
-	     uclass_next_device(&dev)) {
-		log_debug("mtd device = %s\n", dev->name);
-	}
-
-	if (nand) {
-		mtd = get_mtd_device_nm("nand0");
-		if (!IS_ERR_OR_NULL(mtd)) {
-			board_set_mtdparts("nand0", ids, parts,
-					   CONFIG_MTDPARTS_NAND0_BOOT,
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
-					   !nor && tee ? CONFIG_MTDPARTS_NAND0_TEE : NULL,
-#endif
-					   "-(UBI)");
-			put_mtd_device(mtd);
-		}
-	}
-
-	if (spinand) {
-		mtd = get_mtd_device_nm("spi-nand0");
-		if (!IS_ERR_OR_NULL(mtd)) {
-			board_set_mtdparts("spi-nand0", ids, parts,
-					   CONFIG_MTDPARTS_SPINAND0_BOOT,
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
-					   !nor && tee ? CONFIG_MTDPARTS_SPINAND0_TEE : NULL,
-#endif
-					   "-(UBI)");
-			put_mtd_device(mtd);
-		}
-	}
-
-	if (nor) {
-		if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev)) {
-			board_set_mtdparts("nor0", ids, parts,
-					   CONFIG_MTDPARTS_NOR0_BOOT,
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
-					   tee ? CONFIG_MTDPARTS_NOR0_TEE : NULL,
-#endif
-					   "-(nor_user)");
-		}
-	}
-
-	mtd_initialized = true;
-	*mtdids = ids;
-	*mtdparts = parts;
-	log_debug("mtdids=%s & mtdparts=%s\n", ids, parts);
-}
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
