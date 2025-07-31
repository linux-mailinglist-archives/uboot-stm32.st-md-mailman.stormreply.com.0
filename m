Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D59FB16E65
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Jul 2025 11:20:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CCC2C3F933;
	Thu, 31 Jul 2025 09:20:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4530DC36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Jul 2025 09:20:54 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V8wmif018156;
 Thu, 31 Jul 2025 11:20:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 fZw5PzasoGZdDZpp3rkVrmkv2fx+NlK5uh5nyOyWum4=; b=MTGKtKXM3HY9l9bA
 gu/bK8V0tJ5yHBuESvJG5//8JZjs4qsyDq8mUZJOV7OVyPgX9dXr+/sMZhKqTsEk
 hRv02xwgy7p+C8E8DnWsTJVNtA0jMa5VXN+mxynI0XiICwEa07aAxxq4uAt1+I4q
 E2SAWRWe3YGR9e2FiI02DQ3PcsM5XQa9CQKaMl6EHABYmTAHzx0HON04DWvKgXil
 NJvgdi8CtowbvE1tt+WGwXR8t07QKdgzcP2kK+IsbKX+VrRPf78XUyCjGGQVWUtF
 9e6hl7HxlWBHhxqAeEq1HgxwA7tjQigGRzvtZbiBn2c9CTAIX7o2uyQYhwmxuLod
 6JeFxQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484m59dwfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Jul 2025 11:20:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 217864005D;
 Thu, 31 Jul 2025 11:19:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7060575E805;
 Thu, 31 Jul 2025 11:18:43 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 31 Jul
 2025 11:18:42 +0200
Message-ID: <6e46ae41-834f-4307-842d-93e37502e78c@foss.st.com>
Date: Thu, 31 Jul 2025 11:18:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20250630001053.952342-1-marek.vasut@mailbox.org>
 <20250630001053.952342-7-marek.vasut@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250630001053.952342-7-marek.vasut@mailbox.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>, u-boot@dh-electronics.com,
 Cheick Traore <cheick.traore@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2 07/10] ARM: dts: stm32: Add 512 MiB
 DRAM settings for DH STM32MP13xx DHCOR DHSBC
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



On 6/30/25 02:10, Marek Vasut wrote:
> Add DRAM settings for 512 MiB of DRAM variant of DH STM32MP13xx DHCOR DHSBC.
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Cheick Traore <cheick.traore@foss.st.com>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Cc: Lionel Debieve <lionel.debieve@foss.st.com>
> Cc: Pascal Zimmermann <pzimmermann@dh-electronics.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Sughosh Ganu <sughosh.ganu@linaro.org>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
> V2: Add RB from Patrice
> ---
>  .../stm32mp13-ddr3-dhsom-1x2Gb-1066-binG.dtsi | 100 ++++++++++++++++++
>  arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi    |   1 +
>  2 files changed, 101 insertions(+)
>  create mode 100644 arch/arm/dts/stm32mp13-ddr3-dhsom-1x2Gb-1066-binG.dtsi
> 
> diff --git a/arch/arm/dts/stm32mp13-ddr3-dhsom-1x2Gb-1066-binG.dtsi b/arch/arm/dts/stm32mp13-ddr3-dhsom-1x2Gb-1066-binG.dtsi
> new file mode 100644
> index 00000000000..7b344541c3e
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp13-ddr3-dhsom-1x2Gb-1066-binG.dtsi
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +/*
> + * Copyright (C) 2025, DH electronics - All Rights Reserved
> + *
> + * STM32MP13xx DHSOM configuration
> + * 1x DDR3L 1Gb, 16-bit, 533MHz, Single Die Package in flyby topology.
> + * Reference used W631GU6MB15I from Winbond
> + *
> + * DDR type / Platform	DDR3/3L
> + * freq		533MHz
> + * width	16
> + * datasheet	0  = W631GU6MB15I / DDR3-1333
> + * DDR density	2
> + * timing mode	optimized
> + * address mapping : RBC
> + * Tc > + 85C : J
> + */
> +#define DDR_MEM_COMPATIBLE ddr3l-dhsom-1066-888-bin-g-1x2gb-533mhz
> +#define DDR_MEM_NAME	"DDR3-DDR3L 16bits 533000kHz"
> +#define DDR_MEM_SPEED	533000
> +#define DDR_MEM_SIZE	0x20000000
> +
> +#define DDR_MSTR 0x00040401
> +#define DDR_MRCTRL0 0x00000010
> +#define DDR_MRCTRL1 0x00000000
> +#define DDR_DERATEEN 0x00000000
> +#define DDR_DERATEINT 0x00800000
> +#define DDR_PWRCTL 0x00000000
> +#define DDR_PWRTMG 0x00400010
> +#define DDR_HWLPCTL 0x00000000
> +#define DDR_RFSHCTL0 0x00210000
> +#define DDR_RFSHCTL3 0x00000000
> +#define DDR_RFSHTMG 0x0081008B
> +#define DDR_CRCPARCTL0 0x00000000
> +#define DDR_DRAMTMG0 0x121B2414
> +#define DDR_DRAMTMG1 0x000A041B
> +#define DDR_DRAMTMG2 0x0607080F
> +#define DDR_DRAMTMG3 0x0050400C
> +#define DDR_DRAMTMG4 0x07040607
> +#define DDR_DRAMTMG5 0x06060403
> +#define DDR_DRAMTMG6 0x02020002
> +#define DDR_DRAMTMG7 0x00000202
> +#define DDR_DRAMTMG8 0x00001005
> +#define DDR_DRAMTMG14 0x000000A0
> +#define DDR_ZQCTL0 0xC2000040
> +#define DDR_DFITMG0 0x02050105
> +#define DDR_DFITMG1 0x00000202
> +#define DDR_DFILPCFG0 0x07000000
> +#define DDR_DFIUPD0 0xC0400003
> +#define DDR_DFIUPD1 0x00000000
> +#define DDR_DFIUPD2 0x00000000
> +#define DDR_DFIPHYMSTR 0x00000000
> +#define DDR_ADDRMAP1 0x00080808
> +#define DDR_ADDRMAP2 0x00000000
> +#define DDR_ADDRMAP3 0x00000000
> +#define DDR_ADDRMAP4 0x00001F1F
> +#define DDR_ADDRMAP5 0x07070707
> +#define DDR_ADDRMAP6 0x0F070707
> +#define DDR_ADDRMAP9 0x00000000
> +#define DDR_ADDRMAP10 0x00000000
> +#define DDR_ADDRMAP11 0x00000000
> +#define DDR_ODTCFG 0x06000600
> +#define DDR_ODTMAP 0x00000001
> +#define DDR_SCHED 0x00000F01
> +#define DDR_SCHED1 0x00000000
> +#define DDR_PERFHPR1 0x00000001
> +#define DDR_PERFLPR1 0x04000200
> +#define DDR_PERFWR1 0x08000400
> +#define DDR_DBG0 0x00000000
> +#define DDR_DBG1 0x00000000
> +#define DDR_DBGCMD 0x00000000
> +#define DDR_POISONCFG 0x00000000
> +#define DDR_PCCFG 0x00000010
> +#define DDR_PCFGR_0 0x00000000
> +#define DDR_PCFGW_0 0x00000000
> +#define DDR_PCFGQOS0_0 0x00100009
> +#define DDR_PCFGQOS1_0 0x00000020
> +#define DDR_PCFGWQOS0_0 0x01100B03
> +#define DDR_PCFGWQOS1_0 0x01000200
> +#define DDR_PGCR 0x01442E02
> +#define DDR_PTR0 0x0022AA5B
> +#define DDR_PTR1 0x04841104
> +#define DDR_PTR2 0x042DA068
> +#define DDR_ACIOCR 0x10400812
> +#define DDR_DXCCR 0x00000C40
> +#define DDR_DSGCR 0xF200011F
> +#define DDR_DCR 0x0000000B
> +#define DDR_DTPR0 0x36D477D0
> +#define DDR_DTPR1 0x098B00D8
> +#define DDR_DTPR2 0x10023600
> +#define DDR_MR0 0x00000830
> +#define DDR_MR1 0x00000000
> +#define DDR_MR2 0x00000208
> +#define DDR_MR3 0x00000000
> +#define DDR_ODTCR 0x00010000
> +#define DDR_ZQ0CR1 0x00000038
> +#define DDR_DX0GCR 0x0000CE81
> +#define DDR_DX1GCR 0x0000CE81
> +
> +#include "stm32mp13-ddr.dtsi"
> diff --git a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
> index 9ff42ab8248..6117da10bbf 100644
> --- a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
> @@ -4,6 +4,7 @@
>   */
>  
>  #include "stm32mp13-u-boot.dtsi"
> +#include "stm32mp13-ddr3-dhsom-1x2Gb-1066-binG.dtsi"
>  
>  / {
>  	aliases {
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
