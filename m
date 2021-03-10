Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8339E333888
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Mar 2021 10:16:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E3D8C57B78;
	Wed, 10 Mar 2021 09:16:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27EECC57B7C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 09:16:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12A9CrJK020876; Wed, 10 Mar 2021 10:16:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=osNYV2UTVIeICUh16gvF6flijoFJfav+hr7g3JPUwr4=;
 b=VX8ZKhsBMOs1ZFEVKupi6BzKKvQJifeBGZYPP2XNaDAj8LjUApflKQ5UKr1zMef007dM
 LnCck5oyxT/rUsxgra23lMxbfQldPqkFRU6YtegiTW03eZW75GuGMxRsopkg/AW8WWx1
 /xCTzptzx/rMnv9UI38XK6cHVO6/hOYWmIElVrPAJxrE3DS6FbetTJBEL5tKrkOK3sQ6
 xO19vQW9gGrHxtKXeO1E0KR28tc3IaI6SZBlUxGx4dfcIE6jmqHiLthS7eMeGGApoZn7
 PWshOY+tQC/ILNChqTcbLrnpOEAg5av57ImedlmoZC9deCZ4P3QsgRrxpyKiVyNUy7m4 Sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 373yreqsqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Mar 2021 10:16:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C209A100038;
 Wed, 10 Mar 2021 10:16:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC2A2228DA0;
 Wed, 10 Mar 2021 10:16:44 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Mar 2021 10:16:44
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 10 Mar 2021 10:16:28 +0100
Message-ID: <20210310101622.v2.4.Icdf0b7e662fc65658e591ce0f692a5695f607256@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210310091632.17103-1-patrick.delaunay@foss.st.com>
References: <20210310091632.17103-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
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
Subject: [Uboot-stm32] [PATCH v2 4/8] lmb: move MAX_LMB_REGIONS value in
	Kconfig
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

Move MAX_LMB_REGIONS value in Kconfig, the max number of the regions
in lmb library.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- new in v2: introduced MAX_LMB_REGIONS

 include/lmb.h |  4 +---
 lib/Kconfig   | 10 +++++++++-
 lib/lmb.c     |  4 ++--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/include/lmb.h b/include/lmb.h
index f3397c7f73..d3adf8ef69 100644
--- a/include/lmb.h
+++ b/include/lmb.h
@@ -12,8 +12,6 @@
  * Copyright (C) 2001 Peter Bergner, IBM Corp.
  */
 
-#define MAX_LMB_REGIONS 8
-
 struct lmb_property {
 	phys_addr_t base;
 	phys_size_t size;
@@ -22,7 +20,7 @@ struct lmb_property {
 struct lmb_region {
 	unsigned long cnt;
 	unsigned long max;
-	struct lmb_property region[MAX_LMB_REGIONS+1];
+	struct lmb_property region[CONFIG_LMB_MAX_REGIONS + 1];
 };
 
 struct lmb {
diff --git a/lib/Kconfig b/lib/Kconfig
index 43bd7190b9..43798d7a91 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -438,7 +438,7 @@ config LZ4
 	  is included. The LZ4 algorithm can run in-place as long as the
 	  compressed image is loaded to the end of the output buffer, and
 	  trades lower compression ratios for much faster decompression.
-	  
+
 	  NOTE: This implements the release version of the LZ4 frame
 	  format as generated by default by the 'lz4' command line tool.
 	  This is not the same as the outdated, less efficient legacy
@@ -706,6 +706,14 @@ config LMB
 	help
 	  Support the library logical memory blocks.
 
+
+config LMB_MAX_REGIONS
+	int "Number of memory and reserved regions in lmb lib"
+	depends on LMB
+	default 8
+	help
+	  Define the number of supported regions, memory and reserved, in the
+	  library logical memory blocks.
 endmenu
 
 config PHANDLE_CHECK_SEQ
diff --git a/lib/lmb.c b/lib/lmb.c
index a926198d48..9fbc56619b 100644
--- a/lib/lmb.c
+++ b/lib/lmb.c
@@ -95,8 +95,8 @@ static void lmb_coalesce_regions(struct lmb_region *rgn, unsigned long r1,
 
 void lmb_init(struct lmb *lmb)
 {
-	lmb->memory.max = MAX_LMB_REGIONS;
-	lmb->reserved.max = MAX_LMB_REGIONS;
+	lmb->memory.max = CONFIG_LMB_MAX_REGIONS;
+	lmb->reserved.max = CONFIG_LMB_MAX_REGIONS;
 
 	lmb->memory.cnt = 0;
 	lmb->reserved.cnt = 0;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
