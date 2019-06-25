Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DE75266A
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 10:22:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6665C5F1FD
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 08:22:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B34DC5F1FC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2019 08:22:49 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5P8LNZS028691; Tue, 25 Jun 2019 10:22:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=IZ+JFnoc0jylGBN0mTT4HiRO5sQNBvlS7/2G8SN5/7Y=;
 b=H/CeXzYeYkw5OGbQIBR9rMfMfW1o6xtjyjxFOUoVLZf7KKObw0CMe1+8Hxc35P6+s/OH
 CaswoihjAAC1MPwSbZ0lXFUT1OCDpNXzBQnmR4w+oof6uszkn31Uki68iMPHwDztMCvN
 0JSoaCWr24Z9vBo5D5dDmU0koZAZOUL3zunDePAMlYoGyXbSgEbz1MUNPvSFmJBM7oW/
 tOq8gWEOqw6Q8UxPXWIXyKwp9YgT/QOtSNJtFk2n+l141ZesnNXKrWhJttbuCh4OAAA8
 yGMzFT8DGRo8qA9ykDQz9maamiP9avkULG3wX7fNF7zS8OhaICmv42HecHg0cJA8Rc4w uQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tb1f3m0tb-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 25 Jun 2019 10:22:37 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 60AF834;
 Tue, 25 Jun 2019 08:22:36 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 34DEC23E5;
 Tue, 25 Jun 2019 08:22:36 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 25 Jun
 2019 10:22:35 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 25 Jun 2019 10:22:35 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/4] gpio: stm32: Rename stm32f7_gpio to stm32_gpio
Thread-Index: AQHVKDa/2iI+zgSJU0+nmAbHaku8x6asDaYQ
Date: Tue, 25 Jun 2019 08:22:35 +0000
Message-ID: <5412b291e6dc4a92a0f79203fc2329a3@SFHDAG6NODE3.st.com>
References: <20190621133925.8643-1-patrice.chotard@st.com>
 <20190621133925.8643-2-patrice.chotard@st.com>
In-Reply-To: <20190621133925.8643-2-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_06:, , signatures=0
Cc: Peng Fan <peng.fan@nxp.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Michal Simek <michal.simek@xilinx.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Lars Povlsen <lars.povlsen@microchip.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] gpio: stm32: Rename stm32f7_gpio to
	stm32_gpio
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

Hi Patrice,

> From: Patrice CHOTARD <patrice.chotard@st.com>
> Sent: vendredi 21 juin 2019 15:39
> 
> As this driver is used on stm32f4/f7/h7 and stm32mp1 SoCs, rename it with a
> more generic name.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>

> ---
> 
>  drivers/gpio/Kconfig                          | 4 ++--
>  drivers/gpio/Makefile                         | 2 +-
>  drivers/gpio/{stm32f7_gpio.c => stm32_gpio.c} | 0
>  3 files changed, 3 insertions(+), 3 deletions(-)  rename
> drivers/gpio/{stm32f7_gpio.c => stm32_gpio.c} (100%)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig index
> e36a8abc42..be073335c2 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -255,13 +255,13 @@ config PIC32_GPIO
>  	help
>  	  Say yes here to support Microchip PIC32 GPIOs.
> 
> -config STM32F7_GPIO
> +config STM32_GPIO
>  	bool "ST STM32 GPIO driver"
>  	depends on DM_GPIO && (STM32 || ARCH_STM32MP)
>  	default y
>  	help
>  	  Device model driver support for STM32 GPIO controller. It should be
> -	  usable on many stm32 families like stm32f4 & stm32H7.
> +	  usable on many stm32 families like stm32f4/f7/h7 and stm32mp1.
>  	  Tested on STM32F7.
> 
>  config MVEBU_GPIO
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile index
> 7337153e0e..4a8aa0ff6f 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -47,7 +47,7 @@ obj-$(CONFIG_ADI_GPIO2)	+= adi_gpio2.o
>  obj-$(CONFIG_TCA642X)		+= tca642x.o
>  obj-$(CONFIG_SUNXI_GPIO)	+= sunxi_gpio.o
>  obj-$(CONFIG_LPC32XX_GPIO)	+= lpc32xx_gpio.o
> -obj-$(CONFIG_STM32F7_GPIO)	+= stm32f7_gpio.o
> +obj-$(CONFIG_STM32_GPIO)	+= stm32_gpio.o
>  obj-$(CONFIG_GPIO_UNIPHIER)	+= gpio-uniphier.o
>  obj-$(CONFIG_ZYNQ_GPIO)		+= zynq_gpio.o
>  obj-$(CONFIG_VYBRID_GPIO)	+= vybrid_gpio.o
> diff --git a/drivers/gpio/stm32f7_gpio.c b/drivers/gpio/stm32_gpio.c similarity
> index 100% rename from drivers/gpio/stm32f7_gpio.c rename to
> drivers/gpio/stm32_gpio.c
> --
> 2.17.1

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
