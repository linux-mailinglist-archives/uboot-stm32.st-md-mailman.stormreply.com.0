Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C838D52E4F9
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 08:28:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 956E1C56630;
	Fri, 20 May 2022 06:28:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F799C5662F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 06:28:46 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K236IK019063;
 Fri, 20 May 2022 08:28:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=UnMWo0GcDb6NrSk2X3rSFD4Pb7qlKSK28zkElAVOSnI=;
 b=p6xerb4hWNdvnrC8/1UfOdswV79LBSD2JoxxdqJCBOAqM5cabNGw2TMXFK+OYgIIQigf
 nLzAo0dH1ODrE365VfddVueFwxED5rRxHFwIP0sWsaB9JK8q20E7ZLQXph2N9lqjLJ25
 wnA8gb04YZKuekP4DxdGmXDDd876M0V4C7YVDfrggGRZZHNUNH4RJowRjZADUIz8kNJZ
 PWSvDoXuRb73M5pU6pdSKdxw9wnsq1w8kMjnr1fLwHT/lkj4hu6jXsyIQxO8CdCRCOlq
 MaTL5GDU3rWMLikAWSMDEjZCHdHbzNGa7pzPcMrxgPYx+T6d6hp6akNx45hWGoxDdatR 2g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21umagxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 08:28:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 82EA4100034;
 Fri, 20 May 2022 08:28:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 76782210F96;
 Fri, 20 May 2022 08:28:44 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.49) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 08:28:43 +0200
Message-ID: <c0af06e3-a939-170d-b8ee-32d5f8732611@foss.st.com>
Date: Fri, 20 May 2022 08:28:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220519155647.1433652-1-patrick.delaunay@foss.st.com>
 <20220519175614.v2.3.I43cd48cb3b34ee1655bd373e119c9072ef04d8c7@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220519175614.v2.3.I43cd48cb3b34ee1655bd373e119c9072ef04d8c7@changeid>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_02,2022-05-19_03,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 3/3] ARM: dts: stm32: add rcc node for
	STM32MP13
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

On 5/19/22 17:56, Patrick Delaunay wrote:
> Add the RCC node, not yet in Linux kernel device tree
> to handle the U-Boot RCC drivers with the needed U-Boot
> property "u-boot,dm-pre-reloc" property as the clock and reset drivers
> are required during pre-location.
> 
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> (no changes since v1)
> 
>  arch/arm/dts/stm32mp13-u-boot.dtsi | 4 ++++
>  arch/arm/dts/stm32mp131.dtsi       | 7 +++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32mp13-u-boot.dtsi b/arch/arm/dts/stm32mp13-u-boot.dtsi
> index 1b5b358690..126f282816 100644
> --- a/arch/arm/dts/stm32mp13-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp13-u-boot.dtsi
> @@ -86,6 +86,10 @@
>  	u-boot,dm-pre-reloc;
>  };
>  
> +&rcc {
> +	u-boot,dm-pre-reloc;
> +};
> +
>  &syscfg {
>  	u-boot,dm-pre-reloc;
>  };
> diff --git a/arch/arm/dts/stm32mp131.dtsi b/arch/arm/dts/stm32mp131.dtsi
> index 950e172e45..fcb0af09b5 100644
> --- a/arch/arm/dts/stm32mp131.dtsi
> +++ b/arch/arm/dts/stm32mp131.dtsi
> @@ -159,6 +159,13 @@
>  			dma-channels = <16>;
>  		};
>  
> +		rcc: rcc@50000000 {
> +			compatible = "st,stm32mp13-rcc", "syscon";
> +			reg = <0x50000000 0x1000>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
>  		exti: interrupt-controller@5000d000 {
>  			compatible = "st,stm32mp13-exti", "syscon";
>  			interrupt-controller;
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
