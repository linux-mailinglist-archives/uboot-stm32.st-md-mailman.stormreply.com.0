Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E2233D52E
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Mar 2021 14:51:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37F1BC57B77;
	Tue, 16 Mar 2021 13:51:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B78C1C56632
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 13:51:28 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12GDpCTO031795; Tue, 16 Mar 2021 14:51:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=PfcrSAQ9Es9BW1Qk716wLd4odHX+9Kg9zTrZ3xriE0U=;
 b=FPdR5Ny8lf3uQfRcsP5hmpFZbkpQ6PmxSD1cnN/5H4EgVjaD2vm1wxLNrXZtXqI/1LFI
 6U4wXtYLdEmVblhGkepXvKVHbxfGQcqc2Jk9gBj7ZC7vCQRgIvEdY1O2SIAi3eY5oqkK
 rwJ8UD+DcWJ93fxsajgNNMtLyFFxXtDssilkUbFCTiA+lz1+lx1ZmtCnmwgdIOxLs2HO
 YUWScciZU+011NzMcrojsvYuVgqHs/X2SDBRs2cyHeaWVzRUJdWCavt/Dp/cq3SdbP+L
 F25kaHbUDHu3qCc2ZjyH+FKvP09TF+w6tady1iA55zIEC+v78nmj1CMI9vBSXREHnefA pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 378ps9gt7j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 14:51:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 99E7410002A;
 Tue, 16 Mar 2021 14:51:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 71A612336F9;
 Tue, 16 Mar 2021 14:51:23 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 16 Mar
 2021 14:51:22 +0100
To: Jagan Teki <jagan@amarulasolutions.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Matteo Lisi <matteo.lisi@engicam.com>
References: <20210315173256.103731-1-jagan@amarulasolutions.com>
 <20210315173256.103731-9-jagan@amarulasolutions.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <e0cdb222-4d5d-215c-836d-5bd4a1fef182@foss.st.com>
Date: Tue, 16 Mar 2021 14:51:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210315173256.103731-9-jagan@amarulasolutions.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-16_04:2021-03-16,
 2021-03-16 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH v2 8/9] board: stm32: Add Engicam MicroGEA
 STM32MP1 MicroDev 2.0 board
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


On 3/15/21 6:32 PM, Jagan Teki wrote:
> MicroDev 2.0 is a general purpose miniature carrier board with CAN,
> LTE and LVDS panel interfaces.
>
> Genaral features:
> - Ethernet 10/100
> - USB Type A
> - Audio Out
> - microSD
> - LVDS panel connector
> - Wifi/BT (option)
> - UMTS LTE with sim connector (option)
>
> MicroGEA STM32MP1 is a STM32MP157A based Micro SoM.
>
> MicroGEA STM32MP1 needs to mount on top of this MicroDev 2.0 board
> for creating complete MicroGEA STM32MP1 MicroDev 2.0 Carrier board.
>
> Linux dts commit details:
>
> commit <f838dae7afd0> ("ARM: dts: stm32: Add Engicam MicroGEA STM32MP1
> MicroDev 2.0 board")
>
> Add support for it.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v2:
> - collect Patrice r-b
> - add linux dts commit
> - drop CONFIG_BOARD_EARLY_INIT_F
>
>   arch/arm/dts/Makefile                         |   1 +
>   ...-microgea-stm32mp1-microdev2.0-u-boot.dtsi |  51 ++++++++
>   ...32mp157a-microgea-stm32mp1-microdev2.0.dts |  55 ++++++++
>   .../stm32mp157a-microgea-stm32mp1-u-boot.dtsi | 118 ++++++++++++++++++
>   arch/arm/mach-stm32mp/Kconfig                 |  20 +++
>   board/engicam/stm32mp1/Kconfig                |   2 +-
>   board/engicam/stm32mp1/MAINTAINERS            |   6 +
>   ...mp15-microgea-stm32mp1-microdev2_defconfig |  79 ++++++++++++
>   8 files changed, 331 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-u-boot.dtsi
>   create mode 100644 arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts
>   create mode 100644 arch/arm/dts/stm32mp157a-microgea-stm32mp1-u-boot.dtsi
>   create mode 100644 configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
>
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index ce4521b891..64d73b96ef 100644
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -992,6 +992,7 @@ dtb-$(CONFIG_STM32MP15x) += \
>   	stm32mp157a-avenger96.dtb \
>   	stm32mp157a-icore-stm32mp1-ctouch2.dtb \
>   	stm32mp157a-icore-stm32mp1-edimm2.2.dtb \
> +	stm32mp157a-microgea-stm32mp1-microdev2.0.dtb \
>   	stm32mp157c-dk2.dtb \
>   	stm32mp157c-ed1.dtb \
>   	stm32mp157c-ev1.dtb \
...
> diff --git a/arch/arm/dts/stm32mp157a-microgea-stm32mp1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-microgea-stm32mp1-u-boot.dtsi
> new file mode 100644
> index 0000000000..32ce31458a
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp157a-microgea-stm32mp1-u-boot.dtsi
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
> + * Copyright (c) 2020 Amarula Solutions(India)
> + * Author: Jagan Teki <jagan@amarulasolutions.com>
> + */
> +
> +#include <dt-bindings/clock/stm32mp1-clksrc.h>
> +#include "stm32mp15-u-boot.dtsi"
> +#include "stm32mp15-ddr3-microgea-1x4Gb-1066-binG.dtsi"

#include "stm32mp15-ddr3-1x4Gb-1066-binG.dtsi" ?


Anyway:


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
