Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9E719A6D5
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 10:08:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90EB8C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 08:08:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 613DEC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 08:08:24 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03187tVP005342; Wed, 1 Apr 2020 10:08:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=5RNfwQxriAEoOt1ZH7BGpV284hCauNoxV9uPW1ODqFk=;
 b=zlmZVf6CzGTo2KJUDOcY9r+FoFFT2ej7Ya/a8GsoZ29IZ4x6I8qh5OXTeJwQL3L3X+uY
 Khm5fRpysZRj/UtN7FEj+Q5+xQhT9FOHKWLufvB6euZ05DysbQPy7RU3urRep8huxPiv
 BBNxwrFQjv7EL2DY95li6U7A/Z4nShUqudeBzsQhAkSao89UL1/RBMLuE3VeCWrZG0Fu
 pX92WfvL/1nLzJCETYI/tmyM5T+1DOHQP4hYHf5wx6pv2BH9cTn6eEhzYwpBNKL0PaFm
 cve2Eml2SSgg36ZX/TKO4THbsw43gADMP8/sfHYLOilCWEMFRw88pK9zHrobbxHkc6ED SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301w813nym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 10:08:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C312F10002A;
 Wed,  1 Apr 2020 10:08:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B5A7A2126A1;
 Wed,  1 Apr 2020 10:08:18 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 1 Apr
 2020 10:08:18 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 1 Apr 2020 10:08:18 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 14/16] ARM: dts: stm32mp15: use DDR3 files
 generated by STM32CubeMX
Thread-Index: AQHWB/yzHL8spxYvxki5GPQMBXWrVA==
Date: Wed, 1 Apr 2020 08:08:18 +0000
Message-ID: <5725ceb3-9d1a-ba66-39dd-f6950775fc0d@st.com>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331180330.14.I9d49b85c2523409eb85071c740650a8615dac45d@changeid>
In-Reply-To: <20200331180330.14.I9d49b85c2523409eb85071c740650a8615dac45d@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <BD1F92432573454DBD7036E75FB88E99@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 14/16] ARM: dts: stm32mp15: use DDR3 files
 generated by STM32CubeMX
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

Hi Patrick

On 3/31/20 6:04 PM, Patrick Delaunay wrote:
> Use the DDR3 dtsi files generated by STM32CubeMX 5.6.0
> Speed Bin Grade = using DDR3-1066G / 8-8-8 and all others
> parameters at default value.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  .../dts/stm32mp15-ddr3-1x4Gb-1066-binG.dtsi   | 49 +++++++++----------
>  .../dts/stm32mp15-ddr3-2x4Gb-1066-binG.dtsi   | 49 +++++++++----------
>  2 files changed, 48 insertions(+), 50 deletions(-)
>
> diff --git a/arch/arm/dts/stm32mp15-ddr3-1x4Gb-1066-binG.dtsi b/arch/arm/dts/stm32mp15-ddr3-1x4Gb-1066-binG.dtsi
> index 11e8f2bef6..c0fc1f772e 100644
> --- a/arch/arm/dts/stm32mp15-ddr3-1x4Gb-1066-binG.dtsi
> +++ b/arch/arm/dts/stm32mp15-ddr3-1x4Gb-1066-binG.dtsi
> @@ -1,24 +1,23 @@
>  // SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
>  /*
>   * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
> + */
> +
> +/*
> + * File generated by STMicroelectronics STM32CubeMX DDR Tool for MPUs
> + * DDR type: DDR3 / DDR3L
> + * DDR width: 16bits
> + * DDR density: 4Gb
> + * System frequency: 533000Khz
> + * Relaxed Timing Mode: false
> + * Address mapping type: RBC
>   *
> - * STM32MP157C DK1/DK2 BOARD configuration
> - * 1x DDR3L 4Gb, 16-bit, 533MHz.
> - * Reference used NT5CC256M16DP-DI from NANYA
> - *
> - * DDR type / Platform	DDR3/3L
> - * freq		533MHz
> - * width	16
> - * datasheet	0  = MT41J256M16-187 / DDR3-1066 bin G
> - * DDR density	4
> - * timing mode	optimized
> - * Scheduling/QoS options : type = 2
> - * address mapping : RBC
> - * Tc > + 85C : N
> + * Save Date: 2020.02.20, save Time: 18:45:20
>   */
> -#define DDR_MEM_NAME "DDR3-1066/888 bin G 1x4Gb 533MHz v1.45"
> -#define DDR_MEM_SPEED 533000
> -#define DDR_MEM_SIZE 0x20000000
> +
> +#define DDR_MEM_NAME	"DDR3-DDR3L 16bits 533000Khz"
> +#define DDR_MEM_SPEED	533000
> +#define DDR_MEM_SIZE	0x20000000
>  
>  #define DDR_MSTR 0x00041401
>  #define DDR_MRCTRL0 0x00000010
> @@ -50,15 +49,6 @@
>  #define DDR_DFIUPD1 0x00000000
>  #define DDR_DFIUPD2 0x00000000
>  #define DDR_DFIPHYMSTR 0x00000000
> -#define DDR_ADDRMAP1 0x00070707
> -#define DDR_ADDRMAP2 0x00000000
> -#define DDR_ADDRMAP3 0x1F000000
> -#define DDR_ADDRMAP4 0x00001F1F
> -#define DDR_ADDRMAP5 0x06060606
> -#define DDR_ADDRMAP6 0x0F060606
> -#define DDR_ADDRMAP9 0x00000000
> -#define DDR_ADDRMAP10 0x00000000
> -#define DDR_ADDRMAP11 0x00000000
>  #define DDR_ODTCFG 0x06000600
>  #define DDR_ODTMAP 0x00000001
>  #define DDR_SCHED 0x00000C01
> @@ -83,6 +73,15 @@
>  #define DDR_PCFGQOS1_1 0x00800040
>  #define DDR_PCFGWQOS0_1 0x01100C03
>  #define DDR_PCFGWQOS1_1 0x01000200
> +#define DDR_ADDRMAP1 0x00070707
> +#define DDR_ADDRMAP2 0x00000000
> +#define DDR_ADDRMAP3 0x1F000000
> +#define DDR_ADDRMAP4 0x00001F1F
> +#define DDR_ADDRMAP5 0x06060606
> +#define DDR_ADDRMAP6 0x0F060606
> +#define DDR_ADDRMAP9 0x00000000
> +#define DDR_ADDRMAP10 0x00000000
> +#define DDR_ADDRMAP11 0x00000000
>  #define DDR_PGCR 0x01442E02
>  #define DDR_PTR0 0x0022AA5B
>  #define DDR_PTR1 0x04841104
> diff --git a/arch/arm/dts/stm32mp15-ddr3-2x4Gb-1066-binG.dtsi b/arch/arm/dts/stm32mp15-ddr3-2x4Gb-1066-binG.dtsi
> index 4b70b60554..fc226d2544 100644
> --- a/arch/arm/dts/stm32mp15-ddr3-2x4Gb-1066-binG.dtsi
> +++ b/arch/arm/dts/stm32mp15-ddr3-2x4Gb-1066-binG.dtsi
> @@ -1,24 +1,23 @@
>  // SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
>  /*
>   * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
> + */
> +
> +/*
> + * File generated by STMicroelectronics STM32CubeMX DDR Tool for MPUs
> + * DDR type: DDR3 / DDR3L
> + * DDR width: 32bits
> + * DDR density: 8Gb
> + * System frequency: 533000Khz
> + * Relaxed Timing Mode: false
> + * Address mapping type: RBC
>   *
> - * STM32MP157C ED1 BOARD configuration
> - * 2x DDR3L 4Gb each, 16-bit, 533MHz, Single Die Package in flyby topology.
> - * Reference used NT5CC256M16DP-DI from NANYA
> - *
> - * DDR type / Platform	DDR3/3L
> - * freq		533MHz
> - * width	32
> - * datasheet	0  = MT41J256M16-187 / DDR3-1066 bin G
> - * DDR density	8
> - * timing mode	optimized
> - * Scheduling/QoS options : type = 2
> - * address mapping : RBC
> - * Tc > + 85C : N
> + * Save Date: 2020.02.20, save Time: 18:49:33
>   */
> -#define DDR_MEM_NAME "DDR3-1066/888 bin G 2x4Gb 533MHz v1.45"
> -#define DDR_MEM_SPEED 533000
> -#define DDR_MEM_SIZE 0x40000000
> +
> +#define DDR_MEM_NAME	"DDR3-DDR3L 32bits 533000Khz"
> +#define DDR_MEM_SPEED	533000
> +#define DDR_MEM_SIZE	0x40000000
>  
>  #define DDR_MSTR 0x00040401
>  #define DDR_MRCTRL0 0x00000010
> @@ -50,15 +49,6 @@
>  #define DDR_DFIUPD1 0x00000000
>  #define DDR_DFIUPD2 0x00000000
>  #define DDR_DFIPHYMSTR 0x00000000
> -#define DDR_ADDRMAP1 0x00080808
> -#define DDR_ADDRMAP2 0x00000000
> -#define DDR_ADDRMAP3 0x00000000
> -#define DDR_ADDRMAP4 0x00001F1F
> -#define DDR_ADDRMAP5 0x07070707
> -#define DDR_ADDRMAP6 0x0F070707
> -#define DDR_ADDRMAP9 0x00000000
> -#define DDR_ADDRMAP10 0x00000000
> -#define DDR_ADDRMAP11 0x00000000
>  #define DDR_ODTCFG 0x06000600
>  #define DDR_ODTMAP 0x00000001
>  #define DDR_SCHED 0x00000C01
> @@ -83,6 +73,15 @@
>  #define DDR_PCFGQOS1_1 0x00800040
>  #define DDR_PCFGWQOS0_1 0x01100C03
>  #define DDR_PCFGWQOS1_1 0x01000200
> +#define DDR_ADDRMAP1 0x00080808
> +#define DDR_ADDRMAP2 0x00000000
> +#define DDR_ADDRMAP3 0x00000000
> +#define DDR_ADDRMAP4 0x00001F1F
> +#define DDR_ADDRMAP5 0x07070707
> +#define DDR_ADDRMAP6 0x0F070707
> +#define DDR_ADDRMAP9 0x00000000
> +#define DDR_ADDRMAP10 0x00000000
> +#define DDR_ADDRMAP11 0x00000000
>  #define DDR_PGCR 0x01442E02
>  #define DDR_PTR0 0x0022AA5B
>  #define DDR_PTR1 0x04841104

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
