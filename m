Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4B3870788
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Mar 2024 17:51:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01047C6DD65;
	Mon,  4 Mar 2024 16:51:27 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BB25C6DD65
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Mar 2024 16:51:25 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2d094bc2244so68150981fa.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Mar 2024 08:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709571084; x=1710175884;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QvvyV+P0EezZFXls1zXO6rUAq10WCCfFgf0U4kdH6Ss=;
 b=wfF35j1u+DdTOpTDhPnSgZLyIkmAdldKmPcb0F9q+CE/5VJs+82Io+M0yOxXEk5uxV
 1aAT9xXpQB93bVvvpKiYvN1XqaGvPFJ5d/yyJfESBI8cgwq9JXSqtQ3FBfPWxR0D9bWS
 FCtk0UqoAIFb9yiqlEzp/m0jyvvT1TlJiRvHFucttnd4RvsRptgKXZeAW7EhjftznmHW
 9HxKvnLM/oRWQpAFyCVlDDuF2dtNWMxZsJIeFZGUwrikS7iSIj64wPeWmpTP3KKtHJYR
 xR6weY3ZcrGqWe7RKZCjJUll/TN7ozK7h19gf7vBcZkGtpDCpQRsOctQ3vXCQlCNdHB7
 JKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709571084; x=1710175884;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QvvyV+P0EezZFXls1zXO6rUAq10WCCfFgf0U4kdH6Ss=;
 b=YvA24aQFqFDyymbJHhR413Ka4T6SwE4yVcezMVSlAEdStcdc6ofxRMwPdodTXIadeO
 6U1ClSYk5K/J7Qm4gxrncArR0pHpb+01aNKT6f52r/GONeT66LoHugZcWNKPW1+/NPwV
 zvCRMqs3xRHmEe1T4+ifps+PjISVZPJSysvcrLu1VMDKyMnCTA14/i/7janGTggWmLeU
 zfaQvym1gR3oAL/H9M91tOaubMf/Vp4pCpAvKElZrZh4YkZBYpLTjGIKhNZyQB2ZstZU
 kd18DeHQguG18/WYel5yVLw6X2llkidvZDi3tvBU2KPhTKftcdG9LwnK2QJ7vh28mJim
 Z6pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI9lakctD6Yjsr7WOsI7DFiiv6SL6UAtQGRQBs2qMgilPRP7epjc8BGg77JmNjXtmPPVnoZrP8hQoOw9ZduVeswTieA1lIJ9tqgPUAommgL90g20giiiZS
X-Gm-Message-State: AOJu0YyP7CT/hAI3jSTHmAJXRT4lwRYJxjoeuA2o7idvzPoZiFY0ffZC
 c12N/4zqg+TB5UW1VVuwuvyCjI3m/C01NBFBi3ScLaE9Hp6UnH//UbfrziIPINc=
X-Google-Smtp-Source: AGHT+IFlpwuL9ZJV39SefRETIBLSPcGMcXxxWxY9ftJPocMlXX4ASbrAWpwi8Ge/PZb17PWBPJfShg==
X-Received: by 2002:a05:651c:211d:b0:2d3:b502:3ff0 with SMTP id
 a29-20020a05651c211d00b002d3b5023ff0mr3168599ljq.0.1709571084187; 
 Mon, 04 Mar 2024 08:51:24 -0800 (PST)
Received: from lion.localdomain (host-92-17-96-232.as13285.net. [92.17.96.232])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0a5500b00412cb0961fasm10598517wmq.6.2024.03.04.08.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 08:51:23 -0800 (PST)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Mon, 04 Mar 2024 16:51:09 +0000
MIME-Version: 1.0
Message-Id: <20240304-b4-upstream-dt-headers-v1-1-b7ff41925f92@linaro.org>
References: <20240304-b4-upstream-dt-headers-v1-0-b7ff41925f92@linaro.org>
In-Reply-To: <20240304-b4-upstream-dt-headers-v1-0-b7ff41925f92@linaro.org>
To: Tom Rini <trini@konsulko.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Sumit Garg <sumit.garg@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Patrick Delaunay <patrick.delaunay@foss.st.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Simon Glass <sjg@chromium.org>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, 
 Kever Yang <kever.yang@rock-chips.com>, Lukasz Majewski <lukma@denx.de>, 
 Sean Anderson <seanga2@gmail.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Matthias Brugger <mbrugger@suse.com>, Peter Robinson <pbrobinson@gmail.com>, 
 Joe Hershberger <joe.hershberger@ni.com>, 
 Ramon Fried <rfried.dev@gmail.com>, Thierry Reding <treding@nvidia.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, Michal Simek <michal.simek@amd.com>, 
 Paul Barker <paul.barker.ct@bp.renesas.com>, 
 Weijie Gao <weijie.gao@mediatek.com>, 
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>, 
 Ryder Lee <ryder.lee@mediatek.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Eugen Hristev <eugen.hristev@collabora.com>, Rick Chen <rick@andestech.com>, 
 Leo <ycliang@andestech.com>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, 
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Dai Okamura <okamura.dai@socionext.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=71156;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=HOlz3pWHVJ3prZK0mnEGOa5j7Goa6P9XVDKh03DC30I=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhtSnf9i8mdRnr76Q61X/NHPv/KSXbsp/Ksp4HFoKl6rHH
 v1zyvFbRykLgyAHg6yYIov4iWWWTWsv22tsX3ABZg4rE8gQBi5OAZjI6zZGhtX+P+ZMKjFsnTdh
 ppxhZYBTuYBfv/bh831bFZ5ejXjGso3hf+yNO6IerilPew34P/cmOdz+bf9H4PrOIzdEFtczHws
 rKQYA
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 uboot-snps-arc@synopsys.com, Caleb Connolly <caleb.connolly@linaro.org>,
 u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH RFC 01/26] qcom: drop clock dt-binding headers
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

Drop in favour of dts/upstream. This is just the clock headers.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 include/dt-bindings/clock/qcom,camcc-sdm845.h    | 116 --------
 include/dt-bindings/clock/qcom,dispcc-sdm845.h   |  56 ----
 include/dt-bindings/clock/qcom,gcc-ipq4019.h     | 169 -----------
 include/dt-bindings/clock/qcom,gcc-msm8916.h     | 179 -----------
 include/dt-bindings/clock/qcom,gcc-msm8996.h     | 362 -----------------------
 include/dt-bindings/clock/qcom,gcc-qcs404.h      | 180 -----------
 include/dt-bindings/clock/qcom,gcc-sdm845.h      | 246 ---------------
 include/dt-bindings/clock/qcom,gpucc-sdm845.h    |  24 --
 include/dt-bindings/clock/qcom,lpass-sdm845.h    |  15 -
 include/dt-bindings/clock/qcom,mmcc-msm8996.h    | 295 ------------------
 include/dt-bindings/clock/qcom,rpmcc.h           | 174 -----------
 include/dt-bindings/clock/qcom,rpmh.h            |  37 ---
 include/dt-bindings/clock/qcom,turingcc-qcs404.h |  15 -
 include/dt-bindings/clock/qcom,videocc-sdm845.h  |  35 ---
 14 files changed, 1903 deletions(-)

diff --git a/include/dt-bindings/clock/qcom,camcc-sdm845.h b/include/dt-bindings/clock/qcom,camcc-sdm845.h
deleted file mode 100644
index 4f7a2d2320bf..000000000000
--- a/include/dt-bindings/clock/qcom,camcc-sdm845.h
+++ /dev/null
@@ -1,116 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (c) 2018, The Linux Foundation. All rights reserved.
- */
-
-#ifndef _DT_BINDINGS_CLK_SDM_CAM_CC_SDM845_H
-#define _DT_BINDINGS_CLK_SDM_CAM_CC_SDM845_H
-
-/* CAM_CC clock registers */
-#define CAM_CC_BPS_AHB_CLK				0
-#define CAM_CC_BPS_AREG_CLK				1
-#define CAM_CC_BPS_AXI_CLK				2
-#define CAM_CC_BPS_CLK					3
-#define CAM_CC_BPS_CLK_SRC				4
-#define CAM_CC_CAMNOC_ATB_CLK				5
-#define CAM_CC_CAMNOC_AXI_CLK				6
-#define CAM_CC_CCI_CLK					7
-#define CAM_CC_CCI_CLK_SRC				8
-#define CAM_CC_CPAS_AHB_CLK				9
-#define CAM_CC_CPHY_RX_CLK_SRC				10
-#define CAM_CC_CSI0PHYTIMER_CLK				11
-#define CAM_CC_CSI0PHYTIMER_CLK_SRC			12
-#define CAM_CC_CSI1PHYTIMER_CLK				13
-#define CAM_CC_CSI1PHYTIMER_CLK_SRC			14
-#define CAM_CC_CSI2PHYTIMER_CLK				15
-#define CAM_CC_CSI2PHYTIMER_CLK_SRC			16
-#define CAM_CC_CSI3PHYTIMER_CLK				17
-#define CAM_CC_CSI3PHYTIMER_CLK_SRC			18
-#define CAM_CC_CSIPHY0_CLK				19
-#define CAM_CC_CSIPHY1_CLK				20
-#define CAM_CC_CSIPHY2_CLK				21
-#define CAM_CC_CSIPHY3_CLK				22
-#define CAM_CC_FAST_AHB_CLK_SRC				23
-#define CAM_CC_FD_CORE_CLK				24
-#define CAM_CC_FD_CORE_CLK_SRC				25
-#define CAM_CC_FD_CORE_UAR_CLK				26
-#define CAM_CC_ICP_APB_CLK				27
-#define CAM_CC_ICP_ATB_CLK				28
-#define CAM_CC_ICP_CLK					29
-#define CAM_CC_ICP_CLK_SRC				30
-#define CAM_CC_ICP_CTI_CLK				31
-#define CAM_CC_ICP_TS_CLK				32
-#define CAM_CC_IFE_0_AXI_CLK				33
-#define CAM_CC_IFE_0_CLK				34
-#define CAM_CC_IFE_0_CLK_SRC				35
-#define CAM_CC_IFE_0_CPHY_RX_CLK			36
-#define CAM_CC_IFE_0_CSID_CLK				37
-#define CAM_CC_IFE_0_CSID_CLK_SRC			38
-#define CAM_CC_IFE_0_DSP_CLK				39
-#define CAM_CC_IFE_1_AXI_CLK				40
-#define CAM_CC_IFE_1_CLK				41
-#define CAM_CC_IFE_1_CLK_SRC				42
-#define CAM_CC_IFE_1_CPHY_RX_CLK			43
-#define CAM_CC_IFE_1_CSID_CLK				44
-#define CAM_CC_IFE_1_CSID_CLK_SRC			45
-#define CAM_CC_IFE_1_DSP_CLK				46
-#define CAM_CC_IFE_LITE_CLK				47
-#define CAM_CC_IFE_LITE_CLK_SRC				48
-#define CAM_CC_IFE_LITE_CPHY_RX_CLK			49
-#define CAM_CC_IFE_LITE_CSID_CLK			50
-#define CAM_CC_IFE_LITE_CSID_CLK_SRC			51
-#define CAM_CC_IPE_0_AHB_CLK				52
-#define CAM_CC_IPE_0_AREG_CLK				53
-#define CAM_CC_IPE_0_AXI_CLK				54
-#define CAM_CC_IPE_0_CLK				55
-#define CAM_CC_IPE_0_CLK_SRC				56
-#define CAM_CC_IPE_1_AHB_CLK				57
-#define CAM_CC_IPE_1_AREG_CLK				58
-#define CAM_CC_IPE_1_AXI_CLK				59
-#define CAM_CC_IPE_1_CLK				60
-#define CAM_CC_IPE_1_CLK_SRC				61
-#define CAM_CC_JPEG_CLK					62
-#define CAM_CC_JPEG_CLK_SRC				63
-#define CAM_CC_LRME_CLK					64
-#define CAM_CC_LRME_CLK_SRC				65
-#define CAM_CC_MCLK0_CLK				66
-#define CAM_CC_MCLK0_CLK_SRC				67
-#define CAM_CC_MCLK1_CLK				68
-#define CAM_CC_MCLK1_CLK_SRC				69
-#define CAM_CC_MCLK2_CLK				70
-#define CAM_CC_MCLK2_CLK_SRC				71
-#define CAM_CC_MCLK3_CLK				72
-#define CAM_CC_MCLK3_CLK_SRC				73
-#define CAM_CC_PLL0					74
-#define CAM_CC_PLL0_OUT_EVEN				75
-#define CAM_CC_PLL1					76
-#define CAM_CC_PLL1_OUT_EVEN				77
-#define CAM_CC_PLL2					78
-#define CAM_CC_PLL2_OUT_EVEN				79
-#define CAM_CC_PLL3					80
-#define CAM_CC_PLL3_OUT_EVEN				81
-#define CAM_CC_SLOW_AHB_CLK_SRC				82
-#define CAM_CC_SOC_AHB_CLK				83
-#define CAM_CC_SYS_TMR_CLK				84
-
-/* CAM_CC Resets */
-#define TITAN_CAM_CC_CCI_BCR				0
-#define TITAN_CAM_CC_CPAS_BCR				1
-#define TITAN_CAM_CC_CSI0PHY_BCR			2
-#define TITAN_CAM_CC_CSI1PHY_BCR			3
-#define TITAN_CAM_CC_CSI2PHY_BCR			4
-#define TITAN_CAM_CC_MCLK0_BCR				5
-#define TITAN_CAM_CC_MCLK1_BCR				6
-#define TITAN_CAM_CC_MCLK2_BCR				7
-#define TITAN_CAM_CC_MCLK3_BCR				8
-#define TITAN_CAM_CC_TITAN_TOP_BCR			9
-
-/* CAM_CC GDSCRs */
-#define BPS_GDSC					0
-#define IPE_0_GDSC					1
-#define IPE_1_GDSC					2
-#define IFE_0_GDSC					3
-#define IFE_1_GDSC					4
-#define TITAN_TOP_GDSC					5
-
-#endif
diff --git a/include/dt-bindings/clock/qcom,dispcc-sdm845.h b/include/dt-bindings/clock/qcom,dispcc-sdm845.h
deleted file mode 100644
index 4016fd1d5b46..000000000000
--- a/include/dt-bindings/clock/qcom,dispcc-sdm845.h
+++ /dev/null
@@ -1,56 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
- */
-
-#ifndef _DT_BINDINGS_CLK_SDM_DISP_CC_SDM845_H
-#define _DT_BINDINGS_CLK_SDM_DISP_CC_SDM845_H
-
-/* DISP_CC clock registers */
-#define DISP_CC_MDSS_AHB_CLK					0
-#define DISP_CC_MDSS_AXI_CLK					1
-#define DISP_CC_MDSS_BYTE0_CLK					2
-#define DISP_CC_MDSS_BYTE0_CLK_SRC				3
-#define DISP_CC_MDSS_BYTE0_INTF_CLK				4
-#define DISP_CC_MDSS_BYTE1_CLK					5
-#define DISP_CC_MDSS_BYTE1_CLK_SRC				6
-#define DISP_CC_MDSS_BYTE1_INTF_CLK				7
-#define DISP_CC_MDSS_ESC0_CLK					8
-#define DISP_CC_MDSS_ESC0_CLK_SRC				9
-#define DISP_CC_MDSS_ESC1_CLK					10
-#define DISP_CC_MDSS_ESC1_CLK_SRC				11
-#define DISP_CC_MDSS_MDP_CLK					12
-#define DISP_CC_MDSS_MDP_CLK_SRC				13
-#define DISP_CC_MDSS_MDP_LUT_CLK				14
-#define DISP_CC_MDSS_PCLK0_CLK					15
-#define DISP_CC_MDSS_PCLK0_CLK_SRC				16
-#define DISP_CC_MDSS_PCLK1_CLK					17
-#define DISP_CC_MDSS_PCLK1_CLK_SRC				18
-#define DISP_CC_MDSS_ROT_CLK					19
-#define DISP_CC_MDSS_ROT_CLK_SRC				20
-#define DISP_CC_MDSS_RSCC_AHB_CLK				21
-#define DISP_CC_MDSS_RSCC_VSYNC_CLK				22
-#define DISP_CC_MDSS_VSYNC_CLK					23
-#define DISP_CC_MDSS_VSYNC_CLK_SRC				24
-#define DISP_CC_PLL0						25
-#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				26
-#define DISP_CC_MDSS_BYTE1_DIV_CLK_SRC				27
-#define DISP_CC_MDSS_DP_AUX_CLK					28
-#define DISP_CC_MDSS_DP_AUX_CLK_SRC				29
-#define DISP_CC_MDSS_DP_CRYPTO_CLK				30
-#define DISP_CC_MDSS_DP_CRYPTO_CLK_SRC				31
-#define DISP_CC_MDSS_DP_LINK_CLK				32
-#define DISP_CC_MDSS_DP_LINK_CLK_SRC				33
-#define DISP_CC_MDSS_DP_LINK_INTF_CLK				34
-#define DISP_CC_MDSS_DP_PIXEL1_CLK				35
-#define DISP_CC_MDSS_DP_PIXEL1_CLK_SRC				36
-#define DISP_CC_MDSS_DP_PIXEL_CLK				37
-#define DISP_CC_MDSS_DP_PIXEL_CLK_SRC				38
-
-/* DISP_CC Reset */
-#define DISP_CC_MDSS_RSCC_BCR					0
-
-/* DISP_CC GDSCR */
-#define MDSS_GDSC						0
-
-#endif
diff --git a/include/dt-bindings/clock/qcom,gcc-ipq4019.h b/include/dt-bindings/clock/qcom,gcc-ipq4019.h
deleted file mode 100644
index 7e8a7be6dcda..000000000000
--- a/include/dt-bindings/clock/qcom,gcc-ipq4019.h
+++ /dev/null
@@ -1,169 +0,0 @@
-/* Copyright (c) 2015 The Linux Foundation. All rights reserved.
- *
- * Permission to use, copy, modify, and/or distribute this software for any
- * purpose with or without fee is hereby granted, provided that the above
- * copyright notice and this permission notice appear in all copies.
- *
- * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
- * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
- * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
- * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
- * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
- * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
- * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
- *
- */
-#ifndef __QCOM_CLK_IPQ4019_H__
-#define __QCOM_CLK_IPQ4019_H__
-
-#define GCC_DUMMY_CLK					0
-#define AUDIO_CLK_SRC					1
-#define BLSP1_QUP1_I2C_APPS_CLK_SRC			2
-#define BLSP1_QUP1_SPI_APPS_CLK_SRC			3
-#define BLSP1_QUP2_I2C_APPS_CLK_SRC			4
-#define BLSP1_QUP2_SPI_APPS_CLK_SRC			5
-#define BLSP1_UART1_APPS_CLK_SRC			6
-#define BLSP1_UART2_APPS_CLK_SRC			7
-#define GCC_USB3_MOCK_UTMI_CLK_SRC			8
-#define GCC_APPS_CLK_SRC				9
-#define GCC_APPS_AHB_CLK_SRC				10
-#define GP1_CLK_SRC					11
-#define GP2_CLK_SRC					12
-#define GP3_CLK_SRC					13
-#define SDCC1_APPS_CLK_SRC				14
-#define FEPHY_125M_DLY_CLK_SRC				15
-#define WCSS2G_CLK_SRC					16
-#define WCSS5G_CLK_SRC					17
-#define GCC_APSS_AHB_CLK				18
-#define GCC_AUDIO_AHB_CLK				19
-#define GCC_AUDIO_PWM_CLK				20
-#define GCC_BLSP1_AHB_CLK				21
-#define GCC_BLSP1_QUP1_I2C_APPS_CLK			22
-#define GCC_BLSP1_QUP1_SPI_APPS_CLK			23
-#define GCC_BLSP1_QUP2_I2C_APPS_CLK			24
-#define GCC_BLSP1_QUP2_SPI_APPS_CLK			25
-#define GCC_BLSP1_UART1_APPS_CLK			26
-#define GCC_BLSP1_UART2_APPS_CLK			27
-#define GCC_DCD_XO_CLK					28
-#define GCC_GP1_CLK					29
-#define GCC_GP2_CLK					30
-#define GCC_GP3_CLK					31
-#define GCC_BOOT_ROM_AHB_CLK				32
-#define GCC_CRYPTO_AHB_CLK				33
-#define GCC_CRYPTO_AXI_CLK				34
-#define GCC_CRYPTO_CLK					35
-#define GCC_ESS_CLK					36
-#define GCC_IMEM_AXI_CLK				37
-#define GCC_IMEM_CFG_AHB_CLK				38
-#define GCC_PCIE_AHB_CLK				39
-#define GCC_PCIE_AXI_M_CLK				40
-#define GCC_PCIE_AXI_S_CLK				41
-#define GCC_PCNOC_AHB_CLK				42
-#define GCC_PRNG_AHB_CLK				43
-#define GCC_QPIC_AHB_CLK				44
-#define GCC_QPIC_CLK					45
-#define GCC_SDCC1_AHB_CLK				46
-#define GCC_SDCC1_APPS_CLK				47
-#define GCC_SNOC_PCNOC_AHB_CLK				48
-#define GCC_SYS_NOC_125M_CLK				49
-#define GCC_SYS_NOC_AXI_CLK				50
-#define GCC_TCSR_AHB_CLK				51
-#define GCC_TLMM_AHB_CLK				52
-#define GCC_USB2_MASTER_CLK				53
-#define GCC_USB2_SLEEP_CLK				54
-#define GCC_USB2_MOCK_UTMI_CLK				55
-#define GCC_USB3_MASTER_CLK				56
-#define GCC_USB3_SLEEP_CLK				57
-#define GCC_USB3_MOCK_UTMI_CLK				58
-#define GCC_WCSS2G_CLK					59
-#define GCC_WCSS2G_REF_CLK				60
-#define GCC_WCSS2G_RTC_CLK				61
-#define GCC_WCSS5G_CLK					62
-#define GCC_WCSS5G_REF_CLK				63
-#define GCC_WCSS5G_RTC_CLK				64
-#define GCC_APSS_DDRPLL_VCO				65
-#define GCC_SDCC_PLLDIV_CLK				66
-#define GCC_FEPLL_VCO					67
-#define GCC_FEPLL125_CLK				68
-#define GCC_FEPLL125DLY_CLK				69
-#define GCC_FEPLL200_CLK				70
-#define GCC_FEPLL500_CLK				71
-#define GCC_FEPLL_WCSS2G_CLK				72
-#define GCC_FEPLL_WCSS5G_CLK				73
-#define GCC_APSS_CPU_PLLDIV_CLK				74
-#define GCC_PCNOC_AHB_CLK_SRC				75
-
-#define WIFI0_CPU_INIT_RESET				0
-#define WIFI0_RADIO_SRIF_RESET				1
-#define WIFI0_RADIO_WARM_RESET				2
-#define WIFI0_RADIO_COLD_RESET				3
-#define WIFI0_CORE_WARM_RESET				4
-#define WIFI0_CORE_COLD_RESET				5
-#define WIFI1_CPU_INIT_RESET				6
-#define WIFI1_RADIO_SRIF_RESET				7
-#define WIFI1_RADIO_WARM_RESET				8
-#define WIFI1_RADIO_COLD_RESET				9
-#define WIFI1_CORE_WARM_RESET				10
-#define WIFI1_CORE_COLD_RESET				11
-#define USB3_UNIPHY_PHY_ARES				12
-#define USB3_HSPHY_POR_ARES				13
-#define USB3_HSPHY_S_ARES				14
-#define USB2_HSPHY_POR_ARES				15
-#define USB2_HSPHY_S_ARES				16
-#define PCIE_PHY_AHB_ARES				17
-#define PCIE_AHB_ARES					18
-#define PCIE_PWR_ARES					19
-#define PCIE_PIPE_STICKY_ARES				20
-#define PCIE_AXI_M_STICKY_ARES				21
-#define PCIE_PHY_ARES					22
-#define PCIE_PARF_XPU_ARES				23
-#define PCIE_AXI_S_XPU_ARES				24
-#define PCIE_AXI_M_VMIDMT_ARES				25
-#define PCIE_PIPE_ARES					26
-#define PCIE_AXI_S_ARES					27
-#define PCIE_AXI_M_ARES					28
-#define ESS_RESET					29
-#define GCC_BLSP1_BCR					30
-#define GCC_BLSP1_QUP1_BCR				31
-#define GCC_BLSP1_UART1_BCR				32
-#define GCC_BLSP1_QUP2_BCR				33
-#define GCC_BLSP1_UART2_BCR				34
-#define GCC_BIMC_BCR					35
-#define GCC_TLMM_BCR					36
-#define GCC_IMEM_BCR					37
-#define GCC_ESS_BCR					38
-#define GCC_PRNG_BCR					39
-#define GCC_BOOT_ROM_BCR				40
-#define GCC_CRYPTO_BCR					41
-#define GCC_SDCC1_BCR					42
-#define GCC_SEC_CTRL_BCR				43
-#define GCC_AUDIO_BCR					44
-#define GCC_QPIC_BCR					45
-#define GCC_PCIE_BCR					46
-#define GCC_USB2_BCR					47
-#define GCC_USB2_PHY_BCR				48
-#define GCC_USB3_BCR					49
-#define GCC_USB3_PHY_BCR				50
-#define GCC_SYSTEM_NOC_BCR				51
-#define GCC_PCNOC_BCR					52
-#define GCC_DCD_BCR					53
-#define GCC_SNOC_BUS_TIMEOUT0_BCR			54
-#define GCC_SNOC_BUS_TIMEOUT1_BCR			55
-#define GCC_SNOC_BUS_TIMEOUT2_BCR			56
-#define GCC_SNOC_BUS_TIMEOUT3_BCR			57
-#define GCC_PCNOC_BUS_TIMEOUT0_BCR			58
-#define GCC_PCNOC_BUS_TIMEOUT1_BCR			59
-#define GCC_PCNOC_BUS_TIMEOUT2_BCR			60
-#define GCC_PCNOC_BUS_TIMEOUT3_BCR			61
-#define GCC_PCNOC_BUS_TIMEOUT4_BCR			62
-#define GCC_PCNOC_BUS_TIMEOUT5_BCR			63
-#define GCC_PCNOC_BUS_TIMEOUT6_BCR			64
-#define GCC_PCNOC_BUS_TIMEOUT7_BCR			65
-#define GCC_PCNOC_BUS_TIMEOUT8_BCR			66
-#define GCC_PCNOC_BUS_TIMEOUT9_BCR			67
-#define GCC_TCSR_BCR					68
-#define GCC_QDSS_BCR					69
-#define GCC_MPM_BCR					70
-#define GCC_SPDM_BCR					71
-
-#endif
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8916.h b/include/dt-bindings/clock/qcom,gcc-msm8916.h
deleted file mode 100644
index 563034406184..000000000000
--- a/include/dt-bindings/clock/qcom,gcc-msm8916.h
+++ /dev/null
@@ -1,179 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright 2015 Linaro Limited
- */
-
-#ifndef _DT_BINDINGS_CLK_MSM_GCC_8916_H
-#define _DT_BINDINGS_CLK_MSM_GCC_8916_H
-
-#define GPLL0					0
-#define GPLL0_VOTE				1
-#define BIMC_PLL				2
-#define BIMC_PLL_VOTE				3
-#define GPLL1					4
-#define GPLL1_VOTE				5
-#define GPLL2					6
-#define GPLL2_VOTE				7
-#define PCNOC_BFDCD_CLK_SRC			8
-#define SYSTEM_NOC_BFDCD_CLK_SRC		9
-#define CAMSS_AHB_CLK_SRC			10
-#define APSS_AHB_CLK_SRC			11
-#define CSI0_CLK_SRC				12
-#define CSI1_CLK_SRC				13
-#define GFX3D_CLK_SRC				14
-#define VFE0_CLK_SRC				15
-#define BLSP1_QUP1_I2C_APPS_CLK_SRC		16
-#define BLSP1_QUP1_SPI_APPS_CLK_SRC		17
-#define BLSP1_QUP2_I2C_APPS_CLK_SRC		18
-#define BLSP1_QUP2_SPI_APPS_CLK_SRC		19
-#define BLSP1_QUP3_I2C_APPS_CLK_SRC		20
-#define BLSP1_QUP3_SPI_APPS_CLK_SRC		21
-#define BLSP1_QUP4_I2C_APPS_CLK_SRC		22
-#define BLSP1_QUP4_SPI_APPS_CLK_SRC		23
-#define BLSP1_QUP5_I2C_APPS_CLK_SRC		24
-#define BLSP1_QUP5_SPI_APPS_CLK_SRC		25
-#define BLSP1_QUP6_I2C_APPS_CLK_SRC		26
-#define BLSP1_QUP6_SPI_APPS_CLK_SRC		27
-#define BLSP1_UART1_APPS_CLK_SRC		28
-#define BLSP1_UART2_APPS_CLK_SRC		29
-#define CCI_CLK_SRC				30
-#define CAMSS_GP0_CLK_SRC			31
-#define CAMSS_GP1_CLK_SRC			32
-#define JPEG0_CLK_SRC				33
-#define MCLK0_CLK_SRC				34
-#define MCLK1_CLK_SRC				35
-#define CSI0PHYTIMER_CLK_SRC			36
-#define CSI1PHYTIMER_CLK_SRC			37
-#define CPP_CLK_SRC				38
-#define CRYPTO_CLK_SRC				39
-#define GP1_CLK_SRC				40
-#define GP2_CLK_SRC				41
-#define GP3_CLK_SRC				42
-#define BYTE0_CLK_SRC				43
-#define ESC0_CLK_SRC				44
-#define MDP_CLK_SRC				45
-#define PCLK0_CLK_SRC				46
-#define VSYNC_CLK_SRC				47
-#define PDM2_CLK_SRC				48
-#define SDCC1_APPS_CLK_SRC			49
-#define SDCC2_APPS_CLK_SRC			50
-#define APSS_TCU_CLK_SRC			51
-#define USB_HS_SYSTEM_CLK_SRC			52
-#define VCODEC0_CLK_SRC				53
-#define GCC_BLSP1_AHB_CLK			54
-#define GCC_BLSP1_SLEEP_CLK			55
-#define GCC_BLSP1_QUP1_I2C_APPS_CLK		56
-#define GCC_BLSP1_QUP1_SPI_APPS_CLK		57
-#define GCC_BLSP1_QUP2_I2C_APPS_CLK		58
-#define GCC_BLSP1_QUP2_SPI_APPS_CLK		59
-#define GCC_BLSP1_QUP3_I2C_APPS_CLK		60
-#define GCC_BLSP1_QUP3_SPI_APPS_CLK		61
-#define GCC_BLSP1_QUP4_I2C_APPS_CLK		62
-#define GCC_BLSP1_QUP4_SPI_APPS_CLK		63
-#define GCC_BLSP1_QUP5_I2C_APPS_CLK		64
-#define GCC_BLSP1_QUP5_SPI_APPS_CLK		65
-#define GCC_BLSP1_QUP6_I2C_APPS_CLK		66
-#define GCC_BLSP1_QUP6_SPI_APPS_CLK		67
-#define GCC_BLSP1_UART1_APPS_CLK		68
-#define GCC_BLSP1_UART2_APPS_CLK		69
-#define GCC_BOOT_ROM_AHB_CLK			70
-#define GCC_CAMSS_CCI_AHB_CLK			71
-#define GCC_CAMSS_CCI_CLK			72
-#define GCC_CAMSS_CSI0_AHB_CLK			73
-#define GCC_CAMSS_CSI0_CLK			74
-#define GCC_CAMSS_CSI0PHY_CLK			75
-#define GCC_CAMSS_CSI0PIX_CLK			76
-#define GCC_CAMSS_CSI0RDI_CLK			77
-#define GCC_CAMSS_CSI1_AHB_CLK			78
-#define GCC_CAMSS_CSI1_CLK			79
-#define GCC_CAMSS_CSI1PHY_CLK			80
-#define GCC_CAMSS_CSI1PIX_CLK			81
-#define GCC_CAMSS_CSI1RDI_CLK			82
-#define GCC_CAMSS_CSI_VFE0_CLK			83
-#define GCC_CAMSS_GP0_CLK			84
-#define GCC_CAMSS_GP1_CLK			85
-#define GCC_CAMSS_ISPIF_AHB_CLK			86
-#define GCC_CAMSS_JPEG0_CLK			87
-#define GCC_CAMSS_JPEG_AHB_CLK			88
-#define GCC_CAMSS_JPEG_AXI_CLK			89
-#define GCC_CAMSS_MCLK0_CLK			90
-#define GCC_CAMSS_MCLK1_CLK			91
-#define GCC_CAMSS_MICRO_AHB_CLK			92
-#define GCC_CAMSS_CSI0PHYTIMER_CLK		93
-#define GCC_CAMSS_CSI1PHYTIMER_CLK		94
-#define GCC_CAMSS_AHB_CLK			95
-#define GCC_CAMSS_TOP_AHB_CLK			96
-#define GCC_CAMSS_CPP_AHB_CLK			97
-#define GCC_CAMSS_CPP_CLK			98
-#define GCC_CAMSS_VFE0_CLK			99
-#define GCC_CAMSS_VFE_AHB_CLK			100
-#define GCC_CAMSS_VFE_AXI_CLK			101
-#define GCC_CRYPTO_AHB_CLK			102
-#define GCC_CRYPTO_AXI_CLK			103
-#define GCC_CRYPTO_CLK				104
-#define GCC_OXILI_GMEM_CLK			105
-#define GCC_GP1_CLK				106
-#define GCC_GP2_CLK				107
-#define GCC_GP3_CLK				108
-#define GCC_MDSS_AHB_CLK			109
-#define GCC_MDSS_AXI_CLK			110
-#define GCC_MDSS_BYTE0_CLK			111
-#define GCC_MDSS_ESC0_CLK			112
-#define GCC_MDSS_MDP_CLK			113
-#define GCC_MDSS_PCLK0_CLK			114
-#define GCC_MDSS_VSYNC_CLK			115
-#define GCC_MSS_CFG_AHB_CLK			116
-#define GCC_OXILI_AHB_CLK			117
-#define GCC_OXILI_GFX3D_CLK			118
-#define GCC_PDM2_CLK				119
-#define GCC_PDM_AHB_CLK				120
-#define GCC_PRNG_AHB_CLK			121
-#define GCC_SDCC1_AHB_CLK			122
-#define GCC_SDCC1_APPS_CLK			123
-#define GCC_SDCC2_AHB_CLK			124
-#define GCC_SDCC2_APPS_CLK			125
-#define GCC_GTCU_AHB_CLK			126
-#define GCC_JPEG_TBU_CLK			127
-#define GCC_MDP_TBU_CLK				128
-#define GCC_SMMU_CFG_CLK			129
-#define GCC_VENUS_TBU_CLK			130
-#define GCC_VFE_TBU_CLK				131
-#define GCC_USB2A_PHY_SLEEP_CLK			132
-#define GCC_USB_HS_AHB_CLK			133
-#define GCC_USB_HS_SYSTEM_CLK			134
-#define GCC_VENUS0_AHB_CLK			135
-#define GCC_VENUS0_AXI_CLK			136
-#define GCC_VENUS0_VCODEC0_CLK			137
-#define BIMC_DDR_CLK_SRC			138
-#define GCC_APSS_TCU_CLK			139
-#define GCC_GFX_TCU_CLK				140
-#define BIMC_GPU_CLK_SRC			141
-#define GCC_BIMC_GFX_CLK			142
-#define GCC_BIMC_GPU_CLK			143
-#define ULTAUDIO_LPAIF_PRI_I2S_CLK_SRC		144
-#define ULTAUDIO_LPAIF_SEC_I2S_CLK_SRC		145
-#define ULTAUDIO_LPAIF_AUX_I2S_CLK_SRC		146
-#define ULTAUDIO_XO_CLK_SRC			147
-#define ULTAUDIO_AHBFABRIC_CLK_SRC		148
-#define CODEC_DIGCODEC_CLK_SRC			149
-#define GCC_ULTAUDIO_PCNOC_MPORT_CLK		150
-#define GCC_ULTAUDIO_PCNOC_SWAY_CLK		151
-#define GCC_ULTAUDIO_AVSYNC_XO_CLK		152
-#define GCC_ULTAUDIO_STC_XO_CLK			153
-#define GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK	154
-#define GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_LPM_CLK	155
-#define GCC_ULTAUDIO_LPAIF_PRI_I2S_CLK		156
-#define GCC_ULTAUDIO_LPAIF_SEC_I2S_CLK		157
-#define GCC_ULTAUDIO_LPAIF_AUX_I2S_CLK		158
-#define GCC_CODEC_DIGCODEC_CLK			159
-#define GCC_MSS_Q6_BIMC_AXI_CLK			160
-
-/* Indexes for GDSCs */
-#define BIMC_GDSC				0
-#define VENUS_GDSC				1
-#define MDSS_GDSC				2
-#define JPEG_GDSC				3
-#define VFE_GDSC				4
-#define OXILI_GDSC				5
-
-#endif
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8996.h b/include/dt-bindings/clock/qcom,gcc-msm8996.h
deleted file mode 100644
index ddfd6fd73081..000000000000
--- a/include/dt-bindings/clock/qcom,gcc-msm8996.h
+++ /dev/null
@@ -1,362 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2015, The Linux Foundation. All rights reserved.
- */
-
-#ifndef _DT_BINDINGS_CLK_MSM_GCC_8996_H
-#define _DT_BINDINGS_CLK_MSM_GCC_8996_H
-
-#define GPLL0_EARLY						0
-#define GPLL0							1
-#define GPLL1_EARLY						2
-#define GPLL1							3
-#define GPLL2_EARLY						4
-#define GPLL2							5
-#define GPLL3_EARLY						6
-#define GPLL3							7
-#define GPLL4_EARLY						8
-#define GPLL4							9
-#define SYSTEM_NOC_CLK_SRC					10
-/* U-Boot: KConfig check in CI erroneously picks this up, it's unused
- * anyway so comment it out for now
- */
-//#define CONFIG _NOC_CLK_SRC					11
-#define PERIPH_NOC_CLK_SRC					12
-#define MMSS_BIMC_GFX_CLK_SRC					13
-#define USB30_MASTER_CLK_SRC					14
-#define USB30_MOCK_UTMI_CLK_SRC					15
-#define USB3_PHY_AUX_CLK_SRC					16
-#define USB20_MASTER_CLK_SRC					17
-#define USB20_MOCK_UTMI_CLK_SRC					18
-#define SDCC1_APPS_CLK_SRC					19
-#define SDCC1_ICE_CORE_CLK_SRC					20
-#define SDCC2_APPS_CLK_SRC					21
-#define SDCC3_APPS_CLK_SRC					22
-#define SDCC4_APPS_CLK_SRC					23
-#define BLSP1_QUP1_SPI_APPS_CLK_SRC				24
-#define BLSP1_QUP1_I2C_APPS_CLK_SRC				25
-#define BLSP1_UART1_APPS_CLK_SRC				26
-#define BLSP1_QUP2_SPI_APPS_CLK_SRC				27
-#define BLSP1_QUP2_I2C_APPS_CLK_SRC				28
-#define BLSP1_UART2_APPS_CLK_SRC				29
-#define BLSP1_QUP3_SPI_APPS_CLK_SRC				30
-#define BLSP1_QUP3_I2C_APPS_CLK_SRC				31
-#define BLSP1_UART3_APPS_CLK_SRC				32
-#define BLSP1_QUP4_SPI_APPS_CLK_SRC				33
-#define BLSP1_QUP4_I2C_APPS_CLK_SRC				34
-#define BLSP1_UART4_APPS_CLK_SRC				35
-#define BLSP1_QUP5_SPI_APPS_CLK_SRC				36
-#define BLSP1_QUP5_I2C_APPS_CLK_SRC				37
-#define BLSP1_UART5_APPS_CLK_SRC				38
-#define BLSP1_QUP6_SPI_APPS_CLK_SRC				39
-#define BLSP1_QUP6_I2C_APPS_CLK_SRC				40
-#define BLSP1_UART6_APPS_CLK_SRC				41
-#define BLSP2_QUP1_SPI_APPS_CLK_SRC				42
-#define BLSP2_QUP1_I2C_APPS_CLK_SRC				43
-#define BLSP2_UART1_APPS_CLK_SRC				44
-#define BLSP2_QUP2_SPI_APPS_CLK_SRC				45
-#define BLSP2_QUP2_I2C_APPS_CLK_SRC				46
-#define BLSP2_UART2_APPS_CLK_SRC				47
-#define BLSP2_QUP3_SPI_APPS_CLK_SRC				48
-#define BLSP2_QUP3_I2C_APPS_CLK_SRC				49
-#define BLSP2_UART3_APPS_CLK_SRC				50
-#define BLSP2_QUP4_SPI_APPS_CLK_SRC				51
-#define BLSP2_QUP4_I2C_APPS_CLK_SRC				52
-#define BLSP2_UART4_APPS_CLK_SRC				53
-#define BLSP2_QUP5_SPI_APPS_CLK_SRC				54
-#define BLSP2_QUP5_I2C_APPS_CLK_SRC				55
-#define BLSP2_UART5_APPS_CLK_SRC				56
-#define BLSP2_QUP6_SPI_APPS_CLK_SRC				57
-#define BLSP2_QUP6_I2C_APPS_CLK_SRC				58
-#define BLSP2_UART6_APPS_CLK_SRC				59
-#define PDM2_CLK_SRC						60
-#define TSIF_REF_CLK_SRC					61
-#define CE1_CLK_SRC						62
-#define GCC_SLEEP_CLK_SRC					63
-#define BIMC_CLK_SRC						64
-#define HMSS_AHB_CLK_SRC					65
-#define BIMC_HMSS_AXI_CLK_SRC					66
-#define HMSS_RBCPR_CLK_SRC					67
-#define HMSS_GPLL0_CLK_SRC					68
-#define GP1_CLK_SRC						69
-#define GP2_CLK_SRC						70
-#define GP3_CLK_SRC						71
-#define PCIE_AUX_CLK_SRC					72
-#define UFS_AXI_CLK_SRC						73
-#define UFS_ICE_CORE_CLK_SRC					74
-#define QSPI_SER_CLK_SRC					75
-#define GCC_SYS_NOC_AXI_CLK					76
-#define GCC_SYS_NOC_HMSS_AHB_CLK				77
-#define GCC_SNOC_CNOC_AHB_CLK					78
-#define GCC_SNOC_PNOC_AHB_CLK					79
-#define GCC_SYS_NOC_AT_CLK					80
-#define GCC_SYS_NOC_USB3_AXI_CLK				81
-#define GCC_SYS_NOC_UFS_AXI_CLK					82
-#define GCC_CFG_NOC_AHB_CLK					83
-#define GCC_PERIPH_NOC_AHB_CLK					84
-#define GCC_PERIPH_NOC_USB20_AHB_CLK				85
-#define GCC_TIC_CLK						86
-#define GCC_IMEM_AXI_CLK					87
-#define GCC_MMSS_SYS_NOC_AXI_CLK				88
-#define GCC_MMSS_NOC_CFG_AHB_CLK				89
-#define GCC_MMSS_BIMC_GFX_CLK					90
-#define GCC_USB30_MASTER_CLK					91
-#define GCC_USB30_SLEEP_CLK					92
-#define GCC_USB30_MOCK_UTMI_CLK					93
-#define GCC_USB3_PHY_AUX_CLK					94
-#define GCC_USB3_PHY_PIPE_CLK					95
-#define GCC_USB20_MASTER_CLK					96
-#define GCC_USB20_SLEEP_CLK					97
-#define GCC_USB20_MOCK_UTMI_CLK					98
-#define GCC_USB_PHY_CFG_AHB2PHY_CLK				99
-#define GCC_SDCC1_APPS_CLK					100
-#define GCC_SDCC1_AHB_CLK					101
-#define GCC_SDCC1_ICE_CORE_CLK					102
-#define GCC_SDCC2_APPS_CLK					103
-#define GCC_SDCC2_AHB_CLK					104
-#define GCC_SDCC3_APPS_CLK					105
-#define GCC_SDCC3_AHB_CLK					106
-#define GCC_SDCC4_APPS_CLK					107
-#define GCC_SDCC4_AHB_CLK					108
-#define GCC_BLSP1_AHB_CLK					109
-#define GCC_BLSP1_SLEEP_CLK					110
-#define GCC_BLSP1_QUP1_SPI_APPS_CLK				111
-#define GCC_BLSP1_QUP1_I2C_APPS_CLK				112
-#define GCC_BLSP1_UART1_APPS_CLK				113
-#define GCC_BLSP1_QUP2_SPI_APPS_CLK				114
-#define GCC_BLSP1_QUP2_I2C_APPS_CLK				115
-#define GCC_BLSP1_UART2_APPS_CLK				116
-#define GCC_BLSP1_QUP3_SPI_APPS_CLK				117
-#define GCC_BLSP1_QUP3_I2C_APPS_CLK				118
-#define GCC_BLSP1_UART3_APPS_CLK				119
-#define GCC_BLSP1_QUP4_SPI_APPS_CLK				120
-#define GCC_BLSP1_QUP4_I2C_APPS_CLK				121
-#define GCC_BLSP1_UART4_APPS_CLK				122
-#define GCC_BLSP1_QUP5_SPI_APPS_CLK				123
-#define GCC_BLSP1_QUP5_I2C_APPS_CLK				124
-#define GCC_BLSP1_UART5_APPS_CLK				125
-#define GCC_BLSP1_QUP6_SPI_APPS_CLK				126
-#define GCC_BLSP1_QUP6_I2C_APPS_CLK				127
-#define GCC_BLSP1_UART6_APPS_CLK				128
-#define GCC_BLSP2_AHB_CLK					129
-#define GCC_BLSP2_SLEEP_CLK					130
-#define GCC_BLSP2_QUP1_SPI_APPS_CLK				131
-#define GCC_BLSP2_QUP1_I2C_APPS_CLK				132
-#define GCC_BLSP2_UART1_APPS_CLK				133
-#define GCC_BLSP2_QUP2_SPI_APPS_CLK				134
-#define GCC_BLSP2_QUP2_I2C_APPS_CLK				135
-#define GCC_BLSP2_UART2_APPS_CLK				136
-#define GCC_BLSP2_QUP3_SPI_APPS_CLK				137
-#define GCC_BLSP2_QUP3_I2C_APPS_CLK				138
-#define GCC_BLSP2_UART3_APPS_CLK				139
-#define GCC_BLSP2_QUP4_SPI_APPS_CLK				140
-#define GCC_BLSP2_QUP4_I2C_APPS_CLK				141
-#define GCC_BLSP2_UART4_APPS_CLK				142
-#define GCC_BLSP2_QUP5_SPI_APPS_CLK				143
-#define GCC_BLSP2_QUP5_I2C_APPS_CLK				144
-#define GCC_BLSP2_UART5_APPS_CLK				145
-#define GCC_BLSP2_QUP6_SPI_APPS_CLK				146
-#define GCC_BLSP2_QUP6_I2C_APPS_CLK				147
-#define GCC_BLSP2_UART6_APPS_CLK				148
-#define GCC_PDM_AHB_CLK						149
-#define GCC_PDM_XO4_CLK						150
-#define GCC_PDM2_CLK						151
-#define GCC_PRNG_AHB_CLK					152
-#define GCC_TSIF_AHB_CLK					153
-#define GCC_TSIF_REF_CLK					154
-#define GCC_TSIF_INACTIVITY_TIMERS_CLK				155
-#define GCC_TCSR_AHB_CLK					156
-#define GCC_BOOT_ROM_AHB_CLK					157
-#define GCC_MSG_RAM_AHB_CLK					158
-#define GCC_TLMM_AHB_CLK					159
-#define GCC_TLMM_CLK						160
-#define GCC_MPM_AHB_CLK						161
-#define GCC_SPMI_SER_CLK					162
-#define GCC_SPMI_CNOC_AHB_CLK					163
-#define GCC_CE1_CLK						164
-#define GCC_CE1_AXI_CLK						165
-#define GCC_CE1_AHB_CLK						166
-#define GCC_BIMC_HMSS_AXI_CLK					167
-#define GCC_BIMC_GFX_CLK					168
-#define GCC_HMSS_AHB_CLK					169
-#define GCC_HMSS_SLV_AXI_CLK					170
-#define GCC_HMSS_MSTR_AXI_CLK					171
-#define GCC_HMSS_RBCPR_CLK					172
-#define GCC_GP1_CLK						173
-#define GCC_GP2_CLK						174
-#define GCC_GP3_CLK						175
-#define GCC_PCIE_0_SLV_AXI_CLK					176
-#define GCC_PCIE_0_MSTR_AXI_CLK					177
-#define GCC_PCIE_0_CFG_AHB_CLK					178
-#define GCC_PCIE_0_AUX_CLK					179
-#define GCC_PCIE_0_PIPE_CLK					180
-#define GCC_PCIE_1_SLV_AXI_CLK					181
-#define GCC_PCIE_1_MSTR_AXI_CLK					182
-#define GCC_PCIE_1_CFG_AHB_CLK					183
-#define GCC_PCIE_1_AUX_CLK					184
-#define GCC_PCIE_1_PIPE_CLK					185
-#define GCC_PCIE_2_SLV_AXI_CLK					186
-#define GCC_PCIE_2_MSTR_AXI_CLK					187
-#define GCC_PCIE_2_CFG_AHB_CLK					188
-#define GCC_PCIE_2_AUX_CLK					189
-#define GCC_PCIE_2_PIPE_CLK					190
-#define GCC_PCIE_PHY_CFG_AHB_CLK				191
-#define GCC_PCIE_PHY_AUX_CLK					192
-#define GCC_UFS_AXI_CLK						193
-#define GCC_UFS_AHB_CLK						194
-#define GCC_UFS_TX_CFG_CLK					195
-#define GCC_UFS_RX_CFG_CLK					196
-#define GCC_UFS_TX_SYMBOL_0_CLK					197
-#define GCC_UFS_RX_SYMBOL_0_CLK					198
-#define GCC_UFS_RX_SYMBOL_1_CLK					199
-#define GCC_UFS_UNIPRO_CORE_CLK					200
-#define GCC_UFS_ICE_CORE_CLK					201
-#define GCC_UFS_SYS_CLK_CORE_CLK				202
-#define GCC_UFS_TX_SYMBOL_CLK_CORE_CLK				203
-#define GCC_AGGRE0_SNOC_AXI_CLK					204
-#define GCC_AGGRE0_CNOC_AHB_CLK					205
-#define GCC_SMMU_AGGRE0_AXI_CLK					206
-#define GCC_SMMU_AGGRE0_AHB_CLK					207
-#define GCC_AGGRE1_PNOC_AHB_CLK					208
-#define GCC_AGGRE2_UFS_AXI_CLK					209
-#define GCC_AGGRE2_USB3_AXI_CLK					210
-#define GCC_QSPI_AHB_CLK					211
-#define GCC_QSPI_SER_CLK					212
-#define GCC_USB3_CLKREF_CLK					213
-#define GCC_HDMI_CLKREF_CLK					214
-#define GCC_UFS_CLKREF_CLK					215
-#define GCC_PCIE_CLKREF_CLK					216
-#define GCC_RX2_USB2_CLKREF_CLK					217
-#define GCC_RX1_USB2_CLKREF_CLK					218
-#define GCC_HLOS1_VOTE_LPASS_CORE_SMMU_CLK			219
-#define GCC_HLOS1_VOTE_LPASS_ADSP_SMMU_CLK			220
-#define GCC_EDP_CLKREF_CLK					221
-#define GCC_MSS_CFG_AHB_CLK					222
-#define GCC_MSS_Q6_BIMC_AXI_CLK					223
-#define GCC_MSS_SNOC_AXI_CLK					224
-#define GCC_MSS_MNOC_BIMC_AXI_CLK				225
-#define GCC_DCC_AHB_CLK						226
-#define GCC_AGGRE0_NOC_MPU_CFG_AHB_CLK				227
-#define GCC_MMSS_GPLL0_DIV_CLK					228
-#define GCC_MSS_GPLL0_DIV_CLK					229
-
-#define GCC_SYSTEM_NOC_BCR					0
-#define GCC_CONFIG_NOC_BCR					1
-#define GCC_PERIPH_NOC_BCR					2
-#define GCC_IMEM_BCR						3
-#define GCC_MMSS_BCR						4
-#define GCC_PIMEM_BCR						5
-#define GCC_QDSS_BCR						6
-#define GCC_USB_30_BCR						7
-#define GCC_USB_20_BCR						8
-#define GCC_QUSB2PHY_PRIM_BCR					9
-#define GCC_QUSB2PHY_SEC_BCR					10
-#define GCC_USB_PHY_CFG_AHB2PHY_BCR				11
-#define GCC_SDCC1_BCR						12
-#define GCC_SDCC2_BCR						13
-#define GCC_SDCC3_BCR						14
-#define GCC_SDCC4_BCR						15
-#define GCC_BLSP1_BCR						16
-#define GCC_BLSP1_QUP1_BCR					17
-#define GCC_BLSP1_UART1_BCR					18
-#define GCC_BLSP1_QUP2_BCR					19
-#define GCC_BLSP1_UART2_BCR					20
-#define GCC_BLSP1_QUP3_BCR					21
-#define GCC_BLSP1_UART3_BCR					22
-#define GCC_BLSP1_QUP4_BCR					23
-#define GCC_BLSP1_UART4_BCR					24
-#define GCC_BLSP1_QUP5_BCR					25
-#define GCC_BLSP1_UART5_BCR					26
-#define GCC_BLSP1_QUP6_BCR					27
-#define GCC_BLSP1_UART6_BCR					28
-#define GCC_BLSP2_BCR						29
-#define GCC_BLSP2_QUP1_BCR					30
-#define GCC_BLSP2_UART1_BCR					31
-#define GCC_BLSP2_QUP2_BCR					32
-#define GCC_BLSP2_UART2_BCR					33
-#define GCC_BLSP2_QUP3_BCR					34
-#define GCC_BLSP2_UART3_BCR					35
-#define GCC_BLSP2_QUP4_BCR					36
-#define GCC_BLSP2_UART4_BCR					37
-#define GCC_BLSP2_QUP5_BCR					38
-#define GCC_BLSP2_UART5_BCR					39
-#define GCC_BLSP2_QUP6_BCR					40
-#define GCC_BLSP2_UART6_BCR					41
-#define GCC_PDM_BCR						42
-#define GCC_PRNG_BCR						43
-#define GCC_TSIF_BCR						44
-#define GCC_TCSR_BCR						45
-#define GCC_BOOT_ROM_BCR					46
-#define GCC_MSG_RAM_BCR						47
-#define GCC_TLMM_BCR						48
-#define GCC_MPM_BCR						49
-#define GCC_SEC_CTRL_BCR					50
-#define GCC_SPMI_BCR						51
-#define GCC_SPDM_BCR						52
-#define GCC_CE1_BCR						53
-#define GCC_BIMC_BCR						54
-#define GCC_SNOC_BUS_TIMEOUT0_BCR				55
-#define GCC_SNOC_BUS_TIMEOUT2_BCR				56
-#define GCC_SNOC_BUS_TIMEOUT1_BCR				57
-#define GCC_SNOC_BUS_TIMEOUT3_BCR				58
-#define GCC_SNOC_BUS_TIMEOUT_EXTREF_BCR				59
-#define GCC_PNOC_BUS_TIMEOUT0_BCR				60
-#define GCC_PNOC_BUS_TIMEOUT1_BCR				61
-#define GCC_PNOC_BUS_TIMEOUT2_BCR				62
-#define GCC_PNOC_BUS_TIMEOUT3_BCR				63
-#define GCC_PNOC_BUS_TIMEOUT4_BCR				64
-#define GCC_CNOC_BUS_TIMEOUT0_BCR				65
-#define GCC_CNOC_BUS_TIMEOUT1_BCR				66
-#define GCC_CNOC_BUS_TIMEOUT2_BCR				67
-#define GCC_CNOC_BUS_TIMEOUT3_BCR				68
-#define GCC_CNOC_BUS_TIMEOUT4_BCR				69
-#define GCC_CNOC_BUS_TIMEOUT5_BCR				70
-#define GCC_CNOC_BUS_TIMEOUT6_BCR				71
-#define GCC_CNOC_BUS_TIMEOUT7_BCR				72
-#define GCC_CNOC_BUS_TIMEOUT8_BCR				73
-#define GCC_CNOC_BUS_TIMEOUT9_BCR				74
-#define GCC_CNOC_BUS_TIMEOUT_EXTREF_BCR				75
-#define GCC_APB2JTAG_BCR					76
-#define GCC_RBCPR_CX_BCR					77
-#define GCC_RBCPR_MX_BCR					78
-#define GCC_PCIE_0_BCR						79
-#define GCC_PCIE_0_PHY_BCR					80
-#define GCC_PCIE_1_BCR						81
-#define GCC_PCIE_1_PHY_BCR					82
-#define GCC_PCIE_2_BCR						83
-#define GCC_PCIE_2_PHY_BCR					84
-#define GCC_PCIE_PHY_BCR					85
-#define GCC_DCD_BCR						86
-#define GCC_OBT_ODT_BCR						87
-#define GCC_UFS_BCR						88
-#define GCC_SSC_BCR						89
-#define GCC_VS_BCR						90
-#define GCC_AGGRE0_NOC_BCR					91
-#define GCC_AGGRE1_NOC_BCR					92
-#define GCC_AGGRE2_NOC_BCR					93
-#define GCC_DCC_BCR						94
-#define GCC_IPA_BCR						95
-#define GCC_QSPI_BCR						96
-#define GCC_SKL_BCR						97
-#define GCC_MSMPU_BCR						98
-#define GCC_MSS_Q6_BCR						99
-#define GCC_QREFS_VBG_CAL_BCR					100
-#define GCC_PCIE_PHY_COM_BCR					101
-#define GCC_PCIE_PHY_COM_NOCSR_BCR				102
-#define GCC_USB3_PHY_BCR					103
-#define GCC_USB3PHY_PHY_BCR					104
-#define GCC_MSS_RESTART						105
-
-
-/* Indexes for GDSCs */
-#define AGGRE0_NOC_GDSC			0
-#define HLOS1_VOTE_AGGRE0_NOC_GDSC	1
-#define HLOS1_VOTE_LPASS_ADSP_GDSC	2
-#define HLOS1_VOTE_LPASS_CORE_GDSC	3
-#define USB30_GDSC			4
-#define PCIE0_GDSC			5
-#define PCIE1_GDSC			6
-#define PCIE2_GDSC			7
-#define UFS_GDSC			8
-
-#endif
diff --git a/include/dt-bindings/clock/qcom,gcc-qcs404.h b/include/dt-bindings/clock/qcom,gcc-qcs404.h
deleted file mode 100644
index bc3051543347..000000000000
--- a/include/dt-bindings/clock/qcom,gcc-qcs404.h
+++ /dev/null
@@ -1,180 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2018, The Linux Foundation. All rights reserved.
- */
-
-#ifndef _DT_BINDINGS_CLK_QCOM_GCC_QCS404_H
-#define _DT_BINDINGS_CLK_QCOM_GCC_QCS404_H
-
-#define GCC_APSS_AHB_CLK_SRC				0
-#define GCC_BLSP1_QUP0_I2C_APPS_CLK_SRC			1
-#define GCC_BLSP1_QUP0_SPI_APPS_CLK_SRC			2
-#define GCC_BLSP1_QUP1_I2C_APPS_CLK_SRC			3
-#define GCC_BLSP1_QUP1_SPI_APPS_CLK_SRC			4
-#define GCC_BLSP1_QUP2_I2C_APPS_CLK_SRC			5
-#define GCC_BLSP1_QUP2_SPI_APPS_CLK_SRC			6
-#define GCC_BLSP1_QUP3_I2C_APPS_CLK_SRC			7
-#define GCC_BLSP1_QUP3_SPI_APPS_CLK_SRC			8
-#define GCC_BLSP1_QUP4_I2C_APPS_CLK_SRC			9
-#define GCC_BLSP1_QUP4_SPI_APPS_CLK_SRC			10
-#define GCC_BLSP1_UART0_APPS_CLK_SRC			11
-#define GCC_BLSP1_UART1_APPS_CLK_SRC			12
-#define GCC_BLSP1_UART2_APPS_CLK_SRC			13
-#define GCC_BLSP1_UART3_APPS_CLK_SRC			14
-#define GCC_BLSP2_QUP0_I2C_APPS_CLK_SRC			15
-#define GCC_BLSP2_QUP0_SPI_APPS_CLK_SRC			16
-#define GCC_BLSP2_UART0_APPS_CLK_SRC			17
-#define GCC_BYTE0_CLK_SRC				18
-#define GCC_EMAC_CLK_SRC				19
-#define GCC_EMAC_PTP_CLK_SRC				20
-#define GCC_ESC0_CLK_SRC				21
-#define GCC_APSS_AHB_CLK				22
-#define GCC_APSS_AXI_CLK				23
-#define GCC_BIMC_APSS_AXI_CLK				24
-#define GCC_BIMC_GFX_CLK				25
-#define GCC_BIMC_MDSS_CLK				26
-#define GCC_BLSP1_AHB_CLK				27
-#define GCC_BLSP1_QUP0_I2C_APPS_CLK			28
-#define GCC_BLSP1_QUP0_SPI_APPS_CLK			29
-#define GCC_BLSP1_QUP1_I2C_APPS_CLK			30
-#define GCC_BLSP1_QUP1_SPI_APPS_CLK			31
-#define GCC_BLSP1_QUP2_I2C_APPS_CLK			32
-#define GCC_BLSP1_QUP2_SPI_APPS_CLK			33
-#define GCC_BLSP1_QUP3_I2C_APPS_CLK			34
-#define GCC_BLSP1_QUP3_SPI_APPS_CLK			35
-#define GCC_BLSP1_QUP4_I2C_APPS_CLK			36
-#define GCC_BLSP1_QUP4_SPI_APPS_CLK			37
-#define GCC_BLSP1_UART0_APPS_CLK			38
-#define GCC_BLSP1_UART1_APPS_CLK			39
-#define GCC_BLSP1_UART2_APPS_CLK			40
-#define GCC_BLSP1_UART3_APPS_CLK			41
-#define GCC_BLSP2_AHB_CLK				42
-#define GCC_BLSP2_QUP0_I2C_APPS_CLK			43
-#define GCC_BLSP2_QUP0_SPI_APPS_CLK			44
-#define GCC_BLSP2_UART0_APPS_CLK			45
-#define GCC_BOOT_ROM_AHB_CLK				46
-#define GCC_DCC_CLK					47
-#define GCC_GENI_IR_H_CLK				48
-#define GCC_ETH_AXI_CLK					49
-#define GCC_ETH_PTP_CLK					50
-#define GCC_ETH_RGMII_CLK				51
-#define GCC_ETH_SLAVE_AHB_CLK				52
-#define GCC_GENI_IR_S_CLK				53
-#define GCC_GP1_CLK					54
-#define GCC_GP2_CLK					55
-#define GCC_GP3_CLK					56
-#define GCC_MDSS_AHB_CLK				57
-#define GCC_MDSS_AXI_CLK				58
-#define GCC_MDSS_BYTE0_CLK				59
-#define GCC_MDSS_ESC0_CLK				60
-#define GCC_MDSS_HDMI_APP_CLK				61
-#define GCC_MDSS_HDMI_PCLK_CLK				62
-#define GCC_MDSS_MDP_CLK				63
-#define GCC_MDSS_PCLK0_CLK				64
-#define GCC_MDSS_VSYNC_CLK				65
-#define GCC_OXILI_AHB_CLK				66
-#define GCC_OXILI_GFX3D_CLK				67
-#define GCC_PCIE_0_AUX_CLK				68
-#define GCC_PCIE_0_CFG_AHB_CLK				69
-#define GCC_PCIE_0_MSTR_AXI_CLK				70
-#define GCC_PCIE_0_PIPE_CLK				71
-#define GCC_PCIE_0_SLV_AXI_CLK				72
-#define GCC_PCNOC_USB2_CLK				73
-#define GCC_PCNOC_USB3_CLK				74
-#define GCC_PDM2_CLK					75
-#define GCC_PDM_AHB_CLK					76
-#define GCC_VSYNC_CLK_SRC				77
-#define GCC_PRNG_AHB_CLK				78
-#define GCC_PWM0_XO512_CLK				79
-#define GCC_PWM1_XO512_CLK				80
-#define GCC_PWM2_XO512_CLK				81
-#define GCC_SDCC1_AHB_CLK				82
-#define GCC_SDCC1_APPS_CLK				83
-#define GCC_SDCC1_ICE_CORE_CLK				84
-#define GCC_SDCC2_AHB_CLK				85
-#define GCC_SDCC2_APPS_CLK				86
-#define GCC_SYS_NOC_USB3_CLK				87
-#define GCC_USB20_MOCK_UTMI_CLK				88
-#define GCC_USB2A_PHY_SLEEP_CLK				89
-#define GCC_USB30_MASTER_CLK				90
-#define GCC_USB30_MOCK_UTMI_CLK				91
-#define GCC_USB30_SLEEP_CLK				92
-#define GCC_USB3_PHY_AUX_CLK				93
-#define GCC_USB3_PHY_PIPE_CLK				94
-#define GCC_USB_HS_PHY_CFG_AHB_CLK			95
-#define GCC_USB_HS_SYSTEM_CLK				96
-#define GCC_GFX3D_CLK_SRC				97
-#define GCC_GP1_CLK_SRC					98
-#define GCC_GP2_CLK_SRC					99
-#define GCC_GP3_CLK_SRC					100
-#define GCC_GPLL0_OUT_MAIN				101
-#define GCC_GPLL1_OUT_MAIN				102
-#define GCC_GPLL3_OUT_MAIN				103
-#define GCC_GPLL4_OUT_MAIN				104
-#define GCC_HDMI_APP_CLK_SRC				105
-#define GCC_HDMI_PCLK_CLK_SRC				106
-#define GCC_MDP_CLK_SRC					107
-#define GCC_PCIE_0_AUX_CLK_SRC				108
-#define GCC_PCIE_0_PIPE_CLK_SRC				109
-#define GCC_PCLK0_CLK_SRC				110
-#define GCC_PDM2_CLK_SRC				111
-#define GCC_SDCC1_APPS_CLK_SRC				112
-#define GCC_SDCC1_ICE_CORE_CLK_SRC			113
-#define GCC_SDCC2_APPS_CLK_SRC				114
-#define GCC_USB20_MOCK_UTMI_CLK_SRC			115
-#define GCC_USB30_MASTER_CLK_SRC			116
-#define GCC_USB30_MOCK_UTMI_CLK_SRC			117
-#define GCC_USB3_PHY_AUX_CLK_SRC			118
-#define GCC_USB_HS_SYSTEM_CLK_SRC			119
-#define GCC_GPLL0_AO_CLK_SRC				120
-#define GCC_USB_HS_INACTIVITY_TIMERS_CLK		122
-#define GCC_GPLL0_AO_OUT_MAIN				123
-#define GCC_GPLL0_SLEEP_CLK_SRC				124
-#define GCC_GPLL6					125
-#define GCC_GPLL6_OUT_AUX				126
-#define GCC_MDSS_MDP_VOTE_CLK				127
-#define GCC_MDSS_ROTATOR_VOTE_CLK			128
-#define GCC_BIMC_GPU_CLK				129
-#define GCC_GTCU_AHB_CLK				130
-#define GCC_GFX_TCU_CLK					131
-#define GCC_GFX_TBU_CLK					132
-#define GCC_SMMU_CFG_CLK				133
-#define GCC_APSS_TCU_CLK				134
-#define GCC_CRYPTO_AHB_CLK				135
-#define GCC_CRYPTO_AXI_CLK				136
-#define GCC_CRYPTO_CLK					137
-#define GCC_MDP_TBU_CLK					138
-#define GCC_QDSS_DAP_CLK				139
-#define GCC_DCC_XO_CLK					140
-#define GCC_WCSS_Q6_AHB_CLK				141
-#define GCC_WCSS_Q6_AXIM_CLK				142
-#define GCC_CDSP_CFG_AHB_CLK				143
-#define GCC_BIMC_CDSP_CLK				144
-#define GCC_CDSP_TBU_CLK				145
-#define GCC_CDSP_BIMC_CLK_SRC				146
-
-#define GCC_GENI_IR_BCR					0
-#define GCC_USB_HS_BCR					1
-#define GCC_USB2_HS_PHY_ONLY_BCR			2
-#define GCC_QUSB2_PHY_BCR				3
-#define GCC_USB_HS_PHY_CFG_AHB_BCR			4
-#define GCC_USB2A_PHY_BCR				5
-#define GCC_USB3_PHY_BCR				6
-#define GCC_USB_30_BCR					7
-#define GCC_USB3PHY_PHY_BCR				8
-#define GCC_PCIE_0_BCR					9
-#define GCC_PCIE_0_PHY_BCR				10
-#define GCC_PCIE_0_LINK_DOWN_BCR			11
-#define GCC_PCIEPHY_0_PHY_BCR				12
-#define GCC_EMAC_BCR					13
-#define GCC_CDSP_RESTART				14
-#define GCC_PCIE_0_AXI_MASTER_STICKY_ARES		15
-#define GCC_PCIE_0_AHB_ARES				16
-#define GCC_PCIE_0_AXI_SLAVE_ARES			17
-#define GCC_PCIE_0_AXI_MASTER_ARES			18
-#define GCC_PCIE_0_CORE_STICKY_ARES			19
-#define GCC_PCIE_0_SLEEP_ARES				20
-#define GCC_PCIE_0_PIPE_ARES				21
-#define GCC_WDSP_RESTART				22
-
-#endif
diff --git a/include/dt-bindings/clock/qcom,gcc-sdm845.h b/include/dt-bindings/clock/qcom,gcc-sdm845.h
deleted file mode 100644
index 968fa65b9c42..000000000000
--- a/include/dt-bindings/clock/qcom,gcc-sdm845.h
+++ /dev/null
@@ -1,246 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2018, The Linux Foundation. All rights reserved.
- */
-
-#ifndef _DT_BINDINGS_CLK_SDM_GCC_SDM845_H
-#define _DT_BINDINGS_CLK_SDM_GCC_SDM845_H
-
-/* GCC clock registers */
-#define GCC_AGGRE_NOC_PCIE_TBU_CLK				0
-#define GCC_AGGRE_UFS_CARD_AXI_CLK				1
-#define GCC_AGGRE_UFS_PHY_AXI_CLK				2
-#define GCC_AGGRE_USB3_PRIM_AXI_CLK				3
-#define GCC_AGGRE_USB3_SEC_AXI_CLK				4
-#define GCC_BOOT_ROM_AHB_CLK					5
-#define GCC_CAMERA_AHB_CLK					6
-#define GCC_CAMERA_AXI_CLK					7
-#define GCC_CAMERA_XO_CLK					8
-#define GCC_CE1_AHB_CLK						9
-#define GCC_CE1_AXI_CLK						10
-#define GCC_CE1_CLK						11
-#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				12
-#define GCC_CFG_NOC_USB3_SEC_AXI_CLK				13
-#define GCC_CPUSS_AHB_CLK					14
-#define GCC_CPUSS_AHB_CLK_SRC					15
-#define GCC_CPUSS_RBCPR_CLK					16
-#define GCC_CPUSS_RBCPR_CLK_SRC					17
-#define GCC_DDRSS_GPU_AXI_CLK					18
-#define GCC_DISP_AHB_CLK					19
-#define GCC_DISP_AXI_CLK					20
-#define GCC_DISP_GPLL0_CLK_SRC					21
-#define GCC_DISP_GPLL0_DIV_CLK_SRC				22
-#define GCC_DISP_XO_CLK						23
-#define GCC_GP1_CLK						24
-#define GCC_GP1_CLK_SRC						25
-#define GCC_GP2_CLK						26
-#define GCC_GP2_CLK_SRC						27
-#define GCC_GP3_CLK						28
-#define GCC_GP3_CLK_SRC						29
-#define GCC_GPU_CFG_AHB_CLK					30
-#define GCC_GPU_GPLL0_CLK_SRC					31
-#define GCC_GPU_GPLL0_DIV_CLK_SRC				32
-#define GCC_GPU_MEMNOC_GFX_CLK					33
-#define GCC_GPU_SNOC_DVM_GFX_CLK				34
-#define GCC_MSS_AXIS2_CLK					35
-#define GCC_MSS_CFG_AHB_CLK					36
-#define GCC_MSS_GPLL0_DIV_CLK_SRC				37
-#define GCC_MSS_MFAB_AXIS_CLK					38
-#define GCC_MSS_Q6_MEMNOC_AXI_CLK				39
-#define GCC_MSS_SNOC_AXI_CLK					40
-#define GCC_PCIE_0_AUX_CLK					41
-#define GCC_PCIE_0_AUX_CLK_SRC					42
-#define GCC_PCIE_0_CFG_AHB_CLK					43
-#define GCC_PCIE_0_CLKREF_CLK					44
-#define GCC_PCIE_0_MSTR_AXI_CLK					45
-#define GCC_PCIE_0_PIPE_CLK					46
-#define GCC_PCIE_0_SLV_AXI_CLK					47
-#define GCC_PCIE_0_SLV_Q2A_AXI_CLK				48
-#define GCC_PCIE_1_AUX_CLK					49
-#define GCC_PCIE_1_AUX_CLK_SRC					50
-#define GCC_PCIE_1_CFG_AHB_CLK					51
-#define GCC_PCIE_1_CLKREF_CLK					52
-#define GCC_PCIE_1_MSTR_AXI_CLK					53
-#define GCC_PCIE_1_PIPE_CLK					54
-#define GCC_PCIE_1_SLV_AXI_CLK					55
-#define GCC_PCIE_1_SLV_Q2A_AXI_CLK				56
-#define GCC_PCIE_PHY_AUX_CLK					57
-#define GCC_PCIE_PHY_REFGEN_CLK					58
-#define GCC_PCIE_PHY_REFGEN_CLK_SRC				59
-#define GCC_PDM2_CLK						60
-#define GCC_PDM2_CLK_SRC					61
-#define GCC_PDM_AHB_CLK						62
-#define GCC_PDM_XO4_CLK						63
-#define GCC_PRNG_AHB_CLK					64
-#define GCC_QMIP_CAMERA_AHB_CLK					65
-#define GCC_QMIP_DISP_AHB_CLK					66
-#define GCC_QMIP_VIDEO_AHB_CLK					67
-#define GCC_QUPV3_WRAP0_S0_CLK					68
-#define GCC_QUPV3_WRAP0_S0_CLK_SRC				69
-#define GCC_QUPV3_WRAP0_S1_CLK					70
-#define GCC_QUPV3_WRAP0_S1_CLK_SRC				71
-#define GCC_QUPV3_WRAP0_S2_CLK					72
-#define GCC_QUPV3_WRAP0_S2_CLK_SRC				73
-#define GCC_QUPV3_WRAP0_S3_CLK					74
-#define GCC_QUPV3_WRAP0_S3_CLK_SRC				75
-#define GCC_QUPV3_WRAP0_S4_CLK					76
-#define GCC_QUPV3_WRAP0_S4_CLK_SRC				77
-#define GCC_QUPV3_WRAP0_S5_CLK					78
-#define GCC_QUPV3_WRAP0_S5_CLK_SRC				79
-#define GCC_QUPV3_WRAP0_S6_CLK					80
-#define GCC_QUPV3_WRAP0_S6_CLK_SRC				81
-#define GCC_QUPV3_WRAP0_S7_CLK					82
-#define GCC_QUPV3_WRAP0_S7_CLK_SRC				83
-#define GCC_QUPV3_WRAP1_S0_CLK					84
-#define GCC_QUPV3_WRAP1_S0_CLK_SRC				85
-#define GCC_QUPV3_WRAP1_S1_CLK					86
-#define GCC_QUPV3_WRAP1_S1_CLK_SRC				87
-#define GCC_QUPV3_WRAP1_S2_CLK					88
-#define GCC_QUPV3_WRAP1_S2_CLK_SRC				89
-#define GCC_QUPV3_WRAP1_S3_CLK					90
-#define GCC_QUPV3_WRAP1_S3_CLK_SRC				91
-#define GCC_QUPV3_WRAP1_S4_CLK					92
-#define GCC_QUPV3_WRAP1_S4_CLK_SRC				93
-#define GCC_QUPV3_WRAP1_S5_CLK					94
-#define GCC_QUPV3_WRAP1_S5_CLK_SRC				95
-#define GCC_QUPV3_WRAP1_S6_CLK					96
-#define GCC_QUPV3_WRAP1_S6_CLK_SRC				97
-#define GCC_QUPV3_WRAP1_S7_CLK					98
-#define GCC_QUPV3_WRAP1_S7_CLK_SRC				99
-#define GCC_QUPV3_WRAP_0_M_AHB_CLK				100
-#define GCC_QUPV3_WRAP_0_S_AHB_CLK				101
-#define GCC_QUPV3_WRAP_1_M_AHB_CLK				102
-#define GCC_QUPV3_WRAP_1_S_AHB_CLK				103
-#define GCC_SDCC2_AHB_CLK					104
-#define GCC_SDCC2_APPS_CLK					105
-#define GCC_SDCC2_APPS_CLK_SRC					106
-#define GCC_SDCC4_AHB_CLK					107
-#define GCC_SDCC4_APPS_CLK					108
-#define GCC_SDCC4_APPS_CLK_SRC					109
-#define GCC_SYS_NOC_CPUSS_AHB_CLK				110
-#define GCC_TSIF_AHB_CLK					111
-#define GCC_TSIF_INACTIVITY_TIMERS_CLK				112
-#define GCC_TSIF_REF_CLK					113
-#define GCC_TSIF_REF_CLK_SRC					114
-#define GCC_UFS_CARD_AHB_CLK					115
-#define GCC_UFS_CARD_AXI_CLK					116
-#define GCC_UFS_CARD_AXI_CLK_SRC				117
-#define GCC_UFS_CARD_CLKREF_CLK					118
-#define GCC_UFS_CARD_ICE_CORE_CLK				119
-#define GCC_UFS_CARD_ICE_CORE_CLK_SRC				120
-#define GCC_UFS_CARD_PHY_AUX_CLK				121
-#define GCC_UFS_CARD_PHY_AUX_CLK_SRC				122
-#define GCC_UFS_CARD_RX_SYMBOL_0_CLK				123
-#define GCC_UFS_CARD_RX_SYMBOL_1_CLK				124
-#define GCC_UFS_CARD_TX_SYMBOL_0_CLK				125
-#define GCC_UFS_CARD_UNIPRO_CORE_CLK				126
-#define GCC_UFS_CARD_UNIPRO_CORE_CLK_SRC			127
-#define GCC_UFS_MEM_CLKREF_CLK					128
-#define GCC_UFS_PHY_AHB_CLK					129
-#define GCC_UFS_PHY_AXI_CLK					130
-#define GCC_UFS_PHY_AXI_CLK_SRC					131
-#define GCC_UFS_PHY_ICE_CORE_CLK				132
-#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				133
-#define GCC_UFS_PHY_PHY_AUX_CLK					134
-#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				135
-#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				136
-#define GCC_UFS_PHY_RX_SYMBOL_1_CLK				137
-#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				138
-#define GCC_UFS_PHY_UNIPRO_CORE_CLK				139
-#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC				140
-#define GCC_USB30_PRIM_MASTER_CLK				141
-#define GCC_USB30_PRIM_MASTER_CLK_SRC				142
-#define GCC_USB30_PRIM_MOCK_UTMI_CLK				143
-#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			144
-#define GCC_USB30_PRIM_SLEEP_CLK				145
-#define GCC_USB30_SEC_MASTER_CLK				146
-#define GCC_USB30_SEC_MASTER_CLK_SRC				147
-#define GCC_USB30_SEC_MOCK_UTMI_CLK				148
-#define GCC_USB30_SEC_MOCK_UTMI_CLK_SRC				149
-#define GCC_USB30_SEC_SLEEP_CLK					150
-#define GCC_USB3_PRIM_CLKREF_CLK				151
-#define GCC_USB3_PRIM_PHY_AUX_CLK				152
-#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				153
-#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				154
-#define GCC_USB3_PRIM_PHY_PIPE_CLK				155
-#define GCC_USB3_SEC_CLKREF_CLK					156
-#define GCC_USB3_SEC_PHY_AUX_CLK				157
-#define GCC_USB3_SEC_PHY_AUX_CLK_SRC				158
-#define GCC_USB3_SEC_PHY_PIPE_CLK				159
-#define GCC_USB3_SEC_PHY_COM_AUX_CLK				160
-#define GCC_USB_PHY_CFG_AHB2PHY_CLK				161
-#define GCC_VIDEO_AHB_CLK					162
-#define GCC_VIDEO_AXI_CLK					163
-#define GCC_VIDEO_XO_CLK					164
-#define GPLL0							165
-#define GPLL0_OUT_EVEN						166
-#define GPLL0_OUT_MAIN						167
-#define GCC_GPU_IREF_CLK					168
-#define GCC_SDCC1_AHB_CLK					169
-#define GCC_SDCC1_APPS_CLK					170
-#define GCC_SDCC1_ICE_CORE_CLK					171
-#define GCC_SDCC1_APPS_CLK_SRC					172
-#define GCC_SDCC1_ICE_CORE_CLK_SRC				173
-#define GCC_APC_VS_CLK						174
-#define GCC_GPU_VS_CLK						175
-#define GCC_MSS_VS_CLK						176
-#define GCC_VDDA_VS_CLK						177
-#define GCC_VDDCX_VS_CLK					178
-#define GCC_VDDMX_VS_CLK					179
-#define GCC_VS_CTRL_AHB_CLK					180
-#define GCC_VS_CTRL_CLK						181
-#define GCC_VS_CTRL_CLK_SRC					182
-#define GCC_VSENSOR_CLK_SRC					183
-#define GPLL4							184
-#define GCC_CPUSS_DVM_BUS_CLK					185
-#define GCC_CPUSS_GNOC_CLK					186
-#define GCC_QSPI_CORE_CLK_SRC					187
-#define GCC_QSPI_CORE_CLK					188
-#define GCC_QSPI_CNOC_PERIPH_AHB_CLK				189
-#define GCC_LPASS_Q6_AXI_CLK					190
-#define GCC_LPASS_SWAY_CLK					191
-
-/* GCC Resets */
-#define GCC_MMSS_BCR						0
-#define GCC_PCIE_0_BCR						1
-#define GCC_PCIE_1_BCR						2
-#define GCC_PCIE_PHY_BCR					3
-#define GCC_PDM_BCR						4
-#define GCC_PRNG_BCR						5
-#define GCC_QUPV3_WRAPPER_0_BCR					6
-#define GCC_QUPV3_WRAPPER_1_BCR					7
-#define GCC_QUSB2PHY_PRIM_BCR					8
-#define GCC_QUSB2PHY_SEC_BCR					9
-#define GCC_SDCC2_BCR						10
-#define GCC_SDCC4_BCR						11
-#define GCC_TSIF_BCR						12
-#define GCC_UFS_CARD_BCR					13
-#define GCC_UFS_PHY_BCR						14
-#define GCC_USB30_PRIM_BCR					15
-#define GCC_USB30_SEC_BCR					16
-#define GCC_USB3_PHY_PRIM_BCR					17
-#define GCC_USB3PHY_PHY_PRIM_BCR				18
-#define GCC_USB3_DP_PHY_PRIM_BCR				19
-#define GCC_USB3_PHY_SEC_BCR					20
-#define GCC_USB3PHY_PHY_SEC_BCR					21
-#define GCC_USB3_DP_PHY_SEC_BCR					22
-#define GCC_USB_PHY_CFG_AHB2PHY_BCR				23
-#define GCC_PCIE_0_PHY_BCR					24
-#define GCC_PCIE_1_PHY_BCR					25
-
-/* GCC GDSCRs */
-#define PCIE_0_GDSC						0
-#define PCIE_1_GDSC						1
-#define UFS_CARD_GDSC						2
-#define UFS_PHY_GDSC						3
-#define USB30_PRIM_GDSC						4
-#define USB30_SEC_GDSC						5
-#define HLOS1_VOTE_AGGRE_NOC_MMU_AUDIO_TBU_GDSC			6
-#define HLOS1_VOTE_AGGRE_NOC_MMU_PCIE_TBU_GDSC			7
-#define HLOS1_VOTE_AGGRE_NOC_MMU_TBU1_GDSC			8
-#define HLOS1_VOTE_AGGRE_NOC_MMU_TBU2_GDSC			9
-#define HLOS1_VOTE_MMNOC_MMU_TBU_HF0_GDSC			10
-#define HLOS1_VOTE_MMNOC_MMU_TBU_HF1_GDSC			11
-#define HLOS1_VOTE_MMNOC_MMU_TBU_SF_GDSC			12
-
-#endif
diff --git a/include/dt-bindings/clock/qcom,gpucc-sdm845.h b/include/dt-bindings/clock/qcom,gpucc-sdm845.h
deleted file mode 100644
index 9690d901b50a..000000000000
--- a/include/dt-bindings/clock/qcom,gpucc-sdm845.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2018, The Linux Foundation. All rights reserved.
- */
-
-#ifndef _DT_BINDINGS_CLK_SDM_GPU_CC_SDM845_H
-#define _DT_BINDINGS_CLK_SDM_GPU_CC_SDM845_H
-
-/* GPU_CC clock registers */
-#define GPU_CC_CX_GMU_CLK			0
-#define GPU_CC_CXO_CLK				1
-#define GPU_CC_GMU_CLK_SRC			2
-#define GPU_CC_PLL1				3
-
-/* GPU_CC Resets */
-#define GPUCC_GPU_CC_CX_BCR			0
-#define GPUCC_GPU_CC_GMU_BCR			1
-#define GPUCC_GPU_CC_XO_BCR			2
-
-/* GPU_CC GDSCRs */
-#define GPU_CX_GDSC				0
-#define GPU_GX_GDSC				1
-
-#endif
diff --git a/include/dt-bindings/clock/qcom,lpass-sdm845.h b/include/dt-bindings/clock/qcom,lpass-sdm845.h
deleted file mode 100644
index 659050846f61..000000000000
--- a/include/dt-bindings/clock/qcom,lpass-sdm845.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2018, The Linux Foundation. All rights reserved.
- */
-
-#ifndef _DT_BINDINGS_CLK_SDM_LPASS_SDM845_H
-#define _DT_BINDINGS_CLK_SDM_LPASS_SDM845_H
-
-#define LPASS_Q6SS_AHBM_AON_CLK				0
-#define LPASS_Q6SS_AHBS_AON_CLK				1
-#define LPASS_QDSP6SS_XO_CLK				2
-#define LPASS_QDSP6SS_SLEEP_CLK				3
-#define LPASS_QDSP6SS_CORE_CLK				4
-
-#endif
diff --git a/include/dt-bindings/clock/qcom,mmcc-msm8996.h b/include/dt-bindings/clock/qcom,mmcc-msm8996.h
deleted file mode 100644
index d51f9ac70566..000000000000
--- a/include/dt-bindings/clock/qcom,mmcc-msm8996.h
+++ /dev/null
@@ -1,295 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2015, The Linux Foundation. All rights reserved.
- */
-
-#ifndef _DT_BINDINGS_CLK_MSM_MMCC_8996_H
-#define _DT_BINDINGS_CLK_MSM_MMCC_8996_H
-
-#define MMPLL0_EARLY					0
-#define MMPLL0_PLL					1
-#define MMPLL1_EARLY					2
-#define MMPLL1_PLL					3
-#define MMPLL2_EARLY					4
-#define MMPLL2_PLL					5
-#define MMPLL3_EARLY					6
-#define MMPLL3_PLL					7
-#define MMPLL4_EARLY					8
-#define MMPLL4_PLL					9
-#define MMPLL5_EARLY					10
-#define MMPLL5_PLL					11
-#define MMPLL8_EARLY					12
-#define MMPLL8_PLL					13
-#define MMPLL9_EARLY					14
-#define MMPLL9_PLL					15
-#define AHB_CLK_SRC					16
-#define AXI_CLK_SRC					17
-#define MAXI_CLK_SRC					18
-#define DSA_CORE_CLK_SRC				19
-#define GFX3D_CLK_SRC					20
-#define RBBMTIMER_CLK_SRC				21
-#define ISENSE_CLK_SRC					22
-#define RBCPR_CLK_SRC					23
-#define VIDEO_CORE_CLK_SRC				24
-#define VIDEO_SUBCORE0_CLK_SRC				25
-#define VIDEO_SUBCORE1_CLK_SRC				26
-#define PCLK0_CLK_SRC					27
-#define PCLK1_CLK_SRC					28
-#define MDP_CLK_SRC					29
-#define EXTPCLK_CLK_SRC					30
-#define VSYNC_CLK_SRC					31
-#define HDMI_CLK_SRC					32
-#define BYTE0_CLK_SRC					33
-#define BYTE1_CLK_SRC					34
-#define ESC0_CLK_SRC					35
-#define ESC1_CLK_SRC					36
-#define CAMSS_GP0_CLK_SRC				37
-#define CAMSS_GP1_CLK_SRC				38
-#define MCLK0_CLK_SRC					39
-#define MCLK1_CLK_SRC					40
-#define MCLK2_CLK_SRC					41
-#define MCLK3_CLK_SRC					42
-#define CCI_CLK_SRC					43
-#define CSI0PHYTIMER_CLK_SRC				44
-#define CSI1PHYTIMER_CLK_SRC				45
-#define CSI2PHYTIMER_CLK_SRC				46
-#define CSIPHY0_3P_CLK_SRC				47
-#define CSIPHY1_3P_CLK_SRC				48
-#define CSIPHY2_3P_CLK_SRC				49
-#define JPEG0_CLK_SRC					50
-#define JPEG2_CLK_SRC					51
-#define JPEG_DMA_CLK_SRC				52
-#define VFE0_CLK_SRC					53
-#define VFE1_CLK_SRC					54
-#define CPP_CLK_SRC					55
-#define CSI0_CLK_SRC					56
-#define CSI1_CLK_SRC					57
-#define CSI2_CLK_SRC					58
-#define CSI3_CLK_SRC					59
-#define FD_CORE_CLK_SRC					60
-#define MMSS_CXO_CLK					61
-#define MMSS_SLEEPCLK_CLK				62
-#define MMSS_MMAGIC_AHB_CLK				63
-#define MMSS_MMAGIC_CFG_AHB_CLK				64
-#define MMSS_MISC_AHB_CLK				65
-#define MMSS_MISC_CXO_CLK				66
-#define MMSS_BTO_AHB_CLK				67
-#define MMSS_MMAGIC_AXI_CLK				68
-#define MMSS_S0_AXI_CLK					69
-#define MMSS_MMAGIC_MAXI_CLK				70
-#define DSA_CORE_CLK					71
-#define DSA_NOC_CFG_AHB_CLK				72
-#define MMAGIC_CAMSS_AXI_CLK				73
-#define MMAGIC_CAMSS_NOC_CFG_AHB_CLK			74
-#define THROTTLE_CAMSS_CXO_CLK				75
-#define THROTTLE_CAMSS_AHB_CLK				76
-#define THROTTLE_CAMSS_AXI_CLK				77
-#define SMMU_VFE_AHB_CLK				78
-#define SMMU_VFE_AXI_CLK				79
-#define SMMU_CPP_AHB_CLK				80
-#define SMMU_CPP_AXI_CLK				81
-#define SMMU_JPEG_AHB_CLK				82
-#define SMMU_JPEG_AXI_CLK				83
-#define MMAGIC_MDSS_AXI_CLK				84
-#define MMAGIC_MDSS_NOC_CFG_AHB_CLK			85
-#define THROTTLE_MDSS_CXO_CLK				86
-#define THROTTLE_MDSS_AHB_CLK				87
-#define THROTTLE_MDSS_AXI_CLK				88
-#define SMMU_ROT_AHB_CLK				89
-#define SMMU_ROT_AXI_CLK				90
-#define SMMU_MDP_AHB_CLK				91
-#define SMMU_MDP_AXI_CLK				92
-#define MMAGIC_VIDEO_AXI_CLK				93
-#define MMAGIC_VIDEO_NOC_CFG_AHB_CLK			94
-#define THROTTLE_VIDEO_CXO_CLK				95
-#define THROTTLE_VIDEO_AHB_CLK				96
-#define THROTTLE_VIDEO_AXI_CLK				97
-#define SMMU_VIDEO_AHB_CLK				98
-#define SMMU_VIDEO_AXI_CLK				99
-#define MMAGIC_BIMC_AXI_CLK				100
-#define MMAGIC_BIMC_NOC_CFG_AHB_CLK			101
-#define GPU_GX_GFX3D_CLK				102
-#define GPU_GX_RBBMTIMER_CLK				103
-#define GPU_AHB_CLK					104
-#define GPU_AON_ISENSE_CLK				105
-#define VMEM_MAXI_CLK					106
-#define VMEM_AHB_CLK					107
-#define MMSS_RBCPR_CLK					108
-#define MMSS_RBCPR_AHB_CLK				109
-#define VIDEO_CORE_CLK					110
-#define VIDEO_AXI_CLK					111
-#define VIDEO_MAXI_CLK					112
-#define VIDEO_AHB_CLK					113
-#define VIDEO_SUBCORE0_CLK				114
-#define VIDEO_SUBCORE1_CLK				115
-#define MDSS_AHB_CLK					116
-#define MDSS_HDMI_AHB_CLK				117
-#define MDSS_AXI_CLK					118
-#define MDSS_PCLK0_CLK					119
-#define MDSS_PCLK1_CLK					120
-#define MDSS_MDP_CLK					121
-#define MDSS_EXTPCLK_CLK				122
-#define MDSS_VSYNC_CLK					123
-#define MDSS_HDMI_CLK					124
-#define MDSS_BYTE0_CLK					125
-#define MDSS_BYTE1_CLK					126
-#define MDSS_ESC0_CLK					127
-#define MDSS_ESC1_CLK					128
-#define CAMSS_TOP_AHB_CLK				129
-#define CAMSS_AHB_CLK					130
-#define CAMSS_MICRO_AHB_CLK				131
-#define CAMSS_GP0_CLK					132
-#define CAMSS_GP1_CLK					133
-#define CAMSS_MCLK0_CLK					134
-#define CAMSS_MCLK1_CLK					135
-#define CAMSS_MCLK2_CLK					136
-#define CAMSS_MCLK3_CLK					137
-#define CAMSS_CCI_CLK					138
-#define CAMSS_CCI_AHB_CLK				139
-#define CAMSS_CSI0PHYTIMER_CLK				140
-#define CAMSS_CSI1PHYTIMER_CLK				141
-#define CAMSS_CSI2PHYTIMER_CLK				142
-#define CAMSS_CSIPHY0_3P_CLK				143
-#define CAMSS_CSIPHY1_3P_CLK				144
-#define CAMSS_CSIPHY2_3P_CLK				145
-#define CAMSS_JPEG0_CLK					146
-#define CAMSS_JPEG2_CLK					147
-#define CAMSS_JPEG_DMA_CLK				148
-#define CAMSS_JPEG_AHB_CLK				149
-#define CAMSS_JPEG_AXI_CLK				150
-#define CAMSS_VFE_AHB_CLK				151
-#define CAMSS_VFE_AXI_CLK				152
-#define CAMSS_VFE0_CLK					153
-#define CAMSS_VFE0_STREAM_CLK				154
-#define CAMSS_VFE0_AHB_CLK				155
-#define CAMSS_VFE1_CLK					156
-#define CAMSS_VFE1_STREAM_CLK				157
-#define CAMSS_VFE1_AHB_CLK				158
-#define CAMSS_CSI_VFE0_CLK				159
-#define CAMSS_CSI_VFE1_CLK				160
-#define CAMSS_CPP_VBIF_AHB_CLK				161
-#define CAMSS_CPP_AXI_CLK				162
-#define CAMSS_CPP_CLK					163
-#define CAMSS_CPP_AHB_CLK				164
-#define CAMSS_CSI0_CLK					165
-#define CAMSS_CSI0_AHB_CLK				166
-#define CAMSS_CSI0PHY_CLK				167
-#define CAMSS_CSI0RDI_CLK				168
-#define CAMSS_CSI0PIX_CLK				169
-#define CAMSS_CSI1_CLK					170
-#define CAMSS_CSI1_AHB_CLK				171
-#define CAMSS_CSI1PHY_CLK				172
-#define CAMSS_CSI1RDI_CLK				173
-#define CAMSS_CSI1PIX_CLK				174
-#define CAMSS_CSI2_CLK					175
-#define CAMSS_CSI2_AHB_CLK				176
-#define CAMSS_CSI2PHY_CLK				177
-#define CAMSS_CSI2RDI_CLK				178
-#define CAMSS_CSI2PIX_CLK				179
-#define CAMSS_CSI3_CLK					180
-#define CAMSS_CSI3_AHB_CLK				181
-#define CAMSS_CSI3PHY_CLK				182
-#define CAMSS_CSI3RDI_CLK				183
-#define CAMSS_CSI3PIX_CLK				184
-#define CAMSS_ISPIF_AHB_CLK				185
-#define FD_CORE_CLK					186
-#define FD_CORE_UAR_CLK					187
-#define FD_AHB_CLK					188
-#define MMSS_SPDM_CSI0_CLK				189
-#define MMSS_SPDM_JPEG_DMA_CLK				190
-#define MMSS_SPDM_CPP_CLK				191
-#define MMSS_SPDM_PCLK0_CLK				192
-#define MMSS_SPDM_AHB_CLK				193
-#define MMSS_SPDM_GFX3D_CLK				194
-#define MMSS_SPDM_PCLK1_CLK				195
-#define MMSS_SPDM_JPEG2_CLK				196
-#define MMSS_SPDM_DEBUG_CLK				197
-#define MMSS_SPDM_VFE1_CLK				198
-#define MMSS_SPDM_VFE0_CLK				199
-#define MMSS_SPDM_VIDEO_CORE_CLK			200
-#define MMSS_SPDM_AXI_CLK				201
-#define MMSS_SPDM_MDP_CLK				202
-#define MMSS_SPDM_JPEG0_CLK				203
-#define MMSS_SPDM_RM_AXI_CLK				204
-#define MMSS_SPDM_RM_MAXI_CLK				205
-
-#define MMAGICAHB_BCR					0
-#define MMAGIC_CFG_BCR					1
-#define MISC_BCR					2
-#define BTO_BCR						3
-#define MMAGICAXI_BCR					4
-#define MMAGICMAXI_BCR					5
-#define DSA_BCR						6
-#define MMAGIC_CAMSS_BCR				7
-#define THROTTLE_CAMSS_BCR				8
-#define SMMU_VFE_BCR					9
-#define SMMU_CPP_BCR					10
-#define SMMU_JPEG_BCR					11
-#define MMAGIC_MDSS_BCR					12
-#define THROTTLE_MDSS_BCR				13
-#define SMMU_ROT_BCR					14
-#define SMMU_MDP_BCR					15
-#define MMAGIC_VIDEO_BCR				16
-#define THROTTLE_VIDEO_BCR				17
-#define SMMU_VIDEO_BCR					18
-#define MMAGIC_BIMC_BCR					19
-#define GPU_GX_BCR					20
-#define GPU_BCR						21
-#define GPU_AON_BCR					22
-#define VMEM_BCR					23
-#define MMSS_RBCPR_BCR					24
-#define VIDEO_BCR					25
-#define MDSS_BCR					26
-#define CAMSS_TOP_BCR					27
-#define CAMSS_AHB_BCR					28
-#define CAMSS_MICRO_BCR					29
-#define CAMSS_CCI_BCR					30
-#define CAMSS_PHY0_BCR					31
-#define CAMSS_PHY1_BCR					32
-#define CAMSS_PHY2_BCR					33
-#define CAMSS_CSIPHY0_3P_BCR				34
-#define CAMSS_CSIPHY1_3P_BCR				35
-#define CAMSS_CSIPHY2_3P_BCR				36
-#define CAMSS_JPEG_BCR					37
-#define CAMSS_VFE_BCR					38
-#define CAMSS_VFE0_BCR					39
-#define CAMSS_VFE1_BCR					40
-#define CAMSS_CSI_VFE0_BCR				41
-#define CAMSS_CSI_VFE1_BCR				42
-#define CAMSS_CPP_TOP_BCR				43
-#define CAMSS_CPP_BCR					44
-#define CAMSS_CSI0_BCR					45
-#define CAMSS_CSI0RDI_BCR				46
-#define CAMSS_CSI0PIX_BCR				47
-#define CAMSS_CSI1_BCR					48
-#define CAMSS_CSI1RDI_BCR				49
-#define CAMSS_CSI1PIX_BCR				50
-#define CAMSS_CSI2_BCR					51
-#define CAMSS_CSI2RDI_BCR				52
-#define CAMSS_CSI2PIX_BCR				53
-#define CAMSS_CSI3_BCR					54
-#define CAMSS_CSI3RDI_BCR				55
-#define CAMSS_CSI3PIX_BCR				56
-#define CAMSS_ISPIF_BCR					57
-#define FD_BCR						58
-#define MMSS_SPDM_RM_BCR				59
-
-/* Indexes for GDSCs */
-#define MMAGIC_VIDEO_GDSC	0
-#define MMAGIC_MDSS_GDSC	1
-#define MMAGIC_CAMSS_GDSC	2
-#define GPU_GDSC		3
-#define VENUS_GDSC		4
-#define VENUS_CORE0_GDSC	5
-#define VENUS_CORE1_GDSC	6
-#define CAMSS_GDSC		7
-#define VFE0_GDSC		8
-#define VFE1_GDSC		9
-#define JPEG_GDSC		10
-#define CPP_GDSC		11
-#define FD_GDSC			12
-#define MDSS_GDSC		13
-#define GPU_GX_GDSC		14
-#define MMAGIC_BIMC_GDSC	15
-
-#endif
diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
deleted file mode 100644
index 46309c9953b2..000000000000
--- a/include/dt-bindings/clock/qcom,rpmcc.h
+++ /dev/null
@@ -1,174 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright 2015 Linaro Limited
- */
-
-#ifndef _DT_BINDINGS_CLK_MSM_RPMCC_H
-#define _DT_BINDINGS_CLK_MSM_RPMCC_H
-
-/* RPM clocks */
-#define RPM_PXO_CLK				0
-#define RPM_PXO_A_CLK				1
-#define RPM_CXO_CLK				2
-#define RPM_CXO_A_CLK				3
-#define RPM_APPS_FABRIC_CLK			4
-#define RPM_APPS_FABRIC_A_CLK			5
-#define RPM_CFPB_CLK				6
-#define RPM_CFPB_A_CLK				7
-#define RPM_QDSS_CLK				8
-#define RPM_QDSS_A_CLK				9
-#define RPM_DAYTONA_FABRIC_CLK			10
-#define RPM_DAYTONA_FABRIC_A_CLK		11
-#define RPM_EBI1_CLK				12
-#define RPM_EBI1_A_CLK				13
-#define RPM_MM_FABRIC_CLK			14
-#define RPM_MM_FABRIC_A_CLK			15
-#define RPM_MMFPB_CLK				16
-#define RPM_MMFPB_A_CLK				17
-#define RPM_SYS_FABRIC_CLK			18
-#define RPM_SYS_FABRIC_A_CLK			19
-#define RPM_SFPB_CLK				20
-#define RPM_SFPB_A_CLK				21
-#define RPM_SMI_CLK				22
-#define RPM_SMI_A_CLK				23
-#define RPM_PLL4_CLK				24
-#define RPM_XO_D0				25
-#define RPM_XO_D1				26
-#define RPM_XO_A0				27
-#define RPM_XO_A1				28
-#define RPM_XO_A2				29
-#define RPM_NSS_FABRIC_0_CLK			30
-#define RPM_NSS_FABRIC_0_A_CLK			31
-#define RPM_NSS_FABRIC_1_CLK			32
-#define RPM_NSS_FABRIC_1_A_CLK			33
-
-/* SMD RPM clocks */
-#define RPM_SMD_XO_CLK_SRC				0
-#define RPM_SMD_XO_A_CLK_SRC			1
-#define RPM_SMD_PCNOC_CLK				2
-#define RPM_SMD_PCNOC_A_CLK				3
-#define RPM_SMD_SNOC_CLK				4
-#define RPM_SMD_SNOC_A_CLK				5
-#define RPM_SMD_BIMC_CLK				6
-#define RPM_SMD_BIMC_A_CLK				7
-#define RPM_SMD_QDSS_CLK				8
-#define RPM_SMD_QDSS_A_CLK				9
-#define RPM_SMD_BB_CLK1				10
-#define RPM_SMD_BB_CLK1_A				11
-#define RPM_SMD_BB_CLK2				12
-#define RPM_SMD_BB_CLK2_A				13
-#define RPM_SMD_RF_CLK1				14
-#define RPM_SMD_RF_CLK1_A				15
-#define RPM_SMD_RF_CLK2				16
-#define RPM_SMD_RF_CLK2_A				17
-#define RPM_SMD_BB_CLK1_PIN				18
-#define RPM_SMD_BB_CLK1_A_PIN			19
-#define RPM_SMD_BB_CLK2_PIN				20
-#define RPM_SMD_BB_CLK2_A_PIN			21
-#define RPM_SMD_RF_CLK1_PIN				22
-#define RPM_SMD_RF_CLK1_A_PIN			23
-#define RPM_SMD_RF_CLK2_PIN				24
-#define RPM_SMD_RF_CLK2_A_PIN			25
-#define RPM_SMD_PNOC_CLK			26
-#define RPM_SMD_PNOC_A_CLK			27
-#define RPM_SMD_CNOC_CLK			28
-#define RPM_SMD_CNOC_A_CLK			29
-#define RPM_SMD_MMSSNOC_AHB_CLK			30
-#define RPM_SMD_MMSSNOC_AHB_A_CLK		31
-#define RPM_SMD_GFX3D_CLK_SRC			32
-#define RPM_SMD_GFX3D_A_CLK_SRC			33
-#define RPM_SMD_OCMEMGX_CLK			34
-#define RPM_SMD_OCMEMGX_A_CLK			35
-#define RPM_SMD_CXO_D0				36
-#define RPM_SMD_CXO_D0_A			37
-#define RPM_SMD_CXO_D1				38
-#define RPM_SMD_CXO_D1_A			39
-#define RPM_SMD_CXO_A0				40
-#define RPM_SMD_CXO_A0_A			41
-#define RPM_SMD_CXO_A1				42
-#define RPM_SMD_CXO_A1_A			43
-#define RPM_SMD_CXO_A2				44
-#define RPM_SMD_CXO_A2_A			45
-#define RPM_SMD_DIV_CLK1			46
-#define RPM_SMD_DIV_A_CLK1			47
-#define RPM_SMD_DIV_CLK2			48
-#define RPM_SMD_DIV_A_CLK2			49
-#define RPM_SMD_DIFF_CLK			50
-#define RPM_SMD_DIFF_A_CLK			51
-#define RPM_SMD_CXO_D0_PIN			52
-#define RPM_SMD_CXO_D0_A_PIN			53
-#define RPM_SMD_CXO_D1_PIN			54
-#define RPM_SMD_CXO_D1_A_PIN			55
-#define RPM_SMD_CXO_A0_PIN			56
-#define RPM_SMD_CXO_A0_A_PIN			57
-#define RPM_SMD_CXO_A1_PIN			58
-#define RPM_SMD_CXO_A1_A_PIN			59
-#define RPM_SMD_CXO_A2_PIN			60
-#define RPM_SMD_CXO_A2_A_PIN			61
-#define RPM_SMD_AGGR1_NOC_CLK			62
-#define RPM_SMD_AGGR1_NOC_A_CLK			63
-#define RPM_SMD_AGGR2_NOC_CLK			64
-#define RPM_SMD_AGGR2_NOC_A_CLK			65
-#define RPM_SMD_MMAXI_CLK			66
-#define RPM_SMD_MMAXI_A_CLK			67
-#define RPM_SMD_IPA_CLK				68
-#define RPM_SMD_IPA_A_CLK			69
-#define RPM_SMD_CE1_CLK				70
-#define RPM_SMD_CE1_A_CLK			71
-#define RPM_SMD_DIV_CLK3			72
-#define RPM_SMD_DIV_A_CLK3			73
-#define RPM_SMD_LN_BB_CLK			74
-#define RPM_SMD_LN_BB_A_CLK			75
-#define RPM_SMD_BIMC_GPU_CLK			76
-#define RPM_SMD_BIMC_GPU_A_CLK			77
-#define RPM_SMD_QPIC_CLK			78
-#define RPM_SMD_QPIC_CLK_A			79
-#define RPM_SMD_LN_BB_CLK1			80
-#define RPM_SMD_LN_BB_CLK1_A			81
-#define RPM_SMD_LN_BB_CLK2			82
-#define RPM_SMD_LN_BB_CLK2_A			83
-#define RPM_SMD_LN_BB_CLK3_PIN			84
-#define RPM_SMD_LN_BB_CLK3_A_PIN		85
-#define RPM_SMD_RF_CLK3				86
-#define RPM_SMD_RF_CLK3_A			87
-#define RPM_SMD_RF_CLK3_PIN			88
-#define RPM_SMD_RF_CLK3_A_PIN			89
-#define RPM_SMD_MMSSNOC_AXI_CLK			90
-#define RPM_SMD_MMSSNOC_AXI_CLK_A		91
-#define RPM_SMD_CNOC_PERIPH_CLK			92
-#define RPM_SMD_CNOC_PERIPH_A_CLK		93
-#define RPM_SMD_LN_BB_CLK3			94
-#define RPM_SMD_LN_BB_CLK3_A			95
-#define RPM_SMD_LN_BB_CLK1_PIN			96
-#define RPM_SMD_LN_BB_CLK1_A_PIN		97
-#define RPM_SMD_LN_BB_CLK2_PIN			98
-#define RPM_SMD_LN_BB_CLK2_A_PIN		99
-#define RPM_SMD_SYSMMNOC_CLK			100
-#define RPM_SMD_SYSMMNOC_A_CLK			101
-#define RPM_SMD_CE2_CLK				102
-#define RPM_SMD_CE2_A_CLK			103
-#define RPM_SMD_CE3_CLK				104
-#define RPM_SMD_CE3_A_CLK			105
-#define RPM_SMD_QUP_CLK				106
-#define RPM_SMD_QUP_A_CLK			107
-#define RPM_SMD_MMRT_CLK			108
-#define RPM_SMD_MMRT_A_CLK			109
-#define RPM_SMD_MMNRT_CLK			110
-#define RPM_SMD_MMNRT_A_CLK			111
-#define RPM_SMD_SNOC_PERIPH_CLK			112
-#define RPM_SMD_SNOC_PERIPH_A_CLK		113
-#define RPM_SMD_SNOC_LPASS_CLK			114
-#define RPM_SMD_SNOC_LPASS_A_CLK		115
-#define RPM_SMD_HWKM_CLK			116
-#define RPM_SMD_HWKM_A_CLK			117
-#define RPM_SMD_PKA_CLK				118
-#define RPM_SMD_PKA_A_CLK			119
-#define RPM_SMD_CPUSS_GNOC_CLK			120
-#define RPM_SMD_CPUSS_GNOC_A_CLK		121
-#define RPM_SMD_MSS_CFG_AHB_CLK		122
-#define RPM_SMD_MSS_CFG_AHB_A_CLK		123
-#define RPM_SMD_BIMC_FREQ_LOG			124
-#define RPM_SMD_LN_BB_CLK_PIN			125
-#define RPM_SMD_LN_BB_A_CLK_PIN			126
-
-#endif
diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
deleted file mode 100644
index 0a7d1be0d124..000000000000
--- a/include/dt-bindings/clock/qcom,rpmh.h
+++ /dev/null
@@ -1,37 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/* Copyright (c) 2018, 2020, The Linux Foundation. All rights reserved. */
-
-
-#ifndef _DT_BINDINGS_CLK_MSM_RPMH_H
-#define _DT_BINDINGS_CLK_MSM_RPMH_H
-
-/* RPMh controlled clocks */
-#define RPMH_CXO_CLK				0
-#define RPMH_CXO_CLK_A				1
-#define RPMH_LN_BB_CLK2				2
-#define RPMH_LN_BB_CLK2_A			3
-#define RPMH_LN_BB_CLK3				4
-#define RPMH_LN_BB_CLK3_A			5
-#define RPMH_RF_CLK1				6
-#define RPMH_RF_CLK1_A				7
-#define RPMH_RF_CLK2				8
-#define RPMH_RF_CLK2_A				9
-#define RPMH_RF_CLK3				10
-#define RPMH_RF_CLK3_A				11
-#define RPMH_IPA_CLK				12
-#define RPMH_LN_BB_CLK1				13
-#define RPMH_LN_BB_CLK1_A			14
-#define RPMH_CE_CLK				15
-#define RPMH_QPIC_CLK				16
-#define RPMH_DIV_CLK1				17
-#define RPMH_DIV_CLK1_A				18
-#define RPMH_RF_CLK4				19
-#define RPMH_RF_CLK4_A				20
-#define RPMH_RF_CLK5				21
-#define RPMH_RF_CLK5_A				22
-#define RPMH_PKA_CLK				23
-#define RPMH_HWKM_CLK				24
-#define RPMH_QLINK_CLK				25
-#define RPMH_QLINK_CLK_A			26
-
-#endif
diff --git a/include/dt-bindings/clock/qcom,turingcc-qcs404.h b/include/dt-bindings/clock/qcom,turingcc-qcs404.h
deleted file mode 100644
index 838faef57c67..000000000000
--- a/include/dt-bindings/clock/qcom,turingcc-qcs404.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2019, Linaro Ltd
- */
-
-#ifndef _DT_BINDINGS_CLK_TURING_QCS404_H
-#define _DT_BINDINGS_CLK_TURING_QCS404_H
-
-#define TURING_Q6SS_Q6_AXIM_CLK		0
-#define TURING_Q6SS_AHBM_AON_CLK	1
-#define TURING_WRAPPER_AON_CLK		2
-#define TURING_Q6SS_AHBS_AON_CLK	3
-#define TURING_WRAPPER_QOS_AHBS_AON_CLK	4
-
-#endif
diff --git a/include/dt-bindings/clock/qcom,videocc-sdm845.h b/include/dt-bindings/clock/qcom,videocc-sdm845.h
deleted file mode 100644
index 1b868165e8ce..000000000000
--- a/include/dt-bindings/clock/qcom,videocc-sdm845.h
+++ /dev/null
@@ -1,35 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2018, The Linux Foundation. All rights reserved.
- */
-
-#ifndef _DT_BINDINGS_CLK_SDM_VIDEO_CC_SDM845_H
-#define _DT_BINDINGS_CLK_SDM_VIDEO_CC_SDM845_H
-
-/* VIDEO_CC clock registers */
-#define VIDEO_CC_APB_CLK		0
-#define VIDEO_CC_AT_CLK			1
-#define VIDEO_CC_QDSS_TRIG_CLK		2
-#define VIDEO_CC_QDSS_TSCTR_DIV8_CLK	3
-#define VIDEO_CC_VCODEC0_AXI_CLK	4
-#define VIDEO_CC_VCODEC0_CORE_CLK	5
-#define VIDEO_CC_VCODEC1_AXI_CLK	6
-#define VIDEO_CC_VCODEC1_CORE_CLK	7
-#define VIDEO_CC_VENUS_AHB_CLK		8
-#define VIDEO_CC_VENUS_CLK_SRC		9
-#define VIDEO_CC_VENUS_CTL_AXI_CLK	10
-#define VIDEO_CC_VENUS_CTL_CORE_CLK	11
-#define VIDEO_PLL0			12
-
-/* VIDEO_CC Resets */
-#define VIDEO_CC_VENUS_BCR		0
-#define VIDEO_CC_VCODEC0_BCR		1
-#define VIDEO_CC_VCODEC1_BCR		2
-#define VIDEO_CC_INTERFACE_BCR		3
-
-/* VIDEO_CC GDSCRs */
-#define VENUS_GDSC			0
-#define VCODEC0_GDSC			1
-#define VCODEC1_GDSC			2
-
-#endif

-- 
2.44.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
