Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFCAA42BB6
	for <lists+uboot-stm32@lfdr.de>; Mon, 24 Feb 2025 19:39:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F252C7803B;
	Mon, 24 Feb 2025 18:39:40 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93B51C6C83D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2025 18:39:38 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5dedae49c63so8573760a12.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2025 10:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1740422378; x=1741027178;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ie0mSSCAHjjvcDx9OV354kUT0E2SsRxcTlsv81medTQ=;
 b=qemPy9dp7roCiCN/RRkxGk0DHCXYNDwUzIKTLOlcwLJdAt6JNpfgQoBBTWc+PfDWXo
 4x2uxDdNwhYZrNDtwkROjlvLK0TLXZ9EXfInMjDtsot28Se8+5CUDGAENqINh5KH+Wot
 g145mAjgyvE1m4Gk0pYJY5vlJCA4Q469xsMxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740422378; x=1741027178;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ie0mSSCAHjjvcDx9OV354kUT0E2SsRxcTlsv81medTQ=;
 b=JWaZo5fCuF6cZGtRkslg7iKfuHW0imAHSKWw4N4WqW1qVpgaIL2Vy1NjQFXwlsWkIv
 mBaWC/YUOdsZ0UpvanA0zoE6dcZi8bkWkvcIJ1lIuTWVSDBlFWsQT9/naauh/EW2RJ/5
 nnyirRb5cVCEykF8f5i8QwdiLGk/ZuoX8JSgyo+m4/jZbf7sDi7fkY2sRwCQXIfLQsDj
 PXZiVOdAef8y7iTDaUbKQ3/94d3QlkV+C7rhBKvd1NQYP9rBSxFLkQK7zGvLQKuT8iAB
 2VeY0WrDvKsCIsqVR6tSg/r0iY+26sq0sIidgXgPMUXJPQs86QNnhVKrim4V0f7Bdzj0
 GpmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHM2kJcT0k20wWuYDwfcL6B72kZNH69AHbgsg7NQYmeF9yoPwLpM0JfWPjkd3MnXyCKoYXHHNqc9ZPIw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzhnbG1EZgBclHbuWB/F/VZnJn+dL97+W6os+RC+vCs36zsvtMk
 HsOILZwkfA+ZyywPRUYJcQM7VrGRflXoK+ctH1IB1T1l9jwdfoJfrJeYGf9krbU=
X-Gm-Gg: ASbGncvRIp8rsEU+7Nz7PHMzdKCcwEG8JboflGjbmOpFFVbqM0ppEO1bydtQAkMVgsp
 b5gg3crsrt6KPsT1vAQ5hE0IWgf+qNRh5x56zRmyuRG734JjR6k+BURmxToqaD3PXIk71ExgwLh
 +sSdsriZ/iOXmsmX1Sn4fut9SboTCHkivTLxAKrmosxyGpOMZaZ8NkPRlx+CHRmvNRFJkOCh8uw
 leDlXpNZlNn/hXt3ueC7saVMhD026gUeBlk0du1On3foGtrLmDsnaNTwDwhiJV4FfjxQyL64or3
 594V0cL+xzpo1MHYVz8uLAeSA1HzIdvLe3ZKNGL/ETYDPLbu95Pu5rH+8C9B+89FDw1Hhm06drM
 9XnrBVK6rYjrGSi1Weg==
X-Google-Smtp-Source: AGHT+IGPM9/RQyjgwVbbqyVO9yqLCpa4E5bf4wbpUE8PxTo0Mrnj9I70Gy8AhEUsAcu6iTTU3SO2gg==
X-Received: by 2002:a05:6402:5214:b0:5e0:8c55:533 with SMTP id
 4fb4d7f45d1cf-5e0b70cb742mr15070162a12.6.1740422377911; 
 Mon, 24 Feb 2025 10:39:37 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2.196.124.195]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e0a2e25589sm8046911a12.42.2025.02.24.10.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 10:39:36 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Mon, 24 Feb 2025 19:39:25 +0100
Message-ID: <20250224183931.313491-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Vikas Manocha <vikas.manocha@st.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH v2 1/3] ARM: dts: stm32: drop "st,
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
management.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Drop gpio-keys node from stm32f746-disco-u-boot.dtsi

 arch/arm/dts/stm32746g-eval-u-boot.dtsi    |  5 -----
 arch/arm/dts/stm32f746-disco-u-boot.dtsi   |  5 -----
 arch/arm/dts/stm32f769-disco-u-boot.dtsi   |  5 -----
 board/st/stm32f746-disco/stm32f746-disco.c | 15 ---------------
 4 files changed, 30 deletions(-)

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
index 1b42d6cbbc19..a79fca261a2c 100644
--- a/arch/arm/dts/stm32f746-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
@@ -23,11 +23,6 @@
 		spi0 = &qspi;
 	};
 
-	button1 {
-		compatible = "st,button1";
-		button-gpio = <&gpioi 11 0>;
-	};
-
 	led1 {
 		compatible = "st,led1";
 		led-gpio = <&gpioi 1 0>;
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
