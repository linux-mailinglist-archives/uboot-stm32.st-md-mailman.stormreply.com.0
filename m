Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C41A88AC20C
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Apr 2024 01:19:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C11EC7128D;
	Sun, 21 Apr 2024 23:19:13 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC0F8C6DD9A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Apr 2024 23:19:10 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DA31E88324;
 Mon, 22 Apr 2024 01:19:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713741550;
 bh=9ZV+ir3GagK098jToaqgdpSN3v7O35N8sPpGTFqBz5w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xl1+iqmJXe8izw3sPYAIZUoJeeDLUm2iHOfghyZKOXPePCqeHmDAB8Mi3D/hcg8Zr
 QZep+MYb5oEprWkt1UGDOIRN4axyhIRHGT/tZ+tnU3Uf9hFbVkilQgy71tq1bqaJkd
 nUJuIdt/3c5KKKlcFQzFPmTHvr1N1EzknFk/f8xIvC3+SJUxPb8RMktT+HIKf0lFNp
 Zo1Ruj49lDHAgZpSttYmVEKDsJUJIHgrCU9cHS056ARRbF+PYMNoQQ3D6eFftIhZm/
 3NQN1BiMzVM6xxziJbXx/xNE3CxI2OZsRcBbEr24I1rGqYiXIpLqFku8tUzEQzPYk1
 N2OvISdfFrmMA==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Mon, 22 Apr 2024 01:16:55 +0200
Message-ID: <20240421231849.194648-9-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240421231849.194648-1-marex@denx.de>
References: <20240421231849.194648-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: [Uboot-stm32] [PATCH 09/19] ARM: dts: stm32: Add alternate pinmux
	for MP13 PWM13 pins
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

Add another mux option for PWM13 pins, this is used on
DH electronics STM32MP13xx DHCOR DHSBC board.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: u-boot@dh-electronics.com
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/dts/stm32mp13-pinctrl.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/dts/stm32mp13-pinctrl.dtsi b/arch/arm/dts/stm32mp13-pinctrl.dtsi
index d19408f19f9..cf070fbd7f7 100644
--- a/arch/arm/dts/stm32mp13-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp13-pinctrl.dtsi
@@ -275,6 +275,21 @@
 		};
 	};
 
+	pwm13_pins_a: pwm13-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 6, AF9)>; /* TIM13_CH1 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	pwm13_sleep_pins_a: pwm13-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 6, ANALOG)>; /* TIM13_CH1 */
+		};
+	};
+
 	pwm14_pins_a: pwm14-0 {
 		pins {
 			pinmux = <STM32_PINMUX('F', 9, AF9)>; /* TIM14_CH1 */
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
