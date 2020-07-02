Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A555211D83
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 09:51:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D62D9C36B25
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 07:51:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B612C36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 07:51:28 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0627mxmr015480; Thu, 2 Jul 2020 09:51:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=IaP6MpGUzSmqaBFgmFK3cnLDSWHOFFBLSGxOWCP53u8=;
 b=0kVnwe/XUTsPEUGxNALtiPRgZqTEq+9cg0a/w4j/ujoYoq7hWn6wQ+Ugf6/qjTfJY6GU
 Ky2Fy0+H+zxMLj/Y2GouLHowJg83Usczo2LZUyNXybNU2e6rj2LjZN3aUb9ceWgPfQf4
 UUm+0x4On+PUpzak4haRWYXp0AuO8PdFM2JIAZTUEh5IDiQ0gbHpcUzy1q8+37Djqvud
 UmDWoRzLA4xxXAptAgxVIR8Kvmw8tgsnDB3kqc96B6pSGKlapMaKzFNG6p2osEkaFgSA
 n2305pYRH77wO/74QHlxwTHqk5b1gbI/0Okw1O5cJr4urUhbcxkkoWqn26TJgTQhMlb6 UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuvwekht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 09:51:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2191F10002A;
 Thu,  2 Jul 2020 09:51:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 16DDA21F674;
 Thu,  2 Jul 2020 09:51:25 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 Jul
 2020 09:51:24 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 09:51:24 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 05/11] gpio: stmfx: move function to prepare new ops
 introduction
Thread-Index: AQHWOmv0DheSa/0K8UWopXkIMVYkoqjz9MsA
Date: Thu, 2 Jul 2020 07:51:24 +0000
Message-ID: <60692223-221e-93c8-46c8-098231d7d9fc@st.com>
References: <20200604123033.25499-1-patrick.delaunay@st.com>
 <20200604123033.25499-3-patrick.delaunay@st.com>
In-Reply-To: <20200604123033.25499-3-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <C8CD21677C10CB47BC3F0B19026F529C@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2 05/11] gpio: stmfx: move function to
 prepare new ops introduction
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
> Move the functions stmfx_pinctrl_set_pupd and stmfx_pinctrl_set_type;
> they can be used by the new ops get_dir_flags and set_dir_flags introduced
> by next patch.
>
> No functional change.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - NEW: split previous patch [5/5] gpio: stmfx: add set_config ops
>
>  drivers/pinctrl/pinctrl-stmfx.c | 60 ++++++++++++++++-----------------
>  1 file changed, 30 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
> index a3240ccd5a..d74121725c 100644
> --- a/drivers/pinctrl/pinctrl-stmfx.c
> +++ b/drivers/pinctrl/pinctrl-stmfx.c
> @@ -74,6 +74,36 @@ static int stmfx_write(struct udevice *dev, uint offset, unsigned int val)
>  	return dm_i2c_reg_write(dev_get_parent(dev), offset, val);
>  }
>  
> +static int stmfx_pinctrl_set_pupd(struct udevice *dev,
> +				  unsigned int pin, u32 pupd)
> +{
> +	u8 reg = STMFX_REG_GPIO_PUPD + get_reg(pin);
> +	u32 mask = get_mask(pin);
> +	int ret;
> +
> +	ret = stmfx_read(dev, reg);
> +	if (ret < 0)
> +		return ret;
> +	ret = (ret & ~mask) | (pupd ? mask : 0);
> +
> +	return stmfx_write(dev, reg, ret);
> +}
> +
> +static int stmfx_pinctrl_set_type(struct udevice *dev,
> +				  unsigned int pin, u32 type)
> +{
> +	u8 reg = STMFX_REG_GPIO_TYPE + get_reg(pin);
> +	u32 mask = get_mask(pin);
> +	int ret;
> +
> +	ret = stmfx_read(dev, reg);
> +	if (ret < 0)
> +		return ret;
> +	ret = (ret & ~mask) | (type ? mask : 0);
> +
> +	return stmfx_write(dev, reg, ret);
> +}
> +
>  static int stmfx_gpio_get(struct udevice *dev, unsigned int offset)
>  {
>  	u32 reg = STMFX_REG_GPIO_STATE + get_reg(offset);
> @@ -190,36 +220,6 @@ static const struct pinconf_param stmfx_pinctrl_conf_params[] = {
>  	{ "output-low", PIN_CONFIG_OUTPUT, 0 },
>  };
>  
> -static int stmfx_pinctrl_set_pupd(struct udevice *dev,
> -				  unsigned int pin, u32 pupd)
> -{
> -	u8 reg = STMFX_REG_GPIO_PUPD + get_reg(pin);
> -	u32 mask = get_mask(pin);
> -	int ret;
> -
> -	ret = stmfx_read(dev, reg);
> -	if (ret < 0)
> -		return ret;
> -	ret = (ret & ~mask) | (pupd ? mask : 0);
> -
> -	return stmfx_write(dev, reg, ret);
> -}
> -
> -static int stmfx_pinctrl_set_type(struct udevice *dev,
> -				  unsigned int pin, u32 type)
> -{
> -	u8 reg = STMFX_REG_GPIO_TYPE + get_reg(pin);
> -	u32 mask = get_mask(pin);
> -	int ret;
> -
> -	ret = stmfx_read(dev, reg);
> -	if (ret < 0)
> -		return ret;
> -	ret = (ret & ~mask) | (type ? mask : 0);
> -
> -	return stmfx_write(dev, reg, ret);
> -}
> -
>  static int stmfx_pinctrl_conf_set(struct udevice *dev, unsigned int pin,
>  				  unsigned int param, unsigned int arg)
>  {

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
