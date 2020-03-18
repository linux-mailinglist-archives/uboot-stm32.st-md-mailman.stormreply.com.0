Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 025341896C5
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:23:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA723C36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 08:23:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 055F5C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 08:23:02 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I8IeM7014450; Wed, 18 Mar 2020 09:22:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ySA8ZbV5e2gBEmXg2VYdUHxrIHCe8nFAtooU01dy7J8=;
 b=Tg97I2U4mVpKDn3xFJKByluDoMgJEDqRj9zJqLHruZWzveW/SgqQzckaDu392ZSYHLX+
 anpUUwp5pjNxnp7pPoR2JqphiyF0E/nfBn2Ok95LGSX4M6+sTf/t4mJAUDljdK63mMfM
 hMC61k4NygqomvTXpA2F9jJNTWdOVclSvDMK+pLhVx8wIwAFygX/KwiotbdPvO9N8mSZ
 FXKk6Et7ov5WcJyPdIoRxX/Kf8D1CD/OGiIvaZTZco2jzu/a0hKNyQUxZHSvjWVV15fb
 1Te27UVoPcQ8XRzP0sTmwH6JfYNcYesU/ufV/MIw0jKxy0H+hnfcoY4Jy77Bm55l0ZB6 rA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu6xdam5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 09:22:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3AE6D10002A;
 Wed, 18 Mar 2020 09:22:59 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1AFF721CA90;
 Wed, 18 Mar 2020 09:22:59 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Mar 2020 09:22:58 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Mar 2020 09:22:45 +0100
Message-ID: <20200318082254.7522-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318082254.7522-1-patrick.delaunay@st.com>
References: <20200318082254.7522-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 02/11] board: stm32mp1: move set_dfu_alt_info
	in st common directory
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

Move the stm32mp1 common code set_dfu_alt_info() in common directory,
this patch reduce the maintenance effort on this generic part (not board
dependent).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/dhelectronics/dh_stm32mp1/Makefile |   2 +
 board/dhelectronics/dh_stm32mp1/board.c  |  50 --------
 board/st/common/Makefile                 |   1 +
 board/st/common/stm32mp_dfu.c            | 151 +++++++++++++++++++++++
 board/st/stm32mp1/stm32mp1.c             | 145 ----------------------
 5 files changed, 154 insertions(+), 195 deletions(-)
 create mode 100644 board/st/common/stm32mp_dfu.c

diff --git a/board/dhelectronics/dh_stm32mp1/Makefile b/board/dhelectronics/dh_stm32mp1/Makefile
index c77a1e3a84..e8f218da08 100644
--- a/board/dhelectronics/dh_stm32mp1/Makefile
+++ b/board/dhelectronics/dh_stm32mp1/Makefile
@@ -8,4 +8,6 @@ obj-y += ../../st/stm32mp1/spl.o
 endif
 
 obj-y += ../../st/stm32mp1/board.o board.o
+
 obj-$(CONFIG_SYS_MTDPARTS_RUNTIME) += ../../st/common/stm32mp_mtdparts.o
+obj-$(CONFIG_SET_DFU_ALT_INFO) += ../../st/common/stm32mp_dfu.o
diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
index 2baa36278c..bd6540a2aa 100644
--- a/board/dhelectronics/dh_stm32mp1/board.c
+++ b/board/dhelectronics/dh_stm32mp1/board.c
@@ -526,56 +526,6 @@ int ft_board_setup(void *blob, bd_t *bd)
 }
 #endif
 
-#ifdef CONFIG_SET_DFU_ALT_INFO
-#define DFU_ALT_BUF_LEN SZ_1K
-
-static void board_get_alt_info(const char *dev, char *buff)
-{
-	char var_name[32] = "dfu_alt_info_";
-	int ret;
-
-	ALLOC_CACHE_ALIGN_BUFFER(char, tmp_alt, DFU_ALT_BUF_LEN);
-
-	/* name of env variable to read = dfu_alt_info_<dev> */
-	strcat(var_name, dev);
-	ret = env_get_f(var_name, tmp_alt, DFU_ALT_BUF_LEN);
-	if (ret) {
-		if (buff[0] != '\0')
-			strcat(buff, "&");
-		strncat(buff, tmp_alt, DFU_ALT_BUF_LEN);
-	}
-}
-
-void set_dfu_alt_info(char *interface, char *devstr)
-{
-	struct udevice *dev;
-
-	ALLOC_CACHE_ALIGN_BUFFER(char, buf, DFU_ALT_BUF_LEN);
-
-	if (env_get("dfu_alt_info"))
-		return;
-
-	memset(buf, 0, sizeof(buf));
-
-	/* probe all MTD devices */
-	mtd_probe_devices();
-
-	board_get_alt_info("ram", buf);
-
-	if (!uclass_get_device(UCLASS_MMC, 0, &dev))
-		board_get_alt_info("mmc0", buf);
-
-	if (!uclass_get_device(UCLASS_MMC, 1, &dev))
-		board_get_alt_info("mmc1", buf);
-
-	if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev))
-		board_get_alt_info("nor0", buf);
-
-	env_set("dfu_alt_info", buf);
-	puts("DFU alt info setting: done\n");
-}
-#endif
-
 static void board_copro_image_process(ulong fw_image, size_t fw_size)
 {
 	int ret, id = 0; /* Copro id fixed to 0 as only one coproc on mp1 */
diff --git a/board/st/common/Makefile b/board/st/common/Makefile
index 4bb8b49867..aa030bacd8 100644
--- a/board/st/common/Makefile
+++ b/board/st/common/Makefile
@@ -7,4 +7,5 @@ obj-$(CONFIG_CMD_STBOARD) += cmd_stboard.o
 
 ifeq ($(CONFIG_ARCH_STM32MP),y)
 obj-$(CONFIG_SYS_MTDPARTS_RUNTIME) += stm32mp_mtdparts.o
+obj-$(CONFIG_SET_DFU_ALT_INFO) += stm32mp_dfu.o
 endif
diff --git a/board/st/common/stm32mp_dfu.c b/board/st/common/stm32mp_dfu.c
new file mode 100644
index 0000000000..99ea21ce15
--- /dev/null
+++ b/board/st/common/stm32mp_dfu.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+/*
+ * Copyright (C) 2020, STMicroelectronics - All Rights Reserved
+ */
+
+#include <common.h>
+#include <dfu.h>
+#include <env.h>
+#include <memalign.h>
+#include <misc.h>
+#include <mtd.h>
+#include <mtd_node.h>
+
+#define DFU_ALT_BUF_LEN SZ_1K
+
+static void board_get_alt_info(const char *dev, char *buff)
+{
+	char var_name[32] = "dfu_alt_info_";
+	int ret;
+
+	ALLOC_CACHE_ALIGN_BUFFER(char, tmp_alt, DFU_ALT_BUF_LEN);
+
+	/* name of env variable to read = dfu_alt_info_<dev> */
+	strcat(var_name, dev);
+	ret = env_get_f(var_name, tmp_alt, DFU_ALT_BUF_LEN);
+	if (ret) {
+		if (buff[0] != '\0')
+			strcat(buff, "&");
+		strncat(buff, tmp_alt, DFU_ALT_BUF_LEN);
+	}
+}
+
+void set_dfu_alt_info(char *interface, char *devstr)
+{
+	struct udevice *dev;
+	struct mtd_info *mtd;
+
+	ALLOC_CACHE_ALIGN_BUFFER(char, buf, DFU_ALT_BUF_LEN);
+
+	if (env_get("dfu_alt_info"))
+		return;
+
+	memset(buf, 0, sizeof(buf));
+
+	/* probe all MTD devices */
+	mtd_probe_devices();
+
+	board_get_alt_info("ram", buf);
+
+	if (!uclass_get_device(UCLASS_MMC, 0, &dev))
+		board_get_alt_info("mmc0", buf);
+
+	if (!uclass_get_device(UCLASS_MMC, 1, &dev))
+		board_get_alt_info("mmc1", buf);
+
+	if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev))
+		board_get_alt_info("nor0", buf);
+
+	mtd = get_mtd_device_nm("nand0");
+	if (!IS_ERR_OR_NULL(mtd))
+		board_get_alt_info("nand0", buf);
+
+	mtd = get_mtd_device_nm("spi-nand0");
+	if (!IS_ERR_OR_NULL(mtd))
+		board_get_alt_info("spi-nand0", buf);
+
+#ifdef CONFIG_DFU_VIRT
+	strncat(buf, "&virt 0=OTP", DFU_ALT_BUF_LEN);
+
+	if (IS_ENABLED(CONFIG_PMIC_STPMIC1))
+		strncat(buf, "&virt 1=PMIC", DFU_ALT_BUF_LEN);
+#endif
+
+	env_set("dfu_alt_info", buf);
+	puts("DFU alt info setting: done\n");
+}
+
+#if CONFIG_IS_ENABLED(DFU_VIRT)
+#include <dfu.h>
+#include <power/stpmic1.h>
+
+static int dfu_otp_read(u64 offset, u8 *buffer, long *size)
+{
+	struct udevice *dev;
+	int ret;
+
+	ret = uclass_get_device_by_driver(UCLASS_MISC,
+					  DM_GET_DRIVER(stm32mp_bsec),
+					  &dev);
+	if (ret)
+		return ret;
+
+	ret = misc_read(dev, offset + STM32_BSEC_OTP_OFFSET, buffer, *size);
+	if (ret >= 0) {
+		*size = ret;
+		ret = 0;
+	}
+
+	return 0;
+}
+
+static int dfu_pmic_read(u64 offset, u8 *buffer, long *size)
+{
+	int ret;
+#ifdef CONFIG_PMIC_STPMIC1
+	struct udevice *dev;
+
+	ret = uclass_get_device_by_driver(UCLASS_MISC,
+					  DM_GET_DRIVER(stpmic1_nvm),
+					  &dev);
+	if (ret)
+		return ret;
+
+	ret = misc_read(dev, 0xF8 + offset, buffer, *size);
+	if (ret >= 0) {
+		*size = ret;
+		ret = 0;
+	}
+	if (ret == -EACCES) {
+		*size = 0;
+		ret = 0;
+	}
+#else
+	pr_err("PMIC update not supported");
+	ret = -EOPNOTSUPP;
+#endif
+
+	return ret;
+}
+
+int dfu_read_medium_virt(struct dfu_entity *dfu, u64 offset,
+			 void *buf, long *len)
+{
+	switch (dfu->data.virt.dev_num) {
+	case 0x0:
+		return dfu_otp_read(offset, buf, len);
+	case 0x1:
+		return dfu_pmic_read(offset, buf, len);
+	}
+	*len = 0;
+	return 0;
+}
+
+int __weak dfu_get_medium_size_virt(struct dfu_entity *dfu, u64 *size)
+{
+	*size = SZ_1K;
+
+	return 0;
+}
+
+#endif
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index bbeeb15d7e..2ab3b5cc9a 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -7,7 +7,6 @@
 #include <bootm.h>
 #include <clk.h>
 #include <config.h>
-#include <dfu.h>
 #include <dm.h>
 #include <env.h>
 #include <env_internal.h>
@@ -18,9 +17,7 @@
 #include <init.h>
 #include <led.h>
 #include <malloc.h>
-#include <memalign.h>
 #include <misc.h>
-#include <mtd.h>
 #include <mtd_node.h>
 #include <netdev.h>
 #include <phy.h>
@@ -843,148 +840,6 @@ int ft_board_setup(void *blob, bd_t *bd)
 }
 #endif
 
-#ifdef CONFIG_SET_DFU_ALT_INFO
-#define DFU_ALT_BUF_LEN SZ_1K
-
-static void board_get_alt_info(const char *dev, char *buff)
-{
-	char var_name[32] = "dfu_alt_info_";
-	int ret;
-
-	ALLOC_CACHE_ALIGN_BUFFER(char, tmp_alt, DFU_ALT_BUF_LEN);
-
-	/* name of env variable to read = dfu_alt_info_<dev> */
-	strcat(var_name, dev);
-	ret = env_get_f(var_name, tmp_alt, DFU_ALT_BUF_LEN);
-	if (ret) {
-		if (buff[0] != '\0')
-			strcat(buff, "&");
-		strncat(buff, tmp_alt, DFU_ALT_BUF_LEN);
-	}
-}
-
-void set_dfu_alt_info(char *interface, char *devstr)
-{
-	struct udevice *dev;
-	struct mtd_info *mtd;
-
-	ALLOC_CACHE_ALIGN_BUFFER(char, buf, DFU_ALT_BUF_LEN);
-
-	if (env_get("dfu_alt_info"))
-		return;
-
-	memset(buf, 0, sizeof(buf));
-
-	/* probe all MTD devices */
-	mtd_probe_devices();
-
-	board_get_alt_info("ram", buf);
-
-	if (!uclass_get_device(UCLASS_MMC, 0, &dev))
-		board_get_alt_info("mmc0", buf);
-
-	if (!uclass_get_device(UCLASS_MMC, 1, &dev))
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
-
-#ifdef CONFIG_DFU_VIRT
-	strncat(buf, "&virt 0=OTP", DFU_ALT_BUF_LEN);
-
-	if (IS_ENABLED(CONFIG_PMIC_STPMIC1))
-		strncat(buf, "&virt 1=PMIC", DFU_ALT_BUF_LEN);
-#endif
-
-	env_set("dfu_alt_info", buf);
-	puts("DFU alt info setting: done\n");
-}
-
-#if CONFIG_IS_ENABLED(DFU_VIRT)
-#include <dfu.h>
-#include <power/stpmic1.h>
-
-static int dfu_otp_read(u64 offset, u8 *buffer, long *size)
-{
-	struct udevice *dev;
-	int ret;
-
-	ret = uclass_get_device_by_driver(UCLASS_MISC,
-					  DM_GET_DRIVER(stm32mp_bsec),
-					  &dev);
-	if (ret)
-		return ret;
-
-	ret = misc_read(dev, offset + STM32_BSEC_OTP_OFFSET, buffer, *size);
-	if (ret >= 0) {
-		*size = ret;
-		ret = 0;
-	}
-
-	return 0;
-}
-
-static int dfu_pmic_read(u64 offset, u8 *buffer, long *size)
-{
-	int ret;
-#ifdef CONFIG_PMIC_STPMIC1
-	struct udevice *dev;
-
-	ret = uclass_get_device_by_driver(UCLASS_MISC,
-					  DM_GET_DRIVER(stpmic1_nvm),
-					  &dev);
-	if (ret)
-		return ret;
-
-	ret = misc_read(dev, 0xF8 + offset, buffer, *size);
-	if (ret >= 0) {
-		*size = ret;
-		ret = 0;
-	}
-	if (ret == -EACCES) {
-		*size = 0;
-		ret = 0;
-	}
-#else
-	pr_err("PMIC update not supported");
-	ret = -EOPNOTSUPP;
-#endif
-
-	return ret;
-}
-
-int dfu_read_medium_virt(struct dfu_entity *dfu, u64 offset,
-			 void *buf, long *len)
-{
-	switch (dfu->data.virt.dev_num) {
-	case 0x0:
-		return dfu_otp_read(offset, buf, len);
-	case 0x1:
-		return dfu_pmic_read(offset, buf, len);
-	}
-	*len = 0;
-	return 0;
-}
-
-int __weak dfu_get_medium_size_virt(struct dfu_entity *dfu, u64 *size)
-{
-	*size = SZ_1K;
-
-	return 0;
-}
-
-#endif
-
-#endif
-
 static void board_copro_image_process(ulong fw_image, size_t fw_size)
 {
 	int ret, id = 0; /* Copro id fixed to 0 as only one coproc on mp1 */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
