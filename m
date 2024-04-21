Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C798AC213
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Apr 2024 01:19:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC946C71291;
	Sun, 21 Apr 2024 23:19:16 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86FF0C71289
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Apr 2024 23:19:13 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 38DDF88335;
 Mon, 22 Apr 2024 01:19:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713741552;
 bh=9k5Im/gWHTfSBHxqPT6oS72oKqBdA7HU1bc8PTJcZW4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U93YGueyYL+rOoUNyfKHgQilLMjrNodRmdAmCl9/pNTw3zYq9JPXClswVoE63h+qM
 qDnDXBUO+5qSWjTxsCNg1/yPgZJeM7qvjyVIxOKeDRxpjOROgUHHcozI90ZJd6WX/o
 SBPjCbSaCwVM35w+HxY0n+1jFG0wSuHfK4aZu9AwRWbrUi4d9OQgi+BTelBfzSw8OU
 L9O2wZgDfFfDOVWaDVuJxyoxpfTZmkUFQ7GkE1D5OxtiVNbfcAbthXJxdDs+ttbSEU
 7YBmJOsG65r5GsdRRDUkfPyBsL5g/Ln2/O6WWMeTCvwqzQsmqyXt9hiaPpk5sLE2XS
 HttO1JYkad4Jg==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Mon, 22 Apr 2024 01:17:02 +0200
Message-ID: <20240421231849.194648-16-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240421231849.194648-1-marex@denx.de>
References: <20240421231849.194648-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: [Uboot-stm32] [PATCH 16/19] ARM: dts: stm32: Add alternate pinmux
	for MP13 USART2 pins
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

Add another mux option for USART2 pins, this is used on
DH electronics STM32MP13xx DHCOR DHSBC board.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: u-boot@dh-electronics.com
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/dts/stm32mp13-pinctrl.dtsi | 41 +++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/dts/stm32mp13-pinctrl.dtsi b/arch/arm/dts/stm32mp13-pinctrl.dtsi
index dae015a0ddf..65f91265a4d 100644
--- a/arch/arm/dts/stm32mp13-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp13-pinctrl.dtsi
@@ -758,4 +758,45 @@
 				 <STM32_PINMUX('E', 11, ANALOG)>; /* USART2_CTS_NSS */
 		};
 	};
+
+	usart2_pins_b: usart2-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 11, AF1)>, /* USART2_TX */
+				 <STM32_PINMUX('A', 1, AF7)>; /* USART2_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 15, AF1)>, /* USART2_RX */
+				 <STM32_PINMUX('E', 15, AF3)>; /* USART2_CTS_NSS */
+			bias-disable;
+		};
+	};
+
+	usart2_idle_pins_b: usart2-idle-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 11, ANALOG)>, /* USART2_TX */
+				 <STM32_PINMUX('E', 15, ANALOG)>; /* USART2_CTS_NSS */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('A', 1, AF7)>; /* USART2_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('D', 15, AF1)>; /* USART2_RX */
+			bias-disable;
+		};
+	};
+
+	usart2_sleep_pins_b: usart2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 11, ANALOG)>, /* USART2_TX */
+				 <STM32_PINMUX('A', 1, ANALOG)>, /* USART2_RTS */
+				 <STM32_PINMUX('D', 15, ANALOG)>, /* USART2_RX */
+				 <STM32_PINMUX('E', 15, ANALOG)>; /* USART2_CTS_NSS */
+		};
+	};
 };
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
