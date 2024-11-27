Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 066979DABBF
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Nov 2024 17:25:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A30ECC78036;
	Wed, 27 Nov 2024 16:25:57 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5A01C7801A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2024 16:25:49 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ARBVt3K012293;
 Wed, 27 Nov 2024 17:24:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=H/GyckW4rZYRPejuA6kRf4
 EtmEuQgtUoYmp7TCQN+SQ=; b=FydeDFYHbbPdBequkF3tRg3dyg1scJND7hPp+3
 Xd1gpM+vEYfl2blY1mXZAF9nJawXBfMI88qh4t3CJw7l5qzk9YcsMzREUIqkrguV
 HIMA9sTf+s/aV5oyrsGDr2qnHGcGqFhueRrhIcd7bovQCQtCwZGmYeb4scqzmK5x
 o2HNpVuEjG54zrXdJThejXPcRXWzZs2rE1tZ2JF5nkBGoG3cbB8ObSrimjDVwxoL
 qGyoUTQbuRKRlIacETX0dTWlxgZmsUTGMtAxl5dhhxCmdufLGUYiBSg2Iye5iDWG
 7/hmXW79R4G16aVELm7gwKcfZ4qh04bjz3Fc9uPvXiTjOSPQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 435xfub0u5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2024 17:24:33 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 67AE54004D;
 Wed, 27 Nov 2024 17:23:39 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E056E29739A;
 Wed, 27 Nov 2024 17:23:13 +0100 (CET)
Received: from localhost (10.48.86.243) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 27 Nov
 2024 17:23:13 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 27 Nov 2024 17:23:09 +0100
Message-ID: <20241127172239.1.I7b5a4d95ba28bd08aa07ab3e8112988a5ec7e8e5@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.243]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Lukasz Majewski <lukma@denx.de>,
 Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] stm32: remove dt-binding headers that are
	available upstream
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

Some dt-binding headers mask the upstream ones which can lead to build
failures, or worse: super weird bugs, if they get out of sync.

Remove these headers so our devicetree and binding headers will both be
in sync with upstream.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/clk/stm32/clk-stm32h7.c               |   3 +
 include/dt-bindings/clock/stm32fx-clock.h     |  63 ----
 include/dt-bindings/clock/stm32h7-clks.h      | 167 -----------
 include/dt-bindings/clock/stm32mp1-clks.h     | 274 ------------------
 include/dt-bindings/clock/stm32mp13-clks.h    | 229 ---------------
 include/dt-bindings/mfd/stm32f4-rcc.h         | 108 -------
 include/dt-bindings/mfd/stm32f7-rcc.h         | 115 --------
 include/dt-bindings/mfd/stm32h7-rcc.h         | 138 ---------
 include/dt-bindings/pinctrl/stm32-pinfunc.h   |  45 ---
 .../regulator/st,stm32mp13-regulator.h        |  42 ---
 include/dt-bindings/reset/stm32mp1-resets.h   | 123 --------
 include/dt-bindings/reset/stm32mp13-resets.h  | 100 -------
 12 files changed, 3 insertions(+), 1404 deletions(-)
 delete mode 100644 include/dt-bindings/clock/stm32fx-clock.h
 delete mode 100644 include/dt-bindings/clock/stm32h7-clks.h
 delete mode 100644 include/dt-bindings/clock/stm32mp1-clks.h
 delete mode 100644 include/dt-bindings/clock/stm32mp13-clks.h
 delete mode 100644 include/dt-bindings/mfd/stm32f4-rcc.h
 delete mode 100644 include/dt-bindings/mfd/stm32f7-rcc.h
 delete mode 100644 include/dt-bindings/mfd/stm32h7-rcc.h
 delete mode 100644 include/dt-bindings/pinctrl/stm32-pinfunc.h
 delete mode 100644 include/dt-bindings/regulator/st,stm32mp13-regulator.h
 delete mode 100644 include/dt-bindings/reset/stm32mp1-resets.h
 delete mode 100644 include/dt-bindings/reset/stm32mp13-resets.h

diff --git a/drivers/clk/stm32/clk-stm32h7.c b/drivers/clk/stm32/clk-stm32h7.c
index a554eda504de..6acf2ff0a8fb 100644
--- a/drivers/clk/stm32/clk-stm32h7.c
+++ b/drivers/clk/stm32/clk-stm32h7.c
@@ -18,6 +18,9 @@
 
 #include <dt-bindings/clock/stm32h7-clks.h>
 
+/* must be equal to last peripheral clock index */
+#define LAST_PERIF_BANK SYSCFG_CK
+
 /* RCC CR specific definitions */
 #define RCC_CR_HSION			BIT(0)
 #define RCC_CR_HSIRDY			BIT(2)
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
index 1aa267e76a53..000000000000
--- a/include/dt-bindings/mfd/stm32f7-rcc.h
+++ /dev/null
@@ -1,115 +0,0 @@
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
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
