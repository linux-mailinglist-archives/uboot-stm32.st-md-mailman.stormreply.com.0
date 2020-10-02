Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0928A280FF3
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Oct 2020 11:34:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C35D3C424AF;
	Fri,  2 Oct 2020 09:34:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82026C424B0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 09:34:31 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0929LcHv020474; Fri, 2 Oct 2020 11:34:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Ujh/ZbLTw1+032KrT5++xsuoewavCN0IZyPpcbpKOoI=;
 b=LrxwT25o0YLBxxi0KwOkzQfnWsUpTzNpSsBisGIXLOy8QKz0SThSnHUvrp8a+FvHpao5
 SluxGo8Sjs1VxF9jPqEnm6/rFnCUdI95+SbxXO7m/BRjSDZd5PsFX0HwZPVf8rk8pNEv
 4kAa8R38RcrGB/S+rqJRJ0MX6EBSNQyUHVCgIWV6l9wvm5HrdeQWRxPGGGJ3dUQYmUrH
 p4IL5JUsjO+iIYWqNqQZydL9tBwrjFTFV6CLpEj0vb6II2jN9kJ9TpYgfYKmcFC7A7sM
 4ncctEhH8WIpvkHskMpJCpkxyBsYkVQk9jOCZU1hj1kHhjuBOMVbVKAqTpO6dK2+bvTx Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33su409gnb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Oct 2020 11:34:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C19CD10002A;
 Fri,  2 Oct 2020 11:34:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B8D012B089F;
 Fri,  2 Oct 2020 11:34:29 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 11:34:29 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 2 Oct 2020 11:34:29 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/2] gpio: stm32: cosmetic: cleanup gpio_stm32_probe
Thread-Index: AQHWhsZFKb27NNnzqkiBN0n7kdyMEKmED14A
Date: Fri, 2 Oct 2020 09:34:29 +0000
Message-ID: <b137bf99-880e-b520-a834-5a7315d2101c@st.com>
References: <20200909162834.31860-1-patrick.delaunay@st.com>
In-Reply-To: <20200909162834.31860-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <AF0457C068EB3C438A8EE8F592B16F8C@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-02_05:2020-10-02,
 2020-10-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] gpio: stm32: cosmetic: cleanup
	gpio_stm32_probe
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
> Move the variables definition at the beggining of the function
> gpio_stm32_probe().
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/gpio/stm32_gpio.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/stm32_gpio.c b/drivers/gpio/stm32_gpio.c
> index 5bff27f75b..aa70b1d2a9 100644
> --- a/drivers/gpio/stm32_gpio.c
> +++ b/drivers/gpio/stm32_gpio.c
> @@ -273,9 +273,12 @@ static const struct dm_gpio_ops gpio_stm32_ops = {
>  static int gpio_stm32_probe(struct udevice *dev)
>  {
>  	struct stm32_gpio_priv *priv = dev_get_priv(dev);
> +	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
> +	struct ofnode_phandle_args args;
> +	const char *name;
>  	struct clk clk;
>  	fdt_addr_t addr;
> -	int ret;
> +	int ret, i;
>  
>  	addr = dev_read_addr(dev);
>  	if (addr == FDT_ADDR_T_NONE)
> @@ -283,11 +286,6 @@ static int gpio_stm32_probe(struct udevice *dev)
>  
>  	priv->regs = (struct stm32_gpio_regs *)addr;
>  
> -	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
> -	struct ofnode_phandle_args args;
> -	const char *name;
> -	int i;
> -
>  	name = dev_read_string(dev, "st,bank-name");
>  	if (!name)
>  		return -EINVAL;

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
