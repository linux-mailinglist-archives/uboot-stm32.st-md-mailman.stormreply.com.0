Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4160B349474
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Mar 2021 15:46:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3AE1C57B5E;
	Thu, 25 Mar 2021 14:46:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEACAC5662E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 14:46:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12PEgXUr018116; Thu, 25 Mar 2021 15:46:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=aG3F26WFwvBm/Auoswzk4AgWdJA8510c+EqdPX3YhBg=;
 b=36lFepmnq70sVOjhNTgm6rDUoJ00T1et9HPlRWPchWycmXC07KWJcHSrIQ4lQupnN2qL
 171B1epnyGJtv9CUFVzAoC4mtjk/B8TqVoaWAjR7MC82nb8EKI9HPSUwtgEamKtK3jb/
 YcvE3+nixFLgeILut3JxnrFtANlzH7clEwI7GkGq/+fIX32PAjikmdJ98kEGbzvekJp1
 itYdklDEABzGtNia8FbJBrUSkp8CEu8lZDEt3NAQx1iKMexDQ50UD3iUmKZ5OKyZDDfJ
 n39azFTkY9rUr9ftangAMfHk7MAiOQknNKA2QQK6I/4h9bEuqm83TvcCMANg9FbFDrzK pA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37d8tpw80b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 15:46:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AAEC410002A;
 Thu, 25 Mar 2021 15:46:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 884A827002F;
 Thu, 25 Mar 2021 15:46:28 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 25 Mar
 2021 15:46:27 +0100
To: <dillon.minfei@gmail.com>, <kever.yang@rock-chips.com>,
 <andre.przywara@arm.com>, <priyanka.jain@nxp.com>,
 <jagan@amarulasolutions.com>, <narmstrong@baylibre.com>,
 <marex@denx.de>, <aford173@gmail.com>, <ioana.ciornei@nxp.com>,
 <josip.kelecic@sartura.hr>, <festevam@gmail.com>, <hs@denx.de>,
 <heiko.stuebner@theobroma-systems.com>, <u-boot@lists.denx.de>,
 <patrick.delaunay@foss.st.com>, <uboot-stm32@st-md-mailman.stormreply.com>
References: <1615445040-13757-1-git-send-email-dillon.minfei@gmail.com>
 <1615445040-13757-2-git-send-email-dillon.minfei@gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <dc5e1830-1856-ef15-ada8-3eebc6808ebb@foss.st.com>
Date: Thu, 25 Mar 2021 15:46:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1615445040-13757-2-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-25_03:2021-03-24,
 2021-03-25 signatures=0
Subject: Re: [Uboot-stm32] [PATCH 1/4] ARM: dts: stm32: split sdram pin &
 timing parameter into specific board dts
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

Hi Dillon

On 3/11/21 7:43 AM, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> As different boards has their own sdram hw connection, mount different
> sdram modules, so move sdram timing parameter and pin configuration
> to their board device tree.
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>  arch/arm/dts/stm32h7-u-boot.dtsi          | 95 ------------------------------
>  arch/arm/dts/stm32h743i-disco-u-boot.dtsi | 98 +++++++++++++++++++++++++++++++
>  arch/arm/dts/stm32h743i-eval-u-boot.dtsi  | 98 +++++++++++++++++++++++++++++++
>  3 files changed, 196 insertions(+), 95 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32h7-u-boot.dtsi b/arch/arm/dts/stm32h7-u-boot.dtsi
> index 54dd406..e34d066 100644
> --- a/arch/arm/dts/stm32h7-u-boot.dtsi
> +++ b/arch/arm/dts/stm32h7-u-boot.dtsi
> @@ -36,30 +36,6 @@
>  			pinctrl-0 = <&fmc_pins>;
>  			pinctrl-names = "default";
>  			status = "okay";
> -
> -			/*
> -			 * Memory configuration from sdram datasheet IS42S32800G-6BLI
> -			 * first bank is bank@0
> -			 * second bank is bank@1
> -			 */
> -			bank1: bank@1 {
> -				st,sdram-control = /bits/ 8 <NO_COL_9
> -							     NO_ROW_12
> -							     MWIDTH_32
> -							     BANKS_4
> -							     CAS_2
> -							     SDCLK_3
> -							     RD_BURST_EN
> -							     RD_PIPE_DL_0>;
> -				st,sdram-timing = /bits/ 8 <TMRD_1
> -							    TXSR_1
> -							    TRAS_1
> -							    TRC_6
> -							    TRP_2
> -							    TWR_1
> -							    TRCD_1>;
> -				st,sdram-refcount = <1539>;
> -			};
>  		};
>  	};
>  };
> @@ -136,77 +112,6 @@
>  	compatible = "st,stm32-gpio";
>  };
>  
> -&pinctrl {
> -	fmc_pins: fmc@0 {
> -		pins {
> -			pinmux = <STM32_PINMUX('D', 0, AF12)>,
> -				 <STM32_PINMUX('D', 1, AF12)>,
> -				 <STM32_PINMUX('D', 8, AF12)>,
> -				 <STM32_PINMUX('D', 9, AF12)>,
> -				 <STM32_PINMUX('D',10, AF12)>,
> -				 <STM32_PINMUX('D',14, AF12)>,
> -				 <STM32_PINMUX('D',15, AF12)>,
> -
> -				 <STM32_PINMUX('E', 0, AF12)>,
> -				 <STM32_PINMUX('E', 1, AF12)>,
> -				 <STM32_PINMUX('E', 7, AF12)>,
> -				 <STM32_PINMUX('E', 8, AF12)>,
> -				 <STM32_PINMUX('E', 9, AF12)>,
> -				 <STM32_PINMUX('E',10, AF12)>,
> -				 <STM32_PINMUX('E',11, AF12)>,
> -				 <STM32_PINMUX('E',12, AF12)>,
> -				 <STM32_PINMUX('E',13, AF12)>,
> -				 <STM32_PINMUX('E',14, AF12)>,
> -				 <STM32_PINMUX('E',15, AF12)>,
> -
> -				 <STM32_PINMUX('F', 0, AF12)>,
> -				 <STM32_PINMUX('F', 1, AF12)>,
> -				 <STM32_PINMUX('F', 2, AF12)>,
> -				 <STM32_PINMUX('F', 3, AF12)>,
> -				 <STM32_PINMUX('F', 4, AF12)>,
> -				 <STM32_PINMUX('F', 5, AF12)>,
> -				 <STM32_PINMUX('F',11, AF12)>,
> -				 <STM32_PINMUX('F',12, AF12)>,
> -				 <STM32_PINMUX('F',13, AF12)>,
> -				 <STM32_PINMUX('F',14, AF12)>,
> -				 <STM32_PINMUX('F',15, AF12)>,
> -
> -				 <STM32_PINMUX('G', 0, AF12)>,
> -				 <STM32_PINMUX('G', 1, AF12)>,
> -				 <STM32_PINMUX('G', 2, AF12)>,
> -				 <STM32_PINMUX('G', 4, AF12)>,
> -				 <STM32_PINMUX('G', 5, AF12)>,
> -				 <STM32_PINMUX('G', 8, AF12)>,
> -				 <STM32_PINMUX('G',15, AF12)>,
> -
> -				 <STM32_PINMUX('H', 5, AF12)>,
> -				 <STM32_PINMUX('H', 6, AF12)>,
> -				 <STM32_PINMUX('H', 7, AF12)>,
> -				 <STM32_PINMUX('H', 8, AF12)>,
> -				 <STM32_PINMUX('H', 9, AF12)>,
> -				 <STM32_PINMUX('H',10, AF12)>,
> -				 <STM32_PINMUX('H',11, AF12)>,
> -				 <STM32_PINMUX('H',12, AF12)>,
> -				 <STM32_PINMUX('H',13, AF12)>,
> -				 <STM32_PINMUX('H',14, AF12)>,
> -				 <STM32_PINMUX('H',15, AF12)>,
> -
> -				 <STM32_PINMUX('I', 0, AF12)>,
> -				 <STM32_PINMUX('I', 1, AF12)>,
> -				 <STM32_PINMUX('I', 2, AF12)>,
> -				 <STM32_PINMUX('I', 3, AF12)>,
> -				 <STM32_PINMUX('I', 4, AF12)>,
> -				 <STM32_PINMUX('I', 5, AF12)>,
> -				 <STM32_PINMUX('I', 6, AF12)>,
> -				 <STM32_PINMUX('I', 7, AF12)>,
> -				 <STM32_PINMUX('I', 9, AF12)>,
> -				 <STM32_PINMUX('I',10, AF12)>;
> -
> -			slew-rate = <3>;
> -		};
> -	};
> -};
> -
>  &pwrcfg {
>  	u-boot,dm-pre-reloc;
>  };
> diff --git a/arch/arm/dts/stm32h743i-disco-u-boot.dtsi b/arch/arm/dts/stm32h743i-disco-u-boot.dtsi
> index 5965afc..02e28c6 100644
> --- a/arch/arm/dts/stm32h743i-disco-u-boot.dtsi
> +++ b/arch/arm/dts/stm32h743i-disco-u-boot.dtsi
> @@ -1,3 +1,101 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  
>  #include <stm32h7-u-boot.dtsi>
> +
> +&fmc {
> +
> +	/*
> +	 * Memory configuration from sdram datasheet IS42S32800G-6BLI
> +	 * first bank is bank@0
> +	 * second bank is bank@1
> +	 */
> +	bank1: bank@1 {
> +		st,sdram-control = /bits/ 8 <NO_COL_9
> +					     NO_ROW_12
> +					     MWIDTH_32
> +					     BANKS_4
> +					     CAS_2
> +					     SDCLK_3
> +					     RD_BURST_EN
> +					     RD_PIPE_DL_0>;
> +		st,sdram-timing = /bits/ 8 <TMRD_1
> +					    TXSR_1
> +					    TRAS_1
> +					    TRC_6
> +					    TRP_2
> +					    TWR_1
> +					    TRCD_1>;
> +		st,sdram-refcount = <1539>;
> +	};
> +};
> +
> +&pinctrl {
> +	fmc_pins: fmc@0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('D', 0, AF12)>,
> +				 <STM32_PINMUX('D', 1, AF12)>,
> +				 <STM32_PINMUX('D', 8, AF12)>,
> +				 <STM32_PINMUX('D', 9, AF12)>,
> +				 <STM32_PINMUX('D',10, AF12)>,
> +				 <STM32_PINMUX('D',14, AF12)>,
> +				 <STM32_PINMUX('D',15, AF12)>,
> +
> +				 <STM32_PINMUX('E', 0, AF12)>,
> +				 <STM32_PINMUX('E', 1, AF12)>,
> +				 <STM32_PINMUX('E', 7, AF12)>,
> +				 <STM32_PINMUX('E', 8, AF12)>,
> +				 <STM32_PINMUX('E', 9, AF12)>,
> +				 <STM32_PINMUX('E',10, AF12)>,
> +				 <STM32_PINMUX('E',11, AF12)>,
> +				 <STM32_PINMUX('E',12, AF12)>,
> +				 <STM32_PINMUX('E',13, AF12)>,
> +				 <STM32_PINMUX('E',14, AF12)>,
> +				 <STM32_PINMUX('E',15, AF12)>,
> +
> +				 <STM32_PINMUX('F', 0, AF12)>,
> +				 <STM32_PINMUX('F', 1, AF12)>,
> +				 <STM32_PINMUX('F', 2, AF12)>,
> +				 <STM32_PINMUX('F', 3, AF12)>,
> +				 <STM32_PINMUX('F', 4, AF12)>,
> +				 <STM32_PINMUX('F', 5, AF12)>,
> +				 <STM32_PINMUX('F',11, AF12)>,
> +				 <STM32_PINMUX('F',12, AF12)>,
> +				 <STM32_PINMUX('F',13, AF12)>,
> +				 <STM32_PINMUX('F',14, AF12)>,
> +				 <STM32_PINMUX('F',15, AF12)>,
> +
> +				 <STM32_PINMUX('G', 0, AF12)>,
> +				 <STM32_PINMUX('G', 1, AF12)>,
> +				 <STM32_PINMUX('G', 2, AF12)>,
> +				 <STM32_PINMUX('G', 4, AF12)>,
> +				 <STM32_PINMUX('G', 5, AF12)>,
> +				 <STM32_PINMUX('G', 8, AF12)>,
> +				 <STM32_PINMUX('G',15, AF12)>,
> +
> +				 <STM32_PINMUX('H', 5, AF12)>,
> +				 <STM32_PINMUX('H', 6, AF12)>,
> +				 <STM32_PINMUX('H', 7, AF12)>,
> +				 <STM32_PINMUX('H', 8, AF12)>,
> +				 <STM32_PINMUX('H', 9, AF12)>,
> +				 <STM32_PINMUX('H',10, AF12)>,
> +				 <STM32_PINMUX('H',11, AF12)>,
> +				 <STM32_PINMUX('H',12, AF12)>,
> +				 <STM32_PINMUX('H',13, AF12)>,
> +				 <STM32_PINMUX('H',14, AF12)>,
> +				 <STM32_PINMUX('H',15, AF12)>,
> +
> +				 <STM32_PINMUX('I', 0, AF12)>,
> +				 <STM32_PINMUX('I', 1, AF12)>,
> +				 <STM32_PINMUX('I', 2, AF12)>,
> +				 <STM32_PINMUX('I', 3, AF12)>,
> +				 <STM32_PINMUX('I', 4, AF12)>,
> +				 <STM32_PINMUX('I', 5, AF12)>,
> +				 <STM32_PINMUX('I', 6, AF12)>,
> +				 <STM32_PINMUX('I', 7, AF12)>,
> +				 <STM32_PINMUX('I', 9, AF12)>,
> +				 <STM32_PINMUX('I',10, AF12)>;
> +
> +			slew-rate = <3>;
> +		};
> +	};
> +};
> diff --git a/arch/arm/dts/stm32h743i-eval-u-boot.dtsi b/arch/arm/dts/stm32h743i-eval-u-boot.dtsi
> index 5965afc..02e28c6 100644
> --- a/arch/arm/dts/stm32h743i-eval-u-boot.dtsi
> +++ b/arch/arm/dts/stm32h743i-eval-u-boot.dtsi
> @@ -1,3 +1,101 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  
>  #include <stm32h7-u-boot.dtsi>
> +
> +&fmc {
> +
> +	/*
> +	 * Memory configuration from sdram datasheet IS42S32800G-6BLI
> +	 * first bank is bank@0
> +	 * second bank is bank@1
> +	 */
> +	bank1: bank@1 {
> +		st,sdram-control = /bits/ 8 <NO_COL_9
> +					     NO_ROW_12
> +					     MWIDTH_32
> +					     BANKS_4
> +					     CAS_2
> +					     SDCLK_3
> +					     RD_BURST_EN
> +					     RD_PIPE_DL_0>;
> +		st,sdram-timing = /bits/ 8 <TMRD_1
> +					    TXSR_1
> +					    TRAS_1
> +					    TRC_6
> +					    TRP_2
> +					    TWR_1
> +					    TRCD_1>;
> +		st,sdram-refcount = <1539>;
> +	};
> +};
> +
> +&pinctrl {
> +	fmc_pins: fmc@0 {
> +		pins {
> +			pinmux = <STM32_PINMUX('D', 0, AF12)>,
> +				 <STM32_PINMUX('D', 1, AF12)>,
> +				 <STM32_PINMUX('D', 8, AF12)>,
> +				 <STM32_PINMUX('D', 9, AF12)>,
> +				 <STM32_PINMUX('D',10, AF12)>,
> +				 <STM32_PINMUX('D',14, AF12)>,
> +				 <STM32_PINMUX('D',15, AF12)>,
> +
> +				 <STM32_PINMUX('E', 0, AF12)>,
> +				 <STM32_PINMUX('E', 1, AF12)>,
> +				 <STM32_PINMUX('E', 7, AF12)>,
> +				 <STM32_PINMUX('E', 8, AF12)>,
> +				 <STM32_PINMUX('E', 9, AF12)>,
> +				 <STM32_PINMUX('E',10, AF12)>,
> +				 <STM32_PINMUX('E',11, AF12)>,
> +				 <STM32_PINMUX('E',12, AF12)>,
> +				 <STM32_PINMUX('E',13, AF12)>,
> +				 <STM32_PINMUX('E',14, AF12)>,
> +				 <STM32_PINMUX('E',15, AF12)>,
> +
> +				 <STM32_PINMUX('F', 0, AF12)>,
> +				 <STM32_PINMUX('F', 1, AF12)>,
> +				 <STM32_PINMUX('F', 2, AF12)>,
> +				 <STM32_PINMUX('F', 3, AF12)>,
> +				 <STM32_PINMUX('F', 4, AF12)>,
> +				 <STM32_PINMUX('F', 5, AF12)>,
> +				 <STM32_PINMUX('F',11, AF12)>,
> +				 <STM32_PINMUX('F',12, AF12)>,
> +				 <STM32_PINMUX('F',13, AF12)>,
> +				 <STM32_PINMUX('F',14, AF12)>,
> +				 <STM32_PINMUX('F',15, AF12)>,
> +
> +				 <STM32_PINMUX('G', 0, AF12)>,
> +				 <STM32_PINMUX('G', 1, AF12)>,
> +				 <STM32_PINMUX('G', 2, AF12)>,
> +				 <STM32_PINMUX('G', 4, AF12)>,
> +				 <STM32_PINMUX('G', 5, AF12)>,
> +				 <STM32_PINMUX('G', 8, AF12)>,
> +				 <STM32_PINMUX('G',15, AF12)>,
> +
> +				 <STM32_PINMUX('H', 5, AF12)>,
> +				 <STM32_PINMUX('H', 6, AF12)>,
> +				 <STM32_PINMUX('H', 7, AF12)>,
> +				 <STM32_PINMUX('H', 8, AF12)>,
> +				 <STM32_PINMUX('H', 9, AF12)>,
> +				 <STM32_PINMUX('H',10, AF12)>,
> +				 <STM32_PINMUX('H',11, AF12)>,
> +				 <STM32_PINMUX('H',12, AF12)>,
> +				 <STM32_PINMUX('H',13, AF12)>,
> +				 <STM32_PINMUX('H',14, AF12)>,
> +				 <STM32_PINMUX('H',15, AF12)>,
> +
> +				 <STM32_PINMUX('I', 0, AF12)>,
> +				 <STM32_PINMUX('I', 1, AF12)>,
> +				 <STM32_PINMUX('I', 2, AF12)>,
> +				 <STM32_PINMUX('I', 3, AF12)>,
> +				 <STM32_PINMUX('I', 4, AF12)>,
> +				 <STM32_PINMUX('I', 5, AF12)>,
> +				 <STM32_PINMUX('I', 6, AF12)>,
> +				 <STM32_PINMUX('I', 7, AF12)>,
> +				 <STM32_PINMUX('I', 9, AF12)>,
> +				 <STM32_PINMUX('I',10, AF12)>;
> +
> +			slew-rate = <3>;
> +		};
> +	};
> +};
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
