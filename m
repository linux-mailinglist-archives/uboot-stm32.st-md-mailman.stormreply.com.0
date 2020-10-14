Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E8C28DCA9
	for <lists+uboot-stm32@lfdr.de>; Wed, 14 Oct 2020 11:17:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82DECC424B9;
	Wed, 14 Oct 2020 09:17:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D28B0C424AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 09:17:24 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09E9DIWQ020404; Wed, 14 Oct 2020 11:17:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=EOoZ7cIEHrCBE5DFc2CXo8gObX4lrfnaAkrwFZkZWfg=;
 b=jjDOkuWAnzTF+T4IX8SPKg1xme0ewnvDGlCyWkU+XA1oSVRxNhG4nmFQymKkcRHfsuBU
 uGg/IHLv1F5R9TlmDGYMjjTW2leUAG37vpDA1/3lqGIElyJdcMEw3Ku2tMmZjQI81nNN
 KBUAxtLydFfgTlcQq60aahPIKAaOmEaue7IR260oGD36dsRJHKt/8ZD/skknW7pf3wiR
 waxzVhSLRc4Ur5+zwNGDqHpFAYfN9Q0Hz55StGy+TL5II9OL+gWvUnbdAka5PVRvR5ON
 lOwzLXztX7PjYBvOZtBhW6ZxZ1tKNn9s/peIUHSUwiQKbY+4AIHLQF3V0U/IVIVCH7XA vA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3435874hy1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 11:17:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B15C6100034;
 Wed, 14 Oct 2020 11:17:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A9F752A5586;
 Wed, 14 Oct 2020 11:17:21 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct 2020 11:17:21
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 14 Oct 2020 11:16:45 +0200
Message-ID: <20201014091646.4233-33-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014091646.4233-1-patrick.delaunay@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_06:2020-10-14,
 2020-10-14 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 32/33] board: st: common: migrate trace to dev
	and log macro
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

Change pr_* to dev_ or log_ macro and define LOG_CATEGORY.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/common/stm32mp_dfu.c      | 3 ++-
 board/st/common/stm32mp_mtdparts.c | 5 +++--
 board/st/common/stpmic1.c          | 5 ++++-
 board/st/common/stusb160x.c        | 2 ++
 4 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/board/st/common/stm32mp_dfu.c b/board/st/common/stm32mp_dfu.c
index aab7d741ac..515fc952fd 100644
--- a/board/st/common/stm32mp_dfu.c
+++ b/board/st/common/stm32mp_dfu.c
@@ -8,6 +8,7 @@
 #include <dm.h>
 #include <dfu.h>
 #include <env.h>
+#include <log.h>
 #include <memalign.h>
 #include <misc.h>
 #include <mtd.h>
@@ -199,7 +200,7 @@ static int dfu_pmic_read(u64 offset, u8 *buffer, long *size)
 		ret = 0;
 	}
 #else
-	pr_err("PMIC update not supported");
+	log_err("PMIC update not supported");
 	ret = -EOPNOTSUPP;
 #endif
 
diff --git a/board/st/common/stm32mp_mtdparts.c b/board/st/common/stm32mp_mtdparts.c
index 9f5897f8c8..71a0b449ad 100644
--- a/board/st/common/stm32mp_mtdparts.c
+++ b/board/st/common/stm32mp_mtdparts.c
@@ -8,6 +8,7 @@
 #include <dm.h>
 #include <env.h>
 #include <env_internal.h>
+#include <log.h>
 #include <mtd.h>
 #include <mtd_node.h>
 #include <tee.h>
@@ -117,7 +118,7 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 	for (uclass_first_device(UCLASS_MTD, &dev);
 	     dev;
 	     uclass_next_device(&dev)) {
-		pr_debug("mtd device = %s\n", dev->name);
+		log_debug("mtd device = %s\n", dev->name);
 	}
 
 	if (nor || nand) {
@@ -163,5 +164,5 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 	mtd_initialized = true;
 	*mtdids = ids;
 	*mtdparts = parts;
-	debug("%s:mtdids=%s & mtdparts=%s\n", __func__, ids, parts);
+	log_debug("mtdids=%s & mtdparts=%s\n", ids, parts);
 }
diff --git a/board/st/common/stpmic1.c b/board/st/common/stpmic1.c
index 3aa379e8a5..272dc4edac 100644
--- a/board/st/common/stpmic1.c
+++ b/board/st/common/stpmic1.c
@@ -3,8 +3,11 @@
  * Copyright (C) 2020, STMicroelectronics - All Rights Reserved
  */
 
+#define LOG_CATEGORY LOGC_BOARD
+
 #include <common.h>
 #include <dm.h>
+#include <log.h>
 #include <asm/io.h>
 #include <asm/arch/ddr.h>
 #include <linux/bitops.h>
@@ -202,7 +205,7 @@ void stpmic1_init(u32 voltage_mv)
 
 	/* Check if debug is enabled to program PMIC according to the bit */
 	if (readl(TAMP_BOOT_CONTEXT) & TAMP_BOOT_DEBUG_ON) {
-		printf("Keep debug unit ON\n");
+		log_info("Keep debug unit ON\n");
 
 		pmic_clrsetbits(dev, STPMIC1_BUCKS_MRST_CR,
 				STPMIC1_MRST_BUCK_DEBUG,
diff --git a/board/st/common/stusb160x.c b/board/st/common/stusb160x.c
index f1197f9faa..0ee4212131 100644
--- a/board/st/common/stusb160x.c
+++ b/board/st/common/stusb160x.c
@@ -6,6 +6,8 @@
  * Copyright (C) 2020, STMicroelectronics - All Rights Reserved
  */
 
+#define LOG_CATEGORY UCLASS_I2C_GENERIC
+
 #include <common.h>
 #include <dm.h>
 #include <i2c.h>
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
