Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 530691A944E
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Apr 2020 09:32:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18B28C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Apr 2020 07:32:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 430EFC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2020 07:32:44 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03F7Ro7c016846; Wed, 15 Apr 2020 09:32:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=zQzgTG9rBLSlnqQE4ze5+Pr496w5TBFgmTr1NV4IPVg=;
 b=RTEyIHTLcRM8n7BvvtI0VzBC7p+C82vz0jyJ6Zx9SSzzEnlSVuuOPl5Jx4l1sL3bLTHZ
 G8eIJ5/l1KMV9+of1fLQ2zOAr+8r/8GqQMIsMj+PAHVifW285LppnVyweIJ4V7ENUOdU
 svRaigtIPQ5bQ0abXuKXHqBUCwvCiH/uQyRp/VmZq6L22AQ4CK+/DBucseHos2LuDZ6a
 WEapRcbR9IirZW7qfCFIn8LV17muVmMD559RW6SYcdH6Qaa4oAe9DbDNXiE1r9VlR71L
 fwrKZ/s4BuvjQkzv8J1NE9j2EQXpp5bzjNE+C2LJXzWnphBmr60pbiOvnfsSrMvK3ILc bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30dn75j4he-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Apr 2020 09:32:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2F3A2100034;
 Wed, 15 Apr 2020 09:32:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2437C2A4D98;
 Wed, 15 Apr 2020 09:32:41 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Apr
 2020 09:32:40 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 15 Apr 2020 09:32:40 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH] board: stm32mp1: correct CONFIG_IS_ENABLED
 usage for LED
Thread-Index: AQHWD1tvN1APDwuJTU+pJWbNkOCkDqh4dyWAgAE4sYA=
Date: Wed, 15 Apr 2020 07:32:40 +0000
Message-ID: <7c6ed840-6a0c-3650-5f62-13a80c4320b5@st.com>
References: <20200410191347.1.If78ae0e92c7e52f0fc20716ccfbf7d5005f38a51@changeid>
 <de16d66e-0ce1-e0f6-5c88-b5bc6ecd424e@st.com>
In-Reply-To: <de16d66e-0ce1-e0f6-5c88-b5bc6ecd424e@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <9A29C167AF793F42903DAF4C073E2FD9@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-15_01:2020-04-14,
 2020-04-15 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] board: stm32mp1: correct
 CONFIG_IS_ENABLED usage for LED
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

Hi

On 4/14/20 2:53 PM, Patrice CHOTARD wrote:
> Hi
>
> On 4/10/20 7:14 PM, Patrick Delaunay wrote:
>> Use the correct macro to test presence CONFIG_LED:
>> replace CONFIG_IS_ENABLED(CONFIG_LED) by CONFIG_IS_ENABLED(LED)
>>
>> Issue see during review unrelated patch
>> "board: stm32mp1: update management of boot-led"
>> http://patchwork.ozlabs.org/patch/1264823/
>>
>> Cc: Marek Vasut <marex@denx.de>
>> Cc: Patrice Chotard <patrice.chotard@st.com>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>
>>  board/dhelectronics/dh_stm32mp1/board.c | 2 +-
>>  board/st/stm32mp1/stm32mp1.c            | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
>> index 7bcd713a86..3c14d8206d 100644
>> --- a/board/dhelectronics/dh_stm32mp1/board.c
>> +++ b/board/dhelectronics/dh_stm32mp1/board.c
>> @@ -398,7 +398,7 @@ int board_init(void)
>>  
>>  	sysconf_init();
>>  
>> -	if (CONFIG_IS_ENABLED(CONFIG_LED))
>> +	if (CONFIG_IS_ENABLED(LED))
>>  		led_default_state();
>>  
>>  	return 0;
>> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
>> index 07f5344ec9..053c5e1f07 100644
>> --- a/board/st/stm32mp1/stm32mp1.c
>> +++ b/board/st/stm32mp1/stm32mp1.c
>> @@ -647,7 +647,7 @@ int board_init(void)
>>  
>>  	sysconf_init();
>>  
>> -	if (CONFIG_IS_ENABLED(CONFIG_LED))
>> +	if (CONFIG_IS_ENABLED(LED))
>>  		led_default_state();
>>  
>>  	return 0;
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
>
> Thanks
>
> Patrice
Applied to u-boot-stm/next

Thanks

Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
