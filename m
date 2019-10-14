Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5377D5C6C
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 09:28:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F669C36B0F
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 07:28:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9AE4C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 07:28:27 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9E7Rpgr007209; Mon, 14 Oct 2019 09:28:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=WSYXgwAovHO4BD1pUIgchLjRpq1wTFOf3mVWlj//0xw=;
 b=UbvqbEVzcirJgDHtI9SRpNHl1S7b1lgU7RopD+pEDcH7IuFGSDQ4qQw5CCbAPe/MTmDm
 7G2PwB12geHoDm3DsnUzO+ul5wQRuGvtxioxoGI8YUWdMNGhGFMzzAMXSRT27TnpK8Lq
 pvQ9LVxk3Q+Z6nFHDlYYEl5ElI4x0Y3Yn7xcbmRxlnFt4KWdH5fgZ2E0bSwoiWxzZ81h
 OLL9Ov58BplCz/xsUH61byK1O7CqMedyLBtdk0bfLbH+/u13iiRNHANyv5rvA/BiOn7a
 f2U/Bq+Ooj2rOS9muSSh/j8vLJXPfa6a5IsSJ9MqMG8ouSo3pqOEk5DgbyLBGRZ1W/YB ZA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vk3y9h5wg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 09:28:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E4CD410002A;
 Mon, 14 Oct 2019 09:28:23 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DAAD32ADFFB;
 Mon, 14 Oct 2019 09:28:23 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct
 2019 09:28:23 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct 2019 09:28:23
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 14 Oct 2019 09:28:00 +0200
Message-ID: <20191014072812.21843-4-patrick.delaunay@st.com>
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
Subject: [Uboot-stm32] [PATCH v3 03/15] dfu: sf: add partition support for
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

The added code is under compilation flag CONFIG_DFU_SF_PART
activated by default.

for example:

U-Boot> env set dfu_alt_info "spl part 0 1;\
u-boot part 0 2;u-boot-env part 0 3;UBI partubi 0 4"
U-Boot> dfu 0 sf 0:0:10000000:0

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v3:
- Add CONFIG_DFU_SF_PART and solve compilation issue,
  dependancy with CONFIG_MTDPARTS

Changes in v2:
- Update dfu documentation for callbacks

 doc/README.dfu       |  5 +++++
 drivers/dfu/Kconfig  |  8 +++++++
 drivers/dfu/dfu_sf.c | 52 ++++++++++++++++++++++++++++++++++++++++++++
 include/dfu.h        |  2 ++
 4 files changed, 67 insertions(+)

diff --git a/doc/README.dfu b/doc/README.dfu
index f5344e236c..7a2b5f1d4b 100644
--- a/doc/README.dfu
+++ b/doc/README.dfu
@@ -33,6 +33,7 @@ Configuration Options:
   CONFIG_DFU_NAND
   CONFIG_DFU_RAM
   CONFIG_DFU_SF
+  CONFIG_DFU_SF_PART
   CONFIG_CMD_DFU
 
 Environment variables:
@@ -89,6 +90,10 @@ Commands:
     cmd: dfu 0 sf <dev>
     each element in "dfu_alt_info" =
       <name> ram <offset> <size>  raw access to sf device
+      <name> part <dev> <part_id>  raw acces to partition
+      <name> partubi <dev> <part_id>  raw acces to ubi partition
+
+      with <partid> is the MTD partition index
 
 Host tools:
   When U-Boot runs the dfu stack, the DFU host tools can be used
diff --git a/drivers/dfu/Kconfig b/drivers/dfu/Kconfig
index 4692736c9d..1cbec81128 100644
--- a/drivers/dfu/Kconfig
+++ b/drivers/dfu/Kconfig
@@ -46,5 +46,13 @@ config DFU_SF
 	  This option enables using DFU to read and write to SPI flash based
 	  storage.
 
+config DFU_SF_PART
+	bool "MTD partition support for SPI flash back end"
+	depends on DFU_SF && CMD_MTDPARTS
+	default y
+	help
+	  This option enables the support of "part" and "partubi" target in
+	  SPI flash DFU back end.
+
 endif
 endmenu
diff --git a/drivers/dfu/dfu_sf.c b/drivers/dfu/dfu_sf.c
index b78fcfd3a1..0fdbfae434 100644
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
+	if (!CONFIG_IS_ENABLED(DFU_SF_PART) || !dfu->data.sf.ubi)
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
+	if (CONFIG_IS_ENABLED(DFU_SF_PART) && dfu->data.sf.ubi)
+		return DFU_MANIFEST_POLL_TIMEOUT;
+
 	return DFU_DEFAULT_POLL_TIMEOUT;
 }
 
@@ -133,6 +157,34 @@ int dfu_fill_entity_sf(struct dfu_entity *dfu, char *devstr, char *s)
 		dfu->data.sf.start = simple_strtoul(s, &s, 16);
 		s++;
 		dfu->data.sf.size = simple_strtoul(s, &s, 16);
+	} else if (CONFIG_IS_ENABLED(DFU_SF_PART) &&
+		   (!strcmp(st, "part") || !strcmp(st, "partubi"))) {
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
