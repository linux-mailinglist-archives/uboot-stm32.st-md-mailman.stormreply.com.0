Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58057333885
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Mar 2021 10:16:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16203C57B78;
	Wed, 10 Mar 2021 09:16:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F697C57196
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 09:16:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12A9D0NQ003100; Wed, 10 Mar 2021 10:16:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=PBFaUTnBod+pHLwa1jiRpSviW+yjxz+hiiTD5dTkY9U=;
 b=a8kNhSFSZMhetBygiOffx65Y22EvNrgqz8vaju4d2i6ecf0JwlEvjora6A6fUIPjaJdh
 u4CuN/4Di6bdpT08QxSeYwhDupaXehOCx2Y2kdFhrOs4ofI4rBIP4wzzjWLJPdmWnagD
 +Aj8vhkfMkcFKOPBLxktE79tdmZGcKNjaqqIBRd3dui4Sww6Z02NSFbmIgGTH9WqBdGT
 smSevGvAfzmJT5YQnpkTze0Nh7Qp2iTWWcdlu0OEX/T0pEffpMCLQrFi0MqNR2ma6z8l
 3+hBoXwwNLoYspzLv/uJqKxYo0iQVfFWeuoPBzUI0JaQxO5MAMb15eRxiqbAodFt9cu8 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3741gpq1pn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Mar 2021 10:16:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A3C71100038;
 Wed, 10 Mar 2021 10:16:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 94176228D9D;
 Wed, 10 Mar 2021 10:16:40 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Mar 2021 10:16:40
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 10 Mar 2021 10:16:26 +0100
Message-ID: <20210310101622.v2.2.Ied3d7fa502a6796d8839ee9f4a048b276f16c073@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210310091632.17103-1-patrick.delaunay@foss.st.com>
References: <20210310091632.17103-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-10_07:2021-03-09,
 2021-03-10 signatures=0
Cc: Stefan Roese <sr@denx.de>, Masahiro Yamada <masahiroy@kernel.org>,
 Tero Kristo <t-kristo@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH v2 2/8] lmb: remove lmb_region.size
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

Remove the unused field size of struct lmb_region as it is initialized to 0
and never used after in lmb library.

See Linux kernel commit 4734b594c6ca ("memblock: Remove memblock_type.size
and add memblock.memory_size instead")

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 include/lmb.h | 1 -
 lib/lmb.c     | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/include/lmb.h b/include/lmb.h
index e9f19b16ea..a3247544c1 100644
--- a/include/lmb.h
+++ b/include/lmb.h
@@ -21,7 +21,6 @@ struct lmb_property {
 
 struct lmb_region {
 	unsigned long cnt;
-	phys_size_t size;
 	struct lmb_property region[MAX_LMB_REGIONS+1];
 };
 
diff --git a/lib/lmb.c b/lib/lmb.c
index d126f8dc04..5cf419f439 100644
--- a/lib/lmb.c
+++ b/lib/lmb.c
@@ -20,8 +20,6 @@ void lmb_dump_all_force(struct lmb *lmb)
 
 	printf("lmb_dump_all:\n");
 	printf("    memory.cnt		   = 0x%lx\n", lmb->memory.cnt);
-	printf("    memory.size		   = 0x%llx\n",
-	       (unsigned long long)lmb->memory.size);
 	for (i = 0; i < lmb->memory.cnt; i++) {
 		printf("    memory.reg[0x%lx].base   = 0x%llx\n", i,
 		       (unsigned long long)lmb->memory.region[i].base);
@@ -30,8 +28,6 @@ void lmb_dump_all_force(struct lmb *lmb)
 	}
 
 	printf("\n    reserved.cnt	   = 0x%lx\n", lmb->reserved.cnt);
-	printf("    reserved.size	   = 0x%llx\n",
-	       (unsigned long long)lmb->reserved.size);
 	for (i = 0; i < lmb->reserved.cnt; i++) {
 		printf("    reserved.reg[0x%lx].base = 0x%llx\n", i,
 		       (unsigned long long)lmb->reserved.region[i].base);
@@ -100,9 +96,7 @@ static void lmb_coalesce_regions(struct lmb_region *rgn, unsigned long r1,
 void lmb_init(struct lmb *lmb)
 {
 	lmb->memory.cnt = 0;
-	lmb->memory.size = 0;
 	lmb->reserved.cnt = 0;
-	lmb->reserved.size = 0;
 }
 
 static void lmb_reserve_common(struct lmb *lmb, void *fdt_blob)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
