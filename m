Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEFCB21BF
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 16:19:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32DD8C35E01
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 14:19:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F302CC35E04
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2019 14:19:47 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8DEGIwN017353; Fri, 13 Sep 2019 16:19:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=LBwRhd99loG596Xb1LsNIiHtoLos/8kmZkdTKWRd59g=;
 b=IbJHkoRUDx1+7Bma8zpqW1bjtW2IHzeYSWdCQ0qRzOFYt1DkPPxyTBjLTYaXv8YNcR0J
 l5UbWa7Eu2rYokKbjjkP+YNiIn3LBzKOnZ/wBYc92QMC/eeOL/G/WFEbJjyqIDMuZJz+
 OGK2JQr6h2xlZ8C53P4Q5MqX67ad5fHKe5O+nvAaVJoaEkpLev7Bkq4XjLrsh+obDkMo
 YKhxJA99HIe/BWdwL26J8KaQoxs6cxDbfv2FjKV7v5d4VxYuPvsInJM3eEbczlxy2jtA
 VJKyptTVV6H5xdCoGM9JM0gCqL/cJlZcO3PzYVR3rRTqYzW0NAi+B3NcgRp6o89GBX3A mw== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2uyte2wdde-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 13 Sep 2019 16:19:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D033755;
 Fri, 13 Sep 2019 14:19:43 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8EC402C7F42;
 Fri, 13 Sep 2019 16:19:43 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep
 2019 16:19:43 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep 2019 16:19:42
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 13 Sep 2019 16:19:24 +0200
Message-ID: <20190913141930.15784-9-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190913141930.15784-2-patrick.delaunay@st.com>
References: <20190913141930.15784-2-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-13_07:2019-09-11,2019-09-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 "Andrew F. Davis" <afd@ti.com>
Subject: [Uboot-stm32] [PATCH 08/14] dfu: add DFU virtual backend
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

 drivers/dfu/Kconfig    |  7 ++++++
 drivers/dfu/Makefile   |  1 +
 drivers/dfu/dfu.c      |  5 ++++-
 drivers/dfu/dfu_virt.c | 49 ++++++++++++++++++++++++++++++++++++++++++
 include/dfu.h          | 22 +++++++++++++++++++
 5 files changed, 83 insertions(+), 1 deletion(-)
 create mode 100644 drivers/dfu/dfu_virt.c

diff --git a/drivers/dfu/Kconfig b/drivers/dfu/Kconfig
index ee664a331b..c0e6e5d8f0 100644
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
