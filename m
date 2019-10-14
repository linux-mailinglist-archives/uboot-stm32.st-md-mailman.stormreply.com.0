Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B31D5C6F
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 09:28:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2F86C36B11
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 07:28:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B7E1C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 07:28:31 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9E7RpjD007215; Mon, 14 Oct 2019 09:28:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=H6HelxlotzQFiA3wqYlnPILhhGO1+8UBxr5dY39wk7M=;
 b=uHNEVw7pX7c1G2+MA/3/pzxM3sZErh+OZo8lmwV4320gcRE3/1B4yoDXtsyrUGwYL6PC
 Uq8jKymoaUZb5pJike8i47NLA48Vy4Ruc2ViX9OF/QqZMTzwUGgNeAslvcWEgXTsoPon
 WPwD/pI2FydntOM+ubaMvmlhswJStnVb0uttW2GWE5kI/fHrg8UNqtktB2ahN+EWKJT+
 eDDs4nn8RFPKhjB1wPNtNYJ/VzMUdVwqHm/Q//FrIoWCuJF15gpbV64lQn6dItRhJ3MX
 kLik8arRlbheOxD/cUG1a6DrlWJ/iwtY4NjPXX6gKJzD30t0EUJ9nrFX7xGtQ9C6hUpE nQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vk3y9h5x6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 09:28:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DF2C3100038;
 Mon, 14 Oct 2019 09:28:29 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D3F702ADFFB;
 Mon, 14 Oct 2019 09:28:29 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct
 2019 09:28:29 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct 2019 09:28:28
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 14 Oct 2019 09:28:05 +0200
Message-ID: <20191014072812.21843-9-patrick.delaunay@st.com>
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
Subject: [Uboot-stm32] [PATCH v3 08/15] dfu: add partition support for MTD
	backend
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

Add the support of MTD partition for the MTD backend.

The expected dfu_alt_info for one alternate on the mtd device :
	<name> part <part_id>
        <name> partubi <part_id>

"partubi" also erase up to the end of the partition after write operation.

For example: dfu_alt_info = "spl part 1;u-boot part 2; UBI partubi 3"

U-Boot> dfu 0 mtd nand0

Acked-by: Lukasz Majewski <lukma@denx.de>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v3:
- Update loop management for erase

Changes in v2:
- Update dfu documentation for MTD

 doc/README.dfu        | 21 +++++++++++
 drivers/dfu/dfu_mtd.c | 81 ++++++++++++++++++++++++++++++++++++++++++-
 include/dfu.h         |  2 ++
 3 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/doc/README.dfu b/doc/README.dfu
index 96bced39d8..92a7695be2 100644
--- a/doc/README.dfu
+++ b/doc/README.dfu
@@ -112,6 +112,10 @@ Commands:
       (nand0, nor0, spi-nand0,...)
     each element in "dfu_alt_info" =
       <name> raw <offset> <size>  raw access to mtd device
+      <name> part <dev> <part_id>  raw acces to partition
+      <name> partubi <dev> <part_id>  raw acces to ubi partition
+
+      with <partid> is the MTD partition index
 
   <interface> and <dev> are absent:
     the dfu command to use multiple devices
@@ -209,3 +213,20 @@ Usage:
      intf=0, alt=1, name="u-boot", serial="002700333338511934383330"
   Found DFU: [0483:5720] ver=9999, devnum=96, cfg=1,\
      intf=0, alt=0, name="spl", serial="002700333338511934383330"
+
+  Same example with MTD backend
+
+   U-Boot> env set dfu_alt_info \
+      "mtd nor0=spl part 1;u-boot part 2;u-boot-env part 3&"\
+      "mtd nand0=UBI partubi 1"
+
+  U-Boot> dfu 0 list
+  using id 'nor0,0'
+  using id 'nor0,1'
+  using id 'nor0,2'
+  using id 'nand0,0'
+  DFU alt settings list:
+  dev: MTD alt: 0 name: spl layout: RAW_ADDR
+  dev: MTD alt: 1 name: u-boot layout: RAW_ADDR
+  dev: MTD alt: 2 name: u-boot-env layout: RAW_ADDR
+  dev: MTD alt: 3 name: UBI layout: RAW_ADDR
diff --git a/drivers/dfu/dfu_mtd.c b/drivers/dfu/dfu_mtd.c
index 13fc837c69..9528a7b4ee 100644
--- a/drivers/dfu/dfu_mtd.c
+++ b/drivers/dfu/dfu_mtd.c
@@ -10,6 +10,7 @@
 #include <common.h>
 #include <dfu.h>
 #include <mtd.h>
+#include <jffs2/load_kernel.h>
 
 static bool mtd_is_aligned_with_block_size(struct mtd_info *mtd, u64 size)
 {
@@ -183,11 +184,52 @@ static int dfu_write_medium_mtd(struct dfu_entity *dfu,
 
 static int dfu_flush_medium_mtd(struct dfu_entity *dfu)
 {
+	struct mtd_info *mtd = dfu->data.mtd.info;
+	u64 remaining;
+	int ret;
+
+	/* in case of ubi partition, erase rest of the partition */
+	if (dfu->data.nand.ubi) {
+		struct erase_info erase_op = {};
+
+		erase_op.mtd = dfu->data.mtd.info;
+		erase_op.addr = round_up(dfu->data.mtd.start + dfu->offset +
+					 dfu->bad_skip, mtd->erasesize);
+		erase_op.len = mtd->erasesize;
+		erase_op.scrub = 0;
+
+		remaining = dfu->data.mtd.start + dfu->data.mtd.size -
+			    erase_op.addr;
+
+		while (remaining) {
+			ret = mtd_erase(mtd, &erase_op);
+
+			if (ret) {
+				/* Abort if its not a bad block error */
+				if (ret != -EIO)
+					break;
+				printf("Skipping bad block at 0x%08llx\n",
+				       erase_op.addr);
+			}
+
+			/* Skip bad block and continue behind it */
+			erase_op.addr += mtd->erasesize;
+			remaining -= mtd->erasesize;
+		}
+	}
 	return 0;
 }
 
 static unsigned int dfu_polltimeout_mtd(struct dfu_entity *dfu)
 {
+	/*
+	 * Currently, Poll Timeout != 0 is only needed on nand
+	 * ubi partition, as sectors which are not used need
+	 * to be erased
+	 */
+	if (dfu->data.nand.ubi)
+		return DFU_MANIFEST_POLL_TIMEOUT;
+
 	return DFU_DEFAULT_POLL_TIMEOUT;
 }
 
@@ -196,6 +238,7 @@ int dfu_fill_entity_mtd(struct dfu_entity *dfu, char *devstr, char *s)
 	char *st;
 	struct mtd_info *mtd;
 	bool has_pages;
+	int ret, part;
 
 	mtd = get_mtd_device_nm(devstr);
 	if (IS_ERR_OR_NULL(mtd))
@@ -214,11 +257,47 @@ int dfu_fill_entity_mtd(struct dfu_entity *dfu, char *devstr, char *s)
 		dfu->data.mtd.start = simple_strtoul(s, &s, 16);
 		s++;
 		dfu->data.mtd.size = simple_strtoul(s, &s, 16);
+	} else if ((!strcmp(st, "part")) || (!strcmp(st, "partubi"))) {
+		char mtd_id[32];
+		struct mtd_device *mtd_dev;
+		u8 part_num;
+		struct part_info *pi;
+
+		dfu->layout = DFU_RAW_ADDR;
+
+		part = simple_strtoul(s, &s, 10);
+
+		sprintf(mtd_id, "%s,%d", devstr, part - 1);
+		printf("using id '%s'\n", mtd_id);
+
+		mtdparts_init();
+
+		ret = find_dev_and_part(mtd_id, &mtd_dev, &part_num, &pi);
+		if (ret != 0) {
+			printf("Could not locate '%s'\n", mtd_id);
+			return -1;
+		}
+
+		dfu->data.mtd.start = pi->offset;
+		dfu->data.mtd.size = pi->size;
+		if (!strcmp(st, "partubi"))
+			dfu->data.mtd.ubi = 1;
 	} else {
-		printf("%s: (%s) not supported!\n", __func__, st);
+		printf("%s: Memory layout (%s) not supported!\n", __func__, st);
 		return -1;
 	}
 
+	if (!mtd_is_aligned_with_block_size(mtd, dfu->data.mtd.start)) {
+		printf("Offset not aligned with a block (0x%x)\n",
+		       mtd->erasesize);
+		return -EINVAL;
+	}
+	if (!mtd_is_aligned_with_block_size(mtd, dfu->data.mtd.size)) {
+		printf("Size not aligned with a block (0x%x)\n",
+		       mtd->erasesize);
+		return -EINVAL;
+	}
+
 	dfu->get_medium_size = dfu_get_medium_size_mtd;
 	dfu->read_medium = dfu_read_medium_mtd;
 	dfu->write_medium = dfu_write_medium_mtd;
diff --git a/include/dfu.h b/include/dfu.h
index 924952f805..a90732cc43 100644
--- a/include/dfu.h
+++ b/include/dfu.h
@@ -62,6 +62,8 @@ struct mtd_internal_data {
 	/* RAW programming */
 	u64 start;
 	u64 size;
+	/* for ubi partition */
+	unsigned int ubi;
 };
 
 struct nand_internal_data {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
