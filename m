Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AE7BDF0F8
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 16:32:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 067B4C5663A;
	Wed, 15 Oct 2025 14:32:36 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E27CBC5663A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:32:34 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-46e2e363118so56291525e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760538754; x=1761143554;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ft6YpEUUyQpMIMjtQb4mzXXMGUrMiVllGY4iEuw5Oyk=;
 b=gYOo1Ig5Lrv8XwYxZcEXTpMXSGGLfRu5nUcJoI5No7ooI+LLeUzOYP+gYi1LQRY3yd
 Oq+MBKA+M9uckHoPISxuiwMh+drJ/7rWw8HWhPg0zSr/oVriN04pLzV3D7X5c8J30bqB
 a+RbigzNwMHNyeTis/3cpNLJP0XCtvhgUZCqAqdzYsDKoHQeigh3/C1TYswrUpQKWXf7
 kRzGWXKiOiNgErIKrtWzlwV/Py/0R8MXfqmcEm+vtQfw6vOYswzOR+/bLAD+IDQmj0kw
 9hLSYWxOq/zk31bPEse+zaShG2a5wVEAUYyls9CT52BEuPxTwCx+gXrjq3zXcCp4T2UZ
 M9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760538754; x=1761143554;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ft6YpEUUyQpMIMjtQb4mzXXMGUrMiVllGY4iEuw5Oyk=;
 b=nRpTd21++EI4NhlmxnSZsZ4oqGLz8P4/CrC4H31lqw/rFMYrH41OJPK/FMl4j4eneV
 GA4uT9XbMmQQsnkoBwYdIh+kmj670+EKkNYwsjlBXffI6+898Z8PsX2/UYX/toFgnuZy
 fD1yWU9EyvQtIf3DSds1nBSlf4klXzLdqA033MRCD4kOJCCn1iPu1Sz+Ak1ZJO9e20L9
 l0P5R54NosFg3Fv7wWCGjG7ORF4Wk2LYRqAftsw1dMxbYrNQAOhzKB2HVL/l25xucUUI
 Ea89kC+EbH8AEoH2KBtCphMhDoO+5Me6YR9/no8Djb9xAlkajblpKBCq00+2nj1G1vBl
 YTdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV056nGbcu0qRcnjaTCRMabHEddnLAvCRA39zGm09+PVfm21twSbTfVgTdvv7ZfDa5pkuJLq3Q+M5m42g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyXvtpL5TWMPNAmdkRSdugqPNf0PVESNB4uzWMgS1wj0mbtnFnM
 kBMRG7+8UeJ3ilOoJJ5Lhxt2tYXlxKE03TnQkmeHlgycFGTwy2cbQvkop3RHzP3NyWc=
X-Gm-Gg: ASbGncsbYeNwARM3QPehOQQ93vwhrZUdtIJK2Fyrx8cO7I9O/P35R1qEzOmDbGTnzbX
 VoBS6ux1QLhsKEV/tPlYwwNpfBYl509EqRNwdXLuyRNXwEjJSd0EykPQGacFzCna8sgLDhsH4p2
 OCCirQ+GUTk+AxsvC8gpW8Pz4B5vRQ2rem38mCABqiUN37kTxtJPXoEET/N2/oyD/BhvMkqf4rV
 DS+waLeoxi2kCMpncp2Ogy2kofD95JsMK01dbZWFqNLGs7158pMtGfaE6yXttHUvegHo5BAfIrO
 4zpAmZbyDd21BOE3Wmeoywd3FoKvBtwxBqTG3t21Pi5Q6FyoYt2W5dyu1ma+vIEaCLt2ZtHsAF0
 zOyrtbb3EztRo/2flVxNm+JznOjJcZkZdvYk2wrlQvBlMAomieffyJcRaYx3E1+BoB85JM/fvlK
 ZFqNoZ/nJ3
X-Google-Smtp-Source: AGHT+IGhjWYd2CQ0DhgHukvBFVnRXpKUvzKiYOh/QAsK00PN3zJO6feyK57Jo0s8/4iLtrm/BWvvOw==
X-Received: by 2002:a05:600c:358a:b0:471:9da:5248 with SMTP id
 5b1f17b1804b1-47109da54admr1640155e9.26.1760538754211; 
 Wed, 15 Oct 2025 07:32:34 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:fed:4601:4b30:fdb5:8c7d:59b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-470ff15ef28sm43185915e9.5.2025.10.15.07.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:32:33 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Wed, 15 Oct 2025 15:32:11 +0100
MIME-Version: 1.0
Message-Id: <20251015-clk_ops-v1-6-5f80f827407e@linaro.org>
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
Subject: [Uboot-stm32] [PATCH 06/24] clk: at91: Remove negative error
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
 drivers/clk/at91/compat.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/at91/compat.c b/drivers/clk/at91/compat.c
index 1d738f160b6e0881ac6ca6730e54f016e9899b27..ffc3168400b276a57f7dbe6f80f813571118cead 100644
--- a/drivers/clk/at91/compat.c
+++ b/drivers/clk/at91/compat.c
@@ -291,7 +291,7 @@ static ulong at91_plladiv_clk_get_rate(struct clk *clk)
 
 	ret = clk_get_by_index(clk->dev, 0, &source);
 	if (ret)
-		return -EINVAL;
+		return 0;
 
 	clk_rate = clk_get_rate(&source);
 	if (readl(&pmc->mckr) & AT91_PMC_MCKR_PLLADIV_2)
@@ -387,7 +387,7 @@ static ulong system_clk_get_rate(struct clk *clk)
 
 	ret = clk_get_by_index(clk->dev, 0, &clk_dev);
 	if (ret)
-		return -EINVAL;
+		return 0;
 
 	return clk_get_rate(&clk_dev);
 }
@@ -522,7 +522,7 @@ static ulong periph_get_rate(struct clk *clk)
 
 	ret = clk_get_by_index(dev, 0, &clk_dev);
 	if (ret)
-		return ret;
+		return 0;
 
 	return clk_get_rate(&clk_dev);
 }

-- 
2.47.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
