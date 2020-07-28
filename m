Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 739F9230DBB
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 17:27:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C17CC36B25
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 15:27:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A401C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 15:27:23 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SFDebq008277; Tue, 28 Jul 2020 17:27:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=sGlwr5yvA+C4/XsTUEXt13x4ElzDm3keGASa/QpWj8w=;
 b=ChdTOLECquDMp0blTB5vrtk9apCclDMwa4HQyyGImbJSuEaUBhM0DAjuG3KbOI4SuM73
 KpuoArN0LMtGoYu4ADnlgUnPBWjYsyH5/IlYvkCo5Hz6CgvpfxiEFV/ZGzJPvwiZvyOm
 M7pCTAjBHe68Trhcx0a6pkxH1bw5EAUG1QsQ1HIsf8sfORy1+tpaRUZg9MsSxtua/3tw
 1Eh/Bp+qrFIdNNK9qq4zfP7jjZwZOwkx0rSk+RvmIvAMwXegms9e1qNruuM7i6cDC+Nv
 aEcjaTNCKBUN1lOqt1NkpPa5OjH25xbvfsmGRRFvGr51dSvyEHVBUxKs+OCN6MUTq/vp Iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gagv6vrw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 17:27:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DDB1010002A;
 Tue, 28 Jul 2020 17:27:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD3CF21FEB7;
 Tue, 28 Jul 2020 17:27:20 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 17:27:20 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 28 Jul 2020 17:27:20 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH] stm32mp1: mmu_set_region_dcache_behaviour
Thread-Index: AQHWYZvh1DHKQGYsWkO8Jrxj/Uuwvakc5K8AgAAdvAA=
Date: Tue, 28 Jul 2020 15:27:20 +0000
Message-ID: <61819755-86ed-7753-a6e7-29893476d12a@st.com>
References: <20200724092151.21335-1-patrick.delaunay@st.com>
 <7b67ddf3-5387-3a52-0880-d060a681a2c2@st.com>
In-Reply-To: <7b67ddf3-5387-3a52-0880-d060a681a2c2@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <64460842BBCC83498C6067611751BEAA@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_13:2020-07-28,
 2020-07-28 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp1: mmu_set_region_dcache_behaviour
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


On 7/28/20 3:40 PM, Patrice CHOTARD wrote:
> On 7/24/20 11:21 AM, Patrick Delaunay wrote:
>> Since commit d877f8fd0f09 ("arm: provide a function for boards init
>> code to modify MMU virtual-physical map") the parameter of
>> mmu_set_region_dcache_behaviour need to be MMU_SECTION_SIZE
>> aligned.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>
>>  arch/arm/mach-stm32mp/cpu.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
>> index 56092c8bf6..b7fcee2b36 100644
>> --- a/arch/arm/mach-stm32mp/cpu.c
>> +++ b/arch/arm/mach-stm32mp/cpu.c
>> @@ -225,9 +225,10 @@ static void early_enable_caches(void)
>>  	dcache_enable();
>>  
>>  	if (IS_ENABLED(CONFIG_SPL_BUILD))
>> -		mmu_set_region_dcache_behaviour(STM32_SYSRAM_BASE,
>> -						STM32_SYSRAM_SIZE,
>> -						DCACHE_DEFAULT_OPTION);
>> +		mmu_set_region_dcache_behaviour(
>> +			ALIGN(STM32_SYSRAM_BASE, MMU_SECTION_SIZE),
>> +			round_up(STM32_SYSRAM_SIZE, MMU_SECTION_SIZE),
>> +			DCACHE_DEFAULT_OPTION);
>>  	else
>>  		mmu_set_region_dcache_behaviour(STM32_DDR_BASE, STM32_DDR_SIZE,
>>  						DCACHE_DEFAULT_OPTION);
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
