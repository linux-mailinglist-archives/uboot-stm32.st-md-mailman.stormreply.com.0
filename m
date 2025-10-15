Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D381BDF131
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 16:33:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5676C56639;
	Wed, 15 Oct 2025 14:33:00 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0D77C56639
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:32:59 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-46e29d65728so40099205e9.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760538779; x=1761143579;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kwWQND9CMT+Bz5FgcZ94jD7k5YY1jW0BivJ6A4aGPZk=;
 b=x+nfmcRYYPCwtRRhsKyPcC67BGtwqBOxwQBZVyOexwmei6hECq3dysA0f5SWqS4+Mz
 yeQzQmSZSc+CyWF8ey6dlWhfcqWLazhHvFS3lm0UC2cfrcHzlWZOF6toZSUpXUJXK1zs
 VgqiHVqZ3YXtumMgZDSVUbC1xrcUVIwp5nALQ4YbCEjehOt//wPiQTYIyy5VmYalXSA7
 EnS0XZh+eW06s6nldA28+M5tG+gJKyUMnunymIZA8Z6MtKJdvTg1CF6In5+qP5fwcehN
 ugOwAQdgFCQp5w3d+mjuaqn5AzeStr9mRlplLKxiLrjWs/UUfFQiqZfg5Tzp9wHhh+h8
 tr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760538779; x=1761143579;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kwWQND9CMT+Bz5FgcZ94jD7k5YY1jW0BivJ6A4aGPZk=;
 b=Hkm52Cj/xIg5uZGwhJTZz4wTwLmJ26350ybDmUR608RVWqgu3ejQNcoQPO29coabrD
 MQi/vGwBQcwbYkLJtytbVF61jDgH7U0b/fsmmW+W+qS26vHl1qGfgoFAApHqtXvmHXNT
 Ip4/D9YdZ7H0TpS1ky4AeBbZgBFn22vQOZKaQkVXChVveIGNQ5qTUcsSjGxPTxDuQa8b
 XDMNG6sbfs52ejJ2Dg4bKSserf9P+lPgwnRDCfMPw4HKoNXutSatfoikqfvnutcX9wmr
 o8FidvDR5FD1wX6uZJ9Qpy1onKKKdixWhYv9R7ORgda6UBsXG9PlThJ9nbAmgFiQJx0C
 Rnvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXil16RVkEy0MaBXoYHcIvyRMehI1vOKFgBTVdvmcXKA70z4foeehCca7FpGy6srwwp1aZrgcuT2o0NCA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy6H8XZkMSxEFV0cWlc12I/8NeTlvPVVs9sRBZIPGnWQifFUVaQ
 q6/YUjcscZ4OM1XdJUDo+8HBKTnWZDFsOtJQsBman21C8ff3RmPSevEyjblyUTLhK7A=
X-Gm-Gg: ASbGnct1qiKwL1T1e15bok+sl66/r/Ilsy0oYWW4TTqH1W8eg8anD71RuAan7lBlH4W
 +aJRC+SSQe7otxI+odcx/jQVGGxbC2H3ZtBKwBSm1+7SwO/dD+JuyLZ6l79Wjm/Z+0LJxkZE8f6
 hFr3RIGEcm1yA4CNwprDnDnShT6oBb9h1BFROI5G4Edr8dVjg4v0XbDpxpW5ZG7D/qrNq8bX4Pw
 QVuw6bfK0yp8z5iS76oKVYl/0sRitX99qkAS2pk5VRShL/1uTmzFDhi9kvNMz4oVcDHoqKqKXxN
 qdNP2pgRtCEFuhzjskdOHaoO78vVqdakaLe8jco1AyJgoFA9x/6qn/sAbA/RvUjadwMCubWzcGS
 iTrCZGCIj0DgpKnd6HHZfxwPlzSN7rG+gqAJ75rm3MkGg7Cra+RPVnkZiFoe6Y7nBW65Q67wAQn
 sEBYww2tQI
X-Google-Smtp-Source: AGHT+IExvdrrtACv1v1bCnHO/vLEuSJs6IgHVSJLmyd8qAi7z8oH1x726lDJpOK5Wk/7aL8ono5B/Q==
X-Received: by 2002:a05:600c:1e86:b0:471:9fb:e386 with SMTP id
 5b1f17b1804b1-47109fbe4bbmr303835e9.35.1760538779015; 
 Wed, 15 Oct 2025 07:32:59 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:fed:4601:4b30:fdb5:8c7d:59b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-470ff15ef28sm43185915e9.5.2025.10.15.07.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:32:58 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Wed, 15 Oct 2025 15:32:24 +0100
MIME-Version: 1.0
Message-Id: <20251015-clk_ops-v1-19-5f80f827407e@linaro.org>
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
Subject: [Uboot-stm32] [PATCH 19/24] clk: owl: Remove negative error returns
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
 drivers/clk/owl/clk_owl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/owl/clk_owl.c b/drivers/clk/owl/clk_owl.c
index 513112c1146ca055d99c85eddd7de527b674c60f..11e71f54617a63d565bf61f3f70dff3f94845d00 100644
--- a/drivers/clk/owl/clk_owl.c
+++ b/drivers/clk/owl/clk_owl.c
@@ -202,7 +202,7 @@ static ulong owl_clk_get_rate(struct clk *clk)
 		rate = owl_get_sd_clk_rate(priv, 0);
 		break;
 	default:
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
