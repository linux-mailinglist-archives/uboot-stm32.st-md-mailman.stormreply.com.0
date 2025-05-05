Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B77AA9465
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 May 2025 15:24:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBE9AC78F63;
	Mon,  5 May 2025 13:24:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62FA2C78039
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 May 2025 13:24:07 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545B3Isg025904;
 Mon, 5 May 2025 15:24:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Bxpw1VgEUXeambTs2xGc1ntSyqrk9uW1mwxVbS1++RI=; b=dsMKLNWS2mdyO37d
 oJQ7ZbVYi+xqf69VlT/bONsYEQeBETPRwBA09WwPLl9xxDMdzzdJQeOC3gQBpM1d
 /+kFyWNYdcw5krBxIrWelB3cb8w14yrrbUMB3lhm2JKpAbaTHDJNBPC+0sQGKOZm
 vzX43Nsww3zxnTC87534u8nXoZc79n/YbGRhgY5QttA+7s9xqL0X2Spi2baSuwWI
 PKtY4hyMeaAelXAUl9o1AAUA+7mWH8pJts3Nfaod+cZjArd13AP+ZDV8Ci5TxUKI
 2/mO21E46oNgDzI6j2fCsAlnXK7CjwtU8MxRZCA/v68rcoLIpJ4bovAUfd/XMs/l
 WdU5cg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46dvq3vu39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 May 2025 15:24:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DEAD440049;
 Mon,  5 May 2025 15:22:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC60AB38459;
 Mon,  5 May 2025 15:21:54 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 May
 2025 15:21:54 +0200
Message-ID: <5492ba6f-4e81-4964-ad45-e3cbc7176e34@foss.st.com>
Date: Mon, 5 May 2025 15:21:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20250401070125.3705126-1-dario.binacchi@amarulasolutions.com>
 <20250401070125.3705126-3-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250401070125.3705126-3-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH v2 2/6] ARM: dts: stm32: rename mmc_vcard
 to vcc-3v3 on stm32f769-disco
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



On 4/1/25 09:00, Dario Binacchi wrote:
> [backport from Linux commit f1317928fa03203929665af61e6d9ac0e29ea84d]
> 
> In the schematics of document UM2033, the power supply for the micro SD
> card is the same 3v3 voltage that is used to power other devices on the
> board. By generalizing the name of the voltage regulator, it can be
> referenced by other nodes in the device tree without creating
> misunderstandings.
> 
> This patch is preparatory for future developments.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> ---
> 
> Changes in v2:
> - Add Reviewed-by tag of Patrice Chotard
> 
>  arch/arm/dts/stm32f769-disco.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32f769-disco.dts b/arch/arm/dts/stm32f769-disco.dts
> index ad1b442055e1..b4e240a8e3eb 100644
> --- a/arch/arm/dts/stm32f769-disco.dts
> +++ b/arch/arm/dts/stm32f769-disco.dts
> @@ -56,9 +56,9 @@
>  		clock-names = "main_clk";
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
> @@ -96,7 +96,7 @@
>  
>  &sdio2 {
>  	status = "okay";
> -	vmmc-supply = <&mmc_vcard>;
> +	vmmc-supply = <&vcc_3v3>;
>  	cd-gpios = <&gpioi 15 GPIO_ACTIVE_LOW>;
>  	broken-cd;
>  	pinctrl-names = "default", "opendrain";

Hi Dario

For information, stm32f769-disco.dts update 
has been dropped due to OF_UPSTREAM now available on stm32 platforms.

Both dropped files will be bring back during nect kernel -> U-Boot DT synchronisation.

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
