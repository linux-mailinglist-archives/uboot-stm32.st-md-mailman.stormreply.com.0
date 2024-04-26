Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B708B3699
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Apr 2024 13:40:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65B22C71292;
	Fri, 26 Apr 2024 11:40:34 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7212EC71291
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 11:40:33 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 61CBE8903D;
 Fri, 26 Apr 2024 13:40:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1714131632;
 bh=byDZNyoB/GdO/R1UThf9Je5FtYXjvibE7m00zoSM7jY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jNacN8RMSI2HuNCjqWvk6oFau/1lsgIKeT8AcRyrP7plEIzWSneU4yiein5bi/bSn
 ow/YY1brlskFgULjs1Ivh2Imie6w77YQuuDwAZc9sTlBoB2vOKny6rdmLQiVwUU/Vl
 6jVGHP1Wudu4FPJox2kvJAII9yZt8sKLT1egzS8aFt0F2IuWWA2lfulh1ADIfQMsWh
 Ns3K31pIe2pf+DtLx3Sn7P3ITFUTDxXjOvuhDk22EkX8JmUUTfdJhFZx3MjI31KUsI
 NoMqcXlz+zbUqdpgpBEj2FymP9d5gV4v4DeW0568xb7qatln95MjPzRB1aZFvneCAm
 2SlZWpR9DgIAA==
Message-ID: <4f3e2fc7-5052-41cd-be7b-ffdb5f75f308@denx.de>
Date: Fri, 26 Apr 2024 13:24:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20240421231849.194648-1-marex@denx.de>
 <d0f4afdd-752d-4157-a6c0-2132a2fc9696@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <d0f4afdd-752d-4157-a6c0-2132a2fc9696@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 01/19] ARM: dts: stm32: Add alternate
 pinmux for MP13 ADC pins
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

On 4/26/24 9:49 AM, Patrice CHOTARD wrote:
> 
> 
> On 4/22/24 01:16, Marek Vasut wrote:
>> Add another mux option for ADC pins, this is used on
>> DH electronics STM32MP13xx DHCOR DHSBC board.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: u-boot@dh-electronics.com
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>   arch/arm/dts/stm32mp13-pinctrl.dtsi | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm/dts/stm32mp13-pinctrl.dtsi b/arch/arm/dts/stm32mp13-pinctrl.dtsi
>> index 27e0c382678..03ded415390 100644
>> --- a/arch/arm/dts/stm32mp13-pinctrl.dtsi
>> +++ b/arch/arm/dts/stm32mp13-pinctrl.dtsi
>> @@ -6,6 +6,12 @@
>>   #include <dt-bindings/pinctrl/stm32-pinfunc.h>
>>   
>>   &pinctrl {
>> +	adc1_pins_a: adc1-pins-0 {
>> +		pins {
>> +			pinmux = <STM32_PINMUX('A', 3, ANALOG)>; /* ADC1 in12 */
>> +		};
>> +	};
>> +
>>   	adc1_usb_cc_pins_a: adc1-usb-cc-pins-0 {
>>   		pins {
>>   			pinmux = <STM32_PINMUX('F', 12, ANALOG)>, /* ADC1 in6 */
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

I'll be sending a V2 with all the pinmux patches squashed into single patch.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
