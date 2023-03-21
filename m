Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D766A6C3219
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Mar 2023 13:58:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88793C6A5EF;
	Tue, 21 Mar 2023 12:58:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EEBDC65049
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Mar 2023 12:58:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32LA8hht012836; Tue, 21 Mar 2023 13:58:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=aBUTiA9WcTqgrlNqRJlVBzIcbre8LkWzGKIt88mC2Tw=;
 b=c1F1LHWYYxSe5MTFu7N6qfmJ3d+qHH01+uQ3/saYFDjpQEWTkQufzlu9muDOKX2BRNW9
 iViUcxTnofk/VxBf1+iaenQ4KOxU0uPVMP1T4CBQTUTQ+Y39a3UjTTbAFGH0nQmvKhJT
 6cbgAB8VsqeCTl3pSgtuajLIdJPaDVrCVsFGBmpufHvNrOC/i9qv0tUVeEEHqIaOu2Ey
 YLviFfar+M4Kb8ZN3hsD55SOoK06YmhcNz1IabZh2eAuuX5ZVUS42he3wA/QckC9QNiL
 yaSdrl0EcMw1zfw11fQQGpFb8ntQKc9xhJz9S9i5vfOidFEEDDvvrRferScBGbBPPHF+ HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pfajs955w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Mar 2023 13:58:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5C1EB10002A;
 Tue, 21 Mar 2023 13:58:13 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 55031208D6C;
 Tue, 21 Mar 2023 13:58:13 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 21 Mar
 2023 13:58:13 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 21 Mar 2023 13:58:08 +0100
Message-ID: <20230321135805.1.I2a3a1c4e853d66857091cbef8d3a2ec87d65daba@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_08,2023-03-21_01,2023-02-09_01
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Mark Millard <marklmi@yahoo.com>, Sjoerd Simons <sjoerd@collabora.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Michal Simek <michal.simek@amd.com>
Subject: [Uboot-stm32] [PATCH 1/2] lmb: Fix LMB_MEMORY_REGIONS flag usage
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
and the required initialization are not done:
lmb->memory.max = ?
lmb->reserved.max = ?

But this setting is not possible:
- CONFIG_LMB_USE_MAX_REGIONS not defined
- CONFIG_LMB_MEMORY_REGIONS not defined
because CONFIG_LMB_MEMORY_REGIONS and CONFIG_LMB_RESERVED_REGIONS are
defined as soon as the CONFIG_LMB_USE_MAX_REGIONS is not defined.

This patch removes this impossible case #elif and I add some
explanation in lmb.h to explain why in the struct lmb {} the lmb
property's should is defined if CONFIG_LMB_MEMORY_REGIONS is NOT defined.

Fixes: 5e2548c1d6e03 ("lmb: Fix LMB_MEMORY_REGIONS flag usage")
Reported-by: Mark Millard <marklmi@yahoo.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 include/lmb.h | 20 +++++++++++++++++++-
 lib/lmb.c     |  2 +-
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/include/lmb.h b/include/lmb.h
index 7298c2ccc403..f70463ac5440 100644
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
+ *         direclty in the array lmb_region.region[], with the same
+ *         configuration for memory reion and reseserved region.
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
