Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DF0B21B7
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 16:19:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15C30C36B3F
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 14:19:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC390C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2019 14:19:40 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8DEGdeI026133; Fri, 13 Sep 2019 16:19:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ruFrWV33Hyz75rOXAvHb99exnXEIzzdqMSfyBGEJnqY=;
 b=MVA/4ghT8MTgPqHaZvN5Fp5T6xlsztcYYLjOLZOxj3st38Yhue6ENLgS6hdV3enC0u8F
 KUJPxg3RtBNvDlvZKZ34IJ9Ea9s84jxtmJ3FO1wegNkfIH3TSiBJ22SebqfoUYjKhM4i
 67LOdyO7AuX25BoJFY636k3kbosGDPsPz2t4sQ8BitztZpyCtVMXSkrjZO8Z+PbqtPR2
 PqzkchEm79h2HspxjrTKxBSdZ1y/tEhhzPT67MQ8bDt3HvRJEiNpKCr0ZXXbUw8GgIsP
 ZSU5h7VVl6xMe3ONXruhwLXjYdTRtVbf9+KfccX/xgyrhy65S4OZolQwri+a9DndyveA +A== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2uytdxddck-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 13 Sep 2019 16:19:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9D2CD4B;
 Fri, 13 Sep 2019 14:19:36 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 073D82C7F40;
 Fri, 13 Sep 2019 16:19:36 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep
 2019 16:19:35 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep 2019 16:19:35
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 13 Sep 2019 16:19:18 +0200
Message-ID: <20190913141930.15784-3-patrick.delaunay@st.com>
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
Subject: [Uboot-stm32] [PATCH 02/14] dfu: sf: add partition support for nor
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

Copy the partition support from NAND backend to SF,
support part and partubi option.
In case of ubi partition, erase the rest of the
partition as it is mandatory for UBI.

for example:

U-Boot> env set dfu_alt_info "spl part 0 1;\
u-boot part 0 2;u-boot-env part 0 3;UBI partubi 0 4"
U-Boot> dfu 0 sf 0:0:10000000:0

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/dfu/dfu_sf.c | 51 ++++++++++++++++++++++++++++++++++++++++++++
 include/dfu.h        |  2 ++
 2 files changed, 53 insertions(+)

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
