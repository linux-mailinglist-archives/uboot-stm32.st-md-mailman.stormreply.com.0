Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 887D0294C1E
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 14:01:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45659C3FAE0;
	Wed, 21 Oct 2020 12:01:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8762DC3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 12:00:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LBvm6H016461; Wed, 21 Oct 2020 14:00:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=t/Fg3I/NuNMgDv8LX8hB3vPEP3NJsz8xwLtgVnbaAJI=;
 b=yCF/DtcyiyHkgaouYyERsHt3nEnELJuCEPVLKJbx5WjN2LLMv4zXWdAgKADzVIF+hRea
 xXJrLZFoOassctjOqZFJ/1QwL6Q6Co7WxsCbNOPMSJ0jTkct53MvVYQYab/XvZiF8P47
 zRgBoQjqSOrwrNXNEKwtyc6g5YhUvvoCezTQWENkqxRTAeUNXITcIWDYi3bdvhu04XJo
 KRADZlo2BDcClrz3DhzKjzBu4+FXmJ6iUqkw4xEhR2KHMwPNLiwcQ085dCpJIt8tMdQJ
 CeoEDkJs5EbDxtkYyRJ4MnvVb2RMWuAreY/Hhlx6u3R7/EiYTDaDrxxkXMMQL5aCZOuG Rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347qggacwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 14:00:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 50FC510002A;
 Wed, 21 Oct 2020 14:00:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 38FF22E3639;
 Wed, 21 Oct 2020 14:00:51 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 14:00:50 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 14:00:50 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] arm: stm32: cleanup arch gpio.h
Thread-Index: AQHWmLTX9XDXHP0nWEueHNzwYAnE2Kmh8K6A
Date: Wed, 21 Oct 2020 12:00:50 +0000
Message-ID: <64d86f78-9eed-dd4b-e99d-5577cf05b26d@st.com>
References: <20201002120854.22557-1-patrick.delaunay@st.com>
In-Reply-To: <20201002120854.22557-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <E2357C6C3CC254499E2AF89E56C9B214@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: stm32: cleanup arch gpio.h
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

On 10/2/20 2:08 PM, Patrick Delaunay wrote:
> Cosmetic update of gpio.h:
> - remove enumerate: stm32_gpio_port, stm32_gpio_pin
>   because STM32_GPIO_XXX values are unused
> - move STM32_GPIOS_PER_BANK in stm32_gpio.c
>   as its value is IP dependent and not arch dependent
>
> No functional change as number of banks and number of gpio by banks
> is managed by device tree since since DM migration and
> commit 8f651ca60ba1 ("pinctrl: stm32: Add get_pins_count() ops").
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/include/asm/arch-stm32/gpio.h    | 37 ++---------------------
>  arch/arm/mach-stm32mp/include/mach/gpio.h | 37 ++---------------------
>  drivers/gpio/stm32_gpio.c                 |  2 ++
>  3 files changed, 6 insertions(+), 70 deletions(-)
>
> diff --git a/arch/arm/include/asm/arch-stm32/gpio.h b/arch/arm/include/asm/arch-stm32/gpio.h
> index 570e80a6ba..233ce278a7 100644
> --- a/arch/arm/include/asm/arch-stm32/gpio.h
> +++ b/arch/arm/include/asm/arch-stm32/gpio.h
> @@ -7,39 +7,6 @@
>  #ifndef _GPIO_H_
>  #define _GPIO_H_
>  
> -#define STM32_GPIOS_PER_BANK		16
> -
> -enum stm32_gpio_port {
> -	STM32_GPIO_PORT_A = 0,
> -	STM32_GPIO_PORT_B,
> -	STM32_GPIO_PORT_C,
> -	STM32_GPIO_PORT_D,
> -	STM32_GPIO_PORT_E,
> -	STM32_GPIO_PORT_F,
> -	STM32_GPIO_PORT_G,
> -	STM32_GPIO_PORT_H,
> -	STM32_GPIO_PORT_I
> -};
> -
> -enum stm32_gpio_pin {
> -	STM32_GPIO_PIN_0 = 0,
> -	STM32_GPIO_PIN_1,
> -	STM32_GPIO_PIN_2,
> -	STM32_GPIO_PIN_3,
> -	STM32_GPIO_PIN_4,
> -	STM32_GPIO_PIN_5,
> -	STM32_GPIO_PIN_6,
> -	STM32_GPIO_PIN_7,
> -	STM32_GPIO_PIN_8,
> -	STM32_GPIO_PIN_9,
> -	STM32_GPIO_PIN_10,
> -	STM32_GPIO_PIN_11,
> -	STM32_GPIO_PIN_12,
> -	STM32_GPIO_PIN_13,
> -	STM32_GPIO_PIN_14,
> -	STM32_GPIO_PIN_15
> -};
> -
>  enum stm32_gpio_mode {
>  	STM32_GPIO_MODE_IN = 0,
>  	STM32_GPIO_MODE_OUT,
> @@ -85,8 +52,8 @@ enum stm32_gpio_af {
>  };
>  
>  struct stm32_gpio_dsc {
> -	enum stm32_gpio_port	port;
> -	enum stm32_gpio_pin	pin;
> +	u8	port;
> +	u8	pin;
>  };
>  
>  struct stm32_gpio_ctl {
> diff --git a/arch/arm/mach-stm32mp/include/mach/gpio.h b/arch/arm/mach-stm32mp/include/mach/gpio.h
> index 5ca76d21ff..7a0f293519 100644
> --- a/arch/arm/mach-stm32mp/include/mach/gpio.h
> +++ b/arch/arm/mach-stm32mp/include/mach/gpio.h
> @@ -8,39 +8,6 @@
>  #define _STM32_GPIO_H_
>  #include <asm/gpio.h>
>  
> -#define STM32_GPIOS_PER_BANK		16
> -
> -enum stm32_gpio_port {
> -	STM32_GPIO_PORT_A = 0,
> -	STM32_GPIO_PORT_B,
> -	STM32_GPIO_PORT_C,
> -	STM32_GPIO_PORT_D,
> -	STM32_GPIO_PORT_E,
> -	STM32_GPIO_PORT_F,
> -	STM32_GPIO_PORT_G,
> -	STM32_GPIO_PORT_H,
> -	STM32_GPIO_PORT_I
> -};
> -
> -enum stm32_gpio_pin {
> -	STM32_GPIO_PIN_0 = 0,
> -	STM32_GPIO_PIN_1,
> -	STM32_GPIO_PIN_2,
> -	STM32_GPIO_PIN_3,
> -	STM32_GPIO_PIN_4,
> -	STM32_GPIO_PIN_5,
> -	STM32_GPIO_PIN_6,
> -	STM32_GPIO_PIN_7,
> -	STM32_GPIO_PIN_8,
> -	STM32_GPIO_PIN_9,
> -	STM32_GPIO_PIN_10,
> -	STM32_GPIO_PIN_11,
> -	STM32_GPIO_PIN_12,
> -	STM32_GPIO_PIN_13,
> -	STM32_GPIO_PIN_14,
> -	STM32_GPIO_PIN_15
> -};
> -
>  enum stm32_gpio_mode {
>  	STM32_GPIO_MODE_IN = 0,
>  	STM32_GPIO_MODE_OUT,
> @@ -86,8 +53,8 @@ enum stm32_gpio_af {
>  };
>  
>  struct stm32_gpio_dsc {
> -	enum stm32_gpio_port	port;
> -	enum stm32_gpio_pin	pin;
> +	u8	port;
> +	u8	pin;
>  };
>  
>  struct stm32_gpio_ctl {
> diff --git a/drivers/gpio/stm32_gpio.c b/drivers/gpio/stm32_gpio.c
> index 5bff27f75b..9ea2a03f15 100644
> --- a/drivers/gpio/stm32_gpio.c
> +++ b/drivers/gpio/stm32_gpio.c
> @@ -18,6 +18,8 @@
>  #include <linux/errno.h>
>  #include <linux/io.h>
>  
> +#define STM32_GPIOS_PER_BANK		16
> +
>  #define MODE_BITS(gpio_pin)		((gpio_pin) * 2)
>  #define MODE_BITS_MASK			3
>  #define BSRR_BIT(gpio_pin, value)	BIT((gpio_pin) + (value ? 0 : 16))

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
