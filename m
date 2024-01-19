Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D1A832A69
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jan 2024 14:27:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B94F1C6DD74;
	Fri, 19 Jan 2024 13:27:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36E5AC6DD73
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jan 2024 13:27:17 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40JAddFm008279
 for <uboot-stm32@st-md-mailman.stormreply.com>; Fri, 19 Jan 2024 14:27:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=wQHhlEsD8qT7nOh3M/eX0Mp48Xmd8l6ifQ0/zao/XJg=; b=NF
 RC9FX5D4KkW4TOQ1ADvtEHIWufovDU0bu1vpkMer/iyjL0psZ0JBZqi8f8epStEX
 7MsybefTuHgEaUHCKz7nfVvVKG7MFjHgktjUiHhkJW4zqo6WZYyDqs9cuLOaq3d/
 m3cG5A6XBcH8tOQrd5ZbOUrwvbgPimjxPk1dZVhGE84nePm8VMmYIxBSZWF1Jroe
 toA1/0v9pHHVsDrzWfeMcYwn7+GMaqC3mntwGwaRehtPT63a0QJ25/pKJRn/zhiG
 WkQIEvF1N6pndWpD2SSyaDUFViChh3ljM3ZDJusMlmIPUULuSbcwcUHew2i1g1LW
 1hbqyR/KIPlX4iRkBy/g==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vkmdedxam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jan 2024 14:27:16 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A5B0100081
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jan 2024 14:27:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 34BC224B894
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jan 2024 14:27:16 +0100 (CET)
Received: from [10.252.4.250] (10.252.4.250) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Jan
 2024 14:27:15 +0100
Message-ID: <6bbc8388-7c6c-4d06-b646-511aee58ae0f@foss.st.com>
Date: Fri, 19 Jan 2024 14:27:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <uboot-stm32@st-md-mailman.stormreply.com>
References: <20240115140557.57448-1-patrick.delaunay@foss.st.com>
 <20240115150451.v2.10.I7e8d4ae242605f7c9d276a858f336d13681528d9@changeid>
 <dae41bd1-7d12-47c4-99bd-4638c8888b13@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <dae41bd1-7d12-47c4-99bd-4638c8888b13@foss.st.com>
X-Originating-IP: [10.252.4.250]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_08,2024-01-19_02,2023-05-22_02
Subject: Re: [Uboot-stm32] [PATCH v2 10/14] stm32mp: activate the command
 stboard for stm32mp25 boards
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



On 1/15/24 18:42, Patrice CHOTARD wrote:
> 
> 
> On 1/15/24 15:05, Patrick Delaunay wrote:
>> Activate the command stboard for stm32mp25 STMicroelectronics boards,
>> add the default used OTP identifier and the associated board identifier:
>> - stm32mp25xx-ev1 = MB1936
>> - stm32mp25xx-dk = MB1605
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>> Changes in v2:
>> - fix CONFIG name with 'x': TARGET_ST_STM32MP15x TARGET_ST_STM32MP13x
>>
>>  arch/arm/mach-stm32mp/include/mach/stm32.h | 1 +
>>  board/st/common/Kconfig                    | 2 +-
>>  board/st/common/cmd_stboard.c              | 2 ++
>>  3 files changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
>> index 45c929aa605d..726c390977e3 100644
>> --- a/arch/arm/mach-stm32mp/include/mach/stm32.h
>> +++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
>> @@ -198,6 +198,7 @@ enum forced_boot_mode {
>>  #define BSEC_OTP_SERIAL	5
>>  #define BSEC_OTP_RPN	9
>>  #define BSEC_OTP_PKG	122
>> +#define BSEC_OTP_BOARD	246
>>  #define BSEC_OTP_MAC	247
>>  #endif
>>  
>> diff --git a/board/st/common/Kconfig b/board/st/common/Kconfig
>> index c1c254d07354..f40d1a78ca36 100644
>> --- a/board/st/common/Kconfig
>> +++ b/board/st/common/Kconfig
>> @@ -1,7 +1,7 @@
>>  config CMD_STBOARD
>>  	bool "stboard - command for OTP board information"
>>  	depends on ARCH_STM32MP
>> -	default y if TARGET_ST_STM32MP15x || TARGET_ST_STM32MP13x
>> +	default y if TARGET_ST_STM32MP25X || TARGET_ST_STM32MP15x || TARGET_ST_STM32MP13x
>>  	help
>>  	  This compile the stboard command to
>>  	  read and write the board in the OTP.
>> diff --git a/board/st/common/cmd_stboard.c b/board/st/common/cmd_stboard.c
>> index 853ab78bbf16..cb103e69b369 100644
>> --- a/board/st/common/cmd_stboard.c
>> +++ b/board/st/common/cmd_stboard.c
>> @@ -49,7 +49,9 @@ static bool check_stboard(u16 board)
>>  		0x1298,
>>  		0x1341,
>>  		0x1497,
>> +		0x1605, /* stm32mp25xx-dk */
>>  		0x1635,
>> +		0x1936, /* stm32mp25xx-ev1 */
>>  	};
>>  
>>  	for (i = 0; i < ARRAY_SIZE(st_board_id); i++)
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
