Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB99AB21BE
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 16:19:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B55C4C35E03
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 14:19:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBEE7C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2019 14:19:46 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8DEGIj9017350; Fri, 13 Sep 2019 16:19:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=FvxrVxYIfXN7FqTidheXRONdws4Izvlkuz4kMz3CWzc=;
 b=cZURrli5w9HrFku7CAqmsyT60LhhvI0U2zLsIA/hzD89rHls1NTTz2yyEo63u00fT69S
 ltMjqUltBBnjb2sJL6eVK0YakyZcjOkC1bBklhZ4/Fr11mXnRfhpbRPbmw4P8VH5KC2A
 at74owfaLSuWENnUgUB3g0sOVSDKpAxJpI390LF4TWJn/rupjDoOaRLpeK70TEzO1lb1
 iKwmseiPAFW5uSXT7i4S0nOlYvv87fCvyVRmRpXLsviqGOmrimecxU27O18MZSit7tz1
 mYitk/6xPBirudcGRTrXea4P8yIasrSCQ+Gs8NzIM8RJzeAoO3fyv8PRsy83asks/Qlm SQ== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2uyte2wddb-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 13 Sep 2019 16:19:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B1C3F22;
 Fri, 13 Sep 2019 14:19:42 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 708502C7F43;
 Fri, 13 Sep 2019 16:19:42 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep
 2019 16:19:42 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep 2019 16:19:41
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 13 Sep 2019 16:19:23 +0200
Message-ID: <20190913141930.15784-8-patrick.delaunay@st.com>
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
Subject: [Uboot-stm32] [PATCH 07/14] dfu: add partition support for MTD
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

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/dfu/dfu_mtd.c | 78 ++++++++++++++++++++++++++++++++++++++++++-
 include/dfu.h         |  2 ++
 2 files changed, 79 insertions(+), 1 deletion(-)

diff --git a/drivers/dfu/dfu_mtd.c b/drivers/dfu/dfu_mtd.c
index 1168a6e278..223b0fe977 100644
--- a/drivers/dfu/dfu_mtd.c
+++ b/drivers/dfu/dfu_mtd.c
@@ -10,6 +10,7 @@
 #include <common.h>
 #include <dfu.h>
 #include <mtd.h>
+#include <jffs2/load_kernel.h>
 
 static bool mtd_is_aligned_with_block_size(struct mtd_info *mtd, u64 size)
 {
@@ -181,11 +182,49 @@ static int dfu_write_medium_mtd(struct dfu_entity *dfu,
 
 static int dfu_flush_medium_mtd(struct dfu_entity *dfu)
 {
+	struct mtd_info *mtd = dfu->data.mtd.info;
+	int ret;
+
+	/* in case of ubi partition, erase rest of the partition */
+	if (dfu->data.nand.ubi) {
+		struct erase_info erase_op = {};
+
+		erase_op.mtd = dfu->data.mtd.info;
+		erase_op.addr = round_up(dfu->data.mtd.start + dfu->offset +
+					 dfu->bad_skip, mtd->erasesize);
+		erase_op.len = dfu->data.mtd.start + dfu->data.mtd.size -
+			       erase_op.addr;
+		erase_op.scrub = 0;
+
+		while (erase_op.len) {
+			ret = mtd_erase(mtd, &erase_op);
+			/* Abort if its not a bad block error */
+			if (ret != -EIO)
+				break;
+
+			printf("Skipping bad block at 0x%08llx\n",
+			       erase_op.fail_addr);
+
+			/* Skip bad block and continue behind it */
+			erase_op.addr = erase_op.fail_addr + mtd->erasesize;
+			erase_op.len = dfu->data.mtd.start +
+				       dfu->data.mtd.size -
+				       erase_op.addr;
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
 
@@ -194,6 +233,7 @@ int dfu_fill_entity_mtd(struct dfu_entity *dfu, char *devstr, char *s)
 	char *st;
 	struct mtd_info *mtd;
 	bool has_pages;
+	int ret, part;
 
 	mtd = get_mtd_device_nm(devstr);
 	if (IS_ERR_OR_NULL(mtd))
@@ -212,11 +252,47 @@ int dfu_fill_entity_mtd(struct dfu_entity *dfu, char *devstr, char *s)
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
