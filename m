Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3251D1896CE
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:23:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE9DCC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 08:23:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD5D8C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 08:23:12 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I8IeMD014450; Wed, 18 Mar 2020 09:23:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=0wfrmtuydkIue6PT9nWGdPZgWHnZSY7cp4uEFg3GXvc=;
 b=f5N3WVhb461P3+CZQETWepzHeFstZWO+1FI3cicOWpvhazhslhZ7982UAL+imjUQNpO3
 3w9id+OucXxRixLwAnNyIK1AFfQ/PuFcxSdMzfINGQXNTzwP8+Z8MdoHiaIZtAYirgWX
 aUnhfGso1snLTvAHPd2aoaH8kWBXvCiKd0XNk3aOG4b+JZFl0tVM1FlP286h/XHUHyhT
 1lJk7yz7+oojxMf9XXTBDJW6/yCWatLetbaH1JFOucy67n/HWLhyzLN3buZxVZzyI+G0
 cnCL3zNQH6MLhGCW1LWBBivyaRLMnRKmC4qN5MFKIMsQo1vuYB1TQDnLbvEYMZzv/TKf 5w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu6xdam76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 09:23:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C492F100039;
 Wed, 18 Mar 2020 09:23:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B879321CA90;
 Wed, 18 Mar 2020 09:23:07 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Mar 2020 09:23:07 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Mar 2020 09:22:53 +0100
Message-ID: <20200318082254.7522-8-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318082254.7522-1-patrick.delaunay@st.com>
References: <20200318082254.7522-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 10/11] board: stm32mp1: adapt MTD partition
	for BOOT from NOR or NAND
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

Dynamically adapt the MTD partitions in NAND and SPI-NAND when boot from
NOR or NAND/SPI-NAND is detected.

This patch avoids to define the save MTD partition name for NOR and NAND
devices and issue with latest kernel: only the needed MTD partitions
are defined.

For boot from NOR
1/ bootloader (TF-A, U-Boot and OP-TE) in NOR
2/ one large UBI partition in NAND

For boot from NAND
1/ bootloader (TF-A, U-Boot and OP-TE) in MTD raw partition
2/ one large UBI partition

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

# Conflicts:
#	board/st/common/stm32mp_mtdparts.c
---

 board/st/common/stm32mp_mtdparts.c | 81 ++++++++++++++++++++++--------
 1 file changed, 60 insertions(+), 21 deletions(-)

diff --git a/board/st/common/stm32mp_mtdparts.c b/board/st/common/stm32mp_mtdparts.c
index 2b6413be16..5028511077 100644
--- a/board/st/common/stm32mp_mtdparts.c
+++ b/board/st/common/stm32mp_mtdparts.c
@@ -10,6 +10,7 @@
 #include <mtd.h>
 #include <mtd_node.h>
 #include <tee.h>
+#include <asm/arch/sys_proto.h>
 
 #define MTDPARTS_LEN		256
 #define MTDIDS_LEN		128
@@ -22,7 +23,7 @@ DECLARE_GLOBAL_DATA_PTR;
 /**
  * update the variables "mtdids" and "mtdparts" with boot, tee and user strings
  */
-static void board_get_mtdparts(const char *dev,
+static void board_set_mtdparts(const char *dev,
 			       char *mtdids,
 			       char *mtdparts,
 			       const char *boot,
@@ -65,7 +66,7 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 	static char parts[3 * MTDPARTS_LEN + 1];
 	static char ids[MTDIDS_LEN + 1];
 	static bool mtd_initialized;
-	bool tee = false;
+	bool tee, nor, nand, spinand;
 
 	if (mtd_initialized) {
 		*mtdids = ids;
@@ -73,6 +74,28 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 		return;
 	}
 
+	tee = false;
+	nor = false;
+	nand = false;
+	spinand = false;
+
+	switch (get_bootmode() & TAMP_BOOT_DEVICE_MASK) {
+	case BOOT_SERIAL_UART:
+	case BOOT_SERIAL_USB:
+		break;
+	case BOOT_FLASH_NAND:
+		nand = true;
+		break;
+	case BOOT_FLASH_SPINAND:
+		spinand = true;
+		break;
+	case BOOT_FLASH_NOR:
+		nor = true;
+		break;
+	default:
+		break;
+	}
+
 	if (CONFIG_IS_ENABLED(OPTEE) &&
 	    tee_find_device(NULL, NULL, NULL, NULL))
 		tee = true;
@@ -87,29 +110,45 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 		pr_debug("mtd device = %s\n", dev->name);
 	}
 
-	mtd = get_mtd_device_nm("nand0");
-	if (!IS_ERR_OR_NULL(mtd)) {
-		board_get_mtdparts("nand0", ids, parts,
-				   CONFIG_MTDPARTS_NAND0_BOOT,
-				   tee ? CONFIG_MTDPARTS_NAND0_TEE : NULL,
-				   "-(UBI)");
-		put_mtd_device(mtd);
+	if (nor || nand) {
+		mtd = get_mtd_device_nm("nand0");
+		if (!IS_ERR_OR_NULL(mtd)) {
+			const char *mtd_boot = CONFIG_MTDPARTS_NAND0_BOOT;
+			const char *mtd_tee = CONFIG_MTDPARTS_NAND0_TEE;
+
+			board_set_mtdparts("nand0", ids, parts,
+					   !nor ? mtd_boot : NULL,
+					   !nor && tee ? mtd_tee : NULL,
+					   "-(UBI)");
+			put_mtd_device(mtd);
+		}
 	}
 
-	mtd = get_mtd_device_nm("spi-nand0");
-	if (!IS_ERR_OR_NULL(mtd)) {
-		board_get_mtdparts("spi-nand0", ids, parts,
-				   CONFIG_MTDPARTS_SPINAND0_BOOT,
-				   tee ? CONFIG_MTDPARTS_SPINAND0_TEE : NULL,
-				   "-(UBI)");
-		put_mtd_device(mtd);
+	if (nor || spinand) {
+		mtd = get_mtd_device_nm("spi-nand0");
+		if (!IS_ERR_OR_NULL(mtd)) {
+			const char *mtd_boot = CONFIG_MTDPARTS_SPINAND0_BOOT;
+			const char *mtd_tee = CONFIG_MTDPARTS_SPINAND0_TEE;
+
+			board_set_mtdparts("spi-nand0", ids, parts,
+					   !nor ? mtd_boot : NULL,
+					   !nor && tee ? mtd_tee : NULL,
+					   "-(UBI)");
+			put_mtd_device(mtd);
+		}
 	}
 
-	if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev))
-		board_get_mtdparts("nor0", ids, parts,
-				   CONFIG_MTDPARTS_NOR0_BOOT,
-				   tee ? CONFIG_MTDPARTS_NOR0_TEE : NULL,
-				   "-(nor_user)");
+	if (nor) {
+		if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev)) {
+			const char *mtd_boot = CONFIG_MTDPARTS_NOR0_BOOT;
+			const char *mtd_tee = CONFIG_MTDPARTS_NOR0_TEE;
+
+			board_set_mtdparts("nor0", ids, parts,
+					   mtd_boot,
+					   tee ? mtd_tee : NULL,
+					   "-(nor_user)");
+		}
+	}
 
 	mtd_initialized = true;
 	*mtdids = ids;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
