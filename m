Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8F7768DDD
	for <lists+uboot-stm32@lfdr.de>; Mon, 31 Jul 2023 09:18:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50D06C71281;
	Mon, 31 Jul 2023 07:18:22 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B2F5C6905A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jul 2023 07:05:12 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2b708e49059so82628901fa.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jul 2023 00:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689663911; x=1692255911;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jy9nfr4gAQI+xZpRYkb+lyiao197lMn5ADvEKjuqEGI=;
 b=WCCmAaEJAwc3nMRqbsGbQn1BNrWrwJwmhjPg3kS637hbgZWv8uBG5Y6JVcUnUrjxc0
 HOv5ZZyvExAqA8PC8jBZAyC5NgKMWMxH1v9xFGFJ5W/scRipJudHrToqRIJrpxrBTjqg
 sLZU7AOy8NSftY223wTGUjT0tb45wizsghIJa5Hab45b+YqXHAuGBgYwKfJOkaKOuZ3E
 PuzMZFtwneP/W3ifWWFqSewTluapwizvD/VwKs/DhHKcpHWwxXzOOlBkmLBy+VTBjjo6
 u9kzdofdSLGFY92ZuGzDDib4jsBsUw6z4a7U0eCVbOR3sIgTTtpxi+YBWxIIBsxeVutn
 DRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689663911; x=1692255911;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jy9nfr4gAQI+xZpRYkb+lyiao197lMn5ADvEKjuqEGI=;
 b=HQ0HY90KfOiU11kwhxIuFr6nM9QLz7ChWTxe5MwHwqEk31wsvBNARrSL0atKe0Ch86
 nEgTMiT8shQQ39994Y33ePqI9P+CcZSQV0ZtgIxpcPYeCesupZdvXEKAz5mqNOnElLeq
 8R45WdMPJg3nSM8jAz1/hORTsv5eiwHSx2kihXFhpsmECr8qJIR+hOl3d9y5edM930ec
 u4JeZfu6xsAbfdhRAnxr4/QUsxRpnnspNNKr74sW5OXPtFxq9ceQDdxrJYUdwo6jz3md
 RkTrVEnLE6gwmr6lbarJlFlK/Z1yYBhKfc+E7CP6K33YqLrA+FzcTinOFjlCg3Vann5G
 fwsQ==
X-Gm-Message-State: ABy/qLZmUQXOKretKmX9oRpZvYG/3OM9HZ+0aFh3180ivXBHe1vYzlBu
 nEFfm0IfItuFSMckWUKdufo=
X-Google-Smtp-Source: APBJJlGA4ksGmESluASkF5giTK6Lksx6fqgr4m0QAC4sEKvYSOkPaItkzXKDbrI26DtQZxgOSigc1Q==
X-Received: by 2002:a05:651c:104e:b0:2b6:c790:150a with SMTP id
 x14-20020a05651c104e00b002b6c790150amr10417218ljm.22.1689663911275; 
 Tue, 18 Jul 2023 00:05:11 -0700 (PDT)
Received: from xeon.. ([188.163.112.64]) by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c220a00b003fbfea1afffsm1343644wml.27.2023.07.18.00.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 00:05:09 -0700 (PDT)
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
Date: Tue, 18 Jul 2023 10:05:00 +0300
Message-Id: <20230718070504.19810-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:18:21 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 u-boot@dh-electronics.com, u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH v1 0/4] General regulator and pmic uclass
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
 and fixed regulators. Counting works as expected.

power: regulator-uclass: perform regulator setup inside uclass
All self-sufficient regulators are set to probe after bind to perform
initial setup later in post-probe with pdata from device tree.
 - self-sufficient regulator is one that is not dependent on any other
 device (this category does not include pmic regulators for example).
 I have tested fixed regulators and got correct probing and setup
 according to device tree.

power: pmic-uclass: probe every child on pmic_post_probe
All non self-sufficient regulators must be probed after main device is
probed (in this case it is pmic_post_probe). In all other aspects pmic
regulators behave same.
 - tested with MAX77663 ldo and sd regulators, no errors or inconsistencies
 were tracked, regulator props (boot-on, always-on etc) and consumer calls
 work as expected.

power: regulator-uclass: remove all deprecated API use
This is where everything gets tricky. All board dedicated API of regulators
has to be removed. System presented above should cover all regulators setup
but non the less this should be disscussed with maintainers and tested on
affected boards. This commit removes and cleans most of those API traces,
except tests, I am still a bit confused how to setup testing since this is
interference into framework itself.

Svyatoslav Ryhel (4):
  power: regulator: expand basic reference counter onto all uclass
  power: regulator-uclass: perform regulator setup inside uclass
  power: pmic-uclass: probe every child on pmic_post_probe
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
 drivers/power/regulator/regulator-uclass.c    | 234 +++++++-----------
 drivers/power/regulator/regulator_common.c    |  22 --
 drivers/power/regulator/regulator_common.h    |  21 --
 drivers/video/bridge/ps862x.c                 |  12 +-
 drivers/video/rockchip/rk_vop.c               |   6 +-
 include/power/regulator.h                     | 121 +--------
 17 files changed, 106 insertions(+), 379 deletions(-)

-- 
2.39.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
