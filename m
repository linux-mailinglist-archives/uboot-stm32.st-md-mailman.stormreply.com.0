Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E439E211D48
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 09:48:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AAE9C36B25
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 07:48:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDBD9C36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 07:48:14 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0627j0k9008035; Thu, 2 Jul 2020 09:48:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Cx62tkX2E5ZP4oMezzIzjZmUJLhD7y2IRPXyXvM9fUo=;
 b=zGq1HbPIS0J5T1eGkQ/c1Rdy+oxgDmlDImeUDy1b888uPRWL+4sy6Y9A+ajw+Bhx+Kz0
 CIoGTSzFJt3J8FtCt1KksglM3bWWEJkjqyVuplxd6MSv7a2OLP4iMAdeNLiJN6jc5vAH
 vbPrhqe5VOtMQvXcVkcq+rq4kEJDDs5Fb6cf+DF9fZj3Lmx1gcDwKJaPzClbXJMe7UeV
 fR2hSa0b6RBlRLvCtn7zzcjNJjKg1Ua1XRsIm4LI85YimZ5qbgxcGok7JMaXt6tbSLH7
 dx+owxUmAavrBGWnZBZsNbuzuXjGrN+MpHcG87sxZC/MPzrpugYyAWHm2PYtGPPNO5Eg nA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuvwejvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 09:48:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 138D910002A;
 Thu,  2 Jul 2020 09:48:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 09A2921F672;
 Thu,  2 Jul 2020 09:48:11 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 Jul
 2020 09:48:10 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 09:48:10 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 03/11] gpio: stm32: add ops set_dir_flags
Thread-Index: AQHWOmvz95v9S3b+fEWliL6JFLCQuqjz8+KA
Date: Thu, 2 Jul 2020 07:48:10 +0000
Message-ID: <2cd7c464-28e1-2316-eb79-62b7c258062b@st.com>
References: <20200604123033.25499-1-patrick.delaunay@st.com>
 <20200604143022.v2.3.I41efb7f94304e2a2c1f0cc7dc1397728bc6ed91a@changeid>
In-Reply-To: <20200604143022.v2.3.I41efb7f94304e2a2c1f0cc7dc1397728bc6ed91a@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <FE498C3AD765AF42982142E87031F979@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 03/11] gpio: stm32: add ops
	set_dir_flags
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
> Manage flags for GPIO configuration:
> - open_drain, open_source, push_pull
> - pull_up, pull_down
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2: None
>
>  drivers/gpio/stm32_gpio.c | 90 +++++++++++++++++++++++++++++++++------
>  1 file changed, 76 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpio/stm32_gpio.c b/drivers/gpio/stm32_gpio.c
> index 4f710b6b6a..f120ee9808 100644
> --- a/drivers/gpio/stm32_gpio.c
> +++ b/drivers/gpio/stm32_gpio.c
> @@ -18,9 +18,48 @@
>  #include <linux/errno.h>
>  #include <linux/io.h>
>  
> -#define MODE_BITS(gpio_pin)		(gpio_pin * 2)
> +#define MODE_BITS(gpio_pin)		((gpio_pin) * 2)
>  #define MODE_BITS_MASK			3
> -#define BSRR_BIT(gpio_pin, value)	BIT(gpio_pin + (value ? 0 : 16))
> +#define BSRR_BIT(gpio_pin, value)	BIT((gpio_pin) + (value ? 0 : 16))
> +
> +#define PUPD_BITS(gpio_pin)		((gpio_pin) * 2)
> +#define PUPD_MASK			3
> +
> +#define OTYPE_BITS(gpio_pin)		(gpio_pin)
> +#define OTYPE_MSK			1
> +
> +static void stm32_gpio_set_moder(struct stm32_gpio_regs *regs,
> +				 int idx,
> +				 int mode)
> +{
> +	int bits_index;
> +	int mask;
> +
> +	bits_index = MODE_BITS(idx);
> +	mask = MODE_BITS_MASK << bits_index;
> +
> +	clrsetbits_le32(&regs->moder, mask, mode << bits_index);
> +}
> +
> +static void stm32_gpio_set_otype(struct stm32_gpio_regs *regs,
> +				 int idx,
> +				 enum stm32_gpio_otype otype)
> +{
> +	int bits;
> +
> +	bits = OTYPE_BITS(idx);
> +	clrsetbits_le32(&regs->otyper, OTYPE_MSK << bits, otype << bits);
> +}
> +
> +static void stm32_gpio_set_pupd(struct stm32_gpio_regs *regs,
> +				int idx,
> +				enum stm32_gpio_pupd pupd)
> +{
> +	int bits;
> +
> +	bits = PUPD_BITS(idx);
> +	clrsetbits_le32(&regs->pupdr, PUPD_MASK << bits, pupd << bits);
> +}
>  
>  /*
>   * convert gpio offset to gpio index taking into account gpio holes
> @@ -47,18 +86,13 @@ static int stm32_gpio_direction_input(struct udevice *dev, unsigned offset)
>  {
>  	struct stm32_gpio_priv *priv = dev_get_priv(dev);
>  	struct stm32_gpio_regs *regs = priv->regs;
> -	int bits_index;
> -	int mask;
>  	int idx;
>  
>  	idx = stm32_offset_to_index(dev, offset);
>  	if (idx < 0)
>  		return idx;
>  
> -	bits_index = MODE_BITS(idx);
> -	mask = MODE_BITS_MASK << bits_index;
> -
> -	clrsetbits_le32(&regs->moder, mask, STM32_GPIO_MODE_IN << bits_index);
> +	stm32_gpio_set_moder(regs, idx, STM32_GPIO_MODE_IN);
>  
>  	return 0;
>  }
> @@ -68,18 +102,13 @@ static int stm32_gpio_direction_output(struct udevice *dev, unsigned offset,
>  {
>  	struct stm32_gpio_priv *priv = dev_get_priv(dev);
>  	struct stm32_gpio_regs *regs = priv->regs;
> -	int bits_index;
> -	int mask;
>  	int idx;
>  
>  	idx = stm32_offset_to_index(dev, offset);
>  	if (idx < 0)
>  		return idx;
>  
> -	bits_index = MODE_BITS(idx);
> -	mask = MODE_BITS_MASK << bits_index;
> -
> -	clrsetbits_le32(&regs->moder, mask, STM32_GPIO_MODE_OUT << bits_index);
> +	stm32_gpio_set_moder(regs, idx, STM32_GPIO_MODE_OUT);
>  
>  	writel(BSRR_BIT(idx, value), &regs->bsrr);
>  
> @@ -141,12 +170,45 @@ static int stm32_gpio_get_function(struct udevice *dev, unsigned int offset)
>  	return GPIOF_FUNC;
>  }
>  
> +static int stm32_gpio_set_dir_flags(struct udevice *dev, unsigned int offset,
> +				    ulong flags)
> +{
> +	struct stm32_gpio_priv *priv = dev_get_priv(dev);
> +	struct stm32_gpio_regs *regs = priv->regs;
> +	int idx;
> +
> +	idx = stm32_offset_to_index(dev, offset);
> +	if (idx < 0)
> +		return idx;
> +
> +	if (flags & GPIOD_IS_OUT) {
> +		int value = GPIOD_FLAGS_OUTPUT(flags);
> +
> +		if (flags & GPIOD_OPEN_DRAIN)
> +			stm32_gpio_set_otype(regs, idx, STM32_GPIO_OTYPE_OD);
> +		else
> +			stm32_gpio_set_otype(regs, idx, STM32_GPIO_OTYPE_PP);
> +		stm32_gpio_set_moder(regs, idx, STM32_GPIO_MODE_OUT);
> +		writel(BSRR_BIT(idx, value), &regs->bsrr);
> +
> +	} else if (flags & GPIOD_IS_IN) {
> +		stm32_gpio_set_moder(regs, idx, STM32_GPIO_MODE_IN);
> +		if (flags & GPIOD_PULL_UP)
> +			stm32_gpio_set_pupd(regs, idx, STM32_GPIO_PUPD_UP);
> +		else if (flags & GPIOD_PULL_DOWN)
> +			stm32_gpio_set_pupd(regs, idx, STM32_GPIO_PUPD_DOWN);
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct dm_gpio_ops gpio_stm32_ops = {
>  	.direction_input	= stm32_gpio_direction_input,
>  	.direction_output	= stm32_gpio_direction_output,
>  	.get_value		= stm32_gpio_get_value,
>  	.set_value		= stm32_gpio_set_value,
>  	.get_function		= stm32_gpio_get_function,
> +	.set_dir_flags		= stm32_gpio_set_dir_flags,
>  };
>  
>  static int gpio_stm32_probe(struct udevice *dev)

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
