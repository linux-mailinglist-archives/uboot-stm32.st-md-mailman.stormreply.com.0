Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FE74C0ECF
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Feb 2022 10:05:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFCBAC5C842;
	Wed, 23 Feb 2022 09:05:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1F37C5A4FD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Feb 2022 09:05:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21N7ivph022422;
 Wed, 23 Feb 2022 10:05:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=jNDVTQO507tNmzp6+6VlMUYOv/53gA2Re5p+zDVW87U=;
 b=QA6iapNV01SW7jDA2k7LEcKX+whC8rX7eAJhqx7OVP7CWbKOp8+BW5LuZKVa/pIVUoJl
 aS5bHFdJWyGr13ncwt+GAXSYtMkMhEl4N3IjLvrzqJ4SvdpZxViJBaZuLjIaAdni5II5
 WHAKyZWPU5IyHu2PMBbd8W3y5ZYv5OSVuXjJ+h77/fY7pNNRyziAwTicNfdLvpxS+clb
 GRei2rODg4h52z7982uN7wsvHuSGMkvr64iM0Kv+DlXFaAmY4l9fHVt0gqJSspKC4L9E
 IunfLQbJ8s/bVMa4Ze2ZMfPm6gj7PhMe5G7s8RkO1pnSHzkB9BLIfxX4swLRE8OnZ9ae wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3edgte0gvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 10:05:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6E05C10002A;
 Wed, 23 Feb 2022 10:05:05 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5CB49217B76;
 Wed, 23 Feb 2022 10:05:05 +0100 (CET)
Received: from [10.201.21.201] (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 23 Feb
 2022 10:05:04 +0100
Message-ID: <1f72cc27-3209-2246-f3cb-62d786b86dd5@foss.st.com>
Date: Wed, 23 Feb 2022 10:05:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220131160751.1.I886802ece25fd6731914c9467a57628799d72f33@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220131160751.1.I886802ece25fd6731914c9467a57628799d72f33@changeid>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-23_03,2022-02-21_02,2021-12-02_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] arm: dts: stm32mp15: alignment with v5.17
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

On 1/31/22 16:07, Patrick Delaunay wrote:
> Device tree alignment with Linux kernel v5.17-rc1
> - ARM: dts: stm32: add pull-up to USART3 and UART7 RX pins
>   on STM32MP15 DKx boards
> - ARM: dts: stm32: clean uart4_idle_pins_a node for stm32mp15
> - ARM: dts: stm32: tune the HS USB PHYs on stm32mp15xx-dkx
> - ARM: dts: stm32: tune the HS USB PHYs on stm32mp157c-ev1
> - ARM: dts: stm32: fix stusb1600 pinctrl used on stm32mp157c-dk
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp15-pinctrl.dtsi | 32 ++++++++++++++---------------
>  arch/arm/dts/stm32mp157c-ev1.dts    | 22 ++++++++++++++++++++
>  arch/arm/dts/stm32mp15xx-dkx.dtsi   | 16 +++++++++++++++
>  3 files changed, 54 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32mp15-pinctrl.dtsi b/arch/arm/dts/stm32mp15-pinctrl.dtsi
> index d3553e0f01..6161f5906e 100644
> --- a/arch/arm/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/dts/stm32mp15-pinctrl.dtsi
> @@ -1718,7 +1718,7 @@
>  
>  	stusb1600_pins_a: stusb1600-0 {
>  		pins {
> -			pinmux = <STM32_PINMUX('I', 11, ANALOG)>;
> +			pinmux = <STM32_PINMUX('I', 11, GPIO)>;
>  			bias-pull-up;
>  		};
>  	};
> @@ -1737,20 +1737,20 @@
>  	};
>  
>  	uart4_idle_pins_a: uart4-idle-0 {
> -		   pins1 {
> -			 pinmux = <STM32_PINMUX('G', 11, ANALOG)>; /* UART4_TX */
> -		   };
> -		   pins2 {
> -			 pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
> -			 bias-disable;
> -		   };
> +		pins1 {
> +			pinmux = <STM32_PINMUX('G', 11, ANALOG)>; /* UART4_TX */
> +		};
> +		pins2 {
> +			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
> +			bias-disable;
> +		};
>  	};
>  
>  	uart4_sleep_pins_a: uart4-sleep-0 {
> -		   pins {
> +		pins {
>  			pinmux = <STM32_PINMUX('G', 11, ANALOG)>, /* UART4_TX */
>  				 <STM32_PINMUX('B', 2, ANALOG)>; /* UART4_RX */
> -		    };
> +		};
>  	};
>  
>  	uart4_pins_b: uart4-1 {
> @@ -1816,7 +1816,7 @@
>  		};
>  		pins2 {
>  			pinmux = <STM32_PINMUX('E', 7, AF7)>; /* UART7_RX */
> -			bias-disable;
> +			bias-pull-up;
>  		};
>  	};
>  
> @@ -1826,7 +1826,7 @@
>  		};
>  		pins2 {
>  			pinmux = <STM32_PINMUX('E', 7, AF7)>; /* UART7_RX */
> -			bias-disable;
> +			bias-pull-up;
>  		};
>  	};
>  
> @@ -1971,7 +1971,7 @@
>  		pins2 {
>  			pinmux = <STM32_PINMUX('B', 12, AF8)>, /* USART3_RX */
>  				 <STM32_PINMUX('I', 10, AF8)>; /* USART3_CTS_NSS */
> -			bias-disable;
> +			bias-pull-up;
>  		};
>  	};
>  
> @@ -1988,7 +1988,7 @@
>  		};
>  		pins3 {
>  			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
> -			bias-disable;
> +			bias-pull-up;
>  		};
>  	};
>  
> @@ -2012,7 +2012,7 @@
>  		pins2 {
>  			pinmux = <STM32_PINMUX('B', 12, AF8)>, /* USART3_RX */
>  				 <STM32_PINMUX('B', 13, AF7)>; /* USART3_CTS_NSS */
> -			bias-disable;
> +			bias-pull-up;
>  		};
>  	};
>  
> @@ -2029,7 +2029,7 @@
>  		};
>  		pins3 {
>  			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
> -			bias-disable;
> +			bias-pull-up;
>  		};
>  	};
>  
> diff --git a/arch/arm/dts/stm32mp157c-ev1.dts b/arch/arm/dts/stm32mp157c-ev1.dts
> index 5c5b1ddf7b..e222d2d2cb 100644
> --- a/arch/arm/dts/stm32mp157c-ev1.dts
> +++ b/arch/arm/dts/stm32mp157c-ev1.dts
> @@ -375,3 +375,25 @@
>  &usbphyc {
>  	status = "okay";
>  };
> +
> +&usbphyc_port0 {
> +	st,tune-hs-dc-level = <2>;
> +	st,enable-fs-rftime-tuning;
> +	st,enable-hs-rftime-reduction;
> +	st,trim-hs-current = <15>;
> +	st,trim-hs-impedance = <1>;
> +	st,tune-squelch-level = <3>;
> +	st,tune-hs-rx-offset = <2>;
> +	st,no-lsfs-sc;
> +};
> +
> +&usbphyc_port1 {
> +	st,tune-hs-dc-level = <2>;
> +	st,enable-fs-rftime-tuning;
> +	st,enable-hs-rftime-reduction;
> +	st,trim-hs-current = <15>;
> +	st,trim-hs-impedance = <1>;
> +	st,tune-squelch-level = <3>;
> +	st,tune-hs-rx-offset = <2>;
> +	st,no-lsfs-sc;
> +};
> diff --git a/arch/arm/dts/stm32mp15xx-dkx.dtsi b/arch/arm/dts/stm32mp15xx-dkx.dtsi
> index 5502eec94b..f8130bf445 100644
> --- a/arch/arm/dts/stm32mp15xx-dkx.dtsi
> +++ b/arch/arm/dts/stm32mp15xx-dkx.dtsi
> @@ -702,10 +702,26 @@
>  
>  &usbphyc_port0 {
>  	phy-supply = <&vdd_usb>;
> +	st,tune-hs-dc-level = <2>;
> +	st,enable-fs-rftime-tuning;
> +	st,enable-hs-rftime-reduction;
> +	st,trim-hs-current = <15>;
> +	st,trim-hs-impedance = <1>;
> +	st,tune-squelch-level = <3>;
> +	st,tune-hs-rx-offset = <2>;
> +	st,no-lsfs-sc;
>  };
>  
>  &usbphyc_port1 {
>  	phy-supply = <&vdd_usb>;
> +	st,tune-hs-dc-level = <2>;
> +	st,enable-fs-rftime-tuning;
> +	st,enable-hs-rftime-reduction;
> +	st,trim-hs-current = <15>;
> +	st,trim-hs-impedance = <1>;
> +	st,tune-squelch-level = <3>;
> +	st,tune-hs-rx-offset = <2>;
> +	st,no-lsfs-sc;
>  };
>  
>  &vrefbuf {


Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
