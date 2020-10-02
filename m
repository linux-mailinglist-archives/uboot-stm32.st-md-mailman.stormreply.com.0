Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B28D280FFA
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Oct 2020 11:35:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D85B0C424B0;
	Fri,  2 Oct 2020 09:35:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA608C424AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 09:35:36 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0929Nc6U002613; Fri, 2 Oct 2020 11:35:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=TzKKEul8p/mEe/lIOl28JyM6OgmnsahAdOsb6PR0KZE=;
 b=YSFAfiATAHOXBEnxR6t/HmsWi+I9YglaClEXTVZUGAEvKrabMTU6/uIvAe305iuVfMDz
 +1jYj5zs6aBeflLg6OnkFltuhy85C5D09vMmbvAqM13r4Z+XPasVXjgIE1A/7HYQdnn2
 D18S5lDCuJopHw0mhO4jK0aE1l3co5U08uQXTwoWABtmtct4iwmnLovkQUPDl+NpmC9p
 68UUqkopaZpoyv4id8ZmuwmIdNH1FgaT2jpb9zjkJKaJEQ68DCbMoUWdddyGCd0UIyhD
 8E42brwTSX4ff5mIf6TMFN52v52yb7CExsstnO0u3HorHL+JrtaSh7qH4ULWkr28gm1P qQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33v0dhacv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Oct 2020 11:35:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4B91E10002A;
 Fri,  2 Oct 2020 11:35:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4175C2B1500;
 Fri,  2 Oct 2020 11:35:35 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 11:35:02 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 2 Oct 2020 11:35:02 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/2] gpio: stm32: check result of ofnode_phandle_args
Thread-Index: AQHWhsZF/FZacip5TUaqAqdjlYoFhKmED4aA
Date: Fri, 2 Oct 2020 09:35:02 +0000
Message-ID: <daa68456-9444-3a71-c4fb-d2ae21697a02@st.com>
References: <20200909162834.31860-1-patrick.delaunay@st.com>
 <20200909162834.31860-2-patrick.delaunay@st.com>
In-Reply-To: <20200909162834.31860-2-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <F6233D1F6EC6444EB3D45B85C6CA48E6@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-02_05:2020-10-02,
 2020-10-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] gpio: stm32: check result of
	ofnode_phandle_args
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

On 9/9/20 6:28 PM, Patrick Delaunay wrote:
> Add test on the size of ofnode_phandle_args result to avoid access
> to uninitialized elements in args[] field.
>
> This patch avoids the issue when gpio-ranges cell size is not 3 as
> expected, for example:
> 	gpio-ranges = <&pinctrl 0>;
> instead of
> 	gpio-ranges = <&pinctrl 0 112 16>;
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/gpio/stm32_gpio.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpio/stm32_gpio.c b/drivers/gpio/stm32_gpio.c
> index aa70b1d2a9..473e364796 100644
> --- a/drivers/gpio/stm32_gpio.c
> +++ b/drivers/gpio/stm32_gpio.c
> @@ -295,6 +295,9 @@ static int gpio_stm32_probe(struct udevice *dev)
>  	ret = dev_read_phandle_with_args(dev, "gpio-ranges",
>  					 NULL, 3, i, &args);
>  
> +	if (!ret && args.args_count < 3)
> +		return -EINVAL;
> +
>  	if (ret == -ENOENT) {
>  		uc_priv->gpio_count = STM32_GPIOS_PER_BANK;
>  		priv->gpio_range = GENMASK(STM32_GPIOS_PER_BANK - 1, 0);
> @@ -308,6 +311,8 @@ static int gpio_stm32_probe(struct udevice *dev)
>  
>  		ret = dev_read_phandle_with_args(dev, "gpio-ranges", NULL, 3,
>  						 ++i, &args);
> +		if (!ret && args.args_count < 3)
> +			return -EINVAL;
>  	}
>  
>  	dev_dbg(dev, "addr = 0x%p bank_name = %s gpio_count = %d gpio_range = 0x%x\n",

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
