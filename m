Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D929768DEB
	for <lists+uboot-stm32@lfdr.de>; Mon, 31 Jul 2023 09:18:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AFC8C7129F;
	Mon, 31 Jul 2023 07:18:23 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02498C6B452
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 12:38:21 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-4fddd4e942eso862151e87.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 05:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689856700; x=1690461500;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vtUhK6sZA1/W/s5lxana7kH4PNz/nW8Wqg9QXqgnxCM=;
 b=CsUlUYGhAMnPilTJslmdeMAxUvtflgYPcWYMLKkark5JGHc0HM6nxhChkfpWo4Bvuo
 3sURaVT94AUstbU2yJXa7AwWJp2RaaK3P1uBK7WhWV+pbDIcKhoRq2zvL2Etb5nbS1pt
 C8BQdyowNnAQWAnFaj2CY2CeZUotBPSyoZ1LHWXmq7JyFOxy5PU5k8Fo1k+Qui3ZZubZ
 LOSOTjUtXnfvKWxlYNA2pFReSzLSLJ5ruieYAKDjixQDP6FIjEG6CMPVRSVydon+mfkA
 LfhaK4x/YA3oB/5jTxP2XGpFGmHPoi5ykVwGAtVp3z/+nRumTwTr0DBbppv/yYcwTQrh
 tgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689856700; x=1690461500;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vtUhK6sZA1/W/s5lxana7kH4PNz/nW8Wqg9QXqgnxCM=;
 b=NEnS7bmXI1Q0d+qCCVBakxOFubZ908mRcCZNuMCO3F1fF2nywVzaXuGVH6tOujOeQ4
 iFBW25yBdFy8bBcvznsn06zjSkbBafjwwN0TdmHsFtFEI6WCJ3/RPOTLoT/8gvTk84Cr
 wTI1ge9qQfnyexJ/5t9PSu5/8Sr5GbNlU75ciS9qTghQTttTccLqD2LOKKc4fOaLYKCq
 5VgOZ5tgDgnMpICnUSGQSLNTIz3m0WeG+iE5IaVy9C4JOTTBW91H2ONyebDepOjXQyHm
 2JJCp3mFMNIxKwLTK0nHQO+l8zFZzYFsAnpgIzbI/LBBN7Lgw7iRYOW+F740nP1mdpqY
 Xz5Q==
X-Gm-Message-State: ABy/qLbiJxg7sgXuvw/p4jcEq7pZdGvvWjTq20oxevNns4In+Adq0Mbe
 Wq1OEpHCb+QmZHswLBCwb7Q=
X-Google-Smtp-Source: APBJJlGWhee7bfrZaLG9cg0Jn/oPcM4BK1EpZt1xWWnWH4tZvev3CERBKgWd/B49JRehJYYhOIO8Jw==
X-Received: by 2002:a05:6512:3610:b0:4f8:b349:6938 with SMTP id
 f16-20020a056512361000b004f8b3496938mr1332422lfs.65.1689856700235; 
 Thu, 20 Jul 2023 05:38:20 -0700 (PDT)
Received: from xeon.. ([188.163.112.64]) by smtp.gmail.com with ESMTPSA id
 m25-20020ac24ad9000000b004fb9c625b4asm184401lfp.210.2023.07.20.05.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 05:38:19 -0700 (PDT)
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
Date: Thu, 20 Jul 2023 15:37:44 +0300
Message-Id: <20230720123744.26854-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230720123744.26854-1-clamor95@gmail.com>
References: <20230720123744.26854-1-clamor95@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:18:21 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 u-boot@dh-electronics.com, u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH v2 7/7] power: regulator-uclass: remove all
	deprecated API use
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

THIS REQUIRES PRECISE TESTING!

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/mach-rockchip/board.c                  |  8 --------
 arch/arm/mach-rockchip/rk3399/rk3399.c          | 10 ----------
 board/Marvell/octeontx2_cn913x/board.c          |  5 -----
 board/amlogic/odroid-go-ultra/odroid-go-ultra.c |  2 --
 board/dhelectronics/dh_stm32mp1/board.c         |  2 --
 board/engicam/stm32mp1/stm32mp1.c               |  3 ---
 board/google/veyron/veyron.c                    |  6 ------
 board/samsung/common/exynos5-dt.c               |  4 ----
 board/samsung/odroid/odroid.c                   | 10 ----------
 board/st/stm32mp1/stm32mp1.c                    |  9 ---------
 drivers/video/bridge/ps862x.c                   | 12 ++++++++----
 drivers/video/rockchip/rk_vop.c                 |  6 ++----
 12 files changed, 10 insertions(+), 67 deletions(-)

diff --git a/arch/arm/mach-rockchip/board.c b/arch/arm/mach-rockchip/board.c
index 8d7b39ba15..3eaea4b04a 100644
--- a/arch/arm/mach-rockchip/board.c
+++ b/arch/arm/mach-rockchip/board.c
@@ -189,14 +189,6 @@ int board_late_init(void)
 
 int board_init(void)
 {
-	int ret;
-
-#ifdef CONFIG_DM_REGULATOR
-	ret = regulators_enable_boot_on(false);
-	if (ret)
-		debug("%s: Cannot enable boot on regulator\n", __func__);
-#endif
-
 	return 0;
 }
 
diff --git a/arch/arm/mach-rockchip/rk3399/rk3399.c b/arch/arm/mach-rockchip/rk3399/rk3399.c
index a7cc91a952..cbd2ea047d 100644
--- a/arch/arm/mach-rockchip/rk3399/rk3399.c
+++ b/arch/arm/mach-rockchip/rk3399/rk3399.c
@@ -280,15 +280,5 @@ void spl_board_init(void)
 		if (cru->glb_rst_st != 0)
 			rk3399_force_power_on_reset();
 	}
-
-	if (IS_ENABLED(CONFIG_SPL_DM_REGULATOR)) {
-		/*
-		 * Turning the eMMC and SPI back on (if disabled via the Qseven
-		 * BIOS_ENABLE) signal is done through a always-on regulator).
-		 */
-		if (regulators_enable_boot_on(false))
-			debug("%s: Cannot enable boot on regulator\n",
-			      __func__);
-	}
 }
 #endif
diff --git a/board/Marvell/octeontx2_cn913x/board.c b/board/Marvell/octeontx2_cn913x/board.c
index 3d20cfb2fa..3ffe15d42b 100644
--- a/board/Marvell/octeontx2_cn913x/board.c
+++ b/board/Marvell/octeontx2_cn913x/board.c
@@ -23,11 +23,6 @@ int board_early_init_f(void)
 
 int board_early_init_r(void)
 {
-	if (CONFIG_IS_ENABLED(DM_REGULATOR)) {
-		/* Check if any existing regulator should be turned down */
-		regulators_enable_boot_off(false);
-	}
-
 	return 0;
 }
 
diff --git a/board/amlogic/odroid-go-ultra/odroid-go-ultra.c b/board/amlogic/odroid-go-ultra/odroid-go-ultra.c
index bbd23e20fc..fa6105a071 100644
--- a/board/amlogic/odroid-go-ultra/odroid-go-ultra.c
+++ b/board/amlogic/odroid-go-ultra/odroid-go-ultra.c
@@ -16,7 +16,5 @@ int mmc_get_env_dev(void)
 
 int board_init(void)
 {
-	regulators_enable_boot_on(_DEBUG);
-
 	return 0;
 }
diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
index f9cfabe242..a8ad5a1620 100644
--- a/board/dhelectronics/dh_stm32mp1/board.c
+++ b/board/dhelectronics/dh_stm32mp1/board.c
@@ -615,8 +615,6 @@ static void board_init_regulator_av96(void)
 static void board_init_regulator(void)
 {
 	board_init_regulator_av96();
-
-	regulators_enable_boot_on(_DEBUG);
 }
 #else
 static inline int board_get_regulator_buck3_nvm_uv_av96(int *uv)
diff --git a/board/engicam/stm32mp1/stm32mp1.c b/board/engicam/stm32mp1/stm32mp1.c
index 5223e9bae8..c98bbdc71b 100644
--- a/board/engicam/stm32mp1/stm32mp1.c
+++ b/board/engicam/stm32mp1/stm32mp1.c
@@ -38,9 +38,6 @@ int checkboard(void)
 /* board dependent setup after realloc */
 int board_init(void)
 {
-	if (IS_ENABLED(CONFIG_DM_REGULATOR))
-		regulators_enable_boot_on(_DEBUG);
-
 	return 0;
 }
 
diff --git a/board/google/veyron/veyron.c b/board/google/veyron/veyron.c
index 32dbcdc4d1..527e9d4b0e 100644
--- a/board/google/veyron/veyron.c
+++ b/board/google/veyron/veyron.c
@@ -62,12 +62,6 @@ static int veyron_init(void)
 	if (ret)
 		return ret;
 
-	ret = regulators_enable_boot_on(false);
-	if (ret) {
-		debug("%s: Cannot enable boot on regulators\n", __func__);
-		return ret;
-	}
-
 	return 0;
 }
 #endif
diff --git a/board/samsung/common/exynos5-dt.c b/board/samsung/common/exynos5-dt.c
index cde77d79a0..45d34d838d 100644
--- a/board/samsung/common/exynos5-dt.c
+++ b/board/samsung/common/exynos5-dt.c
@@ -92,10 +92,6 @@ int exynos_power_init(void)
 	if (ret == -ENODEV)
 		return 0;
 
-	ret = regulators_enable_boot_on(false);
-	if (ret)
-		return ret;
-
 	ret = exynos_set_regulator("vdd_mif", 1100000);
 	if (ret)
 		return ret;
diff --git a/board/samsung/odroid/odroid.c b/board/samsung/odroid/odroid.c
index 39a60e4ad2..28086ee92e 100644
--- a/board/samsung/odroid/odroid.c
+++ b/board/samsung/odroid/odroid.c
@@ -431,16 +431,6 @@ int exynos_init(void)
 
 int exynos_power_init(void)
 {
-	const char *mmc_regulators[] = {
-		"VDDQ_EMMC_1.8V",
-		"VDDQ_EMMC_2.8V",
-		"TFLASH_2.8V",
-		NULL,
-	};
-
-	if (regulator_list_autoset(mmc_regulators, NULL, true))
-		pr_err("Unable to init all mmc regulators\n");
-
 	return 0;
 }
 
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 3205a31c6d..7e425edefd 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -602,13 +602,6 @@ static int board_stm32mp15x_dk2_init(void)
 		goto error;
 	}
 
-	/* power-up audio IC */
-	regulator_autoset_by_name("v1v8_audio", NULL);
-
-	/* power-up HDMI IC */
-	regulator_autoset_by_name("v1v2_hdmi", NULL);
-	regulator_autoset_by_name("v3v3_hdmi", NULL);
-
 error:
 	return ret;
 }
@@ -665,8 +658,6 @@ int board_init(void)
 	if (board_is_stm32mp15x_dk2())
 		board_stm32mp15x_dk2_init();
 
-	regulators_enable_boot_on(_DEBUG);
-
 	/*
 	 * sysconf initialisation done only when U-Boot is running in secure
 	 * done in TF-A for TFABOOT.
diff --git a/drivers/video/bridge/ps862x.c b/drivers/video/bridge/ps862x.c
index d1d22a6e23..52a343bde2 100644
--- a/drivers/video/bridge/ps862x.c
+++ b/drivers/video/bridge/ps862x.c
@@ -77,13 +77,17 @@ static int ps8622_attach(struct udevice *dev)
 	/* set the LDO providing the 1.2V rail to the Parade bridge */
 	ret = uclass_get_device_by_phandle(UCLASS_REGULATOR, dev,
 					   "power-supply", &reg);
-	if (!ret) {
-		ret = regulator_autoset(reg);
-	} else if (ret != -ENOENT) {
-		debug("%s: Failed to enable power: ret=%d\n", __func__, ret);
+	if (ret) {
+		debug("%s: Failed to get power: ret=%d\n", __func__, ret);
 		return ret;
 	}
 
+	if (reg) {
+		ret = regulator_set_enable(reg, true);
+		if (ret)
+			return ret;
+	}
+
 	ret = video_bridge_set_active(dev, true);
 	if (ret)
 		return ret;
diff --git a/drivers/video/rockchip/rk_vop.c b/drivers/video/rockchip/rk_vop.c
index c514e2a0e4..e81eed5ffa 100644
--- a/drivers/video/rockchip/rk_vop.c
+++ b/drivers/video/rockchip/rk_vop.c
@@ -397,7 +397,7 @@ static int rk_display_init(struct udevice *dev, ulong fbbase, ofnode ep_node)
 void rk_vop_probe_regulators(struct udevice *dev,
 			     const char * const *names, int cnt)
 {
-	int i, ret;
+	int i;
 	const char *name;
 	struct udevice *reg;
 
@@ -405,9 +405,7 @@ void rk_vop_probe_regulators(struct udevice *dev,
 		name = names[i];
 		debug("%s: probing regulator '%s'\n", dev->name, name);
 
-		ret = regulator_autoset_by_name(name, &reg);
-		if (!ret)
-			ret = regulator_set_enable(reg, true);
+		regulator_set_enable(reg, true);
 	}
 }
 
-- 
2.39.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
