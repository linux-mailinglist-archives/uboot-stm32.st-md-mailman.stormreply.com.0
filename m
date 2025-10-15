Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1A4BDF12B
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 16:32:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6ADCC5663A;
	Wed, 15 Oct 2025 14:32:58 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7F8AC5663A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:32:57 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-46e2e363118so56296385e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760538777; x=1761143577;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yZOP747qP9TvGlWOGQzVrh1zEKGuFC/MQYjdG7AwW6c=;
 b=dG/c5zGVZuRyhc8a/DWYKkN2kpTvzZysQE98uszi2MADkmzob465DyqMl0347dmaMF
 BAxR/Zs/wUoKziWFtql3S9yuFiHeHhAYNBaZX2X7p/4f6Axq6OYmAemgz2nPWSbl8XB9
 4x89hlBm7V+KFTu9sGhnVpdgDvhMOii5A+FrOmmAIL2NFJWu3nEJ3R5ema1EAZ52xJsN
 yF8AwrZnEUBvNFdIojfSehTKx5LvKsQGNwW2yw233urRe4mXsBYoRSpm67pQCUZpijlx
 PzhTH0gVdWyWH3ei34sm33ThmhGmGKT3xUQxNEp7SsCcU9sjpS6a1NjFNwkmKMZPoCiO
 rRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760538777; x=1761143577;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yZOP747qP9TvGlWOGQzVrh1zEKGuFC/MQYjdG7AwW6c=;
 b=ZJyr/U+EvckVGbGzsX07dynRNlB3ts/Dec37WZkrR5YSonn4Akrf1Ji6d+pXdoc8Xo
 Ocwl1V+40QQXG0QOu7B9WHL9A99WaXoX4KC+kMtc+xgBOgeB1OJGEnofhX92SMh8O+Dp
 1Iexs1slC1niDiSyJ5zgaoVz7CrdxuS54KQcw4e/xTT95cX7gIOCYDzUT4eM8fv0NpuP
 sa9y7gLqUT8x5+GVpIv1KH1Tqv05uzrfbU5eUddhg2LnjSKC83uJYtQNsmbignfZkhlp
 rKRP3L4zTPy8yTE+Lfjs3YzQeux0l7IW5b/jbslZDUfBDAZj5L+PupkJakB1T4X8obRN
 ss+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCURyFJeNO4+vDOPk8GL5lZ5fXBCBHYode2PPHjhgPGNx6uy2iNVLMhM0huOcVxwS5B3mdxMuagKZNvccg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzVaqjuFNeQVMK6KlzEjfjOuXqgMdPDjCBOINk3Emis+laG4mXj
 iRnxZRZ7QjMibnEQ/z1ewqtETbjyoLJ7MF5XeK4dHnh5u9ghHmiK3aUycWgKU0p4sDw=
X-Gm-Gg: ASbGncueKYRS9q1HVgxCm1VB/0TS5ymzG9GuXcTUfRNJVNZJwNP9O+NCr0cnZiTARvW
 6trmIM/0pM/9+tsMC7b76EsZ68UD59wNvJtRxv4zwCmckKInhksIoI2/jL+5nMiWQQ7Qz1bxSj0
 IDKmlmJtL9WoQexN6O9M5U/V8cktCDbmkDFheY5nEW2Bgf1aO/vNtMVKkLsEWkGdjVfPiANSdag
 K/wEDDIXwHQAW50RntnUsGgJIndX1gzUAhDtyqBCgq184ReolrcTDmJXX6Vtgs6m9D60Kz+OJOF
 GhaogXJxvxd1HBq/eCsySgiMFtyvEIDyz5ZKGhpRbjarzEGsfCLxX6oD/B+oHx5b87GBJoUqdIo
 OePn0/mddz+JDUct8M/mVzpjWZn0bInaNR0jwiCbBXdmHKY6ayKT3+RlU/Nrej2J5FYSwnAZlXY
 z0R0/hobYm
X-Google-Smtp-Source: AGHT+IEvPQEGRvjNPScz+QHjC4EXtJD+XpmF5vTYSMC30pFSyoimCJc/gOkBM6dMSxidro4+Kd9DVg==
X-Received: by 2002:a05:600c:a12:b0:471:3b6:f2d with SMTP id
 5b1f17b1804b1-47103b61adcmr12957405e9.38.1760538777100; 
 Wed, 15 Oct 2025 07:32:57 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:fed:4601:4b30:fdb5:8c7d:59b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-470ff15ef28sm43185915e9.5.2025.10.15.07.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:32:56 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Wed, 15 Oct 2025 15:32:23 +0100
MIME-Version: 1.0
Message-Id: <20251015-clk_ops-v1-18-5f80f827407e@linaro.org>
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
Subject: [Uboot-stm32] [PATCH 18/24] clk: mediatek: Remove negative error
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
 drivers/clk/mediatek/clk-mtk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index f91777e968a63477c4e75872af632a6b7c855c51..75ae9787d4469e6a40d1437d245d0e9d79b22bf7 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -725,7 +725,7 @@ static ulong mtk_clk_gate_get_rate(struct clk *clk)
 	const struct mtk_gate *gate;
 
 	if (id < priv->tree->gates_offs)
-		return -EINVAL;
+		return 0;
 
 	gate = &priv->gates[id - priv->tree->gates_offs];
 	/*

-- 
2.47.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
