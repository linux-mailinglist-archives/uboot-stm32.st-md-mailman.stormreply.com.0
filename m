Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 872C7AD1973
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Jun 2025 09:58:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AB4DC3F93A;
	Mon,  9 Jun 2025 07:58:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4F8FC3F939
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jun 2025 07:58:53 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5597m4SQ000363;
 Mon, 9 Jun 2025 09:58:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 cEYPEzp5P85kXVKs019VzSb9fwEifHz9liYDaI+b6I0=; b=SPJJAyhvKLPOBPnA
 EFpfbfJCO8q+9NE/IMSfmPrhwQsUUy6wgqXW4JVesMHRzwFC9sZ0xYLIF+z0AkuR
 dYzTRRitwkuGDYGvebJ2VC3rY6AswinRiiqgKwJ/Q5uk1yVeSpa789Q0avYBn7lt
 tvcnU4yAgSDAQYFoUt1o1nvolkYNrsMye/a1LSg/LMoIFPZhfBJWvyoGATjMwg+M
 4DQeF0bnCNN1+HqJmTTTPVppdsZ+/cXFqydLN6Fm5eRQcwFPKxj8EYqai9GY3taD
 6hNV88/obtT5nHlJmwRSRBbl8M9jX+7K1LlHWBe/Rm4FbMltoIne6w3QwOaxvCBc
 PML0hQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aum6qx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 09:58:48 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1EE8C4002D;
 Mon,  9 Jun 2025 09:57:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A50E4B724C8;
 Mon,  9 Jun 2025 09:57:25 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 09:57:25 +0200
Message-ID: <80f976c4-c985-4373-a92c-6b5462692e4d@foss.st.com>
Date: Mon, 9 Jun 2025 09:57:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
 <20250607093730.2249536-9-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250607093730.2249536-9-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_03,2025-06-05_01,2025-03-28_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dillon Min <dillon.minfei@gmail.com>, uboot-stm32@st-md-mailman.stormreply.com,
 linux-amarula@amarulasolutions.com, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 8/9] ARM: dts: stm32: add
	stm32h747i-disco-u-boot DTS file
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



On 6/7/25 11:37, Dario Binacchi wrote:
> Add stm32h747i-disco-u-boot DTS file with FMC SDRAM node and its
> pinmux settings.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  arch/arm/dts/stm32h747i-disco-u-boot.dtsi | 104 ++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 arch/arm/dts/stm32h747i-disco-u-boot.dtsi
> 
> diff --git a/arch/arm/dts/stm32h747i-disco-u-boot.dtsi b/arch/arm/dts/stm32h747i-disco-u-boot.dtsi
> new file mode 100644
> index 000000000000..ff297cc91fa8
> --- /dev/null
> +++ b/arch/arm/dts/stm32h747i-disco-u-boot.dtsi
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
> + */
> +
> +#include <stm32h7-u-boot.dtsi>
> +
> +&fmc {
> +
> +	/*
> +	 * Memory configuration from sdram datasheet IS42S32800G-6BLI
> +	 * first bank is bank@0
> +	 * second bank is bank@1
> +	 */
> +	bank1: bank@1 {
> +		st,sdram-control = /bits/ 8 <NO_COL_9
> +					     NO_ROW_12
> +					     MWIDTH_32
> +					     BANKS_4
> +					     CAS_2
> +					     SDCLK_3
> +					     RD_BURST_EN
> +					     RD_PIPE_DL_0>;
> +		st,sdram-timing = /bits/ 8 <TMRD_1
> +					    TXSR_1
> +					    TRAS_1
> +					    TRC_6
> +					    TRP_2
> +					    TWR_1
> +					    TRCD_1>;
> +		st,sdram-refcount = <1539>;
> +	};
> +};
> +
> +&pinctrl {
> +	fmc_pins: fmc@0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('D', 0, AF12)>,
> +				 <STM32_PINMUX('D', 1, AF12)>,
> +				 <STM32_PINMUX('D', 8, AF12)>,
> +				 <STM32_PINMUX('D', 9, AF12)>,
> +				 <STM32_PINMUX('D',10, AF12)>,
> +				 <STM32_PINMUX('D',14, AF12)>,
> +				 <STM32_PINMUX('D',15, AF12)>,
> +
> +				 <STM32_PINMUX('E', 0, AF12)>,
> +				 <STM32_PINMUX('E', 1, AF12)>,
> +				 <STM32_PINMUX('E', 7, AF12)>,
> +				 <STM32_PINMUX('E', 8, AF12)>,
> +				 <STM32_PINMUX('E', 9, AF12)>,
> +				 <STM32_PINMUX('E',10, AF12)>,
> +				 <STM32_PINMUX('E',11, AF12)>,
> +				 <STM32_PINMUX('E',12, AF12)>,
> +				 <STM32_PINMUX('E',13, AF12)>,
> +				 <STM32_PINMUX('E',14, AF12)>,
> +				 <STM32_PINMUX('E',15, AF12)>,
> +
> +				 <STM32_PINMUX('F', 0, AF12)>,
> +				 <STM32_PINMUX('F', 1, AF12)>,
> +				 <STM32_PINMUX('F', 2, AF12)>,
> +				 <STM32_PINMUX('F', 3, AF12)>,
> +				 <STM32_PINMUX('F', 4, AF12)>,
> +				 <STM32_PINMUX('F', 5, AF12)>,
> +				 <STM32_PINMUX('F',11, AF12)>,
> +				 <STM32_PINMUX('F',12, AF12)>,
> +				 <STM32_PINMUX('F',13, AF12)>,
> +				 <STM32_PINMUX('F',14, AF12)>,
> +				 <STM32_PINMUX('F',15, AF12)>,
> +
> +				 <STM32_PINMUX('G', 0, AF12)>,
> +				 <STM32_PINMUX('G', 1, AF12)>,
> +				 <STM32_PINMUX('G', 2, AF12)>,
> +				 <STM32_PINMUX('G', 4, AF12)>,
> +				 <STM32_PINMUX('G', 5, AF12)>,
> +				 <STM32_PINMUX('G', 8, AF12)>,
> +				 <STM32_PINMUX('G',15, AF12)>,
> +
> +				 <STM32_PINMUX('H', 5, AF12)>,
> +				 <STM32_PINMUX('H', 6, AF12)>,
> +				 <STM32_PINMUX('H', 7, AF12)>,
> +				 <STM32_PINMUX('H', 8, AF12)>,
> +				 <STM32_PINMUX('H', 9, AF12)>,
> +				 <STM32_PINMUX('H',10, AF12)>,
> +				 <STM32_PINMUX('H',11, AF12)>,
> +				 <STM32_PINMUX('H',12, AF12)>,
> +				 <STM32_PINMUX('H',13, AF12)>,
> +				 <STM32_PINMUX('H',14, AF12)>,
> +				 <STM32_PINMUX('H',15, AF12)>,
> +
> +				 <STM32_PINMUX('I', 0, AF12)>,
> +				 <STM32_PINMUX('I', 1, AF12)>,
> +				 <STM32_PINMUX('I', 2, AF12)>,
> +				 <STM32_PINMUX('I', 3, AF12)>,
> +				 <STM32_PINMUX('I', 4, AF12)>,
> +				 <STM32_PINMUX('I', 5, AF12)>,
> +				 <STM32_PINMUX('I', 6, AF12)>,
> +				 <STM32_PINMUX('I', 7, AF12)>,
> +				 <STM32_PINMUX('I', 9, AF12)>,
> +				 <STM32_PINMUX('I',10, AF12)>;
> +
> +			slew-rate = <3>;
> +		};
> +	};
> +};
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
