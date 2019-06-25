Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8555266C
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 10:23:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF0A6C6A57C
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 08:23:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C12DC6A57B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2019 08:23:24 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5P8M1WR012676; Tue, 25 Jun 2019 10:23:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=s6APXSf7z815jVUWXL+AmCheZLBL7jmTRPv+wS7JYDs=;
 b=ThXW0CniCivZYNbTsYeFpwyespM0No970hDDxa/7zT6m7nZYKiorgazCAuGHmO2Dkjhs
 d5C2pVrEtpyJPdkKMdw1ooqMzQvXaOQ2MmgIguMlwwx40itR4zvxdMNBQYRev1LTqXUm
 Czm4c11++G5MqzGt+fg6jFvP0ORzlngGUEw4FjWTmg79NFXnz8GKAnOIR+xJNuGptsSq
 xhmBb9Bo7WYp/Hl5t6KCPsPnlNYQUWN7YJzyG8hOIXk1WYFKfYDl80Php6W4tb+cH6nS
 NCMhVlPLLY8JSC968Jq31AtNEdm28v/Rzy22/zJgnemm35B3Az1/e+JvSZMa2P/RO3mT Rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t9d2jg5xj-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 25 Jun 2019 10:23:23 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1A0FA31;
 Tue, 25 Jun 2019 08:23:21 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ECC6B23E1;
 Tue, 25 Jun 2019 08:23:20 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 25 Jun
 2019 10:23:20 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 25 Jun 2019 10:23:20 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/4] pinctrl: stm32: update .bind callback
Thread-Index: AQHVKDa/3XfOknq76UW+q8ICHHfqAqasDeCA
Date: Tue, 25 Jun 2019 08:23:20 +0000
Message-ID: <895885dbaa304f98a597a3f7053e630c@SFHDAG6NODE3.st.com>
References: <20190621133925.8643-1-patrice.chotard@st.com>
 <20190621133925.8643-3-patrice.chotard@st.com>
In-Reply-To: <20190621133925.8643-3-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_06:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>, Christophe
 KERELLO <christophe.kerello@st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/4] pinctrl: stm32: update .bind callback
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

Hi Patrice,

> From: Patrice CHOTARD <patrice.chotard@st.com>
> Sent: vendredi 21 juin 2019 15:39
> 
> Update .bind callback in order to bind all pinctrl subnodes with "gpio-controller"
> property to gpio_stm32 driver.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>

> ---
> 
>  drivers/pinctrl/pinctrl_stm32.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c index
> 43dbdd9d6a..e2e7be01ed 100644
> --- a/drivers/pinctrl/pinctrl_stm32.c
> +++ b/drivers/pinctrl/pinctrl_stm32.c
> @@ -1,5 +1,6 @@
>  #include <common.h>
>  #include <dm.h>
> +#include <dm/lists.h>
>  #include <dm/pinctrl.h>
>  #include <hwspinlock.h>
>  #include <asm/arch/gpio.h>
> @@ -364,6 +365,35 @@ static int stm32_pinctrl_config(int offset)
>  	return 0;
>  }
> 
> +static int stm32_pinctrl_bind(struct udevice *dev) {
> +	ofnode node;
> +	const char *name;
> +	int ret;
> +
> +	dev_for_each_subnode(node, dev) {
> +		debug("%s: bind %s\n", __func__, ofnode_get_name(node));
> +
> +		ofnode_get_property(node, "gpio-controller", &ret);
> +		if (ret < 0)
> +			continue;
> +		/* Get the name of each gpio node */
> +		name = ofnode_get_name(node);
> +		if (!name)
> +			return -EINVAL;
> +
> +		/* Bind each gpio node */
> +		ret = device_bind_driver_to_node(dev, "gpio_stm32",
> +						 name, node, NULL);
> +		if (ret)
> +			return ret;
> +
> +		debug("%s: bind %s\n", __func__, name);
> +	}
> +
> +	return 0;
> +}
> +
>  #if CONFIG_IS_ENABLED(PINCTRL_FULL)
>  static int stm32_pinctrl_set_state(struct udevice *dev, struct udevice *config)  {
> @@ -433,7 +463,7 @@ U_BOOT_DRIVER(pinctrl_stm32) = {
>  	.id			= UCLASS_PINCTRL,
>  	.of_match		= stm32_pinctrl_ids,
>  	.ops			= &stm32_pinctrl_ops,
> -	.bind			= dm_scan_fdt_dev,
> +	.bind			= stm32_pinctrl_bind,
>  	.probe			= stm32_pinctrl_probe,
>  	.priv_auto_alloc_size	= sizeof(struct stm32_pinctrl_priv),
>  };
> --
> 2.17.1

Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
