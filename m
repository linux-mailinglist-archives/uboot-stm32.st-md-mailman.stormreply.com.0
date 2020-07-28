Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A29230F00
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 18:16:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3F5AC36B25
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 16:16:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14579C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 16:16:09 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SG8ECc000521; Tue, 28 Jul 2020 18:16:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=b0ooNhCNRc/pyEP++Uw9nDECjTu52XwLPpgCM1hAEqM=;
 b=1cgsZKk1sP3Rv+AuFEzlg5mLSGw6aL+6Pzap7tcunDWlFZwhAxuwWjcxETgXlvl+2Wns
 ks2ZJ1HaxmUICPbHraWP06pzjDBnLRMz7gDe2bhZbaGYSwEtodS7TS6rARx7cnRXCG2N
 UVqSNpmZA4lINQ9jvYh0uVQkQzaa83J02azNP4SN67ahj9Qc7f+mNWwxnTwKvtTTmmn2
 klwxmD9e8iEt5SugfxXwBoreNlz7/Y7SG7Ro5S+MkiEej+4lCqTnRGFSMAzEVUNz0Mi+
 cSJp3lBVt+cxyBaSldotwvG1AV1nQ9YzKEb/1ulsmTfglHLv4TE0KzDvwPA10/LuRurY Jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gbmg722p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 18:16:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BC9CC10002A;
 Tue, 28 Jul 2020 18:16:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B3BAA2A97BF;
 Tue, 28 Jul 2020 18:16:06 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 18:16:06 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 28 Jul 2020 18:16:06 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH] Revert "ARM: dts: stm32: Reinstate card
 detect behavior on ST boards"
Thread-Index: AQHWZObmWZvdyR99o0eozy9VBElA46kdCXUA
Date: Tue, 28 Jul 2020 16:16:06 +0000
Message-ID: <fb02e742-f8e7-2f2f-707d-c771b8273ad7@st.com>
References: <20200707164729.20359-1-patrick.delaunay@st.com>
 <d6f4576a-ff47-4c0a-9a1e-e08d318565cf@st.com>
In-Reply-To: <d6f4576a-ff47-4c0a-9a1e-e08d318565cf@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <ACF26134DE633749818D9FE07FEA8D6B@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_14:2020-07-28,
 2020-07-28 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] Revert "ARM: dts: stm32: Reinstate card
 detect behavior on ST boards"
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


On 7/28/20 3:56 PM, Patrice CHOTARD wrote:
> On 7/7/20 6:47 PM, Patrick Delaunay wrote:
>> Since commit f13ff88b61c3 ("gpio: stm32: add ops set_dir_flags")
>> the gpio flags are supported by stm32 pinctrl driver.
>>
>> The cd-gpios is correctly handle in U-Boot and the patch on the
>> device tree can be removed.
>>
>> This reverts commit 792919241b3d750cd5295dfe6dd1d0958b9be468.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>
>>  arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 2 --
>>  arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi | 2 --
>>  2 files changed, 4 deletions(-)
>>
>> diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
>> index 7b8c1c1cc7..06cff38460 100644
>> --- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
>> +++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
>> @@ -162,8 +162,6 @@
>>  
>>  &sdmmc1 {
>>  	u-boot,dm-spl;
>> -	broken-cd;
>> -	/delete-property/ cd-gpios;
>>  };
>>  
>>  &sdmmc1_b4_pins_a {
>> diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
>> index ef3e7f45a3..7759ba2896 100644
>> --- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
>> +++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
>> @@ -158,8 +158,6 @@
>>  
>>  &sdmmc1 {
>>  	u-boot,dm-spl;
>> -	broken-cd;
>> -	/delete-property/ cd-gpios;
>>  };
>>  
>>  &sdmmc1_b4_pins_a {
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
