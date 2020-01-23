Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F1514711F
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Jan 2020 19:49:32 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8DAB8C36B0B
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Jan 2020 18:49:32 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 654A8C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2020 18:49:30 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id m25so3989737ioo.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2020 10:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ojxkx586E0eoibhBJsWnMupYgoYcR7RkhoJDqDjKtCM=;
 b=kbgUqagJWAi9Bi+KUwQ6hzM2IIqKnDxWB/fsHWu3Gbb8a3GaBurWDwxZ85RMqtvcZh
 HROvpFDwG2XtfnK+S2NItAGL2tQG386D2W0qm1bJkSkIUWjn+8dH+3upxu5P4HSOWiRd
 Y0ca4XxyEHROHnn3OAEi85a4OKtZUuPak6ymE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ojxkx586E0eoibhBJsWnMupYgoYcR7RkhoJDqDjKtCM=;
 b=LuZpDDM0iXbUEH747WUQ2MNILUftRsSYGwOL3uPfdtQcwQdUh8UqICXjcOsQQB7t05
 CU75HBLXaCw7w2Koyk1+rqOVrHlM6KteSeMjQw+p+bMRBpI6SvWI2nceJFBObWsh4CP7
 0sapapQRMK8UmrKp9WvKX05g5UzIbTCX+kJy1TD7AVlYREMbWa0aDTHVpjuxxOl45BO7
 ldKbvjHMdon49fbHnoHchJjXZWyzxtyDAUKXpmi9SJ97QjYuaXjVSXPHeTje/+ghCS4C
 i009yC66WHfrllx8vyeF9UJ/rR9hibeCEa7KGpf5WAdC+jyOMXJv+BYYHWl3t0TWv3XO
 h/tQ==
X-Gm-Message-State: APjAAAVfiogr+jXkivObZmRPS89tTKP58+/O8baDC8bNWYJ3TNOV++tX
 EZS36HHgoaVsIkZWFI9VNHeXJw==
X-Google-Smtp-Source: APXvYqyf7tePifpya28/pW+J4ps63Bv1ph2obQzeFSsk2WUH5HB6qrow4f0Kfucq/sDAm+y5Im20BQ==
X-Received: by 2002:a5d:80d6:: with SMTP id h22mr11697132ior.129.1579805369227; 
 Thu, 23 Jan 2020 10:49:29 -0800 (PST)
Received: from kiwi.bld.corp.google.com ([2620:15c:183:0:8223:87c:a681:66aa])
 by smtp.gmail.com with ESMTPSA id
 u16sm860662iln.40.2020.01.23.10.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 10:49:28 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Thu, 23 Jan 2020 11:48:21 -0700
Message-Id: <20200123114556.v3.18.Ie7424420136cfef8fd8002027a3988764fede49c@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200123184826.116850-1-sjg@chromium.org>
References: <20200123184826.116850-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Jun Chen <ptchentw@gmail.com>, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Heiko Schocher <hs@denx.de>
Subject: [Uboot-stm32] [PATCH v3 18/23] i2c: stm32: Update to use standard
	enums for speed
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

Update this driver to use the new standard enums for speed.

Signed-off-by: Simon Glass <sjg@chromium.org>
Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>
Tested-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Heiko Schocher <hs@denx.de>
---

Changes in v3:
- Drop note about moving to driver model
- Use ARRAY_SIZE() for i2c_specs bounds check

Changes in v2: None

 drivers/i2c/stm32f7_i2c.c | 43 +++++++++++++++------------------------
 1 file changed, 16 insertions(+), 27 deletions(-)

diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
index 2b18735fea..21dfa5023b 100644
--- a/drivers/i2c/stm32f7_i2c.c
+++ b/drivers/i2c/stm32f7_i2c.c
@@ -115,17 +115,6 @@ struct stm32_i2c_regs {
 
 #define STM32_NSEC_PER_SEC			1000000000L
 
-#define STANDARD_RATE				100000
-#define FAST_RATE				400000
-#define FAST_PLUS_RATE				1000000
-
-enum stm32_i2c_speed {
-	STM32_I2C_SPEED_STANDARD, /* 100 kHz */
-	STM32_I2C_SPEED_FAST, /* 400 kHz */
-	STM32_I2C_SPEED_FAST_PLUS, /* 1 MHz */
-	STM32_I2C_SPEED_END,
-};
-
 /**
  * struct stm32_i2c_spec - private i2c specification timing
  * @rate: I2C bus speed (Hz)
@@ -164,7 +153,7 @@ struct stm32_i2c_spec {
  * @analog_filter: Analog filter delay (On/Off)
  */
 struct stm32_i2c_setup {
-	enum stm32_i2c_speed speed;
+	enum i2c_speed_mode speed;
 	u32 speed_freq;
 	u32 clock_src;
 	u32 rise_time;
@@ -198,8 +187,8 @@ struct stm32_i2c_priv {
 };
 
 static const struct stm32_i2c_spec i2c_specs[] = {
-	[STM32_I2C_SPEED_STANDARD] = {
-		.rate = STANDARD_RATE,
+	[IC_SPEED_MODE_STANDARD] = {
+		.rate = I2C_SPEED_STANDARD_RATE,
 		.rate_min = 8000,
 		.rate_max = 120000,
 		.fall_max = 300,
@@ -210,8 +199,8 @@ static const struct stm32_i2c_spec i2c_specs[] = {
 		.l_min = 4700,
 		.h_min = 4000,
 	},
-	[STM32_I2C_SPEED_FAST] = {
-		.rate = FAST_RATE,
+	[IC_SPEED_MODE_FAST] = {
+		.rate = I2C_SPEED_FAST_RATE,
 		.rate_min = 320000,
 		.rate_max = 480000,
 		.fall_max = 300,
@@ -222,8 +211,8 @@ static const struct stm32_i2c_spec i2c_specs[] = {
 		.l_min = 1300,
 		.h_min = 600,
 	},
-	[STM32_I2C_SPEED_FAST_PLUS] = {
-		.rate = FAST_PLUS_RATE,
+	[IC_SPEED_MODE_FAST_PLUS] = {
+		.rate = I2C_SPEED_FAST_PLUS_RATE,
 		.rate_min = 800000,
 		.rate_max = 1200000,
 		.fall_max = 100,
@@ -648,9 +637,9 @@ static int stm32_i2c_compute_timing(struct stm32_i2c_priv *i2c_priv,
 	struct list_head solutions;
 	int ret;
 
-	if (setup->speed >= STM32_I2C_SPEED_END) {
+	if (setup->speed >= ARRAY_SIZE(i2c_specs)) {
 		pr_err("%s: speed out of bound {%d/%d}\n", __func__,
-		       setup->speed, STM32_I2C_SPEED_END - 1);
+		       setup->speed, ARRAY_SIZE(i2c_specs) - 1);
 		return -EINVAL;
 	}
 
@@ -719,7 +708,7 @@ static int stm32_i2c_setup_timing(struct stm32_i2c_priv *i2c_priv,
 		if (ret) {
 			debug("%s: failed to compute I2C timings.\n",
 			      __func__);
-			if (i2c_priv->speed > STM32_I2C_SPEED_STANDARD) {
+			if (i2c_priv->speed > IC_SPEED_MODE_STANDARD) {
 				i2c_priv->speed--;
 				setup->speed = i2c_priv->speed;
 				setup->speed_freq =
@@ -784,14 +773,14 @@ static int stm32_i2c_set_bus_speed(struct udevice *bus, unsigned int speed)
 	struct stm32_i2c_priv *i2c_priv = dev_get_priv(bus);
 
 	switch (speed) {
-	case STANDARD_RATE:
-		i2c_priv->speed = STM32_I2C_SPEED_STANDARD;
+	case I2C_SPEED_STANDARD_RATE:
+		i2c_priv->speed = IC_SPEED_MODE_STANDARD;
 		break;
-	case FAST_RATE:
-		i2c_priv->speed = STM32_I2C_SPEED_FAST;
+	case I2C_SPEED_FAST_RATE:
+		i2c_priv->speed = IC_SPEED_MODE_FAST;
 		break;
-	case FAST_PLUS_RATE:
-		i2c_priv->speed = STM32_I2C_SPEED_FAST_PLUS;
+	case I2C_SPEED_FAST_PLUS_RATE:
+		i2c_priv->speed = IC_SPEED_MODE_FAST_PLUS;
 		break;
 	default:
 		debug("%s: Speed %d not supported\n", __func__, speed);
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
