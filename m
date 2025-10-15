Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA70BDF0FE
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 16:32:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D488C56639;
	Wed, 15 Oct 2025 14:32:38 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBD8CC56639
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:32:36 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-47103b6058fso5280435e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760538756; x=1761143556;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3tWf4K5nfITc9L+EnRjgeRkZmPVpS7I4ycWja9HuwN4=;
 b=MpJrhhnD/XyvVsltYaw0cC0TNrcEc8DmoCA5JL35x+vjmAZ57JsBXn9RVx8gu+Iw0E
 iVUaEdEnLR2V8iV+LPFv/lU/FPVElXOOA8OtwH+FJ6hlVASROo9QjI/MQNvMy2y57PcR
 ZWQR2B2qfn/sh2h/UWolt9IZQbsLylPAEFnjMuxRnKWBYKu21mCzsOHsp2bxBElQr4Ti
 6GJ1W+J22ZwteSu38r/HHHGuICDvKHzWbmc1NwUpnFVUwng0hJmxYWqcnBIwOzAWx8Fr
 K1LlY2l0bld1uxrfFf/9TMm8BfxYxKA9a4OOSHIkvIqrdH+T5mqWRqIfsRyq/t7Um9RZ
 7ixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760538756; x=1761143556;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3tWf4K5nfITc9L+EnRjgeRkZmPVpS7I4ycWja9HuwN4=;
 b=dKdW9BVR4OT9qqnFuHdlnDnsMz7VUsp9GWR07ve4jmGGFsknU5bOJdIOvxbjRDdHZZ
 Mn3G8iD07oU1lILmuotn/My7PD0a7lNQ8tPS15iehPaD87a+aM0nH9+0soBfL/LIUxBW
 WaeTKB5/+TVwamQvny0HL2CQEdodl8yHqjvITi08bjgojwjiYVgcD4I1GZqfu25ycBsU
 ypFwGZLeRAPI8Fb1ydChi0uMYgolVsRws8UIyN5jrYZ/6OG7PUHgzcgdv7ZPykGVbFF0
 J2MEfGr8TYI5gSVzQi/sSRE649IQkMQNcdjP6SE0JCToFQ5XsMiV7yW9x616jHU98azi
 1bUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3idvWTgNZuUdPORqWkuEKU5VXDq41pNn4GxfI9+27b9vjVYuXcct/GGNtEGPQww7ud/kjgKNXMC8TFQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxPItqtg7uOnBb7QyJ34oF+DuhZZFUZqr227AY5e4tqLBgvEWvA
 teXIdF0/EDxLkhBFojA9mBRKjtoPeKLbpcmuuUnTuBdOn008eSBBp4UNXpNNZUHLL3k=
X-Gm-Gg: ASbGncv4YJaBXVU3IlBQ9luYXYCc1gspkUxb86PhZZc+8+FWDRHNXy792DaQ+0N9qL3
 DazxuC6pFESYW6Ns701RiaW/a4zQqGfCS8Otoanach/DbXB3ofEyCodDc5YuGYcrxSz1LCfhjfc
 jquNYMU61d8TAnXsImaXnN6ymVgc7z5uMv15xTs5NqkPin5D9Wqky0f53WLXsBR4UlQxdKUJ4G4
 J4yeG7hAW4wakLwztlH6fl04+XHejikdGWxDJJSz8j9aXrAiwrHJnWoN5EUrSuerN0FLeO7h3Hf
 TdLt9zYwTPLObibbvOOcBqSlboTd+58e3qaxALGZE4TliJK6pmtHbwXyp5LEOXrwUy4KIZzctst
 Fa5mlXYtelKrgDGsAlL/Rn70XlXex2keJ7MOqqrh6Vx6UhHdoBeqx8t/v3YkMPczewR3okEriJh
 Ekt2+KOomA
X-Google-Smtp-Source: AGHT+IHBJVSDbhob8EQTtHJBQyTHlnrM8iU3P6RVY/IQeZmYdOCBqElQiuRq2B0zOuFibLaJVHxdQQ==
X-Received: by 2002:a05:600c:4e89:b0:46f:a8fd:c0dc with SMTP id
 5b1f17b1804b1-471099212bbmr3743235e9.3.1760538756090; 
 Wed, 15 Oct 2025 07:32:36 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:fed:4601:4b30:fdb5:8c7d:59b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-470ff15ef28sm43185915e9.5.2025.10.15.07.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:32:35 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Wed, 15 Oct 2025 15:32:12 +0100
MIME-Version: 1.0
Message-Id: <20251015-clk_ops-v1-7-5f80f827407e@linaro.org>
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
Subject: [Uboot-stm32] [PATCH 07/24] clk: renesas: Remove negative error
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
 drivers/clk/renesas/clk-rcar-gen2.c | 8 ++++----
 drivers/clk/renesas/rzg2l-cpg.c     | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/renesas/clk-rcar-gen2.c b/drivers/clk/renesas/clk-rcar-gen2.c
index 9b6fce4675c018ad72eeefe3939bacbf65ffc428..4cdcc0fe71946d3055caae3ac7eb8e36c0b9b507 100644
--- a/drivers/clk/renesas/clk-rcar-gen2.c
+++ b/drivers/clk/renesas/clk-rcar-gen2.c
@@ -82,7 +82,7 @@ static ulong gen2_clk_get_rate(struct clk *clk)
 	ret = renesas_clk_get_parent(clk, info, &parent);
 	if (ret) {
 		printf("%s[%i] parent fail, ret=%i\n", __func__, __LINE__, ret);
-		return ret;
+		return 0;
 	}
 
 	if (renesas_clk_is_mod(clk)) {
@@ -94,7 +94,7 @@ static ulong gen2_clk_get_rate(struct clk *clk)
 
 	ret = renesas_clk_get_core(clk, info, &core);
 	if (ret)
-		return ret;
+		return 0;
 
 	switch (core->type) {
 	case CLK_TYPE_IN:
@@ -112,7 +112,7 @@ static ulong gen2_clk_get_rate(struct clk *clk)
 			return rate;
 		}
 
-		return -EINVAL;
+		return 0;
 
 	case CLK_TYPE_FF:
 		rate = (gen2_clk_get_rate(&parent) * core->mult) / core->div;
@@ -198,7 +198,7 @@ static ulong gen2_clk_get_rate(struct clk *clk)
 
 	printf("%s[%i] unknown fail\n", __func__, __LINE__);
 
-	return -ENOENT;
+	return 0;
 }
 
 static int gen2_clk_setup_mmcif_div(struct clk *clk, ulong rate)
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 7fce1f70d13805fff452b60ce6ec16e4439e28d0..ecdd6c6e52695658d032b805425480cf60a1be59 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -225,7 +225,7 @@ static ulong rzg2l_core_clk_get_rate(struct udevice *dev, const struct cpg_core_
 		return rzg2l_div_clk_get_rate(dev, cc);
 	default:
 		dev_err(dev, "get_rate needed for clock %u, type %d\n", cc->id, cc->type);
-		return -ENOSYS;
+		return 0;
 	}
 }
 
@@ -244,7 +244,7 @@ static ulong rzg2l_cpg_clk_get_rate_by_id(struct udevice *dev, unsigned int id)
 		}
 
 		dev_err(dev, "Module clock ID %u not found\n", cpg_clk_id);
-		return -ENODEV;
+		return 0;
 	}
 
 	for (i = 0; i < data->info->num_core_clks; i++) {
@@ -253,7 +253,7 @@ static ulong rzg2l_cpg_clk_get_rate_by_id(struct udevice *dev, unsigned int id)
 	}
 
 	dev_err(dev, "Core clock ID %u not found\n", cpg_clk_id);
-	return -ENODEV;
+	return 0;
 }
 
 static ulong rzg2l_cpg_clk_get_rate_by_name(struct udevice *dev, const char *name)
@@ -272,7 +272,7 @@ static ulong rzg2l_cpg_clk_get_rate_by_name(struct udevice *dev, const char *nam
 	}
 
 	dev_err(dev, "Clock name %s not found\n", name);
-	return -EINVAL;
+	return 0;
 }
 
 static ulong rzg2l_cpg_clk_get_rate(struct clk *clk)

-- 
2.47.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
