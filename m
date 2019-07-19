Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA226E601
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 15:01:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55DF9C0B1A5
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 13:01:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6A57C0B184
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2019 13:00:59 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6JCugI8018541; Fri, 19 Jul 2019 15:00:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=5+Ja25AIT+OX7dW6TFlmlSZHlyHrIecuQ0lh17h73dk=;
 b=pMflDgDdWARbSD5+X4GMRMF5bBDDLZIYlY3fSkih5xSfkE2e8EDK3DuLkWb8T1MokWIT
 YzVy5jM1VkrO1H7YZD1uOuR6KToYKWsYarNOjxbUHwz3HWW/v2dru8z6Zm5hWJcSCwlh
 4t2z/28qHe2rvsBxrFQHvuhTdkMFM+baZD9ZlsiSj8y8PBF8b+zCO7OcJQ/pEIZMUYPl
 yfzL2SCn2u5EfnBUZfWOCQqPHoT0TQd0NrN0rRqPAOLzSWw2dCdka8rLkRsbGIv1knje
 Sq3cVASFLX7MRexuSlweRLDCk0JGRp4plYKEVPXE5+cpK6WH2JwkaYmk4XGRFbPLhdZc Bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tsdepv66f-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 19 Jul 2019 15:00:58 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2F4735C;
 Fri, 19 Jul 2019 12:57:45 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1ABB32D52;
 Fri, 19 Jul 2019 12:57:45 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul
 2019 14:57:45 +0200
Received: from localhost (10.201.23.85) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul 2019 14:57:44
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Jul 2019 14:57:25 +0200
Message-ID: <1563541046-6432-14-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
References: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-19_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [RFC PATCH 13/14] stm32mp1: board: add spi nand
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

This patch adds the support of the spi nand device in mtdparts command
and in dfu_alt_info.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 33 ++++++++++++++++++++++++++++++---
 include/configs/stm32mp1.h   |  6 +++++-
 2 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 7656c66..68bd06c 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -14,6 +14,7 @@
 #include <led.h>
 #include <memalign.h>
 #include <misc.h>
+#include <mtd.h>
 #include <phy.h>
 #include <reset.h>
 #include <syscon.h>
@@ -720,8 +721,9 @@ static void board_get_mtdparts(const char *dev,
 
 void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 {
+	struct mtd_info *mtd;
 	struct udevice *dev;
-	static char parts[2 * MTDPARTS_LEN + 1];
+	static char parts[3 * MTDPARTS_LEN + 1];
 	static char ids[MTDIDS_LEN + 1];
 	static bool mtd_initialized;
 
@@ -734,8 +736,24 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
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
@@ -770,6 +788,7 @@ static void board_get_alt_info(const char *dev, char *buff)
 void set_dfu_alt_info(char *interface, char *devstr)
 {
 	struct udevice *dev;
+	struct mtd_info *mtd;
 
 	ALLOC_CACHE_ALIGN_BUFFER(char, buf, DFU_ALT_BUF_LEN);
 
@@ -778,6 +797,9 @@ void set_dfu_alt_info(char *interface, char *devstr)
 
 	memset(buf, 0, sizeof(buf));
 
+	/* probe all MTD devices */
+	mtd_probe_devices();
+
 	board_get_alt_info("ram", buf);
 
 	if (!uclass_get_device(UCLASS_MMC, 0, &dev))
@@ -789,9 +811,14 @@ void set_dfu_alt_info(char *interface, char *devstr)
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
index 27b2bdb..6dcf0e2 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -129,7 +129,8 @@
 
 #define STM32MP_MTDPARTS \
 	"mtdparts_nor0=256k(fsbl1),256k(fsbl2),2m(ssbl),256k(u-boot-env),-(nor_user)\0" \
-	"mtdparts_nand0=2m(fsbl),2m(ssbl1),2m(ssbl2),-(UBI)\0"
+	"mtdparts_nand0=2m(fsbl),2m(ssbl1),2m(ssbl2),-(UBI)\0" \
+	"mtdparts_spi-nand0=2m(fsbl),2m(ssbl1),2m(ssbl2),-(UBI)\0"
 
 #define STM32MP_DFU_ALT_RAM \
 	"dfu_alt_info_ram=ram 0=" \
@@ -145,6 +146,9 @@
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
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
