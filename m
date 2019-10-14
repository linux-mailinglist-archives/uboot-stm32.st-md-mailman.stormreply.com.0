Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFC0D5C70
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 09:28:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCDCAC36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 07:28:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4ABEC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 07:28:32 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9E7RCUD031900; Mon, 14 Oct 2019 09:28:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=PASnEoEfsvfEjHtLLCV05FzOJDJK+4Qy0oY7gwo0IvM=;
 b=0ZQCVfQM0DBY7TBSUbkLSDkEQCVe4SaL7KjTwS6hJipFlKYjKIeSsEEVHtxbQCLmUdzT
 M52GeOTZ++CddMMBab164/0zGI3/Rrgq2Tegp3eOcSMkXE2f3KjSHBzmxt/ugIhkGNQR
 7mqifQTNNvZOvvCaB8UvL9C/8aVVoj2jRIlSsKXJrlSfIFrtqs5RNawLpoaR/zD3VkyB
 WUMVPxE/aAPwV2sOhNkjxPGYJ+xS5vmF7y/8CysAa1rt9Zusn+z9qfcAdffjrZK8xbhP
 oNhQCLtEkeoEQPM8kLlMsQzoARagt+mWKnnQ2JKcQRf8UDRKo0/jDVjOWChqh7kLVq5V OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vk4kwrsta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 09:28:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EF3D8100038;
 Mon, 14 Oct 2019 09:28:30 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E60D32ADFFB;
 Mon, 14 Oct 2019 09:28:30 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct
 2019 09:28:30 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct 2019 09:28:30
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 14 Oct 2019 09:28:06 +0200
Message-ID: <20191014072812.21843-10-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191014072812.21843-1-patrick.delaunay@st.com>
References: <20191014072812.21843-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-14_06:2019-10-10,2019-10-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 "Andrew F. Davis" <afd@ti.com>
Subject: [Uboot-stm32] [PATCH v3 09/15] dfu: add DFU virtual backend
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

Add a virtual DFU backend to allow board specific read and write
(for OTP update for example).

Acked-by: Lukasz Majewski <lukma@denx.de>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v3: None
Changes in v2:
- Update dfu documentation for virtual backend

 doc/README.dfu         | 32 ++++++++++++++++++++++++++-
 drivers/dfu/Kconfig    |  7 ++++++
 drivers/dfu/Makefile   |  1 +
 drivers/dfu/dfu.c      |  5 ++++-
 drivers/dfu/dfu_virt.c | 49 ++++++++++++++++++++++++++++++++++++++++++
 include/dfu.h          | 22 +++++++++++++++++++
 6 files changed, 114 insertions(+), 2 deletions(-)
 create mode 100644 drivers/dfu/dfu_virt.c

diff --git a/doc/README.dfu b/doc/README.dfu
index 92a7695be2..43a6f311d6 100644
--- a/doc/README.dfu
+++ b/doc/README.dfu
@@ -22,11 +22,18 @@ Overview:
   - RAM
   - SF (serial flash)
   - MTD (all MTD device: NAND, SPI-NOR, SPI-NAND,...)
+  - virtual
 
   These DFU backends are also used by
   - the dfutftp (see README.dfutftp)
   - the thordown command (cmd/thordown.c and gadget/f_thor.c)
 
+  The "virtual" backend is a generic DFU backend to support a board specific
+  target (for example OTP), only based on the weak functions:
+  - dfu_write_medium_virt
+  - dfu_get_medium_size_virt
+  - dfu_read_medium_virt
+
 Configuration Options:
   CONFIG_DFU
   CONFIG_DFU_OVER_USB
@@ -36,6 +43,7 @@ Configuration Options:
   CONFIG_DFU_RAM
   CONFIG_DFU_SF
   CONFIG_DFU_SF_PART
+  CONFIG_DFU_VIRTUAL
   CONFIG_CMD_DFU
 
 Environment variables:
@@ -117,6 +125,11 @@ Commands:
 
       with <partid> is the MTD partition index
 
+  "virt"
+    cmd: dfu 0 virt <dev>
+    each element in "dfu_alt_info" =
+      <name>
+
   <interface> and <dev> are absent:
     the dfu command to use multiple devices
     cmd: dfu 0 list
@@ -128,7 +141,7 @@ Commands:
        ram <dev>=<alt1>;....;<altN>
        sf <dev>=<alt1>;....;<altN>
        mtd <dev>=<alt1>;....;<altN>
-
+       virt <dev>=<alt1>;....;<altN>
 
 Host tools:
   When U-Boot runs the dfu stack, the DFU host tools can be used
@@ -230,3 +243,20 @@ Usage:
   dev: MTD alt: 1 name: u-boot layout: RAW_ADDR
   dev: MTD alt: 2 name: u-boot-env layout: RAW_ADDR
   dev: MTD alt: 3 name: UBI layout: RAW_ADDR
+
+  Example 3: firmware located in SD Card (mmc) and virtual partition on
+             OTP and PMIC not volatile memory
+  - alternate 1 (alt=1) for scard
+  - alternate 2 (alt=2) for OTP (virtual)
+  - alternate 3 (alt=3) for PMIC NVM (virtual)
+
+   U-Boot> env set dfu_alt_info \
+      "mmc 0=sdcard raw 0 0x100000&"\
+      "virt 0=otp" \
+      "virt 1=pmic"
+
+   U-Boot> dfu 0 list
+   DFU alt settings list:
+   dev: eMMC alt: 0 name: sdcard layout: RAW_ADDR
+   dev: VIRT alt: 1 name: otp layout: RAW_ADDR
+   dev: VIRT alt: 2 name: pmic layout: RAW_ADDR
diff --git a/drivers/dfu/Kconfig b/drivers/dfu/Kconfig
index 1e1dff33d2..9fe5bc0f58 100644
--- a/drivers/dfu/Kconfig
+++ b/drivers/dfu/Kconfig
@@ -60,5 +60,12 @@ config DFU_MTD
 	help
 	  This option enables using DFU to read and write to on any MTD device.
 
+config DFU_VIRT
+	bool "VIRTUAL flash back end for DFU"
+	help
+	  This option enables using DFU to read and write to VIRTUAL device
+	  used at board level to manage specific behavior
+	  (OTP update for example).
+
 endif
 endmenu
diff --git a/drivers/dfu/Makefile b/drivers/dfu/Makefile
index ebb119f398..0d7925c083 100644
--- a/drivers/dfu/Makefile
+++ b/drivers/dfu/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_$(SPL_)DFU_NAND) += dfu_nand.o
 obj-$(CONFIG_$(SPL_)DFU_RAM) += dfu_ram.o
 obj-$(CONFIG_$(SPL_)DFU_SF) += dfu_sf.o
 obj-$(CONFIG_$(SPL_)DFU_TFTP) += dfu_tftp.o
+obj-$(CONFIG_$(SPL_)DFU_VIRT) += dfu_virt.o
diff --git a/drivers/dfu/dfu.c b/drivers/dfu/dfu.c
index 4f4a07b790..2697235c24 100644
--- a/drivers/dfu/dfu.c
+++ b/drivers/dfu/dfu.c
@@ -474,6 +474,9 @@ static int dfu_fill_entity(struct dfu_entity *dfu, char *s, int alt,
 	} else if (strcmp(interface, "sf") == 0) {
 		if (dfu_fill_entity_sf(dfu, devstr, s))
 			return -1;
+	} else if (strcmp(interface, "virt") == 0) {
+		if (dfu_fill_entity_virt(dfu, devstr, s))
+			return -1;
 	} else {
 		printf("%s: Device %s not (yet) supported!\n",
 		       __func__,  interface);
@@ -569,7 +572,7 @@ int dfu_config_entities(char *env, char *interface, char *devstr)
 const char *dfu_get_dev_type(enum dfu_device_type t)
 {
 	const char *const dev_t[] = {NULL, "eMMC", "OneNAND", "NAND", "RAM",
-				     "SF", "MTD"};
+				     "SF", "MTD", "VIRT"};
 	return dev_t[t];
 }
 
diff --git a/drivers/dfu/dfu_virt.c b/drivers/dfu/dfu_virt.c
new file mode 100644
index 0000000000..ea8c71f100
--- /dev/null
+++ b/drivers/dfu/dfu_virt.c
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+/*
+ * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
+ */
+#include <common.h>
+#include <dfu.h>
+#include <errno.h>
+#include <malloc.h>
+
+int __weak dfu_write_medium_virt(struct dfu_entity *dfu, u64 offset,
+				 void *buf, long *len)
+{
+	debug("%s: off=0x%llx, len=0x%x\n", __func__, offset, (u32)*len);
+
+	return 0;
+}
+
+int __weak dfu_get_medium_size_virt(struct dfu_entity *dfu, u64 *size)
+{
+	*size = 0;
+
+	return 0;
+}
+
+int __weak dfu_read_medium_virt(struct dfu_entity *dfu, u64 offset,
+				void *buf, long *len)
+{
+	debug("%s: off=0x%llx, len=0x%x\n", __func__, offset, (u32)*len);
+	*len = 0;
+
+	return 0;
+}
+
+int dfu_fill_entity_virt(struct dfu_entity *dfu, char *devstr, char *s)
+{
+	debug("%s: devstr = %s\n", __func__, devstr);
+
+	dfu->dev_type = DFU_DEV_VIRT;
+	dfu->layout = DFU_RAW_ADDR;
+	dfu->data.virt.dev_num = simple_strtoul(devstr, NULL, 10);
+
+	dfu->write_medium = dfu_write_medium_virt;
+	dfu->get_medium_size = dfu_get_medium_size_virt;
+	dfu->read_medium = dfu_read_medium_virt;
+
+	dfu->inited = 0;
+
+	return 0;
+}
diff --git a/include/dfu.h b/include/dfu.h
index a90732cc43..4de7d35914 100644
--- a/include/dfu.h
+++ b/include/dfu.h
@@ -23,6 +23,7 @@ enum dfu_device_type {
 	DFU_DEV_RAM,
 	DFU_DEV_SF,
 	DFU_DEV_MTD,
+	DFU_DEV_VIRT,
 };
 
 enum dfu_layout {
@@ -92,6 +93,10 @@ struct sf_internal_data {
 	unsigned int ubi;
 };
 
+struct virt_internal_data {
+	int dev_num;
+};
+
 #define DFU_NAME_SIZE			32
 #ifndef CONFIG_SYS_DFU_DATA_BUF_SIZE
 #define CONFIG_SYS_DFU_DATA_BUF_SIZE		(1024*1024*8)	/* 8 MiB */
@@ -120,6 +125,7 @@ struct dfu_entity {
 		struct nand_internal_data nand;
 		struct ram_internal_data ram;
 		struct sf_internal_data sf;
+		struct virt_internal_data virt;
 	} data;
 
 	int (*get_medium_size)(struct dfu_entity *dfu, u64 *size);
@@ -272,6 +278,22 @@ static inline int dfu_fill_entity_mtd(struct dfu_entity *dfu, char *devstr,
 }
 #endif
 
+#ifdef CONFIG_DFU_VIRT
+int dfu_fill_entity_virt(struct dfu_entity *dfu, char *devstr, char *s);
+int dfu_write_medium_virt(struct dfu_entity *dfu, u64 offset,
+			  void *buf, long *len);
+int dfu_get_medium_size_virt(struct dfu_entity *dfu, u64 *size);
+int dfu_read_medium_virt(struct dfu_entity *dfu, u64 offset,
+			 void *buf, long *len);
+#else
+static inline int dfu_fill_entity_virt(struct dfu_entity *dfu, char *devstr,
+				       char *s)
+{
+	puts("VIRT support not available!\n");
+	return -1;
+}
+#endif
+
 /**
  * dfu_tftp_write - Write TFTP data to DFU medium
  *
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
