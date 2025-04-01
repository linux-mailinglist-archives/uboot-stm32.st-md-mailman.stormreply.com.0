Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 142F5A774E3
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Apr 2025 09:01:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9044C78034;
	Tue,  1 Apr 2025 07:01:36 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F637CFAC50
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Apr 2025 07:01:33 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-39c0dfad22aso2200645f8f.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Apr 2025 00:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1743490893; x=1744095693;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8gMeInNBRAkCkwoVlTM98xEWy0g3akZgL6kxDi5yA3g=;
 b=AkMrJCSIRru8al9/AVJF5cv8MFyx59nEhvs2wSj96w5LXfYpJbugoZQFLKysAWSc5S
 y4E69/3C2kSmcPGle3Z9K+TK8uuafvg81wnN+fnepEZ3B7ShvNJbeFKn8guXfqcqwXGx
 U0Y/H04VShojfMUUZlBK+RT59BLnu6fZocras=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743490893; x=1744095693;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8gMeInNBRAkCkwoVlTM98xEWy0g3akZgL6kxDi5yA3g=;
 b=icP4gSD7cf4IID6Ap+xYfCmyT2jiwwnBNqWLAaGV2zhsrRrrp/YPA8liT15yvnmq9E
 OvnwsNy9ZwLbSial2MJ5lnbPgeLi3fxPQknq14Api4E5nFB1IQz2N4UjUBBjtdZKH9BG
 weMwpHl+pMKWmygPl7kCwR6t+mEpvFbWJwi2VQJOvTYMox/9QoRHswTUhvMoSl0SOU6I
 PlnDTKRxzgLOLSQQ+W192VuvwlqlEPc4qJc21Dq9msS6IQ/oDcEIkuTYCqA57NJayFXw
 wGDFq8uPmJkmm/uT5a3cCdg9p96TVUPKfzQSzEYAJRneL4DO9dy9uGQPS9JkmKkzVo4G
 01QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHGtjX0EVmpa0D8JlY/O4gnc3rTYumMm5/xX2amZPI3D5JlwBsq34NQk3OUGF/mUrxAXE0Kyj3enE4Ug==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy2adROe0EdhCADxP2Dy/V20ddRsBC+DZeKV/vEIIAl3M9eAcCY
 NCiYNEJOTVROKuunKT9wZj1M/HCkiL1PGh+OzSxR18UWAcMAf2i5QK222wzceHE=
X-Gm-Gg: ASbGncvlsZ9114U9JQhaIGKv9E1mGbKMhJxIBvQaRzoSIXaut0BT+S0kvEWe4S9xMdC
 x9iaiS1c0lq5qVmkg9g724D2/3PmMHirDkaOjLPbRHP9RBJRHMumOQHeBii3gZKEifwcD7/SymD
 GwYfxmJ5aZeARaIV5xMHxrKZzMtWwJtuIMSCyNjb15RzpnttfsIs9DjjiCHSdFnOMjl3dDo4vQV
 m/GgHxaOv3mIIx0YvS52gzwjpOZlrw4tOTzlNG5DcaH/dxS1muzYm87XhmKhw/tDyRNO2kt0ybN
 ipRVJ7dKYpxmuMm4ryimCT3OXHnI/93hYlaeBWgevRcs7ROxOuR64I2WZCEyv85vCnDtVieJiAb
 WwCtvB23/5A==
X-Google-Smtp-Source: AGHT+IHJ3fzHvs7TIHyWTcnAGL6nzKFp5yUVFrICNeE33iCAMDxahGJs/HPFYvmE5aElUVDwJ08tkQ==
X-Received: by 2002:a5d:59a5:0:b0:390:f9d0:5e3 with SMTP id
 ffacd0b85a97d-39c23646fe3mr1063138f8f.1.1743490893132; 
 Tue, 01 Apr 2025 00:01:33 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b66b015sm13701760f8f.54.2025.04.01.00.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 00:01:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Tue,  1 Apr 2025 09:00:54 +0200
Message-ID: <20250401070125.3705126-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250401070125.3705126-1-dario.binacchi@amarulasolutions.com>
References: <20250401070125.3705126-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH v2 3/6] ARM: dts: stm32: add display support
	on stm32f769-disco
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
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

Changes in v2:
- Add Reviewed-by tag of Patrice Chotard

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
