Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AA6520F14
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 09:51:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86AB7C0D2BC;
	Tue, 10 May 2022 07:51:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAACDC0D2B8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 07:51:19 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A7J9Jl015065;
 Tue, 10 May 2022 09:51:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=1VXQzM3YeBEhPbclNY4HcTc95qQUbSSCzH3NOJATsEc=;
 b=3/kIaxLvuxmUo5VuDdlOgvnxFLxWbtBVK9v5+sB+tra09OddwmY3bM+gmqY7y4VF9wSc
 wsN0caP5rulQsx9goy5/JxqT4WS9rqIzfUtXWBzmo6M4V8hBJ0IaPu/CcQD0E9D1HQhk
 pBGt7zvOCY5qxDIf7ZA6mfCmlLXSlBFsfvmdieR8DHnMfo2EpTjeM/VNowUoVP83sHCT
 tKo2o1/2rrWKnxb8SmWjpajeZyiV2WFKsvg3hJqGUIV6aCxzYsS3WzbRx3wG6ihM+Tnn
 TBGP2EOZAryhhXe1FudiZwFWnfwSQXAgv9yNDDPV97wNXLlmHze70EZRl+SCY70hw7Gg 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwg40x9ja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 09:51:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CFD6410003A;
 Tue, 10 May 2022 09:51:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C6B5A20FA28;
 Tue, 10 May 2022 09:51:17 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 10 May 2022 09:51:17
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 10 May 2022 09:51:11 +0200
Message-ID: <20220510095041.2.I98b0b23318f39ef6411b8f96c05f5b11b4cf5de7@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220510075114.1238086-1-patrick.delaunay@foss.st.com>
References: <20220510075114.1238086-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-09_02,2022-02-23_01
Cc: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 2/4] clk: stm32mp13: add a STM32MP13 RCC clock
	driver
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

Introduce a minimal STM32MP13 RCC driver only to allow bind of RCC MISC
driver.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/clk/stm32/Kconfig         |  8 ++++++++
 drivers/clk/stm32/Makefile        |  1 +
 drivers/clk/stm32/clk-stm32mp13.c | 21 +++++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 drivers/clk/stm32/clk-stm32mp13.c

diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
index eac3fc1e9d..7444164b81 100644
--- a/drivers/clk/stm32/Kconfig
+++ b/drivers/clk/stm32/Kconfig
@@ -21,3 +21,11 @@ config CLK_STM32MP1
 	help
 	  Enable the STM32 clock (RCC) driver. Enable support for
 	  manipulating STM32MP15's on-SoC clocks.
+
+config CLK_STM32MP13
+	bool "Enable RCC clock driver for STM32MP13"
+	depends on ARCH_STM32MP && CLK
+	default y if STM32MP13x
+	help
+	  Enable the STM32 clock (RCC) driver. Enable support for
+	  manipulating STM32MP13's on-SoC clocks.
diff --git a/drivers/clk/stm32/Makefile b/drivers/clk/stm32/Makefile
index b420eeaa4e..feeb796f76 100644
--- a/drivers/clk/stm32/Makefile
+++ b/drivers/clk/stm32/Makefile
@@ -5,3 +5,4 @@
 obj-$(CONFIG_CLK_STM32F) += clk_stm32f.o
 obj-$(CONFIG_CLK_STM32H7) += clk_stm32h7.o
 obj-$(CONFIG_CLK_STM32MP1) += clk_stm32mp1.o
+obj-$(CONFIG_CLK_STM32MP13) += clk-stm32mp13.o
\ No newline at end of file
diff --git a/drivers/clk/stm32/clk-stm32mp13.c b/drivers/clk/stm32/clk-stm32mp13.c
new file mode 100644
index 0000000000..afd116361b
--- /dev/null
+++ b/drivers/clk/stm32/clk-stm32mp13.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
+ * Author: Gabriel Fernandez <gabriel.fernandez@st.com> for STMicroelectronics.
+ */
+
+#define LOG_CATEGORY UCLASS_CLK
+
+#include <common.h>
+#include <dm.h>
+
+static int stm32mp1_clk_probe(struct udevice *dev)
+{
+	return -EINVAL;
+}
+
+U_BOOT_DRIVER(stm32mp1_clock) = {
+	.name = "stm32mp13_clk",
+	.id = UCLASS_CLK,
+	.probe = stm32mp1_clk_probe,
+};
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
