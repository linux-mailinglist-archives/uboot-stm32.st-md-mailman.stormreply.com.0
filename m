Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AF91BA69E
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Apr 2020 16:40:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 660F1C36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Apr 2020 14:40:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8623FC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2020 14:40:04 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03REc3nm023177; Mon, 27 Apr 2020 16:39:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=E8uMLeBbeQ3osx13tODKpgOICyLIbjS+25N1t6N18d8=;
 b=Yfr9rEOZlDsKxTAROg4YdDuKCr1W3BoY75aZes1tZg69qxccL4i4f/hGSltrXUSHnMnV
 6e3q1b98za50kfbeDt7IpQPh1Eu5gW9fQU522jO/XwlRu6rRI8y/X8cBdNOxA8PomWT4
 pt2QtEqMDe7hkQXfCEONMm3h+lS1/g5W8O8y3UAs3opzNbn77BEtmbPRIuxawt789w5S
 Ihi1EdE851pVdYzjrJBAIIGROVpNBZaqP2JWzUc9OfAxZmF5OveX1ov8wS+Z01pWxcMN
 HiXdr1LrCMAytphly/PtBF7C0nkDbNcPSb22U7ImKljiDBlKsw7pAGZNBUlJPd5k9tsC vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30n4j5pedx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 16:39:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CB46B100034;
 Mon, 27 Apr 2020 16:39:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B14B12B186B;
 Mon, 27 Apr 2020 16:39:51 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Apr
 2020 16:39:51 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 27 Apr 2020 16:39:51 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] cmd: cache: Fix non-cached memory cachability
Thread-Index: AQHWGYiRaYYHw1V6JkOFLqY/7lXHMaiMpvWAgABH3AA=
Date: Mon, 27 Apr 2020 14:39:51 +0000
Message-ID: <61433433-1961-13bc-52b4-6b653bbd813e@st.com>
References: <20200423160155.9258-1-patrice.chotard@st.com>
 <53bd84ea-22ec-4555-319a-73c9d0dd44fe@denx.de>
In-Reply-To: <53bd84ea-22ec-4555-319a-73c9d0dd44fe@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <DBE86791753BFF4CAD8B3AD0B8107F28@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-27_10:2020-04-27,
 2020-04-27 signatures=0
Cc: Stephen Warren <swarren@nvidia.com>, Vladimir
 Olovyannikov <vladimir.olovyannikov@broadcom.com>,
 Rajesh Ravi <rajesh.ravi@broadcom.com>, Simon Glass <sjg@chromium.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Eric Perie <eric.perie@yahoo.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Trevor Woerner <trevor@toganlabs.com>, Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] cmd: cache: Fix non-cached memory
	cachability
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

Hi Marek

On 4/27/20 12:22 PM, Marek Vasut wrote:
> On 4/23/20 6:01 PM, Patrice Chotard wrote:
>
> [...]
>
>> diff --git a/arch/arm/lib/cache.c b/arch/arm/lib/cache.c
>> index 007d4ebc49..7f3cfb407c 100644
>> --- a/arch/arm/lib/cache.c
>> +++ b/arch/arm/lib/cache.c
>> @@ -73,6 +73,15 @@ static unsigned long noncached_start;
>>  static unsigned long noncached_end;
>>  static unsigned long noncached_next;
>>  
>> +void noncached_set_region(void)
>> +{
> Make this a __weak function and let architectures override it.

Ok



>
>> +#if !CONFIG_IS_ENABLED(SYS_DCACHE_OFF)
>> +	mmu_set_region_dcache_behaviour(noncached_start,
>> +					noncached_end - noncached_start,
>> +					DCACHE_OFF);
>> +#endif
>> +}
>> +
>>  void noncached_init(void)
>>  {
>>  	phys_addr_t start, end;
>> @@ -89,9 +98,7 @@ void noncached_init(void)
>>  	noncached_end = end;
>>  	noncached_next = start;
>>  
>> -#if !CONFIG_IS_ENABLED(SYS_DCACHE_OFF)
>> -	mmu_set_region_dcache_behaviour(noncached_start, size, DCACHE_OFF);
>> -#endif
>> +	noncached_set_region();
>>  }
>>  
>>  phys_addr_t noncached_alloc(size_t size, size_t align)
>> diff --git a/cmd/cache.c b/cmd/cache.c
>> index 27dcec0931..86fbaf8dd6 100644
>> --- a/cmd/cache.c
>> +++ b/cmd/cache.c
>> @@ -64,6 +64,9 @@ static int do_dcache(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
>>  			break;
>>  		case 1:
>>  			dcache_enable();
>> +#ifdef CONFIG_SYS_NONCACHED_MEMORY
> See above, then you won't need this ifdeffery.

Ok

Thanks

>
>> +			noncached_set_region();
>> +#endif
>>  			break;
>>  		case 2:
>>  			flush_dcache_all();
>>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
