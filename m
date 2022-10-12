Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6055FC7D1
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Oct 2022 16:53:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D542C640F3;
	Wed, 12 Oct 2022 14:53:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA8CFC0D2BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 12:33:58 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CAd9M1022459;
 Wed, 12 Oct 2022 14:33:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=NdVVvWsJHe2XrJkU3broYlstTy80z+U1yYN3WKWvlRQ=;
 b=UHs8pE3mHOTimM7OGQ5Oell0fvABCdutW1B0R9OEiMO6ASPlmb63vM3CutCObiVh4pHb
 2KmbqCw26DUnteQYMjMlbkqIC7aYNE1JgURNMX79ZNsDas8ios1Hqw/d172PHfDy188F
 KODVQ/0RnGLiG2vnjwoHkk49dr09mv/DFFLTH/e+wyRSpcQyAlVRGt90OG4Dx6GeWT7n
 iaPCWOTjKZue3mS9l7FjAttZnFMQzLA2/NXdLHuwN2Zq3sdWDXuYI6N12WDkJnoXT45d
 lo92RbnP0k2JiHbBYMc+Rmx3zFFkQd7R45sRbbL5KQ/Fy7Hd+4hgw7w7qUICaDOjsKxI Mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k5tmahcq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 14:33:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1AB92100034;
 Wed, 12 Oct 2022 14:33:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 16A61228A2B;
 Wed, 12 Oct 2022 14:33:53 +0200 (CEST)
Received: from localhost (10.75.127.123) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Wed, 12 Oct
 2022 14:33:52 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Oct 2022 14:33:15 +0200
Message-ID: <20221012123317.434898-2-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221012123317.434898-1-gabriel.fernandez@foss.st.com>
References: <20221012123317.434898-1-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.123]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_06,2022-10-12_01,2022-06-22_01
X-Mailman-Approved-At: Wed, 12 Oct 2022 14:53:55 +0000
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/3] dt-bindings: stm32mp13: add clock & reset
	support for STM32MP13
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

Add support of stm32mp13 DT bindings of clock and reset.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---

 MAINTAINERS                                  |   2 +
 include/dt-bindings/clock/stm32mp13-clks.h   | 229 +++++++++++++++++++
 include/dt-bindings/reset/stm32mp13-resets.h | 100 ++++++++
 3 files changed, 331 insertions(+)
 create mode 100644 include/dt-bindings/clock/stm32mp13-clks.h
 create mode 100644 include/dt-bindings/reset/stm32mp13-resets.h

diff --git a/MAINTAINERS b/MAINTAINERS
index cb4d44584d..475194207b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -538,9 +538,11 @@ F:	drivers/video/stm32/stm32_ltdc.c
 F:	drivers/watchdog/stm32mp_wdt.c
 F:	include/dt-bindings/clock/stm32fx-clock.h
 F:	include/dt-bindings/clock/stm32mp1-clks.h
+F:	include/dt-bindings/clock/stm32mp13-clks.h
 F:	include/dt-bindings/clock/stm32mp1-clksrc.h
 F:	include/dt-bindings/pinctrl/stm32-pinfunc.h
 F:	include/dt-bindings/reset/stm32mp1-resets.h
+F:	include/dt-bindings/reset/stm32mp13-resets.h
 F:	include/stm32_rcc.h
 F:	tools/stm32image.c
 N:	stm
diff --git a/include/dt-bindings/clock/stm32mp13-clks.h b/include/dt-bindings/clock/stm32mp13-clks.h
new file mode 100644
index 0000000000..799dee5b80
--- /dev/null
+++ b/include/dt-bindings/clock/stm32mp13-clks.h
@@ -0,0 +1,229 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later or BSD-3-Clause */
+/*
+ * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
+ * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
+ */
+
+#ifndef _DT_BINDINGS_STM32MP13_CLKS_H_
+#define _DT_BINDINGS_STM32MP13_CLKS_H_
+
+/* OSCILLATOR clocks */
+#define CK_HSE		0
+#define CK_CSI		1
+#define CK_LSI		2
+#define CK_LSE		3
+#define CK_HSI		4
+#define CK_HSE_DIV2	5
+
+/* PLL */
+#define PLL1		6
+#define PLL2		7
+#define PLL3		8
+#define PLL4		9
+
+/* ODF */
+#define PLL1_P		10
+#define PLL1_Q		11
+#define PLL1_R		12
+#define PLL2_P		13
+#define PLL2_Q		14
+#define PLL2_R		15
+#define PLL3_P		16
+#define PLL3_Q		17
+#define PLL3_R		18
+#define PLL4_P		19
+#define PLL4_Q		20
+#define PLL4_R		21
+
+#define PCLK1		22
+#define PCLK2		23
+#define PCLK3		24
+#define PCLK4		25
+#define PCLK5		26
+#define PCLK6		27
+
+/* SYSTEM CLOCK */
+#define CK_PER		28
+#define CK_MPU		29
+#define CK_AXI		30
+#define CK_MLAHB	31
+
+/* BASE TIMER */
+#define CK_TIMG1	32
+#define CK_TIMG2	33
+#define CK_TIMG3	34
+
+/* AUX */
+#define RTC		35
+
+/* TRACE & DEBUG clocks */
+#define CK_DBG		36
+#define CK_TRACE	37
+
+/* MCO clocks */
+#define CK_MCO1		38
+#define CK_MCO2		39
+
+/* IP clocks */
+#define SYSCFG		40
+#define VREF		41
+#define DTS		42
+#define PMBCTRL		43
+#define HDP		44
+#define IWDG2		45
+#define STGENRO		46
+#define USART1		47
+#define RTCAPB		48
+#define TZC		49
+#define TZPC		50
+#define IWDG1		51
+#define BSEC		52
+#define DMA1		53
+#define DMA2		54
+#define DMAMUX1		55
+#define DMAMUX2		56
+#define GPIOA		57
+#define GPIOB		58
+#define GPIOC		59
+#define GPIOD		60
+#define GPIOE		61
+#define GPIOF		62
+#define GPIOG		63
+#define GPIOH		64
+#define GPIOI		65
+#define CRYP1		66
+#define HASH1		67
+#define BKPSRAM		68
+#define MDMA		69
+#define CRC1		70
+#define USBH		71
+#define DMA3		72
+#define TSC		73
+#define PKA		74
+#define AXIMC		75
+#define MCE		76
+#define ETH1TX		77
+#define ETH2TX		78
+#define ETH1RX		79
+#define ETH2RX		80
+#define ETH1MAC		81
+#define ETH2MAC		82
+#define ETH1STP		83
+#define ETH2STP		84
+
+/* IP clocks with parents */
+#define SDMMC1_K	85
+#define SDMMC2_K	86
+#define ADC1_K		87
+#define ADC2_K		88
+#define FMC_K		89
+#define QSPI_K		90
+#define RNG1_K		91
+#define USBPHY_K	92
+#define STGEN_K		93
+#define SPDIF_K		94
+#define SPI1_K		95
+#define SPI2_K		96
+#define SPI3_K		97
+#define SPI4_K		98
+#define SPI5_K		99
+#define I2C1_K		100
+#define I2C2_K		101
+#define I2C3_K		102
+#define I2C4_K		103
+#define I2C5_K		104
+#define TIM2_K		105
+#define TIM3_K		106
+#define TIM4_K		107
+#define TIM5_K		108
+#define TIM6_K		109
+#define TIM7_K		110
+#define TIM12_K		111
+#define TIM13_K		112
+#define TIM14_K		113
+#define TIM1_K		114
+#define TIM8_K		115
+#define TIM15_K		116
+#define TIM16_K		117
+#define TIM17_K		118
+#define LPTIM1_K	119
+#define LPTIM2_K	120
+#define LPTIM3_K	121
+#define LPTIM4_K	122
+#define LPTIM5_K	123
+#define USART1_K	124
+#define USART2_K	125
+#define USART3_K	126
+#define UART4_K		127
+#define UART5_K		128
+#define USART6_K	129
+#define UART7_K		130
+#define UART8_K		131
+#define DFSDM_K		132
+#define FDCAN_K		133
+#define SAI1_K		134
+#define SAI2_K		135
+#define ADFSDM_K	136
+#define USBO_K		137
+#define LTDC_PX		138
+#define ETH1CK_K	139
+#define ETH1PTP_K	140
+#define ETH2CK_K	141
+#define ETH2PTP_K	142
+#define DCMIPP_K	143
+#define SAES_K		144
+#define DTS_K		145
+
+/* DDR */
+#define DDRC1		146
+#define DDRC1LP		147
+#define DDRC2		148
+#define DDRC2LP		149
+#define DDRPHYC		150
+#define DDRPHYCLP	151
+#define DDRCAPB		152
+#define DDRCAPBLP	153
+#define AXIDCG		154
+#define DDRPHYCAPB	155
+#define DDRPHYCAPBLP	156
+#define DDRPERFM	157
+
+#define ADC1		158
+#define ADC2		159
+#define SAI1		160
+#define SAI2		161
+
+#define STM32MP1_LAST_CLK 162
+
+/* SCMI clock identifiers */
+#define CK_SCMI_HSE		0
+#define CK_SCMI_HSI		1
+#define CK_SCMI_CSI		2
+#define CK_SCMI_LSE		3
+#define CK_SCMI_LSI		4
+#define CK_SCMI_HSE_DIV2	5
+#define CK_SCMI_PLL2_Q		6
+#define CK_SCMI_PLL2_R		7
+#define CK_SCMI_PLL3_P		8
+#define CK_SCMI_PLL3_Q		9
+#define CK_SCMI_PLL3_R		10
+#define CK_SCMI_PLL4_P		11
+#define CK_SCMI_PLL4_Q		12
+#define CK_SCMI_PLL4_R		13
+#define CK_SCMI_MPU		14
+#define CK_SCMI_AXI		15
+#define CK_SCMI_MLAHB		16
+#define CK_SCMI_CKPER		17
+#define CK_SCMI_PCLK1		18
+#define CK_SCMI_PCLK2		19
+#define CK_SCMI_PCLK3		20
+#define CK_SCMI_PCLK4		21
+#define CK_SCMI_PCLK5		22
+#define CK_SCMI_PCLK6		23
+#define CK_SCMI_CKTIMG1		24
+#define CK_SCMI_CKTIMG2		25
+#define CK_SCMI_CKTIMG3		26
+#define CK_SCMI_RTC		27
+#define CK_SCMI_RTCAPB		28
+
+#endif /* _DT_BINDINGS_STM32MP13_CLKS_H_ */
diff --git a/include/dt-bindings/reset/stm32mp13-resets.h b/include/dt-bindings/reset/stm32mp13-resets.h
new file mode 100644
index 0000000000..18ccb05db6
--- /dev/null
+++ b/include/dt-bindings/reset/stm32mp13-resets.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later or BSD-3-Clause */
+/*
+ * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
+ * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
+ */
+
+#ifndef _DT_BINDINGS_STM32MP13_RESET_H_
+#define _DT_BINDINGS_STM32MP13_RESET_H_
+
+#define TIM2_R		13568
+#define TIM3_R		13569
+#define TIM4_R		13570
+#define TIM5_R		13571
+#define TIM6_R		13572
+#define TIM7_R		13573
+#define LPTIM1_R	13577
+#define SPI2_R		13579
+#define SPI3_R		13580
+#define USART3_R	13583
+#define UART4_R		13584
+#define UART5_R		13585
+#define UART7_R		13586
+#define UART8_R		13587
+#define I2C1_R		13589
+#define I2C2_R		13590
+#define SPDIF_R		13594
+#define TIM1_R		13632
+#define TIM8_R		13633
+#define SPI1_R		13640
+#define USART6_R	13645
+#define SAI1_R		13648
+#define SAI2_R		13649
+#define DFSDM_R		13652
+#define FDCAN_R		13656
+#define LPTIM2_R	13696
+#define LPTIM3_R	13697
+#define LPTIM4_R	13698
+#define LPTIM5_R	13699
+#define SYSCFG_R	13707
+#define VREF_R		13709
+#define DTS_R		13712
+#define PMBCTRL_R	13713
+#define LTDC_R		13760
+#define DCMIPP_R	13761
+#define DDRPERFM_R	13768
+#define USBPHY_R	13776
+#define STGEN_R		13844
+#define USART1_R	13888
+#define USART2_R	13889
+#define SPI4_R		13890
+#define SPI5_R		13891
+#define I2C3_R		13892
+#define I2C4_R		13893
+#define I2C5_R		13894
+#define TIM12_R		13895
+#define TIM13_R		13896
+#define TIM14_R		13897
+#define TIM15_R		13898
+#define TIM16_R		13899
+#define TIM17_R		13900
+#define DMA1_R		13952
+#define DMA2_R		13953
+#define DMAMUX1_R	13954
+#define DMA3_R		13955
+#define DMAMUX2_R	13956
+#define ADC1_R		13957
+#define ADC2_R		13958
+#define USBO_R		13960
+#define GPIOA_R		14080
+#define GPIOB_R		14081
+#define GPIOC_R		14082
+#define GPIOD_R		14083
+#define GPIOE_R		14084
+#define GPIOF_R		14085
+#define GPIOG_R		14086
+#define GPIOH_R		14087
+#define GPIOI_R		14088
+#define TSC_R		14095
+#define PKA_R		14146
+#define SAES_R		14147
+#define CRYP1_R		14148
+#define HASH1_R		14149
+#define RNG1_R		14150
+#define AXIMC_R		14160
+#define MDMA_R		14208
+#define MCE_R		14209
+#define ETH1MAC_R	14218
+#define FMC_R		14220
+#define QSPI_R		14222
+#define SDMMC1_R	14224
+#define SDMMC2_R	14225
+#define CRC1_R		14228
+#define USBH_R		14232
+#define ETH2MAC_R	14238
+
+/* SCMI reset domain identifiers */
+#define RST_SCMI_LTDC		0
+#define RST_SCMI_MDMA		1
+
+#endif /* _DT_BINDINGS_STM32MP13_RESET_H_ */
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
