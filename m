Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E74768DDF
	for <lists+uboot-stm32@lfdr.de>; Mon, 31 Jul 2023 09:18:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68A68C71286;
	Mon, 31 Jul 2023 07:18:22 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 956CFC6905A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jul 2023 07:05:16 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2b701e41cd3so81802271fa.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jul 2023 00:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689663916; x=1692255916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A6G7E5ipCrosvGQQkn4jfmgHERivNKh0KXtbT0v6bdI=;
 b=lhi5H7PTSGoByXRKWlMP+MqB+8SUeCKvSERpCvXKUL8pv6Ceg2Sn4UQXW3esRJGqHc
 s31QollA+nCvrS+81U6WL5hYtecgp3qZ99xnTivQJ4BdWVomOjg4KykOS8qcoj1AAtHf
 rQTy7FR4o7+uk+2m5m9rBgczUpsfAjIVVOSjL9jIhaIWemtebAQV1fo9kPAjCYqBlQSf
 66PK50ueTkHFn0wduzFGUxlSIh7W2rXrvfPnhhwPD7HXTlKeipTOZ6pwdpTa5rtVdrWh
 H4Juz9zi1+gXiB0fVREzQyia+mKETWfRCDKeJxmwrqp+fk/90f2K1ay/pjKmOc/VA3nA
 koZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689663916; x=1692255916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A6G7E5ipCrosvGQQkn4jfmgHERivNKh0KXtbT0v6bdI=;
 b=GtHQopz2WK/aykBzX3wARMcCa3UFAnBAn9PNf0U19Lg2pzzYhtIVXQ0myUYzAKgxxT
 Y08zN22HIye77nY2SyT9vezy4QeWU6JTbiDkgZUoy1wHaQDIZcVC6H5sRzHYHzPV7b1p
 dV9RCNsxf8Ymf9f0ll4iaqTkAUimSX1ScLCqvHlzOiK5/ZuyEYFW3sK48mEJNaDy5wUS
 3K+9mjfbp5u9E2UCnKZIFIfDiOg6lNYoTgXgaMhQzlLQd0BXyCgBDubC+E8GIyVSbBAs
 ywgXikIv9sqMyfwtTvcDwO+fbIgBHqqHvHZaEI4rwUYaJAIDNGiBCs29xfWy1sFito1z
 GmoQ==
X-Gm-Message-State: ABy/qLbzMQ7FVOdAS+28VmX20D/m02HS4qMtEYAgjJ8V/JOWejum+XS5
 19l51w04VJM7QC/HtnlYrFg=
X-Google-Smtp-Source: APBJJlG2j75yRD6AyGnEhb0NOPh5333sAHBsN8LRDXrdsvEe6kC2qqNPbHTqK1WhW3HLE01+E3o9HQ==
X-Received: by 2002:a2e:888a:0:b0:2b8:39e4:2e2c with SMTP id
 k10-20020a2e888a000000b002b839e42e2cmr7964182lji.1.1689663915601; 
 Tue, 18 Jul 2023 00:05:15 -0700 (PDT)
Received: from xeon.. ([188.163.112.64]) by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c220a00b003fbfea1afffsm1343644wml.27.2023.07.18.00.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 00:05:14 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Simon Glass <sjg@chromium.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Kever Yang <kever.yang@rock-chips.com>,
 Kostya Porotchkin <kostap@marvell.com>,
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
Date: Tue, 18 Jul 2023 10:05:02 +0300
Message-Id: <20230718070504.19810-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718070504.19810-1-clamor95@gmail.com>
References: <20230718070504.19810-1-clamor95@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:18:21 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 u-boot@dh-electronics.com, u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH v1 2/4] power: regulator-uclass: perform
	regulator setup inside uclass
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

Regulators initial setup was previously dependent on board call.
To move from this behaviour were introduced two steps. First is
that all individual regulators will be probed just after binding
which ensures that regulator pdata is filled and second is setting
up regulator in post probe which enseres that correct regulator
state according to pdata is reached.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/power/regulator/regulator-uclass.c | 212 ++++++---------------
 include/power/regulator.h                  | 119 ------------
 2 files changed, 62 insertions(+), 269 deletions(-)

diff --git a/drivers/power/regulator/regulator-uclass.c b/drivers/power/regulator/regulator-uclass.c
index c9194fe95c..8edc983eae 100644
--- a/drivers/power/regulator/regulator-uclass.c
+++ b/drivers/power/regulator/regulator-uclass.c
@@ -308,112 +308,6 @@ int device_get_supply_regulator(struct udevice *dev, const char *supply_name,
 					    supply_name, devp);
 }
 
-int regulator_autoset(struct udevice *dev)
-{
-	struct dm_regulator_uclass_plat *uc_pdata;
-	int ret = 0;
-
-	uc_pdata = dev_get_uclass_plat(dev);
-
-	ret = regulator_set_suspend_enable(dev, uc_pdata->suspend_on);
-	if (ret == -ENOSYS)
-		ret = 0;
-
-	if (!ret && uc_pdata->suspend_on) {
-		ret = regulator_set_suspend_value(dev, uc_pdata->suspend_uV);
-		if (ret == -ENOSYS)
-			ret = 0;
-
-		if (ret)
-			return ret;
-	}
-
-	if (!uc_pdata->always_on && !uc_pdata->boot_on)
-		return -EMEDIUMTYPE;
-
-	if (uc_pdata->type == REGULATOR_TYPE_FIXED)
-		return regulator_set_enable(dev, true);
-
-	if (uc_pdata->flags & REGULATOR_FLAG_AUTOSET_UV)
-		ret = regulator_set_value(dev, uc_pdata->min_uV);
-	if (uc_pdata->init_uV > 0)
-		ret = regulator_set_value(dev, uc_pdata->init_uV);
-	if (!ret && (uc_pdata->flags & REGULATOR_FLAG_AUTOSET_UA))
-		ret = regulator_set_current(dev, uc_pdata->min_uA);
-
-	if (!ret)
-		ret = regulator_set_enable(dev, true);
-
-	return ret;
-}
-
-int regulator_unset(struct udevice *dev)
-{
-	struct dm_regulator_uclass_plat *uc_pdata;
-
-	uc_pdata = dev_get_uclass_plat(dev);
-	if (uc_pdata && uc_pdata->force_off)
-		return regulator_set_enable(dev, false);
-
-	return -EMEDIUMTYPE;
-}
-
-static void regulator_show(struct udevice *dev, int ret)
-{
-	struct dm_regulator_uclass_plat *uc_pdata;
-
-	uc_pdata = dev_get_uclass_plat(dev);
-
-	printf("%s@%s: ", dev->name, uc_pdata->name);
-	if (uc_pdata->flags & REGULATOR_FLAG_AUTOSET_UV)
-		printf("set %d uV", uc_pdata->min_uV);
-	if (uc_pdata->flags & REGULATOR_FLAG_AUTOSET_UA)
-		printf("; set %d uA", uc_pdata->min_uA);
-	printf("; enabling");
-	if (ret)
-		printf(" (ret: %d)", ret);
-	printf("\n");
-}
-
-int regulator_autoset_by_name(const char *platname, struct udevice **devp)
-{
-	struct udevice *dev;
-	int ret;
-
-	ret = regulator_get_by_platname(platname, &dev);
-	if (devp)
-		*devp = dev;
-	if (ret) {
-		debug("Can get the regulator: %s (err=%d)\n", platname, ret);
-		return ret;
-	}
-
-	return regulator_autoset(dev);
-}
-
-int regulator_list_autoset(const char *list_platname[],
-			   struct udevice *list_devp[],
-			   bool verbose)
-{
-	struct udevice *dev;
-	int error = 0, i = 0, ret;
-
-	while (list_platname[i]) {
-		ret = regulator_autoset_by_name(list_platname[i], &dev);
-		if (ret != -EMEDIUMTYPE && verbose)
-			regulator_show(dev, ret);
-		if (ret & !error)
-			error = ret;
-
-		if (list_devp)
-			list_devp[i] = dev;
-
-		i++;
-	}
-
-	return error;
-}
-
 static bool regulator_name_is_unique(struct udevice *check_dev,
 				     const char *check_name)
 {
@@ -444,6 +338,7 @@ static int regulator_post_bind(struct udevice *dev)
 {
 	struct dm_regulator_uclass_plat *uc_pdata;
 	const char *property = "regulator-name";
+	int ret;
 
 	uc_pdata = dev_get_uclass_plat(dev);
 
@@ -457,13 +352,28 @@ static int regulator_post_bind(struct udevice *dev)
 			return -EINVAL;
 	}
 
-	if (regulator_name_is_unique(dev, uc_pdata->name))
-		return 0;
+	ret = regulator_name_is_unique(dev, uc_pdata->name);
+	if (!ret) {
+		debug("'%s' of dev: '%s', has nonunique value: '%s\n",
+		      property, dev->name, uc_pdata->name);
+		return -EINVAL;
+	}
 
-	debug("'%s' of dev: '%s', has nonunique value: '%s\n",
-	      property, dev->name, uc_pdata->name);
+	switch (device_get_uclass_id(dev->parent)) {
+	/* In case class can have regulator child add it here */
+	case UCLASS_PMIC:
+		break;
+
+	default:
+		/*
+		 * Trigger probe() to configure default
+		 * regulators state during startup.
+		 */
+		dev_or_flags(dev, DM_FLAG_PROBE_AFTER_BIND);
+		break;
+	}
 
-	return -EINVAL;
+	return 0;
 }
 
 static int regulator_pre_probe(struct udevice *dev)
@@ -517,55 +427,56 @@ static int regulator_pre_probe(struct udevice *dev)
 	return 0;
 }
 
-int regulators_enable_boot_on(bool verbose)
+static int regulator_post_probe(struct udevice *dev)
 {
-	struct udevice *dev;
-	struct uclass *uc;
+	struct dm_regulator_uclass_plat *uc_pdata =
+					 dev_get_uclass_plat(dev);
 	int ret;
 
-	ret = uclass_get(UCLASS_REGULATOR, &uc);
-	if (ret)
-		return ret;
-	for (uclass_first_device(UCLASS_REGULATOR, &dev);
-	     dev;
-	     uclass_next_device(&dev)) {
-		ret = regulator_autoset(dev);
-		if (ret == -EMEDIUMTYPE) {
-			ret = 0;
-			continue;
-		}
-		if (verbose)
-			regulator_show(dev, ret);
-		if (ret == -ENOSYS)
-			ret = 0;
-	}
+	/*
+	 * Disable is performed in case regulator was somehow
+	 * active, for example it is active by PMIC design etc.
+	 */
+	uc_pdata->enable_count = 1;
+	regulator_set_enable_if_allowed(dev, false);
 
-	return ret;
-}
+	/*
+	 * Always-on regulator can not be disabled so zero out
+	 * enable_count in case regulator has this property.
+	 */
+	uc_pdata->enable_count = 0;
 
-int regulators_enable_boot_off(bool verbose)
-{
-	struct udevice *dev;
-	struct uclass *uc;
-	int ret;
+	if (uc_pdata->force_off && uc_pdata->enable_count)
+		return 0;
 
-	ret = uclass_get(UCLASS_REGULATOR, &uc);
-	if (ret)
-		return ret;
-	for (uclass_first_device(UCLASS_REGULATOR, &dev);
-	     dev;
-	     uclass_next_device(&dev)) {
-		ret = regulator_unset(dev);
-		if (ret == -EMEDIUMTYPE) {
-			ret = 0;
-			continue;
-		}
-		if (verbose)
-			regulator_show(dev, ret);
+	ret = regulator_set_suspend_enable(dev, uc_pdata->suspend_on);
+	if (ret == -ENOSYS)
+		ret = 0;
+
+	if (!ret && uc_pdata->suspend_on) {
+		ret = regulator_set_suspend_value(dev, uc_pdata->suspend_uV);
 		if (ret == -ENOSYS)
 			ret = 0;
+
+		if (ret)
+			return ret;
+	}
+
+	if (uc_pdata->type != REGULATOR_TYPE_FIXED) {
+		if (uc_pdata->flags & REGULATOR_FLAG_AUTOSET_UV)
+			ret = regulator_set_value(dev, uc_pdata->min_uV);
+		if (uc_pdata->init_uV > 0)
+			ret = regulator_set_value(dev, uc_pdata->init_uV);
+		if (!ret && (uc_pdata->flags & REGULATOR_FLAG_AUTOSET_UA))
+			ret = regulator_set_current(dev, uc_pdata->min_uA);
 	}
 
+	if (!uc_pdata->always_on && !uc_pdata->boot_on)
+		return 0;
+
+	if (!ret)
+		ret = regulator_set_enable_if_allowed(dev, true);
+
 	return ret;
 }
 
@@ -574,5 +485,6 @@ UCLASS_DRIVER(regulator) = {
 	.name		= "regulator",
 	.post_bind	= regulator_post_bind,
 	.pre_probe	= regulator_pre_probe,
+	.post_probe	= regulator_post_probe,
 	.per_device_plat_auto	= sizeof(struct dm_regulator_uclass_plat),
 };
diff --git a/include/power/regulator.h b/include/power/regulator.h
index 727776a8cf..e58e2dee16 100644
--- a/include/power/regulator.h
+++ b/include/power/regulator.h
@@ -413,104 +413,6 @@ int regulator_get_mode(struct udevice *dev);
  */
 int regulator_set_mode(struct udevice *dev, int mode_id);
 
-/**
- * regulators_enable_boot_on() - enable regulators needed for boot
- *
- * This enables all regulators which are marked to be on at boot time. This
- * only works for regulators which don't have a range for voltage/current,
- * since in that case it is not possible to know which value to use.
- *
- * This effectively calls regulator_autoset() for every regulator.
- */
-int regulators_enable_boot_on(bool verbose);
-
-/**
- * regulators_enable_boot_off() - disable regulators needed for boot
- *
- * This disables all regulators which are marked to be off at boot time.
- *
- * This effectively calls regulator_unset() for every regulator.
- */
-int regulators_enable_boot_off(bool verbose);
-
-/**
- * regulator_autoset: setup the voltage/current on a regulator
- *
- * The setup depends on constraints found in device's uclass's platform data
- * (struct dm_regulator_uclass_plat):
- *
- * - Enable - will set - if any of: 'always_on' or 'boot_on' is set to true,
- *   or if both are unset, then the function returns
- * - Voltage value - will set - if '.min_uV' and '.max_uV' values are equal
- * - Current limit - will set - if '.min_uA' and '.max_uA' values are equal
- *
- * The function returns on the first-encountered error.
- *
- * @platname - expected string for dm_regulator_uclass_plat .name field
- * @devp     - returned pointer to the regulator device - if non-NULL passed
- * @return: 0 on success or negative value of errno.
- */
-int regulator_autoset(struct udevice *dev);
-
-/**
- * regulator_unset: turn off a regulator
- *
- * The setup depends on constraints found in device's uclass's platform data
- * (struct dm_regulator_uclass_platdata):
- *
- * - Disable - will set - if  'force_off' is set to true,
- *
- * The function returns on the first-encountered error.
- */
-int regulator_unset(struct udevice *dev);
-
-/**
- * regulator_autoset_by_name: setup the regulator given by its uclass's
- * platform data name field. The setup depends on constraints found in device's
- * uclass's platform data (struct dm_regulator_uclass_plat):
- * - Enable - will set - if any of: 'always_on' or 'boot_on' is set to true,
- *   or if both are unset, then the function returns
- * - Voltage value - will set - if '.min_uV' and '.max_uV' values are equal
- * - Current limit - will set - if '.min_uA' and '.max_uA' values are equal
- *
- * The function returns on first encountered error.
- *
- * @platname - expected string for dm_regulator_uclass_plat .name field
- * @devp     - returned pointer to the regulator device - if non-NULL passed
- * @return: 0 on success or negative value of errno.
- *
- * The returned 'regulator' device can be used with:
- * - regulator_get/set_*
- */
-int regulator_autoset_by_name(const char *platname, struct udevice **devp);
-
-/**
- * regulator_list_autoset: setup the regulators given by list of their uclass's
- * platform data name field. The setup depends on constraints found in device's
- * uclass's platform data. The function loops with calls to:
- * regulator_autoset_by_name() for each name from the list.
- *
- * @list_platname - an array of expected strings for .name field of each
- *                  regulator's uclass plat
- * @list_devp     - an array of returned pointers to the successfully setup
- *                  regulator devices if non-NULL passed
- * @verbose       - (true/false) print each regulator setup info, or be quiet
- * Return: 0 on successfully setup of all list entries, otherwise first error.
- *
- * The returned 'regulator' devices can be used with:
- * - regulator_get/set_*
- *
- * Note: The list must ends with NULL entry, like in the "platname" list below:
- * char *my_regulators[] = {
- *     "VCC_3.3V",
- *     "VCC_1.8V",
- *     NULL,
- * };
- */
-int regulator_list_autoset(const char *list_platname[],
-			   struct udevice *list_devp[],
-			   bool verbose);
-
 /**
  * regulator_get_by_devname: returns the pointer to the pmic regulator device.
  * Search by name, found in regulator device's name.
@@ -628,27 +530,6 @@ static inline int regulator_set_mode(struct udevice *dev, int mode_id)
 	return -ENOSYS;
 }
 
-static inline int regulators_enable_boot_on(bool verbose)
-{
-	return -ENOSYS;
-}
-
-static inline int regulator_autoset(struct udevice *dev)
-{
-	return -ENOSYS;
-}
-
-static inline int regulator_autoset_by_name(const char *platname, struct udevice **devp)
-{
-	return -ENOSYS;
-}
-
-static inline int regulator_list_autoset(const char *list_platname[], struct udevice *list_devp[],
-					 bool verbose)
-{
-	return -ENOSYS;
-}
-
 static inline int regulator_get_by_devname(const char *devname, struct udevice **devp)
 {
 	return -ENOSYS;
-- 
2.39.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
