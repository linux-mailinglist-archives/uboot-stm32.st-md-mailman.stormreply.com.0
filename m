Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE4752665
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 10:21:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30785C5F1FA
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 08:21:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D23CAC0E31B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2019 08:21:57 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5P8LqCu020092; Tue, 25 Jun 2019 10:21:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=2omQXnMMW92R6YqczGpuVx27kxMAeDU/aVmpEy2Do+8=;
 b=roBHrLsVDO/ZI3qlyocjNsJ12GrtwZ0BEy8zIqO+zhJR2ox8ogHsOOOHAxHpr4/fX9EK
 nZf3YNBI7QqsuU1HVtH8Vu7uu0v7xfwM02Tf59sJIxYPD75sXtUw0BUkNILLk7x6Fk1u
 mcWuegqKHjZMQMQDBIwGhALJVmd2T0o+xFSMZkuN4MxzfLQWg9HIp4YfbXQ8MdBSImax
 DfZYWOsYveKhi8vKm4+Z/z8NqULqaAiOj3KX5kNOI1MkLF4eRLiVQhqWyQivs4H0OJF3
 3nUwkV6KxRptThbsFRvs2Qf3RPTL/Q+gZpx7bXua17AZPDlZYRFwci3ydXO5ZxEMN1gz oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t9d2g7w77-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 25 Jun 2019 10:21:52 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C203934;
 Tue, 25 Jun 2019 08:21:43 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A47A2200A;
 Tue, 25 Jun 2019 08:21:43 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 25 Jun
 2019 10:21:43 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 25 Jun 2019 10:21:43 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/2] ARM: dts: stm32: Remove useless u-boot, dm-pre-reloc
 in stm32f746-disco-u-boot.dtsi
Thread-Index: AQHVKDaTAIBXi6KKXkucp2RAGLD2b6asDWZQ
Date: Tue, 25 Jun 2019 08:21:43 +0000
Message-ID: <d1d9eaf4f1894bceb5eaf4cbc30c5a9b@SFHDAG6NODE3.st.com>
References: <20190621133811.8216-1-patrice.chotard@st.com>
 <20190621133811.8216-3-patrice.chotard@st.com>
In-Reply-To: <20190621133811.8216-3-patrice.chotard@st.com>
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
Subject: Re: [Uboot-stm32] [PATCH 2/2] ARM: dts: stm32: Remove useless
 u-boot, dm-pre-reloc in stm32f746-disco-u-boot.dtsi
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
> As in stm32f7-u-boot.dtsi these nodes already have "u-bootdm-pre-reloc"
> property, no need to add them again in stm32f746-disco-u-boot.dtsi.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>

> ---
> 
>  arch/arm/dts/stm32f746-disco-u-boot.dtsi | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32f746-disco-u-boot.dtsi b/arch/arm/dts/stm32f746-
> disco-u-boot.dtsi
> index ade7285786..d8f9d8dc5f 100644
> --- a/arch/arm/dts/stm32f746-disco-u-boot.dtsi
> +++ b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
> @@ -78,10 +78,6 @@
>  	};
>  };
> 
> -&clk_hse {
> -	u-boot,dm-pre-reloc;
> -};
> -
>  &fmc {
>  	/* Memory configuration from sdram datasheet MT48LC_4M32_B2B5-6A
> */
>  	bank1: bank@0 {
> @@ -123,9 +119,7 @@
>  	};
> 
>  	fmc_pins: fmc@0 {
> -		u-boot,dm-pre-reloc;
>  		pins {
> -			u-boot,dm-pre-reloc;
>  			pinmux = <STM32_PINMUX('D',10, AF12)>, /* D15 */
>  				 <STM32_PINMUX('D', 9, AF12)>, /* D14 */
>  				 <STM32_PINMUX('D', 8, AF12)>, /* D13 */
> --
> 2.17.1

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
