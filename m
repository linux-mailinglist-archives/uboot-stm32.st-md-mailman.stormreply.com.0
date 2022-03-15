Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 868B84D95B4
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Mar 2022 08:54:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48307C60467;
	Tue, 15 Mar 2022 07:54:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B953C60464
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Mar 2022 07:54:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22F4JeK9027408;
 Tue, 15 Mar 2022 08:54:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=+GEDu+suKyo8sWDyjMdahIkh7kGsp15yEjBCi+2re1s=;
 b=Gxql8GBsOLgOAaSzCUSViP9Wzwk3Y7Jdx4JanbYz3wfUIrXhpZMocegThuWc6qMjfJgr
 6HI/V2IagJkGpTK7Uz/YmtYHk39PJjyyh2maCzrWOWzK+QcN+l4Jp2icfGXvw4bc4oRx
 yhQvlsAqqGP7TKBCHhwYg2RyWz3BdskiHPnyBUx55wf7QtcZP6103HxApbm6epwNu8F+
 7GziVw/fiCeWXWfAc1IBNb/APfk0PupM8GK9qhMOMG5ekvSAiHSOUA7RV2C9BQks8Gm6
 Bw1q5dVcTcuhFxL0s/7JXdfhMguB9cKM6EL5leineAW6SCMNcuISBr3BzkoMI6FdogXl BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3etj2ah9pj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 08:54:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 890E410002A;
 Tue, 15 Mar 2022 08:54:46 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 80646212313;
 Tue, 15 Mar 2022 08:54:46 +0100 (CET)
Received: from [10.201.21.201] (10.75.127.47) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 15 Mar
 2022 08:54:46 +0100
Message-ID: <aba5a42b-eacb-7a8d-3c18-0a66a965ec5e@foss.st.com>
Date: Tue, 15 Mar 2022 08:54:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220131160751.1.I886802ece25fd6731914c9467a57628799d72f33@changeid>
 <1f72cc27-3209-2246-f3cb-62d786b86dd5@foss.st.com>
In-Reply-To: <1f72cc27-3209-2246-f3cb-62d786b86dd5@foss.st.com>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_14,2022-03-14_02,2022-02-23_01
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

On 2/23/22 10:05, Patrice CHOTARD wrote:
> Hi Patrick
> 
> On 1/31/22 16:07, Patrick Delaunay wrote:
>> Device tree alignment with Linux kernel v5.17-rc1
>> - ARM: dts: stm32: add pull-up to USART3 and UART7 RX pins
>>   on STM32MP15 DKx boards
>> - ARM: dts: stm32: clean uart4_idle_pins_a node for stm32mp15
>> - ARM: dts: stm32: tune the HS USB PHYs on stm32mp15xx-dkx
>> - ARM: dts: stm32: tune the HS USB PHYs on stm32mp157c-ev1
>> - ARM: dts: stm32: fix stusb1600 pinctrl used on stm32mp157c-dk
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  arch/arm/dts/stm32mp15-pinctrl.dtsi | 32 ++++++++++++++---------------
>>  arch/arm/dts/stm32mp157c-ev1.dts    | 22 ++++++++++++++++++++
>>  arch/arm/dts/stm32mp15xx-dkx.dtsi   | 16 +++++++++++++++
>>  3 files changed, 54 insertions(+), 16 deletions(-)
>>
>> diff --git a/arch/arm/dts/stm32mp15-pinctrl.dtsi b/arch/arm/dts/stm32mp15-pinctrl.dtsi
>> index d3553e0f01..6161f5906e 100644
>> --- a/arch/arm/dts/stm32mp15-pinctrl.dtsi
>> +++ b/arch/arm/dts/stm32mp15-pinctrl.dtsi
>> @@ -1718,7 +1718,7 @@
>>  
>>  	stusb1600_pins_a: stusb1600-0 {
>>  		pins {
>> -			pinmux = <STM32_PINMUX('I', 11, ANALOG)>;
>> +			pinmux = <STM32_PINMUX('I', 11, GPIO)>;
>>  			bias-pull-up;
>>  		};
>>  	};
>> @@ -1737,20 +1737,20 @@
>>  	};
>>  
>>  	uart4_idle_pins_a: uart4-idle-0 {
>> -		   pins1 {
>> -			 pinmux = <STM32_PINMUX('G', 11, ANALOG)>; /* UART4_TX */
>> -		   };
>> -		   pins2 {
>> -			 pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
>> -			 bias-disable;
>> -		   };
>> +		pins1 {
>> +			pinmux = <STM32_PINMUX('G', 11, ANALOG)>; /* UART4_TX */
>> +		};
>> +		pins2 {
>> +			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
>> +			bias-disable;
>> +		};
>>  	};
>>  
>>  	uart4_sleep_pins_a: uart4-sleep-0 {
>> -		   pins {
>> +		pins {
>>  			pinmux = <STM32_PINMUX('G', 11, ANALOG)>, /* UART4_TX */
>>  				 <STM32_PINMUX('B', 2, ANALOG)>; /* UART4_RX */
>> -		    };
>> +		};
>>  	};
>>  
>>  	uart4_pins_b: uart4-1 {
>> @@ -1816,7 +1816,7 @@
>>  		};
>>  		pins2 {
>>  			pinmux = <STM32_PINMUX('E', 7, AF7)>; /* UART7_RX */
>> -			bias-disable;
>> +			bias-pull-up;
>>  		};
>>  	};
>>  
>> @@ -1826,7 +1826,7 @@
>>  		};
>>  		pins2 {
>>  			pinmux = <STM32_PINMUX('E', 7, AF7)>; /* UART7_RX */
>> -			bias-disable;
>> +			bias-pull-up;
>>  		};
>>  	};
>>  
>> @@ -1971,7 +1971,7 @@
>>  		pins2 {
>>  			pinmux = <STM32_PINMUX('B', 12, AF8)>, /* USART3_RX */
>>  				 <STM32_PINMUX('I', 10, AF8)>; /* USART3_CTS_NSS */
>> -			bias-disable;
>> +			bias-pull-up;
>>  		};
>>  	};
>>  
>> @@ -1988,7 +1988,7 @@
>>  		};
>>  		pins3 {
>>  			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
>> -			bias-disable;
>> +			bias-pull-up;
>>  		};
>>  	};
>>  
>> @@ -2012,7 +2012,7 @@
>>  		pins2 {
>>  			pinmux = <STM32_PINMUX('B', 12, AF8)>, /* USART3_RX */
>>  				 <STM32_PINMUX('B', 13, AF7)>; /* USART3_CTS_NSS */
>> -			bias-disable;
>> +			bias-pull-up;
>>  		};
>>  	};
>>  
>> @@ -2029,7 +2029,7 @@
>>  		};
>>  		pins3 {
>>  			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
>> -			bias-disable;
>> +			bias-pull-up;
>>  		};
>>  	};
>>  
>> diff --git a/arch/arm/dts/stm32mp157c-ev1.dts b/arch/arm/dts/stm32mp157c-ev1.dts
>> index 5c5b1ddf7b..e222d2d2cb 100644
>> --- a/arch/arm/dts/stm32mp157c-ev1.dts
>> +++ b/arch/arm/dts/stm32mp157c-ev1.dts
>> @@ -375,3 +375,25 @@
>>  &usbphyc {
>>  	status = "okay";
>>  };
>> +
>> +&usbphyc_port0 {
>> +	st,tune-hs-dc-level = <2>;
>> +	st,enable-fs-rftime-tuning;
>> +	st,enable-hs-rftime-reduction;
>> +	st,trim-hs-current = <15>;
>> +	st,trim-hs-impedance = <1>;
>> +	st,tune-squelch-level = <3>;
>> +	st,tune-hs-rx-offset = <2>;
>> +	st,no-lsfs-sc;
>> +};
>> +
>> +&usbphyc_port1 {
>> +	st,tune-hs-dc-level = <2>;
>> +	st,enable-fs-rftime-tuning;
>> +	st,enable-hs-rftime-reduction;
>> +	st,trim-hs-current = <15>;
>> +	st,trim-hs-impedance = <1>;
>> +	st,tune-squelch-level = <3>;
>> +	st,tune-hs-rx-offset = <2>;
>> +	st,no-lsfs-sc;
>> +};
>> diff --git a/arch/arm/dts/stm32mp15xx-dkx.dtsi b/arch/arm/dts/stm32mp15xx-dkx.dtsi
>> index 5502eec94b..f8130bf445 100644
>> --- a/arch/arm/dts/stm32mp15xx-dkx.dtsi
>> +++ b/arch/arm/dts/stm32mp15xx-dkx.dtsi
>> @@ -702,10 +702,26 @@
>>  
>>  &usbphyc_port0 {
>>  	phy-supply = <&vdd_usb>;
>> +	st,tune-hs-dc-level = <2>;
>> +	st,enable-fs-rftime-tuning;
>> +	st,enable-hs-rftime-reduction;
>> +	st,trim-hs-current = <15>;
>> +	st,trim-hs-impedance = <1>;
>> +	st,tune-squelch-level = <3>;
>> +	st,tune-hs-rx-offset = <2>;
>> +	st,no-lsfs-sc;
>>  };
>>  
>>  &usbphyc_port1 {
>>  	phy-supply = <&vdd_usb>;
>> +	st,tune-hs-dc-level = <2>;
>> +	st,enable-fs-rftime-tuning;
>> +	st,enable-hs-rftime-reduction;
>> +	st,trim-hs-current = <15>;
>> +	st,trim-hs-impedance = <1>;
>> +	st,tune-squelch-level = <3>;
>> +	st,tune-hs-rx-offset = <2>;
>> +	st,no-lsfs-sc;
>>  };
>>  
>>  &vrefbuf {
> 
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Applied to u-boot-stm32

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
