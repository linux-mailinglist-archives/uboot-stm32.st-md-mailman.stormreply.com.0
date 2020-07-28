Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0247230DB0
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 17:25:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 970AAC36B25
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 15:25:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBF11C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 15:25:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SFDCtY018333; Tue, 28 Jul 2020 17:25:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=w4KBU4JJNOrjHpCIy35MqBlXDos805Bl6yXHO5nTTII=;
 b=cKCMsf3KF9pmK9PXlKPTxUhho9BxVd2h9rqNKmiL6AQPINN0VeTIgov0Ppo9zM2cRvfW
 ELKBsvnWWRuWPtAdJmWjl1m9naS9TT3CnxPhDHB5WeO1C3pY9KCAR3xuckruR1gOgy2e
 LVxRfoUkJqkfer9IcLSrpmnSJ2o3mp31Sau8acRAHxxfO4kBBJ8shVqwktufn20XHHZT
 EztongH+rd648tPtEkDQn6370Jsbxxx5lI6kD3tHFKRHJ3+K3w3QdrIDu11hQ9dBpD/Q
 ZOhu54W7OxMBgiNWF7AUY6QpSboOccSU+1i2HBPYbkKKv2LO/Y6uM3iyBTca4Rk6RS7F Wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32g9v9f77a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 17:25:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 76857100034;
 Tue, 28 Jul 2020 17:25:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 648B0221072;
 Tue, 28 Jul 2020 17:25:52 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 17:25:51 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 28 Jul 2020 17:25:51 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH] arm: stm32mp: move dbgmcu_init call when
 DT is ready
Thread-Index: AQHWYZq2tjZ/bQ04zEuMXxE1buY+z6kc6EuAgAAZuYA=
Date: Tue, 28 Jul 2020 15:25:51 +0000
Message-ID: <f2f7ecbd-cae1-50cd-f91a-d8660710b2fd@st.com>
References: <20200724091331.12195-1-patrick.delaunay@st.com>
 <3006109b-1883-77cc-333b-40f7eafea8a9@st.com>
In-Reply-To: <3006109b-1883-77cc-333b-40f7eafea8a9@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <59EA0E4BAD360243BBB803A71129D6C3@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_13:2020-07-28,
 2020-07-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: stm32mp: move dbgmcu_init call when
 DT is ready
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


On 7/28/20 3:53 PM, Patrice CHOTARD wrote:
> On 7/24/20 11:13 AM, Patrick Delaunay wrote:
>> As the dbgmcu_init use the function bsec_dbgswenable which is based
>> on the DM and DT, its call can't be done before the spl is initialized
>> (driver model, DT and malloc) in board_init_f::spl_early_init().
>>
>> This function call is moved later in spl_board_init().
>>
>> Fixes: bd3f60d29c24 ("arm: stm32mp: protect DBGMCU_IDC access with BSEC")
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>
>>  arch/arm/mach-stm32mp/Kconfig |  1 +
>>  arch/arm/mach-stm32mp/cpu.c   | 12 ++++++++----
>>  2 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
>> index 4003c2e38b..478fd2f17d 100644
>> --- a/arch/arm/mach-stm32mp/Kconfig
>> +++ b/arch/arm/mach-stm32mp/Kconfig
>> @@ -1,6 +1,7 @@
>>  if ARCH_STM32MP
>>  
>>  config SPL
>> +	select SPL_BOARD_INIT
>>  	select SPL_CLK
>>  	select SPL_DM
>>  	select SPL_DM_SEQ_ALIAS
>> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
>> index 382067190c..56092c8bf6 100644
>> --- a/arch/arm/mach-stm32mp/cpu.c
>> +++ b/arch/arm/mach-stm32mp/cpu.c
>> @@ -154,15 +154,20 @@ static void security_init(void)
>>   */
>>  static void dbgmcu_init(void)
>>  {
>> -	setbits_le32(RCC_DBGCFGR, RCC_DBGCFGR_DBGCKEN);
>> -
>>  	/*
>>  	 * Freeze IWDG2 if Cortex-A7 is in debug mode
>>  	 * done in TF-A for TRUSTED boot and
>>  	 * DBGMCU access is controlled by BSEC_DENABLE.DBGSWENABLE
>>  	*/
>> -	if (!IS_ENABLED(CONFIG_TFABOOT) && bsec_dbgswenable())
>> +	if (!IS_ENABLED(CONFIG_TFABOOT) && bsec_dbgswenable()) {
>> +		setbits_le32(RCC_DBGCFGR, RCC_DBGCFGR_DBGCKEN);
>>  		setbits_le32(DBGMCU_APB4FZ1, DBGMCU_APB4FZ1_IWDG2);
>> +	}
>> +}
>> +
>> +void spl_board_init(void)
>> +{
>> +	dbgmcu_init();
>>  }
>>  #endif /* !defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD) */
>>  
>> @@ -241,7 +246,6 @@ int arch_cpu_init(void)
>>  	timer_init();
>>  
>>  #if !defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD)
>> -	dbgmcu_init();
>>  #ifndef CONFIG_TFABOOT
>>  	security_init();
>>  	update_bootmode();
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
