Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC973A38B23
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Feb 2025 19:14:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F92BC78F86;
	Mon, 17 Feb 2025 18:14:51 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BD0AC78F67
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 18:14:44 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-ab7430e27b2so795460166b.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 10:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1739816083; x=1740420883;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s/qiKA4pg8ffb2/CW+UQgKJD1ewdFl/Ljv9gjyq++P8=;
 b=oa0XK1uda4qh58w8IVY7q0RQTThukE+vKg2SCAEl4FSz1XzFRK076aYCVQWVVLedMv
 uUK2nLN3JJseA7tSVu4Ij4YDhCGUck1M0v/k/PidoGv4djTKGji6HCnSUm/TfTlrDGUb
 ngqO6f6ZUNplFwLtKNVIvwz9xfRdFI6+UBf20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739816083; x=1740420883;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s/qiKA4pg8ffb2/CW+UQgKJD1ewdFl/Ljv9gjyq++P8=;
 b=CMz8DTO95vvUbV/wto1CcvApsAipj6/5JSLYhly0wrme5TXc9fTBFQFaorchWpn0iE
 E85k/XoPjpkqCsf+qnjSF2IKWFUhn7Xy2CCud1pfDx4SRPtoPJA7FNpfXbK+XFKL/4WL
 z3fX3cGYUTueYKjB3tbbvSiwiPUTkJgXUqtFEsoxRztFd7r4fHUySIjU4xXVRvb9zOaf
 Li7q7DHJLu2hYCbtT8ZgU4Bglr0+fcnvgC2qMsj3L5smEef7d7lQk4ThFx/tMC9bQkAa
 H0iLKxM8T2Vq9sO3hBjl3pznAPvir2v1qMzUofdl6Gkk1iXUaFG/8jk8R68VLDo5p269
 VVHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaLGuYC3XWQxNFY3rp3P5XZsBlFtbCBMmfG4Zy8pUYHqLozcp1xTxMH9mzVrxgqLpYO8WC2DdN4hDCdg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx+euKl0GGWbhFgl8EPvIwcn/f2jH6LgOtOPTukTpQO8ZNDmAAB
 7y/+aahZSxe9srN9bLl2gpeRGPCB5mDEU71L2LJYSI9DDaENV9oJszejXS94vGM=
X-Gm-Gg: ASbGncuIt0fCwgqkq9YK8HZ2oh5xPfCUgyqkR+CgnK7Kr/b2nuUij4+1sNsVJn5vlmQ
 3ltgLwR9dAfRmOU9zYdJJ2jBFnWtRb9JSBl8VRH0VMs1yOU+W7RumPug+O+tpxZaTEm3XYtexsG
 hRYUoIKxDMGI8lbltGV8VXSqA5945T7TuIDwVAaaPgA3PxCOaBU5rH+MMXrFv5PuEMeNBw/Engp
 mdEvl/pNwMX/ryNbFgUjg5YGe+nUWXuSKmrl/EWb9+PECzbktp5Fx+dnAVmOgX7ffQFxmTsBe8S
 p6ftLXfhG7EjuKa5aHvT1d4ShFhvczodo/mr14FAV22i/Km88p0rQiS0L9CULC+UdHMNXPihStt
 9zw8gHTVknYz+ulMLiU7tuusio9Qht9d3vim+GjffnpixGZfxcpU+
X-Google-Smtp-Source: AGHT+IGDftIlFdcwFp7gSokaqadEBtTSfLY+7w6hIEnjYMYEeJotKrG9UUPpomSl0uNZAiCFo3hO7Q==
X-Received: by 2002:a17:906:4fd5:b0:ab7:83c2:bdb7 with SMTP id
 a640c23a62f3a-abb70db35d5mr1153142866b.49.1739816083547; 
 Mon, 17 Feb 2025 10:14:43 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-4-36-33.retail.telecomitalia.it. [87.4.36.33])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbaa99f283sm113616666b.32.2025.02.17.10.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 10:14:43 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Mon, 17 Feb 2025 19:14:33 +0100
Message-ID: <20250217181439.1157972-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Vikas Manocha <vikas.manocha@st.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 1/3] ARM: dts: stm32: drop "st,
	button1" compatible
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

It is pointless to use the custom compatible "st,button1" when
stm32746g-eval.dts and stm32f769-disco.dts already contain the
"gpio-keys" compatible, which is specifically used for button
management. In the case of stm32f746-disco.dts, since it lacks the
"gpio-keys" compatible, it was decided to translate "st,button1"
into its "gpio-keys" version in stm32f746-disco-u-boot.dtsi.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/dts/stm32746g-eval-u-boot.dtsi    |  5 -----
 arch/arm/dts/stm32f746-disco-u-boot.dtsi   | 11 ++++++++---
 arch/arm/dts/stm32f769-disco-u-boot.dtsi   |  5 -----
 board/st/stm32f746-disco/stm32f746-disco.c | 15 ---------------
 4 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/arch/arm/dts/stm32746g-eval-u-boot.dtsi b/arch/arm/dts/stm32746g-eval-u-boot.dtsi
index 1c288acec992..f64329287357 100644
--- a/arch/arm/dts/stm32746g-eval-u-boot.dtsi
+++ b/arch/arm/dts/stm32746g-eval-u-boot.dtsi
@@ -23,11 +23,6 @@
 		spi0 = &qspi;
 	};
 
-	button1 {
-		compatible = "st,button1";
-		button-gpio = <&gpioc 13 0>;
-	};
-
 	led1 {
 		compatible = "st,led1";
 		led-gpio = <&gpiof 10 0>;
diff --git a/arch/arm/dts/stm32f746-disco-u-boot.dtsi b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
index 1b42d6cbbc19..e0e2f9e23773 100644
--- a/arch/arm/dts/stm32f746-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
@@ -23,9 +23,14 @@
 		spi0 = &qspi;
 	};
 
-	button1 {
-		compatible = "st,button1";
-		button-gpio = <&gpioi 11 0>;
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+		button-0 {
+			label = "User";
+			linux,code = <KEY_HOME>;
+			gpios = <&gpioi 11 GPIO_ACTIVE_HIGH>;
+		};
 	};
 
 	led1 {
diff --git a/arch/arm/dts/stm32f769-disco-u-boot.dtsi b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
index add55c96e21f..a50fba64dcd2 100644
--- a/arch/arm/dts/stm32f769-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
@@ -23,11 +23,6 @@
 		spi0 = &qspi;
 	};
 
-	button1 {
-		compatible = "st,button1";
-		button-gpio = <&gpioa 0 0>;
-	};
-
 	led1 {
 		compatible = "st,led1";
 		led-gpio = <&gpioj 5 0>;
diff --git a/board/st/stm32f746-disco/stm32f746-disco.c b/board/st/stm32f746-disco/stm32f746-disco.c
index 8966a09501ed..65a39d965c72 100644
--- a/board/st/stm32f746-disco/stm32f746-disco.c
+++ b/board/st/stm32f746-disco/stm32f746-disco.c
@@ -94,21 +94,6 @@ int board_late_init(void)
 		dm_gpio_set_value(&gpio, 1);
 	}
 
-	/* read button 1*/
-	node = fdt_node_offset_by_compatible(gd->fdt_blob, 0, "st,button1");
-	if (node < 0)
-		return -1;
-
-	gpio_request_by_name_nodev(offset_to_ofnode(node), "button-gpio", 0,
-				   &gpio, GPIOD_IS_IN);
-
-	if (dm_gpio_is_valid(&gpio)) {
-		if (dm_gpio_get_value(&gpio))
-			puts("usr button is at HIGH LEVEL\n");
-		else
-			puts("usr button is at LOW LEVEL\n");
-	}
-
 	return 0;
 }
 
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
