Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1552B138F31
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 11:35:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFA86C36B10
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 10:35:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D006FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 10:35:22 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DASfRB024499; Mon, 13 Jan 2020 11:35:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=JunwWb6UYjPLmivIEWJSr6JFGpq+tD/7AGSdtWpzzj0=;
 b=bQDwtYMTkkBjdbo0huJF96+BlSyt5sLf52w9W8uiKBzAjTkt+cZ2QCcahuCjcWinpI/G
 aV0bifLj/JmVROrk2cbEhszUZ6FuSbfdsucMwwKcMjS2JTgg19PPkNsYAWjDUmaI7AKm
 E00SZnSHEBU8feaqPvNWug+Hd7vQV4tHWu8wfbwJMlZvmdwTAa2pl7w4xPg83Ae16+cU
 A02fzCTU9ysyZ7nbWNFiprqIy9uRswR74oYNCxrJv50qFjulJ935RwWFwS984vJiaqEm
 DOc2EP2SVvLYi+QU5LVkQq6ylEA23yR6Mb7YS/JWovRwKftLjHlulCqrLIRslJgoUbFD dQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf7fnfpb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 11:35:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 70572100038;
 Mon, 13 Jan 2020 11:35:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 66E7E2A96EA;
 Mon, 13 Jan 2020 11:35:20 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 13 Jan 2020 11:35:19 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 13 Jan 2020 11:34:58 +0100
Message-ID: <20200113103515.20879-5-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113103515.20879-1-patrick.delaunay@st.com>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_02:2020-01-13,
 2020-01-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Heiko Schocher <hs@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v3 04/21] dt-bindings: gpio: document the new
	pull-up/pull-down flags
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

This commit extends the flags that can be used in GPIO specifiers to
indicate if a pull-up resistor or pull-down resistor should be
enabled.

It is the backport of linux commit ede033e1e863c ('dt-bindings:
gpio: document the new pull-up/pull-down flags')
from Thomas Petazzoni <thomas.petazzoni@bootlin.com>
and integrated in v5.1-rc1
https://github.com/torvalds/linux/commit/ede033e1e863c

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v3: None
Changes in v2: None

 doc/device-tree-bindings/gpio/gpio.txt | 24 ++++++++++++++++++++++++
 include/dt-bindings/gpio/gpio.h        |  6 ++++++
 2 files changed, 30 insertions(+)

diff --git a/doc/device-tree-bindings/gpio/gpio.txt b/doc/device-tree-bindings/gpio/gpio.txt
index e146917ff3..e9ef0212af 100644
--- a/doc/device-tree-bindings/gpio/gpio.txt
+++ b/doc/device-tree-bindings/gpio/gpio.txt
@@ -65,6 +65,30 @@ Example of a node using GPIOs:
 GPIO_ACTIVE_HIGH is 0, so in this example gpio-specifier is "18 0" and encodes
 GPIO pin number, and GPIO flags as accepted by the "qe_pio_e" gpio-controller.
 
+Optional standard bitfield specifiers for the last cell:
+
+- Bit 0: 0 means active high, 1 means active low
+- Bit 1: 0 mean push-pull wiring, see:
+           https://en.wikipedia.org/wiki/Push-pull_output
+         1 means single-ended wiring, see:
+           https://en.wikipedia.org/wiki/Single-ended_triode
+- Bit 2: 0 means open-source, 1 means open drain, see:
+           https://en.wikipedia.org/wiki/Open_collector
+- Bit 3: 0 means the output should be maintained during sleep/low-power mode
+         1 means the output state can be lost during sleep/low-power mode
+- Bit 4: 0 means no pull-up resistor should be enabled
+         1 means a pull-up resistor should be enabled
+         This setting only applies to hardware with a simple on/off
+         control for pull-up configuration. If the hardware has more
+         elaborate pull-up configuration, it should be represented
+         using a pin control binding.
+- Bit 5: 0 means no pull-down resistor should be enabled
+         1 means a pull-down resistor should be enabled
+         This setting only applies to hardware with a simple on/off
+         control for pull-down configuration. If the hardware has more
+         elaborate pull-down configuration, it should be represented
+         using a pin control binding.
+
 1.1) GPIO specifier best practices
 ----------------------------------
 
diff --git a/include/dt-bindings/gpio/gpio.h b/include/dt-bindings/gpio/gpio.h
index 2cc10ae4bb..c029467e82 100644
--- a/include/dt-bindings/gpio/gpio.h
+++ b/include/dt-bindings/gpio/gpio.h
@@ -33,4 +33,10 @@
 #define GPIO_PERSISTENT 0
 #define GPIO_TRANSITORY 8
 
+/* Bit 4 express pull up */
+#define GPIO_PULL_UP 16
+
+/* Bit 5 express pull down */
+#define GPIO_PULL_DOWN 32
+
 #endif
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
