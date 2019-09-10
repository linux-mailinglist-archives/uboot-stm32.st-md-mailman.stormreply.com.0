Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C96CBAE945
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Sep 2019 13:39:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95B11C36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Sep 2019 11:39:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04665C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2019 11:39:17 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8ABLaWf030645; Tue, 10 Sep 2019 13:39:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=UYLFwDHxPxSif3ee+9cUqa7C4OkiNaG8wUFe/JHsU1s=;
 b=gCGv7XHbgNPXraK+zHE7hJbHF90fl7kaHgD2AZxGsJNuq1czTPo7fH0nYzOLk6VCJcqt
 diUr+1o7KVzqPC9p+zY89fqdyP/WdKjVmUyOzwJB08TR2TTooNRliCcHFe3M14UsY2j1
 uUCbc+EZT3npjAp67dbIixy0QMTGTGRBzhl8G80aLpXVjPpgSpMCy+a7sJMNiqQYQLrT
 vpeI9fWz80cw2NNUe8Yh+DLVr2+XHvA8mvucBijoE6Sfsp01UA/YsHsPpti/g760XNsa
 /GysgkRGNCQ0fwVuqIlKLEkM0QaZs+CQ1/IvrXR4eeNq53L/qCYeqjGTK/nkTsiB/AnL BQ== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2uv2aw3w7c-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 10 Sep 2019 13:39:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F3E5724;
 Tue, 10 Sep 2019 11:38:55 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6219C2C17B2;
 Tue, 10 Sep 2019 13:38:55 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 10 Sep
 2019 13:38:55 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 10 Sep 2019 13:38:55 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2] regulator: fixed: Modify enable-active-high behavior
Thread-Index: AQHVXASA21Z2OLFB2UW2QQaOYl7+KKckvxUA
Date: Tue, 10 Sep 2019 11:38:54 +0000
Message-ID: <4c2604e1-6cfe-6035-2738-a18f27b3b1b6@st.com>
References: <20190826115031.25099-1-patrice.chotard@st.com>
In-Reply-To: <20190826115031.25099-1-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <2BD1EFCB34B66943AB0594DCD2D76864@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-10_07:2019-09-10,2019-09-10 signatures=0
Cc: Christophe KERELLO <christophe.kerello@st.com>, Lukasz
 Majewski <lukma@denx.de>, Patrick DELAUNAY <patrick.delaunay@st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Sven Schwermer <sven@svenschwermer.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2] regulator: fixed: Modify
	enable-active-high behavior
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

Hi,

It's a gentle reminder to not forgot this patch.

Thanks

Patrice

On 8/26/19 1:50 PM, Patrice Chotard wrote:
> Regulator should not be enabled at probe time if regulator-boot-on
> property is not in the dt node.
>
> "enable-active-high" property is only used to indicate the GPIO
> polarity.
>
> See kernel documentation :
>  - Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
>  - Documentation/devicetree/bindings/regulator/gpio-regulator.yaml
>
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>
> Changes in v2:
>   - fix build issue
>
>  drivers/power/regulator/regulator_common.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/power/regulator/regulator_common.c b/drivers/power/regulator/regulator_common.c
> index 3dabbe2a85..2041086567 100644
> --- a/drivers/power/regulator/regulator_common.c
> +++ b/drivers/power/regulator/regulator_common.c
> @@ -12,10 +12,15 @@ int regulator_common_ofdata_to_platdata(struct udevice *dev,
>  	struct regulator_common_platdata *dev_pdata, const char *enable_gpio_name)
>  {
>  	struct gpio_desc *gpio;
> +	struct dm_regulator_uclass_platdata *uc_pdata;
>  	int flags = GPIOD_IS_OUT;
>  	int ret;
>  
> -	if (dev_read_bool(dev, "enable-active-high"))
> +	uc_pdata = dev_get_uclass_platdata(dev);
> +
> +	if (!dev_read_bool(dev, "enable-active-high"))
> +		flags |= GPIOD_ACTIVE_LOW;
> +	if (uc_pdata->boot_on)
>  		flags |= GPIOD_IS_OUT_ACTIVE;
>  
>  	/* Get optional enable GPIO desc */
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
