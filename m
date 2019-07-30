Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA17A7AF99
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 19:17:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5A74C35E02
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 17:17:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1F9DC35E02
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:17:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UHFqQ4001893; Tue, 30 Jul 2019 19:17:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ncNilUi3LKoJRfZPJ2gG+pjHz8kdbr9qhX54Ng9WM3M=;
 b=V+TFwqPWpbK/8cAvsmGrYLygfBwUZfG9+gmobmBkFfNjxL6Ua1LgqaAAGjU6D8yY5SE9
 vLQP85CcDaeP4LqVzhox2H/m47QhUy8T97Il9a5VOUzDK0djrWmUM6+zGfX4SrSymATI
 oquPiNxGut7r8eGHQFua+kqaTkHkUQ2vzfiMvA92Ykg7j/VWQtZEBvYNRAFSsEezuYeI
 H9DPGF8LOkBmyqTuutmG4MCcY1sp5s+ffkOqjI5UYK0xwoU+AUZ4krUXMeS8fEpMxkuc
 yIoQwfKeqKhJvlJGky3i2wqgh8mDM8hF+sPBkeDFJcXUvaGomxKbLnpKEm/3jqwkdXmY 1Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u2jp4acux-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Jul 2019 19:17:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 239083D;
 Tue, 30 Jul 2019 17:17:44 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1CF21CEA01;
 Tue, 30 Jul 2019 19:17:44 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 19:17:43 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 19:17:43
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Jul 2019 19:16:46 +0200
Message-ID: <1564507016-16570-39-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
References: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 38/48] serial: stm32: add Framing error support
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

Add management of Bit 1 of USART_ISR = FE: Framing error
This bit is set by hardware when a de-synchronization, excessive noise
or a break character is detected. It is cleared by software, writing 1
to the FECF bit in the USART_ICR register (for stm32 after f4).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/serial/serial_stm32.c | 5 +++--
 drivers/serial/serial_stm32.h | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/serial/serial_stm32.c b/drivers/serial/serial_stm32.c
index 3ab536a..00a8e72 100644
--- a/drivers/serial/serial_stm32.c
+++ b/drivers/serial/serial_stm32.c
@@ -106,10 +106,11 @@ static int stm32_serial_getc(struct udevice *dev)
 	if ((isr & USART_ISR_RXNE) == 0)
 		return -EAGAIN;
 
-	if (isr & (USART_ISR_PE | USART_ISR_ORE)) {
+	if (isr & (USART_ISR_PE | USART_ISR_ORE | USART_ISR_FE)) {
 		if (!stm32f4)
 			setbits_le32(base + ICR_OFFSET,
-				     USART_ICR_PCECF | USART_ICR_ORECF);
+				     USART_ICR_PCECF | USART_ICR_ORECF |
+				     USART_ICR_FECF);
 		else
 			readl(base + RDR_OFFSET(stm32f4));
 		return -EIO;
diff --git a/drivers/serial/serial_stm32.h b/drivers/serial/serial_stm32.h
index 5549f8c..7b0c531 100644
--- a/drivers/serial/serial_stm32.h
+++ b/drivers/serial/serial_stm32.h
@@ -67,6 +67,7 @@ struct stm32x7_serial_platdata {
 #define USART_ISR_TXE			BIT(7)
 #define USART_ISR_RXNE			BIT(5)
 #define USART_ISR_ORE			BIT(3)
+#define USART_ISR_FE			BIT(1)
 #define USART_ISR_PE			BIT(0)
 
 #define USART_BRR_F_MASK		GENMASK(7, 0)
@@ -74,6 +75,7 @@ struct stm32x7_serial_platdata {
 #define USART_BRR_M_MASK		GENMASK(15, 4)
 
 #define USART_ICR_ORECF			BIT(3)
+#define USART_ICR_FECF			BIT(1)
 #define USART_ICR_PCECF			BIT(0)
 
 #endif
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
