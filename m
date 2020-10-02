Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF70281207
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Oct 2020 14:09:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 305A4C3FAFF;
	Fri,  2 Oct 2020 12:09:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C6A2C32EA8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 12:09:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 092C34Xw019127; Fri, 2 Oct 2020 14:09:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=quOylH9BjLCBgjvd4PmTi8SfF2PiTbWHJoHKwYyXtMo=;
 b=geCU+nOH0L91ezOn4eYwUeB5VmCPWJczrqY6LzHtfRHa9tjfDI+tOG7ta8vu2lCBSlS0
 kF9BIiMzbGsKBdrzRx1Y2dmhnMP5ziL+7tRs/q7t8/OnbqpmbeB2ukTBuAZxAKpaB0tO
 nuqelUJc8SgzdFsb4LxUpAOuvdk9qXLiIok73ESheWmL10XloPzjYhQSy+n9ngpV21hd
 +BxnsJ5BF4kIe32fuocoj46QhyGSgANwt6StHe+4/hjtCQf7VyGJhOYjv2fzik4oCZyB
 rD2S9zb8tT0t+n5jb8SiGFyQPMOSNyvJ+bAi9tkwgl02bcDbdN/JOpJhR2FIoKYWReCm Lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33svhf35dw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Oct 2020 14:09:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1C780100034;
 Fri,  2 Oct 2020 14:09:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 099582BE220;
 Fri,  2 Oct 2020 14:09:37 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 2 Oct 2020 14:09:13 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 2 Oct 2020 14:08:54 +0200
Message-ID: <20201002120854.22557-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-02_06:2020-10-02,
 2020-10-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] arm: stm32: cleanup arch gpio.h
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

Cosmetic update of gpio.h:
- remove enumerate: stm32_gpio_port, stm32_gpio_pin
  because STM32_GPIO_XXX values are unused
- move STM32_GPIOS_PER_BANK in stm32_gpio.c
  as its value is IP dependent and not arch dependent

No functional change as number of banks and number of gpio by banks
is managed by device tree since since DM migration and
commit 8f651ca60ba1 ("pinctrl: stm32: Add get_pins_count() ops").

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/include/asm/arch-stm32/gpio.h    | 37 ++---------------------
 arch/arm/mach-stm32mp/include/mach/gpio.h | 37 ++---------------------
 drivers/gpio/stm32_gpio.c                 |  2 ++
 3 files changed, 6 insertions(+), 70 deletions(-)

diff --git a/arch/arm/include/asm/arch-stm32/gpio.h b/arch/arm/include/asm/arch-stm32/gpio.h
index 570e80a6ba..233ce278a7 100644
--- a/arch/arm/include/asm/arch-stm32/gpio.h
+++ b/arch/arm/include/asm/arch-stm32/gpio.h
@@ -7,39 +7,6 @@
 #ifndef _GPIO_H_
 #define _GPIO_H_
 
-#define STM32_GPIOS_PER_BANK		16
-
-enum stm32_gpio_port {
-	STM32_GPIO_PORT_A = 0,
-	STM32_GPIO_PORT_B,
-	STM32_GPIO_PORT_C,
-	STM32_GPIO_PORT_D,
-	STM32_GPIO_PORT_E,
-	STM32_GPIO_PORT_F,
-	STM32_GPIO_PORT_G,
-	STM32_GPIO_PORT_H,
-	STM32_GPIO_PORT_I
-};
-
-enum stm32_gpio_pin {
-	STM32_GPIO_PIN_0 = 0,
-	STM32_GPIO_PIN_1,
-	STM32_GPIO_PIN_2,
-	STM32_GPIO_PIN_3,
-	STM32_GPIO_PIN_4,
-	STM32_GPIO_PIN_5,
-	STM32_GPIO_PIN_6,
-	STM32_GPIO_PIN_7,
-	STM32_GPIO_PIN_8,
-	STM32_GPIO_PIN_9,
-	STM32_GPIO_PIN_10,
-	STM32_GPIO_PIN_11,
-	STM32_GPIO_PIN_12,
-	STM32_GPIO_PIN_13,
-	STM32_GPIO_PIN_14,
-	STM32_GPIO_PIN_15
-};
-
 enum stm32_gpio_mode {
 	STM32_GPIO_MODE_IN = 0,
 	STM32_GPIO_MODE_OUT,
@@ -85,8 +52,8 @@ enum stm32_gpio_af {
 };
 
 struct stm32_gpio_dsc {
-	enum stm32_gpio_port	port;
-	enum stm32_gpio_pin	pin;
+	u8	port;
+	u8	pin;
 };
 
 struct stm32_gpio_ctl {
diff --git a/arch/arm/mach-stm32mp/include/mach/gpio.h b/arch/arm/mach-stm32mp/include/mach/gpio.h
index 5ca76d21ff..7a0f293519 100644
--- a/arch/arm/mach-stm32mp/include/mach/gpio.h
+++ b/arch/arm/mach-stm32mp/include/mach/gpio.h
@@ -8,39 +8,6 @@
 #define _STM32_GPIO_H_
 #include <asm/gpio.h>
 
-#define STM32_GPIOS_PER_BANK		16
-
-enum stm32_gpio_port {
-	STM32_GPIO_PORT_A = 0,
-	STM32_GPIO_PORT_B,
-	STM32_GPIO_PORT_C,
-	STM32_GPIO_PORT_D,
-	STM32_GPIO_PORT_E,
-	STM32_GPIO_PORT_F,
-	STM32_GPIO_PORT_G,
-	STM32_GPIO_PORT_H,
-	STM32_GPIO_PORT_I
-};
-
-enum stm32_gpio_pin {
-	STM32_GPIO_PIN_0 = 0,
-	STM32_GPIO_PIN_1,
-	STM32_GPIO_PIN_2,
-	STM32_GPIO_PIN_3,
-	STM32_GPIO_PIN_4,
-	STM32_GPIO_PIN_5,
-	STM32_GPIO_PIN_6,
-	STM32_GPIO_PIN_7,
-	STM32_GPIO_PIN_8,
-	STM32_GPIO_PIN_9,
-	STM32_GPIO_PIN_10,
-	STM32_GPIO_PIN_11,
-	STM32_GPIO_PIN_12,
-	STM32_GPIO_PIN_13,
-	STM32_GPIO_PIN_14,
-	STM32_GPIO_PIN_15
-};
-
 enum stm32_gpio_mode {
 	STM32_GPIO_MODE_IN = 0,
 	STM32_GPIO_MODE_OUT,
@@ -86,8 +53,8 @@ enum stm32_gpio_af {
 };
 
 struct stm32_gpio_dsc {
-	enum stm32_gpio_port	port;
-	enum stm32_gpio_pin	pin;
+	u8	port;
+	u8	pin;
 };
 
 struct stm32_gpio_ctl {
diff --git a/drivers/gpio/stm32_gpio.c b/drivers/gpio/stm32_gpio.c
index 5bff27f75b..9ea2a03f15 100644
--- a/drivers/gpio/stm32_gpio.c
+++ b/drivers/gpio/stm32_gpio.c
@@ -18,6 +18,8 @@
 #include <linux/errno.h>
 #include <linux/io.h>
 
+#define STM32_GPIOS_PER_BANK		16
+
 #define MODE_BITS(gpio_pin)		((gpio_pin) * 2)
 #define MODE_BITS_MASK			3
 #define BSRR_BIT(gpio_pin, value)	BIT((gpio_pin) + (value ? 0 : 16))
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
