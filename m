Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B517EBDF116
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 16:32:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77437C56639;
	Wed, 15 Oct 2025 14:32:47 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 406D1C56639
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:32:46 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-46e3a50bc0fso49016725e9.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760538766; x=1761143566;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=49jSWRHsss//EBfN7zOwUemnNlZQX5Z/2fmZ0qpW5eQ=;
 b=PaNHuQIWCWPrqnTGFMLvLWmha/7u6YDIEwuuPX3x3Pnl5CQ8zoiJ0IsH6y66yaJ6hQ
 W6hIu7M9sLNzsw++L65j2TDk87uq1WZn8wJezfeGuhA7tKeeCXBXYTnLqq1atZ6qNP8Q
 9HGBNzgyR/zNAf2co1J3ZYB9TBC7OTuG1JQ+4dGA5XmjebFUIFICbMUE9uKvpImJywhe
 OTJ0C8h36goOEdfXvgHBRNNgk4Bh7B+sUALVJSvwiMHmjEX0aF/HzK6y4HsYL6/XydLQ
 iWdmkp/yh7w7JMUxi44YoiDInVtoZi9ODnzYcsyTnx5mdXFM9wgCHydI1Vs4OB7sG+FP
 sq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760538766; x=1761143566;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=49jSWRHsss//EBfN7zOwUemnNlZQX5Z/2fmZ0qpW5eQ=;
 b=IE2uxIybVqqrFt7gevRO0CRjYkclV0Tgr+K+Iv9DIrIeLmvDXDAvEisVV3S/6mDhyP
 I+Gcbb7I6Yfmd8ZS2GQ5fFlzas6bz974aajIZA0AAPL5L0+vD5Hem+MoSRxYFmAF/XWL
 A7x21Q9JnuthhjjCpX0NN855jHcFTWxMc9ACIxv6mG7ycBvpixzRTYC5c4SlH6SYWD1M
 yhXb4xpFcNzBQRFkzKS/gUKtS7DFbtpqXNQvGjbHYmGAtdieAIZrwODzFDDjnRS4K0MS
 qKpo06OIYiLowFtY0d2jV/npd9dhyrOziF8GiQXLcK1OHcXHf/f687sg38uzUwGjITpJ
 0uGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcfL66eWHmnvv7JCH76Rzjlaevo1L807dn3OoYY3mRCZTlbtJSsUITkbLkn/yfP0IIiKvAG0Z0e5IcZQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwlcKUjCeoqaNlvBW0zRpvV4hxIFDxARKQhTCGrk97bonr+K3wv
 5GmVOoenbGeqvF7v/Nwb9DaOji0Xll0evFFALYzfWtaLiKZWH6l01n7v++TuoguQo7c=
X-Gm-Gg: ASbGnct2DvB1JCyxaiwapLHzch1jhaGxA2W3LpDnq5RgOCATBNmdVlddSMZRDmUPEIj
 U74RZujUPsmgjAZjUzH2zexJwq14VouZQsevl21uQeqrl9pMDeIG/x85skZrX5UEVU8XB/JKSD/
 dmrpHUEvwgcEhi0OxQNQgpUlm+9gXqvzCn610deQBbo8zlq6Q47PAdffc0wrBTstbscc+P3jryK
 jFah2qWgs9CvzSyUKo4PPhgvR2cJ+tSH0lOzX0d0ryRt+2gLTMkN2EyyBLwrazizp2y4TXZiGGa
 evGUotKfqwkX+FOiVr3ssguyQA1Tw0i1m0U1AZbN7yeUymnBF4Y9nxnHxpI4DXdieRT2uGOIlWj
 X3esVqBCSe/wATppJ7QaGWLA6veGoHiaN7iBwTxDUdfM24chIPaQ6a0l84t+uQLfgT/X5BS0/KQ
 ==
X-Google-Smtp-Source: AGHT+IE61xZ44uz8zMhdoQ8tBs0hpzL01dSTtaZwdHp/BnAZL3FSDzrFGhj1LePLNzK4t2rGWJb6kg==
X-Received: by 2002:a05:600c:530e:b0:46e:4c90:81d0 with SMTP id
 5b1f17b1804b1-46fa9a8f1c5mr206392935e9.2.1760538765676; 
 Wed, 15 Oct 2025 07:32:45 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:fed:4601:4b30:fdb5:8c7d:59b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-470ff15ef28sm43185915e9.5.2025.10.15.07.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:32:45 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Wed, 15 Oct 2025 15:32:17 +0100
MIME-Version: 1.0
Message-Id: <20251015-clk_ops-v1-12-5f80f827407e@linaro.org>
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
Subject: [Uboot-stm32] [PATCH 12/24] clk: uniphier: Remove negative error
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
 drivers/clk/uniphier/clk-uniphier-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/uniphier/clk-uniphier-core.c b/drivers/clk/uniphier/clk-uniphier-core.c
index 33369c93916b06a68f81db056988bd4954adae4c..32e1d7efb86e835a47e0c51bf913fbca4dcb6071 100644
--- a/drivers/clk/uniphier/clk-uniphier-core.c
+++ b/drivers/clk/uniphier/clk-uniphier-core.c
@@ -168,7 +168,7 @@ static unsigned long uniphier_clk_get_rate(struct clk *clk)
 
 	data = uniphier_clk_get_data(priv, clk->id);
 	if (!data)
-		return -ENODEV;
+		return 0;
 
 	return __uniphier_clk_get_rate(priv, data);
 }

-- 
2.47.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
