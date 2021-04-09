Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D6C3599FA
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 11:55:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59287C5719D;
	Fri,  9 Apr 2021 09:55:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F6ADC5718B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 09:55:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1399ko8f021917; Fri, 9 Apr 2021 11:55:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=XhbygquppaMXTrKcnKaOxI6M/EOYChlgrT5D2BMIKoE=;
 b=pejBojWlYXdP5PZV+7XeybvJOhY9bx3RNY97srs3LdkdF1sZehzh2cSf4OrRSUPQAu8N
 edwgHn3eCjc6Me6Rk3FktyDIdHRTgeT9d43DVWK/VzzB9ej/nfA2+awB28ZN/whuOF0K
 qx8z/nUsOmA8GA8cTLQ8A99kAzbYy2eG+q76dISvNhCzwWSLhkxUWR14jjxy7jtPQhaU
 ziBq+A44+xtzRgJh86Ah1mogXe+zGgVT8ONq9275Fy7Raf4B/oXiUZddk5Y6/wmYNghl
 IEKaDNmi/QAblg/2aPpnO1jmAdrwG8ikMMfZUsGTLYNDS4cS5ckLXsBD2Otnh2NPbtlm xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37tj4d94jf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 11:55:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B088310002A;
 Fri,  9 Apr 2021 11:55:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A353D2256DD;
 Fri,  9 Apr 2021 11:55:01 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Apr
 2021 11:55:01 +0200
To: Jagan Teki <jagan@amarulasolutions.com>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, Matteo Lisi <matteo.lisi@engicam.com>
References: <20210316162207.35641-1-jagan@amarulasolutions.com>
 <20210316162207.35641-6-jagan@amarulasolutions.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <70dff187-d7d0-530c-0893-aef18611e833@foss.st.com>
Date: Fri, 9 Apr 2021 11:55:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210316162207.35641-6-jagan@amarulasolutions.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_05:2021-04-09,
 2021-04-09 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH v3 5/8] board: stm32: Add Engicam i.Core
 STM32MP1 C.TOUCH 2.0
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

On 3/16/21 5:22 PM, Jagan Teki wrote:
> Engicam C.TOUCH 2.0 is an EDIMM compliant general purpose Carrier
> board.
> 
> Genaral features:
> - Ethernet 10/100
> - Wifi/BT
> - USB Type A/OTG
> - Audio Out
> - CAN
> - LVDS panel connector
> 
> i.Core STM32MP1 is an EDIMM SoM based on STM32MP157A from Engicam.
> 
> i.Core STM32MP1 needs to mount on top of this Carrier board for
> creating complete i.Core STM32MP1 C.TOUCH 2.0 board.
> 
> Linux dts commit details:
> 
> commit <6ca2898df59f> ("ARM: dts: stm32: Add Engicam i.Core STM32MP1
> C.TOUCH 2.0")
> 
> Add support for it.
> 
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v3:
> - collect Patrice r-b
> Changes for v2:
> - collect Patrice r-b
> - add linux dts commit
> - drop CONFIG_BOARD_EARLY_INIT_F
> 
>  arch/arm/dts/Makefile                         |  1 +
>  ...2mp157a-icore-stm32mp1-ctouch2-u-boot.dtsi | 51 ++++++++++++
>  .../stm32mp157a-icore-stm32mp1-ctouch2.dts    | 47 +++++++++++
>  arch/arm/mach-stm32mp/Kconfig                 |  5 ++
>  board/engicam/stm32mp1/MAINTAINERS            |  6 ++
>  ...stm32mp15-icore-stm32mp1-ctouch2_defconfig | 79 +++++++++++++++++++
>  6 files changed, 189 insertions(+)
>  create mode 100644 arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2-u-boot.dtsi
>  create mode 100644 arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2.dts
>  create mode 100644 configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
> 
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 9d13045f21..ce4521b891 100644
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -990,6 +990,7 @@ dtb-$(CONFIG_ARCH_STI) += stih410-b2260.dtb
>  dtb-$(CONFIG_STM32MP15x) += \
>  	stm32mp157a-dk1.dtb \
>  	stm32mp157a-avenger96.dtb \
> +	stm32mp157a-icore-stm32mp1-ctouch2.dtb \
>  	stm32mp157a-icore-stm32mp1-edimm2.2.dtb \
>  	stm32mp157c-dk2.dtb \
>  	stm32mp157c-ed1.dtb \
> diff --git a/arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2-u-boot.dtsi b/arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2-u-boot.dtsi
> new file mode 100644
> index 0000000000..96fe461235
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2-u-boot.dtsi
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
> + * Copyright (c) 2020 Amarula Solutions(India)
> + * Author: Jagan Teki <jagan@amarulasolutions.com>
> + */
> +
> +#include "stm32mp157a-icore-stm32mp1-u-boot.dtsi"
> +
> +/{
> +	aliases {
> +		mmc0 = &sdmmc1;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart4;
> +	};
> +};
> +
> +&sdmmc1 {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&sdmmc1_b4_pins_a {
> +	u-boot,dm-pre-reloc;
> +
> +	pins1 {
> +		u-boot,dm-pre-reloc;
> +	};
> +
> +	pins2 {
> +		u-boot,dm-pre-reloc;
> +	};
> +};
> +
> +&uart4 {
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&uart4_pins_a {
> +	u-boot,dm-pre-reloc;
> +
> +	pins1 {
> +		u-boot,dm-pre-reloc;
> +	};
> +
> +	pins2 {
> +		u-boot,dm-pre-reloc;
> +		bias-pull-up;
> +	};
> +};
> diff --git a/arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2.dts b/arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2.dts
> new file mode 100644
> index 0000000000..d3058a036c
> --- /dev/null
> +++ b/arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2.dts
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (c) STMicroelectronics 2019 - All Rights Reserved
> + * Copyright (c) 2020 Engicam srl
> + * Copyright (c) 2020 Amarula Solutons(India)
> + */
> +
> +/dts-v1/;
> +#include "stm32mp157.dtsi"
> +#include "stm32mp157a-icore-stm32mp1.dtsi"
> +#include "stm32mp15-pinctrl.dtsi"
> +#include "stm32mp15xxaa-pinctrl.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model = "Engicam i.Core STM32MP1 C.TOUCH 2.0";
> +	compatible = "engicam,icore-stm32mp1-ctouch2",
> +		     "engicam,icore-stm32mp1", "st,stm32mp157";
> +
> +	aliases {
> +		serial0 = &uart4;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&sdmmc1 {
> +	bus-width = <4>;
> +	disable-wp;
> +	pinctrl-names = "default", "opendrain", "sleep";
> +	pinctrl-0 = <&sdmmc1_b4_pins_a>;
> +	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
> +	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
> +	st,neg-edge;
> +	vmmc-supply = <&v3v3>;
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	pinctrl-names = "default", "sleep", "idle";
> +	pinctrl-0 = <&uart4_pins_a>;
> +	pinctrl-1 = <&uart4_sleep_pins_a>;
> +	pinctrl-2 = <&uart4_idle_pins_a>;
> +	status = "okay";
> +};
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index 8d1db70cc3..b809488ca3 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -96,6 +96,11 @@ config TARGET_ICORE_STM32MP1
>  	  * i.Core STM32MP1 needs to mount on top of EDIMM2.2 for
>  	    creating complete i.Core STM32MP1 EDIMM2.2 Starter Kit.
>  
> +	  i.Core STM32MP1 C.TOUCH 2.0
> +	  * C.TOUCH 2.0 is a general purpose Carrier board.
> +	  * i.Core STM32MP1 needs to mount on top of this Carrier board
> +	    for creating complete i.Core STM32MP1 C.TOUCH 2.0 board.
> +
>  config TARGET_DH_STM32MP1_PDK2
>  	bool "DH STM32MP1 PDK2"
>  	select STM32MP15x
> diff --git a/board/engicam/stm32mp1/MAINTAINERS b/board/engicam/stm32mp1/MAINTAINERS
> index 552c7332d8..736a32e165 100644
> --- a/board/engicam/stm32mp1/MAINTAINERS
> +++ b/board/engicam/stm32mp1/MAINTAINERS
> @@ -1,3 +1,9 @@
> +i.Core-STM32MP1-CTOUCH2.0
> +M:	Jagan Teki <jagan@amarulasolutions.com>
> +M:	Matteo Lisi <matteo.lisi@engicam.com>
> +S:	Maintained
> +F:	configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
> +
>  i.Core-STM32MP1-EDIMM2.2
>  M:	Jagan Teki <jagan@amarulasolutions.com>
>  M:	Matteo Lisi <matteo.lisi@engicam.com>
> diff --git a/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig b/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
> new file mode 100644
> index 0000000000..55f9fb9427
> --- /dev/null
> +++ b/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
> @@ -0,0 +1,79 @@
> +CONFIG_ARM=y
> +CONFIG_ARCH_STM32MP=y
> +CONFIG_SYS_MALLOC_F_LEN=0x3000
> +CONFIG_SYS_MEMTEST_START=0xc0000000
> +CONFIG_SYS_MEMTEST_END=0xc4000000
> +CONFIG_ENV_OFFSET=0x280000
> +CONFIG_SPL_TEXT_BASE=0x2FFC2500
> +CONFIG_SPL_MMC_SUPPORT=y
> +CONFIG_SPL=y
> +CONFIG_TARGET_ICORE_STM32MP1=y
> +CONFIG_ENV_OFFSET_REDUND=0x2C0000
> +# CONFIG_ARMV7_VIRT is not set
> +CONFIG_DEFAULT_DEVICE_TREE="stm32mp157a-icore-stm32mp1-ctouch2"
> +CONFIG_DISTRO_DEFAULTS=y
> +CONFIG_FIT=y
> +CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
> +CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=y
> +CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=3
> +CONFIG_SPL_ENV_SUPPORT=y
> +CONFIG_SPL_I2C_SUPPORT=y
> +CONFIG_SPL_POWER_SUPPORT=y
> +CONFIG_SYS_PROMPT="STM32MP> "
> +CONFIG_CMD_ADTIMG=y
> +CONFIG_CMD_ERASEENV=y
> +CONFIG_CMD_MEMINFO=y
> +CONFIG_CMD_MEMTEST=y
> +CONFIG_CMD_ADC=y
> +CONFIG_CMD_CLK=y
> +CONFIG_CMD_FUSE=y
> +CONFIG_CMD_GPIO=y
> +CONFIG_CMD_I2C=y
> +CONFIG_CMD_MMC=y
> +CONFIG_CMD_REMOTEPROC=y
> +CONFIG_CMD_CACHE=y
> +CONFIG_CMD_TIME=y
> +CONFIG_CMD_TIMER=y
> +CONFIG_CMD_PMIC=y
> +CONFIG_CMD_REGULATOR=y
> +CONFIG_CMD_EXT4_WRITE=y
> +# CONFIG_SPL_DOS_PARTITION is not set
> +CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks"
> +CONFIG_ENV_IS_NOWHERE=y
> +CONFIG_ENV_IS_IN_MMC=y
> +CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
> +CONFIG_SYS_RELOC_GD_ENV_ADDR=y
> +# CONFIG_SPL_ENV_IS_NOWHERE is not set
> +CONFIG_DM_HWSPINLOCK=y
> +CONFIG_HWSPINLOCK_STM32=y
> +CONFIG_DM_I2C=y
> +CONFIG_SYS_I2C_STM32F7=y
> +CONFIG_LED=y
> +CONFIG_LED_GPIO=y
> +CONFIG_DM_MAILBOX=y
> +CONFIG_STM32_IPCC=y
> +CONFIG_STM32_FMC2_EBI=y
> +CONFIG_DM_MMC=y
> +CONFIG_SUPPORT_EMMC_BOOT=y
> +CONFIG_STM32_SDMMC2=y
> +CONFIG_PHY_REALTEK=y
> +CONFIG_DM_ETH=y
> +CONFIG_DWC_ETH_QOS=y
> +CONFIG_PHY=y
> +CONFIG_PINCONF=y
> +# CONFIG_SPL_PINCTRL_FULL is not set
> +CONFIG_PINCTRL_STMFX=y
> +CONFIG_DM_PMIC=y
> +# CONFIG_SPL_PMIC_CHILDREN is not set
> +CONFIG_PMIC_STPMIC1=y
> +CONFIG_DM_REGULATOR=y
> +CONFIG_DM_REGULATOR_FIXED=y
> +CONFIG_DM_REGULATOR_GPIO=y
> +CONFIG_REMOTEPROC_STM32_COPRO=y
> +CONFIG_DM_RTC=y
> +CONFIG_RTC_STM32=y
> +CONFIG_SERIAL_RX_BUFFER=y
> +CONFIG_WDT=y
> +CONFIG_WDT_STM32MP=y
> +CONFIG_LZO=y
> +CONFIG_ERRNO_STR=y
> 
Applied to u-boot-stm/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
