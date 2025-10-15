Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AABEBDF10D
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 16:32:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F1B6C56639;
	Wed, 15 Oct 2025 14:32:43 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5E78C56638
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:32:42 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3ee1221ceaaso5506495f8f.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760538762; x=1761143562;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rrFYn5HqWfkmgQZXH9W4GMctaMQzBSO78U9wF2VBV8A=;
 b=qx8U2jrTFKyWk/oCNvHYeHCbn/HPRdZfyYGAibnzcqM+oIkNXKmafJR2jcTAL4wKPS
 XbthVkg6Cuu903RD0VJvdX2NI/ZfX0R5tPm8zVgSFxjgABd+IYbpLnEgXZtcZo+6fOl3
 XsUle9tGo5hb/On3kw20k9MvCAobiirsvEbo4cSbDxAkBxY84+mowKDaNE9FwNIYthMg
 GQKG2x01WZFAYv27oYyjh8eT8kfszFUOdnI1H/sT/aFDb/JxXCplt5U4d+jlP+qHgdFw
 KmkMdBnIub0CYj2ksz9E8Sd+QHwaYx/YShJRyKAqRu6AMzsIs5ShLAY8hkStcC4TtjXC
 YcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760538762; x=1761143562;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rrFYn5HqWfkmgQZXH9W4GMctaMQzBSO78U9wF2VBV8A=;
 b=Iz1xtMZkIyC/VJbg4iabSitt0jResOZBf+F82W3K+fHFzZTXgtmSGQLaZG3Bk56XuW
 JPhWUhc11reoHXK57zHqQZiqMULU1e6PhrehFnO9QXYypffa8s3/FBo/sZapfnh6bHNG
 9lxVaqgva009PpL9IXbgnKGe8PNgEG2aLoeebHwIybGZJcTPk4SHuZgJmUeyv6jRGXvh
 ebmOiHp8Q+TYYcNn2CO60Kd9OfckV1aK9WrCgexsl5nozW1Q2RgK7yF+3O99E1AHSiwK
 B4NgILADpHAXIwVyhSzaFi8Qxqb95YXIZ1V8D/LzvP8WkfrACIzimb2XbGll1mzFZWr3
 EOoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXISc4jJTXvDpECMrBYmijUm1LTUtMsUMQsJCYSvVptpE6XL08AxVc5jUyz96a6Ehv+CYqCqbXYoNao+Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywahl+CR84Nk/mN3TSg3HS8YH0qhXw+Y6du5ttMrsnkYuVSyZqt
 lSYVlGdCL25ea7I3BG842k5zePyg7qnc1eGoJPrEjTvQ8lVt40OLyGzufduRbwVcYVI=
X-Gm-Gg: ASbGncvvmbLWHfJrHxUKTaJzXJfRnobkZ9DnCBJugP8hakQ3ct9SesCsw7GVQXDpIMc
 GgUyYI9a8zSzORx3YErxLiLPeVOfoaFDuzwlBKpBPrt5zE/M8WR/K7MK7rpABTqWCfehaNZcFN7
 0Er2uOeSy0ErOUNZbZ+rgJEjWUNRQxSC48yH3hGiH26iu9LuqcGXdZGhVEFrk9IrhJaKjkSkoQy
 g4ept3um40X7YZXyC5qQy7/Y3NqkIXDV9GxIBIMBf/pEh725JAU0VjF6VwL81PmSpIVSaoJqcfX
 IPzUPBDTpusHwKmg3GuV/sewGhsG97LvoQ99CwshHuGmR9zLpieGhgRezr9IKwoTD4NF1ZX6jZ+
 lunZJNGOG1OITgC5sE+o+iDeatBqwVumnGXQ0tR9enATkgLZAbwWDvOaE2TPCj4G9ZL1idMTXBS
 lUkR/Ky63q
X-Google-Smtp-Source: AGHT+IFlNowh+vGp70FH97qTtLRQH3h2fsYL1QnfN9LOkLczISksLceR9H/9QlvbKNOAnaY9OEN82w==
X-Received: by 2002:a05:6000:420d:b0:3f8:e016:41c0 with SMTP id
 ffacd0b85a97d-42666abb540mr18223531f8f.10.1760538761916; 
 Wed, 15 Oct 2025 07:32:41 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:fed:4601:4b30:fdb5:8c7d:59b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-470ff15ef28sm43185915e9.5.2025.10.15.07.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:32:41 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Wed, 15 Oct 2025 15:32:15 +0100
MIME-Version: 1.0
Message-Id: <20251015-clk_ops-v1-10-5f80f827407e@linaro.org>
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
Subject: [Uboot-stm32] [PATCH 10/24] clk: starfive: Remove negative error
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
 drivers/clk/starfive/clk-jh7110-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/starfive/clk-jh7110-pll.c b/drivers/clk/starfive/clk-jh7110-pll.c
index f8af17227c502a39cc8f4b77f52a3d88fed210a9..12dd14c02c683bb860743bcb994b549e7a8f74bb 100644
--- a/drivers/clk/starfive/clk-jh7110-pll.c
+++ b/drivers/clk/starfive/clk-jh7110-pll.c
@@ -292,7 +292,7 @@ static ulong jh7110_pllx_recalc_rate(struct clk *clk)
 	else if (dacpd == 0 && dsmpd == 0)
 		do_div(frac, 1 << 24);
 	else
-		return -EINVAL;
+		return 0;
 
 	refclk *= (fbdiv + frac);
 	do_div(refclk, prediv * postdiv1);

-- 
2.47.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
