Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8091B16E77
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Jul 2025 11:22:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76970C3F933;
	Thu, 31 Jul 2025 09:22:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94BF6C36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Jul 2025 09:22:25 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V9D7I0018495;
 Thu, 31 Jul 2025 11:22:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 LZvWpO+ZAuy7dVetpTgF8on9xxutBzz9QpABvHz8wfQ=; b=xq8CLDwb3hRsYBQ0
 Gziy/UudM1jd2K6YZPCNqNEZdr7UGWe8zDweHCpRI2MsTYLjTzUQNrvoiYwl9wP4
 RaIwLVlMvgQyCTMHs7K3bo4ygwg5Yb+lbMYh2tmdTlaxEpKUF2nRf1iAJ7mjBNXA
 cEIVhbQp2xypNSa5HbwrBPnIslQg9bG0U5u5hAs25zpgWyL21SZufH+ObK1kdShB
 cU+gwfwTvw5XY92xQrMt5cnQq5oauvKQIjomtr1NtN/o3pbz8FoJ1nOwU5G2S1EP
 hXth+1TNO+sMsYL/v8dfmRjhw4Dn/nvhiDfwpY0vAw7j2wnZOD6I6EciBCs6VF3S
 okqU2w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4858k5btnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Jul 2025 11:22:23 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AD41C4002D;
 Thu, 31 Jul 2025 11:21:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5724F5FDF46;
 Thu, 31 Jul 2025 11:21:29 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 31 Jul
 2025 11:21:28 +0200
Message-ID: <dcbb8dc9-3f47-4229-ae04-b84a12955f50@foss.st.com>
Date: Thu, 31 Jul 2025 11:21:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <u-boot@lists.denx.de>
References: <20250626080846.48576-1-patrice.chotard@foss.st.com>
 <20250626080846.48576-2-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250626080846.48576-2-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] ARM: dts: stm32: Add
	stm32mp235f-dk-u-boot
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



On 6/26/25 10:08, Patrice Chotard wrote:
> Add U-Boot specific file for stm32mp235f-dk board
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp23-u-boot.dtsi      | 104 ++++++++++++++++++++++++
>  arch/arm/dts/stm32mp235f-dk-u-boot.dtsi |  27 ++++++
>  2 files changed, 131 insertions(+)
>  create mode 100644 arch/arm/dts/stm32mp23-u-boot.dtsi
>  create mode 100644 arch/arm/dts/stm32mp235f-dk-u-boot.dtsi
> 
> diff --git a/arch/arm/dts/stm32mp23-u-boot.dtsi b/arch/arm/dts/stm32mp23-u-boot.dtsi
> new file mode 100644
> index 00000000000..872a8739c54
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp23-u-boot.dtsi
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
> +/*
> + * Copyright : STMicroelectronics 2024
> + */
> +
> +/ {
> +	aliases {
> +		gpio0 = &gpioa;
> +		gpio1 = &gpiob;
> +		gpio2 = &gpioc;
> +		gpio3 = &gpiod;
> +		gpio4 = &gpioe;
> +		gpio5 = &gpiof;
> +		gpio6 = &gpiog;
> +		gpio7 = &gpioh;
> +		gpio8 = &gpioi;
> +		gpio25 = &gpioz;
> +		pinctrl0 = &pinctrl;
> +		pinctrl1 = &pinctrl_z;
> +	};
> +
> +	firmware {
> +		optee {
> +			bootph-all;
> +		};
> +
> +		scmi {
> +			bootph-all;
> +		};
> +	};
> +
> +	/* need PSCI for sysreset during board_f */
> +	psci {
> +		bootph-all;
> +	};
> +
> +	soc@0 {
> +		bootph-all;
> +	};
> +};
> +
> +&bsec {
> +	bootph-all;
> +};
> +
> +&gpioa {
> +	bootph-all;
> +};
> +
> +&gpiob {
> +	bootph-all;
> +};
> +
> +&gpioc {
> +	bootph-all;
> +};
> +
> +&gpiod {
> +	bootph-all;
> +};
> +
> +&gpioe {
> +	bootph-all;
> +};
> +
> +&gpiof {
> +	bootph-all;
> +};
> +
> +&gpiog {
> +	bootph-all;
> +};
> +
> +&gpioh {
> +	bootph-all;
> +};
> +
> +&gpioi {
> +	bootph-all;
> +};
> +
> +&gpioz {
> +	bootph-all;
> +};
> +
> +&pinctrl {
> +	bootph-all;
> +};
> +
> +&rcc {
> +	bootph-all;
> +};
> +
> +&rifsc {
> +	bootph-all;
> +};
> +
> +&scmi_clk {
> +	bootph-all;
> +};
> +
> +&syscfg {
> +	bootph-all;
> +};
> diff --git a/arch/arm/dts/stm32mp235f-dk-u-boot.dtsi b/arch/arm/dts/stm32mp235f-dk-u-boot.dtsi
> new file mode 100644
> index 00000000000..1bc77874050
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp235f-dk-u-boot.dtsi
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
> +/*
> + * Copyright (C) STMicroelectronics 2024 - All Rights Reserved
> + */
> +
> +#include "stm32mp23-u-boot.dtsi"
> +
> +/ {
> +	config {
> +		u-boot,boot-led = "led-blue";
> +		u-boot,mmc-env-partition = "u-boot-env";
> +	};
> +};
> +
> +&usart2 {
> +	bootph-all;
> +};
> +
> +&usart2_pins_a {
> +	bootph-all;
> +	pins1 {
> +		bootph-all;
> +	};
> +	pins2 {
> +		bootph-all;
> +	};
> +};
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
