Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D8DA22CC4
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2025 13:01:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 518F9C71289;
	Thu, 30 Jan 2025 12:01:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21EA6C6C83A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2025 12:01:31 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UBcvtR024511;
 Thu, 30 Jan 2025 13:01:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=F9z6yawOWsO9rbYUSM5dqY
 xUSlxZFoNI8VLeJyfA1iY=; b=faOI6tQM7Ft5T9xdRXXxtACYOuJXocroIE/n4W
 6qwzSDTweCmat/u7Pid2n70U/GBPDw/EikAIhHlTnkMt9z66UdFCkWexnNN8mNmJ
 lrZFyKjfSOoZYk1R0wkHZahXg1lt4MhYYAQUkyCfIK4Vcmb7ozvc7V7Kf+nNrVug
 s1/IN8NMDEusIZv846a6DWFwVg+NkJ90x7W2ZyEZo3i3vfwcy0yAzXV3j5LZxnEw
 R/n2ykVLtZRN8L5DLLC0v2sqqOevi6zxBmVLMt9IR9zHpjK2LDoickgeX9pXUPZa
 isbMfUIUi6S4WU66Ck32eCG6NhAybWgm1/IwCDOcrczZAETA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44ftteang1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jan 2025 13:01:26 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E3ABD4005B;
 Thu, 30 Jan 2025 13:00:23 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 468B63AFEE3;
 Thu, 30 Jan 2025 12:57:57 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 30 Jan
 2025 12:57:57 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 30 Jan 2025 12:57:54 +0100
Message-ID: <20250130115754.398989-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_06,2025-01-30_01,2024-11-22_01
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Peter Robinson <pbrobinson@gmail.com>, Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] serial: stm32: restrict _debug_uart_init()
	usage
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

Since commit 948da7773e34 ("arm: Add new config option ARCH_VERY_EARLY_INIT")
debug_uart_init() is called respectively in crt0.S and crt0_64.S.
That means that _debug_uart_init() is called for all STM32MP platforms
even for those which doesn't support SPL_BUILD.

So restrict _debug_uart_init() execution for platforms which can have
SPL_BUILD enabled (STM32MP1 platform only).

It's more needed to call debug_uart_init() in stm32mp1/cpu.c.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/mach-stm32mp/stm32mp1/cpu.c |  2 --
 drivers/serial/serial_stm32.c        | 18 ++++++++++++------
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-stm32mp/stm32mp1/cpu.c b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
index cb1b84c9af9..bc410128479 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/cpu.c
+++ b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
@@ -138,8 +138,6 @@ int mach_cpu_init(void)
 	if (IS_ENABLED(CONFIG_CMD_STM32PROG_SERIAL) &&
 	    (boot_mode & TAMP_BOOT_DEVICE_MASK) == BOOT_SERIAL_UART)
 		gd->flags |= GD_FLG_SILENT | GD_FLG_DISABLE_CONSOLE;
-	else if (IS_ENABLED(CONFIG_DEBUG_UART) && IS_ENABLED(CONFIG_XPL_BUILD))
-		debug_uart_init();
 
 	return 0;
 }
diff --git a/drivers/serial/serial_stm32.c b/drivers/serial/serial_stm32.c
index 1ee58142b3f..1675a9cb9d1 100644
--- a/drivers/serial/serial_stm32.c
+++ b/drivers/serial/serial_stm32.c
@@ -299,13 +299,19 @@ static inline struct stm32_uart_info *_debug_uart_info(void)
 
 static inline void _debug_uart_init(void)
 {
-	void __iomem *base = (void __iomem *)CONFIG_VAL(DEBUG_UART_BASE);
-	struct stm32_uart_info *uart_info = _debug_uart_info();
+	void __maybe_unused __iomem *base = (void __iomem *)CONFIG_VAL(DEBUG_UART_BASE);
+	struct stm32_uart_info *uart_info __maybe_unused = _debug_uart_info();
 
-	_stm32_serial_init(base, uart_info);
-	_stm32_serial_setbrg(base, uart_info,
-			     CONFIG_DEBUG_UART_CLOCK,
-			     CONFIG_BAUDRATE);
+	/*
+	 * debug_uart_init() is only usable when SPL_BUILD is enabled
+	 * (STM32MP1 case only)
+	 */
+	if (IS_ENABLED(CONFIG_DEBUG_UART) && IS_ENABLED(CONFIG_SPL_BUILD)) {
+		_stm32_serial_init(base, uart_info);
+		_stm32_serial_setbrg(base, uart_info,
+				     CONFIG_DEBUG_UART_CLOCK,
+				     CONFIG_BAUDRATE);
+	}
 }
 
 static inline void _debug_uart_putc(int c)
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
