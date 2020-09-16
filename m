Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DBD26BE7C
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Sep 2020 09:48:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45868C3FAD6
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Sep 2020 07:48:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B183C3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Sep 2020 07:47:58 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08G7lX3N028385; Wed, 16 Sep 2020 09:47:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=EihBjiuFnxOkgLaFxMiyWpdNmkkYRmSgaozTdYhdMF8=;
 b=qg+aPHGtk8ImEH1sLQlmWnXL8c3ysPaFlQ2d9nAzwIpVzEhsWK/pR6D28cpknUTRUNYw
 T8uI0EUjWrI3eDiy7Nu6AhBR3BB51mfQwZWoSk4XCibpl8JAhyGLjPuPIKrUoCzFyozZ
 62qn+kM4NuCTxcNs47bCuL5pIiGxpMZImab1fOMuRLKqZjkyJGaPG5IQ6oL+lEa6HfsX
 Pi0AXox1FaK20SVWEhT5m8r5N346DqJMwXrrUcFBl36iQkzQdrsdlaLFeVtRUsPeNwD1
 eQnT39Uh4on1x69uu6KAzOfB2D7UNncGyonu0yDPOozLXFovm98QKn9KFqeqxiYVf9Hp IQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33k691a5ju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 09:47:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 899F0100034;
 Wed, 16 Sep 2020 09:47:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D8BB20756D;
 Wed, 16 Sep 2020 09:47:39 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 16 Sep
 2020 09:47:39 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 16 Sep 2020 09:47:39 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Sean Anderson <seanga2@gmail.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 30/46] phy: usbphyc: Fix not calling dev_err with a
 device
Thread-Index: AQHWi270PI08F8Odo0iLnnOQr9ZB5KlqwuYA
Date: Wed, 16 Sep 2020 07:47:38 +0000
Message-ID: <0593de3b-41c7-bd7b-a0b2-85d9121bce70@st.com>
References: <20200915144522.509493-1-seanga2@gmail.com>
 <20200915144522.509493-31-seanga2@gmail.com>
In-Reply-To: <20200915144522.509493-31-seanga2@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <3BB7B490FB071D4DBB13F124B54D63D3@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-16_02:2020-09-15,
 2020-09-16 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 30/46] phy: usbphyc: Fix not calling
 dev_err with a device
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

Hi Sean

On 9/15/20 4:45 PM, Sean Anderson wrote:
> Use the phy's device.
>
> Signed-off-by: Sean Anderson <seanga2@gmail.com>
> ---
>
> Changes in v2:
> - New
>
>  drivers/phy/phy-stm32-usbphyc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/phy/phy-stm32-usbphyc.c b/drivers/phy/phy-stm32-usbphyc.c
> index c6d3048602..9d4296d649 100644
> --- a/drivers/phy/phy-stm32-usbphyc.c
> +++ b/drivers/phy/phy-stm32-usbphyc.c
> @@ -311,7 +311,7 @@ static int stm32_usbphyc_of_xlate(struct phy *phy,
>  
>  	if ((phy->id == 0 && args->args_count != 1) ||
>  	    (phy->id == 1 && args->args_count != 2)) {
> -		dev_err(dev, "invalid number of cells for phy port%ld\n",
> +		dev_err(phy->dev, "invalid number of cells for phy port%ld\n",
>  			phy->id);
>  		return -EINVAL;
>  	}

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
