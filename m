Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC53B24381F
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 11:59:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 759C9C36B24
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 09:59:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFBC6C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Aug 2020 09:59:23 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D9qPWM032244; Thu, 13 Aug 2020 11:59:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=PP1QEdeHtXWBr3nKq27QTNupU2Snpu0AxsVFZB6ij4U=;
 b=KTX2YcjrL3cVdGJtQL0oIvhB7TRs+bCMHW/4BIAHb0eOJXpS7dVjITocbotADp2sExQp
 Ndu2RFqtdaEzGbQRPVjioMP6c1XigZkxYNnWRcjY+x2kWwvVyDfa7M6WZAGcq3t1SBiV
 0SCDW9L0sdO/ngxlLt4zz6jZ6DRn9JxgzFMZ/BVRZLJjyigLuxScKcSV0Uf9IN+f9uUz
 gfYXriSHHXAHSg6EhTcnha92m6Lb7YjN4mXuq2KT2e4g1nPTS9Qsom9MI7aapJY+OECp
 p8FIG40fGxZVvjQzbpJ6cye49ZONWXMBJOyFL4DTvD4glyHEwnknN1ATzQyjKY6Fr5DG KQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32smf9n32e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 11:59:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0BC0A100034;
 Thu, 13 Aug 2020 11:59:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0379B2AB71E;
 Thu, 13 Aug 2020 11:59:14 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Aug
 2020 11:59:13 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Aug 2020 11:59:13 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Christophe KERELLO <christophe.kerello@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 10/11] configs: stm32mp: add CONFIG_STM32_FMC2_EBI
Thread-Index: AQHWZw/pd488D6fQX0WF+bd0hnp3dKk1mOOAgAAoQYA=
Date: Thu, 13 Aug 2020 09:59:13 +0000
Message-ID: <580deca3-a450-69a6-6f2d-3d1d209fbda0@st.com>
References: <1596182024-18181-1-git-send-email-christophe.kerello@st.com>
 <1596182024-18181-11-git-send-email-christophe.kerello@st.com>
 <ab4b0950-090e-741f-66d8-fc73b5e15012@st.com>
In-Reply-To: <ab4b0950-090e-741f-66d8-fc73b5e15012@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <425A4E4D02AEE748A5C30C4BB3311161@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_06:2020-08-13,
 2020-08-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 10/11] configs: stm32mp: add
	CONFIG_STM32_FMC2_EBI
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


On 8/13/20 9:35 AM, Patrice CHOTARD wrote:
> Hi Christophe
>
> On 7/31/20 9:53 AM, Christophe Kerello wrote:
>> This patch enables the support of FMC2 EBI.
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
>> ---
>>
>>  configs/stm32mp15_basic_defconfig   | 1 +
>>  configs/stm32mp15_trusted_defconfig | 1 +
>>  2 files changed, 2 insertions(+)

Applied on u-boot-stm/master

Thanks

>>
>> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
>> index 5c500a1..2094183 100644
>> --- a/configs/stm32mp15_basic_defconfig
>> +++ b/configs/stm32mp15_basic_defconfig
>> @@ -88,6 +88,7 @@ CONFIG_LED=y
>>  CONFIG_LED_GPIO=y
>>  CONFIG_DM_MAILBOX=y
>>  CONFIG_STM32_IPCC=y
>> +CONFIG_STM32_FMC2_EBI=y
>>  CONFIG_DM_MMC=y
>>  CONFIG_SUPPORT_EMMC_BOOT=y
>>  CONFIG_STM32_SDMMC2=y
>> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
>> index 98680cb..8d59d84 100644
>> --- a/configs/stm32mp15_trusted_defconfig
>> +++ b/configs/stm32mp15_trusted_defconfig
>> @@ -68,6 +68,7 @@ CONFIG_LED=y
>>  CONFIG_LED_GPIO=y
>>  CONFIG_DM_MAILBOX=y
>>  CONFIG_STM32_IPCC=y
>> +CONFIG_STM32_FMC2_EBI=y
>>  CONFIG_DM_MMC=y
>>  CONFIG_SUPPORT_EMMC_BOOT=y
>>  CONFIG_STM32_SDMMC2=y
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
>
> Thanks
>
> Patrice
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
