Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B01F425D6D4
	for <lists+uboot-stm32@lfdr.de>; Fri,  4 Sep 2020 12:51:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71FDAC3FADA
	for <lists+uboot-stm32@lfdr.de>; Fri,  4 Sep 2020 10:51:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4EA6EC36B21
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Sep 2020 10:51:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 084AlAup025894; Fri, 4 Sep 2020 12:51:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=cvNeMfoEQSa+xXjSbj1Ndm/9llO+cREBXxt+Z2k+sMs=;
 b=EXJKfTS35SMirtuUiHPUoNGYAPrmYtlfYotqJEk4GhTF24J885WSyP6nXFTboG3Q4HGS
 wPUtAZdjK1BZfQxZnPkMiMoYdM5hVV/my21+77RzEv93JTGxPB4i69HaWr6YqOPg9UwP
 1tIQnaZ2nCtJi6RNCye0LmQ0j0KimiowKGJy00PsH4/NMnThh7O8aXovzloawk0JhrYN
 2zrO1kMCT58HSTqeJC1/naNS/GaPAPBeehUXEckbGRd9isxLI08HK8BMqkwwrgaELVfV
 xuQBxTBHiILIgXcrnKGeRj4K2evfCBx+7PcUt91PQ+DaKpA5pOqPe7AO7mwCBYvJIlzT 6g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 337c591fx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Sep 2020 12:51:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 192EF10002A;
 Fri,  4 Sep 2020 12:51:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0D8912AB32C;
 Fri,  4 Sep 2020 12:51:37 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 4 Sep 2020 12:51:36 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 4 Sep 2020 12:51:28 +0200
Message-ID: <20200904125122.RFC.3.Ied3d7fa502a6796d8839ee9f4a048b276f16c073@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904105133.2502-1-patrick.delaunay@st.com>
References: <20200904105133.2502-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-04_06:2020-09-04,
 2020-09-04 signatures=0
Cc: Marek Vasut <marex@denx.de>, Masahiro Yamada <masahiroy@kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>, Tero Kristo <t-kristo@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [RFC PATCH 3/7] lmb: remove lmb_region.size
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

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 include/lmb.h | 1 -
 lib/lmb.c     | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/include/lmb.h b/include/lmb.h
index 68e9cc007a..9be422103c 100644
--- a/include/lmb.h
+++ b/include/lmb.h
@@ -32,7 +32,6 @@ struct lmb_property {
 
 struct lmb_region {
 	unsigned long cnt;
-	phys_size_t size;
 	struct lmb_property region[MAX_LMB_REGIONS+1];
 };
 
diff --git a/lib/lmb.c b/lib/lmb.c
index 3d64521a32..eac0143501 100644
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
@@ -32,8 +30,6 @@ void lmb_dump_all_force(struct lmb *lmb)
 	}
 
 	printf("\n    reserved.cnt	   = 0x%lx\n", lmb->reserved.cnt);
-	printf("    reserved.size	   = 0x%llx\n",
-	       (unsigned long long)lmb->reserved.size);
 	for (i = 0; i < lmb->reserved.cnt; i++) {
 		printf("    reserved.reg[0x%lx].base = 0x%llx\n", i,
 		       (unsigned long long)lmb->reserved.region[i].base);
@@ -105,9 +101,7 @@ static void lmb_coalesce_regions(struct lmb_region *rgn, unsigned long r1,
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
