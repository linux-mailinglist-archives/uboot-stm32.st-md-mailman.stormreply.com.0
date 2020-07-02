Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA49211DA1
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 09:58:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58FDAC36B25
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 07:58:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E50EC36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 07:58:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0627n0tc031602; Thu, 2 Jul 2020 09:58:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=6VQzcXkYlneAnQM3bNVhSaXD7CamrMTpqbMPQJwnqvs=;
 b=i1OJ4I0cmjg8FlUuYWDWNr0AyJctm+WuE3w/rCU705q2uiT/GzoB7ahDqK1EHfLng2ZG
 HKMa6PTvCbps0qxmH3+Rf6MWl6YZEq62scnrIfvfy0ITJ9wjbIhQZ4jZU/F9BDMrXeYT
 HKxYrKfURtnDeIkKF1i1HXPtQMcpfBaNnuStqDPV/Pkdtn1bahGWCA2LyUR5zmbbVbzE
 6VL9msJ+o47iMtSwwEywteaVa3wdjMVMdunE8ZboIn3yY2V12OmiFjgpnqyVF0TsDJY6
 EjamextyjMXdYIm/xI6VDv8VfH3hum4rKlaZB4iEBM6DrSIkRvzwvi/kqd/PUgjjhoky rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31ww0gep1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 09:58:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A553310002A;
 Thu,  2 Jul 2020 09:58:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9A34C21F68D;
 Thu,  2 Jul 2020 09:58:45 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 2 Jul
 2020 09:58:45 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 09:58:45 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 09/11] gpio: stmfx: add ops get_dir_flags
Thread-Index: AQHWOmv29bxgQT/7j0W/Uv7ieBduwKjz9tcA
Date: Thu, 2 Jul 2020 07:58:45 +0000
Message-ID: <7c313cec-1573-aa2b-20c6-eaa192bb721d@st.com>
References: <20200604123033.25499-1-patrick.delaunay@st.com>
 <20200604143022.v2.9.I375f10587b02d30722492fc1101aaf214c8a873b@changeid>
In-Reply-To: <20200604143022.v2.9.I375f10587b02d30722492fc1101aaf214c8a873b@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <CAE7DA3401C65F47BC74311CF1D574E3@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2 09/11] gpio: stmfx: add ops
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
> Add support of ops get_dir_flags() to read dir flags from
> STMFX registers.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2: None
>
>  drivers/pinctrl/pinctrl-stmfx.c | 50 +++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
> index 88df9e61a7..1d326ecf17 100644
> --- a/drivers/pinctrl/pinctrl-stmfx.c
> +++ b/drivers/pinctrl/pinctrl-stmfx.c
> @@ -108,12 +108,22 @@ static int stmfx_conf_set_pupd(struct udevice *dev, unsigned int offset,
>  	return stmfx_write_reg(dev, STMFX_REG_GPIO_PUPD, offset, pupd);
>  }
>  
> +static int stmfx_conf_get_pupd(struct udevice *dev, unsigned int offset)
> +{
> +	return stmfx_read_reg(dev, STMFX_REG_GPIO_PUPD, offset);
> +}
> +
>  static int stmfx_conf_set_type(struct udevice *dev, unsigned int offset,
>  			       uint type)
>  {
>  	return stmfx_write_reg(dev, STMFX_REG_GPIO_TYPE, offset, type);
>  }
>  
> +static int stmfx_conf_get_type(struct udevice *dev, unsigned int offset)
> +{
> +	return stmfx_read_reg(dev, STMFX_REG_GPIO_TYPE, offset);
> +}
> +
>  static int stmfx_gpio_get(struct udevice *dev, unsigned int offset)
>  {
>  	return stmfx_read_reg(dev, STMFX_REG_GPIO_STATE, offset);
> @@ -189,6 +199,45 @@ static int stmfx_gpio_set_dir_flags(struct udevice *dev, unsigned int offset,
>  	return ret;
>  }
>  
> +static int stmfx_gpio_get_dir_flags(struct udevice *dev, unsigned int offset,
> +				    ulong *flags)
> +{
> +	ulong dir_flags = 0;
> +	int ret;
> +
> +	if (stmfx_gpio_get_function(dev, offset) == GPIOF_OUTPUT) {
> +		dir_flags |= GPIOD_IS_OUT;
> +		ret = stmfx_conf_get_type(dev, offset);
> +		if (ret < 0)
> +			return ret;
> +		if (ret == 0)
> +			dir_flags |= GPIOD_OPEN_DRAIN;
> +			/* 1 = push-pull (default), open source not supported */
> +		ret = stmfx_gpio_get(dev, offset);
> +		if (ret < 0)
> +			return ret;
> +		if (ret)
> +			dir_flags |= GPIOD_IS_OUT_ACTIVE;
> +	} else {
> +		dir_flags |= GPIOD_IS_IN;
> +		ret = stmfx_conf_get_type(dev, offset);
> +		if (ret < 0)
> +			return ret;
> +		if (ret == 1) {
> +			ret = stmfx_conf_get_pupd(dev, offset);
> +			if (ret < 0)
> +				return ret;
> +			if (ret == 1)
> +				dir_flags |= GPIOD_PULL_UP;
> +			else
> +				dir_flags |= GPIOD_PULL_DOWN;
> +		}
> +	}
> +	*flags = dir_flags;
> +
> +	return 0;
> +}
> +
>  static int stmfx_gpio_probe(struct udevice *dev)
>  {
>  	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
> @@ -218,6 +267,7 @@ static const struct dm_gpio_ops stmfx_gpio_ops = {
>  	.direction_input = stmfx_gpio_direction_input,
>  	.direction_output = stmfx_gpio_direction_output,
>  	.set_dir_flags = stmfx_gpio_set_dir_flags,
> +	.get_dir_flags = stmfx_gpio_get_dir_flags,
>  };
>  
>  U_BOOT_DRIVER(stmfx_gpio) = {

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
