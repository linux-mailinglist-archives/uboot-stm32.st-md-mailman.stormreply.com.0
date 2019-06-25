Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7698A52675
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 10:24:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98B29CDB43F
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 08:24:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 520CCC6B44C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2019 08:24:21 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5P8LN9R028699; Tue, 25 Jun 2019 10:24:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=pY15ID9G1NMVydDnrXSHXKuiyRqf8TjiO8MO3NIPzao=;
 b=k+wP65MFTbL8somrhkxUtLJCMIKhl2Q2xySwDYoFberm/LXcbychMNV0dI5HIWAjhtYe
 1/c3qlGHH2XrOGDTemh7V9dLUKZcRGBpI9/+sHRgZKeKoGiw5H7N5GstrICoQo/2Ethc
 22l3H/qgarO+UqveJQTOqW0BtlsLCLQ0NOf/HrvkfuOu31uCvl2zG7Mc1Wu8ozRUfzhG
 zSH5JRkIDved16yedRxU8WdF/0X9ciUKYwU/cywUf8faTgotGgOWDcztk9laiqJ/rLQy
 NNuFZw5f7nA+rQoqw8PXO5YXYMHQCW7hLebf/B61a7YUFxtElplPIoasNLFfDd90sPc2 lA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tb1f3m14p-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 25 Jun 2019 10:24:19 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 17DA33F;
 Tue, 25 Jun 2019 08:24:19 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EC5F123E8;
 Tue, 25 Jun 2019 08:24:18 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 25 Jun
 2019 10:24:18 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 25 Jun 2019 10:24:18 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 3/4] ARM: dts: stm32: Remove useless "st,stm32-gpio"
 compatible string
Thread-Index: AQHVKDbA+R6UD7vnkkScrmAIv6A+9aasDhZg
Date: Tue, 25 Jun 2019 08:24:18 +0000
Message-ID: <6664dc3cbea64acc930ff345269d2f18@SFHDAG6NODE3.st.com>
References: <20190621133925.8643-1-patrice.chotard@st.com>
 <20190621133925.8643-4-patrice.chotard@st.com>
In-Reply-To: <20190621133925.8643-4-patrice.chotard@st.com>
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
Subject: Re: [Uboot-stm32] [PATCH 3/4] ARM: dts: stm32: Remove useless "st,
 stm32-gpio" compatible string
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
> Since pinctrl_stm32 driver update, each gpio bank is now binded by pinctrl driver.
> The compatible string "st,stm32-gpio" becomes useless, remove it.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>

> ---
> 
>  arch/arm/dts/stm32429i-eval-u-boot.dtsi  | 11 -----------  arch/arm/dts/stm32f429-
> disco-u-boot.dtsi | 11 -----------  arch/arm/dts/stm32f469-disco-u-boot.dtsi | 11 -----
> ------
>  arch/arm/dts/stm32f7-u-boot.dtsi         | 17 -----------------
>  arch/arm/dts/stm32mp157-u-boot.dtsi      | 12 ------------
>  5 files changed, 62 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32429i-eval-u-boot.dtsi b/arch/arm/dts/stm32429i-eval-
> u-boot.dtsi
> index 6da0a636c1..fe437bbfe2 100644
> --- a/arch/arm/dts/stm32429i-eval-u-boot.dtsi
> +++ b/arch/arm/dts/stm32429i-eval-u-boot.dtsi
> @@ -92,57 +92,46 @@
>  };
> 
>  &gpioa {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpiob {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpioc {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpiod {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpioe {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpiof {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpiog {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpioh {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpioi {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpioj {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpiok {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
> diff --git a/arch/arm/dts/stm32f429-disco-u-boot.dtsi b/arch/arm/dts/stm32f429-
> disco-u-boot.dtsi
> index 0cc3100440..52f80320bc 100644
> --- a/arch/arm/dts/stm32f429-disco-u-boot.dtsi
> +++ b/arch/arm/dts/stm32f429-disco-u-boot.dtsi
> @@ -79,57 +79,46 @@
>  };
> 
>  &gpioa {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpiob {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpioc {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpiod {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpioe {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpiof {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpiog {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpioh {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpioi {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpioj {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpiok {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
> diff --git a/arch/arm/dts/stm32f469-disco-u-boot.dtsi b/arch/arm/dts/stm32f469-
> disco-u-boot.dtsi
> index 3da308e6a4..2409cf746a 100644
> --- a/arch/arm/dts/stm32f469-disco-u-boot.dtsi
> +++ b/arch/arm/dts/stm32f469-disco-u-boot.dtsi
> @@ -94,57 +94,46 @@
>  };
> 
>  &gpioa {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpiob {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpioc {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpiod {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpioe {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpiof {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpiog {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpioh {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpioi {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpioj {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpiok {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
> diff --git a/arch/arm/dts/stm32f7-u-boot.dtsi b/arch/arm/dts/stm32f7-u-boot.dtsi
> index 29b157324e..3ba7f8410d 100644
> --- a/arch/arm/dts/stm32f7-u-boot.dtsi
> +++ b/arch/arm/dts/stm32f7-u-boot.dtsi
> @@ -65,58 +65,41 @@
>  };
> 
>  &gpioa {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpiob {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpioc {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpiod {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpioe {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpiof {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpiog {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpioh {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpioi {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
> -&gpioj {
> -	compatible = "st,stm32-gpio";
> -};
> -
> -&gpiok {
> -	compatible = "st,stm32-gpio";
> -};
> -
>  &pinctrl {
>  	u-boot,dm-pre-reloc;
> 
> diff --git a/arch/arm/dts/stm32mp157-u-boot.dtsi b/arch/arm/dts/stm32mp157-u-
> boot.dtsi
> index 09560e2d91..66dc6df787 100644
> --- a/arch/arm/dts/stm32mp157-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157-u-boot.dtsi
> @@ -82,62 +82,50 @@
>  };
> 
>  &gpioa {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpiob {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpioc {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpiod {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpioe {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpiof {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpiog {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpioh {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpioi {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpioj {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpiok {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
>  &gpioz {
> -	compatible = "st,stm32-gpio";
>  	u-boot,dm-pre-reloc;
>  };
> 
> --
> 2.17.1

Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
