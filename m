Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FFF230EF3
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 18:11:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02D62C36B25
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 16:11:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 800CCC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 16:11:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SG7HNP031562; Tue, 28 Jul 2020 18:11:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=TOPPLhiaiMJSDnZo1sv1tAkhVRWml7wdoziPnaU4KHw=;
 b=mZn2/VEUEGsXnMpNGU3fIyUkAK2GSdqUmp3hAnvPONTX9K+yLPg+S1Y9ktYVfbLGn4Wr
 11jYuIXEXLqfQIT8jrW9i7AQISt7sorPOlc1Ti0urMwL2mCrCV6Br07+Z9clH9J0y/6a
 MUmV7BMOe+dd7JkQ98oAwZGaxFMSO8ILC+yaI0Ck/cm3PwGdbMrgML0r0V7jHepCtww6
 szzKFgk8wlaYes4G8jGOqRwZu9dGGesUAnd4u4W0J8/qoo9ZnE5/J7F04YVbAsytc7P/
 AcMi7CvvAhke8tqtDLDUpW7LtgAPWL3+O+tOAC+5+KgvCkwZ1SyQE9FCGM/FfT8SOAV+ 0Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32g9v9fcs9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 18:11:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DC4FE10002A;
 Tue, 28 Jul 2020 18:11:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D3672210F8F;
 Tue, 28 Jul 2020 18:11:35 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 18:11:35 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 28 Jul 2020 18:11:35 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH] ARM: dts: stm32: add reset support to uart
 nodes on stm32mp15x
Thread-Index: AQHWZOkffYcjLtGTDUmWTqaI4ma37akdCC0A
Date: Tue, 28 Jul 2020 16:11:35 +0000
Message-ID: <9a4f7078-6b5e-0566-8731-3fbcf72cf39d@st.com>
References: <20200706144753.1.I1f502be5d9d0197f53e8075a283a102e05817c2b@changeid>
 <15f1c337-f632-5395-9d8b-276e2b5b8fbb@st.com>
In-Reply-To: <15f1c337-f632-5395-9d8b-276e2b5b8fbb@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <CDAD3CDB67252F4F88968A9569A8AA6F@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_14:2020-07-28,
 2020-07-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: add reset support to
 uart nodes on stm32mp15x
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


On 7/28/20 4:12 PM, Patrice CHOTARD wrote:
> On 7/6/20 2:48 PM, Patrick Delaunay wrote:
>> STM32 serial IP can be reset via reset controller.
>> Add the support of reset to uart nodes on stm32mp15-u-boot.dtsi,
>> the ad-dons file for U-Boot.
>>
>> This patch fix issues when previous UART configuration, for example
>> done in TF-A or ROM code, is not handled in U-Boot stm32 serial driver
>> init.
>>
>> This reset property won't be not added in Linux kernel device tree
>> as this reset is not used in Linux STM32 serial driver.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>
>>  arch/arm/dts/stm32mp15-u-boot.dtsi | 32 ++++++++++++++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>
>> diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
>> index 142ad25c43..c463b49dda 100644
>> --- a/arch/arm/dts/stm32mp15-u-boot.dtsi
>> +++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
>> @@ -179,6 +179,38 @@
>>  	compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
>>  };
>>  
>> +&usart1 {
>> +	resets = <&rcc USART1_R>;
>> +};
>> +
>> +&usart2 {
>> +	resets = <&rcc USART2_R>;
>> +};
>> +
>> +&usart3 {
>> +	resets = <&rcc USART3_R>;
>> +};
>> +
>> +&uart4 {
>> +	resets = <&rcc UART4_R>;
>> +};
>> +
>> +&uart5 {
>> +	resets = <&rcc UART5_R>;
>> +};
>> +
>> +&usart6 {
>> +	resets = <&rcc USART6_R>;
>> +};
>> +
>> +&uart7 {
>> +	resets = <&rcc UART7_R>;
>> +};
>> +
>> +&uart8{
>> +	resets = <&rcc UART8_R>;
>> +};
>> +
>>  &usbotg_hs {
>>  	compatible = "st,stm32mp1-hsotg", "snps,dwc2";
>>  };
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
>
> Thanks
>
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
Applied to u-boot-stm/master

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
