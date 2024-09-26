Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E547987A2D
	for <lists+uboot-stm32@lfdr.de>; Thu, 26 Sep 2024 22:48:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE998C6DD72;
	Thu, 26 Sep 2024 20:48:28 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA455C6B45B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 20:48:21 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-6c3603292abso10251376d6.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 13:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1727383700; x=1727988500;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9CG6IbZBUWbZy/dZT3ria1L5MDEPanLUMQQV8PtW684=;
 b=V4QPDAHb0V8nMA74PNMdFsWcTctyngxl2FgbJMDd20o/MiijP3I3ZMs8QDb5gt/PGM
 hYwZV82Vv1tpjnlxhOKyjGK13Lk5nTUqp90L2FAQwnqoQt6EmhMWZsbFq3xOyuSlzixd
 ECzT3NMMo8wYDpRYu0l2ZcxME2pRQeg/qaVYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727383700; x=1727988500;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9CG6IbZBUWbZy/dZT3ria1L5MDEPanLUMQQV8PtW684=;
 b=T9ssUof4IJlNVVepmC3yEuALE3W3q8xfIqQLPQAoisr/Papz60J6PbdFeo9b6AzJnW
 M/1XxKkaxIc4iMBly+8KNnOpUceDTuYGz1n/VWWkbA1rE+0lSZLc7XOkTFkyuZ0o7T1p
 pn9zu2XUpXH50FiTf10XmHBvkZQtOsI9iLQ73dDpWlhwAmvhunAxDM/I7GnN8rGluaXy
 Fbkp+VBJtc8Jv6e8J0KvPV4QH9LvXesVbP47sZtd0RLnILBcD106K19pASZMfO5DDLs7
 0HH3mlcr0UwLGRhOTtzbMSW1vwjNpY7hTNJLxdMwWmXn5igw37l9cSEJ6/rdxIyoZgLe
 YDDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIp6DmxBySqrxIVz8yVxbabBcTKF68OE89v6cnLbxI2+bDseEL4Cui0nQLE+8JFc2+5MqrTa1qZJ5vaA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx2fQ5mYoDMFJ++J8G22cnJQ6pJAN7Rl4kvcS+f8RIsbTBFIKJe
 h9U1kUGUI22ByGfgbSPHI/qDKVcqwrZoRfURpOWQb9yG4VaiDAAkl0PHCfH5hg==
X-Google-Smtp-Source: AGHT+IFh14V1nsVLi2QeigrH/ovkwEVnOLrEBiqxaNE6H3WhpLIpbyl9ZmR9JQzvJCT05+sY9HmeTw==
X-Received: by 2002:a05:6214:4a8e:b0:6cb:2cfa:3b9e with SMTP id
 6a1803df08f44-6cb3b5e5023mr16955176d6.11.1727383700645; 
 Thu, 26 Sep 2024 13:48:20 -0700 (PDT)
Received: from chromium.org ([205.220.129.31])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cb3b66cff5sm2538696d6.77.2024.09.26.13.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 13:48:20 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Thu, 26 Sep 2024 22:44:24 +0200
Message-ID: <20240926204455.963584-5-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240926204455.963584-1-sjg@chromium.org>
References: <20240926204455.963584-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Kamil Lulko <kamil.lulko@gmail.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 04/27] st: stm32f429: Drop old LED code
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
