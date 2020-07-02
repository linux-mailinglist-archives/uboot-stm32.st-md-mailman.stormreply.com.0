Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 809F6211DA0
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 09:58:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 498FFC36B25
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 07:58:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78B6DC36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 07:58:11 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0627pHIi029250; Thu, 2 Jul 2020 09:58:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=MbR4F3BA4RC54P+kbSAgMvE1vT/xqXTeefgOuIIgFrc=;
 b=s21DnBk20LLE8GA2PmB4qlX4LVEKHkt1W5RBmS8/BOeGAP/488YsrJh/HM3KQls0ilVI
 y2AZFspIkc8/4/oUE3u/XStcgaP7ZG7kpb2HtkxyP7g800IYYqDrFgGGHxkAU1Z5Lct9
 eN8a+/40kw+rQM4aPtCu+ormB8fek4tsAP6lyPQWeZdmB5ax6biT872ubdzDM79EN3+C
 QATqHpNj6YBnA3/Y8EVslnb90rnmLCkOkeTof2cvMezaA3ogqDy6qfxsrKF9qvJXFbkI
 r7LMhVTNjDaoUG3+PCVETX+Gyx9PqI1s0n7U8Th4z349Z9zsvUYCAWhg2wIpGyxXFwwK jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wu89y2yp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 09:58:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6C5C210002A;
 Thu,  2 Jul 2020 09:58:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6291F21F677;
 Thu,  2 Jul 2020 09:58:08 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 Jul
 2020 09:58:07 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 09:58:07 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 08/11] gpio: stmfx: add ops set_dir_flag
Thread-Index: AQHWOmv1ilZGVZ3MsUWpfiuIUWKQNKjz9quA
Date: Thu, 2 Jul 2020 07:58:07 +0000
Message-ID: <0126706b-de89-2259-cee7-39176ec29312@st.com>
References: <20200604123033.25499-1-patrick.delaunay@st.com>
 <20200604123033.25499-6-patrick.delaunay@st.com>
In-Reply-To: <20200604123033.25499-6-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <0D81D0BAC630CB4D9A6DE2410CC64158@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2 08/11] gpio: stmfx: add ops set_dir_flag
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
> Manage the flags for GPIO configuration:
> - open_drain, push_pull
> - pull_up, pull_down
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2: None
>
>  drivers/pinctrl/pinctrl-stmfx.c | 37 +++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
> index 5d15424b84..88df9e61a7 100644
> --- a/drivers/pinctrl/pinctrl-stmfx.c
> +++ b/drivers/pinctrl/pinctrl-stmfx.c
> @@ -153,6 +153,42 @@ static int stmfx_gpio_direction_output(struct udevice *dev,
>  	return stmfx_write_reg(dev, STMFX_REG_GPIO_DIR, offset, 1);
>  }
>  
> +static int stmfx_gpio_set_dir_flags(struct udevice *dev, unsigned int offset,
> +				    ulong flags)
> +{
> +	int ret = -ENOTSUPP;
> +
> +	if (flags & GPIOD_IS_OUT) {
> +		if (flags & GPIOD_OPEN_SOURCE)
> +			return -ENOTSUPP;
> +		if (flags & GPIOD_OPEN_DRAIN)
> +			ret = stmfx_conf_set_type(dev, offset, 0);
> +		else /* PUSH-PULL */
> +			ret = stmfx_conf_set_type(dev, offset, 1);
> +		if (ret)
> +			return ret;
> +		ret = stmfx_gpio_direction_output(dev, offset,
> +						  GPIOD_FLAGS_OUTPUT(flags));
> +	} else if (flags & GPIOD_IS_IN) {
> +		ret = stmfx_gpio_direction_input(dev, offset);
> +		if (ret)
> +			return ret;
> +		if (flags & GPIOD_PULL_UP) {
> +			ret = stmfx_conf_set_type(dev, offset, 1);
> +			if (ret)
> +				return ret;
> +			ret = stmfx_conf_set_pupd(dev, offset, 1);
> +		} else if (flags & GPIOD_PULL_DOWN) {
> +			ret = stmfx_conf_set_type(dev, offset, 1);
> +			if (ret)
> +				return ret;
> +			ret = stmfx_conf_set_pupd(dev, offset, 0);
> +		}
> +	}
> +
> +	return ret;
> +}
> +
>  static int stmfx_gpio_probe(struct udevice *dev)
>  {
>  	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
> @@ -181,6 +217,7 @@ static const struct dm_gpio_ops stmfx_gpio_ops = {
>  	.get_function = stmfx_gpio_get_function,
>  	.direction_input = stmfx_gpio_direction_input,
>  	.direction_output = stmfx_gpio_direction_output,
> +	.set_dir_flags = stmfx_gpio_set_dir_flags,
>  };
>  
>  U_BOOT_DRIVER(stmfx_gpio) = {

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
