Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BA04D96C1
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Mar 2022 09:51:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52963C60467;
	Tue, 15 Mar 2022 08:51:50 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06E1BC5F1F1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Mar 2022 08:51:48 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E49C180F68;
 Tue, 15 Mar 2022 09:51:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1647334308;
 bh=Sosb5kGU7SEccnCXSy264o119oqZdtCLRRKTT02rn7I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rMzzhSFBOTmsMRQPesprZWkxv0B+dzdtstjrXHfd9YjEjO/4W7n1b5xlCt5nig7Af
 KczJwHiwL3hk9AwnN5JlBUxecdRKswH2MNhN449YqNcpHRRG5a3x7ucSbQhb9eqlkZ
 rmsbwjhN0EUg8LMZ42kQQnEIOivp7UBa5xUmbCl69jaL3eX1fXMirOjMKFZLybSom/
 Dp9fj0sPQV5P7+OchohIT1t015k6kb5XiLlwqjyLoj+Ebjcr9GvX+UhHxv9Q5gF+En
 KWoLnTCm/94HPqpE9eFIUNcL84byFoYBG9zAWfQY6G11WXYJycrwxZjjF3uOkmbHr3
 DiI7mokDl2EOg==
Message-ID: <325ff321-b68b-26ee-c980-000d2450cbf5@denx.de>
Date: Tue, 15 Mar 2022 09:49:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220131160751.1.I886802ece25fd6731914c9467a57628799d72f33@changeid>
 <1f72cc27-3209-2246-f3cb-62d786b86dd5@foss.st.com>
 <aba5a42b-eacb-7a8d-3c18-0a66a965ec5e@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <aba5a42b-eacb-7a8d-3c18-0a66a965ec5e@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 3/15/22 08:54, Patrice CHOTARD wrote:
> Hi Patrick
> 
> On 2/23/22 10:05, Patrice CHOTARD wrote:
>> Hi Patrick
>>
>> On 1/31/22 16:07, Patrick Delaunay wrote:
>>> Device tree alignment with Linux kernel v5.17-rc1
>>> - ARM: dts: stm32: add pull-up to USART3 and UART7 RX pins
>>>    on STM32MP15 DKx boards
>>> - ARM: dts: stm32: clean uart4_idle_pins_a node for stm32mp15
>>> - ARM: dts: stm32: tune the HS USB PHYs on stm32mp15xx-dkx
>>> - ARM: dts: stm32: tune the HS USB PHYs on stm32mp157c-ev1
>>> - ARM: dts: stm32: fix stusb1600 pinctrl used on stm32mp157c-dk
>>>
>>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>>> ---
>>>
>>>   arch/arm/dts/stm32mp15-pinctrl.dtsi | 32 ++++++++++++++---------------
>>>   arch/arm/dts/stm32mp157c-ev1.dts    | 22 ++++++++++++++++++++
>>>   arch/arm/dts/stm32mp15xx-dkx.dtsi   | 16 +++++++++++++++
>>>   3 files changed, 54 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/arch/arm/dts/stm32mp15-pinctrl.dtsi b/arch/arm/dts/stm32mp15-pinctrl.dtsi
>>> index d3553e0f01..6161f5906e 100644
>>> --- a/arch/arm/dts/stm32mp15-pinctrl.dtsi
>>> +++ b/arch/arm/dts/stm32mp15-pinctrl.dtsi
>>> @@ -1718,7 +1718,7 @@
>>>   
>>>   	stusb1600_pins_a: stusb1600-0 {
>>>   		pins {
>>> -			pinmux = <STM32_PINMUX('I', 11, ANALOG)>;
>>> +			pinmux = <STM32_PINMUX('I', 11, GPIO)>;
>>>   			bias-pull-up;
>>>   		};
>>>   	};
>>> @@ -1737,20 +1737,20 @@
>>>   	};
>>>   
>>>   	uart4_idle_pins_a: uart4-idle-0 {
>>> -		   pins1 {
>>> -			 pinmux = <STM32_PINMUX('G', 11, ANALOG)>; /* UART4_TX */
>>> -		   };
>>> -		   pins2 {
>>> -			 pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
>>> -			 bias-disable;
>>> -		   };
>>> +		pins1 {
>>> +			pinmux = <STM32_PINMUX('G', 11, ANALOG)>; /* UART4_TX */
>>> +		};
>>> +		pins2 {
>>> +			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
>>> +			bias-disable;
>>> +		};
>>>   	};
>>>   
>>>   	uart4_sleep_pins_a: uart4-sleep-0 {
>>> -		   pins {
>>> +		pins {
>>>   			pinmux = <STM32_PINMUX('G', 11, ANALOG)>, /* UART4_TX */
>>>   				 <STM32_PINMUX('B', 2, ANALOG)>; /* UART4_RX */
>>> -		    };
>>> +		};
>>>   	};
>>>   
>>>   	uart4_pins_b: uart4-1 {
>>> @@ -1816,7 +1816,7 @@
>>>   		};
>>>   		pins2 {
>>>   			pinmux = <STM32_PINMUX('E', 7, AF7)>; /* UART7_RX */
>>> -			bias-disable;
>>> +			bias-pull-up;
>>>   		};
>>>   	};
>>>   
>>> @@ -1826,7 +1826,7 @@
>>>   		};
>>>   		pins2 {
>>>   			pinmux = <STM32_PINMUX('E', 7, AF7)>; /* UART7_RX */
>>> -			bias-disable;
>>> +			bias-pull-up;
>>>   		};
>>>   	};
>>>   
>>> @@ -1971,7 +1971,7 @@
>>>   		pins2 {
>>>   			pinmux = <STM32_PINMUX('B', 12, AF8)>, /* USART3_RX */
>>>   				 <STM32_PINMUX('I', 10, AF8)>; /* USART3_CTS_NSS */
>>> -			bias-disable;
>>> +			bias-pull-up;
>>>   		};
>>>   	};
>>>   
>>> @@ -1988,7 +1988,7 @@
>>>   		};
>>>   		pins3 {
>>>   			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
>>> -			bias-disable;
>>> +			bias-pull-up;
>>>   		};
>>>   	};
>>>   
>>> @@ -2012,7 +2012,7 @@
>>>   		pins2 {
>>>   			pinmux = <STM32_PINMUX('B', 12, AF8)>, /* USART3_RX */
>>>   				 <STM32_PINMUX('B', 13, AF7)>; /* USART3_CTS_NSS */
>>> -			bias-disable;
>>> +			bias-pull-up;
>>>   		};
>>>   	};
>>>   
>>> @@ -2029,7 +2029,7 @@
>>>   		};
>>>   		pins3 {
>>>   			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
>>> -			bias-disable;
>>> +			bias-pull-up;
>>>   		};
>>>   	};
>>>   
>>> diff --git a/arch/arm/dts/stm32mp157c-ev1.dts b/arch/arm/dts/stm32mp157c-ev1.dts
>>> index 5c5b1ddf7b..e222d2d2cb 100644
>>> --- a/arch/arm/dts/stm32mp157c-ev1.dts
>>> +++ b/arch/arm/dts/stm32mp157c-ev1.dts
>>> @@ -375,3 +375,25 @@
>>>   &usbphyc {
>>>   	status = "okay";
>>>   };
>>> +
>>> +&usbphyc_port0 {
>>> +	st,tune-hs-dc-level = <2>;
>>> +	st,enable-fs-rftime-tuning;
>>> +	st,enable-hs-rftime-reduction;
>>> +	st,trim-hs-current = <15>;
>>> +	st,trim-hs-impedance = <1>;
>>> +	st,tune-squelch-level = <3>;
>>> +	st,tune-hs-rx-offset = <2>;
>>> +	st,no-lsfs-sc;
>>> +};
>>> +
>>> +&usbphyc_port1 {
>>> +	st,tune-hs-dc-level = <2>;
>>> +	st,enable-fs-rftime-tuning;
>>> +	st,enable-hs-rftime-reduction;
>>> +	st,trim-hs-current = <15>;
>>> +	st,trim-hs-impedance = <1>;
>>> +	st,tune-squelch-level = <3>;
>>> +	st,tune-hs-rx-offset = <2>;
>>> +	st,no-lsfs-sc;
>>> +};
>>> diff --git a/arch/arm/dts/stm32mp15xx-dkx.dtsi b/arch/arm/dts/stm32mp15xx-dkx.dtsi
>>> index 5502eec94b..f8130bf445 100644
>>> --- a/arch/arm/dts/stm32mp15xx-dkx.dtsi
>>> +++ b/arch/arm/dts/stm32mp15xx-dkx.dtsi
>>> @@ -702,10 +702,26 @@
>>>   
>>>   &usbphyc_port0 {
>>>   	phy-supply = <&vdd_usb>;
>>> +	st,tune-hs-dc-level = <2>;
>>> +	st,enable-fs-rftime-tuning;
>>> +	st,enable-hs-rftime-reduction;
>>> +	st,trim-hs-current = <15>;
>>> +	st,trim-hs-impedance = <1>;
>>> +	st,tune-squelch-level = <3>;
>>> +	st,tune-hs-rx-offset = <2>;
>>> +	st,no-lsfs-sc;
>>>   };
>>>   
>>>   &usbphyc_port1 {
>>>   	phy-supply = <&vdd_usb>;
>>> +	st,tune-hs-dc-level = <2>;
>>> +	st,enable-fs-rftime-tuning;
>>> +	st,enable-hs-rftime-reduction;
>>> +	st,trim-hs-current = <15>;
>>> +	st,trim-hs-impedance = <1>;
>>> +	st,tune-squelch-level = <3>;
>>> +	st,tune-hs-rx-offset = <2>;
>>> +	st,no-lsfs-sc;
>>>   };
>>>   
>>>   &vrefbuf {
>>
>>
>> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> Thanks
>> Patrice
>> _______________________________________________
>> Uboot-stm32 mailing list
>> Uboot-stm32@st-md-mailman.stormreply.com
>> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
> 
> Applied to u-boot-stm32

This is for next, right ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
