Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C78DC7B7C8A
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Oct 2023 11:45:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91C08C6C832;
	Wed,  4 Oct 2023 09:45:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21873C6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Oct 2023 09:45:18 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3945SsZA022722; Wed, 4 Oct 2023 11:45:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:from:to:cc:references
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=5XAxbyKIqejNiIPu276fKthhF0cMCuzOZmMBgUCrYCE=; b=jm
 l86VmVDm8riSfGf9AeUWQRSvl4NgyMUpDJDEzUzFqo+zTvha4mNaPyfiAIYnKhoQ
 sGDwvNPBvaILSeXUpDVsJaHs3uU3TJbKG/3vjAq7Snd5ntbq3iWH/JOQXXAXZrie
 mrR0UR+IewQvx0qZTH/ENyAAQIrepnERAWNvhtlL/E+PgYR95QWAwzEJINO8o9KZ
 A4dcXFC7/pVXaQcqv2goR342M48ICbepb8mZ34EC0iKNvpui+qmRthadDFSGn3U3
 KKTuefgh64POSbIsRUP7Vn93vjsx+2xsbqzG9d+iN0/WQUI8G8pD0OTYDaU2kryf
 8jdXMWEL4ppPtwK+uJlg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tggx34sfq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Oct 2023 11:45:08 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EEE85100053;
 Wed,  4 Oct 2023 11:45:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E714A22D173;
 Wed,  4 Oct 2023 11:45:07 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 11:45:07 +0200
Message-ID: <5a9c693f-cbaf-1545-5022-08e4874ca0ef@foss.st.com>
Date: Wed, 4 Oct 2023 11:45:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20231002155234.138630-1-marex@denx.de>
 <33a6d293-d91d-ee7d-5c3d-b82bbbc27edb@foss.st.com>
In-Reply-To: <33a6d293-d91d-ee7d-5c3d-b82bbbc27edb@foss.st.com>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_01,2023-10-02_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 1/2] ARM: stm32: Rename update_sf to
 dh_update_sd_to_sf on STM32MP15xx DHCOR
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



On 10/4/23 11:35, Patrice CHOTARD wrote:
> 
> 
> On 10/2/23 17:52, Marek Vasut wrote:
>> Align the script name with DH i.MX8MP DHCOM script name. Add
>> backward compatibility script to avoid breaking user scripts.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: u-boot@dh-electronics.com
>> Cc: u-boot@lists.denx.de
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>  include/configs/stm32mp15_dh_dhsom.h | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/configs/stm32mp15_dh_dhsom.h b/include/configs/stm32mp15_dh_dhsom.h
>> index 91921690624..c7ebf5cd180 100644
>> --- a/include/configs/stm32mp15_dh_dhsom.h
>> +++ b/include/configs/stm32mp15_dh_dhsom.h
>> @@ -20,7 +20,7 @@
>>  
>>  #define STM32MP_BOARD_EXTRA_ENV \
>>  	"usb_pgood_delay=1000\0" \
>> -	"update_sf=" /* Erase SPI NOR and install U-Boot from SD */	\
>> +	"dh_update_sd_to_sf=" /* Erase SPI NOR and install U-Boot from SD */ \
>>  		"setexpr loadaddr1 ${loadaddr} + 0x1000000 && "		\
>>  		"load mmc 0:4 ${loadaddr1} /boot/u-boot-spl.stm32 && "	\
>>  		"env set filesize1 ${filesize} && "			\
>> @@ -29,7 +29,9 @@
>>  		"sf update ${loadaddr1} 0 ${filesize1} && "		\
>>  		"sf update ${loadaddr1} 0x40000 ${filesize1} && "	\
>>  		"sf update ${loadaddr} 0x80000 ${filesize} && "		\
>> -		"env set filesize1 && env set loadaddr1\0"
>> +		"env set filesize1 && env set loadaddr1\0"		\
>> +	"update_sf=run dh_update_sd_to_sf\0"
>> +
>>  
>>  #include <configs/stm32mp15_common.h>
>>  
> 
> Hi Marek
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice

Apply on stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
