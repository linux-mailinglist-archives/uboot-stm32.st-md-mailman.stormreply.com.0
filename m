Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ABB30BEEC
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 Feb 2021 13:59:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0D39C57184;
	Tue,  2 Feb 2021 12:59:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56198C57181
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Feb 2021 12:59:53 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 112CuLbI022290; Tue, 2 Feb 2021 13:59:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=/kUQn7GVWpXh3gbeFTPBDKGCJnYbCZGAyLqZMYIQw1c=;
 b=lXivdupDyUyxmOPW8GFGXbndLQTqOFTjK2xZ7FX/tH9VHZzPBe7IxASo51PWQ9Sr1CIQ
 b/8hRQUmyvpYCUXBGdU8ZwjZvquwRWwf2kKgpOOOczqF86P24DpT2aLnlrZnhtqrNcJw
 w+/YZ5fznT63Zc+fgi7psYYPDyB5isb3WRcwbA8ZdhakYaAeYpAsNj7jEyoNefIoe742
 NcsE1yW+lIka6PUVRkczkhmmgU9Q90iafimX5n6e3qcgrivHonG/J6M6ezC5RXFNGCAY
 hdMLCbsCdjVtsxc0d6zizFs0I8bfKYLwx2clXB3C2sjYCu5sKqJJAbtw6tCzmvFNMaGZ 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36ey7gttkf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 13:59:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 298B3100034;
 Tue,  2 Feb 2021 13:59:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 19873234483;
 Tue,  2 Feb 2021 13:59:39 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Feb 2021 13:59:38
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 2 Feb 2021 13:59:11 +0100
Message-ID: <20210202135729.4.Icdf0b7e662fc65658e591ce0f692a5695f607256@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210202125913.13597-1-patrick.delaunay@foss.st.com>
References: <20210202125913.13597-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-02_06:2021-02-02,
 2021-02-02 signatures=0
Cc: Stefan Roese <sr@denx.de>, Reuben Dowle <reubendowle0@gmail.com>,
 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
 Masahiro Yamada <masahiroy@kernel.org>, Tero Kristo <t-kristo@ti.com>,
 Aswath Govindraju <a-govindraju@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Simon Glass <sjg@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Uboot-stm32] [PATCH 4/5] lmb: Add 2 config to define the max
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

Increase CONFIG_LMB_RESERVED_REGIONS is useful to avoid lmb errors in
bootm when the number of reserved regions (not adjacent) is reached:
+ 1 region for relocated U-Boot
+ 1 region for initrd
+ 1 region for relocated linux device tree
+ reserved memory regions present in Linux device tree.

The current limit of 8 regions is reached with only 5 reserved regions
in DT.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 include/lmb.h |  6 ++----
 lib/Kconfig   | 16 ++++++++++++++++
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/lmb.h b/include/lmb.h
index df543028d5..97be24ed66 100644
--- a/include/lmb.h
+++ b/include/lmb.h
@@ -12,8 +12,6 @@
  * Copyright (C) 2001 Peter Bergner, IBM Corp.
  */
 
-#define MAX_LMB_REGIONS 8
-
 /**
  * struct lmb_property - Description of one region.
  *
@@ -54,8 +52,8 @@ struct lmb_region {
 struct lmb {
 	struct lmb_region memory;
 	struct lmb_region reserved;
-	struct lmb_property memory_regions[MAX_LMB_REGIONS + 1];
-	struct lmb_property reserved_regions[MAX_LMB_REGIONS + 1];
+	struct lmb_property memory_regions[CONFIG_LMB_MEMORY_REGIONS + 1];
+	struct lmb_property reserved_regions[CONFIG_LMB_RESERVED_REGIONS + 1];
 };
 
 extern void lmb_init(struct lmb *lmb);
diff --git a/lib/Kconfig b/lib/Kconfig
index 43bd7190b9..4249399b6f 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -706,6 +706,22 @@ config LMB
 	help
 	  Support the library logical memory blocks.
 
+config LMB_MEMORY_REGIONS
+	int "Number of memory regions in lmb lib"
+	depends on LMB
+	default 8
+	help
+	  Define the number of supported memory regions in the library logical
+	  memory blocks.
+
+config LMB_RESERVED_REGIONS
+	int "Number of reserved regions in lmb lib"
+	depends on LMB
+	default 8
+	help
+	  Define the number of supported reserved regions in the library logical
+	  memory blocks.
+
 endmenu
 
 config PHANDLE_CHECK_SEQ
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
