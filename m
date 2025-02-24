Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 815C5A42BB7
	for <lists+uboot-stm32@lfdr.de>; Mon, 24 Feb 2025 19:39:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46572C6C83D;
	Mon, 24 Feb 2025 18:39:42 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8676EC78F60
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2025 18:39:40 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5ded6c31344so6756652a12.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2025 10:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1740422380; x=1741027180;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=enUKzWs4bk/vm7Y9BX8WLo5RD1KmFcoENCp06KN9Mb4=;
 b=Nh+8V2MShVIYqZS2zg0/Mt2GEh+dk8W0w3N5LFQ2YVWRdWCLsx/SVAVLsQGhhrAaNw
 1dqX36Fyjid5CJVYONTXSamffAxeMkv+npOByAB6/iv0j2zotf153LhrQlvPo6FfkS5+
 sZUUUrrw9S/B9b0Ky0w2kQJ227z6GSTbkXu5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740422380; x=1741027180;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=enUKzWs4bk/vm7Y9BX8WLo5RD1KmFcoENCp06KN9Mb4=;
 b=Y2qvvNwl2jPqLcTvpyByDCFJ7UVIcb6XO1dy8d5w4LTVT3WosgmMqlLUZ7YvAxuPZ6
 mwuDmSDoIS6nIuyBEn0vEaVWqYLenyKjB7QFVpv7t3WmiyW1eiHV/vf9i7oZm3wJBLCL
 +WGs1LAp576jOrZdvxBxwMYa3TQeDkikmulOKrfNyZuzHrAY6HzQVa9luCzqdU4NoAhm
 MCt277mmmPg7/fcZuT+tIoESMw5rSLXDWQT+QyYUG4jd+sWiyJFdT+cJheyZ5hvHtG+t
 gGrE8DeU4UqndcX1Ks5TCqnH4ROKatkva62XBrURnm976g1euHManXeZnk9eXfqHk/ey
 vyYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUakCsfuseIPJYEpFuS7ZGNoIBD4W3pCpke7UC/A6Abf3snj59QOpUbhgnPU1eSob4QGhqPfSw9eXGsMg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzjqB/OdEG/wYhc+vxcFkNU9ZUzG78pDyuGPDsJzc7SpgHjw780
 j78u8WtuXpWg53m2zYO94r3kk5wbwNFpBhFbwFoPEahjrgoPG9ZsPvBr7dI6D5U=
X-Gm-Gg: ASbGnctSmSSCEMhZBauvaWedRYsU18OheonHZCuInWIGRWhPcFUKqMqvIczZPeIQY3N
 H00xV6fA27JYyNSFjbuIMTkotZ0WzFAilmrcVZUdSpBEP5s0PjjPH9r4b2IFYIYxGuGcEaM0F6j
 KsCoEph8VyNRvOjdOllq+/6+w50Nezo/dqYVTaBHXVvameintqjcqT5Bhcm31uXZ/gBZBLMvjYF
 8ecnIc1BxUsQIq4Rl87pvmFVvaHZOXDU5e9MecaAcpUpIXN6DRthe8QABcM6e9A8RvKPFmLt7t4
 OVfEUBpobCncAaG80MiDF+fjm3D51TAA87NDCepUvACtJUtZJh0jHedyR+bdjSr/4/uYoIiHNDJ
 60gulSQNRPd4mLZxwgQ==
X-Google-Smtp-Source: AGHT+IEW/wSEtuXw54VsANS6Dn9JRBH17aNkP/vy9z8UiH6VVLRL5JjfOoqv+ym2eSLZ48FqEvQOtA==
X-Received: by 2002:a05:6402:13d1:b0:5d0:c697:1f02 with SMTP id
 4fb4d7f45d1cf-5e4469dad6amr148498a12.17.1740422380061; 
 Mon, 24 Feb 2025 10:39:40 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2.196.124.195]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e0a2e25589sm8046911a12.42.2025.02.24.10.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 10:39:39 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Mon, 24 Feb 2025 19:39:26 +0100
Message-ID: <20250224183931.313491-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224183931.313491-1-dario.binacchi@amarulasolutions.com>
References: <20250224183931.313491-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Vikas Manocha <vikas.manocha@st.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH v2 2/3] ARM: dts: stm32: drop "st,
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
management.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Drop leds node from stm32f746-disco-u-boot.dtsi

 arch/arm/dts/stm32746g-eval-u-boot.dtsi    |  5 -----
 arch/arm/dts/stm32f746-disco-u-boot.dtsi   |  5 -----
 arch/arm/dts/stm32f769-disco-u-boot.dtsi   |  5 -----
 board/st/stm32f746-disco/stm32f746-disco.c | 16 ----------------
 4 files changed, 31 deletions(-)

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
index a79fca261a2c..38d797e49a0a 100644
--- a/arch/arm/dts/stm32f746-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
@@ -22,11 +22,6 @@
 		mmc0 = &sdio1;
 		spi0 = &qspi;
 	};
-
-	led1 {
-		compatible = "st,led1";
-		led-gpio = <&gpioi 1 0>;
-	};
 };
 
 &ltdc {
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
