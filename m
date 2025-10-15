Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6CEBDF144
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 16:33:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53E59C5663A;
	Wed, 15 Oct 2025 14:33:10 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F33A0C5663A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 14:33:08 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-46e2e363118so56298795e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760538788; x=1761143588;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4DlBlKpxAI+PPChFoLT58sI+sD4cz43gntE98De/JHE=;
 b=lDQL9qgMqsu3g1eVm4x4WfmalbRRxZ3k3t9P9kFSKIUw6NYIR8JK4kCmMwOdDw2Ot0
 z8Cgm3k287/FjTVFf3gyvJNW6nhAa0GXUQWDDlttgboThiY+mEmlEqxwOkFoLqlmq8cv
 8oQxywtsPKQTFSoVaT74Vg4ZPsZOYbbzSpkzuKl2MR1GUHw8gGaz6IOP3zQL1WbDJVnf
 1PjSEUSLT6TrkrrcZOIs9eXkV5xj51HrsqQkkkj+R9JFhwvaLX7t8IoT8hnD2H3rrisz
 0Hb3fF6sX9UIAlYKa9n4Kq75rYX8dfLxoYVIBbxgNVPnilkjWuF14QbNhHhAEX3OEVct
 kxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760538788; x=1761143588;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4DlBlKpxAI+PPChFoLT58sI+sD4cz43gntE98De/JHE=;
 b=Nc98tVY99b70FD3uNA50G4xMoArpRa6322iIzUdapgLGEhtyqs29ccTdycwo0VJjYz
 Q0p4bb3Ylb4A/96UwDlK2X9NTtOAH1IhXRUH+PnBwsKLhMFPOb6fDTYF5dFCMwQTm3KM
 Nlh7RjbpO6QmSkMpJ7SGXnxI/Sp2L4/ZtgHoca2Z/0rmDkd7FQW13aInol1RmHvNRILY
 eU5wBR/XKfIy5lcck7nLxbvuqs685WXgeW5BWIYWyopdeakznxjFymQOPm8F2t8rkrYU
 ztjxhkt053VMsGqr5hfV4LluTiAib5sNBrb4eI3pQXdXYeWYyOepXS8WpEDIZLF9ZVAv
 ZhUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCDlUi0TMfAZwPMKLXPt0U5w7CbdoqAWMOQvgQotvID+X75aij5ceBwidzjF9TtAeLLAYh8oQT/Twz7Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzH87OsoVoDPWDO5FnR7yNE+c409S+TWJKI0dRXjJenDvv57+PT
 SeBexfb1Mev1Z8PWcGpOuS6fsIERbwDRBTHECYpPuWxTt8VNhK9/Z6nwmBOqYiXOSWo=
X-Gm-Gg: ASbGncseSeRU35QmHB84OSEz7+5KrWI1FWTmHRyr7A+MDCz1xey7v+xpHcfsFNCwolQ
 rdYgx1hcWcBtpj9T6N/i6vZlmtr7HSWu+aQtzXkdsQ7HUTbAHmyyLODtdSDplWHeUAFR0BpgN8r
 LoXRsdXsdjaVVOlMqJAtIikSfsgq19lG6Wv79MEchzhMKGdwWm9pN+5UzUnTkowysAtGcnJ/KUI
 rJOwjOt0hyh7IYxpscV/yMfy+6IjzXv7vJfOUEsUl1zsG8hDx7g7QsRXJocpLtPJl15dw0qKCU4
 tNvIKhVL0gIZ6zR6waak1/QBrPzRWKRwLDgnyQq+kgXD4j2y0Q4ie3AfibjClAn7KfyKa5UV1rW
 PFqO7VfhiK/sErZSHqcUELRoItREOCQt7wUCZ8KUYsKKocDO526peQWQjw2LIsa/Pstz6g58uYW
 tHOpaMtOuvOm9d1k9OmeA=
X-Google-Smtp-Source: AGHT+IGGoNhcuuBnqzdOS8d1serI7LBP8ZtrY43uHHsw2cJDzVWs6n2CpX0JLNFJQ7Pf6GLL4B2fyg==
X-Received: by 2002:a05:600d:42a4:b0:46f:b327:31ef with SMTP id
 5b1f17b1804b1-46fb327388emr111447735e9.12.1760538788353; 
 Wed, 15 Oct 2025 07:33:08 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:fed:4601:4b30:fdb5:8c7d:59b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-470ff15ef28sm43185915e9.5.2025.10.15.07.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:33:07 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Wed, 15 Oct 2025 15:32:29 +0100
MIME-Version: 1.0
Message-Id: <20251015-clk_ops-v1-24-5f80f827407e@linaro.org>
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
Subject: [Uboot-stm32] [PATCH 24/24] clk: x86: Remove negative error returns
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
 drivers/clk/intel/clk_intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/intel/clk_intel.c b/drivers/clk/intel/clk_intel.c
index a677a7caac7c84e5576a8b228e8ce4493a2e92b3..b5f3e800431314f4c2617133c1afad99dac35787 100644
--- a/drivers/clk/intel/clk_intel.c
+++ b/drivers/clk/intel/clk_intel.c
@@ -15,7 +15,7 @@ static ulong intel_clk_get_rate(struct clk *clk)
 		/* Hard-coded to 133MHz on current platforms */
 		return 133333333;
 	default:
-		return -ENODEV;
+		return 0;
 	}
 }
 

-- 
2.47.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
