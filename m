Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 469F8BDF134
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 16:33:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 077CEC56639;
	Wed, 15 Oct 2025 14:33:03 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96A39C5663A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:33:01 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4710665e7deso3018395e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760538781; x=1761143581;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TTbXf2v+6DOITANdOMYtay+m9aD8F7IEVVIpnQ+2pPc=;
 b=cqTJnbE6uAaO1xSnCo0QlBs7KMzSJMXhVO+arLwyUaZ7ZPQ8ajfCcSSCjl0flPSAOb
 S9DUp0bVnqjTVGQ1GFzTK8/jnA2jyBsaoiWrN3wi0G41bYy5gu5pqguCV3GJbxkizC6R
 +Q1DCJdRx8t8p0ArOxKj2KWD2yzgmnsaDfLZu6B6mSsyCFim75BxW65MFzygKCz3G4jn
 I6PcMDxhBUhB3EWC8/Y6t1WfHKPO5P4uE7U9pTQx3On7Wqp3CP/LyTwOmYHPR+dcXUrg
 C9K58/iPMhMAuSF2uaDg3MMb+z+euzcZFWkohkSkxhEajj224/treuW5dT9XeAr0luie
 J4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760538781; x=1761143581;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TTbXf2v+6DOITANdOMYtay+m9aD8F7IEVVIpnQ+2pPc=;
 b=EQUuhKti0Ceiy5PzTjI5b5GrrevNByy2U6JTO5FYP0Cys/AGj8IE7lB/ckzev8wKtL
 gdHbwiv746lclS2gF0P5eEnhdFu2nVfwS4YZ/jlxLNyogpzYDmiYbv3OPDBgdKn0PSEu
 8ch5G3uBPjyX7kXLEAv/zOIOzNtUlLFGpm3Mm3Wp54ygRVVnKKCxnqYaAZRGmGbzMZIB
 feXqh9Scu6hMp0WEMF/jOSj9P8RuPmXAjFG5HlphMfKu59vEDuORwXdR4pgp+0dl6Duk
 Wm/npxX4GWL82cBSYO2HJQDJ2K55nunMqecj0A9+rnUSQMpmKCejAl/aTLSFF+xJZUj2
 pv5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9wALKO8OuoRYSq1uKjaXUfYR1f7vEI19121SUTgEiz7OZlQfGrKEp1O+CVc7iL7xcEPhXpifJKWd+Cw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzAKT7lTUfWMYYt1D+E++ozh/smTsRqunQHEmfxVrL0wBKrNBZu
 eihp0zU3eiHoasMior9xpZ2AM1rVwZ7OXl6WJ/QRyawhzAl78Llj4+3TTSYyLZQkydE=
X-Gm-Gg: ASbGncu0mkSo6Qjd6WwgBSIsi8qwmadgOnBbwpbbaslA0uqDr7kEKLYMJmyb7KvMiDp
 pXTe1HDDzRUp9njjLVDpAx26O6ensnahyzZnItIy2gxvMlykcygd2ANyMonXL+PL1W2/wBDTOmF
 NGKi3PSkOz5Gg0aLOrC9VTXHQLACb5JRkhxZisvqDlq5IEJuVSpxwLCEPSOXIdXxnFlcGAVUpes
 PjCcNrS4/0L/Voluw5pnU6Z5z1Oajr8qk33vp/VC8N/gHzUMjQ5cBiGKKmZYNpzv9jadaGNJozb
 yLSGnHHxZafG9cBcH1pSer/ZKOudx1i2B/iTJLu47AncRY4TjcxPGtBPiQAmOIeUuK1n57EQqQb
 +ffg5OrHix9HYcwPVifViAthPZWmNvbD9Z2Cw/0j8p/yt9vrriT/MR/q05mM+sA6AsosHsN1qU8
 h8IGBjWH47
X-Google-Smtp-Source: AGHT+IH+rwZaZc5p0en/wUvb43r51I+4D/Ojes6xOI2/lEb1mRkkPQW7ty8WKdlM7v8kZME/V1yKwg==
X-Received: by 2002:a05:600c:35cb:b0:471:9da:524c with SMTP id
 5b1f17b1804b1-47109da5403mr1337285e9.12.1760538780882; 
 Wed, 15 Oct 2025 07:33:00 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:fed:4601:4b30:fdb5:8c7d:59b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-470ff15ef28sm43185915e9.5.2025.10.15.07.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:33:00 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Wed, 15 Oct 2025 15:32:25 +0100
MIME-Version: 1.0
Message-Id: <20251015-clk_ops-v1-20-5f80f827407e@linaro.org>
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
Subject: [Uboot-stm32] [PATCH 20/24] clk: tegra: Remove negative error
 returns from clk_get_rate
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
 drivers/clk/tegra/tegra-car-clk.c | 2 +-
 drivers/clk/tegra/tegra186-clk.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/tegra-car-clk.c b/drivers/clk/tegra/tegra-car-clk.c
index 880dd4f6ece9fde3ef3dd9d457e717ce4c237e29..19ca5583a53427d05936cf65b6a32237d91df4ae 100644
--- a/drivers/clk/tegra/tegra-car-clk.c
+++ b/drivers/clk/tegra/tegra-car-clk.c
@@ -57,7 +57,7 @@ static ulong tegra_car_clk_get_rate(struct clk *clk)
 		return clock_get_periph_rate(clk->id, parent);
 	}
 
-	return -1U;
+	return 0;
 }
 
 static ulong tegra_car_clk_set_rate(struct clk *clk, ulong rate)
diff --git a/drivers/clk/tegra/tegra186-clk.c b/drivers/clk/tegra/tegra186-clk.c
index ec52326c3b365eac9845e2fb98531ae0da2f486a..8c364e2dd3412d1298bd39178f19b3cb609aba5a 100644
--- a/drivers/clk/tegra/tegra186-clk.c
+++ b/drivers/clk/tegra/tegra186-clk.c
@@ -23,7 +23,7 @@ static ulong tegra186_clk_get_rate(struct clk *clk)
 	ret = misc_call(clk->dev->parent, MRQ_CLK, &req, sizeof(req), &resp,
 			sizeof(resp));
 	if (ret < 0)
-		return ret;
+		return 0;
 
 	return resp.clk_get_rate.rate;
 }

-- 
2.47.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
