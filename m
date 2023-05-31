Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2C671767D
	for <lists+uboot-stm32@lfdr.de>; Wed, 31 May 2023 08:01:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6390C6A613;
	Wed, 31 May 2023 06:01:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B06BC65E70
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 May 2023 06:01:54 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34V2Y3UC018243; Wed, 31 May 2023 08:01:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=3q3QBCkLJfNEi9R7cbBsO6b0a7xqsRBVFcJ6V6/cMk4=;
 b=gukzLymwxBNazOSghDKci0GmiHHm2NmL8pCYkzNGOkSee5wkQu++UyW4o77MRSK+UiRR
 W0os3JUV5ErrMesHZ8eK50qrFpBIIXO37h4beb9JvjDmp7MxpD4G0cL+b1spH5tSP2jC
 ipDElt668RBEA4dA7KtKACqBMvrVG7SCX/SUVvrUSnNl4Mo767T1Plye6o+PexQQCDG6
 ulDgWHiIymrDxb/W348Qiludwv1V44FslaaBES4A1L/R63MmvCzTyyqKJ5uNf0e+jvB0
 DK21vvbugOMSdYI60Kn4OAK5vHZukYnWmFX0ei08AsQUw9DsXvdwKwnAHh/9t+0yCIfE 8w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qwdm5ph2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 May 2023 08:01:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5F0A9100038;
 Wed, 31 May 2023 08:01:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 58B70214D05;
 Wed, 31 May 2023 08:01:37 +0200 (CEST)
Received: from localhost (10.201.20.56) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 31 May
 2023 08:01:37 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 31 May 2023 08:01:31 +0200
Message-ID: <20230531060131.2045931-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531060131.2045931-1-patrice.chotard@foss.st.com>
References: <20230531060131.2045931-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.56]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_02,2023-05-30_01,2023-05-22_02
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 2/2] serial: stm32: BRR must be set only when
	usart is disable
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

To avoid spurious chars, BRR register must only be written when
USART is disabled.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/serial/serial_stm32.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/serial/serial_stm32.c b/drivers/serial/serial_stm32.c
index 93f70947eec..0085113f674 100644
--- a/drivers/serial/serial_stm32.c
+++ b/drivers/serial/serial_stm32.c
@@ -29,6 +29,10 @@ static void _stm32_serial_setbrg(fdt_addr_t base,
 {
 	bool stm32f4 = uart_info->stm32f4;
 	u32 int_div, mantissa, fraction, oversampling;
+	u8 uart_enable_bit = uart_info->uart_enable_bit;
+
+	/* BRR register must be set when uart is disabled */
+	clrbits_le32(base + CR1_OFFSET(stm32f4), BIT(uart_enable_bit));
 
 	int_div = DIV_ROUND_CLOSEST(clock_rate, baudrate);
 
@@ -44,6 +48,8 @@ static void _stm32_serial_setbrg(fdt_addr_t base,
 	fraction = int_div % oversampling;
 
 	writel(mantissa | fraction, base + BRR_OFFSET(stm32f4));
+
+	setbits_le32(base + CR1_OFFSET(stm32f4), BIT(uart_enable_bit));
 }
 
 static int stm32_serial_setbrg(struct udevice *dev, int baudrate)
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
