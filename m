Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3594A6E1EB
	for <lists+uboot-stm32@lfdr.de>; Mon, 24 Mar 2025 19:00:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B046FC78F65;
	Mon, 24 Mar 2025 18:00:53 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCB2EC7801E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 18:00:52 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3912e96c8e8so2688057f8f.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 11:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1742839252; x=1743444052;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rk2FYKP+658TBtLU/m3Z1R7K/iJrSTDoXsuAJF08vcQ=;
 b=mKOMhLsHwiAJXjQhPNEUk9ConP4rhM60HiLjVXoHhszJO9zidLGEhXbVXkMtUQuFPD
 31uyiDH7ISF1ZB+rc8Q8n0z8Pe2B+mU2JSiFk+gJDqLg4TTKUOJ+V+OpAJ/0zg46gEEW
 Nu3pyx4P8K36SN6Eeojwim35hWkIClvTWGC1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742839252; x=1743444052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rk2FYKP+658TBtLU/m3Z1R7K/iJrSTDoXsuAJF08vcQ=;
 b=hSnBxke54j2A5mr8sR4+n0ESLE6KUtKlPQJBiRKbcqQEjj16/tQVgxKTLuQYtvhK3v
 LU1JVTYAXVl9BQdxjN8m/TSPWdEeaOyWBC+1OC5hdUfql6Uv5sv/edQSSixuykFKIOFs
 6tniBNHNxWyW2AaARNChqXONmvcgaaqpQd73oszfVKWyp3R6NNz+HkmlCbYNEzFwsyOh
 INPMDDDez5bh8GD8U+5xPhnMZuF29w3LlrGM/0KwJI/CYfJJ/GlEkhFPKis7AC1u6TOK
 G5AjqMPlPHwxgTW75p6wfl2rDTKoceX4oi+3J9HN1Kalxmb18B5SXdXZj2AqXVH0lp4K
 QvUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXap7CYVzEtBubeXvBf8ybNEQhuF8HqTNAQ4vdCcJ47EfbA0IKZe7QwuEyUzv99Wof+EKuBDJAZiU2bvA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyi+urmXB03D4Ym+vVgNhSSaH1moN/HFtRwy1Heee+9ds2JXdch
 VVkwx0SR7InDDj3qAkGggDgqDr2TnMq4vByeasMepl+kSk5ydIgvVjIrUhuYNs4=
X-Gm-Gg: ASbGncuzoEd6pQ7UuD1nXdYHLrDWmsEVu2xN5XZwf3DXs9Q7TBYWnMetB5xY4UWqJzS
 4emIJ9CWIz7pGTY6na4efrNrtaQ2T0CTUlCHWpk1hN69Kg2vBkwWbYc5ZkLriVLe4fF4RCOdXO4
 sOi7Mw6MRslRHDc8CNKtVR2DHf/pR0WcIwqzYKADUJx2+/VblW7VUK+np08HBbZQb6NuoWMCRaM
 //P/lKxz2VWcBoxk8bTywMjblvmECfSPg6fvgGy/7/YKnwB/kLMv1EU7iRDTtDaw71yeDOPZoMc
 iImaB7KPH8ummmmN5Mnpsf5ipu+Q0XEREcak2h+lsmQx1ojuwz0HDPiy+Fkmg50PpkDtPKzY+/A
 PIzzhbatyoctjhhzqjBff7vK0Lmuu8iboHVJ7WnGONhb3Yw==
X-Google-Smtp-Source: AGHT+IEU07LD1fH2ljsaqwQTZjFGB5fer1YGjLvux9265p9QJsVsOStfjbGjFueJKxcBu5yA9PgXKw==
X-Received: by 2002:a5d:6d88:0:b0:391:2e6a:30fe with SMTP id
 ffacd0b85a97d-3997f92d305mr15123811f8f.39.1742839252269; 
 Mon, 24 Mar 2025 11:00:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.220])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f556a4sm178289285e9.22.2025.03.24.11.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 11:00:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Mon, 24 Mar 2025 19:00:25 +0100
Message-ID: <20250324180047.1571378-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324180047.1571378-1-dario.binacchi@amarulasolutions.com>
References: <20250324180047.1571378-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 1/6] ARM: dts: stm32: add DSI support on
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
---

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
