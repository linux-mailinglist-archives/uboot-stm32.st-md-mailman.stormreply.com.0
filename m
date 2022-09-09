Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9725B3CA8
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Sep 2022 18:06:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 110A1C64116;
	Fri,  9 Sep 2022 16:06:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7DA3C64112
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Sep 2022 16:06:54 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 289FRAwa028512;
 Fri, 9 Sep 2022 18:06:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=fXGwC4xVGXeke3SCpeHBZbmV4L4onareAcKwWc4T20c=;
 b=MG2+sLI5pdQkYr9m7yTVNjlmmRMVvZLJe+5yRrhDOs2gdUFNH5j2xpkKHtozBwqVt3i/
 AQWsv51iWV0iEQ5rZOX2ORh9i1hgatBXJJRFgfZwUMWlEUz6HlujIZVTAt6i5YMh1XzS
 olhwOWx5FH5M4ZpUWpvzrc4ZchLJATbWoD2vm9Sy7loElzM4AmOK2Vpr+W+T78024l3F
 5F2k6gut2d4LhC1hRozbw4WwqN2LWlg8PPpwRJX+PDMUF9b4ZUsuVNx0BOyBzUQNHTnm
 UMiIPnopm2ZXcr+BheVCkmO4z57HhKpLb1dCid1JOS9+UIMXJysYl1K3Zcso73J6j9mL 3A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jfx0p3wkf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Sep 2022 18:06:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6B651100034;
 Fri,  9 Sep 2022 18:06:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6776323BE14;
 Fri,  9 Sep 2022 18:06:50 +0200 (CEST)
Received: from localhost (10.75.127.118) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Fri, 9 Sep 2022
 18:06:50 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
Date: Fri, 9 Sep 2022 18:06:25 +0200
Message-ID: <20220909160627.1793406-2-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220909160627.1793406-1-alain.volmat@foss.st.com>
References: <20220909160627.1793406-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-09_08,2022-09-09_01,2022-06-22_01
Cc: patrick.delaunay@foss.st.com, oleksandr.suvorov@foundries.io, hs@denx.de
Subject: [Uboot-stm32] [PATCH v3 1/3] i2c: stm32: fix comment and remove
	unused AUTOEND bit
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

Comment within stm32_i2c_message_start is misleading, indicating
that AUTOEND bit is setted while it is actually cleared.
Moreover, the bit is actually never setted so there is no need
to clear it hence get rid of this bit clear and the bit macro
as well.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
 drivers/i2c/stm32f7_i2c.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
index bf2a6c9b4b..78d7156492 100644
--- a/drivers/i2c/stm32f7_i2c.c
+++ b/drivers/i2c/stm32f7_i2c.c
@@ -57,7 +57,6 @@ struct stm32_i2c_regs {
 #define STM32_I2C_CR1_PE			BIT(0)
 
 /* STM32 I2C control 2 */
-#define STM32_I2C_CR2_AUTOEND			BIT(25)
 #define STM32_I2C_CR2_RELOAD			BIT(24)
 #define STM32_I2C_CR2_NBYTES_MASK		GENMASK(23, 16)
 #define STM32_I2C_CR2_NBYTES(n)			((n & 0xff) << 16)
@@ -304,9 +303,8 @@ static void stm32_i2c_message_start(struct stm32_i2c_priv *i2c_priv,
 		cr2 |= STM32_I2C_CR2_SADD7(msg->addr);
 	}
 
-	/* Set nb bytes to transfer and reload or autoend bits */
-	cr2 &= ~(STM32_I2C_CR2_NBYTES_MASK | STM32_I2C_CR2_RELOAD |
-		 STM32_I2C_CR2_AUTOEND);
+	/* Set nb bytes to transfer and reload (if needed) */
+	cr2 &= ~(STM32_I2C_CR2_NBYTES_MASK | STM32_I2C_CR2_RELOAD);
 	if (msg->len > STM32_I2C_MAX_LEN) {
 		cr2 |= STM32_I2C_CR2_NBYTES(STM32_I2C_MAX_LEN);
 		cr2 |= STM32_I2C_CR2_RELOAD;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
