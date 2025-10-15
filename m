Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF00BDF107
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 16:32:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F728C5663B;
	Wed, 15 Oct 2025 14:32:41 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA39BC56639
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:32:40 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-47109187c32so1142345e9.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760538760; x=1761143560;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KoOm1cjJDTzyzt43fZxwQ5sNSVmQxdz+VGsr3ZlNPrc=;
 b=yYLsFXlr0/8shxQFb26213eQwmF+6WkSf2+YWNApMT4BvR3MxjIP2XxG5uRXGD11Dh
 n7BVqI+qp7Ata//gbntVdQdo0gb3TJXRVHibSoWMq4t8+Rx5LUIhYY7X3WqzX+Vmf76y
 4RpaISvWQse1RGIn/4Ekky8wHEuiQagKhAA/WhaALuM5oXdQTUtRMH4j4Lro3ybCG2NR
 a86Ys9HQkC5MEPaVElQRbZcSvK/IeGD3o+qAzHqVsdaMsCVm/YhigIjydVw2VDwfsRkM
 aVUsogb+MvjqyEI5y9ARKOnIL6WmUsXE3ODC4Yt/gExBusqMy1Tep5ZTexYAcd7twRwD
 m0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760538760; x=1761143560;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KoOm1cjJDTzyzt43fZxwQ5sNSVmQxdz+VGsr3ZlNPrc=;
 b=fl2+rYLZz+LFvTDJFyI+XRYZorjB23352RJLgwAI4SpEzm5rK+AYZcOd0CPpcU1UKS
 morOdhbEji88jh8dOeynzCn9IAFwm3J631NwO8M+W0Y90V9/FwloeEmLXavFMj/CTaGC
 Dt8mRGkpKliIZlM8Ougu9rkyWGPTdExvaFS1EYqqJBWzY8h8HJvuVHTSrQ7rph0+UEgA
 0P46Ti5+4/NA0U6MgUIDuUtIg93OUis7PkOQpmPEm3gZePUG+fWPvy2WnDzpBmuH9lhc
 7tXCb3r0pKjwKiLQQ88sB10tePIaqIh1K1aD1ZKtBafX2BFcKDAdZ7Jz2cbdlW/1iStt
 Ba3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQXPoUY0t9ktXjoP+AnU/H2qdLmPw/PPpsT4Qp7MZ71/WRKurU4EjL8M3rtCqqj7AfX1FNQPBasmAPSA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy1C7ViUOUuGCi3Y23KragQTdYIzS5Gh4SXQOJ2eSeZnzjA8vP0
 ONWkcIhkk9Ew0693+PWB9o0MBl+sxCPoqF0gb0Us5KxOZrIxTLA4m8w1w6BxWNFHYIE=
X-Gm-Gg: ASbGncv3e6SRO6/62/84aN0Dzes5V0r1/l0dH7UcOrC+I2nXqvrtGOsKu4AuDVM+woq
 ba7aWgAtP7QmLZGd31wrERzrs1T3GACA7tm75SL2JO/mMeDNYfwNEu2xQ6phBIEXVcZYPlqsP8G
 Y/1Js5o8o4erEWLEha/yyokt/zKqej/vQvKnZF0JMM/ATVFCllmlCVhyy0fKb8sIPtFOLkqYPQI
 RYQDo0Qpq/y2LmUI79eXnd1HSApVvylH+soTGeMKwd2Oc3Oqod+lRHqVBP+XqGLI1Ktj64/gLYI
 9nJVv3vde1tNjKQiAlR1BBTk7/t2yGYBisJXnNel0P4fxkdO65XMLn6IqgcbYFFB06LqHsoIevF
 97pywUAf/LhbuDvl7MtQvssLb572L6ltQYnMIGL9WlfJArkhrlb/wfL05CvX2rCN0f6yDZyJDxw
 ==
X-Google-Smtp-Source: AGHT+IH6SRilvuO+S/9qch//05K26NtD74EVs5NOThPiTRFg7vOrJ4/CJT1rWgsqN1vH1AzBf4j4Bw==
X-Received: by 2002:a05:600c:1e86:b0:471:9fb:e386 with SMTP id
 5b1f17b1804b1-47109fbe4bbmr293175e9.35.1760538760020; 
 Wed, 15 Oct 2025 07:32:40 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:fed:4601:4b30:fdb5:8c7d:59b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-470ff15ef28sm43185915e9.5.2025.10.15.07.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:32:39 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Wed, 15 Oct 2025 15:32:14 +0100
MIME-Version: 1.0
Message-Id: <20251015-clk_ops-v1-9-5f80f827407e@linaro.org>
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
Subject: [Uboot-stm32] [PATCH 09/24] clk: Remove negative error returns from
	clk_get_rate
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
 drivers/clk/clk-hsdk-cgu.c     |  2 +-
 drivers/clk/clk-uclass.c       |  4 ++--
 drivers/clk/clk_fixed_factor.c |  4 ++--
 drivers/clk/clk_k210.c         |  6 +++---
 drivers/clk/clk_sandbox.c      |  4 ++--
 drivers/clk/clk_scmi.c         |  4 ++--
 drivers/clk/clk_vexpress_osc.c |  2 +-
 drivers/clk/clk_zynq.c         |  4 ++--
 drivers/clk/clk_zynqmp.c       | 40 ++++++++++++++++++++--------------------
 9 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/clk/clk-hsdk-cgu.c b/drivers/clk/clk-hsdk-cgu.c
index 53655059279e51d91b4fb81e43ca444c078cb956..5ec90cfa87156a401ee22ff7248d1f699e340ccd 100644
--- a/drivers/clk/clk-hsdk-cgu.c
+++ b/drivers/clk/clk-hsdk-cgu.c
@@ -703,7 +703,7 @@ static ulong hsdk_cgu_get_rate(struct clk *sclk)
 	struct hsdk_cgu_clk *clk = dev_get_priv(sclk->dev);
 
 	if (hsdk_prepare_clock_tree_branch(sclk))
-		return -EINVAL;
+		return 0;
 
 	return clk->map[sclk->id].get_rate(sclk);
 }
diff --git a/drivers/clk/clk-uclass.c b/drivers/clk/clk-uclass.c
index 3dbe1ce9441ca513d41be90520ff175c96b4253a..b2d5b883ad6fdbdc7d0b15d928a5b990193360c9 100644
--- a/drivers/clk/clk-uclass.c
+++ b/drivers/clk/clk-uclass.c
@@ -525,11 +525,11 @@ ulong clk_get_parent_rate(struct clk *clk)
 
 	pclk = clk_get_parent(clk);
 	if (IS_ERR(pclk))
-		return -ENODEV;
+		return 0;
 
 	ops = clk_dev_ops(pclk->dev);
 	if (!ops->get_rate)
-		return -ENOSYS;
+		return 0;
 
 	/* Read the 'rate' if not already set or if proper flag set*/
 	if (!pclk->rate || pclk->flags & CLK_GET_RATE_NOCACHE)
diff --git a/drivers/clk/clk_fixed_factor.c b/drivers/clk/clk_fixed_factor.c
index 1d740cf49f6277233f8403f85ab78daeae904c28..36fcecc44cb2aa4c9f0760156fc3f38e3cf14f65 100644
--- a/drivers/clk/clk_fixed_factor.c
+++ b/drivers/clk/clk_fixed_factor.c
@@ -28,8 +28,8 @@ static ulong clk_fixed_factor_get_rate(struct clk *clk)
 	struct clk_fixed_factor *ff = to_clk_fixed_factor(clk->dev);
 
 	rate = clk_get_rate(&ff->parent);
-	if (IS_ERR_VALUE(rate))
-		return rate;
+	if (!rate)
+		return 0;
 
 	do_div(rate, ff->div);
 
diff --git a/drivers/clk/clk_k210.c b/drivers/clk/clk_k210.c
index d1a6cde8f0f8e8ad52873caa9b52d30435d472f5..52667f02e1c172b1f150a965f71fe961dab096b4 100644
--- a/drivers/clk/clk_k210.c
+++ b/drivers/clk/clk_k210.c
@@ -1049,8 +1049,8 @@ static ulong do_k210_clk_get_rate(struct k210_clk_priv *priv, int id)
 
 	parent = k210_clk_get_parent(priv, id);
 	parent_rate = do_k210_clk_get_rate(priv, parent);
-	if (IS_ERR_VALUE(parent_rate))
-		return parent_rate;
+	if (!parent_rate)
+		return 0;
 
 	if (k210_clks[id].flags & K210_CLKF_PLL)
 		return k210_pll_get_rate(priv, k210_clks[id].pll, parent_rate);
@@ -1075,7 +1075,7 @@ static ulong do_k210_clk_get_rate(struct k210_clk_priv *priv, int id)
 		return parent_rate / (2 << val);
 	default:
 		assert(false);
-		return -EINVAL;
+		return 0;
 	};
 }
 
diff --git a/drivers/clk/clk_sandbox.c b/drivers/clk/clk_sandbox.c
index c8c5a88c52d985632733030b0cb92970920a5fc5..722e1d7133b60887bb302d25ac34065ba9ebccfb 100644
--- a/drivers/clk/clk_sandbox.c
+++ b/drivers/clk/clk_sandbox.c
@@ -16,10 +16,10 @@ static ulong sandbox_clk_get_rate(struct clk *clk)
 	ulong id = clk_get_id(clk);
 
 	if (!priv->probed)
-		return -ENODEV;
+		return 0;
 
 	if (id >= SANDBOX_CLK_ID_COUNT)
-		return -EINVAL;
+		return 0;
 
 	return priv->rate[id];
 }
diff --git a/drivers/clk/clk_scmi.c b/drivers/clk/clk_scmi.c
index a7d89f32cd7c97a0ede1995612ce0b7302d06392..93ca81f7c008eb5da860ef22285f8adb81849872 100644
--- a/drivers/clk/clk_scmi.c
+++ b/drivers/clk/clk_scmi.c
@@ -211,11 +211,11 @@ static ulong scmi_clk_get_rate(struct clk *clk)
 
 	ret = devm_scmi_process_msg(clk->dev, &msg);
 	if (ret < 0)
-		return ret;
+		return 0;
 
 	ret = scmi_to_linux_errno(out.status);
 	if (ret < 0)
-		return ret;
+		return 0;
 
 	return (ulong)(((u64)out.rate_msb << 32) | out.rate_lsb);
 }
diff --git a/drivers/clk/clk_vexpress_osc.c b/drivers/clk/clk_vexpress_osc.c
index 85ac92c908a7382963cf861252211d597cfddbe8..79ff003aa8f623142e3ec05098fdd1a10610f4fb 100644
--- a/drivers/clk/clk_vexpress_osc.c
+++ b/drivers/clk/clk_vexpress_osc.c
@@ -32,7 +32,7 @@ static ulong vexpress_osc_clk_get_rate(struct clk *clk)
 	data = CLK_FUNCTION | priv->osc;
 	err = misc_read(vexpress_cfg, 0, &data, sizeof(data));
 	if (err < 0)
-		return err;
+		return 0;
 
 	return data;
 }
diff --git a/drivers/clk/clk_zynq.c b/drivers/clk/clk_zynq.c
index a8505f62bbadf917254f8098a3565654db0511c4..ca5c476f1a811356555e96e0f95b988a76f197cb 100644
--- a/drivers/clk/clk_zynq.c
+++ b/drivers/clk/clk_zynq.c
@@ -283,7 +283,7 @@ static ulong zynq_clk_get_gem_rate(struct zynq_clk_priv *priv, enum zynq_clk id)
 	debug("%s: gem%d emio rx clock source unknown\n", __func__,
 	      id - gem0_clk);
 
-	return -ENOSYS;
+	return 0;
 }
 
 static unsigned long zynq_clk_calc_peripheral_two_divs(ulong rate,
@@ -398,7 +398,7 @@ static ulong zynq_clk_get_rate(struct clk *clk)
 	case usb0_aper_clk ... swdt_clk:
 		return zynq_clk_get_cpu_rate(priv, cpu_1x_clk);
 	default:
-		return -ENXIO;
+		return 0;
 	}
 }
 
diff --git a/drivers/clk/clk_zynqmp.c b/drivers/clk/clk_zynqmp.c
index 7a433a667a49510ccaf712fa97ad4386634a85e6..ceaedd074f10ea0fb0f6acd27f17a0d953c86cd4 100644
--- a/drivers/clk/clk_zynqmp.c
+++ b/drivers/clk/clk_zynqmp.c
@@ -382,7 +382,7 @@ static ulong zynqmp_clk_get_pll_rate(struct zynqmp_clk_priv *priv,
 	ret = zynqmp_mmio_read(zynqmp_clk_get_register(id), &clk_ctrl);
 	if (ret) {
 		printf("%s mio read fail\n", __func__);
-		return -EIO;
+		return 0;
 	}
 
 	if (clk_ctrl & PLLCTRL_BYPASS_MASK)
@@ -409,7 +409,7 @@ static ulong zynqmp_clk_get_pll_rate(struct zynqmp_clk_priv *priv,
 		ret = zynqmp_mmio_read(dpll_lpd_reg, &cross_div);
 		if (ret) {
 			printf("%s mio read fail\n", __func__);
-			return -EIO;
+			return 0;
 		}
 
 		cross_div = (cross_div & PLL_TO_LPD_DIV_MASK) >>
@@ -431,7 +431,7 @@ static ulong zynqmp_clk_get_cpu_rate(struct zynqmp_clk_priv *priv,
 	ret = zynqmp_mmio_read(CRF_APB_ACPU_CTRL, &clk_ctrl);
 	if (ret) {
 		printf("%s mio read fail\n", __func__);
-		return -EIO;
+		return 0;
 	}
 
 	div = (clk_ctrl & CLK_CTRL_DIV0_MASK) >> CLK_CTRL_DIV0_SHIFT;
@@ -439,8 +439,8 @@ static ulong zynqmp_clk_get_cpu_rate(struct zynqmp_clk_priv *priv,
 	srcsel = clk_ctrl & CLK_CTRL_SRCSEL_MASK;
 	pll = pll_src[ACPU_CLK_SRC][srcsel];
 	pllrate = zynqmp_clk_get_pll_rate(priv, pll);
-	if (IS_ERR_VALUE(pllrate))
-		return pllrate;
+	if (!pllrate)
+		return 0;
 
 	return DIV_ROUND_CLOSEST(pllrate, div);
 }
@@ -455,7 +455,7 @@ static ulong zynqmp_clk_get_ddr_rate(struct zynqmp_clk_priv *priv)
 	ret = zynqmp_mmio_read(CRF_APB_DDR_CTRL, &clk_ctrl);
 	if (ret) {
 		printf("%s mio read fail\n", __func__);
-		return -EIO;
+		return 0;
 	}
 
 	div = (clk_ctrl & CLK_CTRL_DIV0_MASK) >> CLK_CTRL_DIV0_SHIFT;
@@ -463,8 +463,8 @@ static ulong zynqmp_clk_get_ddr_rate(struct zynqmp_clk_priv *priv)
 	srcsel = clk_ctrl & CLK_CTRL_SRCSEL_MASK;
 	pll = pll_src[DDR_CLK_SRC][srcsel];
 	pllrate = zynqmp_clk_get_pll_rate(priv, pll);
-	if (IS_ERR_VALUE(pllrate))
-		return pllrate;
+	if (!pllrate)
+		return 0;
 
 	return DIV_ROUND_CLOSEST(pllrate, div);
 }
@@ -479,14 +479,14 @@ static ulong zynqmp_clk_get_dll_rate(struct zynqmp_clk_priv *priv)
 	ret = zynqmp_mmio_read(CRL_APB_DLL_REF_CTRL, &clk_ctrl);
 	if (ret) {
 		printf("%s mio read fail\n", __func__);
-		return -EIO;
+		return 0;
 	}
 
 	srcsel = clk_ctrl & CLK_CTRL_SRCSEL_MASK;
 	pll = pll_src[DLL_CLK_SRC][srcsel];
 	pllrate = zynqmp_clk_get_pll_rate(priv, pll);
-	if (IS_ERR_VALUE(pllrate))
-		return pllrate;
+	if (!pllrate)
+		return 0;
 
 	return pllrate;
 }
@@ -503,7 +503,7 @@ static ulong zynqmp_clk_get_peripheral_rate(struct zynqmp_clk_priv *priv,
 	ret = zynqmp_mmio_read(zynqmp_clk_get_register(id), &clk_ctrl);
 	if (ret) {
 		printf("%s mio read fail\n", __func__);
-		return -EIO;
+		return 0;
 	}
 
 	div0 = (clk_ctrl & CLK_CTRL_DIV0_MASK) >> CLK_CTRL_DIV0_SHIFT;
@@ -523,8 +523,8 @@ static ulong zynqmp_clk_get_peripheral_rate(struct zynqmp_clk_priv *priv,
 		pll = pll_src[PERI_CLK_SRC][srcsel];
 
 	pllrate = zynqmp_clk_get_pll_rate(priv, pll);
-	if (IS_ERR_VALUE(pllrate))
-		return pllrate;
+	if (!pllrate)
+		return 0;
 
 	return
 		DIV_ROUND_CLOSEST(
@@ -543,7 +543,7 @@ static ulong zynqmp_clk_get_crf_crl_rate(struct zynqmp_clk_priv *priv,
 	ret = zynqmp_mmio_read(zynqmp_clk_get_register(id), &clk_ctrl);
 	if (ret) {
 		printf("%d %s mio read fail\n", __LINE__, __func__);
-		return -EIO;
+		return 0;
 	}
 
 	div0 = (clk_ctrl & CLK_CTRL_DIV0_MASK) >> CLK_CTRL_DIV0_SHIFT;
@@ -586,13 +586,13 @@ static ulong zynqmp_clk_get_crf_crl_rate(struct zynqmp_clk_priv *priv,
 		pll = pll_src[CPU_R5_CLK_SRC][srcsel];
 		break;
 	default:
-		return -ENXIO;
+		return 0;
 	}
 	if (two_divs) {
 		ret = zynqmp_mmio_read(zynqmp_clk_get_register(pll), &clk_ctrl);
 		if (ret) {
 			printf("%d %s mio read fail\n", __LINE__, __func__);
-			return -EIO;
+			return 0;
 		}
 		div1 = (clk_ctrl & CLK_CTRL_DIV0_MASK) >> CLK_CTRL_DIV0_SHIFT;
 		if (!div1)
@@ -603,8 +603,8 @@ static ulong zynqmp_clk_get_crf_crl_rate(struct zynqmp_clk_priv *priv,
 		pll = iopll;
 
 	pllrate = zynqmp_clk_get_pll_rate(priv, pll);
-	if (IS_ERR_VALUE(pllrate))
-		return pllrate;
+	if (!pllrate)
+		return 0;
 
 	return
 		DIV_ROUND_CLOSEST(
@@ -729,7 +729,7 @@ static ulong zynqmp_clk_get_rate(struct clk *clk)
 	case gdma_ref ... dpdma_ref:
 		return zynqmp_clk_get_crf_crl_rate(priv, id, two_divs);
 	default:
-		return -ENXIO;
+		return 0;
 	}
 }
 

-- 
2.47.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
