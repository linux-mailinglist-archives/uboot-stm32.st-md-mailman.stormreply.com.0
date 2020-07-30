Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ABD23314F
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jul 2020 13:57:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD706C36B33
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jul 2020 11:57:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3F66C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jul 2020 11:57:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06UBqOdw013197; Thu, 30 Jul 2020 13:57:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=qkofBpnA1Qz8vEl287O7WfNvD8aZRA1RZYv95OiS1PM=;
 b=q5w6JUsM7BRgUEHYbT+pniV903a06HpLdtvUFPjak4u2VwRRjc4JmRRtpn7vOKRE6372
 htwiwVcftd6KbOUHH9JnIQngmzIBd5YWHIenZLcEoGyzctvAuX57ZbKwoQVspWdDaZ64
 NBPzq/N7KYvp0rmYujrpouwSI6jNVWgixKLcLYXZJtCaCRo5kvTX7suWTvL+vh7KGafU
 5cQzVlDJFM1MJlNwMgq0LMvzMKQEBPS34wU62FrHVY7KPNGCGwOXEhxY7iJ7yLa0lUDM
 qYRZKyQOeSjSjW0oJCE3kmkjSI7FqGns1ORk5/11tdbBxvPxFOEL27Pmx0yAEdRrtQ7O Dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gbmggvbd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 13:57:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B39E010002A;
 Thu, 30 Jul 2020 13:57:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 94CF82AF822;
 Thu, 30 Jul 2020 13:57:37 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 30 Jul 2020 13:57:37 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 30 Jul 2020 13:57:34 +0200
Message-ID: <20200730115735.2063-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-30_09:2020-07-30,
 2020-07-30 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] board: stm32mp1: remove board.c
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

Remove the file board/st/stm32mp1/board.c which is not more
compiled since commit 156732cc8939 ("board: stm32mp1: move the
function board_debug_uart_init in spl.c")

Fixes: 156732cc8939 ("board: stm32mp1: move the function board_debug_uart_init in spl.c")
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---
Issue when initial patch [1] was applied:

diff --git a/board/st/stm32mp1/board.c b/board/st/stm32mp1/board.c
deleted file mode 100644

[1] http://patchwork.ozlabs.org/project/uboot/patch/20200525101949.15944-10-patrick.delaunay@st.com/


 board/st/stm32mp1/board.c | 36 ------------------------------------
 1 file changed, 36 deletions(-)
 delete mode 100644 board/st/stm32mp1/board.c

diff --git a/board/st/stm32mp1/board.c b/board/st/stm32mp1/board.c
deleted file mode 100644
index 00c61c2886..0000000000
--- a/board/st/stm32mp1/board.c
+++ /dev/null
@@ -1,36 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
-/*
- * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
- */
-
-#include <common.h>
-#include <asm/io.h>
-#include <linux/bitops.h>
-#include <linux/delay.h>
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
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
