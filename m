Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB587338D0E
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Mar 2021 13:27:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A50B2C57196;
	Fri, 12 Mar 2021 12:27:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0A66C57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 12:27:44 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12CCNvTe022981; Fri, 12 Mar 2021 13:27:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=2QX2FmAmk2XBxOmlSP1fiyPuN330/PmfWnQ+dBD0bbU=;
 b=wUY/Gyy4icok4G/IokOjnNl2LUXaq4TU8ZWAHKPCI/Oe0vJ9WDZ+rOa3oHZao5glJGO0
 3BL8XDABjUB4lx9lCCeEQ2frqyNj2rpvX1VRaNLySVhGqBiAL1fdEBJx0JKKYW9ER2Ah
 mmwTcPLJSgGw3r3saYakBaJTYR+hLoXViYre3zQEosq4MtD7rHKOY+rgAKjVXVRvphOL
 kshPY6hdjegbpj9MitUpxGGcyQmEWdH27CD4Ld2fP1OSM24ejLKgWUJ0aLyg3PEjyvlE
 dTo/tl+MzM5rRwKFyZk4SrCTHMRkKvIl5ebyy4vu3tHpGWDQbiiRVieZt2yfvY9ZOaAn 1w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 374037d0py-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 13:27:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C34F9100034;
 Fri, 12 Mar 2021 13:27:43 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B98C623DCC2;
 Fri, 12 Mar 2021 13:27:43 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Mar
 2021 13:27:42 +0100
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210225133652.1.I2edaac51f69d6eb9e62ab7aeb01a3f352a364af5@changeid>
 <8044d172-8662-5404-7644-678fe6d7de4a@foss.st.com>
Message-ID: <7de335d9-3536-10d4-f801-0c7cf5760dfe@foss.st.com>
Date: Fri, 12 Mar 2021 13:27:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8044d172-8662-5404-7644-678fe6d7de4a@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-12_03:2021-03-10,
 2021-03-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] stm32mp: stm32prog: Add Kconfig file
 for stm32prog command
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

On 3/9/21 2:07 PM, Patrice CHOTARD wrote:
> Hi Patrick
> 
> On 2/25/21 1:37 PM, Patrick Delaunay wrote:
>> Move CONFIG_CMD_STM32PROG in a specific Kconfig file for stm32prog command.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  arch/arm/mach-stm32mp/Kconfig               | 18 +-----------------
>>  arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig | 18 ++++++++++++++++++
>>  2 files changed, 19 insertions(+), 17 deletions(-)
>>  create mode 100644 arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig
>>
>> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
>> index f538d7cb83..079d66a80c 100644
>> --- a/arch/arm/mach-stm32mp/Kconfig
>> +++ b/arch/arm/mach-stm32mp/Kconfig
>> @@ -121,23 +121,6 @@ config STM32_ETZPC
>>  	help
>>  	  Say y to enable STM32 Extended TrustZone Protection
>>  
>> -config CMD_STM32PROG
>> -	bool "command stm32prog for STM32CudeProgrammer"
>> -	select DFU
>> -	select DFU_RAM
>> -	select DFU_VIRT
>> -	select PARTITION_TYPE_GUID
>> -	imply CMD_GPT if MMC
>> -	imply CMD_MTD if MTD
>> -	imply DFU_MMC if MMC
>> -	imply DFU_MTD if MTD
>> -	help
>> -		activate a specific command stm32prog for STM32MP soc family
>> -		witch update the device with the tools STM32CubeProgrammer,
>> -		using UART with STM32 protocol or USB with DFU protocol
>> -		NB: access to not volatile memory (NOR/NAND/SD/eMMC) is based
>> -		    on U-Boot DFU framework
>> -
>>  config CMD_STM32KEY
>>  	bool "command stm32key to fuse public key hash"
>>  	default y
>> @@ -177,6 +160,7 @@ config DEBUG_UART_CLOCK
>>  	default 64000000
>>  endif
>>  
>> +source "arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig"
>>  source "board/st/stm32mp1/Kconfig"
>>  source "board/dhelectronics/dh_stm32mp1/Kconfig"
>>  
>> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig b/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig
>> new file mode 100644
>> index 0000000000..609a678793
>> --- /dev/null
>> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig
>> @@ -0,0 +1,18 @@
>> +
>> +config CMD_STM32PROG
>> +	bool "command stm32prog for STM32CudeProgrammer"
>> +	select DFU
>> +	select DFU_RAM
>> +	select DFU_VIRT
>> +	select PARTITION_TYPE_GUID
>> +	imply CMD_GPT if MMC
>> +	imply CMD_MTD if MTD
>> +	imply DFU_MMC if MMC
>> +	imply DFU_MTD if MTD
>> +	help
>> +		activate a specific command stm32prog for STM32MP soc family
>> +		witch update the device with the tools STM32CubeProgrammer,
>> +		using UART with STM32 protocol or USB with DFU protocol
>> +		NB: access to not volatile memory (NOR/NAND/SD/eMMC) is based
>> +		    on U-Boot DFU framework
>> +
>>
> 
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
> 
Applied to u-boot-stm/next

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
