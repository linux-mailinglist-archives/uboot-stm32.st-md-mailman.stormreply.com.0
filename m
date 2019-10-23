Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 808FBE1D1F
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 15:45:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C673C36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 13:45:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEAA0C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 13:45:06 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9NDgx36013942; Wed, 23 Oct 2019 15:45:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=SKywlPzEz9ZQMY8F3Qmdvn4yersiY22+iu5dW6cXw3Y=;
 b=SWHHFxv+lkUgx0coOklhGMsp3UBTIp1hE1IRkqGYFL97zMuDDT0t/bH3+x8BDsEjFpQO
 jPrlxbJuSKafaDYif1iBseAU/vBTd4WzHBgSLdlLR0YVi+rG1QYVhT1VbT0kY3CYC3pd
 b3dDNwmW82jdrQ6r335nY2MlcJymgppxsUT03enrfguDyXzgcQKE1jJUxBzBX62+0tfC
 B+Bql6KlKZjEXlk+KtGz8+r8aB529dQk6d7rWqyfgpemYeaucDl5/trGlbRPfhCT1efM
 oIkr9juvlq9ZG4oAL8BQgz0PRPQOfOkk7YQfBhMFBz8e8MExy+niAciJjUMvce1tMdXO 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vt9s4uxdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 15:45:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 142B210003A;
 Wed, 23 Oct 2019 15:45:01 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 081522FF5FE;
 Wed, 23 Oct 2019 15:45:01 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct
 2019 15:45:00 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct 2019 15:45:00
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 23 Oct 2019 15:44:40 +0200
Message-ID: <20191023134448.20149-6-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023134448.20149-1-patrick.delaunay@st.com>
References: <20191023134448.20149-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_03:2019-10-23,2019-10-23 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 05/13] dt-bindings: gpio: document the new
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
