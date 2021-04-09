Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E05A03599B9
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 11:47:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CFCDC56639;
	Fri,  9 Apr 2021 09:47:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DEB2C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 09:47:03 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1399fXQi031313; Fri, 9 Apr 2021 11:46:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=+rWvpAbC/KlbE/b1hbqcTczOPwG0H4adZdZxiMOzRdE=;
 b=uAkOaU1fYut9C14WGVzNwTntSBGy9K2tZq2rGvpsbsqDkKmMNpK1523bOAZAoz1bntAZ
 LxnE7nKyUCaT3TJhH7AJVVwnkPMmxKDG6xD8OMJ93LAux6PA3MOmZwTHnNF99mIFRqq9
 aTSNTuUGmToIMYtauFIp4GQ4L0ABhKTWPQJJA/Yc//SGY8AFXn+RbuVGxyez8YWuducY
 idKRpg/LoZ3oxldhWETmnEnwL5WhH6zEyVbUYdV0TW9DYZJxK1r5EFZ/uoyYKl6v9oBD
 DPu1ru3ITm/gJ3iBXpHiBhn/X9PRlBO6OTK2SbgbI2ijDuV6WXiKWIxQsOSZ0oI9x0Dw bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37tke8gg3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 11:46:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BF57C10002A;
 Fri,  9 Apr 2021 11:46:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8064B228456;
 Fri,  9 Apr 2021 11:46:41 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Apr
 2021 11:46:40 +0200
To: <dillon.minfei@gmail.com>, <kever.yang@rock-chips.com>,
 <andre.przywara@arm.com>, <priyanka.jain@nxp.com>,
 <jagan@amarulasolutions.com>, <narmstrong@baylibre.com>,
 <marex@denx.de>, <aford173@gmail.com>, <ioana.ciornei@nxp.com>,
 <josip.kelecic@sartura.hr>, <festevam@gmail.com>, <hs@denx.de>,
 <heiko.stuebner@theobroma-systems.com>, <u-boot@lists.denx.de>,
 <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <sjg@chromium.org>
References: <1617953326-3110-1-git-send-email-dillon.minfei@gmail.com>
 <1617953326-3110-2-git-send-email-dillon.minfei@gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <d1abb1e7-be19-d8bc-d922-46494d96f8d1@foss.st.com>
Date: Fri, 9 Apr 2021 11:46:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1617953326-3110-2-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_05:2021-04-09,
 2021-04-09 signatures=0
Subject: Re: [Uboot-stm32] [PATCH v5 1/7] ARM: dts: stm32: split sdram pin &
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

On 4/9/21 9:28 AM, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> As different boards has their own sdram hw connection, mount different
> sdram modules, so move sdram timing parameter and pin configuration
> to their board device tree.
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> v5: no changes
> 
>  arch/arm/dts/stm32h7-u-boot.dtsi          | 100 ++----------------------------
>  arch/arm/dts/stm32h743i-disco-u-boot.dtsi |  98 +++++++++++++++++++++++++++++
>  arch/arm/dts/stm32h743i-eval-u-boot.dtsi  |  98 +++++++++++++++++++++++++++++
>  3 files changed, 201 insertions(+), 95 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32h7-u-boot.dtsi b/arch/arm/dts/stm32h7-u-boot.dtsi
> index 54dd406..84dc765 100644
> --- a/arch/arm/dts/stm32h7-u-boot.dtsi
> +++ b/arch/arm/dts/stm32h7-u-boot.dtsi
> @@ -20,6 +20,7 @@
>  		gpio9 = &gpioj;
>  		gpio10 = &gpiok;
>  		mmc0 = &sdmmc1;
> +		pinctrl0 = &pinctrl;
>  	};
>  
>  	soc {
> @@ -36,30 +37,6 @@
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
> @@ -136,77 +113,6 @@
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
> @@ -222,3 +128,7 @@
>  &timer5 {
>  	u-boot,dm-pre-reloc;
>  };
> +
> +&pinctrl {
> +	u-boot,dm-pre-reloc;
> +};
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

Applied to u-boot-stm/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
