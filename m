Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62372211DB4
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 10:02:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28925C36B25
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 08:02:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 688A2C36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 08:02:56 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 062802rF010360; Thu, 2 Jul 2020 10:02:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=t7mzftoIYN/oncdkcr/4k0FXR7qT9/tYBtjMTjubM8w=;
 b=y/kHDFXrIM9D3KLHotUgDRXkFybAXmrSnZR2E5zHBOmNdh3VpUqlr8QmgqnpZ7fB53Ol
 dSmfiaNDbwNBYMmy91YYMHqg91Wbkgl6+7h8PrwD4+3jbPpx9qN/P5JIs0cqth+OWzkZ
 OQCgLeP6QgBplPqBhtZvkmLR05LviW6RZyzoXDnEd3SjyGjeKyhu/BxZ8hgp8Qs/9jIr
 BhV9PIDRnDGnpBsxtBtG9OePc4M/wNpJcdWOS7IhHHxWfP1DQwh2LYKeVCjiuhJGDPmb
 p917xl8EG0cQYypzp0YTDBHrzrHW4D3WUjVpa9ajR2aLXjr7IVHlGuZIimORYUs7tjw1 Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuk1ppsa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 10:02:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2DBEF100034;
 Thu,  2 Jul 2020 10:02:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2366521F696;
 Thu,  2 Jul 2020 10:02:54 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 Jul
 2020 10:02:53 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 10:02:53 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 11/11] pinctrl: stm32: add information on pin
 configuration
Thread-Index: AQHWOmv2+YDbn5q7mkqxyQoMM/QJSKjz+ACA
Date: Thu, 2 Jul 2020 08:02:53 +0000
Message-ID: <59146252-c3b1-2d32-00b2-5b1546f6b976@st.com>
References: <20200604123033.25499-1-patrick.delaunay@st.com>
 <20200604143022.v2.11.I080300e7ec59426020b1d175aa207029ecb5e0cb@changeid>
In-Reply-To: <20200604143022.v2.11.I080300e7ec59426020b1d175aa207029ecb5e0cb@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <B6B0E31320676343962116149DCC6BD7@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 11/11] pinctrl: stm32: add information
 on pin configuration
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

On 6/4/20 2:30 PM, Patrick Delaunay wrote:
> Add information on pin configuration used for pinmux command:
> - bias configuration for output (disable, pull up, pull down)
> - otype for input (open drain or push pull)
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2: None
>
>  drivers/pinctrl/pinctrl_stm32.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
> index fc241fdcde..71fa29a389 100644
> --- a/drivers/pinctrl/pinctrl_stm32.c
> +++ b/drivers/pinctrl/pinctrl_stm32.c
> @@ -45,6 +45,17 @@ static const char * const pinmux_mode[PINMUX_MODE_COUNT] = {
>  	"alt function",
>  };
>  
> +static const char * const pinmux_output[] = {
> +	[STM32_GPIO_PUPD_NO] = "bias-disable",
> +	[STM32_GPIO_PUPD_UP] = "bias-pull-up",
> +	[STM32_GPIO_PUPD_DOWN] = "bias-pull-down",
> +};
> +
> +static const char * const pinmux_input[] = {
> +	[STM32_GPIO_OTYPE_PP] = "drive-push-pull",
> +	[STM32_GPIO_OTYPE_OD] = "drive-open-drain",
> +};
> +
>  static int stm32_pinctrl_get_af(struct udevice *dev, unsigned int offset)
>  {
>  	struct stm32_gpio_priv *priv = dev_get_priv(dev);
> @@ -182,10 +193,12 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
>  					int size)
>  {
>  	struct udevice *gpio_dev;
> +	struct stm32_gpio_priv *priv;
>  	const char *label;
>  	int mode;
>  	int af_num;
>  	unsigned int gpio_idx;
> +	u32 pupd, otype;
>  
>  	/* look up for the bank which owns the requested pin */
>  	gpio_dev = stm32_pinctrl_get_gpio_dev(dev, selector, &gpio_idx);
> @@ -194,9 +207,9 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
>  		return -ENODEV;
>  
>  	mode = gpio_get_raw_function(gpio_dev, gpio_idx, &label);
> -
>  	dev_dbg(dev, "selector = %d gpio_idx = %d mode = %d\n",
>  		selector, gpio_idx, mode);
> +	priv = dev_get_priv(gpio_dev);
>  
>  
>  	switch (mode) {
> @@ -211,9 +224,17 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
>  		snprintf(buf, size, "%s %d", pinmux_mode[mode], af_num);
>  		break;
>  	case GPIOF_OUTPUT:
> +		pupd = (readl(&priv->regs->pupdr) >> (gpio_idx * 2)) &
> +		       PUPD_MASK;
> +		snprintf(buf, size, "%s %s %s",
> +			 pinmux_mode[mode], pinmux_output[pupd],
> +			 label ? label : "");
> +		break;
>  	case GPIOF_INPUT:
> -		snprintf(buf, size, "%s %s",
> -			 pinmux_mode[mode], label ? label : "");
> +		otype = (readl(&priv->regs->otyper) >> gpio_idx) & OTYPE_MSK;
> +		snprintf(buf, size, "%s %s %s",
> +			 pinmux_mode[mode], pinmux_input[otype],
> +			 label ? label : "");
>  		break;
>  	}
>  

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
