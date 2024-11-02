Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 847C29BA2BC
	for <lists+uboot-stm32@lfdr.de>; Sat,  2 Nov 2024 23:21:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A634C71292;
	Sat,  2 Nov 2024 22:21:23 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62FC8C6DD6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Nov 2024 22:21:16 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-20c803787abso23666985ad.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 02 Nov 2024 15:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1730586075; x=1731190875;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W6lPGYgtc+6jQZ9TUbI9+VQGxMBaV4EQW1fljF9RDRo=;
 b=iRyIOdOTnxvwTgUKBvFRJ1F/eTNvn41Ah1e3rDH0HNTUVy8tuzMVNF4UVE+6JEuvaA
 Yv3MMtMPrUy+Lp4xEDjwFSTYYQK5s9bK+WTW5A+m+BA8VLrLcpUVrmz4zAWOm9EaKKUv
 lHERkVY2CBUTsG6rqbU+CkyVX6cxIZsxoEXQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730586075; x=1731190875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W6lPGYgtc+6jQZ9TUbI9+VQGxMBaV4EQW1fljF9RDRo=;
 b=ccNtP4Wgb5/MPhNQKs5DmSQAKMyGXQQZh7bUrDRzJOPg+NcotzjeiCNVCY+o0aMYOZ
 kxam8vMgLTVfmbJIeXI7GfOZI8yzWes8f8W+JfAicedlFglwjLym8UVkGs4L7nWIhEvr
 HsN3ivl7j8LAcrIDY5217oIrkYZ2G+c8xeZeI8Yn6+GjcxrRZBTuSlBcq9EvCn5gx2Yi
 rkTihNrX63kznd8MxT5ctr/s42LOzlGX2T+pInfrz+qzWbmj7cyJSgDcJgwDEl8GHbZh
 Xp6/rUOQB/+G13vdS3WtpBKqjEv5YrhP6zKf8sAS8mjFZJhedF7eBbXCNZQyePLgMgPu
 hn8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBGk6duMxGfsehMSZ9kG1NUXV2ay2Ns5qAT+O750Cmg2E9FXeOJTVJytAAcRRSIVP9BrpHHrorYeXpDQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyNTS5jwkkr5eGa/QLC07r4cA4e84B4ua7RqoGdy7ATnQS7ndI3
 gTXzdp2/RhiDhhj8XFtjyNjWxMiJr8IHCO6XUhBxKB2D88pYce2COGJD7Mq8Fg==
X-Google-Smtp-Source: AGHT+IHSTpaXrN2fufcX4TooVer4jNyqL+wr5u1YM7hFaVuQee93ERt4+XUlEStD52Zr5c/cuAsl8Q==
X-Received: by 2002:a17:903:2cc:b0:20b:a409:329 with SMTP id
 d9443c01a7336-2111938ae9bmr110811605ad.5.1730586074953; 
 Sat, 02 Nov 2024 15:21:14 -0700 (PDT)
Received: from chromium.org ([205.220.129.19])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7ee45a0081esm4386286a12.59.2024.11.02.15.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 15:21:13 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sat,  2 Nov 2024 16:17:06 -0600
Message-ID: <20241102221737.547938-9-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241102221737.547938-1-sjg@chromium.org>
References: <20241102221737.547938-1-sjg@chromium.org>
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
