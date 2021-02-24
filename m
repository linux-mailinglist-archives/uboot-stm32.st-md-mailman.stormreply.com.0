Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51050323A14
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Feb 2021 11:01:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C850DC5718D;
	Wed, 24 Feb 2021 10:01:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65DC5C3FAD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 10:01:15 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11OA1ANm000707; Wed, 24 Feb 2021 11:01:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=gnf0uaV+7JTGe2yfJ7QG6DGJyGfMVqHsBNM/MVL1cKw=;
 b=WJhCjfXeFI0uXkfUDHweH4BMPVMXg6elY8DblV8Fz1oACHooi2pOjtd3s24fLOm0MGLA
 DE/7XQXoRxYYZqEv/hwfj4k3oJkZDB4L9qJEDpd1dcSpvP/SM6a9yao3LjvfQzDUlm3l
 2nanuyCTrKAxjJR8eZUj0gPZ2y6oziMalAHonD4u8Ok2Q7/GW/0F+GZtPrYYHAY4ceru
 CeCvfudLUSMh8KuuaLXfw0Mwy7u5lKNFMg9q6Pmq6tTbdBV4y6V7hc59h51K9IMhm2UD
 y92vHjiLfTUP+PFM0Fdns3juxHTzSHkhGVfvRwJmTZeadG4OqzEq5bnLJxfmfMmWvBr0 Fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66cd4n5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 11:01:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 91DAF10002A;
 Wed, 24 Feb 2021 11:01:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6ADE4221F9A;
 Wed, 24 Feb 2021 11:01:08 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 24 Feb 2021 11:01:07
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 24 Feb 2021 11:00:56 +0100
Message-ID: <20210224110052.1.Ic9a63839b6826cc50ac66c2e87b1abf12bc5adfd@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-24_03:2021-02-23,
 2021-02-24 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH] arm: dts: stm32mp15: remove duplicate uart
	nodes
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

Remove duplicated uart nodes introduced with commit 62f95af92a3f
("ARM: dts: stm32mp1: DT alignment with Linux kernel v5.9-rc4"),
because the uart nodes wasn't correctly ordered in alphabetic order.

Only cosmetic: the generated device tree don't change.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/dts/stm32mp15-pinctrl.dtsi | 80 -----------------------------
 1 file changed, 80 deletions(-)

diff --git a/arch/arm/dts/stm32mp15-pinctrl.dtsi b/arch/arm/dts/stm32mp15-pinctrl.dtsi
index dd4bd1e554..20a59e8f7a 100644
--- a/arch/arm/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp15-pinctrl.dtsi
@@ -1971,86 +1971,6 @@
 		};
 	};
 
-	uart4_pins_a: uart4-0 {
-		pins1 {
-			pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <0>;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
-			bias-disable;
-		};
-	};
-
-	uart4_pins_b: uart4-1 {
-		pins1 {
-			pinmux = <STM32_PINMUX('D', 1, AF8)>; /* UART4_TX */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <0>;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
-			bias-disable;
-		};
-	};
-
-	uart4_pins_c: uart4-2 {
-		pins1 {
-			pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <0>;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
-			bias-disable;
-		};
-	};
-
-	uart7_pins_a: uart7-0 {
-		pins1 {
-			pinmux = <STM32_PINMUX('E', 8, AF7)>; /* UART4_TX */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <0>;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('E', 7, AF7)>, /* UART4_RX */
-				 <STM32_PINMUX('E', 10, AF7)>, /* UART4_CTS */
-				 <STM32_PINMUX('E', 9, AF7)>; /* UART4_RTS */
-			bias-disable;
-		};
-	};
-
-	uart7_pins_b: uart7-1 {
-		pins1 {
-			pinmux = <STM32_PINMUX('F', 7, AF7)>; /* UART7_TX */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <0>;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('F', 6, AF7)>; /* UART7_RX */
-			bias-disable;
-		};
-	};
-
-	uart8_pins_a: uart8-0 {
-		pins1 {
-			pinmux = <STM32_PINMUX('E', 1, AF8)>; /* UART8_TX */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <0>;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('E', 0, AF8)>; /* UART8_RX */
-			bias-disable;
-		};
-	};
-
 	usbotg_hs_pins_a: usbotg-hs-0 {
 		pins {
 			pinmux = <STM32_PINMUX('A', 10, ANALOG)>; /* OTG_ID */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
