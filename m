Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A326BDF0EF
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 16:32:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB7E3C5663A;
	Wed, 15 Oct 2025 14:32:31 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 140E9C56639
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:32:31 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-46e6c8bc46eso44924255e9.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760538750; x=1761143550;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XIQysIx4KJugzMwhq25Do8V3rR1hN0bWenENxg6QWqg=;
 b=RhPonU1QgVMNzR5aboMeOUEEVwt0YOAyxrRnnESv5PG3JMFr4loGTrHpa8PsHC+8tz
 LksL/oufDRoC7OW0mGBui/dJLrape5RqKIxBVB09Gm149qtN23lNUNRkmqXC4qEjmpgd
 uuKEFjIB1fRyhUF1q9C/QXtDedoO+hCk8O4DLIm1d7pz3fa5eKuxfKXP17AINd9uXDVp
 LS72ITI76qvpByc/GE/yZdyQzdOB0hau0WaUlHmZoN0jOSfxurpPCLsF7sN3rEFmGd01
 XSjNS7OnIl3jSE6EtGFtOVjieNL6+YXRRGLly8VpnMbcK09kspST5mQhmhk4Ghinc9ji
 +IMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760538750; x=1761143550;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XIQysIx4KJugzMwhq25Do8V3rR1hN0bWenENxg6QWqg=;
 b=vdlc0TAEiBttAAJzwDRomamQ1MsKSxaXq4OZkJByUraLZy347h+TeDeCtcQvDuXZyQ
 EY9ybuSp7aKEm7t3QqQYp/I19gLPmQxLZr2SSUFSe75uSb/8pL65i+Xd5nk8F7rIEOMq
 gEx94g3KXkUCD6YWN9aTJRCWGuhOhza6ADzUVp5a/g7nsVBXDTGJGeGkWO2VK8B4a3b6
 98xHCpgu0vKEw6sn4rBI3WkW1V1GhN3qZFJqrh8pzbs4fyN4kIUiMbCurXyPKju0Ej8S
 pdKGcj8elUVKsIy8bdyxLLrZTEXhuko/4WnGHjO4R33RZF7KMwZacv8iWKnyZgsNoPiZ
 W1PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR6/ClZPzzMzh8KBeANwI3sHbcqPaltuW48Z4tRQsRNE7yITeA2dhwrI9lLfQ1qLkPn5fgj2/IkWMEGg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwW6Go+XXBAcSEu7Aro/BG72hpKCYCofrCw1jxX1jmKtgiCEt7O
 DPQm7hh5uEeXwdIDcGX6xcb3XkuM/7/FI1n45B5WgVHxf5R+SaXGHVev845udkPHtU4=
X-Gm-Gg: ASbGncsPRoQ9dOcq0F801pTCiaiK2O4jKB4+v2jABhoODqcOioDFQc0+Ry1jnmbvC/X
 8iG9uG4DEkYw7BgXgYEs2tlOpW4ZQTO+R0QSkkJADRXQBW44avRcchzUDOfMVIYsXMnIv361PWR
 NWqL8JDsevCaqMzoy+NWc2YCaCBsD/d4ns5pzs1d0ZdAhZiKizcmUnsQrocR3+t1GoivvI3yKAu
 xnmryyDCbVQFu3jYWaw5CGlXDf/TRma+wq6N9Zb/S9cFtNUIWITk+Cep9XdZQbgGqbTUZMA6MBU
 MMyXwd4266O0J5VL+XWTYy4oLf38s4TytPBs97jp/W2MvjWGIEmHAi5VfsVyrxe6Cw3Fq9ucMH2
 6dXuIFPZyYs0UNp1zfiGJKJAqYJIzbuePY1t1XGp7kISYv8FDxklK6/LTFHE52tmDdpxyIFlKcu
 YaTdk9LURo0+7uuJ0YKDM=
X-Google-Smtp-Source: AGHT+IGf5GpcS+S5beWQTbh6N/+mYXSMKn3Cif7lbjfUlCZ5iEsIZ3P/e9T/0Yu9aiD1g4OPovrjJA==
X-Received: by 2002:a05:600d:8110:b0:45f:2922:2aef with SMTP id
 5b1f17b1804b1-46fa9b09233mr207794075e9.28.1760538750432; 
 Wed, 15 Oct 2025 07:32:30 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:fed:4601:4b30:fdb5:8c7d:59b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-470ff15ef28sm43185915e9.5.2025.10.15.07.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:32:29 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Wed, 15 Oct 2025 15:32:09 +0100
MIME-Version: 1.0
Message-Id: <20251015-clk_ops-v1-4-5f80f827407e@linaro.org>
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
Subject: [Uboot-stm32] [PATCH 04/24] clk: thead: th1520-ap: Remove negative
 error returns from clk_get_rate
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
 drivers/clk/thead/clk-th1520-ap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index 6899e1b595a7148a118d3a615d5dfea4b4fb5b96..e913621967eb131b534e8f5b928687967a02a30e 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -985,7 +985,7 @@ static ulong th1520_clk_get_rate(struct clk *clk)
 
 	ret = clk_get_by_id(clk->id, &c);
 	if (ret)
-		return ret;
+		return 0;
 
 	return clk_get_rate(c);
 }

-- 
2.47.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
