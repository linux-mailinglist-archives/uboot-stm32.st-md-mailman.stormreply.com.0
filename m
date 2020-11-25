Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA84A2C3CB3
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Nov 2020 10:44:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82DD1C5662F;
	Wed, 25 Nov 2020 09:44:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5DCFC32EA3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 09:43:59 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AP9S2ZR030603; Wed, 25 Nov 2020 10:43:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=jytU296+Gl6kh9vj8nBKghIEc2uR5k5RD4lqQYfItP8=;
 b=RJtmOhzmorZgO0ithO2jeHpqIQS60teGEuL0rr+eDvGBsB5XfgfPh1Px3jGefh5O9acq
 iijdBsHNQWoVDJim9b71YeKu/k4UQjI8pDy7OovyaVBdvF8ID186ZGI9cPLY5xSA5Uzk
 Ue0vfkWfuizMIk3C3jYnIzbIOaltyvg+bJoa1nHO+01zycmy7ovu3btC/g69TVETkdgO
 LFAI7RUwsVmbgMo+qtWML5bn8iWmOj/BepwJxVShg9UND/E1ORr8D374uUTO/zy2T3pd
 g9JrKlMsWRhFf7t2Kzg7R6q3elaMr8t1vKe1cPQt1Rsj9olfHSmf72Xm1RqCJii+q3l/ sA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y01cn24f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 10:43:57 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C2ADC100034;
 Wed, 25 Nov 2020 10:43:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B9836230CFE;
 Wed, 25 Nov 2020 10:43:55 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Nov
 2020 10:43:55 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 25 Nov 2020 10:43:55 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/2] gpio: stm32: correct the bias management
Thread-Index: AQHWrQ+W2g1Rl4vQZk6AsiVGZal0gKnYtBiA
Date: Wed, 25 Nov 2020 09:43:55 +0000
Message-ID: <d016ded8-fe38-4676-29ed-baf12ce4e00b@st.com>
References: <20201028094908.11031-1-patrick.delaunay@st.com>
 <20201028094908.11031-2-patrick.delaunay@st.com>
In-Reply-To: <20201028094908.11031-2-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <43629F9EEC9B7C49ADC3F3C17F14F8A5@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_05:2020-11-25,
 2020-11-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] gpio: stm32: correct the bias
	management
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
> Use the bias configuration for all the GPIO configurations and not
> only for input GPIO, as indicated in Reference manual
> (Table 81. Port bit configuration table).
>
> Fixes: 43efbb6a3ebf0223f9eab8d45916f602d876319f ("gpio: stm32: add ops get_dir_flags")
> Fixes: f13ff88b61c32ac8f0e9068c41328b265ef619eb ("gpio: stm32: add ops set_dir_flags")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/gpio/stm32_gpio.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpio/stm32_gpio.c b/drivers/gpio/stm32_gpio.c
> index b885cfb57e..51e1efd701 100644
> --- a/drivers/gpio/stm32_gpio.c
> +++ b/drivers/gpio/stm32_gpio.c
> @@ -212,11 +212,11 @@ static int stm32_gpio_set_dir_flags(struct udevice *dev, unsigned int offset,
>  
>  	} else if (flags & GPIOD_IS_IN) {
>  		stm32_gpio_set_moder(regs, idx, STM32_GPIO_MODE_IN);
> -		if (flags & GPIOD_PULL_UP)
> -			stm32_gpio_set_pupd(regs, idx, STM32_GPIO_PUPD_UP);
> -		else if (flags & GPIOD_PULL_DOWN)
> -			stm32_gpio_set_pupd(regs, idx, STM32_GPIO_PUPD_DOWN);
>  	}
> +	if (flags & GPIOD_PULL_UP)
> +		stm32_gpio_set_pupd(regs, idx, STM32_GPIO_PUPD_UP);
> +	else if (flags & GPIOD_PULL_DOWN)
> +		stm32_gpio_set_pupd(regs, idx, STM32_GPIO_PUPD_DOWN);
>  
>  	return 0;
>  }
> @@ -243,16 +243,16 @@ static int stm32_gpio_get_dir_flags(struct udevice *dev, unsigned int offset,
>  		break;
>  	case STM32_GPIO_MODE_IN:
>  		dir_flags |= GPIOD_IS_IN;
> -		switch (stm32_gpio_get_pupd(regs, idx)) {
> -		case STM32_GPIO_PUPD_UP:
> -			dir_flags |= GPIOD_PULL_UP;
> -			break;
> -		case STM32_GPIO_PUPD_DOWN:
> -			dir_flags |= GPIOD_PULL_DOWN;
> -			break;
> -		default:
> -			break;
> -		}
> +		break;
> +	default:
> +		break;
> +	}
> +	switch (stm32_gpio_get_pupd(regs, idx)) {
> +	case STM32_GPIO_PUPD_UP:
> +		dir_flags |= GPIOD_PULL_UP;
> +		break;
> +	case STM32_GPIO_PUPD_DOWN:
> +		dir_flags |= GPIOD_PULL_DOWN;
>  		break;
>  	default:
>  		break;

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
