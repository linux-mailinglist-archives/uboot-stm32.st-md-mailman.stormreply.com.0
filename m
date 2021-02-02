Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC62C30BEEB
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 Feb 2021 13:59:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A62FBC57184;
	Tue,  2 Feb 2021 12:59:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47009C57184
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Feb 2021 12:59:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 112Cungq000727; Tue, 2 Feb 2021 13:59:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=+XTFKqKXUMaaz/VPG5JCMGp01yF0LYxc0cbgArhciYc=;
 b=SBcJF5Wr8n9WI5DFe8GETXzp6p5729y8wBjtba9RL1PEC7lKMTrq0m5O04oIYbVNZM17
 LwP+igNfH2btUOqXTlJ7s71jI/b+a/9eZMVu7Uv8ghPsQkHGvC2knU0d5sFJa1iK84QP
 n0ViG9JxsSAz8m3Jd5KQUDv23NUJE/D2LRHeGEQM8/OzaFfFf9qRJHxsPZpNoryXScIR
 zQ71PRRTXOx48pEBXtLKggUZNClwofK2i20B/oBGZubf2mnuW/lBTAM71pI85DDeKdB3
 5JaxLEr1Wa2JO51BaHqijrcogX97Wz3WlEkQ8Udr5jCPusqCzuiCsWASyjMOQ+b2L+/n lQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36e7x0sqxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 13:59:38 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 310ED100038;
 Tue,  2 Feb 2021 13:59:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 26AC1234483;
 Tue,  2 Feb 2021 13:59:38 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Feb 2021 13:59:37
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 2 Feb 2021 13:59:10 +0100
Message-ID: <20210202135729.3.Ib388bce4b48489235edd7596c8d0bfd139560f4f@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210202125913.13597-1-patrick.delaunay@foss.st.com>
References: <20210202125913.13597-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-02_06:2021-02-02,
 2021-02-02 signatures=0
Cc: Masahiro Yamada <masahiroy@kernel.org>, Tero Kristo <t-kristo@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Stefan Roese <sr@denx.de>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 3/5] lmb: Move lmb property arrays in struct
	lmb
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

Move lmb property arrays to struct lmb and manage the array size in
a the new element 'max' of struct lmb_region. This modification allows
to update its size independently in the next patch.

see Linux kernel commit bf23c51f1f49 ("memblock: Move memblock arrays
to static storage in memblock.c and make their size a variable")

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 include/lmb.h | 31 ++++++++++++++++++++++++++++++-
 lib/lmb.c     |  8 +++++++-
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/include/lmb.h b/include/lmb.h
index a3247544c1..df543028d5 100644
--- a/include/lmb.h
+++ b/include/lmb.h
@@ -14,19 +14,48 @@
 
 #define MAX_LMB_REGIONS 8
 
+/**
+ * struct lmb_property - Description of one region.
+ *
+ * @base: Base address of the region.
+ * @size: Size of the region
+ */
 struct lmb_property {
 	phys_addr_t base;
 	phys_size_t size;
 };
 
+/**
+ * struct lmb_region - Description of a set of region.
+ *
+ * @cnt: Number of regions.
+ * @max: Size of the region array, max value of cnt.
+ * @region: Address of the region properties array
+ */
 struct lmb_region {
 	unsigned long cnt;
-	struct lmb_property region[MAX_LMB_REGIONS+1];
+	unsigned long max;
+	struct lmb_property *region;
 };
 
+/**
+ * struct lmb - Logical memory block handle.
+ *
+ * Clients provide storage for Logical memory block (lmb) handles.
+ * The content of the structure is managed by the lmb library.
+ * A lmb struct is  initialized by lmb_init() functions.
+ * The lmb struct is passed to all other lmb APIs.
+ *
+ * @memory: Description of memory regions.
+ * @reserved: Description of reserved regions.
+ * @memory_regions: Array of the memory regions (statically allocated)
+ * @reserved_regions: Array of the reserved regions (statically allocated)
+ */
 struct lmb {
 	struct lmb_region memory;
 	struct lmb_region reserved;
+	struct lmb_property memory_regions[MAX_LMB_REGIONS + 1];
+	struct lmb_property reserved_regions[MAX_LMB_REGIONS + 1];
 };
 
 extern void lmb_init(struct lmb *lmb);
diff --git a/lib/lmb.c b/lib/lmb.c
index 5cf419f439..c97be0a064 100644
--- a/lib/lmb.c
+++ b/lib/lmb.c
@@ -95,7 +95,13 @@ static void lmb_coalesce_regions(struct lmb_region *rgn, unsigned long r1,
 
 void lmb_init(struct lmb *lmb)
 {
+	/* Hookup the initial arrays */
+	lmb->memory.region = lmb->memory_regions;
+	lmb->memory.max = ARRAY_SIZE(lmb->memory_regions) - 1;
 	lmb->memory.cnt = 0;
+
+	lmb->reserved.region = lmb->reserved_regions;
+	lmb->reserved.max = ARRAY_SIZE(lmb->reserved_regions) - 1;
 	lmb->reserved.cnt = 0;
 }
 
@@ -179,7 +185,7 @@ static long lmb_add_region(struct lmb_region *rgn, phys_addr_t base, phys_size_t
 
 	if (coalesced)
 		return coalesced;
-	if (rgn->cnt >= MAX_LMB_REGIONS)
+	if (rgn->cnt >= rgn->max)
 		return -1;
 
 	/* Couldn't coalesce the LMB, so add it to the sorted table. */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
