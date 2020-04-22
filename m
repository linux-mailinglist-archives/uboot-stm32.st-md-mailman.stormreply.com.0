Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6B51B43EA
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 14:05:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B22FFC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 12:05:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C024C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 12:05:04 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03MBxAUR019652; Wed, 22 Apr 2020 14:04:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=0nxiL9j1m8r5bG4uQcvyq8fsCgcgW/IjXMBQ5YVgJ7I=;
 b=qyG5Bqbg3k57Ot2t6cvqaNN/v1jNi5BjhPQ8Xvn5bp04FVi0j0fZ1EskCw4QSc+wvqlS
 C4TKlJylHdnhjXvUoLcZ/oWSXZmZnA8o5L4lNbxB4cIwmRJtPdz5HSF6AzPZ3a7ybUX0
 ypa1Cr2EYk1xcC+tnKRzfREj9SjUwXT9hoHcCbcLi2hIxv++HFe0h5eihubxi1DZKW19
 9WN8nDjjwav0HHmSHWwDoLpScYWtuXAGEic1xBnz1PmqI1R9C5fkzeJ+18tvlgqSkMxr
 HIja38rZamMhOGwIg7TmVvK7TF6E777pL81oiJim2s/jTqXg1fQ9kfYtwwtb9x9XuGm/ hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fqawe6qv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 14:04:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ECFDC10002A;
 Wed, 22 Apr 2020 14:04:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D66552ADA01;
 Wed, 22 Apr 2020 14:04:54 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 22 Apr
 2020 14:04:54 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 22 Apr 2020 14:04:54 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>
Thread-Topic: [Uboot-stm32] [PATCH 1/3] env: mmc: allow support of
 mmc_get_env_dev with OF_CONTROL
Thread-Index: AQHWF7+BmISA5RtGnE+XnSThr4BrQ6iDQC4AgACa8oCAARBQgA==
Date: Wed, 22 Apr 2020 12:04:54 +0000
Message-ID: <f7f523aa-812a-cc5c-ffe5-ab3cab940f42@st.com>
References: <20200319105917.1.Ib0b23085d678421d429580e13560b4dad27c9378@changeid>
 <d73f5820-92a8-b182-fca3-f8ca2fe49a01@st.com>
 <DB6PR0402MB2760B504CC3F094DA95AC8E088D50@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <20200421195015.GP4555@bill-the-cat>
In-Reply-To: <20200421195015.GP4555@bill-the-cat>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <29F7B1EB10ACD4418BDB0E11EA18C10A@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-22_03:2020-04-22,
 2020-04-22 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Wolfgang Denk <wd@denx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] env: mmc: allow support of
 mmc_get_env_dev with OF_CONTROL
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

On 4/21/20 9:50 PM, Tom Rini wrote:
> On Tue, Apr 21, 2020 at 10:35:40AM +0000, Peng Fan wrote:
>>> Subject: Re: [Uboot-stm32] [PATCH 1/3] env: mmc: allow support of
>>> mmc_get_env_dev with OF_CONTROL
>>>
>>> Hi Tom
>>>
>>> I just noticed that this env series is delegated to Peng Fan (mmc maintainer)
>>> instead of Joe Hershberger (env maintainer).
>>>
>>> Is there any reason for this or perhaps is it just an error ?
>> Ah, I not notice the delegation issue. if you are concerned about this. 
>> I'll leave this to Joe and drop the patchset from my CI.
> I looked over the patch and figured it was clear enough in
> implementation to go either way, sorry for the confusion.

I have delegated the full series to Joe in patchwork

Thanks

Patrice

>
>> Thanks,
>> Peng.
>>
>>> Thanks
>>>
>>> Patrice
>>>
>>> On 3/19/20 10:59 AM, Patrick Delaunay wrote:
>>>> Use the weak function mmc_get_env_dev in mmc_offset_try_partition
>>>> function to allow dynamic selection of mmc device to use and no more
>>>> use directly the define CONFIG_SYS_MMC_ENV_DEV.
>>>>
>>>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>>>> ---
>>>>
>>>>  env/mmc.c | 18 ++++++++++++------
>>>>  1 file changed, 12 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/env/mmc.c b/env/mmc.c
>>>> index 251ad07d7c..902cca23ad 100644
>>>> --- a/env/mmc.c
>>>> +++ b/env/mmc.c
>>>> @@ -24,14 +24,25 @@
>>>>
>>>>  DECLARE_GLOBAL_DATA_PTR;
>>>>
>>>> +#if !defined(CONFIG_SYS_MMC_ENV_DEV)
>>>> +#define CONFIG_SYS_MMC_ENV_DEV 0
>>>> +#endif
>>>> +
>>>> +__weak int mmc_get_env_dev(void)
>>>> +{
>>>> +	return CONFIG_SYS_MMC_ENV_DEV;
>>>> +}
>>>> +
>>>>  #if CONFIG_IS_ENABLED(OF_CONTROL)
>>>>  static inline int mmc_offset_try_partition(const char *str, s64 *val)
>>>> {
>>>>  	disk_partition_t info;
>>>>  	struct blk_desc *desc;
>>>>  	int len, i, ret;
>>>> +	char dev_str[4];
>>>>
>>>> -	ret = blk_get_device_by_str("mmc", STR(CONFIG_SYS_MMC_ENV_DEV),
>>> &desc);
>>>> +	snprintf(dev_str, sizeof(dev_str), "%d", mmc_get_env_dev());
>>>> +	ret = blk_get_device_by_str("mmc", dev_str, &desc);
>>>>  	if (ret < 0)
>>>>  		return (ret);
>>>>
>>>> @@ -114,11 +125,6 @@ __weak int mmc_get_env_addr(struct mmc
>>> *mmc, int copy, u32 *env_addr)
>>>>  	return 0;
>>>>  }
>>>>
>>>> -__weak int mmc_get_env_dev(void)
>>>> -{
>>>> -	return CONFIG_SYS_MMC_ENV_DEV;
>>>> -}
>>>> -
>>>>  #ifdef CONFIG_SYS_MMC_ENV_PART
>>>>  __weak uint mmc_get_env_part(struct mmc *mmc){
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
