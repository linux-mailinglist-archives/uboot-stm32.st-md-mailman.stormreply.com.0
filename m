Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C542C3BCD
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Nov 2020 10:17:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E880C56630;
	Wed, 25 Nov 2020 09:17:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BB7DC424AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 09:17:11 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AP9C7dI024262; Wed, 25 Nov 2020 10:17:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=trWZARnJ/SRxAIQtWrRX7RY3Si0Gta4M9nrG6S28VVk=;
 b=Bk/67teYEuKvbYndJKfbmqum1IpzrA9bUc5rdV2Cfu4OZQ0gHSZ3oPPKwzJNu0GJS/yD
 0Idg5ip1IP0nUDoPITUD2Mh+H2Za1s0AhJGo74xMyUd2Xdj/FyhQJv/2q6XYQyUYWvqS
 E5+BElzZ17gHJWTy3Ud6r8YXta2c/qcr0XvpZHl96PPY4Aa3DqEEHAAeDINVfwA4k672
 O2ScFHPf+rH8cimstCHiCFvVUgRW82Js9F+WqHugTNGaFy6yxVV5yalJM2mbobAXO570
 dwbEdhswrOdrQEObK90rHSCwknjMo+RRcE3fbQpcSEEfmaVhief4vHRkm0cksZbueq/Z Ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y0hjf91m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 10:17:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B876310002A;
 Wed, 25 Nov 2020 10:17:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC68B23098B;
 Wed, 25 Nov 2020 10:17:06 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Nov
 2020 10:17:06 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 25 Nov 2020 10:17:06 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v1 4/4] ARM: dts: stm32: Fix typo in stm32h7-u-boot.dtsi
Thread-Index: AQHWtAwovYKaT+t4okCV5n3tWLQUOqnYr0Tw
Date: Wed, 25 Nov 2020 09:17:06 +0000
Message-ID: <8fbbbb544cc7427caf3c55f4fb894521@SFHDAG2NODE3.st.com>
References: <20201106071200.6933-1-patrice.chotard@st.com>
 <20201106071200.6933-5-patrice.chotard@st.com>
In-Reply-To: <20201106071200.6933-5-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_04:2020-11-25,
 2020-11-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v1 4/4] ARM: dts: stm32: Fix typo in
	stm32h7-u-boot.dtsi
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

Hi Patrice

> From: Patrice CHOTARD <patrice.chotard@st.com>
> Sent: vendredi 6 novembre 2020 08:12
> 
> Fix typo "firsct"
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> 
> ---
> 
>  arch/arm/dts/stm32h7-u-boot.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/dts/stm32h7-u-boot.dtsi b/arch/arm/dts/stm32h7-u-boot.dtsi
> index 7182533cc9..54dd406b6b 100644
> --- a/arch/arm/dts/stm32h7-u-boot.dtsi
> +++ b/arch/arm/dts/stm32h7-u-boot.dtsi
> @@ -39,7 +39,7 @@
> 
>  			/*
>  			 * Memory configuration from sdram datasheet
> IS42S32800G-6BLI
> -			 * firsct bank is bank@0
> +			 * first bank is bank@0
>  			 * second bank is bank@1
>  			 */
>  			bank1: bank@1 {
> --
> 2.17.1

Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot-stm/master, thanks!

Thanks

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
