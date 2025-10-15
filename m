Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD59BDF125
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 16:32:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8898C56639;
	Wed, 15 Oct 2025 14:32:56 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E40D6C56638
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:32:55 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3f99ac9acc4so5467465f8f.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760538775; x=1761143575;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WNRDxUD7dqMoMKbmkPhRutT8/NDVqXIfr5a7PBuyHxA=;
 b=a/OYpaJY/IOg5bzG0iLccfCy2soTU15fWkntdgaQYlkNeC60PWyRpCn4fOt7kywAcM
 97xSFKcKkDXOjn0s5edjQoM1cYRkifUVSds/NmWDZXwzrYc3d479F9DVORzjqNWDcXR+
 TaV9GxBDq1fSEXyZ42/8FUVxAfAev3SAe09BSHOZuaMEee+WP6xu5B8UJRWo4qd22i0J
 zi9o0EDiM7C7pvQfrkHKUM55IWuOZPBRK0J8mpRBDv2Qqia/Inej4kJwFjNLRL+9AJlP
 sbpvdT9SQqxmwejqaEcvs2VumKLtwB6ENaWOOwi/tQ9w2KnBt0dsj/cQcLnPgQrzuGCP
 vevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760538775; x=1761143575;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WNRDxUD7dqMoMKbmkPhRutT8/NDVqXIfr5a7PBuyHxA=;
 b=ab4igJwmTkrse1+Si/+ZQR21fWJcw+77HP+XT/X/76k8VqAdq9nEfvHP6y9LdKoaHd
 32qNsyHCEWafXKrv5eb7JcX7dLva/WMbqHR5dzGWfpT6qssyVMG4T3QXzMha7o51DLIH
 P3KJWa61Fd+kGFDekKuLE4YKHe/tetYYHR98ewVb6WXIqvaQrFMIy50l1yXRW79TGJ9Y
 x64CpHNQWzuyC6Dg9TjucGYlbyw7Pny2yoJrzTtNIrigcGCmmECM4hm79oPCRtRs/Enx
 5yg5l1C9sHJWMCXek5dpCtSWrOBno2M5a5N3HIAMCbVLg2HqOcq/1eIY/FQQkoJtR2Hk
 tOcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0S6zA27nRcGf0prVg32vjKsTWFbbQc6+04XlzncKMc072w028aJ7n9+lzSzlr/gaSRn5yKRfuqmz+5A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyE5OQSwaJYjUF9uj9/j4byIrrgqN7sZRtOCXH01Sz+2s7ev2tS
 fQXCBMgS4flcGQR0PgODl4zr44i6jbr8/B9Ges1fgOz2dzSjFY+r2Dbf0LyYGfyubDA=
X-Gm-Gg: ASbGncvFZzADOtTue9LakQton9dZlkCo3pdznzWRJ2VORvVUGA0ZL09RDK73Ihh1eou
 4AtDwYAYjpJEAEKWUTml4TQ3xTHWnsdq2YEZj9aYD5X2BanZ243EWPVJr2+kYDbJecGQpCQtqiJ
 ubM9x4v14TvYAHQf6thhJZ1VvFTyxA+S0IUSjI926AepqCFWgvD8xbkuNTVw1BT/R4xDF3v3EdL
 7UlrWHfCSA6wQGAcvRUlCR8spSnn2rGea9Lx7d2MkB6MYxczwQC6avmaeM88BOugHnOSBECRmmk
 BoeWLjqaCGL4REGhwltGod+gIonPy61yFVa9TzD09x5lIctv6Da1/undJNMnBcZt7iORyWZhPCa
 +vzTxSX9eeGZUKcVaiN+M8AnoiY/CJxrV3F1o7iomVBbMcezN8ZqIGZSAm2lw1GaKhfbpINpQgj
 Ua6jMffx0/
X-Google-Smtp-Source: AGHT+IHx2AJ0imqM0pHJ6UM8S9Z+SV2DnDS3huIp3+irF8Q2x0JcKbIuWNif+U4AlFTxFFyWT7iHGg==
X-Received: by 2002:a5d:588b:0:b0:425:7f10:ada7 with SMTP id
 ffacd0b85a97d-42667458124mr20041885f8f.20.1760538775250; 
 Wed, 15 Oct 2025 07:32:55 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:fed:4601:4b30:fdb5:8c7d:59b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-470ff15ef28sm43185915e9.5.2025.10.15.07.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:32:54 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Wed, 15 Oct 2025 15:32:22 +0100
MIME-Version: 1.0
Message-Id: <20251015-clk_ops-v1-17-5f80f827407e@linaro.org>
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
Subject: [Uboot-stm32] [PATCH 17/24] clk: ti: Remove negative error returns
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
 drivers/clk/ti/clk-am3-dpll-x2.c | 4 ++--
 drivers/clk/ti/clk-divider.c     | 4 ++--
 drivers/clk/ti/clk-mux.c         | 2 +-
 drivers/clk/ti/clk-sci.c         | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/ti/clk-am3-dpll-x2.c b/drivers/clk/ti/clk-am3-dpll-x2.c
index 1b0b9818cdd4d410bb0abf4ad8c3c5401b875147..dacde89efc490fb76f3a66c10af3348bc238eecc 100644
--- a/drivers/clk/ti/clk-am3-dpll-x2.c
+++ b/drivers/clk/ti/clk-am3-dpll-x2.c
@@ -22,8 +22,8 @@ static ulong clk_ti_am3_dpll_x2_get_rate(struct clk *clk)
 	unsigned long rate;
 
 	rate = clk_get_rate(&priv->parent);
-	if (IS_ERR_VALUE(rate))
-		return rate;
+	if (!rate)
+		return 0;
 
 	rate *= 2;
 	dev_dbg(clk->dev, "rate=%ld\n", rate);
diff --git a/drivers/clk/ti/clk-divider.c b/drivers/clk/ti/clk-divider.c
index 40a742d7fdc48ecf1c6b51913cc83cfa3d46e950..213be7dca30d7203dd36fbb95f4a0ac6592b5565 100644
--- a/drivers/clk/ti/clk-divider.c
+++ b/drivers/clk/ti/clk-divider.c
@@ -216,8 +216,8 @@ static ulong clk_ti_divider_get_rate(struct clk *clk)
 	u32 v;
 
 	parent_rate = clk_get_rate(&priv->parent);
-	if (IS_ERR_VALUE(parent_rate))
-		return parent_rate;
+	if (!parent_rate)
+		return 0;
 
 	v = clk_ti_readl(&priv->reg) >> priv->shift;
 	v &= priv->mask;
diff --git a/drivers/clk/ti/clk-mux.c b/drivers/clk/ti/clk-mux.c
index db5393414318f11c193a5f498c60a2415ec6fabc..ea424a197c1065d928d13de11529fd5a27865def 100644
--- a/drivers/clk/ti/clk-mux.c
+++ b/drivers/clk/ti/clk-mux.c
@@ -129,7 +129,7 @@ static ulong clk_ti_mux_get_rate(struct clk *clk)
 	index = clk_ti_mux_get_index(clk);
 	parent = clk_ti_mux_get_parent_by_index(&priv->parents, index);
 	if (IS_ERR(parent))
-		return PTR_ERR(parent);
+		return 0;
 
 	rate = clk_get_rate(parent);
 	dev_dbg(clk->dev, "rate=%ld\n", rate);
diff --git a/drivers/clk/ti/clk-sci.c b/drivers/clk/ti/clk-sci.c
index e374bd3bcc20d140ca0e25d0ec63f3faeda06901..c055f6c678a58604d581a2fde3e5d94019d5c577 100644
--- a/drivers/clk/ti/clk-sci.c
+++ b/drivers/clk/ti/clk-sci.c
@@ -76,7 +76,7 @@ static ulong ti_sci_clk_get_rate(struct clk *clk)
 	ret = cops->get_freq(sci, clk->id, clk->data, &current_freq);
 	if (ret) {
 		dev_err(clk->dev, "%s: get_freq failed (%d)\n", __func__, ret);
-		return ret;
+		return 0;
 	}
 
 	debug("%s(current_freq=%llu)\n", __func__, current_freq);

-- 
2.47.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
