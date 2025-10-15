Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECCABDF0F2
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 16:32:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9BEDC56639;
	Wed, 15 Oct 2025 14:32:33 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13AB9C56639
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:32:33 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-46e29d65728so40094685e9.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760538752; x=1761143552;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ERwowSjUiSfjiyeRoDtHaJmN8qD2SmfA6iuhiy4Rcrk=;
 b=KK5c63rXjlLGi/FW3nBH91hU3g/Zgof+392dWiFyhaPX2cmtDbLR5vu1CvnC24PFlM
 nZohdcf7AQguS85jJzpMki7evSfKPDxrfbxn2z2Br6FjXjImTRL70cGupDML6/r0Wfqa
 3PWlx92NsnfDz0c4za2WQjfpm/TLGEaMIdHPctN2k3GT74fOgEdn8/SawXSfV4PuEDmp
 LSB/aMiVzJpNFhA1EcCucIsmJMns+omiQ4QAOFVTHcaGpk4bvxsplmisfsucVz6+G5S5
 K/zaKTaDHfOi9D+RNopaiOYA+GGb1AIAbG+TFoR6k3XGUQV5rdLyi4xjG0tO1/hzV00r
 UfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760538752; x=1761143552;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ERwowSjUiSfjiyeRoDtHaJmN8qD2SmfA6iuhiy4Rcrk=;
 b=fdZBQuoOkssQJBftYdJ/T5CcqPttqvMt+pS5B1mwDb6DK2Ht1K7f1gRQv64cnIqExS
 kU1arRv3au94vcDDdqW+QQ8kEcmWEgvE5Ad6Nr3/KUh8sneMcX6nSae7Sc32BXLMzOxo
 2D24vz73lANE5xzxMGQAMHcWNj591r+KKjC0D+tBYEz3Jw7rpN+XJWCmzc/b1SEiMgLe
 0pe2+YV7WA8PTxsyMOjx2ixGzRVHtLDgsc/4gnJh4gbf8kZy+4lE0QnhXLTOrTbtoo2F
 Aw6fxIhe9xtEJlmLLto0e55Bar3f2g0LwWpsOYPUHHV60fHn9I7sZ941j2ZTa77ADz2J
 bCEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpIY9cPb6KH6Y5s8e6879wAouRz/rMXgH9KxxPf/4eHi9LnylPILr1TiL1GXjGZ2WYocI7rnVP5pCAFA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxTGH3VFm0Q3ogDC0aKIzMcfsCDUaeNJUlqwL4e7pDl3av9zGhd
 N6GXWsZQgIjIftZ/5g7XLUkzh6Ctg8n5GLpriqSQoPMsxltIFOJH7gDSzHnLyYtAM00=
X-Gm-Gg: ASbGnct2JqY2o1PRpLv3uccStHoOCrZweObVIRwQmUtLrg2vDvl483KawsDSv34QG3p
 f5V4rzb0E3hGEmjogI9CpeCges77TUKZx+JIcHuMhBr9q77omqJUj5KBLwnGvfk9O2YoTRxDG8u
 5YaQyIqIcShz8nWjhbmZqpLFjMjYqFP0LWDqSSofXAVAOZhq9gxRYk0gBvhHhQZE43ICDSsRBqM
 ZdCRJAhFQyQVROFdGEQztRdy+9uOcaBm/J1XP+8LCH7xKZFT1p+HRbUTw7D6GEy9bIK0D5Z1EPc
 S8016vsDmvkkO499f8mDT8KDaPQtnugoVHCLNJwjihQzyhBIwNYGXVA0MzdOzDw6SdhLysv/OqX
 7kLtDxN1WgjJBr39zod0C90DUZEAxfTS4GpF4RZyrUzfnw3eBTX5FUX55RD9tT7hnaFKhOtzKFg
 ==
X-Google-Smtp-Source: AGHT+IEYyrBIrogkMQ3xVs6oCJsz6+b5u5hitXq0HuUBGcvkXrEFn3Yf8t0jmhLEmQ4TxVA9MpI9eA==
X-Received: by 2002:a05:600c:c8d:b0:46e:3c29:ce9d with SMTP id
 5b1f17b1804b1-46fce362f77mr79718925e9.32.1760538752292; 
 Wed, 15 Oct 2025 07:32:32 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:fed:4601:4b30:fdb5:8c7d:59b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-470ff15ef28sm43185915e9.5.2025.10.15.07.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:32:31 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Wed, 15 Oct 2025 15:32:10 +0100
MIME-Version: 1.0
Message-Id: <20251015-clk_ops-v1-5-5f80f827407e@linaro.org>
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
Subject: [Uboot-stm32] [PATCH 05/24] clk: ccf: Remove negative error returns
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
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index b8c2e8d531b91f986995d15669620feff936e617..eb3b58edd2669cdff0f72ee9daad083d063c4dd8 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -84,7 +84,7 @@ ulong ccf_clk_get_rate(struct clk *clk)
 	int err = clk_get_by_id(clk->id, &c);
 
 	if (err)
-		return err;
+		return 0;
 	return clk_get_rate(c);
 }
 

-- 
2.47.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
