Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB372FFE37
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Jan 2021 09:33:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9991FC3FADC;
	Fri, 22 Jan 2021 08:33:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86F6DC3FADB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jan 2021 08:33:33 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10M8WisK022991; Fri, 22 Jan 2021 09:33:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=owct/e6QNnquF8yKQX5mCcZYJnQbMXxvUF1mdMj55Wg=;
 b=8CKwBvuQfIUiR+PpXU+rjQe15PrFhSTQ3/X3FuD7CkD2xSdSNUzK0bWr7OoTMxbFtBRf
 b3IFnNTem8X/SqlREdxGWuQS0dtLKUWF7asSzCYejAfSv3LpH885x3KPXxhfJqD5JMNs
 RqzDfA6IV0YfNXth7XQbD3GXXN53cRj0dlRnJ6m+zBXZ9y86SbVTKCQ5LnfoeMzAMzbA
 pdlTnjv7MN/QoNeN6R6EcwDNlIJI9kPiycvL9T8gXkxNVKHdyEA59v3hJYvlozULIngX
 Uinj6lC540AnlBv8vUl0V704a94M7xuQ4CWi62ZhCWV2EUZfm+cI/P1Z/vQs/ddiYxrM Rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3668q0848r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 09:33:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8B14A10002A;
 Fri, 22 Jan 2021 09:33:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 746A5223F08;
 Fri, 22 Jan 2021 09:33:30 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 22 Jan
 2021 09:33:29 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210121163908.17678-1-patrick.delaunay@foss.st.com>
 <20210121173856.1.Icf7e03823d5975be1d5ec623652c893849882657@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <34056144-6874-cdd5-86a8-095102ddda9f@foss.st.com>
Date: Fri, 22 Jan 2021 09:33:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210121173856.1.Icf7e03823d5975be1d5ec623652c893849882657@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-22_03:2021-01-21,
 2021-01-22 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] pinctrl: stm32: correct management
 pin display of OTYPE
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

On 1/21/21 5:39 PM, Patrick Delaunay wrote:
> OTYPE can be used for output or for alternate function to select
> PP = push-pull or OP = open-drain mode, according reference manual
> (Table 81. Port bit configuration table).
> 
> This patch removes this indication for input pins and adds it
> for AF and output pins for pinmux command output.
> 
> Fixes: b305dbc08b08 ("pinctrl: stm32: display bias information for all pins")
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/pinctrl/pinctrl_stm32.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
> index a1f53a793b..374f76d881 100644
> --- a/drivers/pinctrl/pinctrl_stm32.c
> +++ b/drivers/pinctrl/pinctrl_stm32.c
> @@ -56,7 +56,7 @@ static const char * const pinmux_bias[] = {
>  	[STM32_GPIO_PUPD_DOWN] = "pull-down",
>  };
>  
> -static const char * const pinmux_input[] = {
> +static const char * const pinmux_otype[] = {
>  	[STM32_GPIO_OTYPE_PP] = "push-pull",
>  	[STM32_GPIO_OTYPE_OD] = "open-drain",
>  };
> @@ -216,7 +216,7 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
>  		selector, gpio_idx, mode);
>  	priv = dev_get_priv(gpio_dev);
>  	pupd = (readl(&priv->regs->pupdr) >> (gpio_idx * 2)) & PUPD_MASK;
> -
> +	otype = (readl(&priv->regs->otyper) >> gpio_idx) & OTYPE_MSK;
>  
>  	switch (mode) {
>  	case GPIOF_UNKNOWN:
> @@ -227,18 +227,16 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
>  		break;
>  	case GPIOF_FUNC:
>  		af_num = stm32_pinctrl_get_af(gpio_dev, gpio_idx);
> -		snprintf(buf, size, "%s %d %s", pinmux_mode[mode], af_num,
> -			 pinmux_bias[pupd]);
> +		snprintf(buf, size, "%s %d %s %s", pinmux_mode[mode], af_num,
> +			 pinmux_otype[otype], pinmux_bias[pupd]);
>  		break;
>  	case GPIOF_OUTPUT:
> -		snprintf(buf, size, "%s %s %s",
> -			 pinmux_mode[mode], pinmux_bias[pupd],
> -			 label ? label : "");
> +		snprintf(buf, size, "%s %s %s %s",
> +			 pinmux_mode[mode], pinmux_otype[otype],
> +			 pinmux_bias[pupd], label ? label : "");
>  		break;
>  	case GPIOF_INPUT:
> -		otype = (readl(&priv->regs->otyper) >> gpio_idx) & OTYPE_MSK;
> -		snprintf(buf, size, "%s %s %s %s",
> -			 pinmux_mode[mode], pinmux_input[otype],
> +		snprintf(buf, size, "%s %s %s", pinmux_mode[mode],
>  			 pinmux_bias[pupd], label ? label : "");
>  		break;
>  	}
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
