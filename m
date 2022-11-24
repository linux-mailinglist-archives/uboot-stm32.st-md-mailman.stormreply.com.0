Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F07637677
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Nov 2022 11:29:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25F0BC6507C;
	Thu, 24 Nov 2022 10:29:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32F1BC65073
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Nov 2022 10:29:50 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AO77VP7014413; Thu, 24 Nov 2022 11:29:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=selector1; bh=7MJhwoFiGlUSN0WhGHbFNNmJ9zEYJb7f5oFYdwoehbs=;
 b=ygppru0TlSmgfKJdwVA1ZF9FbMq8s63ySEtpv5Dxa2NVwLopU81A17QtDSR+5PSTCRV6
 1f8FXEtsD7r8FQ20t7D1v10j0R60LnZLzPR85irGTtmnDh4DZiKOt0MpsoVsvVw40dzM
 3bOqxHQb6yCmJKIBmI9/qGvP2guwvcvqHpDv2FJOWpPlpgiE5Yqv24RqdG4YFwqBdGnl
 fRDbUXse3s/Fo2yZtG27n2qIMBi+vEEs42XXrLumujoSH6PkHB5WxlYspXY+Kl7FYn34
 /nfylOVZxafu6mZy6AkmgWUODF6H11PfmWzt88hTcLHlGW2uKi2ewYUB6NKpPVpFc1TF kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kxraxf6hw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Nov 2022 11:29:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7B22410002A;
 Thu, 24 Nov 2022 11:29:43 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 74444217B78;
 Thu, 24 Nov 2022 11:29:43 +0100 (CET)
Received: from [10.252.12.221] (10.252.12.221) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 24 Nov
 2022 11:29:43 +0100
Message-ID: <d7d17f91-a260-de5f-557a-05b373900293@foss.st.com>
Date: Thu, 24 Nov 2022 11:29:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: Sean Anderson <seanga2@gmail.com>, <u-boot@lists.denx.de>
References: <20221122080540.351469-1-gabriel.fernandez@foss.st.com>
 <20221122080540.351469-2-gabriel.fernandez@foss.st.com>
 <10afe73a-39f4-9aad-4501-fec9beb2fcd8@gmail.com>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <10afe73a-39f4-9aad-4501-fec9beb2fcd8@gmail.com>
X-Originating-IP: [10.252.12.221]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_07,2022-11-24_01,2022-06-22_01
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
Content-Type: multipart/mixed; boundary="===============0402525494118185927=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============0402525494118185927==
Content-Type: multipart/alternative;
	boundary="------------QIFnjdHLpVvGk0MgEXEiG0Zg"
Content-Language: en-US

--------------QIFnjdHLpVvGk0MgEXEiG0Zg
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 11/24/22 05:39, Sean Anderson wrote:
> Subject:
> Re: [PATCH v3 1/3] dt-bindings: stm32mp13: add clock & reset support 
> for STM32MP13
> From:
> Sean Anderson <seanga2@gmail.com>
> Date:
> 11/24/22, 05:39
>
> To:
> Gabriel Fernandez <gabriel.fernandez@foss.st.com>, u-boot@lists.denx.de
> CC:
> Patrick DELAUNAY <patrick.delaunay@foss.st.com>, U-Boot STM32 
> <uboot-stm32@st-md-mailman.stormreply.com>, Patrice Chotard 
> <patrice.chotard@foss.st.com>
>
>
> On 11/22/22 03:05, Gabriel Fernandez wrote:
>> Add support of stm32mp13 DT bindings of clock and reset.
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>> (no changes since v1)
>>
>>   MAINTAINERS                                  |   2 +
>>   include/dt-bindings/clock/stm32mp13-clks.h   | 229 +++++++++++++++++++
>>   include/dt-bindings/reset/stm32mp13-resets.h | 100 ++++++++
>>   3 files changed, 331 insertions(+)
>>   create mode 100644 include/dt-bindings/clock/stm32mp13-clks.h
>>   create mode 100644 include/dt-bindings/reset/stm32mp13-resets.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 97b2f69f65..af2b835937 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -562,9 +562,11 @@ F:    drivers/video/stm32/stm32_ltdc.c
>>   F:    drivers/watchdog/stm32mp_wdt.c
>>   F:    include/dt-bindings/clock/stm32fx-clock.h
>>   F:    include/dt-bindings/clock/stm32mp1-clks.h
>> +F:    include/dt-bindings/clock/stm32mp13-clks.h
>>   F:    include/dt-bindings/clock/stm32mp1-clksrc.h
>
> Can we combine these? e.g.
>
> F: include/dt-bindings/clock/stm32mp*
> F: include/dt-bindings/reset/stm32mp*
i preferred this one
>
> Or even
>
> F: include/dt-bindings/*/stm32mp*
>
> --Sean
>
>>   F: include/dt-bindings/pinctrl/stm32-pinfunc.h
>>   F:    include/dt-bindings/reset/stm32mp1-resets.h
>> +F:    include/dt-bindings/reset/stm32mp13-resets.h
>>   F:    include/stm32_rcc.h
>>   F:    tools/stm32image.c
>>   N:    stm
>
>
>> diff --git a/include/dt-bindings/clock/stm32mp13-clks.h 
>> b/include/dt-bindings/clock/stm32mp13-clks.h
>> new file mode 100644
>> index 0000000000..799dee5b80
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/stm32mp13-clks.h
>> @@ -0,0 +1,229 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later or BSD-3-Clause */
>> +/*
>> + * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
>> + * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for 
>> STMicroelectronics.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_STM32MP13_CLKS_H_
>> +#define _DT_BINDINGS_STM32MP13_CLKS_H_
>> +
>> +/* OSCILLATOR clocks */
>> +#define CK_HSE        0
>> +#define CK_CSI        1
>> +#define CK_LSI        2
>> +#define CK_LSE        3
>> +#define CK_HSI        4
>> +#define CK_HSE_DIV2    5
>> +
>> +/* PLL */
>> +#define PLL1        6
>> +#define PLL2        7
>> +#define PLL3        8
>> +#define PLL4        9
>> +
>> +/* ODF */
>> +#define PLL1_P        10
>> +#define PLL1_Q        11
>> +#define PLL1_R        12
>> +#define PLL2_P        13
>> +#define PLL2_Q        14
>> +#define PLL2_R        15
>> +#define PLL3_P        16
>> +#define PLL3_Q        17
>> +#define PLL3_R        18
>> +#define PLL4_P        19
>> +#define PLL4_Q        20
>> +#define PLL4_R        21
>> +
>> +#define PCLK1        22
>> +#define PCLK2        23
>> +#define PCLK3        24
>> +#define PCLK4        25
>> +#define PCLK5        26
>> +#define PCLK6        27
>> +
>> +/* SYSTEM CLOCK */
>> +#define CK_PER        28
>> +#define CK_MPU        29
>> +#define CK_AXI        30
>> +#define CK_MLAHB    31
>> +
>> +/* BASE TIMER */
>> +#define CK_TIMG1    32
>> +#define CK_TIMG2    33
>> +#define CK_TIMG3    34
>> +
>> +/* AUX */
>> +#define RTC        35
>> +
>> +/* TRACE & DEBUG clocks */
>> +#define CK_DBG        36
>> +#define CK_TRACE    37
>> +
>> +/* MCO clocks */
>> +#define CK_MCO1        38
>> +#define CK_MCO2        39
>> +
>> +/* IP clocks */
>> +#define SYSCFG        40
>> +#define VREF        41
>> +#define DTS        42
>> +#define PMBCTRL        43
>> +#define HDP        44
>> +#define IWDG2        45
>> +#define STGENRO        46
>> +#define USART1        47
>> +#define RTCAPB        48
>> +#define TZC        49
>> +#define TZPC        50
>> +#define IWDG1        51
>> +#define BSEC        52
>> +#define DMA1        53
>> +#define DMA2        54
>> +#define DMAMUX1        55
>> +#define DMAMUX2        56
>> +#define GPIOA        57
>> +#define GPIOB        58
>> +#define GPIOC        59
>> +#define GPIOD        60
>> +#define GPIOE        61
>> +#define GPIOF        62
>> +#define GPIOG        63
>> +#define GPIOH        64
>> +#define GPIOI        65
>> +#define CRYP1        66
>> +#define HASH1        67
>> +#define BKPSRAM        68
>> +#define MDMA        69
>> +#define CRC1        70
>> +#define USBH        71
>> +#define DMA3        72
>> +#define TSC        73
>> +#define PKA        74
>> +#define AXIMC        75
>> +#define MCE        76
>> +#define ETH1TX        77
>> +#define ETH2TX        78
>> +#define ETH1RX        79
>> +#define ETH2RX        80
>> +#define ETH1MAC        81
>> +#define ETH2MAC        82
>> +#define ETH1STP        83
>> +#define ETH2STP        84
>> +
>> +/* IP clocks with parents */
>> +#define SDMMC1_K    85
>> +#define SDMMC2_K    86
>> +#define ADC1_K        87
>> +#define ADC2_K        88
>> +#define FMC_K        89
>> +#define QSPI_K        90
>> +#define RNG1_K        91
>> +#define USBPHY_K    92
>> +#define STGEN_K        93
>> +#define SPDIF_K        94
>> +#define SPI1_K        95
>> +#define SPI2_K        96
>> +#define SPI3_K        97
>> +#define SPI4_K        98
>> +#define SPI5_K        99
>> +#define I2C1_K        100
>> +#define I2C2_K        101
>> +#define I2C3_K        102
>> +#define I2C4_K        103
>> +#define I2C5_K        104
>> +#define TIM2_K        105
>> +#define TIM3_K        106
>> +#define TIM4_K        107
>> +#define TIM5_K        108
>> +#define TIM6_K        109
>> +#define TIM7_K        110
>> +#define TIM12_K        111
>> +#define TIM13_K        112
>> +#define TIM14_K        113
>> +#define TIM1_K        114
>> +#define TIM8_K        115
>> +#define TIM15_K        116
>> +#define TIM16_K        117
>> +#define TIM17_K        118
>> +#define LPTIM1_K    119
>> +#define LPTIM2_K    120
>> +#define LPTIM3_K    121
>> +#define LPTIM4_K    122
>> +#define LPTIM5_K    123
>> +#define USART1_K    124
>> +#define USART2_K    125
>> +#define USART3_K    126
>> +#define UART4_K        127
>> +#define UART5_K        128
>> +#define USART6_K    129
>> +#define UART7_K        130
>> +#define UART8_K        131
>> +#define DFSDM_K        132
>> +#define FDCAN_K        133
>> +#define SAI1_K        134
>> +#define SAI2_K        135
>> +#define ADFSDM_K    136
>> +#define USBO_K        137
>> +#define LTDC_PX        138
>> +#define ETH1CK_K    139
>> +#define ETH1PTP_K    140
>> +#define ETH2CK_K    141
>> +#define ETH2PTP_K    142
>> +#define DCMIPP_K    143
>> +#define SAES_K        144
>> +#define DTS_K        145
>> +
>> +/* DDR */
>> +#define DDRC1        146
>> +#define DDRC1LP        147
>> +#define DDRC2        148
>> +#define DDRC2LP        149
>> +#define DDRPHYC        150
>> +#define DDRPHYCLP    151
>> +#define DDRCAPB        152
>> +#define DDRCAPBLP    153
>> +#define AXIDCG        154
>> +#define DDRPHYCAPB    155
>> +#define DDRPHYCAPBLP    156
>> +#define DDRPERFM    157
>> +
>> +#define ADC1        158
>> +#define ADC2        159
>> +#define SAI1        160
>> +#define SAI2        161
>> +
>> +#define STM32MP1_LAST_CLK 162
>> +
>> +/* SCMI clock identifiers */
>> +#define CK_SCMI_HSE        0
>> +#define CK_SCMI_HSI        1
>> +#define CK_SCMI_CSI        2
>> +#define CK_SCMI_LSE        3
>> +#define CK_SCMI_LSI        4
>> +#define CK_SCMI_HSE_DIV2    5
>> +#define CK_SCMI_PLL2_Q        6
>> +#define CK_SCMI_PLL2_R        7
>> +#define CK_SCMI_PLL3_P        8
>> +#define CK_SCMI_PLL3_Q        9
>> +#define CK_SCMI_PLL3_R        10
>> +#define CK_SCMI_PLL4_P        11
>> +#define CK_SCMI_PLL4_Q        12
>> +#define CK_SCMI_PLL4_R        13
>> +#define CK_SCMI_MPU        14
>> +#define CK_SCMI_AXI        15
>> +#define CK_SCMI_MLAHB        16
>> +#define CK_SCMI_CKPER        17
>> +#define CK_SCMI_PCLK1        18
>> +#define CK_SCMI_PCLK2        19
>> +#define CK_SCMI_PCLK3        20
>> +#define CK_SCMI_PCLK4        21
>> +#define CK_SCMI_PCLK5        22
>> +#define CK_SCMI_PCLK6        23
>> +#define CK_SCMI_CKTIMG1        24
>> +#define CK_SCMI_CKTIMG2        25
>> +#define CK_SCMI_CKTIMG3        26
>> +#define CK_SCMI_RTC        27
>> +#define CK_SCMI_RTCAPB        28
>> +
>> +#endif /* _DT_BINDINGS_STM32MP13_CLKS_H_ */
>> diff --git a/include/dt-bindings/reset/stm32mp13-resets.h 
>> b/include/dt-bindings/reset/stm32mp13-resets.h
>> new file mode 100644
>> index 0000000000..18ccb05db6
>> --- /dev/null
>> +++ b/include/dt-bindings/reset/stm32mp13-resets.h
>> @@ -0,0 +1,100 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later or BSD-3-Clause */
>> +/*
>> + * Copyright (C) STMicroelectronics 2022 - All Rights Reserved
>> + * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for 
>> STMicroelectronics.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_STM32MP13_RESET_H_
>> +#define _DT_BINDINGS_STM32MP13_RESET_H_
>> +
>> +#define TIM2_R        13568
>> +#define TIM3_R        13569
>> +#define TIM4_R        13570
>> +#define TIM5_R        13571
>> +#define TIM6_R        13572
>> +#define TIM7_R        13573
>> +#define LPTIM1_R    13577
>> +#define SPI2_R        13579
>> +#define SPI3_R        13580
>> +#define USART3_R    13583
>> +#define UART4_R        13584
>> +#define UART5_R        13585
>> +#define UART7_R        13586
>> +#define UART8_R        13587
>> +#define I2C1_R        13589
>> +#define I2C2_R        13590
>> +#define SPDIF_R        13594
>> +#define TIM1_R        13632
>> +#define TIM8_R        13633
>> +#define SPI1_R        13640
>> +#define USART6_R    13645
>> +#define SAI1_R        13648
>> +#define SAI2_R        13649
>> +#define DFSDM_R        13652
>> +#define FDCAN_R        13656
>> +#define LPTIM2_R    13696
>> +#define LPTIM3_R    13697
>> +#define LPTIM4_R    13698
>> +#define LPTIM5_R    13699
>> +#define SYSCFG_R    13707
>> +#define VREF_R        13709
>> +#define DTS_R        13712
>> +#define PMBCTRL_R    13713
>> +#define LTDC_R        13760
>> +#define DCMIPP_R    13761
>> +#define DDRPERFM_R    13768
>> +#define USBPHY_R    13776
>> +#define STGEN_R        13844
>> +#define USART1_R    13888
>> +#define USART2_R    13889
>> +#define SPI4_R        13890
>> +#define SPI5_R        13891
>> +#define I2C3_R        13892
>> +#define I2C4_R        13893
>> +#define I2C5_R        13894
>> +#define TIM12_R        13895
>> +#define TIM13_R        13896
>> +#define TIM14_R        13897
>> +#define TIM15_R        13898
>> +#define TIM16_R        13899
>> +#define TIM17_R        13900
>> +#define DMA1_R        13952
>> +#define DMA2_R        13953
>> +#define DMAMUX1_R    13954
>> +#define DMA3_R        13955
>> +#define DMAMUX2_R    13956
>> +#define ADC1_R        13957
>> +#define ADC2_R        13958
>> +#define USBO_R        13960
>> +#define GPIOA_R        14080
>> +#define GPIOB_R        14081
>> +#define GPIOC_R        14082
>> +#define GPIOD_R        14083
>> +#define GPIOE_R        14084
>> +#define GPIOF_R        14085
>> +#define GPIOG_R        14086
>> +#define GPIOH_R        14087
>> +#define GPIOI_R        14088
>> +#define TSC_R        14095
>> +#define PKA_R        14146
>> +#define SAES_R        14147
>> +#define CRYP1_R        14148
>> +#define HASH1_R        14149
>> +#define RNG1_R        14150
>> +#define AXIMC_R        14160
>> +#define MDMA_R        14208
>> +#define MCE_R        14209
>> +#define ETH1MAC_R    14218
>> +#define FMC_R        14220
>> +#define QSPI_R        14222
>> +#define SDMMC1_R    14224
>> +#define SDMMC2_R    14225
>> +#define CRC1_R        14228
>> +#define USBH_R        14232
>> +#define ETH2MAC_R    14238
>> +
>> +/* SCMI reset domain identifiers */
>> +#define RST_SCMI_LTDC        0
>> +#define RST_SCMI_MDMA        1
>> +
>> +#endif /* _DT_BINDINGS_STM32MP13_RESET_H_ */
>
--------------QIFnjdHLpVvGk0MgEXEiG0Zg
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/24/22 05:39, Sean Anderson wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:10afe73a-39f4-9aad-4501-fec9beb2fcd8@gmail.com">
      <table class="moz-header-part1 moz-main-header" width="100%"
        cellspacing="0" cellpadding="0" border="0">
        <tbody>
          <tr>
            <td>
              <div class="moz-header-display-name"
                style="display:inline;">Subject: </div>
              Re: [PATCH v3 1/3] dt-bindings: stm32mp13: add clock &amp;
              reset support for STM32MP13</td>
          </tr>
          <tr>
            <td>
              <div class="moz-header-display-name"
                style="display:inline;">From: </div>
              Sean Anderson <a class="moz-txt-link-rfc2396E" href="mailto:seanga2@gmail.com">&lt;seanga2@gmail.com&gt;</a></td>
          </tr>
          <tr>
            <td>
              <div class="moz-header-display-name"
                style="display:inline;">Date: </div>
              11/24/22, 05:39</td>
          </tr>
        </tbody>
      </table>
      <table class="moz-header-part2 moz-main-header" width="100%"
        cellspacing="0" cellpadding="0" border="0">
        <tbody>
          <tr>
            <td>
              <div class="moz-header-display-name"
                style="display:inline;">To: </div>
              Gabriel Fernandez <a class="moz-txt-link-rfc2396E" href="mailto:gabriel.fernandez@foss.st.com">&lt;gabriel.fernandez@foss.st.com&gt;</a>,
              <a class="moz-txt-link-abbreviated" href="mailto:u-boot@lists.denx.de">u-boot@lists.denx.de</a></td>
          </tr>
          <tr>
            <td>
              <div class="moz-header-display-name"
                style="display:inline;">CC: </div>
              Patrick DELAUNAY <a class="moz-txt-link-rfc2396E" href="mailto:patrick.delaunay@foss.st.com">&lt;patrick.delaunay@foss.st.com&gt;</a>,
              U-Boot STM32
              <a class="moz-txt-link-rfc2396E" href="mailto:uboot-stm32@st-md-mailman.stormreply.com">&lt;uboot-stm32@st-md-mailman.stormreply.com&gt;</a>, Patrice
              Chotard <a class="moz-txt-link-rfc2396E" href="mailto:patrice.chotard@foss.st.com">&lt;patrice.chotard@foss.st.com&gt;</a></td>
          </tr>
        </tbody>
      </table>
      <br>
      <div class="moz-text-flowed" style="font-family: -moz-fixed;
        font-size: 12px;" lang="x-unicode">On 11/22/22 03:05, Gabriel
        Fernandez wrote:
        <br>
        <blockquote type="cite" style="color: #007cff;">Add support of
          stm32mp13 DT bindings of clock and reset.
          <br>
          <br>
          Signed-off-by: Gabriel Fernandez <a
            class="moz-txt-link-rfc2396E"
            href="mailto:gabriel.fernandez@foss.st.com"
            moz-do-not-send="true">&lt;gabriel.fernandez@foss.st.com&gt;</a>
          <br>
          Reviewed-by: Patrick Delaunay <a
            class="moz-txt-link-rfc2396E"
            href="mailto:patrick.delaunay@foss.st.com"
            moz-do-not-send="true">&lt;patrick.delaunay@foss.st.com&gt;</a>
          <br>
          ---
          <br>
          <br>
          (no changes since v1)
          <br>
          <br>
            MAINTAINERS                                  |   2 +
          <br>
            include/dt-bindings/clock/stm32mp13-clks.h   | 229
          +++++++++++++++++++
          <br>
            include/dt-bindings/reset/stm32mp13-resets.h | 100 ++++++++
          <br>
            3 files changed, 331 insertions(+)
          <br>
            create mode 100644
          include/dt-bindings/clock/stm32mp13-clks.h
          <br>
            create mode 100644
          include/dt-bindings/reset/stm32mp13-resets.h
          <br>
          <br>
          diff --git a/MAINTAINERS b/MAINTAINERS
          <br>
          index 97b2f69f65..af2b835937 100644
          <br>
          --- a/MAINTAINERS
          <br>
          +++ b/MAINTAINERS
          <br>
          @@ -562,9 +562,11 @@ F:    drivers/video/stm32/stm32_ltdc.c
          <br>
            F:    drivers/watchdog/stm32mp_wdt.c
          <br>
            F:    include/dt-bindings/clock/stm32fx-clock.h
          <br>
            F:    include/dt-bindings/clock/stm32mp1-clks.h
          <br>
          +F:    include/dt-bindings/clock/stm32mp13-clks.h
          <br>
            F:    include/dt-bindings/clock/stm32mp1-clksrc.h
          <br>
        </blockquote>
        <br>
        Can we combine these? e.g.
        <br>
        <br>
        F: include/dt-bindings/clock/stm32mp*
        <br>
        F: include/dt-bindings/reset/stm32mp*
        <br>
      </div>
    </blockquote>
    i preferred this one<br>
    <blockquote type="cite"
      cite="mid:10afe73a-39f4-9aad-4501-fec9beb2fcd8@gmail.com">
      <div class="moz-text-flowed" style="font-family: -moz-fixed;
        font-size: 12px;" lang="x-unicode">
        <br>
        Or even
        <br>
        <br>
        F: include/dt-bindings/*/stm32mp*
        <br>
        <br>
        --Sean
        <br>
        <br>
        <blockquote type="cite" style="color: #007cff;">  F:   
          include/dt-bindings/pinctrl/stm32-pinfunc.h
          <br>
            F:    include/dt-bindings/reset/stm32mp1-resets.h
          <br>
          +F:    include/dt-bindings/reset/stm32mp13-resets.h
          <br>
            F:    include/stm32_rcc.h
          <br>
            F:    tools/stm32image.c
          <br>
            N:    stm
          <br>
        </blockquote>
        <br>
        <br>
        <blockquote type="cite" style="color: #007cff;">diff --git
          a/include/dt-bindings/clock/stm32mp13-clks.h
          b/include/dt-bindings/clock/stm32mp13-clks.h
          <br>
          new file mode 100644
          <br>
          index 0000000000..799dee5b80
          <br>
          --- /dev/null
          <br>
          +++ b/include/dt-bindings/clock/stm32mp13-clks.h
          <br>
          @@ -0,0 +1,229 @@
          <br>
          +/* SPDX-License-Identifier: GPL-2.0-or-later or BSD-3-Clause
          */
          <br>
          +/*
          <br>
          + * Copyright (C) STMicroelectronics 2022 - All Rights
          Reserved
          <br>
          + * Author: Gabriel Fernandez <a
            class="moz-txt-link-rfc2396E"
            href="mailto:gabriel.fernandez@foss.st.com"
            moz-do-not-send="true">&lt;gabriel.fernandez@foss.st.com&gt;</a>
          for STMicroelectronics.
          <br>
          + */
          <br>
          +
          <br>
          +#ifndef <span class="moz-txt-underscore"><span
              class="moz-txt-tag">_</span>DT_BINDINGS_STM32MP13_CLKS_H<span
              class="moz-txt-tag">_</span></span>
          <br>
          +#define <span class="moz-txt-underscore"><span
              class="moz-txt-tag">_</span>DT_BINDINGS_STM32MP13_CLKS_H<span
              class="moz-txt-tag">_</span></span>
          <br>
          +
          <br>
          +/* OSCILLATOR clocks */
          <br>
          +#define CK_HSE        0
          <br>
          +#define CK_CSI        1
          <br>
          +#define CK_LSI        2
          <br>
          +#define CK_LSE        3
          <br>
          +#define CK_HSI        4
          <br>
          +#define CK_HSE_DIV2    5
          <br>
          +
          <br>
          +/* PLL */
          <br>
          +#define PLL1        6
          <br>
          +#define PLL2        7
          <br>
          +#define PLL3        8
          <br>
          +#define PLL4        9
          <br>
          +
          <br>
          +/* ODF */
          <br>
          +#define PLL1_P        10
          <br>
          +#define PLL1_Q        11
          <br>
          +#define PLL1_R        12
          <br>
          +#define PLL2_P        13
          <br>
          +#define PLL2_Q        14
          <br>
          +#define PLL2_R        15
          <br>
          +#define PLL3_P        16
          <br>
          +#define PLL3_Q        17
          <br>
          +#define PLL3_R        18
          <br>
          +#define PLL4_P        19
          <br>
          +#define PLL4_Q        20
          <br>
          +#define PLL4_R        21
          <br>
          +
          <br>
          +#define PCLK1        22
          <br>
          +#define PCLK2        23
          <br>
          +#define PCLK3        24
          <br>
          +#define PCLK4        25
          <br>
          +#define PCLK5        26
          <br>
          +#define PCLK6        27
          <br>
          +
          <br>
          +/* SYSTEM CLOCK */
          <br>
          +#define CK_PER        28
          <br>
          +#define CK_MPU        29
          <br>
          +#define CK_AXI        30
          <br>
          +#define CK_MLAHB    31
          <br>
          +
          <br>
          +/* BASE TIMER */
          <br>
          +#define CK_TIMG1    32
          <br>
          +#define CK_TIMG2    33
          <br>
          +#define CK_TIMG3    34
          <br>
          +
          <br>
          +/* AUX */
          <br>
          +#define RTC        35
          <br>
          +
          <br>
          +/* TRACE &amp; DEBUG clocks */
          <br>
          +#define CK_DBG        36
          <br>
          +#define CK_TRACE    37
          <br>
          +
          <br>
          +/* MCO clocks */
          <br>
          +#define CK_MCO1        38
          <br>
          +#define CK_MCO2        39
          <br>
          +
          <br>
          +/* IP clocks */
          <br>
          +#define SYSCFG        40
          <br>
          +#define VREF        41
          <br>
          +#define DTS        42
          <br>
          +#define PMBCTRL        43
          <br>
          +#define HDP        44
          <br>
          +#define IWDG2        45
          <br>
          +#define STGENRO        46
          <br>
          +#define USART1        47
          <br>
          +#define RTCAPB        48
          <br>
          +#define TZC        49
          <br>
          +#define TZPC        50
          <br>
          +#define IWDG1        51
          <br>
          +#define BSEC        52
          <br>
          +#define DMA1        53
          <br>
          +#define DMA2        54
          <br>
          +#define DMAMUX1        55
          <br>
          +#define DMAMUX2        56
          <br>
          +#define GPIOA        57
          <br>
          +#define GPIOB        58
          <br>
          +#define GPIOC        59
          <br>
          +#define GPIOD        60
          <br>
          +#define GPIOE        61
          <br>
          +#define GPIOF        62
          <br>
          +#define GPIOG        63
          <br>
          +#define GPIOH        64
          <br>
          +#define GPIOI        65
          <br>
          +#define CRYP1        66
          <br>
          +#define HASH1        67
          <br>
          +#define BKPSRAM        68
          <br>
          +#define MDMA        69
          <br>
          +#define CRC1        70
          <br>
          +#define USBH        71
          <br>
          +#define DMA3        72
          <br>
          +#define TSC        73
          <br>
          +#define PKA        74
          <br>
          +#define AXIMC        75
          <br>
          +#define MCE        76
          <br>
          +#define ETH1TX        77
          <br>
          +#define ETH2TX        78
          <br>
          +#define ETH1RX        79
          <br>
          +#define ETH2RX        80
          <br>
          +#define ETH1MAC        81
          <br>
          +#define ETH2MAC        82
          <br>
          +#define ETH1STP        83
          <br>
          +#define ETH2STP        84
          <br>
          +
          <br>
          +/* IP clocks with parents */
          <br>
          +#define SDMMC1_K    85
          <br>
          +#define SDMMC2_K    86
          <br>
          +#define ADC1_K        87
          <br>
          +#define ADC2_K        88
          <br>
          +#define FMC_K        89
          <br>
          +#define QSPI_K        90
          <br>
          +#define RNG1_K        91
          <br>
          +#define USBPHY_K    92
          <br>
          +#define STGEN_K        93
          <br>
          +#define SPDIF_K        94
          <br>
          +#define SPI1_K        95
          <br>
          +#define SPI2_K        96
          <br>
          +#define SPI3_K        97
          <br>
          +#define SPI4_K        98
          <br>
          +#define SPI5_K        99
          <br>
          +#define I2C1_K        100
          <br>
          +#define I2C2_K        101
          <br>
          +#define I2C3_K        102
          <br>
          +#define I2C4_K        103
          <br>
          +#define I2C5_K        104
          <br>
          +#define TIM2_K        105
          <br>
          +#define TIM3_K        106
          <br>
          +#define TIM4_K        107
          <br>
          +#define TIM5_K        108
          <br>
          +#define TIM6_K        109
          <br>
          +#define TIM7_K        110
          <br>
          +#define TIM12_K        111
          <br>
          +#define TIM13_K        112
          <br>
          +#define TIM14_K        113
          <br>
          +#define TIM1_K        114
          <br>
          +#define TIM8_K        115
          <br>
          +#define TIM15_K        116
          <br>
          +#define TIM16_K        117
          <br>
          +#define TIM17_K        118
          <br>
          +#define LPTIM1_K    119
          <br>
          +#define LPTIM2_K    120
          <br>
          +#define LPTIM3_K    121
          <br>
          +#define LPTIM4_K    122
          <br>
          +#define LPTIM5_K    123
          <br>
          +#define USART1_K    124
          <br>
          +#define USART2_K    125
          <br>
          +#define USART3_K    126
          <br>
          +#define UART4_K        127
          <br>
          +#define UART5_K        128
          <br>
          +#define USART6_K    129
          <br>
          +#define UART7_K        130
          <br>
          +#define UART8_K        131
          <br>
          +#define DFSDM_K        132
          <br>
          +#define FDCAN_K        133
          <br>
          +#define SAI1_K        134
          <br>
          +#define SAI2_K        135
          <br>
          +#define ADFSDM_K    136
          <br>
          +#define USBO_K        137
          <br>
          +#define LTDC_PX        138
          <br>
          +#define ETH1CK_K    139
          <br>
          +#define ETH1PTP_K    140
          <br>
          +#define ETH2CK_K    141
          <br>
          +#define ETH2PTP_K    142
          <br>
          +#define DCMIPP_K    143
          <br>
          +#define SAES_K        144
          <br>
          +#define DTS_K        145
          <br>
          +
          <br>
          +/* DDR */
          <br>
          +#define DDRC1        146
          <br>
          +#define DDRC1LP        147
          <br>
          +#define DDRC2        148
          <br>
          +#define DDRC2LP        149
          <br>
          +#define DDRPHYC        150
          <br>
          +#define DDRPHYCLP    151
          <br>
          +#define DDRCAPB        152
          <br>
          +#define DDRCAPBLP    153
          <br>
          +#define AXIDCG        154
          <br>
          +#define DDRPHYCAPB    155
          <br>
          +#define DDRPHYCAPBLP    156
          <br>
          +#define DDRPERFM    157
          <br>
          +
          <br>
          +#define ADC1        158
          <br>
          +#define ADC2        159
          <br>
          +#define SAI1        160
          <br>
          +#define SAI2        161
          <br>
          +
          <br>
          +#define STM32MP1_LAST_CLK 162
          <br>
          +
          <br>
          +/* SCMI clock identifiers */
          <br>
          +#define CK_SCMI_HSE        0
          <br>
          +#define CK_SCMI_HSI        1
          <br>
          +#define CK_SCMI_CSI        2
          <br>
          +#define CK_SCMI_LSE        3
          <br>
          +#define CK_SCMI_LSI        4
          <br>
          +#define CK_SCMI_HSE_DIV2    5
          <br>
          +#define CK_SCMI_PLL2_Q        6
          <br>
          +#define CK_SCMI_PLL2_R        7
          <br>
          +#define CK_SCMI_PLL3_P        8
          <br>
          +#define CK_SCMI_PLL3_Q        9
          <br>
          +#define CK_SCMI_PLL3_R        10
          <br>
          +#define CK_SCMI_PLL4_P        11
          <br>
          +#define CK_SCMI_PLL4_Q        12
          <br>
          +#define CK_SCMI_PLL4_R        13
          <br>
          +#define CK_SCMI_MPU        14
          <br>
          +#define CK_SCMI_AXI        15
          <br>
          +#define CK_SCMI_MLAHB        16
          <br>
          +#define CK_SCMI_CKPER        17
          <br>
          +#define CK_SCMI_PCLK1        18
          <br>
          +#define CK_SCMI_PCLK2        19
          <br>
          +#define CK_SCMI_PCLK3        20
          <br>
          +#define CK_SCMI_PCLK4        21
          <br>
          +#define CK_SCMI_PCLK5        22
          <br>
          +#define CK_SCMI_PCLK6        23
          <br>
          +#define CK_SCMI_CKTIMG1        24
          <br>
          +#define CK_SCMI_CKTIMG2        25
          <br>
          +#define CK_SCMI_CKTIMG3        26
          <br>
          +#define CK_SCMI_RTC        27
          <br>
          +#define CK_SCMI_RTCAPB        28
          <br>
          +
          <br>
          +#endif /* <span class="moz-txt-underscore"><span
              class="moz-txt-tag">_</span>DT_BINDINGS_STM32MP13_CLKS_H<span
              class="moz-txt-tag">_</span></span> */
          <br>
          diff --git a/include/dt-bindings/reset/stm32mp13-resets.h
          b/include/dt-bindings/reset/stm32mp13-resets.h
          <br>
          new file mode 100644
          <br>
          index 0000000000..18ccb05db6
          <br>
          --- /dev/null
          <br>
          +++ b/include/dt-bindings/reset/stm32mp13-resets.h
          <br>
          @@ -0,0 +1,100 @@
          <br>
          +/* SPDX-License-Identifier: GPL-2.0-or-later or BSD-3-Clause
          */
          <br>
          +/*
          <br>
          + * Copyright (C) STMicroelectronics 2022 - All Rights
          Reserved
          <br>
          + * Author: Gabriel Fernandez <a
            class="moz-txt-link-rfc2396E"
            href="mailto:gabriel.fernandez@foss.st.com"
            moz-do-not-send="true">&lt;gabriel.fernandez@foss.st.com&gt;</a>
          for STMicroelectronics.
          <br>
          + */
          <br>
          +
          <br>
          +#ifndef <span class="moz-txt-underscore"><span
              class="moz-txt-tag">_</span>DT_BINDINGS_STM32MP13_RESET_H<span
              class="moz-txt-tag">_</span></span>
          <br>
          +#define <span class="moz-txt-underscore"><span
              class="moz-txt-tag">_</span>DT_BINDINGS_STM32MP13_RESET_H<span
              class="moz-txt-tag">_</span></span>
          <br>
          +
          <br>
          +#define TIM2_R        13568
          <br>
          +#define TIM3_R        13569
          <br>
          +#define TIM4_R        13570
          <br>
          +#define TIM5_R        13571
          <br>
          +#define TIM6_R        13572
          <br>
          +#define TIM7_R        13573
          <br>
          +#define LPTIM1_R    13577
          <br>
          +#define SPI2_R        13579
          <br>
          +#define SPI3_R        13580
          <br>
          +#define USART3_R    13583
          <br>
          +#define UART4_R        13584
          <br>
          +#define UART5_R        13585
          <br>
          +#define UART7_R        13586
          <br>
          +#define UART8_R        13587
          <br>
          +#define I2C1_R        13589
          <br>
          +#define I2C2_R        13590
          <br>
          +#define SPDIF_R        13594
          <br>
          +#define TIM1_R        13632
          <br>
          +#define TIM8_R        13633
          <br>
          +#define SPI1_R        13640
          <br>
          +#define USART6_R    13645
          <br>
          +#define SAI1_R        13648
          <br>
          +#define SAI2_R        13649
          <br>
          +#define DFSDM_R        13652
          <br>
          +#define FDCAN_R        13656
          <br>
          +#define LPTIM2_R    13696
          <br>
          +#define LPTIM3_R    13697
          <br>
          +#define LPTIM4_R    13698
          <br>
          +#define LPTIM5_R    13699
          <br>
          +#define SYSCFG_R    13707
          <br>
          +#define VREF_R        13709
          <br>
          +#define DTS_R        13712
          <br>
          +#define PMBCTRL_R    13713
          <br>
          +#define LTDC_R        13760
          <br>
          +#define DCMIPP_R    13761
          <br>
          +#define DDRPERFM_R    13768
          <br>
          +#define USBPHY_R    13776
          <br>
          +#define STGEN_R        13844
          <br>
          +#define USART1_R    13888
          <br>
          +#define USART2_R    13889
          <br>
          +#define SPI4_R        13890
          <br>
          +#define SPI5_R        13891
          <br>
          +#define I2C3_R        13892
          <br>
          +#define I2C4_R        13893
          <br>
          +#define I2C5_R        13894
          <br>
          +#define TIM12_R        13895
          <br>
          +#define TIM13_R        13896
          <br>
          +#define TIM14_R        13897
          <br>
          +#define TIM15_R        13898
          <br>
          +#define TIM16_R        13899
          <br>
          +#define TIM17_R        13900
          <br>
          +#define DMA1_R        13952
          <br>
          +#define DMA2_R        13953
          <br>
          +#define DMAMUX1_R    13954
          <br>
          +#define DMA3_R        13955
          <br>
          +#define DMAMUX2_R    13956
          <br>
          +#define ADC1_R        13957
          <br>
          +#define ADC2_R        13958
          <br>
          +#define USBO_R        13960
          <br>
          +#define GPIOA_R        14080
          <br>
          +#define GPIOB_R        14081
          <br>
          +#define GPIOC_R        14082
          <br>
          +#define GPIOD_R        14083
          <br>
          +#define GPIOE_R        14084
          <br>
          +#define GPIOF_R        14085
          <br>
          +#define GPIOG_R        14086
          <br>
          +#define GPIOH_R        14087
          <br>
          +#define GPIOI_R        14088
          <br>
          +#define TSC_R        14095
          <br>
          +#define PKA_R        14146
          <br>
          +#define SAES_R        14147
          <br>
          +#define CRYP1_R        14148
          <br>
          +#define HASH1_R        14149
          <br>
          +#define RNG1_R        14150
          <br>
          +#define AXIMC_R        14160
          <br>
          +#define MDMA_R        14208
          <br>
          +#define MCE_R        14209
          <br>
          +#define ETH1MAC_R    14218
          <br>
          +#define FMC_R        14220
          <br>
          +#define QSPI_R        14222
          <br>
          +#define SDMMC1_R    14224
          <br>
          +#define SDMMC2_R    14225
          <br>
          +#define CRC1_R        14228
          <br>
          +#define USBH_R        14232
          <br>
          +#define ETH2MAC_R    14238
          <br>
          +
          <br>
          +/* SCMI reset domain identifiers */
          <br>
          +#define RST_SCMI_LTDC        0
          <br>
          +#define RST_SCMI_MDMA        1
          <br>
          +
          <br>
          +#endif /* <span class="moz-txt-underscore"><span
              class="moz-txt-tag">_</span>DT_BINDINGS_STM32MP13_RESET_H<span
              class="moz-txt-tag">_</span></span> */
          <br>
        </blockquote>
        <br>
      </div>
    </blockquote>
  </body>
</html>

--------------QIFnjdHLpVvGk0MgEXEiG0Zg--

--===============0402525494118185927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0402525494118185927==--
