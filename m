Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67895637187
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Nov 2022 05:39:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15CB2C6507C;
	Thu, 24 Nov 2022 04:39:46 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CF2EC6506F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Nov 2022 04:39:44 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id mx15so340558qvb.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Nov 2022 20:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fPVWGtMAJ0YHwDWNgJVa2ZYmFRvHHb5EsPoPs+Co3sE=;
 b=jSMtLk+WCFH+S0k29a7xd1Lf43rvW79r25akoOL7XNvq2znTvn5+nofntayvmECpCU
 /GXt94aWoJq2HiypXbCaG+J9x7mDBu3hWICkJpeW+WxEVwzPMUHMmo2lzOWGEw67jyvE
 v9ZhHeOla/GmdI8xz99lr9AVzbjISvuqTaUtRfmHBpUD7ozE+ICKAS8la+vrTbeTrPXU
 xsZLtDqkcLGqyasOMTFG7gAOACGdjP1fpl2jbgkm3+V9Jcj/zbBOJRyH8/Ql9zJEjkj1
 +9SlWcdvxC9G7+WZxW4ZIzJZYHKDsl8lxue1uvq1MX+dWykjuglK1Bgkfp5D4nWHURmm
 axAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fPVWGtMAJ0YHwDWNgJVa2ZYmFRvHHb5EsPoPs+Co3sE=;
 b=2iQm8GsqIifcSoOEkPQGrFzwwwJ84oUtusFLYOmVCLyi3hm/mGNDwgLWNzrj8uccsJ
 KcrPz07XPhCCRlwdn6AI7kgy615JhDXpkPlvZsIBa/lgVxHFoQNJbQ5lST4RYw7Y8eV/
 b6zHqVc0gE0Mla9DuDpHXdrtfUydDocXSvS8ecg/1Z/cnHHUhrauedeVBuuOrnHJ2j9h
 cChwmsfxB3jc+t0l1mnXeO5wbJ4MqmaiKHMfRJED82+EXUorQvnbdG8cUGM71yaNAzGo
 aodf609TdDHaKw8RA/pbBOQYNYGxlJbpoQmRhZUF2i7Aof0WyBv3YvLbKhRD6EeF1MzU
 Ynmg==
X-Gm-Message-State: ANoB5pm/BqZ36PdA90xnh4FOaLdnoaZIhJXnaLySLyIJ/Mj4YAJWRJcF
 drxDwB4LI29+gr2zB+PKZyM=
X-Google-Smtp-Source: AA0mqf5HrbJD26XrKK5b63JviBxjH62i1MpGgcXL2fMUruszAHeOQFY0x0Q+4RPgp8z+4HqgYE81Lw==
X-Received: by 2002:a05:6214:3610:b0:4c6:adf5:da9e with SMTP id
 nv16-20020a056214361000b004c6adf5da9emr11761582qvb.76.1669264783445; 
 Wed, 23 Nov 2022 20:39:43 -0800 (PST)
Received: from [192.168.1.201] (pool-173-73-95-180.washdc.fios.verizon.net.
 [173.73.95.180]) by smtp.gmail.com with ESMTPSA id
 m21-20020a05622a119500b00397e97baa96sm91468qtk.0.2022.11.23.20.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 20:39:42 -0800 (PST)
Message-ID: <10afe73a-39f4-9aad-4501-fec9beb2fcd8@gmail.com>
Date: Wed, 23 Nov 2022 23:39:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>, u-boot@lists.denx.de
References: <20221122080540.351469-1-gabriel.fernandez@foss.st.com>
 <20221122080540.351469-2-gabriel.fernandez@foss.st.com>
From: Sean Anderson <seanga2@gmail.com>
In-Reply-To: <20221122080540.351469-2-gabriel.fernandez@foss.st.com>
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v3 1/3] dt-bindings: stm32mp13: add clock
 & reset support for STM32MP13
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 11/22/22 03:05, Gabriel Fernandez wrote:
> Add support of stm32mp13 DT bindings of clock and reset.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> (no changes since v1)
> 
>   MAINTAINERS                                  |   2 +
>   include/dt-bindings/clock/stm32mp13-clks.h   | 229 +++++++++++++++++++
>   include/dt-bindings/reset/stm32mp13-resets.h | 100 ++++++++
>   3 files changed, 331 insertions(+)
>   create mode 100644 include/dt-bindings/clock/stm32mp13-clks.h
>   create mode 100644 include/dt-bindings/reset/stm32mp13-resets.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 97b2f69f65..af2b835937 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -562,9 +562,11 @@ F:	drivers/video/stm32/stm32_ltdc.c
>   F:	drivers/watchdog/stm32mp_wdt.c
>   F:	include/dt-bindings/clock/stm32fx-clock.h
>   F:	include/dt-bindings/clock/stm32mp1-clks.h
> +F:	include/dt-bindings/clock/stm32mp13-clks.h
>   F:	include/dt-bindings/clock/stm32mp1-clksrc.h

Can we combine these? e.g.

F: include/dt-bindings/clock/stm32mp*
F: include/dt-bindings/reset/stm32mp*

Or even

F: include/dt-bindings/*/stm32mp*

--Sean

>   F:	include/dt-bindings/pinctrl/stm32-pinfunc.h
>   F:	include/dt-bindings/reset/stm32mp1-resets.h
> +F:	include/dt-bindings/reset/stm32mp13-resets.h
>   F:	include/stm32_rcc.h
>   F:	tools/stm32image.c
>   N:	stm


> diff --git a/include/dt-bindings/clock/stm32mp13-clks.h b/include/dt-bindings/clock/stm32mp13-clks.h
> new file mode 100644
> index 0000000000..799dee5b80
> --- /dev/null
> +++ b/include/dt-bindings/clock/stm32mp13-clks.h
> @@ -0,0 +1,229 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later or BSD-3-Clause */
> +/*
> + * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
> + * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
> + */
> +
> +#ifndef _DT_BINDINGS_STM32MP13_CLKS_H_
> +#define _DT_BINDINGS_STM32MP13_CLKS_H_
> +
> +/* OSCILLATOR clocks */
> +#define CK_HSE		0
> +#define CK_CSI		1
> +#define CK_LSI		2
> +#define CK_LSE		3
> +#define CK_HSI		4
> +#define CK_HSE_DIV2	5
> +
> +/* PLL */
> +#define PLL1		6
> +#define PLL2		7
> +#define PLL3		8
> +#define PLL4		9
> +
> +/* ODF */
> +#define PLL1_P		10
> +#define PLL1_Q		11
> +#define PLL1_R		12
> +#define PLL2_P		13
> +#define PLL2_Q		14
> +#define PLL2_R		15
> +#define PLL3_P		16
> +#define PLL3_Q		17
> +#define PLL3_R		18
> +#define PLL4_P		19
> +#define PLL4_Q		20
> +#define PLL4_R		21
> +
> +#define PCLK1		22
> +#define PCLK2		23
> +#define PCLK3		24
> +#define PCLK4		25
> +#define PCLK5		26
> +#define PCLK6		27
> +
> +/* SYSTEM CLOCK */
> +#define CK_PER		28
> +#define CK_MPU		29
> +#define CK_AXI		30
> +#define CK_MLAHB	31
> +
> +/* BASE TIMER */
> +#define CK_TIMG1	32
> +#define CK_TIMG2	33
> +#define CK_TIMG3	34
> +
> +/* AUX */
> +#define RTC		35
> +
> +/* TRACE & DEBUG clocks */
> +#define CK_DBG		36
> +#define CK_TRACE	37
> +
> +/* MCO clocks */
> +#define CK_MCO1		38
> +#define CK_MCO2		39
> +
> +/* IP clocks */
> +#define SYSCFG		40
> +#define VREF		41
> +#define DTS		42
> +#define PMBCTRL		43
> +#define HDP		44
> +#define IWDG2		45
> +#define STGENRO		46
> +#define USART1		47
> +#define RTCAPB		48
> +#define TZC		49
> +#define TZPC		50
> +#define IWDG1		51
> +#define BSEC		52
> +#define DMA1		53
> +#define DMA2		54
> +#define DMAMUX1		55
> +#define DMAMUX2		56
> +#define GPIOA		57
> +#define GPIOB		58
> +#define GPIOC		59
> +#define GPIOD		60
> +#define GPIOE		61
> +#define GPIOF		62
> +#define GPIOG		63
> +#define GPIOH		64
> +#define GPIOI		65
> +#define CRYP1		66
> +#define HASH1		67
> +#define BKPSRAM		68
> +#define MDMA		69
> +#define CRC1		70
> +#define USBH		71
> +#define DMA3		72
> +#define TSC		73
> +#define PKA		74
> +#define AXIMC		75
> +#define MCE		76
> +#define ETH1TX		77
> +#define ETH2TX		78
> +#define ETH1RX		79
> +#define ETH2RX		80
> +#define ETH1MAC		81
> +#define ETH2MAC		82
> +#define ETH1STP		83
> +#define ETH2STP		84
> +
> +/* IP clocks with parents */
> +#define SDMMC1_K	85
> +#define SDMMC2_K	86
> +#define ADC1_K		87
> +#define ADC2_K		88
> +#define FMC_K		89
> +#define QSPI_K		90
> +#define RNG1_K		91
> +#define USBPHY_K	92
> +#define STGEN_K		93
> +#define SPDIF_K		94
> +#define SPI1_K		95
> +#define SPI2_K		96
> +#define SPI3_K		97
> +#define SPI4_K		98
> +#define SPI5_K		99
> +#define I2C1_K		100
> +#define I2C2_K		101
> +#define I2C3_K		102
> +#define I2C4_K		103
> +#define I2C5_K		104
> +#define TIM2_K		105
> +#define TIM3_K		106
> +#define TIM4_K		107
> +#define TIM5_K		108
> +#define TIM6_K		109
> +#define TIM7_K		110
> +#define TIM12_K		111
> +#define TIM13_K		112
> +#define TIM14_K		113
> +#define TIM1_K		114
> +#define TIM8_K		115
> +#define TIM15_K		116
> +#define TIM16_K		117
> +#define TIM17_K		118
> +#define LPTIM1_K	119
> +#define LPTIM2_K	120
> +#define LPTIM3_K	121
> +#define LPTIM4_K	122
> +#define LPTIM5_K	123
> +#define USART1_K	124
> +#define USART2_K	125
> +#define USART3_K	126
> +#define UART4_K		127
> +#define UART5_K		128
> +#define USART6_K	129
> +#define UART7_K		130
> +#define UART8_K		131
> +#define DFSDM_K		132
> +#define FDCAN_K		133
> +#define SAI1_K		134
> +#define SAI2_K		135
> +#define ADFSDM_K	136
> +#define USBO_K		137
> +#define LTDC_PX		138
> +#define ETH1CK_K	139
> +#define ETH1PTP_K	140
> +#define ETH2CK_K	141
> +#define ETH2PTP_K	142
> +#define DCMIPP_K	143
> +#define SAES_K		144
> +#define DTS_K		145
> +
> +/* DDR */
> +#define DDRC1		146
> +#define DDRC1LP		147
> +#define DDRC2		148
> +#define DDRC2LP		149
> +#define DDRPHYC		150
> +#define DDRPHYCLP	151
> +#define DDRCAPB		152
> +#define DDRCAPBLP	153
> +#define AXIDCG		154
> +#define DDRPHYCAPB	155
> +#define DDRPHYCAPBLP	156
> +#define DDRPERFM	157
> +
> +#define ADC1		158
> +#define ADC2		159
> +#define SAI1		160
> +#define SAI2		161
> +
> +#define STM32MP1_LAST_CLK 162
> +
> +/* SCMI clock identifiers */
> +#define CK_SCMI_HSE		0
> +#define CK_SCMI_HSI		1
> +#define CK_SCMI_CSI		2
> +#define CK_SCMI_LSE		3
> +#define CK_SCMI_LSI		4
> +#define CK_SCMI_HSE_DIV2	5
> +#define CK_SCMI_PLL2_Q		6
> +#define CK_SCMI_PLL2_R		7
> +#define CK_SCMI_PLL3_P		8
> +#define CK_SCMI_PLL3_Q		9
> +#define CK_SCMI_PLL3_R		10
> +#define CK_SCMI_PLL4_P		11
> +#define CK_SCMI_PLL4_Q		12
> +#define CK_SCMI_PLL4_R		13
> +#define CK_SCMI_MPU		14
> +#define CK_SCMI_AXI		15
> +#define CK_SCMI_MLAHB		16
> +#define CK_SCMI_CKPER		17
> +#define CK_SCMI_PCLK1		18
> +#define CK_SCMI_PCLK2		19
> +#define CK_SCMI_PCLK3		20
> +#define CK_SCMI_PCLK4		21
> +#define CK_SCMI_PCLK5		22
> +#define CK_SCMI_PCLK6		23
> +#define CK_SCMI_CKTIMG1		24
> +#define CK_SCMI_CKTIMG2		25
> +#define CK_SCMI_CKTIMG3		26
> +#define CK_SCMI_RTC		27
> +#define CK_SCMI_RTCAPB		28
> +
> +#endif /* _DT_BINDINGS_STM32MP13_CLKS_H_ */
> diff --git a/include/dt-bindings/reset/stm32mp13-resets.h b/include/dt-bindings/reset/stm32mp13-resets.h
> new file mode 100644
> index 0000000000..18ccb05db6
> --- /dev/null
> +++ b/include/dt-bindings/reset/stm32mp13-resets.h
> @@ -0,0 +1,100 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later or BSD-3-Clause */
> +/*
> + * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
> + * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
> + */
> +
> +#ifndef _DT_BINDINGS_STM32MP13_RESET_H_
> +#define _DT_BINDINGS_STM32MP13_RESET_H_
> +
> +#define TIM2_R		13568
> +#define TIM3_R		13569
> +#define TIM4_R		13570
> +#define TIM5_R		13571
> +#define TIM6_R		13572
> +#define TIM7_R		13573
> +#define LPTIM1_R	13577
> +#define SPI2_R		13579
> +#define SPI3_R		13580
> +#define USART3_R	13583
> +#define UART4_R		13584
> +#define UART5_R		13585
> +#define UART7_R		13586
> +#define UART8_R		13587
> +#define I2C1_R		13589
> +#define I2C2_R		13590
> +#define SPDIF_R		13594
> +#define TIM1_R		13632
> +#define TIM8_R		13633
> +#define SPI1_R		13640
> +#define USART6_R	13645
> +#define SAI1_R		13648
> +#define SAI2_R		13649
> +#define DFSDM_R		13652
> +#define FDCAN_R		13656
> +#define LPTIM2_R	13696
> +#define LPTIM3_R	13697
> +#define LPTIM4_R	13698
> +#define LPTIM5_R	13699
> +#define SYSCFG_R	13707
> +#define VREF_R		13709
> +#define DTS_R		13712
> +#define PMBCTRL_R	13713
> +#define LTDC_R		13760
> +#define DCMIPP_R	13761
> +#define DDRPERFM_R	13768
> +#define USBPHY_R	13776
> +#define STGEN_R		13844
> +#define USART1_R	13888
> +#define USART2_R	13889
> +#define SPI4_R		13890
> +#define SPI5_R		13891
> +#define I2C3_R		13892
> +#define I2C4_R		13893
> +#define I2C5_R		13894
> +#define TIM12_R		13895
> +#define TIM13_R		13896
> +#define TIM14_R		13897
> +#define TIM15_R		13898
> +#define TIM16_R		13899
> +#define TIM17_R		13900
> +#define DMA1_R		13952
> +#define DMA2_R		13953
> +#define DMAMUX1_R	13954
> +#define DMA3_R		13955
> +#define DMAMUX2_R	13956
> +#define ADC1_R		13957
> +#define ADC2_R		13958
> +#define USBO_R		13960
> +#define GPIOA_R		14080
> +#define GPIOB_R		14081
> +#define GPIOC_R		14082
> +#define GPIOD_R		14083
> +#define GPIOE_R		14084
> +#define GPIOF_R		14085
> +#define GPIOG_R		14086
> +#define GPIOH_R		14087
> +#define GPIOI_R		14088
> +#define TSC_R		14095
> +#define PKA_R		14146
> +#define SAES_R		14147
> +#define CRYP1_R		14148
> +#define HASH1_R		14149
> +#define RNG1_R		14150
> +#define AXIMC_R		14160
> +#define MDMA_R		14208
> +#define MCE_R		14209
> +#define ETH1MAC_R	14218
> +#define FMC_R		14220
> +#define QSPI_R		14222
> +#define SDMMC1_R	14224
> +#define SDMMC2_R	14225
> +#define CRC1_R		14228
> +#define USBH_R		14232
> +#define ETH2MAC_R	14238
> +
> +/* SCMI reset domain identifiers */
> +#define RST_SCMI_LTDC		0
> +#define RST_SCMI_MDMA		1
> +
> +#endif /* _DT_BINDINGS_STM32MP13_RESET_H_ */

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
