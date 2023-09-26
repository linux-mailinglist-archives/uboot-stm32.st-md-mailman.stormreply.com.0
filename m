Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7CD7AE85F
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Sep 2023 10:54:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69665C6A5F2;
	Tue, 26 Sep 2023 08:54:59 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9048C6A5EA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Sep 2023 08:54:57 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38Q6sTgL011516; Tue, 26 Sep 2023 10:54:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=Bc5oCp2df8KeNx4LQ9gn6AXOyQrqWoIA8o0Y34JVe9M=; b=a+
 1YaTb0uWkjfKXACfEH+fhpVaOwhAuP04sSh3WdiWkpYLg3DNxkCOWFoxlZ0+tS1g
 AHWyeI2DACqN3uN1F4EmjEfHx1A5HDuXyFIRzeuqnk2ZkHa9eDPj9obVGYw/Nmty
 ww2nOsvbYPviNBIGECAozmlh6UnKp37eGM+mqxwGe0NwArHyOgHblI7RsX4ehE8T
 QjfBq+rwp1cix1z9esAUmzoMlGAhkyx4vIOK50e9Bo1x7mrKCBmAQeXjFCgIRvVG
 YC0VvJlL0lSBbKshSp7pAXgsp4SQlFcUCm3+Q5Ugh187oOcnWIkc3/5APO/WjliD
 TA9kFAg7UDDCDQ0QucBg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3taayhhmmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Sep 2023 10:54:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CD34C10005A;
 Tue, 26 Sep 2023 10:54:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C640522A6D1;
 Tue, 26 Sep 2023 10:54:55 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 26 Sep
 2023 10:54:55 +0200
Message-ID: <a0d6d275-91d2-bbf1-ee05-92c72583fc69@foss.st.com>
Date: Tue, 26 Sep 2023 10:54:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20230903204849.660722-1-dario.binacchi@amarulasolutions.com>
 <20230903204849.660722-10-dario.binacchi@amarulasolutions.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230903204849.660722-10-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_07,2023-09-25_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 linux-amarula@amarulasolutions.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 09/10] ARM: dts: stm32: rename mmc_vcard
 to vcc-3v3 on stm32f746-disco
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



On 9/3/23 22:48, Dario Binacchi wrote:
> commit e4e724099f04072053cf411456e3e9aae48c4af1 Linux upstream.
> 
> In the schematics of document UM1907, the power supply for the micro SD
> card is the same 3v3 voltage that is used to power other devices on the
> board. By generalizing the name of the voltage regulator, it can be
> referenced by other nodes in the device tree without creating
> misunderstandings.
> 
> This patch is preparatory for future developments.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32f746-disco.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32f746-disco.dts b/arch/arm/dts/stm32f746-disco.dts
> index 9541f449fd0e..e1564d69f9f6 100644
> --- a/arch/arm/dts/stm32f746-disco.dts
> +++ b/arch/arm/dts/stm32f746-disco.dts
> @@ -44,9 +44,9 @@
>  		regulator-always-on;
>  	};
>  
> -	mmc_vcard: mmc_vcard {
> +	vcc_3v3: vcc-3v3 {
>  		compatible = "regulator-fixed";
> -		regulator-name = "mmc_vcard";
> +		regulator-name = "vcc_3v3";
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
>  	};
> @@ -82,7 +82,7 @@
>  
>  &sdio1 {
>  	status = "okay";
> -	vmmc-supply = <&mmc_vcard>;
> +	vmmc-supply = <&vcc_3v3>;
>  	cd-gpios = <&gpioc 13 GPIO_ACTIVE_LOW>;
>  	pinctrl-names = "default", "opendrain";
>  	pinctrl-0 = <&sdio_pins_a>;
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
