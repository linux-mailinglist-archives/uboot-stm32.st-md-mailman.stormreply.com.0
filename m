Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F14EED5C6E
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 09:28:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE1E6C36B0D
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 07:28:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E598AC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 07:28:29 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9E7QT8L006828; Mon, 14 Oct 2019 09:28:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=DqwogYsxDEg/gLAanhXvgKRabZrYb3VsTvhXj7bh83o=;
 b=oeXiVnWSseMbUR195XEXy2OH1vuEY3/Tj3JkwARgDphoFcx8Yswsl3Xvp37InL3zepVx
 n8KZF0os9YbrxNqH0yzAo7h44lLZ7QvdRC+pwwqPgdUv+3qiQWIkvzasb6T+9Zgt9SMM
 d00V1tjo+P6q7c1mVD8MrrgG5B9kmRPv+OeAee+8tKwB915IhPEa/Rq/jCPT+beES+8y
 NeIv18hzgwqASZQ12mju9IE8lppghqc5PkrzVeJgsofLz44XLTZgznf0URssR9GxI/HH
 5EhzH7JCK7DtOaQNrhEX8G522pNUmqM56o0QotHXzHgjMbyeet3TbYJsp1gAMD2yIUXr yA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vk4a10unp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 09:28:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 64F45100034;
 Mon, 14 Oct 2019 09:28:28 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5A19E2ADFFB;
 Mon, 14 Oct 2019 09:28:28 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct
 2019 09:28:28 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct 2019 09:28:27
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 14 Oct 2019 09:28:04 +0200
Message-ID: <20191014072812.21843-8-patrick.delaunay@st.com>
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
Subject: [Uboot-stm32] [PATCH v3 07/15] dfu: add backend for MTD device
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

Add DFU backend for MTD device: allow to read
and write on all MTD device (NAND, SPI-NOR,
SPI-NAND,...)

For example :
> set dfu_alt_info "nand_raw raw 0x0 0x100000"
> dfu 0 mtd nand0

This MTD backend provides the same level than dfu nand
backend for NAND and dfu sf backend for SPI-NOR;
So it can replace booth of them but it also
add support of spi-nand.

> set dfu_alt_info "nand_raw raw 0x0 0x100000"
> dfu 0 mtd spi-nand0

The backend code is based on the "mtd" command
introduced by commit 5db66b3aee6f ("cmd: mtd:
add 'mtd' command")

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v3:
- update bad block support in erase loop

Changes in v2:
- Update commit message
- Update dfu documentation for MTD

 doc/README.dfu        |  10 ++
 drivers/dfu/Kconfig   |   6 ++
 drivers/dfu/Makefile  |   1 +
 drivers/dfu/dfu.c     |   5 +-
 drivers/dfu/dfu_mtd.c | 232 ++++++++++++++++++++++++++++++++++++++++++
 include/dfu.h         |  21 ++++
 6 files changed, 274 insertions(+), 1 deletion(-)
 create mode 100644 drivers/dfu/dfu_mtd.c

diff --git a/doc/README.dfu b/doc/README.dfu
index d1ef7e4064..96bced39d8 100644
--- a/doc/README.dfu
+++ b/doc/README.dfu
@@ -21,6 +21,7 @@ Overview:
   - NAND
   - RAM
   - SF (serial flash)
+  - MTD (all MTD device: NAND, SPI-NOR, SPI-NAND,...)
 
   These DFU backends are also used by
   - the dfutftp (see README.dfutftp)
@@ -30,6 +31,7 @@ Configuration Options:
   CONFIG_DFU
   CONFIG_DFU_OVER_USB
   CONFIG_DFU_MMC
+  CONFIG_DFU_MTD
   CONFIG_DFU_NAND
   CONFIG_DFU_RAM
   CONFIG_DFU_SF
@@ -104,6 +106,13 @@ Commands:
 
       with <partid> is the MTD partition index
 
+  "mtd" (all MTD device: NAND, SPI-NOR, SPI-NAND,...)
+    cmd: dfu 0 mtd <dev>
+      with <dev> the mtd identifier as defined in mtd command
+      (nand0, nor0, spi-nand0,...)
+    each element in "dfu_alt_info" =
+      <name> raw <offset> <size>  raw access to mtd device
+
   <interface> and <dev> are absent:
     the dfu command to use multiple devices
     cmd: dfu 0 list
@@ -114,6 +123,7 @@ Commands:
        nand <dev>=<alt1>;....;<altN>
        ram <dev>=<alt1>;....;<altN>
        sf <dev>=<alt1>;....;<altN>
+       mtd <dev>=<alt1>;....;<altN>
 
 
 Host tools:
diff --git a/drivers/dfu/Kconfig b/drivers/dfu/Kconfig
index 1cbec81128..1e1dff33d2 100644
--- a/drivers/dfu/Kconfig
+++ b/drivers/dfu/Kconfig
@@ -54,5 +54,11 @@ config DFU_SF_PART
 	  This option enables the support of "part" and "partubi" target in
 	  SPI flash DFU back end.
 
+config DFU_MTD
+	bool "MTD back end for DFU"
+	depends on MTD
+	help
+	  This option enables using DFU to read and write to on any MTD device.
+
 endif
 endmenu
diff --git a/drivers/dfu/Makefile b/drivers/dfu/Makefile
index 4164f342ac..ebb119f398 100644
--- a/drivers/dfu/Makefile
+++ b/drivers/dfu/Makefile
@@ -5,6 +5,7 @@
 
 obj-$(CONFIG_$(SPL_)DFU) += dfu.o
 obj-$(CONFIG_$(SPL_)DFU_MMC) += dfu_mmc.o
+obj-$(CONFIG_$(SPL_)DFU_MTD) += dfu_mtd.o
 obj-$(CONFIG_$(SPL_)DFU_NAND) += dfu_nand.o
 obj-$(CONFIG_$(SPL_)DFU_RAM) += dfu_ram.o
 obj-$(CONFIG_$(SPL_)DFU_SF) += dfu_sf.o
diff --git a/drivers/dfu/dfu.c b/drivers/dfu/dfu.c
index 50919fcae9..4f4a07b790 100644
--- a/drivers/dfu/dfu.c
+++ b/drivers/dfu/dfu.c
@@ -462,6 +462,9 @@ static int dfu_fill_entity(struct dfu_entity *dfu, char *s, int alt,
 	if (strcmp(interface, "mmc") == 0) {
 		if (dfu_fill_entity_mmc(dfu, devstr, s))
 			return -1;
+	} else if (strcmp(interface, "mtd") == 0) {
+		if (dfu_fill_entity_mtd(dfu, devstr, s))
+			return -1;
 	} else if (strcmp(interface, "nand") == 0) {
 		if (dfu_fill_entity_nand(dfu, devstr, s))
 			return -1;
@@ -566,7 +569,7 @@ int dfu_config_entities(char *env, char *interface, char *devstr)
 const char *dfu_get_dev_type(enum dfu_device_type t)
 {
 	const char *const dev_t[] = {NULL, "eMMC", "OneNAND", "NAND", "RAM",
-				     "SF"};
+				     "SF", "MTD"};
 	return dev_t[t];
 }
 
diff --git a/drivers/dfu/dfu_mtd.c b/drivers/dfu/dfu_mtd.c
new file mode 100644
index 0000000000..13fc837c69
--- /dev/null
+++ b/drivers/dfu/dfu_mtd.c
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * dfu_mtd.c -- DFU for MTD device.
+ *
+ * Copyright (C) 2019,STMicroelectronics - All Rights Reserved
+ *
+ * Based on dfu_nand.c
+ */
+
+#include <common.h>
+#include <dfu.h>
+#include <mtd.h>
+
+static bool mtd_is_aligned_with_block_size(struct mtd_info *mtd, u64 size)
+{
+	return !do_div(size, mtd->erasesize);
+}
+
+static int mtd_block_op(enum dfu_op op, struct dfu_entity *dfu,
+			u64 offset, void *buf, long *len)
+{
+	u64 off, lim, remaining;
+	struct mtd_info *mtd = dfu->data.mtd.info;
+	struct mtd_oob_ops io_op = {};
+	int ret = 0;
+	bool has_pages = mtd->type == MTD_NANDFLASH ||
+			 mtd->type == MTD_MLCNANDFLASH;
+
+	/* if buf == NULL return total size of the area */
+	if (!buf) {
+		*len = dfu->data.mtd.size;
+		return 0;
+	}
+
+	off = dfu->data.mtd.start + offset + dfu->bad_skip;
+	lim = dfu->data.mtd.start + dfu->data.mtd.size;
+
+	if (off >= lim) {
+		printf("Limit reached 0x%llx\n", lim);
+		*len = 0;
+		return op == DFU_OP_READ ? 0 : -EIO;
+	}
+	/* limit request with the available size */
+	if (off + *len >= lim)
+		*len = lim - off;
+
+	if (!mtd_is_aligned_with_block_size(mtd, off)) {
+		printf("Offset not aligned with a block (0x%x)\n",
+		       mtd->erasesize);
+		return 0;
+	}
+
+	/* first erase */
+	if (op == DFU_OP_WRITE) {
+		struct erase_info erase_op = {};
+
+		remaining = round_up(*len, mtd->erasesize);
+		erase_op.mtd = mtd;
+		erase_op.addr = off;
+		erase_op.len = mtd->erasesize;
+		erase_op.scrub = 0;
+
+		while (remaining) {
+			if (erase_op.addr + remaining > lim) {
+				printf("Limit reached 0x%llx while erasing at offset 0x%llx\n",
+				       lim, off);
+				return -EIO;
+			}
+
+			ret = mtd_erase(mtd, &erase_op);
+
+			if (ret) {
+				/* Abort if its not a bad block error */
+				if (ret != -EIO) {
+					printf("Failure while erasing at offset 0x%llx\n",
+					       erase_op.fail_addr);
+					return 0;
+				}
+				printf("Skipping bad block at 0x%08llx\n",
+				       erase_op.addr);
+			} else {
+				remaining -= mtd->erasesize;
+			}
+
+			/* Continue erase behind bad block */
+			erase_op.addr += mtd->erasesize;
+		}
+	}
+
+	io_op.mode = MTD_OPS_AUTO_OOB;
+	io_op.len = *len;
+	if (has_pages && io_op.len > mtd->writesize)
+		io_op.len = mtd->writesize;
+	io_op.ooblen = 0;
+	io_op.datbuf = buf;
+	io_op.oobbuf = NULL;
+
+	/* Loop over to do the actual read/write */
+	remaining = *len;
+	while (remaining) {
+		if (off + remaining > lim) {
+			printf("Limit reached 0x%llx while %s at offset 0x%llx\n",
+			       lim, op == DFU_OP_READ ? "reading" : "writing",
+			       off);
+			if (op == DFU_OP_READ) {
+				*len -= remaining;
+				return 0;
+			} else {
+				return -EIO;
+			}
+		}
+
+		/* Skip the block if it is bad */
+		if (mtd_is_aligned_with_block_size(mtd, off) &&
+		    mtd_block_isbad(mtd, off)) {
+			off += mtd->erasesize;
+			dfu->bad_skip += mtd->erasesize;
+			continue;
+		}
+
+		if (op == DFU_OP_READ)
+			ret = mtd_read_oob(mtd, off, &io_op);
+		else
+			ret = mtd_write_oob(mtd, off, &io_op);
+
+		if (ret) {
+			printf("Failure while %s at offset 0x%llx\n",
+			       op == DFU_OP_READ ? "reading" : "writing", off);
+			return -EIO;
+		}
+
+		off += io_op.retlen;
+		remaining -= io_op.retlen;
+		io_op.datbuf += io_op.retlen;
+		io_op.len = remaining;
+		if (has_pages && io_op.len > mtd->writesize)
+			io_op.len = mtd->writesize;
+	}
+
+	return ret;
+}
+
+static int dfu_get_medium_size_mtd(struct dfu_entity *dfu, u64 *size)
+{
+	*size = dfu->data.mtd.info->size;
+
+	return 0;
+}
+
+static int dfu_read_medium_mtd(struct dfu_entity *dfu, u64 offset, void *buf,
+			       long *len)
+{
+	int ret = -1;
+
+	switch (dfu->layout) {
+	case DFU_RAW_ADDR:
+		ret = mtd_block_op(DFU_OP_READ, dfu, offset, buf, len);
+		break;
+	default:
+		printf("%s: Layout (%s) not (yet) supported!\n", __func__,
+		       dfu_get_layout(dfu->layout));
+	}
+
+	return ret;
+}
+
+static int dfu_write_medium_mtd(struct dfu_entity *dfu,
+				u64 offset, void *buf, long *len)
+{
+	int ret = -1;
+
+	switch (dfu->layout) {
+	case DFU_RAW_ADDR:
+		ret = mtd_block_op(DFU_OP_WRITE, dfu, offset, buf, len);
+		break;
+	default:
+		printf("%s: Layout (%s) not (yet) supported!\n", __func__,
+		       dfu_get_layout(dfu->layout));
+	}
+
+	return ret;
+}
+
+static int dfu_flush_medium_mtd(struct dfu_entity *dfu)
+{
+	return 0;
+}
+
+static unsigned int dfu_polltimeout_mtd(struct dfu_entity *dfu)
+{
+	return DFU_DEFAULT_POLL_TIMEOUT;
+}
+
+int dfu_fill_entity_mtd(struct dfu_entity *dfu, char *devstr, char *s)
+{
+	char *st;
+	struct mtd_info *mtd;
+	bool has_pages;
+
+	mtd = get_mtd_device_nm(devstr);
+	if (IS_ERR_OR_NULL(mtd))
+		return -ENODEV;
+	put_mtd_device(mtd);
+
+	dfu->dev_type = DFU_DEV_MTD;
+	dfu->data.mtd.info = mtd;
+
+	has_pages = mtd->type == MTD_NANDFLASH || mtd->type == MTD_MLCNANDFLASH;
+	dfu->max_buf_size = has_pages ? mtd->erasesize : 0;
+
+	st = strsep(&s, " ");
+	if (!strcmp(st, "raw")) {
+		dfu->layout = DFU_RAW_ADDR;
+		dfu->data.mtd.start = simple_strtoul(s, &s, 16);
+		s++;
+		dfu->data.mtd.size = simple_strtoul(s, &s, 16);
+	} else {
+		printf("%s: (%s) not supported!\n", __func__, st);
+		return -1;
+	}
+
+	dfu->get_medium_size = dfu_get_medium_size_mtd;
+	dfu->read_medium = dfu_read_medium_mtd;
+	dfu->write_medium = dfu_write_medium_mtd;
+	dfu->flush_medium = dfu_flush_medium_mtd;
+	dfu->poll_timeout = dfu_polltimeout_mtd;
+
+	/* initial state */
+	dfu->inited = 0;
+
+	return 0;
+}
diff --git a/include/dfu.h b/include/dfu.h
index 7d60ffc228..924952f805 100644
--- a/include/dfu.h
+++ b/include/dfu.h
@@ -22,6 +22,7 @@ enum dfu_device_type {
 	DFU_DEV_NAND,
 	DFU_DEV_RAM,
 	DFU_DEV_SF,
+	DFU_DEV_MTD,
 };
 
 enum dfu_layout {
@@ -55,6 +56,14 @@ struct mmc_internal_data {
 	unsigned int part;
 };
 
+struct mtd_internal_data {
+	struct mtd_info *info;
+
+	/* RAW programming */
+	u64 start;
+	u64 size;
+};
+
 struct nand_internal_data {
 	/* RAW programming */
 	u64 start;
@@ -105,6 +114,7 @@ struct dfu_entity {
 
 	union {
 		struct mmc_internal_data mmc;
+		struct mtd_internal_data mtd;
 		struct nand_internal_data nand;
 		struct ram_internal_data ram;
 		struct sf_internal_data sf;
@@ -249,6 +259,17 @@ static inline int dfu_fill_entity_sf(struct dfu_entity *dfu, char *devstr,
 }
 #endif
 
+#if CONFIG_IS_ENABLED(DFU_MTD)
+int dfu_fill_entity_mtd(struct dfu_entity *dfu, char *devstr, char *s);
+#else
+static inline int dfu_fill_entity_mtd(struct dfu_entity *dfu, char *devstr,
+				      char *s)
+{
+	puts("MTD support not available!\n");
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
