Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1200BDF0E0
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 16:32:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97616C56638;
	Wed, 15 Oct 2025 14:32:23 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52249C349C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:32:22 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-47106fc51faso6206525e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760538741; x=1761143541;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q5G/pzUDmAWP39RNeIkhwHh1OMLzLKAP5G+xfsbBMiU=;
 b=CHjlkibOBD1f/e02MB2r4x1ouPJQjmITacV2DRY54zMSJcXF9nxwOgSWG1zJBXrLAK
 SD4LpdLEhyxzS/Xs2zhRyptQXwFwvjXwZSPA9bq6oxnvTmZE6eLYHudWT9wIrnXuJvc4
 FuWhw8FQj4LoZ1HpnyKenOMpLqbDnrciRyvAQCRlc+RFHKV/ZxHF4kFcSnRu4pjP3pLV
 evSovYN9sSCp3Oe3BLnF9pKqVYsUbiVV7WL66WZJXIQTlnKhdKDRzuP0aNSVtAtA+cRh
 jpfBWKNmnA11RzmT5MRqvRA4ioWMCvkOlddOkRQw/H4sj1sLbUsWJdskAl5yxmRTinNQ
 RO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760538741; x=1761143541;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q5G/pzUDmAWP39RNeIkhwHh1OMLzLKAP5G+xfsbBMiU=;
 b=owhn/pzs59PCPiQrzRrqczQ8K3f0PYYxCiPdZNrs7Hu9FnCjdzZnBoRUrjICNBMiiH
 HBy0n519jOaz8cYgnXhncFxRB85u52PT0F/QNCacx0Ugrkvs/uhrcGvjMfATvkvAuXWC
 NiPUZvRtfQTEPpOc15Jr2r5tXuTuZrXNRW5Li8vqqySznsFyWXi2y4hLjgLobnc8qQW+
 j+16MGqgolROY2ftyvVOeBfKztJv0ulqAJm0L2k1IjiYcB7VS51PsFMGrPbufmtmHdQE
 F6ygOI1C4MpX7CdFAygu5zvW4WiSqQMe7GOZVmAWShPuwdcLiQg7e4B07d4MV4+84IKV
 Dcsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbWn1NRWQY8Qf7MAQzPbgT52lcMK/RuMryq0MR7LrYH558Ml7A6BNjyA0Biy12iwij59EHRLw1m5+z5w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyTmsxaFR3OqOatWglKAsDjdeFcr2K9BL2awPwsaWfXsqm8/uk3
 l1ssD1kdEryTVDZs4MyRCHk6fVRBkrwqCou5nMy1faJTEcpE4qnB0PP6JhthhdLB0pQ=
X-Gm-Gg: ASbGnctYknIoCCHRdvTFuhb+lt5Kd9P0NyO7MXPzUUohpLk1vdwL3qf1oCYs1mQEEpI
 XNl5R0qlnsXAbHFbDtF6wCjK+Wsb/DXAnHUp/Qsb8w4dddDvYhNngUBbRU5PPTq2Yl4Dc3B1Aus
 6UE4McgviEtjDMt13xcfZCoHzJgXoSI/XhaJfb3CT+uTgKGIPoKH/wqcuszWaWuh178x61pok/3
 bre7QyxO88fmAVUwnNx+kyvjmmVWw8/AwywudzxLIQ5wiC29zB8gIrg1T39Wjjo67ah4wiXwRBs
 /8e4VePuNA3M6ybiJdNkbtoUBNvtR1xHCA6Pz+np6461vPpbGYRADPY7hXwt6k5ct6lvH0a6qJk
 6eGpSUMwpAJGjPBY+yI9QrE9pkNz2Xq8Bs/yyYGz5TBu83gwmYNYEuD00e8pOFVaatzJOFn4N3Q
 ==
X-Google-Smtp-Source: AGHT+IGpoVfGLE6ayqDBinGSA8T0Qgz6rCdE95D3/d6SX1NXBSxgZaQBiBLkHjt9eoMpy6vxWPuThg==
X-Received: by 2002:a05:600c:5490:b0:46e:4744:add7 with SMTP id
 5b1f17b1804b1-46fae33db7amr213440255e9.7.1760538741374; 
 Wed, 15 Oct 2025 07:32:21 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:fed:4601:4b30:fdb5:8c7d:59b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-470ff15ef28sm43185915e9.5.2025.10.15.07.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:32:20 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Wed, 15 Oct 2025 15:32:05 +0100
Message-Id: <20251015-clk_ops-v1-0-5f80f827407e@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGWw72gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0MD3eSc7Pj8gmJd4yTz5GTL5OQUA3MDJaDqgqLUtMwKsEnRsbW1AEt
 mhXtZAAAA
X-Change-ID: 20251010-clk_ops-3b7cc9ccd070
To: u-boot-amlogic@groups.io, u-boot@lists.denx.de, 
 Paul Barker <paul@pbarker.dev>, uboot-snps-arc@synopsys.com, 
 Dai Okamura <okamura.dai@socionext.com>, 
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>, 
 adsp-linux@analog.com, uboot-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.2
Cc: Peng Fan <peng.fan@nxp.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@foss.arm.com>,
 Alice Guo <alice.guo@nxp.com>, Stefan Roese <stefan.roese@mailbox.org>,
 Alif Zakuan Yuslaimi <alif.zakuan.yuslaimi@altera.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Utsav Agarwal <utsav.agarwal@analog.com>, Sean Anderson <seanga2@gmail.com>,
 Naresh Kumar Ravulapalli <nareshkumar.ravulapalli@altera.com>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Marek Vasut <marek.vasut@mailbox.org>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Minkyu Kang <mk7.kang@samsung.com>, Weijie Gao <weijie.gao@mediatek.com>,
 Lukasz Majewski <lukma@denx.de>, Hal Feng <hal.feng@starfivetech.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Thierry Reding <treding@nvidia.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Arturs Artamonovs <arturs.artamonovs@analog.com>,
 Joseph Chen <chenjh@rock-chips.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Ye Li <ye.li@nxp.com>,
 Tien Fong Chee <tien.fong.chee@altera.com>, Yao Zi <ziyao@disroot.org>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Jonas Karlman <jonas@kwiboo.se>,
 Sam Shih <sam.shih@mediatek.com>, Elaine Zhang <zhangqing@rock-chips.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
 Sumit Garg <sumit.garg@kernel.org>, Jonathan Currier <dullfire@yahoo.com>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 Muhammad Hazim Izzat Zamri <muhammad.hazim.izzat.zamri@altera.com>,
 Michal Simek <michal.simek@amd.com>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Greg Malysa <malysagreg@gmail.com>, Heiko Schocher <hs@nabladev.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Tingting Meng <tingting.meng@altera.com>,
 Ian Roberts <ian.roberts@timesys.com>, Simon Glass <sjg@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Padmarao Begari <padmarao.begari@amd.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 00/24] clk: Remove passing of negative errors
 through unsigned return
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

This series removes the passing of negative errors through the .get_rate
function in the clk_ops struct. This function returns an unsigned long.
The only value guaranteed to not be a valid clock rate is 0. This will
also bring the drivers more in sync with Linux to allow for easier code
porting and other maintenance in the future.
Another series will address the calling of clk_get_rate and associated
error handling.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
---
Andrew Goodbody (24):
      clk: meson: Remove negative error returns from clk_get_rate
      clk: sifive: Remove negative error returns from clk_get_rate
      clk: armada-37xx: Remove negative error returns from clk_get_rate
      clk: thead: th1520-ap: Remove negative error returns from clk_get_rate
      clk: ccf: Remove negative error returns from clk_get_rate
      clk: at91: Remove negative error returns from clk_get_rate
      clk: renesas: Remove negative error returns from clk_get_rate
      clk: rockchip: Remove negative error returns from clk_get_rate
      clk: Remove negative error returns from clk_get_rate
      clk: starfive: Remove negative error returns from clk_get_rate
      clk: altera: Remove negative error returns from clk_get_rate
      clk: uniphier: Remove negative error returns from clk_get_rate
      clk: aspeed: Remove negative error returns from clk_get_rate
      clk: nuvoton: Remove negative error returns from clk_get_rate
      clk: exynos: Remove negative error returns from clk_get_rate
      clk: imx: Remove negative error returns from clk_get_rate
      clk: ti: Remove negative error returns from clk_get_rate
      clk: mediatek: Remove negative error returns from clk_get_rate
      clk: owl: Remove negative error returns from clk_get_rate
      clk: tegra: Remove negative error returns from clk_get_rate
      clk: adi: Remove negative error returns from clk_get_rate
      clk: sophgo: Remove negative error returns from clk_get_rate
      clk: stm32: Remove negative error returns from clk_get_rate
      clk: x86: Remove negative error returns from clk_get_rate

 drivers/clk/adi/clk-shared.c             |  2 +-
 drivers/clk/altera/clk-agilex.c          |  2 +-
 drivers/clk/altera/clk-agilex5.c         |  2 +-
 drivers/clk/altera/clk-n5x.c             |  2 +-
 drivers/clk/aspeed/clk_ast2500.c         |  2 +-
 drivers/clk/aspeed/clk_ast2600.c         |  2 +-
 drivers/clk/at91/compat.c                |  6 ++--
 drivers/clk/clk-hsdk-cgu.c               |  2 +-
 drivers/clk/clk-uclass.c                 |  4 +--
 drivers/clk/clk.c                        |  2 +-
 drivers/clk/clk_fixed_factor.c           |  4 +--
 drivers/clk/clk_k210.c                   |  6 ++--
 drivers/clk/clk_sandbox.c                |  4 +--
 drivers/clk/clk_scmi.c                   |  4 +--
 drivers/clk/clk_vexpress_osc.c           |  2 +-
 drivers/clk/clk_zynq.c                   |  4 +--
 drivers/clk/clk_zynqmp.c                 | 40 ++++++++++-----------
 drivers/clk/exynos/clk-exynos7420.c      |  2 +-
 drivers/clk/imx/clk-imx8qm.c             |  6 ++--
 drivers/clk/imx/clk-imx8qxp.c            |  6 ++--
 drivers/clk/imx/clk-imxrt1170.c          |  2 +-
 drivers/clk/imx/clk-pllv3.c              |  2 +-
 drivers/clk/intel/clk_intel.c            |  2 +-
 drivers/clk/mediatek/clk-mtk.c           |  2 +-
 drivers/clk/meson/a1.c                   | 10 +++---
 drivers/clk/meson/axg.c                  | 10 +++---
 drivers/clk/meson/g12a.c                 | 36 +++++++++----------
 drivers/clk/meson/gxbb.c                 | 20 +++++------
 drivers/clk/mvebu/armada-37xx-periph.c   |  2 +-
 drivers/clk/mvebu/armada-37xx-tbg.c      |  2 +-
 drivers/clk/nuvoton/clk_npcm.c           | 10 +++---
 drivers/clk/owl/clk_owl.c                |  2 +-
 drivers/clk/renesas/clk-rcar-gen2.c      |  8 ++---
 drivers/clk/renesas/rzg2l-cpg.c          |  8 ++---
 drivers/clk/rockchip/clk_px30.c          | 24 ++++++-------
 drivers/clk/rockchip/clk_rk3036.c        |  2 +-
 drivers/clk/rockchip/clk_rk3066.c        |  8 ++---
 drivers/clk/rockchip/clk_rk3128.c        |  6 ++--
 drivers/clk/rockchip/clk_rk3188.c        |  6 ++--
 drivers/clk/rockchip/clk_rk322x.c        |  4 +--
 drivers/clk/rockchip/clk_rk3288.c        |  6 ++--
 drivers/clk/rockchip/clk_rk3308.c        | 26 +++++++-------
 drivers/clk/rockchip/clk_rk3328.c        |  6 ++--
 drivers/clk/rockchip/clk_rk3368.c        |  8 ++---
 drivers/clk/rockchip/clk_rk3399.c        | 12 +++----
 drivers/clk/rockchip/clk_rk3528.c        | 20 +++++------
 drivers/clk/rockchip/clk_rk3568.c        | 62 ++++++++++++++++----------------
 drivers/clk/rockchip/clk_rk3576.c        | 36 +++++++++----------
 drivers/clk/rockchip/clk_rk3588.c        | 32 ++++++++---------
 drivers/clk/rockchip/clk_rv1108.c        |  4 +--
 drivers/clk/rockchip/clk_rv1126.c        | 52 +++++++++++++--------------
 drivers/clk/sifive/sifive-prci.c         |  8 ++---
 drivers/clk/sophgo/clk-cv1800b.c         |  2 +-
 drivers/clk/starfive/clk-jh7110-pll.c    |  2 +-
 drivers/clk/stm32/clk-stm32-core.c       |  4 +--
 drivers/clk/stm32/clk-stm32f.c           |  6 ++--
 drivers/clk/stm32/clk-stm32h7.c          |  4 +--
 drivers/clk/tegra/tegra-car-clk.c        |  2 +-
 drivers/clk/tegra/tegra186-clk.c         |  2 +-
 drivers/clk/thead/clk-th1520-ap.c        |  2 +-
 drivers/clk/ti/clk-am3-dpll-x2.c         |  4 +--
 drivers/clk/ti/clk-divider.c             |  4 +--
 drivers/clk/ti/clk-mux.c                 |  2 +-
 drivers/clk/ti/clk-sci.c                 |  2 +-
 drivers/clk/uniphier/clk-uniphier-core.c |  2 +-
 65 files changed, 290 insertions(+), 290 deletions(-)
---
base-commit: ecdc3872a767fb045be3296d4317ae978a14b022
change-id: 20251010-clk_ops-3b7cc9ccd070

Best regards,
-- 
Andrew Goodbody <andrew.goodbody@linaro.org>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
