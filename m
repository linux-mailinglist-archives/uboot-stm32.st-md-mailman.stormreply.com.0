Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F65886234
	for <lists+uboot-stm32@lfdr.de>; Thu, 21 Mar 2024 22:04:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09AABC6DD79;
	Thu, 21 Mar 2024 21:04:31 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 141ABC6DD75
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Mar 2024 21:04:30 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-41400a9844aso15014915e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Mar 2024 14:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711055069; x=1711659869;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7ClZ/U2dCNnx0hFWsWke0QLt+QMuIoc1IIP33XWHwdg=;
 b=f6Tdi4hIg5LggyhMYflOKUDryA1+0zNlFEZS3H4khizbCpJ2/8MObBOElver2HAJ/m
 WUxrzkEWt8oRNU44pQZCKrt4vHhxgpGzlMtpowFRdsWWOZUuRMh80S5ZaBAakzOC9a6W
 4fGY83nZlmZURTWCePZDvdy0rVJ7By5CrM9V9IHd/egtF6ojrNKIXvkdj3grdSimWIB0
 HLumMiNKvly0wUQouIQO3veizmFOe2nMhDfQl3f9tLpsqFy2xaoVKglBisQIrO9FWcgs
 IarJq2nmqMdTgBsTydmQs9uHztw1pV81V/G8ZgyEGXgLYEvKPDcT+IrnUx4c3NmE5Nv6
 PcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711055069; x=1711659869;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7ClZ/U2dCNnx0hFWsWke0QLt+QMuIoc1IIP33XWHwdg=;
 b=xO/dULd0sziU4KqtCGAxtUG/Ob9LTJLkyzVInFvgv8fsvh1H5nxIrOPfYFcSDvVZS9
 SBAkKFNsuEzPDnFQuA8/3/EQRPJTeYVtYYvoVY1Y4PwMr5oWm17KHkmEnmvgJTXtOm6y
 xtrXnJiwT7DCLcPC3yw5DEU1dTClm6FKhgKNnWVMaA+qfljOLOXvhwkYs0S4y+yqnsDL
 8FJorOoPeWuIqkpvBNyXp8wT/vuJlaOWto8HuaGhyfoeG94CmueZPcDfkcBSeuePa+f8
 31pJDf54jezeNu/8Vcf904ESIQ9ub8o7tC5X1OAgaUUmuaX/iFCP4vwjKOfot8Sv8eFg
 cueg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxkhbEmy4l9IWLrNlV0hdPOkrfuhVBh4lDBkjvUTxAPYX8NnMVzW8VTlhkHyBlAsM+RKI+yCWau9gk0yFhUwaPVKu0RCi4GKGDXV86baZHXIGzYce3uASJ
X-Gm-Message-State: AOJu0YxP4CY3XpephL+UdzNt9H40Wx96v5lecAgxLrQxSgiBOr8URcnv
 Cc43cshGzv4xoI3+PGUEc2Vh20SDHyVneD9gtF4dnDMmOfjyk+kGxEB+h9qAcaI=
X-Google-Smtp-Source: AGHT+IGwCmMCRJFLeGp20KJgulv1DwtJ3zhUUj6pBshRPal0+kIud99pxGBOdsW///dmKfvUGFKrDQ==
X-Received: by 2002:a05:600c:3111:b0:413:4299:ec9f with SMTP id
 g17-20020a05600c311100b004134299ec9fmr135499wmo.5.1711055069640; 
 Thu, 21 Mar 2024 14:04:29 -0700 (PDT)
Received: from lion.localdomain (host-92-17-96-232.as13285.net. [92.17.96.232])
 by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b004146f728906sm925462wmb.7.2024.03.21.14.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 14:04:29 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Thu, 21 Mar 2024 21:03:59 +0000
MIME-Version: 1.0
Message-Id: <20240321-b4-upstream-dt-headers-v2-16-1eac0df875fe@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=19533;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=TAkzYvr9nwbaAz1rFsd4FKI0tB6ez1V6FDMiqYuN7VI=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhtQ/C/aUr7ZbsPen56Vwm9d3TOWXvV1UHff+64TEiuwN8
 ky7b4WVdZSyMAhyMMiKKbKIn1hm2bT2sr3G9gUXYOawMoEMYeDiFICJePxm+J9REvV7Fast89N1
 iR47XjqVP2pk2rpYVSvDImx64/RNEWcZ/gpcuny9uOhLnLTO22/f0hTlrk482nzjx73Uvtykeok
 9pVkA
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 uboot-snps-arc@synopsys.com, Caleb Connolly <caleb.connolly@linaro.org>,
 u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH v2 16/24] xlnx: drop dt-binding headers
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

Drop in favour of dts/upstream

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 include/dt-bindings/clock/xlnx-versal-clk.h    | 123 -----------------------
 include/dt-bindings/clock/xlnx-zynqmp-clk.h    | 126 ------------------------
 include/dt-bindings/dma/xlnx-zynqmp-dpdma.h    |  16 ---
 include/dt-bindings/pinctrl/pinctrl-zynqmp.h   |  19 ----
 include/dt-bindings/power/xlnx-zynqmp-power.h  |  50 ----------
 include/dt-bindings/reset/xlnx-versal-resets.h | 105 --------------------
 include/dt-bindings/reset/xlnx-zynqmp-resets.h | 130 -------------------------
 7 files changed, 569 deletions(-)

diff --git a/include/dt-bindings/clock/xlnx-versal-clk.h b/include/dt-bindings/clock/xlnx-versal-clk.h
deleted file mode 100644
index 264d634d226e..000000000000
--- a/include/dt-bindings/clock/xlnx-versal-clk.h
+++ /dev/null
@@ -1,123 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- *  Copyright (C) 2019 Xilinx Inc.
- *
- */
-
-#ifndef _DT_BINDINGS_CLK_VERSAL_H
-#define _DT_BINDINGS_CLK_VERSAL_H
-
-#define PMC_PLL					1
-#define APU_PLL					2
-#define RPU_PLL					3
-#define CPM_PLL					4
-#define NOC_PLL					5
-#define PLL_MAX					6
-#define PMC_PRESRC				7
-#define PMC_POSTCLK				8
-#define PMC_PLL_OUT				9
-#define PPLL					10
-#define NOC_PRESRC				11
-#define NOC_POSTCLK				12
-#define NOC_PLL_OUT				13
-#define NPLL					14
-#define APU_PRESRC				15
-#define APU_POSTCLK				16
-#define APU_PLL_OUT				17
-#define APLL					18
-#define RPU_PRESRC				19
-#define RPU_POSTCLK				20
-#define RPU_PLL_OUT				21
-#define RPLL					22
-#define CPM_PRESRC				23
-#define CPM_POSTCLK				24
-#define CPM_PLL_OUT				25
-#define CPLL					26
-#define PPLL_TO_XPD				27
-#define NPLL_TO_XPD				28
-#define APLL_TO_XPD				29
-#define RPLL_TO_XPD				30
-#define EFUSE_REF				31
-#define SYSMON_REF				32
-#define IRO_SUSPEND_REF				33
-#define USB_SUSPEND				34
-#define SWITCH_TIMEOUT				35
-#define RCLK_PMC				36
-#define RCLK_LPD				37
-#define WDT					38
-#define TTC0					39
-#define TTC1					40
-#define TTC2					41
-#define TTC3					42
-#define GEM_TSU					43
-#define GEM_TSU_LB				44
-#define MUXED_IRO_DIV2				45
-#define MUXED_IRO_DIV4				46
-#define PSM_REF					47
-#define GEM0_RX					48
-#define GEM0_TX					49
-#define GEM1_RX					50
-#define GEM1_TX					51
-#define CPM_CORE_REF				52
-#define CPM_LSBUS_REF				53
-#define CPM_DBG_REF				54
-#define CPM_AUX0_REF				55
-#define CPM_AUX1_REF				56
-#define QSPI_REF				57
-#define OSPI_REF				58
-#define SDIO0_REF				59
-#define SDIO1_REF				60
-#define PMC_LSBUS_REF				61
-#define I2C_REF					62
-#define TEST_PATTERN_REF			63
-#define DFT_OSC_REF				64
-#define PMC_PL0_REF				65
-#define PMC_PL1_REF				66
-#define PMC_PL2_REF				67
-#define PMC_PL3_REF				68
-#define CFU_REF					69
-#define SPARE_REF				70
-#define NPI_REF					71
-#define HSM0_REF				72
-#define HSM1_REF				73
-#define SD_DLL_REF				74
-#define FPD_TOP_SWITCH				75
-#define FPD_LSBUS				76
-#define ACPU					77
-#define DBG_TRACE				78
-#define DBG_FPD					79
-#define LPD_TOP_SWITCH				80
-#define ADMA					81
-#define LPD_LSBUS				82
-#define CPU_R5					83
-#define CPU_R5_CORE				84
-#define CPU_R5_OCM				85
-#define CPU_R5_OCM2				86
-#define IOU_SWITCH				87
-#define GEM0_REF				88
-#define GEM1_REF				89
-#define GEM_TSU_REF				90
-#define USB0_BUS_REF				91
-#define UART0_REF				92
-#define UART1_REF				93
-#define SPI0_REF				94
-#define SPI1_REF				95
-#define CAN0_REF				96
-#define CAN1_REF				97
-#define I2C0_REF				98
-#define I2C1_REF				99
-#define DBG_LPD					100
-#define TIMESTAMP_REF				101
-#define DBG_TSTMP				102
-#define CPM_TOPSW_REF				103
-#define USB3_DUAL_REF				104
-#define OUTCLK_MAX				105
-#define REF_CLK					106
-#define PL_ALT_REF_CLK				107
-#define MUXED_IRO				108
-#define PL_EXT					109
-#define PL_LB					110
-#define MIO_50_OR_51				111
-#define MIO_24_OR_25				112
-
-#endif
diff --git a/include/dt-bindings/clock/xlnx-zynqmp-clk.h b/include/dt-bindings/clock/xlnx-zynqmp-clk.h
deleted file mode 100644
index cdc4c0b9a374..000000000000
--- a/include/dt-bindings/clock/xlnx-zynqmp-clk.h
+++ /dev/null
@@ -1,126 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Xilinx Zynq MPSoC Firmware layer
- *
- *  Copyright (C) 2014-2018 Xilinx, Inc.
- *
- */
-
-#ifndef _DT_BINDINGS_CLK_ZYNQMP_H
-#define _DT_BINDINGS_CLK_ZYNQMP_H
-
-#define IOPLL			0
-#define RPLL			1
-#define APLL			2
-#define DPLL			3
-#define VPLL			4
-#define IOPLL_TO_FPD		5
-#define RPLL_TO_FPD		6
-#define APLL_TO_LPD		7
-#define DPLL_TO_LPD		8
-#define VPLL_TO_LPD		9
-#define ACPU			10
-#define ACPU_HALF		11
-#define DBF_FPD			12
-#define DBF_LPD			13
-#define DBG_TRACE		14
-#define DBG_TSTMP		15
-#define DP_VIDEO_REF		16
-#define DP_AUDIO_REF		17
-#define DP_STC_REF		18
-#define GDMA_REF		19
-#define DPDMA_REF		20
-#define DDR_REF			21
-#define SATA_REF		22
-#define PCIE_REF		23
-#define GPU_REF			24
-#define GPU_PP0_REF		25
-#define GPU_PP1_REF		26
-#define TOPSW_MAIN		27
-#define TOPSW_LSBUS		28
-#define GTGREF0_REF		29
-#define LPD_SWITCH		30
-#define LPD_LSBUS		31
-#define USB0_BUS_REF		32
-#define USB1_BUS_REF		33
-#define USB3_DUAL_REF		34
-#define USB0			35
-#define USB1			36
-#define CPU_R5			37
-#define CPU_R5_CORE		38
-#define CSU_SPB			39
-#define CSU_PLL			40
-#define PCAP			41
-#define IOU_SWITCH		42
-#define GEM_TSU_REF		43
-#define GEM_TSU			44
-#define GEM0_TX			45
-#define GEM1_TX			46
-#define GEM2_TX			47
-#define GEM3_TX			48
-#define GEM0_RX			49
-#define GEM1_RX			50
-#define GEM2_RX			51
-#define GEM3_RX			52
-#define QSPI_REF		53
-#define SDIO0_REF		54
-#define SDIO1_REF		55
-#define UART0_REF		56
-#define UART1_REF		57
-#define SPI0_REF		58
-#define SPI1_REF		59
-#define NAND_REF		60
-#define I2C0_REF		61
-#define I2C1_REF		62
-#define CAN0_REF		63
-#define CAN1_REF		64
-#define CAN0			65
-#define CAN1			66
-#define DLL_REF			67
-#define ADMA_REF		68
-#define TIMESTAMP_REF		69
-#define AMS_REF			70
-#define PL0_REF			71
-#define PL1_REF			72
-#define PL2_REF			73
-#define PL3_REF			74
-#define WDT			75
-#define IOPLL_INT		76
-#define IOPLL_PRE_SRC		77
-#define IOPLL_HALF		78
-#define IOPLL_INT_MUX		79
-#define IOPLL_POST_SRC		80
-#define RPLL_INT		81
-#define RPLL_PRE_SRC		82
-#define RPLL_HALF		83
-#define RPLL_INT_MUX		84
-#define RPLL_POST_SRC		85
-#define APLL_INT		86
-#define APLL_PRE_SRC		87
-#define APLL_HALF		88
-#define APLL_INT_MUX		89
-#define APLL_POST_SRC		90
-#define DPLL_INT		91
-#define DPLL_PRE_SRC		92
-#define DPLL_HALF		93
-#define DPLL_INT_MUX		94
-#define DPLL_POST_SRC		95
-#define VPLL_INT		96
-#define VPLL_PRE_SRC		97
-#define VPLL_HALF		98
-#define VPLL_INT_MUX		99
-#define VPLL_POST_SRC		100
-#define CAN0_MIO		101
-#define CAN1_MIO		102
-#define ACPU_FULL		103
-#define GEM0_REF		104
-#define GEM1_REF		105
-#define GEM2_REF		106
-#define GEM3_REF		107
-#define GEM0_REF_UNG		108
-#define GEM1_REF_UNG		109
-#define GEM2_REF_UNG		110
-#define GEM3_REF_UNG		111
-#define LPD_WDT			112
-
-#endif
diff --git a/include/dt-bindings/dma/xlnx-zynqmp-dpdma.h b/include/dt-bindings/dma/xlnx-zynqmp-dpdma.h
deleted file mode 100644
index 3719cda5679d..000000000000
--- a/include/dt-bindings/dma/xlnx-zynqmp-dpdma.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
-/*
- * Copyright 2019 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
- */
-
-#ifndef __DT_BINDINGS_DMA_XLNX_ZYNQMP_DPDMA_H__
-#define __DT_BINDINGS_DMA_XLNX_ZYNQMP_DPDMA_H__
-
-#define ZYNQMP_DPDMA_VIDEO0		0
-#define ZYNQMP_DPDMA_VIDEO1		1
-#define ZYNQMP_DPDMA_VIDEO2		2
-#define ZYNQMP_DPDMA_GRAPHICS		3
-#define ZYNQMP_DPDMA_AUDIO0		4
-#define ZYNQMP_DPDMA_AUDIO1		5
-
-#endif /* __DT_BINDINGS_DMA_XLNX_ZYNQMP_DPDMA_H__ */
diff --git a/include/dt-bindings/pinctrl/pinctrl-zynqmp.h b/include/dt-bindings/pinctrl/pinctrl-zynqmp.h
deleted file mode 100644
index cdb215734bdf..000000000000
--- a/include/dt-bindings/pinctrl/pinctrl-zynqmp.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * MIO pin configuration defines for Xilinx ZynqMP
- *
- * Copyright (C) 2020 Xilinx, Inc.
- */
-
-#ifndef _DT_BINDINGS_PINCTRL_ZYNQMP_H
-#define _DT_BINDINGS_PINCTRL_ZYNQMP_H
-
-/* Bit value for different voltage levels */
-#define IO_STANDARD_LVCMOS33	0
-#define IO_STANDARD_LVCMOS18	1
-
-/* Bit values for Slew Rates */
-#define SLEW_RATE_FAST		0
-#define SLEW_RATE_SLOW		1
-
-#endif /* _DT_BINDINGS_PINCTRL_ZYNQMP_H */
diff --git a/include/dt-bindings/power/xlnx-zynqmp-power.h b/include/dt-bindings/power/xlnx-zynqmp-power.h
deleted file mode 100644
index e7eb0960480a..000000000000
--- a/include/dt-bindings/power/xlnx-zynqmp-power.h
+++ /dev/null
@@ -1,50 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- *  Copyright (C) 2018 Xilinx, Inc.
- */
-
-#ifndef _DT_BINDINGS_ZYNQMP_POWER_H
-#define _DT_BINDINGS_ZYNQMP_POWER_H
-
-#define		PD_RPU_0	6
-#define		PD_RPU_1	7
-#define		PD_OCM_BANK_0	11
-#define		PD_OCM_BANK_1	12
-#define		PD_OCM_BANK_2	13
-#define		PD_OCM_BANK_3	14
-#define		PD_TCM_BANK_0	15
-#define		PD_TCM_BANK_1	16
-#define		PD_TCM_BANK_2	17
-#define		PD_TCM_BANK_3	18
-#define		PD_USB_0	22
-#define		PD_USB_1	23
-#define		PD_TTC_0	24
-#define		PD_TTC_1	25
-#define		PD_TTC_2	26
-#define		PD_TTC_3	27
-#define		PD_SATA		28
-#define		PD_ETH_0	29
-#define		PD_ETH_1	30
-#define		PD_ETH_2	31
-#define		PD_ETH_3	32
-#define		PD_UART_0	33
-#define		PD_UART_1	34
-#define		PD_SPI_0	35
-#define		PD_SPI_1	36
-#define		PD_I2C_0	37
-#define		PD_I2C_1	38
-#define		PD_SD_0		39
-#define		PD_SD_1		40
-#define		PD_DP		41
-#define		PD_GDMA		42
-#define		PD_ADMA		43
-#define		PD_NAND		44
-#define		PD_QSPI		45
-#define		PD_GPIO		46
-#define		PD_CAN_0	47
-#define		PD_CAN_1	48
-#define		PD_GPU		58
-#define		PD_PCIE		59
-#define		PD_PL		69
-
-#endif
diff --git a/include/dt-bindings/reset/xlnx-versal-resets.h b/include/dt-bindings/reset/xlnx-versal-resets.h
deleted file mode 100644
index 895424e9b0e5..000000000000
--- a/include/dt-bindings/reset/xlnx-versal-resets.h
+++ /dev/null
@@ -1,105 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- *  Copyright (C) 2020 Xilinx, Inc.
- */
-
-#ifndef _DT_BINDINGS_VERSAL_RESETS_H
-#define _DT_BINDINGS_VERSAL_RESETS_H
-
-#define VERSAL_RST_PMC_POR			(0xc30c001U)
-#define VERSAL_RST_PMC				(0xc410002U)
-#define VERSAL_RST_PS_POR			(0xc30c003U)
-#define VERSAL_RST_PL_POR			(0xc30c004U)
-#define VERSAL_RST_NOC_POR			(0xc30c005U)
-#define VERSAL_RST_FPD_POR			(0xc30c006U)
-#define VERSAL_RST_ACPU_0_POR			(0xc30c007U)
-#define VERSAL_RST_ACPU_1_POR			(0xc30c008U)
-#define VERSAL_RST_OCM2_POR			(0xc30c009U)
-#define VERSAL_RST_PS_SRST			(0xc41000aU)
-#define VERSAL_RST_PL_SRST			(0xc41000bU)
-#define VERSAL_RST_NOC				(0xc41000cU)
-#define VERSAL_RST_NPI				(0xc41000dU)
-#define VERSAL_RST_SYS_RST_1			(0xc41000eU)
-#define VERSAL_RST_SYS_RST_2			(0xc41000fU)
-#define VERSAL_RST_SYS_RST_3			(0xc410010U)
-#define VERSAL_RST_FPD				(0xc410011U)
-#define VERSAL_RST_PL0				(0xc410012U)
-#define VERSAL_RST_PL1				(0xc410013U)
-#define VERSAL_RST_PL2				(0xc410014U)
-#define VERSAL_RST_PL3				(0xc410015U)
-#define VERSAL_RST_APU				(0xc410016U)
-#define VERSAL_RST_ACPU_0			(0xc410017U)
-#define VERSAL_RST_ACPU_1			(0xc410018U)
-#define VERSAL_RST_ACPU_L2			(0xc410019U)
-#define VERSAL_RST_ACPU_GIC			(0xc41001aU)
-#define VERSAL_RST_RPU_ISLAND			(0xc41001bU)
-#define VERSAL_RST_RPU_AMBA			(0xc41001cU)
-#define VERSAL_RST_R5_0				(0xc41001dU)
-#define VERSAL_RST_R5_1				(0xc41001eU)
-#define VERSAL_RST_SYSMON_PMC_SEQ_RST		(0xc41001fU)
-#define VERSAL_RST_SYSMON_PMC_CFG_RST		(0xc410020U)
-#define VERSAL_RST_SYSMON_FPD_CFG_RST		(0xc410021U)
-#define VERSAL_RST_SYSMON_FPD_SEQ_RST		(0xc410022U)
-#define VERSAL_RST_SYSMON_LPD			(0xc410023U)
-#define VERSAL_RST_PDMA_RST1			(0xc410024U)
-#define VERSAL_RST_PDMA_RST0			(0xc410025U)
-#define VERSAL_RST_ADMA				(0xc410026U)
-#define VERSAL_RST_TIMESTAMP			(0xc410027U)
-#define VERSAL_RST_OCM				(0xc410028U)
-#define VERSAL_RST_OCM2_RST			(0xc410029U)
-#define VERSAL_RST_IPI				(0xc41002aU)
-#define VERSAL_RST_SBI				(0xc41002bU)
-#define VERSAL_RST_LPD				(0xc41002cU)
-#define VERSAL_RST_QSPI				(0xc10402dU)
-#define VERSAL_RST_OSPI				(0xc10402eU)
-#define VERSAL_RST_SDIO_0			(0xc10402fU)
-#define VERSAL_RST_SDIO_1			(0xc104030U)
-#define VERSAL_RST_I2C_PMC			(0xc104031U)
-#define VERSAL_RST_GPIO_PMC			(0xc104032U)
-#define VERSAL_RST_GEM_0			(0xc104033U)
-#define VERSAL_RST_GEM_1			(0xc104034U)
-#define VERSAL_RST_SPARE			(0xc104035U)
-#define VERSAL_RST_USB_0			(0xc104036U)
-#define VERSAL_RST_UART_0			(0xc104037U)
-#define VERSAL_RST_UART_1			(0xc104038U)
-#define VERSAL_RST_SPI_0			(0xc104039U)
-#define VERSAL_RST_SPI_1			(0xc10403aU)
-#define VERSAL_RST_CAN_FD_0			(0xc10403bU)
-#define VERSAL_RST_CAN_FD_1			(0xc10403cU)
-#define VERSAL_RST_I2C_0			(0xc10403dU)
-#define VERSAL_RST_I2C_1			(0xc10403eU)
-#define VERSAL_RST_GPIO_LPD			(0xc10403fU)
-#define VERSAL_RST_TTC_0			(0xc104040U)
-#define VERSAL_RST_TTC_1			(0xc104041U)
-#define VERSAL_RST_TTC_2			(0xc104042U)
-#define VERSAL_RST_TTC_3			(0xc104043U)
-#define VERSAL_RST_SWDT_FPD			(0xc104044U)
-#define VERSAL_RST_SWDT_LPD			(0xc104045U)
-#define VERSAL_RST_USB				(0xc104046U)
-#define VERSAL_RST_DPC				(0xc208047U)
-#define VERSAL_RST_PMCDBG			(0xc208048U)
-#define VERSAL_RST_DBG_TRACE			(0xc208049U)
-#define VERSAL_RST_DBG_FPD			(0xc20804aU)
-#define VERSAL_RST_DBG_TSTMP			(0xc20804bU)
-#define VERSAL_RST_RPU0_DBG			(0xc20804cU)
-#define VERSAL_RST_RPU1_DBG			(0xc20804dU)
-#define VERSAL_RST_HSDP				(0xc20804eU)
-#define VERSAL_RST_DBG_LPD			(0xc20804fU)
-#define VERSAL_RST_CPM_POR			(0xc30c050U)
-#define VERSAL_RST_CPM				(0xc410051U)
-#define VERSAL_RST_CPMDBG			(0xc208052U)
-#define VERSAL_RST_PCIE_CFG			(0xc410053U)
-#define VERSAL_RST_PCIE_CORE0			(0xc410054U)
-#define VERSAL_RST_PCIE_CORE1			(0xc410055U)
-#define VERSAL_RST_PCIE_DMA			(0xc410056U)
-#define VERSAL_RST_CMN				(0xc410057U)
-#define VERSAL_RST_L2_0				(0xc410058U)
-#define VERSAL_RST_L2_1				(0xc410059U)
-#define VERSAL_RST_ADDR_REMAP			(0xc41005aU)
-#define VERSAL_RST_CPI0				(0xc41005bU)
-#define VERSAL_RST_CPI1				(0xc41005cU)
-#define VERSAL_RST_XRAM				(0xc30c05dU)
-#define VERSAL_RST_AIE_ARRAY			(0xc10405eU)
-#define VERSAL_RST_AIE_SHIM			(0xc10405fU)
-
-#endif
diff --git a/include/dt-bindings/reset/xlnx-zynqmp-resets.h b/include/dt-bindings/reset/xlnx-zynqmp-resets.h
deleted file mode 100644
index d44525b9f8db..000000000000
--- a/include/dt-bindings/reset/xlnx-zynqmp-resets.h
+++ /dev/null
@@ -1,130 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- *  Copyright (C) 2018 Xilinx, Inc.
- */
-
-#ifndef _DT_BINDINGS_ZYNQMP_RESETS_H
-#define _DT_BINDINGS_ZYNQMP_RESETS_H
-
-#define		ZYNQMP_RESET_PCIE_CFG		0
-#define		ZYNQMP_RESET_PCIE_BRIDGE	1
-#define		ZYNQMP_RESET_PCIE_CTRL		2
-#define		ZYNQMP_RESET_DP			3
-#define		ZYNQMP_RESET_SWDT_CRF		4
-#define		ZYNQMP_RESET_AFI_FM5		5
-#define		ZYNQMP_RESET_AFI_FM4		6
-#define		ZYNQMP_RESET_AFI_FM3		7
-#define		ZYNQMP_RESET_AFI_FM2		8
-#define		ZYNQMP_RESET_AFI_FM1		9
-#define		ZYNQMP_RESET_AFI_FM0		10
-#define		ZYNQMP_RESET_GDMA		11
-#define		ZYNQMP_RESET_GPU_PP1		12
-#define		ZYNQMP_RESET_GPU_PP0		13
-#define		ZYNQMP_RESET_GPU		14
-#define		ZYNQMP_RESET_GT			15
-#define		ZYNQMP_RESET_SATA		16
-#define		ZYNQMP_RESET_ACPU3_PWRON	17
-#define		ZYNQMP_RESET_ACPU2_PWRON	18
-#define		ZYNQMP_RESET_ACPU1_PWRON	19
-#define		ZYNQMP_RESET_ACPU0_PWRON	20
-#define		ZYNQMP_RESET_APU_L2		21
-#define		ZYNQMP_RESET_ACPU3		22
-#define		ZYNQMP_RESET_ACPU2		23
-#define		ZYNQMP_RESET_ACPU1		24
-#define		ZYNQMP_RESET_ACPU0		25
-#define		ZYNQMP_RESET_DDR		26
-#define		ZYNQMP_RESET_APM_FPD		27
-#define		ZYNQMP_RESET_SOFT		28
-#define		ZYNQMP_RESET_GEM0		29
-#define		ZYNQMP_RESET_GEM1		30
-#define		ZYNQMP_RESET_GEM2		31
-#define		ZYNQMP_RESET_GEM3		32
-#define		ZYNQMP_RESET_QSPI		33
-#define		ZYNQMP_RESET_UART0		34
-#define		ZYNQMP_RESET_UART1		35
-#define		ZYNQMP_RESET_SPI0		36
-#define		ZYNQMP_RESET_SPI1		37
-#define		ZYNQMP_RESET_SDIO0		38
-#define		ZYNQMP_RESET_SDIO1		39
-#define		ZYNQMP_RESET_CAN0		40
-#define		ZYNQMP_RESET_CAN1		41
-#define		ZYNQMP_RESET_I2C0		42
-#define		ZYNQMP_RESET_I2C1		43
-#define		ZYNQMP_RESET_TTC0		44
-#define		ZYNQMP_RESET_TTC1		45
-#define		ZYNQMP_RESET_TTC2		46
-#define		ZYNQMP_RESET_TTC3		47
-#define		ZYNQMP_RESET_SWDT_CRL		48
-#define		ZYNQMP_RESET_NAND		49
-#define		ZYNQMP_RESET_ADMA		50
-#define		ZYNQMP_RESET_GPIO		51
-#define		ZYNQMP_RESET_IOU_CC		52
-#define		ZYNQMP_RESET_TIMESTAMP		53
-#define		ZYNQMP_RESET_RPU_R50		54
-#define		ZYNQMP_RESET_RPU_R51		55
-#define		ZYNQMP_RESET_RPU_AMBA		56
-#define		ZYNQMP_RESET_OCM		57
-#define		ZYNQMP_RESET_RPU_PGE		58
-#define		ZYNQMP_RESET_USB0_CORERESET	59
-#define		ZYNQMP_RESET_USB1_CORERESET	60
-#define		ZYNQMP_RESET_USB0_HIBERRESET	61
-#define		ZYNQMP_RESET_USB1_HIBERRESET	62
-#define		ZYNQMP_RESET_USB0_APB		63
-#define		ZYNQMP_RESET_USB1_APB		64
-#define		ZYNQMP_RESET_IPI		65
-#define		ZYNQMP_RESET_APM_LPD		66
-#define		ZYNQMP_RESET_RTC		67
-#define		ZYNQMP_RESET_SYSMON		68
-#define		ZYNQMP_RESET_AFI_FM6		69
-#define		ZYNQMP_RESET_LPD_SWDT		70
-#define		ZYNQMP_RESET_FPD		71
-#define		ZYNQMP_RESET_RPU_DBG1		72
-#define		ZYNQMP_RESET_RPU_DBG0		73
-#define		ZYNQMP_RESET_DBG_LPD		74
-#define		ZYNQMP_RESET_DBG_FPD		75
-#define		ZYNQMP_RESET_APLL		76
-#define		ZYNQMP_RESET_DPLL		77
-#define		ZYNQMP_RESET_VPLL		78
-#define		ZYNQMP_RESET_IOPLL		79
-#define		ZYNQMP_RESET_RPLL		80
-#define		ZYNQMP_RESET_GPO3_PL_0		81
-#define		ZYNQMP_RESET_GPO3_PL_1		82
-#define		ZYNQMP_RESET_GPO3_PL_2		83
-#define		ZYNQMP_RESET_GPO3_PL_3		84
-#define		ZYNQMP_RESET_GPO3_PL_4		85
-#define		ZYNQMP_RESET_GPO3_PL_5		86
-#define		ZYNQMP_RESET_GPO3_PL_6		87
-#define		ZYNQMP_RESET_GPO3_PL_7		88
-#define		ZYNQMP_RESET_GPO3_PL_8		89
-#define		ZYNQMP_RESET_GPO3_PL_9		90
-#define		ZYNQMP_RESET_GPO3_PL_10		91
-#define		ZYNQMP_RESET_GPO3_PL_11		92
-#define		ZYNQMP_RESET_GPO3_PL_12		93
-#define		ZYNQMP_RESET_GPO3_PL_13		94
-#define		ZYNQMP_RESET_GPO3_PL_14		95
-#define		ZYNQMP_RESET_GPO3_PL_15		96
-#define		ZYNQMP_RESET_GPO3_PL_16		97
-#define		ZYNQMP_RESET_GPO3_PL_17		98
-#define		ZYNQMP_RESET_GPO3_PL_18		99
-#define		ZYNQMP_RESET_GPO3_PL_19		100
-#define		ZYNQMP_RESET_GPO3_PL_20		101
-#define		ZYNQMP_RESET_GPO3_PL_21		102
-#define		ZYNQMP_RESET_GPO3_PL_22		103
-#define		ZYNQMP_RESET_GPO3_PL_23		104
-#define		ZYNQMP_RESET_GPO3_PL_24		105
-#define		ZYNQMP_RESET_GPO3_PL_25		106
-#define		ZYNQMP_RESET_GPO3_PL_26		107
-#define		ZYNQMP_RESET_GPO3_PL_27		108
-#define		ZYNQMP_RESET_GPO3_PL_28		109
-#define		ZYNQMP_RESET_GPO3_PL_29		110
-#define		ZYNQMP_RESET_GPO3_PL_30		111
-#define		ZYNQMP_RESET_GPO3_PL_31		112
-#define		ZYNQMP_RESET_RPU_LS		113
-#define		ZYNQMP_RESET_PS_ONLY		114
-#define		ZYNQMP_RESET_PL			115
-#define		ZYNQMP_RESET_PS_PL0		116
-#define		ZYNQMP_RESET_PS_PL1		117
-#define		ZYNQMP_RESET_PS_PL2		118
-#define		ZYNQMP_RESET_PS_PL3		119
-
-#endif

-- 
2.44.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
