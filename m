Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F907AE8D0
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Sep 2023 11:20:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E6EBC6A5F2;
	Tue, 26 Sep 2023 09:20:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70421C6A5EA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Sep 2023 09:20:53 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38Q5OcxG027210; Tue, 26 Sep 2023 11:20:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=ILCtKc02MBErGMS0j91+5nX4s/sMu5aJeH1Y/7/0LGY=; b=Ff
 2ekY48HyHjvPllbzd3iFoz471ibr1EOeufrXWxWiuNuoUSReSISKeO9YeQyuOAG8
 NU9NC4eWvDR1H+jXHB2onUOoRKC6D6153vnE6UiIFZvwdDbAqO/uDdfD7mLniFGc
 I76rq++r4spDUW9eyIzN8kYvzdElwdlwbIg1dtxRi+t4qfFm78JgwXP9ExzQ1EpQ
 PmPsLJgE6F7iP4B1i1UJ4bv911SXbDpOvQ6WOE4ClbsMKR3eW92AZZkjVnn5q1DN
 LxR5iPP2GorKe268Cx7Hq9ATLzYTF9tYGumLRtkLVPAlL3fmy4OPDPlPcbkG2e39
 7Kolwlw3L4+gD/2id9ng==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t9nefkscq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Sep 2023 11:20:48 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 07D43100059;
 Tue, 26 Sep 2023 11:20:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0008922FA2E;
 Tue, 26 Sep 2023 11:20:47 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 26 Sep
 2023 11:20:47 +0200
Message-ID: <5ee83dd3-91a8-3bed-15f7-7293d8b8936b@foss.st.com>
Date: Tue, 26 Sep 2023 11:20:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20230903204849.660722-1-dario.binacchi@amarulasolutions.com>
 <20230903204849.660722-4-dario.binacchi@amarulasolutions.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230903204849.660722-4-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_07,2023-09-25_01,2023-05-22_02
Cc: Tom Rini <trini@konsulko.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH 03/10] ARM: dts: stm32: add CAN support on
	stm32f746
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
> commit 0920ccdf41e3078a4dd2567eb905ea154bc826e6 Linux upstream.
> 
> Add support for bxcan (Basic eXtended CAN controller) to STM32F746. The
> chip contains three CAN peripherals, CAN1 and CAN2 in dual peripheral
> configuration and CAN3 in single peripheral configuration:
> - Dual CAN peripheral configuration:
>   * CAN1: Primary bxCAN for managing the communication between a secondary
>     bxCAN and the 512-byte SRAM memory.
>   * CAN2: Secondary bxCAN with no direct access to the SRAM memory.
>   This means that the two bxCAN cells share the 512-byte SRAM memory and
>   CAN2 can't be used without enabling CAN1.
> - Single CAN peripheral configuration:
>   * CAN3: Primary bxCAN with dedicated Memory Access Controller unit and
>     512-byte SRAM memory.
> 
>  -------------------------------------------------------------------------
> | features | CAN1              | CAN2               | CAN 3               |
>  -------------------------------------------------------------------------
> | SRAM     | 512-byte shared between CAN1 & CAN2    | 512-byte            |
>  -------------------------------------------------------------------------
> | Filters  | 26 filters shared between CAN1 & CAN2  | 14 filters          |
>  -------------------------------------------------------------------------
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Link: https://lore.kernel.org/all/20230427204540.3126234-6-dario.binacchi@amarulasolutions.com
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> ---
> 
>  arch/arm/dts/stm32f746.dtsi | 47 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32f746.dtsi b/arch/arm/dts/stm32f746.dtsi
> index c97b3d0d07db..dc5c257fb5fb 100644
> --- a/arch/arm/dts/stm32f746.dtsi
> +++ b/arch/arm/dts/stm32f746.dtsi
> @@ -221,6 +221,23 @@
>  			status = "disabled";
>  		};
>  
> +		can3: can@40003400 {
> +			compatible = "st,stm32f4-bxcan";
> +			reg = <0x40003400 0x200>;
> +			interrupts = <104>, <105>, <106>, <107>;
> +			interrupt-names = "tx", "rx0", "rx1", "sce";
> +			resets = <&rcc STM32F7_APB1_RESET(CAN3)>;
> +			clocks = <&rcc 0 STM32F7_APB1_CLOCK(CAN3)>;
> +			st,gcan = <&gcan3>;
> +			status = "disabled";
> +		};
> +
> +		gcan3: gcan@40003600 {
> +			compatible = "st,stm32f4-gcan", "syscon";
> +			reg = <0x40003600 0x200>;
> +			clocks = <&rcc 0 STM32F7_APB1_CLOCK(CAN3)>;
> +		};
> +
>  		usart2: serial@40004400 {
>  			compatible = "st,stm32f7-uart";
>  			reg = <0x40004400 0x400>;
> @@ -301,6 +318,36 @@
>  			status = "disabled";
>  		};
>  
> +		can1: can@40006400 {
> +			compatible = "st,stm32f4-bxcan";
> +			reg = <0x40006400 0x200>;
> +			interrupts = <19>, <20>, <21>, <22>;
> +			interrupt-names = "tx", "rx0", "rx1", "sce";
> +			resets = <&rcc STM32F7_APB1_RESET(CAN1)>;
> +			clocks = <&rcc 0 STM32F7_APB1_CLOCK(CAN1)>;
> +			st,can-primary;
> +			st,gcan = <&gcan1>;
> +			status = "disabled";
> +		};
> +
> +		gcan1: gcan@40006600 {
> +			compatible = "st,stm32f4-gcan", "syscon";
> +			reg = <0x40006600 0x200>;
> +			clocks = <&rcc 0 STM32F7_APB1_CLOCK(CAN1)>;
> +		};
> +
> +		can2: can@40006800 {
> +			compatible = "st,stm32f4-bxcan";
> +			reg = <0x40006800 0x200>;
> +			interrupts = <63>, <64>, <65>, <66>;
> +			interrupt-names = "tx", "rx0", "rx1", "sce";
> +			resets = <&rcc STM32F7_APB1_RESET(CAN2)>;
> +			clocks = <&rcc 0 STM32F7_APB1_CLOCK(CAN2)>;
> +			st,can-secondary;
> +			st,gcan = <&gcan1>;
> +			status = "disabled";
> +		};
> +
>  		cec: cec@40006c00 {
>  			compatible = "st,stm32-cec";
>  			reg = <0x40006C00 0x400>;
Apply on stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
