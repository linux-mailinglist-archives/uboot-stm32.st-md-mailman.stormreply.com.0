Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C733AAD0C38
	for <lists+uboot-stm32@lfdr.de>; Sat,  7 Jun 2025 11:37:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AB7DC36B2A;
	Sat,  7 Jun 2025 09:37:36 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77110C36B1F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Jun 2025 09:37:35 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-606b58241c9so4572153a12.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 07 Jun 2025 02:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1749289055; x=1749893855;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=196XwIhnfIqqa04ABS763WeYWWcEyx5/YdJgVh0ydIs=;
 b=YM8Fv3E3w/xIcUzVjaUKxr3lo9eSePK5+B8GiMimUOAH2HSD4PGvrNXc+RThurLM5R
 SfXWzFAX70kOCC5cGZAUT2JACaOIeIU1RToWPpgtVAZSo/KJzCq/2KDkQ8pBFmGMFXyJ
 +CHajE7fDwSEx1itxf647R234Cz/v54id6d+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749289055; x=1749893855;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=196XwIhnfIqqa04ABS763WeYWWcEyx5/YdJgVh0ydIs=;
 b=ZC475ygnpqtkc+vLV+Uv0QKt0ZN29hnfBeyvKn2DWrO6F0+fcpP2F6WoiJ/nMe+i9C
 zIr0hrjdjIG3eYKCBgicDuPmo5yIrEzjuj5F6ACW9CWw05XznKt0VeMSohzJXUpn4rpr
 RK1fODZyJiKKrbFtTnX2VDTq3WlvaJ4eeh5mKYVHywXpAxXFtiU87LRutl5YOnm2AzyI
 r8dLm6xkvI+zg2NcEyWDACKF21dW2uxHiKgHMGat9FvL/B8wKG3RuYMpBGqtNriBV91Y
 MtjVo00y8WEVVxrq3ZpfQ0ofKGCW3zL2haU+Feio6+rW74atgFfeCrKkXbOEFa/C8sbZ
 YODg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrmXsq1Eawc3Fogha4ZihsqWSNcVQKGmsw4T1yIFctNSO6VqH56dDOq4tsmpGfj7Wde2MTCaBTYLbd5A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz6XqJePw2mg8dBL67gyOQfInKH405+ZmW10+SLNRygVTvM9PUx
 NkHC8zYLlKDWWtgF+XoBYRjTfZKpLrExj+sT4/CRNEao/YhdJhbNSu10NXVdmDcEKtI=
X-Gm-Gg: ASbGncvfTJBhl2m/2Tu85ygJ7Z3oAvXHf7F2Yk1qhPF/aa7MXExj/Nrbo6g7wxWW1x0
 XGxOXmS/AE0jG7t6/ggcZ8JWflVp/y8tU4/QoOZK6+NlIF8FuUsN0BiUEGDJyMg1RRjOmviRy11
 IPsvJVuWdXGuxtWsxa9jBy/z944hN+T88J15haiVHHzr84G96BYVl/dHciJYweUhShAEs6LRzo2
 YOni/DQF6EeqpKTnksAbleyHCsuhkLoKZYCdQ1T2Eh/IwdilK9kpdvH2dAQ1yLTMaHuSe9+IsVL
 Xi2qM/oCgdzerT95dnb27VoTXNOej0Ci/l3SWysk3aCgppNi7Unrh92O/cgolt/2QYWeJHu3lcP
 Wh4xFKsY33ICmWp5xNayAFugCs9Ghs+rhvCYERjpNQvroi8745rbRXJjJMaar46d7ukiW5Luwbs
 AmQ1M9viz8Lmynp5Nb4DKUb20=
X-Google-Smtp-Source: AGHT+IHCRM8R992urxlcF9Y8ZcPT1WWN4d6I/ioXN+pQWVUhTmQa/th8GUa6u3Ek4wr+JF5Q/ANaNQ==
X-Received: by 2002:a17:907:9728:b0:ad5:3e27:ebc with SMTP id
 a640c23a62f3a-ade1aa47135mr624430266b.57.1749289054884; 
 Sat, 07 Jun 2025 02:37:34 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc38cffsm246524966b.124.2025.06.07.02.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 02:37:34 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sat,  7 Jun 2025 11:37:09 +0200
Message-ID: <20250607093730.2249536-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
References: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Sumit Garg <sumit.garg@kernel.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 1/9] ARM: dts: stm32h7-pinctrl: add _a suffix
	to u[s]art_pins phandles
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

Allow expanding possible configurations for the same peripheral,
consistent with the scheme adopted in Linux.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Link: https://lore.kernel.org/r/20250427074404.3278732-2-dario.binacchi@amarulasolutions.com
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

[ upstream commit: 6a36dca4375fce51b627f5a985a79fc8b8bd7f55 ]

---

 dts/upstream/src/arm/st/stm32h7-pinctrl.dtsi  | 8 ++++----
 dts/upstream/src/arm/st/stm32h743i-disco.dts  | 2 +-
 dts/upstream/src/arm/st/stm32h743i-eval.dts   | 2 +-
 dts/upstream/src/arm/st/stm32h750i-art-pi.dts | 6 +++---
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/dts/upstream/src/arm/st/stm32h7-pinctrl.dtsi b/dts/upstream/src/arm/st/stm32h7-pinctrl.dtsi
index 7f1d234e1024..ad00c1080a96 100644
--- a/dts/upstream/src/arm/st/stm32h7-pinctrl.dtsi
+++ b/dts/upstream/src/arm/st/stm32h7-pinctrl.dtsi
@@ -198,7 +198,7 @@
 		};
 	};
 
-	uart4_pins: uart4-0 {
+	uart4_pins_a: uart4-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('A', 0, AF8)>; /* UART4_TX */
 			bias-disable;
@@ -211,7 +211,7 @@
 		};
 	};
 
-	usart1_pins: usart1-0 {
+	usart1_pins_a: usart1-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('B', 14, AF4)>; /* USART1_TX */
 			bias-disable;
@@ -224,7 +224,7 @@
 		};
 	};
 
-	usart2_pins: usart2-0 {
+	usart2_pins_a: usart2-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('D', 5, AF7)>; /* USART2_TX */
 			bias-disable;
@@ -237,7 +237,7 @@
 		};
 	};
 
-	usart3_pins: usart3-0 {
+	usart3_pins_a: usart3-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('B', 10, AF7)>, /* USART3_TX */
 				 <STM32_PINMUX('D', 12, AF7)>; /* USART3_RTS_DE */
diff --git a/dts/upstream/src/arm/st/stm32h743i-disco.dts b/dts/upstream/src/arm/st/stm32h743i-disco.dts
index 2b452883a708..8451a54a9a08 100644
--- a/dts/upstream/src/arm/st/stm32h743i-disco.dts
+++ b/dts/upstream/src/arm/st/stm32h743i-disco.dts
@@ -105,7 +105,7 @@
 };
 
 &usart2 {
-	pinctrl-0 = <&usart2_pins>;
+	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-names = "default";
 	status = "okay";
 };
diff --git a/dts/upstream/src/arm/st/stm32h743i-eval.dts b/dts/upstream/src/arm/st/stm32h743i-eval.dts
index 5c5d8059bdc7..4b0ced27b80e 100644
--- a/dts/upstream/src/arm/st/stm32h743i-eval.dts
+++ b/dts/upstream/src/arm/st/stm32h743i-eval.dts
@@ -145,7 +145,7 @@
 };
 
 &usart1 {
-	pinctrl-0 = <&usart1_pins>;
+	pinctrl-0 = <&usart1_pins_a>;
 	pinctrl-names = "default";
 	status = "okay";
 };
diff --git a/dts/upstream/src/arm/st/stm32h750i-art-pi.dts b/dts/upstream/src/arm/st/stm32h750i-art-pi.dts
index 44c307f8b09c..00d195d52a45 100644
--- a/dts/upstream/src/arm/st/stm32h750i-art-pi.dts
+++ b/dts/upstream/src/arm/st/stm32h750i-art-pi.dts
@@ -197,14 +197,14 @@
 };
 
 &usart2 {
-	pinctrl-0 = <&usart2_pins>;
+	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-names = "default";
 	status = "disabled";
 };
 
 &usart3 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&usart3_pins>;
+	pinctrl-0 = <&usart3_pins_a>;
 	dmas = <&dmamux1 45 0x400 0x05>,
 	       <&dmamux1 46 0x400 0x05>;
 	dma-names = "rx", "tx";
@@ -221,7 +221,7 @@
 };
 
 &uart4 {
-	pinctrl-0 = <&uart4_pins>;
+	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-names = "default";
 	status = "okay";
 };
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
