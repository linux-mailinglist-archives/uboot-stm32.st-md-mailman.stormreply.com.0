Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53083768DE5
	for <lists+uboot-stm32@lfdr.de>; Mon, 31 Jul 2023 09:18:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17A51C71292;
	Mon, 31 Jul 2023 07:18:23 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D64BC6A5E6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 12:38:12 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-4fb8574a3a1so1186624e87.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 05:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689856692; x=1690461492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/KZrhZrqiVdn5n8gz0ReZJzeLX7eg9+htgLnIhkF1Gg=;
 b=SyDpWHPnx6xNEgVzOqTcAxDTIErZ6ZY0FRF8VFQ0nc26LAb5SyTWyHBRZsnq8s4PtD
 UP14VjYcmslAhTaqRiM24uCWr5tLrOcJhqb/B8gVJi4G6LETanY2tYcn3X53FO4LeyHI
 JChtDG1QeZYT6MlsaBIt2HbKqWeu9TuuU9XyKLTxnqoQiB2ANP8JXE7L2IBP0lz4Qyjv
 Fs8KTtQ+J5LSLRM5zp19bSd02ya5MregA7zqnztD2GwFC1qXX4RnSVb12uzMcKMk/T7m
 UmaU3yKC4ttWCqlL3Qkrv/kzkcVOZbcoSXwjHPeQwcq6K04vZpqZl4EBQbrIzTX+M3VZ
 J6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689856692; x=1690461492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/KZrhZrqiVdn5n8gz0ReZJzeLX7eg9+htgLnIhkF1Gg=;
 b=Fg1mYk8ln0LSd9eXH74N1FaD0MlsOJPltaQ6XV+SsEkovq1PfQVF6yYNIFrsbljsBI
 RQvOmY+L56QxanG99BBKZzUSm5Wiaw7erkxJG2v18gEuE4bo5hGDvDaJ0P9AiCTTWdF6
 wlk39/PyYuMvrXt9YY2qf9UgCZ5PQO3j6Q5gpqh9OiPCvheinwH2mm2fx6mzVf31DKSb
 /d1nuMUnmqrubjC/VHphXy3H+Z9aVgqLFfn6av+YIp0EjFZJZ95v7ZsTASlYbf3IZ71A
 1EEiVDRPQv4EZC2Pz2uCccXFPlrbToqKyr/PhiWjOqGmikgyS0ba8DszL+7xBYlX0//y
 q9Qw==
X-Gm-Message-State: ABy/qLYeijeu4CvgiLHWt6n+QUcvThpKLORD4PnnE6zHr+MrnwQd92+o
 hiUhXH1x+HLk4D9mtr85NvY=
X-Google-Smtp-Source: APBJJlF+PvMB2Ra4mxZlxIAaetgofG2NcFZEj4qUz/WOhd56CYKBtVPwPfiVkJwzaaik4XpvJSF8OQ==
X-Received: by 2002:ac2:442d:0:b0:4f3:b588:48d0 with SMTP id
 w13-20020ac2442d000000b004f3b58848d0mr1911883lfl.14.1689856691555; 
 Thu, 20 Jul 2023 05:38:11 -0700 (PDT)
Received: from xeon.. ([188.163.112.64]) by smtp.gmail.com with ESMTPSA id
 m25-20020ac24ad9000000b004fb9c625b4asm184401lfp.210.2023.07.20.05.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 05:38:11 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Simon Glass <sjg@chromium.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Kever Yang <kever.yang@rock-chips.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Anatolij Gustschin <agust@denx.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Eugen Hristev <eugen.hristev@collabora.com>
Date: Thu, 20 Jul 2023 15:37:38 +0300
Message-Id: <20230720123744.26854-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230720123744.26854-1-clamor95@gmail.com>
References: <20230720123744.26854-1-clamor95@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:18:21 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 u-boot@dh-electronics.com, u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH v2 1/7] power: regulator: expand basic
	reference counter onto all uclass
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

Commit is based on 4fcba5d ("regulator: implement basic reference
counter") but expands the idea to all regulators instead of just
fixed/gpio regulators.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/power/regulator/regulator-uclass.c | 41 ++++++++++++++++++++++
 drivers/power/regulator/regulator_common.c | 22 ------------
 drivers/power/regulator/regulator_common.h | 21 -----------
 include/power/regulator.h                  |  2 ++
 4 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/drivers/power/regulator/regulator-uclass.c b/drivers/power/regulator/regulator-uclass.c
index 3a6ba69f6d..fc7a4631b4 100644
--- a/drivers/power/regulator/regulator-uclass.c
+++ b/drivers/power/regulator/regulator-uclass.c
@@ -159,6 +159,25 @@ int regulator_get_enable(struct udevice *dev)
 	return ops->get_enable(dev);
 }
 
+/*
+ * Enable or Disable a regulator
+ *
+ * This is a reentrant function and subsequent calls that enable will
+ * increase an internal counter, and disable calls will decrease the counter.
+ * The actual resource will be enabled when the counter gets to 1 coming from 0,
+ * and disabled when it reaches 0 coming from 1.
+ *
+ * @dev: regulator device
+ * @enable: bool indicating whether to enable or disable the regulator
+ * @return:
+ * 0 on Success
+ * -EBUSY if the regulator cannot be disabled because it's requested by
+ *        another device
+ * -EALREADY if the regulator has already been enabled or has already been
+ *        disabled
+ * -EACCES if there is no possibility to enable/disable the regulator
+ * -ve on different error situation
+ */
 int regulator_set_enable(struct udevice *dev, bool enable)
 {
 	const struct dm_regulator_ops *ops = dev_get_driver_ops(dev);
@@ -172,6 +191,23 @@ int regulator_set_enable(struct udevice *dev, bool enable)
 	if (!enable && uc_pdata->always_on)
 		return -EACCES;
 
+	/* If previously enabled, increase count */
+	if (enable && uc_pdata->enable_count > 0) {
+		uc_pdata->enable_count++;
+		return -EALREADY;
+	}
+
+	if (!enable) {
+		if (uc_pdata->enable_count > 1) {
+			/* If enabled multiple times, decrease count */
+			uc_pdata->enable_count--;
+			return -EBUSY;
+		} else if (!uc_pdata->enable_count) {
+			/* If already disabled, do nothing */
+			return -EALREADY;
+		}
+	}
+
 	if (uc_pdata->ramp_delay)
 		old_enable = regulator_get_enable(dev);
 
@@ -187,6 +223,11 @@ int regulator_set_enable(struct udevice *dev, bool enable)
 		}
 	}
 
+	if (enable)
+		uc_pdata->enable_count++;
+	else
+		uc_pdata->enable_count--;
+
 	return ret;
 }
 
diff --git a/drivers/power/regulator/regulator_common.c b/drivers/power/regulator/regulator_common.c
index e26f5ebec3..d88bc6f6de 100644
--- a/drivers/power/regulator/regulator_common.c
+++ b/drivers/power/regulator/regulator_common.c
@@ -72,23 +72,6 @@ int regulator_common_set_enable(const struct udevice *dev,
 		return 0;
 	}
 
-	/* If previously enabled, increase count */
-	if (enable && plat->enable_count > 0) {
-		plat->enable_count++;
-		return -EALREADY;
-	}
-
-	if (!enable) {
-		if (plat->enable_count > 1) {
-			/* If enabled multiple times, decrease count */
-			plat->enable_count--;
-			return -EBUSY;
-		} else if (!plat->enable_count) {
-			/* If already disabled, do nothing */
-			return -EALREADY;
-		}
-	}
-
 	ret = dm_gpio_set_value(&plat->gpio, enable);
 	if (ret) {
 		pr_err("Can't set regulator : %s gpio to: %d\n", dev->name,
@@ -103,10 +86,5 @@ int regulator_common_set_enable(const struct udevice *dev,
 	if (!enable && plat->off_on_delay_us)
 		udelay(plat->off_on_delay_us);
 
-	if (enable)
-		plat->enable_count++;
-	else
-		plat->enable_count--;
-
 	return 0;
 }
diff --git a/drivers/power/regulator/regulator_common.h b/drivers/power/regulator/regulator_common.h
index d4962899d8..15f1fa4c93 100644
--- a/drivers/power/regulator/regulator_common.h
+++ b/drivers/power/regulator/regulator_common.h
@@ -13,7 +13,6 @@ struct regulator_common_plat {
 	struct gpio_desc gpio; /* GPIO for regulator enable control */
 	unsigned int startup_delay_us;
 	unsigned int off_on_delay_us;
-	unsigned int enable_count;
 };
 
 int regulator_common_of_to_plat(struct udevice *dev,
@@ -21,26 +20,6 @@ int regulator_common_of_to_plat(struct udevice *dev,
 				char *enable_gpio_name);
 int regulator_common_get_enable(const struct udevice *dev,
 	struct regulator_common_plat *plat);
-/*
- * Enable or Disable a regulator
- *
- * This is a reentrant function and subsequent calls that enable will
- * increase an internal counter, and disable calls will decrease the counter.
- * The actual resource will be enabled when the counter gets to 1 coming from 0,
- * and disabled when it reaches 0 coming from 1.
- *
- * @dev: regulator device
- * @plat: Platform data
- * @enable: bool indicating whether to enable or disable the regulator
- * @return:
- * 0 on Success
- * -EBUSY if the regulator cannot be disabled because it's requested by
- *        another device
- * -EALREADY if the regulator has already been enabled or has already been
- *        disabled
- * -EACCES if there is no possibility to enable/disable the regulator
- * -ve on different error situation
- */
 int regulator_common_set_enable(const struct udevice *dev,
 	struct regulator_common_plat *plat, bool enable);
 
diff --git a/include/power/regulator.h b/include/power/regulator.h
index ff1bfc2435..727776a8cf 100644
--- a/include/power/regulator.h
+++ b/include/power/regulator.h
@@ -158,6 +158,7 @@ enum regulator_flag {
  * @name**     - fdt regulator name - should be taken from the device tree
  * ctrl_reg:   - Control register offset used to enable/disable regulator
  * volt_reg:   - register offset for writing voltage vsel values
+ * enable_count - counter of enable calls for this regulator
  *
  * Note:
  * *  - set automatically on device probe by the uclass's '.pre_probe' method.
@@ -184,6 +185,7 @@ struct dm_regulator_uclass_plat {
 	u8 volt_reg;
 	bool suspend_on;
 	u32 suspend_uV;
+	u32 enable_count;
 };
 
 /* Regulator device operations */
-- 
2.39.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
