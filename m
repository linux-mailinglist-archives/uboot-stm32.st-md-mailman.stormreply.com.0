Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7F25246A9
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 May 2022 09:17:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCEF6C56630;
	Thu, 12 May 2022 07:17:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA630C035BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 May 2022 07:17:51 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24C1al6s018362;
 Thu, 12 May 2022 09:17:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=EtTAr3g26j0gvr5ITAGh+CB0rDCvKqaGZ+EWpDvoheI=;
 b=x12C9IhiEndRJZGo1/GyvOXZl6h07i0QjqKOVupo0Q2PyPcbGAXV7hN+Zjb2L1qR31Na
 xVQ3LgknH5MMrmn1NaEvuMTEe+ZRznXW3hWjNNkk1C2qypJiieopyuHeZPiuFuZU5uyP
 M9C6NQz3rAIdeW9q7e44SxJEW1YX9KdpXGj/haANRby7pgcGnZKYewW2RK6lP7LHunPp
 DoHfYiS/si18NoykZSrg9SvnpOzsLpn+ffyai+kP14Jjguj0UVEnn1HX2B58RVEv6Z2+
 SqYzuQZKk37/aIrNdEmCJ2Q9gKJLnuRkCKdeulkrmP+AFegxDIUK6KE6m54D5zg4WrC/ 2w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwdw9fyf5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 May 2022 09:17:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 96985100038;
 Thu, 12 May 2022 09:17:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8FB38214D18;
 Thu, 12 May 2022 09:17:50 +0200 (CEST)
Received: from localhost (10.75.127.48) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 12 May
 2022 09:17:50 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 12 May 2022 09:17:37 +0200
Message-ID: <20220512071738.741406-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512071738.741406-1-patrice.chotard@foss.st.com>
References: <20220512071738.741406-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-12_01,2022-02-23_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH v1 1/2] spi: stm32_qspi: Always check SR_TCF
	flags in stm32_qspi_wait_cmd()
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

Currently, SR_TCF flag is checked in case there is data, this criteria
is not correct.

SR_TCF flags is set when programmed number of bytes have been transferred
to the memory device ("bytes" comprised command and data send to the
SPI device).
So even if there is no data, we must check SR_TCF flag.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/spi/stm32_qspi.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/spi/stm32_qspi.c b/drivers/spi/stm32_qspi.c
index 8f4aabc3d1..3c8faecb54 100644
--- a/drivers/spi/stm32_qspi.c
+++ b/drivers/spi/stm32_qspi.c
@@ -150,20 +150,19 @@ static int _stm32_qspi_wait_cmd(struct stm32_qspi_priv *priv,
 	u32 sr;
 	int ret = 0;
 
-	if (op->data.nbytes) {
-		ret = readl_poll_timeout(&priv->regs->sr, sr,
-					 sr & STM32_QSPI_SR_TCF,
-					 STM32_QSPI_CMD_TIMEOUT_US);
-		if (ret) {
-			log_err("cmd timeout (stat:%#x)\n", sr);
-		} else if (readl(&priv->regs->sr) & STM32_QSPI_SR_TEF) {
-			log_err("transfer error (stat:%#x)\n", sr);
-			ret = -EIO;
-		}
-		/* clear flags */
-		writel(STM32_QSPI_FCR_CTCF | STM32_QSPI_FCR_CTEF, &priv->regs->fcr);
+	ret = readl_poll_timeout(&priv->regs->sr, sr,
+				 sr & STM32_QSPI_SR_TCF,
+				 STM32_QSPI_CMD_TIMEOUT_US);
+	if (ret) {
+		log_err("cmd timeout (stat:%#x)\n", sr);
+	} else if (readl(&priv->regs->sr) & STM32_QSPI_SR_TEF) {
+		log_err("transfer error (stat:%#x)\n", sr);
+		ret = -EIO;
 	}
 
+	/* clear flags */
+	writel(STM32_QSPI_FCR_CTCF | STM32_QSPI_FCR_CTEF, &priv->regs->fcr);
+
 	if (!ret)
 		ret = _stm32_qspi_wait_for_not_busy(priv);
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
