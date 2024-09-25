Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7DF9850EB
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Sep 2024 04:24:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AF23C78017;
	Wed, 25 Sep 2024 02:24:08 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FA04C6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 02:24:01 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2ED1E82BA7;
 Wed, 25 Sep 2024 04:23:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1727231040;
 bh=31l/5NinKpv9uXl5fGCvMEzdE64rcvZAPQzUoU1+UkM=;
 h=From:To:Cc:Subject:Date:From;
 b=Eb2tw3LysuEJ95t2/cnlsi2Lp0UTXHmy+qlg694Heh+2wrwgzcWik9+tqH48ID2yI
 /KVcvCS8SLHp0M5ZV6SSsOMu1CL9zR/ywj+XHJR9PopP+Do7SxLisNhNKH6JGJlWqp
 KZTbL+uuIMMwFELbM7mV+H0k1sC1W4nkKhSkZG5tzVSfHjHJjPurxA/PIB0hKeUe2G
 FH5iJJ/MVoOAhSgji76OumrH59EnTkQ7xlorGM7WUhQfh8VApPhULoo6CCsu3YodH7
 4gcTpGns5D+mQzDh/9378/v1oCegKDJtrIu9orezNCSjDhFTsFAHdAb31IcpIufKYu
 +zQmNxXj53x+g==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Wed, 25 Sep 2024 04:21:52 +0200
Message-ID: <20240925022314.714285-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
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
 Kostya Porotchkin <kostap@marvell.com>,
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
Subject: [Uboot-stm32] [PATCH v2 1/5] power: regulator: Trigger probe of
	regulators which are always-on or boot-on
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

In case a regulator DT node contains regulator-always-on or regulator-boot-on
property, make sure the regulator gets correctly configured by U-Boot on start
up. Unconditionally probe such regulator drivers. This is a preparatory patch
for introduction of .regulator_post_probe() which would trigger the regulator
configuration.

Parsing of regulator-always-on and regulator-boot-on DT property has been
moved to regulator_post_bind() as the information is required early, the
rest of the DT parsing has been kept in regulator_pre_probe() to avoid
slowing down the boot process.

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
Cc: Kostya Porotchkin <kostap@marvell.com>
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
V2: - Rebase on current u-boot/next
    - Update test cases to handle already started regulators correctly
---
 drivers/power/regulator/regulator-uclass.c | 22 +++++++++++++++-------
 test/dm/panel.c                            |  2 +-
 test/dm/regulator.c                        |  4 ++--
 3 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/power/regulator/regulator-uclass.c b/drivers/power/regulator/regulator-uclass.c
index 88a8525b3c4..e2f703702e3 100644
--- a/drivers/power/regulator/regulator-uclass.c
+++ b/drivers/power/regulator/regulator-uclass.c
@@ -433,6 +433,8 @@ static int regulator_post_bind(struct udevice *dev)
 	const char *property = "regulator-name";
 
 	uc_pdata = dev_get_uclass_plat(dev);
+	uc_pdata->always_on = dev_read_bool(dev, "regulator-always-on");
+	uc_pdata->boot_on = dev_read_bool(dev, "regulator-boot-on");
 
 	/* Regulator's mandatory constraint */
 	uc_pdata->name = dev_read_string(dev, property);
@@ -444,13 +446,21 @@ static int regulator_post_bind(struct udevice *dev)
 			return -EINVAL;
 	}
 
-	if (regulator_name_is_unique(dev, uc_pdata->name))
-		return 0;
+	if (!regulator_name_is_unique(dev, uc_pdata->name)) {
+		debug("'%s' of dev: '%s', has nonunique value: '%s\n",
+		      property, dev->name, uc_pdata->name);
+		return -EINVAL;
+	}
 
-	debug("'%s' of dev: '%s', has nonunique value: '%s\n",
-	      property, dev->name, uc_pdata->name);
+	/*
+	 * In case the regulator has regulator-always-on or
+	 * regulator-boot-on DT property, trigger probe() to
+	 * configure its default state during startup.
+	 */
+	if (uc_pdata->always_on && uc_pdata->boot_on)
+		dev_or_flags(dev, DM_FLAG_PROBE_AFTER_BIND);
 
-	return -EINVAL;
+	return 0;
 }
 
 static int regulator_pre_probe(struct udevice *dev)
@@ -473,8 +483,6 @@ static int regulator_pre_probe(struct udevice *dev)
 						-ENODATA);
 	uc_pdata->max_uA = dev_read_u32_default(dev, "regulator-max-microamp",
 						-ENODATA);
-	uc_pdata->always_on = dev_read_bool(dev, "regulator-always-on");
-	uc_pdata->boot_on = dev_read_bool(dev, "regulator-boot-on");
 	uc_pdata->ramp_delay = dev_read_u32_default(dev, "regulator-ramp-delay",
 						    0);
 	uc_pdata->force_off = dev_read_bool(dev, "regulator-force-boot-off");
diff --git a/test/dm/panel.c b/test/dm/panel.c
index ce835c96ed0..ec85a9b1e6e 100644
--- a/test/dm/panel.c
+++ b/test/dm/panel.c
@@ -33,7 +33,7 @@ static int dm_test_panel(struct unit_test_state *uts)
 	ut_assertok(sandbox_pwm_get_config(pwm, 0, &period_ns, &duty_ns,
 					   &enable, &polarity));
 	ut_asserteq(false, enable);
-	ut_asserteq(false, regulator_get_enable(reg));
+	ut_asserteq(true, regulator_get_enable(reg));
 
 	ut_assertok(panel_enable_backlight(dev));
 	ut_assertok(sandbox_pwm_get_config(pwm, 0, &period_ns, &duty_ns,
diff --git a/test/dm/regulator.c b/test/dm/regulator.c
index 532bbd82376..449748ad52f 100644
--- a/test/dm/regulator.c
+++ b/test/dm/regulator.c
@@ -186,7 +186,7 @@ int dm_test_power_regulator_set_enable_if_allowed(struct unit_test_state *uts)
 
 	/* Get BUCK1 - always on regulator */
 	platname = regulator_names[BUCK1][PLATNAME];
-	ut_assertok(regulator_autoset_by_name(platname, &dev_autoset));
+	ut_asserteq(-EALREADY, regulator_autoset_by_name(platname, &dev_autoset));
 	ut_assertok(regulator_get_by_platname(platname, &dev));
 
 	/* Try disabling always-on regulator */
@@ -288,7 +288,7 @@ static int dm_test_power_regulator_autoset(struct unit_test_state *uts)
 	 * Expected output state: uV=1200000; uA=200000; output enabled
 	 */
 	platname = regulator_names[BUCK1][PLATNAME];
-	ut_assertok(regulator_autoset_by_name(platname, &dev_autoset));
+	ut_asserteq(-EALREADY, regulator_autoset_by_name(platname, &dev_autoset));
 
 	/* Check, that the returned device is proper */
 	ut_assertok(regulator_get_by_platname(platname, &dev));
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
