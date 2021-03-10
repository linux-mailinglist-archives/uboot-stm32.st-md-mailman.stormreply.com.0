Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFFD333889
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Mar 2021 10:17:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59211C57B77;
	Wed, 10 Mar 2021 09:17:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A813C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 09:17:00 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12A9CCqn006016; Wed, 10 Mar 2021 10:16:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=oDm1MMcYp+xsV2dn/RdpCIFm+PLkYx/bSk99pbGSKDg=;
 b=J1D82vvnHElgAekKXz+M4/8xB3DVv7f0nRWnIVYPf3DzzaK9Mojw0TIw+ilEMEb3r5G/
 7kpAcVFpxzbQJCZac7E6F1YWLYoZ4oPbB8B07NWyF1y1zIQA0Fvb39dwz4JstIzpAqmQ
 zx911wYMsphpIG0/GGJ5uC+APbQniZ1GGsbDM4BF9zDfVtTcs4eiNrq1ZnHBepmuxa5M
 bbskufcUMguEyvuXzx4KyfgjIvh/mAbPHT+5DRaUgOB+0DqFk5b7L7cuwrCL7OGFlPaG
 lUQVsE7MS63hjfhsQq4PZtaB0I+E89V1VvgUk3af2VGdDM4zAlhMFKCdZLnMhXKqtQNL 1w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3741y6xfpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Mar 2021 10:16:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 155CC10002A;
 Wed, 10 Mar 2021 10:16:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 061D2228D95;
 Wed, 10 Mar 2021 10:16:50 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Mar 2021 10:16:49
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 10 Mar 2021 10:16:31 +0100
Message-ID: <20210310101622.v2.7.Icdf0b7e662fc65658e591ce0f692a5695f607256@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210310091632.17103-1-patrick.delaunay@foss.st.com>
References: <20210310091632.17103-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-10_07:2021-03-09,
 2021-03-10 signatures=0
Cc: Stefan Roese <sr@denx.de>, Reuben Dowle <reubendowle0@gmail.com>,
 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
 Masahiro Yamada <masahiroy@kernel.org>, Tero Kristo <t-kristo@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Simon Glass <sjg@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Uboot-stm32] [PATCH v2 7/8] lmb: Add 2 config to define the max
	number of regions
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

Add 2 configs CONFIG_LMB_MEMORY_REGIONS and CONFIG_LMB_RESERVED_REGIONS
to change independently the max number of the regions in lmb
library.

When CONFIG_LMB_USE_MAX_REGIONS=y, move the lmb property arrays to
struct lmb and manage the array size with the element 'max' of struct
lmb_region; their are still allocated in stack.

When CONFIG_LMB_USE_MAX_REGIONS=n, keep the current location in
struct lmb_region to allow compiler optimization.

Increase CONFIG_LMB_RESERVED_REGIONS is useful to avoid lmb errors in
bootm when the number of reserved regions (not adjacent) is reached:
+ 1 region for relocated U-Boot
+ 1 region for initrd
+ 1 region for relocated linux device tree
+ reserved memory regions present in Linux device tree.

The current limit of 8 regions is reached with only 5 reserved regions
in DT.

see Linux kernel commit bf23c51f1f49 ("memblock: Move memblock arrays
to static storage in memblock.c and make their size a variable")

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- rework v1 [4/5] to keep current optimization by default
  when CONFIG_LMB_USE_MAX_REGIONS=n

 include/lmb.h | 34 ++++++++++++++++++++++++++++++++++
 lib/Kconfig   | 29 ++++++++++++++++++++++++++++-
 lib/lmb.c     |  8 +++++++-
 3 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/include/lmb.h b/include/lmb.h
index 898ce15d07..541e17093c 100644
--- a/include/lmb.h
+++ b/include/lmb.h
@@ -12,20 +12,54 @@
  * Copyright (C) 2001 Peter Bergner, IBM Corp.
  */
 
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
+ * @region: Array of the region properties
+ */
 struct lmb_region {
 	unsigned long cnt;
 	unsigned long max;
+#if IS_ENABLED(CONFIG_LMB_USE_MAX_REGIONS)
 	struct lmb_property region[CONFIG_LMB_MAX_REGIONS];
+#else
+	struct lmb_property *region;
+#endif
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
+#if !IS_ENABLED(CONFIG_LMB_USE_MAX_REGIONS)
+	struct lmb_property memory_regions[CONFIG_LMB_MEMORY_REGIONS];
+	struct lmb_property reserved_regions[CONFIG_LMB_RESERVED_REGIONS];
+#endif
 };
 
 extern void lmb_init(struct lmb *lmb);
diff --git a/lib/Kconfig b/lib/Kconfig
index 43798d7a91..946b29ae5a 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -706,14 +706,41 @@ config LMB
 	help
 	  Support the library logical memory blocks.
 
+config LMB_USE_MAX_REGIONS
+	bool "Use a commun number of memory and reserved regions in lmb lib"
+	depends on LMB
+	default y
+	help
+	  Define the number of supported memory regions in the library logical
+	  memory blocks.
+	  This feature allow to reduce the lmb library size by using compiler
+	  optimization when LMB_MEMORY_REGIONS == LMB_RESERVED_REGIONS.
 
 config LMB_MAX_REGIONS
 	int "Number of memory and reserved regions in lmb lib"
-	depends on LMB
+	depends on LMB && LMB_USE_MAX_REGIONS
 	default 8
 	help
 	  Define the number of supported regions, memory and reserved, in the
 	  library logical memory blocks.
+
+config LMB_MEMORY_REGIONS
+	int "Number of memory regions in lmb lib"
+	depends on LMB && !LMB_USE_MAX_REGIONS
+	default 8
+	help
+	  Define the number of supported memory regions in the library logical
+	  memory blocks.
+	  The minimal value is CONFIG_NR_DRAM_BANKS.
+
+config LMB_RESERVED_REGIONS
+	int "Number of reserved regions in lmb lib"
+	depends on LMB && !LMB_USE_MAX_REGIONS
+	default 8
+	help
+	  Define the number of supported reserved regions in the library logical
+	  memory blocks.
+
 endmenu
 
 config PHANDLE_CHECK_SEQ
diff --git a/lib/lmb.c b/lib/lmb.c
index 9fbc56619b..c08c4d942b 100644
--- a/lib/lmb.c
+++ b/lib/lmb.c
@@ -95,9 +95,15 @@ static void lmb_coalesce_regions(struct lmb_region *rgn, unsigned long r1,
 
 void lmb_init(struct lmb *lmb)
 {
+#if IS_ENABLED(CONFIG_LMB_USE_MAX_REGIONS)
 	lmb->memory.max = CONFIG_LMB_MAX_REGIONS;
 	lmb->reserved.max = CONFIG_LMB_MAX_REGIONS;
-
+#else
+	lmb->memory.max = CONFIG_LMB_MEMORY_REGIONS;
+	lmb->reserved.max = CONFIG_LMB_RESERVED_REGIONS;
+	lmb->memory.region = lmb->memory_regions;
+	lmb->reserved.region = lmb->reserved_regions;
+#endif
 	lmb->memory.cnt = 0;
 	lmb->reserved.cnt = 0;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
