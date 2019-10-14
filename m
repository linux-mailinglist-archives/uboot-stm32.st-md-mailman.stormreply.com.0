Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E08D5C75
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 09:28:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DBF9C36B10
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 07:28:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCFAEC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 07:28:37 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9E7RBPM031881; Mon, 14 Oct 2019 09:28:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=zFdOb8o9VS5xgtctjYVyEDozbP1vvpWDoIJ1rCjVZDw=;
 b=ZkG0Wx78Qvehl77FLWL/58/ZovRa26QiMp2D8pzclspF4xUoyX1X4YUzjKm2ODajrV5r
 OsLczBgvNfMHsFM1TLFpwVs1fABIuLmYw7tjr4R4YyZdthP2AvpKfxXjRqKxK1qGhKa8
 ql4Q1XzhtVY6+684ZE9t8EDRquQzF+fQQk8AmN3wcF5LHpnI75kwibhi9ghwV2pqr76i
 UsKicHGjQySytV4s9H5YpbhfwNPNYBelwWNUkKsD/QuEmsuxL1rmgaco8Qdms3R+L2d3
 BtQy6a0176o+tOWTBG5PZ5gvt58M6vXHdhNkami5RoeSE3HAbUb8ZG34eUIoviEMCUgU mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vk4kwrsu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 09:28:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8726F10003D;
 Mon, 14 Oct 2019 09:28:36 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F3622ADFFB;
 Mon, 14 Oct 2019 09:28:36 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct
 2019 09:28:36 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct 2019 09:28:35
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 14 Oct 2019 09:28:11 +0200
Message-ID: <20191014072812.21843-15-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191014072812.21843-1-patrick.delaunay@st.com>
References: <20191014072812.21843-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-14_06:2019-10-10,2019-10-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v3 14/15] stm32mp1: board: add spi nand support
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

This patch adds the support of the spi nand device in mtdparts command
and in dfu_alt_info.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v3: None
Changes in v2: None

 board/st/stm32mp1/stm32mp1.c | 32 +++++++++++++++++++++++++++++---
 include/configs/stm32mp1.h   | 10 ++++++++--
 2 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 62855988e9..e4bdf05cd7 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -862,8 +862,9 @@ static void board_get_mtdparts(const char *dev,
 
 void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 {
+	struct mtd_info *mtd;
 	struct udevice *dev;
-	static char parts[2 * MTDPARTS_LEN + 1];
+	static char parts[3 * MTDPARTS_LEN + 1];
 	static char ids[MTDIDS_LEN + 1];
 	static bool mtd_initialized;
 
@@ -876,8 +877,24 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 	memset(parts, 0, sizeof(parts));
 	memset(ids, 0, sizeof(ids));
 
-	if (!uclass_get_device(UCLASS_MTD, 0, &dev))
+	/* probe all MTD devices */
+	for (uclass_first_device(UCLASS_MTD, &dev);
+	     dev;
+	     uclass_next_device(&dev)) {
+		pr_debug("mtd device = %s\n", dev->name);
+	}
+
+	mtd = get_mtd_device_nm("nand0");
+	if (!IS_ERR_OR_NULL(mtd)) {
 		board_get_mtdparts("nand0", ids, parts);
+		put_mtd_device(mtd);
+	}
+
+	mtd = get_mtd_device_nm("spi-nand0");
+	if (!IS_ERR_OR_NULL(mtd)) {
+		board_get_mtdparts("spi-nand0", ids, parts);
+		put_mtd_device(mtd);
+	}
 
 	if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev))
 		board_get_mtdparts("nor0", ids, parts);
@@ -927,6 +944,7 @@ static void board_get_alt_info(const char *dev, char *buff)
 void set_dfu_alt_info(char *interface, char *devstr)
 {
 	struct udevice *dev;
+	struct mtd_info *mtd;
 
 	ALLOC_CACHE_ALIGN_BUFFER(char, buf, DFU_ALT_BUF_LEN);
 
@@ -935,6 +953,9 @@ void set_dfu_alt_info(char *interface, char *devstr)
 
 	memset(buf, 0, sizeof(buf));
 
+	/* probe all MTD devices */
+	mtd_probe_devices();
+
 	board_get_alt_info("ram", buf);
 
 	if (!uclass_get_device(UCLASS_MMC, 0, &dev))
@@ -946,9 +967,14 @@ void set_dfu_alt_info(char *interface, char *devstr)
 	if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev))
 		board_get_alt_info("nor0", buf);
 
-	if (!uclass_get_device(UCLASS_MTD, 0, &dev))
+	mtd = get_mtd_device_nm("nand0");
+	if (!IS_ERR_OR_NULL(mtd))
 		board_get_alt_info("nand0", buf);
 
+	mtd = get_mtd_device_nm("spi-nand0");
+	if (!IS_ERR_OR_NULL(mtd))
+		board_get_alt_info("spi-nand0", buf);
+
 	env_set("dfu_alt_info", buf);
 	puts("DFU alt info setting: done\n");
 }
diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index 4f9024229e..145a644efa 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -124,12 +124,15 @@
 /* with OPTEE: define specific MTD partitions = teeh, teed, teex */
 #define STM32MP_MTDPARTS \
 	"mtdparts_nor0=256k(fsbl1),256k(fsbl2),2m(ssbl),256k(u-boot-env),256k(teeh),256k(teed),256k(teex),-(nor_user)\0" \
-	"mtdparts_nand0=2m(fsbl),2m(ssbl1),2m(ssbl2),512k(teeh),512k(teed),512k(teex),-(UBI)\0"
+	"mtdparts_nand0=2m(fsbl),2m(ssbl1),2m(ssbl2),512k(teeh),512k(teed),512k(teex),-(UBI)\0" \
+	"mtdparts_spi-nand0=2m(fsbl),2m(ssbl1),2m(ssbl2),"\
+		"512k(teeh),512k(teed),512k(teex),-(UBI)\0"
 
 #else /* CONFIG_STM32MP1_OPTEE */
 #define STM32MP_MTDPARTS \
 	"mtdparts_nor0=256k(fsbl1),256k(fsbl2),2m(ssbl),256k(u-boot-env),-(nor_user)\0" \
-	"mtdparts_nand0=2m(fsbl),2m(ssbl1),2m(ssbl2),-(UBI)\0"
+	"mtdparts_nand0=2m(fsbl),2m(ssbl1),2m(ssbl2),-(UBI)\0" \
+	"mtdparts_spi-nand0=2m(fsbl),2m(ssbl1),2m(ssbl2),-(UBI)\0"
 
 #endif /* CONFIG_STM32MP1_OPTEE */
 
@@ -152,6 +155,9 @@
 	"dfu_alt_info_nand0=mtd nand0="\
 		"nand_fsbl part 1;nand_ssbl1 part 2;" \
 		"nand_ssbl2 part 3;nand_UBI partubi 4\0" \
+	"dfu_alt_info_spi-nand0=mtd spi-nand0="\
+		"spi-nand_fsbl part 1;spi-nand_ssbl1 part 2;" \
+		"spi-nand_ssbl2 part 3;spi-nand_UBI partubi 4\0" \
 	"dfu_alt_info_mmc0=mmc 0=" \
 		"sdcard_fsbl1 part 0 1;sdcard_fsbl2 part 0 2;" \
 		"sdcard_ssbl part 0 3;sdcard_bootfs part 0 4;" \
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
