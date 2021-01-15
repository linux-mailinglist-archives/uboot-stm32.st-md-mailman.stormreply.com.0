Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB132F7DA2
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Jan 2021 15:05:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4EBAC424BE;
	Fri, 15 Jan 2021 14:05:30 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78A24C424C0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jan 2021 14:05:28 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id u17so18324686iow.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jan 2021 06:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lvdRCpE68LOtmGb0bteNkMFy6sFkv1s3xqZq9jWGF10=;
 b=RxHzsV0+bjr6QkINuLD65qbzSGyx9zF0EygUpGVUApEAIr+8Oz87w6jI/HwD6usGcw
 i2S7FFsOTKI9jaPBPk77bPDIoZcOLfTlfY8ZqNvx9dVF+hTd821nJ9cofTmnGViGwu9u
 k5Y3tgjZXf5SqytPtBvS2okbR13w2oxZb1XMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lvdRCpE68LOtmGb0bteNkMFy6sFkv1s3xqZq9jWGF10=;
 b=E/iRqJnnTM8OuAYclNJAu8j9wGAcBE/5xTqaPVjlc+NzN1gdSl+HDxSkx+F6q6/4HE
 PMDBkTGPn5hLPQ1IsO2G4QiuFJDLVAf+04wx9f0ZF0XeEaXZ8HAdJx+A1l9Ixf1VtinG
 fjXVdxaFJ96pJdasrWXUBrH7OGdHMhJ+o28Gcou3KrUDA2A5cPIUVRGpH2KbPaR+D0tR
 KnjEP1IspO4bmfBVP2PYhRRD58jamgdXjkBXHkxKMVnUNP+x/n0/SYX6FanqjV1RLAJs
 Pnyb4afW9Gf4ig8SpZJwPWyyoy0M6zjuucsD/oH4v/oz5E0xQQm8H1dF0mi3BnlK1JJO
 QPpw==
X-Gm-Message-State: AOAM532DznlXy3Wa69FE98GYjwpNmN/mfuz+CRdIHvsNSStn1tPsir3J
 43Owpj0DwRzdLxc1o/8OxVdW5g==
X-Google-Smtp-Source: ABdhPJwLX18YU4ZZTiTfyZcpbcUVFqwfyzRV0TRzVdByxBBl1TxfWF5BAVb7yJMI+KHbdW5fo53E4A==
X-Received: by 2002:a05:6638:526:: with SMTP id
 j6mr10430986jar.1.1610719525919; 
 Fri, 15 Jan 2021 06:05:25 -0800 (PST)
Received: from localhost.localdomain (c-67-190-101-114.hsd1.co.comcast.net.
 [67.190.101.114])
 by smtp.gmail.com with ESMTPSA id 1sm5664843ilv.37.2021.01.15.06.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 06:05:25 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Fri, 15 Jan 2021 07:04:47 -0700
Message-Id: <20210115140500.846307-3-sjg@chromium.org>
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
Subject: [Uboot-stm32] [PATCH 02/15] dm: gpio: Rename set_dir_flags() method
	to update_flags()
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

The current method is a misnomer since it is also used (e.g. by stm32) to
update pull settings and open source/open drain.

Rename it and expand the documentation to cover a few more details.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 drivers/gpio/gpio-uclass.c      | 16 ++++++++--------
 drivers/gpio/sandbox.c          |  6 +++---
 drivers/gpio/stm32_gpio.c       |  6 +++---
 drivers/pinctrl/pinctrl-stmfx.c |  6 +++---
 include/asm-generic/gpio.h      | 30 ++++++++++++++++++++++++------
 test/dm/gpio.c                  |  8 ++++----
 6 files changed, 45 insertions(+), 27 deletions(-)

diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
index e84b68db772..0862a28bf86 100644
--- a/drivers/gpio/gpio-uclass.c
+++ b/drivers/gpio/gpio-uclass.c
@@ -619,7 +619,7 @@ static int check_dir_flags(ulong flags)
 	return 0;
 }
 
-static int _dm_gpio_set_dir_flags(struct gpio_desc *desc, ulong flags)
+static int _dm_gpio_update_flags(struct gpio_desc *desc, ulong flags)
 {
 	struct udevice *dev = desc->dev;
 	struct dm_gpio_ops *ops = gpio_get_ops(dev);
@@ -637,9 +637,9 @@ static int _dm_gpio_set_dir_flags(struct gpio_desc *desc, ulong flags)
 		return ret;
 	}
 
-	/* GPIOD_ are directly managed by driver in set_dir_flags*/
-	if (ops->set_dir_flags) {
-		ret = ops->set_dir_flags(dev, desc->offset, flags);
+	/* GPIOD_ are directly managed by driver in update_flags */
+	if (ops->update_flags) {
+		ret = ops->update_flags(dev, desc->offset, flags);
 	} else {
 		if (flags & GPIOD_IS_OUT) {
 			ret = ops->direction_output(dev, desc->offset,
@@ -666,7 +666,7 @@ int dm_gpio_set_dir_flags(struct gpio_desc *desc, ulong flags)
 
 	/* combine the requested flags (for IN/OUT) and the descriptor flags */
 	flags |= desc->flags;
-	ret = _dm_gpio_set_dir_flags(desc, flags);
+	ret = _dm_gpio_update_flags(desc, flags);
 
 	return ret;
 }
@@ -679,7 +679,7 @@ int dm_gpio_set_dir(struct gpio_desc *desc)
 	if (ret)
 		return ret;
 
-	return _dm_gpio_set_dir_flags(desc, desc->flags);
+	return _dm_gpio_update_flags(desc, desc->flags);
 }
 
 int dm_gpio_get_dir_flags(struct gpio_desc *desc, ulong *flags)
@@ -1307,8 +1307,8 @@ static int gpio_post_bind(struct udevice *dev)
 			ops->get_function += gd->reloc_off;
 		if (ops->xlate)
 			ops->xlate += gd->reloc_off;
-		if (ops->set_dir_flags)
-			ops->set_dir_flags += gd->reloc_off;
+		if (ops->update_flags)
+			ops->update_flags += gd->reloc_off;
 		if (ops->get_dir_flags)
 			ops->get_dir_flags += gd->reloc_off;
 
diff --git a/drivers/gpio/sandbox.c b/drivers/gpio/sandbox.c
index dc8d506e8d4..029908dc9f9 100644
--- a/drivers/gpio/sandbox.c
+++ b/drivers/gpio/sandbox.c
@@ -177,8 +177,8 @@ static int sb_gpio_xlate(struct udevice *dev, struct gpio_desc *desc,
 	return 0;
 }
 
-static int sb_gpio_set_dir_flags(struct udevice *dev, unsigned int offset,
-				 ulong flags)
+static int sb_gpio_update_flags(struct udevice *dev, unsigned int offset,
+				ulong flags)
 {
 	ulong *dir_flags;
 
@@ -272,7 +272,7 @@ static const struct dm_gpio_ops gpio_sandbox_ops = {
 	.set_value		= sb_gpio_set_value,
 	.get_function		= sb_gpio_get_function,
 	.xlate			= sb_gpio_xlate,
-	.set_dir_flags		= sb_gpio_set_dir_flags,
+	.update_flags		= sb_gpio_update_flags,
 	.get_dir_flags		= sb_gpio_get_dir_flags,
 #if CONFIG_IS_ENABLED(ACPIGEN)
 	.get_acpi		= sb_gpio_get_acpi,
diff --git a/drivers/gpio/stm32_gpio.c b/drivers/gpio/stm32_gpio.c
index 79d55e812db..daae6ddb93f 100644
--- a/drivers/gpio/stm32_gpio.c
+++ b/drivers/gpio/stm32_gpio.c
@@ -189,8 +189,8 @@ static int stm32_gpio_get_function(struct udevice *dev, unsigned int offset)
 	return GPIOF_FUNC;
 }
 
-static int stm32_gpio_set_dir_flags(struct udevice *dev, unsigned int offset,
-				    ulong flags)
+static int stm32_gpio_update_flags(struct udevice *dev, unsigned int offset,
+				   ulong flags)
 {
 	struct stm32_gpio_priv *priv = dev_get_priv(dev);
 	struct stm32_gpio_regs *regs = priv->regs;
@@ -268,7 +268,7 @@ static const struct dm_gpio_ops gpio_stm32_ops = {
 	.get_value		= stm32_gpio_get_value,
 	.set_value		= stm32_gpio_set_value,
 	.get_function		= stm32_gpio_get_function,
-	.set_dir_flags		= stm32_gpio_set_dir_flags,
+	.update_flags		= stm32_gpio_update_flags,
 	.get_dir_flags		= stm32_gpio_get_dir_flags,
 };
 
diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index 7cf08dbddd1..084d5cef7aa 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -163,8 +163,8 @@ static int stmfx_gpio_direction_output(struct udevice *dev,
 	return stmfx_write_reg(dev, STMFX_REG_GPIO_DIR, offset, 1);
 }
 
-static int stmfx_gpio_set_dir_flags(struct udevice *dev, unsigned int offset,
-				    ulong flags)
+static int stmfx_gpio_update_flags(struct udevice *dev, unsigned int offset,
+				   ulong flags)
 {
 	int ret = -ENOTSUPP;
 
@@ -266,7 +266,7 @@ static const struct dm_gpio_ops stmfx_gpio_ops = {
 	.get_function = stmfx_gpio_get_function,
 	.direction_input = stmfx_gpio_direction_input,
 	.direction_output = stmfx_gpio_direction_output,
-	.set_dir_flags = stmfx_gpio_set_dir_flags,
+	.update_flags = stmfx_gpio_update_flags,
 	.get_dir_flags = stmfx_gpio_get_dir_flags,
 };
 
diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
index 82294cbdc57..4626e7d92ae 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -301,20 +301,38 @@ struct dm_gpio_ops {
 		     struct ofnode_phandle_args *args);
 
 	/**
-	 * set_dir_flags() - Set GPIO dir flags
+	 * update_flags() - Adjust GPIO flags
 	 *
 	 * This function should set up the GPIO configuration according to the
-	 * information provide by the direction flags bitfield.
+	 * information provide by @flags.
+	 *
+	 * If any flags cannot be set (e.g. the driver or hardware does not
+	 * support them or this particular GPIO does not have the requested
+	 * feature), the driver should perform what changes it can. The uclass
+	 * can read the current flags back with a call to get_dir_flags() if
+	 * desired.
+	 *
+	 * The uclass checks that flags do not obviously conflict (e.g. input
+	 * and output). If the driver finds other conflicts it should return
+	 * -ERECALLCONFLICT
+	 *
+	 * Note that GPIOD_ACTIVE_LOW should be ignored, since the uclass
+	 * adjusts for it automatically. For example, for an output GPIO,
+	 * GPIOD_ACTIVE_LOW causes GPIOD_IS_OUT_ACTIVE to be inverted by the
+	 * uclass, so the driver always sees the value that should be set at the
+	 * pin (1=high, 0=low).
 	 *
 	 * This method is optional.
 	 *
 	 * @dev:	GPIO device
 	 * @offset:	GPIO offset within that device
-	 * @flags:	GPIO configuration to use
-	 * @return 0 if OK, -ve on error
+	 * @flags:	New flags value (GPIOD_...)
+	 *
+	 * @return 0 if OK, -ERECALLCONFLICT if flags conflict in some
+	 *	non-obvious way and were not applied, other -ve on error
 	 */
-	int (*set_dir_flags)(struct udevice *dev, unsigned int offset,
-			     ulong flags);
+	int (*update_flags)(struct udevice *dev, unsigned int offset,
+			    ulong flags);
 
 	/**
 	 * get_dir_flags() - Get GPIO dir flags
diff --git a/test/dm/gpio.c b/test/dm/gpio.c
index d7b85e74ce5..a08c3590d71 100644
--- a/test/dm/gpio.c
+++ b/test/dm/gpio.c
@@ -81,12 +81,12 @@ static int dm_test_gpio(struct unit_test_state *uts)
 	/* Make it an open drain output, and reset it */
 	ut_asserteq(GPIOD_IS_OUT | GPIOD_IS_OUT_ACTIVE,
 		    sandbox_gpio_get_dir_flags(dev, offset));
-	ut_assertok(ops->set_dir_flags(dev, offset,
-				       GPIOD_IS_OUT | GPIOD_OPEN_DRAIN));
+	ut_assertok(ops->update_flags(dev, offset,
+				      GPIOD_IS_OUT | GPIOD_OPEN_DRAIN));
 	ut_asserteq(GPIOD_IS_OUT | GPIOD_OPEN_DRAIN,
 		    sandbox_gpio_get_dir_flags(dev, offset));
-	ut_assertok(ops->set_dir_flags(dev, offset,
-				       GPIOD_IS_OUT | GPIOD_IS_OUT_ACTIVE));
+	ut_assertok(ops->update_flags(dev, offset,
+				      GPIOD_IS_OUT | GPIOD_IS_OUT_ACTIVE));
 	ut_asserteq(GPIOD_IS_OUT | GPIOD_IS_OUT_ACTIVE,
 		    sandbox_gpio_get_dir_flags(dev, offset));
 
-- 
2.30.0.284.gd98b1dd5eaa7-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
