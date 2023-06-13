Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 611AF72D9CC
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Jun 2023 08:23:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A68AC6A615;
	Tue, 13 Jun 2023 06:23:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A85DC6A60F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 06:23:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35D0H0pV031072; Tue, 13 Jun 2023 08:23:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=iywzfRaHhxIRQ8vtpQQPHfMAvH/toIYhx+jeSHaO/jE=;
 b=0wEWvBv1yCgWwLqXvI1SSeqqtQ2S2Cp2WUGcwpDVgv8KfrGpsI9zNRJWzxVA9+oziNBq
 OV/0JvcY8LTkobYU5vSkII2rCQAFIMLOoEiY4buWtz8cUqPcNqLD14ldc+0+Qj8w8rnw
 YxNOAveDeeBGifcT8PfHHQc2Dddo0oLTzVCIJMTmxuyK/Z4kZuRHV3ygzHzJTwQpzWil
 nLhFYbWNnrPbJl9FEZktijpcxQRn1xJQ5rWVI7Lth4Te7tzEnUVl9qel2lyxnOMbDQPA
 dwws1YeeGAKqbxE4p1TlcwHtqBxDoaNFK3tGYkvZfPi0pSB9zEJJ8gCB7YK89RD0Et0Y AA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r652tupme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 08:23:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ABDAD10002A;
 Tue, 13 Jun 2023 08:23:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A49CB20FA53;
 Tue, 13 Jun 2023 08:23:38 +0200 (CEST)
Received: from [10.201.20.56] (10.201.20.56) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 13 Jun
 2023 08:23:38 +0200
Message-ID: <013bce45-64d5-cc99-196c-753411b0b988@foss.st.com>
Date: Tue, 13 Jun 2023 08:23:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
 <20230608171614.5.I06644b2492806114746756df78585e311967e3bc@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230608171614.5.I06644b2492806114746756df78585e311967e3bc@changeid>
X-Originating-IP: [10.201.20.56]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_03,2023-06-12_02,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 05/12] arm: dts: stm32: Align
 stm32mp15xx-*-scmi-u-boot.dtsi file
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



On 6/8/23 17:16, Patrick Delaunay wrote:
> Update "secure" version of STM32 boards based on SCMI when RCC_TZCR.TZEN=1
> stm32mp15xx-*-scmi-u-boot.dtsi with latest patches on files
> stm32mp15xx-*-u-boot.dtsi.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi      |  1 +
>  arch/arm/dts/stm32mp157c-dk2-scmi-u-boot.dtsi |  7 ++++
>  arch/arm/dts/stm32mp157c-ev1-scmi-u-boot.dtsi | 40 +++++++++++++++++++
>  3 files changed, 48 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> index cff3f49948e4..2623cebf21a4 100644
> --- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> @@ -12,6 +12,7 @@
>  		i2c3 = &i2c4;
>  		usb0 = &usbotg_hs;
>  	};
> +
>  	config {
>  		u-boot,boot-led = "heartbeat";
>  		u-boot,error-led = "error";
> diff --git a/arch/arm/dts/stm32mp157c-dk2-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp157c-dk2-scmi-u-boot.dtsi
> index 5a8fc15ab2b7..ae93497cd5a8 100644
> --- a/arch/arm/dts/stm32mp157c-dk2-scmi-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157c-dk2-scmi-u-boot.dtsi
> @@ -4,3 +4,10 @@
>   */
>  
>  #include "stm32mp157a-dk1-scmi-u-boot.dtsi"
> +
> +/ {
> +	fwu-mdata {
> +		compatible = "u-boot,fwu-mdata-gpt";
> +		fwu-mdata-store = <&sdmmc1>;
> +	};
> +};
> diff --git a/arch/arm/dts/stm32mp157c-ev1-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ev1-scmi-u-boot.dtsi
> index 71a94f9130a6..eef717946b5f 100644
> --- a/arch/arm/dts/stm32mp157c-ev1-scmi-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157c-ev1-scmi-u-boot.dtsi
> @@ -14,4 +14,44 @@
>  		spi0 = &qspi;
>  		usb0 = &usbotg_hs;
>  	};
> +
> +	fwu-mdata {
> +		compatible = "u-boot,fwu-mdata-gpt";
> +		fwu-mdata-store = <&sdmmc1>;
> +	};
> +};
> +
> +&flash0 {
> +	bootph-pre-ram;
> +};
> +
> +&qspi {
> +	bootph-pre-ram;
> +};
> +
> +&qspi_clk_pins_a {
> +	bootph-pre-ram;
> +	pins {
> +		bootph-pre-ram;
> +	};
> +};
> +
> +&qspi_bk1_pins_a {
> +	bootph-pre-ram;
> +	pins1 {
> +		bootph-pre-ram;
> +	};
> +	pins2 {
> +		bootph-pre-ram;
> +	};
> +};
> +
> +&qspi_bk2_pins_a {
> +	bootph-pre-ram;
> +	pins1 {
> +		bootph-pre-ram;
> +	};
> +	pins2 {
> +		bootph-pre-ram;
> +	};
>  };
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
