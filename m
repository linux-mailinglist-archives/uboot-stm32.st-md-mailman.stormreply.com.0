Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD88C2236
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Sep 2019 15:38:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2A7FC36B0F
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Sep 2019 13:38:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13A19C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2019 13:38:44 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8UDbBcl032029; Mon, 30 Sep 2019 15:38:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=MqJGtsvMTmk+ID2dVs++9/I5OhncxS2iNj20Jgz+cLY=;
 b=OFhmN4tDN/QBNUbqYMXjxNipS4CuS7cxElPt/jDcsWeL90jG0h1Mjd/xqDgT+f4IV9fN
 eaSZgQ2KqryPCQ4RGkrd7jC9cMKS4I+VJBxohwAtkzAwy6u1tzHhhISkQr+yodldqSIT
 3ystERFrUE3OcvOU2vVisBhuVIQRLB8JooNsYzmRbYAo4kkJKqqD7foriu46KzUpxUee
 c3zuKLO88jIfbxk/lemHFW+Plag62yL/A6mc/ssQFwk13NwoY5i3w9VrVx4U1rGj7h7J
 PwV+JJJSaT2e9K9ms7121d1bGOz61Pa2DCDYhJtpVHdaBdwXoqukbwo68mm62zt/d1VF iw== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2v9w9vkcva-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 30 Sep 2019 15:38:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D566655;
 Mon, 30 Sep 2019 13:38:38 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9309A2FF5DC;
 Mon, 30 Sep 2019 15:38:38 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 30 Sep
 2019 15:38:38 +0200
Received: from localhost (10.201.21.107) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 30 Sep 2019 15:38:37
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 30 Sep 2019 15:38:19 +0200
Message-ID: <20190930133832.11992-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190930133832.11992-1-patrick.delaunay@st.com>
References: <20190930133832.11992-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-30_09:2019-09-25,2019-09-30 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 "Andrew F. Davis" <afd@ti.com>
Subject: [Uboot-stm32] [PATCH v2 03/16] dfu: sf: add partition support for
	nor backend
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

Copy the partition support from NAND backend to SF,
support part and partubi option.
In case of ubi partition, erase the rest of the
partition as it is mandatory for UBI.

for example:

U-Boot> env set dfu_alt_info "spl part 0 1;\
u-boot part 0 2;u-boot-env part 0 3;UBI partubi 0 4"
U-Boot> dfu 0 sf 0:0:10000000:0

Acked-by: Lukasz Majewski <lukma@denx.de>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- Update dfu documentation for callbacks

 doc/README.dfu       |  4 ++++
 drivers/dfu/dfu_sf.c | 51 ++++++++++++++++++++++++++++++++++++++++++++
 include/dfu.h        |  2 ++
 3 files changed, 57 insertions(+)

diff --git a/doc/README.dfu b/doc/README.dfu
index f5344e236c..cf5de28b01 100644
--- a/doc/README.dfu
+++ b/doc/README.dfu
@@ -89,6 +89,10 @@ Commands:
     cmd: dfu 0 sf <dev>
     each element in "dfu_alt_info" =
       <name> ram <offset> <size>  raw access to sf device
+      <name> part <dev> <part_id>  raw acces to partition
+      <name> partubi <dev> <part_id>  raw acces to ubi partition
+
+      with <partid> is the MTD partition index
 
 Host tools:
   When U-Boot runs the dfu stack, the DFU host tools can be used
diff --git a/drivers/dfu/dfu_sf.c b/drivers/dfu/dfu_sf.c
index b78fcfd3a1..d401b76c2e 100644
--- a/drivers/dfu/dfu_sf.c
+++ b/drivers/dfu/dfu_sf.c
@@ -10,6 +10,8 @@
 #include <dfu.h>
 #include <spi.h>
 #include <spi_flash.h>
+#include <jffs2/load_kernel.h>
+#include <linux/mtd/mtd.h>
 
 static int dfu_get_medium_size_sf(struct dfu_entity *dfu, u64 *size)
 {
@@ -52,11 +54,33 @@ static int dfu_write_medium_sf(struct dfu_entity *dfu,
 
 static int dfu_flush_medium_sf(struct dfu_entity *dfu)
 {
+	u64 off, length;
+
+	if (!dfu->data.sf.ubi)
+		return 0;
+
+	/* in case of ubi partition, erase rest of the partition */
+	off = find_sector(dfu, dfu->data.sf.start, dfu->offset);
+	/* last write ended with unaligned length jump to next */
+	if (off != dfu->data.sf.start + dfu->offset)
+		off += dfu->data.sf.dev->sector_size;
+	length = dfu->data.sf.start + dfu->data.sf.size - off;
+	if (length)
+		return spi_flash_erase(dfu->data.sf.dev, off, length);
+
 	return 0;
 }
 
 static unsigned int dfu_polltimeout_sf(struct dfu_entity *dfu)
 {
+	/*
+	 * Currently, Poll Timeout != 0 is only needed on nand
+	 * ubi partition, as sectors which are not used need
+	 * to be erased
+	 */
+	if (dfu->data.sf.ubi)
+		return DFU_MANIFEST_POLL_TIMEOUT;
+
 	return DFU_DEFAULT_POLL_TIMEOUT;
 }
 
@@ -133,6 +157,33 @@ int dfu_fill_entity_sf(struct dfu_entity *dfu, char *devstr, char *s)
 		dfu->data.sf.start = simple_strtoul(s, &s, 16);
 		s++;
 		dfu->data.sf.size = simple_strtoul(s, &s, 16);
+	} else if ((!strcmp(st, "part")) || (!strcmp(st, "partubi"))) {
+		char mtd_id[32];
+		struct mtd_device *mtd_dev;
+		u8 part_num;
+		struct part_info *pi;
+		int ret, dev, part;
+
+		dfu->layout = DFU_RAW_ADDR;
+
+		dev = simple_strtoul(s, &s, 10);
+		s++;
+		part = simple_strtoul(s, &s, 10);
+
+		sprintf(mtd_id, "%s%d,%d", "nor", dev, part - 1);
+		printf("using id '%s'\n", mtd_id);
+
+		mtdparts_init();
+
+		ret = find_dev_and_part(mtd_id, &mtd_dev, &part_num, &pi);
+		if (ret != 0) {
+			printf("Could not locate '%s'\n", mtd_id);
+			return -1;
+		}
+		dfu->data.sf.start = pi->offset;
+		dfu->data.sf.size = pi->size;
+		if (!strcmp(st, "partubi"))
+			dfu->data.sf.ubi = 1;
 	} else {
 		printf("%s: Memory layout (%s) not supported!\n", __func__, st);
 		spi_flash_free(dfu->data.sf.dev);
diff --git a/include/dfu.h b/include/dfu.h
index 145a1576a3..bf51ab74a5 100644
--- a/include/dfu.h
+++ b/include/dfu.h
@@ -77,6 +77,8 @@ struct sf_internal_data {
 	/* RAW programming */
 	u64 start;
 	u64 size;
+	/* for sf/ubi use */
+	unsigned int ubi;
 };
 
 #define DFU_NAME_SIZE			32
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
