Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AF8768DE8
	for <lists+uboot-stm32@lfdr.de>; Mon, 31 Jul 2023 09:18:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A449C71299;
	Mon, 31 Jul 2023 07:18:23 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA5C5C6B458
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 12:38:16 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-4fb960b7c9dso1180758e87.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 05:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689856696; x=1690461496;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PJXb5dhngD6iAICS0/nFxRtdCRxNm5A2FZMwniQi01s=;
 b=DwB9W06tNTLqiGCa9/XDoDBDyHgUwSZFa6DTo2bNSiDS4LyfVFBQBnavV28E7fyVPo
 5cK4MlCkaWxecytDSUaLPWxA/hAN8wUgbGxNO1jNIGLbnqIOsqZbK7ut5HciHPlerluw
 c9+whbnuWrRwg0ssaLZyujXyAgC7w5VWjPejBvhatuRlaqc6E9rozwsP9Zf6O643TEpf
 BPoO6eBpigmF1zDv7VIgheCCiCn/1GAhoq2D+CSenYJS1ksDy+1N9lImNdzK8deU0GQp
 tDxlERfx8l17ecXmv0swDKNt2fw832NnhnLvq6aAW/RSJrBNedp1if1o0qaXSELGq4sC
 mV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689856696; x=1690461496;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PJXb5dhngD6iAICS0/nFxRtdCRxNm5A2FZMwniQi01s=;
 b=Gh0zj2DeBEfTuCDc+qP7k4xgoZwwkhAzI7Qh2GtsjpSxu7lTfFRjjE2AtETC9dX3p8
 kLGmFY2PKv8Z+f0cAiZZseBvQQEMK3P/aes06CsAzu+LpAq7sbQ4gx0iIsC4XhNnAotC
 4iISv9MyN7IVJ612FPWMUop2vyF0fZPLk1FWS5EAJzOrPZPEeq3wfwcpIb44usphIzSX
 /14U/EHJsbS79a/Qrv0wlSnplvJ0sRlqbdaR10bX+vaHTSu+SmJw3W6AXGKee6EkzNwS
 zO5AzwqLut7VG2fTsQKRtQUpws4KYqXaOMvh0ULoBtNNTlXccIRHha5UKFglrSn7nWP7
 F6xA==
X-Gm-Message-State: ABy/qLaLj0blg8PgttOiqbtZuvA5ZRH99v2QkzvTWJeo0yERqHh0MbUZ
 Ey9Y6CYNo6gUadz8cb6gq2c=
X-Google-Smtp-Source: APBJJlFFdr+T+CD8l1GNi/gXICbvTn1uYiCha+nR2yx50vfrQl5uSomvbHj+f2WWs9Bi/pNZrOjaKQ==
X-Received: by 2002:a05:6512:2210:b0:4fd:c762:722c with SMTP id
 h16-20020a056512221000b004fdc762722cmr2949144lfu.19.1689856696034; 
 Thu, 20 Jul 2023 05:38:16 -0700 (PDT)
Received: from xeon.. ([188.163.112.64]) by smtp.gmail.com with ESMTPSA id
 m25-20020ac24ad9000000b004fb9c625b4asm184401lfp.210.2023.07.20.05.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 05:38:15 -0700 (PDT)
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
Date: Thu, 20 Jul 2023 15:37:41 +0300
Message-Id: <20230720123744.26854-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230720123744.26854-1-clamor95@gmail.com>
References: <20230720123744.26854-1-clamor95@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:18:21 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 u-boot@dh-electronics.com, u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH v2 4/7] test: dm: regulator: provide test of
	auto setup
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

Replace deprecated API test with test of uclass wide autosetup.

LDO2 voltage according to dts should be 3.3v not 3.0v

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 include/power/sandbox_pmic.h |   2 +-
 test/dm/regulator.c          | 131 +++++++----------------------------
 2 files changed, 27 insertions(+), 106 deletions(-)

diff --git a/include/power/sandbox_pmic.h b/include/power/sandbox_pmic.h
index 1dbd15b523..50fc5881f8 100644
--- a/include/power/sandbox_pmic.h
+++ b/include/power/sandbox_pmic.h
@@ -137,7 +137,7 @@ enum {
 #define SANDBOX_LDO1_AUTOSET_EXPECTED_UA	100000
 #define SANDBOX_LDO1_AUTOSET_EXPECTED_ENABLE	true
 
-#define SANDBOX_LDO2_AUTOSET_EXPECTED_UV	3000000
+#define SANDBOX_LDO2_AUTOSET_EXPECTED_UV	3300000
 #define SANDBOX_LDO2_AUTOSET_EXPECTED_UA	-ENOSYS
 #define SANDBOX_LDO2_AUTOSET_EXPECTED_ENABLE	false
 
diff --git a/test/dm/regulator.c b/test/dm/regulator.c
index 9b503e4c59..eb96ddcdac 100644
--- a/test/dm/regulator.c
+++ b/test/dm/regulator.c
@@ -182,12 +182,11 @@ static
 int dm_test_power_regulator_set_enable_if_allowed(struct unit_test_state *uts)
 {
 	const char *platname;
-	struct udevice *dev, *dev_autoset;
+	struct udevice *dev;
 	bool val_set = false;
 
 	/* Get BUCK1 - always on regulator */
 	platname = regulator_names[BUCK1][PLATNAME];
-	ut_assertok(regulator_autoset_by_name(platname, &dev_autoset));
 	ut_assertok(regulator_get_by_platname(platname, &dev));
 
 	/* Try disabling always-on regulator */
@@ -196,7 +195,6 @@ int dm_test_power_regulator_set_enable_if_allowed(struct unit_test_state *uts)
 
 	/* Set the Enable of LDO1 - default is disabled */
 	platname = regulator_names[LDO1][PLATNAME];
-	ut_assertok(regulator_autoset_by_name(platname, &dev_autoset));
 	ut_assertok(regulator_get_by_platname(platname, &dev));
 
 	/* Get the Enable state of LDO1 and compare it with the requested one */
@@ -293,131 +291,54 @@ static int dm_test_power_regulator_set_get_suspend_enable(struct unit_test_state
 }
 DM_TEST(dm_test_power_regulator_set_get_suspend_enable, UT_TESTF_SCAN_FDT);
 
-/* Test regulator autoset method */
-static int dm_test_power_regulator_autoset(struct unit_test_state *uts)
+/* Test regulator setup inside uclass driver */
+static int dm_test_power_regulator_set(struct unit_test_state *uts)
 {
 	const char *platname;
-	struct udevice *dev, *dev_autoset;
+	struct udevice *dev;
 
 	/*
-	 * Test the BUCK1 with fdt properties
-	 * - min-microvolt = max-microvolt = 1200000
-	 * - min-microamp = max-microamp = 200000
-	 * - always-on = set
-	 * - boot-on = not set
-	 * Expected output state: uV=1200000; uA=200000; output enabled
+	 * LDO1 with fdt properties:
+	 * - min-microvolt = max-microvolt = 1800000
+	 * - min-microamp = max-microamp = 100000
+	 * - always-on = not set
+	 * - boot-on = set
+	 * Expected output state: uV=1800000; uA=100000; output enabled
 	 */
-	platname = regulator_names[BUCK1][PLATNAME];
-	ut_assertok(regulator_autoset_by_name(platname, &dev_autoset));
 
 	/* Check, that the returned device is proper */
+	platname = regulator_names[LDO1][PLATNAME];
 	ut_assertok(regulator_get_by_platname(platname, &dev));
-	ut_asserteq_ptr(dev, dev_autoset);
 
 	/* Check the setup after autoset */
 	ut_asserteq(regulator_get_value(dev),
-		    SANDBOX_BUCK1_AUTOSET_EXPECTED_UV);
+		    SANDBOX_LDO1_AUTOSET_EXPECTED_UV);
 	ut_asserteq(regulator_get_current(dev),
-		    SANDBOX_BUCK1_AUTOSET_EXPECTED_UA);
+		    SANDBOX_LDO1_AUTOSET_EXPECTED_UA);
 	ut_asserteq(regulator_get_enable(dev),
-		    SANDBOX_BUCK1_AUTOSET_EXPECTED_ENABLE);
-
-	return 0;
-}
-DM_TEST(dm_test_power_regulator_autoset, UT_TESTF_SCAN_FDT);
-
-/*
- * Struct setting: to keep the expected output settings.
- * @voltage: Voltage value [uV]
- * @current: Current value [uA]
- * @enable: output enable state: true/false
- */
-struct setting {
-	int voltage;
-	int current;
-	bool enable;
-};
-
-/*
- * platname_list: an array of regulator platform names.
- * For testing regulator_list_autoset() for outputs:
- * - LDO1
- * - LDO2
- */
-static const char *platname_list[] = {
-	SANDBOX_LDO1_PLATNAME,
-	SANDBOX_LDO2_PLATNAME,
-	NULL,
-};
-
-/*
- * expected_setting_list: an array of regulator output setting, expected after
- * call of the regulator_list_autoset() for the "platname_list" array.
- * For testing results of regulator_list_autoset() for outputs:
- * - LDO1
- * - LDO2
- * The settings are defined in: include/power/sandbox_pmic.h
- */
-static const struct setting expected_setting_list[] = {
-	[0] = { /* LDO1 */
-	.voltage = SANDBOX_LDO1_AUTOSET_EXPECTED_UV,
-	.current = SANDBOX_LDO1_AUTOSET_EXPECTED_UA,
-	.enable  = SANDBOX_LDO1_AUTOSET_EXPECTED_ENABLE,
-	},
-	[1] = { /* LDO2 */
-	.voltage = SANDBOX_LDO2_AUTOSET_EXPECTED_UV,
-	.current = SANDBOX_LDO2_AUTOSET_EXPECTED_UA,
-	.enable  = SANDBOX_LDO2_AUTOSET_EXPECTED_ENABLE,
-	},
-};
-
-static int list_count = ARRAY_SIZE(expected_setting_list);
-
-/* Test regulator list autoset method */
-static int dm_test_power_regulator_autoset_list(struct unit_test_state *uts)
-{
-	struct udevice *dev_list[2], *dev;
-	int i;
+		    SANDBOX_LDO1_AUTOSET_EXPECTED_ENABLE);
 
 	/*
-	 * Test the settings of the regulator list:
-	 * LDO1 with fdt properties:
-	 * - min-microvolt = max-microvolt = 1800000
-	 * - min-microamp = max-microamp = 100000
-	 * - always-on = not set
-	 * - boot-on = set
-	 * Expected output state: uV=1800000; uA=100000; output enabled
-	 *
 	 * LDO2 with fdt properties:
 	 * - min-microvolt = max-microvolt = 3300000
 	 * - always-on = not set
 	 * - boot-on = not set
-	 * Expected output state: uV=300000(default); output disabled(default)
+	 * Expected output state: uV=330000; output disabled
 	 * The expected settings are defined in: include/power/sandbox_pmic.h.
 	 */
-	ut_assertok(regulator_list_autoset(platname_list, dev_list, false));
 
-	for (i = 0; i < list_count; i++) {
-		/* Check, that the returned device is non-NULL */
-		ut_assert(dev_list[i]);
-
-		/* Check, that the returned device is proper */
-		ut_assertok(regulator_get_by_platname(platname_list[i], &dev));
-		ut_asserteq_ptr(dev_list[i], dev);
-
-		/* Check, that regulator output Voltage value is as expected */
-		ut_asserteq(regulator_get_value(dev_list[i]),
-			    expected_setting_list[i].voltage);
-
-		/* Check, that regulator output Current value is as expected */
-		ut_asserteq(regulator_get_current(dev_list[i]),
-			    expected_setting_list[i].current);
+	/* Check, that the returned device is proper */
+	platname = regulator_names[LDO2][PLATNAME];
+	ut_assertok(regulator_get_by_platname(platname, &dev));
 
-		/* Check, that regulator output Enable state is as expected */
-		ut_asserteq(regulator_get_enable(dev_list[i]),
-			    expected_setting_list[i].enable);
-	}
+	/* Check the setup after autoset */
+	ut_asserteq(regulator_get_value(dev),
+		    SANDBOX_LDO2_AUTOSET_EXPECTED_UV);
+	ut_asserteq(regulator_get_current(dev),
+		    SANDBOX_LDO2_AUTOSET_EXPECTED_UA);
+	ut_asserteq(regulator_get_enable(dev),
+		    SANDBOX_LDO2_AUTOSET_EXPECTED_ENABLE);
 
 	return 0;
 }
-DM_TEST(dm_test_power_regulator_autoset_list, UT_TESTF_SCAN_FDT);
+DM_TEST(dm_test_power_regulator_set, UT_TESTF_SCAN_FDT);
-- 
2.39.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
