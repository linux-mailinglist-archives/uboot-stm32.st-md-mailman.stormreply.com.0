Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD026520F15
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 09:51:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91FF2C0D2BE;
	Tue, 10 May 2022 07:51:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54264C0D2B8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 07:51:20 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A7OwrD001886;
 Tue, 10 May 2022 09:51:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=wECEEGahVe5/ClgyJwpqf920AE3bMbez4ZyBm+jdKeE=;
 b=ImL6hAHjlwj5YZFymCVeTZ6srM8yL5gUoiBoQmEqe8vc/FQYeoReKs1H2VcRIiMaeHB5
 cENYn3DGE3bEx4A2iDzdv1moL4WoJ2y+b1lQv4qLIf4JajdJMeBx4iZDfEuRwCgUxqi+
 9DKdpvv/x9m1YJfG3HP1oZRlyvorAANbdMbYci6eIlnJeLm9hnAloY+8NbrKug0MEvr5
 yCgEW4ZOwZngMFyFgCmzB43M+btMq0Mx/gLT8v+wGIZuIJwA8Ye3gEsC+UGGvPROj1GH
 2I+DopODYUO2MQfbrkzkZMol9GpRmqbBhesq9Im4zyZ3y4OYe4Fw6nwq/w+vg4S5UoEK 3g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwe6kpn3n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 09:51:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1E0B210002A;
 Tue, 10 May 2022 09:51:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 16C2120F6D7;
 Tue, 10 May 2022 09:51:17 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 10 May 2022 09:51:16
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 10 May 2022 09:51:10 +0200
Message-ID: <20220510095041.1.Ieec76f320c9cc6885d7b519dffddff9ad4c97b59@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220510075114.1238086-1-patrick.delaunay@foss.st.com>
References: <20220510075114.1238086-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-09_02,2022-02-23_01
Cc: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/4] clk: Add directory for STM32 clock drivers
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

Add a directory in drivers/clk to regroup the clock drivers for all
STM32 Soc with CONFIG_ARCH_STM32 (MCUs with cortex M) or
CONFIG_ARCH_STM32MP (MPUs with cortex A).

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 MAINTAINERS                            |  2 +-
 drivers/clk/Kconfig                    | 17 +----------------
 drivers/clk/Makefile                   |  5 ++---
 drivers/clk/stm32/Kconfig              | 23 +++++++++++++++++++++++
 drivers/clk/stm32/Makefile             |  7 +++++++
 drivers/clk/{ => stm32}/clk_stm32f.c   |  0
 drivers/clk/{ => stm32}/clk_stm32h7.c  |  0
 drivers/clk/{ => stm32}/clk_stm32mp1.c |  0
 8 files changed, 34 insertions(+), 20 deletions(-)
 create mode 100644 drivers/clk/stm32/Kconfig
 create mode 100644 drivers/clk/stm32/Makefile
 rename drivers/clk/{ => stm32}/clk_stm32f.c (100%)
 rename drivers/clk/{ => stm32}/clk_stm32h7.c (100%)
 rename drivers/clk/{ => stm32}/clk_stm32mp1.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 56be0bfad0..3f37edd716 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -469,7 +469,7 @@ S:	Maintained
 F:	arch/arm/mach-stm32mp/
 F:	doc/board/st/
 F:	drivers/adc/stm32-adc*
-F:	drivers/clk/clk_stm32mp1.c
+F:	drivers/clk/stm32/
 F:	drivers/gpio/stm32_gpio.c
 F:	drivers/hwspinlock/stm32_hwspinlock.c
 F:	drivers/i2c/stm32f7_i2c.c
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 6dc271f71b..98ad481d9e 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -140,22 +140,6 @@ config CLK_SCMI
 	  by a SCMI agent based on SCMI clock protocol communication
 	  with a SCMI server.
 
-config CLK_STM32F
-	bool "Enable clock driver support for STM32F family"
-	depends on CLK && (STM32F7 || STM32F4)
-	default y
-	help
-	  This clock driver adds support for RCC clock management
-	  for STM32F4 and STM32F7 SoCs.
-
-config CLK_STM32MP1
-	bool "Enable RCC clock driver for STM32MP1"
-	depends on ARCH_STM32MP && CLK
-	default y
-	help
-	  Enable the STM32 clock (RCC) driver. Enable support for
-	  manipulating STM32MP1's on-SoC clocks.
-
 config CLK_HSDK
 	bool "Enable cgu clock driver for HSDK boards"
 	depends on CLK && TARGET_HSDK
@@ -225,6 +209,7 @@ source "drivers/clk/owl/Kconfig"
 source "drivers/clk/renesas/Kconfig"
 source "drivers/clk/sunxi/Kconfig"
 source "drivers/clk/sifive/Kconfig"
+source "drivers/clk/stm32/Kconfig"
 source "drivers/clk/tegra/Kconfig"
 source "drivers/clk/ti/Kconfig"
 source "drivers/clk/uniphier/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index bb4eee5d99..09fbaf6233 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -22,6 +22,8 @@ obj-$(CONFIG_ARCH_MESON) += meson/
 obj-$(CONFIG_ARCH_MTMIPS) += mtmips/
 obj-$(CONFIG_ARCH_ROCKCHIP) += rockchip/
 obj-$(CONFIG_ARCH_SOCFPGA) += altera/
+obj-$(CONFIG_ARCH_STM32) += stm32/
+obj-$(CONFIG_ARCH_STM32MP) += stm32/
 obj-$(CONFIG_ARCH_SUNXI) += sunxi/
 obj-$(CONFIG_CLK_AT91) += at91/
 obj-$(CONFIG_CLK_BCM6345) += clk_bcm6345.o
@@ -38,8 +40,6 @@ obj-$(CONFIG_CLK_OWL) += owl/
 obj-$(CONFIG_CLK_RENESAS) += renesas/
 obj-$(CONFIG_CLK_SCMI) += clk_scmi.o
 obj-$(CONFIG_CLK_SIFIVE) += sifive/
-obj-$(CONFIG_CLK_STM32F) += clk_stm32f.o
-obj-$(CONFIG_CLK_STM32MP1) += clk_stm32mp1.o
 obj-$(CONFIG_CLK_UNIPHIER) += uniphier/
 obj-$(CONFIG_CLK_VERSACLOCK) += clk_versaclock.o
 obj-$(CONFIG_CLK_VERSAL) += clk_versal.o
@@ -52,4 +52,3 @@ obj-$(CONFIG_MACH_PIC32) += clk_pic32.o
 obj-$(CONFIG_SANDBOX_CLK_CCF) += clk_sandbox_ccf.o
 obj-$(CONFIG_SANDBOX) += clk_sandbox.o
 obj-$(CONFIG_SANDBOX) += clk_sandbox_test.o
-obj-$(CONFIG_STM32H7) += clk_stm32h7.o
diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
new file mode 100644
index 0000000000..eac3fc1e9d
--- /dev/null
+++ b/drivers/clk/stm32/Kconfig
@@ -0,0 +1,23 @@
+config CLK_STM32F
+	bool "Enable clock driver support for STM32F family"
+	depends on CLK && (STM32F7 || STM32F4)
+	default y
+	help
+	  This clock driver adds support for RCC clock management
+	  for STM32F4 and STM32F7 SoCs.
+
+config CLK_STM32H7
+	bool "Enable clock driver support for STM32H7 family"
+	depends on CLK && STM32H7
+	default y
+	help
+	  This clock driver adds support for RCC clock management
+	  for STM32H7 SoCs.
+
+config CLK_STM32MP1
+	bool "Enable RCC clock driver for STM32MP15"
+	depends on ARCH_STM32MP && CLK
+	default y if STM32MP15x
+	help
+	  Enable the STM32 clock (RCC) driver. Enable support for
+	  manipulating STM32MP15's on-SoC clocks.
diff --git a/drivers/clk/stm32/Makefile b/drivers/clk/stm32/Makefile
new file mode 100644
index 0000000000..b420eeaa4e
--- /dev/null
+++ b/drivers/clk/stm32/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Copyright (C) 2022, STMicroelectronics - All Rights Reserved
+
+obj-$(CONFIG_CLK_STM32F) += clk_stm32f.o
+obj-$(CONFIG_CLK_STM32H7) += clk_stm32h7.o
+obj-$(CONFIG_CLK_STM32MP1) += clk_stm32mp1.o
diff --git a/drivers/clk/clk_stm32f.c b/drivers/clk/stm32/clk_stm32f.c
similarity index 100%
rename from drivers/clk/clk_stm32f.c
rename to drivers/clk/stm32/clk_stm32f.c
diff --git a/drivers/clk/clk_stm32h7.c b/drivers/clk/stm32/clk_stm32h7.c
similarity index 100%
rename from drivers/clk/clk_stm32h7.c
rename to drivers/clk/stm32/clk_stm32h7.c
diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/stm32/clk_stm32mp1.c
similarity index 100%
rename from drivers/clk/clk_stm32mp1.c
rename to drivers/clk/stm32/clk_stm32mp1.c
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
