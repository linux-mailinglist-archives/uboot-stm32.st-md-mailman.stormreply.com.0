Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5428C919B75
	for <lists+uboot-stm32@lfdr.de>; Thu, 27 Jun 2024 01:58:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4E78C71287;
	Wed, 26 Jun 2024 23:58:00 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E70FC6DD9F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 23:57:53 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 98CCA88495;
 Thu, 27 Jun 2024 01:57:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1719446272;
 bh=j9+gNS0RvBKJupbfHAroI1F5otxQD2cptbmul1pdCUM=;
 h=From:To:Cc:Subject:Date:From;
 b=COSdsZQAdkVFtgDBSrlF5Gijkt24B+EwJUTAil4EgCGlSPK7tKKQNMBhS1LeEPzgB
 FVedUPKHF/6hNGCHFTGVcDYW9CMWiWaxUTVPyNmXPoKI6XzBO9SfZcGLVDDQKGE5YL
 cvveotTcSSuvFePkTqGuWWBwwsqKcopsyFCLUNz6eL8CIFsR31okrjZCoUKk/im+Zj
 RZhSEdj/vWwbWFPkgdJ8Wow9SALESRiFy/AhGjqfA3VB3/vnE/4m1Sc+GIlCODkGGw
 eY8mzKd06viDAMPdaT+WEr/Hk5zGCewjRHlgcbgcVrIaMq8oGUc3FUV0avjIhpgt/y
 S7RNug7vFx9mA==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Thu, 27 Jun 2024 01:55:41 +0200
Message-ID: <20240626235717.272219-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
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
Subject: [Uboot-stm32] [PATCH 1/4] power: regulator: Trigger probe of
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
 drivers/power/regulator/regulator-uclass.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/power/regulator/regulator-uclass.c b/drivers/power/regulator/regulator-uclass.c
index 66fd531da04..ccc4ef33d83 100644
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
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
