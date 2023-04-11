Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2A16DD374
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Apr 2023 08:53:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A46C1C62EFE;
	Tue, 11 Apr 2023 06:53:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D60D8C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 06:53:47 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33B2AhYw003795; Tue, 11 Apr 2023 08:53:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Ar5n1RcGnOY9wyoXiedtEgLZmkjmULpNszYj319gqdU=;
 b=P3bUIJvvrTvmfuP7bH1LBeVGg1Rcpgou4GtpylRoWjrotB5bqNOAkpvcYy07XMuoGpqM
 AEyxf46UN/IH9KhP3bNeQGAjU9daGJ1KP9mETAgpZSx170dIuILIEkMgvVb7tAzr9Q0O
 fmcnYp9jPuxmVHjBjwIcXF+IsCX2QjbCu2pKCGmOgernA3a0vrYE5ZP8ZYIAtwFUtsPR
 zVHmqzO2UnWa5qP3CWwY+LInV4RBgz3Ewuoyq/NSJ9smrSU00OqOnYu0AfwSReOvzCms
 Ae6a1tRLhtDrPCjAxiBCnsUbFR1LF6r1jSKfuBhpQ/RxKN7CtTPBIdkfFu1gDZw196j2 cQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ptym3k4rh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Apr 2023 08:53:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B51D6100038;
 Tue, 11 Apr 2023 08:53:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AA426210580;
 Tue, 11 Apr 2023 08:53:45 +0200 (CEST)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 11 Apr
 2023 08:53:45 +0200
Message-ID: <aeb10e8a-4738-ebc5-863c-a9f5c6846145@foss.st.com>
Date: Tue, 11 Apr 2023 08:53:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>, <u-boot@lists.denx.de>
References: <20230330092618.351308-1-christophe.kerello@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230330092618.351308-1-christophe.kerello@foss.st.com>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-11_03,2023-04-06_03,2023-02-09_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: add FMC support on
	STM32MP13x SoC family
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

Hi Christophe

On 3/30/23 11:26, Christophe Kerello wrote:
> Add FMC support on STM32MP13x SoC family.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp131.dtsi | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32mp131.dtsi b/arch/arm/dts/stm32mp131.dtsi
> index 3cf51f09bcb..cf1171bc9bb 100644
> --- a/arch/arm/dts/stm32mp131.dtsi
> +++ b/arch/arm/dts/stm32mp131.dtsi
> @@ -191,6 +191,39 @@
>  			dma-requests = <48>;
>  		};
>  
> +		fmc: memory-controller@58002000 {
> +			compatible = "st,stm32mp1-fmc2-ebi";
> +			reg = <0x58002000 0x1000>;
> +			ranges = <0 0 0x60000000 0x04000000>, /* EBI CS 1 */
> +				 <1 0 0x64000000 0x04000000>, /* EBI CS 2 */
> +				 <2 0 0x68000000 0x04000000>, /* EBI CS 3 */
> +				 <3 0 0x6c000000 0x04000000>, /* EBI CS 4 */
> +				 <4 0 0x80000000 0x10000000>; /* NAND */
> +			#address-cells = <2>;
> +			#size-cells = <1>;
> +			clocks = <&rcc FMC_K>;
> +			resets = <&rcc FMC_R>;
> +			status = "disabled";
> +
> +			nand-controller@4,0 {
> +				compatible = "st,stm32mp1-fmc2-nfc";
> +				reg = <4 0x00000000 0x1000>,
> +				      <4 0x08010000 0x1000>,
> +				      <4 0x08020000 0x1000>,
> +				      <4 0x01000000 0x1000>,
> +				      <4 0x09010000 0x1000>,
> +				      <4 0x09020000 0x1000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> +				dmas = <&mdma 24 0x2 0x12000a02 0x0 0x0>,
> +				       <&mdma 24 0x2 0x12000a08 0x0 0x0>,
> +				       <&mdma 25 0x2 0x12000a0a 0x0 0x0>;
> +				dma-names = "tx", "rx", "ecc";
> +				status = "disabled";
> +			};
> +		};
> +
>  		sdmmc1: mmc@58005000 {
>  			compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
>  			arm,primecell-periphid = <0x20253180>;


Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
