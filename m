Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEC8768DE6
	for <lists+uboot-stm32@lfdr.de>; Mon, 31 Jul 2023 09:18:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24F27C71295;
	Mon, 31 Jul 2023 07:18:23 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D024EC6A5E6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 12:38:13 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-4fba74870abso1204966e87.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 05:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689856693; x=1690461493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/LDBM0kru62+bHvDqgBH9EsVX+/DThiGzcorwaxeAdU=;
 b=h8cU2kSrW0mp5Ny7Ze96NgirnY5e/UIntBJ/U7BBdjSxCQsIeauz+Oex4rxMxAmcEP
 Al1BeeFD26RRZz/cR+50epGrZSfHfcU3tQ0BRtQUpuwxGS8dtnHd/nfA2hL4Nx0iXG9S
 RqXQhneU8n8CSy8teHD2xBJsOazEHuQ2b73tWfqNG+G6XbUyP9KowLXHIZV4K0OInNPg
 Z/KHHKqSkKWQTWZOgGUkqWZf/Z62hv44pKnvFyP0VWfTk7lamYFYukLmA2soInt4piEO
 hMthp5r1kEdW6JW+KFTeRe9MPSZ4Awq1hfwm2SQoNC7OyGqHZ+Jg0m+eW2rj5F8UqMIe
 RBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689856693; x=1690461493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/LDBM0kru62+bHvDqgBH9EsVX+/DThiGzcorwaxeAdU=;
 b=LVA72obZp32jMxar/PnkLYuhDqK9DM5YX0yQ11EH2hsqH94iCLqGjZp2cUVFEgrnXv
 0gMlANqwogA7XtzT980ZfU9etcI6glcSrmF8FO49K5N2i29/h/UG1zGEX4AIENzHikpc
 SKgCYz0bavKXnxzPNfeQVTJrJc8WHLdR2pA3ue/UUl3SWgzQ/Lo/vUMJdrtKD6I1jZot
 25IZQm/J4cVYpR5/c+m2XO6dmYF92nr6XYoTuAgxvXAiMFZSEmlPQRWVntn5URKe7i2n
 RL5jPBCH/T41c7lwYU5M7pdRyMYd8kZ9jCxob4iZaJE3yI170NTk09mvtWdvnY824JSM
 6ebg==
X-Gm-Message-State: ABy/qLYwrQvRXelMNYaqU3Mijy3NDLiCEamo6FyfR0lWISBTU/rF7qCN
 fQjBHYzlQT612ZYvavapN68=
X-Google-Smtp-Source: APBJJlFHnxku0eaSmomhnpZJrtAGAOXQMjzthI1kTV3Xz2b2XAdebR4SjbtuXBiFkILdYTExY5pMMw==
X-Received: by 2002:a19:6d06:0:b0:4fd:d1df:9bda with SMTP id
 i6-20020a196d06000000b004fdd1df9bdamr1652729lfc.42.1689856692960; 
 Thu, 20 Jul 2023 05:38:12 -0700 (PDT)
Received: from xeon.. ([188.163.112.64]) by smtp.gmail.com with ESMTPSA id
 m25-20020ac24ad9000000b004fb9c625b4asm184401lfp.210.2023.07.20.05.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 05:38:12 -0700 (PDT)
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
Date: Thu, 20 Jul 2023 15:37:39 +0300
Message-Id: <20230720123744.26854-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230720123744.26854-1-clamor95@gmail.com>
References: <20230720123744.26854-1-clamor95@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:18:21 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 u-boot@dh-electronics.com, u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH v2 2/7] test: dm: regulator: test counter in
	set_enable_if_allowed test
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

Emulate use of the regulator by a few consumers with balanced on/off
calls.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 test/dm/regulator.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/test/dm/regulator.c b/test/dm/regulator.c
index 86f4862d9d..9b503e4c59 100644
--- a/test/dm/regulator.c
+++ b/test/dm/regulator.c
@@ -194,6 +194,25 @@ int dm_test_power_regulator_set_enable_if_allowed(struct unit_test_state *uts)
 	ut_assertok(regulator_set_enable_if_allowed(dev, val_set));
 	ut_asserteq(regulator_get_enable(dev), !val_set);
 
+	/* Set the Enable of LDO1 - default is disabled */
+	platname = regulator_names[LDO1][PLATNAME];
+	ut_assertok(regulator_autoset_by_name(platname, &dev_autoset));
+	ut_assertok(regulator_get_by_platname(platname, &dev));
+
+	/* Get the Enable state of LDO1 and compare it with the requested one */
+	ut_assertok(regulator_set_enable_if_allowed(dev, true));
+	ut_asserteq(regulator_get_enable(dev), true);
+
+	/* Emulate second consumer */
+	ut_assertok(regulator_set_enable_if_allowed(dev, true));
+	ut_asserteq(regulator_get_enable(dev), true);
+
+	/* Emulate one of counsumers disable call */
+	ut_assertok(regulator_set_enable_if_allowed(dev, false));
+
+	/* Regulator should still be on since counter indicates one consumer active */
+	ut_asserteq(regulator_get_enable(dev), true);
+
 	return 0;
 }
 DM_TEST(dm_test_power_regulator_set_enable_if_allowed, UT_TESTF_SCAN_FDT);
-- 
2.39.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
