Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E31211D99
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 09:57:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31CC4C36B25
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 07:57:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B71AC36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 07:57:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0627n0tC031602; Thu, 2 Jul 2020 09:56:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=BwifXHlclFMs6nXtQgH4pDIQ+dFDMzL3tf3rJfm52yk=;
 b=PEEijUCeQb1IgJg+2KEJNAOLAQ6kdjG0Q7LLJLO5Un+d6pVIPRh6EBk52vt1wLqRzKR6
 njU4dDTk+F0tO2twb4KPhDgOmL472bsewWdJNjtp6STUmhdmrzyVI+7Hl7hEalGkxM82
 TymP3VUJSODLjLgGhivR9CFG417m8rfQFq9lvjOgnV+XqTPWTqHDQZwPvmibqVpmPOqV
 OUDauidrHMU1cM/BKfayjlTWTj7jotjn/UPYZmBgHTcWkkKcgCQ9xJd7E4c0EdX/+Jga
 iW4Q4cEOyMDZnPYQaxb7cjALdoUJ5etfVw6ZHyY4311pjlUV5XURggavmJ1wSswaDNir Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31ww0genr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 09:56:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8AF87100034;
 Thu,  2 Jul 2020 09:56:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 818B020D8E1;
 Thu,  2 Jul 2020 09:56:57 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 Jul
 2020 09:56:57 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 09:56:57 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 07/11] gpio: stmfx: add function stmfx_read_reg and
 stmfx_write_reg
Thread-Index: AQHWOmv11NgqX1X1hEucoYmbZ8kwMKjz9lcA
Date: Thu, 2 Jul 2020 07:56:56 +0000
Message-ID: <4e9fe3d1-9b56-4257-2a8a-9a208e0c4723@st.com>
References: <20200604123033.25499-1-patrick.delaunay@st.com>
 <20200604123033.25499-5-patrick.delaunay@st.com>
In-Reply-To: <20200604123033.25499-5-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <9F7C811ACF06604AB317F31C82DD6784@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2 07/11] gpio: stmfx: add function
 stmfx_read_reg and stmfx_write_reg
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
> Add the helper functions stmfx_read_reg() and stmfx_write_reg() to avoid
> duplicated code for access to stmfx's register with mask.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - NEW: split previous patch [5/5] gpio: stmfx: add set_config ops
>
>  drivers/pinctrl/pinctrl-stmfx.c | 68 +++++++++++++--------------------
>  1 file changed, 26 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
> index 657ca2e240..5d15424b84 100644
> --- a/drivers/pinctrl/pinctrl-stmfx.c
> +++ b/drivers/pinctrl/pinctrl-stmfx.c
> @@ -74,43 +74,49 @@ static int stmfx_write(struct udevice *dev, uint offset, unsigned int val)
>  	return dm_i2c_reg_write(dev_get_parent(dev), offset, val);
>  }
>  
> -static int stmfx_conf_set_pupd(struct udevice *dev, unsigned int pin, u32 pupd)
> +static int stmfx_read_reg(struct udevice *dev, u8 reg_base, uint offset)
>  {
> -	u8 reg = STMFX_REG_GPIO_PUPD + get_reg(pin);
> -	u32 mask = get_mask(pin);
> +	u8 reg = reg_base + get_reg(offset);
> +	u32 mask = get_mask(offset);
>  	int ret;
>  
>  	ret = stmfx_read(dev, reg);
>  	if (ret < 0)
>  		return ret;
> -	ret = (ret & ~mask) | (pupd ? mask : 0);
>  
> -	return stmfx_write(dev, reg, ret);
> +	return ret < 0 ? ret : !!(ret & mask);
>  }
>  
> -static int stmfx_conf_set_type(struct udevice *dev, unsigned int pin, u32 type)
> +static int stmfx_write_reg(struct udevice *dev, u8 reg_base, uint offset,
> +			   uint val)
>  {
> -	u8 reg = STMFX_REG_GPIO_TYPE + get_reg(pin);
> -	u32 mask = get_mask(pin);
> +	u8 reg = reg_base + get_reg(offset);
> +	u32 mask = get_mask(offset);
>  	int ret;
>  
>  	ret = stmfx_read(dev, reg);
>  	if (ret < 0)
>  		return ret;
> -	ret = (ret & ~mask) | (type ? mask : 0);
> +	ret = (ret & ~mask) | (val ? mask : 0);
>  
>  	return stmfx_write(dev, reg, ret);
>  }
>  
> -static int stmfx_gpio_get(struct udevice *dev, unsigned int offset)
> +static int stmfx_conf_set_pupd(struct udevice *dev, unsigned int offset,
> +			       uint pupd)
>  {
> -	u32 reg = STMFX_REG_GPIO_STATE + get_reg(offset);
> -	u32 mask = get_mask(offset);
> -	int ret;
> +	return stmfx_write_reg(dev, STMFX_REG_GPIO_PUPD, offset, pupd);
> +}
>  
> -	ret = stmfx_read(dev, reg);
> +static int stmfx_conf_set_type(struct udevice *dev, unsigned int offset,
> +			       uint type)
> +{
> +	return stmfx_write_reg(dev, STMFX_REG_GPIO_TYPE, offset, type);
> +}
>  
> -	return ret < 0 ? ret : !!(ret & mask);
> +static int stmfx_gpio_get(struct udevice *dev, unsigned int offset)
> +{
> +	return stmfx_read_reg(dev, STMFX_REG_GPIO_STATE, offset);
>  }
>  
>  static int stmfx_gpio_set(struct udevice *dev, unsigned int offset, int value)
> @@ -123,50 +129,28 @@ static int stmfx_gpio_set(struct udevice *dev, unsigned int offset, int value)
>  
>  static int stmfx_gpio_get_function(struct udevice *dev, unsigned int offset)
>  {
> -	u32 reg = STMFX_REG_GPIO_DIR + get_reg(offset);
> -	u32 mask = get_mask(offset);
> -	int ret;
> -
> -	ret = stmfx_read(dev, reg);
> +	int ret = stmfx_read_reg(dev, STMFX_REG_GPIO_DIR, offset);
>  
>  	if (ret < 0)
>  		return ret;
>  	/* On stmfx, gpio pins direction is (0)input, (1)output. */
>  
> -	return ret & mask ? GPIOF_OUTPUT : GPIOF_INPUT;
> +	return ret ? GPIOF_OUTPUT : GPIOF_INPUT;
>  }
>  
>  static int stmfx_gpio_direction_input(struct udevice *dev, unsigned int offset)
>  {
> -	u32 reg = STMFX_REG_GPIO_DIR + get_reg(offset);
> -	u32 mask = get_mask(offset);
> -	int ret;
> -
> -	ret = stmfx_read(dev, reg);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret &= ~mask;
> -
> -	return stmfx_write(dev, reg, ret & ~mask);
> +	return stmfx_write_reg(dev, STMFX_REG_GPIO_DIR, offset, 0);
>  }
>  
>  static int stmfx_gpio_direction_output(struct udevice *dev,
>  				       unsigned int offset, int value)
>  {
> -	u32 reg = STMFX_REG_GPIO_DIR + get_reg(offset);
> -	u32 mask = get_mask(offset);
> -	int ret;
> -
> -	ret = stmfx_gpio_set(dev, offset, value);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = stmfx_read(dev, reg);
> +	int ret = stmfx_gpio_set(dev, offset, value);
>  	if (ret < 0)
>  		return ret;
>  
> -	return stmfx_write(dev, reg, ret | mask);
> +	return stmfx_write_reg(dev, STMFX_REG_GPIO_DIR, offset, 1);
>  }
>  
>  static int stmfx_gpio_probe(struct udevice *dev)

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
