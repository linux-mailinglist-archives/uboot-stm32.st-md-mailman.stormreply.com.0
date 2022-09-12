Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0067C5B567E
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Sep 2022 10:42:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B59F1C64119;
	Mon, 12 Sep 2022 08:42:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DDEDC63326
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Sep 2022 08:42:15 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C8QTdi012902;
 Mon, 12 Sep 2022 10:42:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=T4ZmfbusWC0Dglqvxc3lWF74wqQ/Q3zJMfu2URsZtJI=;
 b=KPR8yM5CcDrdLUf9AGozd2GAO8laLNwNUyi07k/kmerNIm44tP5AzF+QGM1D/S/P7Zv7
 AJgwvd5C3ZdLYA5Lm8uDAJu27IehhnuvIpwWYBsfA2lx7a/BNqjhX8A7iMzkG9/U6/Lw
 1VSF15L9ecIopFaVxRwQhmLQm0NmsU2PtirSN7faI3vhZN8KDaAEaT1pyebSkRfhZ+tW
 lmLpdwUUXucnf6GOgP2Wa8JA3WobtqhsoM1xUFViJh8viAjJbk7CZa+Rh3PZqVT1/9jb
 xN7RnZas24VPo7JsQOodKGpd12xK0+Xk4AnCHF9srjqZAqayElGtER7NUV43vVQpfvsk og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jgjwv0kpq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 10:42:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3339F10002A;
 Mon, 12 Sep 2022 10:42:13 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2F39B217B9F;
 Mon, 12 Sep 2022 10:42:13 +0200 (CEST)
Received: from localhost (10.75.127.116) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 12 Sep
 2022 10:42:13 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
Date: Mon, 12 Sep 2022 10:42:00 +0200
Message-ID: <20220912084201.1826979-4-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220912084201.1826979-1-alain.volmat@foss.st.com>
References: <20220912084201.1826979-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.116]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_05,2022-09-09_01,2022-06-22_01
Cc: patrick.delaunay@foss.st.com, oleksandr.suvorov@foundries.io, hs@denx.de
Subject: [Uboot-stm32] [PATCH v4 3/4] i2c: stm32: do not set the STOP
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
