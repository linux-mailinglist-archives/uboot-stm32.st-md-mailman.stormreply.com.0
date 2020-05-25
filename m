Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD4F1E0B9B
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 May 2020 12:20:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14DFCC36B29
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 May 2020 10:20:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4C3BC36B28
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 10:20:03 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04PAHpx9026145; Mon, 25 May 2020 12:20:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=vOyZkdwnv7y8wapyVrurK4xgk20STdf1WucrarheYUo=;
 b=Qyc1pWBw7xJx3h9w9K2gsUcqNf9uRjpfVCZ+tAD0mGqq8u6qkHjqHjATRBlndqURyjR9
 Rcp88cCS+UoaFE/YVbjfB4OCvwSbUyzrl3+Skb9cTm15+xbZxFcep67BTZd6IETw2DiR
 r9xq0z2CdF6ovq71JpQIuAtfNOv7pNnLTXD8cOq/iFvfJaee/cR55QHsAvVM7E5WUAn/
 5hp2KH+9bi8gZpQVMjqK+IitIV73GlEsQlKIm49ZJn5aDAPU7Lw6Io3/bdoqo6T4buCj
 FWA3+CMNSHX98YFhdCt2HSinnFlzTnSaBlFCoAWJbgZGb7HjgvzdvIJR+7MkREzYfjiq mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 316sa1stf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 May 2020 12:20:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 75050100038;
 Mon, 25 May 2020 12:20:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 699A620B84D;
 Mon, 25 May 2020 12:20:01 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 25 May 2020 12:20:01 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 25 May 2020 12:19:49 +0200
Message-ID: <20200525101949.15944-10-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200525101949.15944-1-patrick.delaunay@st.com>
References: <20200525101949.15944-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-25_04:2020-05-25,
 2020-05-25 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 9/9] board: stm32mp1: move the function
	board_debug_uart_init in spl.c
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

Move the debug function board_debug_uart_init in spl.c
as the debug_uart_init() function is called in arch_cpu_init()
only for SPL and remove the board.c file.

For TFABOOT, the UART TX pin configuration is done in TF-A.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- NEW: merge spl.c and board.c to avoid a file with only one function

 board/st/stm32mp1/Makefile |  2 --
 board/st/stm32mp1/board.c  | 34 ----------------------------------
 board/st/stm32mp1/spl.c    | 26 ++++++++++++++++++++++++++
 3 files changed, 26 insertions(+), 36 deletions(-)
 delete mode 100644 board/st/stm32mp1/board.c

diff --git a/board/st/stm32mp1/Makefile b/board/st/stm32mp1/Makefile
index 8188075b1a..65560df290 100644
--- a/board/st/stm32mp1/Makefile
+++ b/board/st/stm32mp1/Makefile
@@ -8,5 +8,3 @@ obj-y += spl.o
 else
 obj-y += stm32mp1.o
 endif
-
-obj-y += board.o
diff --git a/board/st/stm32mp1/board.c b/board/st/stm32mp1/board.c
deleted file mode 100644
index 1887941e57..0000000000
--- a/board/st/stm32mp1/board.c
+++ /dev/null
@@ -1,34 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
-/*
- * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
- */
-
-#include <common.h>
-#include <asm/io.h>
-
-#ifdef CONFIG_DEBUG_UART_BOARD_INIT
-void board_debug_uart_init(void)
-{
-#if (CONFIG_DEBUG_UART_BASE == STM32_UART4_BASE)
-
-#define RCC_MP_APB1ENSETR (STM32_RCC_BASE + 0x0A00)
-#define RCC_MP_AHB4ENSETR (STM32_RCC_BASE + 0x0A28)
-
-	/* UART4 clock enable */
-	setbits_le32(RCC_MP_APB1ENSETR, BIT(16));
-
-#define GPIOG_BASE 0x50008000
-	/* GPIOG clock enable */
-	writel(BIT(6), RCC_MP_AHB4ENSETR);
-	/* GPIO configuration for EVAL board
-	 * => Uart4 TX = G11
-	 */
-	writel(0xffbfffff, GPIOG_BASE + 0x00);
-	writel(0x00006000, GPIOG_BASE + 0x24);
-#else
-
-#error("CONFIG_DEBUG_UART_BASE: not supported value")
-
-#endif
-}
-#endif
diff --git a/board/st/stm32mp1/spl.c b/board/st/stm32mp1/spl.c
index 96ab671169..977703f58a 100644
--- a/board/st/stm32mp1/spl.c
+++ b/board/st/stm32mp1/spl.c
@@ -5,6 +5,7 @@
 
 #include <config.h>
 #include <common.h>
+#include <asm/io.h>
 #include "../common/stpmic1.h"
 
 /* board early initialisation in board_f: need to use global variable */
@@ -23,3 +24,28 @@ int board_early_init_f(void)
 
 	return 0;
 }
+
+#ifdef CONFIG_DEBUG_UART_BOARD_INIT
+void board_debug_uart_init(void)
+{
+#if (CONFIG_DEBUG_UART_BASE == STM32_UART4_BASE)
+
+#define RCC_MP_APB1ENSETR (STM32_RCC_BASE + 0x0A00)
+#define RCC_MP_AHB4ENSETR (STM32_RCC_BASE + 0x0A28)
+
+	/* UART4 clock enable */
+	setbits_le32(RCC_MP_APB1ENSETR, BIT(16));
+
+#define GPIOG_BASE 0x50008000
+	/* GPIOG clock enable */
+	writel(BIT(6), RCC_MP_AHB4ENSETR);
+	/* GPIO configuration for ST boards: Uart4 TX = G11 */
+	writel(0xffbfffff, GPIOG_BASE + 0x00);
+	writel(0x00006000, GPIOG_BASE + 0x24);
+#else
+
+#error("CONFIG_DEBUG_UART_BASE: not supported value")
+
+#endif
+}
+#endif
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
