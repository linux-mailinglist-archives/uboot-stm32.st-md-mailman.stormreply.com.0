Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA435B567C
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Sep 2022 10:42:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FF3CC6410F;
	Mon, 12 Sep 2022 08:42:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62A9EC03FD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Sep 2022 08:42:14 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C6GpVe016989;
 Mon, 12 Sep 2022 10:42:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=fXGwC4xVGXeke3SCpeHBZbmV4L4onareAcKwWc4T20c=;
 b=MUAc4m1P9S1q5cdtlO2lqtwgI+inF/8mwZtIH1726jzdvJZCix1sIVCEVHi804v3STJg
 8cO367BJUxF1E/5Hg+cUWNZ/qua9GB3cYbab52mKUZ9WOjy0MktHoAKFX7/dR5cSEJPV
 1F5cTzyuYBfMN8QJtNkgdk8Vy/XtSCCDsk9WBI237tjJUkZPb6JbOQ5qIoRom8cr7uED
 1+2jxEz/uS0S72hjqzieBia8SLsNsoWc8YKILvCDtsJWPdxoP3yP/QVLRhJH/PXD73nV
 fln6mHyeEW4TOr+aDbl4vQjzK5NQgAVgr4FQeGQgxeEMWYWKbmYgTJ92nXPyHV3OHiDj mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jgjxnrmg4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 10:42:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7D3BC100034;
 Mon, 12 Sep 2022 10:42:12 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 78881217B9F;
 Mon, 12 Sep 2022 10:42:12 +0200 (CEST)
Received: from localhost (10.75.127.117) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 12 Sep
 2022 10:42:12 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
Date: Mon, 12 Sep 2022 10:41:58 +0200
Message-ID: <20220912084201.1826979-2-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220912084201.1826979-1-alain.volmat@foss.st.com>
References: <20220912084201.1826979-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.117]
X-ClientProxiedBy: GPXDAG2NODE6.st.com (10.75.127.70) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_04,2022-09-09_01,2022-06-22_01
Cc: patrick.delaunay@foss.st.com, oleksandr.suvorov@foundries.io, hs@denx.de
Subject: [Uboot-stm32] [PATCH v4 1/4] i2c: stm32: fix comment and remove
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
