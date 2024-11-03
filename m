Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 877A39BA34A
	for <lists+uboot-stm32@lfdr.de>; Sun,  3 Nov 2024 01:35:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48469C71292;
	Sun,  3 Nov 2024 00:35:46 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C913BC71290
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Nov 2024 00:35:38 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-20c70abba48so27458155ad.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 02 Nov 2024 17:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1730594137; x=1731198937;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W6lPGYgtc+6jQZ9TUbI9+VQGxMBaV4EQW1fljF9RDRo=;
 b=UThpfxvp2jWh19mdMluv8XDsaSaK7Ay/vRR95024u1nmIRThiU+zNkj+RcUhW/Eyj7
 ezSFaHUu8mQchDdLU8nbToNU40p4LGKAjbSwZhkRPUxirxVmfHceEh6L7uwLb2NKZWZ2
 R1h3NcXqgHAt+cqAhrpDrcoYVfWH11OjfkRCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730594137; x=1731198937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W6lPGYgtc+6jQZ9TUbI9+VQGxMBaV4EQW1fljF9RDRo=;
 b=jnbYTvHUk52GJABxXQJNM9OO4zsEsS6sBCp/va1JqWRNWlV2kImvY2HSvRi3pHtFnY
 ofWz2I0FA7dU/B9Cihx9Kf9B4Ikqot0plcXk+vOzhc3HUFSmZywaXNyGx25S9dp4oFSq
 twC9syv5k8WglLpFlK2gMb+txw0esYE5QPVBoxo9U1w6XFtpgIzwJ/7r3UvxMJ4pbdbs
 Q+8VjNHh2JDMBg080zvSWO3p1Q+7RSO57WtetHibpH3nReMBbUWpfUGNTRUXSWKOCQ6w
 kc79qST/03V8PAm1DPVm8UQfu6y13haW+bQnVeTvDrSN3lS4GSTyL32pwVz7JmiZWP+I
 Imjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQ5GYEVIHCmjmTHp0L/I7+2oknGNYmQLeaRS8Y430KNoh2EsvwB52TWu3CBYPPT4H/yO+yPWd0Mjz6lA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzU3+yBscjNkqqx0oAZHllzjYeHyYtf1hIDm2XeIHyY1DlwxKlX
 YE5bsqChxKf2jOBX3NwL53PWtSu6P62W82Oh8upY3EItYlKs9PuBsl7O+/O70mTbFU4PkfR3fA/
 +9w==
X-Google-Smtp-Source: AGHT+IGkWLuX6ippWlPvGf7rzjNsydx0g+auB/UGfJgLHATHjnp55nyEiEjLO6m1BQYLH+cunXKlZw==
X-Received: by 2002:a17:903:2350:b0:20f:5443:9ec1 with SMTP id
 d9443c01a7336-2111af6c144mr109929445ad.33.1730594137424; 
 Sat, 02 Nov 2024 17:35:37 -0700 (PDT)
Received: from chromium.org ([205.220.129.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211057a63f2sm38987995ad.168.2024.11.02.17.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 17:35:36 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sat,  2 Nov 2024 18:33:00 -0600
Message-ID: <20241103003322.626036-9-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241103003322.626036-1-sjg@chromium.org>
References: <20241103003322.626036-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Kamil Lulko <kamil.lulko@gmail.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 08/25] st: stm32f429: Drop old LED code
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
