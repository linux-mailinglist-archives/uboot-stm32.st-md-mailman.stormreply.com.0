Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 712DE6E5F1
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 14:57:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F195C064E8
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 12:57:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE203C030B7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2019 12:57:45 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6JCqhEu014602; Fri, 19 Jul 2019 14:57:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=9b4lNnJnLneLFeuNvQIs+GYOk3YyJepd42x77+bvnGY=;
 b=zV3RqFy2zYcZzssuQWKlVkjWKWIZuF6nV7WROKeNxQxZQmLnKO0yI4i3sLZAyftCpL3l
 vTjx/jblRc+zRj7VMDafMEpbrPqL+VmCoI4uL/X19F62c2P4+XbsHc6qIwhOdOTsU2kR
 RK/XDMr+z9juqNH3Mov8iZ71IQKJSSDlBE9y8WWQFBPMUjMHlUv9U8uCScUTfLbCjCZ/
 2ExGQS6OOimSFNtQJb8KSgnR1HZ43irfJgCqN+/BoS+md7FhhZTbBixpC8vt8k8LwZyi
 //+RBMBpRWrHeEMnD3ha5k9rqgXBMqEUGfThIZgPuIv7MLIlIK0y/R/2C2NVQUGnRSbj eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tq4s28gva-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 19 Jul 2019 14:57:41 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7F99A4D;
 Fri, 19 Jul 2019 12:57:39 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 670B42D52;
 Fri, 19 Jul 2019 12:57:39 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul
 2019 14:57:39 +0200
Received: from localhost (10.201.23.85) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul 2019 14:57:39
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Jul 2019 14:57:20 +0200
Message-ID: <1563541046-6432-9-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
References: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-19_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 "Andrew F. Davis" <afd@ti.com>
Subject: [Uboot-stm32] [RFC PATCH 08/14] dfu: add DFU virtual backend
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

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/dfu/Kconfig    |  7 +++++++
 drivers/dfu/Makefile   |  1 +
 drivers/dfu/dfu.c      |  5 ++++-
 drivers/dfu/dfu_virt.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 include/dfu.h          | 22 ++++++++++++++++++++++
 5 files changed, 83 insertions(+), 1 deletion(-)
 create mode 100644 drivers/dfu/dfu_virt.c

diff --git a/drivers/dfu/Kconfig b/drivers/dfu/Kconfig
index ee664a3..c0e6e5d 100644
--- a/drivers/dfu/Kconfig
+++ b/drivers/dfu/Kconfig
@@ -52,5 +52,12 @@ config DFU_MTD
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
index ebb119f..0d7925c 100644
--- a/drivers/dfu/Makefile
+++ b/drivers/dfu/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_$(SPL_)DFU_NAND) += dfu_nand.o
 obj-$(CONFIG_$(SPL_)DFU_RAM) += dfu_ram.o
 obj-$(CONFIG_$(SPL_)DFU_SF) += dfu_sf.o
 obj-$(CONFIG_$(SPL_)DFU_TFTP) += dfu_tftp.o
+obj-$(CONFIG_$(SPL_)DFU_VIRT) += dfu_virt.o
diff --git a/drivers/dfu/dfu.c b/drivers/dfu/dfu.c
index ab7fdc0..a960b6e 100644
--- a/drivers/dfu/dfu.c
+++ b/drivers/dfu/dfu.c
@@ -473,6 +473,9 @@ static int dfu_fill_entity(struct dfu_entity *dfu, char *s, int alt,
 	} else if (strcmp(interface, "sf") == 0) {
 		if (dfu_fill_entity_sf(dfu, devstr, s))
 			return -1;
+	} else if (strcmp(interface, "virt") == 0) {
+		if (dfu_fill_entity_virt(dfu, devstr, s))
+			return -1;
 	} else {
 		printf("%s: Device %s not (yet) supported!\n",
 		       __func__,  interface);
@@ -568,7 +571,7 @@ int dfu_config_entities(char *env, char *interface, char *devstr)
 const char *dfu_get_dev_type(enum dfu_device_type t)
 {
 	const char *const dev_t[] = {NULL, "eMMC", "OneNAND", "NAND", "RAM",
-				     "SF", "MTD"};
+				     "SF", "MTD", "VIRT"};
 	return dev_t[t];
 }
 
diff --git a/drivers/dfu/dfu_virt.c b/drivers/dfu/dfu_virt.c
new file mode 100644
index 0000000..ea8c71f
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
index a90732c..4de7d35 100644
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
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
