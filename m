Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E78AF6D3E59
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Apr 2023 09:45:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AA09C65E56;
	Mon,  3 Apr 2023 07:45:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38FE4C64107
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 07:45:57 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3337E7Ge006158; Mon, 3 Apr 2023 09:45:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=SHW8DRBFSbOpAauvtzxzoSLBq6tyZtlxPWlUNS9OwYE=;
 b=NJ5aUiAf49gaGV3dAc3mlzYQbPqODBVIkc1iGIryHJK1xQrX/FEvtodObnd2NYfsIbHZ
 lGrpFKNYeUD6eFItGjess81qQ9PKzEX8CivafeCjoNZyY9IdVMU0r7+hsy6nsuFHD/RT
 4IzmHYMja2EbLuKFNJTXcGRLFxzmK6CAiCLoXwkd7fc669pOGjveQiATtz7QGU5/bHrC
 fnjYdespEi9W3UwPet1SUUqoI7lkCIcVZNS3L+YccGimfbB3VddMF6LaGomKxCKBn4Iq
 7KCPf5cpKyOd2VHqZkirdqbi/K0S/B7V+MjnpSD/29/KEr1FTpCIBmmUf/Onaq5T9xFL Ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ppby3rbbv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Apr 2023 09:45:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 90C4710002A;
 Mon,  3 Apr 2023 09:45:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 875B22122F5;
 Mon,  3 Apr 2023 09:45:54 +0200 (CEST)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 3 Apr
 2023 09:45:53 +0200
Message-ID: <2e574de8-aa40-d6dd-9403-8b5856ac454a@foss.st.com>
Date: Mon, 3 Apr 2023 09:45:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20230403060411.223861-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20230403060411.223861-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_04,2023-03-31_01,2023-02-09_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Add QSPI support on
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 4/3/23 08:04, Patrice Chotard wrote:
> Add QSPI support on STM32MP13x SoC family
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   arch/arm/dts/stm32mp131.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm/dts/stm32mp131.dtsi b/arch/arm/dts/stm32mp131.dtsi
> index 3cf51f09bcb..5a064d5566e 100644
> --- a/arch/arm/dts/stm32mp131.dtsi
> +++ b/arch/arm/dts/stm32mp131.dtsi
> @@ -191,6 +191,21 @@
>   			dma-requests = <48>;
>   		};
>   
> +		qspi: spi@58003000 {
> +			compatible = "st,stm32f469-qspi";
> +			reg = <0x58003000 0x1000>, <0x70000000 0x10000000>;
> +			reg-names = "qspi", "qspi_mm";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
> +			dmas = <&mdma 26 0x2 0x10100002 0x0 0x0>,
> +			       <&mdma 26 0x2 0x10100008 0x0 0x0>;
> +			dma-names = "tx", "rx";
> +			clocks = <&rcc QSPI_K>;
> +			resets = <&rcc QSPI_R>;
> +			status = "disabled";
> +		};
> +
>   		sdmmc1: mmc@58005000 {
>   			compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
>   			arm,primecell-periphid = <0x20253180>;



Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick




_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
