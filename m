Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDB1437C80
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Oct 2021 20:12:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9654CC5C85A;
	Fri, 22 Oct 2021 18:12:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28398C57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Oct 2021 18:12:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19MFLrt5027136; 
 Fri, 22 Oct 2021 20:12:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=sv37P0KRJwVXHes+KqDl3tl3KWt2s93017Cnnn9rSIA=;
 b=Z+NCt3L5TNzYB03ZKHOCzk91WLdQ3trLJuAzkvpEMfWsC9YeofdlF1MPJg4aja4wsz1R
 KeTWNecXf1HV4mPB315zCqqrT/TEFRR6o4JsyGgBsXjs2yCh3mu/SccRoxodYa3ncMo9
 wVarRRlHuM5XT4Nuh3VHFxYEIePv9IVUe+b4+8th3oa3w4vibwFvTdow/8KVFNI7bb2K
 0M6lLjNGW/pN5Fxx3dImzwB9rVqhRNJTWceLByJRs3OIvkpjVQ6JpwvdH9uqXOkyFVbq
 tkFBLNY+ucJuE+lfa4A6dUeX7TSXQHXMpwHGurfip1Riu4FB0QcGLlimA2+7qJ3OV0eH gQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3butka2tvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Oct 2021 20:12:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C327810002A;
 Fri, 22 Oct 2021 20:12:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A5596248EEF;
 Fri, 22 Oct 2021 20:12:40 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 22 Oct 2021 20:12:40
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 22 Oct 2021 20:12:34 +0200
Message-ID: <20211022201136.1.I9077efa33ed992563301acb5a5534326a3f3d289@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-22_04,2021-10-22_01,2020-04-07_01
Cc: Bharat Gooty <bharat.gooty@broadcom.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH] gpio: stm32: create include file for driver
	private data
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

The stm32 gpio driver private data are not needed in arch include files,
they are not used by code except for stm32 gpio and pincontrol drivers,
using the same IP; the defines for this IP is moved in a new file
"stm32_gpio_priv.h" in driver/gpio.

This patch avoids to have duplicated file gpio.h for each SOC
in MPU directory mach-stm32mp and in each MCU directory arch-stm32*
and allows to remove CONFIG_GPIO_EXTRA_HEADER for all STM32.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/Kconfig                              |  2 -
 arch/arm/include/asm/arch-stm32f4/gpio.h      | 15 ----
 arch/arm/include/asm/arch-stm32f7/gpio.h      | 12 ---
 arch/arm/include/asm/arch-stm32h7/gpio.h      | 12 ---
 arch/arm/mach-stm32mp/include/mach/gpio.h     | 87 -------------------
 board/st/stm32f746-disco/stm32f746-disco.c    |  1 -
 drivers/gpio/stm32_gpio.c                     |  3 +-
 .../gpio.h => drivers/gpio/stm32_gpio_priv.h  |  6 +-
 drivers/pinctrl/pinctrl_stm32.c               |  3 +-
 drivers/video/dw_mipi_dsi.c                   |  1 -
 drivers/video/stm32/stm32_dsi.c               |  1 -
 drivers/video/stm32/stm32_ltdc.c              |  1 -
 12 files changed, 7 insertions(+), 137 deletions(-)
 delete mode 100644 arch/arm/include/asm/arch-stm32f4/gpio.h
 delete mode 100644 arch/arm/include/asm/arch-stm32f7/gpio.h
 delete mode 100644 arch/arm/include/asm/arch-stm32h7/gpio.h
 delete mode 100644 arch/arm/mach-stm32mp/include/mach/gpio.h
 rename arch/arm/include/asm/arch-stm32/gpio.h => drivers/gpio/stm32_gpio_priv.h (94%)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 504abca0b7..0f33f9aa9a 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1789,7 +1789,6 @@ config ARCH_STM32
 	select CPU_V7M
 	select DM
 	select DM_SERIAL
-	select GPIO_EXTRA_HEADER
 	imply CMD_DM
 
 config ARCH_STI
@@ -1815,7 +1814,6 @@ config ARCH_STM32MP
 	select DM_GPIO
 	select DM_RESET
 	select DM_SERIAL
-	select GPIO_EXTRA_HEADER
 	select MISC
 	select OF_CONTROL
 	select OF_LIBFDT
diff --git a/arch/arm/include/asm/arch-stm32f4/gpio.h b/arch/arm/include/asm/arch-stm32f4/gpio.h
deleted file mode 100644
index 490f686a85..0000000000
--- a/arch/arm/include/asm/arch-stm32f4/gpio.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * (C) Copyright 2011
- * Yuri Tikhonov, Emcraft Systems, yur@emcraft.com
- *
- * (C) Copyright 2015
- * Kamil Lulko, <kamil.lulko@gmail.com>
- */
-
-#ifndef _STM32_GPIO_H_
-#define _STM32_GPIO_H_
-
-#include <asm/arch-stm32/gpio.h>
-
-#endif /* _STM32_GPIO_H_ */
diff --git a/arch/arm/include/asm/arch-stm32f7/gpio.h b/arch/arm/include/asm/arch-stm32f7/gpio.h
deleted file mode 100644
index 21f4e0fd27..0000000000
--- a/arch/arm/include/asm/arch-stm32f7/gpio.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * Copyright (C) 2016, STMicroelectronics - All Rights Reserved
- * Author(s): Vikas Manocha, <vikas.manocha@st.com> for STMicroelectronics.
- */
-
-#ifndef _STM32_GPIO_H_
-#define _STM32_GPIO_H_
-
-#include <asm/arch-stm32/gpio.h>
-
-#endif /* _STM32_GPIO_H_ */
diff --git a/arch/arm/include/asm/arch-stm32h7/gpio.h b/arch/arm/include/asm/arch-stm32h7/gpio.h
deleted file mode 100644
index 4f57f175ff..0000000000
--- a/arch/arm/include/asm/arch-stm32h7/gpio.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
- * Author(s): Patrice Chotard, <patrice.chotard@foss.st.com> for STMicroelectronics.
- */
-
-#ifndef _STM32_GPIO_H_
-#define _STM32_GPIO_H_
-
-#include <asm/arch-stm32/gpio.h>
-
-#endif /* _STM32_GPIO_H_ */
diff --git a/arch/arm/mach-stm32mp/include/mach/gpio.h b/arch/arm/mach-stm32mp/include/mach/gpio.h
deleted file mode 100644
index 7a0f293519..0000000000
--- a/arch/arm/mach-stm32mp/include/mach/gpio.h
+++ /dev/null
@@ -1,87 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * (C) Copyright 2016
- * Vikas Manocha, <vikas.manocha@st.com>
- */
-
-#ifndef _STM32_GPIO_H_
-#define _STM32_GPIO_H_
-#include <asm/gpio.h>
-
-enum stm32_gpio_mode {
-	STM32_GPIO_MODE_IN = 0,
-	STM32_GPIO_MODE_OUT,
-	STM32_GPIO_MODE_AF,
-	STM32_GPIO_MODE_AN
-};
-
-enum stm32_gpio_otype {
-	STM32_GPIO_OTYPE_PP = 0,
-	STM32_GPIO_OTYPE_OD
-};
-
-enum stm32_gpio_speed {
-	STM32_GPIO_SPEED_2M = 0,
-	STM32_GPIO_SPEED_25M,
-	STM32_GPIO_SPEED_50M,
-	STM32_GPIO_SPEED_100M
-};
-
-enum stm32_gpio_pupd {
-	STM32_GPIO_PUPD_NO = 0,
-	STM32_GPIO_PUPD_UP,
-	STM32_GPIO_PUPD_DOWN
-};
-
-enum stm32_gpio_af {
-	STM32_GPIO_AF0 = 0,
-	STM32_GPIO_AF1,
-	STM32_GPIO_AF2,
-	STM32_GPIO_AF3,
-	STM32_GPIO_AF4,
-	STM32_GPIO_AF5,
-	STM32_GPIO_AF6,
-	STM32_GPIO_AF7,
-	STM32_GPIO_AF8,
-	STM32_GPIO_AF9,
-	STM32_GPIO_AF10,
-	STM32_GPIO_AF11,
-	STM32_GPIO_AF12,
-	STM32_GPIO_AF13,
-	STM32_GPIO_AF14,
-	STM32_GPIO_AF15
-};
-
-struct stm32_gpio_dsc {
-	u8	port;
-	u8	pin;
-};
-
-struct stm32_gpio_ctl {
-	enum stm32_gpio_mode	mode;
-	enum stm32_gpio_otype	otype;
-	enum stm32_gpio_speed	speed;
-	enum stm32_gpio_pupd	pupd;
-	enum stm32_gpio_af	af;
-};
-
-struct stm32_gpio_regs {
-	u32 moder;	/* GPIO port mode */
-	u32 otyper;	/* GPIO port output type */
-	u32 ospeedr;	/* GPIO port output speed */
-	u32 pupdr;	/* GPIO port pull-up/pull-down */
-	u32 idr;	/* GPIO port input data */
-	u32 odr;	/* GPIO port output data */
-	u32 bsrr;	/* GPIO port bit set/reset */
-	u32 lckr;	/* GPIO port configuration lock */
-	u32 afr[2];	/* GPIO alternate function */
-};
-
-struct stm32_gpio_priv {
-	struct stm32_gpio_regs *regs;
-	unsigned int gpio_range;
-};
-
-int stm32_offset_to_index(struct udevice *dev, unsigned int offset);
-
-#endif /* _STM32_GPIO_H_ */
diff --git a/board/st/stm32f746-disco/stm32f746-disco.c b/board/st/stm32f746-disco/stm32f746-disco.c
index 08c2102c4f..95d83e73ee 100644
--- a/board/st/stm32f746-disco/stm32f746-disco.c
+++ b/board/st/stm32f746-disco/stm32f746-disco.c
@@ -21,7 +21,6 @@
 #include <asm/io.h>
 #include <asm/armv7m.h>
 #include <asm/arch/stm32.h>
-#include <asm/arch/gpio.h>
 #include <asm/arch/syscfg.h>
 #include <asm/gpio.h>
 #include <linux/delay.h>
diff --git a/drivers/gpio/stm32_gpio.c b/drivers/gpio/stm32_gpio.c
index 125c237551..8667ed3835 100644
--- a/drivers/gpio/stm32_gpio.c
+++ b/drivers/gpio/stm32_gpio.c
@@ -11,7 +11,6 @@
 #include <dm.h>
 #include <fdtdec.h>
 #include <log.h>
-#include <asm/arch/gpio.h>
 #include <asm/arch/stm32.h>
 #include <asm/gpio.h>
 #include <asm/io.h>
@@ -20,6 +19,8 @@
 #include <linux/errno.h>
 #include <linux/io.h>
 
+#include "stm32_gpio_priv.h"
+
 #define STM32_GPIOS_PER_BANK		16
 
 #define MODE_BITS(gpio_pin)		((gpio_pin) * 2)
diff --git a/arch/arm/include/asm/arch-stm32/gpio.h b/drivers/gpio/stm32_gpio_priv.h
similarity index 94%
rename from arch/arm/include/asm/arch-stm32/gpio.h
rename to drivers/gpio/stm32_gpio_priv.h
index 233ce278a7..d3d8f2ed5d 100644
--- a/arch/arm/include/asm/arch-stm32/gpio.h
+++ b/drivers/gpio/stm32_gpio_priv.h
@@ -4,8 +4,8 @@
  * Author(s): Vikas Manocha, <vikas.manocha@st.com> for STMicroelectronics.
  */
 
-#ifndef _GPIO_H_
-#define _GPIO_H_
+#ifndef _STM32_GPIO_PRIV_H_
+#define _STM32_GPIO_PRIV_H_
 
 enum stm32_gpio_mode {
 	STM32_GPIO_MODE_IN = 0,
@@ -83,4 +83,4 @@ struct stm32_gpio_priv {
 
 int stm32_offset_to_index(struct udevice *dev, unsigned int offset);
 
-#endif /* _GPIO_H_ */
+#endif /* _STM32_GPIO_PRIV_H_ */
diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
index 6c98538f56..5729799b12 100644
--- a/drivers/pinctrl/pinctrl_stm32.c
+++ b/drivers/pinctrl/pinctrl_stm32.c
@@ -10,7 +10,6 @@
 #include <hwspinlock.h>
 #include <log.h>
 #include <malloc.h>
-#include <asm/arch/gpio.h>
 #include <asm/gpio.h>
 #include <asm/io.h>
 #include <dm/device_compat.h>
@@ -20,6 +19,8 @@
 #include <linux/err.h>
 #include <linux/libfdt.h>
 
+#include "../gpio/stm32_gpio_priv.h"
+
 #define MAX_PINS_ONE_IP			70
 #define MODE_BITS_MASK			3
 #define OSPEED_MASK			3
diff --git a/drivers/video/dw_mipi_dsi.c b/drivers/video/dw_mipi_dsi.c
index 9ae09eec12..a5b38acabd 100644
--- a/drivers/video/dw_mipi_dsi.c
+++ b/drivers/video/dw_mipi_dsi.c
@@ -17,7 +17,6 @@
 #include <panel.h>
 #include <video.h>
 #include <asm/io.h>
-#include <asm/arch/gpio.h>
 #include <dm/device-internal.h>
 #include <dm/device_compat.h>
 #include <linux/bitops.h>
diff --git a/drivers/video/stm32/stm32_dsi.c b/drivers/video/stm32/stm32_dsi.c
index 4027e978c8..134abd93e1 100644
--- a/drivers/video/stm32/stm32_dsi.c
+++ b/drivers/video/stm32/stm32_dsi.c
@@ -21,7 +21,6 @@
 #include <video.h>
 #include <video_bridge.h>
 #include <asm/io.h>
-#include <asm/arch/gpio.h>
 #include <dm/device-internal.h>
 #include <dm/device_compat.h>
 #include <dm/lists.h>
diff --git a/drivers/video/stm32/stm32_ltdc.c b/drivers/video/stm32/stm32_ltdc.c
index f55a39498e..65c882d9f1 100644
--- a/drivers/video/stm32/stm32_ltdc.c
+++ b/drivers/video/stm32/stm32_ltdc.c
@@ -17,7 +17,6 @@
 #include <video.h>
 #include <video_bridge.h>
 #include <asm/io.h>
-#include <asm/arch/gpio.h>
 #include <dm/device-internal.h>
 #include <dm/device_compat.h>
 #include <linux/bitops.h>
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
