Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC03AC4FBC
	for <lists+uboot-stm32@lfdr.de>; Tue, 27 May 2025 15:29:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F0D7C36B1E;
	Tue, 27 May 2025 13:29:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 558F7C36B19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 13:29:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RC9xBV014204;
 Tue, 27 May 2025 15:29:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 KA9sVdSxG/t49l3iUiY2pGwSjMQlNnh9jUdIlSw8axc=; b=39HiZ3HPT/S1hn/H
 l4+Y+y6sPYtUzukziIzUKjLpAwBbaNuLjfbwBIFkGAEY3FYUkjn5bthaf2J2+SKV
 8F4xxtJBwmcQ1qc3mwMmFcZpFbxwiigO++QqiuGFQIVpp1x6ssmCDnTgDDaRMMIr
 Ou8gjiUSV1MB6VDJVMC3X9zLM92+kcWUwbak+LXB5bEqJ5ngZ4YpDO9unHu1r9gh
 7na+o3SxKtkfXf2fe4aqS7+IUcnr8RxuQ9n+k8E6CEUixQ45Xh7zLtjigBecEjp0
 ASydRyV//+uQy+9/hL11l3ciNZN+4habvP6qXL5SHNQ2NKpvMYTqxAlx+okpgikV
 EftIvw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u50gkxsw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 May 2025 15:29:23 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 686C14004C;
 Tue, 27 May 2025 15:28:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 086C0AEBFB6;
 Tue, 27 May 2025 15:28:00 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 15:27:59 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 27 May 2025 15:27:44 +0200
Message-ID: <20250527132755.2169508-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250527132755.2169508-1-patrice.chotard@foss.st.com>
References: <20250527132755.2169508-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 02/13] clk: stm32mp25: Add clock driver
	support
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

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

Add clock driver support for STM32MP25 SoCs.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Lukasz Majewski <lukma@denx.de>
Cc: Sean Anderson <seanga2@gmail.com>

---

Changes in v2:
    - Rename GATE_USB2 into GATE_USBH
    - Rename RCC_USB2CFGR to RCC_USBHCFGR

 drivers/clk/stm32/Kconfig         |   9 +
 drivers/clk/stm32/Makefile        |   1 +
 drivers/clk/stm32/clk-stm32mp25.c | 665 ++++++++++++++++++++++++++++
 include/stm32mp25_rcc.h           | 712 ++++++++++++++++++++++++++++++
 4 files changed, 1387 insertions(+)
 create mode 100644 drivers/clk/stm32/clk-stm32mp25.c
 create mode 100644 include/stm32mp25_rcc.h

diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
index c05015efe8b..ea856be1662 100644
--- a/drivers/clk/stm32/Kconfig
+++ b/drivers/clk/stm32/Kconfig
@@ -36,3 +36,12 @@ config CLK_STM32MP13
 	help
 	  Enable the STM32 clock (RCC) driver. Enable support for
 	  manipulating STM32MP13's on-SoC clocks.
+
+config CLK_STM32MP25
+	bool "Enable RCC clock driver for STM32MP25"
+	depends on ARCH_STM32MP && CLK
+	default y if STM32MP25X
+	select CLK_STM32_CORE
+	help
+	  Enable the STM32 clock (RCC) driver. Enable support for
+	  manipulating STM32MP25's on-SoC clocks.
diff --git a/drivers/clk/stm32/Makefile b/drivers/clk/stm32/Makefile
index 20afbc3cfce..56adb8a4bbb 100644
--- a/drivers/clk/stm32/Makefile
+++ b/drivers/clk/stm32/Makefile
@@ -7,3 +7,4 @@ obj-$(CONFIG_CLK_STM32F) += clk-stm32f.o
 obj-$(CONFIG_CLK_STM32H7) += clk-stm32h7.o
 obj-$(CONFIG_CLK_STM32MP1) += clk-stm32mp1.o
 obj-$(CONFIG_CLK_STM32MP13) += clk-stm32mp13.o
+obj-$(CONFIG_CLK_STM32MP25) += clk-stm32mp25.o
diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
new file mode 100644
index 00000000000..043dd2273e1
--- /dev/null
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -0,0 +1,665 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
+ */
+
+#include <clk-uclass.h>
+#include <dm.h>
+#include <dt-bindings/clock/st,stm32mp25-rcc.h>
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+
+#include "clk-stm32-core.h"
+#include "stm32mp25_rcc.h"
+
+/* Clock security definition */
+#define SECF_NONE	-1
+
+static const char * const adc12_src[] = {
+	"ck_flexgen_46", "ck_icn_ls_mcu"
+};
+
+static const char * const adc3_src[] = {
+	"ck_flexgen_47", "ck_icn_ls_mcu", "ck_flexgen_46"
+};
+
+static const char * const usb2phy1_src[] = {
+	"ck_flexgen_57", "hse_div2_ck"
+};
+
+static const char * const usb2phy2_src[] = {
+	"ck_flexgen_58", "hse_div2_ck"
+};
+
+static const char * const usb3pciphy_src[] = {
+	"ck_flexgen_34", "hse_div2_ck"
+};
+
+static const char * const dsiblane_src[] = {
+	"txbyteclk", "ck_ker_ltdc"
+};
+
+static const char * const dsiphy_src[] = {
+	"ck_flexgen_28", "hse_ck"
+};
+
+static const char * const lvdsphy_src[] = {
+	"ck_flexgen_32", "hse_ck"
+};
+
+static const char * const dts_src[] = {
+	"hsi_ck", "hse_ck", "msi_ck"
+};
+
+static const char * const mco1_src[] = {
+	"ck_flexgen_61", "ck_obs0"
+};
+
+static const char * const mco2_src[] = {
+	"ck_flexgen_62", "ck_obs1"
+};
+
+enum enum_mux_cfg {
+	MUX_MCO1,
+	MUX_MCO2,
+	MUX_ADC12,
+	MUX_ADC3,
+	MUX_USB2PHY1,
+	MUX_USB2PHY2,
+	MUX_USB3PCIEPHY,
+	MUX_DSIBLANE,
+	MUX_DSIPHY,
+	MUX_LVDSPHY,
+	MUX_DTS,
+	MUX_NB
+};
+
+#define MUX_CFG(id, src, _offset, _shift, _witdh)[id] = {\
+		.num_parents	= ARRAY_SIZE(src),\
+		.parent_names	= src,\
+		.reg_off	= (_offset),\
+		.shift		= (_shift),\
+		.width		= (_witdh),\
+}
+
+static const struct stm32_mux_cfg stm32mp25_muxes[MUX_NB] = {
+	MUX_CFG(MUX_ADC12,		adc12_src,	RCC_ADC12CFGR,		12,	1),
+	MUX_CFG(MUX_ADC3,		adc3_src,	RCC_ADC3CFGR,		12,	2),
+	MUX_CFG(MUX_DSIBLANE,		dsiblane_src,	RCC_DSICFGR,		12,	1),
+	MUX_CFG(MUX_DSIPHY,		dsiphy_src,	RCC_DSICFGR,		15,	1),
+	MUX_CFG(MUX_DTS,		dts_src,	RCC_DTSCFGR,		12,	2),
+	MUX_CFG(MUX_MCO1,		mco1_src,	RCC_MCO1CFGR,		0,	1),
+	MUX_CFG(MUX_MCO2,		mco2_src,	RCC_MCO2CFGR,		0,	1),
+	MUX_CFG(MUX_LVDSPHY,		lvdsphy_src,	RCC_LVDSCFGR,		15,	1),
+	MUX_CFG(MUX_USB2PHY1,		usb2phy1_src,	RCC_USB2PHY1CFGR,	15,	1),
+	MUX_CFG(MUX_USB2PHY2,		usb2phy2_src,	RCC_USB2PHY2CFGR,	15,	1),
+	MUX_CFG(MUX_USB3PCIEPHY,	usb3pciphy_src,	RCC_USB3PCIEPHYCFGR,	15,	1),
+};
+
+enum enum_gate_cfg {
+	GATE_ADC12,
+	GATE_ADC3,
+	GATE_ADF1,
+	GATE_CCI,
+	GATE_CRC,
+	GATE_CRYP1,
+	GATE_CRYP2,
+	GATE_CSI,
+	GATE_DBG,
+	GATE_DCMIPP,
+	GATE_DSI,
+	GATE_DTS,
+	GATE_ETH1,
+	GATE_ETH1MAC,
+	GATE_ETH1RX,
+	GATE_ETH1STP,
+	GATE_ETH1TX,
+	GATE_ETH2,
+	GATE_ETH2MAC,
+	GATE_ETH2RX,
+	GATE_ETH2STP,
+	GATE_ETH2TX,
+	GATE_ETHSW,
+	GATE_ETHSWMAC,
+	GATE_ETHSWREF,
+	GATE_ETR,
+	GATE_FDCAN,
+	GATE_GPU,
+	GATE_HASH,
+	GATE_HDP,
+	GATE_I2C1,
+	GATE_I2C2,
+	GATE_I2C3,
+	GATE_I2C4,
+	GATE_I2C5,
+	GATE_I2C6,
+	GATE_I2C7,
+	GATE_I2C8,
+	GATE_I3C1,
+	GATE_I3C2,
+	GATE_I3C3,
+	GATE_I3C4,
+	GATE_IS2M,
+	GATE_IWDG1,
+	GATE_IWDG2,
+	GATE_IWDG3,
+	GATE_IWDG4,
+	GATE_IWDG5,
+	GATE_LPTIM1,
+	GATE_LPTIM2,
+	GATE_LPTIM3,
+	GATE_LPTIM4,
+	GATE_LPTIM5,
+	GATE_LPUART1,
+	GATE_LTDC,
+	GATE_LVDS,
+	GATE_MCO1,
+	GATE_MCO2,
+	GATE_MDF1,
+	GATE_OSPI1,
+	GATE_OSPI2,
+	GATE_OSPIIOM,
+	GATE_PCIE,
+	GATE_PKA,
+	GATE_RNG,
+	GATE_SAES,
+	GATE_SAI1,
+	GATE_SAI2,
+	GATE_SAI3,
+	GATE_SAI4,
+	GATE_SDMMC1,
+	GATE_SDMMC2,
+	GATE_SDMMC3,
+	GATE_SERC,
+	GATE_SPDIFRX,
+	GATE_SPI1,
+	GATE_SPI2,
+	GATE_SPI3,
+	GATE_SPI4,
+	GATE_SPI5,
+	GATE_SPI6,
+	GATE_SPI7,
+	GATE_SPI8,
+	GATE_STGEN,
+	GATE_STM500,
+	GATE_TIM1,
+	GATE_TIM2,
+	GATE_TIM3,
+	GATE_TIM4,
+	GATE_TIM5,
+	GATE_TIM6,
+	GATE_TIM7,
+	GATE_TIM8,
+	GATE_TIM10,
+	GATE_TIM11,
+	GATE_TIM12,
+	GATE_TIM13,
+	GATE_TIM14,
+	GATE_TIM15,
+	GATE_TIM16,
+	GATE_TIM17,
+	GATE_TIM20,
+	GATE_TRACE,
+	GATE_UART4,
+	GATE_UART5,
+	GATE_UART7,
+	GATE_UART8,
+	GATE_UART9,
+	GATE_USART1,
+	GATE_USART2,
+	GATE_USART3,
+	GATE_USART6,
+	GATE_USBH,
+	GATE_USB2PHY1,
+	GATE_USB2PHY2,
+	GATE_USB3DR,
+	GATE_USB3PCIEPHY,
+	GATE_USBTC,
+	GATE_VDEC,
+	GATE_VENC,
+	GATE_VREF,
+	GATE_WWDG1,
+	GATE_WWDG2,
+	GATE_NB
+};
+
+#define GATE_CFG(id, _offset, _bit_idx, _offset_clr)[id] = {\
+	.reg_off	= (_offset),\
+	.bit_idx	= (_bit_idx),\
+	.set_clr	= (_offset_clr),\
+}
+
+static const struct stm32_gate_cfg stm32mp25_gates[GATE_NB] = {
+	GATE_CFG(GATE_MCO1,		RCC_MCO1CFGR,		8,	0),
+	GATE_CFG(GATE_MCO2,		RCC_MCO2CFGR,		8,	0),
+	GATE_CFG(GATE_OSPI1,		RCC_OSPI1CFGR,		1,	0),
+	GATE_CFG(GATE_OSPI2,		RCC_OSPI2CFGR,		1,	0),
+	GATE_CFG(GATE_DBG,		RCC_DBGCFGR,		8,	0),
+	GATE_CFG(GATE_TRACE,		RCC_DBGCFGR,		9,	0),
+	GATE_CFG(GATE_STM500,		RCC_STM500CFGR,		1,	0),
+	GATE_CFG(GATE_ETR,		RCC_ETRCFGR,		1,	0),
+	GATE_CFG(GATE_IS2M,		RCC_IS2MCFGR,		1,	0),
+	GATE_CFG(GATE_TIM1,		RCC_TIM1CFGR,		1,	0),
+	GATE_CFG(GATE_TIM2,		RCC_TIM2CFGR,		1,	0),
+	GATE_CFG(GATE_TIM3,		RCC_TIM3CFGR,		1,	0),
+	GATE_CFG(GATE_TIM4,		RCC_TIM4CFGR,		1,	0),
+	GATE_CFG(GATE_TIM5,		RCC_TIM5CFGR,		1,	0),
+	GATE_CFG(GATE_TIM6,		RCC_TIM6CFGR,		1,	0),
+	GATE_CFG(GATE_TIM7,		RCC_TIM7CFGR,		1,	0),
+	GATE_CFG(GATE_TIM8,		RCC_TIM8CFGR,		1,	0),
+	GATE_CFG(GATE_TIM10,		RCC_TIM10CFGR,		1,	0),
+	GATE_CFG(GATE_TIM11,		RCC_TIM11CFGR,		1,	0),
+	GATE_CFG(GATE_TIM12,		RCC_TIM12CFGR,		1,	0),
+	GATE_CFG(GATE_TIM13,		RCC_TIM13CFGR,		1,	0),
+	GATE_CFG(GATE_TIM14,		RCC_TIM14CFGR,		1,	0),
+	GATE_CFG(GATE_TIM15,		RCC_TIM15CFGR,		1,	0),
+	GATE_CFG(GATE_TIM16,		RCC_TIM16CFGR,		1,	0),
+	GATE_CFG(GATE_TIM17,		RCC_TIM17CFGR,		1,	0),
+	GATE_CFG(GATE_TIM20,		RCC_TIM20CFGR,		1,	0),
+	GATE_CFG(GATE_LPTIM1,		RCC_LPTIM1CFGR,		1,	0),
+	GATE_CFG(GATE_LPTIM2,		RCC_LPTIM2CFGR,		1,	0),
+	GATE_CFG(GATE_LPTIM3,		RCC_LPTIM3CFGR,		1,	0),
+	GATE_CFG(GATE_LPTIM4,		RCC_LPTIM4CFGR,		1,	0),
+	GATE_CFG(GATE_LPTIM5,		RCC_LPTIM5CFGR,		1,	0),
+	GATE_CFG(GATE_SPI1,		RCC_SPI1CFGR,		1,	0),
+	GATE_CFG(GATE_SPI2,		RCC_SPI2CFGR,		1,	0),
+	GATE_CFG(GATE_SPI3,		RCC_SPI3CFGR,		1,	0),
+	GATE_CFG(GATE_SPI4,		RCC_SPI4CFGR,		1,	0),
+	GATE_CFG(GATE_SPI5,		RCC_SPI5CFGR,		1,	0),
+	GATE_CFG(GATE_SPI6,		RCC_SPI6CFGR,		1,	0),
+	GATE_CFG(GATE_SPI7,		RCC_SPI7CFGR,		1,	0),
+	GATE_CFG(GATE_SPI8,		RCC_SPI8CFGR,		1,	0),
+	GATE_CFG(GATE_SPDIFRX,		RCC_SPDIFRXCFGR,	1,	0),
+	GATE_CFG(GATE_USART1,		RCC_USART1CFGR,		1,	0),
+	GATE_CFG(GATE_USART2,		RCC_USART2CFGR,		1,	0),
+	GATE_CFG(GATE_USART3,		RCC_USART3CFGR,		1,	0),
+	GATE_CFG(GATE_UART4,		RCC_UART4CFGR,		1,	0),
+	GATE_CFG(GATE_UART5,		RCC_UART5CFGR,		1,	0),
+	GATE_CFG(GATE_USART6,		RCC_USART6CFGR,		1,	0),
+	GATE_CFG(GATE_UART7,		RCC_UART7CFGR,		1,	0),
+	GATE_CFG(GATE_UART8,		RCC_UART8CFGR,		1,	0),
+	GATE_CFG(GATE_UART9,		RCC_UART9CFGR,		1,	0),
+	GATE_CFG(GATE_LPUART1,		RCC_LPUART1CFGR,	1,	0),
+	GATE_CFG(GATE_I2C1,		RCC_I2C1CFGR,		1,	0),
+	GATE_CFG(GATE_I2C2,		RCC_I2C2CFGR,		1,	0),
+	GATE_CFG(GATE_I2C3,		RCC_I2C3CFGR,		1,	0),
+	GATE_CFG(GATE_I2C4,		RCC_I2C4CFGR,		1,	0),
+	GATE_CFG(GATE_I2C5,		RCC_I2C5CFGR,		1,	0),
+	GATE_CFG(GATE_I2C6,		RCC_I2C6CFGR,		1,	0),
+	GATE_CFG(GATE_I2C7,		RCC_I2C7CFGR,		1,	0),
+	GATE_CFG(GATE_I2C8,		RCC_I2C8CFGR,		1,	0),
+	GATE_CFG(GATE_SAI1,		RCC_SAI1CFGR,		1,	0),
+	GATE_CFG(GATE_SAI2,		RCC_SAI2CFGR,		1,	0),
+	GATE_CFG(GATE_SAI3,		RCC_SAI3CFGR,		1,	0),
+	GATE_CFG(GATE_SAI4,		RCC_SAI4CFGR,		1,	0),
+	GATE_CFG(GATE_MDF1,		RCC_MDF1CFGR,		1,	0),
+	GATE_CFG(GATE_ADF1,		RCC_ADF1CFGR,		1,	0),
+	GATE_CFG(GATE_FDCAN,		RCC_FDCANCFGR,		1,	0),
+	GATE_CFG(GATE_HDP,		RCC_HDPCFGR,		1,	0),
+	GATE_CFG(GATE_ADC12,		RCC_ADC12CFGR,		1,	0),
+	GATE_CFG(GATE_ADC3,		RCC_ADC3CFGR,		1,	0),
+	GATE_CFG(GATE_ETH1MAC,		RCC_ETH1CFGR,		1,	0),
+	GATE_CFG(GATE_ETH1STP,		RCC_ETH1CFGR,		4,	0),
+	GATE_CFG(GATE_ETH1,		RCC_ETH1CFGR,		5,	0),
+	GATE_CFG(GATE_ETH1TX,		RCC_ETH1CFGR,		8,	0),
+	GATE_CFG(GATE_ETH1RX,		RCC_ETH1CFGR,		10,	0),
+	GATE_CFG(GATE_ETH2MAC,		RCC_ETH2CFGR,		1,	0),
+	GATE_CFG(GATE_ETH2STP,		RCC_ETH2CFGR,		4,	0),
+	GATE_CFG(GATE_ETH2,		RCC_ETH2CFGR,		5,	0),
+	GATE_CFG(GATE_ETH2TX,		RCC_ETH2CFGR,		8,	0),
+	GATE_CFG(GATE_ETH2RX,		RCC_ETH2CFGR,		10,	0),
+	GATE_CFG(GATE_USBH,		RCC_USBHCFGR,		1,	0),
+	GATE_CFG(GATE_USB2PHY1,		RCC_USB2PHY1CFGR,	1,	0),
+	GATE_CFG(GATE_USB2PHY2,		RCC_USB2PHY2CFGR,	1,	0),
+	GATE_CFG(GATE_USB3DR,		RCC_USB3DRCFGR,		1,	0),
+	GATE_CFG(GATE_USB3PCIEPHY,	RCC_USB3PCIEPHYCFGR,	1,	0),
+	GATE_CFG(GATE_PCIE,		RCC_PCIECFGR,		1,	0),
+	GATE_CFG(GATE_USBTC,		RCC_UCPDCFGR,		1,	0),
+	GATE_CFG(GATE_ETHSWMAC,		RCC_ETHSWCFGR,		1,	0),
+	GATE_CFG(GATE_ETHSW,		RCC_ETHSWCFGR,		5,	0),
+	GATE_CFG(GATE_ETHSWREF,		RCC_ETHSWCFGR,		21,	0),
+	GATE_CFG(GATE_STGEN,		RCC_STGENCFGR,		1,	0),
+	GATE_CFG(GATE_SDMMC1,		RCC_SDMMC1CFGR,		1,	0),
+	GATE_CFG(GATE_SDMMC2,		RCC_SDMMC2CFGR,		1,	0),
+	GATE_CFG(GATE_SDMMC3,		RCC_SDMMC3CFGR,		1,	0),
+	GATE_CFG(GATE_GPU,		RCC_GPUCFGR,		1,	0),
+	GATE_CFG(GATE_LTDC,		RCC_LTDCCFGR,		1,	0),
+	GATE_CFG(GATE_DSI,		RCC_DSICFGR,		1,	0),
+	GATE_CFG(GATE_LVDS,		RCC_LVDSCFGR,		1,	0),
+	GATE_CFG(GATE_CSI,		RCC_CSICFGR,		1,	0),
+	GATE_CFG(GATE_DCMIPP,		RCC_DCMIPPCFGR,		1,	0),
+	GATE_CFG(GATE_CCI,		RCC_CCICFGR,		1,	0),
+	GATE_CFG(GATE_VDEC,		RCC_VDECCFGR,		1,	0),
+	GATE_CFG(GATE_VENC,		RCC_VENCCFGR,		1,	0),
+	GATE_CFG(GATE_RNG,		RCC_RNGCFGR,		1,	0),
+	GATE_CFG(GATE_PKA,		RCC_PKACFGR,		1,	0),
+	GATE_CFG(GATE_SAES,		RCC_SAESCFGR,		1,	0),
+	GATE_CFG(GATE_HASH,		RCC_HASHCFGR,		1,	0),
+	GATE_CFG(GATE_CRYP1,		RCC_CRYP1CFGR,		1,	0),
+	GATE_CFG(GATE_CRYP2,		RCC_CRYP2CFGR,		1,	0),
+	GATE_CFG(GATE_IWDG1,		RCC_IWDG1CFGR,		1,	0),
+	GATE_CFG(GATE_IWDG2,		RCC_IWDG2CFGR,		1,	0),
+	GATE_CFG(GATE_IWDG3,		RCC_IWDG3CFGR,		1,	0),
+	GATE_CFG(GATE_IWDG4,		RCC_IWDG4CFGR,		1,	0),
+	GATE_CFG(GATE_IWDG5,		RCC_IWDG5CFGR,		1,	0),
+	GATE_CFG(GATE_WWDG1,		RCC_WWDG1CFGR,		1,	0),
+	GATE_CFG(GATE_WWDG2,		RCC_WWDG2CFGR,		1,	0),
+	GATE_CFG(GATE_VREF,		RCC_VREFCFGR,		1,	0),
+	GATE_CFG(GATE_DTS,		RCC_DTSCFGR,		1,	0),
+	GATE_CFG(GATE_CRC,		RCC_CRCCFGR,		1,	0),
+	GATE_CFG(GATE_SERC,		RCC_SERCCFGR,		1,	0),
+	GATE_CFG(GATE_OSPIIOM,		RCC_OSPIIOMCFGR,	1,	0),
+	GATE_CFG(GATE_I3C1,		RCC_I3C1CFGR,		1,	0),
+	GATE_CFG(GATE_I3C2,		RCC_I3C2CFGR,		1,	0),
+	GATE_CFG(GATE_I3C3,		RCC_I3C3CFGR,		1,	0),
+	GATE_CFG(GATE_I3C4,		RCC_I3C4CFGR,		1,	0),
+};
+
+#define STM32_COMPOSITE_NODIV(_id, _name, _flags, _sec_id, _gate_id, _mux_id)\
+	STM32_COMPOSITE(_id, _name, _flags, _sec_id, _gate_id, _mux_id, NO_STM32_DIV)
+
+static const struct clock_config stm32mp25_clock_cfg[] = {
+	/* ADC */
+	STM32_GATE(CK_BUS_ADC12, "ck_icn_p_adc12", "ck_icn_ls_mcu", 0, GATE_ADC12, SECF_NONE),
+	STM32_COMPOSITE_NODIV(CK_KER_ADC12, "ck_ker_adc12", 0, SECF_NONE, GATE_ADC12, MUX_ADC12),
+	STM32_GATE(CK_BUS_ADC3, "ck_icn_p_adc3", "ck_icn_ls_mcu", 0, GATE_ADC3, SECF_NONE),
+	STM32_COMPOSITE_NODIV(CK_KER_ADC3, "ck_ker_adc3", 0, SECF_NONE, GATE_ADC3, MUX_ADC3),
+
+	/* ADF */
+	STM32_GATE(CK_BUS_ADF1, "ck_icn_p_adf1", "ck_icn_ls_mcu", 0, GATE_ADF1, SECF_NONE),
+	STM32_GATE(CK_KER_ADF1, "ck_ker_adf1", "ck_flexgen_42", 0, GATE_ADF1, SECF_NONE),
+
+	/* Camera */
+	/* DCMI */
+	STM32_GATE(CK_BUS_CCI, "ck_icn_p_cci", "ck_icn_ls_mcu", 0, GATE_CCI, SECF_NONE),
+
+	/* CSI-HOST */
+	STM32_GATE(CK_BUS_CSI, "ck_icn_p_csi", "ck_icn_apb4", 0, GATE_CSI, SECF_NONE),
+	STM32_GATE(CK_KER_CSI, "ck_ker_csi", "ck_flexgen_29", 0, GATE_CSI, SECF_NONE),
+	STM32_GATE(CK_KER_CSITXESC, "ck_ker_csitxesc", "ck_flexgen_30", 0, GATE_CSI, SECF_NONE),
+
+	/* CSI-PHY */
+	STM32_GATE(CK_KER_CSIPHY, "ck_ker_csiphy", "ck_flexgen_31", 0, GATE_CSI, SECF_NONE),
+
+	/* DCMIPP */
+	STM32_GATE(CK_BUS_DCMIPP, "ck_icn_p_dcmipp", "ck_icn_apb4", 0, GATE_DCMIPP, SECF_NONE),
+
+	/* CRC */
+	STM32_GATE(CK_BUS_CRC, "ck_icn_p_crc", "ck_icn_ls_mcu", 0, GATE_CRC, SECF_NONE),
+
+	/* CRYP */
+	STM32_GATE(CK_BUS_CRYP1, "ck_icn_p_cryp1", "ck_icn_ls_mcu", 0, GATE_CRYP1, SECF_NONE),
+	STM32_GATE(CK_BUS_CRYP2, "ck_icn_p_cryp2", "ck_icn_ls_mcu", 0, GATE_CRYP2, SECF_NONE),
+
+	/* DBG & TRACE*/
+	STM32_GATE(CK_KER_TSDBG, "ck_ker_tsdbg", "ck_flexgen_43", 0, GATE_DBG, SECF_NONE),
+	STM32_GATE(CK_KER_TPIU, "ck_ker_tpiu", "ck_flexgen_44", 0, GATE_TRACE, SECF_NONE),
+	STM32_GATE(CK_BUS_SYSATB, "ck_sys_atb", "ck_flexgen_45", 0, GATE_DBG, SECF_NONE),
+	STM32_GATE(CK_BUS_ETR, "ck_icn_m_etr", "ck_flexgen_45", 0, GATE_ETR, SECF_NONE),
+
+	/* Display subsystem */
+	/* LTDC */
+	STM32_GATE(CK_BUS_LTDC, "ck_icn_p_ltdc", "ck_icn_apb4", 0, GATE_LTDC, SECF_NONE),
+	STM32_GATE(CK_KER_LTDC, "ck_ker_ltdc", "ck_flexgen_27", CLK_SET_RATE_PARENT,
+		   GATE_LTDC, SECF_NONE),
+
+	/* DSI */
+	STM32_GATE(CK_BUS_DSI, "ck_icn_p_dsi", "ck_icn_apb4", 0, GATE_DSI, SECF_NONE),
+	STM32_COMPOSITE_NODIV(CK_KER_DSIBLANE, "clk_lanebyte", 0, SECF_NONE,
+			      GATE_DSI, MUX_DSIBLANE),
+
+	/* LVDS */
+	STM32_GATE(CK_BUS_LVDS, "ck_icn_p_lvds", "ck_icn_apb4", 0, GATE_LVDS, SECF_NONE),
+
+	/* DSI PHY */
+	STM32_COMPOSITE_NODIV(CK_KER_DSIPHY, "ck_ker_dsiphy", 0, SECF_NONE, GATE_DSI, MUX_DSIPHY),
+
+	/* LVDS PHY */
+	STM32_COMPOSITE_NODIV(CK_KER_LVDSPHY, "ck_ker_lvdsphy", 0,
+			      SECF_NONE, GATE_LVDS, MUX_LVDSPHY),
+
+	/* DTS */
+	STM32_COMPOSITE_NODIV(CK_KER_DTS, "ck_ker_dts", 0, SECF_NONE, GATE_DTS, MUX_DTS),
+
+	/* ETHERNET */
+	STM32_GATE(CK_BUS_ETH1, "ck_icn_p_eth1", "ck_icn_ls_mcu", 0, GATE_ETH1, SECF_NONE),
+	STM32_GATE(CK_ETH1_STP, "ck_ker_eth1stp", "ck_icn_ls_mcu", 0, GATE_ETH1STP, SECF_NONE),
+	STM32_GATE(CK_KER_ETH1, "ck_ker_eth1", "ck_flexgen_54", 0, GATE_ETH1, SECF_NONE),
+	STM32_GATE(CK_KER_ETH1, "ck_ker_eth1ptp", "ck_flexgen_56", 0, GATE_ETH1, SECF_NONE),
+	STM32_GATE(CK_ETH1_MAC, "ck_ker_eth1mac", "ck_icn_ls_mcu", 0, GATE_ETH1MAC, SECF_NONE),
+	STM32_GATE(CK_ETH1_TX, "ck_ker_eth1tx", "ck_icn_ls_mcu", 0, GATE_ETH1TX, SECF_NONE),
+	STM32_GATE(CK_ETH1_RX, "ck_ker_eth1rx", "ck_icn_ls_mcu", 0, GATE_ETH1RX, SECF_NONE),
+
+	STM32_GATE(CK_BUS_ETH2, "ck_icn_p_eth2", "ck_icn_ls_mcu", 0, GATE_ETH2, SECF_NONE),
+	STM32_GATE(CK_ETH2_STP, "ck_ker_eth2stp", "ck_icn_ls_mcu", 0, GATE_ETH2STP, SECF_NONE),
+	STM32_GATE(CK_KER_ETH2, "ck_ker_eth2", "ck_flexgen_54", 0, GATE_ETH2, SECF_NONE),
+	STM32_GATE(CK_KER_ETH2, "ck_ker_eth2ptp", "ck_flexgen_56", 0, GATE_ETH2, SECF_NONE),
+	STM32_GATE(CK_ETH2_MAC, "ck_ker_eth2mac", "ck_icn_ls_mcu", 0, GATE_ETH2MAC, SECF_NONE),
+	STM32_GATE(CK_ETH2_TX, "ck_ker_eth2tx", "ck_icn_ls_mcu", 0, GATE_ETH2TX, SECF_NONE),
+	STM32_GATE(CK_ETH2_RX, "ck_ker_eth2rx", "ck_icn_ls_mcu", 0, GATE_ETH2RX, SECF_NONE),
+
+	STM32_GATE(CK_BUS_ETHSW, "ck_icn_p_ethsw", "ck_icn_ls_mcu", 0, GATE_ETHSWMAC, SECF_NONE),
+	STM32_GATE(CK_KER_ETHSW, "ck_ker_ethsw", "ck_flexgen_54", 0, GATE_ETHSW, SECF_NONE),
+	STM32_GATE(CK_KER_ETHSWREF, "ck_ker_ethswref", "ck_flexgen_60", 0,
+		   GATE_ETHSWREF, SECF_NONE),
+
+	/* FDCAN */
+	STM32_GATE(CK_BUS_FDCAN, "ck_icn_p_fdcan", "ck_icn_apb2", 0, GATE_FDCAN, SECF_NONE),
+	STM32_GATE(CK_KER_FDCAN, "ck_ker_fdcan", "ck_flexgen_26", 0, GATE_FDCAN, SECF_NONE),
+
+	/* GPU */
+	STM32_GATE(CK_BUS_GPU, "ck_icn_m_gpu", "ck_flexgen_59", 0, GATE_GPU, SECF_NONE),
+
+	/* HASH */
+	STM32_GATE(CK_BUS_HASH, "ck_icn_p_hash", "ck_icn_ls_mcu", 0, GATE_HASH, SECF_NONE),
+
+	/* HDP */
+	STM32_GATE(CK_BUS_HDP, "ck_icn_p_hdp", "ck_icn_apb3", 0, GATE_HDP, SECF_NONE),
+
+	/* I2C */
+	STM32_GATE(CK_KER_I2C1, "ck_ker_i2c1", "ck_flexgen_12", 0, GATE_I2C1, SECF_NONE),
+	STM32_GATE(CK_KER_I2C2, "ck_ker_i2c2", "ck_flexgen_12", 0, GATE_I2C2, SECF_NONE),
+	STM32_GATE(CK_KER_I2C3, "ck_ker_i2c3", "ck_flexgen_13", 0, GATE_I2C3, SECF_NONE),
+	STM32_GATE(CK_KER_I2C5, "ck_ker_i2c5", "ck_flexgen_13", 0, GATE_I2C5, SECF_NONE),
+	STM32_GATE(CK_KER_I2C4, "ck_ker_i2c4", "ck_flexgen_14", 0, GATE_I2C4, SECF_NONE),
+	STM32_GATE(CK_KER_I2C6, "ck_ker_i2c6", "ck_flexgen_14", 0, GATE_I2C6, SECF_NONE),
+	STM32_GATE(CK_KER_I2C7, "ck_ker_i2c7", "ck_flexgen_15", 0, GATE_I2C7, SECF_NONE),
+	STM32_GATE(CK_KER_I2C8, "ck_ker_i2c8", "ck_flexgen_38", 0, GATE_I2C8, SECF_NONE),
+
+	/* I3C */
+	STM32_GATE(CK_KER_I3C1, "ck_ker_i3c1", "ck_flexgen_12", 0, GATE_I3C1, SECF_NONE),
+	STM32_GATE(CK_KER_I3C2, "ck_ker_i3c2", "ck_flexgen_12", 0, GATE_I3C2, SECF_NONE),
+	STM32_GATE(CK_KER_I3C3, "ck_ker_i3c3", "ck_flexgen_13", 0, GATE_I3C3, SECF_NONE),
+	STM32_GATE(CK_KER_I3C4, "ck_ker_i3c4", "ck_flexgen_36", 0, GATE_I3C4, SECF_NONE),
+
+	/* I2S */
+	STM32_GATE(CK_BUS_IS2M, "ck_icn_p_is2m", "ck_icn_apb3", 0, GATE_IS2M, SECF_NONE),
+
+	/* IWDG */
+	STM32_GATE(CK_BUS_IWDG1, "ck_icn_p_iwdg1", "ck_icn_apb3", 0, GATE_IWDG1, SECF_NONE),
+	STM32_GATE(CK_BUS_IWDG2, "ck_icn_p_iwdg2", "ck_icn_apb3", 0, GATE_IWDG2, SECF_NONE),
+	STM32_GATE(CK_BUS_IWDG3, "ck_icn_p_iwdg3", "ck_icn_apb3", 0, GATE_IWDG3, SECF_NONE),
+	STM32_GATE(CK_BUS_IWDG4, "ck_icn_p_iwdg4", "ck_icn_apb3", 0, GATE_IWDG4, SECF_NONE),
+	STM32_GATE(CK_BUS_IWDG5, "ck_icn_p_iwdg5", "ck_icn_ls_mcu", 0, GATE_IWDG5, SECF_NONE),
+
+	/* LPTIM */
+	STM32_GATE(CK_KER_LPTIM1, "ck_ker_lptim1", "ck_flexgen_07", 0, GATE_LPTIM1, SECF_NONE),
+	STM32_GATE(CK_KER_LPTIM2, "ck_ker_lptim2", "ck_flexgen_07", 0, GATE_LPTIM2, SECF_NONE),
+	STM32_GATE(CK_KER_LPTIM3, "ck_ker_lptim3", "ck_flexgen_40", 0, GATE_LPTIM3, SECF_NONE),
+	STM32_GATE(CK_KER_LPTIM4, "ck_ker_lptim4", "ck_flexgen_41", 0, GATE_LPTIM4, SECF_NONE),
+	STM32_GATE(CK_KER_LPTIM5, "ck_ker_lptim5", "ck_flexgen_41", 0, GATE_LPTIM5, SECF_NONE),
+
+	/* LPUART */
+	STM32_GATE(CK_KER_LPUART1, "ck_ker_lpuart1", "ck_flexgen_39", 0, GATE_LPUART1, SECF_NONE),
+
+	/* MCO1 & MCO2 */
+	STM32_COMPOSITE_NODIV(CK_MCO1, "ck_mco1", 0, SECF_NONE, GATE_MCO1, MUX_MCO1),
+	STM32_COMPOSITE_NODIV(CK_MCO2, "ck_mco2", 0, SECF_NONE, GATE_MCO2, MUX_MCO2),
+
+	/* MDF */
+	STM32_GATE(CK_KER_MDF1, "ck_ker_mdf1", "ck_flexgen_23", 0, GATE_MDF1, SECF_NONE),
+
+	/* OCTOSPI */
+	STM32_GATE(CK_BUS_OSPI1, "ck_icn_s_ospi1,", "ck_icn_hs_mcu", 0, GATE_OSPI1, SECF_NONE),
+	STM32_GATE(CK_BUS_OTFD1, "ck_icn_p_otfd1,", "ck_icn_hs_mcu", 0, GATE_OSPI1, SECF_NONE),
+	STM32_GATE(CK_KER_OSPI1, "ck_ker_ospi1", "ck_flexgen_48", 0, GATE_OSPI1, SECF_NONE),
+	STM32_GATE(CK_BUS_OSPI2, "ck_icn_s_ospi2,", "ck_icn_hs_mcu", 0, GATE_OSPI2, SECF_NONE),
+	STM32_GATE(CK_BUS_OTFD2, "ck_icn_p_otfd2,", "ck_icn_hs_mcu", 0, GATE_OSPI2, SECF_NONE),
+	STM32_GATE(CK_KER_OSPI2, "ck_ker_ospi2", "ck_flexgen_49", 0, GATE_OSPI2, SECF_NONE),
+	STM32_GATE(CK_BUS_OSPIIOM, "ck_icn_p_ospiiom", "ck_icn_ls_mcu", 0, GATE_OSPIIOM, SECF_NONE),
+
+	/* PCIE */
+	STM32_GATE(CK_BUS_PCIE, "ck_icn_p_pcie", "ck_icn_ls_mcu", 0, GATE_PCIE, SECF_NONE),
+
+	/* PKA */
+	STM32_GATE(CK_BUS_PKA, "ck_icn_p_pka", "ck_icn_ls_mcu", 0, GATE_PKA, SECF_NONE),
+
+	/* RNG */
+	STM32_GATE(CK_BUS_RNG, "ck_icn_p_rng", "ck_icn_ls_mcu", CLK_IGNORE_UNUSED,
+		   GATE_RNG, SECF_NONE),
+
+	/* SAES */
+	STM32_GATE(CK_BUS_SAES, "ck_icn_p_saes", "ck_icn_ls_mcu", 0, GATE_SAES, SECF_NONE),
+
+	/* SAI [1..4] */
+	STM32_GATE(CK_BUS_SAI1, "ck_icn_p_sai1", "ck_icn_apb2", 0, GATE_SAI1, SECF_NONE),
+	STM32_GATE(CK_BUS_SAI2, "ck_icn_p_sai2", "ck_icn_apb2", 0, GATE_SAI2, SECF_NONE),
+	STM32_GATE(CK_BUS_SAI3, "ck_icn_p_sai3", "ck_icn_apb2", 0, GATE_SAI3, SECF_NONE),
+	STM32_GATE(CK_BUS_SAI4, "ck_icn_p_sai4", "ck_icn_apb2", 0, GATE_SAI4, SECF_NONE),
+	STM32_GATE(CK_KER_SAI1, "ck_ker_sai1", "ck_flexgen_23", 0, GATE_SAI1, SECF_NONE),
+	STM32_GATE(CK_KER_SAI2, "ck_ker_sai2", "ck_flexgen_24", 0, GATE_SAI2, SECF_NONE),
+	STM32_GATE(CK_KER_SAI3, "ck_ker_sai3", "ck_flexgen_25", 0, GATE_SAI3, SECF_NONE),
+	STM32_GATE(CK_KER_SAI4, "ck_ker_sai4", "ck_flexgen_25", 0, GATE_SAI4, SECF_NONE),
+
+	/* SDMMC */
+	STM32_GATE(CK_KER_SDMMC1, "ck_ker_sdmmc1", "ck_flexgen_51", 0, GATE_SDMMC1, SECF_NONE),
+	STM32_GATE(CK_KER_SDMMC2, "ck_ker_sdmmc2", "ck_flexgen_52", 0, GATE_SDMMC2, SECF_NONE),
+	STM32_GATE(CK_KER_SDMMC3, "ck_ker_sdmmc3", "ck_flexgen_53", 0, GATE_SDMMC3, SECF_NONE),
+
+	/* SERC */
+	STM32_GATE(CK_BUS_SERC, "ck_icn_p_serc", "ck_icn_apb3", 0, GATE_SERC, SECF_NONE),
+
+	/* SPDIF */
+	STM32_GATE(CK_KER_SPDIFRX, "ck_ker_spdifrx", "ck_flexgen_11", 0, GATE_SPDIFRX, SECF_NONE),
+
+	/* SPI */
+	STM32_GATE(CK_KER_SPI1, "ck_ker_spi1", "ck_flexgen_16", 0, GATE_SPI1, SECF_NONE),
+	STM32_GATE(CK_KER_SPI2, "ck_ker_spi2", "ck_flexgen_10", 0, GATE_SPI2, SECF_NONE),
+	STM32_GATE(CK_KER_SPI3, "ck_ker_spi3", "ck_flexgen_10", 0, GATE_SPI3, SECF_NONE),
+	STM32_GATE(CK_KER_SPI4, "ck_ker_spi4", "ck_flexgen_17", 0, GATE_SPI4, SECF_NONE),
+	STM32_GATE(CK_KER_SPI5, "ck_ker_spi5", "ck_flexgen_17", 0, GATE_SPI5, SECF_NONE),
+	STM32_GATE(CK_KER_SPI6, "ck_ker_spi6", "ck_flexgen_18", 0, GATE_SPI6, SECF_NONE),
+	STM32_GATE(CK_KER_SPI7, "ck_ker_spi7", "ck_flexgen_18", 0, GATE_SPI7, SECF_NONE),
+	STM32_GATE(CK_KER_SPI8, "ck_ker_spi8", "ck_flexgen_37", 0, GATE_SPI8, SECF_NONE),
+
+	/* STGEN */
+	STM32_GATE(CK_KER_STGEN, "ck_ker_stgen", "ck_flexgen_33", CLK_IGNORE_UNUSED,
+		   GATE_STGEN, SECF_NONE),
+
+	/* STM500 */
+	STM32_GATE(CK_BUS_STM500, "ck_icn_s_stm500", "ck_icn_ls_mcu", 0, GATE_STM500, SECF_NONE),
+
+	/* Timers */
+	STM32_GATE(CK_KER_TIM2, "ck_ker_tim2", "timg1_ck", 0, GATE_TIM2, SECF_NONE),
+	STM32_GATE(CK_KER_TIM3, "ck_ker_tim3", "timg1_ck", 0, GATE_TIM3, SECF_NONE),
+	STM32_GATE(CK_KER_TIM4, "ck_ker_tim4", "timg1_ck", 0, GATE_TIM4, SECF_NONE),
+	STM32_GATE(CK_KER_TIM5, "ck_ker_tim5", "timg1_ck", 0, GATE_TIM5, SECF_NONE),
+	STM32_GATE(CK_KER_TIM6, "ck_ker_tim6", "timg1_ck", 0, GATE_TIM6, SECF_NONE),
+	STM32_GATE(CK_KER_TIM7, "ck_ker_tim7", "timg1_ck", 0, GATE_TIM7, SECF_NONE),
+	STM32_GATE(CK_KER_TIM10, "ck_ker_tim10", "timg1_ck", 0, GATE_TIM10, SECF_NONE),
+	STM32_GATE(CK_KER_TIM11, "ck_ker_tim11", "timg1_ck", 0, GATE_TIM11, SECF_NONE),
+	STM32_GATE(CK_KER_TIM12, "ck_ker_tim12", "timg1_ck", 0, GATE_TIM12, SECF_NONE),
+	STM32_GATE(CK_KER_TIM13, "ck_ker_tim13", "timg1_ck", 0, GATE_TIM13, SECF_NONE),
+	STM32_GATE(CK_KER_TIM14, "ck_ker_tim14", "timg1_ck", 0, GATE_TIM14, SECF_NONE),
+
+	STM32_GATE(CK_KER_TIM1, "ck_ker_tim1", "timg2_ck", 0, GATE_TIM1, SECF_NONE),
+	STM32_GATE(CK_KER_TIM8, "ck_ker_tim8", "timg2_ck", 0, GATE_TIM8, SECF_NONE),
+	STM32_GATE(CK_KER_TIM15, "ck_ker_tim15", "timg2_ck", 0, GATE_TIM15, SECF_NONE),
+	STM32_GATE(CK_KER_TIM16, "ck_ker_tim16", "timg2_ck", 0, GATE_TIM16, SECF_NONE),
+	STM32_GATE(CK_KER_TIM17, "ck_ker_tim17", "timg2_ck", 0, GATE_TIM17, SECF_NONE),
+	STM32_GATE(CK_KER_TIM20, "ck_ker_tim20", "timg2_ck", 0, GATE_TIM20, SECF_NONE),
+
+	/* UART/USART */
+	STM32_GATE(CK_KER_USART2, "ck_ker_usart2", "ck_flexgen_08", 0, GATE_USART2, SECF_NONE),
+	STM32_GATE(CK_KER_UART4, "ck_ker_uart4", "ck_flexgen_08", 0, GATE_UART4, SECF_NONE),
+	STM32_GATE(CK_KER_USART3, "ck_ker_usart3", "ck_flexgen_09", 0, GATE_USART3, SECF_NONE),
+	STM32_GATE(CK_KER_UART5, "ck_ker_uart5", "ck_flexgen_09", 0, GATE_UART5, SECF_NONE),
+	STM32_GATE(CK_KER_USART1, "ck_ker_usart1", "ck_flexgen_19", 0, GATE_USART1, SECF_NONE),
+	STM32_GATE(CK_KER_USART6, "ck_ker_usart6", "ck_flexgen_20", 0, GATE_USART6, SECF_NONE),
+	STM32_GATE(CK_KER_UART7, "ck_ker_uart7", "ck_flexgen_21", 0, GATE_UART7, SECF_NONE),
+	STM32_GATE(CK_KER_UART8, "ck_ker_uart8", "ck_flexgen_21", 0, GATE_UART8, SECF_NONE),
+	STM32_GATE(CK_KER_UART9, "ck_ker_uart9", "ck_flexgen_22", 0, GATE_UART9, SECF_NONE),
+
+	/* USB2PHY1 */
+	STM32_COMPOSITE_NODIV(CK_KER_USB2PHY1, "ck_ker_usb2phy1", 0,
+			      SECF_NONE, GATE_USB2PHY1, MUX_USB2PHY1),
+
+	/* USBH */
+	STM32_GATE(CK_BUS_USB2OHCI, "ck_icn_m_usb2ohci", "ck_icn_hsl", 0, GATE_USBH, SECF_NONE),
+	STM32_GATE(CK_BUS_USB2EHCI, "ck_icn_m_usb2ehci", "ck_icn_hsl", 0, GATE_USBH, SECF_NONE),
+
+	/* USB2PHY2 */
+	STM32_COMPOSITE_NODIV(CK_KER_USB2PHY2EN, "ck_ker_usb2phy2_en", 0,
+			      SECF_NONE, GATE_USB2PHY2, MUX_USB2PHY2),
+
+	/* USB3 PCIe COMBOPHY */
+	STM32_GATE(CK_BUS_USB3PCIEPHY, "ck_icn_p_usb3pciephy", "ck_icn_apb4", 0,
+		   GATE_USB3PCIEPHY, SECF_NONE),
+
+	STM32_COMPOSITE_NODIV(CK_KER_USB3PCIEPHY, "ck_ker_usb3pciephy", 0,
+			      SECF_NONE, GATE_USB3PCIEPHY, MUX_USB3PCIEPHY),
+
+	/* USB3 DRD */
+	STM32_GATE(CK_BUS_USB3DR, "ck_icn_m_usb3dr", "ck_icn_hsl", 0, GATE_USB3DR, SECF_NONE),
+	STM32_GATE(CK_KER_USB2PHY2, "ck_ker_usb2phy2", "ck_flexgen_58", 0,
+		   GATE_USB3DR, SECF_NONE),
+
+	/* UCPD */
+	STM32_GATE(CK_BUS_USBTC, "ck_icn_p_usbtc", "ck_flexgen_35", 0, GATE_USBTC, SECF_NONE),
+	STM32_GATE(CK_KER_USBTC, "ck_ker_usbtc", "ck_flexgen_35", 0, GATE_USBTC, SECF_NONE),
+
+	/* VDEC / VENC */
+	STM32_GATE(CK_BUS_VDEC, "ck_icn_p_vdec", "ck_icn_apb4", 0, GATE_VDEC, SECF_NONE),
+	STM32_GATE(CK_BUS_VENC, "ck_icn_p_venc", "ck_icn_apb4", 0, GATE_VENC, SECF_NONE),
+
+	/* VREF */
+	STM32_GATE(CK_BUS_VREF, "ck_icn_p_vref", "ck_icn_apb3", 0, RCC_VREFCFGR, SECF_NONE),
+
+	/* WWDG */
+	STM32_GATE(CK_BUS_WWDG1, "ck_icn_p_wwdg1", "ck_icn_apb3", 0, GATE_WWDG1, SECF_NONE),
+	STM32_GATE(CK_BUS_WWDG2, "ck_icn_p_wwdg2", "ck_icn_ls_mcu", 0, GATE_WWDG2, SECF_NONE),
+};
+
+static const struct stm32_clock_match_data stm32mp25_data = {
+	.tab_clocks	= stm32mp25_clock_cfg,
+	.num_clocks	= ARRAY_SIZE(stm32mp25_clock_cfg),
+	.clock_data = &(const struct clk_stm32_clock_data) {
+		.num_gates	= ARRAY_SIZE(stm32mp25_gates),
+		.gates		= stm32mp25_gates,
+		.muxes		= stm32mp25_muxes,
+	},
+};
+
+static int stm32mp25_clk_probe(struct udevice *dev)
+{
+	fdt_addr_t base = dev_read_addr(dev->parent);
+	struct udevice *scmi;
+
+	if (base == FDT_ADDR_T_NONE)
+		return -EINVAL;
+
+	/* force SCMI probe to register all SCMI clocks */
+	uclass_get_device_by_driver(UCLASS_CLK, DM_DRIVER_GET(scmi_clock), &scmi);
+
+	stm32_rcc_init(dev, &stm32mp25_data);
+
+	return 0;
+}
+
+U_BOOT_DRIVER(stm32mp25_clock) = {
+	.name = "stm32mp25_clk",
+	.id = UCLASS_CLK,
+	.ops = &stm32_clk_ops,
+	.priv_auto = sizeof(struct stm32mp_rcc_priv),
+	.probe = stm32mp25_clk_probe,
+};
diff --git a/include/stm32mp25_rcc.h b/include/stm32mp25_rcc.h
new file mode 100644
index 00000000000..595e115c0c4
--- /dev/null
+++ b/include/stm32mp25_rcc.h
@@ -0,0 +1,712 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause */
+/*
+ * Copyright (C STMicroelectronics 2019 - All Rights Reserved
+ * Author: Gabriel Fernandez <gabriel.fernandez@st.com> for STMicroelectronics.
+ */
+
+#ifndef STM32MP25_RCC_H
+#define STM32MP25_RCC_H
+
+#define RCC_SECCFGR0				0x0
+#define RCC_SECCFGR1				0x4
+#define RCC_SECCFGR2				0x8
+#define RCC_SECCFGR3				0xC
+#define RCC_PRIVCFGR0				0x10
+#define RCC_PRIVCFGR1				0x14
+#define RCC_PRIVCFGR2				0x18
+#define RCC_PRIVCFGR3				0x1C
+#define RCC_RCFGLOCKR0				0x20
+#define RCC_RCFGLOCKR1				0x24
+#define RCC_RCFGLOCKR2				0x28
+#define RCC_RCFGLOCKR3				0x2C
+#define RCC_R0CIDCFGR				0x30
+#define RCC_R0SEMCR				0x34
+#define RCC_R1CIDCFGR				0x38
+#define RCC_R1SEMCR				0x3C
+#define RCC_R2CIDCFGR				0x40
+#define RCC_R2SEMCR				0x44
+#define RCC_R3CIDCFGR				0x48
+#define RCC_R3SEMCR				0x4C
+#define RCC_R4CIDCFGR				0x50
+#define RCC_R4SEMCR				0x54
+#define RCC_R5CIDCFGR				0x58
+#define RCC_R5SEMCR				0x5C
+#define RCC_R6CIDCFGR				0x60
+#define RCC_R6SEMCR				0x64
+#define RCC_R7CIDCFGR				0x68
+#define RCC_R7SEMCR				0x6C
+#define RCC_R8CIDCFGR				0x70
+#define RCC_R8SEMCR				0x74
+#define RCC_R9CIDCFGR				0x78
+#define RCC_R9SEMCR				0x7C
+#define RCC_R10CIDCFGR				0x80
+#define RCC_R10SEMCR				0x84
+#define RCC_R11CIDCFGR				0x88
+#define RCC_R11SEMCR				0x8C
+#define RCC_R12CIDCFGR				0x90
+#define RCC_R12SEMCR				0x94
+#define RCC_R13CIDCFGR				0x98
+#define RCC_R13SEMCR				0x9C
+#define RCC_R14CIDCFGR				0xA0
+#define RCC_R14SEMCR				0xA4
+#define RCC_R15CIDCFGR				0xA8
+#define RCC_R15SEMCR				0xAC
+#define RCC_R16CIDCFGR				0xB0
+#define RCC_R16SEMCR				0xB4
+#define RCC_R17CIDCFGR				0xB8
+#define RCC_R17SEMCR				0xBC
+#define RCC_R18CIDCFGR				0xC0
+#define RCC_R18SEMCR				0xC4
+#define RCC_R19CIDCFGR				0xC8
+#define RCC_R19SEMCR				0xCC
+#define RCC_R20CIDCFGR				0xD0
+#define RCC_R20SEMCR				0xD4
+#define RCC_R21CIDCFGR				0xD8
+#define RCC_R21SEMCR				0xDC
+#define RCC_R22CIDCFGR				0xE0
+#define RCC_R22SEMCR				0xE4
+#define RCC_R23CIDCFGR				0xE8
+#define RCC_R23SEMCR				0xEC
+#define RCC_R24CIDCFGR				0xF0
+#define RCC_R24SEMCR				0xF4
+#define RCC_R25CIDCFGR				0xF8
+#define RCC_R25SEMCR				0xFC
+#define RCC_R26CIDCFGR				0x100
+#define RCC_R26SEMCR				0x104
+#define RCC_R27CIDCFGR				0x108
+#define RCC_R27SEMCR				0x10C
+#define RCC_R28CIDCFGR				0x110
+#define RCC_R28SEMCR				0x114
+#define RCC_R29CIDCFGR				0x118
+#define RCC_R29SEMCR				0x11C
+#define RCC_R30CIDCFGR				0x120
+#define RCC_R30SEMCR				0x124
+#define RCC_R31CIDCFGR				0x128
+#define RCC_R31SEMCR				0x12C
+#define RCC_R32CIDCFGR				0x130
+#define RCC_R32SEMCR				0x134
+#define RCC_R33CIDCFGR				0x138
+#define RCC_R33SEMCR				0x13C
+#define RCC_R34CIDCFGR				0x140
+#define RCC_R34SEMCR				0x144
+#define RCC_R35CIDCFGR				0x148
+#define RCC_R35SEMCR				0x14C
+#define RCC_R36CIDCFGR				0x150
+#define RCC_R36SEMCR				0x154
+#define RCC_R37CIDCFGR				0x158
+#define RCC_R37SEMCR				0x15C
+#define RCC_R38CIDCFGR				0x160
+#define RCC_R38SEMCR				0x164
+#define RCC_R39CIDCFGR				0x168
+#define RCC_R39SEMCR				0x16C
+#define RCC_R40CIDCFGR				0x170
+#define RCC_R40SEMCR				0x174
+#define RCC_R41CIDCFGR				0x178
+#define RCC_R41SEMCR				0x17C
+#define RCC_R42CIDCFGR				0x180
+#define RCC_R42SEMCR				0x184
+#define RCC_R43CIDCFGR				0x188
+#define RCC_R43SEMCR				0x18C
+#define RCC_R44CIDCFGR				0x190
+#define RCC_R44SEMCR				0x194
+#define RCC_R45CIDCFGR				0x198
+#define RCC_R45SEMCR				0x19C
+#define RCC_R46CIDCFGR				0x1A0
+#define RCC_R46SEMCR				0x1A4
+#define RCC_R47CIDCFGR				0x1A8
+#define RCC_R47SEMCR				0x1AC
+#define RCC_R48CIDCFGR				0x1B0
+#define RCC_R48SEMCR				0x1B4
+#define RCC_R49CIDCFGR				0x1B8
+#define RCC_R49SEMCR				0x1BC
+#define RCC_R50CIDCFGR				0x1C0
+#define RCC_R50SEMCR				0x1C4
+#define RCC_R51CIDCFGR				0x1C8
+#define RCC_R51SEMCR				0x1CC
+#define RCC_R52CIDCFGR				0x1D0
+#define RCC_R52SEMCR				0x1D4
+#define RCC_R53CIDCFGR				0x1D8
+#define RCC_R53SEMCR				0x1DC
+#define RCC_R54CIDCFGR				0x1E0
+#define RCC_R54SEMCR				0x1E4
+#define RCC_R55CIDCFGR				0x1E8
+#define RCC_R55SEMCR				0x1EC
+#define RCC_R56CIDCFGR				0x1F0
+#define RCC_R56SEMCR				0x1F4
+#define RCC_R57CIDCFGR				0x1F8
+#define RCC_R57SEMCR				0x1FC
+#define RCC_R58CIDCFGR				0x200
+#define RCC_R58SEMCR				0x204
+#define RCC_R59CIDCFGR				0x208
+#define RCC_R59SEMCR				0x20C
+#define RCC_R60CIDCFGR				0x210
+#define RCC_R60SEMCR				0x214
+#define RCC_R61CIDCFGR				0x218
+#define RCC_R61SEMCR				0x21C
+#define RCC_R62CIDCFGR				0x220
+#define RCC_R62SEMCR				0x224
+#define RCC_R63CIDCFGR				0x228
+#define RCC_R63SEMCR				0x22C
+#define RCC_R64CIDCFGR				0x230
+#define RCC_R64SEMCR				0x234
+#define RCC_R65CIDCFGR				0x238
+#define RCC_R65SEMCR				0x23C
+#define RCC_R66CIDCFGR				0x240
+#define RCC_R66SEMCR				0x244
+#define RCC_R67CIDCFGR				0x248
+#define RCC_R67SEMCR				0x24C
+#define RCC_R68CIDCFGR				0x250
+#define RCC_R68SEMCR				0x254
+#define RCC_R69CIDCFGR				0x258
+#define RCC_R69SEMCR				0x25C
+#define RCC_R70CIDCFGR				0x260
+#define RCC_R70SEMCR				0x264
+#define RCC_R71CIDCFGR				0x268
+#define RCC_R71SEMCR				0x26C
+#define RCC_R72CIDCFGR				0x270
+#define RCC_R72SEMCR				0x274
+#define RCC_R73CIDCFGR				0x278
+#define RCC_R73SEMCR				0x27C
+#define RCC_R74CIDCFGR				0x280
+#define RCC_R74SEMCR				0x284
+#define RCC_R75CIDCFGR				0x288
+#define RCC_R75SEMCR				0x28C
+#define RCC_R76CIDCFGR				0x290
+#define RCC_R76SEMCR				0x294
+#define RCC_R77CIDCFGR				0x298
+#define RCC_R77SEMCR				0x29C
+#define RCC_R78CIDCFGR				0x2A0
+#define RCC_R78SEMCR				0x2A4
+#define RCC_R79CIDCFGR				0x2A8
+#define RCC_R79SEMCR				0x2AC
+#define RCC_R80CIDCFGR				0x2B0
+#define RCC_R80SEMCR				0x2B4
+#define RCC_R81CIDCFGR				0x2B8
+#define RCC_R81SEMCR				0x2BC
+#define RCC_R82CIDCFGR				0x2C0
+#define RCC_R82SEMCR				0x2C4
+#define RCC_R83CIDCFGR				0x2C8
+#define RCC_R83SEMCR				0x2CC
+#define RCC_R84CIDCFGR				0x2D0
+#define RCC_R84SEMCR				0x2D4
+#define RCC_R85CIDCFGR				0x2D8
+#define RCC_R85SEMCR				0x2DC
+#define RCC_R86CIDCFGR				0x2E0
+#define RCC_R86SEMCR				0x2E4
+#define RCC_R87CIDCFGR				0x2E8
+#define RCC_R87SEMCR				0x2EC
+#define RCC_R88CIDCFGR				0x2F0
+#define RCC_R88SEMCR				0x2F4
+#define RCC_R89CIDCFGR				0x2F8
+#define RCC_R89SEMCR				0x2FC
+#define RCC_R90CIDCFGR				0x300
+#define RCC_R90SEMCR				0x304
+#define RCC_R91CIDCFGR				0x308
+#define RCC_R91SEMCR				0x30C
+#define RCC_R92CIDCFGR				0x310
+#define RCC_R92SEMCR				0x314
+#define RCC_R93CIDCFGR				0x318
+#define RCC_R93SEMCR				0x31C
+#define RCC_R94CIDCFGR				0x320
+#define RCC_R94SEMCR				0x324
+#define RCC_R95CIDCFGR				0x328
+#define RCC_R95SEMCR				0x32C
+#define RCC_R96CIDCFGR				0x330
+#define RCC_R96SEMCR				0x334
+#define RCC_R97CIDCFGR				0x338
+#define RCC_R97SEMCR				0x33C
+#define RCC_R98CIDCFGR				0x340
+#define RCC_R98SEMCR				0x344
+#define RCC_R99CIDCFGR				0x348
+#define RCC_R99SEMCR				0x34C
+#define RCC_R100CIDCFGR				0x350
+#define RCC_R100SEMCR				0x354
+#define RCC_R101CIDCFGR				0x358
+#define RCC_R101SEMCR				0x35C
+#define RCC_R102CIDCFGR				0x360
+#define RCC_R102SEMCR				0x364
+#define RCC_R103CIDCFGR				0x368
+#define RCC_R103SEMCR				0x36C
+#define RCC_R104CIDCFGR				0x370
+#define RCC_R104SEMCR				0x374
+#define RCC_R105CIDCFGR				0x378
+#define RCC_R105SEMCR				0x37C
+#define RCC_R106CIDCFGR				0x380
+#define RCC_R106SEMCR				0x384
+#define RCC_R107CIDCFGR				0x388
+#define RCC_R107SEMCR				0x38C
+#define RCC_R108CIDCFGR				0x390
+#define RCC_R108SEMCR				0x394
+#define RCC_R109CIDCFGR				0x398
+#define RCC_R109SEMCR				0x39C
+#define RCC_R110CIDCFGR				0x3A0
+#define RCC_R110SEMCR				0x3A4
+#define RCC_R111CIDCFGR				0x3A8
+#define RCC_R111SEMCR				0x3AC
+#define RCC_R112CIDCFGR				0x3B0
+#define RCC_R112SEMCR				0x3B4
+#define RCC_R113CIDCFGR				0x3B8
+#define RCC_R113SEMCR				0x3BC
+#define RCC_GRSTCSETR				0x400
+#define RCC_C1RSTCSETR				0x404
+#define RCC_C1P1RSTCSETR			0x408
+#define RCC_C2RSTCSETR				0x40C
+#define RCC_HWRSTSCLRR				0x410
+#define RCC_C1HWRSTSCLRR			0x414
+#define RCC_C2HWRSTSCLRR			0x418
+#define RCC_C1BOOTRSTSSETR			0x41C
+#define RCC_C1BOOTRSTSCLRR			0x420
+#define RCC_C2BOOTRSTSSETR			0x424
+#define RCC_C2BOOTRSTSCLRR			0x428
+#define RCC_C1SREQSETR				0x42C
+#define RCC_C1SREQCLRR				0x430
+#define RCC_CPUBOOTCR				0x434
+#define RCC_STBYBOOTCR				0x438
+#define RCC_LEGBOOTCR				0x43C
+#define RCC_BDCR				0x440
+#define RCC_D3DCR				0x444
+#define RCC_D3DSR				0x448
+#define RCC_RDCR				0x44C
+#define RCC_C1MSRDCR				0x450
+#define RCC_PWRLPDLYCR				0x454
+#define RCC_C1CIESETR				0x458
+#define RCC_C1CIFCLRR				0x45C
+#define RCC_C2CIESETR				0x460
+#define RCC_C2CIFCLRR				0x464
+#define RCC_IWDGC1FZSETR			0x468
+#define RCC_IWDGC1FZCLRR			0x46C
+#define RCC_IWDGC1CFGSETR			0x470
+#define RCC_IWDGC1CFGCLRR			0x474
+#define RCC_IWDGC2FZSETR			0x478
+#define RCC_IWDGC2FZCLRR			0x47C
+#define RCC_IWDGC2CFGSETR			0x480
+#define RCC_IWDGC2CFGCLRR			0x484
+#define RCC_IWDGC3CFGSETR			0x488
+#define RCC_IWDGC3CFGCLRR			0x48C
+#define RCC_C3CFGR				0x490
+#define RCC_MCO1CFGR				0x494
+#define RCC_MCO2CFGR				0x498
+#define RCC_OCENSETR				0x49C
+#define RCC_OCENCLRR				0x4A0
+#define RCC_OCRDYR				0x4A4
+#define RCC_HSICFGR				0x4A8
+#define RCC_MSICFGR				0x4AC
+#define RCC_RTCDIVR				0x4B0
+#define RCC_APB1DIVR				0x4B4
+#define RCC_APB2DIVR				0x4B8
+#define RCC_APB3DIVR				0x4BC
+#define RCC_APB4DIVR				0x4C0
+#define RCC_APBDBGDIVR				0x4C4
+#define RCC_TIMG1PRER				0x4C8
+#define RCC_TIMG2PRER				0x4CC
+#define RCC_LSMCUDIVR				0x4D0
+#define RCC_DDRCPCFGR				0x4D4
+#define RCC_DDRCAPBCFGR				0x4D8
+#define RCC_DDRPHYCAPBCFGR			0x4DC
+#define RCC_DDRPHYCCFGR				0x4E0
+#define RCC_DDRCFGR				0x4E4
+#define RCC_DDRITFCFGR				0x4E8
+#define RCC_SYSRAMCFGR				0x4F0
+#define RCC_VDERAMCFGR				0x4F4
+#define RCC_SRAM1CFGR				0x4F8
+#define RCC_SRAM2CFGR				0x4FC
+#define RCC_RETRAMCFGR				0x500
+#define RCC_BKPSRAMCFGR				0x504
+#define RCC_LPSRAM1CFGR				0x508
+#define RCC_LPSRAM2CFGR				0x50C
+#define RCC_LPSRAM3CFGR				0x510
+#define RCC_OSPI1CFGR				0x514
+#define RCC_OSPI2CFGR				0x518
+#define RCC_FMCCFGR				0x51C
+#define RCC_DBGCFGR				0x520
+#define RCC_STM500CFGR				0x524
+#define RCC_ETRCFGR				0x528
+#define RCC_GPIOACFGR				0x52C
+#define RCC_GPIOBCFGR				0x530
+#define RCC_GPIOCCFGR				0x534
+#define RCC_GPIODCFGR				0x538
+#define RCC_GPIOECFGR				0x53C
+#define RCC_GPIOFCFGR				0x540
+#define RCC_GPIOGCFGR				0x544
+#define RCC_GPIOHCFGR				0x548
+#define RCC_GPIOICFGR				0x54C
+#define RCC_GPIOJCFGR				0x550
+#define RCC_GPIOKCFGR				0x554
+#define RCC_GPIOZCFGR				0x558
+#define RCC_HPDMA1CFGR				0x55C
+#define RCC_HPDMA2CFGR				0x560
+#define RCC_HPDMA3CFGR				0x564
+#define RCC_LPDMACFGR				0x568
+#define RCC_HSEMCFGR				0x56C
+#define RCC_IPCC1CFGR				0x570
+#define RCC_IPCC2CFGR				0x574
+#define RCC_RTCCFGR				0x578
+#define RCC_SYSCPU1CFGR				0x580
+#define RCC_BSECCFGR				0x584
+#define RCC_IS2MCFGR				0x58C
+#define RCC_PLL2CFGR1				0x590
+#define RCC_PLL2CFGR2				0x594
+#define RCC_PLL2CFGR3				0x598
+#define RCC_PLL2CFGR4				0x59C
+#define RCC_PLL2CFGR5				0x5A0
+#define RCC_PLL2CFGR6				0x5A8
+#define RCC_PLL2CFGR7				0x5AC
+#define RCC_PLL3CFGR1				0x5B8
+#define RCC_PLL3CFGR2				0x5BC
+#define RCC_PLL3CFGR3				0x5C0
+#define RCC_PLL3CFGR4				0x5C4
+#define RCC_PLL3CFGR5				0x5C8
+#define RCC_PLL3CFGR6				0x5D0
+#define RCC_PLL3CFGR7				0x5D4
+#define RCC_HSIFMONCR				0x5E0
+#define RCC_HSIFVALR				0x5E4
+#define RCC_TIM1CFGR				0x700
+#define RCC_TIM2CFGR				0x704
+#define RCC_TIM3CFGR				0x708
+#define RCC_TIM4CFGR				0x70C
+#define RCC_TIM5CFGR				0x710
+#define RCC_TIM6CFGR				0x714
+#define RCC_TIM7CFGR				0x718
+#define RCC_TIM8CFGR				0x71C
+#define RCC_TIM10CFGR				0x720
+#define RCC_TIM11CFGR				0x724
+#define RCC_TIM12CFGR				0x728
+#define RCC_TIM13CFGR				0x72C
+#define RCC_TIM14CFGR				0x730
+#define RCC_TIM15CFGR				0x734
+#define RCC_TIM16CFGR				0x738
+#define RCC_TIM17CFGR				0x73C
+#define RCC_TIM20CFGR				0x740
+#define RCC_LPTIM1CFGR				0x744
+#define RCC_LPTIM2CFGR				0x748
+#define RCC_LPTIM3CFGR				0x74C
+#define RCC_LPTIM4CFGR				0x750
+#define RCC_LPTIM5CFGR				0x754
+#define RCC_SPI1CFGR				0x758
+#define RCC_SPI2CFGR				0x75C
+#define RCC_SPI3CFGR				0x760
+#define RCC_SPI4CFGR				0x764
+#define RCC_SPI5CFGR				0x768
+#define RCC_SPI6CFGR				0x76C
+#define RCC_SPI7CFGR				0x770
+#define RCC_SPI8CFGR				0x774
+#define RCC_SPDIFRXCFGR				0x778
+#define RCC_USART1CFGR				0x77C
+#define RCC_USART2CFGR				0x780
+#define RCC_USART3CFGR				0x784
+#define RCC_UART4CFGR				0x788
+#define RCC_UART5CFGR				0x78C
+#define RCC_USART6CFGR				0x790
+#define RCC_UART7CFGR				0x794
+#define RCC_UART8CFGR				0x798
+#define RCC_UART9CFGR				0x79C
+#define RCC_LPUART1CFGR				0x7A0
+#define RCC_I2C1CFGR				0x7A4
+#define RCC_I2C2CFGR				0x7A8
+#define RCC_I2C3CFGR				0x7AC
+#define RCC_I2C4CFGR				0x7B0
+#define RCC_I2C5CFGR				0x7B4
+#define RCC_I2C6CFGR				0x7B8
+#define RCC_I2C7CFGR				0x7BC
+#define RCC_I2C8CFGR				0x7C0
+#define RCC_SAI1CFGR				0x7C4
+#define RCC_SAI2CFGR				0x7C8
+#define RCC_SAI3CFGR				0x7CC
+#define RCC_SAI4CFGR				0x7D0
+#define RCC_MDF1CFGR				0x7D8
+#define RCC_ADF1CFGR				0x7DC
+#define RCC_FDCANCFGR				0x7E0
+#define RCC_HDPCFGR				0x7E4
+#define RCC_ADC12CFGR				0x7E8
+#define RCC_ADC3CFGR				0x7EC
+#define RCC_ETH1CFGR				0x7F0
+#define RCC_ETH2CFGR				0x7F4
+#define RCC_USBHCFGR				0x7FC
+#define RCC_USB2PHY1CFGR			0x800
+#define RCC_USB2PHY2CFGR			0x804
+#define RCC_USB3DRCFGR				0x808
+#define RCC_USB3PCIEPHYCFGR			0x80C
+#define RCC_PCIECFGR				0x810
+#define RCC_UCPDCFGR				0x814
+#define RCC_ETHSWCFGR				0x818
+#define RCC_ETHSWACMCFGR			0x81C
+#define RCC_ETHSWACMMSGCFGR			0x820
+#define RCC_STGENCFGR				0x824
+#define RCC_SDMMC1CFGR				0x830
+#define RCC_SDMMC2CFGR				0x834
+#define RCC_SDMMC3CFGR				0x838
+#define RCC_GPUCFGR				0x83C
+#define RCC_LTDCCFGR				0x840
+#define RCC_DSICFGR				0x844
+#define RCC_LVDSCFGR				0x850
+#define RCC_CSICFGR				0x858
+#define RCC_DCMIPPCFGR				0x85C
+#define RCC_CCICFGR				0x860
+#define RCC_VDECCFGR				0x864
+#define RCC_VENCCFGR				0x868
+#define RCC_RNGCFGR				0x870
+#define RCC_PKACFGR				0x874
+#define RCC_SAESCFGR				0x878
+#define RCC_HASHCFGR				0x87C
+#define RCC_CRYP1CFGR				0x880
+#define RCC_CRYP2CFGR				0x884
+#define RCC_IWDG1CFGR				0x888
+#define RCC_IWDG2CFGR				0x88C
+#define RCC_IWDG3CFGR				0x890
+#define RCC_IWDG4CFGR				0x894
+#define RCC_IWDG5CFGR				0x898
+#define RCC_WWDG1CFGR				0x89C
+#define RCC_WWDG2CFGR				0x8A0
+#define RCC_VREFCFGR				0x8A8
+#define RCC_DTSCFGR				0x8AC
+#define RCC_CRCCFGR				0x8B4
+#define RCC_SERCCFGR				0x8B8
+#define RCC_OSPIIOMCFGR				0x8BC
+#define RCC_GICV2MCFGR				0x8C0
+#define RCC_I3C1CFGR				0x8C8
+#define RCC_I3C2CFGR				0x8CC
+#define RCC_I3C3CFGR				0x8D0
+#define RCC_I3C4CFGR				0x8D4
+#define RCC_MUXSELCFGR				0x1000
+#define RCC_XBAR0CFGR				0x1018
+#define RCC_XBAR1CFGR				0x101C
+#define RCC_XBAR2CFGR				0x1020
+#define RCC_XBAR3CFGR				0x1024
+#define RCC_XBAR4CFGR				0x1028
+#define RCC_XBAR5CFGR				0x102C
+#define RCC_XBAR6CFGR				0x1030
+#define RCC_XBAR7CFGR				0x1034
+#define RCC_XBAR8CFGR				0x1038
+#define RCC_XBAR9CFGR				0x103C
+#define RCC_XBAR10CFGR				0x1040
+#define RCC_XBAR11CFGR				0x1044
+#define RCC_XBAR12CFGR				0x1048
+#define RCC_XBAR13CFGR				0x104C
+#define RCC_XBAR14CFGR				0x1050
+#define RCC_XBAR15CFGR				0x1054
+#define RCC_XBAR16CFGR				0x1058
+#define RCC_XBAR17CFGR				0x105C
+#define RCC_XBAR18CFGR				0x1060
+#define RCC_XBAR19CFGR				0x1064
+#define RCC_XBAR20CFGR				0x1068
+#define RCC_XBAR21CFGR				0x106C
+#define RCC_XBAR22CFGR				0x1070
+#define RCC_XBAR23CFGR				0x1074
+#define RCC_XBAR24CFGR				0x1078
+#define RCC_XBAR25CFGR				0x107C
+#define RCC_XBAR26CFGR				0x1080
+#define RCC_XBAR27CFGR				0x1084
+#define RCC_XBAR28CFGR				0x1088
+#define RCC_XBAR29CFGR				0x108C
+#define RCC_XBAR30CFGR				0x1090
+#define RCC_XBAR31CFGR				0x1094
+#define RCC_XBAR32CFGR				0x1098
+#define RCC_XBAR33CFGR				0x109C
+#define RCC_XBAR34CFGR				0x10A0
+#define RCC_XBAR35CFGR				0x10A4
+#define RCC_XBAR36CFGR				0x10A8
+#define RCC_XBAR37CFGR				0x10AC
+#define RCC_XBAR38CFGR				0x10B0
+#define RCC_XBAR39CFGR				0x10B4
+#define RCC_XBAR40CFGR				0x10B8
+#define RCC_XBAR41CFGR				0x10BC
+#define RCC_XBAR42CFGR				0x10C0
+#define RCC_XBAR43CFGR				0x10C4
+#define RCC_XBAR44CFGR				0x10C8
+#define RCC_XBAR45CFGR				0x10CC
+#define RCC_XBAR46CFGR				0x10D0
+#define RCC_XBAR47CFGR				0x10D4
+#define RCC_XBAR48CFGR				0x10D8
+#define RCC_XBAR49CFGR				0x10DC
+#define RCC_XBAR50CFGR				0x10E0
+#define RCC_XBAR51CFGR				0x10E4
+#define RCC_XBAR52CFGR				0x10E8
+#define RCC_XBAR53CFGR				0x10EC
+#define RCC_XBAR54CFGR				0x10F0
+#define RCC_XBAR55CFGR				0x10F4
+#define RCC_XBAR56CFGR				0x10F8
+#define RCC_XBAR57CFGR				0x10FC
+#define RCC_XBAR58CFGR				0x1100
+#define RCC_XBAR59CFGR				0x1104
+#define RCC_XBAR60CFGR				0x1108
+#define RCC_XBAR61CFGR				0x110C
+#define RCC_XBAR62CFGR				0x1110
+#define RCC_XBAR63CFGR				0x1114
+#define RCC_PREDIV0CFGR				0x1118
+#define RCC_PREDIV1CFGR				0x111C
+#define RCC_PREDIV2CFGR				0x1120
+#define RCC_PREDIV3CFGR				0x1124
+#define RCC_PREDIV4CFGR				0x1128
+#define RCC_PREDIV5CFGR				0x112C
+#define RCC_PREDIV6CFGR				0x1130
+#define RCC_PREDIV7CFGR				0x1134
+#define RCC_PREDIV8CFGR				0x1138
+#define RCC_PREDIV9CFGR				0x113C
+#define RCC_PREDIV10CFGR			0x1140
+#define RCC_PREDIV11CFGR			0x1144
+#define RCC_PREDIV12CFGR			0x1148
+#define RCC_PREDIV13CFGR			0x114C
+#define RCC_PREDIV14CFGR			0x1150
+#define RCC_PREDIV15CFGR			0x1154
+#define RCC_PREDIV16CFGR			0x1158
+#define RCC_PREDIV17CFGR			0x115C
+#define RCC_PREDIV18CFGR			0x1160
+#define RCC_PREDIV19CFGR			0x1164
+#define RCC_PREDIV20CFGR			0x1168
+#define RCC_PREDIV21CFGR			0x116C
+#define RCC_PREDIV22CFGR			0x1170
+#define RCC_PREDIV23CFGR			0x1174
+#define RCC_PREDIV24CFGR			0x1178
+#define RCC_PREDIV25CFGR			0x117C
+#define RCC_PREDIV26CFGR			0x1180
+#define RCC_PREDIV27CFGR			0x1184
+#define RCC_PREDIV28CFGR			0x1188
+#define RCC_PREDIV29CFGR			0x118C
+#define RCC_PREDIV30CFGR			0x1190
+#define RCC_PREDIV31CFGR			0x1194
+#define RCC_PREDIV32CFGR			0x1198
+#define RCC_PREDIV33CFGR			0x119C
+#define RCC_PREDIV34CFGR			0x11A0
+#define RCC_PREDIV35CFGR			0x11A4
+#define RCC_PREDIV36CFGR			0x11A8
+#define RCC_PREDIV37CFGR			0x11AC
+#define RCC_PREDIV38CFGR			0x11B0
+#define RCC_PREDIV39CFGR			0x11B4
+#define RCC_PREDIV40CFGR			0x11B8
+#define RCC_PREDIV41CFGR			0x11BC
+#define RCC_PREDIV42CFGR			0x11C0
+#define RCC_PREDIV43CFGR			0x11C4
+#define RCC_PREDIV44CFGR			0x11C8
+#define RCC_PREDIV45CFGR			0x11CC
+#define RCC_PREDIV46CFGR			0x11D0
+#define RCC_PREDIV47CFGR			0x11D4
+#define RCC_PREDIV48CFGR			0x11D8
+#define RCC_PREDIV49CFGR			0x11DC
+#define RCC_PREDIV50CFGR			0x11E0
+#define RCC_PREDIV51CFGR			0x11E4
+#define RCC_PREDIV52CFGR			0x11E8
+#define RCC_PREDIV53CFGR			0x11EC
+#define RCC_PREDIV54CFGR			0x11F0
+#define RCC_PREDIV55CFGR			0x11F4
+#define RCC_PREDIV56CFGR			0x11F8
+#define RCC_PREDIV57CFGR			0x11FC
+#define RCC_PREDIV58CFGR			0x1200
+#define RCC_PREDIV59CFGR			0x1204
+#define RCC_PREDIV60CFGR			0x1208
+#define RCC_PREDIV61CFGR			0x120C
+#define RCC_PREDIV62CFGR			0x1210
+#define RCC_PREDIV63CFGR			0x1214
+#define RCC_PREDIVSR1				0x1218
+#define RCC_PREDIVSR2				0x121C
+#define RCC_FINDIV0CFGR				0x1224
+#define RCC_FINDIV1CFGR				0x1228
+#define RCC_FINDIV2CFGR				0x122C
+#define RCC_FINDIV3CFGR				0x1230
+#define RCC_FINDIV4CFGR				0x1234
+#define RCC_FINDIV5CFGR				0x1238
+#define RCC_FINDIV6CFGR				0x123C
+#define RCC_FINDIV7CFGR				0x1240
+#define RCC_FINDIV8CFGR				0x1244
+#define RCC_FINDIV9CFGR				0x1248
+#define RCC_FINDIV10CFGR			0x124C
+#define RCC_FINDIV11CFGR			0x1250
+#define RCC_FINDIV12CFGR			0x1254
+#define RCC_FINDIV13CFGR			0x1258
+#define RCC_FINDIV14CFGR			0x125C
+#define RCC_FINDIV15CFGR			0x1260
+#define RCC_FINDIV16CFGR			0x1264
+#define RCC_FINDIV17CFGR			0x1268
+#define RCC_FINDIV18CFGR			0x126C
+#define RCC_FINDIV19CFGR			0x1270
+#define RCC_FINDIV20CFGR			0x1274
+#define RCC_FINDIV21CFGR			0x1278
+#define RCC_FINDIV22CFGR			0x127C
+#define RCC_FINDIV23CFGR			0x1280
+#define RCC_FINDIV24CFGR			0x1284
+#define RCC_FINDIV25CFGR			0x1288
+#define RCC_FINDIV26CFGR			0x128C
+#define RCC_FINDIV27CFGR			0x1290
+#define RCC_FINDIV28CFGR			0x1294
+#define RCC_FINDIV29CFGR			0x1298
+#define RCC_FINDIV30CFGR			0x129C
+#define RCC_FINDIV31CFGR			0x12A0
+#define RCC_FINDIV32CFGR			0x12A4
+#define RCC_FINDIV33CFGR			0x12A8
+#define RCC_FINDIV34CFGR			0x12AC
+#define RCC_FINDIV35CFGR			0x12B0
+#define RCC_FINDIV36CFGR			0x12B4
+#define RCC_FINDIV37CFGR			0x12B8
+#define RCC_FINDIV38CFGR			0x12BC
+#define RCC_FINDIV39CFGR			0x12C0
+#define RCC_FINDIV40CFGR			0x12C4
+#define RCC_FINDIV41CFGR			0x12C8
+#define RCC_FINDIV42CFGR			0x12CC
+#define RCC_FINDIV43CFGR			0x12D0
+#define RCC_FINDIV44CFGR			0x12D4
+#define RCC_FINDIV45CFGR			0x12D8
+#define RCC_FINDIV46CFGR			0x12DC
+#define RCC_FINDIV47CFGR			0x12E0
+#define RCC_FINDIV48CFGR			0x12E4
+#define RCC_FINDIV49CFGR			0x12E8
+#define RCC_FINDIV50CFGR			0x12EC
+#define RCC_FINDIV51CFGR			0x12F0
+#define RCC_FINDIV52CFGR			0x12F4
+#define RCC_FINDIV53CFGR			0x12F8
+#define RCC_FINDIV54CFGR			0x12FC
+#define RCC_FINDIV55CFGR			0x1300
+#define RCC_FINDIV56CFGR			0x1304
+#define RCC_FINDIV57CFGR			0x1308
+#define RCC_FINDIV58CFGR			0x130C
+#define RCC_FINDIV59CFGR			0x1310
+#define RCC_FINDIV60CFGR			0x1314
+#define RCC_FINDIV61CFGR			0x1318
+#define RCC_FINDIV62CFGR			0x131C
+#define RCC_FINDIV63CFGR			0x1320
+#define RCC_FINDIVSR1				0x1324
+#define RCC_FINDIVSR2				0x1328
+#define RCC_FCALCOBS0CFGR			0x1340
+#define RCC_FCALCOBS1CFGR			0x1344
+#define RCC_FCALCREFCFGR			0x1348
+#define RCC_FCALCCR1				0x134C
+#define RCC_FCALCCR2				0x1354
+#define RCC_FCALCSR				0x1358
+#define RCC_PLL4CFGR1				0x1360
+#define RCC_PLL4CFGR2				0x1364
+#define RCC_PLL4CFGR3				0x1368
+#define RCC_PLL4CFGR4				0x136C
+#define RCC_PLL4CFGR5				0x1370
+#define RCC_PLL4CFGR6				0x1378
+#define RCC_PLL4CFGR7				0x137C
+#define RCC_PLL5CFGR1				0x1388
+#define RCC_PLL5CFGR2				0x138C
+#define RCC_PLL5CFGR3				0x1390
+#define RCC_PLL5CFGR4				0x1394
+#define RCC_PLL5CFGR5				0x1398
+#define RCC_PLL5CFGR6				0x13A0
+#define RCC_PLL5CFGR7				0x13A4
+#define RCC_PLL6CFGR1				0x13B0
+#define RCC_PLL6CFGR2				0x13B4
+#define RCC_PLL6CFGR3				0x13B8
+#define RCC_PLL6CFGR4				0x13BC
+#define RCC_PLL6CFGR5				0x13C0
+#define RCC_PLL6CFGR6				0x13C8
+#define RCC_PLL6CFGR7				0x13CC
+#define RCC_PLL7CFGR1				0x13D8
+#define RCC_PLL7CFGR2				0x13DC
+#define RCC_PLL7CFGR3				0x13E0
+#define RCC_PLL7CFGR4				0x13E4
+#define RCC_PLL7CFGR5				0x13E8
+#define RCC_PLL7CFGR6				0x13F0
+#define RCC_PLL7CFGR7				0x13F4
+#define RCC_PLL8CFGR1				0x1400
+#define RCC_PLL8CFGR2				0x1404
+#define RCC_PLL8CFGR3				0x1408
+#define RCC_PLL8CFGR4				0x140C
+#define RCC_PLL8CFGR5				0x1410
+#define RCC_PLL8CFGR6				0x1418
+#define RCC_PLL8CFGR7				0x141C
+#define RCC_VERR				0xFFF4
+#define RCC_IDR					0xFFF8
+#define RCC_SIDR				0xFFFC
+
+#endif /* STM32MP25_RCC_H */
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
