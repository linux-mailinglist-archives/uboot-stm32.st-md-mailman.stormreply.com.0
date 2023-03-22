Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D774F6C535E
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Mar 2023 19:13:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D98EC6A5E7;
	Wed, 22 Mar 2023 18:13:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64F3EC01E98
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Mar 2023 18:13:12 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32MGLRbC012820; Wed, 22 Mar 2023 19:12:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=bYy7qCRweXaVj+GqK5KyyhvBd1/52KzrW9vXm+jGO5A=;
 b=UQZl43S/LIYk25/a+fDTCcnq2DF40LdHm8jUbACRQSljS+4AfjZRxa//F1W8eCxjrtAn
 mfcqkB62tLAe0zE0wcwJKl3cu4YQr2YJtgnP/OAuSKDa+u28T5X/g7j4JpJ2caDsjCnK
 x8NlMGM/rJR1m00IWxj5Lqvq+haeOd959Fy5YWjlJH3xclJ86LDY8xdNHXviDcUTkEFr
 DlXTRq5VbmELjERmawlh87Ygga1Ob24S1sUQfw6xcOMmLSL6/xk5WTlkqcbDQpEfFZ+D
 aJ4PaNpFhieAc76O8B0b35vZkGNF7yNWw1Ox5kqHJYHy2OgMXCcryHrnXS4xhH3zM6Qd Sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pfajsk02q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 19:12:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 69D78100042;
 Wed, 22 Mar 2023 19:12:50 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 76F3621BF77;
 Wed, 22 Mar 2023 19:12:33 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Wed, 22 Mar
 2023 19:12:33 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 22 Mar 2023 19:12:25 +0100
Message-ID: <20230322191223.v2.1.I2a3a1c4e853d66857091cbef8d3a2ec87d65daba@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_15,2023-03-22_01,2023-02-09_01
Cc: Leo Yu-Chi Liang <ycliang@andestech.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 Kautuk Consul <kconsul@ventanamicro.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Mark Millard <marklmi@yahoo.com>, Brandon Maier <brandon.maier@collins.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Michal Simek <michal.simek@amd.com>, Sjoerd Simons <sjoerd@collabora.com>
Subject: [Uboot-stm32] [PATCH v2 1/2] lmb: Fix LMB_MEMORY_REGIONS flag usage
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

Remove test on CONFIG_LMB_MEMORY_REGIONS introduced by commit
7c1860fce4e3 ("lmb: Fix lmb property's defination under struct lmb").

This code in lmb_init() is strange, because if CONFIG_LMB_USE_MAX_REGIONS
and CONFIG_LMB_MEMORY_REGIONS are not defined, the implicit #else is empty
and the required initialization is not done:
lmb->memory.max = ?
lmb->reserved.max = ?

But this setting is not possible:
- CONFIG_LMB_USE_MAX_REGIONS not defined
- CONFIG_LMB_MEMORY_REGIONS not defined
because CONFIG_LMB_MEMORY_REGIONS and CONFIG_LMB_RESERVED_REGIONS are
defined as soon as the CONFIG_LMB_USE_MAX_REGIONS is not defined.

This patch removes this impossible case #elif and I add some
explanation in lmb.h to explain why in the struct lmb {} the lmb
property is defined if CONFIG_LMB_MEMORY_REGIONS is NOT defined.

This patch also removes CONFIG_LMB_XXX dependency on CONFIG_LMB as these
defines are used in API file lmb.h and not only in library file.

Fixes: 5e2548c1d6e03 ("lmb: Fix LMB_MEMORY_REGIONS flag usage")
Reported-by: Mark Millard <marklmi@yahoo.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- Remove CONFIG_LMB_XXX dependency on CONFIG_LMB as these defines are
  used in lmb.h file, include by default to export the LMB API
  and not only in LMB libary code. This modification is required to
  avoid issue in API definition when CONFIG_LMB is not set.
- Fix some typo in commit message and in comment

 include/lmb.h | 20 +++++++++++++++++++-
 lib/Kconfig   |  7 +++----
 lib/lmb.c     |  2 +-
 3 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/include/lmb.h b/include/lmb.h
index 7298c2ccc403..07bf22144eac 100644
--- a/include/lmb.h
+++ b/include/lmb.h
@@ -35,6 +35,24 @@ struct lmb_property {
 	enum lmb_flags flags;
 };
 
+/*
+ * For regions size management, see LMB configuration in KConfig
+ * all the #if test are done with CONFIG_LMB_USE_MAX_REGIONS (boolean)
+ *
+ * case 1. CONFIG_LMB_USE_MAX_REGIONS is defined (legacy mode)
+ *         => CONFIG_LMB_MAX_REGIONS is used to configure the region size,
+ *         directly in the array lmb_region.region[], with the same
+ *         configuration for memory and reserved regions.
+ *
+ * case 2. CONFIG_LMB_USE_MAX_REGIONS is not defined, the size of each
+ *         region is configurated *independently* with
+ *         => CONFIG_LMB_MEMORY_REGIONS: struct lmb.memory_regions
+ *         => CONFIG_LMB_RESERVED_REGIONS: struct lmb.reserved_regions
+ *         lmb_region.region is only a pointer to the correct buffer,
+ *         initialized in lmb_init(). This configuration is useful to manage
+ *         more reserved memory regions with CONFIG_LMB_RESERVED_REGIONS.
+ */
+
 /**
  * struct lmb_region - Description of a set of region.
  *
@@ -68,7 +86,7 @@ struct lmb_region {
 struct lmb {
 	struct lmb_region memory;
 	struct lmb_region reserved;
-#ifdef CONFIG_LMB_MEMORY_REGIONS
+#if !IS_ENABLED(CONFIG_LMB_USE_MAX_REGIONS)
 	struct lmb_property memory_regions[CONFIG_LMB_MEMORY_REGIONS];
 	struct lmb_property reserved_regions[CONFIG_LMB_RESERVED_REGIONS];
 #endif
diff --git a/lib/Kconfig b/lib/Kconfig
index 83e5edd73b0e..da6c7cd5f628 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -1027,7 +1027,6 @@ config LMB
 
 config LMB_USE_MAX_REGIONS
 	bool "Use a common number of memory and reserved regions in lmb lib"
-	depends on LMB
 	default y
 	help
 	  Define the number of supported memory regions in the library logical
@@ -1037,7 +1036,7 @@ config LMB_USE_MAX_REGIONS
 
 config LMB_MAX_REGIONS
 	int "Number of memory and reserved regions in lmb lib"
-	depends on LMB && LMB_USE_MAX_REGIONS
+	depends on LMB_USE_MAX_REGIONS
 	default 16
 	help
 	  Define the number of supported regions, memory and reserved, in the
@@ -1045,7 +1044,7 @@ config LMB_MAX_REGIONS
 
 config LMB_MEMORY_REGIONS
 	int "Number of memory regions in lmb lib"
-	depends on LMB && !LMB_USE_MAX_REGIONS
+	depends on !LMB_USE_MAX_REGIONS
 	default 8
 	help
 	  Define the number of supported memory regions in the library logical
@@ -1054,7 +1053,7 @@ config LMB_MEMORY_REGIONS
 
 config LMB_RESERVED_REGIONS
 	int "Number of reserved regions in lmb lib"
-	depends on LMB && !LMB_USE_MAX_REGIONS
+	depends on !LMB_USE_MAX_REGIONS
 	default 8
 	help
 	  Define the number of supported reserved regions in the library logical
diff --git a/lib/lmb.c b/lib/lmb.c
index 2444b2a62121..8fbe453dfa9d 100644
--- a/lib/lmb.c
+++ b/lib/lmb.c
@@ -110,7 +110,7 @@ void lmb_init(struct lmb *lmb)
 #if IS_ENABLED(CONFIG_LMB_USE_MAX_REGIONS)
 	lmb->memory.max = CONFIG_LMB_MAX_REGIONS;
 	lmb->reserved.max = CONFIG_LMB_MAX_REGIONS;
-#elif defined(CONFIG_LMB_MEMORY_REGIONS)
+#else
 	lmb->memory.max = CONFIG_LMB_MEMORY_REGIONS;
 	lmb->reserved.max = CONFIG_LMB_RESERVED_REGIONS;
 	lmb->memory.region = lmb->memory_regions;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
