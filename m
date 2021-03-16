Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D92D33D522
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Mar 2021 14:46:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35F6DC57B77;
	Tue, 16 Mar 2021 13:46:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F375CC56632
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 13:46:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12GDfrcg017338; Tue, 16 Mar 2021 14:46:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Yze3bd683qXI0Vu5Cq6RbAMCy79C/xS/vB0Z+CQvPpU=;
 b=aIJzHY6wEz2VaTn+x84v29IcF1jCdXLGSsb5ssWBubgULhHdA8H4oFVGjPDgcLr8swKy
 L4F3ik6kQQKEdqxjzKFyji7hwNzMJ9M0nYO3snLnr2wST4Cpg/3pEu0QS+IAmrgF6dbL
 doVtrZaYJIuzVzLC8lYEHYzxMtKYYp5qyxVajH2OnZP6a2++O2SNdTOnWTKC+VrklNno
 rabtgrHaA+lijdcpSmwomjBXFuWW732mPqzD9/kIvChiXFYwrfRqLP7cypDYqjyr8hUb
 Gm1FoxLZG49E5LWaPcSYCAF7wsuus284/z5ZsmJjKBCjEcr5cn85nKoKNnsu8p9xcL10 oQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37agam48t9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 14:46:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 71CF6100034;
 Tue, 16 Mar 2021 14:46:43 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 494812336DD;
 Tue, 16 Mar 2021 14:46:43 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 16 Mar
 2021 14:46:42 +0100
To: Jagan Teki <jagan@amarulasolutions.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Matteo Lisi <matteo.lisi@engicam.com>
References: <20210315173256.103731-1-jagan@amarulasolutions.com>
 <20210315173256.103731-8-jagan@amarulasolutions.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <9586c314-a38f-3c7f-e592-88c39f35e8f1@foss.st.com>
Date: Tue, 16 Mar 2021 14:46:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210315173256.103731-8-jagan@amarulasolutions.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-16_04:2021-03-16,
 2021-03-16 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH v2 7/9] ARM: dts: stm32: Add Engicam
 MicroGEA STM32MP1 1X4Gb DDR3
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

Hi Jagan,

On 3/15/21 6:32 PM, Jagan Teki wrote:
> Engicam MicroGEA STM32MP1 Micro SOM has mounted 1x4Gb DDR3
> which has 16bits width 533Mhz frequency.
>
> Add DDR configurations via dtsi.
>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v2:
> - collect Patrice r-b
>
>   ...m32mp15-ddr3-microgea-1x4Gb-1066-binG.dtsi | 121 ++++++++++++++++++
>   1 file changed, 121 insertions(+)
>   create mode 100644 arch/arm/dts/stm32mp15-ddr3-microgea-1x4Gb-1066-binG.dtsi
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

This file is identical to stm32mp15-ddr3-1x4Gb-1066-binG.dtsi, because 
it is a files generated

with CubeMX with the same parameters.

Do you any reason to duplicate it ?

Do you expect some board-specific tuning or configuration with be 
integrated latter.

If it is not the case, I think you can reuse the file used by 
STMicroelectronics boards DK1/DK2

in the next patch.

#include "stm32mp15-ddr3-1x4Gb-1066-binG.dtsi"

Regards

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
