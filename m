Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE5E213493
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 09:02:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10EA9C36B24
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 07:02:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19E8AC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jul 2020 07:01:57 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0636tBOT027631; Fri, 3 Jul 2020 09:01:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=zDvtjNX98mX8h8TCPAcBK03UOe8mC98ekveEEL8RIgo=;
 b=GYPskeTD1m09+BSjsWRgW1Xou47lxBvD1VURGCnCXArJinWD8JO9P3EubeXTThWeps73
 i3y/i3ceOHChU/YfjFeAtA9jChiknv+Jtg35GAcmB6dSmSF1+fz36co9r7iobpwXICw4
 M6c0IHgtI5BQKGNh6e+3TlUlukRFgHZP8716ku5DntEwEYtl1tICGSbuIi4agAoG4WP0
 FISr4rwESwlho5bE85vMX26T4x9pARjdoYg9+b/rRAT/CRONejbEeEJzYivi++86KvLC
 Ntz8dLk2SFODR2Ms7nPp11E43cGQ6gM4n1c0QtwOv8ce7PrLp1YRmUJ+ygfzGWnlK2DM Bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31ww0gn1xp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 09:01:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 482DD100034;
 Fri,  3 Jul 2020 09:01:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 36CB42067E6;
 Fri,  3 Jul 2020 09:01:53 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 3 Jul
 2020 09:01:52 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 3 Jul 2020 09:01:52 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 6/9] board: st: stpmic1: add function stpmic1_init
Thread-Index: AQHWMn4LGN6WtZk050Od6Ev9Sv6GfKj1iSOA
Date: Fri, 3 Jul 2020 07:01:52 +0000
Message-ID: <1496a21c-996e-223e-36b9-3e1c8f08e585@st.com>
References: <20200525101949.15944-1-patrick.delaunay@st.com>
 <20200525101949.15944-7-patrick.delaunay@st.com>
In-Reply-To: <20200525101949.15944-7-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <E092C09BB09196469E2C8EF122189F47@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-03_02:2020-07-02,
 2020-07-03 signatures=0
Cc: Marek Vasut <marex@denx.de>, "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 6/9] board: st: stpmic1: add function
	stpmic1_init
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

On 5/25/20 12:19 PM, Patrick Delaunay wrote:
> Add a function stmpic_init to early initialize the PMIC STPMIC1
> - keep vdd on during the reset cycle (to avoid issue when backup battery
>   is absent)
> - Check if debug is enabled to program PMIC according to the bit
>
> This patch allows to remove the compilation of spl.c file from stm32mp1
> board in dh_stm32mp1.
>
> CONFIG_SPL_BOARD_INIT is removed as the new function is called earlier
> in SPL, in the function board_early_init_f.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - add stpmic1_init function, called in board_early_init_f for
>   dh_stm32mp1 board support (and no more use spl.c from stm32mp1)
> - remove CONFIG_SPL_BOARD_INIT
>
>  arch/arm/mach-stm32mp/Kconfig            |  1 -
>  board/dhelectronics/dh_stm32mp1/Makefile |  4 ---
>  board/dhelectronics/dh_stm32mp1/board.c  |  3 ++
>  board/st/common/stpmic1.c                | 31 +++++++++++++++++++
>  board/st/common/stpmic1.h                |  6 ++++
>  board/st/stm32mp1/spl.c                  | 39 +++---------------------
>  board/st/stm32mp1/stm32mp1.c             |  6 ++++
>  configs/stm32mp15_basic_defconfig        |  1 +
>  8 files changed, 52 insertions(+), 39 deletions(-)
>  create mode 100644 board/st/common/stpmic1.h
>
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index 6c995ed8d8..ea7d57477b 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -1,7 +1,6 @@
>  if ARCH_STM32MP
>  
>  config SPL
> -	select SPL_BOARD_INIT
>  	select SPL_CLK
>  	select SPL_DM
>  	select SPL_DM_SEQ_ALIAS
> diff --git a/board/dhelectronics/dh_stm32mp1/Makefile b/board/dhelectronics/dh_stm32mp1/Makefile
> index 5758d9816b..b368b396a4 100644
> --- a/board/dhelectronics/dh_stm32mp1/Makefile
> +++ b/board/dhelectronics/dh_stm32mp1/Makefile
> @@ -3,10 +3,6 @@
>  # Copyright (C) 2018, STMicroelectronics - All Rights Reserved
>  #
>  
> -ifdef CONFIG_SPL_BUILD
> -obj-y += ../../st/stm32mp1/spl.o
> -endif
> -
>  obj-y += ../../st/common/stpmic1.o board.o
>  
>  obj-$(CONFIG_SYS_MTDPARTS_RUNTIME) += ../../st/common/stm32mp_mtdparts.o
> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
> index 85d56f6082..df0810dbda 100644
> --- a/board/dhelectronics/dh_stm32mp1/board.c
> +++ b/board/dhelectronics/dh_stm32mp1/board.c
> @@ -37,6 +37,7 @@
>  #include <usb.h>
>  #include <usb/dwc2_udc.h>
>  #include <watchdog.h>
> +#include "../../st/common/stpmic1.h"
>  
>  /* SYSCFG registers */
>  #define SYSCFG_BOOTR		0x00
> @@ -194,6 +195,8 @@ int board_stm32mp1_ddr_config_name_match(struct udevice *dev,
>  
>  int board_early_init_f(void)
>  {
> +	if (IS_ENABLED(CONFIG_SPL_BUILD))
> +		stpmic1_init();
>  	board_get_coding_straps();
>  
>  	return 0;
> diff --git a/board/st/common/stpmic1.c b/board/st/common/stpmic1.c
> index ca10a2246b..64f24f1f6f 100644
> --- a/board/st/common/stpmic1.c
> +++ b/board/st/common/stpmic1.c
> @@ -5,6 +5,7 @@
>  
>  #include <common.h>
>  #include <dm.h>
> +#include <asm/io.h>
>  #include <asm/arch/ddr.h>
>  #include <power/pmic.h>
>  #include <power/stpmic1.h>
> @@ -160,3 +161,33 @@ int board_ddr_power_init(enum ddr_type ddr_type)
>  
>  	return 0;
>  }
> +
> +/* early init of PMIC */
> +void stpmic1_init(void)
> +{
> +	struct udevice *dev;
> +
> +	if (uclass_get_device_by_driver(UCLASS_PMIC,
> +					DM_GET_DRIVER(pmic_stpmic1), &dev))
> +		return;
> +
> +	/* Keep vdd on during the reset cycle */
> +	pmic_clrsetbits(dev,
> +			STPMIC1_BUCKS_MRST_CR,
> +			STPMIC1_MRST_BUCK(STPMIC1_BUCK3),
> +			STPMIC1_MRST_BUCK(STPMIC1_BUCK3));
> +
> +	/* Check if debug is enabled to program PMIC according to the bit */
> +	if (readl(TAMP_BOOT_CONTEXT) & TAMP_BOOT_DEBUG_ON) {
> +		printf("Keep debug unit ON\n");
> +
> +		pmic_clrsetbits(dev, STPMIC1_BUCKS_MRST_CR,
> +				STPMIC1_MRST_BUCK_DEBUG,
> +				STPMIC1_MRST_BUCK_DEBUG);
> +
> +		if (STPMIC1_MRST_LDO_DEBUG)
> +			pmic_clrsetbits(dev, STPMIC1_LDOS_MRST_CR,
> +					STPMIC1_MRST_LDO_DEBUG,
> +					STPMIC1_MRST_LDO_DEBUG);
> +	}
> +}
> diff --git a/board/st/common/stpmic1.h b/board/st/common/stpmic1.h
> new file mode 100644
> index 0000000000..ecc3276697
> --- /dev/null
> +++ b/board/st/common/stpmic1.h
> @@ -0,0 +1,6 @@
> +/* SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause */
> +/*
> + * Copyright (C) 2020, STMicroelectronics - All Rights Reserved
> + */
> +
> +void stpmic1_init(void);
> diff --git a/board/st/stm32mp1/spl.c b/board/st/stm32mp1/spl.c
> index e65ff288ea..28efc5c0ae 100644
> --- a/board/st/stm32mp1/spl.c
> +++ b/board/st/stm32mp1/spl.c
> @@ -5,41 +5,12 @@
>  
>  #include <config.h>
>  #include <common.h>
> -#include <spl.h>
> -#include <dm.h>
> -#include <ram.h>
> -#include <asm/io.h>
> -#include <power/pmic.h>
> -#include <power/stpmic1.h>
> -#include <asm/arch/ddr.h>
> +#include "../common/stpmic1.h"
>  
> -void spl_board_init(void)
> +int board_early_init_f(void)
>  {
> -	/* Keep vdd on during the reset cycle */
> -#if defined(CONFIG_PMIC_STPMIC1) && defined(CONFIG_SPL_POWER_SUPPORT)
> -	struct udevice *dev;
> -	int ret;
> +	if (IS_ENABLED(CONFIG_PMIC_STPMIC1) && CONFIG_IS_ENABLED(POWER_SUPPORT))
> +		stpmic1_init();
>  
> -	ret = uclass_get_device_by_driver(UCLASS_PMIC,
> -					  DM_GET_DRIVER(pmic_stpmic1), &dev);
> -	if (!ret)
> -		pmic_clrsetbits(dev,
> -				STPMIC1_BUCKS_MRST_CR,
> -				STPMIC1_MRST_BUCK(STPMIC1_BUCK3),
> -				STPMIC1_MRST_BUCK(STPMIC1_BUCK3));
> -
> -	/* Check if debug is enabled to program PMIC according to the bit */
> -	if ((readl(TAMP_BOOT_CONTEXT) & TAMP_BOOT_DEBUG_ON) && !ret) {
> -		printf("Keep debug unit ON\n");
> -
> -		pmic_clrsetbits(dev, STPMIC1_BUCKS_MRST_CR,
> -				STPMIC1_MRST_BUCK_DEBUG,
> -				STPMIC1_MRST_BUCK_DEBUG);
> -
> -		if (STPMIC1_MRST_LDO_DEBUG)
> -			pmic_clrsetbits(dev, STPMIC1_LDOS_MRST_CR,
> -					STPMIC1_MRST_LDO_DEBUG,
> -					STPMIC1_MRST_LDO_DEBUG);
> -	}
> -#endif
> +	return 0;
>  }
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 33cb7f6c4d..22ad2dba9a 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -79,6 +79,12 @@ DECLARE_GLOBAL_DATA_PTR;
>  #define USB_START_LOW_THRESHOLD_UV	1230000
>  #define USB_START_HIGH_THRESHOLD_UV	2150000
>  
> +int board_early_init_f(void)
> +{
> +	/* nothing to do, only used in SPL */
> +	return 0;
> +}
> +
>  int checkboard(void)
>  {
>  	int ret;
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index c7dd2926c9..628cde6cda 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -16,6 +16,7 @@ CONFIG_SPL_TEXT_BASE=0x2FFC2500
>  CONFIG_DISTRO_DEFAULTS=y
>  CONFIG_FIT=y
>  CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
> +CONFIG_BOARD_EARLY_INIT_F=y
>  CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=y
>  CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=3
>  CONFIG_SPL_I2C_SUPPORT=y

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
