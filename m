Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47750243803
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 11:53:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09E05C36B24
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 09:53:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56232C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Aug 2020 09:53:42 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D9fknF018411; Thu, 13 Aug 2020 11:53:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=G/DqFsvH7EShAtlw1SdXSF0N1CR5WiOyFCDJ6ks2T3g=;
 b=mwVZ+37wgGrR3QkTpR1YDf3sX7Tl+L9RFEFfO3R/CD/sHw4CenjkVkU96LPBfEb94bA4
 wVEg+Xhlaq09l+M2pI+46Il0AsVpGquMPDtq6UpyjQ1e8CSk3uqZg7oqPSPHMv1CuLCY
 C8m1rHcRF/sN56/sHggM5Ez1eOZZl3jGGnQmwVmBn9KUqkk94RXp230LXqriqfyI42g5
 ngWbiSWXETFchIiA2iiicaP+FXqJKD5yGR7Rek3UWfkVjUCrO9M+/QDBKKZSON6dX21T
 +mzGuC0wjiX+m8Af4yubr5eBxLPTS9OOJwG0rPUnIIn7b9D0eKGVMeomGNYvYpZ5wtH6 Wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32sm6fn4ua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 11:53:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E2CA710002A;
 Thu, 13 Aug 2020 11:53:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D9E302AB700;
 Thu, 13 Aug 2020 11:53:40 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Aug
 2020 11:53:40 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Aug 2020 11:53:40 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 08/11] board: stm32mp1: use IS_ENABLED to
 prevent ifdef in env functions
Thread-Index: AQHWcULFVW+tnM0Ky06VXWmNhjgKUqk1qzCA
Date: Thu, 13 Aug 2020 09:53:40 +0000
Message-ID: <8b1fc38c-16a8-7cc5-09c3-ebdea5212c16@st.com>
References: <20200731143152.8812-1-patrick.delaunay@st.com>
 <20200731143152.8812-8-patrick.delaunay@st.com>
 <9ab2adce-c86c-ef94-257f-320fce1c9aad@st.com>
In-Reply-To: <9ab2adce-c86c-ef94-257f-320fce1c9aad@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <DA129A2A4BE5494EAC7B8CB81D40EFDA@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_06:2020-08-13,
 2020-08-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 08/11] board: stm32mp1: use IS_ENABLED to
 prevent ifdef in env functions
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


On 8/13/20 9:24 AM, Patrice CHOTARD wrote:
> Hi Patrick
>
> On 7/31/20 4:31 PM, Patrick Delaunay wrote:
>> Use IS_ENABLED to prevent ifdef in env functions:
>> - env_get_location
>> - env_ext4_get_intf
>> - mmc_get_env_dev
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>
>>  board/st/stm32mp1/stm32mp1.c | 36 +++++++++++++++++-------------------
>>  1 file changed, 17 insertions(+), 19 deletions(-)

Applied on u-boot-stm/master

Thanks


>> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
>> index a9705baa24..08d18b6da8 100644
>> --- a/board/st/stm32mp1/stm32mp1.c
>> +++ b/board/st/stm32mp1/stm32mp1.c
>> @@ -785,31 +785,33 @@ enum env_location env_get_location(enum env_operation op, int prio)
>>  		return ENVL_UNKNOWN;
>>  
>>  	switch (bootmode & TAMP_BOOT_DEVICE_MASK) {
>> -#if CONFIG_IS_ENABLED(ENV_IS_IN_MMC)
>>  	case BOOT_FLASH_SD:
>>  	case BOOT_FLASH_EMMC:
>> -		return ENVL_MMC;
>> -#endif
>> -#if CONFIG_IS_ENABLED(ENV_IS_IN_EXT4)
>> -	case BOOT_FLASH_SD:
>> -	case BOOT_FLASH_EMMC:
>> -		return ENVL_EXT4;
>> -#endif
>> -#if CONFIG_IS_ENABLED(ENV_IS_IN_UBI)
>> +		if (CONFIG_IS_ENABLED(ENV_IS_IN_MMC))
>> +			return ENVL_MMC;
>> +		else if (CONFIG_IS_ENABLED(ENV_IS_IN_EXT4))
>> +			return ENVL_EXT4;
>> +		else
>> +			return ENVL_NOWHERE;
>> +
>>  	case BOOT_FLASH_NAND:
>>  	case BOOT_FLASH_SPINAND:
>> -		return ENVL_UBI;
>> -#endif
>> -#if CONFIG_IS_ENABLED(ENV_IS_IN_SPI_FLASH)
>> +		if (CONFIG_IS_ENABLED(ENV_IS_IN_UBI))
>> +			return ENVL_UBI;
>> +		else
>> +			return ENVL_NOWHERE;
>> +
>>  	case BOOT_FLASH_NOR:
>> -		return ENVL_SPI_FLASH;
>> -#endif
>> +		if (CONFIG_IS_ENABLED(ENV_IS_IN_SPI_FLASH))
>> +			return ENVL_SPI_FLASH;
>> +		else
>> +			return ENVL_NOWHERE;
>> +
>>  	default:
>>  		return ENVL_NOWHERE;
>>  	}
>>  }
>>  
>> -#if defined(CONFIG_ENV_IS_IN_EXT4)
>>  const char *env_ext4_get_intf(void)
>>  {
>>  	u32 bootmode = get_bootmode();
>> @@ -830,16 +832,12 @@ const char *env_ext4_get_dev_part(void)
>>  
>>  	return dev_part[(bootmode & TAMP_BOOT_INSTANCE_MASK) - 1];
>>  }
>> -#endif
>> -
>> -#if defined(CONFIG_ENV_IS_IN_MMC)
>>  int mmc_get_env_dev(void)
>>  {
>>  	u32 bootmode = get_bootmode();
>>  
>>  	return (bootmode & TAMP_BOOT_INSTANCE_MASK) - 1;
>>  }
>> -#endif
>>  
>>  #if defined(CONFIG_OF_BOARD_SETUP)
>>  int ft_board_setup(void *blob, struct bd_info *bd)
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
