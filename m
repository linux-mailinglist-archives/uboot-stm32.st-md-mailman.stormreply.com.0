Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9486AB3EE5
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 May 2025 19:22:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFD20C7A82F;
	Mon, 12 May 2025 17:22:24 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2561C7A830
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 May 2025 17:22:23 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Zx5yR3xXqz9srw;
 Mon, 12 May 2025 19:22:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1747070543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/w/9dyn2hKojhxm0x/lmH/ZIaC/rxAV1GbSvPpn1xBU=;
 b=JfJRZKGAacfrKrbgfLSsCE9q5Tsli+xeLPlWO/ZIFVXNtKr3jCdMHcqO06r8iSfsHdqD9T
 LZv+rI5wY4Avb6r3orx1i4IjM4CyRJvLYgTEQgKUKJOJ8UwHy8nsTHKNGHbVK4nUNcutaC
 bjgOmuLJX+J6dKda5hkj5HdKRLo0QmixckY1no1dQ1+x5B6HbqUrSWMHyG9gLgFRHUeHFc
 BfYk1Zoul4tBECug63WK716qDPcLaSe6gzGK+E7jEKSh0CE5T7WjG31TSpfkiEm3n9vIQh
 U+mvGS5ggyN9wXjTxBneJFK+Y90d/yrY8tRX+hdT5nAvoBuA8XB/6SFYkIGeug==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1747070541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/w/9dyn2hKojhxm0x/lmH/ZIaC/rxAV1GbSvPpn1xBU=;
 b=qelaxidNxQgokAp5ji1qEMH05MSW+blY2v4Up7mBqeN+w6oP7r9ejnG8tbdp986Kgb6cBZ
 0BvqUoiyUUTGDTGU2nBtn22meoB4D/mc03SThr4m5Aq+5HktL4iZX2mIbgnV8n+IHfYIS4
 S7EHkgl0Yu4v8Tk3BTGwnE4ZhEuP6b+Mc1e7DRiNct62IH71gd/bU9IXXahQ/l8CeZimEn
 cWHk52cM4YawPg92YFLT+SbsOlc7aG3CsI58bqthOCQge2wevIbGNRHX6IFNfUrcTcuGbC
 FwsMO99sCr5BsNKWoIQNFkiLK/4olplBD+NYRiVox3Se0NopT/yR6T70HtUoZw==
To: u-boot@lists.denx.de
Date: Mon, 12 May 2025 19:21:32 +0200
Message-ID: <20250512172149.150214-6-marek.vasut@mailbox.org>
In-Reply-To: <20250512172149.150214-1-marek.vasut@mailbox.org>
References: <20250512172149.150214-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: 73e153a1105c784bb2d
X-MBO-RS-META: i5jes3yj9ch7jd87johhd1hs8yqzxfp4
X-Rspamd-Queue-Id: 4Zx5yR3xXqz9srw
Cc: Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>, u-boot@dh-electronics.com,
 Marek Vasut <marek.vasut@mailbox.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Lionel Debieve <lionel.debieve@foss.st.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>
Subject: [Uboot-stm32] [PATCH 05/10] ARM: stm32: Add STM32MP13xx debug UART
	initialization
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
