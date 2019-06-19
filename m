Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDBF4BC34
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Jun 2019 17:01:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AAADC5718A
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Jun 2019 15:01:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 688F8C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 15:01:56 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5JEvII4013057; Wed, 19 Jun 2019 17:01:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=C8toZGswvsfYQyICtFoYompiO4wZAwJ5UZgNy1nMJ2s=;
 b=e4mWd4Q/30xfmJNKDPGLXex3WVvt1O7UIh4u+wWnHNe7PKD5JYlzukQdjXghZsiWnRGv
 8jYPrilkr9F16dRpydzZ/kR9BCVfaNMwkGo8XYyiqoByOATNL9Nmr6o9IA/w+sS1WL/S
 aATTSdA/sVWj2nM/YNLg5A7onG2WSmwP2HqqlZOkF/y8ALATRWN9qfaqJvnPM3zv4mcF
 oz5zD3oRWKqQrIv0qFFUhETv7xvTq9CnYDdfGueaoeC6og/vovTSQKhL9LoMq3GwPH4e
 iPM62PoZZWe05/k4gvfl1gBL/K7NkabzhPW9oF3LAN/b+RA+6MgudkmeQA5/lBun+mFR 9w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7813cj8f-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 19 Jun 2019 17:01:54 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C1CCE3D;
 Wed, 19 Jun 2019 15:01:53 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A60632AE1;
 Wed, 19 Jun 2019 15:01:53 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 19 Jun
 2019 17:01:53 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 19 Jun 2019 17:01:53 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [U-Boot] [PATCH v2 2/3] ARM: dts: stm32mp1: remove override for
 g-tx-fifo-size
Thread-Index: AQHVJq/uttC2Q014GUur9WL2eK52XA==
Date: Wed, 19 Jun 2019 15:01:53 +0000
Message-ID: <6fb5a0a5-0753-2673-6257-63977c5e877a@st.com>
References: <1560869838-22025-1-git-send-email-patrick.delaunay@st.com>
 <1560869838-22025-2-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1560869838-22025-2-git-send-email-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <9FFB42C1DE33594A9A6BC00B3407BF90@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v2 2/3] ARM: dts: stm32mp1:
 remove override for g-tx-fifo-size
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

On 6/18/19 4:57 PM, Patrick Delaunay wrote:
> Remove the override for usbotg_hs on g-tx-fifo-size as the correct
> binding, used in the kernel device tree, is now supported in dwc2
> device driver.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - move dt update in a separate patch
>
>  arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
> index 5b19e44..994092a 100644
> --- a/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
> @@ -56,10 +56,6 @@
>  	};
>  };
>  
> -&usbotg_hs {
> -	g-tx-fifo-size = <576>;
> -};
> -
>  &v3v3 {
>  	regulator-always-on;
>  };


Applied to uboot-stm

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
