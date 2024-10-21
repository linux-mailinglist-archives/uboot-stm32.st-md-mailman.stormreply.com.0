Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DB39A66C0
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Oct 2024 13:38:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93236C78035;
	Mon, 21 Oct 2024 11:38:59 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE3A3C78036
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 11:38:58 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a9a0ec0a94fso527308566b.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 04:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1729510738; x=1730115538;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W6lPGYgtc+6jQZ9TUbI9+VQGxMBaV4EQW1fljF9RDRo=;
 b=nSy0+bKjiDIvn8CtnQA+9zI9Gr610uvfm9kqkVsHHu4H2YoCEfIbQdh6Bgb4IoUXzM
 wgJDGpZIJL0jqKDvdX60bkQjHrYa1gajKs2QE5HFoW9tRytV2OqenDvnuBqRbF7XV9gq
 0cCzK6eTxpB/vhaTfry5qf0cTpNF08jqqpvSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729510738; x=1730115538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W6lPGYgtc+6jQZ9TUbI9+VQGxMBaV4EQW1fljF9RDRo=;
 b=mdBMBaBcJVOtORMvoShApK97KCN4rNKaA8zDaziJkx+g1mqCI8CEEcifVtT4FpSWbA
 G8daZ0Jdy8xcSfDS+2Fm3ufsk3VEXLNlVu8I2ZUwq2KSDvJBsHKuofjYhTZH75Cl7VVJ
 gawZXHUDgPjTNbUKqqPuZxAHGZP9VzXST0ZTPIr20TynqqVYssDz/bw22m2I+D1yDN4g
 edTgmIi33tNIeCr52YgufkXysUX5uJsErkQBAfgNVs+pAd+NRx8VI9mgnerBl0FpRzmx
 sUpHeUDK4c51UHCqC4sC+dGgBMRdtJt9fglFwRWnGF+gKGrhzW2AHhdCAR5aayqK9dmW
 z3LQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9+v+wdxeX1k/KR2rmWzoFLsYppKLD6g+mh46iX6Xpaw96+kXp/2KO8GqlouiJ8ahcvK/Y5RbncDGVHw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwjqEL9aL8tdOTKDBHouFWst6A/fDwdwgK/BcczOz6XUwPmHHF4
 +uRQR015myrwuCusHd0w4aWozs51KUZ1OdBjp4DNunyBpHk1373/Us2U5MShPg==
X-Google-Smtp-Source: AGHT+IGTRiDPmgvx9SP4AEiOiK5RpVCIaJjpKgk/y/RNiL0XYhM1AsZMo1jX81wlJlq0U6XVj/cbOA==
X-Received: by 2002:a17:907:7b85:b0:a9a:b70:2a7c with SMTP id
 a640c23a62f3a-a9a69a7627fmr1234083466b.25.1729510738198; 
 Mon, 21 Oct 2024 04:38:58 -0700 (PDT)
Received: from chromium.org (43-114-103-145.static.glaslokaal.nl.
 [145.103.114.43]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91571ea5sm191604366b.160.2024.10.21.04.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 04:38:57 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Mon, 21 Oct 2024 13:38:17 +0200
Message-ID: <20241021113839.318572-10-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241021113839.318572-1-sjg@chromium.org>
References: <20241021113839.318572-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Kamil Lulko <kamil.lulko@gmail.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 09/25] st: stm32f429: Drop old LED code
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

This predates the LED framework, so drop it.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v1)

 board/st/stm32f429-discovery/Makefile |  1 -
 board/st/stm32f429-discovery/led.c    | 39 ---------------------------
 2 files changed, 40 deletions(-)
 delete mode 100644 board/st/stm32f429-discovery/led.c

diff --git a/board/st/stm32f429-discovery/Makefile b/board/st/stm32f429-discovery/Makefile
index 6b02c0fddec..233eafdad3d 100644
--- a/board/st/stm32f429-discovery/Makefile
+++ b/board/st/stm32f429-discovery/Makefile
@@ -7,4 +7,3 @@
 # Kamil Lulko, <kamil.lulko@gmail.com>
 
 obj-y	:= stm32f429-discovery.o
-obj-y	+= led.o
diff --git a/board/st/stm32f429-discovery/led.c b/board/st/stm32f429-discovery/led.c
deleted file mode 100644
index 4b8038341b9..00000000000
--- a/board/st/stm32f429-discovery/led.c
+++ /dev/null
@@ -1,39 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * (C) Copyright 2015
- * Kamil Lulko, <kamil.lulko@gmail.com>
- */
-
-#include <status_led.h>
-#include <asm-generic/gpio.h>
-
-#define RED_LED			110
-#define GREEN_LED		109
-
-void coloured_LED_init(void)
-{
-	gpio_request(RED_LED, "red led");
-	gpio_direction_output(RED_LED, 0);
-	gpio_request(GREEN_LED, "green led");
-	gpio_direction_output(GREEN_LED, 0);
-}
-
-void red_led_off(void)
-{
-	gpio_set_value(RED_LED, 0);
-}
-
-void green_led_off(void)
-{
-	gpio_set_value(GREEN_LED, 0);
-}
-
-void red_led_on(void)
-{
-	gpio_set_value(RED_LED, 1);
-}
-
-void green_led_on(void)
-{
-	gpio_set_value(GREEN_LED, 1);
-}
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
