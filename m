Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD18109A72
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 09:49:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56141C36B0C
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 08:49:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 126B5C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2019 08:49:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAQ8lHtr030836; Tue, 26 Nov 2019 09:49:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=pWKhx8D2E181W83/g9g9KZA+0X1S1iNWqEPUiyW1ct4=;
 b=Zki1BgHrAi+SG3cpLZeha+DQINil0E4wZis1vC3Q/kyLdSAeIfqqqACQBuaUYQ1QIS3Y
 on1VCtZ6iAaMeUlxsL3AtC7b2cmgdNuOugSCvbl0rC+sYKujwGCTX4du4IzCkL9KB5YA
 uVb4ksMer9/wC0pJ2omIITRZdZGA2OyvC5WEN07ZOthQX8lci1Y4xCESgwMp1phhBmd5
 VYxb0xXlYW0CPyvx2ajx0cEfVwNEDXX4LUtf9EERoy556YyWHNT6D7fWOEDGxTrhKDX7
 iKADpJeT9PCEw8Sabm3Jx7TKffS2uzGjuuTb5SbjMcCEJkRuRj7eB/DPjDZLT88ovuYy UQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wets9p7uu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 09:49:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 09BEE100038;
 Tue, 26 Nov 2019 09:49:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 008DA2ACE57;
 Tue, 26 Nov 2019 09:49:16 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 26 Nov 2019 09:49:16 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 26 Nov 2019 09:49:01 +0100
Message-ID: <20191126084911.19761-5-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191126084911.19761-1-patrick.delaunay@st.com>
References: <20191126084911.19761-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_01:2019-11-21,2019-11-26 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 04/14] dt-bindings: gpio: document the new
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
