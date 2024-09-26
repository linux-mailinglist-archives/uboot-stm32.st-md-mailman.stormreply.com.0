Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03410987B89
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Sep 2024 01:15:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A47A1C6DD72;
	Thu, 26 Sep 2024 23:15:33 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1989DC6B45B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 23:15:27 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9606888FA7;
 Fri, 27 Sep 2024 01:15:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1727392526;
 bh=5aY23Ge8j8IadboOveNUYnj3/odcSp76oaU3rtta2lM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g2JdtgwmmAQn6IavUiqg3NVepPkdFvhgeQdfnPRt9EkL/lbtO3Lv+zZwv6GeM5JXp
 Us0VhD8H96srKA2xshAmLT11jJceVSJehPcKj/ecL0qAiBMa/se8qJp9lQUSGd4Wnc
 K8+XWEceUD3cdXdViLjFGI/6bQ7etnoc6WvwFMx6FS2AQfbA/9GarW16X61yTSaGp8
 njyDLNmxEO3Px8KvYz8YdAfhwyBhOEB/h4oTuWfrGOiXJuV8QDKuGsZuXK2kja3Urh
 nOAHq8gQUDOulJJiCG/LFpYoZdW+BsRF5gQ7vlOBPfGjW4CQxFwtZkkNnyhr+eLkvL
 gZAboT2aAR0TA==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Fri, 27 Sep 2024 01:14:13 +0200
Message-ID: <20240926231457.2933914-2-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240926231457.2933914-1-marex@denx.de>
References: <20240926231457.2933914-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Quentin Schulz <quentin.schulz@cherry.de>, Sam Day <me@samcday.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Dragan Simic <dsimic@manjaro.org>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot-qcom@groups.io, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 u-boot-amlogic@groups.io, Jaehoon Chung <jh80.chung@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Ben Wolsieffer <benwolsieffer@gmail.com>, Thierry Reding <treding@nvidia.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Jonas Karlman <jonas@kwiboo.se>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Chris Morgan <macromorgan@hotmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, u-boot@dh-electronics.com,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Simon Glass <sjg@chromium.org>,
 Sumit Garg <sumit.garg@linaro.org>
Subject: [Uboot-stm32] [PATCH v3 2/4] power: regulator: Convert
	regulators_enable_boot_on/off() to regulator_post_probe
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

Turn regulators_enable_boot_on() and regulators_enable_boot_off() into
empty functions. Implement matching functionality in regulator_post_probe()
instead. The regulator_post_probe() is called for all regulators after they
probe, and regulators that have regulator-always-on or regulator-boot-on DT
properties now always probe due to DM_FLAG_PROBE_AFTER_BIND being set on
such regulators in regulator_post_bind().

Finally, fold regulator_unset() functionality into regulator_autoset().

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Ben Wolsieffer <benwolsieffer@gmail.com>
Cc: Caleb Connolly <caleb.connolly@linaro.org>
Cc: Chris Morgan <macromorgan@hotmail.com>
Cc: Dragan Simic <dsimic@manjaro.org>
Cc: Eugen Hristev <eugen.hristev@collabora.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Jaehoon Chung <jh80.chung@samsung.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Kever Yang <kever.yang@rock-chips.com>
Cc: Matteo Lisi <matteo.lisi@engicam.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Sam Day <me@samcday.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Sumit Garg <sumit.garg@linaro.org>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: u-boot-amlogic@groups.io
Cc: u-boot-qcom@groups.io
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
V2: Rebase on current u-boot/next
V3: No change
---
 drivers/power/regulator/regulator-uclass.c | 60 +++++++---------------
 1 file changed, 19 insertions(+), 41 deletions(-)

diff --git a/drivers/power/regulator/regulator-uclass.c b/drivers/power/regulator/regulator-uclass.c
index 1a970004540..9fcc4bd85b9 100644
--- a/drivers/power/regulator/regulator-uclass.c
+++ b/drivers/power/regulator/regulator-uclass.c
@@ -314,6 +314,11 @@ int regulator_autoset(struct udevice *dev)
 			return ret;
 	}
 
+	if (uc_pdata->force_off) {
+		ret = regulator_set_enable(dev, false);
+		goto out;
+	}
+
 	if (!uc_pdata->always_on && !uc_pdata->boot_on) {
 		ret = -EMEDIUMTYPE;
 		goto out;
@@ -518,56 +523,28 @@ static int regulator_pre_probe(struct udevice *dev)
 	return 0;
 }
 
-int regulators_enable_boot_on(bool verbose)
+static int regulator_post_probe(struct udevice *dev)
 {
-	struct udevice *dev;
-	struct uclass *uc;
 	int ret;
 
-	ret = uclass_get(UCLASS_REGULATOR, &uc);
-	if (ret)
+	ret = regulator_autoset(dev);
+	if (ret && ret != -EMEDIUMTYPE && ret != -EALREADY && ret != ENOSYS)
 		return ret;
-	for (uclass_first_device(UCLASS_REGULATOR, &dev);
-	     dev;
-	     uclass_next_device(&dev)) {
-		ret = regulator_autoset(dev);
-		if (ret == -EMEDIUMTYPE || ret == -EALREADY) {
-			ret = 0;
-			continue;
-		}
-		if (verbose)
-			regulator_show(dev, ret);
-		if (ret == -ENOSYS)
-			ret = 0;
-	}
 
-	return ret;
+	if (_DEBUG)
+		regulator_show(dev, ret);
+
+	return 0;
 }
 
-int regulators_enable_boot_off(bool verbose)
+int regulators_enable_boot_on(bool verbose)
 {
-	struct udevice *dev;
-	struct uclass *uc;
-	int ret;
-
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
-		if (ret == -ENOSYS)
-			ret = 0;
-	}
+	return 0;
+}
 
-	return ret;
+int regulators_enable_boot_off(bool verbose)
+{
+	return 0;
 }
 
 UCLASS_DRIVER(regulator) = {
@@ -575,5 +552,6 @@ UCLASS_DRIVER(regulator) = {
 	.name		= "regulator",
 	.post_bind	= regulator_post_bind,
 	.pre_probe	= regulator_pre_probe,
+	.post_probe	= regulator_post_probe,
 	.per_device_plat_auto	= sizeof(struct dm_regulator_uclass_plat),
 };
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
