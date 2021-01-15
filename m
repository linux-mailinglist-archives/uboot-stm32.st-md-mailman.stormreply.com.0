Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E34AE2F7DA1
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Jan 2021 15:05:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACA1FC32EA7;
	Fri, 15 Jan 2021 14:05:28 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D361C424BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jan 2021 14:05:28 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id y19so18317249iov.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jan 2021 06:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eWtqn43tXcfyKexzP2MrlTL0bje+gyJV27gX9ss1Sss=;
 b=fR0BA/ZaPqXuy9aCgn110EQkwGstsdx5uQQCepycXIwVU+wQSGEk19q1vmff2NzE1u
 HpTMHVJUdSqOrx50JM5xw3D/G5ig5kYtbsFdYN3oTqG+r5946PeitW4+pKCev8IyC/et
 kSeGxDOplxuqpsOPZZqThxjA896VItughAuGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eWtqn43tXcfyKexzP2MrlTL0bje+gyJV27gX9ss1Sss=;
 b=T8qEKJotEqN1ihmNHkK9Rfoymr7YQPsUxB5sGp41z06NQQ7yjup/Sc/BikRDB6PD7n
 UHlXSWPSPcxAT9n9P1ftNfm10yLgtfEF2d9443nYv2ZIrpUjD4QmVLTMzh1vzJc8ziTo
 DQKmfOzvfZcwjje4kUeLKHcbV6DEdIfTBWAQAzlxV2iv9FESQD8gGIarT1vrWWkP6jyx
 N1if2ogi2R6flV7Z1qyWLmgztqJhl9fETop5FYDYpUqbOspEzrr2MjGa0JL7s6YqquDG
 1vDunPNrTeEUsjD3SQ6z8EcORqWkQ20vc5ZTqx8GUkxXhzgvYkHadCQyxePYGeCC74MP
 RLNw==
X-Gm-Message-State: AOAM531Q4h2i8uuDVGlUcWHIbvCC/NXHBMALKP+o12nGd3zn2OfUD1BW
 ggjLGtXQyUJozJOyEIMOq8bJaA==
X-Google-Smtp-Source: ABdhPJyzITvBTNn4Aa2x2xs3ZIbhWAFUS/g+bkFl1iTIewVkbgr6uTDcXHBd9tmCiR8A5ErNTH0dmg==
X-Received: by 2002:a6b:e716:: with SMTP id b22mr21243ioh.138.1610719527036;
 Fri, 15 Jan 2021 06:05:27 -0800 (PST)
Received: from localhost.localdomain (c-67-190-101-114.hsd1.co.comcast.net.
 [67.190.101.114])
 by smtp.gmail.com with ESMTPSA id 1sm5664843ilv.37.2021.01.15.06.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 06:05:26 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Fri, 15 Jan 2021 07:04:48 -0700
Message-Id: <20210115140500.846307-4-sjg@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210115140500.846307-1-sjg@chromium.org>
References: <20210115140500.846307-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Bin Meng <bmeng.cn@gmail.com>, Walter Lozano <walter.lozano@collabora.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Pratyush Yadav <p.yadav@ti.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Wolfgang Wallner <wolfgang.wallner@br-automation.com>,
 Heiko Schocher <hs@denx.de>, Pavel Herrmann <morpheus.ibis@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dario Binacchi <dariobin@libero.it>
Subject: [Uboot-stm32] [PATCH 03/15] dm: gpio: Rename get_dir_flags() method
	to get_flags()
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

It is more useful to be able to read all the flags, not just the direction
ones. In fact this is what the STM32 driver does. Update the method name
to reflect this.

Tweak the docs a little and use 'flagsp' as the return argument, as is
common in driver model, to indicate it returns a value.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 drivers/gpio/gpio-uclass.c      | 30 +++++++++++++++---------------
 drivers/gpio/sandbox.c          |  8 ++++----
 drivers/gpio/stm32_gpio.c       |  8 ++++----
 drivers/pinctrl/pinctrl-stmfx.c |  8 ++++----
 include/asm-generic/gpio.h      | 13 +++++++------
 5 files changed, 34 insertions(+), 33 deletions(-)

diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
index 0862a28bf86..83d3cf0a6b3 100644
--- a/drivers/gpio/gpio-uclass.c
+++ b/drivers/gpio/gpio-uclass.c
@@ -682,39 +682,39 @@ int dm_gpio_set_dir(struct gpio_desc *desc)
 	return _dm_gpio_update_flags(desc, desc->flags);
 }
 
-int dm_gpio_get_dir_flags(struct gpio_desc *desc, ulong *flags)
+int dm_gpio_get_dir_flags(struct gpio_desc *desc, ulong *flagsp)
 {
 	struct udevice *dev = desc->dev;
 	int ret, value;
 	struct dm_gpio_ops *ops = gpio_get_ops(dev);
-	ulong dir_flags;
+	ulong flags;
 
-	ret = check_reserved(desc, "get_dir_flags");
+	ret = check_reserved(desc, "get_flags");
 	if (ret)
 		return ret;
 
 	/* GPIOD_ are directly provided by driver except GPIOD_ACTIVE_LOW */
-	if (ops->get_dir_flags) {
-		ret = ops->get_dir_flags(dev, desc->offset, &dir_flags);
+	if (ops->get_flags) {
+		ret = ops->get_flags(dev, desc->offset, &flags);
 		if (ret)
 			return ret;
 
 		/* GPIOD_ACTIVE_LOW is saved in desc->flags */
-		value = dir_flags & GPIOD_IS_OUT_ACTIVE ? 1 : 0;
+		value = flags & GPIOD_IS_OUT_ACTIVE ? 1 : 0;
 		if (desc->flags & GPIOD_ACTIVE_LOW)
 			value = !value;
-		dir_flags &= ~(GPIOD_ACTIVE_LOW | GPIOD_IS_OUT_ACTIVE);
-		dir_flags |= (desc->flags & GPIOD_ACTIVE_LOW);
+		flags &= ~(GPIOD_ACTIVE_LOW | GPIOD_IS_OUT_ACTIVE);
+		flags |= (desc->flags & GPIOD_ACTIVE_LOW);
 		if (value)
-			dir_flags |= GPIOD_IS_OUT_ACTIVE;
+			flags |= GPIOD_IS_OUT_ACTIVE;
 	} else {
-		dir_flags = desc->flags;
+		flags = desc->flags;
 		/* only GPIOD_IS_OUT_ACTIVE is provided by uclass */
-		dir_flags &= ~GPIOD_IS_OUT_ACTIVE;
+		flags &= ~GPIOD_IS_OUT_ACTIVE;
 		if ((desc->flags & GPIOD_IS_OUT) && _gpio_get_value(desc))
-			dir_flags |= GPIOD_IS_OUT_ACTIVE;
+			flags |= GPIOD_IS_OUT_ACTIVE;
 	}
-	*flags = dir_flags;
+	*flagsp = flags;
 
 	return 0;
 }
@@ -1309,8 +1309,8 @@ static int gpio_post_bind(struct udevice *dev)
 			ops->xlate += gd->reloc_off;
 		if (ops->update_flags)
 			ops->update_flags += gd->reloc_off;
-		if (ops->get_dir_flags)
-			ops->get_dir_flags += gd->reloc_off;
+		if (ops->get_flags)
+			ops->get_flags += gd->reloc_off;
 
 		reloc_done++;
 	}
diff --git a/drivers/gpio/sandbox.c b/drivers/gpio/sandbox.c
index 029908dc9f9..fd14d4e8b5f 100644
--- a/drivers/gpio/sandbox.c
+++ b/drivers/gpio/sandbox.c
@@ -199,11 +199,11 @@ static int sb_gpio_update_flags(struct udevice *dev, unsigned int offset,
 	return 0;
 }
 
-static int sb_gpio_get_dir_flags(struct udevice *dev, unsigned int offset,
-				 ulong *flags)
+static int sb_gpio_get_flags(struct udevice *dev, unsigned int offset,
+			     ulong *flagsp)
 {
 	debug("%s: offset:%u\n", __func__, offset);
-	*flags = *get_gpio_dir_flags(dev, offset);
+	*flagsp = *get_gpio_dir_flags(dev, offset);
 
 	return 0;
 }
@@ -273,7 +273,7 @@ static const struct dm_gpio_ops gpio_sandbox_ops = {
 	.get_function		= sb_gpio_get_function,
 	.xlate			= sb_gpio_xlate,
 	.update_flags		= sb_gpio_update_flags,
-	.get_dir_flags		= sb_gpio_get_dir_flags,
+	.get_flags		= sb_gpio_get_flags,
 #if CONFIG_IS_ENABLED(ACPIGEN)
 	.get_acpi		= sb_gpio_get_acpi,
 #endif
diff --git a/drivers/gpio/stm32_gpio.c b/drivers/gpio/stm32_gpio.c
index daae6ddb93f..06a1f28cb77 100644
--- a/drivers/gpio/stm32_gpio.c
+++ b/drivers/gpio/stm32_gpio.c
@@ -221,8 +221,8 @@ static int stm32_gpio_update_flags(struct udevice *dev, unsigned int offset,
 	return 0;
 }
 
-static int stm32_gpio_get_dir_flags(struct udevice *dev, unsigned int offset,
-				    ulong *flags)
+static int stm32_gpio_get_flags(struct udevice *dev, unsigned int offset,
+				ulong *flagsp)
 {
 	struct stm32_gpio_priv *priv = dev_get_priv(dev);
 	struct stm32_gpio_regs *regs = priv->regs;
@@ -257,7 +257,7 @@ static int stm32_gpio_get_dir_flags(struct udevice *dev, unsigned int offset,
 	default:
 		break;
 	}
-	*flags = dir_flags;
+	*flagsp = dir_flags;
 
 	return 0;
 }
@@ -269,7 +269,7 @@ static const struct dm_gpio_ops gpio_stm32_ops = {
 	.set_value		= stm32_gpio_set_value,
 	.get_function		= stm32_gpio_get_function,
 	.update_flags		= stm32_gpio_update_flags,
-	.get_dir_flags		= stm32_gpio_get_dir_flags,
+	.get_flags		= stm32_gpio_get_flags,
 };
 
 static int gpio_stm32_probe(struct udevice *dev)
diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index 084d5cef7aa..6477febbaa1 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -199,8 +199,8 @@ static int stmfx_gpio_update_flags(struct udevice *dev, unsigned int offset,
 	return ret;
 }
 
-static int stmfx_gpio_get_dir_flags(struct udevice *dev, unsigned int offset,
-				    ulong *flags)
+static int stmfx_gpio_get_flags(struct udevice *dev, unsigned int offset,
+				ulong *flagsp)
 {
 	ulong dir_flags = 0;
 	int ret;
@@ -233,7 +233,7 @@ static int stmfx_gpio_get_dir_flags(struct udevice *dev, unsigned int offset,
 				dir_flags |= GPIOD_PULL_DOWN;
 		}
 	}
-	*flags = dir_flags;
+	*flagsp = dir_flags;
 
 	return 0;
 }
@@ -267,7 +267,7 @@ static const struct dm_gpio_ops stmfx_gpio_ops = {
 	.direction_input = stmfx_gpio_direction_input,
 	.direction_output = stmfx_gpio_direction_output,
 	.update_flags = stmfx_gpio_update_flags,
-	.get_dir_flags = stmfx_gpio_get_dir_flags,
+	.get_flags = stmfx_gpio_get_flags,
 };
 
 U_BOOT_DRIVER(stmfx_gpio) = {
diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
index 4626e7d92ae..48e042dc44b 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -309,7 +309,7 @@ struct dm_gpio_ops {
 	 * If any flags cannot be set (e.g. the driver or hardware does not
 	 * support them or this particular GPIO does not have the requested
 	 * feature), the driver should perform what changes it can. The uclass
-	 * can read the current flags back with a call to get_dir_flags() if
+	 * can read the current flags back with a call to get_flags() if
 	 * desired.
 	 *
 	 * The uclass checks that flags do not obviously conflict (e.g. input
@@ -335,19 +335,20 @@ struct dm_gpio_ops {
 			    ulong flags);
 
 	/**
-	 * get_dir_flags() - Get GPIO dir flags
+	 * get_flags() - Get GPIO flags
 	 *
-	 * This function return the GPIO direction flags used.
+	 * This function return the GPIO flags used. It should read this from
+	 * the hardware directly.
 	 *
 	 * This method is optional.
 	 *
 	 * @dev:	GPIO device
 	 * @offset:	GPIO offset within that device
-	 * @flags:	place to put the used direction flags by GPIO
+	 * @flagsp:	place to put the current flags value
 	 * @return 0 if OK, -ve on error
 	 */
-	int (*get_dir_flags)(struct udevice *dev, unsigned int offset,
-			     ulong *flags);
+	int (*get_flags)(struct udevice *dev, unsigned int offset,
+			 ulong *flagsp);
 
 #if CONFIG_IS_ENABLED(ACPIGEN)
 	/**
-- 
2.30.0.284.gd98b1dd5eaa7-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
