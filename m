Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEA7BDF0EC
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 16:32:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C69A2C56638;
	Wed, 15 Oct 2025 14:32:30 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CF05C56639
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:32:29 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-470ffbf2150so4141995e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760538749; x=1761143549;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=X4USdmUWRoBxa2auUBl/bOqEZus6FVT4B5gwKLaCSZQ=;
 b=i9MbfNSAK4pzpA9l8/YeprKMv9UFZskWDiigS8Jk/UQOAqdOwRMi8TefrfR0dZgrGY
 xW7178DpSOfBy2hXnJKV7x2APi1CvePa6JHU7xGGXE+As3G2M3/LOwBgML+gey+MriHV
 QKCr1hsbPxCoutGkptQTRRvLQIl2Jbf3/AVmwYRmtw+CPixNlUvzeTCzE/m6E0vqlEUl
 RNiKcSpJzinf7ls/BY/JaFpl3pFB6U6yYuuRZCL96sqtltd01cGSRVsuY3fPHV6iFGBd
 vhbXSp5FCof11mAYD/Pi7k4PMdFhYGxvJTCqU8DnREu+dy95cGD05sP4coowRAITRX+7
 jfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760538749; x=1761143549;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X4USdmUWRoBxa2auUBl/bOqEZus6FVT4B5gwKLaCSZQ=;
 b=ItWT6vH2HQvdCAgO5ME8RFEp8vCPiNlBTF3afqerQb/6yObSzvRpMbVx6ZsTL6O9ze
 9wCCw17vmcvfLtWdJoOY2J3cguoH3WVaEBWtaS222upvOWMstXTaMSAPD6gaHoQdBkzX
 bHSlFiH92RWsC+BYvsqaHRcqIDrvk4RFP/z1f0XfhicQ8d4P8e4Ah6j22TfNBww33WkN
 QyfmKEU/NpkhW4LrfdKs99vy2ilIxRO6LVu8OzckgtEx3ds05XwXMOIS7ayiQjN+INJA
 EBeWRlemf7AdETD2E4xJrBdb0J0iqs1tqodF+LkRvMkgUS2AXd02/CO4OsMbdP0+7g7B
 lv0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQu6vMpf3ObSfVatKBrTx6O7RXpGsEMVtpPPH9slYDV74i9TVUan/H0s9vnjXkEVX4Sw40mk0cXMZLbw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YybIzRQ79XxKn2dNksx6u5AZjmNbhqR0J52oQMzmw9nHhmtnZpS
 GAEcfbnWR93YNhNs27W39mu4pGjK4tlqyohmVcjZWeICXBQLNdFzzMGftxieLsXjJdo=
X-Gm-Gg: ASbGncsJtC0L9Hay/kk+14YCGnGIyLM+ZU0AMq+Hseq1jTKtP1QfLriBfIPNORYuLEh
 r81bA+2lVGb8LINPYabzp/ZE6Ix9BPrvqvnHxYxA/ogW8niRKdSbz+S5Ef78fxYIE9pyiO6ql/S
 5k87D+1CNSzy5i2SYPamv4sCPkfqmKvMiADQVG46mtAG9zikjNf+qCQ93tNqy7WoUWS351YqPuQ
 +35BEoYIBIxXZuMVMwOZVS1S0RJtnWpfi8Syh/cZTtR2gUaaNQ1FxfDUHw74/aERjg3Cc3mPDUg
 zBNA1KUGTftkenR7+W6Qgfas8fIeBRkm34MzTsC9NFhVuezy3JSbC7T8dIy8BA3YWFoYxp+KCV0
 EJZr6PNbtSdHy2UpOAaUNo+feaEs6LxJFPIRnX0cCJ2bP87Bz2Kc2/X5rhaxBlzEkuJQiDM0Cot
 SwoF2ycNHO
X-Google-Smtp-Source: AGHT+IGukt19G/PYZOSW4vD1zMsgMCtooeLi8q7LKqiyW8/UWAJG648gEKOHzHmpGSlcRpHmeIFn2w==
X-Received: by 2002:a05:600c:d2:b0:46d:83e7:45ec with SMTP id
 5b1f17b1804b1-47109b4ff60mr1887255e9.11.1760538748490; 
 Wed, 15 Oct 2025 07:32:28 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:fed:4601:4b30:fdb5:8c7d:59b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-470ff15ef28sm43185915e9.5.2025.10.15.07.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:32:27 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Wed, 15 Oct 2025 15:32:08 +0100
MIME-Version: 1.0
Message-Id: <20251015-clk_ops-v1-3-5f80f827407e@linaro.org>
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
Subject: [Uboot-stm32] [PATCH 03/24] clk: armada-37xx: Remove negative error
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
 drivers/clk/mvebu/armada-37xx-periph.c | 2 +-
 drivers/clk/mvebu/armada-37xx-tbg.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
index 30330393f760fe34b3c78f23b617309b18903477..938881056d373e9978ff34376edc76527ebe4c0f 100644
--- a/drivers/clk/mvebu/armada-37xx-periph.c
+++ b/drivers/clk/mvebu/armada-37xx-periph.c
@@ -325,7 +325,7 @@ static ulong armada_37xx_periph_clk_get_rate(struct clk *clk)
 	struct a37xx_periphclk *priv = dev_get_priv(clk->dev);
 
 	if (clk->id >= priv->count)
-		return -EINVAL;
+		return 0;
 
 	return periph_clk_get_rate(priv, clk->id);
 }
diff --git a/drivers/clk/mvebu/armada-37xx-tbg.c b/drivers/clk/mvebu/armada-37xx-tbg.c
index c1bab84c070e35f3ce739cfce2e1468157ebe71b..d61b1d34fc64cfff473ead2bf8b0e929d4957994 100644
--- a/drivers/clk/mvebu/armada-37xx-tbg.c
+++ b/drivers/clk/mvebu/armada-37xx-tbg.c
@@ -88,7 +88,7 @@ static ulong armada_37xx_tbg_clk_get_rate(struct clk *clk)
 	struct a37xx_tbgclk *priv = dev_get_priv(clk->dev);
 
 	if (clk->id >= NUM_TBG)
-		return -ENODEV;
+		return 0;
 
 	return priv->rates[clk->id];
 }

-- 
2.47.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
