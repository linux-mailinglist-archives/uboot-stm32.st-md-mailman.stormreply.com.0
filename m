Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C0688622E
	for <lists+uboot-stm32@lfdr.de>; Thu, 21 Mar 2024 22:04:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1CACC6DD79;
	Thu, 21 Mar 2024 21:04:17 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBFC6C6DD73
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Mar 2024 21:04:15 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-414700cffd6so11083975e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Mar 2024 14:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711055055; x=1711659855;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PjL32vvYY74tfaajJjR2p8htYMHlW/MiE3+tnKxlBCU=;
 b=lUqw4rLYgCwRdKZFSQV4hY2ttVQmL8bQmgcRoHRjGLjR2ZqgRiCsCX+3x99JKL9pLY
 INPcBApU3UDoRrYeTwI/gfWJoSjNavtv2yvkhtqIvRz925Ua41Xz88VnB4vJd6ztYDSs
 GFsW/Lg7jdL6lOCmXbl6AOJMIH3euINHfg6TDqbkfQvM6EpYPiJbPO7+mA7QD8ukiy0a
 Rg3sdkc66v65icAiwxPzio8yDbij91PuTr93z3niJPjRiQ1x7ccdpWnnhp8ffxB1g3cy
 XmtHrTH+hEWS/VHGs4sokLXtxZtnNzAEJ8cFhREe1B3NGZFfkWHwQJpXXn7C8xY8Gr8A
 jitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711055055; x=1711659855;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PjL32vvYY74tfaajJjR2p8htYMHlW/MiE3+tnKxlBCU=;
 b=LDumgBWbl5Sn7coU9mzA+Z5ICdHzXXnblnwfy76frb+0vqhMDC3Ic7GvKJHJyDy0fb
 iaBWxfi+PTEpE92G1QGzlmrqgUnlFsM9nj6vMj/h1QDhzxfnk22WWm9I8w1u5OjDOOiQ
 UVBiMLNtKNxMna7oDb2Fbu9mrZzGxlC17IuGvu0rR4zGA8AotA/1XJoBhIJucBvPhdUB
 vlVxKRtCK5wWWB9ZXMxm1bSZa0S4Zn/wY9Zs7DrtM7TPS3/MGS2wFFEAYQmXrkQ/YyOq
 DO9NMn2SOspaBVTVbtXFE5lU1h1qJTpRxT5gm/94OjXGWeuIAz/o8AjPvNd7epvl/cRD
 pOTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu+eONSg9scvLoHzQNe1jNhuVlUmuOEit3qtv1ql3+7ZJg3xF9pJHH5LCtnTo9TeWoVCbhG/27CRcN5rLv2otrmch1sx1k8bAbzG1XhQV+1FSTf/qnaSUp
X-Gm-Message-State: AOJu0Yye2RT60NUcoYSSP5uSTmyXcztAke0/lzO0SdXkXCymqb7hT0y8
 pSMJNC9eI2rER7t3bsqK1kIVKjFgxdaxgALp9cUfyQ474oRnHV4FZftThl7jV1U=
X-Google-Smtp-Source: AGHT+IESYnFummEOfTdyaTYisaVbIvKQry+yVPn//u7iByldQTHcR1JZ2icPFMvus2xCWnMBjLIeWw==
X-Received: by 2002:a05:600c:444d:b0:414:7941:9c60 with SMTP id
 v13-20020a05600c444d00b0041479419c60mr185628wmn.38.1711055055095; 
 Thu, 21 Mar 2024 14:04:15 -0700 (PDT)
Received: from lion.localdomain (host-92-17-96-232.as13285.net. [92.17.96.232])
 by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b004146f728906sm925462wmb.7.2024.03.21.14.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 14:04:14 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Thu, 21 Mar 2024 21:03:51 +0000
MIME-Version: 1.0
Message-Id: <20240321-b4-upstream-dt-headers-v2-8-1eac0df875fe@linaro.org>
References: <20240321-b4-upstream-dt-headers-v2-0-1eac0df875fe@linaro.org>
In-Reply-To: <20240321-b4-upstream-dt-headers-v2-0-1eac0df875fe@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=48477;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=b3Z/LUCKVtzPOkShc8J/Pek7VsIdGKVeLOE5H26QLlI=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhtQ/C3Zvfcfy/4BJHa+w7ydZJ459vg6PlFZdLj0b/M1r9
 pvrTG5lHaUsDIIcDLJiiiziJ5ZZNq29bK+xfcEFmDmsTCBDGLg4BWAiC+oY/hfKfvXsbg5hKXj1
 Z9bBro1nbihdvyIpumDCiocp1Zm+9p6MDJvi5ryWkQ6c2O78SvCR8wVJpuNP532ICdPJDf+q+o6
 /lRsA
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 uboot-snps-arc@synopsys.com, Caleb Connolly <caleb.connolly@linaro.org>,
 u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH v2 08/24] stm: drop dt-binding headers
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

Dropped in favour of dts/upstream

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 include/dt-bindings/clock/ste-ab8500.h             |  12 -
 include/dt-bindings/clock/stih407-clks.h           |  90 -------
 include/dt-bindings/clock/stih410-clks.h           |  25 --
 include/dt-bindings/clock/stm32fx-clock.h          |  63 -----
 include/dt-bindings/clock/stm32h7-clks.h           | 167 -------------
 include/dt-bindings/clock/stm32mp1-clks.h          | 274 ---------------------
 include/dt-bindings/clock/stm32mp13-clks.h         | 229 -----------------
 include/dt-bindings/mfd/st,stpmic1.h               |  50 ----
 include/dt-bindings/mfd/st-lpc.h                   |  16 --
 include/dt-bindings/mfd/stm32f4-rcc.h              | 108 --------
 include/dt-bindings/mfd/stm32f7-rcc.h              | 116 ---------
 include/dt-bindings/mfd/stm32h7-rcc.h              | 138 -----------
 include/dt-bindings/pinctrl/stm32-pinfunc.h        |  45 ----
 .../dt-bindings/regulator/st,stm32mp13-regulator.h |  42 ----
 include/dt-bindings/reset/stih407-resets.h         |  65 -----
 include/dt-bindings/reset/stm32mp1-resets.h        | 123 ---------
 include/dt-bindings/reset/stm32mp13-resets.h       | 100 --------
 17 files changed, 1663 deletions(-)

diff --git a/include/dt-bindings/clock/ste-ab8500.h b/include/dt-bindings/clock/ste-ab8500.h
deleted file mode 100644
index fb42dd0cab5f..000000000000
--- a/include/dt-bindings/clock/ste-ab8500.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __STE_CLK_AB8500_H__
-#define __STE_CLK_AB8500_H__
-
-#define AB8500_SYSCLK_BUF2	0
-#define AB8500_SYSCLK_BUF3	1
-#define AB8500_SYSCLK_BUF4	2
-#define AB8500_SYSCLK_ULP	3
-#define AB8500_SYSCLK_INT	4
-#define AB8500_SYSCLK_AUDIO	5
-
-#endif
diff --git a/include/dt-bindings/clock/stih407-clks.h b/include/dt-bindings/clock/stih407-clks.h
deleted file mode 100644
index 082edd9badfa..000000000000
--- a/include/dt-bindings/clock/stih407-clks.h
+++ /dev/null
@@ -1,90 +0,0 @@
-/*
- * This header provides constants clk index STMicroelectronics
- * STiH407 SoC.
- */
-#ifndef _DT_BINDINGS_CLK_STIH407
-#define _DT_BINDINGS_CLK_STIH407
-
-/* CLOCKGEN A0 */
-#define CLK_IC_LMI0		0
-#define CLK_IC_LMI1		1
-
-/* CLOCKGEN C0 */
-#define CLK_ICN_GPU		0
-#define CLK_FDMA		1
-#define CLK_NAND		2
-#define CLK_HVA			3
-#define CLK_PROC_STFE		4
-#define CLK_PROC_TP		5
-#define CLK_RX_ICN_DMU		6
-#define CLK_RX_ICN_DISP_0	6
-#define CLK_RX_ICN_DISP_1	6
-#define CLK_RX_ICN_HVA		7
-#define CLK_RX_ICN_TS		7
-#define CLK_ICN_CPU		8
-#define CLK_TX_ICN_DMU		9
-#define CLK_TX_ICN_HVA		9
-#define CLK_TX_ICN_TS		9
-#define CLK_ICN_COMPO		9
-#define CLK_MMC_0		10
-#define CLK_MMC_1		11
-#define CLK_JPEGDEC		12
-#define CLK_ICN_REG		13
-#define CLK_TRACE_A9		13
-#define CLK_PTI_STM		13
-#define CLK_EXT2F_A9		13
-#define CLK_IC_BDISP_0		14
-#define CLK_IC_BDISP_1		15
-#define CLK_PP_DMU		16
-#define CLK_VID_DMU		17
-#define CLK_DSS_LPC		18
-#define CLK_ST231_AUD_0		19
-#define CLK_ST231_GP_0		19
-#define CLK_ST231_GP_1		20
-#define CLK_ST231_DMU		21
-#define CLK_ICN_LMI		22
-#define CLK_TX_ICN_DISP_0	23
-#define CLK_TX_ICN_DISP_1	23
-#define CLK_ICN_SBC		24
-#define CLK_STFE_FRC2		25
-#define CLK_ETH_PHY		26
-#define CLK_ETH_REF_PHYCLK	27
-#define CLK_FLASH_PROMIP	28
-#define CLK_MAIN_DISP		29
-#define CLK_AUX_DISP		30
-#define CLK_COMPO_DVP		31
-
-/* CLOCKGEN D0 */
-#define CLK_PCM_0		0
-#define CLK_PCM_1		1
-#define CLK_PCM_2		2
-#define CLK_SPDIFF		3
-
-/* CLOCKGEN D2 */
-#define CLK_PIX_MAIN_DISP	0
-#define CLK_PIX_PIP		1
-#define CLK_PIX_GDP1		2
-#define CLK_PIX_GDP2		3
-#define CLK_PIX_GDP3		4
-#define CLK_PIX_GDP4		5
-#define CLK_PIX_AUX_DISP	6
-#define CLK_DENC		7
-#define CLK_PIX_HDDAC		8
-#define CLK_HDDAC		9
-#define CLK_SDDAC		10
-#define CLK_PIX_DVO		11
-#define CLK_DVO			12
-#define CLK_PIX_HDMI		13
-#define CLK_TMDS_HDMI		14
-#define CLK_REF_HDMIPHY		15
-
-/* CLOCKGEN D3 */
-#define CLK_STFE_FRC1		0
-#define CLK_TSOUT_0		1
-#define CLK_TSOUT_1		2
-#define CLK_MCHI		3
-#define CLK_VSENS_COMPO		4
-#define CLK_FRC1_REMOTE		5
-#define CLK_LPC_0		6
-#define CLK_LPC_1		7
-#endif
diff --git a/include/dt-bindings/clock/stih410-clks.h b/include/dt-bindings/clock/stih410-clks.h
deleted file mode 100644
index 2097a4bbe155..000000000000
--- a/include/dt-bindings/clock/stih410-clks.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- * This header provides constants clk index STMicroelectronics
- * STiH410 SoC.
- */
-#ifndef _DT_BINDINGS_CLK_STIH410
-#define _DT_BINDINGS_CLK_STIH410
-
-#include "stih407-clks.h"
-
-/* STiH410 introduces new clock outputs compared to STiH407 */
-
-/* CLOCKGEN C0 */
-#define CLK_TX_ICN_HADES	32
-#define CLK_RX_ICN_HADES	33
-#define CLK_ICN_REG_16		34
-#define CLK_PP_HADES		35
-#define CLK_CLUST_HADES		36
-#define CLK_HWPE_HADES		37
-#define CLK_FC_HADES		38
-
-/* CLOCKGEN D0 */
-#define CLK_PCMR10_MASTER	4
-#define CLK_USB2_PHY		5
-
-#endif
diff --git a/include/dt-bindings/clock/stm32fx-clock.h b/include/dt-bindings/clock/stm32fx-clock.h
deleted file mode 100644
index e5dad050d518..000000000000
--- a/include/dt-bindings/clock/stm32fx-clock.h
+++ /dev/null
@@ -1,63 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * stm32fx-clock.h
- *
- * Copyright (C) 2016 STMicroelectronics
- * Author: Gabriel Fernandez for STMicroelectronics.
- */
-
-/*
- * List of clocks which are not derived from system clock (SYSCLOCK)
- *
- * The index of these clocks is the secondary index of DT bindings
- * (see Documentation/devicetree/bindings/clock/st,stm32-rcc.txt)
- *
- * e.g:
-	<assigned-clocks = <&rcc 1 CLK_LSE>;
-*/
-
-#ifndef _DT_BINDINGS_CLK_STMFX_H
-#define _DT_BINDINGS_CLK_STMFX_H
-
-#define SYSTICK			0
-#define FCLK			1
-#define CLK_LSI			2
-#define CLK_LSE			3
-#define CLK_HSE_RTC		4
-#define CLK_RTC			5
-#define PLL_VCO_I2S		6
-#define PLL_VCO_SAI		7
-#define CLK_LCD			8
-#define CLK_I2S			9
-#define CLK_SAI1		10
-#define CLK_SAI2		11
-#define CLK_I2SQ_PDIV		12
-#define CLK_SAIQ_PDIV		13
-#define CLK_HSI			14
-#define CLK_SYSCLK		15
-#define CLK_F469_DSI		16
-
-#define END_PRIMARY_CLK		17
-
-#define CLK_HDMI_CEC		16
-#define CLK_SPDIF		17
-#define CLK_USART1		18
-#define CLK_USART2		19
-#define CLK_USART3		20
-#define CLK_UART4		21
-#define CLK_UART5		22
-#define CLK_USART6		23
-#define CLK_UART7		24
-#define CLK_UART8		25
-#define CLK_I2C1		26
-#define CLK_I2C2		27
-#define CLK_I2C3		28
-#define CLK_I2C4		29
-#define CLK_LPTIMER		30
-#define CLK_PLL_SRC		31
-#define CLK_DFSDM1		32
-#define CLK_ADFSDM1		33
-#define CLK_F769_DSI		34
-#define END_PRIMARY_CLK_F7	35
-
-#endif
diff --git a/include/dt-bindings/clock/stm32h7-clks.h b/include/dt-bindings/clock/stm32h7-clks.h
deleted file mode 100644
index 4d87e7ebc39b..000000000000
--- a/include/dt-bindings/clock/stm32h7-clks.h
+++ /dev/null
@@ -1,167 +0,0 @@
-/* SYS, CORE AND BUS CLOCKS */
-#define SYS_D1CPRE 0
-#define HCLK 1
-#define PCLK1 2
-#define PCLK2 3
-#define PCLK3 4
-#define PCLK4 5
-#define HSI_DIV 6
-#define HSE_1M 7
-#define I2S_CKIN 8
-#define CK_DSI_PHY 9
-#define HSE_CK 10
-#define LSE_CK 11
-#define CSI_KER_DIV122 12
-#define RTC_CK 13
-#define CPU_SYSTICK 14
-
-/* OSCILLATOR BANK */
-#define OSC_BANK 18
-#define HSI_CK 18
-#define HSI_KER_CK 19
-#define CSI_CK 20
-#define CSI_KER_CK 21
-#define RC48_CK 22
-#define LSI_CK 23
-
-/* MCLOCK BANK */
-#define MCLK_BANK 28
-#define PER_CK 28
-#define PLLSRC 29
-#define SYS_CK 30
-#define TRACEIN_CK 31
-
-/* ODF BANK */
-#define ODF_BANK 32
-#define PLL1_P 32
-#define PLL1_Q 33
-#define PLL1_R 34
-#define PLL2_P 35
-#define PLL2_Q 36
-#define PLL2_R 37
-#define PLL3_P 38
-#define PLL3_Q 39
-#define PLL3_R 40
-
-/* MCO BANK */
-#define MCO_BANK 41
-#define MCO1 41
-#define MCO2 42
-
-/* PERIF BANK */
-#define PERIF_BANK 50
-#define D1SRAM1_CK 50
-#define ITCM_CK 51
-#define DTCM2_CK 52
-#define DTCM1_CK 53
-#define FLITF_CK 54
-#define JPGDEC_CK 55
-#define DMA2D_CK 56
-#define MDMA_CK 57
-#define USB2ULPI_CK 58
-#define USB1ULPI_CK 59
-#define ETH1RX_CK 60
-#define ETH1TX_CK 61
-#define ETH1MAC_CK 62
-#define ART_CK 63
-#define DMA2_CK 64
-#define DMA1_CK 65
-#define D2SRAM3_CK 66
-#define D2SRAM2_CK 67
-#define D2SRAM1_CK 68
-#define HASH_CK 69
-#define CRYPT_CK 70
-#define CAMITF_CK 71
-#define BKPRAM_CK 72
-#define HSEM_CK 73
-#define BDMA_CK 74
-#define CRC_CK 75
-#define GPIOK_CK 76
-#define GPIOJ_CK 77
-#define GPIOI_CK 78
-#define GPIOH_CK 79
-#define GPIOG_CK 80
-#define GPIOF_CK 81
-#define GPIOE_CK 82
-#define GPIOD_CK 83
-#define GPIOC_CK 84
-#define GPIOB_CK 85
-#define GPIOA_CK 86
-#define WWDG1_CK 87
-#define DAC12_CK 88
-#define WWDG2_CK 89
-#define TIM14_CK 90
-#define TIM13_CK 91
-#define TIM12_CK 92
-#define TIM7_CK 93
-#define TIM6_CK 94
-#define TIM5_CK 95
-#define TIM4_CK 96
-#define TIM3_CK 97
-#define TIM2_CK 98
-#define MDIOS_CK 99
-#define OPAMP_CK 100
-#define CRS_CK 101
-#define TIM17_CK 102
-#define TIM16_CK 103
-#define TIM15_CK 104
-#define TIM8_CK 105
-#define TIM1_CK 106
-#define TMPSENS_CK 107
-#define RTCAPB_CK 108
-#define VREF_CK 109
-#define COMP12_CK 110
-#define SYSCFG_CK 111
-/* must be equal to last peripheral clock index */
-#define LAST_PERIF_BANK SYSCFG_CK
-
-/* KERNEL BANK */
-#define KERN_BANK 120
-#define SDMMC1_CK 120
-#define QUADSPI_CK 121
-#define FMC_CK 122
-#define USB2OTG_CK 123
-#define USB1OTG_CK 124
-#define ADC12_CK 125
-#define SDMMC2_CK 126
-#define RNG_CK 127
-#define ADC3_CK 128
-#define DSI_CK 129
-#define LTDC_CK 130
-#define USART8_CK 131
-#define USART7_CK 132
-#define HDMICEC_CK 133
-#define I2C3_CK 134
-#define I2C2_CK 135
-#define I2C1_CK 136
-#define UART5_CK 137
-#define UART4_CK 138
-#define USART3_CK 139
-#define USART2_CK 140
-#define SPDIFRX_CK 141
-#define SPI3_CK 142
-#define SPI2_CK 143
-#define LPTIM1_CK 144
-#define FDCAN_CK 145
-#define SWP_CK 146
-#define HRTIM_CK 147
-#define DFSDM1_CK 148
-#define SAI3_CK 149
-#define SAI2_CK 150
-#define SAI1_CK 151
-#define SPI5_CK 152
-#define SPI4_CK 153
-#define SPI1_CK 154
-#define USART6_CK 155
-#define USART1_CK 156
-#define SAI4B_CK 157
-#define SAI4A_CK 158
-#define LPTIM5_CK 159
-#define LPTIM4_CK 160
-#define LPTIM3_CK 161
-#define LPTIM2_CK 162
-#define I2C4_CK 163
-#define SPI6_CK 164
-#define LPUART1_CK 165
-
-#define STM32H7_MAX_CLKS 166
diff --git a/include/dt-bindings/clock/stm32mp1-clks.h b/include/dt-bindings/clock/stm32mp1-clks.h
deleted file mode 100644
index 0a5324bcdbda..000000000000
--- a/include/dt-bindings/clock/stm32mp1-clks.h
+++ /dev/null
@@ -1,274 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
-/*
- * Copyright (C) STMicroelectronics 2018 - All Rights Reserved
- * Author: Gabriel Fernandez <gabriel.fernandez@st.com> for STMicroelectronics.
- */
-
-#ifndef _DT_BINDINGS_STM32MP1_CLKS_H_
-#define _DT_BINDINGS_STM32MP1_CLKS_H_
-
-/* OSCILLATOR clocks */
-#define CK_HSE		0
-#define CK_CSI		1
-#define CK_LSI		2
-#define CK_LSE		3
-#define CK_HSI		4
-#define CK_HSE_DIV2	5
-
-/* Bus clocks */
-#define TIM2		6
-#define TIM3		7
-#define TIM4		8
-#define TIM5		9
-#define TIM6		10
-#define TIM7		11
-#define TIM12		12
-#define TIM13		13
-#define TIM14		14
-#define LPTIM1		15
-#define SPI2		16
-#define SPI3		17
-#define USART2		18
-#define USART3		19
-#define UART4		20
-#define UART5		21
-#define UART7		22
-#define UART8		23
-#define I2C1		24
-#define I2C2		25
-#define I2C3		26
-#define I2C5		27
-#define SPDIF		28
-#define CEC		29
-#define DAC12		30
-#define MDIO		31
-#define TIM1		32
-#define TIM8		33
-#define TIM15		34
-#define TIM16		35
-#define TIM17		36
-#define SPI1		37
-#define SPI4		38
-#define SPI5		39
-#define USART6		40
-#define SAI1		41
-#define SAI2		42
-#define SAI3		43
-#define DFSDM		44
-#define FDCAN		45
-#define LPTIM2		46
-#define LPTIM3		47
-#define LPTIM4		48
-#define LPTIM5		49
-#define SAI4		50
-#define SYSCFG		51
-#define VREF		52
-#define TMPSENS		53
-#define PMBCTRL		54
-#define HDP		55
-#define LTDC		56
-#define DSI		57
-#define IWDG2		58
-#define USBPHY		59
-#define STGENRO		60
-#define SPI6		61
-#define I2C4		62
-#define I2C6		63
-#define USART1		64
-#define RTCAPB		65
-#define TZC1		66
-#define TZPC		67
-#define IWDG1		68
-#define BSEC		69
-#define STGEN		70
-#define DMA1		71
-#define DMA2		72
-#define DMAMUX		73
-#define ADC12		74
-#define USBO		75
-#define SDMMC3		76
-#define DCMI		77
-#define CRYP2		78
-#define HASH2		79
-#define RNG2		80
-#define CRC2		81
-#define HSEM		82
-#define IPCC		83
-#define GPIOA		84
-#define GPIOB		85
-#define GPIOC		86
-#define GPIOD		87
-#define GPIOE		88
-#define GPIOF		89
-#define GPIOG		90
-#define GPIOH		91
-#define GPIOI		92
-#define GPIOJ		93
-#define GPIOK		94
-#define GPIOZ		95
-#define CRYP1		96
-#define HASH1		97
-#define RNG1		98
-#define BKPSRAM		99
-#define MDMA		100
-#define GPU		101
-#define ETHCK		102
-#define ETHTX		103
-#define ETHRX		104
-#define ETHMAC		105
-#define FMC		106
-#define QSPI		107
-#define SDMMC1		108
-#define SDMMC2		109
-#define CRC1		110
-#define USBH		111
-#define ETHSTP		112
-#define TZC2		113
-
-/* Kernel clocks */
-#define SDMMC1_K	118
-#define SDMMC2_K	119
-#define SDMMC3_K	120
-#define FMC_K		121
-#define QSPI_K		122
-#define ETHCK_K		123
-#define RNG1_K		124
-#define RNG2_K		125
-#define GPU_K		126
-#define USBPHY_K	127
-#define STGEN_K		128
-#define SPDIF_K		129
-#define SPI1_K		130
-#define SPI2_K		131
-#define SPI3_K		132
-#define SPI4_K		133
-#define SPI5_K		134
-#define SPI6_K		135
-#define CEC_K		136
-#define I2C1_K		137
-#define I2C2_K		138
-#define I2C3_K		139
-#define I2C4_K		140
-#define I2C5_K		141
-#define I2C6_K		142
-#define LPTIM1_K	143
-#define LPTIM2_K	144
-#define LPTIM3_K	145
-#define LPTIM4_K	146
-#define LPTIM5_K	147
-#define USART1_K	148
-#define USART2_K	149
-#define USART3_K	150
-#define UART4_K		151
-#define UART5_K		152
-#define USART6_K	153
-#define UART7_K		154
-#define UART8_K		155
-#define DFSDM_K		156
-#define FDCAN_K		157
-#define SAI1_K		158
-#define SAI2_K		159
-#define SAI3_K		160
-#define SAI4_K		161
-#define ADC12_K		162
-#define DSI_K		163
-#define DSI_PX		164
-#define ADFSDM_K	165
-#define USBO_K		166
-#define LTDC_PX		167
-#define DAC12_K		168
-#define ETHPTP_K	169
-
-/* PLL */
-#define PLL1		176
-#define PLL2		177
-#define PLL3		178
-#define PLL4		179
-
-/* ODF */
-#define PLL1_P		180
-#define PLL1_Q		181
-#define PLL1_R		182
-#define PLL2_P		183
-#define PLL2_Q		184
-#define PLL2_R		185
-#define PLL3_P		186
-#define PLL3_Q		187
-#define PLL3_R		188
-#define PLL4_P		189
-#define PLL4_Q		190
-#define PLL4_R		191
-
-/* AUX */
-#define RTC		192
-
-/* MCLK */
-#define CK_PER		193
-#define CK_MPU		194
-#define CK_AXI		195
-#define CK_MCU		196
-
-/* Time base */
-#define TIM2_K		197
-#define TIM3_K		198
-#define TIM4_K		199
-#define TIM5_K		200
-#define TIM6_K		201
-#define TIM7_K		202
-#define TIM12_K		203
-#define TIM13_K		204
-#define TIM14_K		205
-#define TIM1_K		206
-#define TIM8_K		207
-#define TIM15_K		208
-#define TIM16_K		209
-#define TIM17_K		210
-
-/* MCO clocks */
-#define CK_MCO1		211
-#define CK_MCO2		212
-
-/* TRACE & DEBUG clocks */
-#define CK_DBG		214
-#define CK_TRACE	215
-
-/* DDR */
-#define DDRC1		220
-#define DDRC1LP		221
-#define DDRC2		222
-#define DDRC2LP		223
-#define DDRPHYC		224
-#define DDRPHYCLP	225
-#define DDRCAPB		226
-#define DDRCAPBLP	227
-#define AXIDCG		228
-#define DDRPHYCAPB	229
-#define DDRPHYCAPBLP	230
-#define DDRPERFM	231
-
-#define STM32MP1_LAST_CLK 232
-
-/* SCMI clock identifiers */
-#define CK_SCMI_HSE		0
-#define CK_SCMI_HSI		1
-#define CK_SCMI_CSI		2
-#define CK_SCMI_LSE		3
-#define CK_SCMI_LSI		4
-#define CK_SCMI_PLL2_Q		5
-#define CK_SCMI_PLL2_R		6
-#define CK_SCMI_MPU		7
-#define CK_SCMI_AXI		8
-#define CK_SCMI_BSEC		9
-#define CK_SCMI_CRYP1		10
-#define CK_SCMI_GPIOZ		11
-#define CK_SCMI_HASH1		12
-#define CK_SCMI_I2C4		13
-#define CK_SCMI_I2C6		14
-#define CK_SCMI_IWDG1		15
-#define CK_SCMI_RNG1		16
-#define CK_SCMI_RTC		17
-#define CK_SCMI_RTCAPB		18
-#define CK_SCMI_SPI6		19
-#define CK_SCMI_USART1		20
-
-#endif /* _DT_BINDINGS_STM32MP1_CLKS_H_ */
diff --git a/include/dt-bindings/clock/stm32mp13-clks.h b/include/dt-bindings/clock/stm32mp13-clks.h
deleted file mode 100644
index 0bd7b54c65ff..000000000000
--- a/include/dt-bindings/clock/stm32mp13-clks.h
+++ /dev/null
@@ -1,229 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause */
-/*
- * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
- * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
- */
-
-#ifndef _DT_BINDINGS_STM32MP13_CLKS_H_
-#define _DT_BINDINGS_STM32MP13_CLKS_H_
-
-/* OSCILLATOR clocks */
-#define CK_HSE		0
-#define CK_CSI		1
-#define CK_LSI		2
-#define CK_LSE		3
-#define CK_HSI		4
-#define CK_HSE_DIV2	5
-
-/* PLL */
-#define PLL1		6
-#define PLL2		7
-#define PLL3		8
-#define PLL4		9
-
-/* ODF */
-#define PLL1_P		10
-#define PLL1_Q		11
-#define PLL1_R		12
-#define PLL2_P		13
-#define PLL2_Q		14
-#define PLL2_R		15
-#define PLL3_P		16
-#define PLL3_Q		17
-#define PLL3_R		18
-#define PLL4_P		19
-#define PLL4_Q		20
-#define PLL4_R		21
-
-#define PCLK1		22
-#define PCLK2		23
-#define PCLK3		24
-#define PCLK4		25
-#define PCLK5		26
-#define PCLK6		27
-
-/* SYSTEM CLOCK */
-#define CK_PER		28
-#define CK_MPU		29
-#define CK_AXI		30
-#define CK_MLAHB	31
-
-/* BASE TIMER */
-#define CK_TIMG1	32
-#define CK_TIMG2	33
-#define CK_TIMG3	34
-
-/* AUX */
-#define RTC		35
-
-/* TRACE & DEBUG clocks */
-#define CK_DBG		36
-#define CK_TRACE	37
-
-/* MCO clocks */
-#define CK_MCO1		38
-#define CK_MCO2		39
-
-/* IP clocks */
-#define SYSCFG		40
-#define VREF		41
-#define DTS		42
-#define PMBCTRL		43
-#define HDP		44
-#define IWDG2		45
-#define STGENRO		46
-#define USART1		47
-#define RTCAPB		48
-#define TZC		49
-#define TZPC		50
-#define IWDG1		51
-#define BSEC		52
-#define DMA1		53
-#define DMA2		54
-#define DMAMUX1		55
-#define DMAMUX2		56
-#define GPIOA		57
-#define GPIOB		58
-#define GPIOC		59
-#define GPIOD		60
-#define GPIOE		61
-#define GPIOF		62
-#define GPIOG		63
-#define GPIOH		64
-#define GPIOI		65
-#define CRYP1		66
-#define HASH1		67
-#define BKPSRAM		68
-#define MDMA		69
-#define CRC1		70
-#define USBH		71
-#define DMA3		72
-#define TSC		73
-#define PKA		74
-#define AXIMC		75
-#define MCE		76
-#define ETH1TX		77
-#define ETH2TX		78
-#define ETH1RX		79
-#define ETH2RX		80
-#define ETH1MAC		81
-#define ETH2MAC		82
-#define ETH1STP		83
-#define ETH2STP		84
-
-/* IP clocks with parents */
-#define SDMMC1_K	85
-#define SDMMC2_K	86
-#define ADC1_K		87
-#define ADC2_K		88
-#define FMC_K		89
-#define QSPI_K		90
-#define RNG1_K		91
-#define USBPHY_K	92
-#define STGEN_K		93
-#define SPDIF_K		94
-#define SPI1_K		95
-#define SPI2_K		96
-#define SPI3_K		97
-#define SPI4_K		98
-#define SPI5_K		99
-#define I2C1_K		100
-#define I2C2_K		101
-#define I2C3_K		102
-#define I2C4_K		103
-#define I2C5_K		104
-#define TIM2_K		105
-#define TIM3_K		106
-#define TIM4_K		107
-#define TIM5_K		108
-#define TIM6_K		109
-#define TIM7_K		110
-#define TIM12_K		111
-#define TIM13_K		112
-#define TIM14_K		113
-#define TIM1_K		114
-#define TIM8_K		115
-#define TIM15_K		116
-#define TIM16_K		117
-#define TIM17_K		118
-#define LPTIM1_K	119
-#define LPTIM2_K	120
-#define LPTIM3_K	121
-#define LPTIM4_K	122
-#define LPTIM5_K	123
-#define USART1_K	124
-#define USART2_K	125
-#define USART3_K	126
-#define UART4_K		127
-#define UART5_K		128
-#define USART6_K	129
-#define UART7_K		130
-#define UART8_K		131
-#define DFSDM_K		132
-#define FDCAN_K		133
-#define SAI1_K		134
-#define SAI2_K		135
-#define ADFSDM_K	136
-#define USBO_K		137
-#define LTDC_PX		138
-#define ETH1CK_K	139
-#define ETH1PTP_K	140
-#define ETH2CK_K	141
-#define ETH2PTP_K	142
-#define DCMIPP_K	143
-#define SAES_K		144
-#define DTS_K		145
-
-/* DDR */
-#define DDRC1		146
-#define DDRC1LP		147
-#define DDRC2		148
-#define DDRC2LP		149
-#define DDRPHYC		150
-#define DDRPHYCLP	151
-#define DDRCAPB		152
-#define DDRCAPBLP	153
-#define AXIDCG		154
-#define DDRPHYCAPB	155
-#define DDRPHYCAPBLP	156
-#define DDRPERFM	157
-
-#define ADC1		158
-#define ADC2		159
-#define SAI1		160
-#define SAI2		161
-
-#define STM32MP1_LAST_CLK 162
-
-/* SCMI clock identifiers */
-#define CK_SCMI_HSE		0
-#define CK_SCMI_HSI		1
-#define CK_SCMI_CSI		2
-#define CK_SCMI_LSE		3
-#define CK_SCMI_LSI		4
-#define CK_SCMI_HSE_DIV2	5
-#define CK_SCMI_PLL2_Q		6
-#define CK_SCMI_PLL2_R		7
-#define CK_SCMI_PLL3_P		8
-#define CK_SCMI_PLL3_Q		9
-#define CK_SCMI_PLL3_R		10
-#define CK_SCMI_PLL4_P		11
-#define CK_SCMI_PLL4_Q		12
-#define CK_SCMI_PLL4_R		13
-#define CK_SCMI_MPU		14
-#define CK_SCMI_AXI		15
-#define CK_SCMI_MLAHB		16
-#define CK_SCMI_CKPER		17
-#define CK_SCMI_PCLK1		18
-#define CK_SCMI_PCLK2		19
-#define CK_SCMI_PCLK3		20
-#define CK_SCMI_PCLK4		21
-#define CK_SCMI_PCLK5		22
-#define CK_SCMI_PCLK6		23
-#define CK_SCMI_CKTIMG1		24
-#define CK_SCMI_CKTIMG2		25
-#define CK_SCMI_CKTIMG3		26
-#define CK_SCMI_RTC		27
-#define CK_SCMI_RTCAPB		28
-
-#endif /* _DT_BINDINGS_STM32MP13_CLKS_H_ */
diff --git a/include/dt-bindings/mfd/st,stpmic1.h b/include/dt-bindings/mfd/st,stpmic1.h
deleted file mode 100644
index 321cd08797d9..000000000000
--- a/include/dt-bindings/mfd/st,stpmic1.h
+++ /dev/null
@@ -1,50 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) STMicroelectronics 2018 - All Rights Reserved
- * Author: Philippe Peurichard <philippe.peurichard@st.com>,
- * Pascal Paillet <p.paillet@st.com> for STMicroelectronics.
- */
-
-#ifndef __DT_BINDINGS_STPMIC1_H__
-#define __DT_BINDINGS_STPMIC1_H__
-
-/* IRQ definitions */
-#define IT_PONKEY_F	0
-#define IT_PONKEY_R	1
-#define IT_WAKEUP_F	2
-#define IT_WAKEUP_R	3
-#define IT_VBUS_OTG_F	4
-#define IT_VBUS_OTG_R	5
-#define IT_SWOUT_F	6
-#define IT_SWOUT_R	7
-
-#define IT_CURLIM_BUCK1	8
-#define IT_CURLIM_BUCK2	9
-#define IT_CURLIM_BUCK3	10
-#define IT_CURLIM_BUCK4	11
-#define IT_OCP_OTG	12
-#define IT_OCP_SWOUT	13
-#define IT_OCP_BOOST	14
-#define IT_OVP_BOOST	15
-
-#define IT_CURLIM_LDO1	16
-#define IT_CURLIM_LDO2	17
-#define IT_CURLIM_LDO3	18
-#define IT_CURLIM_LDO4	19
-#define IT_CURLIM_LDO5	20
-#define IT_CURLIM_LDO6	21
-#define IT_SHORT_SWOTG	22
-#define IT_SHORT_SWOUT	23
-
-#define IT_TWARN_F	24
-#define IT_TWARN_R	25
-#define IT_VINLOW_F	26
-#define IT_VINLOW_R	27
-#define IT_SWIN_F	30
-#define IT_SWIN_R	31
-
-/* BUCK MODES definitions */
-#define STPMIC1_BUCK_MODE_NORMAL 0
-#define STPMIC1_BUCK_MODE_LP 2
-
-#endif /* __DT_BINDINGS_STPMIC1_H__ */
diff --git a/include/dt-bindings/mfd/st-lpc.h b/include/dt-bindings/mfd/st-lpc.h
deleted file mode 100644
index d05894afa7e7..000000000000
--- a/include/dt-bindings/mfd/st-lpc.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/*
- * This header provides shared DT/Driver defines for ST's LPC device
- *
- * Copyright (C) 2014 STMicroelectronics -- All Rights Reserved
- *
- * Author: Lee Jones <lee.jones@linaro.org> for STMicroelectronics
- */
-
-#ifndef __DT_BINDINGS_ST_LPC_H__
-#define __DT_BINDINGS_ST_LPC_H__
-
-#define ST_LPC_MODE_RTC		0
-#define ST_LPC_MODE_WDT		1
-#define ST_LPC_MODE_CLKSRC	2
-
-#endif /* __DT_BINDINGS_ST_LPC_H__ */
diff --git a/include/dt-bindings/mfd/stm32f4-rcc.h b/include/dt-bindings/mfd/stm32f4-rcc.h
deleted file mode 100644
index 36448a5619a1..000000000000
--- a/include/dt-bindings/mfd/stm32f4-rcc.h
+++ /dev/null
@@ -1,108 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * This header provides constants for the STM32F4 RCC IP
- */
-
-#ifndef _DT_BINDINGS_MFD_STM32F4_RCC_H
-#define _DT_BINDINGS_MFD_STM32F4_RCC_H
-
-/* AHB1 */
-#define STM32F4_RCC_AHB1_GPIOA	0
-#define STM32F4_RCC_AHB1_GPIOB	1
-#define STM32F4_RCC_AHB1_GPIOC	2
-#define STM32F4_RCC_AHB1_GPIOD	3
-#define STM32F4_RCC_AHB1_GPIOE	4
-#define STM32F4_RCC_AHB1_GPIOF	5
-#define STM32F4_RCC_AHB1_GPIOG	6
-#define STM32F4_RCC_AHB1_GPIOH	7
-#define STM32F4_RCC_AHB1_GPIOI	8
-#define STM32F4_RCC_AHB1_GPIOJ	9
-#define STM32F4_RCC_AHB1_GPIOK	10
-#define STM32F4_RCC_AHB1_CRC	12
-#define STM32F4_RCC_AHB1_BKPSRAM	18
-#define STM32F4_RCC_AHB1_CCMDATARAM	20
-#define STM32F4_RCC_AHB1_DMA1	21
-#define STM32F4_RCC_AHB1_DMA2	22
-#define STM32F4_RCC_AHB1_DMA2D	23
-#define STM32F4_RCC_AHB1_ETHMAC	25
-#define STM32F4_RCC_AHB1_ETHMACTX	26
-#define STM32F4_RCC_AHB1_ETHMACRX	27
-#define STM32F4_RCC_AHB1_ETHMACPTP	28
-#define STM32F4_RCC_AHB1_OTGHS		29
-#define STM32F4_RCC_AHB1_OTGHSULPI	30
-
-#define STM32F4_AHB1_RESET(bit) (STM32F4_RCC_AHB1_##bit + (0x10 * 8))
-#define STM32F4_AHB1_CLOCK(bit) (STM32F4_RCC_AHB1_##bit)
-
-/* AHB2 */
-#define STM32F4_RCC_AHB2_DCMI	0
-#define STM32F4_RCC_AHB2_CRYP	4
-#define STM32F4_RCC_AHB2_HASH	5
-#define STM32F4_RCC_AHB2_RNG	6
-#define STM32F4_RCC_AHB2_OTGFS	7
-
-#define STM32F4_AHB2_RESET(bit)	(STM32F4_RCC_AHB2_##bit + (0x14 * 8))
-#define STM32F4_AHB2_CLOCK(bit)	(STM32F4_RCC_AHB2_##bit + 0x20)
-
-/* AHB3 */
-#define STM32F4_RCC_AHB3_FMC	0
-#define STM32F4_RCC_AHB3_QSPI	1
-
-#define STM32F4_AHB3_RESET(bit)	(STM32F4_RCC_AHB3_##bit + (0x18 * 8))
-#define STM32F4_AHB3_CLOCK(bit)	(STM32F4_RCC_AHB3_##bit + 0x40)
-
-/* APB1 */
-#define STM32F4_RCC_APB1_TIM2	0
-#define STM32F4_RCC_APB1_TIM3	1
-#define STM32F4_RCC_APB1_TIM4	2
-#define STM32F4_RCC_APB1_TIM5	3
-#define STM32F4_RCC_APB1_TIM6	4
-#define STM32F4_RCC_APB1_TIM7	5
-#define STM32F4_RCC_APB1_TIM12	6
-#define STM32F4_RCC_APB1_TIM13	7
-#define STM32F4_RCC_APB1_TIM14	8
-#define STM32F4_RCC_APB1_WWDG	11
-#define STM32F4_RCC_APB1_SPI2	14
-#define STM32F4_RCC_APB1_SPI3	15
-#define STM32F4_RCC_APB1_UART2	17
-#define STM32F4_RCC_APB1_UART3	18
-#define STM32F4_RCC_APB1_UART4	19
-#define STM32F4_RCC_APB1_UART5	20
-#define STM32F4_RCC_APB1_I2C1	21
-#define STM32F4_RCC_APB1_I2C2	22
-#define STM32F4_RCC_APB1_I2C3	23
-#define STM32F4_RCC_APB1_CAN1	25
-#define STM32F4_RCC_APB1_CAN2	26
-#define STM32F4_RCC_APB1_PWR	28
-#define STM32F4_RCC_APB1_DAC	29
-#define STM32F4_RCC_APB1_UART7	30
-#define STM32F4_RCC_APB1_UART8	31
-
-#define STM32F4_APB1_RESET(bit)	(STM32F4_RCC_APB1_##bit + (0x20 * 8))
-#define STM32F4_APB1_CLOCK(bit)	(STM32F4_RCC_APB1_##bit + 0x80)
-
-/* APB2 */
-#define STM32F4_RCC_APB2_TIM1	0
-#define STM32F4_RCC_APB2_TIM8	1
-#define STM32F4_RCC_APB2_USART1	4
-#define STM32F4_RCC_APB2_USART6	5
-#define STM32F4_RCC_APB2_ADC1	8
-#define STM32F4_RCC_APB2_ADC2	9
-#define STM32F4_RCC_APB2_ADC3	10
-#define STM32F4_RCC_APB2_SDIO	11
-#define STM32F4_RCC_APB2_SPI1	12
-#define STM32F4_RCC_APB2_SPI4	13
-#define STM32F4_RCC_APB2_SYSCFG	14
-#define STM32F4_RCC_APB2_TIM9	16
-#define STM32F4_RCC_APB2_TIM10	17
-#define STM32F4_RCC_APB2_TIM11	18
-#define STM32F4_RCC_APB2_SPI5	20
-#define STM32F4_RCC_APB2_SPI6	21
-#define STM32F4_RCC_APB2_SAI1	22
-#define STM32F4_RCC_APB2_LTDC	26
-#define STM32F4_RCC_APB2_DSI	27
-
-#define STM32F4_APB2_RESET(bit)	(STM32F4_RCC_APB2_##bit + (0x24 * 8))
-#define STM32F4_APB2_CLOCK(bit)	(STM32F4_RCC_APB2_##bit + 0xA0)
-
-#endif /* _DT_BINDINGS_MFD_STM32F4_RCC_H */
diff --git a/include/dt-bindings/mfd/stm32f7-rcc.h b/include/dt-bindings/mfd/stm32f7-rcc.h
deleted file mode 100644
index a4e4f9271395..000000000000
--- a/include/dt-bindings/mfd/stm32f7-rcc.h
+++ /dev/null
@@ -1,116 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * This header provides constants for the STM32F7 RCC IP
- */
-
-#ifndef _DT_BINDINGS_MFD_STM32F7_RCC_H
-#define _DT_BINDINGS_MFD_STM32F7_RCC_H
-
-/* AHB1 */
-#define STM32F7_RCC_AHB1_GPIOA		0
-#define STM32F7_RCC_AHB1_GPIOB		1
-#define STM32F7_RCC_AHB1_GPIOC		2
-#define STM32F7_RCC_AHB1_GPIOD		3
-#define STM32F7_RCC_AHB1_GPIOE		4
-#define STM32F7_RCC_AHB1_GPIOF		5
-#define STM32F7_RCC_AHB1_GPIOG		6
-#define STM32F7_RCC_AHB1_GPIOH		7
-#define STM32F7_RCC_AHB1_GPIOI		8
-#define STM32F7_RCC_AHB1_GPIOJ		9
-#define STM32F7_RCC_AHB1_GPIOK		10
-#define STM32F7_RCC_AHB1_CRC		12
-#define STM32F7_RCC_AHB1_BKPSRAM	18
-#define STM32F7_RCC_AHB1_DTCMRAM	20
-#define STM32F7_RCC_AHB1_DMA1		21
-#define STM32F7_RCC_AHB1_DMA2		22
-#define STM32F7_RCC_AHB1_DMA2D		23
-#define STM32F7_RCC_AHB1_ETHMAC		25
-#define STM32F7_RCC_AHB1_ETHMACTX	26
-#define STM32F7_RCC_AHB1_ETHMACRX	27
-#define STM32FF_RCC_AHB1_ETHMACPTP	28
-#define STM32F7_RCC_AHB1_OTGHS		29
-#define STM32F7_RCC_AHB1_OTGHSULPI	30
-
-#define STM32F7_AHB1_RESET(bit) (STM32F7_RCC_AHB1_##bit + (0x10 * 8))
-#define STM32F7_AHB1_CLOCK(bit) (STM32F7_RCC_AHB1_##bit)
-
-
-/* AHB2 */
-#define STM32F7_RCC_AHB2_DCMI		0
-#define STM32F7_RCC_AHB2_CRYP		4
-#define STM32F7_RCC_AHB2_HASH		5
-#define STM32F7_RCC_AHB2_RNG		6
-#define STM32F7_RCC_AHB2_OTGFS		7
-
-#define STM32F7_AHB2_RESET(bit)	(STM32F7_RCC_AHB2_##bit + (0x14 * 8))
-#define STM32F7_AHB2_CLOCK(bit)	(STM32F7_RCC_AHB2_##bit + 0x20)
-
-/* AHB3 */
-#define STM32F7_RCC_AHB3_FMC		0
-#define STM32F7_RCC_AHB3_QSPI		1
-
-#define STM32F7_AHB3_RESET(bit)	(STM32F7_RCC_AHB3_##bit + (0x18 * 8))
-#define STM32F7_AHB3_CLOCK(bit)	(STM32F7_RCC_AHB3_##bit + 0x40)
-
-/* APB1 */
-#define STM32F7_RCC_APB1_TIM2		0
-#define STM32F7_RCC_APB1_TIM3		1
-#define STM32F7_RCC_APB1_TIM4		2
-#define STM32F7_RCC_APB1_TIM5		3
-#define STM32F7_RCC_APB1_TIM6		4
-#define STM32F7_RCC_APB1_TIM7		5
-#define STM32F7_RCC_APB1_TIM12		6
-#define STM32F7_RCC_APB1_TIM13		7
-#define STM32F7_RCC_APB1_TIM14		8
-#define STM32F7_RCC_APB1_LPTIM1		9
-#define STM32F7_RCC_APB1_WWDG		11
-#define STM32F7_RCC_APB1_CAN3		13
-#define STM32F7_RCC_APB1_SPI2		14
-#define STM32F7_RCC_APB1_SPI3		15
-#define STM32F7_RCC_APB1_SPDIFRX	16
-#define STM32F7_RCC_APB1_UART2		17
-#define STM32F7_RCC_APB1_UART3		18
-#define STM32F7_RCC_APB1_UART4		19
-#define STM32F7_RCC_APB1_UART5		20
-#define STM32F7_RCC_APB1_I2C1		21
-#define STM32F7_RCC_APB1_I2C2		22
-#define STM32F7_RCC_APB1_I2C3		23
-#define STM32F7_RCC_APB1_I2C4		24
-#define STM32F7_RCC_APB1_CAN1		25
-#define STM32F7_RCC_APB1_CAN2		26
-#define STM32F7_RCC_APB1_CEC		27
-#define STM32F7_RCC_APB1_PWR		28
-#define STM32F7_RCC_APB1_DAC		29
-#define STM32F7_RCC_APB1_UART7		30
-#define STM32F7_RCC_APB1_UART8		31
-
-#define STM32F7_APB1_RESET(bit)	(STM32F7_RCC_APB1_##bit + (0x20 * 8))
-#define STM32F7_APB1_CLOCK(bit)	(STM32F7_RCC_APB1_##bit + 0x80)
-
-/* APB2 */
-#define STM32F7_RCC_APB2_TIM1		0
-#define STM32F7_RCC_APB2_TIM8		1
-#define STM32F7_RCC_APB2_USART1		4
-#define STM32F7_RCC_APB2_USART6		5
-#define STM32F7_RCC_APB2_SDMMC2		7
-#define STM32F7_RCC_APB2_ADC1		8
-#define STM32F7_RCC_APB2_ADC2		9
-#define STM32F7_RCC_APB2_ADC3		10
-#define STM32F7_RCC_APB2_SDMMC1		11
-#define STM32F7_RCC_APB2_SPI1		12
-#define STM32F7_RCC_APB2_SPI4		13
-#define STM32F7_RCC_APB2_SYSCFG		14
-#define STM32F7_RCC_APB2_TIM9		16
-#define STM32F7_RCC_APB2_TIM10		17
-#define STM32F7_RCC_APB2_TIM11		18
-#define STM32F7_RCC_APB2_SPI5		20
-#define STM32F7_RCC_APB2_SPI6		21
-#define STM32F7_RCC_APB2_SAI1		22
-#define STM32F7_RCC_APB2_SAI2		23
-#define STM32F7_RCC_APB2_LTDC		26
-#define STM32F7_RCC_APB2_DSI		27
-
-#define STM32F7_APB2_RESET(bit)	(STM32F7_RCC_APB2_##bit + (0x24 * 8))
-#define STM32F7_APB2_CLOCK(bit)	(STM32F7_RCC_APB2_##bit + 0xA0)
-
-#endif /* _DT_BINDINGS_MFD_STM32F7_RCC_H */
diff --git a/include/dt-bindings/mfd/stm32h7-rcc.h b/include/dt-bindings/mfd/stm32h7-rcc.h
deleted file mode 100644
index 06e8476bf08f..000000000000
--- a/include/dt-bindings/mfd/stm32h7-rcc.h
+++ /dev/null
@@ -1,138 +0,0 @@
-/*
- * This header provides constants for the STM32H7 RCC IP
- */
-
-#ifndef _DT_BINDINGS_MFD_STM32H7_RCC_H
-#define _DT_BINDINGS_MFD_STM32H7_RCC_H
-
-/* AHB3 */
-#define STM32H7_RCC_AHB3_MDMA		0
-#define STM32H7_RCC_AHB3_DMA2D		4
-#define STM32H7_RCC_AHB3_JPGDEC		5
-#define STM32H7_RCC_AHB3_FMC		12
-#define STM32H7_RCC_AHB3_QUADSPI	14
-#define STM32H7_RCC_AHB3_SDMMC1		16
-#define STM32H7_RCC_AHB3_CPU		31
-#define STM32H7_RCC_AHB3_CPU1		31
-
-#define STM32H7_AHB3_RESET(bit) (STM32H7_RCC_AHB3_##bit + (0x7C * 8))
-
-/* AHB1 */
-#define STM32H7_RCC_AHB1_DMA1		0
-#define STM32H7_RCC_AHB1_DMA2		1
-#define STM32H7_RCC_AHB1_ADC12		5
-#define STM32H7_RCC_AHB1_ART		14
-#define STM32H7_RCC_AHB1_ETH1MAC	15
-#define STM32H7_RCC_AHB1_USB1OTG	25
-#define STM32H7_RCC_AHB1_USB2OTG	27
-#define STM32H7_RCC_AHB1_CPU2		31
-
-#define STM32H7_AHB1_RESET(bit) (STM32H7_RCC_AHB1_##bit + (0x80 * 8))
-
-/* AHB2 */
-#define STM32H7_RCC_AHB2_CAMITF		0
-#define STM32H7_RCC_AHB2_CRYPT		4
-#define STM32H7_RCC_AHB2_HASH		5
-#define STM32H7_RCC_AHB2_RNG		6
-#define STM32H7_RCC_AHB2_SDMMC2		9
-
-#define STM32H7_AHB2_RESET(bit) (STM32H7_RCC_AHB2_##bit + (0x84 * 8))
-
-/* AHB4 */
-#define STM32H7_RCC_AHB4_GPIOA		0
-#define STM32H7_RCC_AHB4_GPIOB		1
-#define STM32H7_RCC_AHB4_GPIOC		2
-#define STM32H7_RCC_AHB4_GPIOD		3
-#define STM32H7_RCC_AHB4_GPIOE		4
-#define STM32H7_RCC_AHB4_GPIOF		5
-#define STM32H7_RCC_AHB4_GPIOG		6
-#define STM32H7_RCC_AHB4_GPIOH		7
-#define STM32H7_RCC_AHB4_GPIOI		8
-#define STM32H7_RCC_AHB4_GPIOJ		9
-#define STM32H7_RCC_AHB4_GPIOK		10
-#define STM32H7_RCC_AHB4_CRC		19
-#define STM32H7_RCC_AHB4_BDMA		21
-#define STM32H7_RCC_AHB4_ADC3		24
-#define STM32H7_RCC_AHB4_HSEM		25
-
-#define STM32H7_AHB4_RESET(bit) (STM32H7_RCC_AHB4_##bit + (0x88 * 8))
-
-/* APB3 */
-#define STM32H7_RCC_APB3_LTDC		3
-#define STM32H7_RCC_APB3_DSI		4
-
-#define STM32H7_APB3_RESET(bit) (STM32H7_RCC_APB3_##bit + (0x8C * 8))
-
-/* APB1L */
-#define STM32H7_RCC_APB1L_TIM2		0
-#define STM32H7_RCC_APB1L_TIM3		1
-#define STM32H7_RCC_APB1L_TIM4		2
-#define STM32H7_RCC_APB1L_TIM5		3
-#define STM32H7_RCC_APB1L_TIM6		4
-#define STM32H7_RCC_APB1L_TIM7		5
-#define STM32H7_RCC_APB1L_TIM12		6
-#define STM32H7_RCC_APB1L_TIM13		7
-#define STM32H7_RCC_APB1L_TIM14		8
-#define STM32H7_RCC_APB1L_LPTIM1	9
-#define STM32H7_RCC_APB1L_SPI2		14
-#define STM32H7_RCC_APB1L_SPI3		15
-#define STM32H7_RCC_APB1L_SPDIF_RX	16
-#define STM32H7_RCC_APB1L_USART2	17
-#define STM32H7_RCC_APB1L_USART3	18
-#define STM32H7_RCC_APB1L_UART4		19
-#define STM32H7_RCC_APB1L_UART5		20
-#define STM32H7_RCC_APB1L_I2C1		21
-#define STM32H7_RCC_APB1L_I2C2		22
-#define STM32H7_RCC_APB1L_I2C3		23
-#define STM32H7_RCC_APB1L_HDMICEC	27
-#define STM32H7_RCC_APB1L_DAC12		29
-#define STM32H7_RCC_APB1L_USART7	30
-#define STM32H7_RCC_APB1L_USART8	31
-
-#define STM32H7_APB1L_RESET(bit) (STM32H7_RCC_APB1L_##bit + (0x90 * 8))
-
-/* APB1H */
-#define STM32H7_RCC_APB1H_CRS		1
-#define STM32H7_RCC_APB1H_SWP		2
-#define STM32H7_RCC_APB1H_OPAMP		4
-#define STM32H7_RCC_APB1H_MDIOS		5
-#define STM32H7_RCC_APB1H_FDCAN		8
-
-#define STM32H7_APB1H_RESET(bit) (STM32H7_RCC_APB1H_##bit + (0x94 * 8))
-
-/* APB2 */
-#define STM32H7_RCC_APB2_TIM1		0
-#define STM32H7_RCC_APB2_TIM8		1
-#define STM32H7_RCC_APB2_USART1		4
-#define STM32H7_RCC_APB2_USART6		5
-#define STM32H7_RCC_APB2_SPI1		12
-#define STM32H7_RCC_APB2_SPI4		13
-#define STM32H7_RCC_APB2_TIM15		16
-#define STM32H7_RCC_APB2_TIM16		17
-#define STM32H7_RCC_APB2_TIM17		18
-#define STM32H7_RCC_APB2_SPI5		20
-#define STM32H7_RCC_APB2_SAI1		22
-#define STM32H7_RCC_APB2_SAI2		23
-#define STM32H7_RCC_APB2_SAI3		24
-#define STM32H7_RCC_APB2_DFSDM1		28
-#define STM32H7_RCC_APB2_HRTIM		29
-
-#define STM32H7_APB2_RESET(bit) (STM32H7_RCC_APB2_##bit + (0x98 * 8))
-
-/* APB4 */
-#define STM32H7_RCC_APB4_SYSCFG		1
-#define STM32H7_RCC_APB4_LPUART1	3
-#define STM32H7_RCC_APB4_SPI6		5
-#define STM32H7_RCC_APB4_I2C4		7
-#define STM32H7_RCC_APB4_LPTIM2		9
-#define STM32H7_RCC_APB4_LPTIM3		10
-#define STM32H7_RCC_APB4_LPTIM4		11
-#define STM32H7_RCC_APB4_LPTIM5		12
-#define STM32H7_RCC_APB4_COMP12		14
-#define STM32H7_RCC_APB4_VREF		15
-#define STM32H7_RCC_APB4_SAI4		21
-#define STM32H7_RCC_APB4_TMPSENS	26
-
-#define STM32H7_APB4_RESET(bit) (STM32H7_RCC_APB4_##bit + (0x9C * 8))
-
-#endif /* _DT_BINDINGS_MFD_STM32H7_RCC_H */
diff --git a/include/dt-bindings/pinctrl/stm32-pinfunc.h b/include/dt-bindings/pinctrl/stm32-pinfunc.h
deleted file mode 100644
index 28ad0235086a..000000000000
--- a/include/dt-bindings/pinctrl/stm32-pinfunc.h
+++ /dev/null
@@ -1,45 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
-/*
- * Copyright (C) STMicroelectronics 2017 - All Rights Reserved
- * Author: Torgue Alexandre <alexandre.torgue@st.com> for STMicroelectronics.
- */
-
-#ifndef _DT_BINDINGS_STM32_PINFUNC_H
-#define _DT_BINDINGS_STM32_PINFUNC_H
-
-/*  define PIN modes */
-#define GPIO	0x0
-#define AF0	0x1
-#define AF1	0x2
-#define AF2	0x3
-#define AF3	0x4
-#define AF4	0x5
-#define AF5	0x6
-#define AF6	0x7
-#define AF7	0x8
-#define AF8	0x9
-#define AF9	0xa
-#define AF10	0xb
-#define AF11	0xc
-#define AF12	0xd
-#define AF13	0xe
-#define AF14	0xf
-#define AF15	0x10
-#define ANALOG	0x11
-
-/* define Pins number*/
-#define PIN_NO(port, line)	(((port) - 'A') * 0x10 + (line))
-
-#define STM32_PINMUX(port, line, mode) (((PIN_NO(port, line)) << 8) | (mode))
-
-/*  package information */
-#define STM32MP_PKG_AA	0x1
-#define STM32MP_PKG_AB	0x2
-#define STM32MP_PKG_AC	0x4
-#define STM32MP_PKG_AD	0x8
-#define STM32MP_PKG_AI	0x100
-#define STM32MP_PKG_AK	0x400
-#define STM32MP_PKG_AL	0x800
-
-#endif /* _DT_BINDINGS_STM32_PINFUNC_H */
-
diff --git a/include/dt-bindings/regulator/st,stm32mp13-regulator.h b/include/dt-bindings/regulator/st,stm32mp13-regulator.h
deleted file mode 100644
index b3a974dfc585..000000000000
--- a/include/dt-bindings/regulator/st,stm32mp13-regulator.h
+++ /dev/null
@@ -1,42 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
-/*
- * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
- */
-
-#ifndef __DT_BINDINGS_REGULATOR_ST_STM32MP13_REGULATOR_H
-#define __DT_BINDINGS_REGULATOR_ST_STM32MP13_REGULATOR_H
-
-/* SCMI voltage domains identifiers */
-
-/* SOC Internal regulators */
-#define VOLTD_SCMI_REG11		0
-#define VOLTD_SCMI_REG18		1
-#define VOLTD_SCMI_USB33		2
-#define VOLTD_SCMI_SDMMC1_IO		3
-#define VOLTD_SCMI_SDMMC2_IO		4
-#define VOLTD_SCMI_VREFBUF		5
-
-/* STPMIC1 regulators */
-#define VOLTD_SCMI_STPMIC1_BUCK1	6
-#define VOLTD_SCMI_STPMIC1_BUCK2	7
-#define VOLTD_SCMI_STPMIC1_BUCK3	8
-#define VOLTD_SCMI_STPMIC1_BUCK4	9
-#define VOLTD_SCMI_STPMIC1_LDO1	        10
-#define VOLTD_SCMI_STPMIC1_LDO2	        11
-#define VOLTD_SCMI_STPMIC1_LDO3	        12
-#define VOLTD_SCMI_STPMIC1_LDO4	        13
-#define VOLTD_SCMI_STPMIC1_LDO5	        14
-#define VOLTD_SCMI_STPMIC1_LDO6	        15
-#define VOLTD_SCMI_STPMIC1_VREFDDR	16
-#define VOLTD_SCMI_STPMIC1_BOOST	17
-#define VOLTD_SCMI_STPMIC1_PWR_SW1	18
-#define VOLTD_SCMI_STPMIC1_PWR_SW2	19
-
-/* External regulators */
-#define VOLTD_SCMI_REGU0		20
-#define VOLTD_SCMI_REGU1		21
-#define VOLTD_SCMI_REGU2		22
-#define VOLTD_SCMI_REGU3		23
-#define VOLTD_SCMI_REGU4		24
-
-#endif /*__DT_BINDINGS_REGULATOR_ST_STM32MP13_REGULATOR_H */
diff --git a/include/dt-bindings/reset/stih407-resets.h b/include/dt-bindings/reset/stih407-resets.h
deleted file mode 100644
index 4ab3a1c94958..000000000000
--- a/include/dt-bindings/reset/stih407-resets.h
+++ /dev/null
@@ -1,65 +0,0 @@
-/*
- * This header provides constants for the reset controller
- * based peripheral powerdown requests on the STMicroelectronics
- * STiH407 SoC.
- */
-#ifndef _DT_BINDINGS_RESET_CONTROLLER_STIH407
-#define _DT_BINDINGS_RESET_CONTROLLER_STIH407
-
-/* Powerdown requests control 0 */
-#define STIH407_EMISS_POWERDOWN		0
-#define STIH407_NAND_POWERDOWN		1
-
-/* Synp GMAC PowerDown */
-#define STIH407_ETH1_POWERDOWN		2
-
-/* Powerdown requests control 1 */
-#define STIH407_USB3_POWERDOWN		3
-#define STIH407_USB2_PORT1_POWERDOWN	4
-#define STIH407_USB2_PORT0_POWERDOWN	5
-#define STIH407_PCIE1_POWERDOWN		6
-#define STIH407_PCIE0_POWERDOWN		7
-#define STIH407_SATA1_POWERDOWN		8
-#define STIH407_SATA0_POWERDOWN		9
-
-/* Reset defines */
-#define STIH407_ETH1_SOFTRESET		0
-#define STIH407_MMC1_SOFTRESET		1
-#define STIH407_PICOPHY_SOFTRESET	2
-#define STIH407_IRB_SOFTRESET		3
-#define STIH407_PCIE0_SOFTRESET		4
-#define STIH407_PCIE1_SOFTRESET		5
-#define STIH407_SATA0_SOFTRESET		6
-#define STIH407_SATA1_SOFTRESET		7
-#define STIH407_MIPHY0_SOFTRESET	8
-#define STIH407_MIPHY1_SOFTRESET	9
-#define STIH407_MIPHY2_SOFTRESET	10
-#define STIH407_SATA0_PWR_SOFTRESET	11
-#define STIH407_SATA1_PWR_SOFTRESET	12
-#define STIH407_DELTA_SOFTRESET		13
-#define STIH407_BLITTER_SOFTRESET	14
-#define STIH407_HDTVOUT_SOFTRESET	15
-#define STIH407_HDQVDP_SOFTRESET	16
-#define STIH407_VDP_AUX_SOFTRESET	17
-#define STIH407_COMPO_SOFTRESET		18
-#define STIH407_HDMI_TX_PHY_SOFTRESET	19
-#define STIH407_JPEG_DEC_SOFTRESET	20
-#define STIH407_VP8_DEC_SOFTRESET	21
-#define STIH407_GPU_SOFTRESET		22
-#define STIH407_HVA_SOFTRESET		23
-#define STIH407_ERAM_HVA_SOFTRESET	24
-#define STIH407_LPM_SOFTRESET		25
-#define STIH407_KEYSCAN_SOFTRESET	26
-#define STIH407_USB2_PORT0_SOFTRESET	27
-#define STIH407_USB2_PORT1_SOFTRESET	28
-#define STIH407_ST231_AUD_SOFTRESET	29
-#define STIH407_ST231_DMU_SOFTRESET	30
-#define STIH407_ST231_GP0_SOFTRESET	31
-#define STIH407_ST231_GP1_SOFTRESET	32
-
-/* Picophy reset defines */
-#define STIH407_PICOPHY0_RESET		0
-#define STIH407_PICOPHY1_RESET		1
-#define STIH407_PICOPHY2_RESET		2
-
-#endif /* _DT_BINDINGS_RESET_CONTROLLER_STIH407 */
diff --git a/include/dt-bindings/reset/stm32mp1-resets.h b/include/dt-bindings/reset/stm32mp1-resets.h
deleted file mode 100644
index 9071f139649f..000000000000
--- a/include/dt-bindings/reset/stm32mp1-resets.h
+++ /dev/null
@@ -1,123 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
-/*
- * Copyright (C) STMicroelectronics 2018 - All Rights Reserved
- * Author: Gabriel Fernandez <gabriel.fernandez@st.com> for STMicroelectronics.
- */
-
-#ifndef _DT_BINDINGS_STM32MP1_RESET_H_
-#define _DT_BINDINGS_STM32MP1_RESET_H_
-
-#define MCU_HOLD_BOOT_R	2144
-#define LTDC_R		3072
-#define DSI_R		3076
-#define DDRPERFM_R	3080
-#define USBPHY_R	3088
-#define SPI6_R		3136
-#define I2C4_R		3138
-#define I2C6_R		3139
-#define USART1_R	3140
-#define STGEN_R		3156
-#define GPIOZ_R		3200
-#define CRYP1_R		3204
-#define HASH1_R		3205
-#define RNG1_R		3206
-#define AXIM_R		3216
-#define GPU_R		3269
-#define ETHMAC_R	3274
-#define FMC_R		3276
-#define QSPI_R		3278
-#define SDMMC1_R	3280
-#define SDMMC2_R	3281
-#define CRC1_R		3284
-#define USBH_R		3288
-#define MDMA_R		3328
-#define MCU_R		8225
-#define TIM2_R		19456
-#define TIM3_R		19457
-#define TIM4_R		19458
-#define TIM5_R		19459
-#define TIM6_R		19460
-#define TIM7_R		19461
-#define TIM12_R		16462
-#define TIM13_R		16463
-#define TIM14_R		16464
-#define LPTIM1_R	19465
-#define SPI2_R		19467
-#define SPI3_R		19468
-#define USART2_R	19470
-#define USART3_R	19471
-#define UART4_R		19472
-#define UART5_R		19473
-#define UART7_R		19474
-#define UART8_R		19475
-#define I2C1_R		19477
-#define I2C2_R		19478
-#define I2C3_R		19479
-#define I2C5_R		19480
-#define SPDIF_R		19482
-#define CEC_R		19483
-#define DAC12_R		19485
-#define MDIO_R		19847
-#define TIM1_R		19520
-#define TIM8_R		19521
-#define TIM15_R		19522
-#define TIM16_R		19523
-#define TIM17_R		19524
-#define SPI1_R		19528
-#define SPI4_R		19529
-#define SPI5_R		19530
-#define USART6_R	19533
-#define SAI1_R		19536
-#define SAI2_R		19537
-#define SAI3_R		19538
-#define DFSDM_R		19540
-#define FDCAN_R		19544
-#define LPTIM2_R	19584
-#define LPTIM3_R	19585
-#define LPTIM4_R	19586
-#define LPTIM5_R	19587
-#define SAI4_R		19592
-#define SYSCFG_R	19595
-#define VREF_R		19597
-#define TMPSENS_R	19600
-#define PMBCTRL_R	19601
-#define DMA1_R		19648
-#define DMA2_R		19649
-#define DMAMUX_R	19650
-#define ADC12_R		19653
-#define USBO_R		19656
-#define SDMMC3_R	19664
-#define CAMITF_R	19712
-#define CRYP2_R		19716
-#define HASH2_R		19717
-#define RNG2_R		19718
-#define CRC2_R		19719
-#define HSEM_R		19723
-#define MBOX_R		19724
-#define GPIOA_R		19776
-#define GPIOB_R		19777
-#define GPIOC_R		19778
-#define GPIOD_R		19779
-#define GPIOE_R		19780
-#define GPIOF_R		19781
-#define GPIOG_R		19782
-#define GPIOH_R		19783
-#define GPIOI_R		19784
-#define GPIOJ_R		19785
-#define GPIOK_R		19786
-
-/* SCMI reset domain identifiers */
-#define RST_SCMI_SPI6		0
-#define RST_SCMI_I2C4		1
-#define RST_SCMI_I2C6		2
-#define RST_SCMI_USART1	3
-#define RST_SCMI_STGEN		4
-#define RST_SCMI_GPIOZ		5
-#define RST_SCMI_CRYP1		6
-#define RST_SCMI_HASH1		7
-#define RST_SCMI_RNG1		8
-#define RST_SCMI_MDMA		9
-#define RST_SCMI_MCU		10
-#define RST_SCMI_MCU_HOLD_BOOT	11
-
-#endif /* _DT_BINDINGS_STM32MP1_RESET_H_ */
diff --git a/include/dt-bindings/reset/stm32mp13-resets.h b/include/dt-bindings/reset/stm32mp13-resets.h
deleted file mode 100644
index ecb37c7ddde1..000000000000
--- a/include/dt-bindings/reset/stm32mp13-resets.h
+++ /dev/null
@@ -1,100 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause */
-/*
- * Copyright (C) STMicroelectronics 2018 - All Rights Reserved
- * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
- */
-
-#ifndef _DT_BINDINGS_STM32MP13_RESET_H_
-#define _DT_BINDINGS_STM32MP13_RESET_H_
-
-#define TIM2_R		13568
-#define TIM3_R		13569
-#define TIM4_R		13570
-#define TIM5_R		13571
-#define TIM6_R		13572
-#define TIM7_R		13573
-#define LPTIM1_R	13577
-#define SPI2_R		13579
-#define SPI3_R		13580
-#define USART3_R	13583
-#define UART4_R		13584
-#define UART5_R		13585
-#define UART7_R		13586
-#define UART8_R		13587
-#define I2C1_R		13589
-#define I2C2_R		13590
-#define SPDIF_R		13594
-#define TIM1_R		13632
-#define TIM8_R		13633
-#define SPI1_R		13640
-#define USART6_R	13645
-#define SAI1_R		13648
-#define SAI2_R		13649
-#define DFSDM_R		13652
-#define FDCAN_R		13656
-#define LPTIM2_R	13696
-#define LPTIM3_R	13697
-#define LPTIM4_R	13698
-#define LPTIM5_R	13699
-#define SYSCFG_R	13707
-#define VREF_R		13709
-#define DTS_R		13712
-#define PMBCTRL_R	13713
-#define LTDC_R		13760
-#define DCMIPP_R	13761
-#define DDRPERFM_R	13768
-#define USBPHY_R	13776
-#define STGEN_R		13844
-#define USART1_R	13888
-#define USART2_R	13889
-#define SPI4_R		13890
-#define SPI5_R		13891
-#define I2C3_R		13892
-#define I2C4_R		13893
-#define I2C5_R		13894
-#define TIM12_R		13895
-#define TIM13_R		13896
-#define TIM14_R		13897
-#define TIM15_R		13898
-#define TIM16_R		13899
-#define TIM17_R		13900
-#define DMA1_R		13952
-#define DMA2_R		13953
-#define DMAMUX1_R	13954
-#define DMA3_R		13955
-#define DMAMUX2_R	13956
-#define ADC1_R		13957
-#define ADC2_R		13958
-#define USBO_R		13960
-#define GPIOA_R		14080
-#define GPIOB_R		14081
-#define GPIOC_R		14082
-#define GPIOD_R		14083
-#define GPIOE_R		14084
-#define GPIOF_R		14085
-#define GPIOG_R		14086
-#define GPIOH_R		14087
-#define GPIOI_R		14088
-#define TSC_R		14095
-#define PKA_R		14146
-#define SAES_R		14147
-#define CRYP1_R		14148
-#define HASH1_R		14149
-#define RNG1_R		14150
-#define AXIMC_R		14160
-#define MDMA_R		14208
-#define MCE_R		14209
-#define ETH1MAC_R	14218
-#define FMC_R		14220
-#define QSPI_R		14222
-#define SDMMC1_R	14224
-#define SDMMC2_R	14225
-#define CRC1_R		14228
-#define USBH_R		14232
-#define ETH2MAC_R	14238
-
-/* SCMI reset domain identifiers */
-#define RST_SCMI_LTDC		0
-#define RST_SCMI_MDMA		1
-
-#endif /* _DT_BINDINGS_STM32MP13_RESET_H_ */

-- 
2.44.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
