Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EBF138F3C
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 11:35:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DCFEC36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 10:35:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 032ACC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 10:35:32 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DAScHQ021535; Mon, 13 Jan 2020 11:35:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=64TG6TMPkFqmvQGjFtfnHWgNzXeUv+qxCQCzv1eo+TU=;
 b=YxJRysHeG9ZplYiChkndpldO0E1mi0be4dJvoeKCEFnruhqeanF4m6asw8RqGrXOi1F8
 hSeFz4V81fVS1GaGcJwIDft6KaXcquYU4IwX93pDeyBERjOOwx5D1fFkB65+B5oLTfu3
 tpMQAhgm+4fisf29WGhfZDnrfDqJcRC+EIKFLP+MWNvWUEg2+zy70uaxPmHmZNBgn1kI
 9iVs2HckwXgTFs1QH9pvwJsBMaSCM5VHF62EXZ8gZosX/nwA/6E9puVLBLVeiI44SwQS
 kENl1JVX+jhXgGakXp8/bgjBKUHh/Fs0zH/xGsLL6fTO0psPwoXoz2NT6kb2R8GwZCao /w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf78ryk9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 11:35:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0CB8B100039;
 Mon, 13 Jan 2020 11:35:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 01F0C2A96E8;
 Mon, 13 Jan 2020 11:35:27 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 13 Jan 2020 11:35:26 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 13 Jan 2020 11:35:07 +0100
Message-ID: <20200113103515.20879-14-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113103515.20879-1-patrick.delaunay@st.com>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_02:2020-01-13,
 2020-01-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Heiko Schocher <hs@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 13/21] gpio: add support of new GPIO
	direction flag
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

This commit manages the new dir flags that can be used in gpio
specifiers to indicate the pull-up or pull-down resistor
configuration for output gpio (GPIO_PULL_UP, GPIO_PULL_DOWN)
or the Open Drain/Open Source configuration for input gpio
(GPIO_OPEN_DRAIN, GPIO_OPEN_SOURCE).

These flags are already supported in Linux kernel in gpio lib.

This patch only parse and save the direction flags in GPIO
descriptor (desc->flags), it prepares the introduction of new ops
to manage them.
The GPIO uclass supports new GPIO flags from device-tree
(GPIO_XXX define in include/dt-bindings/gpio/gpio.h)
and translate them in the dir flags (GPIOD_XXX):
- GPIO_PULL_UP     => GPIOD_PULL_UP
- GPIO_PULL_DOWN   => GPIOD_PULL_DOWN
- GPIO_OPEN_DRAIN  => GPIOD_OPEN_DRAIN
- GPIO_OPEN_SOURCE => GPIOD_OPEN_SOURCE

This patch also adds protection in the check_dir_flags function for
new invalid configuration of the dir flags.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

This patch was part of v2 08/14
= gpio: add ops for configuration with dir flags


Changes in v3:
- Split the previous patch [PATCH v2 08/14] to help review

Changes in v2: None

 drivers/gpio/gpio-uclass.c | 30 ++++++++++++++++++++++++++++++
 include/asm-generic/gpio.h |  6 +++++-
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
index 85f0b03f81..e02ef29fed 100644
--- a/drivers/gpio/gpio-uclass.c
+++ b/drivers/gpio/gpio-uclass.c
@@ -144,6 +144,24 @@ int gpio_xlate_offs_flags(struct udevice *dev, struct gpio_desc *desc,
 	if (args->args[1] & GPIO_ACTIVE_LOW)
 		desc->flags |= GPIOD_ACTIVE_LOW;
 
+	/*
+	 * need to test 2 bits for gpio output binding:
+	 * OPEN_DRAIN (0x6) = SINGLE_ENDED (0x2) | LINE_OPEN_DRAIN (0x4)
+	 * OPEN_SOURCE (0x2) = SINGLE_ENDED (0x2) | LINE_OPEN_SOURCE (0x0)
+	 */
+	if (args->args[1] & GPIO_SINGLE_ENDED) {
+		if (args->args[1] & GPIO_LINE_OPEN_DRAIN)
+			desc->flags |= GPIOD_OPEN_DRAIN;
+		else
+			desc->flags |= GPIOD_OPEN_SOURCE;
+	}
+
+	if (args->args[1] & GPIO_PULL_UP)
+		desc->flags |= GPIOD_PULL_UP;
+
+	if (args->args[1] & GPIO_PULL_DOWN)
+		desc->flags |= GPIOD_PULL_DOWN;
+
 	return 0;
 }
 
@@ -520,6 +538,18 @@ static int check_dir_flags(ulong flags)
 		return -EINVAL;
 	}
 
+	if ((flags & GPIOD_PULL_UP) && (flags & GPIOD_PULL_DOWN)) {
+		log_debug("%s: flags 0x%lx has GPIOD_PULL_UP and GPIOD_PULL_DOWN\n",
+			  __func__, flags);
+		return -EINVAL;
+	}
+
+	if ((flags & GPIOD_OPEN_DRAIN) && (flags & GPIOD_OPEN_SOURCE)) {
+		log_debug("%s: flags 0x%lx has GPIOD_OPEN_DRAIN and GPIOD_OPEN_SOURCE\n",
+			  __func__, flags);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
index 3dd0002b0b..4f7b43f163 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -119,8 +119,12 @@ struct gpio_desc {
 	unsigned long flags;
 #define GPIOD_IS_OUT		BIT(1)	/* GPIO is an output */
 #define GPIOD_IS_IN		BIT(2)	/* GPIO is an input */
-#define GPIOD_ACTIVE_LOW	BIT(3)	/* value has active low */
+#define GPIOD_ACTIVE_LOW	BIT(3)	/* GPIO is active when value is low */
 #define GPIOD_IS_OUT_ACTIVE	BIT(4)	/* set output active */
+#define GPIOD_OPEN_DRAIN	BIT(5)	/* GPIO is open drain type */
+#define GPIOD_OPEN_SOURCE	BIT(6)	/* GPIO is open source type */
+#define GPIOD_PULL_UP		BIT(7)	/* GPIO has pull-up enabled */
+#define GPIOD_PULL_DOWN		BIT(8)	/* GPIO has pull-down enabled */
 
 	uint offset;		/* GPIO offset within the device */
 	/*
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
