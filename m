Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B01E4ECF59
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Mar 2022 00:07:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27D6AC6046A;
	Wed, 30 Mar 2022 22:07:47 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D59B2C60465
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 22:07:45 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id bp39so19648053qtb.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 15:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sRUEm1X/1/QbZlRYOeI8IxvD9u7O2x2v7gb0o8DsW3g=;
 b=AwLCZ9VfhY6zQYww87XZf+poil2mzI5ofgq419xIQaRZqyPcLh1yGhCfD1znm5j2Bu
 vNOktJqqFG1R3+VvB7xmUtX7ycqY9N3yvhlUSEuOcNwqjYVutgAYL2H9JKE7i5BkTwxY
 ktedBfEh67uRM1iqV1OpGu9tbn8n+13kP3NwBE77zHdQMF2HTLLWXAS2o/BVYkrmUWvT
 GdThjXfLyGMubDZ+IbBD7QegN1xrjnP7XOvZtWhbRuXGLbrxq0MNOIiG9x1xChOW8anf
 ZT0xb7gUkEaA4ZJFyeKpGTcsKtEXIpNCVx7zYeBLJ/C9Buu01XDVG6oHpdZ9aHwjfpFi
 nDxw==
X-Gm-Message-State: AOAM532wFAZ+bdO8xO1xr3o0ijzP5AIoX+hbPzunnYRp+tP62wMPOlle
 QIWAlxUWcsaDkNXkbxR8lw==
X-Google-Smtp-Source: ABdhPJzYq2SbPhVNjzg0tqghKK3MYXvQgYH1U9Bi46PMPPhtPz7j/+L4E9B6UYKhah6q6FLzZV4Ahg==
X-Received: by 2002:a05:622a:256:b0:2e1:a01b:a538 with SMTP id
 c22-20020a05622a025600b002e1a01ba538mr1667678qtx.167.1648678064831; 
 Wed, 30 Mar 2022 15:07:44 -0700 (PDT)
Received: from bill-the-cat.lan
 (2603-6081-7b01-cbda-2ef0-5dff-fedb-a8ba.res6.spectrum.com.
 [2603:6081:7b01:cbda:2ef0:5dff:fedb:a8ba])
 by smtp.gmail.com with ESMTPSA id
 h2-20020ac85842000000b002e1ec550506sm17749694qth.87.2022.03.30.15.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 15:07:44 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de
Date: Wed, 30 Mar 2022 18:07:19 -0400
Message-Id: <20220330220735.908616-9-trini@konsulko.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330220735.908616-1-trini@konsulko.com>
References: <20220330220735.908616-1-trini@konsulko.com>
MIME-Version: 1.0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Kamil Lulko <kamil.lulko@gmail.com>
Subject: [Uboot-stm32] [PATCH 09/25] stm32f429-discovery: Migrate
	CONFIG_*_LED out of CONFIG namespace
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

These values are only used in one file, reference them more directly.

Cc: Kamil Lulko <kamil.lulko@gmail.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: uboot-stm32@st-md-mailman.stormreply.com
Signed-off-by: Tom Rini <trini@konsulko.com>
---
 board/st/stm32f429-discovery/led.c    | 19 +++++++++++--------
 include/configs/stm32f429-discovery.h |  3 ---
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/board/st/stm32f429-discovery/led.c b/board/st/stm32f429-discovery/led.c
index 539c139bb5dd..8dda6a97bd1c 100644
--- a/board/st/stm32f429-discovery/led.c
+++ b/board/st/stm32f429-discovery/led.c
@@ -8,30 +8,33 @@
 #include <status_led.h>
 #include <asm-generic/gpio.h>
 
+#define RED_LED			110
+#define GREEN_LED		109
+
 void coloured_LED_init(void)
 {
-	gpio_request(CONFIG_RED_LED, "red led");
-	gpio_direction_output(CONFIG_RED_LED, 0);
-	gpio_request(CONFIG_GREEN_LED, "green led");
-	gpio_direction_output(CONFIG_GREEN_LED, 0);
+	gpio_request(RED_LED, "red led");
+	gpio_direction_output(RED_LED, 0);
+	gpio_request(GREEN_LED, "green led");
+	gpio_direction_output(GREEN_LED, 0);
 }
 
 void red_led_off(void)
 {
-	gpio_set_value(CONFIG_RED_LED, 0);
+	gpio_set_value(RED_LED, 0);
 }
 
 void green_led_off(void)
 {
-	gpio_set_value(CONFIG_GREEN_LED, 0);
+	gpio_set_value(GREEN_LED, 0);
 }
 
 void red_led_on(void)
 {
-	gpio_set_value(CONFIG_RED_LED, 1);
+	gpio_set_value(RED_LED, 1);
 }
 
 void green_led_on(void)
 {
-	gpio_set_value(CONFIG_GREEN_LED, 1);
+	gpio_set_value(GREEN_LED, 1);
 }
diff --git a/include/configs/stm32f429-discovery.h b/include/configs/stm32f429-discovery.h
index c9649a085ef1..21bab5aafd54 100644
--- a/include/configs/stm32f429-discovery.h
+++ b/include/configs/stm32f429-discovery.h
@@ -17,9 +17,6 @@
 
 #define CONFIG_SYS_MAX_FLASH_SECT	12
 
-#define CONFIG_RED_LED			110
-#define CONFIG_GREEN_LED		109
-
 #define CONFIG_SYS_HZ_CLOCK		1000000	/* Timer is clocked at 1MHz */
 
 #define CONFIG_SYS_CBSIZE		1024
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
