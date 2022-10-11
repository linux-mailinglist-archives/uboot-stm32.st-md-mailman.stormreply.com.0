Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0C25FB4D3
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Oct 2022 16:44:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB3A0C640F2;
	Tue, 11 Oct 2022 14:44:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A96ACC63326
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Oct 2022 14:44:43 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29BCr2qk018181;
 Tue, 11 Oct 2022 16:44:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=1Q7EY3eZELWTTN1bqzwAOVb4AvjREmJlddI0yKKoCQs=;
 b=FAHFK1sWVlkAc4OsOISSqWFBtPMxTJ6ChcsxpKgVbEewvSQLcU3NGve1cZvkZDH0G5Ka
 sjf5+SopkbMnClhaXz0WL6IDl+NaBXiiVUw5ftcD3TFSwjBZgchp4+pMNhgX/bSi+Hs6
 QRYIQwg3M6HWVHu/a25LvtcFP9dBon2D1NGcW9cCkIgqzfZn+voSu7QNaqGlWV2jj6/p
 ceiE9xWypiH8BtUp+3xS1S8XMzmvLwebfrnawBuVZkSkfFOukAvTgK8R1WTJrY7zKBPW
 owb7geFbLNNnMVp7ieoEQuSwV6YbrP1dni5NCgF1x+UGQV3rAHw7FoYIm8gNkvlfda8l 9g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k31m9k0gb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Oct 2022 16:44:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 36D6210002A;
 Tue, 11 Oct 2022 16:44:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 201B722FA3D;
 Tue, 11 Oct 2022 16:44:35 +0200 (CEST)
Received: from localhost (10.75.127.49) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 11 Oct
 2022 16:44:32 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 11 Oct 2022 16:44:26 +0200
Message-ID: <20221011164402.1.I3c89f22e6e60ebb6bd63a7f99fd60f89009bf39b@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-11_08,2022-10-11_02,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Matteo Lisi <matteo.lisi@engicam.com>
Subject: [Uboot-stm32] [PATCH] stm32mp: fix compilation issue with DEBUG_UART
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

Fix the compilation issue when CONFIG_DEBUG_UART is activated

 drivers/serial/serial_stm32.o: in function `debug_uart_init':
 drivers/serial/serial_stm32.c:291: undefined reference to \
    `board_debug_uart_init'

The board_debug_uart_init is needed for SPL boot, called in
cpu.c::mach_cpu_init(); it is defined in board/st/stm32mp1/spl.c.

But with the removal #ifdefs patch, the function debug_uart_init() is
always compiled even if not present in the final U-Boot image.

This patch adds a file to provided this function when DEBUG_UART and SPL
are activated.

Fixes: c8b2eef52b6c ("stm32mp15: tidy up #ifdefs in cpu.c")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/Kconfig.15x |  2 +-
 board/engicam/stm32mp1/Makefile   |  2 ++
 board/engicam/stm32mp1/spl.c      | 25 -------------------------
 board/st/stm32mp1/Makefile        |  2 ++
 board/st/stm32mp1/debug_uart.c    | 29 +++++++++++++++++++++++++++++
 board/st/stm32mp1/spl.c           | 28 ----------------------------
 6 files changed, 34 insertions(+), 54 deletions(-)
 create mode 100644 board/st/stm32mp1/debug_uart.c

diff --git a/arch/arm/mach-stm32mp/Kconfig.15x b/arch/arm/mach-stm32mp/Kconfig.15x
index d516270292a..5bd9b53a5d8 100644
--- a/arch/arm/mach-stm32mp/Kconfig.15x
+++ b/arch/arm/mach-stm32mp/Kconfig.15x
@@ -117,7 +117,7 @@ endif
 if DEBUG_UART
 
 config DEBUG_UART_BOARD_INIT
-	default y
+	default y if SPL
 
 # debug on UART4 by default
 config DEBUG_UART_BASE
diff --git a/board/engicam/stm32mp1/Makefile b/board/engicam/stm32mp1/Makefile
index 65560df2900..155d33f9eec 100644
--- a/board/engicam/stm32mp1/Makefile
+++ b/board/engicam/stm32mp1/Makefile
@@ -8,3 +8,5 @@ obj-y += spl.o
 else
 obj-y += stm32mp1.o
 endif
+
+obj-$(CONFIG_DEBUG_UART_BOARD_INIT) += ../../st/stm32mp1/debug_uart.o
diff --git a/board/engicam/stm32mp1/spl.c b/board/engicam/stm32mp1/spl.c
index 3aa738b3faa..2b7779cc01d 100644
--- a/board/engicam/stm32mp1/spl.c
+++ b/board/engicam/stm32mp1/spl.c
@@ -6,7 +6,6 @@
  */
 
 #include <common.h>
-#include <asm/io.h>
 
 /* board early initialisation in board_f: need to use global variable */
 static u32 opp_voltage_mv __section(".data");
@@ -22,27 +21,3 @@ int board_early_init_f(void)
 	return 0;
 }
 
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
-	/* GPIO configuration for ST boards: Uart4 TX = G11 */
-	writel(0xffbfffff, GPIOG_BASE + 0x00);
-	writel(0x00006000, GPIOG_BASE + 0x24);
-#else
-
-#error("CONFIG_DEBUG_UART_BASE: not supported value")
-
-#endif
-}
-#endif
diff --git a/board/st/stm32mp1/Makefile b/board/st/stm32mp1/Makefile
index 65560df2900..f2d720b67b3 100644
--- a/board/st/stm32mp1/Makefile
+++ b/board/st/stm32mp1/Makefile
@@ -8,3 +8,5 @@ obj-y += spl.o
 else
 obj-y += stm32mp1.o
 endif
+
+obj-$(CONFIG_DEBUG_UART_BOARD_INIT) += debug_uart.o
diff --git a/board/st/stm32mp1/debug_uart.c b/board/st/stm32mp1/debug_uart.c
new file mode 100644
index 00000000000..24e3f9f2201
--- /dev/null
+++ b/board/st/stm32mp1/debug_uart.c
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
+ */
+
+#include <config.h>
+#include <debug_uart.h>
+#include <asm/io.h>
+#include <asm/arch/stm32.h>
+#include <linux/bitops.h>
+
+#define RCC_MP_APB1ENSETR (STM32_RCC_BASE + 0x0A00)
+#define RCC_MP_AHB4ENSETR (STM32_RCC_BASE + 0x0A28)
+
+#define GPIOG_BASE 0x50008000
+
+void board_debug_uart_init(void)
+{
+	if (CONFIG_DEBUG_UART_BASE == STM32_UART4_BASE) {
+		/* UART4 clock enable */
+		setbits_le32(RCC_MP_APB1ENSETR, BIT(16));
+
+		/* GPIOG clock enable */
+		writel(BIT(6), RCC_MP_AHB4ENSETR);
+		/* GPIO configuration for ST boards: Uart4 TX = G11 */
+		writel(0xffbfffff, GPIOG_BASE + 0x00);
+		writel(0x00006000, GPIOG_BASE + 0x24);
+	}
+}
diff --git a/board/st/stm32mp1/spl.c b/board/st/stm32mp1/spl.c
index 8e4549a1b35..747ec7e445a 100644
--- a/board/st/stm32mp1/spl.c
+++ b/board/st/stm32mp1/spl.c
@@ -5,11 +5,7 @@
 
 #include <config.h>
 #include <common.h>
-#include <init.h>
-#include <asm/io.h>
 #include <asm/arch/sys_proto.h>
-#include <linux/bitops.h>
-#include <linux/delay.h>
 #include "../common/stpmic1.h"
 
 /* board early initialisation in board_f: need to use global variable */
@@ -29,27 +25,3 @@ int board_early_init_f(void)
 	return 0;
 }
 
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
-	/* GPIO configuration for ST boards: Uart4 TX = G11 */
-	writel(0xffbfffff, GPIOG_BASE + 0x00);
-	writel(0x00006000, GPIOG_BASE + 0x24);
-#else
-
-#error("CONFIG_DEBUG_UART_BASE: not supported value")
-
-#endif
-}
-#endif
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
