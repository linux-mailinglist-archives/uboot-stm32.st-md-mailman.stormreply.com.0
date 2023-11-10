Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACDD7E7C1C
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Nov 2023 13:22:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A953C6B457;
	Fri, 10 Nov 2023 12:22:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40498C6A615
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Nov 2023 12:22:31 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AA8TAlg002479; Fri, 10 Nov 2023 13:22:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:from:to:cc:references
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=JHSVogc0VL3ANqv7rCudh8mPGXyhlN9IvxJLiEFRxMQ=; b=CE
 G8Q6VZEM2C2y0mZjmuu/l32nrx2tRlcAifaqENNzMowtr7DSIfmNCu6C4Q4NHbEy
 F3yHh6yovg0N9exJbXf2Bp/Fwu9c63fNv/EVh3FnpKMZ+hOFk8aUZDqweRJBxLzj
 s3Pc9DMoc0cEaZuoehXSllsRJO284BPvguWDQKBGpoLuaCPMUrCJCsFd/ZSNywcj
 1N424UXduGL95vL/jEsbBIheAViADs/TeurHqxm6ZihhLF+qnkukDKBR2Jn4+EPx
 svz+dInRUNR0kpFbImhD2Y4Do5He60s3KEUt7AzMx8/ccD02bi76MJznQbAQ8Rd1
 6IP8gtoSUAfiEkxGYyvQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u7w26p0hd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 13:22:22 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B64AA100056;
 Fri, 10 Nov 2023 13:22:21 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A5BEB24C42F;
 Fri, 10 Nov 2023 13:22:21 +0100 (CET)
Received: from [10.201.20.54] (10.201.20.54) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 10 Nov
 2023 13:22:21 +0100
Message-ID: <d56ac4b2-15de-4e50-a9fa-bf541ec944af@foss.st.com>
Date: Fri, 10 Nov 2023 13:22:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20231009231551.354425-1-marex@denx.de>
 <83deab6c-7615-80a9-8fad-2073da828e7e@foss.st.com>
In-Reply-To: <83deab6c-7615-80a9-8fad-2073da828e7e@foss.st.com>
X-Originating-IP: [10.201.20.54]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_09,2023-11-09_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32mp: Repair damage from
 alignment with v6.3
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



On 10/10/23 15:04, Patrice CHOTARD wrote:
> On 10/10/23 01:15, Marek Vasut wrote:
>> The patch fixed by this commit renders ST STM32MP15xx EV1 board and
>> all DHSOM SoM based boards unbootable from SPI NOR. Fix the damage
>> by updating -u-boot.dtsi to match the stm32mp15-pinctrl.dtsi update.
>>
>> Fixes: 08002ffd083d ("ARM: dts: stm32mp: alignment with v6.3")
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> NOTE: It is truly incomprehensible how 08002ffd083d was ever tested
>>       at ST, I can only speculate it never was tested at all, grumb.
> 
> Hi Marek,
> 
> Sorry for that, you are right, SPI NOR boot in SPL is no more tested on our side :-(
> Today we are only tested boot from sdcard with tf-a/optee.
> 
> Thanks for you fix.
> 
> Patrice
> 
>> ---
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: u-boot@dh-electronics.com
>> Cc: u-boot@lists.denx.de
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>  arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi   | 16 ++++++++++++----
>>  arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi | 12 +++---------
>>  arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi |  8 ++++++--
>>  3 files changed, 21 insertions(+), 15 deletions(-)
>>
>> diff --git a/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
>> index 1f7fdbce530..eb283cacd27 100644
>> --- a/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
>> +++ b/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
>> @@ -135,20 +135,28 @@
>>  
>>  &qspi_bk1_pins_a {
>>  	bootph-pre-ram;
>> -	pins1 {
>> +	pins {
>>  		bootph-pre-ram;
>>  	};
>> -	pins2 {
>> +};
>> +
>> +&qspi_cs1_pins_a {
>> +	bootph-pre-ram;
>> +	pins {
>>  		bootph-pre-ram;
>>  	};
>>  };
>>  
>>  &qspi_bk2_pins_a {
>>  	bootph-pre-ram;
>> -	pins1 {
>> +	pins {
>>  		bootph-pre-ram;
>>  	};
>> -	pins2 {
>> +};
>> +
>> +&qspi_cs2_pins_a {
>> +	bootph-pre-ram;
>> +	pins {
>>  		bootph-pre-ram;
>>  	};
>>  };
>> diff --git a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
>> index f12941b05f6..2f70b0690d2 100644
>> --- a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
>> +++ b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
>> @@ -134,20 +134,14 @@
>>  
>>  &qspi_bk1_pins_a {
>>  	bootph-pre-ram;
>> -	pins1 {
>> -		bootph-pre-ram;
>> -	};
>> -	pins2 {
>> +	pins {
>>  		bootph-pre-ram;
>>  	};
>>  };
>>  
>> -&qspi_bk2_pins_a {
>> +&qspi_cs1_pins_a {
>>  	bootph-pre-ram;
>> -	pins1 {
>> -		bootph-pre-ram;
>> -	};
>> -	pins2 {
>> +	pins {
>>  		bootph-pre-ram;
>>  	};
>>  };
>> diff --git a/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
>> index eb905ad2820..552b35db3c7 100644
>> --- a/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
>> +++ b/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
>> @@ -98,10 +98,14 @@
>>  
>>  &qspi_bk1_pins_a {
>>  	bootph-pre-ram;
>> -	pins1 {
>> +	pins {
>>  		bootph-pre-ram;
>>  	};
>> -	pins2 {
>> +};
>> +
>> +&qspi_cs1_pins_a {
>> +	bootph-pre-ram;
>> +	pins {
>>  		bootph-pre-ram;
>>  	};
>>  };
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Patrice

Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
