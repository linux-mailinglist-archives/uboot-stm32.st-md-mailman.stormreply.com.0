Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C66BF3DB703
	for <lists+uboot-stm32@lfdr.de>; Fri, 30 Jul 2021 12:13:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90582C57182;
	Fri, 30 Jul 2021 10:13:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E830DC56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jul 2021 10:13:15 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16UA6aLZ032309; Fri, 30 Jul 2021 12:13:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=lM4obzjtzlnWqjBzkXmzGy4iSRaFJPseabcTFkJ78Ek=;
 b=Kaxld8Ox+DEIXcX/jqdeu8xkaGD/cU3hD+Yn9QbM3U8yv9QqxGkbwP414s4dEcRmKGDC
 XYtO5Fnd/fUadElapdxu5PhltBw3DTT/MmjhWdhCtHvOW0xgfFw0xPLm1MhzX6hqdBRE
 43e2VPm7yzaDkpirW8d7+RoE/DVR3IpbJGcWWjYb+kEqFiVf0ULrYBMDFdNj2/ToeEFr
 RepCiZveXu4O54Qxt02LjDrqwD2fVYf83LOIZM3pM7BrvOpWPYsuHQqpGC0eyccoXu3i
 0WZyPWCo7SQ+sDbCZf+MOLRCsKHNXWEIangquV+KgnCX7qF0BsrtVuFW2tgHwiVy8b/Y 9w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a4c0q194u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 12:13:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 34F7310002A;
 Fri, 30 Jul 2021 12:13:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2C16421FE91;
 Fri, 30 Jul 2021 12:13:14 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 30 Jul 2021 12:13:13
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 30 Jul 2021 12:13:11 +0200
Message-ID: <20210730121253.1.I548969a35a3522881113dc073f34b86bb15d29a6@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-30_05:2021-07-29,
 2021-07-30 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH] dm: migrate the dm_warn to use the log macro
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

Migrate the dm_warn function to log macro with
LOGC_DM category and LOGL_WARNING level.

This macro allows filtering with log command and allows
output on all log backend.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/core/util.c | 11 -----------
 include/dm/util.h   |  2 +-
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/core/util.c b/drivers/core/util.c
index 91e93b0cf1..5be4ee79de 100644
--- a/drivers/core/util.c
+++ b/drivers/core/util.c
@@ -11,17 +11,6 @@
 #include <linux/libfdt.h>
 #include <vsprintf.h>
 
-#if CONFIG_IS_ENABLED(DM_WARN)
-void dm_warn(const char *fmt, ...)
-{
-	va_list args;
-
-	va_start(args, fmt);
-	vprintf(fmt, args);
-	va_end(args);
-}
-#endif
-
 int list_count_items(struct list_head *head)
 {
 	struct list_head *node;
diff --git a/include/dm/util.h b/include/dm/util.h
index 138893c935..c634e470e7 100644
--- a/include/dm/util.h
+++ b/include/dm/util.h
@@ -7,7 +7,7 @@
 #define __DM_UTIL_H
 
 #if CONFIG_IS_ENABLED(DM_WARN)
-void dm_warn(const char *fmt, ...);
+#define dm_warn(fmt...) log(LOGC_DM, LOGL_WARNING, ##fmt)
 #else
 static inline void dm_warn(const char *fmt, ...)
 {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
