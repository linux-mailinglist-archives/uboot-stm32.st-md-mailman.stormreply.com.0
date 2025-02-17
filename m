Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4171A38B25
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Feb 2025 19:14:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8931AC78F96;
	Mon, 17 Feb 2025 18:14:51 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F907C78F87
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 18:14:45 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-aaf900cc7fbso696299266b.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 10:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1739816085; x=1740420885;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8K4RCJSnU+RO3rHmkI5kwNOQjsufnHHeX5JWoK5R0VI=;
 b=qWTvqBc6nCDGjxYJkavqkyFvhe+ER6yJNXQfby7n26hYDF/Mztxbc5tX7m6bqSXTsv
 ZZ2O3UHAZBQAHwvVooIKpCS8bHu9oHZ0fFAvTAeAyI3gZEJtW3HmiCpfDC4D1X3H6hHn
 rcuQZhXikUGTLEfD98KBS1GQ9PaQAEvknY1EM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739816085; x=1740420885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8K4RCJSnU+RO3rHmkI5kwNOQjsufnHHeX5JWoK5R0VI=;
 b=Jp7FNa2oZzdG85UL7KuYi7xyIFtREycrKWHRV5dqb7hq9evmjKaouSmVwcHJgpI/Zo
 hTyQX9YFwwkkbHp0Q0ZOWxsw5+fMpQCpt8ZDrq9Z/06m7wkUPm/kRJ4lO/bdisgVcQZ2
 ZN+cL54nZgwjjrl502GKWZPhtp9YLvMgKookhxKDPfnL1uRf46AnycxJSEWUyCKpFLAt
 JCNpgDb6YAh6loDGBGXo4NPdn2iiUuNafp4kJSs+22kqvCOAE4tK02JLolbITiTV67kP
 UNfAlBKbMgdVTjTQntaTYAEJAjtajls3TlykfHgbDIx/HG6gEJaoAVcPzmTaUayNU0nF
 ZYfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsyQps8Wh4IbIvrLto9NGlLNs5PQYNByjR+Tc3XI/Jgb28iTWPWRsROnqZFUR8oSTf+8AIjWswrnrRXw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw/ZplLsJgz0pi/VI3Lss3oXCGja3NQMxkBk7Owx/Huq5jogD/V
 T45KDDZWYIcygNwPgEK/9FYhbUeDnHBaCs0l4fv6mBnnLFPAH8v5sjS3u2re3rE=
X-Gm-Gg: ASbGncvu6BsmEH+q+cuHe34pSSmjU2pNna9ZjoCib8FMiPxWTINi4dxCtut/VP+d637
 zGGDBUfemIyVyq2gswM1Oo24CwlslxHdf9RCHFW9P5JFvdGTleyZygKAtx/rNiyEdBOVJ1obVIu
 F/JCjVeITDK9PZkk161gI8lD2AN7Jm70lSj5MvQI2a274dE2tLnlN+ab3DrBCfCmX0qb02cG1GY
 UvMqM7agyHE263Fezl0uUYzJrTx5XiUUqB06c+JirylBecUXnVuNV3ouevWIZ6ZoIv36n90vbbE
 6jf0BihBwgUi5x64WqmxyU7o6DgL7tTVVdaW5o6iwpWXw950fOI6isQRLzqZYOSMr2P8InZ3YOy
 Fpi6IuAPPKO5MOpZf1UTckUglInaPwQOqbPvn31mQJLXJNoheWOi9
X-Google-Smtp-Source: AGHT+IG5AWo/YKDBmRl6FCYU4VMVLf4cvI4bWzulM9IpuOtwQWhR42n+oXLXtiDPl0xJWJntvF3/Ew==
X-Received: by 2002:a17:906:6a03:b0:ab7:b043:bebd with SMTP id
 a640c23a62f3a-abb7091f620mr1213571166b.5.1739816085095; 
 Mon, 17 Feb 2025 10:14:45 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-4-36-33.retail.telecomitalia.it. [87.4.36.33])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbaa99f283sm113616666b.32.2025.02.17.10.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 10:14:44 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Mon, 17 Feb 2025 19:14:34 +0100
Message-ID: <20250217181439.1157972-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217181439.1157972-1-dario.binacchi@amarulasolutions.com>
References: <20250217181439.1157972-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Vikas Manocha <vikas.manocha@st.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 2/3] ARM: dts: stm32: drop "st,
	led1" compatible
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

It is pointless to use the custom compatible "st,led1" when
stm32746g-eval.dts and stm32f769-disco.dts already contain the
"gpio-leds" compatible, which is specifically used for GPIO LEDs
management. In the case of stm32f746-disco.dts, since it lacks the
"gpio-leds" compatible, it was decided to translate "st,led1" into
its "gpio-leds" version in stm32f746-disco-u-boot.dtsi.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/dts/stm32746g-eval-u-boot.dtsi    |  5 -----
 arch/arm/dts/stm32f746-disco-u-boot.dtsi   |  9 ++++++---
 arch/arm/dts/stm32f769-disco-u-boot.dtsi   |  5 -----
 board/st/stm32f746-disco/stm32f746-disco.c | 16 ----------------
 4 files changed, 6 insertions(+), 29 deletions(-)

diff --git a/arch/arm/dts/stm32746g-eval-u-boot.dtsi b/arch/arm/dts/stm32746g-eval-u-boot.dtsi
index f64329287357..32b5c7cea4b8 100644
--- a/arch/arm/dts/stm32746g-eval-u-boot.dtsi
+++ b/arch/arm/dts/stm32746g-eval-u-boot.dtsi
@@ -22,11 +22,6 @@
 		mmc0 = &sdio1;
 		spi0 = &qspi;
 	};
-
-	led1 {
-		compatible = "st,led1";
-		led-gpio = <&gpiof 10 0>;
-	};
 };
 
 &fmc {
diff --git a/arch/arm/dts/stm32f746-disco-u-boot.dtsi b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
index e0e2f9e23773..69b50c7a1076 100644
--- a/arch/arm/dts/stm32f746-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
@@ -33,9 +33,12 @@
 		};
 	};
 
-	led1 {
-		compatible = "st,led1";
-		led-gpio = <&gpioi 1 0>;
+	leds {
+		compatible = "gpio-leds";
+		led-usr {
+			gpios = <&gpioi 1 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
 	};
 };
 
diff --git a/arch/arm/dts/stm32f769-disco-u-boot.dtsi b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
index a50fba64dcd2..7c99a6e61b68 100644
--- a/arch/arm/dts/stm32f769-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
@@ -23,11 +23,6 @@
 		spi0 = &qspi;
 	};
 
-	led1 {
-		compatible = "st,led1";
-		led-gpio = <&gpioj 5 0>;
-	};
-
 	panel: panel {
 		compatible = "orisetech,otm8009a";
 		reset-gpios = <&gpioj 15 1>;
diff --git a/board/st/stm32f746-disco/stm32f746-disco.c b/board/st/stm32f746-disco/stm32f746-disco.c
index 65a39d965c72..72f479cea66f 100644
--- a/board/st/stm32f746-disco/stm32f746-disco.c
+++ b/board/st/stm32f746-disco/stm32f746-disco.c
@@ -78,22 +78,6 @@ u32 spl_boot_device(void)
 
 int board_late_init(void)
 {
-	struct gpio_desc gpio = {};
-	int node;
-
-	node = fdt_node_offset_by_compatible(gd->fdt_blob, 0, "st,led1");
-	if (node < 0)
-		return -1;
-
-	gpio_request_by_name_nodev(offset_to_ofnode(node), "led-gpio", 0, &gpio,
-				   GPIOD_IS_OUT);
-
-	if (dm_gpio_is_valid(&gpio)) {
-		dm_gpio_set_value(&gpio, 0);
-		mdelay(10);
-		dm_gpio_set_value(&gpio, 1);
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
