Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 898C8AE75C
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Sep 2019 11:54:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 405FAC36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Sep 2019 09:54:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08B29C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2019 09:54:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8A9q17P008558; Tue, 10 Sep 2019 11:54:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=bIf3Suaw98jQfHpdQy5tHOhdmmev/zPlSdEJwfy+43M=;
 b=YDTqLxKSYQSa5nsw5DBzDJ35DVxpanBV/ulmR8JUfCobgrphDW3zLwlsbzN9gVe0Ks3p
 hgvFgvSk6rQgePGbPnqsbBPjLqZDvYvslJ27WBfp/+LccirkfZ4x79CeWRUH8FK6JQVs
 HkG0Zb3ElD7q4G7xugYECHRqQfD2JyTyL8GWByLiVHaz1J1/+79RSMo6esE8r287NoHn
 kX01dK4Bqt7MZKRuIm4cCNV4d3VedOoIubA4EFzRfI4OY5QNukWObSPVApqZQ+5Kihc2
 tY4ZIlbtRoCvoMSPeUo5x03DMaEK+KWw3ZX5KCAN0rQFUnlXthVCCvwEALQVyrEXcjCU nw== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2uv3ehuej5-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 10 Sep 2019 11:54:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9AA1250;
 Tue, 10 Sep 2019 09:54:07 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 62D942BA3D1;
 Tue, 10 Sep 2019 11:54:06 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 10 Sep
 2019 11:54:05 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 10 Sep 2019 11:54:06 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] regulator: fixed: Modify enable-active-high behavior
Thread-Index: AQHVQrhfDJK2i2efM0etXh2a+n0QXack1GWA
Date: Tue, 10 Sep 2019 09:54:05 +0000
Message-ID: <e239a68f-4dee-e9cf-84df-13185c13ab64@st.com>
References: <20190725071239.31398-1-patrice.chotard@st.com>
In-Reply-To: <20190725071239.31398-1-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <E37E88389B52494581D3E68F0B04C70D@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-10_07:2019-09-09,2019-09-10 signatures=0
Cc: Christophe KERELLO <christophe.kerello@st.com>, Lukasz
 Majewski <lukma@denx.de>, Patrick DELAUNAY <patrick.delaunay@st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Sven Schwermer <sven@svenschwermer.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] regulator: fixed: Modify
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

It's a gentle reminder to not forgot this patch

Thanks

Patrice

On 7/25/19 9:12 AM, Patrice Chotard wrote:
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
>  drivers/power/regulator/regulator_common.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/power/regulator/regulator_common.c b/drivers/power/regulator/regulator_common.c
> index 3dabbe2a85..2e8a083c75 100644
> --- a/drivers/power/regulator/regulator_common.c
> +++ b/drivers/power/regulator/regulator_common.c
> @@ -15,7 +15,9 @@ int regulator_common_ofdata_to_platdata(struct udevice *dev,
>  	int flags = GPIOD_IS_OUT;
>  	int ret;
>  
> -	if (dev_read_bool(dev, "enable-active-high"))
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
