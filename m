Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A84636D5B7
	for <lists+uboot-stm32@lfdr.de>; Wed, 28 Apr 2021 12:23:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 142D1C58D63;
	Wed, 28 Apr 2021 10:23:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA963C57B75
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Apr 2021 10:23:56 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SAIfui024762; Wed, 28 Apr 2021 12:23:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=Zm2n/yv6LBQnzWWR2ymz++O6fZsTw/mXxTQApKhQ7KU=;
 b=QWFCey56CoU08fVw47MSkP8S6VPnNSCdSsUH7Z7eItdMt3ZnFkCpehb+t5DYsGef+Gk6
 zYjhIs4TRrhZRHCXELgA1NLFOG3YVk5whELjZOndBGKmShziIZ43Ajyao3ADpyT6sLzu
 5CiaGV2Ekf3GeSSuXpQwV3lpxO4Vcg/pI7znnfG7sgunQQPgQbuTgW6kDIi1L4qQUYDQ
 HcguppEiTRH4bwbF4pVLdk1Bh2I4Ix8OJuO+QWtjrNb9rbYdAlcTaMIMEb8YkSRk3U9f
 ftUGkW8V0jNqVyVCiAvIqXzkmh1Jogkio2rZeiUVSf8rmskqdpY0/rHzS+awGgHNcsn5 pA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38735wh7hc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 12:23:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5A0E6100038;
 Wed, 28 Apr 2021 12:23:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 48977211B09;
 Wed, 28 Apr 2021 12:23:49 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 28 Apr 2021 12:23:48
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 28 Apr 2021 12:23:39 +0200
Message-ID: <20210428122109.v3.1.Iac36d9d9036edd54d2574d712ca21283bf7c73d0@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210428102345.3192-1-patrick.delaunay@foss.st.com>
References: <20210428102345.3192-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_04:2021-04-27,
 2021-04-28 signatures=0
Cc: Marek Vasut <marex@denx.de>, Bin Meng <bmeng.cn@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Stefan Roese <sr@denx.de>,
 Ard Biesheuvel <ardb@kernel.org>, Tero Kristo <t-kristo@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, marek.bykowski@gmail.com,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: [Uboot-stm32] [PATCH v3 1/7] lmb: Add support of flags for no-map
	properties
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

Add "flags" in lmb_property to save the "no-map" property of
reserved region and a new function lmb_reserve_flags() to check
this flag.

The default allocation use flags = LMB_NONE.

The adjacent reserved memory region are merged only when they have
the same flags value.

This patch is partially based on flags support done in Linux kernel
mm/memblock .c (previously lmb.c); it is why LMB_NOMAP = 0x4, it is
aligned with MEMBLOCK_NOMAP value.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v2)

Changes in v2:
- remove unnecessary comments in lmb.h
- rebase on latest lmb patches

 include/lmb.h | 20 ++++++++++++++++++++
 lib/lmb.c     | 52 ++++++++++++++++++++++++++++++++++++++++++---------
 2 files changed, 63 insertions(+), 9 deletions(-)

diff --git a/include/lmb.h b/include/lmb.h
index 541e17093c..aa196c63bf 100644
--- a/include/lmb.h
+++ b/include/lmb.h
@@ -12,6 +12,16 @@
  * Copyright (C) 2001 Peter Bergner, IBM Corp.
  */
 
+/**
+ * enum lmb_flags - definition of memory region attributes
+ * @LMB_NONE: no special request
+ * @LMB_NOMAP: don't add to mmu configuration
+ */
+enum lmb_flags {
+	LMB_NONE		= 0x0,
+	LMB_NOMAP		= 0x4,
+};
+
 /**
  * struct lmb_property - Description of one region.
  *
@@ -21,6 +31,7 @@
 struct lmb_property {
 	phys_addr_t base;
 	phys_size_t size;
+	enum lmb_flags flags;
 };
 
 /**
@@ -69,6 +80,8 @@ extern void lmb_init_and_reserve_range(struct lmb *lmb, phys_addr_t base,
 				       phys_size_t size, void *fdt_blob);
 extern long lmb_add(struct lmb *lmb, phys_addr_t base, phys_size_t size);
 extern long lmb_reserve(struct lmb *lmb, phys_addr_t base, phys_size_t size);
+extern long lmb_reserve_flags(struct lmb *lmb, phys_addr_t base,
+			      phys_size_t size, enum lmb_flags flags);
 extern phys_addr_t lmb_alloc(struct lmb *lmb, phys_size_t size, ulong align);
 extern phys_addr_t lmb_alloc_base(struct lmb *lmb, phys_size_t size, ulong align,
 			    phys_addr_t max_addr);
@@ -92,6 +105,13 @@ lmb_size_bytes(struct lmb_region *type, unsigned long region_nr)
 void board_lmb_reserve(struct lmb *lmb);
 void arch_lmb_reserve(struct lmb *lmb);
 
+/* Low level functions */
+
+static inline bool lmb_is_nomap(struct lmb_property *m)
+{
+	return !!(m->flags & LMB_NOMAP);
+}
+
 #endif /* __KERNEL__ */
 
 #endif /* _LINUX_LMB_H */
diff --git a/lib/lmb.c b/lib/lmb.c
index c08c4d942b..69700bf9ba 100644
--- a/lib/lmb.c
+++ b/lib/lmb.c
@@ -25,6 +25,8 @@ void lmb_dump_all_force(struct lmb *lmb)
 		       (unsigned long long)lmb->memory.region[i].base);
 		printf("		   .size   = 0x%llx\n",
 		       (unsigned long long)lmb->memory.region[i].size);
+		printf("		   .flags   = 0x%x\n",
+		       lmb->memory.region[i].flags);
 	}
 
 	printf("\n    reserved.cnt	   = 0x%lx\n", lmb->reserved.cnt);
@@ -33,6 +35,8 @@ void lmb_dump_all_force(struct lmb *lmb)
 		       (unsigned long long)lmb->reserved.region[i].base);
 		printf("		     .size = 0x%llx\n",
 		       (unsigned long long)lmb->reserved.region[i].size);
+		printf("		     .flags = 0x%x\n",
+		       lmb->reserved.region[i].flags);
 	}
 }
 
@@ -81,6 +85,7 @@ static void lmb_remove_region(struct lmb_region *rgn, unsigned long r)
 	for (i = r; i < rgn->cnt - 1; i++) {
 		rgn->region[i].base = rgn->region[i + 1].base;
 		rgn->region[i].size = rgn->region[i + 1].size;
+		rgn->region[i].flags = rgn->region[i + 1].flags;
 	}
 	rgn->cnt--;
 }
@@ -144,7 +149,8 @@ void lmb_init_and_reserve_range(struct lmb *lmb, phys_addr_t base,
 }
 
 /* This routine called with relocation disabled. */
-static long lmb_add_region(struct lmb_region *rgn, phys_addr_t base, phys_size_t size)
+static long lmb_add_region_flags(struct lmb_region *rgn, phys_addr_t base,
+				 phys_size_t size, enum lmb_flags flags)
 {
 	unsigned long coalesced = 0;
 	long adjacent, i;
@@ -152,6 +158,7 @@ static long lmb_add_region(struct lmb_region *rgn, phys_addr_t base, phys_size_t
 	if (rgn->cnt == 0) {
 		rgn->region[0].base = base;
 		rgn->region[0].size = size;
+		rgn->region[0].flags = flags;
 		rgn->cnt = 1;
 		return 0;
 	}
@@ -160,18 +167,27 @@ static long lmb_add_region(struct lmb_region *rgn, phys_addr_t base, phys_size_t
 	for (i = 0; i < rgn->cnt; i++) {
 		phys_addr_t rgnbase = rgn->region[i].base;
 		phys_size_t rgnsize = rgn->region[i].size;
+		phys_size_t rgnflags = rgn->region[i].flags;
 
-		if ((rgnbase == base) && (rgnsize == size))
-			/* Already have this region, so we're done */
-			return 0;
+		if (rgnbase == base && rgnsize == size) {
+			if (flags == rgnflags)
+				/* Already have this region, so we're done */
+				return 0;
+			else
+				return -1; /* regions with new flags */
+		}
 
 		adjacent = lmb_addrs_adjacent(base, size, rgnbase, rgnsize);
 		if (adjacent > 0) {
+			if (flags != rgnflags)
+				break;
 			rgn->region[i].base -= size;
 			rgn->region[i].size += size;
 			coalesced++;
 			break;
 		} else if (adjacent < 0) {
+			if (flags != rgnflags)
+				break;
 			rgn->region[i].size += size;
 			coalesced++;
 			break;
@@ -182,8 +198,10 @@ static long lmb_add_region(struct lmb_region *rgn, phys_addr_t base, phys_size_t
 	}
 
 	if ((i < rgn->cnt - 1) && lmb_regions_adjacent(rgn, i, i + 1)) {
-		lmb_coalesce_regions(rgn, i, i + 1);
-		coalesced++;
+		if (rgn->region[i].flags == rgn->region[i + 1].flags) {
+			lmb_coalesce_regions(rgn, i, i + 1);
+			coalesced++;
+		}
 	}
 
 	if (coalesced)
@@ -196,9 +214,11 @@ static long lmb_add_region(struct lmb_region *rgn, phys_addr_t base, phys_size_t
 		if (base < rgn->region[i].base) {
 			rgn->region[i + 1].base = rgn->region[i].base;
 			rgn->region[i + 1].size = rgn->region[i].size;
+			rgn->region[i + 1].flags = rgn->region[i].flags;
 		} else {
 			rgn->region[i + 1].base = base;
 			rgn->region[i + 1].size = size;
+			rgn->region[i + 1].flags = flags;
 			break;
 		}
 	}
@@ -206,6 +226,7 @@ static long lmb_add_region(struct lmb_region *rgn, phys_addr_t base, phys_size_t
 	if (base < rgn->region[0].base) {
 		rgn->region[0].base = base;
 		rgn->region[0].size = size;
+		rgn->region[0].flags = flags;
 	}
 
 	rgn->cnt++;
@@ -213,6 +234,12 @@ static long lmb_add_region(struct lmb_region *rgn, phys_addr_t base, phys_size_t
 	return 0;
 }
 
+static long lmb_add_region(struct lmb_region *rgn, phys_addr_t base,
+			   phys_size_t size)
+{
+	return lmb_add_region_flags(rgn, base, size, LMB_NONE);
+}
+
 /* This routine may be called with relocation disabled. */
 long lmb_add(struct lmb *lmb, phys_addr_t base, phys_size_t size)
 {
@@ -267,14 +294,21 @@ long lmb_free(struct lmb *lmb, phys_addr_t base, phys_size_t size)
 	 * beginging of the hole and add the region after hole.
 	 */
 	rgn->region[i].size = base - rgn->region[i].base;
-	return lmb_add_region(rgn, end + 1, rgnend - end);
+	return lmb_add_region_flags(rgn, end + 1, rgnend - end,
+				    rgn->region[i].flags);
 }
 
-long lmb_reserve(struct lmb *lmb, phys_addr_t base, phys_size_t size)
+long lmb_reserve_flags(struct lmb *lmb, phys_addr_t base, phys_size_t size,
+		       enum lmb_flags flags)
 {
 	struct lmb_region *_rgn = &(lmb->reserved);
 
-	return lmb_add_region(_rgn, base, size);
+	return lmb_add_region_flags(_rgn, base, size, flags);
+}
+
+long lmb_reserve(struct lmb *lmb, phys_addr_t base, phys_size_t size)
+{
+	return lmb_reserve_flags(lmb, base, size, LMB_NONE);
 }
 
 static long lmb_overlaps_region(struct lmb_region *rgn, phys_addr_t base,
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
