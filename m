Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C90F211D88
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 09:52:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E68B1C36B25
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 07:52:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5525FC36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 07:51:59 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0627n3XE015653; Thu, 2 Jul 2020 09:51:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Cgp+PkkbyUJ7mcy+IxSEMAyNXg+vg+xQ+j89X924yZg=;
 b=pdm9tpkNZOZ/9zQuE39QQxyuL8PBk1lilwUPbu9QwcNsO2aOZFLYpdijOQ9R03ksfp6/
 BqqPys30qYkFyJ6fu6XU89yccZzokXFZpFOZ+FYguW90c4xK15D+suxbNHyci4Ogg6j1
 xBzPX4gFY323arSAcvIq2s8tIKd16N/dxt4AwWA1tWPuS/YVhx5eOZeXE15uF87RpJho
 iBa3Wu+mTICM5hkd83BzPYZyzRTgBq+12S0yQm1crEZ5p9/ekLDwChwTVD/0Bh7WItV7
 6SvstFY8QgHcXyk6eAjSYh8CTGpO9YMRNFHJzoORmasbhpqDrl53tF/cit/gtT5aA6z4 nQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuvwekmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 09:51:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7EE8F10002A;
 Thu,  2 Jul 2020 09:51:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 75A61210F8F;
 Thu,  2 Jul 2020 09:51:56 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 Jul
 2020 09:51:56 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 09:51:56 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 06/11] gpio: stmfx: rename function used to change pin
 configuration
Thread-Index: AQHWOmv0NmczMeVLGU2Eh1cnDZeXSKjz9PCA
Date: Thu, 2 Jul 2020 07:51:55 +0000
Message-ID: <08b8fca7-dc38-e9cd-71a6-3a87910f647c@st.com>
References: <20200604123033.25499-1-patrick.delaunay@st.com>
 <20200604123033.25499-4-patrick.delaunay@st.com>
In-Reply-To: <20200604123033.25499-4-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <9255BE9A793BC746B6753A2562AE5BC7@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2 06/11] gpio: stmfx: rename function
 used to change pin configuration
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
> Rename the two function used to change the pin configuration
> from stmfx_pinctrl_.. stmfx_conf_... to clarify the function usage.
>
> No functional change.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - NEW: split previous patch [5/5] gpio: stmfx: add set_config ops
>
>  drivers/pinctrl/pinctrl-stmfx.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
> index d74121725c..657ca2e240 100644
> --- a/drivers/pinctrl/pinctrl-stmfx.c
> +++ b/drivers/pinctrl/pinctrl-stmfx.c
> @@ -74,8 +74,7 @@ static int stmfx_write(struct udevice *dev, uint offset, unsigned int val)
>  	return dm_i2c_reg_write(dev_get_parent(dev), offset, val);
>  }
>  
> -static int stmfx_pinctrl_set_pupd(struct udevice *dev,
> -				  unsigned int pin, u32 pupd)
> +static int stmfx_conf_set_pupd(struct udevice *dev, unsigned int pin, u32 pupd)
>  {
>  	u8 reg = STMFX_REG_GPIO_PUPD + get_reg(pin);
>  	u32 mask = get_mask(pin);
> @@ -89,8 +88,7 @@ static int stmfx_pinctrl_set_pupd(struct udevice *dev,
>  	return stmfx_write(dev, reg, ret);
>  }
>  
> -static int stmfx_pinctrl_set_type(struct udevice *dev,
> -				  unsigned int pin, u32 type)
> +static int stmfx_conf_set_type(struct udevice *dev, unsigned int pin, u32 type)
>  {
>  	u8 reg = STMFX_REG_GPIO_TYPE + get_reg(pin);
>  	u32 mask = get_mask(pin);
> @@ -235,22 +233,22 @@ static int stmfx_pinctrl_conf_set(struct udevice *dev, unsigned int pin,
>  	case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
>  	case PIN_CONFIG_BIAS_DISABLE:
>  	case PIN_CONFIG_DRIVE_PUSH_PULL:
> -		ret = stmfx_pinctrl_set_type(dev, pin, 0);
> +		ret = stmfx_conf_set_type(dev, pin, 0);
>  		break;
>  	case PIN_CONFIG_BIAS_PULL_DOWN:
> -		ret = stmfx_pinctrl_set_type(dev, pin, 1);
> +		ret = stmfx_conf_set_type(dev, pin, 1);
>  		if (ret)
>  			return ret;
> -		ret = stmfx_pinctrl_set_pupd(dev, pin, 0);
> +		ret = stmfx_conf_set_pupd(dev, pin, 0);
>  		break;
>  	case PIN_CONFIG_BIAS_PULL_UP:
> -		ret = stmfx_pinctrl_set_type(dev, pin, 1);
> +		ret = stmfx_conf_set_type(dev, pin, 1);
>  		if (ret)
>  			return ret;
> -		ret = stmfx_pinctrl_set_pupd(dev, pin, 1);
> +		ret = stmfx_conf_set_pupd(dev, pin, 1);
>  		break;
>  	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> -		ret = stmfx_pinctrl_set_type(dev, pin, 1);
> +		ret = stmfx_conf_set_type(dev, pin, 1);
>  		break;
>  	case PIN_CONFIG_OUTPUT:
>  		ret = stmfx_gpio_direction_output(plat->gpio, pin, arg);

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
