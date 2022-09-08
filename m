Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2BE5B1ACC
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Sep 2022 13:02:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4765EC64107;
	Thu,  8 Sep 2022 11:02:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D836C64101
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Sep 2022 11:02:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2887NI8F031547;
 Thu, 8 Sep 2022 13:02:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=l5LaYkJF7+LnkHJ+vGBSWAs6c5z0ste2wyE6MJJZLi0=;
 b=0Wp7xg4fOhqKM8hP9glnuGrvNw7jH+CbaPICfiNYKkDPsK8RiySU8r6a5K561gR+5dO1
 GL9b8eqkEAnTa9LEtPVGsq6MkaN/xZvpFpwpmNKGPqbwx4mdL5VXCeD3XB9WHdgSvnQk
 WNlS17J/J2SZ5pHE7eebM1ytDafW2zqfBcPAsd1qZNNginnIAFzCuisAIACceO+A3TOE
 hoEIPO3ZzzNJg2ZixxJp1gwgSo9sdTKnbRI+SAVBS08acbNxXeqvrirEYuzXcyd2uDmU
 bQkdBhUBqO8YBYcsHsfA0Id/Sz9MOTefsTkNqnRtqzD85p+KugGarH7z2RNAIVS/H/0y xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jergb8eqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Sep 2022 13:02:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E181B10003B;
 Thu,  8 Sep 2022 13:02:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DE0F4226FB0;
 Thu,  8 Sep 2022 13:02:11 +0200 (CEST)
Received: from localhost (10.75.127.117) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Thu, 8 Sep 2022
 13:02:11 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
Date: Thu, 8 Sep 2022 12:59:33 +0200
Message-ID: <20220908105934.1764482-3-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220908105934.1764482-1-alain.volmat@foss.st.com>
References: <20220908105934.1764482-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.117]
X-ClientProxiedBy: GPXDAG2NODE6.st.com (10.75.127.70) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_06,2022-09-07_02,2022-06-22_01
Cc: patrick.delaunay@foss.st.com, oleksandr.suvorov@foundries.io, hs@denx.de
Subject: [Uboot-stm32] [PATCH v2 2/3] i2c: stm32: remove unused stop
	parameter in start & reload handling
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

Functions stm32_i2c_message_start and stm32_i2c_handle_reload
both get a stop boolean indicating if the transfer should end with
a STOP or not.  However no specific handling is needed in those
functions hence remove the parameter.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/i2c/stm32f7_i2c.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
index 78d7156492..0ec67b5c12 100644
--- a/drivers/i2c/stm32f7_i2c.c
+++ b/drivers/i2c/stm32f7_i2c.c
@@ -282,7 +282,7 @@ static int stm32_i2c_check_device_busy(struct stm32_i2c_priv *i2c_priv)
 }
 
 static void stm32_i2c_message_start(struct stm32_i2c_priv *i2c_priv,
-				    struct i2c_msg *msg, bool stop)
+				    struct i2c_msg *msg)
 {
 	struct stm32_i2c_regs *regs = i2c_priv->regs;
 	u32 cr2 = readl(&regs->cr2);
@@ -325,7 +325,7 @@ static void stm32_i2c_message_start(struct stm32_i2c_priv *i2c_priv,
  */
 
 static void stm32_i2c_handle_reload(struct stm32_i2c_priv *i2c_priv,
-				    struct i2c_msg *msg, bool stop)
+				    struct i2c_msg *msg)
 {
 	struct stm32_i2c_regs *regs = i2c_priv->regs;
 	u32 cr2 = readl(&regs->cr2);
@@ -431,7 +431,7 @@ static int stm32_i2c_message_xfer(struct stm32_i2c_priv *i2c_priv,
 	/* Add errors */
 	mask |= STM32_I2C_ISR_ERRORS;
 
-	stm32_i2c_message_start(i2c_priv, msg, stop);
+	stm32_i2c_message_start(i2c_priv, msg);
 
 	while (msg->len) {
 		/*
@@ -469,7 +469,7 @@ static int stm32_i2c_message_xfer(struct stm32_i2c_priv *i2c_priv,
 			mask = msg->flags & I2C_M_RD ? STM32_I2C_ISR_RXNE :
 			       STM32_I2C_ISR_TXIS | STM32_I2C_ISR_NACKF;
 
-			stm32_i2c_handle_reload(i2c_priv, msg, stop);
+			stm32_i2c_handle_reload(i2c_priv, msg);
 		} else if (!bytes_to_rw) {
 			/* Wait until TC flag is set */
 			mask = STM32_I2C_ISR_TC;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
