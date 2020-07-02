Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12222211D82
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 09:51:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C954FC36B25
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 07:51:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B56FBC36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 07:51:05 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0627o2ef029693; Thu, 2 Jul 2020 09:51:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=fdWoH9R7RxVWh21izs4a+mcsZbxXZ5KNfPmst3wWrig=;
 b=ikgLjCYUUoNzS+TdNTcFcpo2BIVF37S5pUIcv//FEoT8cnXhgsDp40h8piZpfYmuLAgc
 VjzeZ//3UO+sGGEqsDp068NtAiTFQD83zvuH2km652u2tM5fq0aIQR0onsXw6IZhr85H
 x0aYTPqduygOw2viPGDO7sy79FaByIjCeyS0pOGRCfSOiQIGsqjyJASEe9AysuzcYrPh
 51hcmx7a7cPY9SCfUEl/jAC4GVBHpSaf0I7SRiN2EWGAmRmEjhwzhyrNjQbxmU0E4fR8
 UwJKD7B/pPZ1fZycGOldz3rMgRMj6VcV7qzzDwe6U0DFnmjJcIi/jWxSs4qs8F7fA3ig Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuk1pmn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 09:51:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C1730100034;
 Thu,  2 Jul 2020 09:51:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B678621F673;
 Thu,  2 Jul 2020 09:51:03 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 Jul
 2020 09:51:03 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 09:51:03 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 04/11] gpio: stm32: add ops get_dir_flags
Thread-Index: AQHWOmvza6a80eR9tUGT+hgeKGxszqjz9LEA
Date: Thu, 2 Jul 2020 07:51:03 +0000
Message-ID: <7a4ba0e5-7166-6d55-8862-edaa6b737b16@st.com>
References: <20200604123033.25499-1-patrick.delaunay@st.com>
 <20200604143022.v2.4.I10d17ebccc888338f2b9f23a803aee50c0f8e089@changeid>
In-Reply-To: <20200604143022.v2.4.I10d17ebccc888338f2b9f23a803aee50c0f8e089@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <5FC3DEB87D7F47498352B8C106103CA4@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 04/11] gpio: stm32: add ops
	get_dir_flags
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
> Add ops get_dir_flags() to read dir flags from GPIO registers.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2: None
>
>  drivers/gpio/stm32_gpio.c | 59 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>
> diff --git a/drivers/gpio/stm32_gpio.c b/drivers/gpio/stm32_gpio.c
> index f120ee9808..5bff27f75b 100644
> --- a/drivers/gpio/stm32_gpio.c
> +++ b/drivers/gpio/stm32_gpio.c
> @@ -41,6 +41,11 @@ static void stm32_gpio_set_moder(struct stm32_gpio_regs *regs,
>  	clrsetbits_le32(&regs->moder, mask, mode << bits_index);
>  }
>  
> +static int stm32_gpio_get_moder(struct stm32_gpio_regs *regs, int idx)
> +{
> +	return (readl(&regs->moder) >> MODE_BITS(idx)) & MODE_BITS_MASK;
> +}
> +
>  static void stm32_gpio_set_otype(struct stm32_gpio_regs *regs,
>  				 int idx,
>  				 enum stm32_gpio_otype otype)
> @@ -51,6 +56,12 @@ static void stm32_gpio_set_otype(struct stm32_gpio_regs *regs,
>  	clrsetbits_le32(&regs->otyper, OTYPE_MSK << bits, otype << bits);
>  }
>  
> +static enum stm32_gpio_otype stm32_gpio_get_otype(struct stm32_gpio_regs *regs,
> +						  int idx)
> +{
> +	return (readl(&regs->otyper) >> OTYPE_BITS(idx)) & OTYPE_MSK;
> +}
> +
>  static void stm32_gpio_set_pupd(struct stm32_gpio_regs *regs,
>  				int idx,
>  				enum stm32_gpio_pupd pupd)
> @@ -61,6 +72,12 @@ static void stm32_gpio_set_pupd(struct stm32_gpio_regs *regs,
>  	clrsetbits_le32(&regs->pupdr, PUPD_MASK << bits, pupd << bits);
>  }
>  
> +static enum stm32_gpio_pupd stm32_gpio_get_pupd(struct stm32_gpio_regs *regs,
> +						int idx)
> +{
> +	return (readl(&regs->pupdr) >> PUPD_BITS(idx)) & PUPD_MASK;
> +}
> +
>  /*
>   * convert gpio offset to gpio index taking into account gpio holes
>   * into gpio bank
> @@ -202,6 +219,47 @@ static int stm32_gpio_set_dir_flags(struct udevice *dev, unsigned int offset,
>  	return 0;
>  }
>  
> +static int stm32_gpio_get_dir_flags(struct udevice *dev, unsigned int offset,
> +				    ulong *flags)
> +{
> +	struct stm32_gpio_priv *priv = dev_get_priv(dev);
> +	struct stm32_gpio_regs *regs = priv->regs;
> +	int idx;
> +	ulong dir_flags = 0;
> +
> +	idx = stm32_offset_to_index(dev, offset);
> +	if (idx < 0)
> +		return idx;
> +
> +	switch (stm32_gpio_get_moder(regs, idx)) {
> +	case STM32_GPIO_MODE_OUT:
> +		dir_flags |= GPIOD_IS_OUT;
> +		if (stm32_gpio_get_otype(regs, idx) == STM32_GPIO_OTYPE_OD)
> +			dir_flags |= GPIOD_OPEN_DRAIN;
> +		if (readl(&regs->idr) & BIT(idx))
> +			dir_flags |= GPIOD_IS_OUT_ACTIVE;
> +		break;
> +	case STM32_GPIO_MODE_IN:
> +		dir_flags |= GPIOD_IS_IN;
> +		switch (stm32_gpio_get_pupd(regs, idx)) {
> +		case STM32_GPIO_PUPD_UP:
> +			dir_flags |= GPIOD_PULL_UP;
> +			break;
> +		case STM32_GPIO_PUPD_DOWN:
> +			dir_flags |= GPIOD_PULL_DOWN;
> +			break;
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +	*flags = dir_flags;
> +
> +	return 0;
> +}
> +
>  static const struct dm_gpio_ops gpio_stm32_ops = {
>  	.direction_input	= stm32_gpio_direction_input,
>  	.direction_output	= stm32_gpio_direction_output,
> @@ -209,6 +267,7 @@ static const struct dm_gpio_ops gpio_stm32_ops = {
>  	.set_value		= stm32_gpio_set_value,
>  	.get_function		= stm32_gpio_get_function,
>  	.set_dir_flags		= stm32_gpio_set_dir_flags,
> +	.get_dir_flags		= stm32_gpio_get_dir_flags,
>  };
>  
>  static int gpio_stm32_probe(struct udevice *dev)

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
