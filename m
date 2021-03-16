Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BBF33D59C
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Mar 2021 15:21:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D85E0C57B77;
	Tue, 16 Mar 2021 14:21:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F874C56632
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 14:21:11 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12GEHesC028790; Tue, 16 Mar 2021 15:21:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=K8DepiQkmltG3xnp6b7hprz4apno50aMvEyKVkBFiGQ=;
 b=gMEIRuahra/d4ZLrybmeHsIxvNRhMcIMsT1zBUTLdsFAmw941818blsAPGIns9XpT5j4
 UyoxvxNFV0Xx9pHyu2tuwJieJ7oNei65YhvsmYDUyc1ndKTKIT1kjkkpOvzgHbn83ywV
 MXYh68KSiT2eRnb9oMdkqGuw8Rzso6yDQsR7mmzlyO0YbfEmu6I8jnLc0m7hzvAe18ZU
 hPPD4gF3kLcDaTcZDntCwY8g0hoqY+izSxWKCaMh/Pxm6SwZIXZ6CT1wCrrieQb3iFBr
 FQqP4VUdO+xOebl3PI2dTbFHScGGdFZ9EfeVe6tDkMLm95R/rpfORyatWYIRnaxEfA3P gA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37a8pqxq64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 15:21:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D7FA210002A;
 Tue, 16 Mar 2021 15:21:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 89D47227870;
 Tue, 16 Mar 2021 15:21:06 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 16 Mar
 2021 15:21:05 +0100
To: Jagan Teki <jagan@amarulasolutions.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Matteo Lisi <matteo.lisi@engicam.com>
References: <20210315173256.103731-1-jagan@amarulasolutions.com>
 <20210315173256.103731-10-jagan@amarulasolutions.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <2726fcf6-6571-0028-9d2e-405b6c10b1b2@foss.st.com>
Date: Tue, 16 Mar 2021 15:21:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210315173256.103731-10-jagan@amarulasolutions.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-16_04:2021-03-16,
 2021-03-16 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH v2 9/9] board: stm32: Add Engicam MicroGEA
 STM32MP1 MicroDev 2.0 7" OF
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
> 7" OF is a capacitive touch 7" Open Frame panel solutions with
> - 7" AUO B101AW03 LVDS panel
> - EDT, FT5526 Touch
>
> MicroGEA STM32MP1 is a STM32MP157A based Micro SoM.
>
> MicroDev 2.0 is a general purpose miniature carrier board with CAN,
> LTE and LVDS panel interfaces.
>
> MicroGEA STM32MP1 needs to mount on top of MicroDev 2.0 board with
> pluged 7" OF for creating complete MicroGEA STM32MP1 MicroDev 2.0
> 7" Open Frame Solution board.
>
> Linux dts commit details:
>
> commit <1d278204cbaa> ("ARM: dts: stm32: Add Engicam MicroGEA STM32MP1
> MicroDev 2.0 7" OF")
>
> Add support for it.
>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v2:
> - collect Patrice r-b
> - add linux dts commit
> - drop CONFIG_BOARD_EARLY_INIT_F
>
>   arch/arm/dts/Makefile                         |   1 +
>   ...rogea-stm32mp1-microdev2.0-of7-u-boot.dtsi |  51 ++++++
>   ...157a-microgea-stm32mp1-microdev2.0-of7.dts | 154 ++++++++++++++++++
>   arch/arm/mach-stm32mp/Kconfig                 |   7 +
>   board/engicam/stm32mp1/MAINTAINERS            |   6 +
>   ...-microgea-stm32mp1-microdev2-of7_defconfig |  79 +++++++++
>   6 files changed, 298 insertions(+)
>   create mode 100644 arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7-u-boot.dtsi
>   create mode 100644 arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
>   create mode 100644 configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
>
...

> diff --git a/board/engicam/stm32mp1/MAINTAINERS b/board/engicam/stm32mp1/MAINTAINERS
> index c0bb767782..712e312665 100644
> --- a/board/engicam/stm32mp1/MAINTAINERS
> +++ b/board/engicam/stm32mp1/MAINTAINERS
> @@ -4,6 +4,12 @@ M:	Matteo Lisi <matteo.lisi@engicam.com>
>   S:	Maintained
>   F:	configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
>   
> +MicroGEA-STM32MP1-MICRODEV2.0-OF7
> +M:	Jagan Teki <jagan@amarulasolutions.com>
> +M:	Matteo Lisi <matteo.lisi@engicam.com>
> +S:	Maintained
> +F:	configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
> +

minor: you can add the also added device tree in MAINTAINERS

+F:	arch/arm/dts/stm32mp15*microgea*


Anyway


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
