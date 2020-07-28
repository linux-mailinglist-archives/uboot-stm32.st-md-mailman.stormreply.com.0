Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B23230EF0
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 18:11:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB3C7C36B25
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 16:11:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEE71C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 16:11:13 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SG2LGe015225; Tue, 28 Jul 2020 18:11:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Vvhd9nWo52roBRw53ckPG+V66FfLko6GLDBGhmRkUr8=;
 b=MPPhHs6KCvhSAJHWRS1tTkypqC2QJAkCBJ1A1K7yZWhcru05S/XqpThyHRShihCDijz/
 r5d+/qqkFZTS6AVtEdRSzTy3LnAg2E3cZne00UjcZNSJ+EpVP68OzgXr9ky45vE/aSKP
 0qzDzMc/gAbelncYEUCeiiAUkltZShuB07Umb1HggkbRP29zg/yGHz2sY5aqbD537fqs
 izoma/jtylR2c1IoS/iMiaLZUwUuLl1uxrAb1ZICi0IPlDVQeSuLR9VKK7VO1CKKPecB
 H6P+N15ozYE6gHcCF/qSxuGlIIaxjc81W8wbVKFru+25hqangXMs1/5j5MG6AHX9+ve/ dA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32ga71y3nt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 18:11:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 22DD110002A;
 Tue, 28 Jul 2020 18:11:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 127A52A9784;
 Tue, 28 Jul 2020 18:11:11 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 18:11:10 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 28 Jul 2020 18:11:10 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH] ARM: dts: stm32mp: remove hnp-srp-disable
 for usbotg on dk1
Thread-Index: AQHWUEmR9sQihHC6U0GpbUexlmEqLKkdMU8A
Date: Tue, 28 Jul 2020 16:11:10 +0000
Message-ID: <5f5f6424-668d-bbac-fd20-3bbe59159084@st.com>
References: <20200701111010.21586-1-patrick.delaunay@st.com>
 <8df05708-429e-cc56-e07a-c7f2701fd8c9@st.com>
In-Reply-To: <8df05708-429e-cc56-e07a-c7f2701fd8c9@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <A4AEA407A2A8244ABDFFA82F6F952DA2@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_13:2020-07-28,
 2020-07-28 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32mp: remove hnp-srp-disable
 for usbotg on dk1
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


On 7/2/20 10:19 AM, Patrice CHOTARD wrote:
> Hi Patrick
>
> On 7/1/20 1:10 PM, Patrick Delaunay wrote:
>> Remove hnp-srp-disable for usbotg node because this feature is only needed
>> for usbotg in HOST mode (in drivers/usb/host/dwc2.c)
>> and this feature is not activated in stm32mp15 U-Boot
>> (stm32mp15_basic_defconfig and stm32mp15_trusted_defconfig);
>> only the device mode is activated and OTG is not supported in DWC2 driver.
>>
>> This patch reduces the difference between U-Boot and Linux kernel
>> device-tree.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>
>>  arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
>> index e13dade463..6e4e4922ab 100644
>> --- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
>> +++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
>> @@ -203,5 +203,4 @@
>>  
>>  &usbotg_hs {
>>  	u-boot,force-b-session-valid;
>> -	hnp-srp-disable;
>>  };
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
>
> Thanks
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
