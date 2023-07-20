Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 935C4768DEA
	for <lists+uboot-stm32@lfdr.de>; Mon, 31 Jul 2023 09:18:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E9ADC7129D;
	Mon, 31 Jul 2023 07:18:23 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D07CC6B44D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 12:38:19 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-4fba8f2197bso1169596e87.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 05:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689856699; x=1690461499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8NsuBa5q1po55Xw+GzjeoNHQxHLrzdpdG6a/9XB5XP4=;
 b=DJM4BWpaXXjt4pXHiuXl+M5d8hTICvAA+UkejPX2VX4WIgQxphFZaGpECTIXV9NjeR
 RXanzVfEoiKj3xHBI2RIZDkkOp1ooOZXG3kloa1cOgDAq3WaiTFLzMgR1yyl/GrmsruR
 WUCachSM3FC1qMFQqtccmbggrTvI32WgmccTSz0z5Fju/IY9xztdy3QBIzE9GlVzitGh
 tFPR5U43IJCkPn2Xyh3FplSznRIAYFJccVQzRJC1X1PEiuh5PFUPl9pm4EwUTueZ0WuD
 VUtFVGm30xNzy7GkYvA1qOsJTaAaN2q9nRilt1axEWcZo16ocDNSCtkA4/Z2Rc++7lzz
 V2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689856699; x=1690461499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8NsuBa5q1po55Xw+GzjeoNHQxHLrzdpdG6a/9XB5XP4=;
 b=FdPMNUwB2Fp9yxkSQmDt9hf0STQj9DVzmuHfohxR6kacyKFgj1xmY3m7aslpnSzYSz
 laPq3mkXwfCo96qpHa9Ksnr6V3v37odG7VP90Mk8iQ26upWVmojJE7vCDGvIk4JMckfW
 Jyg1pbRsIOAB3hrEm/wCqw9YI09ShkmAgcWGUtIGUIsgBOb5PKC/rhmD2Lgb69x2wSgk
 iP1fmhguf0fJBfuVcnJRo7yiHxOBjQkCcrQyN0dcvwvUVqkVWLJXySd9ggpYTkB4ftAA
 xKLWKO7SASN1HHAT0Qo1NV+comxwwNQs4ActfoGxuIWpdo4ddyMf6kfDrHZlh2KTvx9r
 lkpQ==
X-Gm-Message-State: ABy/qLbSmqupHlWKWfpL1HDxXQ85dP6raPcqH0pqGmGcX+OfaTdGiyAq
 M+j3Hs6h5t2OLXl1mAlbFZQ=
X-Google-Smtp-Source: APBJJlE2NzDLWfE0tI8IJ8zcbedww4SyKNtAwkhwUxniRUf/pHzl99ccK1r2BXAnBKB6Ccx2db9z8A==
X-Received: by 2002:a19:381d:0:b0:4fb:774f:9a84 with SMTP id
 f29-20020a19381d000000b004fb774f9a84mr1203088lfa.13.1689856698772; 
 Thu, 20 Jul 2023 05:38:18 -0700 (PDT)
Received: from xeon.. ([188.163.112.64]) by smtp.gmail.com with ESMTPSA id
 m25-20020ac24ad9000000b004fb9c625b4asm184401lfp.210.2023.07.20.05.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 05:38:18 -0700 (PDT)
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
Date: Thu, 20 Jul 2023 15:37:43 +0300
Message-Id: <20230720123744.26854-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230720123744.26854-1-clamor95@gmail.com>
References: <20230720123744.26854-1-clamor95@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:18:21 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 u-boot@dh-electronics.com, u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH v2 6/7] test: dm: pmic: provide test of child
	autosetup
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

Test if regulator uclass children of PMIC are auto probed and set
after PMIC probe.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 test/dm/pmic.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/test/dm/pmic.c b/test/dm/pmic.c
index ce671202fb..d0a3c24a54 100644
--- a/test/dm/pmic.c
+++ b/test/dm/pmic.c
@@ -18,6 +18,7 @@
 #include <dm/uclass-internal.h>
 #include <dm/util.h>
 #include <power/pmic.h>
+#include <power/regulator.h>
 #include <power/sandbox_pmic.h>
 #include <test/test.h>
 #include <test/ut.h>
@@ -129,3 +130,36 @@ static int dm_test_power_pmic_mc34708_rw_val(struct unit_test_state *uts)
 }
 
 DM_TEST(dm_test_power_pmic_mc34708_rw_val, UT_TESTF_SCAN_FDT);
+
+static int dm_test_power_pmic_child_probe(struct unit_test_state *uts)
+{
+	const char *name = "sandbox_pmic";
+	const char *devname = "ldo1";
+	struct udevice *dev;
+
+	ut_assertok(pmic_get(name, &dev));
+
+	/*
+	 * LDO1 with fdt properties:
+	 * - min-microvolt = max-microvolt = 1800000
+	 * - min-microamp = max-microamp = 100000
+	 * - always-on = not set
+	 * - boot-on = set
+	 * Expected output state: uV=1800000; uA=100000; output enabled
+	 */
+
+	/* Check, that the returned device is proper */
+	ut_assertok(regulator_get_by_devname(devname, &dev));
+
+	/* Check the setup after autoset */
+	ut_asserteq(regulator_get_value(dev),
+		    SANDBOX_LDO1_AUTOSET_EXPECTED_UV);
+	ut_asserteq(regulator_get_current(dev),
+		    SANDBOX_LDO1_AUTOSET_EXPECTED_UA);
+	ut_asserteq(regulator_get_enable(dev),
+		    SANDBOX_LDO1_AUTOSET_EXPECTED_ENABLE);
+
+	return 0;
+}
+
+DM_TEST(dm_test_power_pmic_child_probe, UT_TESTF_SCAN_FDT);
-- 
2.39.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
