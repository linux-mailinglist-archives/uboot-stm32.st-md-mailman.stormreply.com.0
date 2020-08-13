Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0F22437F1
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 11:50:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36102C36B24
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 09:50:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7BA3C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Aug 2020 09:49:58 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D8Kvpk022523; Thu, 13 Aug 2020 11:49:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=FyssB6kUZRdLVdaJ70sdJA1XYvO5TGexUBDfxy3gQaM=;
 b=jgHIn25mnkCbjQwXUCPSFUK6601EybBBCx5Q/L7JbWLw4cV0Jh98odJdsSdYzcvWIOL+
 b0rUEH/1xxl0qBNraO6rPFCvTJS75I/3zOaZcHkKn45RA0nE3iaWrz3Jgv7+pjQ63RA/
 dDfpENsfAeHQAn2EUoRliHf4TKRoCA7t96RX3cS5wOvB2eKnDjyFvdBXlhfAtMmgFlJo
 Sw3JlOyEsbC0+Ytu5F13rGKR2DID1gtYn5Kuu4SJq8ghw5obi1PLo3irDdGhwEWnQ3Me
 nYmQxBz1g3Dc22fnziDKbVY35FDuP0eMVOML+8siHhpoZGyEH4+e+sdyzwapCX7hZ0wg IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32uj533jeg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 11:49:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0BEDF10002A;
 Thu, 13 Aug 2020 11:49:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 01C352AAC17;
 Thu, 13 Aug 2020 11:49:57 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Aug
 2020 11:49:56 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Aug 2020 11:49:56 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 03/11] board: stm32mp1: use IS_ENABLED to
 prevent ifdef in board_check_usb_power
Thread-Index: AQHWcUKE0Tt7DRYW/UKmQdwmocPbX6k1qicA
Date: Thu, 13 Aug 2020 09:49:56 +0000
Message-ID: <393a7745-8539-836a-91b2-86651953b1fb@st.com>
References: <20200731143152.8812-1-patrick.delaunay@st.com>
 <20200731143152.8812-3-patrick.delaunay@st.com>
 <881e02e3-b381-7408-36b1-5606a5385353@st.com>
In-Reply-To: <881e02e3-b381-7408-36b1-5606a5385353@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <3067F456CFD00241B2280215A425AE99@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_02:2020-08-11,
 2020-08-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 03/11] board: stm32mp1: use IS_ENABLED to
 prevent ifdef in board_check_usb_power
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


On 8/13/20 9:22 AM, Patrice CHOTARD wrote:
> Hi Patrick
>
> On 7/31/20 4:31 PM, Patrick Delaunay wrote:
>> Use IS_ENABLED to prevent ifdef in board_check_usb_power.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>
>>  board/st/stm32mp1/stm32mp1.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied on u-boot-stm/master

Thanks

>>
>> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
>> index 5c84b09c3e..3182f44598 100644
>> --- a/board/st/stm32mp1/stm32mp1.c
>> +++ b/board/st/stm32mp1/stm32mp1.c
>> @@ -288,7 +288,6 @@ static void __maybe_unused led_error_blink(u32 nb_blink)
>>  		hang();
>>  }
>>  
>> -#ifdef CONFIG_ADC
>>  static int board_check_usb_power(void)
>>  {
>>  	struct ofnode_phandle_args adc_args;
>> @@ -300,6 +299,10 @@ static int board_check_usb_power(void)
>>  	int ret, uV, adc_count;
>>  	u32 nb_blink;
>>  	u8 i;
>> +
>> +	if (!IS_ENABLED(CONFIG_ADC))
>> +		return -ENODEV;
>> +
>>  	node = ofnode_path("/config");
>>  	if (!ofnode_valid(node)) {
>>  		debug("%s: no /config node?\n", __func__);
>> @@ -422,7 +425,6 @@ static int board_check_usb_power(void)
>>  
>>  	return 0;
>>  }
>> -#endif /* CONFIG_ADC */
>>  
>>  static void sysconf_init(void)
>>  {
>> @@ -699,10 +701,8 @@ int board_late_init(void)
>>  	}
>>  #endif
>>  
>> -#ifdef CONFIG_ADC
>>  	/* for DK1/DK2 boards */
>>  	board_check_usb_power();
>> -#endif /* CONFIG_ADC */
>>  
>>  	return 0;
>>  }
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
>
> Thanks
>
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
