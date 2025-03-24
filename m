Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC60A6E1ED
	for <lists+uboot-stm32@lfdr.de>; Mon, 24 Mar 2025 19:00:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5613C7802F;
	Mon, 24 Mar 2025 18:00:55 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E51CC7801E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 18:00:55 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4394a823036so48281095e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 11:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1742839255; x=1743444055;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iFaFn/OC4j0QG0f+ruGPqbpwF76TJl6MZZ0HQgXuxOk=;
 b=FjTOUDu24B6vxgG693mNKZYpTOheqA94nZYNu6DELN6CbBn4DVGYXYuPlKEiCDb3uW
 Kg5OzzfBa9idNgoMpjrfX0WyOTulu5ulKNU/eQSzbdSqjsIfokozmOsYFmZ+SKgbShdl
 3r35NB1fnrBfEsRoLXeFeiD+saGQX9hg0SaWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742839255; x=1743444055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iFaFn/OC4j0QG0f+ruGPqbpwF76TJl6MZZ0HQgXuxOk=;
 b=OOvm2bPYRqVzYOSoy8l0iFL10AH7ZH7RbbS+URa/KzdLBBhiGTqGs/m007enFJ8UWq
 o6b9Og/E9v3DPs9so9OOSuLsLrdj4fmJvoFZ3I84ng5at0lYBRG6/UBlCDf0j+fR9rSz
 rrDccsr1CHAEMjMxgFSfAvA2S4uYLqWZw2IpXv6ohjWvb2ZYrB+GnmyBENTEkLYF6oTX
 af3l8DobTr1erq7letQkcw08Ywjr2PdBYDgIUnRJQB/LyfVuG5+Uuzb8ohIRoIgq94CG
 kR16fXRmeSxR4m5pHb0EAoeQAodS9s68hKoVOn2Gp7wTe6+bkBTLWVu7qHcWL5v7wPXn
 5wRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHPotg3Gd2wuHHIsWHBlY7WFDzBGiHqfVCQqqBrnxwD6AbtqHEY6nPhhYyfdLhxJQKtTvV4VR3i5iqBQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyydbHl2A7BVe5PGFHZn/HMGnWnLPKVf0MN2+EZvbXslc5HRTq8
 hklFVG8FrcLxTVVIK9v3xp+jzW89XhIfM9hwToEHCVy52h18EBbrVty6EV7HpSs=
X-Gm-Gg: ASbGncviAa71pBpDUBND2+8VFnBy/TjifqE/oeDr0iffVMgSiImU2ujiEZVcIFP+eQW
 UImvr+lF74U0jdL84Y4TTY55BjwdgUHm3N8lk0NiEkyDAEzqrLNWPdW3LY7y5hKBp8qzL7W+eAJ
 iduvO1ZDnDkXzqiaUFeim4tuPtU32yac9y0wjaxAmcllT7h+yhaLBRJH7pHaXKke6J/AkcW4Y0N
 057auKU/iC1m4pms9g/9G7NGBs+cpiP0DItlYnFA4CS4r5Iw0b0d+U+DuAIwQOp44YVgAFReBfR
 wUXkL8jI4M29/QU8iRTXaneN6gKLI60qS/c9CZgppIkUVWlIXawmy5az5CuwBbsBO74GHRMOCgP
 pRhcY45IRTSOpX2pfsA2WVgvNXtWXkDGur1M=
X-Google-Smtp-Source: AGHT+IFa27r9SdTqh/c8mBcZ4kUHnf5UsghURYnf5JfTfTUwhsaGVPm3LsV1kFOHFRf/djCSw6DGnQ==
X-Received: by 2002:a05:600c:cce:b0:43c:eec7:eab7 with SMTP id
 5b1f17b1804b1-43d509ed65amr140521595e9.11.1742839254591; 
 Mon, 24 Mar 2025 11:00:54 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.220])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f556a4sm178289285e9.22.2025.03.24.11.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 11:00:54 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Mon, 24 Mar 2025 19:00:27 +0100
Message-ID: <20250324180047.1571378-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324180047.1571378-1-dario.binacchi@amarulasolutions.com>
References: <20250324180047.1571378-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 3/6] ARM: dts: stm32: add display support on
	stm32f769-disco
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

[backport from Linux commit 598e5adfeb6062f5d4d352c0ef888b2b29d7e215]

The patch adds display support on the stm32f769-disco board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/dts/stm32f769-disco-u-boot.dtsi | 34 --------------
 arch/arm/dts/stm32f769-disco.dts         | 58 ++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 34 deletions(-)

diff --git a/arch/arm/dts/stm32f769-disco-u-boot.dtsi b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
index c5ae753debe6..16a9eecd4a99 100644
--- a/arch/arm/dts/stm32f769-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
@@ -32,18 +32,6 @@
 		compatible = "st,led1";
 		led-gpio = <&gpioj 5 0>;
 	};
-
-	panel: panel {
-		compatible = "orisetech,otm8009a";
-		reset-gpios = <&gpioj 15 1>;
-		status = "okay";
-
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&dsi_out>;
-			};
-		};
-	};
 };
 
 &dsi {
@@ -52,33 +40,11 @@
 		 <&clk_hse>;
 	clock-names = "pclk", "px_clk", "ref";
 	bootph-all;
-	status = "okay";
-
-	ports {
-		port@0 {
-			dsi_out: endpoint {
-				remote-endpoint = <&panel_in>;
-			};
-		};
-		port@1 {
-			dsi_in: endpoint {
-				remote-endpoint = <&dp_out>;
-			};
-		};
-	};
 };
 
 &ltdc {
 	clocks = <&rcc 0 STM32F7_APB2_CLOCK(LTDC)>;
 	bootph-all;
-
-	ports {
-		port@0 {
-			dp_out: endpoint {
-				remote-endpoint = <&dsi_in>;
-			};
-		};
-	};
 };
 
 &fmc {
diff --git a/arch/arm/dts/stm32f769-disco.dts b/arch/arm/dts/stm32f769-disco.dts
index b4e240a8e3eb..3fd5140ec5eb 100644
--- a/arch/arm/dts/stm32f769-disco.dts
+++ b/arch/arm/dts/stm32f769-disco.dts
@@ -24,6 +24,19 @@
 		reg = <0xC0000000 0x1000000>;
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		linux,dma {
+			compatible = "shared-dma-pool";
+			linux,dma-default;
+			no-map;
+			size = <0x100000>;
+		};
+	};
+
 	aliases {
 		serial0 = &usart1;
 	};
@@ -78,6 +91,45 @@
 	clock-frequency = <25000000>;
 };
 
+&dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dsi_in: endpoint {
+				remote-endpoint = <&ltdc_out_dsi>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dsi_out: endpoint {
+				remote-endpoint = <&dsi_panel_in>;
+			};
+		};
+	};
+
+	panel0: panel@0 {
+		compatible = "orisetech,otm8009a";
+		reg = <0>; /* dsi virtual channel (0..3) */
+		reset-gpios = <&gpioj 15 GPIO_ACTIVE_LOW>;
+		power-supply = <&vcc_3v3>;
+		status = "okay";
+
+		port {
+			dsi_panel_in: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+	};
+};
+
 &i2c1 {
 	pinctrl-0 = <&i2c1_pins_b>;
 	pinctrl-names = "default";
@@ -88,6 +140,12 @@
 
 &ltdc {
 	status = "okay";
+
+	port {
+		ltdc_out_dsi: endpoint {
+			remote-endpoint = <&dsi_in>;
+		};
+	};
 };
 
 &rtc {
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
