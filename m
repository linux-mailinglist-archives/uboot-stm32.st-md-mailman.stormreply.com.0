Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1803BDF11C
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 16:32:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95650C5663B;
	Wed, 15 Oct 2025 14:32:50 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B60AC5663B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:32:50 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-47108104bcbso5358155e9.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760538769; x=1761143569;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bV/e8/t/Q2+spodtqDGG7TeDuDfPmijfIksYHrPyn9U=;
 b=M4GIt+fSQfA2lSCsQ0IJkrqb6IT20+UlCfdivooYorAMcoP1QiFr7gxKm7xsd2wa6+
 rC4P9YrVfZeu/3t2U/AKygEa/AZ5mnuzuQWKXZM3SRtsjPro9tVNMTtvlUzDtdrFoWrN
 JAP8S/ZSMmqRA5uM0oTNalUJQUvqsfmLCN9nLi+0d2JpA9XrwqNgA0511VeA+J7nY7PS
 JYzpSQoDxbbzeuMQbPyN0SdzHlEH9keWkVHoxyOpOMHS+KCWlz1XG9T+LcXGSSud2E8Q
 2+LSwlzODdzehe0CpA4wC/zSbubkDChftpAjDJmwxb/S/WAF7A1/ySzZg5xYxofFbf/E
 3VSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760538769; x=1761143569;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bV/e8/t/Q2+spodtqDGG7TeDuDfPmijfIksYHrPyn9U=;
 b=O9ONPbnH56GDPH0u/t2ifUK/+V3TyVwHjpUUREXuUQKTTRsFwb7MylCDMYwQHdB7QK
 Oq6UfX7JTrTvsVYqYpab/15jusJKBhVU5DaAPE+s4BIcB6q6RunwXq/F5qDhKYqiz0Gj
 2RADgsSKtNELR8ApPqayByYMZsC4VugzqNIwmrXQobEWDmuPTZmMQD/XrQA3GmiCoAym
 cyr+ifRmNt9QBD6wB6xxxnbqnKiug9R1qGHsNZLarW35V7KnWNuEfD5hqI8qwNXyPp06
 XZKWRsU2sABu5aeNnZ8kkwmLKEsp0mwvgjQf28fbKWbQbRYd17VCvMQ5bsZ0BW4TXd22
 CkAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVho2aNU7WltM6aMkv9i73RyhUdvFIq1IjhdXOtLC01B3KM20rNNtRiabPekRf1SE3yWXwNVxdAdFT4dA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx4dJ3nurTSQI36eqJ4GbiePtUUwQHkwcQ1kIG8P4/o0nBy6faC
 pe4dshi4GNlB771ZyW4OZ2/H/EO+vqwOoDYtVVDBqSl1m0H3KVikqqsJBhb5l3TXXIY=
X-Gm-Gg: ASbGncvRUnr3dMW6mOGwux8NRI4nQpwEU3aTykz1VNGwl1Dp0Wvs9ZhO6tZ6xobI1Yz
 ohnBcY1OEX8LinhxQ3l0fRZ0/tmSwtCM+ewanjsUM0TLMsv5RnFISDhmg28Jfb+Yjz+6BGs9I6J
 2dMAnYxR0bonvYC6sXALkdvQVVqYPy62myORin0JDatwkDMJVtt8k1HHmFw4xgujuueW1iHBW0H
 ge9+r1iXPrCwupgJ/LMXb51o7es19icoaQL6FQbpOG/l6YmtLDyWnmU4M9lMGG9a4WcGNogQdlf
 variOqLWZbu5jryCMBOeySqXw5IkF139krJ3nw2EO4zqMHizuNKzMDn7++G5kSrXCiQC6P06erm
 IIU5mUgUruhtzONPuWznvJQPBGmdG/aVXXGZIpjZPi8GdNwStw12ZrLsTyGZcaJYly0o7M5kC+A
 ==
X-Google-Smtp-Source: AGHT+IEdXqJ0ecDo7rFbfmDvnja6s23sdrsv131WYpUK2dXyZgikEBrPhQmktvo9H2vA2YUew3DXSg==
X-Received: by 2002:a05:600c:c110:b0:46f:b42e:e3a0 with SMTP id
 5b1f17b1804b1-46fb42ee4d2mr116739385e9.41.1760538769348; 
 Wed, 15 Oct 2025 07:32:49 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:fed:4601:4b30:fdb5:8c7d:59b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-470ff15ef28sm43185915e9.5.2025.10.15.07.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:32:48 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Wed, 15 Oct 2025 15:32:19 +0100
MIME-Version: 1.0
Message-Id: <20251015-clk_ops-v1-14-5f80f827407e@linaro.org>
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
Subject: [Uboot-stm32] [PATCH 14/24] clk: nuvoton: Remove negative error
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
 drivers/clk/nuvoton/clk_npcm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/nuvoton/clk_npcm.c b/drivers/clk/nuvoton/clk_npcm.c
index 18cb9cddbf38f4f68f9d035079ff147a4409878e..304c5f2ca07ba3c3e285494ca07330e572b4cac7 100644
--- a/drivers/clk/nuvoton/clk_npcm.c
+++ b/drivers/clk/nuvoton/clk_npcm.c
@@ -177,11 +177,11 @@ static ulong npcm_clk_get_fout(struct clk *clk)
 
 	parent_rate = npcm_clk_get_fin(clk);
 	if (!parent_rate)
-		return -EINVAL;
+		return 0;
 
 	div = npcm_clk_get_div(clk);
 	if (!div)
-		return -EINVAL;
+		return 0;
 
 	debug("fout of clk%lu = (%lu / %u)\n", clk->id, parent_rate, div);
 	return (parent_rate / div);
@@ -199,12 +199,12 @@ static ulong npcm_clk_get_pll_fout(struct clk *clk)
 
 	pll = npcm_clk_pll_get(priv->clk_data, clk->id);
 	if (!pll)
-		return -ENODEV;
+		return 0;
 
 	parent.id = pll->parent_id;
 	ret = clk_request(clk->dev, &parent);
 	if (ret)
-		return ret;
+		return 0;
 
 	parent_rate = clk_get_rate(&parent);
 
@@ -236,7 +236,7 @@ static ulong npcm_clk_get_rate(struct clk *clk)
 		if (!ret)
 			return clk_get_rate(&refclk);
 		else
-			return ret;
+			return 0;
 	}
 
 	if (clk->id >= clk_data->pll0_id &&

-- 
2.47.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
