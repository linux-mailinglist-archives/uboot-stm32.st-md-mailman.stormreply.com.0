Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 036E351D389
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 May 2022 10:39:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B839BC628A8;
	Fri,  6 May 2022 08:39:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B04AFC6047D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 May 2022 08:39:36 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2467ffXA010875;
 Fri, 6 May 2022 10:39:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=liOtFpv8X5QQkINyQfdgb9tmH2YmBVnlzQPUIDdT43I=;
 b=zsjFo+a6enVbS0nG5nvoRXZuDS3R8b3AcLy3O8gSq6WByc9IrMOy4iQo/aFkYEpcfuXG
 5yZrNTFehlBrFJM15GYGCYDP+dLMePPpKsUxRCcDRe5Ty+WKuq6+XrSdqFYcmNTfYviu
 gN/qP9Gl6U+xQ9MZwkIJwevLNKwSBuyXuv9ILPMh6hZVCby88fcqfDMA2PQ4Cz00wBMX
 4DPal4PgOz7ejL7AJbI5hDtKF+Z9dew6m1xsTZbg/tdrbRWtm7Ax8Q780oxzAW+qhh7C
 F+RQILT2Ynn5lxTOHOlW3LJ7KlGUQTj4lNY6jR3E0mCzaMpKdDrgYTAj0NPNKb4/OPqR Gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fvygu0fnu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 10:39:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E974610002A;
 Fri,  6 May 2022 10:39:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C8E1721514A;
 Fri,  6 May 2022 10:39:34 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 6 May
 2022 10:39:34 +0200
Message-ID: <40acba0d-dad8-7de2-72e3-c10e9494998c@foss.st.com>
Date: Fri, 6 May 2022 10:39:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220422073831.15538-1-patrice.chotard@foss.st.com>
 <20220422073831.15538-3-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220422073831.15538-3-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_03,2022-05-05_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 3/3] gpio: stm32_gpio: Rework GPIO hole
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 4/22/22 09:38, Patrice Chotard wrote:
> On some STM32 SoC's package, GPIO bank may have hole in their GPIO bank
> Example:
>    If GPIO bank have 16 GPIO pins [0-15].
>    In particular SoC's package case, some GPIO bank can have less GPIO pins:
>      - [0-10] => 11 pins;
>      - [2-7] => 6 pins.
>
> Commit dbf928dd2634 ("gpio: stm32f7: Add gpio bank holes management")
> proposed a first implementation by not counting GPIO "inside" hole. GPIO
> are not displaying correctly using gpio or pinmux command when GPIO holes
> are located at the beginning of GPIO bank.
>
> To simplify, consider that all GPIO have 16 GPIO and use the gpio_ranges
> struct to indicate if a GPIO is mapped or not. GPIO uclass offers several
> GPIO functions ("input", "output", "unused", "unknown" and "func"), use
> "unknown" GPIO function to indicate that a GPIO is not mapped.
>
> stm32_offset_to_index() is no more needed and removed.
>
> This must be reflected using the "gpio" command to indicate to user
> that a particular GPIO is not mapped (marked as "unknown") as shown below:
>
> Example for a 16 pins GPIO bank with the [2-7] mapping (only 6 pins
> mapped):
> GPIOI0          : unknown
> GPIOI1          : unknown
> GPIOI2          : analog
> GPIOI3          : analog
> GPIOI4          : alt function 0 push-pull pull-down
> GPIOI5          : alt function 0 push-pull pull-down
> GPIOI6          : alt function 0 push-pull pull-down
> GPIOI7          : analog
> GPIOI8          : unknown
> GPIOI9          : unknown
> GPIOI10         : unknown
> GPIOI11         : unknown
> GPIOI12         : unknown
> GPIOI13         : unknown
> GPIOI14         : unknown
> GPIOI15         : unknown
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   drivers/gpio/stm32_gpio.c       | 103 +++++++++++---------------------
>   drivers/gpio/stm32_gpio_priv.h  |   2 -
>   drivers/pinctrl/pinctrl_stm32.c |   5 +-
>   3 files changed, 37 insertions(+), 73 deletions(-)
>
> diff --git a/drivers/gpio/stm32_gpio.c b/drivers/gpio/stm32_gpio.c
> index 8667ed3835..7a2ca91c76 100644
> --- a/drivers/gpio/stm32_gpio.c
> +++ b/drivers/gpio/stm32_gpio.c
> @@ -83,38 +83,22 @@ static enum stm32_gpio_pupd stm32_gpio_get_pupd(struct stm32_gpio_regs *regs,
>   	return (readl(&regs->pupdr) >> PUPD_BITS(idx)) & PUPD_MASK;
>   }
>   
> -/*
> - * convert gpio offset to gpio index taking into account gpio holes
> - * into gpio bank
> - */
> -int stm32_offset_to_index(struct udevice *dev, unsigned int offset)
> +static bool stm32_gpio_is_mapped(struct udevice *dev, int offset)
>   {
>   	struct stm32_gpio_priv *priv = dev_get_priv(dev);
> -	unsigned int idx = 0;
> -	int i;
> -
> -	for (i = 0; i < STM32_GPIOS_PER_BANK; i++) {
> -		if (priv->gpio_range & BIT(i)) {
> -			if (idx == offset)
> -				return idx;
> -			idx++;
> -		}
> -	}
> -	/* shouldn't happen */
> -	return -EINVAL;
> +
> +	return !!(priv->gpio_range & BIT(offset));
>   }
>   
>   static int stm32_gpio_direction_input(struct udevice *dev, unsigned offset)
>   {
>   	struct stm32_gpio_priv *priv = dev_get_priv(dev);
>   	struct stm32_gpio_regs *regs = priv->regs;
> -	int idx;
>   
> -	idx = stm32_offset_to_index(dev, offset);
> -	if (idx < 0)
> -		return idx;
> +	if (!stm32_gpio_is_mapped(dev, offset))
> +		return -ENXIO;
>   
> -	stm32_gpio_set_moder(regs, idx, STM32_GPIO_MODE_IN);
> +	stm32_gpio_set_moder(regs, offset, STM32_GPIO_MODE_IN);
>   
>   	return 0;
>   }
> @@ -124,15 +108,13 @@ static int stm32_gpio_direction_output(struct udevice *dev, unsigned offset,
>   {
>   	struct stm32_gpio_priv *priv = dev_get_priv(dev);
>   	struct stm32_gpio_regs *regs = priv->regs;
> -	int idx;
>   
> -	idx = stm32_offset_to_index(dev, offset);
> -	if (idx < 0)
> -		return idx;
> +	if (!stm32_gpio_is_mapped(dev, offset))
> +		return -ENXIO;
>   
> -	stm32_gpio_set_moder(regs, idx, STM32_GPIO_MODE_OUT);
> +	stm32_gpio_set_moder(regs, offset, STM32_GPIO_MODE_OUT);
>   
> -	writel(BSRR_BIT(idx, value), &regs->bsrr);
> +	writel(BSRR_BIT(offset, value), &regs->bsrr);
>   
>   	return 0;
>   }
> @@ -141,26 +123,22 @@ static int stm32_gpio_get_value(struct udevice *dev, unsigned offset)
>   {
>   	struct stm32_gpio_priv *priv = dev_get_priv(dev);
>   	struct stm32_gpio_regs *regs = priv->regs;
> -	int idx;
>   
> -	idx = stm32_offset_to_index(dev, offset);
> -	if (idx < 0)
> -		return idx;
> +	if (!stm32_gpio_is_mapped(dev, offset))
> +		return -ENXIO;
>   
> -	return readl(&regs->idr) & BIT(idx) ? 1 : 0;
> +	return readl(&regs->idr) & BIT(offset) ? 1 : 0;
>   }
>   
>   static int stm32_gpio_set_value(struct udevice *dev, unsigned offset, int value)
>   {
>   	struct stm32_gpio_priv *priv = dev_get_priv(dev);
>   	struct stm32_gpio_regs *regs = priv->regs;
> -	int idx;
>   
> -	idx = stm32_offset_to_index(dev, offset);
> -	if (idx < 0)
> -		return idx;
> +	if (!stm32_gpio_is_mapped(dev, offset))
> +		return -ENXIO;
>   
> -	writel(BSRR_BIT(idx, value), &regs->bsrr);
> +	writel(BSRR_BIT(offset, value), &regs->bsrr);
>   
>   	return 0;
>   }
> @@ -171,14 +149,12 @@ static int stm32_gpio_get_function(struct udevice *dev, unsigned int offset)
>   	struct stm32_gpio_regs *regs = priv->regs;
>   	int bits_index;
>   	int mask;
> -	int idx;
>   	u32 mode;
>   
> -	idx = stm32_offset_to_index(dev, offset);
> -	if (idx < 0)
> -		return idx;
> +	if (!stm32_gpio_is_mapped(dev, offset))
> +		return GPIOF_UNKNOWN;
>   
> -	bits_index = MODE_BITS(idx);
> +	bits_index = MODE_BITS(offset);
>   	mask = MODE_BITS_MASK << bits_index;
>   
>   	mode = (readl(&regs->moder) & mask) >> bits_index;
> @@ -197,30 +173,28 @@ static int stm32_gpio_set_flags(struct udevice *dev, unsigned int offset,
>   {
>   	struct stm32_gpio_priv *priv = dev_get_priv(dev);
>   	struct stm32_gpio_regs *regs = priv->regs;
> -	int idx;
>   
> -	idx = stm32_offset_to_index(dev, offset);
> -	if (idx < 0)
> -		return idx;
> +	if (!stm32_gpio_is_mapped(dev, offset))
> +		return -ENXIO;
>   
>   	if (flags & GPIOD_IS_OUT) {
>   		bool value = flags & GPIOD_IS_OUT_ACTIVE;
>   
>   		if (flags & GPIOD_OPEN_DRAIN)
> -			stm32_gpio_set_otype(regs, idx, STM32_GPIO_OTYPE_OD);
> +			stm32_gpio_set_otype(regs, offset, STM32_GPIO_OTYPE_OD);
>   		else
> -			stm32_gpio_set_otype(regs, idx, STM32_GPIO_OTYPE_PP);
> +			stm32_gpio_set_otype(regs, offset, STM32_GPIO_OTYPE_PP);
>   
> -		stm32_gpio_set_moder(regs, idx, STM32_GPIO_MODE_OUT);
> -		writel(BSRR_BIT(idx, value), &regs->bsrr);
> +		stm32_gpio_set_moder(regs, offset, STM32_GPIO_MODE_OUT);
> +		writel(BSRR_BIT(offset, value), &regs->bsrr);
>   
>   	} else if (flags & GPIOD_IS_IN) {
> -		stm32_gpio_set_moder(regs, idx, STM32_GPIO_MODE_IN);
> +		stm32_gpio_set_moder(regs, offset, STM32_GPIO_MODE_IN);
>   	}
>   	if (flags & GPIOD_PULL_UP)
> -		stm32_gpio_set_pupd(regs, idx, STM32_GPIO_PUPD_UP);
> +		stm32_gpio_set_pupd(regs, offset, STM32_GPIO_PUPD_UP);
>   	else if (flags & GPIOD_PULL_DOWN)
> -		stm32_gpio_set_pupd(regs, idx, STM32_GPIO_PUPD_DOWN);
> +		stm32_gpio_set_pupd(regs, offset, STM32_GPIO_PUPD_DOWN);
>   
>   	return 0;
>   }
> @@ -230,19 +204,17 @@ static int stm32_gpio_get_flags(struct udevice *dev, unsigned int offset,
>   {
>   	struct stm32_gpio_priv *priv = dev_get_priv(dev);
>   	struct stm32_gpio_regs *regs = priv->regs;
> -	int idx;
>   	ulong dir_flags = 0;
>   
> -	idx = stm32_offset_to_index(dev, offset);
> -	if (idx < 0)
> -		return idx;
> +	if (!stm32_gpio_is_mapped(dev, offset))
> +		return -ENXIO;
>   
> -	switch (stm32_gpio_get_moder(regs, idx)) {
> +	switch (stm32_gpio_get_moder(regs, offset)) {
>   	case STM32_GPIO_MODE_OUT:
>   		dir_flags |= GPIOD_IS_OUT;
> -		if (stm32_gpio_get_otype(regs, idx) == STM32_GPIO_OTYPE_OD)
> +		if (stm32_gpio_get_otype(regs, offset) == STM32_GPIO_OTYPE_OD)
>   			dir_flags |= GPIOD_OPEN_DRAIN;
> -		if (readl(&regs->idr) & BIT(idx))
> +		if (readl(&regs->idr) & BIT(offset))
>   			dir_flags |= GPIOD_IS_OUT_ACTIVE;
>   		break;
>   	case STM32_GPIO_MODE_IN:
> @@ -251,7 +223,7 @@ static int stm32_gpio_get_flags(struct udevice *dev, unsigned int offset,
>   	default:
>   		break;
>   	}
> -	switch (stm32_gpio_get_pupd(regs, idx)) {
> +	switch (stm32_gpio_get_pupd(regs, offset)) {
>   	case STM32_GPIO_PUPD_UP:
>   		dir_flags |= GPIOD_PULL_UP;
>   		break;
> @@ -304,17 +276,14 @@ static int gpio_stm32_probe(struct udevice *dev)
>   	if (!ret && args.args_count < 3)
>   		return -EINVAL;
>   
> -	if (ret == -ENOENT) {
> -		uc_priv->gpio_count = STM32_GPIOS_PER_BANK;
> +	uc_priv->gpio_count = STM32_GPIOS_PER_BANK;
> +	if (ret == -ENOENT)
>   		priv->gpio_range = GENMASK(STM32_GPIOS_PER_BANK - 1, 0);
> -	}
>   
>   	while (ret != -ENOENT) {
>   		priv->gpio_range |= GENMASK(args.args[2] + args.args[0] - 1,
>   				    args.args[0]);
>   
> -		uc_priv->gpio_count += args.args[2];
> -
>   		ret = dev_read_phandle_with_args(dev, "gpio-ranges", NULL, 3,
>   						 ++i, &args);
>   		if (!ret && args.args_count < 3)
> diff --git a/drivers/gpio/stm32_gpio_priv.h b/drivers/gpio/stm32_gpio_priv.h
> index d3d8f2ed5d..662a000fe7 100644
> --- a/drivers/gpio/stm32_gpio_priv.h
> +++ b/drivers/gpio/stm32_gpio_priv.h
> @@ -81,6 +81,4 @@ struct stm32_gpio_priv {
>   	unsigned int gpio_range;
>   };
>   
> -int stm32_offset_to_index(struct udevice *dev, unsigned int offset);
> -
>   #endif /* _STM32_GPIO_PRIV_H_ */
> diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
> index 373f51f046..56a20e8bd2 100644
> --- a/drivers/pinctrl/pinctrl_stm32.c
> +++ b/drivers/pinctrl/pinctrl_stm32.c
> @@ -157,10 +157,7 @@ static struct udevice *stm32_pinctrl_get_gpio_dev(struct udevice *dev,
>   			 * we found the bank, convert pin selector to
>   			 * gpio bank index
>   			 */
> -			*idx = stm32_offset_to_index(gpio_bank->gpio_dev,
> -						     selector - pin_count);
> -			if (IS_ERR_VALUE(*idx))
> -				return NULL;
> +			*idx = selector - pin_count;
>   
>   			return gpio_bank->gpio_dev;
>   		}


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
