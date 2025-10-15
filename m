Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE568BDF11F
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 16:32:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2F27C56639;
	Wed, 15 Oct 2025 14:32:53 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 205FDC56638
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:32:52 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-42421b1514fso3318566f8f.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760538771; x=1761143571;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=c2Ex94fmhlLv2i2Yx1QhQ917Ez/zRaZdOvJOV/zm02o=;
 b=uEOORD5IK4vl5hQzdbVIYasu387J2zNYKWN7Q/xqKJYQnPhAKnqewKp2ICMpLHCPu/
 qAXlkfkcSkLUcPbAJVTBj2bx5pSZwV9ycQe05Ng4j/I92lE4YHKsxKboY71P6cLcwr4w
 6KMPSEUWF6w/QojNJf0/Xt57LPEMv3X6Khd1qtSZvOoRLbH0JLvzK91js4y23MQLw9Xw
 e8Xve+QyjVRHyPB5PcECPmBZQ3u3N9XKsdQNx0m4BOZPXp2593Iov6acvBW8ZdO60g7Q
 ru/lpFkVklT++Qxr85jMBe+ub47GhKOuMAIcFNMgidqO3F+8id+PxBb2QMyXP4slHK64
 3D5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760538771; x=1761143571;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c2Ex94fmhlLv2i2Yx1QhQ917Ez/zRaZdOvJOV/zm02o=;
 b=gXalmLFLE8TNzfuSwcM7uyZsnLeBd8Gkh6mteYAKDNTT6hAIDGe6KwK5pctN6zcTVD
 +53BMFxGR++xwWBS0p5hVpQawD/AIdMNAafQ/YCGkqybH+SHyAwZtbiWGM3bjTRGG6Q6
 4Aza60APcwPQhyYB0gUFi9eb9VjgaGS+0sFxIt06i3lSxiCnqdmO0dZApwLwJVu1ca+Z
 3156vYq4MiWjk1V5ycSu5mPwTP9N0hVB2d0cvFpSJmcBTnE8Sipneuq0V4vpd0bgesh9
 B4j4ia1PF6rtOFNUZvRbnN0X4n71tDnyXlGlEboDoCUM5gGkW112FilP0eOZ9GxdQJB/
 77Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpO45Hw1ZD/cpLK7mNl96SBcxJMXEuZ11KUI/yZk49b79SVrXC2Qqpp4+nGRzWi7BzjfswzowuzKkG7g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyudtWVmKzDnRF/9R0YvfJ4ZtSjuNB9xpjicRjRyNfRI1zAxBum
 ZbXJ+PJK4ejVz/E/zgthijCtvRdrOWu+dHL7gtNXUjC9OFyIqX0WRT5IQGUV38R0LxY=
X-Gm-Gg: ASbGncvJ6BMGwYVQYFS9KnG96kmkd8alZlT6LvA9q4jSqL0PTyEVIcOxuffSipNwmVD
 NguRJv/aCsFRnmTMQB/yq1ZMwr2aMVziNX/q37CIB31hdcidlD/SwNJhQFgGuy+Zm3s7KKjHq2i
 DYl7gjksSzYZ7AZ3lz5U8HDfesQ632CPALYjHBoWYjDLpvEauztwwEtR3pAvspdh018IeV6Es7r
 jdLgTlSujfwBxRQv1jWJ3MfNs0PjhmEqyiGJEa3nMjk9lB3Kw5/8ZuacQAUxiFhH0LPcsU3O3c4
 qQWE1k6/oi+xPKAD+5O9DVT0bfnxS/1UEGgdw4K55404Tm2qKOaJRQHXstBOBjtPlKXLsYk8mxs
 yUhOHj75r7AHUygLYPZ0XfPOBJNXmKrrP+rh34ssxGX+2n5/+Q22KqhmSyXo3frln+qXze+PONK
 pODOzWzZEe
X-Google-Smtp-Source: AGHT+IFntIZgc8kpwywcm6Ac1YodmDRVT9uEaIFSPv2xMkytU2MPV98wALWC7FxueiIlE7bJN1OwyA==
X-Received: by 2002:a5d:5d88:0:b0:425:7e38:419f with SMTP id
 ffacd0b85a97d-42666ab867amr19302858f8f.16.1760538771388; 
 Wed, 15 Oct 2025 07:32:51 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:fed:4601:4b30:fdb5:8c7d:59b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-470ff15ef28sm43185915e9.5.2025.10.15.07.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:32:50 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Wed, 15 Oct 2025 15:32:20 +0100
MIME-Version: 1.0
Message-Id: <20251015-clk_ops-v1-15-5f80f827407e@linaro.org>
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
Subject: [Uboot-stm32] [PATCH 15/24] clk: exynos: Remove negative error
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
 drivers/clk/exynos/clk-exynos7420.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/exynos/clk-exynos7420.c b/drivers/clk/exynos/clk-exynos7420.c
index 7de4e688f036d47adfa22c841400770b1b1ed3b3..494f5623259945376475c53dcd8d5b5fbf635b0f 100644
--- a/drivers/clk/exynos/clk-exynos7420.c
+++ b/drivers/clk/exynos/clk-exynos7420.c
@@ -199,7 +199,7 @@ static ulong exynos7420_peric1_get_rate(struct clk *clk)
 	case SCLK_UART2:
 		ret = clk_get_by_index(clk->dev, 3, &in_clk);
 		if (ret < 0)
-			return ret;
+			return 0;
 		freq = clk_get_rate(&in_clk);
 		break;
 	}

-- 
2.47.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
