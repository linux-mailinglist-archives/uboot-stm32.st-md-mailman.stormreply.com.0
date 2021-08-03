Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AEB3DEA5C
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Aug 2021 12:05:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E9F0C5A4D4;
	Tue,  3 Aug 2021 10:05:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D2DCC57B51
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Aug 2021 10:05:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 173A3KUK001201; Tue, 3 Aug 2021 12:05:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=hlewrmojSCwwvLtZwyz+Xduhv64gpKnaFygOXwZfsGM=;
 b=lrjU/E5+UmgiW7Xh89wP9UiaZTT01m/Yh7FzTvmvkW+Lis4fMvccCUHZxkWl7kMjCgLN
 bFYycrwkmrSgJY64ApvBurqfsx1Mh2QzOcdbuSL2JtKxFm5w9gPK161pUjiWQ6cxD7fV
 YPlnaLDMCP3vJTf3E4BahAh1gtZGkAMLHNWYkha5aQFtOsEWdroncx1yNKM1GoCHrOS+
 sIbdw+EiFJ8AGlRXo1TK5Egc8SvvEEABM9A8fURH83yxX4UvjXbUhfOTmXpz1Wjr7LmN
 xClfUieTFMn4Bne1p9O+DyzA0YZiv6evLLPMilvPeauuniQX/XtzrT+Nzsth4uqi2TMU nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a6fc8nerh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 12:05:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 423C6100034;
 Tue,  3 Aug 2021 12:05:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3906721BF5A;
 Tue,  3 Aug 2021 12:05:35 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 Aug 2021 12:05:34
 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 3 Aug 2021 12:05:13 +0200
Message-ID: <20210803100515.29383-6-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210803100515.29383-1-patrice.chotard@foss.st.com>
References: <20210803100515.29383-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-03_02:2021-08-03,
 2021-08-03 signatures=0
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>
Subject: [Uboot-stm32] [PATCH v1 5/7] i2c: stm32f7: fix configuration of the
	digital filter
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

From: Patrick Delaunay <patrick.delaunay@foss.st.com>

The digital filter related computation are present in the driver
however the programming of the filter within the IP is missing.
The maximum value for the DNF is wrong and should be 15 instead of 16.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/i2c/stm32f7_i2c.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
index e71a0e0aa3..7e6c65fadc 100644
--- a/drivers/i2c/stm32f7_i2c.c
+++ b/drivers/i2c/stm32f7_i2c.c
@@ -45,6 +45,8 @@ struct stm32_i2c_regs {
 
 /* STM32 I2C control 1 */
 #define STM32_I2C_CR1_ANFOFF			BIT(12)
+#define STM32_I2C_CR1_DNF_MASK			GENMASK(11, 8)
+#define STM32_I2C_CR1_DNF(n)			(((n) & 0xf) << 8)
 #define STM32_I2C_CR1_ERRIE			BIT(7)
 #define STM32_I2C_CR1_TCIE			BIT(6)
 #define STM32_I2C_CR1_STOPIE			BIT(5)
@@ -106,7 +108,7 @@ struct stm32_i2c_regs {
 #define STM32_I2C_MAX_LEN			0xff
 
 #define STM32_I2C_DNF_DEFAULT			0
-#define STM32_I2C_DNF_MAX			16
+#define STM32_I2C_DNF_MAX			15
 
 #define STM32_I2C_ANALOG_FILTER_DELAY_MIN	50	/* ns */
 #define STM32_I2C_ANALOG_FILTER_DELAY_MAX	260	/* ns */
@@ -155,7 +157,7 @@ struct stm32_i2c_spec {
  * @clock_src: I2C clock source frequency (Hz)
  * @rise_time: Rise time (ns)
  * @fall_time: Fall time (ns)
- * @dnf: Digital filter coefficient (0-16)
+ * @dnf: value of digital filter to apply
  * @analog_filter: Analog filter delay (On/Off)
  */
 struct stm32_i2c_setup {
@@ -842,6 +844,10 @@ static int stm32_i2c_hw_config(struct stm32_i2c_priv *i2c_priv)
 	else
 		setbits_le32(&regs->cr1, STM32_I2C_CR1_ANFOFF);
 
+	/* Program the Digital Filter */
+	clrsetbits_le32(&regs->cr1, STM32_I2C_CR1_DNF_MASK,
+			STM32_I2C_CR1_DNF(i2c_priv->setup.dnf));
+
 	setbits_le32(&regs->cr1, STM32_I2C_CR1_PE);
 
 	return 0;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
