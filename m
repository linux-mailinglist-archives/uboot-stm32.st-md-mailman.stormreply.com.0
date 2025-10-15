Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98698BDF110
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 16:32:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CA78C5663A;
	Wed, 15 Oct 2025 14:32:45 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 615AFC5663A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:32:44 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3ece1102998so4469631f8f.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760538764; x=1761143564;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=N3rljvq9KOA7AJzz2MxpZB3DqMsIJEB0N/Yw0c/kKeI=;
 b=LX6aYC0xN6cNDbjaPnaLbxFc9Ar5ScmkPFxnllmSAHT2y66utYJRdk5a+of2Xq/dpP
 xf03Zded15PdZJl0uNvY066386dv97EoLKc+kyTSiEg3Ob0nHUXLhyrYKKHCkP0Snrm7
 jspEvKLPSazuEkcDj+YW2E4rHiPgKqPzs5xlkMMHjqUt5J6auACJWVkoJ+mwX1P/aIv9
 Zv/2xqXT4eb2D/a3v1PsF4SM35zp2wdmrwPRyxU7CvTW4xl6F3j9XV1aNKrq+g7jDPyN
 VH9VH/dDTFvsVuRhzOjANMGhkp4pt4gDk2Om6LkiLGJo0NmYY9cF7sGv6Hk1umU2fTiq
 qwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760538764; x=1761143564;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N3rljvq9KOA7AJzz2MxpZB3DqMsIJEB0N/Yw0c/kKeI=;
 b=WpOccM+1y03SFXx1sbrcIFlUJozbDgBGiK0xc0ntrKr9IXAV4Xw24OhdnkEknN+r5t
 zlg9KdbRA+8DW7At9q7EnN4yaloeWhrnzpSt5XSLfO0+XKe6u0TBnMe2Ihix+mrX8kkA
 BxVUjcsCU8cciwspXO+hhjnaBFqeiNMucW6+y/TtwY5nP+TMNPMCO8B6JmJxsOt9Nkrm
 NkLNUWiscCXmdC/hMyNoA9Oj6L6P9fIXZmy6V0HPPS0gGolNrFuSoMFoO9MGMwBTfFq1
 KgTirTBqL7OzMMH7I81jhPk+a9TGgAmAWLQtaOeEbhmNiTNLEFV7e9AwLo4qqy5O0gct
 A2+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWItIBno8W0iTkiq9J3nFj9u7o40C3wZnOzwOVN1+a4G940/Ul1nexLYXf9rvz7IyYDAYwXgcdH/wql9Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyNawnPW+ZL+EP4+35YBnly7sYUeVghrjGdp5yiP4a/6pxl/xGX
 EDFScGdxKPWRGipgfTOhnyVQbPz3klmJ88/M3sbr+nXYfT8M3CqBQlwKMKyOxYcyTK8=
X-Gm-Gg: ASbGncs8xBYJsIOsZmXvhK32KlNBW8t29ws7H//TjCuK1QoE89PJvJciQ8S7cF1UFAm
 8RUrsN6k7EGqPUqCkK9ZuvAIk3heJZ+kzi3qTIiwy0V0yY6rmrAr92QZQVaLBz5AqnbFjZjE/gR
 ysPvWWUAb5FYg3Mf5SJ2Pvc8+6ESpS7hFz/VFeLGxy7ocui8trJOtPnzZyUsEubRRZQdF6E4hPf
 JnWgErsf0YdRCkmaaHmicHMJgXBC8yzi3im5QMmDn3uxjpzIV8ZEC8HPEBXlN812A56xPuMNYnT
 lQy+yeBzZ21wN3ifZWep1g8hmVD1tvI/YaoFF8u2uM76LPgxrxI4mXQMdLpgjfnXSuxJf0k9ID4
 bniolxnBpHTWdIr/hlRxG9VAzUqSfUnXI9iXKKLDjoa5QnTCIxdGLwQPuZPmI3+3PnFPccPDkOA
 ==
X-Google-Smtp-Source: AGHT+IGZBE/wvC/OR16B1nm/Lbel1Icf+lV5KoD+pC7Gi//18a7APy+0r1AOjyOP5ulUf0ZTDMkeQw==
X-Received: by 2002:a05:600c:a40c:b0:46f:b43a:aee1 with SMTP id
 5b1f17b1804b1-46fb43aaf16mr87846415e9.38.1760538763766; 
 Wed, 15 Oct 2025 07:32:43 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:fed:4601:4b30:fdb5:8c7d:59b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-470ff15ef28sm43185915e9.5.2025.10.15.07.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:32:43 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Wed, 15 Oct 2025 15:32:16 +0100
MIME-Version: 1.0
Message-Id: <20251015-clk_ops-v1-11-5f80f827407e@linaro.org>
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
Subject: [Uboot-stm32] [PATCH 11/24] clk: altera: Remove negative error
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
 drivers/clk/altera/clk-agilex.c  | 2 +-
 drivers/clk/altera/clk-agilex5.c | 2 +-
 drivers/clk/altera/clk-n5x.c     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/altera/clk-agilex.c b/drivers/clk/altera/clk-agilex.c
index fdbf834bb2f6ae85025a2d11f25f8b1de025871d..7f57e2b1c5d722ba0c8f49eb0849e57ee0ed4d4e 100644
--- a/drivers/clk/altera/clk-agilex.c
+++ b/drivers/clk/altera/clk-agilex.c
@@ -639,7 +639,7 @@ static ulong socfpga_clk_get_rate(struct clk *clk)
 	case AGILEX_NAND_CLK:
 		return clk_get_l4_mp_clk_hz(plat) / 4;
 	default:
-		return -ENXIO;
+		return 0;
 	}
 }
 
diff --git a/drivers/clk/altera/clk-agilex5.c b/drivers/clk/altera/clk-agilex5.c
index fb1e72ffc5cdef4d641982daf2b57f185ec327c8..90495082203cee0791a26aec2ee38d3f3ac0aff0 100644
--- a/drivers/clk/altera/clk-agilex5.c
+++ b/drivers/clk/altera/clk-agilex5.c
@@ -705,7 +705,7 @@ static ulong socfpga_clk_get_rate(struct clk *clk)
 	case AGILEX5_NAND_X_CLK:
 		return clk_get_l4_mp_clk_hz(plat);
 	default:
-		return -ENXIO;
+		return 0;
 	}
 }
 
diff --git a/drivers/clk/altera/clk-n5x.c b/drivers/clk/altera/clk-n5x.c
index 9e4e7a1d90879bf89cb07212b9d3c894bb203fc7..2340e9890f501b0760d159a66431c521df2bb2f1 100644
--- a/drivers/clk/altera/clk-n5x.c
+++ b/drivers/clk/altera/clk-n5x.c
@@ -436,7 +436,7 @@ static ulong socfpga_clk_get_rate(struct clk *clk)
 	case N5X_NAND_CLK:
 		return clk_get_l4_mp_clk_hz(plat) / 4;
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
