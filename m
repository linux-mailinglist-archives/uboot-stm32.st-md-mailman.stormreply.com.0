Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6364A5265D
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 10:21:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18C46C0E31B
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 08:21:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71978C0E31A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2019 08:20:59 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5P8DsKK014103; Tue, 25 Jun 2019 10:20:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Xx7jxie0gKSUVY38936rOP43xuVjxqxSPIEiq29y0tU=;
 b=dIva5nZPKgLGWQUdFavygDzm4d0dcveU4SYBKvC5OJ8OdnQshX5ETS8PzX4+TBgisjTD
 soYtptHo0plud5JzMSmegrL7pqWWG5GbQHO9RSorCj0kRs6V/4IQYOi+Zsynsdf9lVCa
 kC4Q9kx8wpw4M3CpVIC0/L4czS1fUVUOq0zvA9dvo6xCzYkYY6N0UGTGny9iTG0lxbr8
 jGZIUCzT4CsJexcsW/NRYLx3Vze+AwtlcQ7wpuAKHwOkwFY9+9YK57NbcWP0TuZuTBJa
 9vhVWW9KaCyfuaBgvVXfgl2eAJwSZ/5NIpWlGFQSSXVxqCvR1EpbB2PFqGvdMfYixpfy GQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t9d2g7w33-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 25 Jun 2019 10:20:56 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7D27831;
 Tue, 25 Jun 2019 08:20:55 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 627CC1FE8;
 Tue, 25 Jun 2019 08:20:55 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 25 Jun
 2019 10:20:54 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 25 Jun 2019 10:20:54 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/2] ARM: dts: stm32: Add u-boot,dm-pre-reloc for
 usart1_pins_a for stm32f769-disco
Thread-Index: AQHVKDaS8/FI6+eTI0uxrSz2IjD7QqasBIJA
Date: Tue, 25 Jun 2019 08:20:54 +0000
Message-ID: <d44810535f2045d9abdacb936a125388@SFHDAG6NODE3.st.com>
References: <20190621133811.8216-1-patrice.chotard@st.com>
 <20190621133811.8216-2-patrice.chotard@st.com>
In-Reply-To: <20190621133811.8216-2-patrice.chotard@st.com>
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
 Tom Rini <trini@konsulko.com>, Albert Aribaud <albert.u.boot@aribaud.net>
Subject: Re: [Uboot-stm32] [PATCH 1/2] ARM: dts: stm32: Add u-boot,
 dm-pre-reloc for usart1_pins_a for stm32f769-disco
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
> Sent: vendredi 21 juin 2019 15:38
> 
> This allow to get console output in SPL for stm32f769-disco.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>

> ---
> 
>  arch/arm/dts/stm32f769-disco-u-boot.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32f769-disco-u-boot.dtsi b/arch/arm/dts/stm32f769-
> disco-u-boot.dtsi
> index 53a645dace..209a82c9cf 100644
> --- a/arch/arm/dts/stm32f769-disco-u-boot.dtsi
> +++ b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
> @@ -152,6 +152,16 @@
>  			slew-rate = <2>;
>  		};
>  	};
> +
> +	usart1_pins_a: usart1@0	{
> +		u-boot,dm-pre-reloc;
> +		pins1 {
> +			u-boot,dm-pre-reloc;
> +		};
> +		pins2 {
> +			u-boot,dm-pre-reloc;
> +		};
> +	};
>  };
> 
>  &qspi {
> --
> 2.17.1

Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
