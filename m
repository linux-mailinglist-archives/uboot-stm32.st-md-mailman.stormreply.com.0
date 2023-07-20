Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4693B768DE4
	for <lists+uboot-stm32@lfdr.de>; Mon, 31 Jul 2023 09:18:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09D73C71290;
	Mon, 31 Jul 2023 07:18:23 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57E3CC6A5E6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 12:38:11 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-4fcd615d7d6so1149381e87.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 05:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689856690; x=1690461490;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lrrz0d5RxzUIsxuaCwltwlvw/gjUD5Ldtj+D9gKLfFw=;
 b=YttmLnQr6VwkDXoJsQGbyj35USbVqUTmFLWEAGt8yhzIe8nCpymadQsstPxpAfbrsd
 ZVqOz8r2RAMCt92lQOirLZsGKeHjGy4gbc1vH3puPR/o3rK5Xkt6ypeNPI9KTzUp72fr
 Yz+/Xltd86YgE0A+E36CmSfcGE4JX/FYXscAtzKb3z13sPbfwAStBThtsnrccqoSukTF
 9dAESc6tLU/zdkQQZYF3geKAmRHxW/xXKIwuJo4vqjAkHLYxWf65eDuHwp1yIgsp2A8U
 Mzfq0JoZEpZ+8GsqKSeZtlbXgtDGoqL77c9tSVv+p0GSEtd1CpUXasY6/iFTrFbeEnvD
 K2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689856690; x=1690461490;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lrrz0d5RxzUIsxuaCwltwlvw/gjUD5Ldtj+D9gKLfFw=;
 b=F+bMhVUvrEP37u4sVzm2elNaXkVxDNycTgrlHJOCCpHWuLuVS3AyeG4bpeySj70qQC
 jMJPQD/NK50CoJ+qiOMObjh9oty3UZbGD/saz2LIRSBWVv8irgCcpeO3ININrnj2p4y7
 y4XX3ZSB+Gqt76LNidf7iZtf/YswjqfquA5esAMpRlgIz+4K1ttyHdzasA7qRGvZnI/y
 FWMcba/6K6RX0fDpCmczeAyuIb30e1YwUpArX2Fi/B8dyAStIPEpoT3wg7d/inuzf0EK
 XSMYWtAuaqk0CQUKtmtBDR2TD4kDc0SdQlpEsfzJ+I196Vm3YSY6/tgYmY3kDJcdDAlY
 pVTg==
X-Gm-Message-State: ABy/qLaVgZEPKkMmoARf11iipAnPkmCrIjRr8QLUZBsmUZwPjfzv8iD3
 ln/7eA9nVJVUF/zOYohRkwU=
X-Google-Smtp-Source: APBJJlGaPxZtjACjzezA5zprsZbVZFjzxshZ/WIBA6QPtp2cZuN6MW/mCHypaZiLg5U+patD2sVvpw==
X-Received: by 2002:a05:6512:e85:b0:4fb:8f79:631 with SMTP id
 bi5-20020a0565120e8500b004fb8f790631mr2261103lfb.46.1689856690095; 
 Thu, 20 Jul 2023 05:38:10 -0700 (PDT)
Received: from xeon.. ([188.163.112.64]) by smtp.gmail.com with ESMTPSA id
 m25-20020ac24ad9000000b004fb9c625b4asm184401lfp.210.2023.07.20.05.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 05:38:09 -0700 (PDT)
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
Date: Thu, 20 Jul 2023 15:37:37 +0300
Message-Id: <20230720123744.26854-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:18:21 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 u-boot@dh-electronics.com, u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH v2 0/7] General regulator and pmic uclass
	improvements
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

This patchset derives from discussion of TPS65913 bringup and aims to
cycle all regulator management inside uclass removing need of any board
calls for regulators.

My hw setup is Tegra 3 LG Optimus Vu P895 (PMIC is MAX77663) with native
spl u-boot build.

power: regulator: expand basic reference counter onto all uclass
Commit is basically expansion of 4fcba5d ("regulator: implement basic
reference counter") onto all regulators.
 - my testing on hw has shown no issues so far with both pmic regulators
 and fixed regulators. Counting works as expected, dm test is set in
 test of regulator_set_enable_if_allowed.

power: regulator-uclass: perform regulator setup inside uclass
All self-sufficient regulators are set to probe after bind to perform
initial setup later in post-probe with pdata from device tree.
 - self-sufficient regulator is one that is not dependent on any other
 device (this category does not include pmic regulators for example).
 I have tested fixed regulators and got correct probing and setup
 according to device tree. DM test is set by checking regulators data
 without pre-configuring them manually

power: pmic-uclass: probe every child on pmic_post_probe
All non self-sufficient regulators must be probed after main device is
probed (in this case it is pmic_post_probe). In all other aspects pmic
regulators behave same.
 - tested with MAX77663 ldo and sd regulators, no errors or inconsistencies
 were tracked, regulator props (boot-on, always-on etc) and consumer calls
 work as expected. DM test is set by checking regulators data without pre-
 configuring them manually just after pmic probe.

power: regulator-uclass: remove all deprecated API use
This is where everything gets tricky. All board dedicated API of regulators
has to be removed. System presented above should cover all regulators setup
but non the less this should be disscussed with maintainers and tested on
affected boards. This commit removes and cleans most of those API traces.

---
Changes from v1:
 - adapted description of regulator_set_enable
 - remove uc_pdata->enable_count from post_probe
 - added tests from counter and regulators post_probe
---

Svyatoslav Ryhel (7):
  power: regulator: expand basic reference counter onto all uclass
  test: dm: regulator: test counter in set_enable_if_allowed test
  power: regulator-uclass: perform regulator setup inside uclass
  test: dm: regulator: provide test of auto setup
  power: pmic-uclass: probe every child on pmic_post_probe
  test: dm: pmic: provide test of child autosetup
  power: regulator-uclass: remove all deprecated API use

 arch/arm/mach-rockchip/board.c                |   8 -
 arch/arm/mach-rockchip/rk3399/rk3399.c        |  10 -
 board/Marvell/octeontx2_cn913x/board.c        |   5 -
 .../amlogic/odroid-go-ultra/odroid-go-ultra.c |   2 -
 board/dhelectronics/dh_stm32mp1/board.c       |   2 -
 board/engicam/stm32mp1/stm32mp1.c             |   3 -
 board/google/veyron/veyron.c                  |   6 -
 board/samsung/common/exynos5-dt.c             |   4 -
 board/samsung/odroid/odroid.c                 |  10 -
 board/st/stm32mp1/stm32mp1.c                  |   9 -
 drivers/power/pmic/pmic-uclass.c              |  10 +
 drivers/power/regulator/regulator-uclass.c    | 253 +++++++-----------
 drivers/power/regulator/regulator_common.c    |  22 --
 drivers/power/regulator/regulator_common.h    |  21 --
 drivers/video/bridge/ps862x.c                 |  12 +-
 drivers/video/rockchip/rk_vop.c               |   6 +-
 include/power/regulator.h                     | 121 +--------
 include/power/sandbox_pmic.h                  |   2 +-
 test/dm/pmic.c                                |  34 +++
 test/dm/regulator.c                           | 148 +++-------
 20 files changed, 204 insertions(+), 484 deletions(-)

-- 
2.39.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
