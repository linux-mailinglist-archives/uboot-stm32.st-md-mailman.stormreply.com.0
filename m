Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C79D925D6D6
	for <lists+uboot-stm32@lfdr.de>; Fri,  4 Sep 2020 12:51:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 838FBC3FADE
	for <lists+uboot-stm32@lfdr.de>; Fri,  4 Sep 2020 10:51:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53E4FC3FAD9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Sep 2020 10:51:42 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 084Ao2nr032683; Fri, 4 Sep 2020 12:51:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ARpJtWy0Ri1FdguVD/ghqJ7/MkLfeTkNmgdnnJkyaUc=;
 b=gtjBco3BF1pWPTjsdTlN/MT1M2pAYCOuT5NiOaG73lzRuebC9DSG/g0kFWZCeaDSRyLE
 ARC8KT1CLRZLg516loTlZRvj8R9E2VwUxHLAF/dAH41C9Qz94zppNp9eTxkKCckpQK3q
 6a3+lgKTeh6P94RSweVp/RxkeCjyCM/LX7eqpSOUbTZ8lnGMmjYeOscloPV/rm2P7rem
 I+9YcRZX38A2NOw8Q9wr092IsD6fGFRPVpaWiPGgIaxf0IgANK52ZP/I7yQRZsUD5Suk
 9vGp0oq9JV4yg1QFgROJEGQTb74mRn9XoCul+OgKzpZI6JUYQ8Knw+l54s7WyDneeIBK 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 337csw975b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Sep 2020 12:51:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8D81810002A;
 Fri,  4 Sep 2020 12:51:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 67C1F2AB332;
 Fri,  4 Sep 2020 12:51:35 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 4 Sep 2020 12:51:34 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 4 Sep 2020 12:51:26 +0200
Message-ID: <20200904125122.RFC.1.Iac36d9d9036edd54d2574d712ca21283bf7c73d0@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904105133.2502-1-patrick.delaunay@st.com>
References: <20200904105133.2502-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-04_05:2020-09-04,
 2020-09-04 signatures=0
Cc: Marek Vasut <marex@denx.de>, Masahiro Yamada <masahiroy@kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>, Tero Kristo <t-kristo@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [RFC PATCH 1/7] lmb: Add support of flags for no-map
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

Add "flags" in lmp_property to save the "no-map" property of reserved region
and a new function lmb_reserve_flags() to check this flag.

The default allocation use flags = LMB_NONE.

The adjacent reserved memory region are merged only when they have
the same flags value.

This patch is partially based on flags support done in Linux kernel
mm/memblock .c (previously lmb.c); it is why LMB_NOMAP = 0x4, it is
aligned with MEMBLOCK_NOMAP value.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 include/lmb.h | 20 ++++++++++++++++++++
 lib/lmb.c     | 52 ++++++++++++++++++++++++++++++++++++++++++---------
 2 files changed, 63 insertions(+), 9 deletions(-)

diff --git a/include/lmb.h b/include/lmb.h
index e9f19b16ea..1c73f4851b 100644
--- a/include/lmb.h
+++ b/include/lmb.h
@@ -14,9 +14,20 @@
 
 #define MAX_LMB_REGIONS 8
 
+/**
+ * enum lmb_flags - definition of memory region attributes
+ * @LMB_NONE: no special request
+ * @LMB_NOMAP: don't add to mmu configuration
+ */
+enum lmb_flags {
+	LMB_NONE		= 0x0,	/* No special request */
+	LMB_NOMAP		= 0x4,	/* don't add to mmu config */
+};
+
 struct lmb_property {
 	phys_addr_t base;
 	phys_size_t size;
+	enum lmb_flags flags;
 };
 
 struct lmb_region {
@@ -37,6 +48,8 @@ extern void lmb_init_and_reserve_range(struct lmb *lmb, phys_addr_t base,
 				       phys_size_t size, void *fdt_blob);
 extern long lmb_add(struct lmb *lmb, phys_addr_t base, phys_size_t size);
 extern long lmb_reserve(struct lmb *lmb, phys_addr_t base, phys_size_t size);
+extern long lmb_reserve_flags(struct lmb *lmb, phys_addr_t base,
+			      phys_size_t size, enum lmb_flags flags);
 extern phys_addr_t lmb_alloc(struct lmb *lmb, phys_size_t size, ulong align);
 extern phys_addr_t lmb_alloc_base(struct lmb *lmb, phys_size_t size, ulong align,
 			    phys_addr_t max_addr);
@@ -60,6 +73,13 @@ lmb_size_bytes(struct lmb_region *type, unsigned long region_nr)
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
index 75082f3559..e85e08635c 100644
--- a/lib/lmb.c
+++ b/lib/lmb.c
@@ -27,6 +27,8 @@ void lmb_dump_all_force(struct lmb *lmb)
 		       (unsigned long long)lmb->memory.region[i].base);
 		printf("		   .size   = 0x%llx\n",
 		       (unsigned long long)lmb->memory.region[i].size);
+		printf("		   .flags   = 0x%x\n",
+		       lmb->memory.region[i].flags);
 	}
 
 	printf("\n    reserved.cnt	   = 0x%lx\n", lmb->reserved.cnt);
@@ -37,6 +39,8 @@ void lmb_dump_all_force(struct lmb *lmb)
 		       (unsigned long long)lmb->reserved.region[i].base);
 		printf("		     .size = 0x%llx\n",
 		       (unsigned long long)lmb->reserved.region[i].size);
+		printf("		     .flags = 0x%x\n",
+		       lmb->reserved.region[i].flags);
 	}
 }
 
@@ -85,6 +89,7 @@ static void lmb_remove_region(struct lmb_region *rgn, unsigned long r)
 	for (i = r; i < rgn->cnt - 1; i++) {
 		rgn->region[i].base = rgn->region[i + 1].base;
 		rgn->region[i].size = rgn->region[i + 1].size;
+		rgn->region[i].flags = rgn->region[i + 1].flags;
 	}
 	rgn->cnt--;
 }
@@ -146,7 +151,8 @@ void lmb_init_and_reserve_range(struct lmb *lmb, phys_addr_t base,
 }
 
 /* This routine called with relocation disabled. */
-static long lmb_add_region(struct lmb_region *rgn, phys_addr_t base, phys_size_t size)
+static long lmb_add_region_flags(struct lmb_region *rgn, phys_addr_t base,
+				 phys_size_t size, enum lmb_flags flags)
 {
 	unsigned long coalesced = 0;
 	long adjacent, i;
@@ -154,6 +160,7 @@ static long lmb_add_region(struct lmb_region *rgn, phys_addr_t base, phys_size_t
 	if (rgn->cnt == 0) {
 		rgn->region[0].base = base;
 		rgn->region[0].size = size;
+		rgn->region[0].flags = flags;
 		rgn->cnt = 1;
 		return 0;
 	}
@@ -162,18 +169,27 @@ static long lmb_add_region(struct lmb_region *rgn, phys_addr_t base, phys_size_t
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
@@ -184,8 +200,10 @@ static long lmb_add_region(struct lmb_region *rgn, phys_addr_t base, phys_size_t
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
@@ -198,9 +216,11 @@ static long lmb_add_region(struct lmb_region *rgn, phys_addr_t base, phys_size_t
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
@@ -208,6 +228,7 @@ static long lmb_add_region(struct lmb_region *rgn, phys_addr_t base, phys_size_t
 	if (base < rgn->region[0].base) {
 		rgn->region[0].base = base;
 		rgn->region[0].size = size;
+		rgn->region[0].flags = flags;
 	}
 
 	rgn->cnt++;
@@ -215,6 +236,12 @@ static long lmb_add_region(struct lmb_region *rgn, phys_addr_t base, phys_size_t
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
@@ -269,14 +296,21 @@ long lmb_free(struct lmb *lmb, phys_addr_t base, phys_size_t size)
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
