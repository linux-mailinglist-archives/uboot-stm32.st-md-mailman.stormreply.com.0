Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B88F36177E6
	for <lists+uboot-stm32@lfdr.de>; Thu,  3 Nov 2022 08:46:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F292C6411C;
	Thu,  3 Nov 2022 07:46:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99F54C03FDA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Nov 2022 07:46:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A351XTl023920; Thu, 3 Nov 2022 08:46:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=oC5B5gDV4/fP/S+vSsEb/UDtFSZK6e/0ylV9dCUzJzI=;
 b=ciwWikjUFioAE9j4ZKNIgKnL9nibqfg6X0UKr+ZzqumUPwz0Y18jbc7TcYQlc8JudMJC
 uW0JCHL58S/O1SiQh3gUsemv8IIwRDp0Q+iNut3J/FMEzAUYAXlWmf+K7jg6dQxu5LYk
 wRyhatKodxvaxDWdIb1r+RBBbg66NvAuYWmTgwGC3oNFbJXRn0OZ5nQsTlaAX0Ye42nk
 Rd0RJR/6uLHM/XOnQGq9LHMuoRVFn6RYhypf/jhN0AQhx3MSpv9HKArKyrL8WAx04yM/
 eOtUN1uaCKsfADD+a8RbJSsogfDxl+lze7zyl1ANfl93cEq63wIdT21eBEjhauFHWVYE Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kknqvxr5c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 08:46:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9578F100034;
 Thu,  3 Nov 2022 08:46:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 89C56210F9B;
 Thu,  3 Nov 2022 08:46:16 +0100 (CET)
Received: from [10.252.29.133] (10.252.29.133) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 3 Nov
 2022 08:46:16 +0100
Message-ID: <6160c6e0-cc53-48ff-767b-e0a5f43ee7be@foss.st.com>
Date: Thu, 3 Nov 2022 08:46:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Yann Gautier <yann.gautier@foss.st.com>, <u-boot@lists.denx.de>
References: <20221102135349.102615-1-yann.gautier@foss.st.com>
 <20221102135349.102615-2-yann.gautier@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20221102135349.102615-2-yann.gautier@foss.st.com>
X-Originating-IP: [10.252.29.133]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_15,2022-11-02_01,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Dillon Min <dillon.minfei@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] ARM: dts: stm32: Drop MMCI
	interrupt-names
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



On 11/2/22 14:53, Yann Gautier wrote:
> From: Marek Vasut <marex@denx.de>
> 
> The pl18x MMCI driver does not use the interrupt-names property,
> the binding document has been updated to recommend this property
> be unused, remove it.
> Backport of Marek's Linux patch:
> https://lore.kernel.org/linux-arm-kernel/20221013221242.218808-3-marex@denx.de/
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Yann Gautier <yann.gautier@foss.st.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32h743.dtsi  | 2 --
>  arch/arm/dts/stm32mp131.dtsi | 2 --
>  arch/arm/dts/stm32mp151.dtsi | 3 ---
>  3 files changed, 7 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32h743.dtsi b/arch/arm/dts/stm32h743.dtsi
> index ceb629c4fa..c490d0a571 100644
> --- a/arch/arm/dts/stm32h743.dtsi
> +++ b/arch/arm/dts/stm32h743.dtsi
> @@ -339,7 +339,6 @@
>  			arm,primecell-periphid = <0x10153180>;
>  			reg = <0x52007000 0x1000>;
>  			interrupts = <49>;
> -			interrupt-names = "cmd_irq";
>  			clocks = <&rcc SDMMC1_CK>;
>  			clock-names = "apb_pclk";
>  			resets = <&rcc STM32H7_AHB3_RESET(SDMMC1)>;
> @@ -353,7 +352,6 @@
>  			arm,primecell-periphid = <0x10153180>;
>  			reg = <0x48022400 0x400>;
>  			interrupts = <124>;
> -			interrupt-names = "cmd_irq";
>  			clocks = <&rcc SDMMC2_CK>;
>  			clock-names = "apb_pclk";
>  			resets = <&rcc STM32H7_AHB2_RESET(SDMMC2)>;
> diff --git a/arch/arm/dts/stm32mp131.dtsi b/arch/arm/dts/stm32mp131.dtsi
> index a1c6d0d00b..661d329b45 100644
> --- a/arch/arm/dts/stm32mp131.dtsi
> +++ b/arch/arm/dts/stm32mp131.dtsi
> @@ -231,7 +231,6 @@
>  			arm,primecell-periphid = <0x20253180>;
>  			reg = <0x58005000 0x1000>, <0x58006000 0x1000>;
>  			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "cmd_irq";
>  			clocks = <&clk_pll4_p>;
>  			clock-names = "apb_pclk";
>  			cap-sd-highspeed;
> @@ -245,7 +244,6 @@
>  			arm,primecell-periphid = <0x20253180>;
>  			reg = <0x58007000 0x1000>, <0x58008000 0x1000>;
>  			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "cmd_irq";
>  			clocks = <&clk_pll4_p>;
>  			clock-names = "apb_pclk";
>  			cap-sd-highspeed;
> diff --git a/arch/arm/dts/stm32mp151.dtsi b/arch/arm/dts/stm32mp151.dtsi
> index f0fb022fc6..8bbb1aef2e 100644
> --- a/arch/arm/dts/stm32mp151.dtsi
> +++ b/arch/arm/dts/stm32mp151.dtsi
> @@ -1102,7 +1102,6 @@
>  			arm,primecell-periphid = <0x00253180>;
>  			reg = <0x48004000 0x400>;
>  			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "cmd_irq";
>  			clocks = <&rcc SDMMC3_K>;
>  			clock-names = "apb_pclk";
>  			resets = <&rcc SDMMC3_R>;
> @@ -1435,7 +1434,6 @@
>  			arm,primecell-periphid = <0x00253180>;
>  			reg = <0x58005000 0x1000>;
>  			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "cmd_irq";
>  			clocks = <&rcc SDMMC1_K>;
>  			clock-names = "apb_pclk";
>  			resets = <&rcc SDMMC1_R>;
> @@ -1450,7 +1448,6 @@
>  			arm,primecell-periphid = <0x00253180>;
>  			reg = <0x58007000 0x1000>;
>  			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "cmd_irq";
>  			clocks = <&rcc SDMMC2_K>;
>  			clock-names = "apb_pclk";
>  			resets = <&rcc SDMMC2_R>;

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
