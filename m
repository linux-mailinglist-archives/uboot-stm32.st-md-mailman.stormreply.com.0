Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A1FBDF0E9
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 16:32:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2152C56638;
	Wed, 15 Oct 2025 14:32:28 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31D2FC349C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:32:27 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-46e52279279so48282805e9.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760538747; x=1761143547;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MbJGyCPupNXvdaZuspymNgL6rmLyPY5BcTTejfTvzn4=;
 b=Ybr8++4Q/h5ZynlxfeFQnk+oClnfbxa+9T9je32MNaNaDHZqZlxY7zVmEHnbX3KBgU
 xCzze1FtC2w/IhwwHeIoZhnJ3N4exdQFh+gGqt+v9yVekkCd14rQ5lBSpp/HvZ32JSKw
 Qn0wqLCzThNwfpxYNlAXdWLSMVCiY0SLpkEDfahkR6Pn4LMBFudq3vPlQ1LMHK1sQUse
 HZOsQRGLLWL/3Oxbor2Y7o5KxOAq6xsajSiduqelqrvorBvfaxIaFKgZHQu+u+LZiDYt
 NJBhDgP+7SjZRvuyHu4icS53nLkF9rzuxFXNHh8xE4k3qCCBrCAqWmOw9zw6LPZuu3CF
 mRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760538747; x=1761143547;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MbJGyCPupNXvdaZuspymNgL6rmLyPY5BcTTejfTvzn4=;
 b=CHchel+4Zb2+nUzbWZB9Fnr2e6YHYOMTq+Sfg0d6PRvFqfd9FjjoZkvmD/GcUpfwda
 7PKBu4o6KPv90CdX0l+WvEKuov0KR6S2dXoyfPjsgig6+ek+Ay5vAeIy5IhH8qqnAnvx
 W2R8/EpKtOMcgzsSKOgDPgsNzNeKAsOSoXhS18Lz//tSvCxmgZSfzIAz9+J79AdErnUc
 3n69s9OJF1qrxsueux7QeTbsSsWOK5/WKNUTxU6H3rnq9AIpw3ayc1WtY/XfdV61pqo6
 0/Yjuy61weJydByEYe2kOZXYC51o4aprP1Ez3LZSp0K6NHsiPs7HcwshEZHxCiX9g5wO
 KPQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBq/kePlT7EkN3h2qlBho7BnsgjTAB2ay7jyIwe6y2oEFor6bnehQ+VhBD8XzJTwCVyGW8JvhBSeFv8w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwovTmhhv5frundOhmFuuQgPkxtzpyTm3rN4JGF05Iy/on1ljR9
 6NSKKw5FKyOolX5XUleVW2CTDtcrN42/VLsKNUvhy8EcgZRxP8TyAGImsGxGVwfUNV4=
X-Gm-Gg: ASbGncvYu2nOsMjVVxvpGoA8OcUTh0Z2QUPMPIxuK6Mcg/48scVbUVhnqNC/yuzJCWC
 Vz1XH/fSFiXgRBvWFIdfCCNeXvvGM7/Nae47tY6BlAAIs649qTfvZrX1MJ208HNtHwRjPklwOeU
 N1GJpcD2N938K7oRcDbNNCBzEYQICvrNM7LIgVExvPzsNsGl7tRm5+U/cOqM7NR/dVqMbeOgMa3
 UDCJUhFF7wVy5XXPnjSGrsjL1Xt/wyQEGR6V15wdMtjKpiPH6WCvLkx88zY5K7O9qlzhYkYY5uN
 DvYzGkDfafETfMVkvCEJbs4bT/EoXRM/qF9Nef4siMDGdxlphl8nDk6tgpZ8oilh3k9Osa7+avs
 h9CQFsnZtXf0jBrihdt3HCrc2j8N0MtbeP/RA8Yj0YLvz/7qYznyCT+kSD6nrDAEWdCMuHAjCi1
 iWIZG35E3o
X-Google-Smtp-Source: AGHT+IGi5fNTGKvgaEXbnvfgUckaDznPDbpCkdyTHr9U1ivBHTEOZKwwP8TWWCIEcxcSc0ljuw95ww==
X-Received: by 2002:a05:600d:d:b0:471:9da:5232 with SMTP id
 5b1f17b1804b1-47109da53bcmr1352065e9.15.1760538745360; 
 Wed, 15 Oct 2025 07:32:25 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:fed:4601:4b30:fdb5:8c7d:59b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-470ff15ef28sm43185915e9.5.2025.10.15.07.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:32:24 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Wed, 15 Oct 2025 15:32:07 +0100
MIME-Version: 1.0
Message-Id: <20251015-clk_ops-v1-2-5f80f827407e@linaro.org>
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
Subject: [Uboot-stm32] [PATCH 02/24] clk: sifive: Remove negative error
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
 drivers/clk/sifive/sifive-prci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
index de55504b5c90785f8d5f1f66eb914847feb4a495..01fcc85ab23ff56886638cc0581b5389012de154 100644
--- a/drivers/clk/sifive/sifive-prci.c
+++ b/drivers/clk/sifive/sifive-prci.c
@@ -548,11 +548,11 @@ static ulong sifive_prci_parent_rate(struct __prci_clock *pc, struct prci_clk_de
 		}
 
 		if (i >= data->num_clks)
-			return -ENXIO;
+			return 0;
 
 		p = &data->clks[i];
 		if (!p->pd || !p->ops->recalc_rate)
-			return -ENXIO;
+			return 0;
 
 		return p->ops->recalc_rate(p, sifive_prci_parent_rate(p, data));
 	}
@@ -572,11 +572,11 @@ static ulong sifive_prci_get_rate(struct clk *clk)
 		(struct prci_clk_desc *)dev_get_driver_data(clk->dev);
 
 	if (data->num_clks <= clk->id)
-		return -ENXIO;
+		return 0;
 
 	pc = &data->clks[clk->id];
 	if (!pc->pd || !pc->ops->recalc_rate)
-		return -ENXIO;
+		return 0;
 
 	return pc->ops->recalc_rate(pc, sifive_prci_parent_rate(pc, data));
 }

-- 
2.47.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
