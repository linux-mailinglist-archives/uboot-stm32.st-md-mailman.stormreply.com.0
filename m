Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02718BDF122
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 16:32:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BAA4EC5663B;
	Wed, 15 Oct 2025 14:32:54 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C575C5663A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:32:54 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3ee15505cdeso1046901f8f.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760538773; x=1761143573;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mcQ8CXNf57aPhy6c7X3EkXw8uO2jY7I9YKfUXV5n+24=;
 b=xG57N3SbmNHUHL8NaZnIiIWk0FO1mefAYmSSWBNrxNh7UiSgkPGwZsveAxHx/HY+P2
 xPBPQYDCbwLx2Sw/EzTU7MgiLy0bDvw8i6w5VRlO1AzwXj/MUkamfDP/2Dy1+S2YXYk2
 dRT0F2B6c8coVz6AZZNyT5bBZ0AY4hvY3YbuhEFolQwYhH6/6BUdCVwVuqyDxFzOCdsD
 Red+rNktFeSB2lV05J+/7QrD3XdiUzfyw2LOlqqQbsMFuofcHCcuwHT4SIxN79sdjZbA
 b4Yg3vgARe2y7zjQgcebop84QGlYtM69+Jl1O0aEynncJ80R7r080YLEXhteCGC2TsUT
 sdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760538773; x=1761143573;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mcQ8CXNf57aPhy6c7X3EkXw8uO2jY7I9YKfUXV5n+24=;
 b=vJQJKUIuPjbK0zF+Hz1zWv5HnJakDsLrao2Q1xdLIockmDV67YbWPcLLfxLy/B9APn
 7lXCEFFR5R+Bz9TBEk+qYZ3LNAcV0tcW1c8L9cXqsPMrI9DRTr9DFHPOpjq5DtlsN9Q6
 spSKgvZH0xUz/rXK7mPI4R15HgbNU6oqWoFr+zKQ1t38uPoUbXf2Q5DMmNV3vueLhMbC
 wwkhUjyuoqdJdgSDVJoJGr7bQqxx7N6ffPdbSqYKCPStw657ixjpYWGZ+lvl1Aup8rVm
 QQxcvAjeYVIs6u43ZgWwrJjuPKjyJD4Dki1wjOeYdqYVv0wQoOjv5XUm6CfF/0ksnwB5
 ASFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYEiGInnhKWASDPbQPGut5H9RO8vDdk+F4CcYLf11A2jao7Doi4JdwTy05jloz3CF0Fzw5pjZXhSslYg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzqDvly6hplYbCdWuqhDsWvox7mW+alBTH7a2AhrKzWZJxoasra
 WHCBCqC4BaSyh4jdOJH5lGVUuPS6FFQ+7pI/gcqa05fPNbL3Mo7vbgHbRLVjCxu1IDk=
X-Gm-Gg: ASbGnculbhHNCwsEbFydDIcsVvbuWu0ATfoTkMkksjvmJ4ARD2jy5qormZORZhqMduQ
 8FyLiD4L7ucjycT1aZ79ZSHRRs6TNCbA7n3X/n+464z0WMGY3Fk6twPcwxKZ9GpSzTCVvNbZcr1
 fUZ0yf563YUOCiVGapcaQBngyWwrlSg/kgSBOUIHHaAB8wkj0EkLEuKfwlNLU1lWjHLPB5cT4Xs
 yfbjVqYyv8Gcy0x9dbkH8QzFVSlKRU7vCBkuTNwx+ssuBNr7wjH/n6CFyFDfQ9YW4QO3oRH7J/q
 kVRuP506qJWPsX0HtEnaPZ+dHHBvKsUaK9+zAoYzl4Gqvxah1kYxOB5Drpbx9kGfhZMasTcdDkh
 +xaj7+QMInM+ZcYdSF2zO9/PRY/l5Zga3BAS4q77thonkZCO5F3Tm86suwf9uEIhyIvOBaQ/MQg
 ==
X-Google-Smtp-Source: AGHT+IEl7LqZhV2V+mRAvIp9HPyRtytEkYU4/Cq3hS3UEvinHw9MpC6lhYRaIylvccqIzXRaAszpmA==
X-Received: by 2002:a05:6000:1843:b0:3f5:3578:e538 with SMTP id
 ffacd0b85a97d-426fb8b7789mr229863f8f.21.1760538773280; 
 Wed, 15 Oct 2025 07:32:53 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:fed:4601:4b30:fdb5:8c7d:59b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-470ff15ef28sm43185915e9.5.2025.10.15.07.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:32:52 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Wed, 15 Oct 2025 15:32:21 +0100
MIME-Version: 1.0
Message-Id: <20251015-clk_ops-v1-16-5f80f827407e@linaro.org>
References: <20251015-clk_ops-v1-0-5f80f827407e@linaro.org>
In-Reply-To: <20251015-clk_ops-v1-0-5f80f827407e@linaro.org>
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
Subject: [Uboot-stm32] [PATCH 16/24] clk: imx: Remove negative error returns
 from clk_get_rate
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

clk_get_rate() returns a ulong so do not attempt to pass negative error
codes through it.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
---
 drivers/clk/imx/clk-imx8qm.c    | 6 +++---
 drivers/clk/imx/clk-imx8qxp.c   | 6 +++---
 drivers/clk/imx/clk-imxrt1170.c | 2 +-
 drivers/clk/imx/clk-pllv3.c     | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8qm.c b/drivers/clk/imx/clk-imx8qm.c
index 466d71786cfb2b1ffe617bd5c7ea7304238683c0..56db4ba262654a1e0837f1340800b115e2d9321f 100644
--- a/drivers/clk/imx/clk-imx8qm.c
+++ b/drivers/clk/imx/clk-imx8qm.c
@@ -135,16 +135,16 @@ ulong imx8_clk_get_rate(struct clk *clk)
 		    clk->id >= IMX8QM_CLK_END) {
 			printf("%s(Invalid clk ID #%lu)\n",
 			       __func__, clk->id);
-			return -EINVAL;
+			return 0;
 		}
-		return -EINVAL;
+		return 0;
 	};
 
 	ret = sc_pm_get_clock_rate(-1, resource, pm_clk,
 				   (sc_pm_clock_rate_t *)&rate);
 	if (ret) {
 		printf("%s err %d\n", __func__, ret);
-		return ret;
+		return 0;
 	}
 
 	return rate;
diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
index 79098623bc8cc32d134b6cd8d21d990ae1bcd25a..cb7798ff0b963fb46573603873e99c993cc28ecc 100644
--- a/drivers/clk/imx/clk-imx8qxp.c
+++ b/drivers/clk/imx/clk-imx8qxp.c
@@ -128,16 +128,16 @@ ulong imx8_clk_get_rate(struct clk *clk)
 		    clk->id >= IMX8QXP_CLK_END) {
 			printf("%s(Invalid clk ID #%lu)\n",
 			       __func__, clk->id);
-			return -EINVAL;
+			return 0;
 		}
-		return -EINVAL;
+		return 0;
 	};
 
 	ret = sc_pm_get_clock_rate(-1, resource, pm_clk,
 				   (sc_pm_clock_rate_t *)&rate);
 	if (ret) {
 		printf("%s err %d\n", __func__, ret);
-		return ret;
+		return 0;
 	}
 
 	return rate;
diff --git a/drivers/clk/imx/clk-imxrt1170.c b/drivers/clk/imx/clk-imxrt1170.c
index bfd5dd6c464457af1d9e19344e555a984a36ef2f..d2cec8f224c549996e0643617f774eced5bb9881 100644
--- a/drivers/clk/imx/clk-imxrt1170.c
+++ b/drivers/clk/imx/clk-imxrt1170.c
@@ -23,7 +23,7 @@ static ulong imxrt1170_clk_get_rate(struct clk *clk)
 
 	ret = clk_get_by_id(clk->id, &c);
 	if (ret)
-		return ret;
+		return 0;
 
 	return clk_get_rate(c);
 }
diff --git a/drivers/clk/imx/clk-pllv3.c b/drivers/clk/imx/clk-pllv3.c
index 85b6a9809e8dbcd1c73c0f914077b54fbae85f1f..bde95e950129ea54cb98e3ea37e49883b3911fd9 100644
--- a/drivers/clk/imx/clk-pllv3.c
+++ b/drivers/clk/imx/clk-pllv3.c
@@ -210,7 +210,7 @@ static ulong clk_pllv3_av_get_rate(struct clk *clk)
 	u64 temp64 = (u64)parent_rate;
 
 	if (mfd == 0)
-		return -EIO;
+		return 0;
 
 	temp64 *= mfn;
 	do_div(temp64, mfd);

-- 
2.47.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
