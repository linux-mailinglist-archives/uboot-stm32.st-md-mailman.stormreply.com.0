Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CE4284FFA
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Oct 2020 18:36:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60B61C32EA8;
	Tue,  6 Oct 2020 16:36:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18020C32EA5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Oct 2020 16:36:44 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 096GXJUM029151; Tue, 6 Oct 2020 18:36:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=IomG9mIdQNelWB+qWtvZo+AYhyQAvMS8sur1UKmmlWo=;
 b=N/JPIhiX3Mqm5teosdiiTIRtsvAtBsjIyydp6rP+0E4JTltcS8fzKMNJS01oM52tOgAi
 5WCta9wXkdqVlIaZk7YywSDfS9+RB281QpG1C6OSYQbqzDAjTMveOszKgqhJFYtGvZRB
 HXAknTCAMX6hu4NzqTTp/L9mu+Q627XvfAnYbhwPTikr9550TmHFNIsJDfMUr958eToG
 3v+FebFW5eBro/LooTOPpPsuVdEl9unfaGxRlSvVME7ZvEeLEySI4qgnyzHQKGm8u58b
 ydMspUlRI3NABzzpeH3IdXjBRRDckzMCMeVWeKYIEsKp12RkV6WD6opVb0LRNJCkHD8k Xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3402tj7y89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Oct 2020 18:36:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5976910002A;
 Tue,  6 Oct 2020 18:36:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 472C02C38BB;
 Tue,  6 Oct 2020 18:36:35 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 6 Oct 2020 18:36:34
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 6 Oct 2020 18:35:56 +0200
Message-ID: <20201006183548.1.Iac36d9d9036edd54d2574d712ca21283bf7c73d0@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201006163602.21687-1-patrick.delaunay@st.com>
References: <20201006163602.21687-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-06_09:2020-10-06,
 2020-10-06 signatures=0
Cc: Marek Vasut <marex@denx.de>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@st.com>, Tero Kristo <t-kristo@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 marek.bykowski@gmail.com, Stefan Roese <sr@denx.de>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: [Uboot-stm32] [PATCH 1/7] lmb: Add support of flags for no-map
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

Add "flags" in lmp_property to save the "no-map" property of
reserved region and a new function lmb_reserve_flags() to check
this flag.

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
index d126f8dc04..44ab9cede2 100644
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
@@ -141,7 +146,8 @@ void lmb_init_and_reserve_range(struct lmb *lmb, phys_addr_t base,
 }
 
 /* This routine called with relocation disabled. */
-static long lmb_add_region(struct lmb_region *rgn, phys_addr_t base, phys_size_t size)
+static long lmb_add_region_flags(struct lmb_region *rgn, phys_addr_t base,
+				 phys_size_t size, enum lmb_flags flags)
 {
 	unsigned long coalesced = 0;
 	long adjacent, i;
@@ -149,6 +155,7 @@ static long lmb_add_region(struct lmb_region *rgn, phys_addr_t base, phys_size_t
 	if (rgn->cnt == 0) {
 		rgn->region[0].base = base;
 		rgn->region[0].size = size;
+		rgn->region[0].flags = flags;
 		rgn->cnt = 1;
 		return 0;
 	}
@@ -157,18 +164,27 @@ static long lmb_add_region(struct lmb_region *rgn, phys_addr_t base, phys_size_t
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
@@ -179,8 +195,10 @@ static long lmb_add_region(struct lmb_region *rgn, phys_addr_t base, phys_size_t
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
@@ -193,9 +211,11 @@ static long lmb_add_region(struct lmb_region *rgn, phys_addr_t base, phys_size_t
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
@@ -203,6 +223,7 @@ static long lmb_add_region(struct lmb_region *rgn, phys_addr_t base, phys_size_t
 	if (base < rgn->region[0].base) {
 		rgn->region[0].base = base;
 		rgn->region[0].size = size;
+		rgn->region[0].flags = flags;
 	}
 
 	rgn->cnt++;
@@ -210,6 +231,12 @@ static long lmb_add_region(struct lmb_region *rgn, phys_addr_t base, phys_size_t
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
@@ -264,14 +291,21 @@ long lmb_free(struct lmb *lmb, phys_addr_t base, phys_size_t size)
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
