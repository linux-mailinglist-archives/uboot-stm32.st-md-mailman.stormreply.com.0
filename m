Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF58138F39
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 11:35:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7B26C36B0C
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 10:35:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EE86C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 10:35:31 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DASZJK005619; Mon, 13 Jan 2020 11:35:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=TFBk+bYD0fvxnwUKNx0Qqa+fLdSk1mNmn/N+xfv//l4=;
 b=T0w2OiY4cWg+Ogyq+4aJAlBfwJ3z6pcQyRmxpr/kisd94mP+zgZ5iGIFN7dKRrDCI04e
 vFSNFlKDCwglZqLp0xPBTj1aDwfah2AIkHP9U1Mdh2OKSlrRwmZNG+AfC54HerFO+4Ak
 /fLED/zs+3svXi9sGGel9yDd4Uh+wpSdGFGD77EF122mPQvn36ywuo8U98oKP1bsCq1c
 safXi0Cs9cpitq8nXz3Y7sqUQ8d8Y4KUkbNcWDhPkUZm+fwLcwg8jpfBIa3jfp4V8DtA
 0WS5xho0PnX89mu99LbCuZr7p00vPJM5FguFmIp9i9v+qvFwd/qxdqdU6JYOR8+LrxyQ DA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf77aqqjs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 11:35:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9856910002A;
 Mon, 13 Jan 2020 11:35:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8ED532A96E8;
 Mon, 13 Jan 2020 11:35:25 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 13 Jan 2020 11:35:25 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 13 Jan 2020 11:35:05 +0100
Message-ID: <20200113103515.20879-12-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113103515.20879-1-patrick.delaunay@st.com>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_02:2020-01-13,
 2020-01-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Heiko Schocher <hs@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 11/21] gpio: add helper GPIOD_FLAGS_OUTPUT
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

Add a macro to provide the GPIO output value according
the dir flags content.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

This patch was part of v2 08/14
= gpio: add ops for configuration with dir flags


Changes in v3:
- Split the previous patch [PATCH v2 08/14] to help review

Changes in v2: None

 drivers/gpio/gpio-uclass.c | 9 +++------
 include/asm-generic/gpio.h | 6 ++++++
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
index 62462dffa5..1d16d4acf9 100644
--- a/drivers/gpio/gpio-uclass.c
+++ b/drivers/gpio/gpio-uclass.c
@@ -541,12 +541,9 @@ static int _dm_gpio_set_dir_flags(struct gpio_desc *desc, ulong flags)
 	}
 
 	if (flags & GPIOD_IS_OUT) {
-		int value = flags & GPIOD_IS_OUT_ACTIVE ? 1 : 0;
-
-		if (flags & GPIOD_ACTIVE_LOW)
-			value = !value;
-		ret = ops->direction_output(dev, desc->offset, value);
-	} else  if (flags & GPIOD_IS_IN) {
+		ret = ops->direction_output(dev, desc->offset,
+					    GPIOD_FLAGS_OUTPUT(flags));
+	} else if (flags & GPIOD_IS_IN) {
 		ret = ops->direction_input(dev, desc->offset);
 	}
 
diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
index 454578c8d2..111319f41f 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -129,6 +129,12 @@ struct gpio_desc {
 	 */
 };
 
+/* helper to compute the value of the gpio output */
+#define GPIOD_FLAGS_OUTPUT_MASK (GPIOD_ACTIVE_LOW | GPIOD_IS_OUT_ACTIVE)
+#define GPIOD_FLAGS_OUTPUT(flags) \
+	(((((flags) & GPIOD_FLAGS_OUTPUT_MASK) == GPIOD_IS_OUT_ACTIVE) || \
+	  (((flags) & GPIOD_FLAGS_OUTPUT_MASK) == GPIOD_ACTIVE_LOW)))
+
 /**
  * dm_gpio_is_valid() - Check if a GPIO is valid
  *
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
