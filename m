Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF04EBDF119
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 16:32:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8687FC5663A;
	Wed, 15 Oct 2025 14:32:49 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 332B5C5663A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:32:48 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-46e3a50bc0fso49017415e9.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760538768; x=1761143568;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=X3kPH94duDXi2y0uFSPhGXlr4nkQRpFgaC0tEk4x3qc=;
 b=DEC+CkALXHM2y4FEBXI1ihwjTXDlrkM6LNeM+338q7Mfc+yTdbltPaMjJme80LihvO
 V2bVoorPf75pBPZaAmM0A4qs16RnEOsfkvXna7n+3lQSE1YCVmbdd4Mt7Nhqm4zPi1Gb
 I0tM2L8ntIuIB1T0E9K3Ee0FFJZAbpktmKy7pDqhpEm28ePRFmkFGX3g8/l9d5amGo5q
 WwDTHp+N6koro8CsofFHZwXVyVp6Bo4ClwBlaLl1cCGERU0+jUsepHmze6ayb/6Lzx0g
 Yblg8Wc2i3A8GF9r7t/Bq96a0ME+w7VMpXc8xRpERcXBT8JJcYF6EtGc3R1IK9SEd6Zz
 Rw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760538768; x=1761143568;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X3kPH94duDXi2y0uFSPhGXlr4nkQRpFgaC0tEk4x3qc=;
 b=jGYYZAjky1IwOCRksFaJziUrkDKw48MKlaxpsAR1oPazkmr6rQsPk+60A1K/VqL00g
 riHopKx34TSNbCjEllPtC+KSrcFpUHmcn8OxhDkKrUmFUA6pFbNiPMJzHD21jznh61Q7
 QqcwkpGvN82Aa5JC5u9wR1qojlPWN245Ptu3arya1LLupYNa+fxobdbOmkoySW/Rz0EU
 XlHaQVi7BCQL9Y0O92PPmjyBaq/gjUG793B+BCsYhWN62AyHMq39Yo2r7RFk79zerDHh
 8e2W38INAO9E5/BnHfOJ6WXYq0j7wnOs4jVdD0cKdqrt7O0el/4xe6o+IknD8BBxjdob
 Lz3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqkWDUJh5HVQVUUpuz+yf4BdwxaapRhdgnaHuA+qU5h3xkKlSF1N/KhPDBOazcm1K8IQa87fpWpDG4uA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw36rJmoBl91+xb1fRX1ky2KJb/j+d1DnoOmB3obO+0esYNCpRs
 +qrHKG1P4I9qIRNKb63Tg0WUsoVVMksx5VOtlZjXHB8bzWVEoJ7M/7v5cp9RMR7Z2JE=
X-Gm-Gg: ASbGncuD6+tDHvVlDYYOKOBmfZW4zzDeoBNK9FehTJAM3aVN2mmCz9GbZwAQEMY8Shd
 Cg1S5z/k0ZXx8STL2vKiMb01VETyvtgYVguOHjPcAVPQRcpPsOLE/VR851XCZ0q+a0MLiZ4CBu7
 fo3cL4pg3nbJfTKRR7kkNFftKdPvg2zcNTfMfDXMg0TZz3lNYpEhZkM3Mi/p22lZVa1qXdF6h1X
 vE/GFUP3+svCAqB4InNpEfiDaKWPwYXDHJUkWdkjvQdYBU7zc/OE6Qs3EIrUsB7TS5UZP+zmjaU
 70KuOvcZicaz7uMLP2RtxRaTrWhzXi0MG+cJnEscFH4Ql/ffmRqYRgoLINV/8y9lDJt2XMTT7Ck
 v1Gjcse8gncmX+sC2jJhgJhfXGBFFpc9r8M1T4LPRskPKobvcOYh4vn7IWTfsnVTKjHpo6FBrPR
 t7hfTbUpGw
X-Google-Smtp-Source: AGHT+IGjcPz60CY/ty2SwUER5zMHoK+uFYCxXPg7myYGlDxDfj3NBnrrq8j+DbTUrNlg3QcTBQ5jwA==
X-Received: by 2002:a05:600c:3e1a:b0:46e:1d8d:cfa2 with SMTP id
 5b1f17b1804b1-46fa9af9842mr182565155e9.20.1760538767482; 
 Wed, 15 Oct 2025 07:32:47 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:fed:4601:4b30:fdb5:8c7d:59b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-470ff15ef28sm43185915e9.5.2025.10.15.07.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:32:47 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Wed, 15 Oct 2025 15:32:18 +0100
MIME-Version: 1.0
Message-Id: <20251015-clk_ops-v1-13-5f80f827407e@linaro.org>
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
Subject: [Uboot-stm32] [PATCH 13/24] clk: aspeed: Remove negative error
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
 drivers/clk/aspeed/clk_ast2500.c | 2 +-
 drivers/clk/aspeed/clk_ast2600.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/aspeed/clk_ast2500.c b/drivers/clk/aspeed/clk_ast2500.c
index a330dcda4dcbeeb602f7210e262f88e64ab99623..3ad47b9e19117eb888666087f5f3fa32b0f588d7 100644
--- a/drivers/clk/aspeed/clk_ast2500.c
+++ b/drivers/clk/aspeed/clk_ast2500.c
@@ -197,7 +197,7 @@ static ulong ast2500_clk_get_rate(struct clk *clk)
 		break;
 	default:
 		debug("%s: unknown clk %ld\n", __func__, clk->id);
-		return -ENOENT;
+		return 0;
 	}
 
 	return rate;
diff --git a/drivers/clk/aspeed/clk_ast2600.c b/drivers/clk/aspeed/clk_ast2600.c
index 535010b7941484804573279f90226c2641dba034..8a36356c40f75abc799f71eb66c554a7caa1eab2 100644
--- a/drivers/clk/aspeed/clk_ast2600.c
+++ b/drivers/clk/aspeed/clk_ast2600.c
@@ -471,7 +471,7 @@ static ulong ast2600_clk_get_rate(struct clk *clk)
 		break;
 	default:
 		debug("%s: unknown clk %ld\n", __func__, clk->id);
-		return -ENOENT;
+		return 0;
 	}
 
 	return rate;

-- 
2.47.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
