Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0D1211C6C
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 09:07:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C72FAC36B24
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 07:07:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C60D0C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 07:07:22 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 062750fY017281; Thu, 2 Jul 2020 09:07:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=+2ro9CmFiH/1sSE9OhRNlAHTq0+fQeDseukXnZ4gVqM=;
 b=faVG9gLHzl9KSwMUkOMqRiBWj6IOCl21TxdHUzIBTMk/Ks2BZSzXO2KszdGr6styJ6j2
 X0vRYuPt0CzovQxFbiRIndIkLziFAt/Dpdm2VLueBVIuH6bhHpO3FANHKMHdyhAiZYbJ
 AvH4pmqnDnEQP7Ix0zLHsoGbbi6d0u7XulO8D4/PFjOMG8ah3P9xojoQ97DwJsM8lfGt
 SpQmNebAJG58i6ZqilCTcQUXJz1JbC8ub3qv6TZkyQmEr/3ZhSWC9GfI9+LMzKBlyYNs
 jt6F7Hf2lZTClcVJMhhmKYl6zszY1zRuoKtvdNRSOpWZtl0nQfrdnKGiO+9B2JyX48GN yA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuvwebsp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 09:07:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1D4E2100034;
 Thu,  2 Jul 2020 09:07:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 09B0D2124D6;
 Thu,  2 Jul 2020 09:07:18 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 2 Jul
 2020 09:07:17 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 09:07:17 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] board: st: move type-c stusb1600 controller code in a
 driver
Thread-Index: AQHWTfAT5r8jGpMmjUeNBEutFb/yvajzwW+A
Date: Thu, 2 Jul 2020 07:07:17 +0000
Message-ID: <d06f3713-0a26-ba67-4c99-76dd55bb9b55@st.com>
References: <20200629103404.1.Ic3786ee11f56ca7e32d47d816a3cc0db2e87d6b2@changeid>
In-Reply-To: <20200629103404.1.Ic3786ee11f56ca7e32d47d816a3cc0db2e87d6b2@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <270AA3EF79A11B488E43FED25B27C038@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: Marek Vasut <marex@denx.de>, "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] board: st: move type-c stusb1600
 controller code in a driver
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

On 6/29/20 10:34 AM, Patrick Delaunay wrote:
> Migrate the ST Microelectronics STUSB160X Type-C controller code in
> a generic I2C driver in st/common, based on Linux one in :
> drivers/usb/typec/stusb160x.c
>
> This patch simplifies the stm32mp1 board code and allows to reuse
> this STUSB160X driver in other boards.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/st/common/Kconfig             |  7 ++++
>  board/st/common/Makefile            |  2 +
>  board/st/common/stusb160x.c         | 46 +++++++++++++++++++++++
>  board/st/common/stusb160x.h         | 10 +++++
>  board/st/stm32mp1/stm32mp1.c        | 58 +++--------------------------
>  configs/stm32mp15_basic_defconfig   |  1 +
>  configs/stm32mp15_trusted_defconfig |  1 +
>  7 files changed, 73 insertions(+), 52 deletions(-)
>  create mode 100644 board/st/common/stusb160x.c
>  create mode 100644 board/st/common/stusb160x.h
>
> diff --git a/board/st/common/Kconfig b/board/st/common/Kconfig
> index 015ba40939..5280d0f9ed 100644
> --- a/board/st/common/Kconfig
> +++ b/board/st/common/Kconfig
> @@ -69,3 +69,10 @@ config DFU_ALT_RAM0
>  	depends on ARCH_STM32MP && SET_DFU_ALT_INFO
>  	help
>  	  This defines the partitions of ram used to build dfu dynamically.
> +
> +config TYPEC_STUSB160X
> +	tristate "STMicroelectronics STUSB160X Type-C controller driver"
> +	depends on DM_I2C
> +	help
> +	  Say Y if your system has STMicroelectronics STUSB160X Type-C port
> +	  controller.
> diff --git a/board/st/common/Makefile b/board/st/common/Makefile
> index aa030bacd8..1a5280e139 100644
> --- a/board/st/common/Makefile
> +++ b/board/st/common/Makefile
> @@ -9,3 +9,5 @@ ifeq ($(CONFIG_ARCH_STM32MP),y)
>  obj-$(CONFIG_SYS_MTDPARTS_RUNTIME) += stm32mp_mtdparts.o
>  obj-$(CONFIG_SET_DFU_ALT_INFO) += stm32mp_dfu.o
>  endif
> +
> +obj-$(CONFIG_TYPEC_STUSB160X) += stusb160x.o
> diff --git a/board/st/common/stusb160x.c b/board/st/common/stusb160x.c
> new file mode 100644
> index 0000000000..f1197f9faa
> --- /dev/null
> +++ b/board/st/common/stusb160x.c
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +/*
> + * STMicroelectronics STUSB Type-C controller driver
> + * based on Linux drivers/usb/typec/stusb160x.c
> + *
> + * Copyright (C) 2020, STMicroelectronics - All Rights Reserved
> + */
> +
> +#include <common.h>
> +#include <dm.h>
> +#include <i2c.h>
> +
> +/* REGISTER */
> +#define STUSB160X_CC_CONNECTION_STATUS		0x0E
> +
> +/* STUSB160X_CC_CONNECTION_STATUS bitfields */
> +#define STUSB160X_CC_ATTACH			BIT(0)
> +
> +int stusb160x_cable_connected(void)
> +{
> +	struct udevice *dev;
> +	int ret;
> +
> +	ret = uclass_get_device_by_driver(UCLASS_I2C_GENERIC,
> +					  DM_GET_DRIVER(stusb160x),
> +					  &dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = dm_i2c_reg_read(dev, STUSB160X_CC_CONNECTION_STATUS);
> +	if (ret < 0)
> +		return 0;
> +
> +	return ret & STUSB160X_CC_ATTACH;
> +}
> +
> +static const struct udevice_id stusb160x_ids[] = {
> +	{ .compatible = "st,stusb1600" },
> +	{}
> +};
> +
> +U_BOOT_DRIVER(stusb160x) = {
> +	.name = "stusb160x",
> +	.id = UCLASS_I2C_GENERIC,
> +	.of_match = stusb160x_ids,
> +};
> diff --git a/board/st/common/stusb160x.h b/board/st/common/stusb160x.h
> new file mode 100644
> index 0000000000..fe39840b41
> --- /dev/null
> +++ b/board/st/common/stusb160x.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020, STMicroelectronics
> + */
> +
> +#ifdef CONFIG_TYPEC_STUSB160X
> +int stusb160x_cable_connected(void);
> +#else
> +int stusb160x_cable_connected(void) { return -ENODEV; }
> +#endif
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 4553329b25..a257375807 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -41,6 +41,8 @@
>  #include <power/regulator.h>
>  #include <usb/dwc2_udc.h>
>  
> +#include "../../st/common/stusb160x.h"
> +
>  /* SYSCFG registers */
>  #define SYSCFG_BOOTR		0x00
>  #define SYSCFG_PMCSETR		0x04
> @@ -175,64 +177,16 @@ static void board_key_check(void)
>  }
>  
>  #if defined(CONFIG_USB_GADGET) && defined(CONFIG_USB_GADGET_DWC2_OTG)
> -
> -/* STMicroelectronics STUSB1600 Type-C controller */
> -#define STUSB1600_CC_CONNECTION_STATUS		0x0E
> -
> -/* STUSB1600_CC_CONNECTION_STATUS bitfields */
> -#define STUSB1600_CC_ATTACH			BIT(0)
> -
> -static int stusb1600_init(struct udevice **dev_stusb1600)
> -{
> -	ofnode node;
> -	struct udevice *dev, *bus;
> -	int ret;
> -	u32 chip_addr;
> -
> -	*dev_stusb1600 = NULL;
> -
> -	/* if node stusb1600 is present, means DK1 or DK2 board */
> -	node = ofnode_by_compatible(ofnode_null(), "st,stusb1600");
> -	if (!ofnode_valid(node))
> -		return -ENODEV;
> -
> -	ret = ofnode_read_u32(node, "reg", &chip_addr);
> -	if (ret)
> -		return -EINVAL;
> -
> -	ret = uclass_get_device_by_ofnode(UCLASS_I2C, ofnode_get_parent(node),
> -					  &bus);
> -	if (ret) {
> -		printf("bus for stusb1600 not found\n");
> -		return -ENODEV;
> -	}
> -
> -	ret = dm_i2c_probe(bus, chip_addr, 0, &dev);
> -	if (!ret)
> -		*dev_stusb1600 = dev;
> -
> -	return ret;
> -}
> -
> -static int stusb1600_cable_connected(struct udevice *dev)
> -{
> -	u8 status;
> -
> -	if (dm_i2c_read(dev, STUSB1600_CC_CONNECTION_STATUS, &status, 1))
> -		return 0;
> -
> -	return status & STUSB1600_CC_ATTACH;
> -}
> -
>  #include <usb/dwc2_udc.h>
>  int g_dnl_board_usb_cable_connected(void)
>  {
> -	struct udevice *stusb1600;
>  	struct udevice *dwc2_udc_otg;
>  	int ret;
>  
> -	if (!stusb1600_init(&stusb1600))
> -		return stusb1600_cable_connected(stusb1600);
> +	/* if typec stusb160x is present, means DK1 or DK2 board */
> +	ret = stusb160x_cable_connected();
> +	if (ret >= 0)
> +		return ret;
>  
>  	ret = uclass_get_device_by_driver(UCLASS_USB_GADGET_GENERIC,
>  					  DM_GET_DRIVER(dwc2_udc_otg),
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index c7dd2926c9..7d41606a98 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -8,6 +8,7 @@ CONFIG_SPL_MMC_SUPPORT=y
>  CONFIG_SPL=y
>  CONFIG_TARGET_ST_STM32MP15x=y
>  CONFIG_CMD_STM32PROG=y
> +CONFIG_TYPEC_STUSB160X=y
>  CONFIG_ENV_OFFSET_REDUND=0x2C0000
>  CONFIG_SPL_SPI_FLASH_SUPPORT=y
>  CONFIG_SPL_SPI_SUPPORT=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index ca4a10813b..decdc2c1de 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -6,6 +6,7 @@ CONFIG_ENV_OFFSET=0x280000
>  CONFIG_ENV_SECT_SIZE=0x40000
>  CONFIG_TARGET_ST_STM32MP15x=y
>  CONFIG_CMD_STM32PROG=y
> +CONFIG_TYPEC_STUSB160X=y
>  CONFIG_ENV_OFFSET_REDUND=0x2C0000
>  CONFIG_DISTRO_DEFAULTS=y
>  CONFIG_FIT=y

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
