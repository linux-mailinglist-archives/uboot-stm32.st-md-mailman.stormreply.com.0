Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C35332824
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Mar 2021 15:08:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E53F9C57195;
	Tue,  9 Mar 2021 14:08:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15DDCC57194
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 14:08:08 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129E2rIE002066; Tue, 9 Mar 2021 15:08:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=kZ2+XeHHtsA+OGR2ZPxPI4qSgDDyYeOjAzfShY6dIas=;
 b=gEGqdpVeW6A3wesKnpH6KhaVcT/16AZo5wjUt9m1dAd+1F2vMn7vsQBtiTMO6A2GWiYs
 /yT/wQ+TBnk0azQ4RAJql2L3Ec5stWRDWJKKjYLH8RJwbjTJk9qaLTc5dK8vUQWiqCFU
 QuO9Z384Fgd6+3FrP0a8qAfxG4y4iQcGxLkBt0SWDaoPTvbN3pknueBTeAIm4QwGhnqZ
 7DpOUEuGPL951K934mE7PwKUORZLfdtt41IBs6+RiZhbGJj7iM8ahKsP6RxtuaRrvMra
 M+cJpUHDWHtViutUELKpBjep/L1d3X3GzUS51/bZvu2t43pfpiicYmRY9Kbk5AZIUixj Iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3741gpj67t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 15:08:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CA63810002A;
 Tue,  9 Mar 2021 15:08:04 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C08D3269E6A;
 Tue,  9 Mar 2021 15:08:04 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Mar
 2021 15:08:04 +0100
To: Jagan Teki <jagan@amarulasolutions.com>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, Matteo Lisi <matteo.lisi@engicam.com>
References: <20210228155226.77904-1-jagan@amarulasolutions.com>
 <20210228155226.77904-8-jagan@amarulasolutions.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <e6019e85-7761-f2a6-8cbe-d63392f558e4@foss.st.com>
Date: Tue, 9 Mar 2021 15:08:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210228155226.77904-8-jagan@amarulasolutions.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_11:2021-03-08,
 2021-03-09 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH 7/9] ARM: dts: stm32: Add Engicam MicroGEA
 STM32MP1 1X4Gb DDR3
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

Hi Jagan

On 2/28/21 4:52 PM, Jagan Teki wrote:
> Engicam MicroGEA STM32MP1 Micro SOM has mounted 1x4Gb DDR3
> which has 16bits width 533Mhz frequency.
> 
> Add DDR configurations via dtsi.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  ...m32mp15-ddr3-microgea-1x4Gb-1066-binG.dtsi | 121 ++++++++++++++++++
>  1 file changed, 121 insertions(+)
>  create mode 100644 arch/arm/dts/stm32mp15-ddr3-microgea-1x4Gb-1066-binG.dtsi
> 
> diff --git a/arch/arm/dts/stm32mp15-ddr3-microgea-1x4Gb-1066-binG.dtsi b/arch/arm/dts/stm32mp15-ddr3-microgea-1x4Gb-1066-binG.dtsi
> new file mode 100644
> index 0000000000..950f292abb
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp15-ddr3-microgea-1x4Gb-1066-binG.dtsi
> @@ -0,0 +1,121 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +/*
> + * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
> + *
> + * STM32MP157C DK1/DK2 BOARD configuration
> + * 1x DDR3L 4Gb, 16-bit, 533MHz.
> + * Reference used NT5CC256M16DP-DI from NANYA
> + *
> + * DDR type / Platform	DDR3/3L
> + * freq		533MHz
> + * width	16
> + * datasheet	0  = MT41J256M16-187 / DDR3-1066 bin G
> + * DDR density	4
> + * timing mode	optimized
> + * Scheduling/QoS options : type = 2
> + * address mapping : RBC
> + * Tc > + 85C : N
> + */
> +#define DDR_MEM_COMPATIBLE ddr3-microgea-1066-888-bin-g-1x4gb-533mhz
> +#define DDR_MEM_NAME "DDR3-1066/888 bin G 1x4Gb 533MHz v1.45"
> +#define DDR_MEM_SPEED 533000
> +#define DDR_MEM_SIZE 0x20000000
> +
> +#define DDR_MSTR 0x00041401
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
> +#define DDR_DRAMTMG1 0x000A041C
> +#define DDR_DRAMTMG2 0x0608090F
> +#define DDR_DRAMTMG3 0x0050400C
> +#define DDR_DRAMTMG4 0x08040608
> +#define DDR_DRAMTMG5 0x06060403
> +#define DDR_DRAMTMG6 0x02020002
> +#define DDR_DRAMTMG7 0x00000202
> +#define DDR_DRAMTMG8 0x00001005
> +#define DDR_DRAMTMG14 0x000000A0
> +#define DDR_ZQCTL0 0xC2000040
> +#define DDR_DFITMG0 0x02060105
> +#define DDR_DFITMG1 0x00000202
> +#define DDR_DFILPCFG0 0x07000000
> +#define DDR_DFIUPD0 0xC0400003
> +#define DDR_DFIUPD1 0x00000000
> +#define DDR_DFIUPD2 0x00000000
> +#define DDR_DFIPHYMSTR 0x00000000
> +#define DDR_ADDRMAP1 0x00070707
> +#define DDR_ADDRMAP2 0x00000000
> +#define DDR_ADDRMAP3 0x1F000000
> +#define DDR_ADDRMAP4 0x00001F1F
> +#define DDR_ADDRMAP5 0x06060606
> +#define DDR_ADDRMAP6 0x0F060606
> +#define DDR_ADDRMAP9 0x00000000
> +#define DDR_ADDRMAP10 0x00000000
> +#define DDR_ADDRMAP11 0x00000000
> +#define DDR_ODTCFG 0x06000600
> +#define DDR_ODTMAP 0x00000001
> +#define DDR_SCHED 0x00000C01
> +#define DDR_SCHED1 0x00000000
> +#define DDR_PERFHPR1 0x01000001
> +#define DDR_PERFLPR1 0x08000200
> +#define DDR_PERFWR1 0x08000400
> +#define DDR_DBG0 0x00000000
> +#define DDR_DBG1 0x00000000
> +#define DDR_DBGCMD 0x00000000
> +#define DDR_POISONCFG 0x00000000
> +#define DDR_PCCFG 0x00000010
> +#define DDR_PCFGR_0 0x00010000
> +#define DDR_PCFGW_0 0x00000000
> +#define DDR_PCFGQOS0_0 0x02100C03
> +#define DDR_PCFGQOS1_0 0x00800100
> +#define DDR_PCFGWQOS0_0 0x01100C03
> +#define DDR_PCFGWQOS1_0 0x01000200
> +#define DDR_PCFGR_1 0x00010000
> +#define DDR_PCFGW_1 0x00000000
> +#define DDR_PCFGQOS0_1 0x02100C03
> +#define DDR_PCFGQOS1_1 0x00800040
> +#define DDR_PCFGWQOS0_1 0x01100C03
> +#define DDR_PCFGWQOS1_1 0x01000200
> +#define DDR_PGCR 0x01442E02
> +#define DDR_PTR0 0x0022AA5B
> +#define DDR_PTR1 0x04841104
> +#define DDR_PTR2 0x042DA068
> +#define DDR_ACIOCR 0x10400812
> +#define DDR_DXCCR 0x00000C40
> +#define DDR_DSGCR 0xF200011F
> +#define DDR_DCR 0x0000000B
> +#define DDR_DTPR0 0x38D488D0
> +#define DDR_DTPR1 0x098B00D8
> +#define DDR_DTPR2 0x10023600
> +#define DDR_MR0 0x00000840
> +#define DDR_MR1 0x00000000
> +#define DDR_MR2 0x00000208
> +#define DDR_MR3 0x00000000
> +#define DDR_ODTCR 0x00010000
> +#define DDR_ZQ0CR1 0x00000038
> +#define DDR_DX0GCR 0x0000CE81
> +#define DDR_DX0DLLCR 0x40000000
> +#define DDR_DX0DQTR 0xFFFFFFFF
> +#define DDR_DX0DQSTR 0x3DB02000
> +#define DDR_DX1GCR 0x0000CE81
> +#define DDR_DX1DLLCR 0x40000000
> +#define DDR_DX1DQTR 0xFFFFFFFF
> +#define DDR_DX1DQSTR 0x3DB02000
> +#define DDR_DX2GCR 0x0000CE80
> +#define DDR_DX2DLLCR 0x40000000
> +#define DDR_DX2DQTR 0xFFFFFFFF
> +#define DDR_DX2DQSTR 0x3DB02000
> +#define DDR_DX3GCR 0x0000CE80
> +#define DDR_DX3DLLCR 0x40000000
> +#define DDR_DX3DQTR 0xFFFFFFFF
> +#define DDR_DX3DQSTR 0x3DB02000
> +
> +#include "stm32mp15-ddr.dtsi"
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks 

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
