Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1672471767A
	for <lists+uboot-stm32@lfdr.de>; Wed, 31 May 2023 08:01:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B94C5C6A613;
	Wed, 31 May 2023 06:01:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 890C9C65E70
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 May 2023 06:01:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34V1Z2P9011761; Wed, 31 May 2023 08:01:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=drofvgLnLAjpqdU0baNV6eH9UvKuUW3vHi7TnF+fO0s=;
 b=NrTkORakmXUIhpAbIP7r3+jWq02gGj9AajRa9TJLjN+4IwrKIbawLW3dDPOa/KYRiEof
 Av7EJ7qrJQRugt+T/HKWSn/MoajILnyIeP/G0knpoTMQqQk+a13VNJYRqHbQJ5IChadu
 8LuTP1WKcXE7gdYoiDEB+JOOOnsxdAu+o8vzBeuxEhfKvJyR9WsJOtadGS7VcgGtr+44
 dAKx6hhWz5dTlq+DuFkpEdbeQmmHQ9kUn+aGrWFd5uFWclYp8SIlavbufH4t6TLuV3Ei
 gVAozhqpPk1CTdkDiw11vhrDIeK1QrT0t4f6hHXo3Jt8rB3JzdhAHH447hklnGS2ww54 bQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qvsnnvdqm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 May 2023 08:01:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C163210002A;
 Wed, 31 May 2023 08:01:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AFB42214D05;
 Wed, 31 May 2023 08:01:36 +0200 (CEST)
Received: from localhost (10.201.20.56) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 31 May
 2023 08:01:36 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 31 May 2023 08:01:30 +0200
Message-ID: <20230531060131.2045931-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.56]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_02,2023-05-30_01,2023-05-22_02
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 1/2] serial: stm32: Wait TC bit before
	performing initialization
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

In case there is still chars from previous bootstage to transmit, wait
for TC (Transmission Complete) bit to be set which ensure that the last
data written in the USART_TDR has been transmitted out of the shift
register.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/serial/serial_stm32.c | 15 +++++++++++++++
 drivers/serial/serial_stm32.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/serial/serial_stm32.c b/drivers/serial/serial_stm32.c
index 2ba92bf9c48..93f70947eec 100644
--- a/drivers/serial/serial_stm32.c
+++ b/drivers/serial/serial_stm32.c
@@ -18,6 +18,7 @@
 #include <dm/device_compat.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
+#include <linux/iopoll.h>
 #include "serial_stm32.h"
 #include <dm/device_compat.h>
 
@@ -181,9 +182,12 @@ static int stm32_serial_probe(struct udevice *dev)
 	struct stm32x7_serial_plat *plat = dev_get_plat(dev);
 	struct clk clk;
 	struct reset_ctl reset;
+	u32 isr;
 	int ret;
+	bool stm32f4;
 
 	plat->uart_info = (struct stm32_uart_info *)dev_get_driver_data(dev);
+	stm32f4 = plat->uart_info->stm32f4;
 
 	ret = clk_get_by_index(dev, 0, &clk);
 	if (ret < 0)
@@ -195,6 +199,17 @@ static int stm32_serial_probe(struct udevice *dev)
 		return ret;
 	}
 
+	/*
+	 * before uart initialization, wait for TC bit (Transmission Complete)
+	 * in case there is still chars from previous bootstage to transmit
+	 */
+	ret = read_poll_timeout(readl, isr, isr & USART_ISR_TC, 10, 150,
+				plat->base + ISR_OFFSET(stm32f4));
+	if (ret) {
+		clk_disable(&clk);
+		return ret;
+	}
+
 	ret = reset_get_by_index(dev, 0, &reset);
 	if (!ret) {
 		reset_assert(&reset);
diff --git a/drivers/serial/serial_stm32.h b/drivers/serial/serial_stm32.h
index 5bee68fa9c2..b7e7a90b931 100644
--- a/drivers/serial/serial_stm32.h
+++ b/drivers/serial/serial_stm32.h
@@ -66,6 +66,7 @@ struct stm32x7_serial_plat {
 #define USART_CR3_OVRDIS		BIT(12)
 
 #define USART_ISR_TXE			BIT(7)
+#define USART_ISR_TC			BIT(6)
 #define USART_ISR_RXNE			BIT(5)
 #define USART_ISR_ORE			BIT(3)
 #define USART_ISR_FE			BIT(1)
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
