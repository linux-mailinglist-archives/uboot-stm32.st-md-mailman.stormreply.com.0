Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF36A5B176B
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Sep 2022 10:44:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 496C7C640FE;
	Thu,  8 Sep 2022 08:44:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2798AC63327
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Sep 2022 08:07:34 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28811m2L016273;
 Thu, 8 Sep 2022 10:07:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=l5LaYkJF7+LnkHJ+vGBSWAs6c5z0ste2wyE6MJJZLi0=;
 b=N+TL6A7zsjTqT5/qT2HJIycSL3Vd5uH3hbFrdHyxTagp1cvqvHagog+SbHYlCSHp/kzw
 y/DX6nV6vPeh2wgCKspVFL7N+muICLtRP+afewj00P2vhcGxwCqyWP/gHGACUIYSPKCb
 d+YcwghR0+1LnPhlHWb7Siwa9CXiA0PVAII/AScff/RU4blAk4mb5DIgSvyc11eL+r+7
 2RMyFVl908poDjuVYmjtvCKoENFTGwURHwnwSDnjNp2VjQ5tLpQaTYzy9Y45Ag7NT1nf
 qKI/jCxjLGXhb8Fcr31l5h4D1l4PF4wsjZvK6GHgzoWDoNg3x/wtk7zrFd1RgIKKL2bv 1w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jbx91uw0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Sep 2022 10:07:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C7FD9100039;
 Thu,  8 Sep 2022 10:07:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C300B2194CD;
 Thu,  8 Sep 2022 10:07:30 +0200 (CEST)
Received: from localhost (10.75.127.47) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Thu, 8 Sep 2022
 10:07:30 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
Date: Thu, 8 Sep 2022 10:06:26 +0200
Message-ID: <20220908080627.1762034-3-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220908080627.1762034-1-alain.volmat@foss.st.com>
References: <20220908080627.1762034-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_06,2022-09-07_02,2022-06-22_01
X-Mailman-Approved-At: Thu, 08 Sep 2022 08:44:19 +0000
Cc: patrick.delaunay@foss.st.com, oleksandr.suvorov@foundries.io, hs@denx.de
Subject: [Uboot-stm32] [PATCH 2/3] i2c: stm32: remove unused stop parameter
	in start & reload handling
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
