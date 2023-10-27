Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BE27D9BE4
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Oct 2023 16:44:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5630DC6C85B;
	Fri, 27 Oct 2023 14:44:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C05A2C6C841
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Oct 2023 14:44:14 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39RCMfxB016042; Fri, 27 Oct 2023 16:44:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=+EYSul5AFy4ZQYjXBdtWuWUOo4yHPUslS865kqTR0CQ=; b=KH
 FkybXGhGYytQBYlVP6g+R5sAvZIrZ4uwiqaeNlv7nvRtE4ESXER1aPeW/+LWX+pX
 NluonjnavgrDuGKXIeiSwNIc279edNTZ6LUMZLZg2q/nxvVUwBB/IG3dYQixjX6Z
 EWtqVnOo2ZRwKxajrXJcZaqXTiF61bj6JutUoEVllkv88RqO0uQ+zgARf0d7J/3o
 HC07dUlPS9V9Lav/intGUMrJGNWvD4c+MUkJOzdC2hCUHwCpX10NXwTRYb4bAOab
 UeA1ufefgrL0HrNW0oXdk4R77HyyxgMq5oVtZUFog9jOYAnicOvWO70v+mLt2rhv
 ZxaEyd0aExVabfs6rVzA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tywqqc9ve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 16:44:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 75C7A100062;
 Fri, 27 Oct 2023 16:44:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6F6FB26A0BD;
 Fri, 27 Oct 2023 16:44:13 +0200 (CEST)
Received: from localhost (10.201.20.38) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 27 Oct
 2023 16:44:13 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 27 Oct 2023 16:43:01 +0200
Message-ID: <20231027144304.1002307-7-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231027144304.1002307-1-patrice.chotard@foss.st.com>
References: <20231027144304.1002307-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_13,2023-10-27_01,2023-05-22_02
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH v1 6/9] serial: stm32: Fix AARCH64 compilation
	warnings
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

From: Patrice Chotard <patrice.chotard@st.com>

When building with AARCH64 defconfig, we got warnings, fix them
by using registers base address defined as void __iomem * instead of
fdt_addr_t.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/serial/serial_stm32.c | 23 +++++++++++++----------
 drivers/serial/serial_stm32.h |  2 +-
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/serial/serial_stm32.c b/drivers/serial/serial_stm32.c
index 23d476fba28..fb039546a41 100644
--- a/drivers/serial/serial_stm32.c
+++ b/drivers/serial/serial_stm32.c
@@ -30,7 +30,7 @@
  */
 #define ONE_BYTE_B115200_US		87
 
-static void _stm32_serial_setbrg(fdt_addr_t base,
+static void _stm32_serial_setbrg(void __iomem *base,
 				 struct stm32_uart_info *uart_info,
 				 u32 clock_rate,
 				 int baudrate)
@@ -75,7 +75,7 @@ static int stm32_serial_setconfig(struct udevice *dev, uint serial_config)
 	struct stm32x7_serial_plat *plat = dev_get_plat(dev);
 	bool stm32f4 = plat->uart_info->stm32f4;
 	u8 uart_enable_bit = plat->uart_info->uart_enable_bit;
-	u32 cr1 = plat->base + CR1_OFFSET(stm32f4);
+	void __iomem *cr1 = plat->base + CR1_OFFSET(stm32f4);
 	u32 config = 0;
 	uint parity = SERIAL_GET_PARITY(serial_config);
 	uint bits = SERIAL_GET_BITS(serial_config);
@@ -122,7 +122,7 @@ static int stm32_serial_getc(struct udevice *dev)
 {
 	struct stm32x7_serial_plat *plat = dev_get_plat(dev);
 	bool stm32f4 = plat->uart_info->stm32f4;
-	fdt_addr_t base = plat->base;
+	void __iomem *base = plat->base;
 	u32 isr = readl(base + ISR_OFFSET(stm32f4));
 
 	if ((isr & USART_ISR_RXNE) == 0)
@@ -141,7 +141,7 @@ static int stm32_serial_getc(struct udevice *dev)
 	return readl(base + RDR_OFFSET(stm32f4));
 }
 
-static int _stm32_serial_putc(fdt_addr_t base,
+static int _stm32_serial_putc(void __iomem *base,
 			      struct stm32_uart_info *uart_info,
 			      const char c)
 {
@@ -166,7 +166,7 @@ static int stm32_serial_pending(struct udevice *dev, bool input)
 {
 	struct stm32x7_serial_plat *plat = dev_get_plat(dev);
 	bool stm32f4 = plat->uart_info->stm32f4;
-	fdt_addr_t base = plat->base;
+	void __iomem *base = plat->base;
 
 	if (input)
 		return readl(base + ISR_OFFSET(stm32f4)) &
@@ -176,7 +176,7 @@ static int stm32_serial_pending(struct udevice *dev, bool input)
 			USART_ISR_TXE ? 0 : 1;
 }
 
-static void _stm32_serial_init(fdt_addr_t base,
+static void _stm32_serial_init(void __iomem *base,
 			       struct stm32_uart_info *uart_info)
 {
 	bool stm32f4 = uart_info->stm32f4;
@@ -250,11 +250,14 @@ static const struct udevice_id stm32_serial_id[] = {
 static int stm32_serial_of_to_plat(struct udevice *dev)
 {
 	struct stm32x7_serial_plat *plat = dev_get_plat(dev);
+	fdt_addr_t addr;
 
-	plat->base = dev_read_addr(dev);
-	if (plat->base == FDT_ADDR_T_NONE)
+	addr = dev_read_addr(dev);
+	if (addr == FDT_ADDR_T_NONE)
 		return -EINVAL;
 
+	plat->base = (void __iomem *)addr;
+
 	return 0;
 }
 
@@ -297,7 +300,7 @@ static inline struct stm32_uart_info *_debug_uart_info(void)
 
 static inline void _debug_uart_init(void)
 {
-	fdt_addr_t base = CONFIG_VAL(DEBUG_UART_BASE);
+	void __iomem *base = (void __iomem *)CONFIG_VAL(DEBUG_UART_BASE);
 	struct stm32_uart_info *uart_info = _debug_uart_info();
 
 	_stm32_serial_init(base, uart_info);
@@ -308,7 +311,7 @@ static inline void _debug_uart_init(void)
 
 static inline void _debug_uart_putc(int c)
 {
-	fdt_addr_t base = CONFIG_VAL(DEBUG_UART_BASE);
+	void __iomem *base = (void __iomem *)CONFIG_VAL(DEBUG_UART_BASE);
 	struct stm32_uart_info *uart_info = _debug_uart_info();
 
 	while (_stm32_serial_putc(base, uart_info, c) == -EAGAIN)
diff --git a/drivers/serial/serial_stm32.h b/drivers/serial/serial_stm32.h
index b7e7a90b931..d2c92ba48ea 100644
--- a/drivers/serial/serial_stm32.h
+++ b/drivers/serial/serial_stm32.h
@@ -49,7 +49,7 @@ struct stm32_uart_info stm32h7_info = {
 
 /* Information about a serial port */
 struct stm32x7_serial_plat {
-	fdt_addr_t base;  /* address of registers in physical memory */
+	void __iomem *base;  /* address of registers in physical memory */
 	struct stm32_uart_info *uart_info;
 	unsigned long int clock_rate;
 };
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
