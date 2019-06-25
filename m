Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2372852677
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 10:24:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7DDBD12B6C
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 08:24:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3FB2D12B6B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2019 08:24:56 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5P8LeJk028270; Tue, 25 Jun 2019 10:24:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=O5H04/1SzWRIV8wT6EdLCqV+MJVI5i+WU4cehz0s/9o=;
 b=bCveMQGM3t9h/X+tCflGZOALJ+wm7G8xYcbHoK546K4xOfcP25IiJui72teSOiMf9Gih
 jIzZmgdMZCO2AYf3aC1V8W7ipXcs6ppJsNVW8bZHvoMgwXhHWsO6QNWO7U9w5FE56DZw
 CLc8tQs5gwtwS5GhNpGj9/t/eCsl+2NvnfvcTdEEI3d/UulVSObkrg9FBB9i3VlVoPgv
 WwKTMVQ7mrO0nw+X6IhksaLkLICXtgfdZH/lJILc6g/REiKcBTnID5uzwaKFlITsb7BT
 7KcmBH5Lf86WX91+5YzW4N18hMzvbas2RN+nyVrnWs9R/wagQtTnu0W4f2W3ODjQPcR7 Bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t9d2wg4vg-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 25 Jun 2019 10:24:55 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 43ED93A;
 Tue, 25 Jun 2019 08:24:54 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 286E523F2;
 Tue, 25 Jun 2019 08:24:54 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 25 Jun
 2019 10:24:53 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 25 Jun 2019 10:24:53 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 4/4] gpio: stm32: Remove .ofmatch callback
Thread-Index: AQHVKDbA+egPCI5eHki7LmXqD7QYUqasDmBg
Date: Tue, 25 Jun 2019 08:24:53 +0000
Message-ID: <f981142a378c461e913da7f3ff9db840@SFHDAG6NODE3.st.com>
References: <20190621133925.8643-1-patrice.chotard@st.com>
 <20190621133925.8643-5-patrice.chotard@st.com>
In-Reply-To: <20190621133925.8643-5-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_06:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Bin Meng <bmeng.cn@gmail.com>,
 Christophe KERELLO <christophe.kerello@st.com>
Subject: Re: [Uboot-stm32] [PATCH 4/4] gpio: stm32: Remove .ofmatch callback
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
> As compatible string "st,stm32-gpio" is no more used, .ofmatch callback becomes
> useless, remove it.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>

> ---
> 
>  drivers/gpio/stm32_gpio.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpio/stm32_gpio.c b/drivers/gpio/stm32_gpio.c index
> 5c9f2fe64d..226f350b1a 100644
> --- a/drivers/gpio/stm32_gpio.c
> +++ b/drivers/gpio/stm32_gpio.c
> @@ -210,15 +210,9 @@ static int gpio_stm32_probe(struct udevice *dev)
>  	return 0;
>  }
> 
> -static const struct udevice_id stm32_gpio_ids[] = {
> -	{ .compatible = "st,stm32-gpio" },
> -	{ }
> -};
> -
>  U_BOOT_DRIVER(gpio_stm32) = {
>  	.name	= "gpio_stm32",
>  	.id	= UCLASS_GPIO,
> -	.of_match = stm32_gpio_ids,
>  	.probe	= gpio_stm32_probe,
>  #ifndef CONFIG_SPL_BUILD
>  	.ops	= &gpio_stm32_ops,
> --
> 2.17.1

Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
