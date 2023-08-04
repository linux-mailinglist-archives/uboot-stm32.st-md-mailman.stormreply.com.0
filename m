Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B56770292
	for <lists+uboot-stm32@lfdr.de>; Fri,  4 Aug 2023 16:09:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FDFCC6B463;
	Fri,  4 Aug 2023 14:09:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 468C9C65E4F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Aug 2023 14:09:09 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 374BtkJa018565; Fri, 4 Aug 2023 16:09:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=zaU+oDk
 LYQNKbUslqEmHZt9MNyz83kKj1x1LnWCa7jA=; b=b0SZtBo0163cBS/m3klv/6U
 ekSoHw9POJ5YbQG5rxj7spySpOqbWwc5PAJdo9S8O4hXL8p7Ip//XRobYjYLFCDt
 F15s2IKKruqEKQULuJNmysOBIXNV34eoTc/rqyua8cDqr4OGc+V+ASYr/G6dV5Dj
 z06DCUZRsPLfqzB18sPYEumCXwtPhGYLgPcgPuuS5dWydnxk58HNLRwhPYETLOIw
 ayJm6+H4rbU83TGfCKmqSWbcRXDwbTH89+DE/LDCbaFL6DuHR0LYS13AXPOL9PKO
 NXLrheDPFfdGpjUIYnFOGr6p4lK1htnBodu3n46kNriEa/DA+xFb3crUBLhep+w=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3s8wuk9yu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Aug 2023 16:09:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BFF9410004F;
 Fri,  4 Aug 2023 16:09:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A155421F0D1;
 Fri,  4 Aug 2023 16:09:06 +0200 (CEST)
Received: from localhost (10.201.20.38) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 4 Aug
 2023 16:09:06 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 4 Aug 2023 16:09:04 +0200
Message-ID: <20230804140904.176552-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-04_13,2023-08-03_01,2023-05-22_02
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Valentin Caron <valentin.caron@foss.st.com>
Subject: [Uboot-stm32] [PATCH] serial: stm32: extend TC timeout
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

From: Valentin Caron <valentin.caron@foss.st.com>

Waiting 150us TC bit couldn't be enough.

If TFA lets 16 bits in USART fifo, we has to wait 16 times 87 us (time
of 10 bits (1 byte in most use cases) at a baud rate of 115200).

Fixes: b4dbc5d65a67 ("serial: stm32: Wait TC bit before performing initialization")

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/serial/serial_stm32.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/serial/serial_stm32.c b/drivers/serial/serial_stm32.c
index 0085113f674..23d476fba28 100644
--- a/drivers/serial/serial_stm32.c
+++ b/drivers/serial/serial_stm32.c
@@ -22,6 +22,14 @@
 #include "serial_stm32.h"
 #include <dm/device_compat.h>
 
+/*
+ * At 115200 bits/s
+ * 1 bit = 1 / 115200 = 8,68 us
+ * 8 bits = 69,444 us
+ * 10 bits are needed for worst case (8 bits + 1 start + 1 stop) = 86.806 us
+ */
+#define ONE_BYTE_B115200_US		87
+
 static void _stm32_serial_setbrg(fdt_addr_t base,
 				 struct stm32_uart_info *uart_info,
 				 u32 clock_rate,
@@ -209,12 +217,10 @@ static int stm32_serial_probe(struct udevice *dev)
 	 * before uart initialization, wait for TC bit (Transmission Complete)
 	 * in case there is still chars from previous bootstage to transmit
 	 */
-	ret = read_poll_timeout(readl, isr, isr & USART_ISR_TC, 10, 150,
-				plat->base + ISR_OFFSET(stm32f4));
-	if (ret) {
-		clk_disable(&clk);
-		return ret;
-	}
+	ret = read_poll_timeout(readl, isr, isr & USART_ISR_TC, 50,
+				16 * ONE_BYTE_B115200_US, plat->base + ISR_OFFSET(stm32f4));
+	if (ret)
+		dev_dbg(dev, "FIFO not empty, some character can be lost (%d)\n", ret);
 
 	ret = reset_get_by_index(dev, 0, &reset);
 	if (!ret) {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
