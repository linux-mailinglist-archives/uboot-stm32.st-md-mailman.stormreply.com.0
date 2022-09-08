Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CCF5B1769
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Sep 2022 10:44:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28454C640F2;
	Thu,  8 Sep 2022 08:44:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B20EDC63327
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Sep 2022 08:07:32 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2887R3s8031642;
 Thu, 8 Sep 2022 10:07:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=K1zq6b0d06MFLzmrghmdXZ87N7M3s+hwtvFkaHWtDHE=;
 b=8E844EkP+vEFHzDqe3Ojzd/Ox/kBw2cMn7QvQXs7eRJqsrCW9wG4Wm7IWhb8L53pYcy2
 RmwXo7fdtS5mXwEf/jajfqbXVrTk64zVzCepReZuOMFybHhDmQrgPdMlwm56Qh4z77rM
 JWM6Wgi52k7qAEmZenvgERaBo65bFaVj6zFJK1pCevuEtoqnL6IiLiYEvaE3xQVzk7b1
 sUYbCpUMQT+lHnTrj5e2rMJgeGj9v5QYnDuD3BFbtipNeNHiLVeD7yT/NzpmqxN1Pprn
 cTD1h24cJ1txAqQYYaWrz/E7iajQ6/A7t6wIgkA4zl6VrOTgveQ01Bam/o5CtlhSU6b+ QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jergb701e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Sep 2022 10:07:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1DC9D100034;
 Thu,  8 Sep 2022 10:07:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 18AF92194CD;
 Thu,  8 Sep 2022 10:07:31 +0200 (CEST)
Received: from localhost (10.75.127.117) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Thu, 8 Sep 2022
 10:07:30 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
Date: Thu, 8 Sep 2022 10:06:27 +0200
Message-ID: <20220908080627.1762034-4-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220908080627.1762034-1-alain.volmat@foss.st.com>
References: <20220908080627.1762034-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.117]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_06,2022-09-07_02,2022-06-22_01
X-Mailman-Approved-At: Thu, 08 Sep 2022 08:44:19 +0000
Cc: patrick.delaunay@foss.st.com, oleksandr.suvorov@foundries.io, hs@denx.de
Subject: [Uboot-stm32] [PATCH 3/3] i2c: stm32: only send a STOP upon
	transfer completion
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
sending automatically a STOP when a NACK is generated.  This can
be especially seen when the processing get slower (ex: enabling lots
of debug messages), ending up send 2 STOP (one automatically by the
controller and a 2nd one at the end of the stm32_i2c_message_xfer
function).

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/i2c/stm32f7_i2c.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
index 0ec67b5c12..8803979d3e 100644
--- a/drivers/i2c/stm32f7_i2c.c
+++ b/drivers/i2c/stm32f7_i2c.c
@@ -477,16 +477,16 @@ static int stm32_i2c_message_xfer(struct stm32_i2c_priv *i2c_priv,
 			if (ret)
 				break;
 
+			/* End of transfer, send stop condition */
+			mask = STM32_I2C_CR2_STOP;
+			setbits_le32(&regs->cr2, mask);
+
 			if (!stop)
 				/* Message sent, new message has to be sent */
 				return 0;
 		}
 	}
 
-	/* End of transfer, send stop condition */
-	mask = STM32_I2C_CR2_STOP;
-	setbits_le32(&regs->cr2, mask);
-
 	return stm32_i2c_check_end_of_message(i2c_priv);
 }
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
