Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78752BDF141
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 16:33:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E858C56639;
	Wed, 15 Oct 2025 14:33:08 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1261CC56638
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:33:07 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-47108104bcbso5363405e9.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760538786; x=1761143586;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZtjuoaIn0U4yu07uuoXlyfcO+nTQuUSRN4E068cr5Lo=;
 b=ITMnc2ICzUuvJQI2T1ZXSFwqaLSUt7Omx84PyXC6WyBV0ZuE4HhGnd6E0YIXAUXzEK
 1vaQzbc9BPEmznsx1Nomw534mvPkGzJR4j5YZwaP4t3oOLZJLyzAPNDmm9gNKs4qoWpj
 r3JRtsBPFnClss0/Vqyji1DjPDskhsZP46RnG4ayV3IfX1zneXMMOItZAMBW3qVCMKLt
 XrGo5KEBq+7SNoXYT1HNDMG6FKhw6L3Rt6IBhIPE75ZAbSkjl0/llrj9eKdkF+bx1SJh
 qTybnBkfertdLbr0L2RfcqcQPHiGYBC2D2R9qcMooGDjES+W7cMxjyQ2AbWVbF/Uh2om
 KSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760538786; x=1761143586;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZtjuoaIn0U4yu07uuoXlyfcO+nTQuUSRN4E068cr5Lo=;
 b=YHhkN8yjk6VzZCO+/VRouKeDRyJT6TLeqtvYXnijKbABEovw9WpOV3lavDG7Q+J7bn
 oVyDZ2pMbplNA9lCYG2sLxSrdr3Z9DbwVnJlXPRbivR90DT/mxWvL1ZemBZO1SHhH22H
 Lqq0VNcprVACz0OTiW+bNosr1lYYtn2uVbYkrLJYoTAI7PK1If9/B0Io+aRW0JD/oJN+
 RKRjHHGzqEDDDinjc2yToEARYMtudiMJ5qnRi/9I82kenX0ONKaqbnEHJYp4kdTRHFKk
 yusXW2oA0V3HamrCHvNFco0Oc0iwym9fwcyWOJ0CrlYuV0gJj8PlC1dFca1mvRspXSrT
 HZdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL9jmlpxMV/IH+Ri1mlw6oEGJR4XtLI6KMnYxP04AUkLisrSrsMrl4Orv4ZyJh0zLSHrIb6hCWdt2VoA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzJDUGtd/Bd2Fj4h8TvB2o5Lj0k3x8VtOkm1aMjXwGWjXN+s7dC
 Xvo3ZdzZWZTBaAV7OilRkJfSIBJX37kmf1g7BReoN0Eo92Gr1cQ8Q60W0vwZLnIfqZw=
X-Gm-Gg: ASbGncsyWWM3Zn8P8vjbZsmJqpDzsaKUv92shd8Tg14YgOARD4rZLwMawQuxIw6wP1M
 p2ufXG8aBXrpOaQOmdZf2eNK5OROadK1PZAwj+AQve9kgXZvMdDE5vTkOxCeeZF+5KJLAnZ2XhE
 sKI9v+fYZ7Qo0vBsD6Vy9wHvEQNfts9E8BmXVwBZ47WJjyatFxghfMsa4N64kjIJ06Kmod8CxcF
 0Y+DdP1FPmguiAtCvVaqdA/o4nlO7+v/juQcBNk8sOAAY0GlyE528oonfi3LBXZxKm333CT2zCZ
 J2UsFG1UWGgemz4kD/vgnNr1ePSMspKRSRRCxbbPIRLiRoLvxqlhMllyoxMmqyFD+fpzpyWWFCn
 P+9mtY5CApGe6lyB2F/Hdbxbz0C6pjT1subO3nYvmtIVWBNxYe9BYBnMWdrt0mz6I09nlX/lGOg
 ==
X-Google-Smtp-Source: AGHT+IEdszMazYCX1mfKMEp6V/yCkwDB7tZvnNIFm4qDr/MLX7UV5zEV1LJQ9klORTW5GZniNL68Yg==
X-Received: by 2002:a05:600c:c16d:b0:46e:36ba:9253 with SMTP id
 5b1f17b1804b1-46fa9aa1d5fmr225175385e9.15.1760538786474; 
 Wed, 15 Oct 2025 07:33:06 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:fed:4601:4b30:fdb5:8c7d:59b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-470ff15ef28sm43185915e9.5.2025.10.15.07.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:33:05 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Wed, 15 Oct 2025 15:32:28 +0100
MIME-Version: 1.0
Message-Id: <20251015-clk_ops-v1-23-5f80f827407e@linaro.org>
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
Subject: [Uboot-stm32] [PATCH 23/24] clk: stm32: Remove negative error
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
 drivers/clk/stm32/clk-stm32-core.c | 4 ++--
 drivers/clk/stm32/clk-stm32f.c     | 6 +++---
 drivers/clk/stm32/clk-stm32h7.c    | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index 858f122db1a6db02eadc110a7b3e14192654d8ff..5220d49d4206808734f9838d3e55298cf6b163ab 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -106,11 +106,11 @@ static ulong stm32_clk_get_rate(struct clk *clk)
 	struct clk *c = NULL;
 
 	if (!clk->id || clk_get_by_id(clk->id, &c))
-		return -ENOENT;
+		return 0;
 
 	ops = clk_dev_ops(c->dev);
 	if (!ops->get_rate)
-		return -ENOSYS;
+		return 0;
 
 	return ops->get_rate(c);
 }
diff --git a/drivers/clk/stm32/clk-stm32f.c b/drivers/clk/stm32/clk-stm32f.c
index fceb3c44b94e4e4f5249ff1bc99c7ae4adba4316..db64139d13d4b3fff74838d9e14ae6c5e61c7941 100644
--- a/drivers/clk/stm32/clk-stm32f.c
+++ b/drivers/clk/stm32/clk-stm32f.c
@@ -310,7 +310,7 @@ static unsigned long stm32_clk_get_pllsai_rate(struct stm32_clk *priv,
 		break;
 	default:
 		log_err("incorrect PLLSAI output %d\n", output);
-		return -EINVAL;
+		return 0;
 	}
 
 	return (stm32_clk_get_pllsai_vco_rate(priv) / pll_div_output);
@@ -414,7 +414,7 @@ static ulong stm32_clk_get_rate(struct clk *clk)
 		vco = (priv->hse_rate / pllm) * plln;
 		sysclk = vco / pllp;
 	} else {
-		return -EINVAL;
+		return 0;
 	}
 
 	switch (clk->id) {
@@ -491,7 +491,7 @@ static ulong stm32_clk_get_rate(struct clk *clk)
 
 	default:
 		dev_err(clk->dev, "clock index %ld out of range\n", clk->id);
-		return -EINVAL;
+		return 0;
 	}
 }
 
diff --git a/drivers/clk/stm32/clk-stm32h7.c b/drivers/clk/stm32/clk-stm32h7.c
index df82db69738a5d9704592d5cdbec52125c0620a1..eb8fb72976b60c8016408693631470a0e369e8cb 100644
--- a/drivers/clk/stm32/clk-stm32h7.c
+++ b/drivers/clk/stm32/clk-stm32h7.c
@@ -573,7 +573,7 @@ static u32 stm32_get_PLL1_rate(struct stm32_rcc_regs *regs,
 		break;
 	}
 
-	return -EINVAL;
+	return 0;
 }
 
 static u32 stm32_get_apb_psc(struct stm32_rcc_regs *regs, enum apb apb)
@@ -780,7 +780,7 @@ static ulong stm32_clk_get_rate(struct clk *clk)
 	default:
 		dev_err(clk->dev, "unexpected gate_offset value (0x%x)\n",
 			gate_offset);
-		return -EINVAL;
+		return 0;
 		break;
 	}
 }

-- 
2.47.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
