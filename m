Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E176BBDF0E6
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 16:32:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6080C56639;
	Wed, 15 Oct 2025 14:32:25 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FD0FC56639
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:32:24 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-46e2826d5c6so40639265e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760538744; x=1761143544;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ma2chDb3vOw+DvVL+Elh8yWCMC9/MPlr8PtTT73X6dU=;
 b=CFluCpDsLGoyiakn+ClZ/jix0q41EeLMIdTPVq+Ug7oIqZU83wD451vLrIHKV5ueMi
 cZXrP3mezp+3Qr1wpFHXaZby2Cm/Ay693W1RCxIAV2NMAkhwyWTc00PQc00/PHbEdrII
 5BcVDUyEZAhK15Xs0nxC88GUthe2zLvnJLWfeHcgJfnnE7GZCdL0QFX++l61s4Yw7htF
 SURLIyBdzTuqHHjPD9lIYQCJKS+0Hu4oCckUzbyGRxGYQU++dhMSs7oQein1yYdnTwgo
 RyQXdWEaluyDq7qaF2tljEZAx7f7nam/YMOMJD2pnHN/tuiE/fJgi69SrYctaxmfn/ct
 rMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760538744; x=1761143544;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ma2chDb3vOw+DvVL+Elh8yWCMC9/MPlr8PtTT73X6dU=;
 b=V3EKwYk7TQU0zxOd4YhzqYAjU7Q0VQta8KlK1Q12K9gRzwBAL67OmIhREW80DZYogT
 udwOU+bCY8w3fp+nJ1IL8OOF50uSNfmHLSPJ71Htr8lf43QSw1wl7pg08xNaIqQRsByJ
 HDJqnnY0vayIC2x7KCj63ZIgxXUkV9iw3O3pmwNzOPQV0tSoV7Bgd6LxNi+sjf43i2Oc
 CJ8bmFQDoADuPyMmV6KfuwDoVrd3tNMhc+XJ4nBjy76gbJSk5LxbEcwRiTAd4a0rc3LR
 bYGdIYC2mNSlwWtef535sTIxatWMZRtmeVNTtV92r9rz2zcHSttHntuerwegPC5EQEMl
 fYNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlGN86evcJJItiZcmKSn4YPowFchSrnl26QljQcdVAjXCMUHon57mgjHwrOulDoVpJFqEIQC17kDftxA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxqTG52bzOxgZdbYaQHAPtOIyUd2bFHEpCEc++KZmbbcATAYDby
 HF1wcbXhja/OlwxvgWptrjK4YOn4TXToaeAv+Ou+mW8k0sXLznUwjfqjeF3X1nliCYE=
X-Gm-Gg: ASbGncvq54zbN7YO4dCprgnD5nL+Rm53SFltdNVFpFqo6RSUTIvabXCkEdYsivwZisN
 X+5MykBa+i/bYJ2jvcsqh/odRN9HBsgyQf5LHpgiSv8h4/PVv7ypTTi2XUDq7fyYRk1N705uYQX
 Iv4TwRblW4+m9a1XRjjWz+R/OKt221GFZXjVRjfOaEP98YbOBj1yN2dCGKaOY/7qYWOg7g1iQax
 iNz6hz1Dkynhywhx8ouOF66cnlYbBg46BnlyouuxjVg2gOeBLEsTGKX2+C30/duu3Ag96IaNwox
 80jFjIs5MYYVfA9b/4sfEkrFW33HHE1K/y9xjRavH4lybO/LDKWqxUwQcz4gzxSUXDkVWSF9+g7
 JZctkWQ7hP8638UYcOMzso3MuglHjZcY2s1iCyIkI8yiaLMEGMewSA3vZ7ISjhyppPcckQ0U3uL
 L05ErcdN7Y
X-Google-Smtp-Source: AGHT+IFxJ3tdTc9aXKyMZ7CBIzLF8xRR3KpTVUPPFRVIzybF4VytlYoKR7kxxnTeR6BEG36njzF8Fw==
X-Received: by 2002:a05:6000:601:b0:426:d80c:2759 with SMTP id
 ffacd0b85a97d-426d80c2f3amr10817335f8f.25.1760538743325; 
 Wed, 15 Oct 2025 07:32:23 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:fed:4601:4b30:fdb5:8c7d:59b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-470ff15ef28sm43185915e9.5.2025.10.15.07.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:32:22 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Wed, 15 Oct 2025 15:32:06 +0100
MIME-Version: 1.0
Message-Id: <20251015-clk_ops-v1-1-5f80f827407e@linaro.org>
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
Subject: [Uboot-stm32] [PATCH 01/24] clk: meson: Remove negative error
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
 drivers/clk/meson/a1.c   | 10 +++++-----
 drivers/clk/meson/axg.c  | 10 +++++-----
 drivers/clk/meson/g12a.c | 36 ++++++++++++++++++------------------
 drivers/clk/meson/gxbb.c | 20 ++++++++++----------
 4 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/clk/meson/a1.c b/drivers/clk/meson/a1.c
index a1b8d79149102183402f470a60511d5300d0232c..78cad13239ca174a30f88cb2b18191cea74d6248 100644
--- a/drivers/clk/meson/a1.c
+++ b/drivers/clk/meson/a1.c
@@ -359,7 +359,7 @@ static ulong meson_div_get_rate(struct clk *clk, unsigned long id)
 
 	info = meson_clk_get_info(clk, id, MESON_CLK_DIV);
 	if (IS_ERR(info))
-		return PTR_ERR(info);
+		return 0;
 
 	/* Actual divider value is (field value + 1), hence the increment */
 	n = GET_PARM_VALUE(priv, info->parm) + 1;
@@ -402,7 +402,7 @@ static ulong meson_pll_get_rate(struct clk *clk, unsigned long id)
 
 	info = meson_clk_get_info(clk, id, MESON_CLK_ANY);
 	if (IS_ERR(info))
-		return PTR_ERR(info);
+		return 0;
 
 	pm = &info->parm[0];
 	pn = &info->parm[1];
@@ -411,7 +411,7 @@ static ulong meson_pll_get_rate(struct clk *clk, unsigned long id)
 	m = GET_PARM_VALUE(priv, pm);
 
 	if (n == 0)
-		return -EINVAL;
+		return 0;
 
 	parent = info->parents[0];
 	parent_rate_mhz = meson_clk_get_rate_by_id(clk, parent) / 1000000;
@@ -453,13 +453,13 @@ static ulong meson_clk_get_rate_by_id(struct clk *clk, unsigned long id)
 
 		ret = clk_get_by_name(clk->dev, info->name, &external_clk);
 		if (ret)
-			return ret;
+			return 0;
 
 		rate = clk_get_rate(&external_clk);
 		break;
 	}
 	default:
-		rate = -EINVAL;
+		rate = 0;
 		break;
 	}
 
diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index c421a622a587d2eddef70d28b65e560722cf7f62..e0b41811b0dfcc59f9a57366639ff2133209b697 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -104,7 +104,7 @@ static unsigned long meson_clk81_get_rate(struct clk *clk)
 		parent_rate = XTAL_RATE;
 		break;
 	case 1:
-		return -ENOENT;
+		return 0;
 	default:
 		parent_rate = meson_clk_get_rate_by_id(clk, parents[reg]);
 	}
@@ -123,7 +123,7 @@ static long mpll_rate_from_params(unsigned long parent_rate,
 	unsigned long divisor = (SDM_DEN * n2) + sdm;
 
 	if (n2 < N2_MIN)
-		return -EINVAL;
+		return 0;
 
 	return DIV_ROUND_UP_ULL((u64)parent_rate * SDM_DEN, divisor);
 }
@@ -171,7 +171,7 @@ static ulong meson_mpll_get_rate(struct clk *clk, unsigned long id)
 		pn2 = &meson_mpll2_parm[1];
 		break;
 	default:
-		return -ENOENT;
+		return 0;
 	}
 
 	parent_rate = meson_clk_get_rate_by_id(clk, CLKID_FIXED_PLL);
@@ -219,7 +219,7 @@ static ulong meson_pll_get_rate(struct clk *clk, unsigned long id)
 		pod = &meson_sys_pll_parm[2];
 		break;
 	default:
-		return -ENOENT;
+		return 0;
 	}
 
 	regmap_read(priv->map, pn->reg_off, &reg);
@@ -272,7 +272,7 @@ static ulong meson_clk_get_rate_by_id(struct clk *clk, unsigned long id)
 			rate = meson_clk81_get_rate(clk);
 			break;
 		}
-		return -ENOENT;
+		return 0;
 	}
 
 	debug("clock %lu has rate %lu\n", id, rate);
diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index a7a42b2edb6a5b98612fb71fec6d17b1f3ab77c8..910b91e874bfdf6753ffc40bec7cd3a94e0b41ad 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -264,7 +264,7 @@ static ulong meson_div_get_rate(struct clk *clk, unsigned long id)
 		parent = meson_hdmi_div_parent;
 		break;
 	default:
-		return -ENOENT;
+		return 0;
 	}
 
 	regmap_read(priv->map, parm->reg_off, &reg);
@@ -273,8 +273,8 @@ static ulong meson_div_get_rate(struct clk *clk, unsigned long id)
 	debug("%s: div of %ld is %d\n", __func__, id, reg + 1);
 
 	parent_rate = meson_clk_get_rate_by_id(clk, parent);
-	if (IS_ERR_VALUE(parent_rate))
-		return parent_rate;
+	if (!parent_rate)
+		return 0;
 
 	debug("%s: parent rate of %ld is %d\n", __func__, id, parent_rate);
 
@@ -323,12 +323,12 @@ static ulong meson_div_set_rate(struct clk *clk, unsigned long id, ulong rate,
 		parent = meson_hdmi_div_parent;
 		break;
 	default:
-		return -ENOENT;
+		return 0;
 	}
 
 	parent_rate = meson_clk_get_rate_by_id(clk, parent);
-	if (IS_ERR_VALUE(parent_rate))
-		return parent_rate;
+	if (!parent_rate)
+		return 0;
 
 	debug("%s: parent rate of %ld is %ld\n", __func__, id, parent_rate);
 
@@ -348,15 +348,15 @@ static ulong meson_div_set_rate(struct clk *clk, unsigned long id, ulong rate,
 			return ret;
 
 		parent_rate = meson_clk_get_rate_by_id(clk, parent);
-		if (IS_ERR_VALUE(parent_rate))
-			return parent_rate;
+		if (!parent_rate)
+			return 0;
 
 		new_div = DIV_ROUND_CLOSEST(parent_rate, rate);
 
 		debug("%s: new new div of %ld is %d\n", __func__, id, new_div);
 
 		if (!new_div || new_div > (1 << parm->width))
-			return -EINVAL;
+			return 0;
 	}
 
 	debug("%s: setting div of %ld to %d\n", __func__, id, new_div);
@@ -471,7 +471,7 @@ static ulong meson_mux_get_parent(struct clk *clk, unsigned long id)
 		parents = meson_hdmi_mux_parents;
 		break;
 	default:
-		return -ENOENT;
+		return 0;
 	}
 
 	regmap_read(priv->map, parm->reg_off, &reg);
@@ -560,8 +560,8 @@ static ulong meson_mux_get_rate(struct clk *clk, unsigned long id)
 {
 	int parent = meson_mux_get_parent(clk, id);
 
-	if (IS_ERR_VALUE(parent))
-		return parent;
+	if (!parent)
+		return 0;
 
 	return meson_clk_get_rate_by_id(clk, parent);
 }
@@ -588,7 +588,7 @@ static unsigned long meson_clk81_get_rate(struct clk *clk)
 
 	switch (reg) {
 	case 1:
-		return -ENOENT;
+		return 0;
 	default:
 		parent_rate = meson_clk_get_rate_by_id(clk, parents[reg]);
 	}
@@ -655,12 +655,12 @@ static ulong meson_mpll_get_rate(struct clk *clk, unsigned long id)
 		pn2 = &meson_mpll2_parm[1];
 		break;
 	default:
-		return -ENOENT;
+		return 0;
 	}
 
 	parent_rate = meson_clk_get_rate_by_id(clk, CLKID_FIXED_PLL);
-	if (IS_ERR_VALUE(parent_rate))
-		return parent_rate;
+	if (!parent_rate)
+		return 0;
 
 	regmap_read(priv->map, psdm->reg_off, &reg);
 	sdm = PARM_GET(psdm->width, psdm->shift, reg);
@@ -711,7 +711,7 @@ static ulong meson_pll_get_rate(struct clk *clk, unsigned long id)
 		pod = &meson_sys_pll_parm[2];
 		break;
 	default:
-		return -ENOENT;
+		return 0;
 	}
 
 	regmap_read(priv->map, pn->reg_off, &reg);
@@ -851,7 +851,7 @@ static ulong meson_clk_get_rate_by_id(struct clk *clk, unsigned long id)
 			rate = meson_clk81_get_rate(clk);
 			break;
 		}
-		return -ENOENT;
+		return 0;
 	}
 
 	debug("clock %lu has rate %lu\n", id, rate);
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 51f124869c9c4043dfe047cf2f694bf59df7e87f..6dcfd084b8f93ade3fe1270db48f91f87cb61d26 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -306,7 +306,7 @@ static ulong meson_div_get_rate(struct clk *clk, unsigned long id)
 		parent = meson_hdmi_div_parent;
 		break;
 	default:
-		return -ENOENT;
+		return 0;
 	}
 
 	regmap_read(priv->map, parm->reg_off, &reg);
@@ -315,8 +315,8 @@ static ulong meson_div_get_rate(struct clk *clk, unsigned long id)
 	debug("%s: div of %ld is %d\n", __func__, id, reg + 1);
 
 	parent_rate = meson_clk_get_rate_by_id(clk, parent);
-	if (IS_ERR_VALUE(parent_rate))
-		return parent_rate;
+	if (!parent_rate)
+		return 0;
 
 	debug("%s: parent rate of %ld is %d\n", __func__, id, parent_rate);
 
@@ -596,8 +596,8 @@ static ulong meson_mux_get_rate(struct clk *clk, unsigned long id)
 {
 	int parent = meson_mux_get_parent(clk, id);
 
-	if (IS_ERR_VALUE(parent))
-		return parent;
+	if (parent < 0)
+		return 0;
 
 	return meson_clk_get_rate_by_id(clk, parent);
 }
@@ -627,7 +627,7 @@ static unsigned long meson_clk81_get_rate(struct clk *clk)
 		parent_rate = XTAL_RATE;
 		break;
 	case 1:
-		return -ENOENT;
+		return 0;
 	default:
 		parent_rate = meson_clk_get_rate_by_id(clk, parents[reg]);
 	}
@@ -695,12 +695,12 @@ static ulong meson_mpll_get_rate(struct clk *clk, unsigned long id)
 		pn2 = &meson_mpll2_parm[1];
 		break;
 	default:
-		return -ENOENT;
+		return 0;
 	}
 
 	parent_rate = meson_clk_get_rate_by_id(clk, CLKID_FIXED_PLL);
-	if (IS_ERR_VALUE(parent_rate))
-		return parent_rate;
+	if (!parent_rate)
+		return 0;
 
 	regmap_read(priv->map, psdm->reg_off, &reg);
 	sdm = PARM_GET(psdm->width, psdm->shift, reg);
@@ -833,7 +833,7 @@ static ulong meson_clk_get_rate_by_id(struct clk *clk, unsigned long id)
 			rate = meson_clk81_get_rate(clk);
 			break;
 		}
-		return -ENOENT;
+		return 0;
 	}
 
 	debug("clock %lu has rate %lu\n", id, rate);

-- 
2.47.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
