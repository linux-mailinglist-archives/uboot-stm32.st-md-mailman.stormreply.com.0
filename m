Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB46D1896C4
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:23:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2E83C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 08:23:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F40D9C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 08:23:02 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I8InQr024213; Wed, 18 Mar 2020 09:23:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=BNe0a/0u2ehiGjG9gBI+Y0WK8xXZMIJGHoai+VFE8js=;
 b=FcOA7//Yxz2XgzhZkLvnvc1S1XkzJ7lWkZE9Cjtbv7jXAh+QIX4kDZidtUVJMtT7ydvh
 lyNU72nbpXVvL66JoCYtI5y7OUCSPiuhg7EUoJpEoDqm3JtUHfyle9AnAnkuHFjzu6hQ
 bYrPjRB5KLm++9d6GZLhReJRkv4m/yQWbclQuJaauL25bDfOeU2pVeLTNeeOLPEwIj8M
 5L5RlvMpTt5aOy5qG2VK6izzR7FOA64+pnIdi72SsQYHRTdcWPq/WmzdjcMlpGLbVZcj
 a5su959bK2ZrbpxzwP9R3eLaloBCCa85isa1rK69E5isEwXQMY0we0x35Zue8VMkDKx3 Zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yua4w9st3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 09:23:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EE62D100039;
 Wed, 18 Mar 2020 09:22:59 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D66EF21CA90;
 Wed, 18 Mar 2020 09:22:59 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Mar 2020 09:22:59 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Mar 2020 09:22:46 +0100
Message-ID: <20200318082254.7522-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318082254.7522-1-patrick.delaunay@st.com>
References: <20200318082254.7522-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 03/11] stm32mp1: dynamically build DFU_ALT_INFO
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

This patch reduces the stm32mp1 environment size and
builds dynamically the DFU board configuration with gpt
and mtd partitions and information from defconfig
(CONFIG_DFU_ALT_RAM0).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/dhelectronics/dh_stm32mp1/Kconfig |   1 +
 board/st/common/Kconfig                 |   7 ++
 board/st/common/stm32mp_dfu.c           | 130 +++++++++++++++++++-----
 include/configs/stm32mp1.h              |  33 ------
 4 files changed, 110 insertions(+), 61 deletions(-)

diff --git a/board/dhelectronics/dh_stm32mp1/Kconfig b/board/dhelectronics/dh_stm32mp1/Kconfig
index 8eab986640..69cc48f120 100644
--- a/board/dhelectronics/dh_stm32mp1/Kconfig
+++ b/board/dhelectronics/dh_stm32mp1/Kconfig
@@ -18,4 +18,5 @@ config ENV_OFFSET
 config ENV_OFFSET_REDUND
 	default 0x1F0000 if ENV_IS_IN_SPI_FLASH
 
+source "board/st/common/Kconfig"
 endif
diff --git a/board/st/common/Kconfig b/board/st/common/Kconfig
index af01ca4891..08df845982 100644
--- a/board/st/common/Kconfig
+++ b/board/st/common/Kconfig
@@ -5,3 +5,10 @@ config CMD_STBOARD
 	help
 	  This compile the stboard command to
 	  read and write the board in the OTP.
+
+config DFU_ALT_RAM0
+	string "dfu for ram0"
+	default "uImage ram 0xc2000000 0x2000000;devicetree.dtb ram 0xc4000000 0x100000;uramdisk.image.gz ram 0xc4400000 0x10000000"
+	depends on ARCH_STM32MP && SET_DFU_ALT_INFO
+	help
+	  This defines the partitions of ram used to build dfu dynamically.
diff --git a/board/st/common/stm32mp_dfu.c b/board/st/common/stm32mp_dfu.c
index 99ea21ce15..e129f8c8b5 100644
--- a/board/st/common/stm32mp_dfu.c
+++ b/board/st/common/stm32mp_dfu.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <blk.h>
 #include <dfu.h>
 #include <env.h>
 #include <memalign.h>
@@ -13,20 +14,86 @@
 
 #define DFU_ALT_BUF_LEN SZ_1K
 
-static void board_get_alt_info(const char *dev, char *buff)
+static void board_get_alt_info_mmc(struct udevice *dev, char *buf)
 {
-	char var_name[32] = "dfu_alt_info_";
-	int ret;
+	disk_partition_t info;
+	int p, len, devnum;
+	bool first = true;
+	const char *name;
+	struct mmc *mmc;
+	struct blk_desc *desc;
+
+	mmc = mmc_get_mmc_dev(dev);
+	if (!mmc)
+		return;
+
+	if (mmc_init(mmc))
+		return;
+
+	desc = mmc_get_blk_desc(mmc);
+	if (!desc)
+		return;
+
+	name = blk_get_if_type_name(desc->if_type);
+	devnum = desc->devnum;
+	len = strlen(buf);
+
+	if (buf[0] != '\0')
+		len += snprintf(buf + len,
+				DFU_ALT_BUF_LEN - len, "&");
+	len += snprintf(buf + len, DFU_ALT_BUF_LEN - len,
+			 "%s %d=", name, devnum);
+
+	if (IS_MMC(mmc) && mmc->capacity_boot) {
+		len += snprintf(buf + len, DFU_ALT_BUF_LEN - len,
+				"%s%d_boot1 raw 0x0 0x%llx mmcpart 1;",
+				name, devnum, mmc->capacity_boot);
+		len += snprintf(buf + len, DFU_ALT_BUF_LEN - len,
+				"%s%d_boot2 raw 0x0 0x%llx mmcpart 2",
+				name, devnum, mmc->capacity_boot);
+		first = false;
+	}
 
-	ALLOC_CACHE_ALIGN_BUFFER(char, tmp_alt, DFU_ALT_BUF_LEN);
+	for (p = 1; p < MAX_SEARCH_PARTITIONS; p++) {
+		if (part_get_info(desc, p, &info))
+			continue;
+		if (!first)
+			len += snprintf(buf + len, DFU_ALT_BUF_LEN - len, ";");
+		first = false;
+		len += snprintf(buf + len, DFU_ALT_BUF_LEN - len,
+				"%s%d_%s part %d %d",
+				name, devnum, info.name, devnum, p);
+	}
+}
 
-	/* name of env variable to read = dfu_alt_info_<dev> */
-	strcat(var_name, dev);
-	ret = env_get_f(var_name, tmp_alt, DFU_ALT_BUF_LEN);
-	if (ret) {
-		if (buff[0] != '\0')
-			strcat(buff, "&");
-		strncat(buff, tmp_alt, DFU_ALT_BUF_LEN);
+static void board_get_alt_info_mtd(struct mtd_info *mtd, char *buf)
+{
+	struct mtd_info *part;
+	bool first = true;
+	const char *name;
+	int len, partnum = 0;
+
+	name = mtd->name;
+	len = strlen(buf);
+
+	if (buf[0] != '\0')
+		len += snprintf(buf + len, DFU_ALT_BUF_LEN - len, "&");
+	len += snprintf(buf + len, DFU_ALT_BUF_LEN - len,
+			"mtd %s=", name);
+
+	len += snprintf(buf + len, DFU_ALT_BUF_LEN - len,
+			"%s raw 0x0 0x%llx ",
+			name, mtd->size);
+
+	list_for_each_entry(part, &mtd->partitions, node) {
+		partnum++;
+		if (!first)
+			len += snprintf(buf + len, DFU_ALT_BUF_LEN - len, ";");
+		first = false;
+
+		len += snprintf(buf + len, DFU_ALT_BUF_LEN - len,
+				"%s_%s part %d",
+				name, part->name, partnum);
 	}
 }
 
@@ -42,27 +109,34 @@ void set_dfu_alt_info(char *interface, char *devstr)
 
 	memset(buf, 0, sizeof(buf));
 
-	/* probe all MTD devices */
-	mtd_probe_devices();
-
-	board_get_alt_info("ram", buf);
+	snprintf(buf, DFU_ALT_BUF_LEN,
+		 "ram 0=%s", CONFIG_DFU_ALT_RAM0);
 
 	if (!uclass_get_device(UCLASS_MMC, 0, &dev))
-		board_get_alt_info("mmc0", buf);
+		board_get_alt_info_mmc(dev, buf);
 
 	if (!uclass_get_device(UCLASS_MMC, 1, &dev))
-		board_get_alt_info("mmc1", buf);
-
-	if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev))
-		board_get_alt_info("nor0", buf);
-
-	mtd = get_mtd_device_nm("nand0");
-	if (!IS_ERR_OR_NULL(mtd))
-		board_get_alt_info("nand0", buf);
-
-	mtd = get_mtd_device_nm("spi-nand0");
-	if (!IS_ERR_OR_NULL(mtd))
-		board_get_alt_info("spi-nand0", buf);
+		board_get_alt_info_mmc(dev, buf);
+
+	if (CONFIG_IS_ENABLED(MTD)) {
+		/* probe all MTD devices */
+		mtd_probe_devices();
+
+		/* probe SPI flash device on a bus */
+		if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev)) {
+			mtd = get_mtd_device_nm("nor0");
+			if (!IS_ERR_OR_NULL(mtd))
+				board_get_alt_info_mtd(mtd, buf);
+		}
+
+		mtd = get_mtd_device_nm("nand0");
+		if (!IS_ERR_OR_NULL(mtd))
+			board_get_alt_info_mtd(mtd, buf);
+
+		mtd = get_mtd_device_nm("spi-nand0");
+		if (!IS_ERR_OR_NULL(mtd))
+			board_get_alt_info_mtd(mtd, buf);
+	}
 
 #ifdef CONFIG_DFU_VIRT
 	strncat(buf, "&virt 0=OTP", DFU_ALT_BUF_LEN);
diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index f451edad36..a9631d2a92 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -170,37 +170,6 @@
 #define STM32MP_MTDPARTS
 #endif
 
-#define STM32MP_DFU_ALT_RAM \
-	"dfu_alt_info_ram=ram 0=" \
-		"uImage ram ${kernel_addr_r} 0x2000000;" \
-		"devicetree.dtb ram ${fdt_addr_r} 0x100000;" \
-		"uramdisk.image.gz ram ${ramdisk_addr_r} 0x10000000\0"
-
-#ifdef CONFIG_SET_DFU_ALT_INFO
-#define STM32MP_DFU_ALT_INFO \
-	"dfu_alt_info_nor0=mtd nor0=" \
-		"nor_fsbl1 part 1;nor_fsbl2 part 2;" \
-		"nor_ssbl part 3;nor_env part 4\0" \
-	"dfu_alt_info_nand0=mtd nand0="\
-		"nand_fsbl part 1;nand_ssbl1 part 2;" \
-		"nand_ssbl2 part 3;nand_UBI partubi 4\0" \
-	"dfu_alt_info_spi-nand0=mtd spi-nand0="\
-		"spi-nand_fsbl part 1;spi-nand_ssbl1 part 2;" \
-		"spi-nand_ssbl2 part 3;spi-nand_UBI partubi 4\0" \
-	"dfu_alt_info_mmc0=mmc 0=" \
-		"sdcard_fsbl1 part 0 1;sdcard_fsbl2 part 0 2;" \
-		"sdcard_ssbl part 0 3;sdcard_bootfs part 0 4;" \
-		"sdcard_vendorfs part 0 5;sdcard_rootfs part 0 6;" \
-		"sdcard_userfs part 0 7\0" \
-	"dfu_alt_info_mmc1=mmc 1=" \
-		"emmc_fsbl1 raw 0x0 0x200 mmcpart 1;" \
-		"emmc_fsbl2 raw 0x0 0x200 mmcpart 2;emmc_ssbl part 1 1;" \
-		"emmc_bootfs part 1 2;emmc_vendorfs part 1 3;" \
-		"emmc_rootfs part 1 4;emmc_userfs part 1 5\0"
-#else
-#define STM32MP_DFU_ALT_INFO
-#endif
-
 /*
  * memory layout for 32M uncompressed/compressed kernel,
  * 1M fdt, 1M script, 1M pxe and 1M for splashimage
@@ -220,8 +189,6 @@
 		" then env set env_default 0;env save;fi\0" \
 	STM32MP_BOOTCMD \
 	STM32MP_MTDPARTS \
-	STM32MP_DFU_ALT_RAM \
-	STM32MP_DFU_ALT_INFO \
 	BOOTENV \
 	"boot_net_usb_start=true\0"
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
