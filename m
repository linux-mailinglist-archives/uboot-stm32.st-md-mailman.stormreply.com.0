Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C1A2C3C84
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Nov 2020 10:43:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D962AC5662F;
	Wed, 25 Nov 2020 09:43:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8651FC32EA3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 09:43:38 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AP9QlHs027704; Wed, 25 Nov 2020 10:43:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=pFI8LAsVVApEqXERkp/9DdVFExLaL1JsersJcXQgGDg=;
 b=ZMSfMX6oYlnOLRfyYC+4kmFjbkylw8rkJw0YinGzgvuzeAODJ4g2KQ5XyitalmEvomES
 yJEil/7+To/V0deXi3K/ZPB88tHTTs7+f8qFtJZkCTiZe82BGvuNDT+JQZ10heQKE8wE
 uZCq8kaK2Kj0VxbYnZ71HJCfEI/u9+P5Dg1rvrNxFJIu31dIJKapKyAUZ0uD1NfhdT9n
 Ek8sQWQ1Qyx/gUKetLg9Uduq6L4ej5n6hIBGFvWQkbaH+s7pXEnbcCcpKQZ219u5c5ps
 XP7nbdW1vR79ajxkDfAl6MTrqKXFeC4HOnwu8ivRiHHOxACVi1/T3mdjtNjzLEjXXHAB wQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y0fgyh2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 10:43:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EDAC410002A;
 Wed, 25 Nov 2020 10:43:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E3AF8230CFB;
 Wed, 25 Nov 2020 10:43:25 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Nov
 2020 10:43:25 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 25 Nov 2020 10:43:25 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/2] pinctrl: stm32: display bias information for all pins
Thread-Index: AQHWrQ+W9TlpfB9N/EOiKtlNwE08hqnYs/MA
Date: Wed, 25 Nov 2020 09:43:25 +0000
Message-ID: <776afff9-36d5-a345-ec0d-f295bd82e943@st.com>
References: <20201028094908.11031-1-patrick.delaunay@st.com>
In-Reply-To: <20201028094908.11031-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <5823F423EAD20B438D580F6EE4D33E97@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_05:2020-11-25,
 2020-11-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] pinctrl: stm32: display bias
	information for all pins
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

On 10/28/20 10:49 AM, Patrick Delaunay wrote:
> Display the bias information for input gpios or AF configuration,
> and not only for output pin, as described in Reference manual
> (Table 81. Port bit configuration table).
>
> Fixes: da7a0bb1f279 ("pinctrl: stm32: add information on pin configuration")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/pinctrl/pinctrl_stm32.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
> index dbea99532c..262b2c3d7e 100644
> --- a/drivers/pinctrl/pinctrl_stm32.c
> +++ b/drivers/pinctrl/pinctrl_stm32.c
> @@ -48,15 +48,15 @@ static const char * const pinmux_mode[PINMUX_MODE_COUNT] = {
>  	"alt function",
>  };
>  
> -static const char * const pinmux_output[] = {
> -	[STM32_GPIO_PUPD_NO] = "bias-disable",
> -	[STM32_GPIO_PUPD_UP] = "bias-pull-up",
> -	[STM32_GPIO_PUPD_DOWN] = "bias-pull-down",
> +static const char * const pinmux_bias[] = {
> +	[STM32_GPIO_PUPD_NO] = "",
> +	[STM32_GPIO_PUPD_UP] = "pull-up",
> +	[STM32_GPIO_PUPD_DOWN] = "pull-down",
>  };
>  
>  static const char * const pinmux_input[] = {
> -	[STM32_GPIO_OTYPE_PP] = "drive-push-pull",
> -	[STM32_GPIO_OTYPE_OD] = "drive-open-drain",
> +	[STM32_GPIO_OTYPE_PP] = "push-pull",
> +	[STM32_GPIO_OTYPE_OD] = "open-drain",
>  };
>  
>  static int stm32_pinctrl_get_af(struct udevice *dev, unsigned int offset)
> @@ -213,6 +213,7 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
>  	dev_dbg(dev, "selector = %d gpio_idx = %d mode = %d\n",
>  		selector, gpio_idx, mode);
>  	priv = dev_get_priv(gpio_dev);
> +	pupd = (readl(&priv->regs->pupdr) >> (gpio_idx * 2)) & PUPD_MASK;
>  
>  
>  	switch (mode) {
> @@ -224,20 +225,19 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
>  		break;
>  	case GPIOF_FUNC:
>  		af_num = stm32_pinctrl_get_af(gpio_dev, gpio_idx);
> -		snprintf(buf, size, "%s %d", pinmux_mode[mode], af_num);
> +		snprintf(buf, size, "%s %d %s", pinmux_mode[mode], af_num,
> +			 pinmux_bias[pupd]);
>  		break;
>  	case GPIOF_OUTPUT:
> -		pupd = (readl(&priv->regs->pupdr) >> (gpio_idx * 2)) &
> -		       PUPD_MASK;
>  		snprintf(buf, size, "%s %s %s",
> -			 pinmux_mode[mode], pinmux_output[pupd],
> +			 pinmux_mode[mode], pinmux_bias[pupd],
>  			 label ? label : "");
>  		break;
>  	case GPIOF_INPUT:
>  		otype = (readl(&priv->regs->otyper) >> gpio_idx) & OTYPE_MSK;
> -		snprintf(buf, size, "%s %s %s",
> +		snprintf(buf, size, "%s %s %s %s",
>  			 pinmux_mode[mode], pinmux_input[otype],
> -			 label ? label : "");
> +			 pinmux_bias[pupd], label ? label : "");
>  		break;
>  	}
>  

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
