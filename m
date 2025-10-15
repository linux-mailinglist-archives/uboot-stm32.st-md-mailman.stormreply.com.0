Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57438BDF13B
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 16:33:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18378C56639;
	Wed, 15 Oct 2025 14:33:05 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5103EC5663A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:33:03 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4710683a644so5731395e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760538783; x=1761143583;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2q4Wj/H3DTzfFF6xEUa+h8ifX/P9rsxbK5daN1/KAnk=;
 b=ERg3dy+V1KJQCnABbDNn/LhDrsZAbdvrQvDUJMaqt3kXdmGIPO1s8eosunIcBGh0gC
 MeRYi8oSGgVO8H4zMfCEyjrryPIXyVRVytJfER0hE/DTB8+JhQymBQF+Tjs1dR13ENhM
 5PBwykmI0+uYT8m4Z9ABbsNR59ZanAqeJwZYwpPRA7Zhct3aTnHPvJC3pd6FmbiaNQ1v
 tpxOvVKXLfUBpY1bZdqGWAY4eyLa9FvTXKw+aKfF7CC14xrB1EWcRqETicKB648f+QXm
 ea+Jr3biiY6mi2nMc2aJsubqg0uqGFNMlp+caKjkctmudfEuJ6HT0PU8hNY0Fp7YAajU
 UGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760538783; x=1761143583;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2q4Wj/H3DTzfFF6xEUa+h8ifX/P9rsxbK5daN1/KAnk=;
 b=RVJwb8OhyzBFMqDcOFtF3RMoD50YbCyl5xJABsDmZgsfuLZR9wyeW8FNPDhwH+iQ7n
 SUG3VPcnE4l89aXIKWlXai+cer+McgZj+q6LayT0+CkrfptQpgIhBlH8hCAEdsT4wiX4
 xEds/oMFeysxU4B/uYpO2yifF2CAZJ+Db+Yc3yvRH4OTqDqTEEItYhablLvfT/Eo67KS
 B4b1GYCp/cTMq0W5CyjSyVdluExW29YxroTSnM5rHJoCcX+ZdFJ24/XRRX9n/nuVcXaw
 45T6PFYXb4idbjbTTod06mxyYhajZKaZ6w7zF64Wt+DDfuijicrGK0pc1fSyHyO3IcCZ
 IbZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8sDkJogTeVpKBuG9LN4IoA9jTsme17W3buGSBkSBb1ejDzzMiDbmhfcFBlV8xKgxHzBdx/7D+2GTQQw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxnNE5lWlb8UyQ18yX2ArKezZnVq9uudjeH68zd327dpzygudxf
 b4l3vPWsXZ4XcxnvZv2fYLVzOptronAqU8eKVzDs8ff1AeL8Cxi43PbiM18chm9nh1k=
X-Gm-Gg: ASbGnctHKuw22keuLxFcu+0edRXQkUKJGUkFM2SOLGy6EiCHUyJFoMrmNpJAfi2+i5k
 xfsOMb0wmK+OY6CmL4GVoC6extTaFmvrMFOGfbU9XhAH7g0lVrSsaxRx4y1wVmdaJLLII2ExUi1
 P6oZ47RgALY4WI4LWmZ92lzviLhJCJK4ckpUzFL5a1nYc9vPM3UMTXz7uNBmN01+mqhnhah0/v2
 tmTYPbv0JtmDn9hsqMj/ynSiuXxzIC+4Ti+HXTKaJK5EI3QKK56F09bwiao9RRiRmuvNiC8uEiw
 ebvhfkHysA0RcXYoje1Tqrwjz+LVfyLbAP1aXkcrI1Nu2tEEkdrn6/TWhvr+bhgUlMBfC9WjNJY
 tbInvmLU9EAXF1qNFBeh1igYBTgZaYS/vSaxSrg/x5bfZNatBndhP6gCut5UwPzrZUmnd2grvop
 f7RbNjBiyP
X-Google-Smtp-Source: AGHT+IEiPj63alC/F+qsPYPzODZQfGumCQVRmx0HRJuTg0Jc2ejaDI+cXXR57MHzjLzAoVQsLyWfnA==
X-Received: by 2002:a05:600c:a69d:b0:46e:1b9d:ac6c with SMTP id
 5b1f17b1804b1-47109b58b51mr1738285e9.17.1760538782734; 
 Wed, 15 Oct 2025 07:33:02 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:fed:4601:4b30:fdb5:8c7d:59b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-470ff15ef28sm43185915e9.5.2025.10.15.07.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:33:02 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Wed, 15 Oct 2025 15:32:26 +0100
MIME-Version: 1.0
Message-Id: <20251015-clk_ops-v1-21-5f80f827407e@linaro.org>
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
Subject: [Uboot-stm32] [PATCH 21/24] clk: adi: Remove negative error returns
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
 drivers/clk/adi/clk-shared.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/adi/clk-shared.c b/drivers/clk/adi/clk-shared.c
index dcadcafa9d236882af8c7b397eeeeb44461a23cb..600e22940e8cb60b1e510a74ee8068ccf0c7848a 100644
--- a/drivers/clk/adi/clk-shared.c
+++ b/drivers/clk/adi/clk-shared.c
@@ -16,7 +16,7 @@ static ulong adi_get_rate(struct clk *clk)
 
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
