Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F21AEA774E0
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Apr 2025 09:01:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3085C78F98;
	Tue,  1 Apr 2025 07:01:31 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED454C78F8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Apr 2025 07:01:30 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso35446735e9.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Apr 2025 00:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1743490890; x=1744095690;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i044n2zFt+fwDjOmTfhSbZNrYh1Q9DyCsR3YROwfPZg=;
 b=D1p7/dHytEnvpqIeV9MlGz9vR8bK1dchvj+amtuXtgwxDx6poywASQqswAOwLnwCtX
 m74eSwdQgeHbGBD0pLg0sXnJ0OZZssN4RzhPoJr2E4GSAxBlVjylUOxfhoa/I81X9hz0
 sUGq1fDwfxbmekx8xuP2fJDEof7jqu6SHd8B4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743490890; x=1744095690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i044n2zFt+fwDjOmTfhSbZNrYh1Q9DyCsR3YROwfPZg=;
 b=JV97OcuwcS2kul+3H0ZYVDl9bt9ytdp7M72T7tya0CA/DICbRInxdb2xAv+htXpPd3
 yIJgxq3cfJV2G0jUnMeU/63rXXM/Iauc/5SFb0r5iGF/TmmDV9hxFbeunUXiCNNR4yKf
 DPj5lTi2ma30gUzJ1TsK5h8mmgKT9vNonMLsED47WJK1QWx7N7AdCyavgaN8Ru/deH8B
 RHdw1MI0ZXyK09EyW+vGAC5RbkxuTQp0hG4ZWzIP4rCwxMsIe52xPohMdn5yYVd6P6FR
 4m7JDBW632kv9Duf487BX6W9MMJsEeMg4TicLA1V/VXTxVR4fkDp/XjpnNwJd/5bd8gc
 n2zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcKKwCbZs4J24MWxa72Y8zgb5JPpWPd9pWjkknJyUqi/nLL6dPPWoi/z7NRgWZvrhMF/1mYQgIjW12Fg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YznBQZgdIrl+Bw7QxRQijLU4j6/pzvIdHZ+ki38o7IV5vlW70py
 QckqKfLfhb5pLfWxu4GLD8JGIAA3ZdeKeSL70mTYEfu/WzR/cw4DVQXcRjRxHQPBGPpxd3c2PRX
 n
X-Gm-Gg: ASbGncsFlr/ORhCFfyM8IWSXRChQAVAyy4dBNj0oXR4BkIUuCyFJjL0hr9XskKqii5y
 gZ9RI9vRiwq6Tvqoib9j5e9DLKT5dQ5rmvfHdOr3pW66n5AyRwsP4tX+BWojltkOk4evATnQ6gv
 cgrdP7vCM33fJ9U8HIHDbSnag/6n0Hl14DtyIAYeYNM+bQkUXAWM+w8GxbsEm3SWfc8pjvoayGB
 jCa6WN0zA5egJXFFKQ3IJvciadJ6tv6XSYcH9MvcpUnhcdpH+dRJDLPPp6wvEuAMPFkJjB6909F
 9mH52AKveb+Nqkn9uVvHTq4gS23xl4wmFDUeBM/ZuRohWcTxtkA0arDIqMMXmGz3Bzmn2aYVPRu
 U4+u2rFNB2w==
X-Google-Smtp-Source: AGHT+IGlvwzgkPuDKTDQIkOeCeOhyeM7o4vRhw5i/5zKLYdzpsXb4SMK0RjulavKgr5/jiL4Wzbqbg==
X-Received: by 2002:a05:600c:83c4:b0:439:91dd:cf9c with SMTP id
 5b1f17b1804b1-43db6223feamr148997085e9.10.1743490890455; 
 Tue, 01 Apr 2025 00:01:30 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b66b015sm13701760f8f.54.2025.04.01.00.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 00:01:30 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Tue,  1 Apr 2025 09:00:52 +0200
Message-ID: <20250401070125.3705126-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250401070125.3705126-1-dario.binacchi@amarulasolutions.com>
References: <20250401070125.3705126-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH v2 1/6] ARM: dts: stm32: add DSI support on
	stm32f769
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

[backport from Linux commit a995fd2e8b3c6defd1dcdd3fb350c224e41ea1d0]

Add support for MIPI DSI Host controller. Since MIPI DSI is not
available on stm32f746, the patch adds the "stm32f769.dtsi" file
containing the dsi node inside.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

Changes in v2:
- Add Reviewed-by tag of Patrice Chotard

 arch/arm/dts/stm32f769-disco-u-boot.dtsi | 41 +++++++++++-------------
 arch/arm/dts/stm32f769-disco.dts         |  2 +-
 arch/arm/dts/stm32f769.dtsi              | 20 ++++++++++++
 3 files changed, 39 insertions(+), 24 deletions(-)
 create mode 100644 arch/arm/dts/stm32f769.dtsi

diff --git a/arch/arm/dts/stm32f769-disco-u-boot.dtsi b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
index add55c96e21f..c5ae753debe6 100644
--- a/arch/arm/dts/stm32f769-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
@@ -44,30 +44,25 @@
 			};
 		};
 	};
+};
 
-	soc {
-		dsi: dsi@40016c00 {
-			compatible = "st,stm32-dsi";
-			reg = <0x40016c00 0x800>;
-			resets = <&rcc STM32F7_APB2_RESET(DSI)>;
-			clocks = <&rcc 0 STM32F7_APB2_CLOCK(DSI)>,
-				  <&rcc 0 STM32F7_APB2_CLOCK(LTDC)>,
-				  <&clk_hse>;
-			clock-names = "pclk", "px_clk", "ref";
-			bootph-all;
-			status = "okay";
-
-			ports {
-				port@0 {
-					dsi_out: endpoint {
-						remote-endpoint = <&panel_in>;
-					};
-				};
-				port@1 {
-					dsi_in: endpoint {
-						remote-endpoint = <&dp_out>;
-					};
-				};
+&dsi {
+	clocks = <&rcc 0 STM32F7_APB2_CLOCK(DSI)>,
+		 <&rcc 0 STM32F7_APB2_CLOCK(LTDC)>,
+		 <&clk_hse>;
+	clock-names = "pclk", "px_clk", "ref";
+	bootph-all;
+	status = "okay";
+
+	ports {
+		port@0 {
+			dsi_out: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+		port@1 {
+			dsi_in: endpoint {
+				remote-endpoint = <&dp_out>;
 			};
 		};
 	};
diff --git a/arch/arm/dts/stm32f769-disco.dts b/arch/arm/dts/stm32f769-disco.dts
index d63cd2ba7eb4..ad1b442055e1 100644
--- a/arch/arm/dts/stm32f769-disco.dts
+++ b/arch/arm/dts/stm32f769-disco.dts
@@ -5,7 +5,7 @@
  */
 
 /dts-v1/;
-#include "stm32f746.dtsi"
+#include "stm32f769.dtsi"
 #include "stm32f769-pinctrl.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/gpio.h>
diff --git a/arch/arm/dts/stm32f769.dtsi b/arch/arm/dts/stm32f769.dtsi
new file mode 100644
index 000000000000..4e7d9032149c
--- /dev/null
+++ b/arch/arm/dts/stm32f769.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+#include "stm32f746.dtsi"
+
+/ {
+	soc {
+		dsi: dsi@40016c00 {
+			compatible = "st,stm32-dsi";
+			reg = <0x40016c00 0x800>;
+			clocks = <&rcc 1 CLK_F769_DSI>, <&clk_hse>;
+			clock-names = "pclk", "ref";
+			resets = <&rcc STM32F7_APB2_RESET(DSI)>;
+			reset-names = "apb";
+			status = "disabled";
+		};
+	};
+};
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
