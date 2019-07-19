Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1436E600
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 15:00:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48C66C0B771
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 13:00:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B65C8C0B76D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2019 13:00:53 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6JCugI4018541; Fri, 19 Jul 2019 15:00:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=+e3HhSvlEFy/dOd6B7e5/9mbDN+AyKtVYyZ674iNAAk=;
 b=kbZWIc0NM5X+ap7xDlbZUh/fJq69AEkRu4ZDxBOfDnvv1IifFNip8nURBXc4nwwOaU99
 T0RvWuC7P9PEkL2ohzn3MBm9ZRSNJnljHhU/8kYPxfEZYIO/13hLAHC3HY5zOFfjRroz
 wlBGZBIJH+i8dCcsySSsjqp/qH4LeIWrAY/pmWAt+pidV3Dx61VhBi0Uf7naO7LsobTG
 SwhkKXIh9d8+IY5vnjZ3mwZ//a63zOJUg4jsoTgEI7Ca0QRXOKYRvmQjwtuK/sUas6XY
 9ECfGe81gyzS1JgrBWF7QyomowOwX1fanX3Ctaz1S3mlSXWMJk8uuDvxWmKi5K2/N2hO XA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tsdepv663-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 19 Jul 2019 15:00:48 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2003548;
 Fri, 19 Jul 2019 12:57:32 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0C4782D4F;
 Fri, 19 Jul 2019 12:57:32 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul
 2019 14:57:32 +0200
Received: from localhost (10.201.23.85) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul 2019 14:57:32
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Jul 2019 14:57:14 +0200
Message-ID: <1563541046-6432-3-git-send-email-patrick.delaunay@st.com>
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
Subject: [Uboot-stm32] [RFC PATCH 02/14] dfu: sf: add partition support for
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

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/dfu/dfu_sf.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 include/dfu.h        |  2 ++
 2 files changed, 53 insertions(+)

diff --git a/drivers/dfu/dfu_sf.c b/drivers/dfu/dfu_sf.c
index b78fcfd..d401b76 100644
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
index 145a157..bf51ab7 100644
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
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
