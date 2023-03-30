Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 277E36D0327
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Mar 2023 13:29:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0295C69069;
	Thu, 30 Mar 2023 11:29:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E78FDC01E98
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Mar 2023 11:29:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32UAJagq022072; Thu, 30 Mar 2023 13:29:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=2AqqDXYR75TkiFoU+UhJRGvqdoLHnp2gjzYfZ+RaZ2c=;
 b=b1M6ky7ne3Sv9neJsEDNgbQ2QcvUzNZx0f5aRuiGgWl7zKIc8zBguY5dcYw0KeXb7v/q
 ABRgl+EyEY2GN9me//EySLC3mTcPltaeD/BvP0eaJdQ2aPjfO1yn5QJ8mN5Bp8hfbjTq
 ui3Tr4nU1WjGCMqgwKxl7vtqieF7sKWj+rB9ed+NYAT7yT3TAdZoGx7I7Z9lxSvC8ilB
 7EupzN4fhdmcCxRCtoqj4H+yiDnnGnIx6JhaSdfaYRTYo7eyfPlLPfsKVj6l1/cAlPMf
 QdNqJe0x19SAtsDKJi2mmUw485Sebk7hzwN+O+XH7pboVPi1OUNBIS+2kuAxQK1doTRz Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pn8jw8hqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Mar 2023 13:29:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0B9EC100034;
 Thu, 30 Mar 2023 13:29:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 012D62194CA;
 Thu, 30 Mar 2023 13:29:20 +0200 (CEST)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Thu, 30 Mar
 2023 13:29:19 +0200
Message-ID: <c4ee6ff3-fbbe-d01c-93be-dbb04282b760@foss.st.com>
Date: Thu, 30 Mar 2023 13:29:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20230327074641.44900-1-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20230327074641.44900-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-30_07,2023-03-30_02,2023-02-09_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] pinctrl: pinctrl_stm32: Add slew rate
 support for stm32_pinctrl_get_pin_muxing()
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

On 3/27/23 09:46, Patrice Chotard wrote:
> For debug purpose, it should be useful to indicate the slew rate for
> each pins.
> Add ospeed register information for pins which are configured in
> either alternate function or gpio output.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   drivers/pinctrl/pinctrl_stm32.c | 19 +++++++++++++++----
>   1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
> index b755fa42b4f..b06da50b2cd 100644
> --- a/drivers/pinctrl/pinctrl_stm32.c
> +++ b/drivers/pinctrl/pinctrl_stm32.c
> @@ -61,6 +61,13 @@ static const char * const pinmux_otype[] = {
>   	[STM32_GPIO_OTYPE_OD] = "open-drain",
>   };
>   
> +static const char * const pinmux_speed[] = {
> +	[STM32_GPIO_SPEED_2M] = "Low speed",
> +	[STM32_GPIO_SPEED_25M] = "Medium speed",
> +	[STM32_GPIO_SPEED_50M] = "High speed",
> +	[STM32_GPIO_SPEED_100M] = "Very-high speed",
> +};
> +
>   static int stm32_pinctrl_get_af(struct udevice *dev, unsigned int offset)
>   {
>   	struct stm32_gpio_priv *priv = dev_get_priv(dev);
> @@ -201,6 +208,7 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
>   	int af_num;
>   	unsigned int gpio_idx;
>   	u32 pupd, otype;
> +	u8 speed;
>   
>   	/* look up for the bank which owns the requested pin */
>   	gpio_dev = stm32_pinctrl_get_gpio_dev(dev, selector, &gpio_idx);
> @@ -214,6 +222,7 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
>   	priv = dev_get_priv(gpio_dev);
>   	pupd = (readl(&priv->regs->pupdr) >> (gpio_idx * 2)) & PUPD_MASK;
>   	otype = (readl(&priv->regs->otyper) >> gpio_idx) & OTYPE_MSK;
> +	speed = (readl(&priv->regs->ospeedr) >> gpio_idx * 2) & OSPEED_MASK;
>   
>   	switch (mode) {
>   	case GPIOF_UNKNOWN:
> @@ -222,13 +231,15 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
>   		break;
>   	case GPIOF_FUNC:
>   		af_num = stm32_pinctrl_get_af(gpio_dev, gpio_idx);
> -		snprintf(buf, size, "%s %d %s %s", pinmux_mode[mode], af_num,
> -			 pinmux_otype[otype], pinmux_bias[pupd]);
> +		snprintf(buf, size, "%s %d %s %s %s", pinmux_mode[mode], af_num,
> +			 pinmux_otype[otype], pinmux_bias[pupd],
> +			 pinmux_speed[speed]);
>   		break;
>   	case GPIOF_OUTPUT:
> -		snprintf(buf, size, "%s %s %s %s",
> +		snprintf(buf, size, "%s %s %s %s %s",
>   			 pinmux_mode[mode], pinmux_otype[otype],
> -			 pinmux_bias[pupd], label ? label : "");
> +			 pinmux_bias[pupd], label ? label : "",
> +			 pinmux_speed[speed]);
>   		break;
>   	case GPIOF_INPUT:
>   		snprintf(buf, size, "%s %s %s", pinmux_mode[mode],



Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
