Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 623CB5B3CA9
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Sep 2022 18:06:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E8ACC64117;
	Fri,  9 Sep 2022 16:06:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08BBBC64116
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Sep 2022 16:06:55 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 289FXbDv031472;
 Fri, 9 Sep 2022 18:06:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=T4ZmfbusWC0Dglqvxc3lWF74wqQ/Q3zJMfu2URsZtJI=;
 b=Oy4EI5KP683BvS2klQW6YEq736Uk35qefbbAJMIPnZRwERuZ7v0bRIEqc/tAJw7BUPJF
 5thfUgZW8NcAijhT3N2Q5MEh7WnhZblwktWPMO/N+jkn3idDz7GfdGos014lNuz4ZDVp
 E84PHZBgA24qaCm0T8uRLQlCT8AdPx5yqkVb9a7CGr5gOESBZWgeea9bjcT2IoAVp4Bj
 0ru99OEcNd6I+xkfOO0l7dmHsuxcZpmaga/AogyidvrMEznJmjdYbKMSO2FlwscfGvx9
 0lKdIWDcP/1tLa15PE8k2qKRU3O9OQtuEXFCq+oxRKotctZogvtzDMUUvDdVTrozxui7 OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jergbj6kb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Sep 2022 18:06:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 08B9A100039;
 Fri,  9 Sep 2022 18:06:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0308123BE15;
 Fri,  9 Sep 2022 18:06:51 +0200 (CEST)
Received: from localhost (10.75.127.46) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Fri, 9 Sep 2022
 18:06:50 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
Date: Fri, 9 Sep 2022 18:06:27 +0200
Message-ID: <20220909160627.1793406-4-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220909160627.1793406-1-alain.volmat@foss.st.com>
References: <20220909160627.1793406-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-09_08,2022-09-09_01,2022-06-22_01
Cc: patrick.delaunay@foss.st.com, oleksandr.suvorov@foundries.io, hs@denx.de
Subject: [Uboot-stm32] [PATCH v3 3/3] i2c: stm32: do not set the STOP
	condition on error
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

Current function stm32_i2c_message_xfer is sending a STOP
whatever the result of the transaction is.  This can cause issues
such as making the bus busy since the controller itself is already
sending automatically a STOP when a NACK is generated.

Thanks to Jorge Ramirez-Ortiz for diagnosing and proposing a first
fix for this. [1]

[1] https://lore.kernel.org/u-boot/20220815145211.31342-2-jorge@foundries.io/

Reported-by: Jorge Ramirez-Ortiz, Foundries <jorge@foundries.io>
Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/i2c/stm32f7_i2c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
index 0ec67b5c12..2db7f44d44 100644
--- a/drivers/i2c/stm32f7_i2c.c
+++ b/drivers/i2c/stm32f7_i2c.c
@@ -483,9 +483,9 @@ static int stm32_i2c_message_xfer(struct stm32_i2c_priv *i2c_priv,
 		}
 	}
 
-	/* End of transfer, send stop condition */
-	mask = STM32_I2C_CR2_STOP;
-	setbits_le32(&regs->cr2, mask);
+	/* End of transfer, send stop condition if appropriate */
+	if (!ret && !(status & (STM32_I2C_ISR_NACKF | STM32_I2C_ISR_ERRORS)))
+		setbits_le32(&regs->cr2, STM32_I2C_CR2_STOP);
 
 	return stm32_i2c_check_end_of_message(i2c_priv);
 }
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
