Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA3ABDF13E
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 16:33:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E416C5663B;
	Wed, 15 Oct 2025 14:33:07 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4EF8AC5663A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:33:05 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-46e5980471eso36705555e9.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760538785; x=1761143585;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9oGBD9zwxOILT7ohOlit8rFNmou7uiQ/OKULCO/97Qk=;
 b=ezDcDnxfhcBIYEtoQZlI2NaCRGz2PKnkh4ln84DjXYZXuJBc5XiyLD2daNni7/HRnW
 Wq7WTO+EM4yW+zldA45xyL0oXGtbRVI+7R3MGyx+Tmch6SMFGrxNflD8V/wu9p8/Oqsq
 kgoghF3BoNVIJQZDthH3gbkCsk1U5xDDke8Jh+FL7i7KfKGlCl91pnv9qb0bxTnMF3bo
 PPnOJusgtEpDUO/vz6egrtn42f3zLCTb7BXpB5Lwq53P93St/exYBHMEi+6KKsI48KEb
 BFZgD/X+AnyjFlAdJa7d7tiEWlXg6YIZ6ux10STglxPbqxaEXFZBt3I4L50O+vTroa67
 +iRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760538785; x=1761143585;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9oGBD9zwxOILT7ohOlit8rFNmou7uiQ/OKULCO/97Qk=;
 b=CNcQS8peXOCcthZZp/S34SBeIfqsIiYY0SDxAlv1kPjhsgSPjmoMXiNziDoNqpYXar
 1NbXJX0Q2bbszlcQkyTJ4lQP3odrV8/vIc6DR8GpoVlqsMv9zyrPUzKrngWLxauehcZ+
 yZNGUF5771l7Xr/v76Pm3BwOcLgU/NgDeOiEOZZAwfch/cec1P7gwQ7OL8u3Z2dpCZAD
 qs2TGGFYW1+9BpBsXfoN8tffcO9g30FyQg8A1Jvxz0omG3ABxQnRJgHDYnA+C3PJCyv6
 TMk/qtG4J2Im9VXdFcmNBFh19TKi0IfAgwr5ioAtB01Gi4TMb6nlB6Nr1747Bizo6zoK
 fO5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8LseDjLRYnIzaJWZ/TR0m+Gp5mGsHZOZrGrBaApNKFL3LlNXN2G7QA5Hl1Tzpw5xg+Qy2DvYKhd8Ynw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwjRlwPPMW/Sev+suKz57SXmyW8jlIbbIpFwRrsqV6k/m3BfF5c
 62utBrVfRb9xkr0ZOwiOHOoV4fX2nqO4eYZQwAxD5LItTvmzMo2E2/IiDcRK8pGSU9w=
X-Gm-Gg: ASbGncsfnFgQhz0DJL5aYh5kVNpBKfcHNMl0Vyfmnzc5BwTdhfuUwsR4sVVzHKvlsuR
 udO2l6aOiLP+vHPVLSybq3SXz21wUNzO9qgap0vkMAVAI/I4QBEHPHz0CmPIzynpLCc6k/1mwHC
 72mZuyhbjxSLxe3QmYtMxHjSOwVLZ4HDYa/vllEIV13PvkyxTWw8YuMTOUbj2s0dHpUpitNNhb2
 BN4SuYmpxf8kVgeqnLefKnc5YM/hR43xQvroc4/F0wm22hDLw2uEZHpvW6CsL3LrwYBbAWmpcCn
 UWSX0S6Zeqa82EP/vi4VulTZeOztx2P9/ZBV7fLYnQxxfLwvpsoGCwWiJiB7s0hoau79925+KvN
 /2N3cjggAXlEkoWgUxchttNODv4LES2xf22ZSOBhLdzMw0BkpreYnRh+/mlbjNNgPt3eCfx4TnS
 /LPHuhSvE5
X-Google-Smtp-Source: AGHT+IE+IxqzwB48mSjhb1Y0a03IfJLfxUFd+QgEaBnvgBt5TnjYffDJ96Xtz+ZB/k7CHTuEUm6mfQ==
X-Received: by 2002:a05:600c:37cc:b0:46f:b42e:edcf with SMTP id
 5b1f17b1804b1-46fb42eee39mr141973725e9.40.1760538784542; 
 Wed, 15 Oct 2025 07:33:04 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:fed:4601:4b30:fdb5:8c7d:59b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-470ff15ef28sm43185915e9.5.2025.10.15.07.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:33:04 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Wed, 15 Oct 2025 15:32:27 +0100
MIME-Version: 1.0
Message-Id: <20251015-clk_ops-v1-22-5f80f827407e@linaro.org>
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
Subject: [Uboot-stm32] [PATCH 22/24] clk: sophgo: Remove negative error
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
 drivers/clk/sophgo/clk-cv1800b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sophgo/clk-cv1800b.c b/drivers/clk/sophgo/clk-cv1800b.c
index d946ea57a460ab223f89a79504f6c1d01f7c39f9..44f1cb36ba76294586d0075d575ccdddefd59cbd 100644
--- a/drivers/clk/sophgo/clk-cv1800b.c
+++ b/drivers/clk/sophgo/clk-cv1800b.c
@@ -704,7 +704,7 @@ static ulong cv1800b_clk_get_rate(struct clk *clk)
 	int err = clk_get_by_id(CV1800B_CLK_ID_TRANSFORM(clk->id), &c);
 
 	if (err)
-		return err;
+		return 0;
 	return clk_get_rate(c);
 }
 

-- 
2.47.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
