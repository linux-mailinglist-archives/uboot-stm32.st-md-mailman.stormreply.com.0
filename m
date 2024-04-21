Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE44D8AC20B
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Apr 2024 01:19:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DE5BC71292;
	Sun, 21 Apr 2024 23:19:11 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C253C6DD9A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Apr 2024 23:19:10 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8ABDB88322;
 Mon, 22 Apr 2024 01:19:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713741549;
 bh=mjUSQsGdaDrOovfKzI9H3XiTrCokHmMKzZEsFZjO+S0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WT3JV0vtAEVyWHWUzLmPqdjMlugFt2SJlvMeSAsGWd72+0w7ocPoOsJSUOhph8anp
 Vhu4V+K9mC8sU98oi7SmKo0Y1eaKucIktf/Z9Lofexa8ZSBWAu+Nx1sovEDh+lbKvC
 0d7yyDtA29550hpiH0xgtQabpImtcAyok7NrTtfmI1waSXBzgs4kKrhTnxHsd1nkKb
 8FT1mz3/zU7cac2q32PWN7pF56VC8HgsjTrFZvQotEnI75TGhcl2a+sFWX8gurWVvy
 F7dokY2RcGHgKBs5JutsAYP71J2Qccl3rmDB8rF4wt5MHTejGpxcbKLrhkp9iKfufS
 i31UBZV8n0ueA==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Mon, 22 Apr 2024 01:16:54 +0200
Message-ID: <20240421231849.194648-8-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240421231849.194648-1-marex@denx.de>
References: <20240421231849.194648-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: [Uboot-stm32] [PATCH 08/19] ARM: dts: stm32: Add alternate pinmux
	for MP13 PWM5 pins
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

Add another mux option for PWM5 pins, this is used on
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
index b58bf6c0024..d19408f19f9 100644
--- a/arch/arm/dts/stm32mp13-pinctrl.dtsi
+++ b/arch/arm/dts/stm32mp13-pinctrl.dtsi
@@ -245,6 +245,21 @@
 		};
 	};
 
+	pwm5_pins_a: pwm5-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 12, AF2)>; /* TIM5_CH3 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	pwm5_sleep_pins_a: pwm5-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 12, ANALOG)>; /* TIM5_CH3 */
+		};
+	};
+
 	pwm8_pins_a: pwm8-0 {
 		pins {
 			pinmux = <STM32_PINMUX('E', 5, AF3)>; /* TIM8_CH3 */
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
