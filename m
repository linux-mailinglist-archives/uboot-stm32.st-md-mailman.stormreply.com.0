Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E98B2437FA
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 11:51:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBD24C36B24
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 09:51:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 775F2C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Aug 2020 09:51:41 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D9lp7N032129; Thu, 13 Aug 2020 11:51:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ViWAXjPWujzN+at8X/0W5UaU+19TD7a0MoXtDGYLG9s=;
 b=MEynXAMMEdRtu9ZI0/+RHGL+kqezGroXGRNRs3U9t5bogekiXNYFxklhxcL4LoVfvhWm
 qq3CSUfTXiVrH7T2hGPFmsWD84ZAjU7NWVDMLn+JBHolQfbfiwJtaaRtCoakc645cUEK
 zUFSGChT0rLGvjQPLgTtvuCRCap13O5S+Uj+TPuxuSb9jl9RPw0S4IYqx4f3CaOf2KQe
 kqL0ShwQQMnixxJDIUGzu93sHi3VKcslFniFDSSDXVQTf71kFgHDDqqiLbfxU5mI0YBo
 VOHz/qZkICe6AyapIwm62opSCaT9dakN8au5cwW32CoDKkc/o8SU7F5LSTawcfaAZ/Dm zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32sm9rny1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 11:51:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 12B9B10002A;
 Thu, 13 Aug 2020 11:51:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 086962AAC1C;
 Thu, 13 Aug 2020 11:51:40 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Aug
 2020 11:51:39 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Aug 2020 11:51:39 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 05/11] board: stm32mp1: use IS_ENABLED to
 prevent ifdef in set_dfu_alt_inf
Thread-Index: AQHWcUKgdwDco10gD06t2q8NNLGaYak1qqGA
Date: Thu, 13 Aug 2020 09:51:39 +0000
Message-ID: <7fc3eb42-2987-1dba-f059-e41e413daaf5@st.com>
References: <20200731143152.8812-1-patrick.delaunay@st.com>
 <20200731143152.8812-5-patrick.delaunay@st.com>
 <10a5b266-c350-fb28-320c-92cf8569917e@st.com>
In-Reply-To: <10a5b266-c350-fb28-320c-92cf8569917e@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <C97AFE467D1AF24CA8C39698C5E04E1C@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_06:2020-08-13,
 2020-08-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 05/11] board: stm32mp1: use IS_ENABLED to
 prevent ifdef in set_dfu_alt_inf
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


On 8/13/20 9:23 AM, Patrice CHOTARD wrote:
> Hi Patrick
>
> On 7/31/20 4:31 PM, Patrick Delaunay wrote:
>> Use CONFIG_IS_ENABLED to prevent ifdef in set_dfu_alt_inf.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>
>>  board/st/common/stm32mp_dfu.c | 20 +++++++++++---------
>>  1 file changed, 11 insertions(+), 9 deletions(-)

Applied on u-boot-stm/master

Thanks

>>
>> diff --git a/board/st/common/stm32mp_dfu.c b/board/st/common/stm32mp_dfu.c
>> index 0cda9196f9..2fb307efe4 100644
>> --- a/board/st/common/stm32mp_dfu.c
>> +++ b/board/st/common/stm32mp_dfu.c
>> @@ -113,11 +113,13 @@ void set_dfu_alt_info(char *interface, char *devstr)
>>  	snprintf(buf, DFU_ALT_BUF_LEN,
>>  		 "ram 0=%s", CONFIG_DFU_ALT_RAM0);
>>  
>> -	if (!uclass_get_device(UCLASS_MMC, 0, &dev))
>> -		board_get_alt_info_mmc(dev, buf);
>> +	if (CONFIG_IS_ENABLED(MMC)) {
>> +		if (!uclass_get_device(UCLASS_MMC, 0, &dev))
>> +			board_get_alt_info_mmc(dev, buf);
>>  
>> -	if (!uclass_get_device(UCLASS_MMC, 1, &dev))
>> -		board_get_alt_info_mmc(dev, buf);
>> +		if (!uclass_get_device(UCLASS_MMC, 1, &dev))
>> +			board_get_alt_info_mmc(dev, buf);
>> +	}
>>  
>>  	if (CONFIG_IS_ENABLED(MTD)) {
>>  		/* probe all MTD devices */
>> @@ -139,12 +141,12 @@ void set_dfu_alt_info(char *interface, char *devstr)
>>  			board_get_alt_info_mtd(mtd, buf);
>>  	}
>>  
>> -#ifdef CONFIG_DFU_VIRT
>> -	strncat(buf, "&virt 0=OTP", DFU_ALT_BUF_LEN);
>> +	if (IS_ENABLED(CONFIG_DFU_VIRT)) {
>> +		strncat(buf, "&virt 0=OTP", DFU_ALT_BUF_LEN);
>>  
>> -	if (IS_ENABLED(CONFIG_PMIC_STPMIC1))
>> -		strncat(buf, "&virt 1=PMIC", DFU_ALT_BUF_LEN);
>> -#endif
>> +		if (IS_ENABLED(CONFIG_PMIC_STPMIC1))
>> +			strncat(buf, "&virt 1=PMIC", DFU_ALT_BUF_LEN);
>> +	}
>>  
>>  	env_set("dfu_alt_info", buf);
>>  	puts("DFU alt info setting: done\n");
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
