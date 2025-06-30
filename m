Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A07CAED1E4
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Jun 2025 02:11:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02403C3F92E;
	Mon, 30 Jun 2025 00:11:17 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 643ABC3F92E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 00:11:15 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bVmm26d5Mz9sp3;
 Mon, 30 Jun 2025 02:11:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1751242275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/32zFS5KP7KhnsjXM+zBQ3K+GNPkuC6zOpPSsUbxL0=;
 b=Ad8bfH1YvountpzhSkBQ76nBmrv9xoqf1CrO/Q18Wq6RtKxGf2wkTEla5snkZvME8CmVja
 Rjtgcqytmd5FEDuRsxohB+axIO6CRSLOV8LLXR9TDeL54ag9G40ideD6wCK267E99aHjjH
 K3hv8Y0L9Ms450Q6c5xz6zzw5DsKUFVCaItLoUX4v+V4TzNanfihK09BMKo7Rf3s1Qj80q
 E3SaY11YAh7TgJxMYffaf6EeCz2Hxi9EHOZzhxRxjqU74W4Bg7+gWNc4h/l88/w098b6Ti
 IZzWOad1EgMmNorPLxwr0YijxelnaD0L2p56X8/LBWvJssNOGgiOWLgi9h+snQ==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1751242273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/32zFS5KP7KhnsjXM+zBQ3K+GNPkuC6zOpPSsUbxL0=;
 b=ga6pcjL26yOx8FOM5d0VWZEzw0qWs8MOsHvzYkcRg8+7OFRg/5FiVXGSOtCvpUyDiqBznf
 p43m5eAKmpMk7baItCSWfEcE4GfQNOypEeEWHHNdtaP/dw5FOVpN0Jzixhag/fKJRsbFv4
 XkfuFbQ8COx3A8+kgXzo50E0YyPFa0r4evPxYfgJII05bBm1aCwwBSaB42d9OEZTsmPugi
 fngPLXiDygr8vovLH0+t9fHnpRp8phZ5mnGsd1l2ajb74J7RAiA8pub2X1JPDa1XMPhNjp
 Ql9FN563uuqUuEOOqW66Y0/7nEP0vWoV+oiz3kL8kiH2QGfPTU9vAK8Ue+Wjdg==
To: u-boot@lists.denx.de
Date: Mon, 30 Jun 2025 02:10:31 +0200
Message-ID: <20250630001053.952342-5-marek.vasut@mailbox.org>
In-Reply-To: <20250630001053.952342-1-marek.vasut@mailbox.org>
References: <20250630001053.952342-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: 2a07c094a6f12c85eda
X-MBO-RS-META: bx34a7h6k7nb4hspyjixkgxyjk4agmbh
Cc: Tom Rini <trini@konsulko.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>, u-boot@dh-electronics.com,
 Marek Vasut <marek.vasut@mailbox.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 05/10] ARM: stm32: Add STM32MP13xx debug
	UART initialization
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

Add default STM32MP13xx debug UART initialization. This is similar
to STM32MP15xx debug UART initialization, except the RCC registers
are at different offsets and the UART pinmux pins are different.

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Cheick Traore <cheick.traore@foss.st.com>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Lionel Debieve <lionel.debieve@foss.st.com>
Cc: Pascal Zimmermann <pzimmermann@dh-electronics.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Sughosh Ganu <sughosh.ganu@linaro.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
V2: Add RB from Patrice and Patrick
---
 board/st/stm32mp1/debug_uart.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/board/st/stm32mp1/debug_uart.c b/board/st/stm32mp1/debug_uart.c
index 24e3f9f2201..4c2149e0480 100644
--- a/board/st/stm32mp1/debug_uart.c
+++ b/board/st/stm32mp1/debug_uart.c
@@ -9,17 +9,32 @@
 #include <asm/arch/stm32.h>
 #include <linux/bitops.h>
 
+#if IS_ENABLED(CONFIG_STM32MP13X)
+#define RCC_MP_APB1ENSETR (STM32_RCC_BASE + 0x0700)
+#define RCC_MP_AHB4ENSETR (STM32_RCC_BASE + 0x0768)
+#elif IS_ENABLED(CONFIG_STM32MP15X)
 #define RCC_MP_APB1ENSETR (STM32_RCC_BASE + 0x0A00)
 #define RCC_MP_AHB4ENSETR (STM32_RCC_BASE + 0x0A28)
+#endif
 
+#define GPIOA_BASE 0x50002000
 #define GPIOG_BASE 0x50008000
 
 void board_debug_uart_init(void)
 {
-	if (CONFIG_DEBUG_UART_BASE == STM32_UART4_BASE) {
-		/* UART4 clock enable */
-		setbits_le32(RCC_MP_APB1ENSETR, BIT(16));
+	if (CONFIG_DEBUG_UART_BASE != STM32_UART4_BASE)
+		return;
 
+	/* UART4 clock enable */
+	setbits_le32(RCC_MP_APB1ENSETR, BIT(16));
+
+	if (IS_ENABLED(CONFIG_STM32MP13X)) {
+		/* GPIOA clock enable */
+		writel(BIT(0), RCC_MP_AHB4ENSETR);
+		/* GPIO configuration for DH boards: Uart4 TX = A9 */
+		writel(0xfffbffff, GPIOA_BASE + 0x00);
+		writel(0x00000080, GPIOA_BASE + 0x24);
+	} else if (IS_ENABLED(CONFIG_STM32MP15X)) {
 		/* GPIOG clock enable */
 		writel(BIT(6), RCC_MP_AHB4ENSETR);
 		/* GPIO configuration for ST boards: Uart4 TX = G11 */
-- 
2.47.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
