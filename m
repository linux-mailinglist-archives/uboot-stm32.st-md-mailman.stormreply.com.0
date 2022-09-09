Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 404505B3CA7
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Sep 2022 18:06:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07F9EC64112;
	Fri,  9 Sep 2022 16:06:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDADEC6410E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Sep 2022 16:06:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 289FZ7UF031498;
 Fri, 9 Sep 2022 18:06:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=JvS1T+TXc7kGPJzYsXxGcVEBJpNOfjc7Thici1ONimQ=;
 b=Q8uyOvF6aJYJ+u5jfLS9AGyUyYVlC2FtudiTfnbXolhpSn8B6OR3d4wOoRNb86mGKmXP
 nCbgbw/3AutVvxsnhuMYEFIGOUHh2Q2ZITjSIgGec/bFvm6GPbqIJ72TdwIdCfF/27+f
 dwAFqOvbVBmr4Eu/P7k8YI3vum6ghF8YoSxk008l4J3X8WpeigPj3Q8bo7xYrJ5qZE8P
 j6QrebncYkzi5dzNfgBY7IfOI1HPjTUKKcFe998M6vGYPR6sxVpVErsUwV8en6gta5u+
 rOscEFsJJjEr5VkC7VlJzpO014HKeQwde15O4P94l7r7354kbNSW1VZop7lTEggg/epC wA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jergbj6k3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Sep 2022 18:06:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B5CA4100038;
 Fri,  9 Sep 2022 18:06:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B0DDB23BE14;
 Fri,  9 Sep 2022 18:06:50 +0200 (CEST)
Received: from localhost (10.75.127.46) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Fri, 9 Sep 2022
 18:06:50 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
Date: Fri, 9 Sep 2022 18:06:26 +0200
Message-ID: <20220909160627.1793406-3-alain.volmat@foss.st.com>
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
Subject: [Uboot-stm32] [PATCH v3 2/3] i2c: stm32: remove unused stop
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
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
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
