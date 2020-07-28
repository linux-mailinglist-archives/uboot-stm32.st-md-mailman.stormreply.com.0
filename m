Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4150C230EBD
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 18:03:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B482C36B25
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 16:03:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66331C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 16:03:48 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SG39lo026288; Tue, 28 Jul 2020 18:03:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=WzQh3fSy866sJ8w/Kkst6zt266DuSkyeocTdtJII0kw=;
 b=bgYRZ0oCD7mcD32latorLlUx/l3vNweWZ0CNNPywAMyoQ92FWXECtpDBSMN8olRAw94/
 YJ6VuE5OfvZR9SG5jI08w3P4IEk/c3Q7d1tWZT6fwEPCn7Ri8dBhS3w/dmCImZ2E70YL
 C0YE1Z3Xo1hLAKSHOyrnb1QKEVrp4cKwNVScx6pBSurV1YyUAaghT0GtAG/2jMyHeCFY
 3P0gGWyF/e8m92u7xZbI+nGjT8vpIToWlCPTv68ghAkC/mnur/g0Na7IAPVr/axDxqQG
 iCdjnaIpYO+sJfE5mGGOA+pXdD9+aw0fL+01dr4qFDPIK1K1JzMrv96fj4IxlM8wh8sP QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32g9v9fbvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 18:03:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A26A010002A;
 Tue, 28 Jul 2020 18:03:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 99A2E2208D1;
 Tue, 28 Jul 2020 18:03:46 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 18:03:46 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 28 Jul 2020 18:03:46 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH] configs: stm32mp15: activate CMD_ADTIMG
Thread-Index: AQHWU5V+Xmo0LZdiNkCFgKOw+4g7i6kdCScAgAAffoA=
Date: Tue, 28 Jul 2020 16:03:46 +0000
Message-ID: <28b1b936-fd1e-b112-8dee-fcc3d7b8859f@st.com>
References: <20200706130046.22446-1-patrick.delaunay@st.com>
 <ac655034-23d7-004f-8b0b-ec16f2622f1a@st.com>
In-Reply-To: <ac655034-23d7-004f-8b0b-ec16f2622f1a@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <4B584789E186844BABC5092BA33D6377@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_13:2020-07-28,
 2020-07-28 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp15: activate CMD_ADTIMG
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


On 7/28/20 4:11 PM, Patrice CHOTARD wrote:
> On 7/6/20 3:00 PM, Patrick Delaunay wrote:
>> Activate the support of the command adtimg to handle android images.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>
>>  configs/stm32mp15_basic_defconfig   | 1 +
>>  configs/stm32mp15_trusted_defconfig | 1 +
>>  2 files changed, 2 insertions(+)
>>
>> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
>> index f0abc89a43..e6989aaaa7 100644
>> --- a/configs/stm32mp15_basic_defconfig
>> +++ b/configs/stm32mp15_basic_defconfig
>> @@ -23,6 +23,7 @@ CONFIG_SPL_I2C_SUPPORT=y
>>  CONFIG_SPL_MTD_SUPPORT=y
>>  CONFIG_SPL_POWER_SUPPORT=y
>>  CONFIG_SYS_PROMPT="STM32MP> "
>> +CONFIG_CMD_ADTIMG=y
>>  # CONFIG_CMD_ELF is not set
>>  # CONFIG_CMD_EXPORTENV is not set
>>  # CONFIG_CMD_IMPORTENV is not set
>> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
>> index ca4a10813b..93f605901c 100644
>> --- a/configs/stm32mp15_trusted_defconfig
>> +++ b/configs/stm32mp15_trusted_defconfig
>> @@ -11,6 +11,7 @@ CONFIG_DISTRO_DEFAULTS=y
>>  CONFIG_FIT=y
>>  CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
>>  CONFIG_SYS_PROMPT="STM32MP> "
>> +CONFIG_CMD_ADTIMG=y
>>  # CONFIG_CMD_ELF is not set
>>  # CONFIG_CMD_EXPORTENV is not set
>>  # CONFIG_CMD_IMPORTENV is not set
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
